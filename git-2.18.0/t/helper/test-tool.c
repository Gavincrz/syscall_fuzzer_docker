#include "git-compat-util.h"
#include "test-tool.h"

struct test_cmd {
	const char *name;
	int (*fn)(int argc, const char **argv);
};

static struct test_cmd cmds[] = {
	{ "chmtime", cmd__chmtime },
	{ "config", cmd__config },
	{ "ctype", cmd__ctype },
	{ "date", cmd__date },
	{ "delta", cmd__delta },
	{ "drop-caches", cmd__drop_caches },
	{ "dump-cache-tree", cmd__dump_cache_tree },
	{ "dump-split-index", cmd__dump_split_index },
	{ "example-decorate", cmd__example_decorate },
	{ "genrandom", cmd__genrandom },
	{ "hashmap", cmd__hashmap },
	{ "index-version", cmd__index_version },
	{ "lazy-init-name-hash", cmd__lazy_init_name_hash },
	{ "match-trees", cmd__match_trees },
	{ "mergesort", cmd__mergesort },
	{ "mktemp", cmd__mktemp },
	{ "online-cpus", cmd__online_cpus },
	{ "path-utils", cmd__path_utils },
	{ "prio-queue", cmd__prio_queue },
	{ "read-cache", cmd__read_cache },
	{ "ref-store", cmd__ref_store },
	{ "regex", cmd__regex },
	{ "revision-walking", cmd__revision_walking },
	{ "run-command", cmd__run_command },
	{ "scrap-cache-tree", cmd__scrap_cache_tree },
	{ "sha1-array", cmd__sha1_array },
	{ "sha1", cmd__sha1 },
	{ "sigchain", cmd__sigchain },
	{ "strcmp-offset", cmd__strcmp_offset },
	{ "string-list", cmd__string_list },
	{ "submodule-config", cmd__submodule_config },
	{ "subprocess", cmd__subprocess },
	{ "urlmatch-normalization", cmd__urlmatch_normalization },
	{ "wildmatch", cmd__wildmatch },
	{ "write-cache", cmd__write_cache },
};

int cmd_main(int argc, const char **argv)
{
	int i;

	BUG_exit_code = 99;
	if (argc < 2)
		die("I need a test name!");

	for (i = 0; i < ARRAY_SIZE(cmds); i++) {
		if (!strcmp(cmds[i].name, argv[1])) {
			argv++;
			argc--;
			return cmds[i].fn(argc, argv);
		}
	}
	die("There is no test named '%s'", argv[1]);
}
