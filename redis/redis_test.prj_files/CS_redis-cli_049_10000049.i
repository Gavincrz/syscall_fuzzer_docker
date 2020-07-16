# 1 "redis-cli.c"
# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/gcc_builtins.h"

 


extern void *__csonar_gcc_atomic_mutex;



void csonar_mutex_acquire( void *mutex );
void csonar_mutex_release( void *mutex );
# 21 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/gcc_builtins.h"
#define __CSONAR_GCC_ATOMIC_WRAP( exp )                       ({ typeof(exp) __csonar_gcc_atomic_val;                      csonar_mutex_acquire( __csonar_gcc_atomic_mutex );        __csonar_gcc_atomic_val = (exp);                          csonar_mutex_release( __csonar_gcc_atomic_mutex );        (void)__csonar_gcc_atomic_val;                            __csonar_gcc_atomic_val; })
# 32 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/gcc_builtins.h"
#define __CSONAR_GCC_ATOMIC_WRAP_VOID( exp )                  ((void)__CSONAR_GCC_ATOMIC_WRAP( exp ))




 
#define __csonar_sync_fetch_and_add(ptr, val, ...)     ({ typeof(ptr) __csonar_ptr = (ptr); typeof(*__csonar_ptr) __csonar_old = *__csonar_ptr; *__csonar_ptr += (val); __csonar_old; })

#define __sync_fetch_and_add(ptr, val, ...) __CSONAR_GCC_ATOMIC_WRAP( __csonar_sync_fetch_and_add(ptr, val) )

#define __csonar_sync_fetch_and_sub(ptr, val, ...)     ({ typeof(ptr) __csonar_ptr = (ptr); typeof(*__csonar_ptr) __csonar_old = *__csonar_ptr; *__csonar_ptr -= (val); __csonar_old; })

#define __sync_fetch_and_sub(ptr, val, ...) __CSONAR_GCC_ATOMIC_WRAP( __csonar_sync_fetch_and_sub(ptr, val) )

#define CS__sync_fetch_and_BITOP( operator, ptr, val )              __CSONAR_GCC_ATOMIC_WRAP(                                       ({ typeof(ptr) __csonar_ptr = (ptr);                               typeof(*__csonar_ptr) __csonar_old = *__csonar_ptr;             if( sizeof( *__csonar_ptr ) == sizeof(char) )                     (*(char*)__csonar_ptr) operator (char)(val);                  else if( sizeof( *__csonar_ptr ) == sizeof(short) )                (*(short*)__csonar_ptr) operator (short)(val);               else if( sizeof( *__csonar_ptr ) == sizeof(int) )                 (*(int*)__csonar_ptr) operator (int)(val);                    else if( sizeof( *__csonar_ptr ) == sizeof(long) )                (*(long*)__csonar_ptr) operator (long)(val);                  else                                                              (*(long long*)__csonar_ptr) operator (long long)(val);        __csonar_old; })                                                 )
# 62 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/gcc_builtins.h"

#define __sync_fetch_and_or(ptr, val, ...)          CS__sync_fetch_and_BITOP( |=, ptr, val )


#define __sync_fetch_and_and(ptr, val, ...)         CS__sync_fetch_and_BITOP( &=, ptr, val )


#define __sync_fetch_and_xor(ptr, val, ...)         CS__sync_fetch_and_BITOP( ^=, ptr, val )


#define __sync_fetch_and_nand(ptr, val, ...)                                __CSONAR_GCC_ATOMIC_WRAP(                                               ({ typeof(ptr) __csonar_ptr = (ptr);                                       typeof(*__csonar_ptr) __csonar_old = *__csonar_ptr;                     if( sizeof( *__csonar_ptr ) == sizeof(char) )                               (*(char*)__csonar_ptr) = ~( *(char*)__csonar_ptr & (char)(val) );        else if( sizeof( *__csonar_ptr ) == sizeof(short) )                         (*(short*)__csonar_ptr) = ~( *(short*)__csonar_ptr & (short)(val) );        else if( sizeof( *__csonar_ptr ) == sizeof(int) )                           (*(int*)__csonar_ptr) = ~( *(int*)__csonar_ptr & (int)(val) );        else if( sizeof( *__csonar_ptr ) == sizeof(long) )                          (*(long*)__csonar_ptr) = ~( *(long*)__csonar_ptr & (long)(val) );        else                                                                        (*(long long*)__csonar_ptr) = ~( *(long long*)__csonar_ptr & (long long)(val) );        __csonar_old; })                                                         )
# 88 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/gcc_builtins.h"

#define __csonar_sync_add_and_fetch(ptr, val, ...)     ({ typeof(ptr) __csonar_ptr = (ptr); *__csonar_ptr += (val); *__csonar_ptr; })

#define __sync_add_and_fetch(ptr, val, ...) __CSONAR_GCC_ATOMIC_WRAP( __csonar_sync_add_and_fetch(ptr, val) )

#define __csonar_sync_sub_and_fetch(ptr, val, ...)     ({ typeof(ptr) __csonar_ptr = (ptr); *__csonar_ptr -= (val); *__csonar_ptr; })

#define __sync_sub_and_fetch(ptr, val, ...) __CSONAR_GCC_ATOMIC_WRAP( __csonar_sync_sub_and_fetch(ptr, val) )

#define CS__sync_BITOP_and_fetch( operator, ptr, val )              __CSONAR_GCC_ATOMIC_WRAP(                                       ({ typeof(ptr) __csonar_ptr = (ptr);        if( sizeof( *__csonar_ptr ) == sizeof(char) )                     (*(char*)__csonar_ptr) operator (char)(val);                  else if( sizeof( *__csonar_ptr ) == sizeof(short) )                (*(short*)__csonar_ptr) operator (short)(val);               else if( sizeof( *__csonar_ptr ) == sizeof(int) )                 (*(int*)__csonar_ptr) operator (int)(val);                    else if( sizeof( *__csonar_ptr ) == sizeof(long) )                (*(long*)__csonar_ptr) operator (long)(val);                  else                                                              (*(long long*)__csonar_ptr) operator (long long)(val);        *__csonar_ptr; })                                                )
# 112 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/gcc_builtins.h"

#define __sync_or_and_fetch(ptr, val, ...)     CS__sync_BITOP_and_fetch( |=, ptr, val )


#define __sync_and_and_fetch(ptr, val, ...)     CS__sync_BITOP_and_fetch( &=, ptr, val )


#define __sync_xor_and_fetch(ptr, val, ...)     CS__sync_BITOP_and_fetch( ^=, ptr, val )


#define __sync_nand_and_fetch(ptr, val, ...)                                __CSONAR_GCC_ATOMIC_WRAP(                                               ({ typeof(ptr) __csonar_ptr = (ptr);                                       if( sizeof( *__csonar_ptr ) == sizeof(char) )                               (*(char*)__csonar_ptr) = ~( *(char*)__csonar_ptr & (char)(val) );        else if( sizeof( *__csonar_ptr ) == sizeof(short) )                         (*(short*)__csonar_ptr) = ~( *(short*)__csonar_ptr & (short)(val) );        else if( sizeof( *__csonar_ptr ) == sizeof(int) )                           (*(int*)__csonar_ptr) = ~( *(int*)__csonar_ptr & (int)(val) );        else if( sizeof( *__csonar_ptr ) == sizeof(long) )                          (*(long*)__csonar_ptr) = ~( *(long*)__csonar_ptr & (long)(val) );        else                                                                        (*(long long*)__csonar_ptr) = ~( *(long long*)__csonar_ptr & (long long)(val) );        *__csonar_ptr; })                                                        )
# 137 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/gcc_builtins.h"

#define __csonar_sync_bool_compare_and_swap(ptr, oldval, newval, ...)     ({ typeof(ptr) __csonar_ptr = (ptr); (*__csonar_ptr == oldval) ? ( *__csonar_ptr = (newval), 1 ) : 0; })

#define __sync_bool_compare_and_swap(ptr, oldval, newval, ...) __CSONAR_GCC_ATOMIC_WRAP( __csonar_sync_bool_compare_and_swap(ptr, oldval, newval) )

#define __csonar_sync_val_compare_and_swap(ptr, oldval, newval, ...)     ({ typeof(ptr) __csonar_ptr = (ptr); typeof(*__csonar_ptr) __csonar_old = *__csonar_ptr; (*__csonar_ptr == (oldval)) ? ( *__csonar_ptr = (newval), __csonar_old ) : __csonar_old; })

#define __sync_val_compare_and_swap(ptr, oldval, newval, ...) __CSONAR_GCC_ATOMIC_WRAP( __csonar_sync_val_compare_and_swap(ptr, oldval, newval) )

#define __csonar_sync_lock_test_and_set(ptr, newval, ...)     ({ typeof(ptr) __csonar_ptr = (ptr); typeof(*__csonar_ptr) __csonar_old = *__csonar_ptr; *__csonar_ptr = (newval); __csonar_old; })

#define __sync_lock_test_and_set(ptr, newval, ...) __CSONAR_GCC_ATOMIC_WRAP( __csonar_sync_lock_test_and_set(ptr, newval) )





 


#define __atomic_load_n(ptr, memmodel) (__CSONAR_GCC_ATOMIC_WRAP(*(ptr)))

#define __atomic_load(ptr, ret, memmodel) (__CSONAR_GCC_ATOMIC_WRAP(*(ret) = *(ptr)))

#define __atomic_store_n(ptr, val, memmodel) (__CSONAR_GCC_ATOMIC_WRAP_VOID(*(ptr) = (val)))

#define __atomic_store(ptr, val, memmodel) (__CSONAR_GCC_ATOMIC_WRAP_VOID(*(ptr) = *(val)))

#define __atomic_exchange_n(ptr, val, memmodel)     (__CSONAR_GCC_ATOMIC_WRAP(     ({ typeof(ptr) __csonar_ptr = (ptr); typeof(*ptr) __csonar_old = *__csonar_ptr; *__csonar_ptr = (val); __csonar_old; })     ))




#define __atomic_exchange(ptr, val, ret, memmodel)     (__CSONAR_GCC_ATOMIC_WRAP(     ({ typeof(ptr) __csonar_ptr = (ptr); *(ret) = *__csonar_ptr; *__csonar_ptr = *(val); 0; })     ))




#define __atomic_compare_exchange_n(ptr, expected, desired, weak, success_memmodel, failure_memmodel) (__CSONAR_GCC_ATOMIC_WRAP(                                              ({                                                                          typeof(ptr) __csonar_ptr = (ptr);                                       typeof(expected) __csonar_expected = (expected);                        int __csonar_rv;                                                        if( *__csonar_ptr == *__csonar_expected ) {                                 *__csonar_ptr = (desired);                                              __csonar_rv = 1;                                                    } else {                                                                    *__csonar_expected = *__csonar_ptr;                                     __csonar_rv = 0;                                                    }                                                                       __csonar_rv;                                                        })                                                                      ))
# 191 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/gcc_builtins.h"

#define __atomic_compare_exchange(ptr, expected, desired, weak, success_memmodel, failure_memmodel) (__CSONAR_GCC_ATOMIC_WRAP(                                              ({                                                                          typeof(ptr) __csonar_ptr = (ptr);                                       typeof(expected) __csonar_expected = (expected);                        int __csonar_rv;                                                        if( *__csonar_ptr == *__csonar_expected ) {                                 *__csonar_ptr = *(desired);                                             __csonar_rv = 1;                                                    } else {                                                                    *__csonar_expected = *__csonar_ptr;                                     __csonar_rv = 0;                                                    }                                                                       __csonar_rv;                                                        })                                                                      ))
# 208 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/gcc_builtins.h"

#define __atomic_add_fetch( ptr, val, memmodel )     (__CSONAR_GCC_ATOMIC_WRAP( ({ typeof(ptr) __csonar_ptr = (ptr); *__csonar_ptr += (val); *__csonar_ptr; }) ))


#define __atomic_sub_fetch( ptr, val, memmodel )     (__CSONAR_GCC_ATOMIC_WRAP( ({ typeof(ptr) __csonar_ptr = (ptr); *__csonar_ptr -= (val); *__csonar_ptr; }) ))


#define __atomic_and_fetch( ptr, val, memmodel )     (__CSONAR_GCC_ATOMIC_WRAP( ({ typeof(ptr) __csonar_ptr = (ptr); *__csonar_ptr &= (val); *__csonar_ptr; }) ))


#define __atomic_xor_fetch( ptr, val, memmodel )     (__CSONAR_GCC_ATOMIC_WRAP( ({ typeof(ptr) __csonar_ptr = (ptr); *__csonar_ptr ^= (val); *__csonar_ptr; }) ))


#define __atomic_or_fetch( ptr, val, memmodel )     (__CSONAR_GCC_ATOMIC_WRAP( ({ typeof(ptr) __csonar_ptr = (ptr); *__csonar_ptr |= (val); *__csonar_ptr; }) ))


#define __atomic_nand_fetch( ptr, val, memmodel )     (__CSONAR_GCC_ATOMIC_WRAP( ({ typeof(ptr) __csonar_ptr = (ptr); *__csonar_ptr = ~(*__csonar_ptr & (val) ); *__csonar_ptr; }) ))

  
#define __atomic_fetch_add( ptr, val, memmodel )     (__CSONAR_GCC_ATOMIC_WRAP( ({ typeof(ptr) __csonar_ptr = (ptr); typeof(*__csonar_ptr) __csonar_old = *__csonar_ptr; *__csonar_ptr += (val); __csonar_old; }) ))


#define __atomic_fetch_sub( ptr, val, memmodel )     (__CSONAR_GCC_ATOMIC_WRAP( ({ typeof(ptr) __csonar_ptr = (ptr); typeof(*__csonar_ptr) __csonar_old = *__csonar_ptr; *__csonar_ptr -= (val); __csonar_old; }) ))


#define __atomic_fetch_and( ptr, val, memmodel )     (__CSONAR_GCC_ATOMIC_WRAP( ({ typeof(ptr) __csonar_ptr = (ptr); typeof(*__csonar_ptr) __csonar_old = *__csonar_ptr; *__csonar_ptr &= (val); __csonar_old; }) ))


#define __atomic_fetch_xor( ptr, val, memmodel )     (__CSONAR_GCC_ATOMIC_WRAP( ({ typeof(ptr) __csonar_ptr = (ptr); typeof(*__csonar_ptr) __csonar_old = *__csonar_ptr; *__csonar_ptr ^= (val); __csonar_old; }) ))


#define __atomic_fetch_or( ptr, val, memmodel )     (__CSONAR_GCC_ATOMIC_WRAP( ({ typeof(ptr) __csonar_ptr = (ptr); typeof(*__csonar_ptr) __csonar_old = *__csonar_ptr; *__csonar_ptr |= (val); __csonar_old; }) ))


#define __atomic_fetch_nand( ptr, val, memmodel )     (__CSONAR_GCC_ATOMIC_WRAP( ({ typeof(ptr) __csonar_ptr = (ptr); typeof(*__csonar_ptr) __csonar_old = *__csonar_ptr; *__csonar_ptr = ~( *__csonar_ptr & (val) ); __csonar_old; }) ))


#define __atomic_test_and_set( ptr, memmodel )     (__CSONAR_GCC_ATOMIC_WRAP( ({ volatile char * __csonar_ptr = (volatile char*)(ptr); char __csonar_old = *__csonar_ptr; *__csonar_ptr = 1; __csonar_old ? 1 : 0; }) ))


#define __atomic_clear(ptr, memmodel) ((__CSONAR_GCC_ATOMIC_WRAP(*ptr = 0, (void)0)))

void __atomic_thread_fence (int memmodel);
void __atomic_thread_fence (int memmodel);

#define __atomic_always_lock_free(size, ptr) (1)

#define __atomic_is_lock_free(size, ptr) (1)



# 333 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/gcc_builtins.h"

 


#define __builtin_ia32_movnti64(dst, src) (__CSONAR_GCC_ATOMIC_WRAP(*(dst) = (src)))

# 1 "redis-cli.c"




























 

# 1 "fmacros.h"



























 


#define _REDIS_FMACRO_H

#define _BSD_SOURCE


#define _GNU_SOURCE
#define _DEFAULT_SOURCE







#define _XOPEN_SOURCE 700



 








#define _LARGEFILE_SOURCE
#define _FILE_OFFSET_BITS 64

# 32 "redis-cli.c"
# 1 "version.h"
#define REDIS_VERSION "999.999.999"
# 33 "redis-cli.c"

# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stdio.h"










 

 
# 1 "/usr/include/stdio.h"
















 



 


#define _STDIO_H	1

#define __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h"
















 







 





#undef __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION

# 1 "/usr/include/features.h"















 


#define	_FEATURES_H	1































































































 


 
#undef	__USE_ISOC11
#undef	__USE_ISOC99
#undef	__USE_ISOC95
#undef	__USE_ISOCXX11
#undef	__USE_POSIX
#undef	__USE_POSIX2
#undef	__USE_POSIX199309
#undef	__USE_POSIX199506
#undef	__USE_XOPEN
#undef	__USE_XOPEN_EXTENDED
#undef	__USE_UNIX98
#undef	__USE_XOPEN2K
#undef	__USE_XOPEN2KXSI
#undef	__USE_XOPEN2K8
#undef	__USE_XOPEN2K8XSI
#undef	__USE_LARGEFILE
#undef	__USE_LARGEFILE64
#undef	__USE_FILE_OFFSET64
#undef	__USE_MISC
#undef	__USE_ATFILE
#undef	__USE_GNU
#undef	__USE_FORTIFY_LEVEL
#undef	__KERNEL_STRICT_NAMES
#undef	__GLIBC_USE_DEPRECATED_GETS


 

# define __KERNEL_STRICT_NAMES








 

# define __GNUC_PREREQ(maj, min) 	((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))








 




# define __glibc_clang_prereq(maj, min) 0


 
#define __GLIBC_USE(F)	__GLIBC_USE_ ## F




 
# 188 "/usr/include/features.h"

 

# undef  _ISOC95_SOURCE
# define _ISOC95_SOURCE	1
# undef  _ISOC99_SOURCE
# define _ISOC99_SOURCE	1
# undef  _ISOC11_SOURCE
# define _ISOC11_SOURCE	1
# undef  _POSIX_SOURCE
# define _POSIX_SOURCE	1
# undef  _POSIX_C_SOURCE
# define _POSIX_C_SOURCE	200809L
# undef  _XOPEN_SOURCE
# define _XOPEN_SOURCE	700
# undef  _XOPEN_SOURCE_EXTENDED
# define _XOPEN_SOURCE_EXTENDED	1
# undef	 _LARGEFILE64_SOURCE
# define _LARGEFILE64_SOURCE	1
# undef  _DEFAULT_SOURCE
# define _DEFAULT_SOURCE	1
# undef  _ATFILE_SOURCE
# define _ATFILE_SOURCE	1



 





# undef  _DEFAULT_SOURCE
# define _DEFAULT_SOURCE	1


 


# define __USE_ISOC11	1


 


# define __USE_ISOC99	1


 


# define __USE_ISOC95	1


# 254 "/usr/include/features.h"



 




# undef  _POSIX_SOURCE
# define _POSIX_SOURCE	1
# undef  _POSIX_C_SOURCE
# define _POSIX_C_SOURCE	200809L


# 283 "/usr/include/features.h"






 
# 296 "/usr/include/features.h"




# define __USE_POSIX	1



# define __USE_POSIX2	1



# define __USE_POSIX199309	1



# define __USE_POSIX199506	1



# define __USE_XOPEN2K		1
# undef __USE_ISOC95
# define __USE_ISOC95		1
# undef __USE_ISOC99
# define __USE_ISOC99		1



# define __USE_XOPEN2K8		1
# undef  _ATFILE_SOURCE
# define _ATFILE_SOURCE	1



# define __USE_XOPEN	1

#  define __USE_XOPEN_EXTENDED	1
#  define __USE_UNIX98	1
#  undef _LARGEFILE_SOURCE
#  define _LARGEFILE_SOURCE	1


#    define __USE_XOPEN2K8	1
#    define __USE_XOPEN2K8XSI	1

#   define __USE_XOPEN2K	1
#   define __USE_XOPEN2KXSI	1
#   undef __USE_ISOC95
#   define __USE_ISOC95		1
#   undef __USE_ISOC99
#   define __USE_ISOC99		1
# 354 "/usr/include/features.h"


# define __USE_LARGEFILE	1



# define __USE_LARGEFILE64	1



# define __USE_FILE_OFFSET64	1



# define __USE_MISC	1



# define __USE_ATFILE	1



# define __USE_GNU	1





#  define __USE_FORTIFY_LEVEL 2
# 389 "/usr/include/features.h"




 

# define __GLIBC_USE_DEPRECATED_GETS 0





 
# 1 "/usr/include/stdc-predef.h"















 

# 403 "/usr/include/features.h"






 
#undef  __GNU_LIBRARY__
#define __GNU_LIBRARY__ 6


 
#define	__GLIBC__	2
#define	__GLIBC_MINOR__	27

#define __GLIBC_PREREQ(maj, min) 	((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))


 
# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/sys/cdefs.h"





 
# 1 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"















 


#define	_SYS_CDEFS_H	1

 






 




 
#undef	__P
#undef	__PMT




 

#  define __LEAF , __leaf__
#  define __LEAF_ATTR __attribute__ ((__leaf__))









 

#  define __THROW	__attribute__ ((__nothrow__ __LEAF))
#  define __THROWNL	__attribute__ ((__nothrow__))
#  define __NTH(fct)	__attribute__ ((__nothrow__ __LEAF)) fct
#  define __NTHNL(fct)  __attribute__ ((__nothrow__)) fct
# 72 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"

# 82 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"



 



# define __glibc_clang_has_extension(ext) 0



 
#define __P(args)	args
#define __PMT(args)	args


 

#define __CONCAT(x,y)	x ## y
#define __STRING(x)	#x

 
#define __ptr_t void *


 




# define __BEGIN_DECLS
# define __END_DECLS



 
#define __bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)
#define __bos0(ptr) __builtin_object_size (ptr, 0)


# define __warndecl(name, msg)   extern void name (void) __attribute__((__warning__ (msg)))

# define __warnattr(msg) __attribute__((__warning__ (msg)))
# define __errordecl(name, msg)   extern void name (void) __attribute__((__error__ (msg)))
# 132 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"




 

# define __flexarr	[]
# define __glibc_c99_flexarr_available 1
# 155 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"










 



# define __REDIRECT(name, proto, alias) name proto __asm__ (__ASMNAME (#alias))
# 176 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"
#  define __REDIRECT_NTH(name, proto, alias)      name proto __asm__ (__ASMNAME (#alias)) __THROW

#  define __REDIRECT_NTHNL(name, proto, alias)      name proto __asm__ (__ASMNAME (#alias)) __THROWNL


# define __ASMNAME(cname)  __ASMNAME2 (__USER_LABEL_PREFIX__, cname)
# define __ASMNAME2(prefix, cname) __STRING (prefix) cname






 




 






 

# define __attribute_malloc__ __attribute__ ((__malloc__))





 

# define __attribute_alloc_size__(params)   __attribute__ ((__alloc_size__ params))







 

# define __attribute_pure__ __attribute__ ((__pure__))




 

# define __attribute_const__ __attribute__ ((__const__))






 

# define __attribute_used__ __attribute__ ((__used__))
# define __attribute_noinline__ __attribute__ ((__noinline__))





 

# define __attribute_deprecated__ __attribute__ ((__deprecated__))






 


# define __attribute_deprecated_msg__(msg) 	 __attribute__ ((__deprecated__ (msg)))










 

# define __attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))







 

# define __attribute_format_strfmon__(a,b)   __attribute__ ((__format__ (__strfmon__, a, b)))






 

# define __nonnull(params) __attribute__ ((__nonnull__ params))





 

# define __attribute_warn_unused_result__    __attribute__ ((__warn_unused_result__))


#  define __wur __attribute_warn_unused_result__
# 307 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"

 



 
# undef __always_inline
# define __always_inline __inline __attribute__ ((__always_inline__))






 

# define __attribute_artificial__ __attribute__ ((__artificial__))












 




#  define __extern_inline extern __inline __attribute__ ((__gnu_inline__))
#  define __extern_always_inline   extern __always_inline __attribute__ ((__gnu_inline__))
# 349 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"


# define __fortify_function __extern_always_inline __attribute_artificial__



 

# define __va_arg_pack() __builtin_va_arg_pack ()
# define __va_arg_pack_len() __builtin_va_arg_pack_len ()





 




 






 

# define __restrict_arr	__restrict
# 391 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"


# define __glibc_unlikely(cond)	__builtin_expect ((cond), 0)
# define __glibc_likely(cond)	__builtin_expect ((cond), 1)





# 409 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"

# 416 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"
# define __attribute_nonstring__


# 426 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"

# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
 


# define __WORDSIZE	64







# define __WORDSIZE_TIME64_COMPAT32	1
 
# define __SYSCALL_WORDSIZE		64
# 428 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"
# 1 "/usr/include/x86_64-linux-gnu/bits/long-double.h"
















 


 
# 429 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"

# 450 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"
# define __LDBL_REDIR1(name, proto, alias) name proto
# define __LDBL_REDIR(name, proto) name proto
# define __LDBL_REDIR1_NTH(name, proto, alias) name proto __THROW
# define __LDBL_REDIR_NTH(name, proto) name proto __THROW
# define __LDBL_REDIR_DECL(name)

#  define __REDIRECT_LDBL(name, proto, alias) __REDIRECT (name, proto, alias)
#  define __REDIRECT_NTH_LDBL(name, proto, alias)   __REDIRECT_NTH (name, proto, alias)








 

# define __glibc_macro_warning1(message) _Pragma (#message)
# define __glibc_macro_warning(message)   __glibc_macro_warning1 (GCC warning message)











 





# define __HAVE_GENERIC_SELECTION 1




# 8 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/sys/cdefs.h"

 
# 46 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/sys/cdefs.h"

 
# 425 "/usr/include/features.h"



 







 



# define __USE_EXTERN_INLINES	1






 
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs.h"


 


# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h"



 





#define __stub___compat_bdflush
#define __stub_chflags
#define __stub_fattach
#define __stub_fchflags
#define __stub_fdetach
#define __stub_getmsg
#define __stub_gtty
#define __stub_lchmod
#define __stub_putmsg
#define __stub_revoke
#define __stub_setlogin
#define __stub_sigreturn
#define __stub_sstk
#define __stub_stty
# 11 "/usr/include/x86_64-linux-gnu/gnu/stubs.h"
# 449 "/usr/include/features.h"


# 34 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h"


 
#undef __GLIBC_USE_LIB_EXT2


# define __GLIBC_USE_LIB_EXT2 1





 
#undef __GLIBC_USE_IEC_60559_BFP_EXT

# define __GLIBC_USE_IEC_60559_BFP_EXT 1





 
#undef __GLIBC_USE_IEC_60559_FUNCS_EXT

# define __GLIBC_USE_IEC_60559_FUNCS_EXT 1





 
#undef __GLIBC_USE_IEC_60559_TYPES_EXT

# define __GLIBC_USE_IEC_60559_TYPES_EXT 1
# 28 "/usr/include/stdio.h"



#define __need_size_t
#define __need_NULL
# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"










 





# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





















 



 








 
# 44 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 


 



 







 
# 91 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 









 
# 116 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





 

 


 
# 164 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

 


 
# 187 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#define __size_t__	 
#define __SIZE_T__	 
#define _SIZE_T
#define _SYS_SIZE_T_H
#define _T_SIZE_
#define _T_SIZE
#define __SIZE_T
#define _SIZE_T_
#define _BSD_SIZE_T_
#define _SIZE_T_DEFINED_
#define _SIZE_T_DEFINED
#define _BSD_SIZE_T_DEFINED_	 
#define _SIZE_T_DECLARED	 
#define ___int_size_t_h
#define _GCC_SIZE_T
#define _SIZET_
# 210 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#define __size_t





typedef long unsigned int size_t;
# 238 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#undef	__need_size_t






 


 
# 349 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

# 361 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 
 
 
# 395 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 


#undef NULL		 




#define NULL ((void *)0)





#undef	__need_NULL

# 449 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

# 19 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"
# 34 "/usr/include/stdio.h"

# 1 "/usr/include/x86_64-linux-gnu/bits/types.h"
















 



 


#define	_BITS_TYPES_H	1

# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
 


# define __WORDSIZE	64







# define __WORDSIZE_TIME64_COMPAT32	1
 
# define __SYSCALL_WORDSIZE		64
# 28 "/usr/include/x86_64-linux-gnu/bits/types.h"

 
typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;

 
typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;





 

typedef long int __quad_t;
typedef unsigned long int __u_quad_t;





 

typedef long int __intmax_t;
typedef unsigned long int __uintmax_t;

































 

#define	__S16_TYPE		short int
#define __U16_TYPE		unsigned short int
#define	__S32_TYPE		int
#define __U32_TYPE		unsigned int
#define __SLONGWORD_TYPE	long int
#define __ULONGWORD_TYPE	unsigned long int
# 117 "/usr/include/x86_64-linux-gnu/bits/types.h"
# define __SQUAD_TYPE		long int
# define __UQUAD_TYPE		unsigned long int
# define __SWORD_TYPE		long int
# define __UWORD_TYPE		unsigned long int
# define __SLONG32_TYPE		int
# define __ULONG32_TYPE		unsigned int
# define __S64_TYPE		long int
# define __U64_TYPE		unsigned long int
 
# define __STD_TYPE		typedef
# 1 "/usr/include/x86_64-linux-gnu/bits/typesizes.h"
















 






#define	_BITS_TYPESIZES_H	1


 

 




# define __SYSCALL_SLONG_TYPE	__SLONGWORD_TYPE
# define __SYSCALL_ULONG_TYPE	__ULONGWORD_TYPE


#define __DEV_T_TYPE		__UQUAD_TYPE
#define __UID_T_TYPE		__U32_TYPE
#define __GID_T_TYPE		__U32_TYPE
#define __INO_T_TYPE		__SYSCALL_ULONG_TYPE
#define __INO64_T_TYPE		__UQUAD_TYPE
#define __MODE_T_TYPE		__U32_TYPE

# define __NLINK_T_TYPE		__SYSCALL_ULONG_TYPE
# define __FSWORD_T_TYPE	__SYSCALL_SLONG_TYPE




#define __OFF_T_TYPE		__SYSCALL_SLONG_TYPE
#define __OFF64_T_TYPE		__SQUAD_TYPE
#define __PID_T_TYPE		__S32_TYPE
#define __RLIM_T_TYPE		__SYSCALL_ULONG_TYPE
#define __RLIM64_T_TYPE		__UQUAD_TYPE
#define __BLKCNT_T_TYPE		__SYSCALL_SLONG_TYPE
#define __BLKCNT64_T_TYPE	__SQUAD_TYPE
#define __FSBLKCNT_T_TYPE	__SYSCALL_ULONG_TYPE
#define __FSBLKCNT64_T_TYPE	__UQUAD_TYPE
#define __FSFILCNT_T_TYPE	__SYSCALL_ULONG_TYPE
#define __FSFILCNT64_T_TYPE	__UQUAD_TYPE
#define __ID_T_TYPE		__U32_TYPE
#define __CLOCK_T_TYPE		__SYSCALL_SLONG_TYPE
#define __TIME_T_TYPE		__SYSCALL_SLONG_TYPE
#define __USECONDS_T_TYPE	__U32_TYPE
#define __SUSECONDS_T_TYPE	__SYSCALL_SLONG_TYPE
#define __DADDR_T_TYPE		__S32_TYPE
#define __KEY_T_TYPE		__S32_TYPE
#define __CLOCKID_T_TYPE	__S32_TYPE
#define __TIMER_T_TYPE		void *
#define __BLKSIZE_T_TYPE	__SYSCALL_SLONG_TYPE
#define __FSID_T_TYPE		struct { int __val[2]; }
#define __SSIZE_T_TYPE		__SWORD_TYPE
#define __CPU_MASK_TYPE 	__SYSCALL_ULONG_TYPE




 
# define __OFF_T_MATCHES_OFF64_T	1

 
# define __INO_T_MATCHES_INO64_T	1

 
# define __RLIM_T_MATCHES_RLIM64_T	1




 
#define __FD_SETSIZE		1024


# 131 "/usr/include/x86_64-linux-gnu/bits/types.h"


typedef unsigned long int __dev_t;	 
typedef unsigned int __uid_t;	 
typedef unsigned int __gid_t;	 
typedef unsigned long int __ino_t;	 
typedef unsigned long int __ino64_t;	 
typedef unsigned int __mode_t;	 
typedef unsigned long int __nlink_t;	 
typedef long int __off_t;	 
typedef long int __off64_t;	 
typedef int __pid_t;	 
typedef struct { int __val[2]; } __fsid_t;	 
typedef long int __clock_t;	 
typedef unsigned long int __rlim_t;	 
typedef unsigned long int __rlim64_t;	 
typedef unsigned int __id_t;		 
typedef long int __time_t;	 
typedef unsigned int __useconds_t;  
typedef long int __suseconds_t;  

typedef int __daddr_t;	 
typedef int __key_t;	 

 
typedef int __clockid_t;

 
typedef void * __timer_t;

 
typedef long int __blksize_t;

 

 
typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;

 
typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;

 
typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;

 
typedef long int __fsword_t;

typedef long int __ssize_t;  

 
typedef long int __syscall_slong_t;
 
typedef unsigned long int __syscall_ulong_t;


 
typedef __off64_t __loff_t;	 
typedef char *__caddr_t;

 
typedef long int __intptr_t;

 
typedef unsigned int __socklen_t;



 
typedef int __sig_atomic_t;

#undef __STD_TYPE

# 36 "/usr/include/stdio.h"
# 1 "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h"

#define ____FILE_defined 1

struct _IO_FILE;
typedef struct _IO_FILE __FILE;

# 37 "/usr/include/stdio.h"
# 1 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"

#define __FILE_defined 1

struct _IO_FILE;

 
typedef struct _IO_FILE FILE;

# 38 "/usr/include/stdio.h"

#define _STDIO_USES_IOSTREAM

# 1 "/usr/include/x86_64-linux-gnu/bits/libio.h"

























 


#define _BITS_LIBIO_H 1





# 1 "/usr/include/x86_64-linux-gnu/bits/_G_config.h"

 


#define _BITS_G_CONFIG_H 1





 


#define __need_size_t



#define __need_NULL
# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"










 





# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





















 



 








 
# 44 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 


 



 







 
# 91 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 









 
# 116 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





 

 


 
# 164 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

 


 
# 238 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#undef	__need_size_t






 


 
# 349 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

# 361 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 
 
 
# 395 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 


#undef NULL		 




#define NULL ((void *)0)





#undef	__need_NULL

# 449 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

# 19 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"
# 20 "/usr/include/x86_64-linux-gnu/bits/_G_config.h"

# 1 "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h"

#define ____mbstate_t_defined 1




 




 
typedef struct
{
  int __count;
  union
  {
    unsigned int __wch;
    char __wchb[4];
  } __value;		 
} __mbstate_t;

# 22 "/usr/include/x86_64-linux-gnu/bits/_G_config.h"




typedef struct
{
  __off_t __pos;
  __mbstate_t __state;
} _G_fpos_t;
typedef struct
{
  __off64_t __pos;
  __mbstate_t __state;
} _G_fpos64_t;
# 48 "/usr/include/x86_64-linux-gnu/bits/_G_config.h"


 
#define _G_va_list __gnuc_va_list

#define _G_HAVE_MMAP 1
#define _G_HAVE_MREMAP 1

#define _G_IO_IO_FILE_VERSION 0x20001

 
#define _G_HAVE_ST_BLKSIZE defined (_STATBUF_ST_BLKSIZE)

#define _G_BUFSIZ 8192

# 36 "/usr/include/x86_64-linux-gnu/bits/libio.h"
 
#define _IO_fpos_t _G_fpos_t
#define _IO_fpos64_t _G_fpos64_t
#define _IO_size_t size_t
#define _IO_ssize_t __ssize_t
#define _IO_off_t __off_t
#define _IO_off64_t __off64_t
#define _IO_pid_t __pid_t
#define _IO_uid_t __uid_t
#define _IO_iconv_t _G_iconv_t
#define _IO_HAVE_ST_BLKSIZE _G_HAVE_ST_BLKSIZE
#define _IO_BUFSIZ _G_BUFSIZ
#define _IO_va_list _G_va_list
#define _IO_wint_t wint_t

 
#define __need___va_list
# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stdarg.h"










 



 
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stdarg.h"





















 



 

# 34 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stdarg.h"
#undef __need___va_list

 


#define __GNUC_VA_LIST
typedef __builtin_va_list __gnuc_va_list;



 
# 125 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stdarg.h"

# 18 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stdarg.h"




#define _STDARG_H_CSURF_BUILTIN_VA_LIST
typedef char *  __builtin_va_list;




# 38 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stdarg.h"

#define _VARARGS_H_CSURF






















 
#hard_define __builtin_va_start(x, n) (*(char**)&(x) = (char*)(&__builtin_va_alist))
#hard_define __builtin_va_copy(dest, src) ((dest) = (src))
#hard_define __builtin_va_arg(x, n) (*(n*)(((*(char**)&(x)) += sizeof(n)) - sizeof(n)))
#hard_define __builtin_va_end(x) (void *)0
#hard_define __builtin_va_arg_pack() (__builtin_va_alist)
# 54 "/usr/include/x86_64-linux-gnu/bits/libio.h"

# undef _IO_va_list
# define _IO_va_list __gnuc_va_list






#define _IO_UNIFIED_JUMPTABLES 1


# define EOF (-1)
# 80 "/usr/include/x86_64-linux-gnu/bits/libio.h"

#define _IOS_INPUT	1
#define _IOS_OUTPUT	2
#define _IOS_ATEND	4
#define _IOS_APPEND	8
#define _IOS_TRUNC	16
#define _IOS_NOCREATE	32
#define _IOS_NOREPLACE	64
#define _IOS_BIN	128





 

#define _IO_MAGIC 0xFBAD0000  
#define _OLD_STDIO_MAGIC 0xFABC0000  
#define _IO_MAGIC_MASK 0xFFFF0000
#define _IO_USER_BUF 1  
#define _IO_UNBUFFERED 2
#define _IO_NO_READS 4  
#define _IO_NO_WRITES 8  
#define _IO_EOF_SEEN 0x10
#define _IO_ERR_SEEN 0x20
#define _IO_DELETE_DONT_CLOSE 0x40  
#define _IO_LINKED 0x80  
#define _IO_IN_BACKUP 0x100
#define _IO_LINE_BUF 0x200
#define _IO_TIED_PUT_GET 0x400  
#define _IO_CURRENTLY_PUTTING 0x800
#define _IO_IS_APPENDING 0x1000
#define _IO_IS_FILEBUF 0x2000
#define _IO_BAD_SEEN 0x4000
#define _IO_USER_LOCK 0x8000

#define _IO_FLAGS2_MMAP 1
#define _IO_FLAGS2_NOTCANCEL 2



#define _IO_FLAGS2_USER_WBUF 8
# 128 "/usr/include/x86_64-linux-gnu/bits/libio.h"

 
#define _IO_SKIPWS 01
#define _IO_LEFT 02
#define _IO_RIGHT 04
#define _IO_INTERNAL 010
#define _IO_DEC 020
#define _IO_OCT 040
#define _IO_HEX 0100
#define _IO_SHOWBASE 0200
#define _IO_SHOWPOINT 0400
#define _IO_UPPERCASE 01000
#define _IO_SHOWPOS 02000
#define _IO_SCIENTIFIC 04000
#define _IO_FIXED 010000
#define _IO_UNITBUF 020000
#define _IO_STDIO 040000
#define _IO_DONT_CLOSE 0100000
#define _IO_BOOLALPHA 0200000


struct _IO_jump_t;  struct _IO_FILE;


 

typedef void _IO_lock_t;



 

struct _IO_marker {
  struct _IO_marker *_next;
  struct _IO_FILE *_sbuf;
  
 
   
  int _pos;
# 177 "/usr/include/x86_64-linux-gnu/bits/libio.h"
};

 
enum __codecvt_result
{
  __codecvt_ok,
  __codecvt_partial,
  __codecvt_error,
  __codecvt_noconv
};

# 244 "/usr/include/x86_64-linux-gnu/bits/libio.h"

struct _IO_FILE {
  int _flags;		 
#define _IO_file_flags _flags

   
   
  char* _IO_read_ptr;	 
  char* _IO_read_end;	 
  char* _IO_read_base;	 
  char* _IO_write_base;	 
  char* _IO_write_ptr;	 
  char* _IO_write_end;	 
  char* _IO_buf_base;	 
  char* _IO_buf_end;	 
   
  char *_IO_save_base;  
  char *_IO_backup_base;   
  char *_IO_save_end;  

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;



  int _flags2;

  __off_t _old_offset;  

#define __HAVE_COLUMN  
   
  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];

   

  _IO_lock_t *_lock;
# 293 "/usr/include/x86_64-linux-gnu/bits/libio.h"
  __off64_t _offset;
# 301 "/usr/include/x86_64-linux-gnu/bits/libio.h"
  void *__pad1;
  void *__pad2;
  void *__pad3;
  void *__pad4;

  size_t __pad5;
  int _mode;
   
  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];

};


typedef struct _IO_FILE _IO_FILE;


struct _IO_FILE_plus;

extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;

#define _IO_stdin ((_IO_FILE*)(&_IO_2_1_stdin_))
#define _IO_stdout ((_IO_FILE*)(&_IO_2_1_stdout_))
#define _IO_stderr ((_IO_FILE*)(&_IO_2_1_stderr_))







 


 
typedef __ssize_t __io_read_fn (void *__cookie, char *__buf, size_t __nbytes);






 
typedef __ssize_t __io_write_fn (void *__cookie, const char *__buf,
				 size_t __n);






 
typedef int __io_seek_fn (void *__cookie, __off64_t *__pos, int __w);

 
typedef int __io_close_fn (void *__cookie);



 
typedef __io_read_fn cookie_read_function_t;
typedef __io_write_fn cookie_write_function_t;
typedef __io_seek_fn cookie_seek_function_t;
typedef __io_close_fn cookie_close_function_t;

 
typedef struct
{
  __io_read_fn *read;		 
  __io_write_fn *write;		 
  __io_seek_fn *seek;		 
  __io_close_fn *close;		 
} _IO_cookie_io_functions_t;
typedef _IO_cookie_io_functions_t cookie_io_functions_t;

struct _IO_cookie_file;

 
extern void _IO_cookie_init (struct _IO_cookie_file *__cfile, int __read_write,
			     void *__cookie, _IO_cookie_io_functions_t __fns);







extern int __underflow (_IO_FILE *);
extern int __uflow (_IO_FILE *);
extern int __overflow (_IO_FILE *, int);







# define _IO_BE(expr, res) __builtin_expect ((expr), res)




#define _IO_getc_unlocked(_fp)        (_IO_BE ((_fp)->_IO_read_ptr >= (_fp)->_IO_read_end, 0) 	? __uflow (_fp) : *(unsigned char *) (_fp)->_IO_read_ptr++)


#define _IO_peekc_unlocked(_fp)        (_IO_BE ((_fp)->_IO_read_ptr >= (_fp)->_IO_read_end, 0) 	  && __underflow (_fp) == EOF ? EOF 	: *(unsigned char *) (_fp)->_IO_read_ptr)



#define _IO_putc_unlocked(_ch, _fp)    (_IO_BE ((_fp)->_IO_write_ptr >= (_fp)->_IO_write_end, 0)     ? __overflow (_fp, (unsigned char) (_ch))     : (unsigned char) (*(_fp)->_IO_write_ptr++ = (_ch)))




# 429 "/usr/include/x86_64-linux-gnu/bits/libio.h"

#define _IO_feof_unlocked(__fp) (((__fp)->_flags & _IO_EOF_SEEN) != 0)
#define _IO_ferror_unlocked(__fp) (((__fp)->_flags & _IO_ERR_SEEN) != 0)

extern int _IO_getc (_IO_FILE *__fp);
extern int _IO_putc (int __c, _IO_FILE *__fp);
extern int _IO_feof (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ferror (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));

extern int _IO_peekc_locked (_IO_FILE *__fp);

 
#define _IO_PENDING_OUTPUT_COUNT(_fp)		((_fp)->_IO_write_ptr - (_fp)->_IO_write_base)


extern void _IO_flockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern void _IO_funlockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ftrylockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));

#define _IO_peekc(_fp) _IO_peekc_unlocked (_fp)
#define _IO_flockfile(_fp)  
#define _IO_funlockfile(_fp)  
#define _IO_ftrylockfile(_fp)  

#define _IO_cleanup_region_start(_fct, _fp)  


#define _IO_cleanup_region_end(_Doit)  


#define _IO_need_lock(_fp)   (((_fp)->_flags2 & _IO_FLAGS2_NEED_LOCK) != 0)


extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict,
			__gnuc_va_list, int *__restrict);
extern int _IO_vfprintf (_IO_FILE *__restrict, const char *__restrict,
			 __gnuc_va_list);
extern __ssize_t _IO_padn (_IO_FILE *, int, __ssize_t);
extern size_t _IO_sgetn (_IO_FILE *, void *, size_t);

extern __off64_t _IO_seekoff (_IO_FILE *, __off64_t, int, int);
extern __off64_t _IO_seekpos (_IO_FILE *, __off64_t, int);

extern void _IO_free_backup_area (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));

# 518 "/usr/include/x86_64-linux-gnu/bits/libio.h"









# 42 "/usr/include/stdio.h"




typedef __gnuc_va_list va_list;
#   define _VA_LIST_DEFINED











typedef __off64_t off_t;

# define __off_t_defined


typedef __off64_t off64_t;
# define __off64_t_defined





typedef __ssize_t ssize_t;
# define __ssize_t_defined



 



typedef _G_fpos64_t fpos_t;


typedef _G_fpos64_t fpos64_t;


 
#define _IOFBF 0		 
#define _IOLBF 1		 
#define _IONBF 2		 


 

# define BUFSIZ _IO_BUFSIZ




 






 
#define SEEK_SET	0	 
#define SEEK_CUR	1	 
#define SEEK_END	2	 

# define SEEK_DATA	3	 
# define SEEK_HOLE	4	 




 
# define P_tmpdir	"/tmp"











 
# 1 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h"















 


#define _BITS_STDIO_LIM_H 1





#define L_tmpnam 20
#define TMP_MAX 238328
#define FILENAME_MAX 4096


# define L_ctermid 9

#  define L_cuserid 9



#undef  FOPEN_MAX
#define FOPEN_MAX 16

# 132 "/usr/include/stdio.h"


 
extern struct _IO_FILE *stdin;		 
extern struct _IO_FILE *stdout;		 
extern struct _IO_FILE *stderr;		 
 
#define stdin stdin
#define stdout stdout
#define stderr stderr

 
extern int remove (const char *__filename) __attribute__ ((__nothrow__ , __leaf__));
 
extern int rename (const char *__old, const char *__new) __attribute__ ((__nothrow__ , __leaf__));


 
extern int renameat (int __oldfd, const char *__old, int __newfd,
		     const char *__new) __attribute__ ((__nothrow__ , __leaf__));





 




extern FILE *tmpfile (void) __asm__ ("" "tmpfile64") __attribute__ ((__warn_unused_result__));






extern FILE *tmpfile64 (void) __attribute__ ((__warn_unused_result__));


 
extern char *tmpnam (char *__s) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));



 
extern char *tmpnam_r (char *__s) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));










 
extern char *tempnam (const char *__dir, const char *__pfx)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__warn_unused_result__));






 
extern int fclose (FILE *__stream);



 
extern int fflush (FILE *__stream);







 
extern int fflush_unlocked (FILE *__stream);








 
extern int fcloseall (void);



# 243 "/usr/include/stdio.h"
extern FILE *fopen (const char *__restrict __filename, const char *__restrict __modes) __asm__ ("" "fopen64")

  __attribute__ ((__warn_unused_result__));
extern FILE *freopen (const char *__restrict __filename, const char *__restrict __modes, FILE *__restrict __stream) __asm__ ("" "freopen64")


  __attribute__ ((__warn_unused_result__));
# 256 "/usr/include/stdio.h"
extern FILE *fopen64 (const char *__restrict __filename,
		      const char *__restrict __modes) __attribute__ ((__warn_unused_result__));
extern FILE *freopen64 (const char *__restrict __filename,
			const char *__restrict __modes,
			FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));



 
extern FILE *fdopen (int __fd, const char *__modes) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));




 
extern FILE *fopencookie (void *__restrict __magic_cookie,
			  const char *__restrict __modes,
			  _IO_cookie_io_functions_t __io_funcs) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));



 
extern FILE *fmemopen (void *__s, size_t __len, const char *__modes)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));



 
extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));




 
extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));


 
extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
		    int __modes, size_t __n) __attribute__ ((__nothrow__ , __leaf__));



 
extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
		       size_t __size) __attribute__ ((__nothrow__ , __leaf__));

 
extern void setlinebuf (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));






 
extern int fprintf (FILE *__restrict __stream,
		    const char *__restrict __format, ...);



 
extern int printf (const char *__restrict __format, ...);
 
extern int sprintf (char *__restrict __s,
		    const char *__restrict __format, ...) __attribute__ ((__nothrow__));




 
extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
		     __gnuc_va_list __arg);



 
extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);
 
extern int vsprintf (char *__restrict __s, const char *__restrict __format,
		     __gnuc_va_list __arg) __attribute__ ((__nothrow__));


 
extern int snprintf (char *__restrict __s, size_t __maxlen,
		     const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
		      const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));




 
extern int vasprintf (char **__restrict __ptr, const char *__restrict __f,
		      __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 0))) __attribute__ ((__warn_unused_result__));
extern int __asprintf (char **__restrict __ptr,
		       const char *__restrict __fmt, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3))) __attribute__ ((__warn_unused_result__));
extern int asprintf (char **__restrict __ptr,
		     const char *__restrict __fmt, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3))) __attribute__ ((__warn_unused_result__));



 
extern int vdprintf (int __fd, const char *__restrict __fmt,
		     __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));






 
extern int fscanf (FILE *__restrict __stream,
		   const char *__restrict __format, ...) __attribute__ ((__warn_unused_result__));



 
extern int scanf (const char *__restrict __format, ...) __attribute__ ((__warn_unused_result__));
 
extern int sscanf (const char *__restrict __s,
		   const char *__restrict __format, ...) __attribute__ ((__nothrow__ , __leaf__));

# 414 "/usr/include/stdio.h"





 
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
		    __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) __attribute__ ((__warn_unused_result__));




 
extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) __attribute__ ((__warn_unused_result__));

 
extern int vsscanf (const char *__restrict __s,
		    const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (__scanf__, 2, 0)));

# 471 "/usr/include/stdio.h"





 
extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);




 
extern int getchar (void);


 
#define getc(_fp) _IO_getc (_fp)





 
extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);








 
extern int fgetc_unlocked (FILE *__stream);









 
extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);




 
extern int putchar (int __c);


 
#define putc(_ch, _fp) _IO_putc (_ch, _fp)







 
extern int fputc_unlocked (int __c, FILE *__stream);






 
extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);





 
extern int getw (FILE *__stream);

 
extern int putw (int __w, FILE *__stream);






 
extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     __attribute__ ((__warn_unused_result__));

# 579 "/usr/include/stdio.h"







 
extern char *fgets_unlocked (char *__restrict __s, int __n,
			     FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));













 
extern __ssize_t __getdelim (char **__restrict __lineptr,
			       size_t *__restrict __n, int __delimiter,
			       FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));
extern __ssize_t getdelim (char **__restrict __lineptr,
			     size_t *__restrict __n, int __delimiter,
			     FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));






 
extern __ssize_t getline (char **__restrict __lineptr,
			    size_t *__restrict __n,
			    FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));






 
extern int fputs (const char *__restrict __s, FILE *__restrict __stream);




 
extern int puts (const char *__s);





 
extern int ungetc (int __c, FILE *__stream);





 
extern size_t fread (void *__restrict __ptr, size_t __size,
		     size_t __n, FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));



 
extern size_t fwrite (const void *__restrict __ptr, size_t __size,
		      size_t __n, FILE *__restrict __s);







 
extern int fputs_unlocked (const char *__restrict __s,
			   FILE *__restrict __stream);








 
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
			      size_t __n, FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));
extern size_t fwrite_unlocked (const void *__restrict __ptr, size_t __size,
			       size_t __n, FILE *__restrict __stream);






 
extern int fseek (FILE *__stream, long int __off, int __whence);



 
extern long int ftell (FILE *__stream) __attribute__ ((__warn_unused_result__));



 
extern void rewind (FILE *__stream);




 

# 715 "/usr/include/stdio.h"
extern int fseeko (FILE *__stream, __off64_t __off, int __whence) __asm__ ("" "fseeko64");


extern __off64_t ftello (FILE *__stream) __asm__ ("" "ftello64");
# 725 "/usr/include/stdio.h"

# 739 "/usr/include/stdio.h"
extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos) __asm__ ("" "fgetpos64");

extern int fsetpos (FILE *__stream, const fpos_t *__pos) __asm__ ("" "fsetpos64");
# 748 "/usr/include/stdio.h"


extern int fseeko64 (FILE *__stream, __off64_t __off, int __whence);
extern __off64_t ftello64 (FILE *__stream) __attribute__ ((__warn_unused_result__));
extern int fgetpos64 (FILE *__restrict __stream, fpos64_t *__restrict __pos);
extern int fsetpos64 (FILE *__stream, const fpos64_t *__pos);


 
extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
 
extern int feof (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
 
extern int ferror (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));


 
extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));






 
extern void perror (const char *__s);




 
# 1 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
















 





 


extern int sys_nerr;
extern const char *const sys_errlist[];


extern int _sys_nerr;
extern const char *const _sys_errlist[];
# 782 "/usr/include/stdio.h"



 
extern int fileno (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));



 
extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));







 
extern FILE *popen (const char *__command, const char *__modes) __attribute__ ((__warn_unused_result__));




 
extern int pclose (FILE *__stream);




 
extern char *ctermid (char *__s) __attribute__ ((__nothrow__ , __leaf__));




 
extern char *cuserid (char *__s);




struct obstack;			 

 
extern int obstack_printf (struct obstack *__restrict __obstack,
			   const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3)));
extern int obstack_vprintf (struct obstack *__restrict __obstack,
			    const char *__restrict __format,
			    __gnuc_va_list __args)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 0)));




 

 
extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));


 
extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));

 
extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));









 
# 1 "/usr/include/x86_64-linux-gnu/bits/stdio.h"
















 








# define __STDIO_INLINE __extern_inline





 
# 41 "/usr/include/x86_64-linux-gnu/bits/stdio.h"

 
extern __inline __attribute__ ((__gnu_inline__)) int
getchar (void)
{
  return _IO_getc (stdin);
}



 
extern __inline __attribute__ ((__gnu_inline__)) int
fgetc_unlocked (FILE *__fp)
{
  return (__builtin_expect (((__fp)->_IO_read_ptr >= (__fp)->_IO_read_end), 0) ? __uflow (__fp) : *(unsigned char *) (__fp)->_IO_read_ptr++);
}




 
extern __inline __attribute__ ((__gnu_inline__)) int
getc_unlocked (FILE *__fp)
{
  return (__builtin_expect (((__fp)->_IO_read_ptr >= (__fp)->_IO_read_end), 0) ? __uflow (__fp) : *(unsigned char *) (__fp)->_IO_read_ptr++);
}

 
extern __inline __attribute__ ((__gnu_inline__)) int
getchar_unlocked (void)
{
  return (__builtin_expect (((stdin)->_IO_read_ptr >= (stdin)->_IO_read_end), 0) ? __uflow (stdin) : *(unsigned char *) (stdin)->_IO_read_ptr++);
}



 
extern __inline __attribute__ ((__gnu_inline__)) int
putchar (int __c)
{
  return _IO_putc (__c, stdout);
}



 
extern __inline __attribute__ ((__gnu_inline__)) int
fputc_unlocked (int __c, FILE *__stream)
{
  return (__builtin_expect (((__stream)->_IO_write_ptr >= (__stream)->_IO_write_end), 0) ? __overflow (__stream, (unsigned char) (__c)) : (unsigned char) (*(__stream)->_IO_write_ptr++ = (__c)));
}




 
extern __inline __attribute__ ((__gnu_inline__)) int
putc_unlocked (int __c, FILE *__stream)
{
  return (__builtin_expect (((__stream)->_IO_write_ptr >= (__stream)->_IO_write_end), 0) ? __overflow (__stream, (unsigned char) (__c)) : (unsigned char) (*(__stream)->_IO_write_ptr++ = (__c)));
}

 
extern __inline __attribute__ ((__gnu_inline__)) int
putchar_unlocked (int __c)
{
  return (__builtin_expect (((stdout)->_IO_write_ptr >= (stdout)->_IO_write_end), 0) ? __overflow (stdout, (unsigned char) (__c)) : (unsigned char) (*(stdout)->_IO_write_ptr++ = (__c)));
}




 
extern __inline __attribute__ ((__gnu_inline__)) __ssize_t
getline (char **__lineptr, size_t *__n, FILE *__stream)
{
  return __getdelim (__lineptr, __n, '\n', __stream);
}




 
extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) feof_unlocked (FILE *__stream)
{
  return (((__stream)->_flags & 0x10) != 0);
}

 
extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) ferror_unlocked (FILE *__stream)
{
  return (((__stream)->_flags & 0x20) != 0);
}







 
# define fread_unlocked(ptr, size, n, stream)   (__extension__ ((__builtin_constant_p (size) && __builtin_constant_p (n)    		   && (size_t) (size) * (size_t) (n) <= 8		      		   && (size_t) (size) != 0)				      		  ? ({ char *__ptr = (char *) (ptr);			      		       FILE *__stream = (stream);			      		       size_t __cnt;					      		       for (__cnt = (size_t) (size) * (size_t) (n);	      			    __cnt > 0; --__cnt)				      			 {						      			   int __c = _IO_getc_unlocked (__stream);	      			   if (__c == EOF)				      			     break;					      			   *__ptr++ = __c;				      			 }						      		       ((size_t) (size) * (size_t) (n) - __cnt)		      			/ (size_t) (size); })				      		  : (((__builtin_constant_p (size) && (size_t) (size) == 0)   		      || (__builtin_constant_p (n) && (size_t) (n) == 0))     			 		      		     ? ((void) (ptr), (void) (stream), (void) (size),	      			(void) (n), (size_t) 0)				      		     : fread_unlocked (ptr, size, n, stream))))
# 167 "/usr/include/x86_64-linux-gnu/bits/stdio.h"

# define fwrite_unlocked(ptr, size, n, stream)   (__extension__ ((__builtin_constant_p (size) && __builtin_constant_p (n)    		   && (size_t) (size) * (size_t) (n) <= 8		      		   && (size_t) (size) != 0)				      		  ? ({ const char *__ptr = (const char *) (ptr);	      		       FILE *__stream = (stream);			      		       size_t __cnt;					      		       for (__cnt = (size_t) (size) * (size_t) (n);	      			    __cnt > 0; --__cnt)				      			 if (_IO_putc_unlocked (*__ptr++, __stream) == EOF)   			   break;					      		       ((size_t) (size) * (size_t) (n) - __cnt)		      			/ (size_t) (size); })				      		  : (((__builtin_constant_p (size) && (size_t) (size) == 0)   		      || (__builtin_constant_p (n) && (size_t) (n) == 0))     			 		      		     ? ((void) (ptr), (void) (stream), (void) (size),	      			(void) (n), (size_t) 0)				      		     : fwrite_unlocked (ptr, size, n, stream))))
# 188 "/usr/include/x86_64-linux-gnu/bits/stdio.h"

 
#undef __STDIO_INLINE
# 860 "/usr/include/stdio.h"
# 1 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"
















 





extern int __sprintf_chk (char *__restrict __s, int __flag, size_t __slen,
			  const char *__restrict __format, ...) __attribute__ ((__nothrow__ , __leaf__));
extern int __vsprintf_chk (char *__restrict __s, int __flag, size_t __slen,
			   const char *__restrict __format,
			   __gnuc_va_list __ap) __attribute__ ((__nothrow__ , __leaf__));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
__attribute__ ((__nothrow__ , __leaf__)) sprintf (char *__restrict __s, const char *__restrict __fmt, ...)
{
  return __builtin___sprintf_chk (__s, 2 - 1,
				  __builtin_object_size(0,0), __fmt, (__builtin_va_alist));
}






extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int

__attribute__ ((__nothrow__ , __leaf__)) vsprintf (char *__restrict __s, const char *__restrict __fmt, __gnuc_va_list __ap)
{
  return __builtin___vsprintf_chk (__s, 2 - 1,
				   __builtin_object_size(0,0), __fmt, __ap);
}



extern int __snprintf_chk (char *__restrict __s, size_t __n, int __flag,
			   size_t __slen, const char *__restrict __format,
			   ...) __attribute__ ((__nothrow__ , __leaf__));
extern int __vsnprintf_chk (char *__restrict __s, size_t __n, int __flag,
			    size_t __slen, const char *__restrict __format,
			    __gnuc_va_list __ap) __attribute__ ((__nothrow__ , __leaf__));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int

__attribute__ ((__nothrow__ , __leaf__)) snprintf (char *__restrict __s, size_t __n, const char *__restrict __fmt, ...)
{
  return __builtin___snprintf_chk (__s, __n, 2 - 1,
				   __builtin_object_size(0,0), __fmt, (__builtin_va_alist));
}






extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int

__attribute__ ((__nothrow__ , __leaf__)) vsnprintf (char *__restrict __s, size_t __n, const char *__restrict __fmt, __gnuc_va_list __ap)
{
  return __builtin___vsnprintf_chk (__s, __n, 2 - 1,
				    __builtin_object_size(0,0), __fmt, __ap);
}





extern int __fprintf_chk (FILE *__restrict __stream, int __flag,
			  const char *__restrict __format, ...);
extern int __printf_chk (int __flag, const char *__restrict __format, ...);
extern int __vfprintf_chk (FILE *__restrict __stream, int __flag,
			   const char *__restrict __format, __gnuc_va_list __ap);
extern int __vprintf_chk (int __flag, const char *__restrict __format,
			  __gnuc_va_list __ap);


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
fprintf (FILE *__restrict __stream, const char *__restrict __fmt, ...)
{
  return __fprintf_chk (__stream, 2 - 1, __fmt,
			(__builtin_va_alist));
}

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
printf (const char *__restrict __fmt, ...)
{
  return __printf_chk (2 - 1, __fmt, (__builtin_va_alist));
}
# 112 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
vprintf (const char *__restrict __fmt, __gnuc_va_list __ap)
{

  return __vfprintf_chk (stdout, 2 - 1, __fmt, __ap);



}

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
vfprintf (FILE *__restrict __stream,
	  const char *__restrict __fmt, __gnuc_va_list __ap)
{
  return __vfprintf_chk (__stream, 2 - 1, __fmt, __ap);
}


extern int __dprintf_chk (int __fd, int __flag, const char *__restrict __fmt,
			  ...) __attribute__ ((__format__ (__printf__, 3, 4)));
extern int __vdprintf_chk (int __fd, int __flag,
			   const char *__restrict __fmt, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 3, 0)));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
dprintf (int __fd, const char *__restrict __fmt, ...)
{
  return __dprintf_chk (__fd, 2 - 1, __fmt,
			(__builtin_va_alist));
}





extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
vdprintf (int __fd, const char *__restrict __fmt, __gnuc_va_list __ap)
{
  return __vdprintf_chk (__fd, 2 - 1, __fmt, __ap);
}




extern int __asprintf_chk (char **__restrict __ptr, int __flag,
			   const char *__restrict __fmt, ...)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (__printf__, 3, 4))) __attribute__ ((__warn_unused_result__));
extern int __vasprintf_chk (char **__restrict __ptr, int __flag,
			    const char *__restrict __fmt, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (__printf__, 3, 0))) __attribute__ ((__warn_unused_result__));
extern int __obstack_printf_chk (struct obstack *__restrict __obstack,
				 int __flag, const char *__restrict __format,
				 ...)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (__printf__, 3, 4)));
extern int __obstack_vprintf_chk (struct obstack *__restrict __obstack,
				  int __flag,
				  const char *__restrict __format,
				  __gnuc_va_list __args)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (__printf__, 3, 0)));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
__attribute__ ((__nothrow__ , __leaf__)) asprintf (char * *__restrict __ptr, const char *__restrict __fmt, ...)
{
  return __asprintf_chk (__ptr, 2 - 1, __fmt,
			 (__builtin_va_alist));
}

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int

__attribute__ ((__nothrow__ , __leaf__)) __asprintf (char * *__restrict __ptr, const char *__restrict __fmt, ...)
{
  return __asprintf_chk (__ptr, 2 - 1, __fmt,
			 (__builtin_va_alist));
}

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int

__attribute__ ((__nothrow__ , __leaf__)) obstack_printf (struct obstack *__restrict __obstack, const char *__restrict __fmt, ...)
{
  return __obstack_printf_chk (__obstack, 2 - 1, __fmt,
			       (__builtin_va_alist));
}
# 205 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int

__attribute__ ((__nothrow__ , __leaf__)) vasprintf (char * *__restrict __ptr, const char *__restrict __fmt, __gnuc_va_list __ap)
{
  return __vasprintf_chk (__ptr, 2 - 1, __fmt, __ap);
}

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int

__attribute__ ((__nothrow__ , __leaf__)) obstack_vprintf (struct obstack *__restrict __obstack, const char *__restrict __fmt, __gnuc_va_list __ap)
{
  return __obstack_vprintf_chk (__obstack, 2 - 1, __fmt,
				__ap);
}





# 239 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"

extern char *__fgets_chk (char *__restrict __s, size_t __size, int __n,
			  FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));
extern char *__fgets_alias (char *__restrict __s, int __n, FILE *__restrict __stream) __asm__ ("" "fgets") __attribute__ ((__warn_unused_result__));


extern char *__fgets_chk_warn (char *__restrict __s, size_t __size, int __n, FILE *__restrict __stream) __asm__ ("" "__fgets_chk")


     __attribute__ ((__warn_unused_result__)) __attribute__((__warning__ ("fgets called with bigger size than length " "of destination buffer")));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__warn_unused_result__)) char *
fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
{
  if (__builtin_object_size(0,0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__n) || __n <= 0)
	return __fgets_chk (__s, __builtin_object_size(0,0), __n, __stream);

      if ((size_t) __n > __builtin_object_size(0,0))
	return __fgets_chk_warn (__s, __builtin_object_size(0,0), __n, __stream);
    }
  return __fgets_alias (__s, __n, __stream);
}

extern size_t __fread_chk (void *__restrict __ptr, size_t __ptrlen,
			   size_t __size, size_t __n,
			   FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));
extern size_t __fread_alias (void *__restrict __ptr, size_t __size, size_t __n, FILE *__restrict __stream) __asm__ ("" "fread") __attribute__ ((__warn_unused_result__));



extern size_t __fread_chk_warn (void *__restrict __ptr, size_t __ptrlen, size_t __size, size_t __n, FILE *__restrict __stream) __asm__ ("" "__fread_chk")




     __attribute__ ((__warn_unused_result__)) __attribute__((__warning__ ("fread called with bigger size * nmemb than length " "of destination buffer")));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__warn_unused_result__)) size_t
fread (void *__restrict __ptr, size_t __size, size_t __n,
       FILE *__restrict __stream)
{
  if (__builtin_object_size(0,0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__size)
	  || !__builtin_constant_p (__n)
	  || (__size | __n) >= (((size_t) 1) << (8 * sizeof (size_t) / 2)))
	return __fread_chk (__ptr, __builtin_object_size(0,0), __size, __n, __stream);

      if (__size * __n > __builtin_object_size(0,0))
	return __fread_chk_warn (__ptr, __builtin_object_size(0,0), __size, __n, __stream);
    }
  return __fread_alias (__ptr, __size, __n, __stream);
}


extern char *__fgets_unlocked_chk (char *__restrict __s, size_t __size,
				   int __n, FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));
extern char *__fgets_unlocked_alias (char *__restrict __s, int __n, FILE *__restrict __stream) __asm__ ("" "fgets_unlocked") __attribute__ ((__warn_unused_result__));


extern char *__fgets_unlocked_chk_warn (char *__restrict __s, size_t __size, int __n, FILE *__restrict __stream) __asm__ ("" "__fgets_unlocked_chk")


     __attribute__ ((__warn_unused_result__)) __attribute__((__warning__ ("fgets_unlocked called with bigger size than length " "of destination buffer")));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__warn_unused_result__)) char *
fgets_unlocked (char *__restrict __s, int __n, FILE *__restrict __stream)
{
  if (__builtin_object_size(0,0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__n) || __n <= 0)
	return __fgets_unlocked_chk (__s, __builtin_object_size(0,0), __n, __stream);

      if ((size_t) __n > __builtin_object_size(0,0))
	return __fgets_unlocked_chk_warn (__s, __builtin_object_size(0,0), __n, __stream);
    }
  return __fgets_unlocked_alias (__s, __n, __stream);
}



# undef fread_unlocked
extern size_t __fread_unlocked_chk (void *__restrict __ptr, size_t __ptrlen,
				    size_t __size, size_t __n,
				    FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));
extern size_t __fread_unlocked_alias (void *__restrict __ptr, size_t __size, size_t __n, FILE *__restrict __stream) __asm__ ("" "fread_unlocked") __attribute__ ((__warn_unused_result__));



extern size_t __fread_unlocked_chk_warn (void *__restrict __ptr, size_t __ptrlen, size_t __size, size_t __n, FILE *__restrict __stream) __asm__ ("" "__fread_unlocked_chk")




     __attribute__ ((__warn_unused_result__)) __attribute__((__warning__ ("fread_unlocked called with bigger size * nmemb than " "length of destination buffer")));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__warn_unused_result__)) size_t
fread_unlocked (void *__restrict __ptr, size_t __size, size_t __n,
		FILE *__restrict __stream)
{
  if (__builtin_object_size(0,0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__size)
	  || !__builtin_constant_p (__n)
	  || (__size | __n) >= (((size_t) 1) << (8 * sizeof (size_t) / 2)))
	return __fread_unlocked_chk (__ptr, __builtin_object_size(0,0), __size, __n,
				     __stream);

      if (__size * __n > __builtin_object_size(0,0))
	return __fread_unlocked_chk_warn (__ptr, __builtin_object_size(0,0), __size, __n,
					  __stream);
    }


  if (__builtin_constant_p (__size)
      && __builtin_constant_p (__n)
      && (__size | __n) < (((size_t) 1) << (8 * sizeof (size_t) / 2))
      && __size * __n <= 8)
    {
      size_t __cnt = __size * __n;
      char *__cptr = (char *) __ptr;
      if (__cnt == 0)
	return 0;

      for (; __cnt > 0; --__cnt)
	{
	  int __c = (__builtin_expect (((__stream)->_IO_read_ptr >= (__stream)->_IO_read_end), 0) ? __uflow (__stream) : *(unsigned char *) (__stream)->_IO_read_ptr++);
	  if (__c == (-1))
	    break;
	  *__cptr++ = __c;
	}
      return (__cptr - (char *) __ptr) / __size;
    }

  return __fread_unlocked_alias (__ptr, __size, __n, __stream);
}
# 863 "/usr/include/stdio.h"







# 15 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stdio.h"





 


# define CSURF_STDIO_H  1





#define __CSURF_EXTERN_C extern








 

# define __CSURF_THROW __THROW







#define __CSURF_INCLUDE_CALLING_CONVENTION









 
    



 
# 71 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stdio.h"



 

#  define __CSURF_THROW_GLIBC_2_3 __CSURF_THROW














 






#hard_undef stdin
extern FILE *stdin;



#hard_undef stdout
extern FILE *stdout;



#hard_undef stderr
extern FILE *stderr;





#hard_undef getc
extern int  getc(FILE *stream) __attribute__ ((__nothrow__ , __leaf__));


















#hard_undef putc
extern int  putc(int c, FILE *stream) __attribute__ ((__nothrow__ , __leaf__));














































                
#undef __CSURF_THROW
#undef __CSURF_INCLUDE_CALLING_CONVENTION
#undef __CSURF_EXTERN_C

# 35 "redis-cli.c"
# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/string.h"










 

 
# 1 "/usr/include/string.h"















 



 


#define	_STRING_H	1

#define __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h"
















 







 





#undef __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION




 
#undef __GLIBC_USE_LIB_EXT2


# define __GLIBC_USE_LIB_EXT2 1





 
#undef __GLIBC_USE_IEC_60559_BFP_EXT

# define __GLIBC_USE_IEC_60559_BFP_EXT 1





 
#undef __GLIBC_USE_IEC_60559_FUNCS_EXT

# define __GLIBC_USE_IEC_60559_FUNCS_EXT 1





 
#undef __GLIBC_USE_IEC_60559_TYPES_EXT

# define __GLIBC_USE_IEC_60559_TYPES_EXT 1
# 27 "/usr/include/string.h"



 
#define	__need_size_t
#define	__need_NULL
# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"










 





# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





















 



 








 
# 44 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 


 



 







 
# 91 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 









 
# 116 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





 

 


 
# 164 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

 


 
# 238 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#undef	__need_size_t






 


 
# 349 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

# 361 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 
 
 
# 395 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 


#undef NULL		 




#define NULL ((void *)0)





#undef	__need_NULL

# 449 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

# 19 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"
# 34 "/usr/include/string.h"

 





 
extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
		     size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern void *memmove (void *__dest, const void *__src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



 

extern void *memccpy (void *__restrict __dest, const void *__restrict __src,
		      int __c, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



 
extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int memcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

 
# 90 "/usr/include/string.h"
extern void *memchr (const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));




 
# 103 "/usr/include/string.h"
extern void *rawmemchr (const void *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


 
# 114 "/usr/include/string.h"
extern void *memrchr (const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));




 
extern char *strcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
 
extern char *strncpy (char *__restrict __dest,
		      const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern char *strcat (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
 
extern char *strncat (char *__restrict __dest, const char *__restrict __src,
		      size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int strcmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
 
extern int strncmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int strcoll (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
 
extern size_t strxfrm (char *__restrict __dest,
		       const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


 
# 1 "/usr/include/x86_64-linux-gnu/bits/types/locale_t.h"
















 


#define _BITS_TYPES_LOCALE_T_H 1

# 1 "/usr/include/x86_64-linux-gnu/bits/types/__locale_t.h"

















 


#define _BITS_TYPES___LOCALE_T_H 1




 

struct __locale_struct
{
   
  struct __locale_data *__locales[13];  

   
  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;

   
  const char *__names[13];
};

typedef struct __locale_struct *__locale_t;

# 23 "/usr/include/x86_64-linux-gnu/bits/types/locale_t.h"

typedef __locale_t locale_t;

# 153 "/usr/include/string.h"

 
extern int strcoll_l (const char *__s1, const char *__s2, locale_t __l)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));

 
extern size_t strxfrm_l (char *__dest, const char *__src, size_t __n,
			 locale_t __l) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));




 
extern char *strdup (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));




 

extern char *strndup (const char *__string, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));



 
# define strdupa(s)							        (__extension__							          ({									            const char *__old = (s);						            size_t __len = strlen (__old) + 1;				            char *__new = (char *) __builtin_alloca (__len);			            (char *) memcpy (__new, __old, __len);				          }))
# 188 "/usr/include/string.h"

 
# define strndupa(s, n)							        (__extension__							          ({									            const char *__old = (s);						            size_t __len = strnlen (__old, (n));				            char *__new = (char *) __builtin_alloca (__len + 1);		            __new[__len] = '\0';						            (char *) memcpy (__new, __old, __len);				          }))
# 200 "/usr/include/string.h"

 
# 225 "/usr/include/string.h"
extern char *strchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));

 
# 252 "/usr/include/string.h"
extern char *strrchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));




 
# 265 "/usr/include/string.h"
extern char *strchrnul (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));




 
extern size_t strcspn (const char *__s, const char *__reject)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern size_t strspn (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
 
# 302 "/usr/include/string.h"
extern char *strpbrk (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

 
# 329 "/usr/include/string.h"
extern char *strstr (const char *__haystack, const char *__needle)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));



 
extern char *strtok (char *__restrict __s, const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


 
extern char *__strtok_r (char *__restrict __s,
			 const char *__restrict __delim,
			 char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));

extern char *strtok_r (char *__restrict __s, const char *__restrict __delim,
		       char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));



 
# 359 "/usr/include/string.h"
extern char *strcasestr (const char *__haystack, const char *__needle)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));






 
extern void *memmem (const void *__haystack, size_t __haystacklen,
		     const void *__needle, size_t __needlelen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 3)));


 
extern void *__mempcpy (void *__restrict __dest,
			const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern void *mempcpy (void *__restrict __dest,
		      const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



 
extern size_t strlen (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));



 
extern size_t strnlen (const char *__string, size_t __maxlen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));



 
extern char *strerror (int __errnum) __attribute__ ((__nothrow__ , __leaf__));







 
# 418 "/usr/include/string.h"

 
extern char *strerror_r (int __errnum, char *__buf, size_t __buflen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2))) __attribute__ ((__warn_unused_result__));




 
extern char *strerror_l (int __errnum, locale_t __l) __attribute__ ((__nothrow__ , __leaf__));


# 1 "/usr/include/strings.h"















 


#define	_STRINGS_H	1


#define __need_size_t
# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"










 





# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





















 



 








 
# 44 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 


 



 







 
# 91 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 









 
# 116 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





 

 


 
# 164 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

 


 
# 238 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#undef	__need_size_t






 


 
# 349 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

# 361 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 
 
 
# 395 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 

# 412 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#undef	__need_NULL

# 449 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

# 19 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"
# 24 "/usr/include/strings.h"

 







 
extern int bcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern void bcopy (const void *__src, void *__dest, size_t __n)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern void bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
# 68 "/usr/include/strings.h"
extern char *index (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


 
# 96 "/usr/include/strings.h"
extern char *rindex (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





 
extern int ffs (int __i) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 

extern int ffsl (long int __l) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
__extension__ extern int ffsll (long long int __ll)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


 
extern int strcasecmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int strncasecmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


 


 
extern int strcasecmp_l (const char *__s1, const char *__s2, locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));


 
extern int strncasecmp_l (const char *__s1, const char *__s2,
			  size_t __n, locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 4)));






 
# 1 "/usr/include/x86_64-linux-gnu/bits/strings_fortified.h"
















 


# define __STRINGS_FORTIFIED 1

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) void
__attribute__ ((__nothrow__ , __leaf__)) bcopy (const void *__src, void *__dest, size_t __len)
{
  (void) __builtin___memmove_chk (__dest, __src, __len, __builtin_object_size(0,0));
}

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) void
__attribute__ ((__nothrow__ , __leaf__)) bzero (void *__dest, size_t __len)
{
  (void) __builtin___memset_chk (__dest, '\0', __len, __builtin_object_size(0,0));
}

# 145 "/usr/include/strings.h"



# 432 "/usr/include/string.h"


 
extern void explicit_bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


 
extern char *strsep (char **__restrict __stringp,
		     const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



 
extern char *strsignal (int __sig) __attribute__ ((__nothrow__ , __leaf__));

 
extern char *__stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


 
extern char *__stpncpy (char *__restrict __dest,
			const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
		      const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



 
extern int strverscmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern char *strfry (char *__string) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern void *memfrob (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





 
# 486 "/usr/include/string.h"
extern char *basename (const char *__filename) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));






 
# 1 "/usr/include/x86_64-linux-gnu/bits/string_fortified.h"















 


#define _BITS_STRING_FORTIFIED_H 1










extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) void *

__attribute__ ((__nothrow__ , __leaf__)) memcpy (void *__restrict __dest, const void *__restrict __src, size_t __len)
{
  return __builtin___memcpy_chk (__dest, __src, __len, __builtin_object_size(0,0));
}

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) void *
__attribute__ ((__nothrow__ , __leaf__)) memmove (void *__dest, const void *__src, size_t __len)
{
  return __builtin___memmove_chk (__dest, __src, __len, __builtin_object_size(0,0));
}


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) void *

__attribute__ ((__nothrow__ , __leaf__)) mempcpy (void *__restrict __dest, const void *__restrict __src, size_t __len)
{
  return __builtin___mempcpy_chk (__dest, __src, __len, __builtin_object_size(0,0));
}







 
extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) void *
__attribute__ ((__nothrow__ , __leaf__)) memset (void *__dest, int __ch, size_t __len)
{
  
 
# 71 "/usr/include/x86_64-linux-gnu/bits/string_fortified.h"
  return __builtin___memset_chk (__dest, __ch, __len, __builtin_object_size(0,0));
}




void __explicit_bzero_chk (void *__dest, size_t __len, size_t __destlen)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) void
__attribute__ ((__nothrow__ , __leaf__)) explicit_bzero (void *__dest, size_t __len)
{
  __explicit_bzero_chk (__dest, __len, __builtin_object_size(0,0));
}


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) char *
__attribute__ ((__nothrow__ , __leaf__)) strcpy (char *__restrict __dest, const char *__restrict __src)
{
  return __builtin___strcpy_chk (__dest, __src, __builtin_object_size(0,0));
}


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) char *
__attribute__ ((__nothrow__ , __leaf__)) stpcpy (char *__restrict __dest, const char *__restrict __src)
{
  return __builtin___stpcpy_chk (__dest, __src, __builtin_object_size(0,0));
}



extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) char *

__attribute__ ((__nothrow__ , __leaf__)) strncpy (char *__restrict __dest, const char *__restrict __src, size_t __len)
{
  return __builtin___strncpy_chk (__dest, __src, __len, __builtin_object_size(0,0));
}

 
extern char *__stpncpy_chk (char *__dest, const char *__src, size_t __n,
			    size_t __destlen) __attribute__ ((__nothrow__ , __leaf__));
extern char *__stpncpy_alias (char *__dest, const char *__src, size_t __n) __asm__ ("" "stpncpy") __attribute__ ((__nothrow__ , __leaf__));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) char *
__attribute__ ((__nothrow__ , __leaf__)) stpncpy (char *__dest, const char *__src, size_t __n)
{
  if (__builtin_object_size(0,0) != (size_t) -1
      && (!__builtin_constant_p (__n) || __n > __builtin_object_size(0,0)))
    return __stpncpy_chk (__dest, __src, __n, __builtin_object_size(0,0));
  return __stpncpy_alias (__dest, __src, __n);
}


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) char *
__attribute__ ((__nothrow__ , __leaf__)) strcat (char *__restrict __dest, const char *__restrict __src)
{
  return __builtin___strcat_chk (__dest, __src, __builtin_object_size(0,0));
}


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) char *

__attribute__ ((__nothrow__ , __leaf__)) strncat (char *__restrict __dest, const char *__restrict __src, size_t __len)
{
  return __builtin___strncat_chk (__dest, __src, __len, __builtin_object_size(0,0));
}

# 495 "/usr/include/string.h"





# 15 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/string.h"


#define _STRING_H_CSURF




#define __CSURF_EXTERN_C extern




 







 

# define __CSURF_THROW __THROW







#define __CSURF_INCLUDE_CALLING_CONVENTION



























































 






 










# 217 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/string.h"








































































#undef __CSURF_INCLUDE_CALLING_CONVENTION
#undef __CSURF_THROW
#undef __CSURF_EXTERN_C




# 36 "redis-cli.c"
# 1 "/usr/include/stdlib.h"















 



 



#define __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h"
















 







 





#undef __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION




 
#undef __GLIBC_USE_LIB_EXT2


# define __GLIBC_USE_LIB_EXT2 1





 
#undef __GLIBC_USE_IEC_60559_BFP_EXT

# define __GLIBC_USE_IEC_60559_BFP_EXT 1





 
#undef __GLIBC_USE_IEC_60559_FUNCS_EXT

# define __GLIBC_USE_IEC_60559_FUNCS_EXT 1





 
#undef __GLIBC_USE_IEC_60559_TYPES_EXT

# define __GLIBC_USE_IEC_60559_TYPES_EXT 1
# 26 "/usr/include/stdlib.h"

 
#define __need_size_t
#define __need_wchar_t
#define __need_NULL
# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"










 





# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





















 



 








 
# 44 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 


 



 







 
# 91 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 









 
# 116 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





 

 


 
# 164 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

 


 
# 238 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#undef	__need_size_t






 


 
# 267 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#define __wchar_t__	 
#define __WCHAR_T__	 
#define _WCHAR_T
#define _T_WCHAR_
#define _T_WCHAR
#define __WCHAR_T
#define _WCHAR_T_
#define _BSD_WCHAR_T_
#define _WCHAR_T_DEFINED_
#define _WCHAR_T_DEFINED
#define _WCHAR_T_H
#define ___int_wchar_t_h
#define __INT_WCHAR_T_H
#define _GCC_WCHAR_T
#define _WCHAR_T_DECLARED










 

#undef _BSD_WCHAR_T_
# 310 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 
# 323 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





typedef int wchar_t;
# 347 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#undef	__need_wchar_t


# 361 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 
 
 
# 395 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 


#undef NULL		 




#define NULL ((void *)0)





#undef	__need_NULL

# 449 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

# 19 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"
# 32 "/usr/include/stdlib.h"



#define	_STDLIB_H	1


 
# 1 "/usr/include/x86_64-linux-gnu/bits/waitflags.h"
















 






 
#define	WNOHANG		1	 
#define	WUNTRACED	2	 

 

# define WSTOPPED	2	 
# define WEXITED	4	 
# define WCONTINUED	8	 
# define WNOWAIT	0x01000000  


#define __WNOTHREAD     0x20000000 #define __WALL		0x40000000  


#define __WCLONE	0x80000000  

 


# define __ENUM_IDTYPE_T 1


 
# undef P_ALL
# undef P_PID
# undef P_PGID

typedef enum
{
  P_ALL,		 
  P_PID,		 
  P_PGID		 
} idtype_t;
# 40 "/usr/include/stdlib.h"
# 1 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h"
















 






 


 
#define	__WEXITSTATUS(status)	(((status) & 0xff00) >> 8)

 
#define	__WTERMSIG(status)	((status) & 0x7f)

 
#define	__WSTOPSIG(status)	__WEXITSTATUS(status)

 
#define	__WIFEXITED(status)	(__WTERMSIG(status) == 0)

 
#define __WIFSIGNALED(status)   (((signed char) (((status) & 0x7f) + 1) >> 1) > 0)


 
#define	__WIFSTOPPED(status)	(((status) & 0xff) == 0x7f)


 

# define __WIFCONTINUED(status)	((status) == __W_CONTINUED)


 
#define	__WCOREDUMP(status)	((status) & __WCOREFLAG)

 
#define	__W_EXITCODE(ret, sig)	((ret) << 8 | (sig))
#define	__W_STOPCODE(sig)	((sig) << 8 | 0x7f)
#define __W_CONTINUED		0xffff
#define	__WCOREFLAG		0x80
# 41 "/usr/include/stdlib.h"

 
# define WEXITSTATUS(status)	__WEXITSTATUS (status)
# define WTERMSIG(status)	__WTERMSIG (status)
# define WSTOPSIG(status)	__WSTOPSIG (status)
# define WIFEXITED(status)	__WIFEXITED (status)
# define WIFSIGNALED(status)	__WIFSIGNALED (status)
# define WIFSTOPPED(status)	__WIFSTOPPED (status)

#  define WIFCONTINUED(status)	__WIFCONTINUED (status)



 
# 1 "/usr/include/x86_64-linux-gnu/bits/floatn.h"
















 


#define _BITS_FLOATN_H







 




# define __HAVE_FLOAT128 1





 

# define __HAVE_DISTINCT_FLOAT128 1






 
#define __HAVE_FLOAT64X 1




 
#define __HAVE_FLOAT64X_LONG_DOUBLE 1




 





#   define __f128(x) x##f128



 
# 78 "/usr/include/x86_64-linux-gnu/bits/floatn.h"
#   define __CFLOAT128 _Complex _Float128



 


 




 








 
# 107 "/usr/include/x86_64-linux-gnu/bits/floatn.h"




 








# 1 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h"

















 


#define _BITS_FLOATN_COMMON_H

# 1 "/usr/include/x86_64-linux-gnu/bits/long-double.h"
















 


 
# 25 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h"




 



 
#define __HAVE_FLOAT16 0
#define __HAVE_FLOAT32 1
#define __HAVE_FLOAT64 1
#define __HAVE_FLOAT32X 1
#define __HAVE_FLOAT128X 0












 
#define __HAVE_DISTINCT_FLOAT16 __HAVE_FLOAT16
#define __HAVE_DISTINCT_FLOAT32 0
#define __HAVE_DISTINCT_FLOAT64 0
#define __HAVE_DISTINCT_FLOAT32X 0
#define __HAVE_DISTINCT_FLOAT64X 0
#define __HAVE_DISTINCT_FLOAT128X __HAVE_FLOAT128X



 

# define __HAVE_FLOATN_NOT_TYPEDEF 1








 
# 81 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h"





#   define __f32(x) x##f32



# 98 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h"
#   define __f64(x) x##f64







#   define __f32x(x) x##f32x



# 118 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h"
#   define __f64x(x) x##f64x



# 129 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h"

 
# 139 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h"





#   define __CFLOAT32 _Complex _Float32



# 156 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h"
#   define __CFLOAT64 _Complex _Float64







#   define __CFLOAT32X _Complex _Float32x



# 176 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h"
#   define __CFLOAT64X _Complex _Float64x



# 187 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h"

 
# 203 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h"







# 216 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h"










 

# 242 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h"





# 253 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h"











# 270 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h"











# 287 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h"

# 302 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h"



# 319 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h"



# 121 "/usr/include/x86_64-linux-gnu/bits/floatn.h"

# 56 "/usr/include/stdlib.h"

 
typedef struct
  {
    int quot;			 
    int rem;			 
  } div_t;

 

typedef struct
  {
    long int quot;		 
    long int rem;		 
  } ldiv_t;
# define __ldiv_t_defined	1



 
__extension__ typedef struct
  {
    long long int quot;		 
    long long int rem;		 
  } lldiv_t;
# define __lldiv_t_defined	1



 
#define	RAND_MAX	2147483647



 
#define	EXIT_FAILURE	1	 
#define	EXIT_SUCCESS	0	 


 
#define	MB_CUR_MAX	(__ctype_get_mb_cur_max ())
extern size_t __ctype_get_mb_cur_max (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));


 
extern double atof (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));
 
extern int atoi (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));
 
extern long int atol (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));


 
__extension__ extern long long int atoll (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));


 
extern double strtod (const char *__restrict __nptr,
		      char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


 
extern float strtof (const char *__restrict __nptr,
		     char **__restrict __endptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern long double strtold (const char *__restrict __nptr,
			    char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


 








extern _Float32 strtof32 (const char *__restrict __nptr,
			  char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern _Float64 strtof64 (const char *__restrict __nptr,
			  char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern _Float128 strtof128 (const char *__restrict __nptr,
			    char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern _Float32x strtof32x (const char *__restrict __nptr,
			    char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern _Float64x strtof64x (const char *__restrict __nptr,
			    char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));








 
extern long int strtol (const char *__restrict __nptr,
			char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
 
extern unsigned long int strtoul (const char *__restrict __nptr,
				  char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


 
__extension__
extern long long int strtoq (const char *__restrict __nptr,
			     char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
 
__extension__
extern unsigned long long int strtouq (const char *__restrict __nptr,
				       char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



 
__extension__
extern long long int strtoll (const char *__restrict __nptr,
			      char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
 
__extension__
extern unsigned long long int strtoull (const char *__restrict __nptr,
					char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


 

extern int strfromd (char *__dest, size_t __size, const char *__format,
		     double __f)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));

extern int strfromf (char *__dest, size_t __size, const char *__format,
		     float __f)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));

extern int strfroml (char *__dest, size_t __size, const char *__format,
		     long double __f)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));









extern int strfromf32 (char *__dest, size_t __size, const char * __format,
		       _Float32 __f)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));



extern int strfromf64 (char *__dest, size_t __size, const char * __format,
		       _Float64 __f)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));



extern int strfromf128 (char *__dest, size_t __size, const char * __format,
			_Float128 __f)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));



extern int strfromf32x (char *__dest, size_t __size, const char * __format,
			_Float32x __f)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));



extern int strfromf64x (char *__dest, size_t __size, const char * __format,
			_Float64x __f)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));












 


extern long int strtol_l (const char *__restrict __nptr,
			  char **__restrict __endptr, int __base,
			  locale_t __loc) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 4)));

extern unsigned long int strtoul_l (const char *__restrict __nptr,
				    char **__restrict __endptr,
				    int __base, locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 4)));

__extension__
extern long long int strtoll_l (const char *__restrict __nptr,
				char **__restrict __endptr, int __base,
				locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 4)));

__extension__
extern unsigned long long int strtoull_l (const char *__restrict __nptr,
					  char **__restrict __endptr,
					  int __base, locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 4)));

extern double strtod_l (const char *__restrict __nptr,
			char **__restrict __endptr, locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));

extern float strtof_l (const char *__restrict __nptr,
		       char **__restrict __endptr, locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));

extern long double strtold_l (const char *__restrict __nptr,
			      char **__restrict __endptr,
			      locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));

# 314 "/usr/include/stdlib.h"


extern _Float32 strtof32_l (const char *__restrict __nptr,
			    char **__restrict __endptr,
			    locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));



extern _Float64 strtof64_l (const char *__restrict __nptr,
			    char **__restrict __endptr,
			    locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));



extern _Float128 strtof128_l (const char *__restrict __nptr,
			      char **__restrict __endptr,
			      locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));



extern _Float32x strtof32x_l (const char *__restrict __nptr,
			      char **__restrict __endptr,
			      locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));



extern _Float64x strtof64x_l (const char *__restrict __nptr,
			      char **__restrict __endptr,
			      locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));


# 357 "/usr/include/stdlib.h"



extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) atoi (const char *__nptr)
{
  return (int) strtol (__nptr, (char **) ((void *)0), 10);
}
extern __inline __attribute__ ((__gnu_inline__)) long int
__attribute__ ((__nothrow__ , __leaf__)) atol (const char *__nptr)
{
  return strtol (__nptr, (char **) ((void *)0), 10);
}


__extension__ extern __inline __attribute__ ((__gnu_inline__)) long long int
__attribute__ ((__nothrow__ , __leaf__)) atoll (const char *__nptr)
{
  return strtoll (__nptr, (char **) ((void *)0), 10);
}







 
extern char *l64a (long int __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));

 
extern long int a64l (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));



# 1 "/usr/include/x86_64-linux-gnu/sys/types.h"















 



 


#define	_SYS_TYPES_H	1









typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;
#  define __u_char_defined



typedef __loff_t loff_t;





typedef __ino64_t ino_t;

# define __ino_t_defined


typedef __ino64_t ino64_t;
# define __ino64_t_defined



typedef __dev_t dev_t;
# define __dev_t_defined



typedef __gid_t gid_t;
# define __gid_t_defined



typedef __mode_t mode_t;
# define __mode_t_defined



typedef __nlink_t nlink_t;
# define __nlink_t_defined



typedef __uid_t uid_t;
# define __uid_t_defined


# 96 "/usr/include/x86_64-linux-gnu/sys/types.h"


typedef __pid_t pid_t;
# define __pid_t_defined




typedef __id_t id_t;
# define __id_t_defined









typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;
#  define __daddr_t_defined




typedef __key_t key_t;
# define __key_t_defined


# 1 "/usr/include/x86_64-linux-gnu/bits/types/clock_t.h"

#define __clock_t_defined 1



 
typedef __clock_t clock_t;

# 128 "/usr/include/x86_64-linux-gnu/sys/types.h"
# 1 "/usr/include/x86_64-linux-gnu/bits/types/clockid_t.h"

#define __clockid_t_defined 1



 
typedef __clockid_t clockid_t;

# 130 "/usr/include/x86_64-linux-gnu/sys/types.h"
# 1 "/usr/include/x86_64-linux-gnu/bits/types/time_t.h"

#define __time_t_defined 1



 
typedef __time_t time_t;

# 131 "/usr/include/x86_64-linux-gnu/sys/types.h"
# 1 "/usr/include/x86_64-linux-gnu/bits/types/timer_t.h"

#define __timer_t_defined 1



 
typedef __timer_t timer_t;

# 132 "/usr/include/x86_64-linux-gnu/sys/types.h"



typedef __useconds_t useconds_t;
#  define __useconds_t_defined


typedef __suseconds_t suseconds_t;
#  define __suseconds_t_defined



#define	__need_size_t
# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"










 





# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





















 



 








 
# 44 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 


 



 







 
# 91 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 









 
# 116 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





 

 


 
# 164 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

 


 
# 238 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#undef	__need_size_t






 


 
# 349 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

# 361 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 
 
 
# 395 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 

# 412 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#undef	__need_NULL

# 449 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

# 19 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"
# 146 "/usr/include/x86_64-linux-gnu/sys/types.h"


 
typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;


 

# 1 "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h"
















 


#define _BITS_STDINT_INTN_H	1



typedef __int8_t int8_t;
typedef __int16_t int16_t;
typedef __int32_t int32_t;
typedef __int64_t int64_t;

# 157 "/usr/include/x86_64-linux-gnu/sys/types.h"

# 173 "/usr/include/x86_64-linux-gnu/sys/types.h"

 
# define __u_intN_t(N, MODE)   typedef unsigned int u_int##N##_t __attribute__ ((__mode__ (MODE)))


typedef unsigned int u_int8_t __attribute__ ((__mode__ (__QI__)));
typedef unsigned int u_int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int u_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int u_int64_t __attribute__ ((__mode__ (__DI__)));

typedef int register_t __attribute__ ((__mode__ (__word__)));



 

#define __BIT_TYPES_DEFINED__	1



 
# 1 "/usr/include/endian.h"















 


#define	_ENDIAN_H	1









 

#define	__LITTLE_ENDIAN	1234
#define	__BIG_ENDIAN	4321
#define	__PDP_ENDIAN	3412

 
# 1 "/usr/include/x86_64-linux-gnu/bits/endian.h"
 





#define __BYTE_ORDER __LITTLE_ENDIAN
# 37 "/usr/include/endian.h"


 

# define __FLOAT_WORD_ORDER __BYTE_ORDER



# define LITTLE_ENDIAN	__LITTLE_ENDIAN
# define BIG_ENDIAN	__BIG_ENDIAN
# define PDP_ENDIAN	__PDP_ENDIAN
# define BYTE_ORDER	__BYTE_ORDER



# define __LONG_LONG_PAIR(HI, LO) LO, HI






 
# 1 "/usr/include/x86_64-linux-gnu/bits/byteswap.h"
















 






#define _BITS_BYTESWAP_H 1

# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
 


# define __WORDSIZE	64







# define __WORDSIZE_TIME64_COMPAT32	1
 
# define __SYSCALL_WORDSIZE		64
# 29 "/usr/include/x86_64-linux-gnu/bits/byteswap.h"

 
#define __bswap_constant_16(x)      ((unsigned short int) ((((x) >> 8) & 0xff) | (((x) & 0xff) << 8)))


 
# 1 "/usr/include/x86_64-linux-gnu/bits/byteswap-16.h"
















 







#  define __bswap_16(x)      (__extension__							            ({ unsigned short int __v, __x = (unsigned short int) (x);	      	 if (__builtin_constant_p (__x))				      	   __v = __bswap_constant_16 (__x);				      	 else								      	   __asm__ ("rorw $8, %w0"					      		    : "=r" (__v)					      		    : "0" (__x)						      		    : "cc");						      	 __v; }))
# 36 "/usr/include/x86_64-linux-gnu/bits/byteswap.h"

 
#define __bswap_constant_32(x)      ((((x) & 0xff000000) >> 24) | (((x) & 0x00ff0000) >>  8) |		            (((x) & 0x0000ff00) <<  8) | (((x) & 0x000000ff) << 24))





static __inline unsigned int
__bswap_32 (unsigned int __bsx)
{
  return __builtin_bswap32 (__bsx);
}
# 93 "/usr/include/x86_64-linux-gnu/bits/byteswap.h"



 
# define __bswap_constant_64(x)      (__extension__ ((((x) & 0xff00000000000000ull) >> 56)		      		     | (((x) & 0x00ff000000000000ull) >> 40)		      		     | (((x) & 0x0000ff0000000000ull) >> 24)		      		     | (((x) & 0x000000ff00000000ull) >> 8)		      		     | (((x) & 0x00000000ff000000ull) << 8)		      		     | (((x) & 0x0000000000ff0000ull) << 24)		      		     | (((x) & 0x000000000000ff00ull) << 40)		      		     | (((x) & 0x00000000000000ffull) << 56)))
# 106 "/usr/include/x86_64-linux-gnu/bits/byteswap.h"


static __inline __uint64_t
__bswap_64 (__uint64_t __bsx)
{
  return __builtin_bswap64 (__bsx);
}
# 154 "/usr/include/x86_64-linux-gnu/bits/byteswap.h"

# 61 "/usr/include/endian.h"
# 1 "/usr/include/x86_64-linux-gnu/bits/uintn-identity.h"
















 






#define _BITS_UINTN_IDENTITY_H 1





 

static __inline __uint16_t
__uint16_identity (__uint16_t __x)
{
  return __x;
}

static __inline __uint32_t
__uint32_identity (__uint32_t __x)
{
  return __x;
}

static __inline __uint64_t
__uint64_identity (__uint64_t __x)
{
  return __x;
}

# 62 "/usr/include/endian.h"


#  define htobe16(x) __bswap_16 (x)
#  define htole16(x) __uint16_identity (x)
#  define be16toh(x) __bswap_16 (x)
#  define le16toh(x) __uint16_identity (x)

#  define htobe32(x) __bswap_32 (x)
#  define htole32(x) __uint32_identity (x)
#  define be32toh(x) __bswap_32 (x)
#  define le32toh(x) __uint32_identity (x)

#  define htobe64(x) __bswap_64 (x)
#  define htole64(x) __uint64_identity (x)
#  define be64toh(x) __bswap_64 (x)
#  define le64toh(x) __uint64_identity (x)

# 96 "/usr/include/endian.h"

# 195 "/usr/include/x86_64-linux-gnu/sys/types.h"

 
# 1 "/usr/include/x86_64-linux-gnu/sys/select.h"
















 

 


#define _SYS_SELECT_H	1



 


 
# 1 "/usr/include/x86_64-linux-gnu/bits/select.h"















 





# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
 


# define __WORDSIZE	64







# define __WORDSIZE_TIME64_COMPAT32	1
 
# define __SYSCALL_WORDSIZE		64
# 23 "/usr/include/x86_64-linux-gnu/bits/select.h"





#  define __FD_ZERO_STOS "stosq"




# define __FD_ZERO(fdsp)   do {									          int __d0, __d1;							          __asm__ __volatile__ ("cld; rep; " __FD_ZERO_STOS			      			  : "=c" (__d0), "=D" (__d1)			      			  : "a" (0), "0" (sizeof (fd_set)		      					  / sizeof (__fd_mask)),	      			    "1" (&__FDS_BITS (fdsp)[0])			      			  : "memory");					        } while (0)
# 43 "/usr/include/x86_64-linux-gnu/bits/select.h"

# 57 "/usr/include/x86_64-linux-gnu/bits/select.h"

#define __FD_SET(d, set)   ((void) (__FDS_BITS (set)[__FD_ELT (d)] |= __FD_MASK (d)))

#define __FD_CLR(d, set)   ((void) (__FDS_BITS (set)[__FD_ELT (d)] &= ~__FD_MASK (d)))

#define __FD_ISSET(d, set)   ((__FDS_BITS (set)[__FD_ELT (d)] & __FD_MASK (d)) != 0)
# 31 "/usr/include/x86_64-linux-gnu/sys/select.h"

 
# 1 "/usr/include/x86_64-linux-gnu/bits/types/sigset_t.h"

#define __sigset_t_defined 1

# 1 "/usr/include/x86_64-linux-gnu/bits/types/__sigset_t.h"

#define ____sigset_t_defined

#define _SIGSET_NWORDS (1024 / (8 * sizeof (unsigned long int)))
typedef struct
{
  unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
} __sigset_t;

# 5 "/usr/include/x86_64-linux-gnu/bits/types/sigset_t.h"

 
typedef __sigset_t sigset_t;

# 34 "/usr/include/x86_64-linux-gnu/sys/select.h"

 
# 1 "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h"

#define __timeval_defined 1




 
struct timeval
{
  __time_t tv_sec;		 
  __suseconds_t tv_usec;	 
};
# 38 "/usr/include/x86_64-linux-gnu/sys/select.h"
# 1 "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h"

#define __timespec_defined 1




 
struct timespec
{
  __time_t tv_sec;		 
  __syscall_slong_t tv_nsec;	 
};

# 40 "/usr/include/x86_64-linux-gnu/sys/select.h"








 
typedef long int __fd_mask;

 
#undef	__NFDBITS
 
#define __NFDBITS	(8 * (int) sizeof (__fd_mask))
#define	__FD_ELT(d)	((d) / __NFDBITS)
#define	__FD_MASK(d)	((__fd_mask) (1UL << ((d) % __NFDBITS)))

 
typedef struct
  {
    
 

    __fd_mask fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];
# define __FDS_BITS(set) ((set)->fds_bits)




  } fd_set;

 
#define	FD_SETSIZE		__FD_SETSIZE


 
typedef __fd_mask fd_mask;

 
# define NFDBITS		__NFDBITS



 
#define	FD_SET(fd, fdsetp)	__FD_SET (fd, fdsetp)
#define	FD_CLR(fd, fdsetp)	__FD_CLR (fd, fdsetp)
#define	FD_ISSET(fd, fdsetp)	__FD_ISSET (fd, fdsetp)
#define	FD_ZERO(fdsetp)		__FD_ZERO (fdsetp)











 
extern int select (int __nfds, fd_set *__restrict __readfds,
		   fd_set *__restrict __writefds,
		   fd_set *__restrict __exceptfds,
		   struct timeval *__restrict __timeout);







 
extern int pselect (int __nfds, fd_set *__restrict __readfds,
		    fd_set *__restrict __writefds,
		    fd_set *__restrict __exceptfds,
		    const struct timespec *__restrict __timeout,
		    const __sigset_t *__restrict __sigmask);



 
# 1 "/usr/include/x86_64-linux-gnu/bits/select2.h"
















 





 
extern long int __fdelt_chk (long int __d);
extern long int __fdelt_warn (long int __d)
  __attribute__((__warning__ ("bit outside of fd_set selected")));
#undef __FD_ELT
#define	__FD_ELT(d)   __extension__								      ({ long int __d = (d);						         (__builtin_constant_p (__d)					          ? (0 <= __d && __d < __FD_SETSIZE					    	 ? (__d / __NFDBITS)						    	 : __fdelt_warn (__d))						          : __fdelt_chk (__d)); })
# 124 "/usr/include/x86_64-linux-gnu/sys/select.h"




# 198 "/usr/include/x86_64-linux-gnu/sys/types.h"





 
# define __SYSMACROS_DEPRECATED_INCLUSION
# 1 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h"
















 











 
#undef major
#undef minor
#undef makedev


 

#define _SYS_SYSMACROS_H 1

# 1 "/usr/include/x86_64-linux-gnu/bits/sysmacros.h"
















 


#define _BITS_SYSMACROS_H 1













 

#define __SYSMACROS_DECLARE_MAJOR(DECL_TEMPL)			  DECL_TEMPL(unsigned int, major, (__dev_t __dev))


#define __SYSMACROS_DEFINE_MAJOR(DECL_TEMPL)			  __SYSMACROS_DECLARE_MAJOR (DECL_TEMPL)			  {								    unsigned int __major;					    __major  = ((__dev & (__dev_t) 0x00000000000fff00u) >>  8);     __major |= ((__dev & (__dev_t) 0xfffff00000000000u) >> 32);     return __major;						  }
# 47 "/usr/include/x86_64-linux-gnu/bits/sysmacros.h"

#define __SYSMACROS_DECLARE_MINOR(DECL_TEMPL)			  DECL_TEMPL(unsigned int, minor, (__dev_t __dev))


#define __SYSMACROS_DEFINE_MINOR(DECL_TEMPL)			  __SYSMACROS_DECLARE_MINOR (DECL_TEMPL)			  {								    unsigned int __minor;					    __minor  = ((__dev & (__dev_t) 0x00000000000000ffu) >>  0);     __minor |= ((__dev & (__dev_t) 0x00000ffffff00000u) >> 12);     return __minor;						  }
# 59 "/usr/include/x86_64-linux-gnu/bits/sysmacros.h"

#define __SYSMACROS_DECLARE_MAKEDEV(DECL_TEMPL)			  DECL_TEMPL(__dev_t, makedev, (unsigned int __major, unsigned int __minor))


#define __SYSMACROS_DEFINE_MAKEDEV(DECL_TEMPL)			  __SYSMACROS_DECLARE_MAKEDEV (DECL_TEMPL)			  {								    __dev_t __dev;						    __dev  = (((__dev_t) (__major & 0x00000fffu)) <<  8);	    __dev |= (((__dev_t) (__major & 0xfffff000u)) << 32);	    __dev |= (((__dev_t) (__minor & 0x000000ffu)) <<  0);	    __dev |= (((__dev_t) (__minor & 0xffffff00u)) << 12);	    return __dev;						  }
# 73 "/usr/include/x86_64-linux-gnu/bits/sysmacros.h"

# 42 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h"









 
#define __SYSMACROS_DM(symbol) __SYSMACROS_DM1  (In the GNU C Library, #symbol is defined\n  by <sys/sysmacros.h>. For historical compatibility, it is\n  currently defined by <sys/types.h> as well, but we plan to\n  remove this soon.  To use #symbol, include <sys/sysmacros.h>\n  directly.  If you did not intend to use a system-defined macro\n  #symbol, you should undefine it after including <sys/types.h>.)
# 59 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h"


 
#define __SYSMACROS_DM1(...) __glibc_macro_warning (#__VA_ARGS__)

#define __SYSMACROS_DECL_TEMPL(rtype, name, proto)			       extern rtype gnu_dev_##name proto __THROW __attribute_const__;


#define __SYSMACROS_IMPL_TEMPL(rtype, name, proto)			       __extension__ __extern_inline __attribute_const__ rtype		       __NTH (gnu_dev_##name proto)





extern unsigned int gnu_dev_major (__dev_t __dev) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern unsigned int gnu_dev_minor (__dev_t __dev) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern __dev_t gnu_dev_makedev (unsigned int __major, unsigned int __minor) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



__extension__ extern __inline __attribute__ ((__gnu_inline__)) __attribute__ ((__const__)) unsigned int __attribute__ ((__nothrow__ , __leaf__)) gnu_dev_major (__dev_t __dev) { unsigned int __major; __major = ((__dev & (__dev_t) 0x00000000000fff00u) >> 8); __major |= ((__dev & (__dev_t) 0xfffff00000000000u) >> 32); return __major; }
__extension__ extern __inline __attribute__ ((__gnu_inline__)) __attribute__ ((__const__)) unsigned int __attribute__ ((__nothrow__ , __leaf__)) gnu_dev_minor (__dev_t __dev) { unsigned int __minor; __minor = ((__dev & (__dev_t) 0x00000000000000ffu) >> 0); __minor |= ((__dev & (__dev_t) 0x00000ffffff00000u) >> 12); return __minor; }
__extension__ extern __inline __attribute__ ((__gnu_inline__)) __attribute__ ((__const__)) __dev_t __attribute__ ((__nothrow__ , __leaf__)) gnu_dev_makedev (unsigned int __major, unsigned int __minor) { __dev_t __dev; __dev = (((__dev_t) (__major & 0x00000fffu)) << 8); __dev |= (((__dev_t) (__major & 0xfffff000u)) << 32); __dev |= (((__dev_t) (__minor & 0x000000ffu)) << 0); __dev |= (((__dev_t) (__minor & 0xffffff00u)) << 12); return __dev; }








# undef __SYSMACROS_DECL_TEMPL
# undef __SYSMACROS_IMPL_TEMPL
# undef __SYSMACROS_DECLARE_MAJOR
# undef __SYSMACROS_DECLARE_MINOR
# undef __SYSMACROS_DECLARE_MAKEDEV
# undef __SYSMACROS_DEFINE_MAJOR
# undef __SYSMACROS_DEFINE_MINOR
# undef __SYSMACROS_DEFINE_MAKEDEV



# define major(dev) __SYSMACROS_DM (major) gnu_dev_major (dev)
# define minor(dev) __SYSMACROS_DM (minor) gnu_dev_minor (dev)
# define makedev(maj, min) __SYSMACROS_DM (makedev) gnu_dev_makedev (maj, min)






# 206 "/usr/include/x86_64-linux-gnu/sys/types.h"
# undef __SYSMACROS_DEPRECATED_INCLUSION





typedef __blksize_t blksize_t;
# define __blksize_t_defined


 
# 232 "/usr/include/x86_64-linux-gnu/sys/types.h"
typedef __blkcnt64_t blkcnt_t;	    
#  define __blkcnt_t_defined


typedef __fsblkcnt64_t fsblkcnt_t;  
#  define __fsblkcnt_t_defined


typedef __fsfilcnt64_t fsfilcnt_t;  
#  define __fsfilcnt_t_defined




typedef __blkcnt64_t blkcnt64_t;      
typedef __fsblkcnt64_t fsblkcnt64_t;  
typedef __fsfilcnt64_t fsfilcnt64_t;  



 
# 1 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
















 


# define _BITS_PTHREADTYPES_COMMON_H	1

 
# 1 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
















 


#define _THREAD_SHARED_TYPES_H 1























































 
# 1 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h"















 


#define _BITS_PTHREADTYPES_ARCH_H	1

# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
 


# define __WORDSIZE	64







# define __WORDSIZE_TIME64_COMPAT32	1
 
# define __SYSCALL_WORDSIZE		64
# 22 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h"



#  define __SIZEOF_PTHREAD_MUTEX_T 40
#  define __SIZEOF_PTHREAD_ATTR_T 56
#  define __SIZEOF_PTHREAD_MUTEX_T 40
#  define __SIZEOF_PTHREAD_RWLOCK_T 56
#  define __SIZEOF_PTHREAD_BARRIER_T 32
# 44 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h"
#define __SIZEOF_PTHREAD_MUTEXATTR_T 4
#define __SIZEOF_PTHREAD_COND_T 48
#define __SIZEOF_PTHREAD_CONDATTR_T 4
#define __SIZEOF_PTHREAD_RWLOCKATTR_T 8
#define __SIZEOF_PTHREAD_BARRIERATTR_T 4

 
#define __PTHREAD_COMPAT_PADDING_MID
#define __PTHREAD_COMPAT_PADDING_END
#define __PTHREAD_MUTEX_LOCK_ELISION    1

# define __PTHREAD_MUTEX_NUSERS_AFTER_KIND  0
# define __PTHREAD_MUTEX_USE_UNION          0





#define __LOCK_ALIGNMENT
#define __ONCE_ALIGNMENT

struct __pthread_rwlock_arch_t
{
  unsigned int __readers;
  unsigned int __writers;
  unsigned int __wrphase_futex;
  unsigned int __writers_futex;
  unsigned int __pad3;
  unsigned int __pad4;

  int __cur_writer;
  int __shared;
  signed char __rwelision;




  unsigned char __pad1[7];
#  define __PTHREAD_RWLOCK_ELISION_EXTRA 0, { 0, 0, 0, 0, 0, 0, 0 }

  unsigned long int __pad2;
  
 
  unsigned int __flags;
# define __PTHREAD_RWLOCK_INT_FLAGS_SHARED	1
# 99 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h"
};






# 78 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"

 


typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;
# 93 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"

 


#  define __PTHREAD_SPINS_DATA	  short __spins;		  short __elision


#  define __PTHREAD_SPINS             0, 0
# 117 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"

struct __pthread_mutex_s
{
  int __lock ;
  unsigned int __count;
  int __owner;

  unsigned int __nusers;

  
 
  int __kind;
  




  short __spins; short __elision;
  __pthread_list_t __list;
# define __PTHREAD_MUTEX_HAVE_PREV      1
# 145 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
  
};


 

struct __pthread_cond_s
{
  __extension__ union
  {
    __extension__ unsigned long long int __wseq;
    struct
    {
      unsigned int __low;
      unsigned int __high;
    } __wseq32;
  };
  __extension__ union
  {
    __extension__ unsigned long long int __g1_start;
    struct
    {
      unsigned int __low;
      unsigned int __high;
    } __g1_start32;
  };
  unsigned int __g_refs[2] ;
  unsigned int __g_size[2];
  unsigned int __g1_orig_size;
  unsigned int __wrefs;
  unsigned int __g_signals[2];
};

# 24 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"


 
typedef unsigned long int pthread_t;



 
typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;



 
typedef union
{
  char __size[4];
  int __align;
} pthread_condattr_t;


 
typedef unsigned int pthread_key_t;


 
typedef int  pthread_once_t;


union pthread_attr_t
{
  char __size[56];
  long int __align;
};

typedef union pthread_attr_t pthread_attr_t;
# define __have_pthread_attr_t 1



typedef union
{
  struct __pthread_mutex_s __data;
  char __size[40];
  long int __align;
} pthread_mutex_t;


typedef union
{
  struct __pthread_cond_s __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;




 
typedef union
{
  struct __pthread_rwlock_arch_t __data;
  char __size[56];
  long int __align;
} pthread_rwlock_t;

typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;




 
typedef volatile int pthread_spinlock_t;



 
typedef union
{
  char __size[32];
  long int __align;
} pthread_barrier_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;


# 255 "/usr/include/x86_64-linux-gnu/sys/types.h"




# 395 "/usr/include/stdlib.h"




 
 
extern long int random (void) __attribute__ ((__nothrow__ , __leaf__));

 
extern void srandom (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));




 
extern char *initstate (unsigned int __seed, char *__statebuf,
			size_t __statelen) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


 
extern char *setstate (char *__statebuf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





 

struct random_data
  {
    int32_t *fptr;		 
    int32_t *rptr;		 
    int32_t *state;		 
    int rand_type;		 
    int rand_deg;		 
    int rand_sep;		 
    int32_t *end_ptr;		 
  };

extern int random_r (struct random_data *__restrict __buf,
		     int32_t *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
			size_t __statelen,
			struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));

extern int setstate_r (char *__restrict __statebuf,
		       struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




 
extern int rand (void) __attribute__ ((__nothrow__ , __leaf__));
 
extern void srand (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));


 
extern int rand_r (unsigned int *__seed) __attribute__ ((__nothrow__ , __leaf__));




 

 
extern double drand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern double erand48 (unsigned short int __xsubi[3]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern long int lrand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern long int nrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern long int mrand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern long int jrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern void srand48 (long int __seedval) __attribute__ ((__nothrow__ , __leaf__));
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern void lcong48 (unsigned short int __param[7]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




 
struct drand48_data
  {
    unsigned short int __x[3];	 
    unsigned short int __old_x[3];  
    unsigned short int __c;	 
    unsigned short int __init;	 
    __extension__ unsigned long long int __a;	
 
  };

 
extern int drand48_r (struct drand48_data *__restrict __buffer,
		      double *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int erand48_r (unsigned short int __xsubi[3],
		      struct drand48_data *__restrict __buffer,
		      double *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int lrand48_r (struct drand48_data *__restrict __buffer,
		      long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int nrand48_r (unsigned short int __xsubi[3],
		      struct drand48_data *__restrict __buffer,
		      long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int mrand48_r (struct drand48_data *__restrict __buffer,
		      long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int jrand48_r (unsigned short int __xsubi[3],
		      struct drand48_data *__restrict __buffer,
		      long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

extern int seed48_r (unsigned short int __seed16v[3],
		     struct drand48_data *__buffer) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern int lcong48_r (unsigned short int __param[7],
		      struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



 
extern void *malloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__warn_unused_result__));
 
extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__warn_unused_result__));


 


 
extern void *realloc (void *__ptr, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));



 


 
extern void *reallocarray (void *__ptr, size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));


 
extern void free (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));

# 1 "/usr/include/alloca.h"















 


#define	_ALLOCA_H	1



#define	__need_size_t
# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"










 





# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





















 



 








 
# 44 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 


 



 







 
# 91 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 









 
# 116 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





 

 


 
# 164 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

 


 
# 238 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#undef	__need_size_t






 


 
# 349 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

# 361 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 
 
 
# 395 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 

# 412 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#undef	__need_NULL

# 449 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

# 19 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"
# 25 "/usr/include/alloca.h"



 
#undef	alloca

 
extern void *alloca (size_t __size) __attribute__ ((__nothrow__ , __leaf__));


# define alloca(size)	__builtin_alloca (size)




# 567 "/usr/include/stdlib.h"




 
extern void *valloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__warn_unused_result__));



 
extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));



 
extern void *aligned_alloc (size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__alloc_size__ (2))) __attribute__ ((__warn_unused_result__));


 
extern void abort (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));


 
extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


 




extern int at_quick_exit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





 
extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




 
extern void exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));




 
extern void quick_exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));




 
extern void _Exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));



 
extern char *getenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));



 
extern char *secure_getenv (const char *__name)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));



 

 
extern int putenv (char *__string) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




 
extern int setenv (const char *__name, const char *__value, int __replace)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

 
extern int unsetenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





 
extern int clearenv (void) __attribute__ ((__nothrow__ , __leaf__));









 
extern char *mktemp (char *__template) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));










 




extern int mkstemp (char *__template) __asm__ ("" "mkstemp64")
     __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));





extern int mkstemp64 (char *__template) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));









 




extern int mkstemps (char *__template, int __suffixlen) __asm__ ("" "mkstemps64") __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));
# 717 "/usr/include/stdlib.h"
extern int mkstemps64 (char *__template, int __suffixlen)
     __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));








 
extern char *mkdtemp (char *__template) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));








 




extern int mkostemp (char *__template, int __flags) __asm__ ("" "mkostemp64")
     __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));





extern int mkostemp64 (char *__template, int __flags) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));







 





extern int mkostemps (char *__template, int __suffixlen, int __flags) __asm__ ("" "mkostemps64")

     __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));





extern int mkostemps64 (char *__template, int __suffixlen, int __flags)
     __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));







 
extern int system (const char *__command) __attribute__ ((__warn_unused_result__));




 
extern char *canonicalize_file_name (const char *__name)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));







 
extern char *realpath (const char *__restrict __name,
		       char *__restrict __resolved) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));



 

# define __COMPAR_FN_T
typedef int (*__compar_fn_t) (const void *, const void *);


typedef __compar_fn_t comparison_fn_t;



typedef int (*__compar_d_fn_t) (const void *, const void *, void *);



 
extern void *bsearch (const void *__key, const void *__base,
		      size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) __attribute__ ((__warn_unused_result__));

# 1 "/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h"
















 

extern __inline __attribute__ ((__gnu_inline__)) void *
bsearch (const void *__key, const void *__base, size_t __nmemb, size_t __size,
	 __compar_fn_t __compar)
{
  size_t __l, __u, __idx;
  const void *__p;
  int __comparison;

  __l = 0;
  __u = __nmemb;
  while (__l < __u)
    {
      __idx = (__l + __u) / 2;
      __p = (void *) (((const char *) __base) + (__idx * __size));
      __comparison = (*__compar) (__key, __p);
      if (__comparison < 0)
	__u = __idx;
      else if (__comparison > 0)
	__l = __idx + 1;
      else
	return (void *) __p;
    }

  return ((void *)0);
}
# 823 "/usr/include/stdlib.h"



 
extern void qsort (void *__base, size_t __nmemb, size_t __size,
		   __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));

extern void qsort_r (void *__base, size_t __nmemb, size_t __size,
		     __compar_d_fn_t __compar, void *__arg)
  __attribute__ ((__nonnull__ (1, 4)));



 
extern int abs (int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) __attribute__ ((__warn_unused_result__));
extern long int labs (long int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) __attribute__ ((__warn_unused_result__));


__extension__ extern long long int llabs (long long int __x)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) __attribute__ ((__warn_unused_result__));




 
 
extern div_t div (int __numer, int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) __attribute__ ((__warn_unused_result__));
extern ldiv_t ldiv (long int __numer, long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) __attribute__ ((__warn_unused_result__));


__extension__ extern lldiv_t lldiv (long long int __numer,
				    long long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) __attribute__ ((__warn_unused_result__));






 



 
extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
		   int *__restrict __sign) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) __attribute__ ((__warn_unused_result__));



 
extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
		   int *__restrict __sign) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) __attribute__ ((__warn_unused_result__));



 
extern char *gcvt (double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3))) __attribute__ ((__warn_unused_result__));



 
extern char *qecvt (long double __value, int __ndigit,
		    int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) __attribute__ ((__warn_unused_result__));
extern char *qfcvt (long double __value, int __ndigit,
		    int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) __attribute__ ((__warn_unused_result__));
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3))) __attribute__ ((__warn_unused_result__));



 
extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
		   int *__restrict __sign, char *__restrict __buf,
		   size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
		   int *__restrict __sign, char *__restrict __buf,
		   size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));

extern int qecvt_r (long double __value, int __ndigit,
		    int *__restrict __decpt, int *__restrict __sign,
		    char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qfcvt_r (long double __value, int __ndigit,
		    int *__restrict __decpt, int *__restrict __sign,
		    char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));




 
extern int mblen (const char *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));

 
extern int mbtowc (wchar_t *__restrict __pwc,
		   const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));

 
extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__ , __leaf__));


 
extern size_t mbstowcs (wchar_t *__restrict  __pwcs,
			const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));
 
extern size_t wcstombs (char *__restrict __s,
			const wchar_t *__restrict __pwcs, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__));






 
extern int rpmatch (const char *__response) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));









 
extern int getsubopt (char **__restrict __optionp,
		      char *const *__restrict __tokens,
		      char **__restrict __valuep)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2, 3))) __attribute__ ((__warn_unused_result__));




 
extern void setkey (const char *__key) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



 


 
extern int posix_openpt (int __oflag) __attribute__ ((__warn_unused_result__));




 

 
extern int grantpt (int __fd) __attribute__ ((__nothrow__ , __leaf__));


 
extern int unlockpt (int __fd) __attribute__ ((__nothrow__ , __leaf__));



 
extern char *ptsname (int __fd) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));





 
extern int ptsname_r (int __fd, char *__buf, size_t __buflen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

 
extern int getpt (void);





 
extern int getloadavg (double __loadavg[], int __nelem)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));








# 1 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h"
















 






extern __inline __attribute__ ((__gnu_inline__)) double
__attribute__ ((__nothrow__ , __leaf__)) atof (const char *__nptr)
{
  return strtod (__nptr, (char **) ((void *)0));
}
# 1017 "/usr/include/stdlib.h"

 
# 1 "/usr/include/x86_64-linux-gnu/bits/stdlib.h"
















 





extern char *__realpath_chk (const char *__restrict __name,
			     char *__restrict __resolved,
			     size_t __resolvedlen) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
extern char *__realpath_alias (const char *__restrict __name, char *__restrict __resolved) __asm__ ("" "realpath") __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));


extern char *__realpath_chk_warn (const char *__restrict __name, char *__restrict __resolved, size_t __resolvedlen) __asm__ ("" "__realpath_chk") __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__))



     __attribute__((__warning__ ("second argument of realpath must be either NULL or at " "least PATH_MAX bytes long buffer")));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__warn_unused_result__)) char *
__attribute__ ((__nothrow__ , __leaf__)) realpath (const char *__restrict __name, char *__restrict __resolved)
{
  if (__builtin_object_size(0,0) != (size_t) -1)
    {




      return __realpath_chk (__name, __resolved, __builtin_object_size(0,0));
    }

  return __realpath_alias (__name, __resolved);
}


extern int __ptsname_r_chk (int __fd, char *__buf, size_t __buflen,
			    size_t __nreal) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern int __ptsname_r_alias (int __fd, char *__buf, size_t __buflen) __asm__ ("" "ptsname_r") __attribute__ ((__nothrow__ , __leaf__))

     __attribute__ ((__nonnull__ (2)));
extern int __ptsname_r_chk_warn (int __fd, char *__buf, size_t __buflen, size_t __nreal) __asm__ ("" "__ptsname_r_chk") __attribute__ ((__nothrow__ , __leaf__))


     __attribute__ ((__nonnull__ (2))) __attribute__((__warning__ ("ptsname_r called with buflen bigger than " "size of buf")));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
__attribute__ ((__nothrow__ , __leaf__)) ptsname_r (int __fd, char *__buf, size_t __buflen)
{
  if (__builtin_object_size(0,0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__buflen))
	return __ptsname_r_chk (__fd, __buf, __buflen, __builtin_object_size(0,0));
      if (__buflen > __builtin_object_size(0,0))
	return __ptsname_r_chk_warn (__fd, __buf, __buflen, __builtin_object_size(0,0));
    }
  return __ptsname_r_alias (__fd, __buf, __buflen);
}


extern int __wctomb_chk (char *__s, wchar_t __wchar, size_t __buflen)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
extern int __wctomb_alias (char *__s, wchar_t __wchar) __asm__ ("" "wctomb") __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__warn_unused_result__)) int
__attribute__ ((__nothrow__ , __leaf__)) wctomb (char *__s, wchar_t __wchar)
{
  

 
#define __STDLIB_MB_LEN_MAX	16



  if (__builtin_object_size(0,0) != (size_t) -1 && 16 > __builtin_object_size(0,0))
    return __wctomb_chk (__s, __wchar, __builtin_object_size(0,0));
  return __wctomb_alias (__s, __wchar);
}


extern size_t __mbstowcs_chk (wchar_t *__restrict __dst,
			      const char *__restrict __src,
			      size_t __len, size_t __dstlen) __attribute__ ((__nothrow__ , __leaf__));
extern size_t __mbstowcs_alias (wchar_t *__restrict __dst, const char *__restrict __src, size_t __len) __asm__ ("" "mbstowcs") __attribute__ ((__nothrow__ , __leaf__));



extern size_t __mbstowcs_chk_warn (wchar_t *__restrict __dst, const char *__restrict __src, size_t __len, size_t __dstlen) __asm__ ("" "__mbstowcs_chk") __attribute__ ((__nothrow__ , __leaf__))



     __attribute__((__warning__ ("mbstowcs called with dst buffer smaller than len " "* sizeof (wchar_t)")));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) size_t

__attribute__ ((__nothrow__ , __leaf__)) mbstowcs (wchar_t *__restrict __dst, const char *__restrict __src, size_t __len)
{
  if (__builtin_object_size(0,0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__len))
	return __mbstowcs_chk (__dst, __src, __len,
			       __builtin_object_size(0,0) / sizeof (wchar_t));

      if (__len > __builtin_object_size(0,0) / sizeof (wchar_t))
	return __mbstowcs_chk_warn (__dst, __src, __len,
				     __builtin_object_size(0,0) / sizeof (wchar_t));
    }
  return __mbstowcs_alias (__dst, __src, __len);
}


extern size_t __wcstombs_chk (char *__restrict __dst,
			      const wchar_t *__restrict __src,
			      size_t __len, size_t __dstlen) __attribute__ ((__nothrow__ , __leaf__));
extern size_t __wcstombs_alias (char *__restrict __dst, const wchar_t *__restrict __src, size_t __len) __asm__ ("" "wcstombs") __attribute__ ((__nothrow__ , __leaf__));



extern size_t __wcstombs_chk_warn (char *__restrict __dst, const wchar_t *__restrict __src, size_t __len, size_t __dstlen) __asm__ ("" "__wcstombs_chk") __attribute__ ((__nothrow__ , __leaf__))



     __attribute__((__warning__ ("wcstombs called with dst buffer smaller than len")));

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) size_t

__attribute__ ((__nothrow__ , __leaf__)) wcstombs (char *__restrict __dst, const wchar_t *__restrict __src, size_t __len)
{
  if (__builtin_object_size(0,0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__len))
	return __wcstombs_chk (__dst, __src, __len, __builtin_object_size(0,0));
      if (__len > __builtin_object_size(0,0))
	return __wcstombs_chk_warn (__dst, __src, __len, __builtin_object_size(0,0));
    }
  return __wcstombs_alias (__dst, __src, __len);
}
# 1021 "/usr/include/stdlib.h"







# 37 "redis-cli.c"
# 1 "/usr/include/signal.h"















 



 


#define _SIGNAL_H





# 1 "/usr/include/x86_64-linux-gnu/bits/signum.h"
















 


#define _BITS_SIGNUM_H 1





# 1 "/usr/include/x86_64-linux-gnu/bits/signum-generic.h"
















 


#define _BITS_SIGNUM_GENERIC_H 1





 

#define	SIG_ERR	 ((__sighandler_t) -1)	 
#define	SIG_DFL	 ((__sighandler_t)  0)	 
#define	SIG_IGN	 ((__sighandler_t)  1)	 


# define SIG_HOLD ((__sighandler_t) 2)	 











 

 
#define	SIGINT		2	 
#define	SIGILL		4	 
#define	SIGABRT		6	 
#define	SIGFPE		8	 
#define	SIGSEGV		11	 
#define	SIGTERM		15	 

 
#define	SIGHUP		1	 
#define	SIGQUIT		3	 
#define	SIGTRAP		5	 
#define	SIGKILL		9	 
#define SIGBUS		10	 
#define	SIGSYS		12	 
#define	SIGPIPE		13	 
#define	SIGALRM		14	 

 
#define	SIGURG		16	 
#define	SIGSTOP		17	 
#define	SIGTSTP		18	 
#define	SIGCONT		19	 
#define	SIGCHLD		20	 
#define	SIGTTIN		21	 
#define	SIGTTOU		22	 
#define	SIGPOLL		23	 
#define	SIGXCPU		24	 
#define	SIGXFSZ		25	 
#define	SIGVTALRM	26	 
#define	SIGPROF		27	 
#define	SIGUSR1		30	 
#define	SIGUSR2		31	 


 
#define	SIGWINCH	28	 

 
#define	SIGIO		SIGPOLL	 
#define	SIGIOT		SIGABRT	 
#define	SIGCLD		SIGCHLD	 






 
#define __SIGRTMIN	32
#define __SIGRTMAX	__SIGRTMIN

 
#define _NSIG		(__SIGRTMAX + 1)

# 27 "/usr/include/x86_64-linux-gnu/bits/signum.h"


 

#define	SIGSTKFLT	16	 
#define	SIGPWR		30	 

#undef	SIGBUS
#define	SIGBUS		 7
#undef	SIGUSR1
#define	SIGUSR1		10
#undef	SIGUSR2
#define	SIGUSR2		12
#undef	SIGCHLD
#define	SIGCHLD		17
#undef	SIGCONT
#define	SIGCONT		18
#undef	SIGSTOP
#define	SIGSTOP		19
#undef	SIGTSTP
#define	SIGTSTP		20
#undef	SIGURG
#define	SIGURG		23
#undef	SIGPOLL
#define	SIGPOLL		29
#undef	SIGSYS
#define SIGSYS		31

#undef	__SIGRTMAX
#define __SIGRTMAX	64

# 31 "/usr/include/signal.h"

# 1 "/usr/include/x86_64-linux-gnu/bits/types/sig_atomic_t.h"

#define __sig_atomic_t_defined 1




 
typedef __sig_atomic_t sig_atomic_t;

# 33 "/usr/include/signal.h"





# 50 "/usr/include/signal.h"


 



# 1 "/usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h"

#define __siginfo_t_defined 1

# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
 


# define __WORDSIZE	64







# define __WORDSIZE_TIME64_COMPAT32	1
 
# define __SYSCALL_WORDSIZE		64
# 5 "/usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h"
# 1 "/usr/include/x86_64-linux-gnu/bits/types/__sigval_t.h"
















 


#define ____sigval_t_defined

 

union sigval
{
  int sival_int;
  void *sival_ptr;
};

typedef union sigval __sigval_t;
# 40 "/usr/include/x86_64-linux-gnu/bits/types/__sigval_t.h"

# 7 "/usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h"

#define __SI_MAX_SIZE	128

# define __SI_PAD_SIZE	((__SI_MAX_SIZE / sizeof (int)) - 4)




 
# 1 "/usr/include/x86_64-linux-gnu/bits/siginfo-arch.h"
 

#define _BITS_SIGINFO_ARCH_H 1

# 16 "/usr/include/x86_64-linux-gnu/bits/siginfo-arch.h"

# 17 "/usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h"

# define __SI_ALIGNMENT		 


# define __SI_BAND_TYPE		long int


# define __SI_CLOCK_T		__clock_t


# define __SI_ERRNO_THEN_CODE	1


# define __SI_HAVE_SIGSYS	1


# define __SI_SIGFAULT_ADDL	 


typedef struct
  {
    int si_signo;		 

    int si_errno;		
 
    int si_code;		 





    int __pad0;			 


    union
      {
	int _pad[((128 / sizeof (int)) - 4)];

	  
	struct
	  {
	    __pid_t si_pid;	 
	    __uid_t si_uid;	 
	  } _kill;

	 
	struct
	  {
	    int si_tid;		 
	    int si_overrun;	 
	    __sigval_t si_sigval;	 
	  } _timer;

	 
	struct
	  {
	    __pid_t si_pid;	 
	    __uid_t si_uid;	 
	    __sigval_t si_sigval;	 
	  } _rt;

	 
	struct
	  {
	    __pid_t si_pid;	 
	    __uid_t si_uid;	 
	    int si_status;	 
	    __clock_t si_utime;
	    __clock_t si_stime;
	  } _sigchld;

	 
	struct
	  {
	    void *si_addr;	     
	    
	    short int si_addr_lsb;   
	    union
	      {
		 
		struct
		  {
		    void *_lower;
		    void *_upper;
		  } _addr_bnd;
		 
		__uint32_t _pkey;
	      } _bounds;
	  } _sigfault;

	 
	struct
	  {
	    long int si_band;	 
	    int si_fd;
	  } _sigpoll;

	 

	struct
	  {
	    void *_call_addr;	 
	    int _syscall;	 
	    unsigned int _arch;  
	  } _sigsys;

      } _sifields;
  } siginfo_t ;


 
#define si_pid		_sifields._kill.si_pid
#define si_uid		_sifields._kill.si_uid
#define si_timerid	_sifields._timer.si_tid
#define si_overrun	_sifields._timer.si_overrun
#define si_status	_sifields._sigchld.si_status
#define si_utime	_sifields._sigchld.si_utime
#define si_stime	_sifields._sigchld.si_stime
#define si_value	_sifields._rt.si_sigval
#define si_int		_sifields._rt.si_sigval.sival_int
#define si_ptr		_sifields._rt.si_sigval.sival_ptr
#define si_addr		_sifields._sigfault.si_addr
#define si_addr_lsb	_sifields._sigfault.si_addr_lsb
#define si_lower	_sifields._sigfault._bounds._addr_bnd._lower
#define si_upper	_sifields._sigfault._bounds._addr_bnd._upper
#define si_pkey		_sifields._sigfault._bounds._pkey
#define si_band		_sifields._sigpoll.si_band
#define si_fd		_sifields._sigpoll.si_fd

# define si_call_addr	_sifields._sigsys._call_addr
# define si_syscall	_sifields._sigsys._syscall
# define si_arch	_sifields._sigsys._arch


# 58 "/usr/include/signal.h"
# 1 "/usr/include/x86_64-linux-gnu/bits/siginfo-consts.h"
















 


#define _BITS_SIGINFO_CONSTS_H 1






 


# define __SI_ASYNCIO_AFTER_SIGIO 1



 
enum
{
  SI_ASYNCNL = -60,		 
  SI_TKILL = -6,		 
  SI_SIGIO,			 

  SI_ASYNCIO,			 
  SI_MESGQ,			 
  SI_TIMER,			 





  SI_QUEUE,			 
  SI_USER,			 
  SI_KERNEL = 0x80		 

#define SI_ASYNCNL	SI_ASYNCNL
#define SI_TKILL	SI_TKILL
#define SI_SIGIO	SI_SIGIO
#define SI_ASYNCIO	SI_ASYNCIO
#define SI_MESGQ	SI_MESGQ
#define SI_TIMER	SI_TIMER
#define SI_ASYNCIO	SI_ASYNCIO
#define SI_QUEUE	SI_QUEUE
#define SI_USER		SI_USER
#define SI_KERNEL	SI_KERNEL
};



 
enum
{
  ILL_ILLOPC = 1,		 
#  define ILL_ILLOPC	ILL_ILLOPC
  ILL_ILLOPN,			 
#  define ILL_ILLOPN	ILL_ILLOPN
  ILL_ILLADR,			 
#  define ILL_ILLADR	ILL_ILLADR
  ILL_ILLTRP,			 
#  define ILL_ILLTRP	ILL_ILLTRP
  ILL_PRVOPC,			 
#  define ILL_PRVOPC	ILL_PRVOPC
  ILL_PRVREG,			 
#  define ILL_PRVREG	ILL_PRVREG
  ILL_COPROC,			 
#  define ILL_COPROC	ILL_COPROC
  ILL_BADSTK			 
#  define ILL_BADSTK	ILL_BADSTK
};

 
enum
{
  FPE_INTDIV = 1,		 
#  define FPE_INTDIV	FPE_INTDIV
  FPE_INTOVF,			 
#  define FPE_INTOVF	FPE_INTOVF
  FPE_FLTDIV,			 
#  define FPE_FLTDIV	FPE_FLTDIV
  FPE_FLTOVF,			 
#  define FPE_FLTOVF	FPE_FLTOVF
  FPE_FLTUND,			 
#  define FPE_FLTUND	FPE_FLTUND
  FPE_FLTRES,			 
#  define FPE_FLTRES	FPE_FLTRES
  FPE_FLTINV,			 
#  define FPE_FLTINV	FPE_FLTINV
  FPE_FLTSUB			 
#  define FPE_FLTSUB	FPE_FLTSUB
};

 
enum
{
  SEGV_MAPERR = 1,		 
#  define SEGV_MAPERR	SEGV_MAPERR
  SEGV_ACCERR,			 
#  define SEGV_ACCERR	SEGV_ACCERR
  SEGV_BNDERR,			 
#  define SEGV_BNDERR	SEGV_BNDERR
  SEGV_PKUERR			 
#  define SEGV_PKUERR	SEGV_PKUERR
};

 
enum
{
  BUS_ADRALN = 1,		 
#  define BUS_ADRALN	BUS_ADRALN
  BUS_ADRERR,			 
#  define BUS_ADRERR	BUS_ADRERR
  BUS_OBJERR,			 
#  define BUS_OBJERR	BUS_OBJERR
  BUS_MCEERR_AR,		 
#  define BUS_MCEERR_AR	BUS_MCEERR_AR
  BUS_MCEERR_AO			 
#  define BUS_MCEERR_AO	BUS_MCEERR_AO
};



 
enum
{
  TRAP_BRKPT = 1,		 
#  define TRAP_BRKPT	TRAP_BRKPT
  TRAP_TRACE			 
#  define TRAP_TRACE	TRAP_TRACE
};



 
enum
{
  CLD_EXITED = 1,		 
#  define CLD_EXITED	CLD_EXITED
  CLD_KILLED,			 
#  define CLD_KILLED	CLD_KILLED
  CLD_DUMPED,			 
#  define CLD_DUMPED	CLD_DUMPED
  CLD_TRAPPED,			 
#  define CLD_TRAPPED	CLD_TRAPPED
  CLD_STOPPED,			 
#  define CLD_STOPPED	CLD_STOPPED
  CLD_CONTINUED			 
#  define CLD_CONTINUED	CLD_CONTINUED
};

 
enum
{
  POLL_IN = 1,			 
#  define POLL_IN	POLL_IN
  POLL_OUT,			 
#  define POLL_OUT	POLL_OUT
  POLL_MSG,			 
#  define POLL_MSG	POLL_MSG
  POLL_ERR,			 
#  define POLL_ERR	POLL_ERR
  POLL_PRI,			 
#  define POLL_PRI	POLL_PRI
  POLL_HUP			 
#  define POLL_HUP	POLL_HUP
};



 
# 1 "/usr/include/x86_64-linux-gnu/bits/siginfo-consts-arch.h"
 

#define _BITS_SIGINFO_CONSTS_ARCH_H 1

 

# 189 "/usr/include/x86_64-linux-gnu/bits/siginfo-consts.h"


# 59 "/usr/include/signal.h"


# 1 "/usr/include/x86_64-linux-gnu/bits/types/sigval_t.h"

#define __sigval_t_defined








 




typedef __sigval_t sigval_t;

# 63 "/usr/include/signal.h"


# 1 "/usr/include/x86_64-linux-gnu/bits/types/sigevent_t.h"

#define __sigevent_t_defined 1

# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
 


# define __WORDSIZE	64







# define __WORDSIZE_TIME64_COMPAT32	1
 
# define __SYSCALL_WORDSIZE		64
# 5 "/usr/include/x86_64-linux-gnu/bits/types/sigevent_t.h"



#define __SIGEV_MAX_SIZE	64

# define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 4)




 





 
typedef struct sigevent
  {
    __sigval_t sigev_value;
    int sigev_signo;
    int sigev_notify;

    union
      {
	int _pad[((64 / sizeof (int)) - 4)];

	
 
	__pid_t _tid;

	struct
	  {
	    void (*_function) (__sigval_t);	 
	    pthread_attr_t *_attribute;		 
	  } _sigev_thread;
      } _sigev_un;
  } sigevent_t;

 
#define sigev_notify_function   _sigev_un._sigev_thread._function
#define sigev_notify_attributes _sigev_un._sigev_thread._attribute

# 67 "/usr/include/signal.h"
# 1 "/usr/include/x86_64-linux-gnu/bits/sigevent-consts.h"
















 


#define _BITS_SIGEVENT_CONSTS_H 1





 
enum
{
  SIGEV_SIGNAL = 0,		 
# define SIGEV_SIGNAL	SIGEV_SIGNAL
  SIGEV_NONE,			 
# define SIGEV_NONE	SIGEV_NONE
  SIGEV_THREAD,			 
# define SIGEV_THREAD	SIGEV_THREAD

  SIGEV_THREAD_ID = 4		
 
#define SIGEV_THREAD_ID	SIGEV_THREAD_ID
};

# 68 "/usr/include/signal.h"



 
typedef void (*__sighandler_t) (int);



 
extern __sighandler_t __sysv_signal (int __sig, __sighandler_t __handler)
     __attribute__ ((__nothrow__ , __leaf__));

extern __sighandler_t sysv_signal (int __sig, __sighandler_t __handler)
     __attribute__ ((__nothrow__ , __leaf__));




 

extern __sighandler_t signal (int __sig, __sighandler_t __handler)
     __attribute__ ((__nothrow__ , __leaf__));
# 100 "/usr/include/signal.h"

# 107 "/usr/include/signal.h"



 

extern int kill (__pid_t __pid, int __sig) __attribute__ ((__nothrow__ , __leaf__));





 
extern int killpg (__pid_t __pgrp, int __sig) __attribute__ ((__nothrow__ , __leaf__));


 
extern int raise (int __sig) __attribute__ ((__nothrow__ , __leaf__));


 
extern __sighandler_t ssignal (int __sig, __sighandler_t __handler)
     __attribute__ ((__nothrow__ , __leaf__));
extern int gsignal (int __sig) __attribute__ ((__nothrow__ , __leaf__));



 
extern void psignal (int __sig, const char *__s);

 
extern void psiginfo (const siginfo_t *__pinfo, const char *__s);









 



extern int sigpause (int __sig) __asm__ ("__xpg_sigpause");
# 158 "/usr/include/signal.h"






 

 
# define sigmask(sig) ((int)(1u << ((sig) - 1)))

 
extern int sigblock (int __mask) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__deprecated__));

 
extern int sigsetmask (int __mask) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__deprecated__));

 
extern int siggetmask (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__deprecated__));




# define NSIG	_NSIG



typedef __sighandler_t sighandler_t;


 

typedef __sighandler_t sig_t;




 
extern int sigemptyset (sigset_t *__set) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int sigfillset (sigset_t *__set) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int sigaddset (sigset_t *__set, int __signo) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int sigdelset (sigset_t *__set, int __signo) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int sigismember (const sigset_t *__set, int __signo)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


 
extern int sigisemptyset (const sigset_t *__set) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int sigandset (sigset_t *__set, const sigset_t *__left,
		      const sigset_t *__right) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2, 3)));

 
extern int sigorset (sigset_t *__set, const sigset_t *__left,
		     const sigset_t *__right) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2, 3)));



 
# 1 "/usr/include/x86_64-linux-gnu/bits/sigaction.h"
















 





 
struct sigaction
  {
     

    union
      {
	 
	__sighandler_t sa_handler;
	 
	void (*sa_sigaction) (int, siginfo_t *, void *);
      }
    __sigaction_handler;
# define sa_handler	__sigaction_handler.sa_handler
# define sa_sigaction	__sigaction_handler.sa_sigaction




     
    __sigset_t sa_mask;

     
    int sa_flags;

     
    void (*sa_restorer) (void);
  };

 
#define	SA_NOCLDSTOP  1		  
#define SA_NOCLDWAIT  2		  
#define SA_SIGINFO    4		 # define SA_ONSTACK   0x08000000  





# define SA_RESTART   0x10000000  
# define SA_NODEFER   0x40000000 # define SA_RESETHAND 0x80000000  




# define SA_INTERRUPT 0x20000000  

 
# define SA_NOMASK    SA_NODEFER
# define SA_ONESHOT   SA_RESETHAND
# define SA_STACK     SA_ONSTACK


 
#define	SIG_BLOCK     0		  
#define	SIG_UNBLOCK   1		  
#define	SIG_SETMASK   2		  
# 227 "/usr/include/signal.h"

 
extern int sigprocmask (int __how, const sigset_t *__restrict __set,
			sigset_t *__restrict __oset) __attribute__ ((__nothrow__ , __leaf__));





 
extern int sigsuspend (const sigset_t *__set) __attribute__ ((__nonnull__ (1)));

 
extern int sigaction (int __sig, const struct sigaction *__restrict __act,
		      struct sigaction *__restrict __oact) __attribute__ ((__nothrow__ , __leaf__));

 
extern int sigpending (sigset_t *__set) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));






 
extern int sigwait (const sigset_t *__restrict __set, int *__restrict __sig)
     __attribute__ ((__nonnull__ (1, 2)));






 
extern int sigwaitinfo (const sigset_t *__restrict __set,
			siginfo_t *__restrict __info) __attribute__ ((__nonnull__ (1)));





 
extern int sigtimedwait (const sigset_t *__restrict __set,
			 siginfo_t *__restrict __info,
			 const struct timespec *__restrict __timeout)
     __attribute__ ((__nonnull__ (1)));


 
extern int sigqueue (__pid_t __pid, int __sig, const union sigval __val)
     __attribute__ ((__nothrow__ , __leaf__));







 
extern const char *const _sys_siglist[(64 + 1)];
extern const char *const sys_siglist[(64 + 1)];


 
# 1 "/usr/include/x86_64-linux-gnu/bits/sigcontext.h"















 


#define _BITS_SIGCONTEXT_H  1







#define FP_XSTATE_MAGIC1	0x46505853U
#define FP_XSTATE_MAGIC2	0x46505845U
#define FP_XSTATE_MAGIC2_SIZE	sizeof(FP_XSTATE_MAGIC2)

struct _fpx_sw_bytes
{
  __uint32_t magic1;
  __uint32_t extended_size;
  __uint64_t xstate_bv;
  __uint32_t xstate_size;
  __uint32_t __glibc_reserved1[7];
};

struct _fpreg
{
  unsigned short significand[4];
  unsigned short exponent;
};

struct _fpxreg
{
  unsigned short significand[4];
  unsigned short exponent;
  unsigned short __glibc_reserved1[3];
};

struct _xmmreg
{
  __uint32_t	element[4];
};



# 122 "/usr/include/x86_64-linux-gnu/bits/sigcontext.h"

struct _fpstate
{
   
  __uint16_t		cwd;
  __uint16_t		swd;
  __uint16_t		ftw;
  __uint16_t		fop;
  __uint64_t		rip;
  __uint64_t		rdp;
  __uint32_t		mxcsr;
  __uint32_t		mxcr_mask;
  struct _fpxreg	_st[8];
  struct _xmmreg	_xmm[16];
  __uint32_t		__glibc_reserved1[24];
};

struct sigcontext
{
  __uint64_t r8;
  __uint64_t r9;
  __uint64_t r10;
  __uint64_t r11;
  __uint64_t r12;
  __uint64_t r13;
  __uint64_t r14;
  __uint64_t r15;
  __uint64_t rdi;
  __uint64_t rsi;
  __uint64_t rbp;
  __uint64_t rbx;
  __uint64_t rdx;
  __uint64_t rax;
  __uint64_t rcx;
  __uint64_t rsp;
  __uint64_t rip;
  __uint64_t eflags;
  unsigned short cs;
  unsigned short gs;
  unsigned short fs;
  unsigned short __pad0;
  __uint64_t err;
  __uint64_t trapno;
  __uint64_t oldmask;
  __uint64_t cr2;
  __extension__ union
    {
      struct _fpstate * fpstate;
      __uint64_t __fpstate_word;
    };
  __uint64_t __reserved1 [8];
};



struct _xsave_hdr
{
  __uint64_t xstate_bv;
  __uint64_t __glibc_reserved1[2];
  __uint64_t __glibc_reserved2[5];
};

struct _ymmh_state
{
  __uint32_t ymmh_space[64];
};

struct _xstate
{
  struct _fpstate fpstate;
  struct _xsave_hdr xstate_hdr;
  struct _ymmh_state ymmh;
};

# 292 "/usr/include/signal.h"

 
extern int sigreturn (struct sigcontext *__scp) __attribute__ ((__nothrow__ , __leaf__));





# define __need_size_t
# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"










 





# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





















 



 








 
# 44 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 


 



 







 
# 91 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 









 
# 116 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





 

 


 
# 164 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

 


 
# 238 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#undef	__need_size_t






 


 
# 349 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

# 361 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 
 
 
# 395 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 

# 412 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#undef	__need_NULL

# 449 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

# 19 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"
# 302 "/usr/include/signal.h"

# 1 "/usr/include/x86_64-linux-gnu/bits/types/stack_t.h"
















 


#define __stack_t_defined 1

#define __need_size_t
# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"










 





# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





















 



 








 
# 44 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 


 



 







 
# 91 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 









 
# 116 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





 

 


 
# 164 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

 


 
# 238 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#undef	__need_size_t






 


 
# 349 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

# 361 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 
 
 
# 395 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 

# 412 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#undef	__need_NULL

# 449 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

# 19 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"
# 24 "/usr/include/x86_64-linux-gnu/bits/types/stack_t.h"

 
typedef struct
  {
    void *ss_sp;
    int ss_flags;
    size_t ss_size;
  } stack_t;

# 304 "/usr/include/signal.h"

 
# 1 "/usr/include/x86_64-linux-gnu/sys/ucontext.h"















 


#define _SYS_UCONTEXT_H	1









# define __ctx(fld) fld






 
__extension__ typedef long long int greg_t;

 
#define __NGREG	23

# define NGREG	__NGREG


 
typedef greg_t gregset_t[23];


 
enum
{
  REG_R8 = 0,
# define REG_R8		REG_R8
  REG_R9,
# define REG_R9		REG_R9
  REG_R10,
# define REG_R10	REG_R10
  REG_R11,
# define REG_R11	REG_R11
  REG_R12,
# define REG_R12	REG_R12
  REG_R13,
# define REG_R13	REG_R13
  REG_R14,
# define REG_R14	REG_R14
  REG_R15,
# define REG_R15	REG_R15
  REG_RDI,
# define REG_RDI	REG_RDI
  REG_RSI,
# define REG_RSI	REG_RSI
  REG_RBP,
# define REG_RBP	REG_RBP
  REG_RBX,
# define REG_RBX	REG_RBX
  REG_RDX,
# define REG_RDX	REG_RDX
  REG_RAX,
# define REG_RAX	REG_RAX
  REG_RCX,
# define REG_RCX	REG_RCX
  REG_RSP,
# define REG_RSP	REG_RSP
  REG_RIP,
# define REG_RIP	REG_RIP
  REG_EFL,
# define REG_EFL	REG_EFL
  REG_CSGSFS,		 
# define REG_CSGSFS	REG_CSGSFS
  REG_ERR,
# define REG_ERR	REG_ERR
  REG_TRAPNO,
# define REG_TRAPNO	REG_TRAPNO
  REG_OLDMASK,
# define REG_OLDMASK	REG_OLDMASK
  REG_CR2
# define REG_CR2	REG_CR2
};


struct _libc_fpxreg
{
  unsigned short int significand[4];
  unsigned short int exponent;
  unsigned short int __glibc_reserved1[3];
};

struct _libc_xmmreg
{
  __uint32_t	element[4];
};

struct _libc_fpstate
{
   
  __uint16_t		cwd;
  __uint16_t		swd;
  __uint16_t		ftw;
  __uint16_t		fop;
  __uint64_t		rip;
  __uint64_t		rdp;
  __uint32_t		mxcsr;
  __uint32_t		mxcr_mask;
  struct _libc_fpxreg	_st[8];
  struct _libc_xmmreg	_xmm[16];
  __uint32_t		__glibc_reserved1[24];
};

 
typedef struct _libc_fpstate *fpregset_t;

 
typedef struct
  {
    gregset_t gregs;
     
    fpregset_t fpregs;
    __extension__ unsigned long long __reserved1 [8];
} mcontext_t;

 
typedef struct ucontext_t
  {
    unsigned long int uc_flags;
    struct ucontext_t *uc_link;
    stack_t uc_stack;
    mcontext_t uc_mcontext;
    sigset_t uc_sigmask;
    struct _libc_fpstate __fpregs_mem;
  } ucontext_t;

# 257 "/usr/include/x86_64-linux-gnu/sys/ucontext.h"

#undef __ctx

# 307 "/usr/include/signal.h"






 
extern int siginterrupt (int __sig, int __interrupt) __attribute__ ((__nothrow__ , __leaf__));

# 1 "/usr/include/x86_64-linux-gnu/bits/sigstack.h"
















 


#define _BITS_SIGSTACK_H 1





 
#define MINSIGSTKSZ	2048

 
#define SIGSTKSZ	8192

# 317 "/usr/include/signal.h"
# 1 "/usr/include/x86_64-linux-gnu/bits/ss_flags.h"
















 


#define _BITS_SS_FLAGS_H 1





 
enum
{
  SS_ONSTACK = 1,
#define SS_ONSTACK	SS_ONSTACK
  SS_DISABLE
#define SS_DISABLE	SS_DISABLE
};

# 318 "/usr/include/signal.h"


 
extern int sigaltstack (const stack_t *__restrict __ss,
			stack_t *__restrict __oss) __attribute__ ((__nothrow__ , __leaf__));


# 1 "/usr/include/x86_64-linux-gnu/bits/types/struct_sigstack.h"
















 


#define __sigstack_defined 1

 
struct sigstack
  {
    void *ss_sp;		 
    int ss_onstack;		 
  };

# 328 "/usr/include/signal.h"






 
extern int sigstack (struct sigstack *__ss, struct sigstack *__oss)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__deprecated__));



 

 
extern int sighold (int __sig) __attribute__ ((__nothrow__ , __leaf__));

 
extern int sigrelse (int __sig) __attribute__ ((__nothrow__ , __leaf__));

 
extern int sigignore (int __sig) __attribute__ ((__nothrow__ , __leaf__));

 
extern __sighandler_t sigset (int __sig, __sighandler_t __disp) __attribute__ ((__nothrow__ , __leaf__));




 
# 1 "/usr/include/x86_64-linux-gnu/bits/sigthread.h"
















 


#define _BITS_SIGTHREAD_H	1





 



 
extern int pthread_sigmask (int __how,
			    const __sigset_t *__restrict __newmask,
			    __sigset_t *__restrict __oldmask)__attribute__ ((__nothrow__ , __leaf__));

 
extern int pthread_kill (pthread_t __threadid, int __signo) __attribute__ ((__nothrow__ , __leaf__));


 
extern int pthread_sigqueue (pthread_t __threadid, int __signo,
			     const union sigval __value) __attribute__ ((__nothrow__ , __leaf__));


# 360 "/usr/include/signal.h"



 

 
extern int __libc_current_sigrtmin (void) __attribute__ ((__nothrow__ , __leaf__));
 
extern int __libc_current_sigrtmax (void) __attribute__ ((__nothrow__ , __leaf__));

#define SIGRTMIN        (__libc_current_sigrtmin ())
#define SIGRTMAX        (__libc_current_sigrtmax ())



# 38 "redis-cli.c"
# 1 "/usr/include/unistd.h"















 



 


#define	_UNISTD_H	1






 


 
# define _POSIX_VERSION	200809L
# 48 "/usr/include/unistd.h"


 


# define __POSIX2_THIS_VERSION	200809L
 
# 65 "/usr/include/unistd.h"

 
#define _POSIX2_VERSION	__POSIX2_THIS_VERSION

 
#define	_POSIX2_C_VERSION	__POSIX2_THIS_VERSION


 
#define	_POSIX2_C_BIND	__POSIX2_THIS_VERSION


 
#define	_POSIX2_C_DEV	__POSIX2_THIS_VERSION


 
#define	_POSIX2_SW_DEV	__POSIX2_THIS_VERSION


 
#define _POSIX2_LOCALEDEF       __POSIX2_THIS_VERSION

 

# define _XOPEN_VERSION	700
# 98 "/usr/include/unistd.h"

 
#define _XOPEN_XCU_VERSION	4

 
#define _XOPEN_XPG2	1
#define _XOPEN_XPG3	1
#define _XOPEN_XPG4	1

 
#define _XOPEN_UNIX	1

 
#define	_XOPEN_CRYPT	1


 
#define	_XOPEN_ENH_I18N	1

 
#define _XOPEN_LEGACY	1




















































































 

# 1 "/usr/include/x86_64-linux-gnu/bits/posix_opt.h"
















 


#define	_BITS_POSIX_OPT_H	1

 
#define	_POSIX_JOB_CONTROL	1

 
#define	_POSIX_SAVED_IDS	1

 
#define	_POSIX_PRIORITY_SCHEDULING	200809L

 
#define	_POSIX_SYNCHRONIZED_IO	200809L

 
#define	_POSIX_FSYNC	200809L

 
#define	_POSIX_MAPPED_FILES	200809L

 
#define	_POSIX_MEMLOCK	200809L

 
#define	_POSIX_MEMLOCK_RANGE	200809L

 
#define	_POSIX_MEMORY_PROTECTION	200809L

 
#define	_POSIX_CHOWN_RESTRICTED	0


 
#define	_POSIX_VDISABLE	'\0'

 
#define	_POSIX_NO_TRUNC	1

 
#define _XOPEN_REALTIME	1

 
#define _XOPEN_REALTIME_THREADS	1

 
#define	_XOPEN_SHM	1

 
#define _POSIX_THREADS	200809L

 
#define _POSIX_REENTRANT_FUNCTIONS      1
#define _POSIX_THREAD_SAFE_FUNCTIONS	200809L

 
#define _POSIX_THREAD_PRIORITY_SCHEDULING	200809L

 
#define _POSIX_THREAD_ATTR_STACKSIZE	200809L

 
#define _POSIX_THREAD_ATTR_STACKADDR	200809L

 
#define _POSIX_THREAD_PRIO_INHERIT	200809L


 
#define _POSIX_THREAD_PRIO_PROTECT	200809L


 
# define _POSIX_THREAD_ROBUST_PRIO_INHERIT	200809L

 
# define _POSIX_THREAD_ROBUST_PRIO_PROTECT	-1


 
#define _POSIX_SEMAPHORES	200809L

 
#define _POSIX_REALTIME_SIGNALS	200809L

 
#define _POSIX_ASYNCHRONOUS_IO	200809L
#define _POSIX_ASYNC_IO		1
 
#define _LFS_ASYNCHRONOUS_IO	1
 
#define _POSIX_PRIORITIZED_IO	200809L

 
#define _LFS64_ASYNCHRONOUS_IO	1

 
#define _LFS_LARGEFILE		1
#define _LFS64_LARGEFILE	1
#define _LFS64_STDIO		1

 
#define _POSIX_SHARED_MEMORY_OBJECTS	200809L

 
#define _POSIX_CPUTIME	0

 
#define _POSIX_THREAD_CPUTIME	0

 
#define _POSIX_REGEXP	1

 
#define _POSIX_READER_WRITER_LOCKS	200809L

 
#define _POSIX_SHELL	1

 
#define _POSIX_TIMEOUTS	200809L

 
#define _POSIX_SPIN_LOCKS	200809L

 
#define _POSIX_SPAWN	200809L

 
#define _POSIX_TIMERS	200809L

 
#define _POSIX_BARRIERS	200809L

 
#define	_POSIX_MESSAGE_PASSING	200809L

 
#define _POSIX_THREAD_PROCESS_SHARED	200809L

 
#define _POSIX_MONOTONIC_CLOCK	0

 
#define _POSIX_CLOCK_SELECTION	200809L

 
#define _POSIX_ADVISORY_INFO	200809L

 
#define _POSIX_IPV6	200809L

 
#define _POSIX_RAW_SOCKETS	200809L

 
#define _POSIX2_CHAR_TERM	200809L

 
#define _POSIX_SPORADIC_SERVER	-1
#define _POSIX_THREAD_SPORADIC_SERVER	-1

 
#define _POSIX_TRACE	-1
#define _POSIX_TRACE_EVENT_FILTER	-1
#define _POSIX_TRACE_INHERIT	-1
#define _POSIX_TRACE_LOG	-1

 
#define _POSIX_TYPED_MEMORY_OBJECTS	-1

# 206 "/usr/include/unistd.h"

 
# 1 "/usr/include/x86_64-linux-gnu/bits/environments.h"















 





# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
 


# define __WORDSIZE	64







# define __WORDSIZE_TIME64_COMPAT32	1
 
# define __SYSCALL_WORDSIZE		64
# 23 "/usr/include/x86_64-linux-gnu/bits/environments.h"

















 











 


 
# define _POSIX_V7_LPBIG_OFFBIG	-1
# define _POSIX_V6_LPBIG_OFFBIG	-1
# define _XBS5_LPBIG_OFFBIG	-1

 
# define _POSIX_V7_LP64_OFF64	1
# define _POSIX_V6_LP64_OFF64	1
# define _XBS5_LP64_OFF64	1

# 94 "/usr/include/x86_64-linux-gnu/bits/environments.h"

#define __ILP32_OFF32_CFLAGS	"-m32"
#define __ILP32_OFF32_LDFLAGS	"-m32"




# define __ILP32_OFFBIG_CFLAGS	"-m32 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
# define __ILP32_OFFBIG_LDFLAGS	"-m32"

#define __LP64_OFF64_CFLAGS	"-m64"
#define __LP64_OFF64_LDFLAGS	"-m64"
# 210 "/usr/include/unistd.h"


 
#define	STDIN_FILENO	0	 
#define	STDOUT_FILENO	1	 
#define	STDERR_FILENO	2	 


 








#define	__need_size_t
#define __need_NULL
# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"










 





# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





















 



 








 
# 44 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 


 



 







 
# 91 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 









 
# 116 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





 

 


 
# 164 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

 


 
# 238 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#undef	__need_size_t






 


 
# 349 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

# 361 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 
 
 
# 395 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 


#undef NULL		 




#define NULL ((void *)0)





#undef	__need_NULL

# 449 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

# 19 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"
# 230 "/usr/include/unistd.h"



 










# 256 "/usr/include/unistd.h"














typedef __intptr_t intptr_t;
#  define __intptr_t_defined





typedef __socklen_t socklen_t;
#  define __socklen_t_defined




 
#define	R_OK	4		 
#define	W_OK	2		 
#define	X_OK	1		 
#define	F_OK	0		 

 
extern int access (const char *__name, int __type) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



 
extern int euidaccess (const char *__name, int __type)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int eaccess (const char *__name, int __type)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





 
extern int faccessat (int __fd, const char *__file, int __type, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2))) __attribute__ ((__warn_unused_result__));



 
# 322 "/usr/include/unistd.h"


 
# define L_SET		SEEK_SET
# define L_INCR		SEEK_CUR
# define L_XTND		SEEK_END







 




extern __off64_t lseek (int __fd, __off64_t __offset, int __whence) __asm__ ("" "lseek64") __attribute__ ((__nothrow__ , __leaf__));
# 348 "/usr/include/unistd.h"
extern __off64_t lseek64 (int __fd, __off64_t __offset, int __whence)
     __attribute__ ((__nothrow__ , __leaf__));





 
extern int close (int __fd);





 
extern ssize_t read (int __fd, void *__buf, size_t __nbytes) __attribute__ ((__warn_unused_result__));




 
extern ssize_t write (int __fd, const void *__buf, size_t __n) __attribute__ ((__warn_unused_result__));

# 391 "/usr/include/unistd.h"
extern ssize_t pread (int __fd, void *__buf, size_t __nbytes, __off64_t __offset) __asm__ ("" "pread64") __attribute__ ((__warn_unused_result__));


extern ssize_t pwrite (int __fd, const void *__buf, size_t __nbytes, __off64_t __offset) __asm__ ("" "pwrite64") __attribute__ ((__warn_unused_result__));
# 402 "/usr/include/unistd.h"




 
extern ssize_t pread64 (int __fd, void *__buf, size_t __nbytes,
			__off64_t __offset) __attribute__ ((__warn_unused_result__));

 
extern ssize_t pwrite64 (int __fd, const void *__buf, size_t __n,
			 __off64_t __offset) __attribute__ ((__warn_unused_result__));






 
extern int pipe (int __pipedes[2]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));



 
extern int pipe2 (int __pipedes[2], int __flags) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));








 
extern unsigned int alarm (unsigned int __seconds) __attribute__ ((__nothrow__ , __leaf__));










 
extern unsigned int sleep (unsigned int __seconds);






 
extern __useconds_t ualarm (__useconds_t __value, __useconds_t __interval)
     __attribute__ ((__nothrow__ , __leaf__));





 
extern int usleep (__useconds_t __useconds);







 
extern int pause (void);


 
extern int chown (const char *__file, __uid_t __owner, __gid_t __group)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));


 
extern int fchown (int __fd, __uid_t __owner, __gid_t __group) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));



 
extern int lchown (const char *__file, __uid_t __owner, __gid_t __group)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));





 
extern int fchownat (int __fd, const char *__file, __uid_t __owner,
		     __gid_t __group, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2))) __attribute__ ((__warn_unused_result__));


 
extern int chdir (const char *__path) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));


 
extern int fchdir (int __fd) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));








 
extern char *getcwd (char *__buf, size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));




 
extern char *get_current_dir_name (void) __attribute__ ((__nothrow__ , __leaf__));






 
extern char *getwd (char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__deprecated__)) __attribute__ ((__warn_unused_result__));



 
extern int dup (int __fd) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));

 
extern int dup2 (int __fd, int __fd2) __attribute__ ((__nothrow__ , __leaf__));



 
extern int dup3 (int __fd, int __fd2, int __flags) __attribute__ ((__nothrow__ , __leaf__));


 
extern char **__environ;

extern char **environ;




 
extern int execve (const char *__path, char *const __argv[],
		   char *const __envp[]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



 
extern int fexecve (int __fd, char *const __argv[], char *const __envp[])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));



 
extern int execv (const char *__path, char *const __argv[])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


 
extern int execle (const char *__path, const char *__arg, ...)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


 
extern int execl (const char *__path, const char *__arg, ...)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


 
extern int execvp (const char *__file, char *const __argv[])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



 
extern int execlp (const char *__file, const char *__arg, ...)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



 
extern int execvpe (const char *__file, char *const __argv[],
		    char *const __envp[])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




 
extern int nice (int __inc) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));



 
extern void _exit (int __status) __attribute__ ((__noreturn__));




 
# 1 "/usr/include/x86_64-linux-gnu/bits/confname.h"
















 





 
enum
  {
    _PC_LINK_MAX,
#define	_PC_LINK_MAX			_PC_LINK_MAX
    _PC_MAX_CANON,
#define	_PC_MAX_CANON			_PC_MAX_CANON
    _PC_MAX_INPUT,
#define	_PC_MAX_INPUT			_PC_MAX_INPUT
    _PC_NAME_MAX,
#define	_PC_NAME_MAX			_PC_NAME_MAX
    _PC_PATH_MAX,
#define	_PC_PATH_MAX			_PC_PATH_MAX
    _PC_PIPE_BUF,
#define	_PC_PIPE_BUF			_PC_PIPE_BUF
    _PC_CHOWN_RESTRICTED,
#define	_PC_CHOWN_RESTRICTED		_PC_CHOWN_RESTRICTED
    _PC_NO_TRUNC,
#define	_PC_NO_TRUNC			_PC_NO_TRUNC
    _PC_VDISABLE,
#define _PC_VDISABLE			_PC_VDISABLE
    _PC_SYNC_IO,
#define	_PC_SYNC_IO			_PC_SYNC_IO
    _PC_ASYNC_IO,
#define	_PC_ASYNC_IO			_PC_ASYNC_IO
    _PC_PRIO_IO,
#define	_PC_PRIO_IO			_PC_PRIO_IO
    _PC_SOCK_MAXBUF,
#define	_PC_SOCK_MAXBUF			_PC_SOCK_MAXBUF
    _PC_FILESIZEBITS,
#define _PC_FILESIZEBITS		_PC_FILESIZEBITS
    _PC_REC_INCR_XFER_SIZE,
#define _PC_REC_INCR_XFER_SIZE		_PC_REC_INCR_XFER_SIZE
    _PC_REC_MAX_XFER_SIZE,
#define _PC_REC_MAX_XFER_SIZE		_PC_REC_MAX_XFER_SIZE
    _PC_REC_MIN_XFER_SIZE,
#define _PC_REC_MIN_XFER_SIZE		_PC_REC_MIN_XFER_SIZE
    _PC_REC_XFER_ALIGN,
#define _PC_REC_XFER_ALIGN		_PC_REC_XFER_ALIGN
    _PC_ALLOC_SIZE_MIN,
#define _PC_ALLOC_SIZE_MIN		_PC_ALLOC_SIZE_MIN
    _PC_SYMLINK_MAX,
#define _PC_SYMLINK_MAX			_PC_SYMLINK_MAX
    _PC_2_SYMLINKS
#define _PC_2_SYMLINKS			_PC_2_SYMLINKS
  };

 
enum
  {
    _SC_ARG_MAX,
#define	_SC_ARG_MAX			_SC_ARG_MAX
    _SC_CHILD_MAX,
#define	_SC_CHILD_MAX			_SC_CHILD_MAX
    _SC_CLK_TCK,
#define	_SC_CLK_TCK			_SC_CLK_TCK
    _SC_NGROUPS_MAX,
#define	_SC_NGROUPS_MAX			_SC_NGROUPS_MAX
    _SC_OPEN_MAX,
#define	_SC_OPEN_MAX			_SC_OPEN_MAX
    _SC_STREAM_MAX,
#define	_SC_STREAM_MAX			_SC_STREAM_MAX
    _SC_TZNAME_MAX,
#define	_SC_TZNAME_MAX			_SC_TZNAME_MAX
    _SC_JOB_CONTROL,
#define	_SC_JOB_CONTROL			_SC_JOB_CONTROL
    _SC_SAVED_IDS,
#define	_SC_SAVED_IDS			_SC_SAVED_IDS
    _SC_REALTIME_SIGNALS,
#define	_SC_REALTIME_SIGNALS		_SC_REALTIME_SIGNALS
    _SC_PRIORITY_SCHEDULING,
#define	_SC_PRIORITY_SCHEDULING		_SC_PRIORITY_SCHEDULING
    _SC_TIMERS,
#define	_SC_TIMERS			_SC_TIMERS
    _SC_ASYNCHRONOUS_IO,
#define	_SC_ASYNCHRONOUS_IO		_SC_ASYNCHRONOUS_IO
    _SC_PRIORITIZED_IO,
#define	_SC_PRIORITIZED_IO		_SC_PRIORITIZED_IO
    _SC_SYNCHRONIZED_IO,
#define	_SC_SYNCHRONIZED_IO		_SC_SYNCHRONIZED_IO
    _SC_FSYNC,
#define	_SC_FSYNC			_SC_FSYNC
    _SC_MAPPED_FILES,
#define	_SC_MAPPED_FILES		_SC_MAPPED_FILES
    _SC_MEMLOCK,
#define	_SC_MEMLOCK			_SC_MEMLOCK
    _SC_MEMLOCK_RANGE,
#define	_SC_MEMLOCK_RANGE		_SC_MEMLOCK_RANGE
    _SC_MEMORY_PROTECTION,
#define	_SC_MEMORY_PROTECTION		_SC_MEMORY_PROTECTION
    _SC_MESSAGE_PASSING,
#define	_SC_MESSAGE_PASSING		_SC_MESSAGE_PASSING
    _SC_SEMAPHORES,
#define	_SC_SEMAPHORES			_SC_SEMAPHORES
    _SC_SHARED_MEMORY_OBJECTS,
#define	_SC_SHARED_MEMORY_OBJECTS	_SC_SHARED_MEMORY_OBJECTS
    _SC_AIO_LISTIO_MAX,
#define	_SC_AIO_LISTIO_MAX		_SC_AIO_LISTIO_MAX
    _SC_AIO_MAX,
#define	_SC_AIO_MAX			_SC_AIO_MAX
    _SC_AIO_PRIO_DELTA_MAX,
#define	_SC_AIO_PRIO_DELTA_MAX		_SC_AIO_PRIO_DELTA_MAX
    _SC_DELAYTIMER_MAX,
#define	_SC_DELAYTIMER_MAX		_SC_DELAYTIMER_MAX
    _SC_MQ_OPEN_MAX,
#define	_SC_MQ_OPEN_MAX			_SC_MQ_OPEN_MAX
    _SC_MQ_PRIO_MAX,
#define	_SC_MQ_PRIO_MAX			_SC_MQ_PRIO_MAX
    _SC_VERSION,
#define	_SC_VERSION			_SC_VERSION
    _SC_PAGESIZE,
#define	_SC_PAGESIZE			_SC_PAGESIZE
#define	_SC_PAGE_SIZE			_SC_PAGESIZE
    _SC_RTSIG_MAX,
#define	_SC_RTSIG_MAX			_SC_RTSIG_MAX
    _SC_SEM_NSEMS_MAX,
#define	_SC_SEM_NSEMS_MAX		_SC_SEM_NSEMS_MAX
    _SC_SEM_VALUE_MAX,
#define	_SC_SEM_VALUE_MAX		_SC_SEM_VALUE_MAX
    _SC_SIGQUEUE_MAX,
#define	_SC_SIGQUEUE_MAX		_SC_SIGQUEUE_MAX
    _SC_TIMER_MAX,
#define	_SC_TIMER_MAX			_SC_TIMER_MAX

    
 
    _SC_BC_BASE_MAX,
#define	_SC_BC_BASE_MAX			_SC_BC_BASE_MAX
    _SC_BC_DIM_MAX,
#define	_SC_BC_DIM_MAX			_SC_BC_DIM_MAX
    _SC_BC_SCALE_MAX,
#define	_SC_BC_SCALE_MAX		_SC_BC_SCALE_MAX
    _SC_BC_STRING_MAX,
#define	_SC_BC_STRING_MAX		_SC_BC_STRING_MAX
    _SC_COLL_WEIGHTS_MAX,
#define	_SC_COLL_WEIGHTS_MAX		_SC_COLL_WEIGHTS_MAX
    _SC_EQUIV_CLASS_MAX,
#define	_SC_EQUIV_CLASS_MAX		_SC_EQUIV_CLASS_MAX
    _SC_EXPR_NEST_MAX,
#define	_SC_EXPR_NEST_MAX		_SC_EXPR_NEST_MAX
    _SC_LINE_MAX,
#define	_SC_LINE_MAX			_SC_LINE_MAX
    _SC_RE_DUP_MAX,
#define	_SC_RE_DUP_MAX			_SC_RE_DUP_MAX
    _SC_CHARCLASS_NAME_MAX,
#define	_SC_CHARCLASS_NAME_MAX		_SC_CHARCLASS_NAME_MAX

    _SC_2_VERSION,
#define	_SC_2_VERSION			_SC_2_VERSION
    _SC_2_C_BIND,
#define	_SC_2_C_BIND			_SC_2_C_BIND
    _SC_2_C_DEV,
#define	_SC_2_C_DEV			_SC_2_C_DEV
    _SC_2_FORT_DEV,
#define	_SC_2_FORT_DEV			_SC_2_FORT_DEV
    _SC_2_FORT_RUN,
#define	_SC_2_FORT_RUN			_SC_2_FORT_RUN
    _SC_2_SW_DEV,
#define	_SC_2_SW_DEV			_SC_2_SW_DEV
    _SC_2_LOCALEDEF,
#define	_SC_2_LOCALEDEF			_SC_2_LOCALEDEF

    _SC_PII,
#define	_SC_PII				_SC_PII
    _SC_PII_XTI,
#define	_SC_PII_XTI			_SC_PII_XTI
    _SC_PII_SOCKET,
#define	_SC_PII_SOCKET			_SC_PII_SOCKET
    _SC_PII_INTERNET,
#define	_SC_PII_INTERNET		_SC_PII_INTERNET
    _SC_PII_OSI,
#define	_SC_PII_OSI			_SC_PII_OSI
    _SC_POLL,
#define	_SC_POLL			_SC_POLL
    _SC_SELECT,
#define	_SC_SELECT			_SC_SELECT
    _SC_UIO_MAXIOV,
#define	_SC_UIO_MAXIOV			_SC_UIO_MAXIOV
    _SC_IOV_MAX = _SC_UIO_MAXIOV,
#define _SC_IOV_MAX			_SC_IOV_MAX
    _SC_PII_INTERNET_STREAM,
#define	_SC_PII_INTERNET_STREAM		_SC_PII_INTERNET_STREAM
    _SC_PII_INTERNET_DGRAM,
#define	_SC_PII_INTERNET_DGRAM		_SC_PII_INTERNET_DGRAM
    _SC_PII_OSI_COTS,
#define	_SC_PII_OSI_COTS		_SC_PII_OSI_COTS
    _SC_PII_OSI_CLTS,
#define	_SC_PII_OSI_CLTS		_SC_PII_OSI_CLTS
    _SC_PII_OSI_M,
#define	_SC_PII_OSI_M			_SC_PII_OSI_M
    _SC_T_IOV_MAX,
#define	_SC_T_IOV_MAX			_SC_T_IOV_MAX

     
    _SC_THREADS,
#define	_SC_THREADS			_SC_THREADS
    _SC_THREAD_SAFE_FUNCTIONS,
#define _SC_THREAD_SAFE_FUNCTIONS	_SC_THREAD_SAFE_FUNCTIONS
    _SC_GETGR_R_SIZE_MAX,
#define	_SC_GETGR_R_SIZE_MAX		_SC_GETGR_R_SIZE_MAX
    _SC_GETPW_R_SIZE_MAX,
#define	_SC_GETPW_R_SIZE_MAX		_SC_GETPW_R_SIZE_MAX
    _SC_LOGIN_NAME_MAX,
#define	_SC_LOGIN_NAME_MAX		_SC_LOGIN_NAME_MAX
    _SC_TTY_NAME_MAX,
#define	_SC_TTY_NAME_MAX		_SC_TTY_NAME_MAX
    _SC_THREAD_DESTRUCTOR_ITERATIONS,
#define	_SC_THREAD_DESTRUCTOR_ITERATIONS _SC_THREAD_DESTRUCTOR_ITERATIONS
    _SC_THREAD_KEYS_MAX,
#define	_SC_THREAD_KEYS_MAX		_SC_THREAD_KEYS_MAX
    _SC_THREAD_STACK_MIN,
#define	_SC_THREAD_STACK_MIN		_SC_THREAD_STACK_MIN
    _SC_THREAD_THREADS_MAX,
#define	_SC_THREAD_THREADS_MAX		_SC_THREAD_THREADS_MAX
    _SC_THREAD_ATTR_STACKADDR,
#define	_SC_THREAD_ATTR_STACKADDR	_SC_THREAD_ATTR_STACKADDR
    _SC_THREAD_ATTR_STACKSIZE,
#define	_SC_THREAD_ATTR_STACKSIZE	_SC_THREAD_ATTR_STACKSIZE
    _SC_THREAD_PRIORITY_SCHEDULING,
#define	_SC_THREAD_PRIORITY_SCHEDULING	_SC_THREAD_PRIORITY_SCHEDULING
    _SC_THREAD_PRIO_INHERIT,
#define	_SC_THREAD_PRIO_INHERIT		_SC_THREAD_PRIO_INHERIT
    _SC_THREAD_PRIO_PROTECT,
#define	_SC_THREAD_PRIO_PROTECT		_SC_THREAD_PRIO_PROTECT
    _SC_THREAD_PROCESS_SHARED,
#define	_SC_THREAD_PROCESS_SHARED	_SC_THREAD_PROCESS_SHARED

    _SC_NPROCESSORS_CONF,
#define _SC_NPROCESSORS_CONF		_SC_NPROCESSORS_CONF
    _SC_NPROCESSORS_ONLN,
#define _SC_NPROCESSORS_ONLN		_SC_NPROCESSORS_ONLN
    _SC_PHYS_PAGES,
#define _SC_PHYS_PAGES			_SC_PHYS_PAGES
    _SC_AVPHYS_PAGES,
#define _SC_AVPHYS_PAGES		_SC_AVPHYS_PAGES
    _SC_ATEXIT_MAX,
#define _SC_ATEXIT_MAX			_SC_ATEXIT_MAX
    _SC_PASS_MAX,
#define _SC_PASS_MAX			_SC_PASS_MAX

    _SC_XOPEN_VERSION,
#define _SC_XOPEN_VERSION		_SC_XOPEN_VERSION
    _SC_XOPEN_XCU_VERSION,
#define _SC_XOPEN_XCU_VERSION		_SC_XOPEN_XCU_VERSION
    _SC_XOPEN_UNIX,
#define _SC_XOPEN_UNIX			_SC_XOPEN_UNIX
    _SC_XOPEN_CRYPT,
#define _SC_XOPEN_CRYPT			_SC_XOPEN_CRYPT
    _SC_XOPEN_ENH_I18N,
#define _SC_XOPEN_ENH_I18N		_SC_XOPEN_ENH_I18N
    _SC_XOPEN_SHM,
#define _SC_XOPEN_SHM			_SC_XOPEN_SHM

    _SC_2_CHAR_TERM,
#define _SC_2_CHAR_TERM			_SC_2_CHAR_TERM
    _SC_2_C_VERSION,
#define _SC_2_C_VERSION			_SC_2_C_VERSION
    _SC_2_UPE,
#define _SC_2_UPE			_SC_2_UPE

    _SC_XOPEN_XPG2,
#define _SC_XOPEN_XPG2			_SC_XOPEN_XPG2
    _SC_XOPEN_XPG3,
#define _SC_XOPEN_XPG3			_SC_XOPEN_XPG3
    _SC_XOPEN_XPG4,
#define _SC_XOPEN_XPG4			_SC_XOPEN_XPG4

    _SC_CHAR_BIT,
#define	_SC_CHAR_BIT			_SC_CHAR_BIT
    _SC_CHAR_MAX,
#define	_SC_CHAR_MAX			_SC_CHAR_MAX
    _SC_CHAR_MIN,
#define	_SC_CHAR_MIN			_SC_CHAR_MIN
    _SC_INT_MAX,
#define	_SC_INT_MAX			_SC_INT_MAX
    _SC_INT_MIN,
#define	_SC_INT_MIN			_SC_INT_MIN
    _SC_LONG_BIT,
#define	_SC_LONG_BIT			_SC_LONG_BIT
    _SC_WORD_BIT,
#define	_SC_WORD_BIT			_SC_WORD_BIT
    _SC_MB_LEN_MAX,
#define	_SC_MB_LEN_MAX			_SC_MB_LEN_MAX
    _SC_NZERO,
#define	_SC_NZERO			_SC_NZERO
    _SC_SSIZE_MAX,
#define	_SC_SSIZE_MAX			_SC_SSIZE_MAX
    _SC_SCHAR_MAX,
#define	_SC_SCHAR_MAX			_SC_SCHAR_MAX
    _SC_SCHAR_MIN,
#define	_SC_SCHAR_MIN			_SC_SCHAR_MIN
    _SC_SHRT_MAX,
#define	_SC_SHRT_MAX			_SC_SHRT_MAX
    _SC_SHRT_MIN,
#define	_SC_SHRT_MIN			_SC_SHRT_MIN
    _SC_UCHAR_MAX,
#define	_SC_UCHAR_MAX			_SC_UCHAR_MAX
    _SC_UINT_MAX,
#define	_SC_UINT_MAX			_SC_UINT_MAX
    _SC_ULONG_MAX,
#define	_SC_ULONG_MAX			_SC_ULONG_MAX
    _SC_USHRT_MAX,
#define	_SC_USHRT_MAX			_SC_USHRT_MAX

    _SC_NL_ARGMAX,
#define	_SC_NL_ARGMAX			_SC_NL_ARGMAX
    _SC_NL_LANGMAX,
#define	_SC_NL_LANGMAX			_SC_NL_LANGMAX
    _SC_NL_MSGMAX,
#define	_SC_NL_MSGMAX			_SC_NL_MSGMAX
    _SC_NL_NMAX,
#define	_SC_NL_NMAX			_SC_NL_NMAX
    _SC_NL_SETMAX,
#define	_SC_NL_SETMAX			_SC_NL_SETMAX
    _SC_NL_TEXTMAX,
#define	_SC_NL_TEXTMAX			_SC_NL_TEXTMAX

    _SC_XBS5_ILP32_OFF32,
#define _SC_XBS5_ILP32_OFF32		_SC_XBS5_ILP32_OFF32
    _SC_XBS5_ILP32_OFFBIG,
#define _SC_XBS5_ILP32_OFFBIG		_SC_XBS5_ILP32_OFFBIG
    _SC_XBS5_LP64_OFF64,
#define _SC_XBS5_LP64_OFF64		_SC_XBS5_LP64_OFF64
    _SC_XBS5_LPBIG_OFFBIG,
#define _SC_XBS5_LPBIG_OFFBIG		_SC_XBS5_LPBIG_OFFBIG

    _SC_XOPEN_LEGACY,
#define _SC_XOPEN_LEGACY		_SC_XOPEN_LEGACY
    _SC_XOPEN_REALTIME,
#define _SC_XOPEN_REALTIME		_SC_XOPEN_REALTIME
    _SC_XOPEN_REALTIME_THREADS,
#define _SC_XOPEN_REALTIME_THREADS	_SC_XOPEN_REALTIME_THREADS

    _SC_ADVISORY_INFO,
#define _SC_ADVISORY_INFO		_SC_ADVISORY_INFO
    _SC_BARRIERS,
#define _SC_BARRIERS			_SC_BARRIERS
    _SC_BASE,
#define _SC_BASE			_SC_BASE
    _SC_C_LANG_SUPPORT,
#define _SC_C_LANG_SUPPORT		_SC_C_LANG_SUPPORT
    _SC_C_LANG_SUPPORT_R,
#define _SC_C_LANG_SUPPORT_R		_SC_C_LANG_SUPPORT_R
    _SC_CLOCK_SELECTION,
#define _SC_CLOCK_SELECTION		_SC_CLOCK_SELECTION
    _SC_CPUTIME,
#define _SC_CPUTIME			_SC_CPUTIME
    _SC_THREAD_CPUTIME,
#define _SC_THREAD_CPUTIME		_SC_THREAD_CPUTIME
    _SC_DEVICE_IO,
#define _SC_DEVICE_IO			_SC_DEVICE_IO
    _SC_DEVICE_SPECIFIC,
#define _SC_DEVICE_SPECIFIC		_SC_DEVICE_SPECIFIC
    _SC_DEVICE_SPECIFIC_R,
#define _SC_DEVICE_SPECIFIC_R		_SC_DEVICE_SPECIFIC_R
    _SC_FD_MGMT,
#define _SC_FD_MGMT			_SC_FD_MGMT
    _SC_FIFO,
#define _SC_FIFO			_SC_FIFO
    _SC_PIPE,
#define _SC_PIPE			_SC_PIPE
    _SC_FILE_ATTRIBUTES,
#define _SC_FILE_ATTRIBUTES		_SC_FILE_ATTRIBUTES
    _SC_FILE_LOCKING,
#define _SC_FILE_LOCKING		_SC_FILE_LOCKING
    _SC_FILE_SYSTEM,
#define _SC_FILE_SYSTEM			_SC_FILE_SYSTEM
    _SC_MONOTONIC_CLOCK,
#define _SC_MONOTONIC_CLOCK		_SC_MONOTONIC_CLOCK
    _SC_MULTI_PROCESS,
#define _SC_MULTI_PROCESS		_SC_MULTI_PROCESS
    _SC_SINGLE_PROCESS,
#define _SC_SINGLE_PROCESS		_SC_SINGLE_PROCESS
    _SC_NETWORKING,
#define _SC_NETWORKING			_SC_NETWORKING
    _SC_READER_WRITER_LOCKS,
#define _SC_READER_WRITER_LOCKS		_SC_READER_WRITER_LOCKS
    _SC_SPIN_LOCKS,
#define _SC_SPIN_LOCKS			_SC_SPIN_LOCKS
    _SC_REGEXP,
#define _SC_REGEXP			_SC_REGEXP
    _SC_REGEX_VERSION,
#define _SC_REGEX_VERSION		_SC_REGEX_VERSION
    _SC_SHELL,
#define _SC_SHELL			_SC_SHELL
    _SC_SIGNALS,
#define _SC_SIGNALS			_SC_SIGNALS
    _SC_SPAWN,
#define _SC_SPAWN			_SC_SPAWN
    _SC_SPORADIC_SERVER,
#define _SC_SPORADIC_SERVER		_SC_SPORADIC_SERVER
    _SC_THREAD_SPORADIC_SERVER,
#define _SC_THREAD_SPORADIC_SERVER	_SC_THREAD_SPORADIC_SERVER
    _SC_SYSTEM_DATABASE,
#define _SC_SYSTEM_DATABASE		_SC_SYSTEM_DATABASE
    _SC_SYSTEM_DATABASE_R,
#define _SC_SYSTEM_DATABASE_R		_SC_SYSTEM_DATABASE_R
    _SC_TIMEOUTS,
#define _SC_TIMEOUTS			_SC_TIMEOUTS
    _SC_TYPED_MEMORY_OBJECTS,
#define _SC_TYPED_MEMORY_OBJECTS	_SC_TYPED_MEMORY_OBJECTS
    _SC_USER_GROUPS,
#define _SC_USER_GROUPS			_SC_USER_GROUPS
    _SC_USER_GROUPS_R,
#define _SC_USER_GROUPS_R		_SC_USER_GROUPS_R
    _SC_2_PBS,
#define _SC_2_PBS			_SC_2_PBS
    _SC_2_PBS_ACCOUNTING,
#define _SC_2_PBS_ACCOUNTING		_SC_2_PBS_ACCOUNTING
    _SC_2_PBS_LOCATE,
#define _SC_2_PBS_LOCATE		_SC_2_PBS_LOCATE
    _SC_2_PBS_MESSAGE,
#define _SC_2_PBS_MESSAGE		_SC_2_PBS_MESSAGE
    _SC_2_PBS_TRACK,
#define _SC_2_PBS_TRACK			_SC_2_PBS_TRACK
    _SC_SYMLOOP_MAX,
#define _SC_SYMLOOP_MAX			_SC_SYMLOOP_MAX
    _SC_STREAMS,
#define _SC_STREAMS			_SC_STREAMS
    _SC_2_PBS_CHECKPOINT,
#define _SC_2_PBS_CHECKPOINT		_SC_2_PBS_CHECKPOINT

    _SC_V6_ILP32_OFF32,
#define _SC_V6_ILP32_OFF32		_SC_V6_ILP32_OFF32
    _SC_V6_ILP32_OFFBIG,
#define _SC_V6_ILP32_OFFBIG		_SC_V6_ILP32_OFFBIG
    _SC_V6_LP64_OFF64,
#define _SC_V6_LP64_OFF64		_SC_V6_LP64_OFF64
    _SC_V6_LPBIG_OFFBIG,
#define _SC_V6_LPBIG_OFFBIG		_SC_V6_LPBIG_OFFBIG

    _SC_HOST_NAME_MAX,
#define _SC_HOST_NAME_MAX		_SC_HOST_NAME_MAX
    _SC_TRACE,
#define _SC_TRACE			_SC_TRACE
    _SC_TRACE_EVENT_FILTER,
#define _SC_TRACE_EVENT_FILTER		_SC_TRACE_EVENT_FILTER
    _SC_TRACE_INHERIT,
#define _SC_TRACE_INHERIT		_SC_TRACE_INHERIT
    _SC_TRACE_LOG,
#define _SC_TRACE_LOG			_SC_TRACE_LOG

    _SC_LEVEL1_ICACHE_SIZE,
#define _SC_LEVEL1_ICACHE_SIZE		_SC_LEVEL1_ICACHE_SIZE
    _SC_LEVEL1_ICACHE_ASSOC,
#define _SC_LEVEL1_ICACHE_ASSOC		_SC_LEVEL1_ICACHE_ASSOC
    _SC_LEVEL1_ICACHE_LINESIZE,
#define _SC_LEVEL1_ICACHE_LINESIZE	_SC_LEVEL1_ICACHE_LINESIZE
    _SC_LEVEL1_DCACHE_SIZE,
#define _SC_LEVEL1_DCACHE_SIZE		_SC_LEVEL1_DCACHE_SIZE
    _SC_LEVEL1_DCACHE_ASSOC,
#define _SC_LEVEL1_DCACHE_ASSOC		_SC_LEVEL1_DCACHE_ASSOC
    _SC_LEVEL1_DCACHE_LINESIZE,
#define _SC_LEVEL1_DCACHE_LINESIZE	_SC_LEVEL1_DCACHE_LINESIZE
    _SC_LEVEL2_CACHE_SIZE,
#define _SC_LEVEL2_CACHE_SIZE		_SC_LEVEL2_CACHE_SIZE
    _SC_LEVEL2_CACHE_ASSOC,
#define _SC_LEVEL2_CACHE_ASSOC		_SC_LEVEL2_CACHE_ASSOC
    _SC_LEVEL2_CACHE_LINESIZE,
#define _SC_LEVEL2_CACHE_LINESIZE	_SC_LEVEL2_CACHE_LINESIZE
    _SC_LEVEL3_CACHE_SIZE,
#define _SC_LEVEL3_CACHE_SIZE		_SC_LEVEL3_CACHE_SIZE
    _SC_LEVEL3_CACHE_ASSOC,
#define _SC_LEVEL3_CACHE_ASSOC		_SC_LEVEL3_CACHE_ASSOC
    _SC_LEVEL3_CACHE_LINESIZE,
#define _SC_LEVEL3_CACHE_LINESIZE	_SC_LEVEL3_CACHE_LINESIZE
    _SC_LEVEL4_CACHE_SIZE,
#define _SC_LEVEL4_CACHE_SIZE		_SC_LEVEL4_CACHE_SIZE
    _SC_LEVEL4_CACHE_ASSOC,
#define _SC_LEVEL4_CACHE_ASSOC		_SC_LEVEL4_CACHE_ASSOC
    _SC_LEVEL4_CACHE_LINESIZE,
#define _SC_LEVEL4_CACHE_LINESIZE	_SC_LEVEL4_CACHE_LINESIZE
     

    _SC_IPV6 = _SC_LEVEL1_ICACHE_SIZE + 50,
#define _SC_IPV6			_SC_IPV6
    _SC_RAW_SOCKETS,
#define _SC_RAW_SOCKETS			_SC_RAW_SOCKETS

    _SC_V7_ILP32_OFF32,
#define _SC_V7_ILP32_OFF32		_SC_V7_ILP32_OFF32
    _SC_V7_ILP32_OFFBIG,
#define _SC_V7_ILP32_OFFBIG		_SC_V7_ILP32_OFFBIG
    _SC_V7_LP64_OFF64,
#define _SC_V7_LP64_OFF64		_SC_V7_LP64_OFF64
    _SC_V7_LPBIG_OFFBIG,
#define _SC_V7_LPBIG_OFFBIG		_SC_V7_LPBIG_OFFBIG

    _SC_SS_REPL_MAX,
#define _SC_SS_REPL_MAX			_SC_SS_REPL_MAX

    _SC_TRACE_EVENT_NAME_MAX,
#define _SC_TRACE_EVENT_NAME_MAX	_SC_TRACE_EVENT_NAME_MAX
    _SC_TRACE_NAME_MAX,
#define _SC_TRACE_NAME_MAX		_SC_TRACE_NAME_MAX
    _SC_TRACE_SYS_MAX,
#define _SC_TRACE_SYS_MAX		_SC_TRACE_SYS_MAX
    _SC_TRACE_USER_EVENT_MAX,
#define _SC_TRACE_USER_EVENT_MAX	_SC_TRACE_USER_EVENT_MAX

    _SC_XOPEN_STREAMS,
#define _SC_XOPEN_STREAMS		_SC_XOPEN_STREAMS

    _SC_THREAD_ROBUST_PRIO_INHERIT,
#define _SC_THREAD_ROBUST_PRIO_INHERIT	_SC_THREAD_ROBUST_PRIO_INHERIT
    _SC_THREAD_ROBUST_PRIO_PROTECT
#define _SC_THREAD_ROBUST_PRIO_PROTECT	_SC_THREAD_ROBUST_PRIO_PROTECT
  };

 
enum
  {
    _CS_PATH,			 
#define _CS_PATH		_CS_PATH

    _CS_V6_WIDTH_RESTRICTED_ENVS,
#define _CS_V6_WIDTH_RESTRICTED_ENVS	_CS_V6_WIDTH_RESTRICTED_ENVS
#define _CS_POSIX_V6_WIDTH_RESTRICTED_ENVS	_CS_V6_WIDTH_RESTRICTED_ENVS

    _CS_GNU_LIBC_VERSION,
#define _CS_GNU_LIBC_VERSION	_CS_GNU_LIBC_VERSION
    _CS_GNU_LIBPTHREAD_VERSION,
#define _CS_GNU_LIBPTHREAD_VERSION	_CS_GNU_LIBPTHREAD_VERSION

    _CS_V5_WIDTH_RESTRICTED_ENVS,
#define _CS_V5_WIDTH_RESTRICTED_ENVS	_CS_V5_WIDTH_RESTRICTED_ENVS
#define _CS_POSIX_V5_WIDTH_RESTRICTED_ENVS	_CS_V5_WIDTH_RESTRICTED_ENVS

    _CS_V7_WIDTH_RESTRICTED_ENVS,
#define _CS_V7_WIDTH_RESTRICTED_ENVS	_CS_V7_WIDTH_RESTRICTED_ENVS
#define _CS_POSIX_V7_WIDTH_RESTRICTED_ENVS	_CS_V7_WIDTH_RESTRICTED_ENVS

    _CS_LFS_CFLAGS = 1000,
#define _CS_LFS_CFLAGS	_CS_LFS_CFLAGS
    _CS_LFS_LDFLAGS,
#define _CS_LFS_LDFLAGS	_CS_LFS_LDFLAGS
    _CS_LFS_LIBS,
#define _CS_LFS_LIBS		_CS_LFS_LIBS
    _CS_LFS_LINTFLAGS,
#define _CS_LFS_LINTFLAGS	_CS_LFS_LINTFLAGS
    _CS_LFS64_CFLAGS,
#define _CS_LFS64_CFLAGS	_CS_LFS64_CFLAGS
    _CS_LFS64_LDFLAGS,
#define _CS_LFS64_LDFLAGS	_CS_LFS64_LDFLAGS
    _CS_LFS64_LIBS,
#define _CS_LFS64_LIBS	_CS_LFS64_LIBS
    _CS_LFS64_LINTFLAGS,
#define _CS_LFS64_LINTFLAGS	_CS_LFS64_LINTFLAGS

    _CS_XBS5_ILP32_OFF32_CFLAGS = 1100,
#define _CS_XBS5_ILP32_OFF32_CFLAGS _CS_XBS5_ILP32_OFF32_CFLAGS
    _CS_XBS5_ILP32_OFF32_LDFLAGS,
#define _CS_XBS5_ILP32_OFF32_LDFLAGS _CS_XBS5_ILP32_OFF32_LDFLAGS
    _CS_XBS5_ILP32_OFF32_LIBS,
#define _CS_XBS5_ILP32_OFF32_LIBS _CS_XBS5_ILP32_OFF32_LIBS
    _CS_XBS5_ILP32_OFF32_LINTFLAGS,
#define _CS_XBS5_ILP32_OFF32_LINTFLAGS _CS_XBS5_ILP32_OFF32_LINTFLAGS
    _CS_XBS5_ILP32_OFFBIG_CFLAGS,
#define _CS_XBS5_ILP32_OFFBIG_CFLAGS _CS_XBS5_ILP32_OFFBIG_CFLAGS
    _CS_XBS5_ILP32_OFFBIG_LDFLAGS,
#define _CS_XBS5_ILP32_OFFBIG_LDFLAGS _CS_XBS5_ILP32_OFFBIG_LDFLAGS
    _CS_XBS5_ILP32_OFFBIG_LIBS,
#define _CS_XBS5_ILP32_OFFBIG_LIBS _CS_XBS5_ILP32_OFFBIG_LIBS
    _CS_XBS5_ILP32_OFFBIG_LINTFLAGS,
#define _CS_XBS5_ILP32_OFFBIG_LINTFLAGS _CS_XBS5_ILP32_OFFBIG_LINTFLAGS
    _CS_XBS5_LP64_OFF64_CFLAGS,
#define _CS_XBS5_LP64_OFF64_CFLAGS _CS_XBS5_LP64_OFF64_CFLAGS
    _CS_XBS5_LP64_OFF64_LDFLAGS,
#define _CS_XBS5_LP64_OFF64_LDFLAGS _CS_XBS5_LP64_OFF64_LDFLAGS
    _CS_XBS5_LP64_OFF64_LIBS,
#define _CS_XBS5_LP64_OFF64_LIBS _CS_XBS5_LP64_OFF64_LIBS
    _CS_XBS5_LP64_OFF64_LINTFLAGS,
#define _CS_XBS5_LP64_OFF64_LINTFLAGS _CS_XBS5_LP64_OFF64_LINTFLAGS
    _CS_XBS5_LPBIG_OFFBIG_CFLAGS,
#define _CS_XBS5_LPBIG_OFFBIG_CFLAGS _CS_XBS5_LPBIG_OFFBIG_CFLAGS
    _CS_XBS5_LPBIG_OFFBIG_LDFLAGS,
#define _CS_XBS5_LPBIG_OFFBIG_LDFLAGS _CS_XBS5_LPBIG_OFFBIG_LDFLAGS
    _CS_XBS5_LPBIG_OFFBIG_LIBS,
#define _CS_XBS5_LPBIG_OFFBIG_LIBS _CS_XBS5_LPBIG_OFFBIG_LIBS
    _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS,
#define _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS

    _CS_POSIX_V6_ILP32_OFF32_CFLAGS,
#define _CS_POSIX_V6_ILP32_OFF32_CFLAGS _CS_POSIX_V6_ILP32_OFF32_CFLAGS
    _CS_POSIX_V6_ILP32_OFF32_LDFLAGS,
#define _CS_POSIX_V6_ILP32_OFF32_LDFLAGS _CS_POSIX_V6_ILP32_OFF32_LDFLAGS
    _CS_POSIX_V6_ILP32_OFF32_LIBS,
#define _CS_POSIX_V6_ILP32_OFF32_LIBS _CS_POSIX_V6_ILP32_OFF32_LIBS
    _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS,
#define _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS
    _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS,
#define _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS
    _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS,
#define _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS
    _CS_POSIX_V6_ILP32_OFFBIG_LIBS,
#define _CS_POSIX_V6_ILP32_OFFBIG_LIBS _CS_POSIX_V6_ILP32_OFFBIG_LIBS
    _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS,
#define _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS
    _CS_POSIX_V6_LP64_OFF64_CFLAGS,
#define _CS_POSIX_V6_LP64_OFF64_CFLAGS _CS_POSIX_V6_LP64_OFF64_CFLAGS
    _CS_POSIX_V6_LP64_OFF64_LDFLAGS,
#define _CS_POSIX_V6_LP64_OFF64_LDFLAGS _CS_POSIX_V6_LP64_OFF64_LDFLAGS
    _CS_POSIX_V6_LP64_OFF64_LIBS,
#define _CS_POSIX_V6_LP64_OFF64_LIBS _CS_POSIX_V6_LP64_OFF64_LIBS
    _CS_POSIX_V6_LP64_OFF64_LINTFLAGS,
#define _CS_POSIX_V6_LP64_OFF64_LINTFLAGS _CS_POSIX_V6_LP64_OFF64_LINTFLAGS
    _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS,
#define _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS
    _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS,
#define _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS
    _CS_POSIX_V6_LPBIG_OFFBIG_LIBS,
#define _CS_POSIX_V6_LPBIG_OFFBIG_LIBS _CS_POSIX_V6_LPBIG_OFFBIG_LIBS
    _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS,
#define _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS

    _CS_POSIX_V7_ILP32_OFF32_CFLAGS,
#define _CS_POSIX_V7_ILP32_OFF32_CFLAGS _CS_POSIX_V7_ILP32_OFF32_CFLAGS
    _CS_POSIX_V7_ILP32_OFF32_LDFLAGS,
#define _CS_POSIX_V7_ILP32_OFF32_LDFLAGS _CS_POSIX_V7_ILP32_OFF32_LDFLAGS
    _CS_POSIX_V7_ILP32_OFF32_LIBS,
#define _CS_POSIX_V7_ILP32_OFF32_LIBS _CS_POSIX_V7_ILP32_OFF32_LIBS
    _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS,
#define _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS
    _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS,
#define _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS
    _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS,
#define _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS
    _CS_POSIX_V7_ILP32_OFFBIG_LIBS,
#define _CS_POSIX_V7_ILP32_OFFBIG_LIBS _CS_POSIX_V7_ILP32_OFFBIG_LIBS
    _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS,
#define _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS
    _CS_POSIX_V7_LP64_OFF64_CFLAGS,
#define _CS_POSIX_V7_LP64_OFF64_CFLAGS _CS_POSIX_V7_LP64_OFF64_CFLAGS
    _CS_POSIX_V7_LP64_OFF64_LDFLAGS,
#define _CS_POSIX_V7_LP64_OFF64_LDFLAGS _CS_POSIX_V7_LP64_OFF64_LDFLAGS
    _CS_POSIX_V7_LP64_OFF64_LIBS,
#define _CS_POSIX_V7_LP64_OFF64_LIBS _CS_POSIX_V7_LP64_OFF64_LIBS
    _CS_POSIX_V7_LP64_OFF64_LINTFLAGS,
#define _CS_POSIX_V7_LP64_OFF64_LINTFLAGS _CS_POSIX_V7_LP64_OFF64_LINTFLAGS
    _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS,
#define _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS
    _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS,
#define _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS
    _CS_POSIX_V7_LPBIG_OFFBIG_LIBS,
#define _CS_POSIX_V7_LPBIG_OFFBIG_LIBS _CS_POSIX_V7_LPBIG_OFFBIG_LIBS
    _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS,
#define _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS

    _CS_V6_ENV,
#define _CS_V6_ENV			_CS_V6_ENV
    _CS_V7_ENV
#define _CS_V7_ENV			_CS_V7_ENV
  };
# 613 "/usr/include/unistd.h"

 
extern long int pathconf (const char *__path, int __name)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern long int fpathconf (int __fd, int __name) __attribute__ ((__nothrow__ , __leaf__));

 
extern long int sysconf (int __name) __attribute__ ((__nothrow__ , __leaf__));


 
extern size_t confstr (int __name, char *__buf, size_t __len) __attribute__ ((__nothrow__ , __leaf__));



 
extern __pid_t getpid (void) __attribute__ ((__nothrow__ , __leaf__));

 
extern __pid_t getppid (void) __attribute__ ((__nothrow__ , __leaf__));

 
extern __pid_t getpgrp (void) __attribute__ ((__nothrow__ , __leaf__));

 
extern __pid_t __getpgid (__pid_t __pid) __attribute__ ((__nothrow__ , __leaf__));

extern __pid_t getpgid (__pid_t __pid) __attribute__ ((__nothrow__ , __leaf__));





 
extern int setpgid (__pid_t __pid, __pid_t __pgid) __attribute__ ((__nothrow__ , __leaf__));









 


 
extern int setpgrp (void) __attribute__ ((__nothrow__ , __leaf__));





 
extern __pid_t setsid (void) __attribute__ ((__nothrow__ , __leaf__));


 
extern __pid_t getsid (__pid_t __pid) __attribute__ ((__nothrow__ , __leaf__));


 
extern __uid_t getuid (void) __attribute__ ((__nothrow__ , __leaf__));

 
extern __uid_t geteuid (void) __attribute__ ((__nothrow__ , __leaf__));

 
extern __gid_t getgid (void) __attribute__ ((__nothrow__ , __leaf__));

 
extern __gid_t getegid (void) __attribute__ ((__nothrow__ , __leaf__));



 
extern int getgroups (int __size, __gid_t __list[]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));


 
extern int group_member (__gid_t __gid) __attribute__ ((__nothrow__ , __leaf__));





 
extern int setuid (__uid_t __uid) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));



 
extern int setreuid (__uid_t __ruid, __uid_t __euid) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));



 
extern int seteuid (__uid_t __uid) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));





 
extern int setgid (__gid_t __gid) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));



 
extern int setregid (__gid_t __rgid, __gid_t __egid) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));



 
extern int setegid (__gid_t __gid) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));




 
extern int getresuid (__uid_t *__ruid, __uid_t *__euid, __uid_t *__suid)
     __attribute__ ((__nothrow__ , __leaf__));


 
extern int getresgid (__gid_t *__rgid, __gid_t *__egid, __gid_t *__sgid)
     __attribute__ ((__nothrow__ , __leaf__));


 
extern int setresuid (__uid_t __ruid, __uid_t __euid, __uid_t __suid)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));


 
extern int setresgid (__gid_t __rgid, __gid_t __egid, __gid_t __sgid)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));





 
extern __pid_t fork (void) __attribute__ ((__nothrow__));






 
extern __pid_t vfork (void) __attribute__ ((__nothrow__ , __leaf__));




 
extern char *ttyname (int __fd) __attribute__ ((__nothrow__ , __leaf__));


 
extern int ttyname_r (int __fd, char *__buf, size_t __buflen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2))) __attribute__ ((__warn_unused_result__));


 
extern int isatty (int __fd) __attribute__ ((__nothrow__ , __leaf__));



 
extern int ttyslot (void) __attribute__ ((__nothrow__ , __leaf__));



 
extern int link (const char *__from, const char *__to)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2))) __attribute__ ((__warn_unused_result__));



 
extern int linkat (int __fromfd, const char *__from, int __tofd,
		   const char *__to, int __flags)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4))) __attribute__ ((__warn_unused_result__));



 
extern int symlink (const char *__from, const char *__to)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2))) __attribute__ ((__warn_unused_result__));



 
extern ssize_t readlink (const char *__restrict __path,
			 char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2))) __attribute__ ((__warn_unused_result__));



 
extern int symlinkat (const char *__from, int __tofd,
		      const char *__to) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3))) __attribute__ ((__warn_unused_result__));

 
extern ssize_t readlinkat (int __fd, const char *__restrict __path,
			   char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3))) __attribute__ ((__warn_unused_result__));


 
extern int unlink (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


 
extern int unlinkat (int __fd, const char *__name, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


 
extern int rmdir (const char *__path) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


 
extern __pid_t tcgetpgrp (int __fd) __attribute__ ((__nothrow__ , __leaf__));

 
extern int tcsetpgrp (int __fd, __pid_t __pgrp_id) __attribute__ ((__nothrow__ , __leaf__));





 
extern char *getlogin (void);






 
extern int getlogin_r (char *__name, size_t __name_len) __attribute__ ((__nonnull__ (1)));



 
extern int setlogin (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));






 
# 1 "/usr/include/x86_64-linux-gnu/bits/getopt_posix.h"

















 


#define _GETOPT_POSIX_H 1





# 1 "/usr/include/x86_64-linux-gnu/bits/getopt_core.h"

















 


#define _GETOPT_CORE_H 1




 







 

extern char *optarg;











 

extern int optind;


 

extern int opterr;

 

extern int optopt;





























 

extern int getopt (int ___argc, char *const *___argv, const char *__shortopts)
       __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));



# 28 "/usr/include/x86_64-linux-gnu/bits/getopt_posix.h"



# 48 "/usr/include/x86_64-linux-gnu/bits/getopt_posix.h"



# 873 "/usr/include/unistd.h"






 
extern int gethostname (char *__name, size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





 
extern int sethostname (const char *__name, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));


 
extern int sethostid (long int __id) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));




 
extern int getdomainname (char *__name, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));
extern int setdomainname (const char *__name, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));




 
extern int vhangup (void) __attribute__ ((__nothrow__ , __leaf__));

 
extern int revoke (const char *__file) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));






 
extern int profil (unsigned short int *__sample_buffer, size_t __size,
		   size_t __offset, unsigned int __scale)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




 
extern int acct (const char *__name) __attribute__ ((__nothrow__ , __leaf__));


 
extern char *getusershell (void) __attribute__ ((__nothrow__ , __leaf__));
extern void endusershell (void) __attribute__ ((__nothrow__ , __leaf__));  
extern void setusershell (void) __attribute__ ((__nothrow__ , __leaf__));  




 
extern int daemon (int __nochdir, int __noclose) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));





 
extern int chroot (const char *__path) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));


 
extern char *getpass (const char *__prompt) __attribute__ ((__nonnull__ (1)));






 
extern int fsync (int __fd);




 
extern int syncfs (int __fd) __attribute__ ((__nothrow__ , __leaf__));





 
extern long int gethostid (void);

 
extern void sync (void) __attribute__ ((__nothrow__ , __leaf__));




 
extern int getpagesize (void)  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern int getdtablesize (void) __attribute__ ((__nothrow__ , __leaf__));







 





extern int truncate (const char *__file, __off64_t __length) __asm__ ("" "truncate64") __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));
# 1006 "/usr/include/unistd.h"
extern int truncate64 (const char *__file, __off64_t __length)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));







 




extern int ftruncate (int __fd, __off64_t __length) __asm__ ("" "ftruncate64") __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
# 1027 "/usr/include/unistd.h"
extern int ftruncate64 (int __fd, __off64_t __length) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));









 
extern int brk (void *__addr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));




 
extern void *sbrk (intptr_t __delta) __attribute__ ((__nothrow__ , __leaf__));













 
extern long int syscall (long int __sysno, ...) __attribute__ ((__nothrow__ , __leaf__));







 






 

# define F_ULOCK 0	 
# define F_LOCK  1	 
# define F_TLOCK 2	 
# define F_TEST  3	 





extern int lockf (int __fd, int __cmd, __off64_t __len) __asm__ ("" "lockf64") __attribute__ ((__warn_unused_result__));
# 1092 "/usr/include/unistd.h"
extern int lockf64 (int __fd, int __cmd, __off64_t __len) __attribute__ ((__warn_unused_result__));







 

# define TEMP_FAILURE_RETRY(expression)   (__extension__							          ({ long int __result;						             do __result = (long int) (expression);				             while (__result == -1L && errno == EINTR);			             __result; }))






 
ssize_t copy_file_range (int __infd, __off64_t *__pinoff,
			 int __outfd, __off64_t *__poutoff,
			 size_t __length, unsigned int __flags);




 
extern int fdatasync (int __fildes);




 

 
extern char *crypt (const char *__key, const char *__salt)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


 
extern void encrypt (char *__glibc_block, int __edflag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





 
extern void swab (const void *__restrict __from, void *__restrict __to,
		  ssize_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));





 
# 1154 "/usr/include/unistd.h"



 








 
int getentropy (void *__buffer, size_t __length) __attribute__ ((__warn_unused_result__));


 
# 1 "/usr/include/x86_64-linux-gnu/bits/unistd.h"
















 





extern ssize_t __read_chk (int __fd, void *__buf, size_t __nbytes,
			   size_t __buflen) __attribute__ ((__warn_unused_result__));
extern ssize_t __read_alias (int __fd, void *__buf, size_t __nbytes) __asm__ ("" "read") __attribute__ ((__warn_unused_result__));

extern ssize_t __read_chk_warn (int __fd, void *__buf, size_t __nbytes, size_t __buflen) __asm__ ("" "__read_chk")


     __attribute__ ((__warn_unused_result__)) __attribute__((__warning__ ("read called with bigger length than size of " "the destination buffer")));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__warn_unused_result__)) ssize_t
read (int __fd, void *__buf, size_t __nbytes)
{
  if (__builtin_object_size(0,0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__nbytes))
	return __read_chk (__fd, __buf, __nbytes, __builtin_object_size(0,0));

      if (__nbytes > __builtin_object_size(0,0))
	return __read_chk_warn (__fd, __buf, __nbytes, __builtin_object_size(0,0));
    }
  return __read_alias (__fd, __buf, __nbytes);
}


extern ssize_t __pread_chk (int __fd, void *__buf, size_t __nbytes,
			    __off_t __offset, size_t __bufsize) __attribute__ ((__warn_unused_result__));
extern ssize_t __pread64_chk (int __fd, void *__buf, size_t __nbytes,
			      __off64_t __offset, size_t __bufsize) __attribute__ ((__warn_unused_result__));
extern ssize_t __pread_alias (int __fd, void *__buf, size_t __nbytes, __off_t __offset) __asm__ ("" "pread") __attribute__ ((__warn_unused_result__));


extern ssize_t __pread64_alias (int __fd, void *__buf, size_t __nbytes, __off64_t __offset) __asm__ ("" "pread64") __attribute__ ((__warn_unused_result__));


extern ssize_t __pread_chk_warn (int __fd, void *__buf, size_t __nbytes, __off_t __offset, size_t __bufsize) __asm__ ("" "__pread_chk")


     __attribute__ ((__warn_unused_result__)) __attribute__((__warning__ ("pread called with bigger length than size of " "the destination buffer")));

extern ssize_t __pread64_chk_warn (int __fd, void *__buf, size_t __nbytes, __off64_t __offset, size_t __bufsize) __asm__ ("" "__pread64_chk")



     __attribute__ ((__warn_unused_result__)) __attribute__((__warning__ ("pread64 called with bigger length than size of " "the destination buffer")));


# 86 "/usr/include/x86_64-linux-gnu/bits/unistd.h"
extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__warn_unused_result__)) ssize_t
pread (int __fd, void *__buf, size_t __nbytes, __off64_t __offset)
{
  if (__builtin_object_size(0,0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__nbytes))
	return __pread64_chk (__fd, __buf, __nbytes, __offset, __builtin_object_size(0,0));

      if ( __nbytes > __builtin_object_size(0,0))
	return __pread64_chk_warn (__fd, __buf, __nbytes, __offset,
				   __builtin_object_size(0,0));
    }

  return __pread64_alias (__fd, __buf, __nbytes, __offset);
}



extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__warn_unused_result__)) ssize_t
pread64 (int __fd, void *__buf, size_t __nbytes, __off64_t __offset)
{
  if (__builtin_object_size(0,0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__nbytes))
	return __pread64_chk (__fd, __buf, __nbytes, __offset, __builtin_object_size(0,0));

      if ( __nbytes > __builtin_object_size(0,0))
	return __pread64_chk_warn (__fd, __buf, __nbytes, __offset,
				   __builtin_object_size(0,0));
    }

  return __pread64_alias (__fd, __buf, __nbytes, __offset);
}




extern ssize_t __readlink_chk (const char *__restrict __path,
			       char *__restrict __buf, size_t __len,
			       size_t __buflen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2))) __attribute__ ((__warn_unused_result__));
extern ssize_t __readlink_alias (const char *__restrict __path, char *__restrict __buf, size_t __len) __asm__ ("" "readlink") __attribute__ ((__nothrow__ , __leaf__))


     __attribute__ ((__nonnull__ (1, 2))) __attribute__ ((__warn_unused_result__));
extern ssize_t __readlink_chk_warn (const char *__restrict __path, char *__restrict __buf, size_t __len, size_t __buflen) __asm__ ("" "__readlink_chk") __attribute__ ((__nothrow__ , __leaf__))



     __attribute__ ((__nonnull__ (1, 2))) __attribute__ ((__warn_unused_result__)) __attribute__((__warning__ ("readlink called with bigger length " "than size of destination buffer")));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__nonnull__ (1, 2))) __attribute__ ((__warn_unused_result__)) ssize_t

__attribute__ ((__nothrow__ , __leaf__)) readlink (const char *__restrict __path, char *__restrict __buf, size_t __len)
{
  if (__builtin_object_size(0,0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__len))
	return __readlink_chk (__path, __buf, __len, __builtin_object_size(0,0));

      if ( __len > __builtin_object_size(0,0))
	return __readlink_chk_warn (__path, __buf, __len, __builtin_object_size(0,0));
    }
  return __readlink_alias (__path, __buf, __len);
}



extern ssize_t __readlinkat_chk (int __fd, const char *__restrict __path,
				 char *__restrict __buf, size_t __len,
				 size_t __buflen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3))) __attribute__ ((__warn_unused_result__));
extern ssize_t __readlinkat_alias (int __fd, const char *__restrict __path, char *__restrict __buf, size_t __len) __asm__ ("" "readlinkat") __attribute__ ((__nothrow__ , __leaf__))



     __attribute__ ((__nonnull__ (2, 3))) __attribute__ ((__warn_unused_result__));
extern ssize_t __readlinkat_chk_warn (int __fd, const char *__restrict __path, char *__restrict __buf, size_t __len, size_t __buflen) __asm__ ("" "__readlinkat_chk") __attribute__ ((__nothrow__ , __leaf__))



     __attribute__ ((__nonnull__ (2, 3))) __attribute__ ((__warn_unused_result__)) __attribute__((__warning__ ("readlinkat called with bigger " "length than size of destination " "buffer")));



extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__nonnull__ (2, 3))) __attribute__ ((__warn_unused_result__)) ssize_t

__attribute__ ((__nothrow__ , __leaf__)) readlinkat (int __fd, const char *__restrict __path, char *__restrict __buf, size_t __len)
{
  if (__builtin_object_size(0,0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__len))
	return __readlinkat_chk (__fd, __path, __buf, __len, __builtin_object_size(0,0));

      if (__len > __builtin_object_size(0,0))
	return __readlinkat_chk_warn (__fd, __path, __buf, __len,
				      __builtin_object_size(0,0));
    }
  return __readlinkat_alias (__fd, __path, __buf, __len);
}


extern char *__getcwd_chk (char *__buf, size_t __size, size_t __buflen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
extern char *__getcwd_alias (char *__buf, size_t __size) __asm__ ("" "getcwd") __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));

extern char *__getcwd_chk_warn (char *__buf, size_t __size, size_t __buflen) __asm__ ("" "__getcwd_chk") __attribute__ ((__nothrow__ , __leaf__))


     __attribute__ ((__warn_unused_result__)) __attribute__((__warning__ ("getcwd caller with bigger length than size of " "destination buffer")));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__warn_unused_result__)) char *
__attribute__ ((__nothrow__ , __leaf__)) getcwd (char *__buf, size_t __size)
{
  if (__builtin_object_size(0,0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__size))
	return __getcwd_chk (__buf, __size, __builtin_object_size(0,0));

      if (__size > __builtin_object_size(0,0))
	return __getcwd_chk_warn (__buf, __size, __builtin_object_size(0,0));
    }
  return __getcwd_alias (__buf, __size);
}


extern char *__getwd_chk (char *__buf, size_t buflen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));
extern char *__getwd_warn (char *__buf) __asm__ ("" "getwd") __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__)) __attribute__((__warning__ ("please use getcwd instead, as getwd " "doesn't specify buffer size")));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__deprecated__)) __attribute__ ((__warn_unused_result__)) char *
__attribute__ ((__nothrow__ , __leaf__)) getwd (char *__buf)
{
  if (__builtin_object_size(0,0) != (size_t) -1)
    return __getwd_chk (__buf, __builtin_object_size(0,0));
  return __getwd_warn (__buf);
}


extern size_t __confstr_chk (int __name, char *__buf, size_t __len,
			     size_t __buflen) __attribute__ ((__nothrow__ , __leaf__));
extern size_t __confstr_alias (int __name, char *__buf, size_t __len) __asm__ ("" "confstr") __attribute__ ((__nothrow__ , __leaf__));

extern size_t __confstr_chk_warn (int __name, char *__buf, size_t __len, size_t __buflen) __asm__ ("" "__confstr_chk") __attribute__ ((__nothrow__ , __leaf__))


     __attribute__((__warning__ ("confstr called with bigger length than size of destination " "buffer")));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) size_t
__attribute__ ((__nothrow__ , __leaf__)) confstr (int __name, char *__buf, size_t __len)
{
  if (__builtin_object_size(0,0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__len))
	return __confstr_chk (__name, __buf, __len, __builtin_object_size(0,0));

      if (__builtin_object_size(0,0) < __len)
	return __confstr_chk_warn (__name, __buf, __len, __builtin_object_size(0,0));
    }
  return __confstr_alias (__name, __buf, __len);
}


extern int __getgroups_chk (int __size, __gid_t __list[], size_t __listlen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
extern int __getgroups_alias (int __size, __gid_t __list[]) __asm__ ("" "getgroups") __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));

extern int __getgroups_chk_warn (int __size, __gid_t __list[], size_t __listlen) __asm__ ("" "__getgroups_chk") __attribute__ ((__nothrow__ , __leaf__))


     __attribute__ ((__warn_unused_result__)) __attribute__((__warning__ ("getgroups called with bigger group count than what " "can fit into destination buffer")));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
__attribute__ ((__nothrow__ , __leaf__)) getgroups (int __size, __gid_t __list[])
{
  if (__builtin_object_size(0,0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__size) || __size < 0)
	return __getgroups_chk (__size, __list, __builtin_object_size(0,0));

      if (__size * sizeof (__gid_t) > __builtin_object_size(0,0))
	return __getgroups_chk_warn (__size, __list, __builtin_object_size(0,0));
    }
  return __getgroups_alias (__size, __list);
}


extern int __ttyname_r_chk (int __fd, char *__buf, size_t __buflen,
			    size_t __nreal) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern int __ttyname_r_alias (int __fd, char *__buf, size_t __buflen) __asm__ ("" "ttyname_r") __attribute__ ((__nothrow__ , __leaf__))

     __attribute__ ((__nonnull__ (2)));
extern int __ttyname_r_chk_warn (int __fd, char *__buf, size_t __buflen, size_t __nreal) __asm__ ("" "__ttyname_r_chk") __attribute__ ((__nothrow__ , __leaf__))


     __attribute__ ((__nonnull__ (2))) __attribute__((__warning__ ("ttyname_r called with bigger buflen than " "size of destination buffer")));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
__attribute__ ((__nothrow__ , __leaf__)) ttyname_r (int __fd, char *__buf, size_t __buflen)
{
  if (__builtin_object_size(0,0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__buflen))
	return __ttyname_r_chk (__fd, __buf, __buflen, __builtin_object_size(0,0));

      if (__buflen > __builtin_object_size(0,0))
	return __ttyname_r_chk_warn (__fd, __buf, __buflen, __builtin_object_size(0,0));
    }
  return __ttyname_r_alias (__fd, __buf, __buflen);
}



extern int __getlogin_r_chk (char *__buf, size_t __buflen, size_t __nreal)
     __attribute__ ((__nonnull__ (1)));
extern int __getlogin_r_alias (char *__buf, size_t __buflen) __asm__ ("" "getlogin_r") __attribute__ ((__nonnull__ (1)));

extern int __getlogin_r_chk_warn (char *__buf, size_t __buflen, size_t __nreal) __asm__ ("" "__getlogin_r_chk")


     __attribute__ ((__nonnull__ (1))) __attribute__((__warning__ ("getlogin_r called with bigger buflen than " "size of destination buffer")));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
getlogin_r (char *__buf, size_t __buflen)
{
  if (__builtin_object_size(0,0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__buflen))
	return __getlogin_r_chk (__buf, __buflen, __builtin_object_size(0,0));

      if (__buflen > __builtin_object_size(0,0))
	return __getlogin_r_chk_warn (__buf, __buflen, __builtin_object_size(0,0));
    }
  return __getlogin_r_alias (__buf, __buflen);
}




extern int __gethostname_chk (char *__buf, size_t __buflen, size_t __nreal)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int __gethostname_alias (char *__buf, size_t __buflen) __asm__ ("" "gethostname") __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern int __gethostname_chk_warn (char *__buf, size_t __buflen, size_t __nreal) __asm__ ("" "__gethostname_chk") __attribute__ ((__nothrow__ , __leaf__))


     __attribute__ ((__nonnull__ (1))) __attribute__((__warning__ ("gethostname called with bigger buflen than " "size of destination buffer")));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
__attribute__ ((__nothrow__ , __leaf__)) gethostname (char *__buf, size_t __buflen)
{
  if (__builtin_object_size(0,0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__buflen))
	return __gethostname_chk (__buf, __buflen, __builtin_object_size(0,0));

      if (__buflen > __builtin_object_size(0,0))
	return __gethostname_chk_warn (__buf, __buflen, __builtin_object_size(0,0));
    }
  return __gethostname_alias (__buf, __buflen);
}




extern int __getdomainname_chk (char *__buf, size_t __buflen, size_t __nreal)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));
extern int __getdomainname_alias (char *__buf, size_t __buflen) __asm__ ("" "getdomainname") __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));


extern int __getdomainname_chk_warn (char *__buf, size_t __buflen, size_t __nreal) __asm__ ("" "__getdomainname_chk") __attribute__ ((__nothrow__ , __leaf__))


     __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__)) __attribute__((__warning__ ("getdomainname called with bigger " "buflen than size of destination " "buffer")));



extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
__attribute__ ((__nothrow__ , __leaf__)) getdomainname (char *__buf, size_t __buflen)
{
  if (__builtin_object_size(0,0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__buflen))
	return __getdomainname_chk (__buf, __buflen, __builtin_object_size(0,0));

      if (__buflen > __builtin_object_size(0,0))
	return __getdomainname_chk_warn (__buf, __buflen, __builtin_object_size(0,0));
    }
  return __getdomainname_alias (__buf, __buflen);
}
# 1173 "/usr/include/unistd.h"




# 39 "redis-cli.c"
# 1 "/usr/include/time.h"















 



 


#define _TIME_H	1



#define __need_size_t
#define __need_NULL
# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"










 





# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





















 



 








 
# 44 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 


 



 







 
# 91 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 









 
# 116 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





 

 


 
# 164 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

 


 
# 238 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#undef	__need_size_t






 


 
# 349 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

# 361 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 
 
 
# 395 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 


#undef NULL		 




#define NULL ((void *)0)





#undef	__need_NULL

# 449 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

# 19 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"
# 30 "/usr/include/time.h"


 
# 1 "/usr/include/x86_64-linux-gnu/bits/time.h"
















 



 


#define _BITS_TIME_H	1





 


 
#define CLOCKS_PER_SEC  ((__clock_t) 1000000)

# 43 "/usr/include/x86_64-linux-gnu/bits/time.h"


 
# define CLOCK_REALTIME			0
 
# define CLOCK_MONOTONIC		1
 
# define CLOCK_PROCESS_CPUTIME_ID	2
 
# define CLOCK_THREAD_CPUTIME_ID	3
 
# define CLOCK_MONOTONIC_RAW		4
 
# define CLOCK_REALTIME_COARSE		5
 
# define CLOCK_MONOTONIC_COARSE		6
 
# define CLOCK_BOOTTIME			7
 
# define CLOCK_REALTIME_ALARM		8
 
# define CLOCK_BOOTTIME_ALARM		9
 
# define CLOCK_TAI			11

 
# define TIMER_ABSTIME			1


# 1 "/usr/include/x86_64-linux-gnu/bits/timex.h"















 


#define	_BITS_TIMEX_H	1




 

struct timex
{
  unsigned int modes;		 
  __syscall_slong_t offset;	 
  __syscall_slong_t freq;	 
  __syscall_slong_t maxerror;	 
  __syscall_slong_t esterror;	 
  int status;			 
  __syscall_slong_t constant;	 
  __syscall_slong_t precision;	 
  __syscall_slong_t tolerance;	 
  struct timeval time;		 
  __syscall_slong_t tick;	 
  __syscall_slong_t ppsfreq;	 
  __syscall_slong_t jitter;	 
  int shift;			 
  __syscall_slong_t stabil;	 
  __syscall_slong_t jitcnt;	 
  __syscall_slong_t calcnt;	 
  __syscall_slong_t errcnt;	 
  __syscall_slong_t stbcnt;	 

  int tai;			 

   
  int  :32; int  :32; int  :32; int  :32;
  int  :32; int  :32; int  :32; int  :32;
  int  :32; int  :32; int  :32;
};

 
#define ADJ_OFFSET		0x0001	 
#define ADJ_FREQUENCY		0x0002	 
#define ADJ_MAXERROR		0x0004	 
#define ADJ_ESTERROR		0x0008	 
#define ADJ_STATUS		0x0010	 
#define ADJ_TIMECONST		0x0020	 
#define ADJ_TAI			0x0080	 
#define ADJ_SETOFFSET		0x0100	 
#define ADJ_MICRO		0x1000	 
#define ADJ_NANO		0x2000	 
#define ADJ_TICK		0x4000	 
#define ADJ_OFFSET_SINGLESHOT	0x8001	 
#define ADJ_OFFSET_SS_READ	0xa001	 

 
#define MOD_OFFSET	ADJ_OFFSET
#define MOD_FREQUENCY	ADJ_FREQUENCY
#define MOD_MAXERROR	ADJ_MAXERROR
#define MOD_ESTERROR	ADJ_ESTERROR
#define MOD_STATUS	ADJ_STATUS
#define MOD_TIMECONST	ADJ_TIMECONST
#define MOD_CLKB	ADJ_TICK
#define MOD_CLKA	ADJ_OFFSET_SINGLESHOT  
#define MOD_TAI		ADJ_TAI
#define MOD_MICRO	ADJ_MICRO
#define MOD_NANO	ADJ_NANO


 
#define STA_PLL		0x0001	 
#define STA_PPSFREQ	0x0002	 
#define STA_PPSTIME	0x0004	 
#define STA_FLL		0x0008	 

#define STA_INS		0x0010	 
#define STA_DEL		0x0020	 
#define STA_UNSYNC	0x0040	 
#define STA_FREQHOLD	0x0080	 

#define STA_PPSSIGNAL	0x0100	 
#define STA_PPSJITTER	0x0200	 
#define STA_PPSWANDER	0x0400	 
#define STA_PPSERROR	0x0800	 

#define STA_CLOCKERR	0x1000	 
#define STA_NANO	0x2000	 
#define STA_MODE	0x4000	 
#define STA_CLK		0x8000	 

 
#define STA_RONLY (STA_PPSSIGNAL | STA_PPSJITTER | STA_PPSWANDER |     STA_PPSERROR | STA_CLOCKERR | STA_NANO | STA_MODE | STA_CLK)


# 74 "/usr/include/x86_64-linux-gnu/bits/time.h"



 
extern int clock_adjtime (__clockid_t __clock_id, struct timex *__utx) __attribute__ ((__nothrow__ , __leaf__));




# 34 "/usr/include/time.h"


 
# 1 "/usr/include/x86_64-linux-gnu/bits/types/struct_tm.h"

#define __struct_tm_defined 1



 
struct tm
{
  int tm_sec;			 
  int tm_min;			 
  int tm_hour;			 
  int tm_mday;			 
  int tm_mon;			 
  int tm_year;			 
  int tm_wday;			 
  int tm_yday;			 
  int tm_isdst;			 


  long int tm_gmtoff;		 
  const char *tm_zone;		 




};

# 40 "/usr/include/time.h"





# 1 "/usr/include/x86_64-linux-gnu/bits/types/struct_itimerspec.h"

#define __itimerspec_defined 1




 
struct itimerspec
  {
    struct timespec it_interval;
    struct timespec it_value;
  };

# 49 "/usr/include/time.h"
struct sigevent;


# 58 "/usr/include/time.h"






 
# define TIME_UTC 1





 
extern clock_t clock (void) __attribute__ ((__nothrow__ , __leaf__));

 
extern time_t time (time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));

 
extern double difftime (time_t __time1, time_t __time0)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern time_t mktime (struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));




 
extern size_t strftime (char *__restrict __s, size_t __maxsize,
			const char *__restrict __format,
			const struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf__));



 
extern char *strptime (const char *__restrict __s,
		       const char *__restrict __fmt, struct tm *__tp)
     __attribute__ ((__nothrow__ , __leaf__));




 

extern size_t strftime_l (char *__restrict __s, size_t __maxsize,
			  const char *__restrict __format,
			  const struct tm *__restrict __tp,
			  locale_t __loc) __attribute__ ((__nothrow__ , __leaf__));



extern char *strptime_l (const char *__restrict __s,
			 const char *__restrict __fmt, struct tm *__tp,
			 locale_t __loc) __attribute__ ((__nothrow__ , __leaf__));




 
extern struct tm *gmtime (const time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));


 
extern struct tm *localtime (const time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));



 
extern struct tm *gmtime_r (const time_t *__restrict __timer,
			    struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf__));


 
extern struct tm *localtime_r (const time_t *__restrict __timer,
			       struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf__));



 
extern char *asctime (const struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));

 
extern char *ctime (const time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));


 


 
extern char *asctime_r (const struct tm *__restrict __tp,
			char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));

 
extern char *ctime_r (const time_t *__restrict __timer,
		      char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));



 
extern char *__tzname[2];	 
extern int __daylight;		 
extern long int __timezone;	 



 
extern char *tzname[2];


 
extern void tzset (void) __attribute__ ((__nothrow__ , __leaf__));



extern int daylight;
extern long int timezone;




 
extern int stime (const time_t *__when) __attribute__ ((__nothrow__ , __leaf__));




 
#define __isleap(year)	  ((year) % 4 == 0 && ((year) % 100 != 0 || (year) % 400 == 0))





 

 
extern time_t timegm (struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));

 
extern time_t timelocal (struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));

 
extern int dysize (int __year) __attribute__ ((__nothrow__ , __leaf__))  __attribute__ ((__const__));







 
extern int nanosleep (const struct timespec *__requested_time,
		      struct timespec *__remaining);


 
extern int clock_getres (clockid_t __clock_id, struct timespec *__res) __attribute__ ((__nothrow__ , __leaf__));

 
extern int clock_gettime (clockid_t __clock_id, struct timespec *__tp) __attribute__ ((__nothrow__ , __leaf__));

 
extern int clock_settime (clockid_t __clock_id, const struct timespec *__tp)
     __attribute__ ((__nothrow__ , __leaf__));





 
extern int clock_nanosleep (clockid_t __clock_id, int __flags,
			    const struct timespec *__req,
			    struct timespec *__rem);

 
extern int clock_getcpuclockid (pid_t __pid, clockid_t *__clock_id) __attribute__ ((__nothrow__ , __leaf__));



 
extern int timer_create (clockid_t __clock_id,
			 struct sigevent *__restrict __evp,
			 timer_t *__restrict __timerid) __attribute__ ((__nothrow__ , __leaf__));

 
extern int timer_delete (timer_t __timerid) __attribute__ ((__nothrow__ , __leaf__));

 
extern int timer_settime (timer_t __timerid, int __flags,
			  const struct itimerspec *__restrict __value,
			  struct itimerspec *__restrict __ovalue) __attribute__ ((__nothrow__ , __leaf__));

 
extern int timer_gettime (timer_t __timerid, struct itimerspec *__value)
     __attribute__ ((__nothrow__ , __leaf__));

 
extern int timer_getoverrun (timer_t __timerid) __attribute__ ((__nothrow__ , __leaf__));




 
extern int timespec_get (struct timespec *__ts, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));














 
extern int getdate_err;







 
extern struct tm *getdate (const char *__string);












 
extern int getdate_r (const char *__restrict __string,
		      struct tm *__restrict __resbufp);




# 40 "redis-cli.c"
# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/ctype.h"










 

 
# 1 "/usr/include/ctype.h"















 



 


#define	_CTYPE_H	1













 





#  define _ISbit(bit)	((bit) < 8 ? ((1 << (bit)) << 8) : ((1 << (bit)) >> 8))


enum
{
  _ISupper = ((0) < 8 ? ((1 << (0)) << 8) : ((1 << (0)) >> 8)),	 
  _ISlower = ((1) < 8 ? ((1 << (1)) << 8) : ((1 << (1)) >> 8)),	 
  _ISalpha = ((2) < 8 ? ((1 << (2)) << 8) : ((1 << (2)) >> 8)),	 
  _ISdigit = ((3) < 8 ? ((1 << (3)) << 8) : ((1 << (3)) >> 8)),	 
  _ISxdigit = ((4) < 8 ? ((1 << (4)) << 8) : ((1 << (4)) >> 8)),	 
  _ISspace = ((5) < 8 ? ((1 << (5)) << 8) : ((1 << (5)) >> 8)),	 
  _ISprint = ((6) < 8 ? ((1 << (6)) << 8) : ((1 << (6)) >> 8)),	 
  _ISgraph = ((7) < 8 ? ((1 << (7)) << 8) : ((1 << (7)) >> 8)),	 
  _ISblank = ((8) < 8 ? ((1 << (8)) << 8) : ((1 << (8)) >> 8)),	 
  _IScntrl = ((9) < 8 ? ((1 << (9)) << 8) : ((1 << (9)) >> 8)),	 
  _ISpunct = ((10) < 8 ? ((1 << (10)) << 8) : ((1 << (10)) >> 8)),	 
  _ISalnum = ((11) < 8 ? ((1 << (11)) << 8) : ((1 << (11)) >> 8))	 
};

















 
extern const unsigned short int **__ctype_b_loc (void)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern const __int32_t **__ctype_tolower_loc (void)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern const __int32_t **__ctype_toupper_loc (void)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



# define __isctype(c, type)   ((*__ctype_b_loc ())[(int) (c)] & (unsigned short int) type)
# 98 "/usr/include/ctype.h"

#define	__isascii(c)	(((c) & ~0x7f) == 0)	 
#define	__toascii(c)	((c) & 0x7f)		 

#define	__exctype(name)	extern int name (int) __THROW




 
extern int isalnum (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isalpha (int) __attribute__ ((__nothrow__ , __leaf__));
extern int iscntrl (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isdigit (int) __attribute__ ((__nothrow__ , __leaf__));
extern int islower (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isgraph (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isprint (int) __attribute__ ((__nothrow__ , __leaf__));
extern int ispunct (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isspace (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isupper (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isxdigit (int) __attribute__ ((__nothrow__ , __leaf__));


 
extern int tolower (int __c) __attribute__ ((__nothrow__ , __leaf__));

 
extern int toupper (int __c) __attribute__ ((__nothrow__ , __leaf__));


 

extern int isblank (int) __attribute__ ((__nothrow__ , __leaf__));



 
extern int isctype (int __c, int __mask) __attribute__ ((__nothrow__ , __leaf__));





 
extern int isascii (int __c) __attribute__ ((__nothrow__ , __leaf__));


 
extern int toascii (int __c) __attribute__ ((__nothrow__ , __leaf__));


 
extern int _toupper (int) __attribute__ ((__nothrow__ , __leaf__));
extern int _tolower (int) __attribute__ ((__nothrow__ , __leaf__));


 
#define __tobody(c, f, a, args)   (__extension__							         ({ int __res;							            if (sizeof (c) > 1)						      	{								      	  if (__builtin_constant_p (c))					      	    {								      	      int __c = (c);						      	      __res = __c < -128 || __c > 255 ? __c : (a)[__c];		      	    }								      	  else								      	    __res = f args;						      	}								            else								      	__res = (a)[(int) (c)];						            __res; }))
# 171 "/usr/include/ctype.h"

# 189 "/usr/include/ctype.h"
# define isalnum(c)	__isctype((c), _ISalnum)
# define isalpha(c)	__isctype((c), _ISalpha)
# define iscntrl(c)	__isctype((c), _IScntrl)
# define isdigit(c)	__isctype((c), _ISdigit)
# define islower(c)	__isctype((c), _ISlower)
# define isgraph(c)	__isctype((c), _ISgraph)
# define isprint(c)	__isctype((c), _ISprint)
# define ispunct(c)	__isctype((c), _ISpunct)
# define isspace(c)	__isctype((c), _ISspace)
# define isupper(c)	__isctype((c), _ISupper)
# define isxdigit(c)	__isctype((c), _ISxdigit)

#   define isblank(c)	__isctype((c), _ISblank)




extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) tolower (int __c)
{
  return __c >= -128 && __c < 256 ? (*__ctype_tolower_loc ())[__c] : __c;
}

extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) toupper (int __c)
{
  return __c >= -128 && __c < 256 ? (*__ctype_toupper_loc ())[__c] : __c;
}



#  define tolower(c)	__tobody (c, tolower, *__ctype_tolower_loc (), (c))
#  define toupper(c)	__tobody (c, toupper, *__ctype_toupper_loc (), (c))



#  define isascii(c)	__isascii (c)
#  define toascii(c)	__toascii (c)

#  define _tolower(c)	((int) (*__ctype_tolower_loc ())[(int) (c)])
#  define _toupper(c)	((int) (*__ctype_toupper_loc ())[(int) (c)])






 



 
#  define __isctype_l(c, type, locale)   ((locale)->__ctype_b[(int) (c)] & (unsigned short int) type)


# define __exctype_l(name) 						        extern int name (int, locale_t) __THROW





 
extern int isalnum_l (int, locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isalpha_l (int, locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int iscntrl_l (int, locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isdigit_l (int, locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int islower_l (int, locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isgraph_l (int, locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isprint_l (int, locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int ispunct_l (int, locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isspace_l (int, locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isupper_l (int, locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isxdigit_l (int, locale_t) __attribute__ ((__nothrow__ , __leaf__));

extern int isblank_l (int, locale_t) __attribute__ ((__nothrow__ , __leaf__));


 
extern int __tolower_l (int __c, locale_t __l) __attribute__ ((__nothrow__ , __leaf__));
extern int tolower_l (int __c, locale_t __l) __attribute__ ((__nothrow__ , __leaf__));

 
extern int __toupper_l (int __c, locale_t __l) __attribute__ ((__nothrow__ , __leaf__));
extern int toupper_l (int __c, locale_t __l) __attribute__ ((__nothrow__ , __leaf__));


#  define __tolower_l(c, locale)   __tobody (c, __tolower_l, (locale)->__ctype_tolower, (c, locale))

#  define __toupper_l(c, locale)   __tobody (c, __toupper_l, (locale)->__ctype_toupper, (c, locale))

#  define tolower_l(c, locale)	__tolower_l ((c), (locale))
#  define toupper_l(c, locale)	__toupper_l ((c), (locale))




#  define __isalnum_l(c,l)	__isctype_l((c), _ISalnum, (l))
#  define __isalpha_l(c,l)	__isctype_l((c), _ISalpha, (l))
#  define __iscntrl_l(c,l)	__isctype_l((c), _IScntrl, (l))
#  define __isdigit_l(c,l)	__isctype_l((c), _ISdigit, (l))
#  define __islower_l(c,l)	__isctype_l((c), _ISlower, (l))
#  define __isgraph_l(c,l)	__isctype_l((c), _ISgraph, (l))
#  define __isprint_l(c,l)	__isctype_l((c), _ISprint, (l))
#  define __ispunct_l(c,l)	__isctype_l((c), _ISpunct, (l))
#  define __isspace_l(c,l)	__isctype_l((c), _ISspace, (l))
#  define __isupper_l(c,l)	__isctype_l((c), _ISupper, (l))
#  define __isxdigit_l(c,l)	__isctype_l((c), _ISxdigit, (l))

#  define __isblank_l(c,l)	__isctype_l((c), _ISblank, (l))


#   define __isascii_l(c,l)	((l), __isascii (c))
#   define __toascii_l(c,l)	((l), __toascii (c))


#  define isalnum_l(c,l)	__isalnum_l ((c), (l))
#  define isalpha_l(c,l)	__isalpha_l ((c), (l))
#  define iscntrl_l(c,l)	__iscntrl_l ((c), (l))
#  define isdigit_l(c,l)	__isdigit_l ((c), (l))
#  define islower_l(c,l)	__islower_l ((c), (l))
#  define isgraph_l(c,l)	__isgraph_l ((c), (l))
#  define isprint_l(c,l)	__isprint_l ((c), (l))
#  define ispunct_l(c,l)	__ispunct_l ((c), (l))
#  define isspace_l(c,l)	__isspace_l ((c), (l))
#  define isupper_l(c,l)	__isupper_l ((c), (l))
#  define isxdigit_l(c,l)	__isxdigit_l ((c), (l))

#  define isblank_l(c,l)	__isblank_l ((c), (l))


#   define isascii_l(c,l)	__isascii_l ((c), (l))
#   define toascii_l(c,l)	__toascii_l ((c), (l))








# 15 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/ctype.h"


#define _CTYPE_H_CSURF

 



#define __CSURF_EXTERN_C extern








 

# define __CSURF_THROW __THROW







#define __CSURF_INCLUDE_CALLING_CONVENTION



 

#hard_undef isalnum
extern int  isalnum(int) __attribute__ ((__nothrow__ , __leaf__));




#hard_undef isalpha
extern int  isalpha(int) __attribute__ ((__nothrow__ , __leaf__));




#hard_undef isblank
extern int  isblank(int) __attribute__ ((__nothrow__ , __leaf__));




#hard_undef iscntrl
extern int  iscntrl(int) __attribute__ ((__nothrow__ , __leaf__));




#hard_undef isdigit
extern int  isdigit(int) __attribute__ ((__nothrow__ , __leaf__));




#hard_undef isgraph
extern int  isgraph(int) __attribute__ ((__nothrow__ , __leaf__));




#hard_undef islower
extern int  islower(int) __attribute__ ((__nothrow__ , __leaf__));




#hard_undef isprint
extern int  isprint(int) __attribute__ ((__nothrow__ , __leaf__));




#hard_undef ispunct
extern int  ispunct(int) __attribute__ ((__nothrow__ , __leaf__));




#hard_undef isspace
extern int  isspace(int) __attribute__ ((__nothrow__ , __leaf__));




#hard_undef isupper
extern int  isupper(int) __attribute__ ((__nothrow__ , __leaf__));




#hard_undef isxdigit
extern int  isxdigit(int) __attribute__ ((__nothrow__ , __leaf__));




#hard_undef tolower
extern int  tolower(int) __attribute__ ((__nothrow__ , __leaf__));




#hard_undef toupper
extern int  toupper(int) __attribute__ ((__nothrow__ , __leaf__));


 

#hard_undef isascii
extern int  isascii(int) __attribute__ ((__nothrow__ , __leaf__));




#hard_undef toascii
extern int  toascii(int) __attribute__ ((__nothrow__ , __leaf__));



#undef __CSURF_INCLUDE_CALLING_CONVENTION
#undef __CSURF_THROW
#undef __CSURF_EXTERN_C

# 41 "redis-cli.c"
# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/errno.h"










 

 
# 1 "/usr/include/errno.h"















 



 


#define	_ERRNO_H 1



 
# 1 "/usr/include/x86_64-linux-gnu/bits/errno.h"
















 


#define _BITS_ERRNO_H 1





# 1 "/usr/include/linux/errno.h"
# 1 "/usr/include/x86_64-linux-gnu/asm/errno.h"
# 1 "/usr/include/asm-generic/errno.h"
 

#define _ASM_GENERIC_ERRNO_H

# 1 "/usr/include/asm-generic/errno-base.h"
 

#define _ASM_GENERIC_ERRNO_BASE_H

#define	EPERM		 1	 
#define	ENOENT		 2	 
#define	ESRCH		 3	 
#define	EINTR		 4	 
#define	EIO		 5	 
#define	ENXIO		 6	 
#define	E2BIG		 7	 
#define	ENOEXEC		 8	 
#define	EBADF		 9	 
#define	ECHILD		10	 
#define	EAGAIN		11	 
#define	ENOMEM		12	 
#define	EACCES		13	 
#define	EFAULT		14	 
#define	ENOTBLK		15	 
#define	EBUSY		16	 
#define	EEXIST		17	 
#define	EXDEV		18	 
#define	ENODEV		19	 
#define	ENOTDIR		20	 
#define	EISDIR		21	 
#define	EINVAL		22	 
#define	ENFILE		23	 
#define	EMFILE		24	 
#define	ENOTTY		25	 
#define	ETXTBSY		26	 
#define	EFBIG		27	 
#define	ENOSPC		28	 
#define	ESPIPE		29	 
#define	EROFS		30	 
#define	EMLINK		31	 
#define	EPIPE		32	 
#define	EDOM		33	 
#define	ERANGE		34	 

# 6 "/usr/include/asm-generic/errno.h"

#define	EDEADLK		35	 
#define	ENAMETOOLONG	36	 
#define	ENOLCK		37	 







 
#define	ENOSYS		38	 

#define	ENOTEMPTY	39	 
#define	ELOOP		40	 
#define	EWOULDBLOCK	EAGAIN	 
#define	ENOMSG		42	 
#define	EIDRM		43	 
#define	ECHRNG		44	 
#define	EL2NSYNC	45	 
#define	EL3HLT		46	 
#define	EL3RST		47	 
#define	ELNRNG		48	 
#define	EUNATCH		49	 
#define	ENOCSI		50	 
#define	EL2HLT		51	 
#define	EBADE		52	 
#define	EBADR		53	 
#define	EXFULL		54	 
#define	ENOANO		55	 
#define	EBADRQC		56	 
#define	EBADSLT		57	 

#define	EDEADLOCK	EDEADLK

#define	EBFONT		59	 
#define	ENOSTR		60	 
#define	ENODATA		61	 
#define	ETIME		62	 
#define	ENOSR		63	 
#define	ENONET		64	 
#define	ENOPKG		65	 
#define	EREMOTE		66	 
#define	ENOLINK		67	 
#define	EADV		68	 
#define	ESRMNT		69	 
#define	ECOMM		70	 
#define	EPROTO		71	 
#define	EMULTIHOP	72	 
#define	EDOTDOT		73	 
#define	EBADMSG		74	 
#define	EOVERFLOW	75	 
#define	ENOTUNIQ	76	 
#define	EBADFD		77	 
#define	EREMCHG		78	 
#define	ELIBACC		79	 
#define	ELIBBAD		80	 
#define	ELIBSCN		81	 
#define	ELIBMAX		82	 
#define	ELIBEXEC	83	 
#define	EILSEQ		84	 
#define	ERESTART	85	 
#define	ESTRPIPE	86	 
#define	EUSERS		87	 
#define	ENOTSOCK	88	 
#define	EDESTADDRREQ	89	 
#define	EMSGSIZE	90	 
#define	EPROTOTYPE	91	 
#define	ENOPROTOOPT	92	 
#define	EPROTONOSUPPORT	93	 
#define	ESOCKTNOSUPPORT	94	 
#define	EOPNOTSUPP	95	 
#define	EPFNOSUPPORT	96	 
#define	EAFNOSUPPORT	97	 
#define	EADDRINUSE	98	 
#define	EADDRNOTAVAIL	99	 
#define	ENETDOWN	100	 
#define	ENETUNREACH	101	 
#define	ENETRESET	102	 
#define	ECONNABORTED	103	 
#define	ECONNRESET	104	 
#define	ENOBUFS		105	 
#define	EISCONN		106	 
#define	ENOTCONN	107	 
#define	ESHUTDOWN	108	 
#define	ETOOMANYREFS	109	 
#define	ETIMEDOUT	110	 
#define	ECONNREFUSED	111	 
#define	EHOSTDOWN	112	 
#define	EHOSTUNREACH	113	 
#define	EALREADY	114	 
#define	EINPROGRESS	115	 
#define	ESTALE		116	 
#define	EUCLEAN		117	 
#define	ENOTNAM		118	 
#define	ENAVAIL		119	 
#define	EISNAM		120	 
#define	EREMOTEIO	121	 
#define	EDQUOT		122	 

#define	ENOMEDIUM	123	 
#define	EMEDIUMTYPE	124	 
#define	ECANCELED	125	 
#define	ENOKEY		126	 
#define	EKEYEXPIRED	127	 
#define	EKEYREVOKED	128	 
#define	EKEYREJECTED	129	 

 
#define	EOWNERDEAD	130	 
#define	ENOTRECOVERABLE	131	 

#define ERFKILL		132	 

#define EHWPOISON	133	 

# 2 "/usr/include/x86_64-linux-gnu/asm/errno.h"
# 2 "/usr/include/linux/errno.h"
# 27 "/usr/include/x86_64-linux-gnu/bits/errno.h"

 

#  define ENOTSUP		EOPNOTSUPP






















# 29 "/usr/include/errno.h"


 




 
extern int *__errno_location (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
# define errno (*__errno_location ())





 
extern char *program_invocation_name;
extern char *program_invocation_short_name;


 

#   define __error_t_defined 1
typedef int error_t;






# 15 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/errno.h"




#define __CSURF_EXTERN_C extern




 

 

#hard_undef errno
extern int errno;



#undef __CSURF_EXTERN_C
# 42 "redis-cli.c"
# 1 "/usr/include/x86_64-linux-gnu/sys/stat.h"















 



 


#define	_SYS_STAT_H	1











 













# 57 "/usr/include/x86_64-linux-gnu/sys/stat.h"











# 76 "/usr/include/x86_64-linux-gnu/sys/stat.h"







# 92 "/usr/include/x86_64-linux-gnu/sys/stat.h"









# 1 "/usr/include/x86_64-linux-gnu/bits/stat.h"















 






#define _BITS_STAT_H	1

 
# 37 "/usr/include/x86_64-linux-gnu/bits/stat.h"
# define _STAT_VER_KERNEL	0
# define _STAT_VER_LINUX	1

 
# define _MKNOD_VER_LINUX	0


#define _STAT_VER		_STAT_VER_LINUX

struct stat
  {
    __dev_t st_dev;		 




    __ino_t st_ino;		 
# 61 "/usr/include/x86_64-linux-gnu/bits/stat.h"
    __nlink_t st_nlink;		 
    __mode_t st_mode;		 

    __uid_t st_uid;		 
    __gid_t st_gid;		 

    int __pad0;

    __dev_t st_rdev;		 




    __off_t st_size;			 



    __blksize_t st_blksize;	 

    __blkcnt_t st_blocks;		 




    




 
    struct timespec st_atim;		 
    struct timespec st_mtim;		 
    struct timespec st_ctim;		 
# define st_atime st_atim.tv_sec	 
# define st_mtime st_mtim.tv_sec
# define st_ctime st_ctim.tv_sec
# 106 "/usr/include/x86_64-linux-gnu/bits/stat.h"
    __syscall_slong_t __glibc_reserved[3];
# 115 "/usr/include/x86_64-linux-gnu/bits/stat.h"
  };


 
struct stat64
  {
    __dev_t st_dev;		 

    __ino64_t st_ino;		 
    __nlink_t st_nlink;		 
    __mode_t st_mode;		 
# 132 "/usr/include/x86_64-linux-gnu/bits/stat.h"
    __uid_t st_uid;		 
    __gid_t st_gid;		 

    int __pad0;
    __dev_t st_rdev;		 
    __off_t st_size;		 





    __blksize_t st_blksize;	 
    __blkcnt64_t st_blocks;	 

    




 
    struct timespec st_atim;		 
    struct timespec st_mtim;		 
    struct timespec st_ctim;		 
# 164 "/usr/include/x86_64-linux-gnu/bits/stat.h"
    __syscall_slong_t __glibc_reserved[3];



  };


 
#define	_STATBUF_ST_BLKSIZE
#define _STATBUF_ST_RDEV
 
#define _STATBUF_ST_NSEC

 

#define	__S_IFMT	0170000	 

 
#define	__S_IFDIR	0040000	 
#define	__S_IFCHR	0020000	 
#define	__S_IFBLK	0060000	 
#define	__S_IFREG	0100000	 
#define	__S_IFIFO	0010000	 
#define	__S_IFLNK	0120000	 
#define	__S_IFSOCK	0140000	 


 
#define __S_TYPEISMQ(buf)  ((buf)->st_mode - (buf)->st_mode)
#define __S_TYPEISSEM(buf) ((buf)->st_mode - (buf)->st_mode)
#define __S_TYPEISSHM(buf) ((buf)->st_mode - (buf)->st_mode)

 

#define	__S_ISUID	04000	 
#define	__S_ISGID	02000	 
#define	__S_ISVTX	01000	 
#define	__S_IREAD	0400	 
#define	__S_IWRITE	0200	 
#define	__S_IEXEC	0100	 


# define UTIME_NOW	((1l << 30) - 1l)
# define UTIME_OMIT	((1l << 30) - 2l)


# 102 "/usr/include/x86_64-linux-gnu/sys/stat.h"


# define S_IFMT		__S_IFMT
# define S_IFDIR	__S_IFDIR
# define S_IFCHR	__S_IFCHR
# define S_IFBLK	__S_IFBLK
# define S_IFREG	__S_IFREG

#  define S_IFIFO	__S_IFIFO


#  define S_IFLNK	__S_IFLNK



#  define S_IFSOCK	__S_IFSOCK



 

#define	__S_ISTYPE(mode, mask)	(((mode) & __S_IFMT) == (mask))

#define	S_ISDIR(mode)	 __S_ISTYPE((mode), __S_IFDIR)
#define	S_ISCHR(mode)	 __S_ISTYPE((mode), __S_IFCHR)
#define	S_ISBLK(mode)	 __S_ISTYPE((mode), __S_IFBLK)
#define	S_ISREG(mode)	 __S_ISTYPE((mode), __S_IFREG)

# define S_ISFIFO(mode)	 __S_ISTYPE((mode), __S_IFIFO)


# define S_ISLNK(mode)	 __S_ISTYPE((mode), __S_IFLNK)








# define S_ISSOCK(mode) __S_ISTYPE((mode), __S_IFSOCK)







 

# define S_TYPEISMQ(buf) __S_TYPEISMQ(buf)
# define S_TYPEISSEM(buf) __S_TYPEISSEM(buf)
# define S_TYPEISSHM(buf) __S_TYPEISSHM(buf)



 

#define	S_ISUID __S_ISUID	 
#define	S_ISGID	__S_ISGID	 


 
# define S_ISVTX	__S_ISVTX


#define	S_IRUSR	__S_IREAD	 
#define	S_IWUSR	__S_IWRITE	 
#define	S_IXUSR	__S_IEXEC	 
 
#define	S_IRWXU	(__S_IREAD|__S_IWRITE|__S_IEXEC)


# define S_IREAD	S_IRUSR
# define S_IWRITE	S_IWUSR
# define S_IEXEC	S_IXUSR


#define	S_IRGRP	(S_IRUSR >> 3)	 
#define	S_IWGRP	(S_IWUSR >> 3)	 
#define	S_IXGRP	(S_IXUSR >> 3)	 
 
#define	S_IRWXG	(S_IRWXU >> 3)

#define	S_IROTH	(S_IRGRP >> 3)	 
#define	S_IWOTH	(S_IWGRP >> 3)	 
#define	S_IXOTH	(S_IXGRP >> 3)	 
 
#define	S_IRWXO	(S_IRWXG >> 3)



 
# define ACCESSPERMS (S_IRWXU|S_IRWXG|S_IRWXO)  
# define ALLPERMS (S_ISUID|S_ISGID|S_ISVTX|S_IRWXU|S_IRWXG|S_IRWXO) 
# define DEFFILEMODE (S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH) 

# define S_BLKSIZE	512	 



# 213 "/usr/include/x86_64-linux-gnu/sys/stat.h"
extern int stat (const char *__restrict __file, struct stat *__restrict __buf) __asm__ ("" "stat64") __attribute__ ((__nothrow__ , __leaf__))

     __attribute__ ((__nonnull__ (1, 2)));
extern int fstat (int __fd, struct stat *__buf) __asm__ ("" "fstat64") __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__nonnull__ (2)));
# 224 "/usr/include/x86_64-linux-gnu/sys/stat.h"
extern int stat64 (const char *__restrict __file,
		   struct stat64 *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int fstat64 (int __fd, struct stat64 *__buf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));





 
# 239 "/usr/include/x86_64-linux-gnu/sys/stat.h"
extern int fstatat (int __fd, const char *__restrict __file, struct stat *__restrict __buf, int __flag) __asm__ ("" "fstatat64") __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
# 247 "/usr/include/x86_64-linux-gnu/sys/stat.h"


extern int fstatat64 (int __fd, const char *__restrict __file,
		      struct stat64 *__restrict __buf, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));



# 263 "/usr/include/x86_64-linux-gnu/sys/stat.h"
extern int lstat (const char *__restrict __file, struct stat *__restrict __buf) __asm__ ("" "lstat64") __attribute__ ((__nothrow__ , __leaf__))


     __attribute__ ((__nonnull__ (1, 2)));





extern int lstat64 (const char *__restrict __file,
		    struct stat64 *__restrict __buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




 
extern int chmod (const char *__file, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




 
extern int lchmod (const char *__file, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


 

extern int fchmod (int __fd, __mode_t __mode) __attribute__ ((__nothrow__ , __leaf__));




 
extern int fchmodat (int __fd, const char *__file, __mode_t __mode,
		     int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2))) __attribute__ ((__warn_unused_result__));





 
extern __mode_t umask (__mode_t __mask) __attribute__ ((__nothrow__ , __leaf__));



 
extern __mode_t getumask (void) __attribute__ ((__nothrow__ , __leaf__));


 
extern int mkdir (const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




 
extern int mkdirat (int __fd, const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));




 

extern int mknod (const char *__path, __mode_t __mode, __dev_t __dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




 
extern int mknodat (int __fd, const char *__path, __mode_t __mode,
		    __dev_t __dev) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));




 
extern int mkfifo (const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




 
extern int mkfifoat (int __fd, const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));




 
extern int utimensat (int __fd, const char *__path,
		      const struct timespec __times[2],
		      int __flags)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));



 
extern int futimens (int __fd, const struct timespec __times[2]) __attribute__ ((__nothrow__ , __leaf__));















 





# define _MKNOD_VER	0


 
# 406 "/usr/include/x86_64-linux-gnu/sys/stat.h"
extern int __fxstat (int __ver, int __fildes, struct stat *__stat_buf) __asm__ ("" "__fxstat64") __attribute__ ((__nothrow__ , __leaf__))

     __attribute__ ((__nonnull__ (3)));
extern int __xstat (int __ver, const char *__filename, struct stat *__stat_buf) __asm__ ("" "__xstat64") __attribute__ ((__nothrow__ , __leaf__))

     __attribute__ ((__nonnull__ (2, 3)));
extern int __lxstat (int __ver, const char *__filename, struct stat *__stat_buf) __asm__ ("" "__lxstat64") __attribute__ ((__nothrow__ , __leaf__))

     __attribute__ ((__nonnull__ (2, 3)));
extern int __fxstatat (int __ver, int __fildes, const char *__filename, struct stat *__stat_buf, int __flag) __asm__ ("" "__fxstatat64") __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4)));




# 426 "/usr/include/x86_64-linux-gnu/sys/stat.h"


extern int __fxstat64 (int __ver, int __fildes, struct stat64 *__stat_buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));
extern int __xstat64 (int __ver, const char *__filename,
		      struct stat64 *__stat_buf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
extern int __lxstat64 (int __ver, const char *__filename,
		       struct stat64 *__stat_buf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
extern int __fxstatat64 (int __ver, int __fildes, const char *__filename,
			 struct stat64 *__stat_buf, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4)));

extern int __xmknod (int __ver, const char *__path, __mode_t __mode,
		     __dev_t *__dev) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));

extern int __xmknodat (int __ver, int __fd, const char *__path,
		       __mode_t __mode, __dev_t *__dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 5)));


 

extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) stat (const char *__path, struct stat *__statbuf)
{
  return __xstat (1, __path, __statbuf);
}


extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) lstat (const char *__path, struct stat *__statbuf)
{
  return __lxstat (1, __path, __statbuf);
}


extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) fstat (int __fd, struct stat *__statbuf)
{
  return __fxstat (1, __fd, __statbuf);
}


extern __inline __attribute__ ((__gnu_inline__)) int

__attribute__ ((__nothrow__ , __leaf__)) fstatat (int __fd, const char *__filename, struct stat *__statbuf, int __flag)
{
  return __fxstatat (1, __fd, __filename, __statbuf, __flag);
}



extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) mknod (const char *__path, __mode_t __mode, __dev_t __dev)
{
  return __xmknod (0, __path, __mode, &__dev);
}



extern __inline __attribute__ ((__gnu_inline__)) int

__attribute__ ((__nothrow__ , __leaf__)) mknodat (int __fd, const char *__path, __mode_t __mode, __dev_t __dev)
{
  return __xmknodat (0, __fd, __path, __mode, &__dev);
}





extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) stat64 (const char *__path, struct stat64 *__statbuf)
{
  return __xstat64 (1, __path, __statbuf);
}


extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) lstat64 (const char *__path, struct stat64 *__statbuf)
{
  return __lxstat64 (1, __path, __statbuf);
}


extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) fstat64 (int __fd, struct stat64 *__statbuf)
{
  return __fxstat64 (1, __fd, __statbuf);
}


extern __inline __attribute__ ((__gnu_inline__)) int

__attribute__ ((__nothrow__ , __leaf__)) fstatat64 (int __fd, const char *__filename, struct stat64 *__statbuf, int __flag)
{
  return __fxstatat64 (1, __fd, __filename, __statbuf, __flag);
}









# 43 "redis-cli.c"
# 1 "/usr/include/x86_64-linux-gnu/sys/time.h"















 


#define _SYS_TIME_H	1

















 
# define TIMEVAL_TO_TIMESPEC(tv, ts) {                                   	(ts)->tv_sec = (tv)->tv_sec;                                    	(ts)->tv_nsec = (tv)->tv_usec * 1000;                           }



# define TIMESPEC_TO_TIMEVAL(tv, ts) {                                   	(tv)->tv_sec = (ts)->tv_sec;                                    	(tv)->tv_usec = (ts)->tv_nsec / 1000;                           }








 
struct timezone
  {
    int tz_minuteswest;		 
    int tz_dsttime;		 
  };

typedef struct timezone *__restrict __timezone_ptr_t;








 
extern int gettimeofday (struct timeval *__restrict __tv,
			 __timezone_ptr_t __tz) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



 
extern int settimeofday (const struct timeval *__tv,
			 const struct timezone *__tz)
     __attribute__ ((__nothrow__ , __leaf__));




 
extern int adjtime (const struct timeval *__delta,
		    struct timeval *__olddelta) __attribute__ ((__nothrow__ , __leaf__));



 
enum __itimer_which
  {
     
    ITIMER_REAL = 0,
#define ITIMER_REAL ITIMER_REAL
     
    ITIMER_VIRTUAL = 1,
#define ITIMER_VIRTUAL ITIMER_VIRTUAL
    
 
    ITIMER_PROF = 2
#define ITIMER_PROF ITIMER_PROF
  };


 
struct itimerval
  {
     
    struct timeval it_interval;
     
    struct timeval it_value;
  };



 
typedef enum __itimer_which __itimer_which_t;





 
extern int getitimer (__itimer_which_t __which,
		      struct itimerval *__value) __attribute__ ((__nothrow__ , __leaf__));



 
extern int setitimer (__itimer_which_t __which,
		      const struct itimerval *__restrict __new,
		      struct itimerval *__restrict __old) __attribute__ ((__nothrow__ , __leaf__));



 
extern int utimes (const char *__file, const struct timeval __tvp[2])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


 
extern int lutimes (const char *__file, const struct timeval __tvp[2])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int futimes (int __fd, const struct timeval __tvp[2]) __attribute__ ((__nothrow__ , __leaf__));





 
extern int futimesat (int __fd, const char *__file,
		      const struct timeval __tvp[2]) __attribute__ ((__nothrow__ , __leaf__));





 
# define timerisset(tvp)	((tvp)->tv_sec || (tvp)->tv_usec)
# define timerclear(tvp)	((tvp)->tv_sec = (tvp)->tv_usec = 0)
# define timercmp(a, b, CMP) 						        (((a)->tv_sec == (b)->tv_sec) ? 					         ((a)->tv_usec CMP (b)->tv_usec) : 					         ((a)->tv_sec CMP (b)->tv_sec))



# define timeradd(a, b, result)						        do {									          (result)->tv_sec = (a)->tv_sec + (b)->tv_sec;			          (result)->tv_usec = (a)->tv_usec + (b)->tv_usec;			          if ((result)->tv_usec >= 1000000)					            {									      	++(result)->tv_sec;						      	(result)->tv_usec -= 1000000;					            }									        } while (0)
# 175 "/usr/include/x86_64-linux-gnu/sys/time.h"
# define timersub(a, b, result)						        do {									          (result)->tv_sec = (a)->tv_sec - (b)->tv_sec;			          (result)->tv_usec = (a)->tv_usec - (b)->tv_usec;			          if ((result)->tv_usec < 0) {					            --(result)->tv_sec;						            (result)->tv_usec += 1000000;					          }									        } while (0)
# 185 "/usr/include/x86_64-linux-gnu/sys/time.h"



# 44 "redis-cli.c"
# 1 "/usr/include/assert.h"















 



 

# 33 "/usr/include/assert.h"

#define	_ASSERT_H	1





# define __ASSERT_VOID_CAST (void)





 

# 63 "/usr/include/assert.h"


#define _ASSERT_H_DECLS


 
extern void __assert_fail (const char *__assertion, const char *__file,
			   unsigned int __line, const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));

 
extern void __assert_perror_fail (int __errnum, const char *__file,
				  unsigned int __line, const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));



 
extern void __assert (const char *__assertion, const char *__file, int __line)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));







 
# 97 "/usr/include/assert.h"
#  define assert(expr)							    ((expr)								     ? __ASSERT_VOID_CAST (0)						     : __assert_fail (#expr, __FILE__, __LINE__, __ASSERT_FUNCTION))
# 115 "/usr/include/assert.h"


#  define assert_perror(errnum)						  (!(errnum)								   ? __ASSERT_VOID_CAST (0)						   : __assert_perror_fail ((errnum), __FILE__, __LINE__, __ASSERT_FUNCTION))









 

#   define __ASSERT_FUNCTION	__extension__ __PRETTY_FUNCTION__
# 137 "/usr/include/assert.h"





# undef static_assert
# define static_assert _Static_assert
# 45 "redis-cli.c"
# 1 "/usr/include/fcntl.h"















 



 


#define	_FCNTL_H	1



 


 



 
# 1 "/usr/include/x86_64-linux-gnu/bits/fcntl.h"
















 






# define __O_LARGEFILE	0



 
# define F_GETLK64	5	 
# define F_SETLK64	6	 
# define F_SETLKW64	7	 



struct flock
  {
    short int l_type;	 
    short int l_whence;	 




    __off64_t l_start;	 
    __off64_t l_len;	 

    __pid_t l_pid;	 
  };


struct flock64
  {
    short int l_type;	 
    short int l_whence;	 
    __off64_t l_start;	 
    __off64_t l_len;	 
    __pid_t l_pid;	 
  };


 
# 1 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h"
















 

















 

# 1 "/usr/include/x86_64-linux-gnu/bits/types/struct_iovec.h"
















 


#define __iovec_defined 1

#define __need_size_t
# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"










 





# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





















 



 








 
# 44 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 


 



 







 
# 91 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 









 
# 116 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





 

 


 
# 164 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

 


 
# 238 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#undef	__need_size_t






 


 
# 349 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

# 361 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 
 
 
# 395 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 

# 412 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#undef	__need_NULL

# 449 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

# 19 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"
# 24 "/usr/include/x86_64-linux-gnu/bits/types/struct_iovec.h"

 
struct iovec
  {
    void *iov_base;	 
    size_t iov_len;	 
  };

# 39 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h"


 
#define O_ACCMODE	   0003
#define O_RDONLY	     00
#define O_WRONLY	     01
#define O_RDWR		     02

# define O_CREAT	   0100	 


# define O_EXCL		   0200	 


# define O_NOCTTY	   0400	 


# define O_TRUNC	  01000	 


# define O_APPEND	  02000


# define O_NONBLOCK	  04000


# define O_NDELAY	O_NONBLOCK


# define O_SYNC	       04010000

#define O_FSYNC		O_SYNC

# define O_ASYNC	 020000






# define __O_DIRECTORY	0200000


# define __O_NOFOLLOW	0400000


# define __O_CLOEXEC   02000000


# define __O_DIRECT	 040000


# define __O_NOATIME   01000000


# define __O_PATH     010000000


# define __O_DSYNC	 010000


# define __O_TMPFILE   (020000000 | __O_DIRECTORY)


# 109 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h"
#  define F_GETLK	F_GETLK64   
#  define F_SETLK	F_SETLK64   
#  define F_SETLKW	F_SETLKW64  
# 119 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h"











 

# define F_OFD_GETLK	36
# define F_OFD_SETLK	37
# define F_OFD_SETLKW	38



# define O_LARGEFILE __O_LARGEFILE



# define O_DIRECTORY	__O_DIRECTORY	 
# define O_NOFOLLOW	__O_NOFOLLOW	 
# define O_CLOEXEC	__O_CLOEXEC	 



# define O_DIRECT	__O_DIRECT	 
# define O_NOATIME	__O_NOATIME	 
# define O_PATH		__O_PATH	 
# define O_TMPFILE	__O_TMPFILE	 




 

# define O_DSYNC	__O_DSYNC	 



#  define O_RSYNC	O_SYNC		 



 
#define F_DUPFD		0	 
#define F_GETFD		1	 
#define F_SETFD		2	 
#define F_GETFL		3	 
#define F_SETFL		4	 


# define __F_SETOWN	8
# define __F_GETOWN	9



# define F_SETOWN	__F_SETOWN  
# define F_GETOWN	__F_GETOWN  



# define __F_SETSIG	10	 
# define __F_GETSIG	11	 


# define __F_SETOWN_EX	15	 
# define __F_GETOWN_EX	16	 



# define F_SETSIG	__F_SETSIG	 
# define F_GETSIG	__F_GETSIG	 
# define F_SETOWN_EX	__F_SETOWN_EX	 
# define F_GETOWN_EX	__F_GETOWN_EX	 



# define F_SETLEASE	1024	 
# define F_GETLEASE	1025	 
# define F_NOTIFY	1026	 
# define F_SETPIPE_SZ	1031	 
# define F_GETPIPE_SZ	1032	 
# define F_ADD_SEALS	1033	 
# define F_GET_SEALS	1034	 
 
# define F_GET_RW_HINT	1035
# define F_SET_RW_HINT	1036
# define F_GET_FILE_RW_HINT	1037
# define F_SET_FILE_RW_HINT	1038


# define F_DUPFD_CLOEXEC 1030	



 
#define FD_CLOEXEC	1	 


 
# define F_RDLCK		0	 
# define F_WRLCK		1	 
# define F_UNLCK		2	 



 

# define F_EXLCK		4	 
# define F_SHLCK		8	 



 
# define LOCK_SH	1	 
# define LOCK_EX	2	 
# define LOCK_NB	4	# define LOCK_UN	8	 





# define LOCK_MAND	32	 
# define LOCK_READ	64	 
# define LOCK_WRITE	128	 
# define LOCK_RW	192	 



 
# define DN_ACCESS	0x00000001	 
# define DN_MODIFY	0x00000002	 
# define DN_CREATE	0x00000004	 
# define DN_DELETE	0x00000008	 
# define DN_RENAME	0x00000010	 
# define DN_ATTRIB	0x00000020	 
# define DN_MULTISHOT	0x80000000	 




 
enum __pid_type
  {
    F_OWNER_TID = 0,		 
    F_OWNER_PID,		 
    F_OWNER_PGRP,		 
    F_OWNER_GID = F_OWNER_PGRP	 
  };

 
struct f_owner_ex
  {
    enum __pid_type type;	 
    __pid_t pid;		 
  };



 
# define F_SEAL_SEAL	0x0001	 
# define F_SEAL_SHRINK	0x0002	 
# define F_SEAL_GROW	0x0004	 
# define F_SEAL_WRITE	0x0008	 



 
# define RWF_WRITE_LIFE_NOT_SET	0
# define RWH_WRITE_LIFE_NONE	1
# define RWH_WRITE_LIFE_SHORT	2
# define RWH_WRITE_LIFE_MEDIUM	3
# define RWH_WRITE_LIFE_LONG	4
# define RWH_WRITE_LIFE_EXTREME	5



 

# define FAPPEND	O_APPEND
# define FFSYNC		O_FSYNC
# define FASYNC		O_ASYNC
# define FNONBLOCK	O_NONBLOCK
# define FNDELAY	O_NDELAY



#  define __POSIX_FADV_DONTNEED	4
#  define __POSIX_FADV_NOREUSE	5

 

# define POSIX_FADV_NORMAL	0  
# define POSIX_FADV_RANDOM	1  
# define POSIX_FADV_SEQUENTIAL	2  
# define POSIX_FADV_WILLNEED	3  
# define POSIX_FADV_DONTNEED	__POSIX_FADV_DONTNEED  
# define POSIX_FADV_NOREUSE	__POSIX_FADV_NOREUSE  




 
# define SYNC_FILE_RANGE_WAIT_BEFORE	1 # define SYNC_FILE_RANGE_WRITE		2 # define SYNC_FILE_RANGE_WAIT_AFTER	4 
# 336 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h"
 
# define SPLICE_F_MOVE		1	 
# define SPLICE_F_NONBLOCK	2	# define SPLICE_F_MORE		4	 



# define SPLICE_F_GIFT		8	 


 
# 1 "/usr/include/linux/falloc.h"
 

#define _FALLOC_H_

#define FALLOC_FL_KEEP_SIZE	0x01  
#define FALLOC_FL_PUNCH_HOLE	0x02  
#define FALLOC_FL_NO_HIDE_STALE	0x04  




















 
#define FALLOC_FL_COLLAPSE_RANGE	0x08












 
#define FALLOC_FL_ZERO_RANGE		0x10















 
#define FALLOC_FL_INSERT_RANGE		0x20
















 
#define FALLOC_FL_UNSHARE_RANGE		0x40

# 347 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h"


 
struct file_handle
{
  unsigned int handle_bytes;
  int handle_type;
   
  unsigned char f_handle[0];
};

 
# define MAX_HANDLE_SZ	128


 

# define AT_FDCWD		-100	# define AT_SYMLINK_NOFOLLOW	0x100	 



# define AT_REMOVEDIR		0x200	# define AT_SYMLINK_FOLLOW	0x400	 



#  define AT_NO_AUTOMOUNT	0x800	#  define AT_EMPTY_PATH		0x1000	 



# define AT_EACCESS		0x200	







 
extern __ssize_t readahead (int __fd, __off64_t __offset, size_t __count)
    __attribute__ ((__nothrow__ , __leaf__));





 
extern int sync_file_range (int __fd, __off64_t __offset, __off64_t __count,
			    unsigned int __flags);





 
extern __ssize_t vmsplice (int __fdout, const struct iovec *__iov,
			   size_t __count, unsigned int __flags);




 
extern __ssize_t splice (int __fdin, __off64_t *__offin, int __fdout,
			 __off64_t *__offout, size_t __len,
			 unsigned int __flags);




 
extern __ssize_t tee (int __fdin, int __fdout, size_t __len,
		      unsigned int __flags);




 




extern int fallocate (int __fd, int __mode, __off64_t __offset, __off64_t __len) __asm__ ("" "fallocate64");
# 435 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h"
extern int fallocate64 (int __fd, int __mode, __off64_t __offset,
			__off64_t __len);



 
extern int name_to_handle_at (int __dfd, const char *__name,
			      struct file_handle *__handle, int *__mnt_id,
			      int __flags) __attribute__ ((__nothrow__ , __leaf__));




 
extern int open_by_handle_at (int __mountdirfd, struct file_handle *__handle,
			      int __flags);




# 62 "/usr/include/x86_64-linux-gnu/bits/fcntl.h"
# 36 "/usr/include/fcntl.h"


 

# define __OPEN_NEEDS_MODE(oflag)   (((oflag) & O_CREAT) != 0 || ((oflag) & __O_TMPFILE) == __O_TMPFILE)







 





# 62 "/usr/include/fcntl.h"











 
# 1 "/usr/include/x86_64-linux-gnu/bits/stat.h"















 





# 79 "/usr/include/fcntl.h"

# define S_IFMT		__S_IFMT
# define S_IFDIR	__S_IFDIR
# define S_IFCHR	__S_IFCHR
# define S_IFBLK	__S_IFBLK
# define S_IFREG	__S_IFREG

#  define S_IFIFO	__S_IFIFO


#  define S_IFLNK	__S_IFLNK


#  define S_IFSOCK	__S_IFSOCK


 

# define S_ISUID	__S_ISUID        
# define S_ISGID	__S_ISGID        


 
#  define S_ISVTX	__S_ISVTX


# define S_IRUSR	__S_IREAD        
# define S_IWUSR	__S_IWRITE       
# define S_IXUSR	__S_IEXEC        
 
# define S_IRWXU	(__S_IREAD|__S_IWRITE|__S_IEXEC)

# define S_IRGRP	(S_IRUSR >> 3)   
# define S_IWGRP	(S_IWUSR >> 3)   
# define S_IXGRP	(S_IXUSR >> 3)   
 
# define S_IRWXG	(S_IRWXU >> 3)

# define S_IROTH	(S_IRGRP >> 3)   
# define S_IWOTH	(S_IWGRP >> 3)   
# define S_IXOTH	(S_IXGRP >> 3)   
 
# define S_IRWXO	(S_IRWXG >> 3)


# 134 "/usr/include/fcntl.h"

 

# define SEEK_SET	0	 
# define SEEK_CUR	1	 
# define SEEK_END	2	 






 
extern int fcntl (int __fd, int __cmd, ...);







 




extern int open (const char *__file, int __oflag, ...) __asm__ ("" "open64")
     __attribute__ ((__nonnull__ (1)));





extern int open64 (const char *__file, int __oflag, ...) __attribute__ ((__nonnull__ (1)));











 





extern int openat (int __fd, const char *__file, int __oflag, ...) __asm__ ("" "openat64") __attribute__ ((__nonnull__ (2)));
# 192 "/usr/include/fcntl.h"
extern int openat64 (int __fd, const char *__file, int __oflag, ...)
     __attribute__ ((__nonnull__ (2)));







 




extern int creat (const char *__file, mode_t __mode) __asm__ ("" "creat64") __attribute__ ((__nonnull__ (1)));
# 213 "/usr/include/fcntl.h"
extern int creat64 (const char *__file, mode_t __mode) __attribute__ ((__nonnull__ (1)));


# 244 "/usr/include/fcntl.h"



 





extern int posix_fadvise (int __fd, __off64_t __offset, __off64_t __len, int __advise) __asm__ ("" "posix_fadvise64") __attribute__ ((__nothrow__ , __leaf__));
# 261 "/usr/include/fcntl.h"
extern int posix_fadvise64 (int __fd, off64_t __offset, off64_t __len,
			    int __advise) __attribute__ ((__nothrow__ , __leaf__));






 




extern int posix_fallocate (int __fd, __off64_t __offset, __off64_t __len) __asm__ ("" "posix_fallocate64");
# 282 "/usr/include/fcntl.h"
extern int posix_fallocate64 (int __fd, off64_t __offset, off64_t __len);




 
# 1 "/usr/include/x86_64-linux-gnu/bits/fcntl2.h"
















 






 





extern int __open_2 (const char *__path, int __oflag) __asm__ ("" "__open64_2") __attribute__ ((__nonnull__ (1)));

extern int __open_alias (const char *__path, int __oflag, ...) __asm__ ("" "open64") __attribute__ ((__nonnull__ (1)));



extern void __open_too_many_args (void) __attribute__((__error__ ("open can be called either with 2 or 3 arguments, not more")));

extern void __open_missing_mode (void) __attribute__((__error__ ("open with O_CREAT or O_TMPFILE in second argument needs 3 arguments")));

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
open (const char *__path, int __oflag, ...)
{
  if (__builtin_va_arg_pack_len () > 1)
    __open_too_many_args ();

  if (__builtin_constant_p (__oflag))
    {
      if ((((__oflag) & 0100) != 0 || ((__oflag) & (020000000 | 0200000)) == (020000000 | 0200000)) && __builtin_va_arg_pack_len () < 1)
	{
	  __open_missing_mode ();
	  return __open_2 (__path, __oflag);
	}
      return __open_alias (__path, __oflag, (__builtin_va_alist));
    }

  if (__builtin_va_arg_pack_len () < 1)
    return __open_2 (__path, __oflag);

  return __open_alias (__path, __oflag, (__builtin_va_alist));
}



extern int __open64_2 (const char *__path, int __oflag) __attribute__ ((__nonnull__ (1)));
extern int __open64_alias (const char *__path, int __oflag, ...) __asm__ ("" "open64") __attribute__ ((__nonnull__ (1)));


extern void __open64_too_many_args (void) __attribute__((__error__ ("open64 can be called either with 2 or 3 arguments, not more")));

extern void __open64_missing_mode (void) __attribute__((__error__ ("open64 with O_CREAT or O_TMPFILE in second argument needs 3 arguments")));

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
open64 (const char *__path, int __oflag, ...)
{
  if (__builtin_va_arg_pack_len () > 1)
    __open64_too_many_args ();

  if (__builtin_constant_p (__oflag))
    {
      if ((((__oflag) & 0100) != 0 || ((__oflag) & (020000000 | 0200000)) == (020000000 | 0200000)) && __builtin_va_arg_pack_len () < 1)
	{
	  __open64_missing_mode ();
	  return __open64_2 (__path, __oflag);
	}
      return __open64_alias (__path, __oflag, (__builtin_va_alist));
    }

  if (__builtin_va_arg_pack_len () < 1)
    return __open64_2 (__path, __oflag);

  return __open64_alias (__path, __oflag, (__builtin_va_alist));
}



# 104 "/usr/include/x86_64-linux-gnu/bits/fcntl2.h"
extern int __openat_2 (int __fd, const char *__path, int __oflag) __asm__ ("" "__openat64_2")

     __attribute__ ((__nonnull__ (2)));
extern int __openat_alias (int __fd, const char *__path, int __oflag, ...) __asm__ ("" "openat64")

     __attribute__ ((__nonnull__ (2)));


extern void __openat_too_many_args (void) __attribute__((__error__ ("openat can be called either with 3 or 4 arguments, not more")));

extern void __openat_missing_mode (void) __attribute__((__error__ ("openat with O_CREAT or O_TMPFILE in third argument needs 4 arguments")));

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
openat (int __fd, const char *__path, int __oflag, ...)
{
  if (__builtin_va_arg_pack_len () > 1)
    __openat_too_many_args ();

  if (__builtin_constant_p (__oflag))
    {
      if ((((__oflag) & 0100) != 0 || ((__oflag) & (020000000 | 0200000)) == (020000000 | 0200000)) && __builtin_va_arg_pack_len () < 1)
	{
	  __openat_missing_mode ();
	  return __openat_2 (__fd, __path, __oflag);
	}
      return __openat_alias (__fd, __path, __oflag, (__builtin_va_alist));
    }

  if (__builtin_va_arg_pack_len () < 1)
    return __openat_2 (__fd, __path, __oflag);

  return __openat_alias (__fd, __path, __oflag, (__builtin_va_alist));
}



extern int __openat64_2 (int __fd, const char *__path, int __oflag)
     __attribute__ ((__nonnull__ (2)));
extern int __openat64_alias (int __fd, const char *__path, int __oflag, ...) __asm__ ("" "openat64")

     __attribute__ ((__nonnull__ (2)));

extern void __openat64_too_many_args (void) __attribute__((__error__ ("openat64 can be called either with 3 or 4 arguments, not more")));

extern void __openat64_missing_mode (void) __attribute__((__error__ ("openat64 with O_CREAT or O_TMPFILE in third argument needs 4 arguments")));

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) int
openat64 (int __fd, const char *__path, int __oflag, ...)
{
  if (__builtin_va_arg_pack_len () > 1)
    __openat64_too_many_args ();

  if (__builtin_constant_p (__oflag))
    {
      if ((((__oflag) & 0100) != 0 || ((__oflag) & (020000000 | 0200000)) == (020000000 | 0200000)) && __builtin_va_arg_pack_len () < 1)
	{
	  __openat64_missing_mode ();
	  return __openat64_2 (__fd, __path, __oflag);
	}
      return __openat64_alias (__fd, __path, __oflag, (__builtin_va_alist));
    }

  if (__builtin_va_arg_pack_len () < 1)
    return __openat64_2 (__fd, __path, __oflag);

  return __openat64_alias (__fd, __path, __oflag, (__builtin_va_alist));
}
# 291 "/usr/include/fcntl.h"




# 46 "redis-cli.c"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include-fixed/limits.h"





















 


 


 

#define _GCC_LIMITS_H_


 
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include-fixed/syslimits.h"



 

#define _GCC_NEXT_LIMITS_H		 
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include-fixed/limits.h"





















 


 


 
# 192 "/usr/lib/gcc/x86_64-linux-gnu/7/include-fixed/limits.h"

# 1 "/usr/include/limits.h"















 



 


#define _LIBC_LIMITS_H_	1

#define __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h"
















 







 





#undef __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION




 
#undef __GLIBC_USE_LIB_EXT2


# define __GLIBC_USE_LIB_EXT2 1





 
#undef __GLIBC_USE_IEC_60559_BFP_EXT

# define __GLIBC_USE_IEC_60559_BFP_EXT 1





 
#undef __GLIBC_USE_IEC_60559_FUNCS_EXT

# define __GLIBC_USE_IEC_60559_FUNCS_EXT 1





 
#undef __GLIBC_USE_IEC_60559_TYPES_EXT

# define __GLIBC_USE_IEC_60559_TYPES_EXT 1
# 27 "/usr/include/limits.h"




 
#define MB_LEN_MAX	16



 
# 114 "/usr/include/limits.h"



 



 







 


#  define LLONG_MIN	(-LLONG_MAX-1)


#  define LLONG_MAX	__LONG_LONG_MAX__


#  define ULLONG_MAX	(LLONG_MAX * 2ULL + 1)





 


#  define CHAR_WIDTH 8


#  define SCHAR_WIDTH 8


#  define UCHAR_WIDTH 8


#  define SHRT_WIDTH 16


#  define USHRT_WIDTH 16


#  define INT_WIDTH 32


#  define UINT_WIDTH 32


#  define LONG_WIDTH __WORDSIZE


#  define ULONG_WIDTH __WORDSIZE


#  define LLONG_WIDTH 64


#  define ULLONG_WIDTH 64




 
# 1 "/usr/include/x86_64-linux-gnu/bits/posix1_lim.h"















 





 


#define	_BITS_POSIX1_LIM_H	1


 

 
#define _POSIX_AIO_LISTIO_MAX	2

 
#define _POSIX_AIO_MAX		1

 
#define	_POSIX_ARG_MAX		4096

 

# define _POSIX_CHILD_MAX	25




 
#define _POSIX_DELAYTIMER_MAX	32


 
#define _POSIX_HOST_NAME_MAX	255

 
#define	_POSIX_LINK_MAX		8

 
#define	_POSIX_LOGIN_NAME_MAX	9

 
#define	_POSIX_MAX_CANON	255


 
#define	_POSIX_MAX_INPUT	255

 
#define _POSIX_MQ_OPEN_MAX	8

 
#define _POSIX_MQ_PRIO_MAX	32

 
#define	_POSIX_NAME_MAX		14

 

# define _POSIX_NGROUPS_MAX	8




 

# define _POSIX_OPEN_MAX	20






 
# define _POSIX_FD_SETSIZE	_POSIX_OPEN_MAX


 
#define	_POSIX_PATH_MAX		256

 
#define	_POSIX_PIPE_BUF		512


 
#define _POSIX_RE_DUP_MAX	255

 
#define _POSIX_RTSIG_MAX	8

 
#define _POSIX_SEM_NSEMS_MAX	256

 
#define _POSIX_SEM_VALUE_MAX	32767

 
#define _POSIX_SIGQUEUE_MAX	32

 
#define	_POSIX_SSIZE_MAX	32767

 
#define	_POSIX_STREAM_MAX	8

 
#define _POSIX_SYMLINK_MAX	255


 
#define _POSIX_SYMLOOP_MAX	8

 
#define _POSIX_TIMER_MAX	32

 
#define	_POSIX_TTY_NAME_MAX	9

 

# define _POSIX_TZNAME_MAX	6





 
# define _POSIX_QLIMIT		1


 
# define _POSIX_HIWAT		_POSIX_PIPE_BUF

 
# define _POSIX_UIO_MAXIOV	16


 
#define _POSIX_CLOCKRES_MIN	20000000


 
# 1 "/usr/include/x86_64-linux-gnu/bits/local_lim.h"
















 





 

# define __undef_NR_OPEN


# define __undef_LINK_MAX


# define __undef_OPEN_MAX


# define __undef_ARG_MAX


 
# 1 "/usr/include/linux/limits.h"
 

#define _LINUX_LIMITS_H

#define NR_OPEN	        1024

#define NGROUPS_MAX    65536	 
#define ARG_MAX       131072	 
#define LINK_MAX         127	 
#define MAX_CANON        255	 
#define MAX_INPUT        255	 
#define NAME_MAX         255	 
#define PATH_MAX        4096	 
#define PIPE_BUF        4096	 
#define XATTR_NAME_MAX   255	 
#define XATTR_SIZE_MAX 65536	 
#define XATTR_LIST_MAX 65536	 

#define RTSIG_MAX	  32

# 39 "/usr/include/x86_64-linux-gnu/bits/local_lim.h"

 

# undef NR_OPEN
# undef __undef_NR_OPEN

 

# undef LINK_MAX
# undef __undef_LINK_MAX

 

# undef OPEN_MAX
# undef __undef_OPEN_MAX

 

# undef ARG_MAX
# undef __undef_ARG_MAX


 
#define _POSIX_THREAD_KEYS_MAX	128
 
#define PTHREAD_KEYS_MAX	1024

 
#define _POSIX_THREAD_DESTRUCTOR_ITERATIONS	4
 
#define PTHREAD_DESTRUCTOR_ITERATIONS	_POSIX_THREAD_DESTRUCTOR_ITERATIONS

 
#define _POSIX_THREAD_THREADS_MAX	64
 
#undef PTHREAD_THREADS_MAX


 
#define AIO_PRIO_DELTA_MAX	20

 
#define PTHREAD_STACK_MIN	16384

 
#define DELAYTIMER_MAX	2147483647

 
#define TTY_NAME_MAX		32

 
#define LOGIN_NAME_MAX		256

 
#define HOST_NAME_MAX		64

 
#define MQ_PRIO_MAX		32768

 
#define SEM_VALUE_MAX   (2147483647)
# 161 "/usr/include/x86_64-linux-gnu/bits/posix1_lim.h"



# define SSIZE_MAX	LONG_MAX




 





# 184 "/usr/include/limits.h"


# 1 "/usr/include/x86_64-linux-gnu/bits/posix2_lim.h"















 



 


#define	_BITS_POSIX2_LIM_H	1


 
#define	_POSIX2_BC_BASE_MAX		99

 
#define	_POSIX2_BC_DIM_MAX		2048

 
#define	_POSIX2_BC_SCALE_MAX		99

 
#define	_POSIX2_BC_STRING_MAX		1000


 
#define	_POSIX2_COLL_WEIGHTS_MAX	2


 
#define	_POSIX2_EXPR_NEST_MAX		32

 
#define	_POSIX2_LINE_MAX		2048


 
#define	_POSIX2_RE_DUP_MAX		255


 
#define	_POSIX2_CHARCLASS_NAME_MAX	14




 


#define	BC_BASE_MAX		_POSIX2_BC_BASE_MAX


#define	BC_DIM_MAX		_POSIX2_BC_DIM_MAX


#define	BC_SCALE_MAX		_POSIX2_BC_SCALE_MAX


#define	BC_STRING_MAX		_POSIX2_BC_STRING_MAX


#define	COLL_WEIGHTS_MAX	255


#define	EXPR_NEST_MAX		_POSIX2_EXPR_NEST_MAX


#define	LINE_MAX		_POSIX2_LINE_MAX


#define	CHARCLASS_NAME_MAX	2048


 
#define	RE_DUP_MAX (0x7fff)

# 188 "/usr/include/limits.h"


# 1 "/usr/include/x86_64-linux-gnu/bits/xopen_lim.h"















 



 






 


#define _XOPEN_LIM_H	1


























 



 
#define	_XOPEN_IOV_MAX	_POSIX_UIO_MAXIOV

# 1 "/usr/include/x86_64-linux-gnu/bits/uio_lim.h"
















 


#define _BITS_UIO_LIM_H 1








 
#define __IOV_MAX	1024

# 65 "/usr/include/x86_64-linux-gnu/bits/xopen_lim.h"

# define IOV_MAX __IOV_MAX





 
#define NL_ARGMAX	_POSIX_ARG_MAX

 
#define NL_LANGMAX	_POSIX2_LINE_MAX

 
#define NL_MSGMAX	INT_MAX


 

# define NL_NMAX	INT_MAX


 
#define NL_SETMAX	INT_MAX

 
#define NL_TEXTMAX	INT_MAX

 
#define NZERO		20


 
# 114 "/usr/include/x86_64-linux-gnu/bits/xopen_lim.h"
#   define WORD_BIT	32
# 123 "/usr/include/x86_64-linux-gnu/bits/xopen_lim.h"

 
# 136 "/usr/include/x86_64-linux-gnu/bits/xopen_lim.h"
 
#  define LONG_BIT	64
# 147 "/usr/include/x86_64-linux-gnu/bits/xopen_lim.h"

# 192 "/usr/include/limits.h"
# 195 "/usr/lib/gcc/x86_64-linux-gnu/7/include-fixed/limits.h"


# 8 "/usr/lib/gcc/x86_64-linux-gnu/7/include-fixed/syslimits.h"
#undef _GCC_NEXT_LIMITS_H
# 35 "/usr/lib/gcc/x86_64-linux-gnu/7/include-fixed/limits.h"






















 


#define _LIMITS_H___

 
#undef CHAR_BIT
#define CHAR_BIT __CHAR_BIT__

 




 
#undef SCHAR_MIN
#define SCHAR_MIN (-SCHAR_MAX - 1)
#undef SCHAR_MAX
#define SCHAR_MAX __SCHAR_MAX__

 
#undef UCHAR_MAX



# define UCHAR_MAX (SCHAR_MAX * 2 + 1)


 
# 96 "/usr/lib/gcc/x86_64-linux-gnu/7/include-fixed/limits.h"
# undef CHAR_MIN
# define CHAR_MIN SCHAR_MIN
# undef CHAR_MAX
# define CHAR_MAX SCHAR_MAX


 
#undef SHRT_MIN
#define SHRT_MIN (-SHRT_MAX - 1)
#undef SHRT_MAX
#define SHRT_MAX __SHRT_MAX__

 
#undef USHRT_MAX



# define USHRT_MAX (SHRT_MAX * 2 + 1)


 
#undef INT_MIN
#define INT_MIN (-INT_MAX - 1)
#undef INT_MAX
#define INT_MAX __INT_MAX__

 
#undef UINT_MAX
#define UINT_MAX (INT_MAX * 2U + 1U)


 
#undef LONG_MIN
#define LONG_MIN (-LONG_MAX - 1L)
#undef LONG_MAX
#define LONG_MAX __LONG_MAX__

 
#undef ULONG_MAX
#define ULONG_MAX (LONG_MAX * 2UL + 1UL)


 
# undef LLONG_MIN
# define LLONG_MIN (-LLONG_MAX - 1LL)
# undef LLONG_MAX
# define LLONG_MAX __LONG_LONG_MAX__

 
# undef ULLONG_MAX
# define ULLONG_MAX (LLONG_MAX * 2ULL + 1ULL)



 
# undef LONG_LONG_MIN
# define LONG_LONG_MIN (-LONG_LONG_MAX - 1LL)
# undef LONG_LONG_MAX
# define LONG_LONG_MAX __LONG_LONG_MAX__

 
# undef ULONG_LONG_MAX
# define ULONG_LONG_MAX (LONG_LONG_MAX * 2ULL + 1ULL)


# 186 "/usr/lib/gcc/x86_64-linux-gnu/7/include-fixed/limits.h"



 

# 47 "redis-cli.c"
# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/math.h"










 

 
# 1 "/usr/include/math.h"
















 



 


#define	_MATH_H	1

#define __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h"
















 







 





#undef __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION




 
#undef __GLIBC_USE_LIB_EXT2


# define __GLIBC_USE_LIB_EXT2 1





 
#undef __GLIBC_USE_IEC_60559_BFP_EXT

# define __GLIBC_USE_IEC_60559_BFP_EXT 1





 
#undef __GLIBC_USE_IEC_60559_FUNCS_EXT

# define __GLIBC_USE_IEC_60559_FUNCS_EXT 1





 
#undef __GLIBC_USE_IEC_60559_TYPES_EXT

# define __GLIBC_USE_IEC_60559_TYPES_EXT 1
# 28 "/usr/include/math.h"








 


 
# 1 "/usr/include/x86_64-linux-gnu/bits/math-vector.h"
















 






 
# 1 "/usr/include/x86_64-linux-gnu/bits/libm-simd-decl-stubs.h"
















 













 


#define _BITS_LIBM_SIMD_DECL_STUBS_H 1

#define __DECL_SIMD_cos
#define __DECL_SIMD_cosf
#define __DECL_SIMD_cosl
#define __DECL_SIMD_cosf16
#define __DECL_SIMD_cosf32
#define __DECL_SIMD_cosf64
#define __DECL_SIMD_cosf128
#define __DECL_SIMD_cosf32x
#define __DECL_SIMD_cosf64x
#define __DECL_SIMD_cosf128x

#define __DECL_SIMD_sin
#define __DECL_SIMD_sinf
#define __DECL_SIMD_sinl
#define __DECL_SIMD_sinf16
#define __DECL_SIMD_sinf32
#define __DECL_SIMD_sinf64
#define __DECL_SIMD_sinf128
#define __DECL_SIMD_sinf32x
#define __DECL_SIMD_sinf64x
#define __DECL_SIMD_sinf128x

#define __DECL_SIMD_sincos
#define __DECL_SIMD_sincosf
#define __DECL_SIMD_sincosl
#define __DECL_SIMD_sincosf16
#define __DECL_SIMD_sincosf32
#define __DECL_SIMD_sincosf64
#define __DECL_SIMD_sincosf128
#define __DECL_SIMD_sincosf32x
#define __DECL_SIMD_sincosf64x
#define __DECL_SIMD_sincosf128x

#define __DECL_SIMD_log
#define __DECL_SIMD_logf
#define __DECL_SIMD_logl
#define __DECL_SIMD_logf16
#define __DECL_SIMD_logf32
#define __DECL_SIMD_logf64
#define __DECL_SIMD_logf128
#define __DECL_SIMD_logf32x
#define __DECL_SIMD_logf64x
#define __DECL_SIMD_logf128x

#define __DECL_SIMD_exp
#define __DECL_SIMD_expf
#define __DECL_SIMD_expl
#define __DECL_SIMD_expf16
#define __DECL_SIMD_expf32
#define __DECL_SIMD_expf64
#define __DECL_SIMD_expf128
#define __DECL_SIMD_expf32x
#define __DECL_SIMD_expf64x
#define __DECL_SIMD_expf128x

#define __DECL_SIMD_pow
#define __DECL_SIMD_powf
#define __DECL_SIMD_powl
#define __DECL_SIMD_powf16
#define __DECL_SIMD_powf32
#define __DECL_SIMD_powf64
#define __DECL_SIMD_powf128
#define __DECL_SIMD_powf32x
#define __DECL_SIMD_powf64x
#define __DECL_SIMD_powf128x
# 26 "/usr/include/x86_64-linux-gnu/bits/math-vector.h"

# 41 "/usr/include/math.h"

 



 

# define HUGE_VAL (__builtin_huge_val ())
# 59 "/usr/include/math.h"
#  define HUGE_VALF (__builtin_huge_valf ())
#  define HUGE_VALL (__builtin_huge_vall ())
# 70 "/usr/include/math.h"
# define HUGE_VAL_F32 (__builtin_huge_valf32 ())


# define HUGE_VAL_F64 (__builtin_huge_valf64 ())


# define HUGE_VAL_F128 (__builtin_huge_valf128 ())


# define HUGE_VAL_F32X (__builtin_huge_valf32x ())


# define HUGE_VAL_F64X (__builtin_huge_valf64x ())






 

#  define INFINITY (__builtin_inff ())




 

#  define NAN (__builtin_nanf (""))
# 106 "/usr/include/math.h"


 

#  define SNANF (__builtin_nansf (""))
#  define SNAN (__builtin_nans (""))
#  define SNANL (__builtin_nansl (""))
# 119 "/usr/include/math.h"
# define SNANF32 (__builtin_nansf32 (""))


# define SNANF64 (__builtin_nansf64 (""))


# define SNANF128 (__builtin_nansf128 (""))


# define SNANF32X (__builtin_nansf32x (""))


# define SNANF64X (__builtin_nansf64x (""))





 
# 1 "/usr/include/x86_64-linux-gnu/bits/flt-eval-method.h"
















 









#  define __GLIBC_FLT_EVAL_METHOD	__FLT_EVAL_METHOD__
# 139 "/usr/include/math.h"








 

typedef float float_t;
typedef double double_t;
# 179 "/usr/include/math.h"









 

# 1 "/usr/include/x86_64-linux-gnu/bits/fp-logb.h"
















 





#define __FP_LOGB0_IS_MIN	1
#define __FP_LOGBNAN_IS_MIN	1
# 191 "/usr/include/math.h"


#  define FP_ILOGB0	(-2147483647 - 1)




#  define FP_ILOGBNAN	(-2147483647 - 1)
# 207 "/usr/include/math.h"
#  define __FP_LONG_MAX 0x7fffffffffffffffL


#  define FP_LLOGB0	(-__FP_LONG_MAX - 1)




#  define FP_LLOGBNAN	(-__FP_LONG_MAX - 1)















 

# 1 "/usr/include/x86_64-linux-gnu/bits/fp-fast.h"
















 








 












# 234 "/usr/include/math.h"


 
enum
  {
    FP_INT_UPWARD =
# define FP_INT_UPWARD 0
      0,
    FP_INT_DOWNWARD =
# define FP_INT_DOWNWARD 1
      1,
    FP_INT_TOWARDZERO =
# define FP_INT_TOWARDZERO 2
      2,
    FP_INT_TONEARESTFROMZERO =
# define FP_INT_TONEARESTFROMZERO 3
      3,
    FP_INT_TONEAREST =
# define FP_INT_TONEAREST 4
      4,
  };





 

#define __SIMD_DECL(function) __CONCAT (__DECL_SIMD_, function)

#define __MATHCALL_VEC(function, suffix, args) 	  __SIMD_DECL (__MATH_PRECNAME (function, suffix))   __MATHCALL (function, suffix, args)



#define __MATHDECL_VEC(type, function,suffix, args)   __SIMD_DECL (__MATH_PRECNAME (function, suffix))   __MATHDECL(type, function,suffix, args)



#define __MATHCALL(function,suffix, args)	  __MATHDECL (_Mdouble_,function,suffix, args)

#define __MATHDECL(type, function,suffix, args)   __MATHDECL_1(type, function,suffix, args);   __MATHDECL_1(type, __CONCAT(__,function),suffix, args)


#define __MATHCALLX(function,suffix, args, attrib)	  __MATHDECLX (_Mdouble_,function,suffix, args, attrib)

#define __MATHDECLX(type, function,suffix, args, attrib)   __MATHDECL_1(type, function,suffix, args) __attribute__ (attrib);   __MATHDECL_1(type, __CONCAT(__,function),suffix, args) __attribute__ (attrib)


#define __MATHDECL_1(type, function,suffix, args)   extern type __MATH_PRECNAME(function,suffix) args __THROW


#define _Mdouble_		double
#define __MATH_PRECNAME(name,r)	__CONCAT(name,r)
#define __MATH_DECLARING_DOUBLE  1
#define __MATH_DECLARING_FLOATN  0
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h"
















 


 
extern int __fpclassify (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));

 
extern int __signbit (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


 
extern int __isinf (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int __finite (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int __isnan (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int __iseqsig (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern int __issignaling (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
# 290 "/usr/include/math.h"
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"
















 

























 






 

 
extern double acos (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __acos (double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern double asin (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __asin (double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern double atan (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atan (double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern double atan2 (double __y, double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atan2 (double __y, double __x) __attribute__ ((__nothrow__ , __leaf__));

 
 extern double cos (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cos (double __x) __attribute__ ((__nothrow__ , __leaf__));
 
 extern double sin (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sin (double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern double tan (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __tan (double __x) __attribute__ ((__nothrow__ , __leaf__));

 

 
extern double cosh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cosh (double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern double sinh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sinh (double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern double tanh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __tanh (double __x) __attribute__ ((__nothrow__ , __leaf__));


 

 extern void sincos (double __x, double *__sinx, double *__cosx) __attribute__ ((__nothrow__ , __leaf__)); extern void __sincos (double __x, double *__sinx, double *__cosx) __attribute__ ((__nothrow__ , __leaf__));



 
extern double acosh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __acosh (double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern double asinh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __asinh (double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern double atanh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atanh (double __x) __attribute__ ((__nothrow__ , __leaf__));


 

 
 extern double exp (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp (double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern double frexp (double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern double __frexp (double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));

 
extern double ldexp (double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern double __ldexp (double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));

 
 extern double log (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log (double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern double log10 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log10 (double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern double modf (double __x, double *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern double __modf (double __x, double *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


 
extern double exp10 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp10 (double __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern double expm1 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __expm1 (double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern double log1p (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log1p (double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern double logb (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __logb (double __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern double exp2 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp2 (double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern double log2 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log2 (double __x) __attribute__ ((__nothrow__ , __leaf__));



 

 
 extern double pow (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __pow (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern double sqrt (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sqrt (double __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern double hypot (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __hypot (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));



 
extern double cbrt (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cbrt (double __x) __attribute__ ((__nothrow__ , __leaf__));



 

 
extern double ceil (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __ceil (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern double fabs (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fabs (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern double floor (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __floor (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern double fmod (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __fmod (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));







 
extern int isinf (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern int finite (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern double drem (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __drem (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));


 
extern double significand (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __significand (double __x) __attribute__ ((__nothrow__ , __leaf__));





 
extern double copysign (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __copysign (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern double nan (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __nan (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));








 
extern int isnan (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




 
extern double j0 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __j0 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double j1 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __j1 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double jn (int, double) __attribute__ ((__nothrow__ , __leaf__)); extern double __jn (int, double) __attribute__ ((__nothrow__ , __leaf__));
extern double y0 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __y0 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double y1 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __y1 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double yn (int, double) __attribute__ ((__nothrow__ , __leaf__)); extern double __yn (int, double) __attribute__ ((__nothrow__ , __leaf__));




 
extern double erf (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __erf (double) __attribute__ ((__nothrow__ , __leaf__));
extern double erfc (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __erfc (double) __attribute__ ((__nothrow__ , __leaf__));
extern double lgamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __lgamma (double) __attribute__ ((__nothrow__ , __leaf__));



 
extern double tgamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __tgamma (double) __attribute__ ((__nothrow__ , __leaf__));




 
extern double gamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __gamma (double) __attribute__ ((__nothrow__ , __leaf__));






 
extern double lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern double __lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));





 
extern double rint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __rint (double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern double nextafter (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __nextafter (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));

extern double nexttoward (double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __nexttoward (double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));



 
extern double nextdown (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __nextdown (double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern double nextup (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __nextup (double __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern double remainder (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __remainder (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));


 
extern double scalbn (double __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalbn (double __x, int __n) __attribute__ ((__nothrow__ , __leaf__));


 
extern int ilogb (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogb (double __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern long int llogb (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __llogb (double __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern double scalbln (double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalbln (double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));


 
extern double nearbyint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __nearbyint (double __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern double round (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __round (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


 
extern double trunc (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __trunc (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern double remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern double __remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));


 


 
extern long int lrint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrint (double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrint (double __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern long int lround (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lround (double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llround (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llround (double __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern double fdim (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __fdim (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern double fmax (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fmax (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern double fmin (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fmin (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern double fma (double __x, double __y, double __z) __attribute__ ((__nothrow__ , __leaf__)); extern double __fma (double __x, double __y, double __z) __attribute__ ((__nothrow__ , __leaf__));



 
extern double roundeven (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __roundeven (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


 

extern __intmax_t fromfp (double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfp (double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));


 

extern __uintmax_t ufromfp (double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfp (double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));



 

extern __intmax_t fromfpx (double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpx (double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));



 

extern __uintmax_t ufromfpx (double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpx (double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));

 
extern double fmaxmag (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fmaxmag (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern double fminmag (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fminmag (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int totalorder (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));

 
extern int totalordermag (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));

 
extern int canonicalize (double *__cx, const double *__x) __attribute__ ((__nothrow__ , __leaf__));

 
extern double getpayload (const double *__x) __attribute__ ((__nothrow__ , __leaf__)); extern double __getpayload (const double *__x) __attribute__ ((__nothrow__ , __leaf__));

 
extern int setpayload (double *__x, double __payload) __attribute__ ((__nothrow__ , __leaf__));

 
extern int setpayloadsig (double *__x, double __payload) __attribute__ ((__nothrow__ , __leaf__));






 
extern double scalb (double __x, double __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalb (double __x, double __n) __attribute__ ((__nothrow__ , __leaf__));
# 291 "/usr/include/math.h"
#undef	_Mdouble_
#undef	__MATH_PRECNAME
#undef __MATH_DECLARING_DOUBLE
#undef __MATH_DECLARING_FLOATN





 

# define _Mdouble_		float
# define __MATH_PRECNAME(name,r) name##f##r
# define __MATH_DECLARING_DOUBLE  0
# define __MATH_DECLARING_FLOATN  0
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h"
















 


 
extern int __fpclassifyf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));

 
extern int __signbitf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


 
extern int __isinff (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int __finitef (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int __isnanf (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int __iseqsigf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern int __issignalingf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
# 307 "/usr/include/math.h"
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"
















 

























 






 

 
extern float acosf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __acosf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern float asinf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __asinf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern float atanf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atanf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern float atan2f (float __y, float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atan2f (float __y, float __x) __attribute__ ((__nothrow__ , __leaf__));

 
 extern float cosf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __cosf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 
 extern float sinf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sinf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern float tanf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __tanf (float __x) __attribute__ ((__nothrow__ , __leaf__));

 

 
extern float coshf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __coshf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern float sinhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sinhf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern float tanhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __tanhf (float __x) __attribute__ ((__nothrow__ , __leaf__));


 

 extern void sincosf (float __x, float *__sinx, float *__cosx) __attribute__ ((__nothrow__ , __leaf__)); extern void __sincosf (float __x, float *__sinx, float *__cosx) __attribute__ ((__nothrow__ , __leaf__));



 
extern float acoshf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __acoshf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern float asinhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __asinhf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern float atanhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atanhf (float __x) __attribute__ ((__nothrow__ , __leaf__));


 

 
 extern float expf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __expf (float __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern float frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern float __frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));

 
extern float ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern float __ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));

 
 extern float logf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __logf (float __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern float log10f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log10f (float __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern float modff (float __x, float *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern float __modff (float __x, float *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


 
extern float exp10f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __exp10f (float __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern float expm1f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __expm1f (float __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern float log1pf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log1pf (float __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern float logbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __logbf (float __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern float exp2f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __exp2f (float __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern float log2f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log2f (float __x) __attribute__ ((__nothrow__ , __leaf__));



 

 
 extern float powf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __powf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern float sqrtf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sqrtf (float __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern float hypotf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __hypotf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));



 
extern float cbrtf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __cbrtf (float __x) __attribute__ ((__nothrow__ , __leaf__));



 

 
extern float ceilf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __ceilf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern float fabsf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fabsf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern float floorf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __floorf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern float fmodf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __fmodf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));







 
extern int isinff (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern int finitef (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern float dremf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __dremf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));


 
extern float significandf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __significandf (float __x) __attribute__ ((__nothrow__ , __leaf__));





 
extern float copysignf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __copysignf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern float nanf (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __nanf (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));








 
extern int isnanf (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




 
extern float j0f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __j0f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float j1f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __j1f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float jnf (int, float) __attribute__ ((__nothrow__ , __leaf__)); extern float __jnf (int, float) __attribute__ ((__nothrow__ , __leaf__));
extern float y0f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __y0f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float y1f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __y1f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float ynf (int, float) __attribute__ ((__nothrow__ , __leaf__)); extern float __ynf (int, float) __attribute__ ((__nothrow__ , __leaf__));




 
extern float erff (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __erff (float) __attribute__ ((__nothrow__ , __leaf__));
extern float erfcf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __erfcf (float) __attribute__ ((__nothrow__ , __leaf__));
extern float lgammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __lgammaf (float) __attribute__ ((__nothrow__ , __leaf__));



 
extern float tgammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __tgammaf (float) __attribute__ ((__nothrow__ , __leaf__));




 
extern float gammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __gammaf (float) __attribute__ ((__nothrow__ , __leaf__));






 
extern float lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern float __lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));





 
extern float rintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __rintf (float __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern float nextafterf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __nextafterf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));

extern float nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));



 
extern float nextdownf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __nextdownf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern float nextupf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __nextupf (float __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern float remainderf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __remainderf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));


 
extern float scalbnf (float __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalbnf (float __x, int __n) __attribute__ ((__nothrow__ , __leaf__));


 
extern int ilogbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbf (float __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern long int llogbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __llogbf (float __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern float scalblnf (float __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalblnf (float __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));


 
extern float nearbyintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __nearbyintf (float __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern float roundf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __roundf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


 
extern float truncf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __truncf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern float remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern float __remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));


 


 
extern long int lrintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintf (float __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintf (float __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern long int lroundf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundf (float __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundf (float __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern float fdimf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __fdimf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern float fmaxf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fmaxf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern float fminf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fminf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern float fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__ , __leaf__)); extern float __fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__ , __leaf__));



 
extern float roundevenf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __roundevenf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


 

extern __intmax_t fromfpf (float __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpf (float __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));


 

extern __uintmax_t ufromfpf (float __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpf (float __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));



 

extern __intmax_t fromfpxf (float __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpxf (float __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));



 

extern __uintmax_t ufromfpxf (float __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpxf (float __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));

 
extern float fmaxmagf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fmaxmagf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern float fminmagf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fminmagf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int totalorderf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));

 
extern int totalordermagf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));

 
extern int canonicalizef (float *__cx, const float *__x) __attribute__ ((__nothrow__ , __leaf__));

 
extern float getpayloadf (const float *__x) __attribute__ ((__nothrow__ , __leaf__)); extern float __getpayloadf (const float *__x) __attribute__ ((__nothrow__ , __leaf__));

 
extern int setpayloadf (float *__x, float __payload) __attribute__ ((__nothrow__ , __leaf__));

 
extern int setpayloadsigf (float *__x, float __payload) __attribute__ ((__nothrow__ , __leaf__));






 
extern float scalbf (float __x, float __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalbf (float __x, float __n) __attribute__ ((__nothrow__ , __leaf__));
# 308 "/usr/include/math.h"
# undef	_Mdouble_
# undef	__MATH_PRECNAME
# undef __MATH_DECLARING_DOUBLE
# undef __MATH_DECLARING_FLOATN

# 340 "/usr/include/math.h"


 

#  define _Mdouble_		long double
#  define __MATH_PRECNAME(name,r) name##l##r
#  define __MATH_DECLARING_DOUBLE  0
#  define __MATH_DECLARING_FLOATN  0
#  define __MATH_DECLARE_LDOUBLE   1
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h"
















 


 
extern int __fpclassifyl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));

 
extern int __signbitl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


 
extern int __isinfl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int __finitel (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int __isnanl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int __iseqsigl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern int __issignalingl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
# 350 "/usr/include/math.h"
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"
















 

























 






 

 
extern long double acosl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __acosl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern long double asinl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __asinl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern long double atanl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atanl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern long double atan2l (long double __y, long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atan2l (long double __y, long double __x) __attribute__ ((__nothrow__ , __leaf__));

 
 extern long double cosl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __cosl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 
 extern long double sinl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sinl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern long double tanl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tanl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 

 
extern long double coshl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __coshl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern long double sinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern long double tanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


 

 extern void sincosl (long double __x, long double *__sinx, long double *__cosx) __attribute__ ((__nothrow__ , __leaf__)); extern void __sincosl (long double __x, long double *__sinx, long double *__cosx) __attribute__ ((__nothrow__ , __leaf__));



 
extern long double acoshl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __acoshl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern long double asinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __asinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern long double atanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


 

 
 extern long double expl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __expl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern long double __frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern long double __ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));

 
 extern long double logl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __logl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double log10l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log10l (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern long double __modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


 
extern long double exp10l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __exp10l (long double __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern long double expm1l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __expm1l (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double log1pl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log1pl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double logbl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __logbl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern long double exp2l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __exp2l (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double log2l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log2l (long double __x) __attribute__ ((__nothrow__ , __leaf__));



 

 
 extern long double powl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __powl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double sqrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sqrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern long double hypotl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __hypotl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));



 
extern long double cbrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __cbrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



 

 
extern long double ceill (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __ceill (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern long double fabsl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fabsl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern long double floorl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __floorl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern long double fmodl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fmodl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));







 
extern int isinfl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern int finitel (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern long double dreml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __dreml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));


 
extern long double significandl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __significandl (long double __x) __attribute__ ((__nothrow__ , __leaf__));





 
extern long double copysignl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __copysignl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern long double nanl (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __nanl (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));








 
extern int isnanl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




 
extern long double j0l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __j0l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double j1l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __j1l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double jnl (int, long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __jnl (int, long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double y0l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __y0l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double y1l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __y1l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double ynl (int, long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __ynl (int, long double) __attribute__ ((__nothrow__ , __leaf__));




 
extern long double erfl (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __erfl (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double erfcl (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __erfcl (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double lgammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __lgammal (long double) __attribute__ ((__nothrow__ , __leaf__));



 
extern long double tgammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tgammal (long double) __attribute__ ((__nothrow__ , __leaf__));




 
extern long double gammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __gammal (long double) __attribute__ ((__nothrow__ , __leaf__));






 
extern long double lgammal_r (long double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern long double __lgammal_r (long double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));





 
extern long double rintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __rintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));

extern long double nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));



 
extern long double nextdownl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nextdownl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern long double nextupl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nextupl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern long double remainderl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __remainderl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));


 
extern long double scalbnl (long double __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalbnl (long double __x, int __n) __attribute__ ((__nothrow__ , __leaf__));


 
extern int ilogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern long int llogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __llogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern long double scalblnl (long double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalblnl (long double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));


 
extern long double nearbyintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nearbyintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern long double roundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __roundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


 
extern long double truncl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __truncl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern long double remquol (long double __x, long double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern long double __remquol (long double __x, long double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));


 


 
extern long int lrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern long int lroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern long double fdiml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fdiml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double fmaxl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fmaxl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern long double fminl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fminl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern long double fmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__ , __leaf__));



 
extern long double roundevenl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __roundevenl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


 

extern __intmax_t fromfpl (long double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpl (long double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));


 

extern __uintmax_t ufromfpl (long double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpl (long double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));



 

extern __intmax_t fromfpxl (long double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpxl (long double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));



 

extern __uintmax_t ufromfpxl (long double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpxl (long double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double fmaxmagl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fmaxmagl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern long double fminmagl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fminmagl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int totalorderl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));

 
extern int totalordermagl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));

 
extern int canonicalizel (long double *__cx, const long double *__x) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double getpayloadl (const long double *__x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __getpayloadl (const long double *__x) __attribute__ ((__nothrow__ , __leaf__));

 
extern int setpayloadl (long double *__x, long double __payload) __attribute__ ((__nothrow__ , __leaf__));

 
extern int setpayloadsigl (long double *__x, long double __payload) __attribute__ ((__nothrow__ , __leaf__));






 
extern long double scalbl (long double __x, long double __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalbl (long double __x, long double __n) __attribute__ ((__nothrow__ , __leaf__));
# 351 "/usr/include/math.h"
#  undef _Mdouble_
#  undef __MATH_PRECNAME
#  undef __MATH_DECLARING_DOUBLE
#  undef __MATH_DECLARING_FLOATN






 

# 379 "/usr/include/math.h"


# define _Mdouble_		_Float32
# define __MATH_PRECNAME(name,r) name##f32##r
# define __MATH_DECLARING_DOUBLE  0
# define __MATH_DECLARING_FLOATN  1
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"
















 

























 






 

 
extern _Float32 acosf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __acosf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float32 asinf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __asinf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float32 atanf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __atanf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float32 atan2f32 (_Float32 __y, _Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __atan2f32 (_Float32 __y, _Float32 __x) __attribute__ ((__nothrow__ , __leaf__));

 
 extern _Float32 cosf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __cosf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 
 extern _Float32 sinf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __sinf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float32 tanf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __tanf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));

 

 
extern _Float32 coshf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __coshf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float32 sinhf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __sinhf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float32 tanhf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __tanhf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));


 

 extern void sincosf32 (_Float32 __x, _Float32 *__sinx, _Float32 *__cosx) __attribute__ ((__nothrow__ , __leaf__)); extern void __sincosf32 (_Float32 __x, _Float32 *__sinx, _Float32 *__cosx) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float32 acoshf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __acoshf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float32 asinhf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __asinhf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float32 atanhf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __atanhf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));


 

 
 extern _Float32 expf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __expf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float32 frexpf32 (_Float32 __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __frexpf32 (_Float32 __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float32 ldexpf32 (_Float32 __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __ldexpf32 (_Float32 __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));

 
 extern _Float32 logf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __logf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float32 log10f32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __log10f32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float32 modff32 (_Float32 __x, _Float32 *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __modff32 (_Float32 __x, _Float32 *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


 
extern _Float32 exp10f32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __exp10f32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float32 expm1f32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __expm1f32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float32 log1pf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __log1pf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float32 logbf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __logbf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float32 exp2f32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __exp2f32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float32 log2f32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __log2f32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));



 

 
 extern _Float32 powf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __powf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float32 sqrtf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __sqrtf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float32 hypotf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __hypotf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float32 cbrtf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __cbrtf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));



 

 
extern _Float32 ceilf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __ceilf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float32 fabsf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __fabsf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float32 floorf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __floorf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float32 fmodf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __fmodf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__));

# 179 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"

# 191 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"




 
extern _Float32 copysignf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __copysignf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern _Float32 nanf32 (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __nanf32 (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



# 214 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"


 
extern _Float32 j0f32 (_Float32) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __j0f32 (_Float32) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 j1f32 (_Float32) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __j1f32 (_Float32) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 jnf32 (int, _Float32) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __jnf32 (int, _Float32) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 y0f32 (_Float32) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __y0f32 (_Float32) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 y1f32 (_Float32) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __y1f32 (_Float32) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 ynf32 (int, _Float32) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __ynf32 (int, _Float32) __attribute__ ((__nothrow__ , __leaf__));




 
extern _Float32 erff32 (_Float32) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __erff32 (_Float32) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 erfcf32 (_Float32) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __erfcf32 (_Float32) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 lgammaf32 (_Float32) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __lgammaf32 (_Float32) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float32 tgammaf32 (_Float32) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __tgammaf32 (_Float32) __attribute__ ((__nothrow__ , __leaf__));


# 244 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"




 
extern _Float32 lgammaf32_r (_Float32, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __lgammaf32_r (_Float32, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));





 
extern _Float32 rintf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __rintf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float32 nextafterf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __nextafterf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__));





 
extern _Float32 nextdownf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __nextdownf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float32 nextupf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __nextupf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float32 remainderf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __remainderf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float32 scalbnf32 (_Float32 __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __scalbnf32 (_Float32 __x, int __n) __attribute__ ((__nothrow__ , __leaf__));


 
extern int ilogbf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern long int llogbf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __llogbf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float32 scalblnf32 (_Float32 __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __scalblnf32 (_Float32 __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float32 nearbyintf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __nearbyintf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float32 roundf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __roundf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


 
extern _Float32 truncf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __truncf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern _Float32 remquof32 (_Float32 __x, _Float32 __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __remquof32 (_Float32 __x, _Float32 __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));


 


 
extern long int lrintf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern long int lroundf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float32 fdimf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __fdimf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float32 fmaxf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __fmaxf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float32 fminf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __fminf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float32 fmaf32 (_Float32 __x, _Float32 __y, _Float32 __z) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __fmaf32 (_Float32 __x, _Float32 __y, _Float32 __z) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float32 roundevenf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __roundevenf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


 

extern __intmax_t fromfpf32 (_Float32 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpf32 (_Float32 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));


 

extern __uintmax_t ufromfpf32 (_Float32 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpf32 (_Float32 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));



 

extern __intmax_t fromfpxf32 (_Float32 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpxf32 (_Float32 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));



 

extern __uintmax_t ufromfpxf32 (_Float32 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpxf32 (_Float32 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float32 fmaxmagf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __fmaxmagf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float32 fminmagf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __fminmagf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int totalorderf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));

 
extern int totalordermagf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));

 
extern int canonicalizef32 (_Float32 *__cx, const _Float32 *__x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float32 getpayloadf32 (const _Float32 *__x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __getpayloadf32 (const _Float32 *__x) __attribute__ ((__nothrow__ , __leaf__));

 
extern int setpayloadf32 (_Float32 *__x, _Float32 __payload) __attribute__ ((__nothrow__ , __leaf__));

 
extern int setpayloadsigf32 (_Float32 *__x, _Float32 __payload) __attribute__ ((__nothrow__ , __leaf__));


# 390 "/usr/include/math.h"

# undef _Mdouble_
# undef __MATH_PRECNAME
# undef __MATH_DECLARING_DOUBLE
# undef __MATH_DECLARING_FLOATN



# define _Mdouble_		_Float64
# define __MATH_PRECNAME(name,r) name##f64##r
# define __MATH_DECLARING_DOUBLE  0
# define __MATH_DECLARING_FLOATN  1
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"
















 

























 






 

 
extern _Float64 acosf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __acosf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float64 asinf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __asinf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float64 atanf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __atanf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float64 atan2f64 (_Float64 __y, _Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __atan2f64 (_Float64 __y, _Float64 __x) __attribute__ ((__nothrow__ , __leaf__));

 
 extern _Float64 cosf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __cosf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 
 extern _Float64 sinf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __sinf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float64 tanf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __tanf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));

 

 
extern _Float64 coshf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __coshf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float64 sinhf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __sinhf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float64 tanhf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __tanhf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));


 

 extern void sincosf64 (_Float64 __x, _Float64 *__sinx, _Float64 *__cosx) __attribute__ ((__nothrow__ , __leaf__)); extern void __sincosf64 (_Float64 __x, _Float64 *__sinx, _Float64 *__cosx) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float64 acoshf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __acoshf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float64 asinhf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __asinhf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float64 atanhf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __atanhf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));


 

 
 extern _Float64 expf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __expf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float64 frexpf64 (_Float64 __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __frexpf64 (_Float64 __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float64 ldexpf64 (_Float64 __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __ldexpf64 (_Float64 __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));

 
 extern _Float64 logf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __logf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float64 log10f64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __log10f64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float64 modff64 (_Float64 __x, _Float64 *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __modff64 (_Float64 __x, _Float64 *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


 
extern _Float64 exp10f64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __exp10f64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float64 expm1f64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __expm1f64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float64 log1pf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __log1pf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float64 logbf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __logbf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float64 exp2f64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __exp2f64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float64 log2f64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __log2f64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));



 

 
 extern _Float64 powf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __powf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float64 sqrtf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __sqrtf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float64 hypotf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __hypotf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float64 cbrtf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __cbrtf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));



 

 
extern _Float64 ceilf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __ceilf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float64 fabsf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __fabsf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float64 floorf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __floorf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float64 fmodf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __fmodf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__));

# 179 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"

# 191 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"




 
extern _Float64 copysignf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __copysignf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern _Float64 nanf64 (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __nanf64 (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



# 214 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"


 
extern _Float64 j0f64 (_Float64) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __j0f64 (_Float64) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 j1f64 (_Float64) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __j1f64 (_Float64) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 jnf64 (int, _Float64) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __jnf64 (int, _Float64) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 y0f64 (_Float64) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __y0f64 (_Float64) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 y1f64 (_Float64) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __y1f64 (_Float64) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 ynf64 (int, _Float64) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __ynf64 (int, _Float64) __attribute__ ((__nothrow__ , __leaf__));




 
extern _Float64 erff64 (_Float64) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __erff64 (_Float64) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 erfcf64 (_Float64) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __erfcf64 (_Float64) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 lgammaf64 (_Float64) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __lgammaf64 (_Float64) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float64 tgammaf64 (_Float64) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __tgammaf64 (_Float64) __attribute__ ((__nothrow__ , __leaf__));


# 244 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"




 
extern _Float64 lgammaf64_r (_Float64, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __lgammaf64_r (_Float64, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));





 
extern _Float64 rintf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __rintf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float64 nextafterf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __nextafterf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__));





 
extern _Float64 nextdownf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __nextdownf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float64 nextupf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __nextupf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float64 remainderf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __remainderf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float64 scalbnf64 (_Float64 __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __scalbnf64 (_Float64 __x, int __n) __attribute__ ((__nothrow__ , __leaf__));


 
extern int ilogbf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern long int llogbf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __llogbf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float64 scalblnf64 (_Float64 __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __scalblnf64 (_Float64 __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float64 nearbyintf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __nearbyintf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float64 roundf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __roundf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


 
extern _Float64 truncf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __truncf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern _Float64 remquof64 (_Float64 __x, _Float64 __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __remquof64 (_Float64 __x, _Float64 __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));


 


 
extern long int lrintf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern long int lroundf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float64 fdimf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __fdimf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float64 fmaxf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __fmaxf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float64 fminf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __fminf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float64 fmaf64 (_Float64 __x, _Float64 __y, _Float64 __z) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __fmaf64 (_Float64 __x, _Float64 __y, _Float64 __z) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float64 roundevenf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __roundevenf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


 

extern __intmax_t fromfpf64 (_Float64 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpf64 (_Float64 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));


 

extern __uintmax_t ufromfpf64 (_Float64 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpf64 (_Float64 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));



 

extern __intmax_t fromfpxf64 (_Float64 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpxf64 (_Float64 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));



 

extern __uintmax_t ufromfpxf64 (_Float64 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpxf64 (_Float64 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float64 fmaxmagf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __fmaxmagf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float64 fminmagf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __fminmagf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int totalorderf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));

 
extern int totalordermagf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));

 
extern int canonicalizef64 (_Float64 *__cx, const _Float64 *__x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float64 getpayloadf64 (const _Float64 *__x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __getpayloadf64 (const _Float64 *__x) __attribute__ ((__nothrow__ , __leaf__));

 
extern int setpayloadf64 (_Float64 *__x, _Float64 __payload) __attribute__ ((__nothrow__ , __leaf__));

 
extern int setpayloadsigf64 (_Float64 *__x, _Float64 __payload) __attribute__ ((__nothrow__ , __leaf__));


# 407 "/usr/include/math.h"

# undef _Mdouble_
# undef __MATH_PRECNAME
# undef __MATH_DECLARING_DOUBLE
# undef __MATH_DECLARING_FLOATN



# define _Mdouble_		_Float128
# define __MATH_PRECNAME(name,r) name##f128##r
# define __MATH_DECLARING_DOUBLE  0
# define __MATH_DECLARING_FLOATN  1
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h"
















 


 
extern int __fpclassifyf128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));

 
extern int __signbitf128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


 
extern int __isinff128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int __finitef128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int __isnanf128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int __iseqsigf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern int __issignalingf128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
# 421 "/usr/include/math.h"
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"
















 

























 






 

 
extern _Float128 acosf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __acosf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float128 asinf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __asinf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float128 atanf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __atanf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float128 atan2f128 (_Float128 __y, _Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __atan2f128 (_Float128 __y, _Float128 __x) __attribute__ ((__nothrow__ , __leaf__));

 
 extern _Float128 cosf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __cosf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 
 extern _Float128 sinf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __sinf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float128 tanf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __tanf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));

 

 
extern _Float128 coshf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __coshf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float128 sinhf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __sinhf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float128 tanhf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __tanhf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));


 

 extern void sincosf128 (_Float128 __x, _Float128 *__sinx, _Float128 *__cosx) __attribute__ ((__nothrow__ , __leaf__)); extern void __sincosf128 (_Float128 __x, _Float128 *__sinx, _Float128 *__cosx) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float128 acoshf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __acoshf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float128 asinhf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __asinhf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float128 atanhf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __atanhf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));


 

 
 extern _Float128 expf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __expf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float128 frexpf128 (_Float128 __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __frexpf128 (_Float128 __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float128 ldexpf128 (_Float128 __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __ldexpf128 (_Float128 __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));

 
 extern _Float128 logf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __logf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float128 log10f128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __log10f128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float128 modff128 (_Float128 __x, _Float128 *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __modff128 (_Float128 __x, _Float128 *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


 
extern _Float128 exp10f128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __exp10f128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float128 expm1f128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __expm1f128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float128 log1pf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __log1pf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float128 logbf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __logbf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float128 exp2f128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __exp2f128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float128 log2f128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __log2f128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));



 

 
 extern _Float128 powf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __powf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float128 sqrtf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __sqrtf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float128 hypotf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __hypotf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float128 cbrtf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __cbrtf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));



 

 
extern _Float128 ceilf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __ceilf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float128 fabsf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __fabsf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float128 floorf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __floorf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float128 fmodf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __fmodf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));

# 179 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"

# 191 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"




 
extern _Float128 copysignf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __copysignf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern _Float128 nanf128 (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __nanf128 (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



# 214 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"


 
extern _Float128 j0f128 (_Float128) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __j0f128 (_Float128) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 j1f128 (_Float128) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __j1f128 (_Float128) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 jnf128 (int, _Float128) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __jnf128 (int, _Float128) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 y0f128 (_Float128) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __y0f128 (_Float128) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 y1f128 (_Float128) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __y1f128 (_Float128) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 ynf128 (int, _Float128) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __ynf128 (int, _Float128) __attribute__ ((__nothrow__ , __leaf__));




 
extern _Float128 erff128 (_Float128) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __erff128 (_Float128) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 erfcf128 (_Float128) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __erfcf128 (_Float128) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 lgammaf128 (_Float128) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __lgammaf128 (_Float128) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float128 tgammaf128 (_Float128) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __tgammaf128 (_Float128) __attribute__ ((__nothrow__ , __leaf__));


# 244 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"




 
extern _Float128 lgammaf128_r (_Float128, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __lgammaf128_r (_Float128, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));





 
extern _Float128 rintf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __rintf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float128 nextafterf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __nextafterf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));





 
extern _Float128 nextdownf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __nextdownf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float128 nextupf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __nextupf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float128 remainderf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __remainderf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float128 scalbnf128 (_Float128 __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __scalbnf128 (_Float128 __x, int __n) __attribute__ ((__nothrow__ , __leaf__));


 
extern int ilogbf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern long int llogbf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __llogbf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float128 scalblnf128 (_Float128 __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __scalblnf128 (_Float128 __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float128 nearbyintf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __nearbyintf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float128 roundf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __roundf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


 
extern _Float128 truncf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __truncf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern _Float128 remquof128 (_Float128 __x, _Float128 __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __remquof128 (_Float128 __x, _Float128 __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));


 


 
extern long int lrintf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern long int lroundf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float128 fdimf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __fdimf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float128 fmaxf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __fmaxf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float128 fminf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __fminf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float128 fmaf128 (_Float128 __x, _Float128 __y, _Float128 __z) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __fmaf128 (_Float128 __x, _Float128 __y, _Float128 __z) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float128 roundevenf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __roundevenf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


 

extern __intmax_t fromfpf128 (_Float128 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpf128 (_Float128 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));


 

extern __uintmax_t ufromfpf128 (_Float128 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpf128 (_Float128 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));



 

extern __intmax_t fromfpxf128 (_Float128 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpxf128 (_Float128 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));



 

extern __uintmax_t ufromfpxf128 (_Float128 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpxf128 (_Float128 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float128 fmaxmagf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __fmaxmagf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float128 fminmagf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __fminmagf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int totalorderf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));

 
extern int totalordermagf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));

 
extern int canonicalizef128 (_Float128 *__cx, const _Float128 *__x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float128 getpayloadf128 (const _Float128 *__x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __getpayloadf128 (const _Float128 *__x) __attribute__ ((__nothrow__ , __leaf__));

 
extern int setpayloadf128 (_Float128 *__x, _Float128 __payload) __attribute__ ((__nothrow__ , __leaf__));

 
extern int setpayloadsigf128 (_Float128 *__x, _Float128 __payload) __attribute__ ((__nothrow__ , __leaf__));


# 424 "/usr/include/math.h"

# undef _Mdouble_
# undef __MATH_PRECNAME
# undef __MATH_DECLARING_DOUBLE
# undef __MATH_DECLARING_FLOATN



# define _Mdouble_		_Float32x
# define __MATH_PRECNAME(name,r) name##f32x##r
# define __MATH_DECLARING_DOUBLE  0
# define __MATH_DECLARING_FLOATN  1
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"
















 

























 






 

 
extern _Float32x acosf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __acosf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float32x asinf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __asinf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float32x atanf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __atanf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float32x atan2f32x (_Float32x __y, _Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __atan2f32x (_Float32x __y, _Float32x __x) __attribute__ ((__nothrow__ , __leaf__));

 
 extern _Float32x cosf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __cosf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 
 extern _Float32x sinf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __sinf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float32x tanf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __tanf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));

 

 
extern _Float32x coshf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __coshf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float32x sinhf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __sinhf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float32x tanhf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __tanhf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));


 

 extern void sincosf32x (_Float32x __x, _Float32x *__sinx, _Float32x *__cosx) __attribute__ ((__nothrow__ , __leaf__)); extern void __sincosf32x (_Float32x __x, _Float32x *__sinx, _Float32x *__cosx) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float32x acoshf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __acoshf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float32x asinhf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __asinhf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float32x atanhf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __atanhf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));


 

 
 extern _Float32x expf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __expf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float32x frexpf32x (_Float32x __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __frexpf32x (_Float32x __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float32x ldexpf32x (_Float32x __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __ldexpf32x (_Float32x __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));

 
 extern _Float32x logf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __logf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float32x log10f32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __log10f32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float32x modff32x (_Float32x __x, _Float32x *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __modff32x (_Float32x __x, _Float32x *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


 
extern _Float32x exp10f32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __exp10f32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float32x expm1f32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __expm1f32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float32x log1pf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __log1pf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float32x logbf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __logbf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float32x exp2f32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __exp2f32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float32x log2f32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __log2f32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));



 

 
 extern _Float32x powf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __powf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float32x sqrtf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __sqrtf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float32x hypotf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __hypotf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float32x cbrtf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __cbrtf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));



 

 
extern _Float32x ceilf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __ceilf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float32x fabsf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __fabsf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float32x floorf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __floorf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float32x fmodf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __fmodf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__));

# 179 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"

# 191 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"




 
extern _Float32x copysignf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __copysignf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern _Float32x nanf32x (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __nanf32x (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



# 214 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"


 
extern _Float32x j0f32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __j0f32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x j1f32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __j1f32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x jnf32x (int, _Float32x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __jnf32x (int, _Float32x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x y0f32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __y0f32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x y1f32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __y1f32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x ynf32x (int, _Float32x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __ynf32x (int, _Float32x) __attribute__ ((__nothrow__ , __leaf__));




 
extern _Float32x erff32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __erff32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x erfcf32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __erfcf32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x lgammaf32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __lgammaf32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float32x tgammaf32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __tgammaf32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__));


# 244 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"




 
extern _Float32x lgammaf32x_r (_Float32x, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __lgammaf32x_r (_Float32x, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));





 
extern _Float32x rintf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __rintf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float32x nextafterf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __nextafterf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__));





 
extern _Float32x nextdownf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __nextdownf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float32x nextupf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __nextupf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float32x remainderf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __remainderf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float32x scalbnf32x (_Float32x __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __scalbnf32x (_Float32x __x, int __n) __attribute__ ((__nothrow__ , __leaf__));


 
extern int ilogbf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern long int llogbf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __llogbf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float32x scalblnf32x (_Float32x __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __scalblnf32x (_Float32x __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float32x nearbyintf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __nearbyintf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float32x roundf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __roundf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


 
extern _Float32x truncf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __truncf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern _Float32x remquof32x (_Float32x __x, _Float32x __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __remquof32x (_Float32x __x, _Float32x __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));


 


 
extern long int lrintf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern long int lroundf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float32x fdimf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __fdimf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float32x fmaxf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __fmaxf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float32x fminf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __fminf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float32x fmaf32x (_Float32x __x, _Float32x __y, _Float32x __z) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __fmaf32x (_Float32x __x, _Float32x __y, _Float32x __z) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float32x roundevenf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __roundevenf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


 

extern __intmax_t fromfpf32x (_Float32x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpf32x (_Float32x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));


 

extern __uintmax_t ufromfpf32x (_Float32x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpf32x (_Float32x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));



 

extern __intmax_t fromfpxf32x (_Float32x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpxf32x (_Float32x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));



 

extern __uintmax_t ufromfpxf32x (_Float32x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpxf32x (_Float32x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float32x fmaxmagf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __fmaxmagf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float32x fminmagf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __fminmagf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int totalorderf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));

 
extern int totalordermagf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));

 
extern int canonicalizef32x (_Float32x *__cx, const _Float32x *__x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float32x getpayloadf32x (const _Float32x *__x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __getpayloadf32x (const _Float32x *__x) __attribute__ ((__nothrow__ , __leaf__));

 
extern int setpayloadf32x (_Float32x *__x, _Float32x __payload) __attribute__ ((__nothrow__ , __leaf__));

 
extern int setpayloadsigf32x (_Float32x *__x, _Float32x __payload) __attribute__ ((__nothrow__ , __leaf__));


# 441 "/usr/include/math.h"

# undef _Mdouble_
# undef __MATH_PRECNAME
# undef __MATH_DECLARING_DOUBLE
# undef __MATH_DECLARING_FLOATN



# define _Mdouble_		_Float64x
# define __MATH_PRECNAME(name,r) name##f64x##r
# define __MATH_DECLARING_DOUBLE  0
# define __MATH_DECLARING_FLOATN  1
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"
















 

























 






 

 
extern _Float64x acosf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __acosf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float64x asinf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __asinf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float64x atanf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __atanf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float64x atan2f64x (_Float64x __y, _Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __atan2f64x (_Float64x __y, _Float64x __x) __attribute__ ((__nothrow__ , __leaf__));

 
 extern _Float64x cosf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __cosf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 
 extern _Float64x sinf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __sinf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float64x tanf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __tanf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));

 

 
extern _Float64x coshf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __coshf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float64x sinhf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __sinhf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float64x tanhf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __tanhf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));


 

 extern void sincosf64x (_Float64x __x, _Float64x *__sinx, _Float64x *__cosx) __attribute__ ((__nothrow__ , __leaf__)); extern void __sincosf64x (_Float64x __x, _Float64x *__sinx, _Float64x *__cosx) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float64x acoshf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __acoshf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float64x asinhf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __asinhf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float64x atanhf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __atanhf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));


 

 
 extern _Float64x expf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __expf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float64x frexpf64x (_Float64x __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __frexpf64x (_Float64x __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float64x ldexpf64x (_Float64x __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __ldexpf64x (_Float64x __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));

 
 extern _Float64x logf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __logf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float64x log10f64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __log10f64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float64x modff64x (_Float64x __x, _Float64x *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __modff64x (_Float64x __x, _Float64x *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


 
extern _Float64x exp10f64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __exp10f64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float64x expm1f64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __expm1f64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float64x log1pf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __log1pf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float64x logbf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __logbf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float64x exp2f64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __exp2f64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float64x log2f64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __log2f64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));



 

 
 extern _Float64x powf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __powf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float64x sqrtf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __sqrtf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float64x hypotf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __hypotf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float64x cbrtf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __cbrtf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));



 

 
extern _Float64x ceilf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __ceilf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float64x fabsf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __fabsf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float64x floorf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __floorf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float64x fmodf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __fmodf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__));

# 179 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"

# 191 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"




 
extern _Float64x copysignf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __copysignf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern _Float64x nanf64x (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __nanf64x (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



# 214 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"


 
extern _Float64x j0f64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __j0f64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x j1f64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __j1f64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x jnf64x (int, _Float64x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __jnf64x (int, _Float64x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x y0f64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __y0f64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x y1f64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __y1f64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x ynf64x (int, _Float64x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __ynf64x (int, _Float64x) __attribute__ ((__nothrow__ , __leaf__));




 
extern _Float64x erff64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __erff64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x erfcf64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __erfcf64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x lgammaf64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __lgammaf64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float64x tgammaf64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __tgammaf64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__));


# 244 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"




 
extern _Float64x lgammaf64x_r (_Float64x, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __lgammaf64x_r (_Float64x, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));





 
extern _Float64x rintf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __rintf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float64x nextafterf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __nextafterf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__));





 
extern _Float64x nextdownf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __nextdownf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern _Float64x nextupf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __nextupf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float64x remainderf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __remainderf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float64x scalbnf64x (_Float64x __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __scalbnf64x (_Float64x __x, int __n) __attribute__ ((__nothrow__ , __leaf__));


 
extern int ilogbf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern long int llogbf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __llogbf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float64x scalblnf64x (_Float64x __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __scalblnf64x (_Float64x __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float64x nearbyintf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __nearbyintf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float64x roundf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __roundf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


 
extern _Float64x truncf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __truncf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern _Float64x remquof64x (_Float64x __x, _Float64x __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __remquof64x (_Float64x __x, _Float64x __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));


 


 
extern long int lrintf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern long int lroundf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern _Float64x fdimf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __fdimf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float64x fmaxf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __fmaxf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float64x fminf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __fminf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float64x fmaf64x (_Float64x __x, _Float64x __y, _Float64x __z) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __fmaf64x (_Float64x __x, _Float64x __y, _Float64x __z) __attribute__ ((__nothrow__ , __leaf__));



 
extern _Float64x roundevenf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __roundevenf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


 

extern __intmax_t fromfpf64x (_Float64x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpf64x (_Float64x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));


 

extern __uintmax_t ufromfpf64x (_Float64x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpf64x (_Float64x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));



 

extern __intmax_t fromfpxf64x (_Float64x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpxf64x (_Float64x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));



 

extern __uintmax_t ufromfpxf64x (_Float64x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpxf64x (_Float64x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float64x fmaxmagf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __fmaxmagf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern _Float64x fminmagf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __fminmagf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int totalorderf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));

 
extern int totalordermagf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));

 
extern int canonicalizef64x (_Float64x *__cx, const _Float64x *__x) __attribute__ ((__nothrow__ , __leaf__));

 
extern _Float64x getpayloadf64x (const _Float64x *__x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __getpayloadf64x (const _Float64x *__x) __attribute__ ((__nothrow__ , __leaf__));

 
extern int setpayloadf64x (_Float64x *__x, _Float64x __payload) __attribute__ ((__nothrow__ , __leaf__));

 
extern int setpayloadsigf64x (_Float64x *__x, _Float64x __payload) __attribute__ ((__nothrow__ , __leaf__));


# 458 "/usr/include/math.h"

# undef _Mdouble_
# undef __MATH_PRECNAME
# undef __MATH_DECLARING_DOUBLE
# undef __MATH_DECLARING_FLOATN


# 481 "/usr/include/math.h"

#undef	__MATHDECL_1
#undef	__MATHDECL
#undef	__MATHCALL



 
extern int signgam;


# 500 "/usr/include/math.h"









 
# 519 "/usr/include/math.h"
#   define __MATH_TG_F32(FUNC, ARGS) _Float32: FUNC ## f ARGS,





#    define __MATH_TG_F64X(FUNC, ARGS) _Float64x: FUNC ## l ARGS,
# 532 "/usr/include/math.h"
#  define __MATH_TG(TG_ARG, FUNC, ARGS)	     _Generic ((TG_ARG),				       float: FUNC ## f ARGS,			       __MATH_TG_F32 (FUNC, ARGS)		       default: FUNC ARGS,			       long double: FUNC ## l ARGS,		       __MATH_TG_F64X (FUNC, ARGS)		       _Float128: FUNC ## f128 ARGS)
# 564 "/usr/include/math.h"

 


 
enum
  {
    FP_NAN =
# define FP_NAN 0
      0,
    FP_INFINITE =
# define FP_INFINITE 1
      1,
    FP_ZERO =
# define FP_ZERO 2
      2,
    FP_SUBNORMAL =
# define FP_SUBNORMAL 3
      3,
    FP_NORMAL =
# define FP_NORMAL 4
      4
  };



 

 


     




 
#  define fpclassify(x) __builtin_fpclassify (FP_NAN, FP_INFINITE,	           FP_NORMAL, FP_SUBNORMAL, FP_ZERO, x)





 

#  define signbit(x) __builtin_signbit (x)
# 624 "/usr/include/math.h"

 

#  define isfinite(x) __builtin_isfinite (x)




 

#  define isnormal(x) __builtin_isnormal (x)





 

#  define isnan(x) __builtin_isnan (x)




 
# 659 "/usr/include/math.h"
#  define isinf(x) __builtin_isinf_sign (x)




 
# define MATH_ERRNO	1	 
# define MATH_ERREXCEPT	2	 





 





#  define math_errhandling	(MATH_ERRNO | MATH_ERREXCEPT)




# 1 "/usr/include/x86_64-linux-gnu/bits/iscanonical.h"
















 





extern int __iscanonicall (long double __x)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
#define __iscanonicalf(x) ((void) (__typeof (x)) (x), 1)
#define __iscanonical(x) ((void) (__typeof (x)) (x), 1)

# define __iscanonicalf128(x) ((void) (__typeof (x)) (x), 1)







 

# define iscanonical(x) __MATH_TG ((x), __iscanonical, (x))
# 685 "/usr/include/math.h"

 

#  define issignaling(x) __MATH_TG ((x), __issignaling, (x))
# 713 "/usr/include/math.h"

 
# define issubnormal(x) (fpclassify (x) == FP_SUBNORMAL)

 




#   define iszero(x) (((__typeof (x)) (x)) == 0)
# 763 "/usr/include/math.h"


 
# define MAXFLOAT	3.40282347e+38F



 

# define M_E		2.7182818284590452354	 
# define M_LOG2E	1.4426950408889634074	 
# define M_LOG10E	0.43429448190325182765	 
# define M_LN2		0.69314718055994530942	 
# define M_LN10		2.30258509299404568402	 
# define M_PI		3.14159265358979323846	 
# define M_PI_2		1.57079632679489661923	 
# define M_PI_4		0.78539816339744830962	 
# define M_1_PI		0.31830988618379067154	 
# define M_2_PI		0.63661977236758134308	 
# define M_2_SQRTPI	1.12837916709551257390	 
# define M_SQRT2	1.41421356237309504880	 
# define M_SQRT1_2	0.70710678118654752440	 




 

# define M_El		2.718281828459045235360287471352662498L  
# define M_LOG2El	1.442695040888963407359924681001892137L  
# define M_LOG10El	0.434294481903251827651128918916605082L  
# define M_LN2l		0.693147180559945309417232121458176568L  
# define M_LN10l	2.302585092994045684017991454684364208L  
# define M_PIl		3.141592653589793238462643383279502884L  
# define M_PI_2l	1.570796326794896619231321691639751442L  
# define M_PI_4l	0.785398163397448309615660845819875721L  
# define M_1_PIl	0.318309886183790671537767526745028724L  
# define M_2_PIl	0.636619772367581343075535053490057448L  
# define M_2_SQRTPIl	1.128379167095512573896158903121545172L  
# define M_SQRT2l	1.414213562373095048801688724209698079L  
# define M_SQRT1_2l	0.707106781186547524400844362104849039L  


# 821 "/usr/include/math.h"


# define M_Ef32		__f32 (2.718281828459045235360287471352662498)  
# define M_LOG2Ef32	__f32 (1.442695040888963407359924681001892137)  
# define M_LOG10Ef32	__f32 (0.434294481903251827651128918916605082)  
# define M_LN2f32	__f32 (0.693147180559945309417232121458176568)  
# define M_LN10f32	__f32 (2.302585092994045684017991454684364208)  
# define M_PIf32	__f32 (3.141592653589793238462643383279502884)  
# define M_PI_2f32	__f32 (1.570796326794896619231321691639751442)  
# define M_PI_4f32	__f32 (0.785398163397448309615660845819875721)  
# define M_1_PIf32	__f32 (0.318309886183790671537767526745028724)  
# define M_2_PIf32	__f32 (0.636619772367581343075535053490057448)  
# define M_2_SQRTPIf32	__f32 (1.128379167095512573896158903121545172)  
# define M_SQRT2f32	__f32 (1.414213562373095048801688724209698079)  
# define M_SQRT1_2f32	__f32 (0.707106781186547524400844362104849039)  



# define M_Ef64		__f64 (2.718281828459045235360287471352662498)  
# define M_LOG2Ef64	__f64 (1.442695040888963407359924681001892137)  
# define M_LOG10Ef64	__f64 (0.434294481903251827651128918916605082)  
# define M_LN2f64	__f64 (0.693147180559945309417232121458176568)  
# define M_LN10f64	__f64 (2.302585092994045684017991454684364208)  
# define M_PIf64	__f64 (3.141592653589793238462643383279502884)  
# define M_PI_2f64	__f64 (1.570796326794896619231321691639751442)  
# define M_PI_4f64	__f64 (0.785398163397448309615660845819875721)  
# define M_1_PIf64	__f64 (0.318309886183790671537767526745028724)  
# define M_2_PIf64	__f64 (0.636619772367581343075535053490057448)  
# define M_2_SQRTPIf64	__f64 (1.128379167095512573896158903121545172)  
# define M_SQRT2f64	__f64 (1.414213562373095048801688724209698079)  
# define M_SQRT1_2f64	__f64 (0.707106781186547524400844362104849039)  



# define M_Ef128	__f128 (2.718281828459045235360287471352662498)  
# define M_LOG2Ef128	__f128 (1.442695040888963407359924681001892137)  
# define M_LOG10Ef128	__f128 (0.434294481903251827651128918916605082)  
# define M_LN2f128	__f128 (0.693147180559945309417232121458176568)  
# define M_LN10f128	__f128 (2.302585092994045684017991454684364208)  
# define M_PIf128	__f128 (3.141592653589793238462643383279502884)  
# define M_PI_2f128	__f128 (1.570796326794896619231321691639751442)  
# define M_PI_4f128	__f128 (0.785398163397448309615660845819875721)  
# define M_1_PIf128	__f128 (0.318309886183790671537767526745028724)  
# define M_2_PIf128	__f128 (0.636619772367581343075535053490057448)  
# define M_2_SQRTPIf128	__f128 (1.128379167095512573896158903121545172)  
# define M_SQRT2f128	__f128 (1.414213562373095048801688724209698079)  
# define M_SQRT1_2f128	__f128 (0.707106781186547524400844362104849039)  



# define M_Ef32x	__f32x (2.718281828459045235360287471352662498)  
# define M_LOG2Ef32x	__f32x (1.442695040888963407359924681001892137)  
# define M_LOG10Ef32x	__f32x (0.434294481903251827651128918916605082)  
# define M_LN2f32x	__f32x (0.693147180559945309417232121458176568)  
# define M_LN10f32x	__f32x (2.302585092994045684017991454684364208)  
# define M_PIf32x	__f32x (3.141592653589793238462643383279502884)  
# define M_PI_2f32x	__f32x (1.570796326794896619231321691639751442)  
# define M_PI_4f32x	__f32x (0.785398163397448309615660845819875721)  
# define M_1_PIf32x	__f32x (0.318309886183790671537767526745028724)  
# define M_2_PIf32x	__f32x (0.636619772367581343075535053490057448)  
# define M_2_SQRTPIf32x	__f32x (1.128379167095512573896158903121545172)  
# define M_SQRT2f32x	__f32x (1.414213562373095048801688724209698079)  
# define M_SQRT1_2f32x	__f32x (0.707106781186547524400844362104849039)  



# define M_Ef64x	__f64x (2.718281828459045235360287471352662498)  
# define M_LOG2Ef64x	__f64x (1.442695040888963407359924681001892137)  
# define M_LOG10Ef64x	__f64x (0.434294481903251827651128918916605082)  
# define M_LN2f64x	__f64x (0.693147180559945309417232121458176568)  
# define M_LN10f64x	__f64x (2.302585092994045684017991454684364208)  
# define M_PIf64x	__f64x (3.141592653589793238462643383279502884)  
# define M_PI_2f64x	__f64x (1.570796326794896619231321691639751442)  
# define M_PI_4f64x	__f64x (0.785398163397448309615660845819875721)  
# define M_1_PIf64x	__f64x (0.318309886183790671537767526745028724)  
# define M_2_PIf64x	__f64x (0.636619772367581343075535053490057448)  
# define M_2_SQRTPIf64x	__f64x (1.128379167095512573896158903121545172)  
# define M_SQRT2f64x	__f64x (1.414213562373095048801688724209698079)  
# define M_SQRT1_2f64x	__f64x (0.707106781186547524400844362104849039)  








 

# define __NO_MATH_INLINES	1









 
#  define isgreater(x, y)	__builtin_isgreater(x, y)
#  define isgreaterequal(x, y)	__builtin_isgreaterequal(x, y)
#  define isless(x, y)		__builtin_isless(x, y)
#  define islessequal(x, y)	__builtin_islessequal(x, y)
#  define islessgreater(x, y)	__builtin_islessgreater(x, y)
#  define isunordered(x, y)	__builtin_isunordered(x, y)
# 949 "/usr/include/math.h"

 
# 1 "/usr/include/x86_64-linux-gnu/bits/mathinline.h"
















 








# define __MATH_INLINE __extern_always_inline



 
# 241 "/usr/include/x86_64-linux-gnu/bits/mathinline.h"



 
# 953 "/usr/include/math.h"



 
# 1175 "/usr/include/math.h"



 





#  define __MATH_EVAL_FMT2(x, y) ((x) + (y) + 0.0f)





 

#  define iseqsig(x, y)    __MATH_TG (__MATH_EVAL_FMT2 (x, y), __iseqsig, ((x), (y)))
# 1260 "/usr/include/math.h"






# 15 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/math.h"


#define _MATH_H_CSURF




#define __CSURF_EXTERN_C_MATH_H extern























 

extern int cs_isnan( double x );
extern int cs_isnormal( double x );
extern int cs_isfinite( double x );
extern int cs_isinf( double x );
extern int cs_signbit( double x );


#undef isnan
#define isnan(x)             ( cs_isnan( (double) (x) ) )



#undef isnormal
#define isnormal(x)          ( cs_isnormal( (double) (x) ) )



#undef isfinite
#define isfinite(x)          ( cs_isfinite( (double) (x) ) )



#undef isinf
#define isinf(x)             ( cs_isinf( (double) (x) ) )



#undef signbit
#define signbit(x)           ( cs_signbit( (double) (x) ) )



#undef isgreater
#define isgreater(x, y)      ( (x) > (y) )



#undef isgreaterequal
#define isgreaterequal(x, y) ( (x) >= (y) )



#undef isless
#define isless(x, y)         ( (x) < (y) )



#undef islessequal
#define islessequal(x, y)    ( (x) <= (y) )



#undef islessgreater
#define islessgreater(x, y)  ( (x) != (y) )


#undef __CSURF_EXTERN_C_MATH_H
# 48 "redis-cli.c"

# 1 "../deps/hiredis/hiredis.h"































 


#define __HIREDIS_H
# 1 "../deps/hiredis/read.h"





























 



#define __HIREDIS_READ_H
# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stdio.h"










 

 






 
# 36 "../deps/hiredis/read.h"

#define REDIS_ERR -1
#define REDIS_OK 0




 
#define REDIS_ERR_IO 1  
#define REDIS_ERR_EOF 3  
#define REDIS_ERR_PROTOCOL 4  
#define REDIS_ERR_OOM 5  
#define REDIS_ERR_OTHER 2  

#define REDIS_REPLY_STRING 1
#define REDIS_REPLY_ARRAY 2
#define REDIS_REPLY_INTEGER 3
#define REDIS_REPLY_NIL 4
#define REDIS_REPLY_STATUS 5
#define REDIS_REPLY_ERROR 6
#define REDIS_REPLY_DOUBLE 7
#define REDIS_REPLY_BOOL 8
#define REDIS_REPLY_VERB 9
#define REDIS_REPLY_MAP 9
#define REDIS_REPLY_SET 10
#define REDIS_REPLY_ATTR 11
#define REDIS_REPLY_PUSH 12
#define REDIS_REPLY_BIGNUM 13

#define REDIS_READER_MAX_BUF (1024*16)   





typedef struct redisReadTask {
    int type;
    int elements;  
    int idx;  
    void *obj;  
    struct redisReadTask *parent;  
    void *privdata;  
} redisReadTask;

typedef struct redisReplyObjectFunctions {
    void *(*createString)(const redisReadTask*, char*, size_t);
    void *(*createArray)(const redisReadTask*, int);
    void *(*createInteger)(const redisReadTask*, long long);
    void *(*createDouble)(const redisReadTask*, double, char*, size_t);
    void *(*createNil)(const redisReadTask*);
    void *(*createBool)(const redisReadTask*, int);
    void (*freeObject)(void*);
} redisReplyObjectFunctions;

typedef struct redisReader {
    int err;  
    char errstr[128];  

    char *buf;  
    size_t pos;  
    size_t len;  
    size_t maxbuf;  

    redisReadTask rstack[9];
    int ridx;  
    void *reply;  

    redisReplyObjectFunctions *fn;
    void *privdata;
} redisReader;

 
redisReader *redisReaderCreateWithFunctions(redisReplyObjectFunctions *fn);
void redisReaderFree(redisReader *r);
int redisReaderFeed(redisReader *r, const char *buf, size_t len);
int redisReaderGetReply(redisReader *r, void **reply);

#define redisReaderSetPrivdata(_r, _p) (int)(((redisReader*)(_r))->privdata = (_p))
#define redisReaderGetObject(_r) (((redisReader*)(_r))->reply)
#define redisReaderGetError(_r) (((redisReader*)(_r))->errstr)





# 37 "../deps/hiredis/hiredis.h"
# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stdarg.h"










 



 
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stdarg.h"





















 



 




#define _STDARG_H
#define _ANSI_STDARG_H_

#undef __need___va_list

 







 


#define va_start(v,l)	__builtin_va_start(v,l)
#define va_end(v)	__builtin_va_end(v)
#define va_arg(v,l)	__builtin_va_arg(v,l)


#define va_copy(d,s)	__builtin_va_copy(d,s)

#define __va_copy(d,s)	__builtin_va_copy(d,s)

 




 





# 85 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stdarg.h"




 

 
# 105 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stdarg.h"
#define _VA_LIST_


#define _VA_LIST





#define _VA_LIST_T_H


#define __va_list__








# 18 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stdarg.h"


# 26 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stdarg.h"


# 38 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stdarg.h"

#define _VARARGS_H_CSURF


#undef va_start
#hard_define va_start(x, n) (*(char**)&(x) = (char*)(&__builtin_va_alist))



#undef va_copy
#hard_define va_copy(dest, src) ((dest) = (src))



#undef va_arg
#hard_define va_arg(x, n) (*(n*)(((*(char**)&(x)) += sizeof(n)) - sizeof(n)))



#undef va_end
#hard_define va_end(x) ((void)0)



 
#hard_define __builtin_va_start(x, n) (*(char**)&(x) = (char*)(&__builtin_va_alist))
#hard_define __builtin_va_copy(dest, src) ((dest) = (src))
#hard_define __builtin_va_arg(x, n) (*(n*)(((*(char**)&(x)) += sizeof(n)) - sizeof(n)))
#hard_define __builtin_va_end(x) (void *)0
#hard_define __builtin_va_arg_pack() (__builtin_va_alist)
# 38 "../deps/hiredis/hiredis.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stdint.h"
# 1 "/usr/include/stdint.h"















 



 


#define _STDINT_H	1

#define __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h"
















 







 





#undef __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION




 
#undef __GLIBC_USE_LIB_EXT2


# define __GLIBC_USE_LIB_EXT2 1





 
#undef __GLIBC_USE_IEC_60559_BFP_EXT

# define __GLIBC_USE_IEC_60559_BFP_EXT 1





 
#undef __GLIBC_USE_IEC_60559_FUNCS_EXT

# define __GLIBC_USE_IEC_60559_FUNCS_EXT 1





 
#undef __GLIBC_USE_IEC_60559_TYPES_EXT

# define __GLIBC_USE_IEC_60559_TYPES_EXT 1
# 27 "/usr/include/stdint.h"
# 1 "/usr/include/x86_64-linux-gnu/bits/wchar.h"
















 


#define _BITS_WCHAR_H	1










 


# define __WCHAR_MAX	__WCHAR_MAX__







# define __WCHAR_MIN	__WCHAR_MIN__






# 29 "/usr/include/stdint.h"
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
 


# define __WORDSIZE	64







# define __WORDSIZE_TIME64_COMPAT32	1
 
# define __SYSCALL_WORDSIZE		64
# 30 "/usr/include/stdint.h"

 

 


 
# 1 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
















 


#define _BITS_STDINT_UINTN_H	1



typedef __uint8_t uint8_t;
typedef __uint16_t uint16_t;
typedef __uint32_t uint32_t;
typedef __uint64_t uint64_t;

# 38 "/usr/include/stdint.h"


 

 
typedef signed char		int_least8_t;
typedef short int		int_least16_t;
typedef int			int_least32_t;

typedef long int		int_least64_t;





 
typedef unsigned char		uint_least8_t;
typedef unsigned short int	uint_least16_t;
typedef unsigned int		uint_least32_t;

typedef unsigned long int	uint_least64_t;






 

 
typedef signed char		int_fast8_t;

typedef long int		int_fast16_t;
typedef long int		int_fast32_t;
typedef long int		int_fast64_t;
# 79 "/usr/include/stdint.h"

 
typedef unsigned char		uint_fast8_t;

typedef unsigned long int	uint_fast16_t;
typedef unsigned long int	uint_fast32_t;
typedef unsigned long int	uint_fast64_t;
# 92 "/usr/include/stdint.h"


 





typedef unsigned long int	uintptr_t;
# 108 "/usr/include/stdint.h"


 
typedef __intmax_t		intmax_t;
typedef __uintmax_t		uintmax_t;



#  define __INT64_C(c)	c ## L
#  define __UINT64_C(c)	c ## UL





 

 
# define INT8_MIN		(-128)
# define INT16_MIN		(-32767-1)
# define INT32_MIN		(-2147483647-1)
# define INT64_MIN		(-__INT64_C(9223372036854775807)-1)
 
# define INT8_MAX		(127)
# define INT16_MAX		(32767)
# define INT32_MAX		(2147483647)
# define INT64_MAX		(__INT64_C(9223372036854775807))

 
# define UINT8_MAX		(255)
# define UINT16_MAX		(65535)
# define UINT32_MAX		(4294967295U)
# define UINT64_MAX		(__UINT64_C(18446744073709551615))


 
# define INT_LEAST8_MIN		(-128)
# define INT_LEAST16_MIN	(-32767-1)
# define INT_LEAST32_MIN	(-2147483647-1)
# define INT_LEAST64_MIN	(-__INT64_C(9223372036854775807)-1)
 
# define INT_LEAST8_MAX		(127)
# define INT_LEAST16_MAX	(32767)
# define INT_LEAST32_MAX	(2147483647)
# define INT_LEAST64_MAX	(__INT64_C(9223372036854775807))

 
# define UINT_LEAST8_MAX	(255)
# define UINT_LEAST16_MAX	(65535)
# define UINT_LEAST32_MAX	(4294967295U)
# define UINT_LEAST64_MAX	(__UINT64_C(18446744073709551615))


 
# define INT_FAST8_MIN		(-128)

#  define INT_FAST16_MIN	(-9223372036854775807L-1)
#  define INT_FAST32_MIN	(-9223372036854775807L-1)




# define INT_FAST64_MIN		(-__INT64_C(9223372036854775807)-1)
 
# define INT_FAST8_MAX		(127)

#  define INT_FAST16_MAX	(9223372036854775807L)
#  define INT_FAST32_MAX	(9223372036854775807L)




# define INT_FAST64_MAX		(__INT64_C(9223372036854775807))

 
# define UINT_FAST8_MAX		(255)

#  define UINT_FAST16_MAX	(18446744073709551615UL)
#  define UINT_FAST32_MAX	(18446744073709551615UL)




# define UINT_FAST64_MAX	(__UINT64_C(18446744073709551615))


 

#  define INTPTR_MIN		(-9223372036854775807L-1)
#  define INTPTR_MAX		(9223372036854775807L)
#  define UINTPTR_MAX		(18446744073709551615UL)







 
# define INTMAX_MIN		(-__INT64_C(9223372036854775807)-1)
 
# define INTMAX_MAX		(__INT64_C(9223372036854775807))

 
# define UINTMAX_MAX		(__UINT64_C(18446744073709551615))


 

 

#  define PTRDIFF_MIN		(-9223372036854775807L-1)
#  define PTRDIFF_MAX		(9223372036854775807L)
# 230 "/usr/include/stdint.h"

 
# define SIG_ATOMIC_MIN		(-2147483647-1)
# define SIG_ATOMIC_MAX		(2147483647)

 

#  define SIZE_MAX		(18446744073709551615UL)
# 245 "/usr/include/stdint.h"

 

 
#  define WCHAR_MIN		__WCHAR_MIN
#  define WCHAR_MAX		__WCHAR_MAX


 
# define WINT_MIN		(0u)
# define WINT_MAX		(4294967295u)

 
# define INT8_C(c)	c
# define INT16_C(c)	c
# define INT32_C(c)	c

#  define INT64_C(c)	c ## L




 
# define UINT8_C(c)	c
# define UINT16_C(c)	c
# define UINT32_C(c)	c ## U

#  define UINT64_C(c)	c ## UL




 

#  define INTMAX_C(c)	c ## L
#  define UINTMAX_C(c)	c ## UL







# define INT8_WIDTH 8
# define UINT8_WIDTH 8
# define INT16_WIDTH 16
# define UINT16_WIDTH 16
# define INT32_WIDTH 32
# define UINT32_WIDTH 32
# define INT64_WIDTH 64
# define UINT64_WIDTH 64

# define INT_LEAST8_WIDTH 8
# define UINT_LEAST8_WIDTH 8
# define INT_LEAST16_WIDTH 16
# define UINT_LEAST16_WIDTH 16
# define INT_LEAST32_WIDTH 32
# define UINT_LEAST32_WIDTH 32
# define INT_LEAST64_WIDTH 64
# define UINT_LEAST64_WIDTH 64

# define INT_FAST8_WIDTH 8
# define UINT_FAST8_WIDTH 8
# define INT_FAST16_WIDTH __WORDSIZE
# define UINT_FAST16_WIDTH __WORDSIZE
# define INT_FAST32_WIDTH __WORDSIZE
# define UINT_FAST32_WIDTH __WORDSIZE
# define INT_FAST64_WIDTH 64
# define UINT_FAST64_WIDTH 64

# define INTPTR_WIDTH __WORDSIZE
# define UINTPTR_WIDTH __WORDSIZE

# define INTMAX_WIDTH 64
# define UINTMAX_WIDTH 64

# define PTRDIFF_WIDTH __WORDSIZE
# define SIG_ATOMIC_WIDTH 32
# define SIZE_WIDTH __WORDSIZE
# define WCHAR_WIDTH 32
# define WINT_WIDTH 32



# 10 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stdint.h"



#define _GCC_WRAP_STDINT_H
# 40 "../deps/hiredis/hiredis.h"
# 1 "../deps/hiredis/sds.h"






























 


#define __SDS_H

#define SDS_MAX_PREALLOC (1024*1024)

# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stdarg.h"










 



 




# 26 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stdarg.h"


# 38 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stdarg.h"

#define _VARARGS_H_CSURF


#undef va_start
#hard_define va_start(x, n) (*(char**)&(x) = (char*)(&__builtin_va_alist))



#undef va_copy
#hard_define va_copy(dest, src) ((dest) = (src))



#undef va_arg
#hard_define va_arg(x, n) (*(n*)(((*(char**)&(x)) += sizeof(n)) - sizeof(n)))



#undef va_end
#hard_define va_end(x) ((void)0)



 
#hard_define __builtin_va_start(x, n) (*(char**)&(x) = (char*)(&__builtin_va_alist))
#hard_define __builtin_va_copy(dest, src) ((dest) = (src))
#hard_define __builtin_va_arg(x, n) (*(n*)(((*(char**)&(x)) += sizeof(n)) - sizeof(n)))
#hard_define __builtin_va_end(x) (void *)0
#hard_define __builtin_va_arg_pack() (__builtin_va_alist)
# 40 "../deps/hiredis/sds.h"


typedef char *sds;


 
struct __attribute__ ((__packed__)) sdshdr5 {
    unsigned char flags;  
    char buf[];
};
struct __attribute__ ((__packed__)) sdshdr8 {
    uint8_t len;  
    uint8_t alloc;  
    unsigned char flags;  
    char buf[];
};
struct __attribute__ ((__packed__)) sdshdr16 {
    uint16_t len;  
    uint16_t alloc;  
    unsigned char flags;  
    char buf[];
};
struct __attribute__ ((__packed__)) sdshdr32 {
    uint32_t len;  
    uint32_t alloc;  
    unsigned char flags;  
    char buf[];
};
struct __attribute__ ((__packed__)) sdshdr64 {
    uint64_t len;  
    uint64_t alloc;  
    unsigned char flags;  
    char buf[];
};

#define SDS_TYPE_5  0
#define SDS_TYPE_8  1
#define SDS_TYPE_16 2
#define SDS_TYPE_32 3
#define SDS_TYPE_64 4
#define SDS_TYPE_MASK 7
#define SDS_TYPE_BITS 3
#define SDS_HDR_VAR(T,s) struct sdshdr##T *sh = (struct sdshdr##T *)((s)-(sizeof(struct sdshdr##T)));
#define SDS_HDR(T,s) ((struct sdshdr##T *)((s)-(sizeof(struct sdshdr##T))))
#define SDS_TYPE_5_LEN(f) ((f)>>SDS_TYPE_BITS)

static inline size_t sdslen(const sds s) {
    unsigned char flags = s[-1];
    switch(flags&7) {
        case 0:
            return ((flags)>>3);
        case 1:
            return ((struct sdshdr8 *)((s)-(sizeof(struct sdshdr8))))->len;
        case 2:
            return ((struct sdshdr16 *)((s)-(sizeof(struct sdshdr16))))->len;
        case 3:
            return ((struct sdshdr32 *)((s)-(sizeof(struct sdshdr32))))->len;
        case 4:
            return ((struct sdshdr64 *)((s)-(sizeof(struct sdshdr64))))->len;
    }
    return 0;
}

static inline size_t sdsavail(const sds s) {
    unsigned char flags = s[-1];
    switch(flags&7) {
        case 0: {
            return 0;
        }
        case 1: {
            struct sdshdr8 *sh = (struct sdshdr8 *)((s)-(sizeof(struct sdshdr8)));;
            return sh->alloc - sh->len;
        }
        case 2: {
            struct sdshdr16 *sh = (struct sdshdr16 *)((s)-(sizeof(struct sdshdr16)));;
            return sh->alloc - sh->len;
        }
        case 3: {
            struct sdshdr32 *sh = (struct sdshdr32 *)((s)-(sizeof(struct sdshdr32)));;
            return sh->alloc - sh->len;
        }
        case 4: {
            struct sdshdr64 *sh = (struct sdshdr64 *)((s)-(sizeof(struct sdshdr64)));;
            return sh->alloc - sh->len;
        }
    }
    return 0;
}

static inline void sdssetlen(sds s, size_t newlen) {
    unsigned char flags = s[-1];
    switch(flags&7) {
        case 0:
            {
                unsigned char *fp = ((unsigned char*)s)-1;
                *fp = 0 | (newlen << 3);
            }
            break;
        case 1:
            ((struct sdshdr8 *)((s)-(sizeof(struct sdshdr8))))->len = newlen;
            break;
        case 2:
            ((struct sdshdr16 *)((s)-(sizeof(struct sdshdr16))))->len = newlen;
            break;
        case 3:
            ((struct sdshdr32 *)((s)-(sizeof(struct sdshdr32))))->len = newlen;
            break;
        case 4:
            ((struct sdshdr64 *)((s)-(sizeof(struct sdshdr64))))->len = newlen;
            break;
    }
}

static inline void sdsinclen(sds s, size_t inc) {
    unsigned char flags = s[-1];
    switch(flags&7) {
        case 0:
            {
                unsigned char *fp = ((unsigned char*)s)-1;
                unsigned char newlen = ((flags)>>3)+inc;
                *fp = 0 | (newlen << 3);
            }
            break;
        case 1:
            ((struct sdshdr8 *)((s)-(sizeof(struct sdshdr8))))->len += inc;
            break;
        case 2:
            ((struct sdshdr16 *)((s)-(sizeof(struct sdshdr16))))->len += inc;
            break;
        case 3:
            ((struct sdshdr32 *)((s)-(sizeof(struct sdshdr32))))->len += inc;
            break;
        case 4:
            ((struct sdshdr64 *)((s)-(sizeof(struct sdshdr64))))->len += inc;
            break;
    }
}

 
static inline size_t sdsalloc(const sds s) {
    unsigned char flags = s[-1];
    switch(flags&7) {
        case 0:
            return ((flags)>>3);
        case 1:
            return ((struct sdshdr8 *)((s)-(sizeof(struct sdshdr8))))->alloc;
        case 2:
            return ((struct sdshdr16 *)((s)-(sizeof(struct sdshdr16))))->alloc;
        case 3:
            return ((struct sdshdr32 *)((s)-(sizeof(struct sdshdr32))))->alloc;
        case 4:
            return ((struct sdshdr64 *)((s)-(sizeof(struct sdshdr64))))->alloc;
    }
    return 0;
}

static inline void sdssetalloc(sds s, size_t newlen) {
    unsigned char flags = s[-1];
    switch(flags&7) {
        case 0:
             
            break;
        case 1:
            ((struct sdshdr8 *)((s)-(sizeof(struct sdshdr8))))->alloc = newlen;
            break;
        case 2:
            ((struct sdshdr16 *)((s)-(sizeof(struct sdshdr16))))->alloc = newlen;
            break;
        case 3:
            ((struct sdshdr32 *)((s)-(sizeof(struct sdshdr32))))->alloc = newlen;
            break;
        case 4:
            ((struct sdshdr64 *)((s)-(sizeof(struct sdshdr64))))->alloc = newlen;
            break;
    }
}

sds sdsnewlen(const void *init, size_t initlen);
sds sdsnew(const char *init);
sds sdsempty(void);
sds sdsdup(const sds s);
void sdsfree(sds s);
sds sdsgrowzero(sds s, size_t len);
sds sdscatlen(sds s, const void *t, size_t len);
sds sdscat(sds s, const char *t);
sds sdscatsds(sds s, const sds t);
sds sdscpylen(sds s, const char *t, size_t len);
sds sdscpy(sds s, const char *t);

sds sdscatvprintf(sds s, const char *fmt, va_list ap);

sds sdscatprintf(sds s, const char *fmt, ...)
    __attribute__((format(printf, 2, 3)));




sds sdscatfmt(sds s, char const *fmt, ...);
sds sdstrim(sds s, const char *cset);
void sdsrange(sds s, int start, int end);
void sdsupdatelen(sds s);
void sdsclear(sds s);
int sdscmp(const sds s1, const sds s2);
sds *sdssplitlen(const char *s, int len, const char *sep, int seplen, int *count);
void sdsfreesplitres(sds *tokens, int count);
void sdstolower(sds s);
void sdstoupper(sds s);
sds sdsfromlonglong(long long value);
sds sdscatrepr(sds s, const char *p, size_t len);
sds *sdssplitargs(const char *line, int *argc);
sds sdsmapchars(sds s, const char *from, const char *to, size_t setlen);
sds sdsjoin(char **argv, int argc, char *sep);
sds sdsjoinsds(sds *argv, int argc, const char *sep, size_t seplen);

 
sds sdsMakeRoomFor(sds s, size_t addlen);
void sdsIncrLen(sds s, int incr);
sds sdsRemoveFreeSpace(sds s);
size_t sdsAllocSize(sds s);
void *sdsAllocPtr(sds s);




 
void *sds_malloc(size_t size);
void *sds_realloc(void *ptr, size_t size);
void sds_free(void *ptr);





# 41 "../deps/hiredis/hiredis.h"

#define HIREDIS_MAJOR 0
#define HIREDIS_MINOR 14
#define HIREDIS_PATCH 0
#define HIREDIS_SONAME 0.14


 
#define REDIS_BLOCK 0x1


 
#define REDIS_CONNECTED 0x2




 
#define REDIS_DISCONNECTING 0x4


 
#define REDIS_FREEING 0x8

 
#define REDIS_IN_CALLBACK 0x10

 
#define REDIS_SUBSCRIBED 0x20

 
#define REDIS_MONITORING 0x40

 
#define REDIS_REUSEADDR 0x80

#define REDIS_KEEPALIVE_INTERVAL 15  


 
#define REDIS_CONNECT_RETRIES  10





 
typedef struct redisReply {
    int type;  
    long long integer;  
    double dval;  
    size_t len;  
    char *str; 
 
    size_t elements;  
    struct redisReply **element;  
} redisReply;

redisReader *redisReaderCreate(void);

 
void freeReplyObject(void *reply);

 
int redisvFormatCommand(char **target, const char *format, va_list ap);
int redisFormatCommand(char **target, const char *format, ...);
int redisFormatCommandArgv(char **target, int argc, const char **argv, const size_t *argvlen);
int redisFormatSdsCommandArgv(sds *target, int argc, const char ** argv, const size_t *argvlen);
void redisFreeCommand(char *cmd);
void redisFreeSdsCommand(sds cmd);

enum redisConnectionType {
    REDIS_CONN_TCP,
    REDIS_CONN_UNIX
};

 
typedef struct redisContext {
    int err;  
    char errstr[128];  
    int fd;
    int flags;
    char *obuf;  
    redisReader *reader;  

    enum redisConnectionType connection_type;
    struct timeval *timeout;

    struct {
        char *host;
        char *source_addr;
        int port;
    } tcp;

    struct {
        char *path;
    } unix_sock;

     
    struct sockadr *saddr;
    size_t addrlen;
} redisContext;

redisContext *redisConnect(const char *ip, int port);
redisContext *redisConnectWithTimeout(const char *ip, int port, const struct timeval tv);
redisContext *redisConnectNonBlock(const char *ip, int port);
redisContext *redisConnectBindNonBlock(const char *ip, int port,
                                       const char *source_addr);
redisContext *redisConnectBindNonBlockWithReuse(const char *ip, int port,
                                                const char *source_addr);
redisContext *redisConnectUnix(const char *path);
redisContext *redisConnectUnixWithTimeout(const char *path, const struct timeval tv);
redisContext *redisConnectUnixNonBlock(const char *path);
redisContext *redisConnectFd(int fd);









 
int redisReconnect(redisContext *c);

int redisSetTimeout(redisContext *c, const struct timeval tv);
int redisEnableKeepAlive(redisContext *c);
void redisFree(redisContext *c);
int redisFreeKeepFd(redisContext *c);
int redisBufferRead(redisContext *c);
int redisBufferWrite(redisContext *c, int *done);




 
int redisGetReply(redisContext *c, void **reply);
int redisGetReplyFromReader(redisContext *c, void **reply);


 
int redisAppendFormattedCommand(redisContext *c, const char *cmd, size_t len);


 
int redisvAppendCommand(redisContext *c, const char *format, va_list ap);
int redisAppendCommand(redisContext *c, const char *format, ...);
int redisAppendCommandArgv(redisContext *c, int argc, const char **argv, const size_t *argvlen);





 
void *redisvCommand(redisContext *c, const char *format, va_list ap);
void *redisCommand(redisContext *c, const char *format, ...);
void *redisCommandArgv(redisContext *c, int argc, const char **argv, const size_t *argvlen);





# 50 "redis-cli.c"
# 1 "dict.h"

































 




#define __DICT_H

#define DICT_OK 0
#define DICT_ERR 1

 
#define DICT_NOTUSED(V) ((void) V)

typedef struct dictEntry {
    void *key;
    union {
        void *val;
        uint64_t u64;
        int64_t s64;
        double d;
    } v;
    struct dictEntry *next;
} dictEntry;

typedef struct dictType {
    uint64_t (*hashFunction)(const void *key);
    void *(*keyDup)(void *privdata, const void *key);
    void *(*valDup)(void *privdata, const void *obj);
    int (*keyCompare)(void *privdata, const void *key1, const void *key2);
    void (*keyDestructor)(void *privdata, void *key);
    void (*valDestructor)(void *privdata, void *obj);
} dictType;


 
typedef struct dictht {
    dictEntry **table;
    unsigned long size;
    unsigned long sizemask;
    unsigned long used;
} dictht;

typedef struct dict {
    dictType *type;
    void *privdata;
    dictht ht[2];
    long rehashidx;  
    unsigned long iterators;  
} dict;




 
typedef struct dictIterator {
    dict *d;
    long index;
    int table, safe;
    dictEntry *entry, *nextEntry;
     
    long long fingerprint;
} dictIterator;

typedef void (dictScanFunction)(void *privdata, const dictEntry *de);
typedef void (dictScanBucketFunction)(void *privdata, dictEntry **bucketref);

 
#define DICT_HT_INITIAL_SIZE     4

 
#define dictFreeVal(d, entry)     if ((d)->type->valDestructor)         (d)->type->valDestructor((d)->privdata, (entry)->v.val)



#define dictSetVal(d, entry, _val_) do {     if ((d)->type->valDup)         (entry)->v.val = (d)->type->valDup((d)->privdata, _val_);     else         (entry)->v.val = (_val_); } while(0)






#define dictSetSignedIntegerVal(entry, _val_)     do { (entry)->v.s64 = _val_; } while(0)


#define dictSetUnsignedIntegerVal(entry, _val_)     do { (entry)->v.u64 = _val_; } while(0)


#define dictSetDoubleVal(entry, _val_)     do { (entry)->v.d = _val_; } while(0)


#define dictFreeKey(d, entry)     if ((d)->type->keyDestructor)         (d)->type->keyDestructor((d)->privdata, (entry)->key)



#define dictSetKey(d, entry, _key_) do {     if ((d)->type->keyDup)         (entry)->key = (d)->type->keyDup((d)->privdata, _key_);     else         (entry)->key = (_key_); } while(0)






#define dictCompareKeys(d, key1, key2)     (((d)->type->keyCompare) ?         (d)->type->keyCompare((d)->privdata, key1, key2) :         (key1) == (key2))




#define dictHashKey(d, key) (d)->type->hashFunction(key)
#define dictGetKey(he) ((he)->key)
#define dictGetVal(he) ((he)->v.val)
#define dictGetSignedIntegerVal(he) ((he)->v.s64)
#define dictGetUnsignedIntegerVal(he) ((he)->v.u64)
#define dictGetDoubleVal(he) ((he)->v.d)
#define dictSlots(d) ((d)->ht[0].size+(d)->ht[1].size)
#define dictSize(d) ((d)->ht[0].used+(d)->ht[1].used)
#define dictIsRehashing(d) ((d)->rehashidx != -1)

 
dict *dictCreate(dictType *type, void *privDataPtr);
int dictExpand(dict *d, unsigned long size);
int dictAdd(dict *d, void *key, void *val);
dictEntry *dictAddRaw(dict *d, void *key, dictEntry **existing);
dictEntry *dictAddOrFind(dict *d, void *key);
int dictReplace(dict *d, void *key, void *val);
int dictDelete(dict *d, const void *key);
dictEntry *dictUnlink(dict *ht, const void *key);
void dictFreeUnlinkedEntry(dict *d, dictEntry *he);
void dictRelease(dict *d);
dictEntry * dictFind(dict *d, const void *key);
void *dictFetchValue(dict *d, const void *key);
int dictResize(dict *d);
dictIterator *dictGetIterator(dict *d);
dictIterator *dictGetSafeIterator(dict *d);
dictEntry *dictNext(dictIterator *iter);
void dictReleaseIterator(dictIterator *iter);
dictEntry *dictGetRandomKey(dict *d);
dictEntry *dictGetFairRandomKey(dict *d);
unsigned int dictGetSomeKeys(dict *d, dictEntry **des, unsigned int count);
void dictGetStats(char *buf, size_t bufsize, dict *d);
uint64_t dictGenHashFunction(const void *key, int len);
uint64_t dictGenCaseHashFunction(const unsigned char *buf, int len);
void dictEmpty(dict *d, void(callback)(void*));
void dictEnableResize(void);
void dictDisableResize(void);
int dictRehash(dict *d, int n);
int dictRehashMilliseconds(dict *d, int ms);
void dictSetHashFunctionSeed(uint8_t *seed);
uint8_t *dictGetHashFunctionSeed(void);
unsigned long dictScan(dict *d, unsigned long v, dictScanFunction *fn, dictScanBucketFunction *bucketfn, void *privdata);
uint64_t dictGetHash(dict *d, const void *key);
dictEntry **dictFindEntryRefByPtrAndHash(dict *d, const void *oldptr, uint64_t hash);

 
extern dictType dictTypeHeapStringCopyKey;
extern dictType dictTypeHeapStrings;
extern dictType dictTypeHeapStringCopyKeyValue;

# 52 "redis-cli.c"
# 1 "adlist.h"




























 


#define __ADLIST_H__

 

typedef struct listNode {
    struct listNode *prev;
    struct listNode *next;
    void *value;
} listNode;

typedef struct listIter {
    listNode *next;
    int direction;
} listIter;

typedef struct list {
    listNode *head;
    listNode *tail;
    void *(*dup)(void *ptr);
    void (*free)(void *ptr);
    int (*match)(void *ptr, void *key);
    unsigned long len;
} list;

 
#define listLength(l) ((l)->len)
#define listFirst(l) ((l)->head)
#define listLast(l) ((l)->tail)
#define listPrevNode(n) ((n)->prev)
#define listNextNode(n) ((n)->next)
#define listNodeValue(n) ((n)->value)

#define listSetDupMethod(l,m) ((l)->dup = (m))
#define listSetFreeMethod(l,m) ((l)->free = (m))
#define listSetMatchMethod(l,m) ((l)->match = (m))

#define listGetDupMethod(l) ((l)->dup)
#define listGetFree(l) ((l)->free)
#define listGetMatchMethod(l) ((l)->match)

 
list *listCreate(void);
void listRelease(list *list);
void listEmpty(list *list);
list *listAddNodeHead(list *list, void *value);
list *listAddNodeTail(list *list, void *value);
list *listInsertNode(list *list, listNode *old_node, void *value, int after);
void listDelNode(list *list, listNode *node);
listIter *listGetIterator(list *list, int direction);
listNode *listNext(listIter *iter);
void listReleaseIterator(listIter *iter);
list *listDup(list *orig);
listNode *listSearchKey(list *list, void *key);
listNode *listIndex(list *list, long index);
void listRewind(list *list, listIter *li);
void listRewindTail(list *list, listIter *li);
void listRotate(list *list);
void listJoin(list *l, list *o);

 
#define AL_START_HEAD 0
#define AL_START_TAIL 1

# 53 "redis-cli.c"
# 1 "zmalloc.h"




























 


#define __ZMALLOC_H

 
#define __xstr(s) __str(s)
#define __str(s) #s

# 49 "zmalloc.h"
#define ZMALLOC_LIB ("jemalloc-" __xstr(JEMALLOC_VERSION_MAJOR) "." __xstr(JEMALLOC_VERSION_MINOR) "." __xstr(JEMALLOC_VERSION_BUGFIX))
# 1 "../deps/jemalloc/include/jemalloc/jemalloc.h"

#define JEMALLOC_H_




 
#define JEMALLOC_HAVE_ATTR

 
#define JEMALLOC_HAVE_ATTR_ALLOC_SIZE

 
#define JEMALLOC_HAVE_ATTR_FORMAT_GNU_PRINTF

 
#define JEMALLOC_HAVE_ATTR_FORMAT_PRINTF




 
#define JEMALLOC_OVERRIDE_MEMALIGN
#define JEMALLOC_OVERRIDE_VALLOC







 
#define JEMALLOC_USABLE_SIZE_CONST





 
#define JEMALLOC_USE_CXX_THROW

# 49 "../deps/jemalloc/include/jemalloc/jemalloc.h"

 
#define LG_SIZEOF_PTR 3





 

#  define je_aligned_alloc je_aligned_alloc
#  define je_calloc je_calloc
#  define je_dallocx je_dallocx
#  define je_free je_free
#  define je_mallctl je_mallctl
#  define je_mallctlbymib je_mallctlbymib
#  define je_mallctlnametomib je_mallctlnametomib
#  define je_malloc je_malloc
#  define je_malloc_conf je_malloc_conf
#  define je_malloc_message je_malloc_message
#  define je_malloc_stats_print je_malloc_stats_print
#  define je_malloc_usable_size je_malloc_usable_size
#  define je_mallocx je_mallocx
#  define je_nallocx je_nallocx
#  define je_posix_memalign je_posix_memalign
#  define je_rallocx je_rallocx
#  define je_realloc je_realloc
#  define je_sallocx je_sallocx
#  define je_sdallocx je_sdallocx
#  define je_xallocx je_xallocx
#  define je_memalign je_memalign
#  define je_valloc je_valloc


# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stdbool.h"





















 



 


#define _STDBOOL_H



#define bool	_Bool
#define true	1
#define false	0

# 50 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stdbool.h"

 
#define __bool_true_false_are_defined	1

# 85 "../deps/jemalloc/include/jemalloc/jemalloc.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include-fixed/limits.h"





















 


 


 
# 192 "/usr/lib/gcc/x86_64-linux-gnu/7/include-fixed/limits.h"





# 87 "../deps/jemalloc/include/jemalloc/jemalloc.h"


#define JEMALLOC_VERSION "5.1.0-0-g0"
#define JEMALLOC_VERSION_MAJOR 5
#define JEMALLOC_VERSION_MINOR 1
#define JEMALLOC_VERSION_BUGFIX 0
#define JEMALLOC_VERSION_NREV 0
#define JEMALLOC_VERSION_GID "0"

#define MALLOCX_LG_ALIGN(la)	((int)(la))



#  define MALLOCX_ALIGN(a)						     ((int)(((size_t)(a) < (size_t)INT_MAX) ? ffs((int)(a))-1 :	     ffs((int)(((size_t)(a))>>32))+31))



#define MALLOCX_ZERO	((int)0x40)



 
#define MALLOCX_TCACHE(tc)	((int)(((tc)+2) << 8))
#define MALLOCX_TCACHE_NONE	MALLOCX_TCACHE(-1)


 
#define MALLOCX_ARENA(a)	((((int)(a))+1) << 20)












 
#define MALLCTL_ARENAS_ALL	4096



 
#define MALLCTL_ARENAS_DESTROYED	4097




#  define JEMALLOC_CXX_THROW


# 168 "../deps/jemalloc/include/jemalloc/jemalloc.h"
#  define JEMALLOC_ATTR(s) __attribute__((s))
#  define JEMALLOC_ALIGNED(s) JEMALLOC_ATTR(aligned(s))

#    define JEMALLOC_ALLOC_SIZE(s) JEMALLOC_ATTR(alloc_size(s))
#    define JEMALLOC_ALLOC_SIZE2(s1, s2) JEMALLOC_ATTR(alloc_size(s1, s2))





#    define JEMALLOC_EXPORT JEMALLOC_ATTR(visibility("default"))


#    define JEMALLOC_FORMAT_PRINTF(s, i) JEMALLOC_ATTR(format(gnu_printf, s, i))





#  define JEMALLOC_NOINLINE JEMALLOC_ATTR(noinline)
#  define JEMALLOC_NOTHROW JEMALLOC_ATTR(nothrow)
#  define JEMALLOC_SECTION(s) JEMALLOC_ATTR(section(s))
#  define JEMALLOC_RESTRICT_RETURN
#  define JEMALLOC_ALLOCATOR
# 205 "../deps/jemalloc/include/jemalloc/jemalloc.h"


 
#define JEMALLOC_FRAG_HINT





 
extern __attribute__((visibility("default"))) const char	*je_malloc_conf;
extern __attribute__((visibility("default"))) void		(*je_malloc_message)(void *cbopaque,
    const char *s);

__attribute__((visibility("default")))  
    void __attribute__((nothrow))	*je_malloc(size_t size)
     __attribute__((malloc)) __attribute__((alloc_size(1)));
__attribute__((visibility("default")))  
    void __attribute__((nothrow))	*je_calloc(size_t num, size_t size)
     __attribute__((malloc)) __attribute__((alloc_size(1, 2)));
__attribute__((visibility("default"))) int __attribute__((nothrow))	je_posix_memalign(void **memptr,
    size_t alignment, size_t size)  __attribute__((nonnull(1)));
__attribute__((visibility("default")))  
    void __attribute__((nothrow))	*je_aligned_alloc(size_t alignment,
    size_t size)  __attribute__((malloc))
    __attribute__((alloc_size(2)));
__attribute__((visibility("default")))  
    void __attribute__((nothrow))	*je_realloc(void *ptr, size_t size)
     __attribute__((alloc_size(2)));
__attribute__((visibility("default"))) void __attribute__((nothrow))	je_free(void *ptr)
    ;

__attribute__((visibility("default")))  
    void __attribute__((nothrow))	*je_mallocx(size_t size, int flags)
    __attribute__((malloc)) __attribute__((alloc_size(1)));
__attribute__((visibility("default")))  
    void __attribute__((nothrow))	*je_rallocx(void *ptr, size_t size,
    int flags) __attribute__((alloc_size(2)));
__attribute__((visibility("default"))) size_t __attribute__((nothrow))	je_xallocx(void *ptr, size_t size,
    size_t extra, int flags);
__attribute__((visibility("default"))) size_t __attribute__((nothrow))	je_sallocx(const void *ptr,
    int flags) __attribute__((pure));
__attribute__((visibility("default"))) void __attribute__((nothrow))	je_dallocx(void *ptr, int flags);
__attribute__((visibility("default"))) void __attribute__((nothrow))	je_sdallocx(void *ptr, size_t size,
    int flags);
__attribute__((visibility("default"))) size_t __attribute__((nothrow))	je_nallocx(size_t size, int flags)
    __attribute__((pure));

__attribute__((visibility("default"))) int __attribute__((nothrow))	je_mallctl(const char *name,
    void *oldp, size_t *oldlenp, void *newp, size_t newlen);
__attribute__((visibility("default"))) int __attribute__((nothrow))	je_mallctlnametomib(const char *name,
    size_t *mibp, size_t *miblenp);
__attribute__((visibility("default"))) int __attribute__((nothrow))	je_mallctlbymib(const size_t *mib,
    size_t miblen, void *oldp, size_t *oldlenp, void *newp, size_t newlen);
__attribute__((visibility("default"))) void __attribute__((nothrow))	je_malloc_stats_print(
    void (*write_cb)(void *, const char *), void *je_cbopaque,
    const char *opts);
__attribute__((visibility("default"))) size_t __attribute__((nothrow))	je_malloc_usable_size(
     void *ptr) ;


__attribute__((visibility("default")))  
    void __attribute__((nothrow))	*je_memalign(size_t alignment, size_t size)
     __attribute__((malloc));



__attribute__((visibility("default")))  
    void __attribute__((nothrow))	*je_valloc(size_t size) 
    __attribute__((malloc));


typedef struct extent_hooks_s extent_hooks_t;





 
typedef void *(extent_alloc_t)(extent_hooks_t *, void *, size_t, size_t, _Bool *,
    _Bool *, unsigned);





 
typedef _Bool (extent_dalloc_t)(extent_hooks_t *, void *, size_t, _Bool,
    unsigned);





 
typedef void (extent_destroy_t)(extent_hooks_t *, void *, size_t, _Bool,
    unsigned);





 
typedef _Bool (extent_commit_t)(extent_hooks_t *, void *, size_t, size_t, size_t,
    unsigned);





 
typedef _Bool (extent_decommit_t)(extent_hooks_t *, void *, size_t, size_t,
    size_t, unsigned);





 
typedef _Bool (extent_purge_t)(extent_hooks_t *, void *, size_t, size_t, size_t,
    unsigned);





 
typedef _Bool (extent_split_t)(extent_hooks_t *, void *, size_t, size_t, size_t,
    _Bool, unsigned);





 
typedef _Bool (extent_merge_t)(extent_hooks_t *, void *, size_t, void *, size_t,
    _Bool, unsigned);

struct extent_hooks_s {
	extent_alloc_t		*alloc;
	extent_dalloc_t		*dalloc;
	extent_destroy_t	*destroy;
	extent_commit_t		*commit;
	extent_decommit_t	*decommit;
	extent_purge_t		*purge_lazy;
	extent_purge_t		*purge_forced;
	extent_split_t		*split;
	extent_merge_t		*merge;
};







 
# 389 "../deps/jemalloc/include/jemalloc/jemalloc.h"







 

#  undef je_aligned_alloc
#  undef je_calloc
#  undef je_dallocx
#  undef je_free
#  undef je_mallctl
#  undef je_mallctlbymib
#  undef je_mallctlnametomib
#  undef je_malloc
#  undef je_malloc_conf
#  undef je_malloc_message
#  undef je_malloc_stats_print
#  undef je_malloc_usable_size
#  undef je_mallocx
#  undef je_nallocx
#  undef je_posix_memalign
#  undef je_rallocx
#  undef je_realloc
#  undef je_sallocx
#  undef je_sdallocx
#  undef je_xallocx
#  undef je_memalign
#  undef je_valloc


# 51 "zmalloc.h"

#define HAVE_MALLOC_SIZE 1
#define zmalloc_size(p) je_malloc_usable_size(p)










# 72 "zmalloc.h"



 

#define HAVE_DEFRAG


void *zmalloc(size_t size);
void *zcalloc(size_t size);
void *zrealloc(void *ptr, size_t size);
void zfree(void *ptr);
char *zstrdup(const char *s);
size_t zmalloc_used_memory(void);
void zmalloc_set_oom_handler(void (*oom_handler)(size_t));
size_t zmalloc_get_rss(void);
int zmalloc_get_allocator_info(size_t *allocated, size_t *active, size_t *resident);
size_t zmalloc_get_private_dirty(long pid);
size_t zmalloc_get_smap_bytes_by_field(char *field, long pid);
size_t zmalloc_get_memory_size(void);
void zlibc_free(void *ptr);


void zfree_no_tcache(void *ptr);
void *zmalloc_no_tcache(size_t size);






#define zmalloc_usable(p) zmalloc_size(p)






# 54 "redis-cli.c"
# 1 "../deps/linenoise/linenoise.h"




































 


#define __LINENOISE_H





typedef struct linenoiseCompletions {
  size_t len;
  char **cvec;
} linenoiseCompletions;

typedef void(linenoiseCompletionCallback)(const char *, linenoiseCompletions *);
typedef char*(linenoiseHintsCallback)(const char *, int *color, int *bold);
typedef void(linenoiseFreeHintsCallback)(void *);
void linenoiseSetCompletionCallback(linenoiseCompletionCallback *);
void linenoiseSetHintsCallback(linenoiseHintsCallback *);
void linenoiseSetFreeHintsCallback(linenoiseFreeHintsCallback *);
void linenoiseAddCompletion(linenoiseCompletions *, const char *);

char *linenoise(const char *prompt);
void linenoiseFree(void *ptr);
int linenoiseHistoryAdd(const char *line);
int linenoiseHistorySetMaxLen(int len);
int linenoiseHistorySave(const char *filename);
int linenoiseHistoryLoad(const char *filename);
void linenoiseClearScreen(void);
void linenoiseSetMultiLine(int ml);
void linenoisePrintKeyCodes(void);





# 55 "redis-cli.c"
# 1 "help.h"
 


#define __REDIS_HELP_H

static char *commandGroups[] = {
    "generic",
    "string",
    "list",
    "set",
    "sorted_set",
    "hash",
    "pubsub",
    "transactions",
    "connection",
    "server",
    "scripting",
    "hyperloglog",
    "cluster",
    "geo",
    "stream"
};

struct commandHelp {
  char *name;
  char *params;
  char *summary;
  int group;
  char *since;
} commandHelp[] = {
    { "APPEND",
    "key value",
    "Append a value to a key",
    1,
    "2.0.0" },
    { "AUTH",
    "password",
    "Authenticate to the server",
    8,
    "1.0.0" },
    { "BGREWRITEAOF",
    "-",
    "Asynchronously rewrite the append-only file",
    9,
    "1.0.0" },
    { "BGSAVE",
    "-",
    "Asynchronously save the dataset to disk",
    9,
    "1.0.0" },
    { "BITCOUNT",
    "key [start end]",
    "Count set bits in a string",
    1,
    "2.6.0" },
    { "BITFIELD",
    "key [GET type offset] [SET type offset value] [INCRBY type offset increment] [OVERFLOW WRAP|SAT|FAIL]",
    "Perform arbitrary bitfield integer operations on strings",
    1,
    "3.2.0" },
    { "BITOP",
    "operation destkey key [key ...]",
    "Perform bitwise operations between strings",
    1,
    "2.6.0" },
    { "BITPOS",
    "key bit [start] [end]",
    "Find first bit set or clear in a string",
    1,
    "2.8.7" },
    { "BLPOP",
    "key [key ...] timeout",
    "Remove and get the first element in a list, or block until one is available",
    2,
    "2.0.0" },
    { "BRPOP",
    "key [key ...] timeout",
    "Remove and get the last element in a list, or block until one is available",
    2,
    "2.0.0" },
    { "BRPOPLPUSH",
    "source destination timeout",
    "Pop a value from a list, push it to another list and return it; or block until one is available",
    2,
    "2.2.0" },
    { "BZPOPMAX",
    "key [key ...] timeout",
    "Remove and return the member with the highest score from one or more sorted sets, or block until one is available",
    4,
    "5.0.0" },
    { "BZPOPMIN",
    "key [key ...] timeout",
    "Remove and return the member with the lowest score from one or more sorted sets, or block until one is available",
    4,
    "5.0.0" },
    { "CLIENT GETNAME",
    "-",
    "Get the current connection name",
    9,
    "2.6.9" },
    { "CLIENT ID",
    "-",
    "Returns the client ID for the current connection",
    9,
    "5.0.0" },
    { "CLIENT KILL",
    "[ip:port] [ID client-id] [TYPE normal|master|slave|pubsub] [ADDR ip:port] [SKIPME yes/no]",
    "Kill the connection of a client",
    9,
    "2.4.0" },
    { "CLIENT LIST",
    "-",
    "Get the list of client connections",
    9,
    "2.4.0" },
    { "CLIENT PAUSE",
    "timeout",
    "Stop processing commands from clients for some time",
    9,
    "2.9.50" },
    { "CLIENT REPLY",
    "ON|OFF|SKIP",
    "Instruct the server whether to reply to commands",
    9,
    "3.2" },
    { "CLIENT SETNAME",
    "connection-name",
    "Set the current connection name",
    9,
    "2.6.9" },
    { "CLIENT UNBLOCK",
    "client-id [TIMEOUT|ERROR]",
    "Unblock a client blocked in a blocking command from a different connection",
    9,
    "5.0.0" },
    { "CLUSTER ADDSLOTS",
    "slot [slot ...]",
    "Assign new hash slots to receiving node",
    12,
    "3.0.0" },
    { "CLUSTER COUNT-FAILURE-REPORTS",
    "node-id",
    "Return the number of failure reports active for a given node",
    12,
    "3.0.0" },
    { "CLUSTER COUNTKEYSINSLOT",
    "slot",
    "Return the number of local keys in the specified hash slot",
    12,
    "3.0.0" },
    { "CLUSTER DELSLOTS",
    "slot [slot ...]",
    "Set hash slots as unbound in receiving node",
    12,
    "3.0.0" },
    { "CLUSTER FAILOVER",
    "[FORCE|TAKEOVER]",
    "Forces a replica to perform a manual failover of its master.",
    12,
    "3.0.0" },
    { "CLUSTER FORGET",
    "node-id",
    "Remove a node from the nodes table",
    12,
    "3.0.0" },
    { "CLUSTER GETKEYSINSLOT",
    "slot count",
    "Return local key names in the specified hash slot",
    12,
    "3.0.0" },
    { "CLUSTER INFO",
    "-",
    "Provides info about Redis Cluster node state",
    12,
    "3.0.0" },
    { "CLUSTER KEYSLOT",
    "key",
    "Returns the hash slot of the specified key",
    12,
    "3.0.0" },
    { "CLUSTER MEET",
    "ip port",
    "Force a node cluster to handshake with another node",
    12,
    "3.0.0" },
    { "CLUSTER NODES",
    "-",
    "Get Cluster config for the node",
    12,
    "3.0.0" },
    { "CLUSTER REPLICAS",
    "node-id",
    "List replica nodes of the specified master node",
    12,
    "5.0.0" },
    { "CLUSTER REPLICATE",
    "node-id",
    "Reconfigure a node as a replica of the specified master node",
    12,
    "3.0.0" },
    { "CLUSTER RESET",
    "[HARD|SOFT]",
    "Reset a Redis Cluster node",
    12,
    "3.0.0" },
    { "CLUSTER SAVECONFIG",
    "-",
    "Forces the node to save cluster state on disk",
    12,
    "3.0.0" },
    { "CLUSTER SET-CONFIG-EPOCH",
    "config-epoch",
    "Set the configuration epoch in a new node",
    12,
    "3.0.0" },
    { "CLUSTER SETSLOT",
    "slot IMPORTING|MIGRATING|STABLE|NODE [node-id]",
    "Bind a hash slot to a specific node",
    12,
    "3.0.0" },
    { "CLUSTER SLAVES",
    "node-id",
    "List replica nodes of the specified master node",
    12,
    "3.0.0" },
    { "CLUSTER SLOTS",
    "-",
    "Get array of Cluster slot to node mappings",
    12,
    "3.0.0" },
    { "COMMAND",
    "-",
    "Get array of Redis command details",
    9,
    "2.8.13" },
    { "COMMAND COUNT",
    "-",
    "Get total number of Redis commands",
    9,
    "2.8.13" },
    { "COMMAND GETKEYS",
    "-",
    "Extract keys given a full Redis command",
    9,
    "2.8.13" },
    { "COMMAND INFO",
    "command-name [command-name ...]",
    "Get array of specific Redis command details",
    9,
    "2.8.13" },
    { "CONFIG GET",
    "parameter",
    "Get the value of a configuration parameter",
    9,
    "2.0.0" },
    { "CONFIG RESETSTAT",
    "-",
    "Reset the stats returned by INFO",
    9,
    "2.0.0" },
    { "CONFIG REWRITE",
    "-",
    "Rewrite the configuration file with the in memory configuration",
    9,
    "2.8.0" },
    { "CONFIG SET",
    "parameter value",
    "Set a configuration parameter to the given value",
    9,
    "2.0.0" },
    { "DBSIZE",
    "-",
    "Return the number of keys in the selected database",
    9,
    "1.0.0" },
    { "DEBUG OBJECT",
    "key",
    "Get debugging information about a key",
    9,
    "1.0.0" },
    { "DEBUG SEGFAULT",
    "-",
    "Make the server crash",
    9,
    "1.0.0" },
    { "DECR",
    "key",
    "Decrement the integer value of a key by one",
    1,
    "1.0.0" },
    { "DECRBY",
    "key decrement",
    "Decrement the integer value of a key by the given number",
    1,
    "1.0.0" },
    { "DEL",
    "key [key ...]",
    "Delete a key",
    0,
    "1.0.0" },
    { "DISCARD",
    "-",
    "Discard all commands issued after MULTI",
    7,
    "2.0.0" },
    { "DUMP",
    "key",
    "Return a serialized version of the value stored at the specified key.",
    0,
    "2.6.0" },
    { "ECHO",
    "message",
    "Echo the given string",
    8,
    "1.0.0" },
    { "EVAL",
    "script numkeys key [key ...] arg [arg ...]",
    "Execute a Lua script server side",
    10,
    "2.6.0" },
    { "EVALSHA",
    "sha1 numkeys key [key ...] arg [arg ...]",
    "Execute a Lua script server side",
    10,
    "2.6.0" },
    { "EXEC",
    "-",
    "Execute all commands issued after MULTI",
    7,
    "1.2.0" },
    { "EXISTS",
    "key [key ...]",
    "Determine if a key exists",
    0,
    "1.0.0" },
    { "EXPIRE",
    "key seconds",
    "Set a key's time to live in seconds",
    0,
    "1.0.0" },
    { "EXPIREAT",
    "key timestamp",
    "Set the expiration for a key as a UNIX timestamp",
    0,
    "1.2.0" },
    { "FLUSHALL",
    "[ASYNC]",
    "Remove all keys from all databases",
    9,
    "1.0.0" },
    { "FLUSHDB",
    "[ASYNC]",
    "Remove all keys from the current database",
    9,
    "1.0.0" },
    { "GEOADD",
    "key longitude latitude member [longitude latitude member ...]",
    "Add one or more geospatial items in the geospatial index represented using a sorted set",
    13,
    "3.2.0" },
    { "GEODIST",
    "key member1 member2 [unit]",
    "Returns the distance between two members of a geospatial index",
    13,
    "3.2.0" },
    { "GEOHASH",
    "key member [member ...]",
    "Returns members of a geospatial index as standard geohash strings",
    13,
    "3.2.0" },
    { "GEOPOS",
    "key member [member ...]",
    "Returns longitude and latitude of members of a geospatial index",
    13,
    "3.2.0" },
    { "GEORADIUS",
    "key longitude latitude radius m|km|ft|mi [WITHCOORD] [WITHDIST] [WITHHASH] [COUNT count] [ASC|DESC] [STORE key] [STOREDIST key]",
    "Query a sorted set representing a geospatial index to fetch members matching a given maximum distance from a point",
    13,
    "3.2.0" },
    { "GEORADIUSBYMEMBER",
    "key member radius m|km|ft|mi [WITHCOORD] [WITHDIST] [WITHHASH] [COUNT count] [ASC|DESC] [STORE key] [STOREDIST key]",
    "Query a sorted set representing a geospatial index to fetch members matching a given maximum distance from a member",
    13,
    "3.2.0" },
    { "GET",
    "key",
    "Get the value of a key",
    1,
    "1.0.0" },
    { "GETBIT",
    "key offset",
    "Returns the bit value at offset in the string value stored at key",
    1,
    "2.2.0" },
    { "GETRANGE",
    "key start end",
    "Get a substring of the string stored at a key",
    1,
    "2.4.0" },
    { "GETSET",
    "key value",
    "Set the string value of a key and return its old value",
    1,
    "1.0.0" },
    { "HDEL",
    "key field [field ...]",
    "Delete one or more hash fields",
    5,
    "2.0.0" },
    { "HEXISTS",
    "key field",
    "Determine if a hash field exists",
    5,
    "2.0.0" },
    { "HGET",
    "key field",
    "Get the value of a hash field",
    5,
    "2.0.0" },
    { "HGETALL",
    "key",
    "Get all the fields and values in a hash",
    5,
    "2.0.0" },
    { "HINCRBY",
    "key field increment",
    "Increment the integer value of a hash field by the given number",
    5,
    "2.0.0" },
    { "HINCRBYFLOAT",
    "key field increment",
    "Increment the float value of a hash field by the given amount",
    5,
    "2.6.0" },
    { "HKEYS",
    "key",
    "Get all the fields in a hash",
    5,
    "2.0.0" },
    { "HLEN",
    "key",
    "Get the number of fields in a hash",
    5,
    "2.0.0" },
    { "HMGET",
    "key field [field ...]",
    "Get the values of all the given hash fields",
    5,
    "2.0.0" },
    { "HMSET",
    "key field value [field value ...]",
    "Set multiple hash fields to multiple values",
    5,
    "2.0.0" },
    { "HSCAN",
    "key cursor [MATCH pattern] [COUNT count]",
    "Incrementally iterate hash fields and associated values",
    5,
    "2.8.0" },
    { "HSET",
    "key field value",
    "Set the string value of a hash field",
    5,
    "2.0.0" },
    { "HSETNX",
    "key field value",
    "Set the value of a hash field, only if the field does not exist",
    5,
    "2.0.0" },
    { "HSTRLEN",
    "key field",
    "Get the length of the value of a hash field",
    5,
    "3.2.0" },
    { "HVALS",
    "key",
    "Get all the values in a hash",
    5,
    "2.0.0" },
    { "INCR",
    "key",
    "Increment the integer value of a key by one",
    1,
    "1.0.0" },
    { "INCRBY",
    "key increment",
    "Increment the integer value of a key by the given amount",
    1,
    "1.0.0" },
    { "INCRBYFLOAT",
    "key increment",
    "Increment the float value of a key by the given amount",
    1,
    "2.6.0" },
    { "INFO",
    "[section]",
    "Get information and statistics about the server",
    9,
    "1.0.0" },
    { "KEYS",
    "pattern",
    "Find all keys matching the given pattern",
    0,
    "1.0.0" },
    { "LASTSAVE",
    "-",
    "Get the UNIX time stamp of the last successful save to disk",
    9,
    "1.0.0" },
    { "LINDEX",
    "key index",
    "Get an element from a list by its index",
    2,
    "1.0.0" },
    { "LINSERT",
    "key BEFORE|AFTER pivot value",
    "Insert an element before or after another element in a list",
    2,
    "2.2.0" },
    { "LLEN",
    "key",
    "Get the length of a list",
    2,
    "1.0.0" },
    { "LPOP",
    "key",
    "Remove and get the first element in a list",
    2,
    "1.0.0" },
    { "LPUSH",
    "key value [value ...]",
    "Prepend one or multiple values to a list",
    2,
    "1.0.0" },
    { "LPUSHX",
    "key value",
    "Prepend a value to a list, only if the list exists",
    2,
    "2.2.0" },
    { "LRANGE",
    "key start stop",
    "Get a range of elements from a list",
    2,
    "1.0.0" },
    { "LREM",
    "key count value",
    "Remove elements from a list",
    2,
    "1.0.0" },
    { "LSET",
    "key index value",
    "Set the value of an element in a list by its index",
    2,
    "1.0.0" },
    { "LTRIM",
    "key start stop",
    "Trim a list to the specified range",
    2,
    "1.0.0" },
    { "MEMORY DOCTOR",
    "-",
    "Outputs memory problems report",
    9,
    "4.0.0" },
    { "MEMORY HELP",
    "-",
    "Show helpful text about the different subcommands",
    9,
    "4.0.0" },
    { "MEMORY MALLOC-STATS",
    "-",
    "Show allocator internal stats",
    9,
    "4.0.0" },
    { "MEMORY PURGE",
    "-",
    "Ask the allocator to release memory",
    9,
    "4.0.0" },
    { "MEMORY STATS",
    "-",
    "Show memory usage details",
    9,
    "4.0.0" },
    { "MEMORY USAGE",
    "key [SAMPLES count]",
    "Estimate the memory usage of a key",
    9,
    "4.0.0" },
    { "MGET",
    "key [key ...]",
    "Get the values of all the given keys",
    1,
    "1.0.0" },
    { "MIGRATE",
    "host port key|"" destination-db timeout [COPY] [REPLACE] [KEYS key]",
    "Atomically transfer a key from a Redis instance to another one.",
    0,
    "2.6.0" },
    { "MONITOR",
    "-",
    "Listen for all requests received by the server in real time",
    9,
    "1.0.0" },
    { "MOVE",
    "key db",
    "Move a key to another database",
    0,
    "1.0.0" },
    { "MSET",
    "key value [key value ...]",
    "Set multiple keys to multiple values",
    1,
    "1.0.1" },
    { "MSETNX",
    "key value [key value ...]",
    "Set multiple keys to multiple values, only if none of the keys exist",
    1,
    "1.0.1" },
    { "MULTI",
    "-",
    "Mark the start of a transaction block",
    7,
    "1.2.0" },
    { "OBJECT",
    "subcommand [arguments [arguments ...]]",
    "Inspect the internals of Redis objects",
    0,
    "2.2.3" },
    { "PERSIST",
    "key",
    "Remove the expiration from a key",
    0,
    "2.2.0" },
    { "PEXPIRE",
    "key milliseconds",
    "Set a key's time to live in milliseconds",
    0,
    "2.6.0" },
    { "PEXPIREAT",
    "key milliseconds-timestamp",
    "Set the expiration for a key as a UNIX timestamp specified in milliseconds",
    0,
    "2.6.0" },
    { "PFADD",
    "key element [element ...]",
    "Adds the specified elements to the specified HyperLogLog.",
    11,
    "2.8.9" },
    { "PFCOUNT",
    "key [key ...]",
    "Return the approximated cardinality of the set(s) observed by the HyperLogLog at key(s).",
    11,
    "2.8.9" },
    { "PFMERGE",
    "destkey sourcekey [sourcekey ...]",
    "Merge N different HyperLogLogs into a single one.",
    11,
    "2.8.9" },
    { "PING",
    "[message]",
    "Ping the server",
    8,
    "1.0.0" },
    { "PSETEX",
    "key milliseconds value",
    "Set the value and expiration in milliseconds of a key",
    1,
    "2.6.0" },
    { "PSUBSCRIBE",
    "pattern [pattern ...]",
    "Listen for messages published to channels matching the given patterns",
    6,
    "2.0.0" },
    { "PTTL",
    "key",
    "Get the time to live for a key in milliseconds",
    0,
    "2.6.0" },
    { "PUBLISH",
    "channel message",
    "Post a message to a channel",
    6,
    "2.0.0" },
    { "PUBSUB",
    "subcommand [argument [argument ...]]",
    "Inspect the state of the Pub/Sub subsystem",
    6,
    "2.8.0" },
    { "PUNSUBSCRIBE",
    "[pattern [pattern ...]]",
    "Stop listening for messages posted to channels matching the given patterns",
    6,
    "2.0.0" },
    { "QUIT",
    "-",
    "Close the connection",
    8,
    "1.0.0" },
    { "RANDOMKEY",
    "-",
    "Return a random key from the keyspace",
    0,
    "1.0.0" },
    { "READONLY",
    "-",
    "Enables read queries for a connection to a cluster replica node",
    12,
    "3.0.0" },
    { "READWRITE",
    "-",
    "Disables read queries for a connection to a cluster replica node",
    12,
    "3.0.0" },
    { "RENAME",
    "key newkey",
    "Rename a key",
    0,
    "1.0.0" },
    { "RENAMENX",
    "key newkey",
    "Rename a key, only if the new key does not exist",
    0,
    "1.0.0" },
    { "REPLICAOF",
    "host port",
    "Make the server a replica of another instance, or promote it as master.",
    9,
    "5.0.0" },
    { "RESTORE",
    "key ttl serialized-value [REPLACE]",
    "Create a key using the provided serialized value, previously obtained using DUMP.",
    0,
    "2.6.0" },
    { "ROLE",
    "-",
    "Return the role of the instance in the context of replication",
    9,
    "2.8.12" },
    { "RPOP",
    "key",
    "Remove and get the last element in a list",
    2,
    "1.0.0" },
    { "RPOPLPUSH",
    "source destination",
    "Remove the last element in a list, prepend it to another list and return it",
    2,
    "1.2.0" },
    { "RPUSH",
    "key value [value ...]",
    "Append one or multiple values to a list",
    2,
    "1.0.0" },
    { "RPUSHX",
    "key value",
    "Append a value to a list, only if the list exists",
    2,
    "2.2.0" },
    { "SADD",
    "key member [member ...]",
    "Add one or more members to a set",
    3,
    "1.0.0" },
    { "SAVE",
    "-",
    "Synchronously save the dataset to disk",
    9,
    "1.0.0" },
    { "SCAN",
    "cursor [MATCH pattern] [COUNT count]",
    "Incrementally iterate the keys space",
    0,
    "2.8.0" },
    { "SCARD",
    "key",
    "Get the number of members in a set",
    3,
    "1.0.0" },
    { "SCRIPT DEBUG",
    "YES|SYNC|NO",
    "Set the debug mode for executed scripts.",
    10,
    "3.2.0" },
    { "SCRIPT EXISTS",
    "sha1 [sha1 ...]",
    "Check existence of scripts in the script cache.",
    10,
    "2.6.0" },
    { "SCRIPT FLUSH",
    "-",
    "Remove all the scripts from the script cache.",
    10,
    "2.6.0" },
    { "SCRIPT KILL",
    "-",
    "Kill the script currently in execution.",
    10,
    "2.6.0" },
    { "SCRIPT LOAD",
    "script",
    "Load the specified Lua script into the script cache.",
    10,
    "2.6.0" },
    { "SDIFF",
    "key [key ...]",
    "Subtract multiple sets",
    3,
    "1.0.0" },
    { "SDIFFSTORE",
    "destination key [key ...]",
    "Subtract multiple sets and store the resulting set in a key",
    3,
    "1.0.0" },
    { "SELECT",
    "index",
    "Change the selected database for the current connection",
    8,
    "1.0.0" },
    { "SET",
    "key value [expiration EX seconds|PX milliseconds] [NX|XX]",
    "Set the string value of a key",
    1,
    "1.0.0" },
    { "SETBIT",
    "key offset value",
    "Sets or clears the bit at offset in the string value stored at key",
    1,
    "2.2.0" },
    { "SETEX",
    "key seconds value",
    "Set the value and expiration of a key",
    1,
    "2.0.0" },
    { "SETNX",
    "key value",
    "Set the value of a key, only if the key does not exist",
    1,
    "1.0.0" },
    { "SETRANGE",
    "key offset value",
    "Overwrite part of a string at key starting at the specified offset",
    1,
    "2.2.0" },
    { "SHUTDOWN",
    "[NOSAVE|SAVE]",
    "Synchronously save the dataset to disk and then shut down the server",
    9,
    "1.0.0" },
    { "SINTER",
    "key [key ...]",
    "Intersect multiple sets",
    3,
    "1.0.0" },
    { "SINTERSTORE",
    "destination key [key ...]",
    "Intersect multiple sets and store the resulting set in a key",
    3,
    "1.0.0" },
    { "SISMEMBER",
    "key member",
    "Determine if a given value is a member of a set",
    3,
    "1.0.0" },
    { "SLAVEOF",
    "host port",
    "Make the server a replica of another instance, or promote it as master. Deprecated starting with Redis 5. Use REPLICAOF instead.",
    9,
    "1.0.0" },
    { "SLOWLOG",
    "subcommand [argument]",
    "Manages the Redis slow queries log",
    9,
    "2.2.12" },
    { "SMEMBERS",
    "key",
    "Get all the members in a set",
    3,
    "1.0.0" },
    { "SMOVE",
    "source destination member",
    "Move a member from one set to another",
    3,
    "1.0.0" },
    { "SORT",
    "key [BY pattern] [LIMIT offset count] [GET pattern [GET pattern ...]] [ASC|DESC] [ALPHA] [STORE destination]",
    "Sort the elements in a list, set or sorted set",
    0,
    "1.0.0" },
    { "SPOP",
    "key [count]",
    "Remove and return one or multiple random members from a set",
    3,
    "1.0.0" },
    { "SRANDMEMBER",
    "key [count]",
    "Get one or multiple random members from a set",
    3,
    "1.0.0" },
    { "SREM",
    "key member [member ...]",
    "Remove one or more members from a set",
    3,
    "1.0.0" },
    { "SSCAN",
    "key cursor [MATCH pattern] [COUNT count]",
    "Incrementally iterate Set elements",
    3,
    "2.8.0" },
    { "STRLEN",
    "key",
    "Get the length of the value stored in a key",
    1,
    "2.2.0" },
    { "SUBSCRIBE",
    "channel [channel ...]",
    "Listen for messages published to the given channels",
    6,
    "2.0.0" },
    { "SUNION",
    "key [key ...]",
    "Add multiple sets",
    3,
    "1.0.0" },
    { "SUNIONSTORE",
    "destination key [key ...]",
    "Add multiple sets and store the resulting set in a key",
    3,
    "1.0.0" },
    { "SWAPDB",
    "index index",
    "Swaps two Redis databases",
    8,
    "4.0.0" },
    { "SYNC",
    "-",
    "Internal command used for replication",
    9,
    "1.0.0" },
    { "TIME",
    "-",
    "Return the current server time",
    9,
    "2.6.0" },
    { "TOUCH",
    "key [key ...]",
    "Alters the last access time of a key(s). Returns the number of existing keys specified.",
    0,
    "3.2.1" },
    { "TTL",
    "key",
    "Get the time to live for a key",
    0,
    "1.0.0" },
    { "TYPE",
    "key",
    "Determine the type stored at key",
    0,
    "1.0.0" },
    { "UNLINK",
    "key [key ...]",
    "Delete a key asynchronously in another thread. Otherwise it is just as DEL, but non blocking.",
    0,
    "4.0.0" },
    { "UNSUBSCRIBE",
    "[channel [channel ...]]",
    "Stop listening for messages posted to the given channels",
    6,
    "2.0.0" },
    { "UNWATCH",
    "-",
    "Forget about all watched keys",
    7,
    "2.2.0" },
    { "WAIT",
    "numreplicas timeout",
    "Wait for the synchronous replication of all the write commands sent in the context of the current connection",
    0,
    "3.0.0" },
    { "WATCH",
    "key [key ...]",
    "Watch the given keys to determine execution of the MULTI/EXEC block",
    7,
    "2.2.0" },
    { "XACK",
    "key group ID [ID ...]",
    "Marks a pending message as correctly processed, effectively removing it from the pending entries list of the consumer group. Return value of the command is the number of messages successfully acknowledged, that is, the IDs we were actually able to resolve in the PEL.",
    14,
    "5.0.0" },
    { "XADD",
    "key ID field string [field string ...]",
    "Appends a new entry to a stream",
    14,
    "5.0.0" },
    { "XCLAIM",
    "key group consumer min-idle-time ID [ID ...] [IDLE ms] [TIME ms-unix-time] [RETRYCOUNT count] [force] [justid]",
    "Changes (or acquires) ownership of a message in a consumer group, as if the message was delivered to the specified consumer.",
    14,
    "5.0.0" },
    { "XDEL",
    "key ID [ID ...]",
    "Removes the specified entries from the stream. Returns the number of items actually deleted, that may be different from the number of IDs passed in case certain IDs do not exist.",
    14,
    "5.0.0" },
    { "XGROUP",
    "[CREATE key groupname id-or-$] [SETID key id-or-$] [DESTROY key groupname] [DELCONSUMER key groupname consumername]",
    "Create, destroy, and manage consumer groups.",
    14,
    "5.0.0" },
    { "XINFO",
    "[CONSUMERS key groupname] [GROUPS key] [STREAM key] [HELP]",
    "Get information on streams and consumer groups",
    14,
    "5.0.0" },
    { "XLEN",
    "key",
    "Return the number of entires in a stream",
    14,
    "5.0.0" },
    { "XPENDING",
    "key group [start end count] [consumer]",
    "Return information and entries from a stream consumer group pending entries list, that are messages fetched but never acknowledged.",
    14,
    "5.0.0" },
    { "XRANGE",
    "key start end [COUNT count]",
    "Return a range of elements in a stream, with IDs matching the specified IDs interval",
    14,
    "5.0.0" },
    { "XREAD",
    "[COUNT count] [BLOCK milliseconds] STREAMS key [key ...] ID [ID ...]",
    "Return never seen elements in multiple streams, with IDs greater than the ones reported by the caller for each stream. Can block.",
    14,
    "5.0.0" },
    { "XREADGROUP",
    "GROUP group consumer [COUNT count] [BLOCK milliseconds] STREAMS key [key ...] ID [ID ...]",
    "Return new entries from a stream using a consumer group, or access the history of the pending entries for a given consumer. Can block.",
    14,
    "5.0.0" },
    { "XREVRANGE",
    "key end start [COUNT count]",
    "Return a range of elements in a stream, with IDs matching the specified IDs interval, in reverse order (from greater to smaller IDs) compared to XRANGE",
    14,
    "5.0.0" },
    { "XTRIM",
    "key MAXLEN [~] count",
    "Trims the stream to (approximately if '~' is passed) a certain size",
    14,
    "5.0.0" },
    { "ZADD",
    "key [NX|XX] [CH] [INCR] score member [score member ...]",
    "Add one or more members to a sorted set, or update its score if it already exists",
    4,
    "1.2.0" },
    { "ZCARD",
    "key",
    "Get the number of members in a sorted set",
    4,
    "1.2.0" },
    { "ZCOUNT",
    "key min max",
    "Count the members in a sorted set with scores within the given values",
    4,
    "2.0.0" },
    { "ZINCRBY",
    "key increment member",
    "Increment the score of a member in a sorted set",
    4,
    "1.2.0" },
    { "ZINTERSTORE",
    "destination numkeys key [key ...] [WEIGHTS weight] [AGGREGATE SUM|MIN|MAX]",
    "Intersect multiple sorted sets and store the resulting sorted set in a new key",
    4,
    "2.0.0" },
    { "ZLEXCOUNT",
    "key min max",
    "Count the number of members in a sorted set between a given lexicographical range",
    4,
    "2.8.9" },
    { "ZPOPMAX",
    "key [count]",
    "Remove and return members with the highest scores in a sorted set",
    4,
    "5.0.0" },
    { "ZPOPMIN",
    "key [count]",
    "Remove and return members with the lowest scores in a sorted set",
    4,
    "5.0.0" },
    { "ZRANGE",
    "key start stop [WITHSCORES]",
    "Return a range of members in a sorted set, by index",
    4,
    "1.2.0" },
    { "ZRANGEBYLEX",
    "key min max [LIMIT offset count]",
    "Return a range of members in a sorted set, by lexicographical range",
    4,
    "2.8.9" },
    { "ZRANGEBYSCORE",
    "key min max [WITHSCORES] [LIMIT offset count]",
    "Return a range of members in a sorted set, by score",
    4,
    "1.0.5" },
    { "ZRANK",
    "key member",
    "Determine the index of a member in a sorted set",
    4,
    "2.0.0" },
    { "ZREM",
    "key member [member ...]",
    "Remove one or more members from a sorted set",
    4,
    "1.2.0" },
    { "ZREMRANGEBYLEX",
    "key min max",
    "Remove all members in a sorted set between the given lexicographical range",
    4,
    "2.8.9" },
    { "ZREMRANGEBYRANK",
    "key start stop",
    "Remove all members in a sorted set within the given indexes",
    4,
    "2.0.0" },
    { "ZREMRANGEBYSCORE",
    "key min max",
    "Remove all members in a sorted set within the given scores",
    4,
    "1.2.0" },
    { "ZREVRANGE",
    "key start stop [WITHSCORES]",
    "Return a range of members in a sorted set, by index, with scores ordered from high to low",
    4,
    "1.2.0" },
    { "ZREVRANGEBYLEX",
    "key max min [LIMIT offset count]",
    "Return a range of members in a sorted set, by lexicographical range, ordered from higher to lower strings.",
    4,
    "2.8.9" },
    { "ZREVRANGEBYSCORE",
    "key max min [WITHSCORES] [LIMIT offset count]",
    "Return a range of members in a sorted set, by score, with scores ordered from high to low",
    4,
    "2.2.0" },
    { "ZREVRANK",
    "key member",
    "Determine the index of a member in a sorted set, with scores ordered from high to low",
    4,
    "2.0.0" },
    { "ZSCAN",
    "key cursor [MATCH pattern] [COUNT count]",
    "Incrementally iterate sorted sets elements and associated scores",
    4,
    "2.8.0" },
    { "ZSCORE",
    "key member",
    "Get the score associated with the given member in a sorted set",
    4,
    "1.2.0" },
    { "ZUNIONSTORE",
    "destination numkeys key [key ...] [WEIGHTS weight] [AGGREGATE SUM|MIN|MAX]",
    "Add multiple sorted sets and store the resulting sorted set in a new key",
    4,
    "2.0.0" }
};

# 56 "redis-cli.c"
# 1 "anet.h"




























 


#define ANET_H



#define ANET_OK 0
#define ANET_ERR -1
#define ANET_ERR_LEN 256

 
#define ANET_NONE 0
#define ANET_IP_ONLY (1<<0)









int anetTcpConnect(char *err, char *addr, int port);
int anetTcpNonBlockConnect(char *err, char *addr, int port);
int anetTcpNonBlockBindConnect(char *err, char *addr, int port, char *source_addr);
int anetTcpNonBlockBestEffortBindConnect(char *err, char *addr, int port, char *source_addr);
int anetUnixConnect(char *err, char *path);
int anetUnixNonBlockConnect(char *err, char *path);
int anetRead(int fd, char *buf, int count);
int anetResolve(char *err, char *host, char *ipbuf, size_t ipbuf_len);
int anetResolveIP(char *err, char *host, char *ipbuf, size_t ipbuf_len);
int anetTcpServer(char *err, int port, char *bindaddr, int backlog);
int anetTcp6Server(char *err, int port, char *bindaddr, int backlog);
int anetUnixServer(char *err, char *path, mode_t perm, int backlog);
int anetTcpAccept(char *err, int serversock, char *ip, size_t ip_len, int *port);
int anetUnixAccept(char *err, int serversock);
int anetWrite(int fd, char *buf, int count);
int anetNonBlock(char *err, int fd);
int anetBlock(char *err, int fd);
int anetEnableTcpNoDelay(char *err, int fd);
int anetDisableTcpNoDelay(char *err, int fd);
int anetTcpKeepAlive(char *err, int fd);
int anetSendTimeout(char *err, int fd, long long ms);
int anetPeerToString(int fd, char *ip, size_t ip_len, int *port);
int anetKeepAlive(char *err, int fd, int interval);
int anetSockName(int fd, char *ip, size_t ip_len, int *port);
int anetFormatAddr(char *fmt, size_t fmt_len, char *ip, int port);
int anetFormatPeer(int fd, char *fmt, size_t fmt_len);
int anetFormatSock(int fd, char *fmt, size_t fmt_len);

# 57 "redis-cli.c"
# 1 "ae.h"






























 


#define __AE_H__



#define AE_OK 0
#define AE_ERR -1

#define AE_NONE 0        
#define AE_READABLE 1    
#define AE_WRITABLE 2    
#define AE_BARRIER 4    





#define AE_FILE_EVENTS 1
#define AE_TIME_EVENTS 2
#define AE_ALL_EVENTS (AE_FILE_EVENTS|AE_TIME_EVENTS)
#define AE_DONT_WAIT 4
#define AE_CALL_AFTER_SLEEP 8

#define AE_NOMORE -1
#define AE_DELETED_EVENT_ID -1

 
#define AE_NOTUSED(V) ((void) V)

struct aeEventLoop;

 
typedef void aeFileProc(struct aeEventLoop *eventLoop, int fd, void *clientData, int mask);
typedef int aeTimeProc(struct aeEventLoop *eventLoop, long long id, void *clientData);
typedef void aeEventFinalizerProc(struct aeEventLoop *eventLoop, void *clientData);
typedef void aeBeforeSleepProc(struct aeEventLoop *eventLoop);

 
typedef struct aeFileEvent {
    int mask;  
    aeFileProc *rfileProc;
    aeFileProc *wfileProc;
    void *clientData;
} aeFileEvent;

 
typedef struct aeTimeEvent {
    long long id;  
    long when_sec;  
    long when_ms;  
    aeTimeProc *timeProc;
    aeEventFinalizerProc *finalizerProc;
    void *clientData;
    struct aeTimeEvent *prev;
    struct aeTimeEvent *next;
} aeTimeEvent;

 
typedef struct aeFiredEvent {
    int fd;
    int mask;
} aeFiredEvent;

 
typedef struct aeEventLoop {
    int maxfd;    
    int setsize;  
    long long timeEventNextId;
    time_t lastTime;      
    aeFileEvent *events;  
    aeFiredEvent *fired;  
    aeTimeEvent *timeEventHead;
    int stop;
    void *apidata;  
    aeBeforeSleepProc *beforesleep;
    aeBeforeSleepProc *aftersleep;
} aeEventLoop;

 
aeEventLoop *aeCreateEventLoop(int setsize);
void aeDeleteEventLoop(aeEventLoop *eventLoop);
void aeStop(aeEventLoop *eventLoop);
int aeCreateFileEvent(aeEventLoop *eventLoop, int fd, int mask,
        aeFileProc *proc, void *clientData);
void aeDeleteFileEvent(aeEventLoop *eventLoop, int fd, int mask);
int aeGetFileEvents(aeEventLoop *eventLoop, int fd);
long long aeCreateTimeEvent(aeEventLoop *eventLoop, long long milliseconds,
        aeTimeProc *proc, void *clientData,
        aeEventFinalizerProc *finalizerProc);
int aeDeleteTimeEvent(aeEventLoop *eventLoop, long long id);
int aeProcessEvents(aeEventLoop *eventLoop, int flags);
int aeWait(int fd, int mask, long long milliseconds);
void aeMain(aeEventLoop *eventLoop);
char *aeGetApiName(void);
void aeSetBeforeSleepProc(aeEventLoop *eventLoop, aeBeforeSleepProc *beforesleep);
void aeSetAfterSleepProc(aeEventLoop *eventLoop, aeBeforeSleepProc *aftersleep);
int aeGetSetSize(aeEventLoop *eventLoop);
int aeResizeSetSize(aeEventLoop *eventLoop, int setsize);

# 58 "redis-cli.c"

#define UNUSED(V) ((void) V)

#define OUTPUT_STANDARD 0
#define OUTPUT_RAW 1
#define OUTPUT_CSV 2
#define REDIS_CLI_KEEPALIVE_INTERVAL 15  
#define REDIS_CLI_DEFAULT_PIPE_TIMEOUT 30  
#define REDIS_CLI_HISTFILE_ENV "REDISCLI_HISTFILE"
#define REDIS_CLI_HISTFILE_DEFAULT ".rediscli_history"
#define REDIS_CLI_RCFILE_ENV "REDISCLI_RCFILE"
#define REDIS_CLI_RCFILE_DEFAULT ".redisclirc"
#define REDIS_CLI_AUTH_ENV "REDISCLI_AUTH"

#define CLUSTER_MANAGER_SLOTS               16384
#define CLUSTER_MANAGER_MIGRATE_TIMEOUT     60000
#define CLUSTER_MANAGER_MIGRATE_PIPELINE    10
#define CLUSTER_MANAGER_REBALANCE_THRESHOLD 2

#define CLUSTER_MANAGER_INVALID_HOST_ARG     "[ERR] Invalid arguments: you need to pass either a valid "     "address (ie. 120.0.0.1:7000) or space separated IP "     "and port (ie. 120.0.0.1 7000)\n"



#define CLUSTER_MANAGER_MODE() (config.cluster_manager_command.name != NULL)
#define CLUSTER_MANAGER_MASTERS_COUNT(nodes, replicas) (nodes/(replicas + 1))
#define CLUSTER_MANAGER_COMMAND(n,...)         (redisCommand(n->context, __VA_ARGS__))


#define CLUSTER_MANAGER_NODE_ARRAY_FREE(array) zfree(array->alloc)

#define CLUSTER_MANAGER_PRINT_REPLY_ERROR(n, err)     clusterManagerLogErr("Node %s:%d replied with error:\n%s\n",                          n->ip, n->port, err);



#define clusterManagerLogInfo(...)     clusterManagerLog(CLUSTER_MANAGER_LOG_LVL_INFO,__VA_ARGS__)


#define clusterManagerLogErr(...)     clusterManagerLog(CLUSTER_MANAGER_LOG_LVL_ERR,__VA_ARGS__)


#define clusterManagerLogWarn(...)     clusterManagerLog(CLUSTER_MANAGER_LOG_LVL_WARN,__VA_ARGS__)


#define clusterManagerLogOk(...)     clusterManagerLog(CLUSTER_MANAGER_LOG_LVL_SUCCESS,__VA_ARGS__)


#define CLUSTER_MANAGER_FLAG_MYSELF     1 << 0
#define CLUSTER_MANAGER_FLAG_SLAVE      1 << 1
#define CLUSTER_MANAGER_FLAG_FRIEND     1 << 2
#define CLUSTER_MANAGER_FLAG_NOADDR     1 << 3
#define CLUSTER_MANAGER_FLAG_DISCONNECT 1 << 4
#define CLUSTER_MANAGER_FLAG_FAIL       1 << 5

#define CLUSTER_MANAGER_CMD_FLAG_FIX            1 << 0
#define CLUSTER_MANAGER_CMD_FLAG_SLAVE          1 << 1
#define CLUSTER_MANAGER_CMD_FLAG_YES            1 << 2
#define CLUSTER_MANAGER_CMD_FLAG_AUTOWEIGHTS    1 << 3
#define CLUSTER_MANAGER_CMD_FLAG_EMPTYMASTER    1 << 4
#define CLUSTER_MANAGER_CMD_FLAG_SIMULATE       1 << 5
#define CLUSTER_MANAGER_CMD_FLAG_REPLACE        1 << 6
#define CLUSTER_MANAGER_CMD_FLAG_COPY           1 << 7
#define CLUSTER_MANAGER_CMD_FLAG_COLOR          1 << 8
#define CLUSTER_MANAGER_CMD_FLAG_CHECK_OWNERS   1 << 9

#define CLUSTER_MANAGER_OPT_GETFRIENDS  1 << 0
#define CLUSTER_MANAGER_OPT_COLD        1 << 1
#define CLUSTER_MANAGER_OPT_UPDATE      1 << 2
#define CLUSTER_MANAGER_OPT_QUIET       1 << 6
#define CLUSTER_MANAGER_OPT_VERBOSE     1 << 7

#define CLUSTER_MANAGER_LOG_LVL_INFO    1
#define CLUSTER_MANAGER_LOG_LVL_WARN    2
#define CLUSTER_MANAGER_LOG_LVL_ERR     3
#define CLUSTER_MANAGER_LOG_LVL_SUCCESS 4

#define CLUSTER_JOIN_CHECK_AFTER        20

#define LOG_COLOR_BOLD      "29;1m"
#define LOG_COLOR_RED       "31;1m"
#define LOG_COLOR_GREEN     "32;1m"
#define LOG_COLOR_YELLOW    "33;1m"
#define LOG_COLOR_RESET     "0m"

 
#define CC_FORCE (1<<0)          
#define CC_QUIET (1<<1)          

 
int spectrum_palette_color_size = 19;
int spectrum_palette_color[] = {0,233,234,235,237,239,241,243,245,247,144,143,142,184,226,214,208,202,196};

int spectrum_palette_mono_size = 13;
int spectrum_palette_mono[] = {0,233,234,235,237,239,241,243,245,247,249,251,253};

 
int *spectrum_palette;
int spectrum_palette_size;

 

static uint64_t dictSdsHash(const void *key);
static int dictSdsKeyCompare(void *privdata, const void *key1,
    const void *key2);
static void dictSdsDestructor(void *privdata, void *val);
static void dictListDestructor(void *privdata, void *val);

 
typedef struct clusterManagerCommand {
    char *name;
    int argc;
    char **argv;
    int flags;
    int replicas;
    char *from;
    char *to;
    char **weight;
    int weight_argc;
    char *master_id;
    int slots;
    int timeout;
    int pipeline;
    float threshold;
    char *backup_dir;
} clusterManagerCommand;

static void createClusterManagerCommand(char *cmdname, int argc, char **argv);


static redisContext *context;
static struct config {
    char *hostip;
    int hostport;
    char *hostsocket;
    long repeat;
    long interval;
    int dbnum;
    int interactive;
    int shutdown;
    int monitor_mode;
    int pubsub_mode;
    int latency_mode;
    int latency_dist_mode;
    int latency_history;
    int lru_test_mode;
    long long lru_test_sample_size;
    int cluster_mode;
    int cluster_reissue_command;
    int slave_mode;
    int pipe_mode;
    int pipe_timeout;
    int getrdb_mode;
    int stat_mode;
    int scan_mode;
    int intrinsic_latency_mode;
    int intrinsic_latency_duration;
    char *pattern;
    char *rdb_filename;
    int bigkeys;
    int memkeys;
    unsigned memkeys_samples;
    int hotkeys;
    int stdinarg;  
    char *auth;
    int output;  
    sds mb_delim;
    char prompt[128];
    char *eval;
    int eval_ldb;
    int eval_ldb_sync;   
    int eval_ldb_end;    
    int enable_ldb_on_eval;  
    int last_cmd_type;
    int verbose;
    clusterManagerCommand cluster_manager_command;
    int no_auth_warning;
} config;

 
static struct pref {
    int hints;
} pref;

static volatile sig_atomic_t force_cancel_loop = 0;
static void usage(void);
static void slaveMode(void);
char *redisGitSHA1(void);
char *redisGitDirty(void);
static int cliConnect(int force);

static char *getInfoField(char *info, char *field);
static long getLongInfoField(char *info, char *field);



 

uint16_t crc16(const char *buf, int len);

static long long ustime(void) {
    struct timeval tv;
    long long ust;

    gettimeofday(&tv, ((void *)0));
    ust = ((long long)tv.tv_sec)*1000000;
    ust += tv.tv_usec;
    return ust;
}

static long long mstime(void) {
    return ustime()/1000;
}

static void cliRefreshPrompt(void) {
    if (config.eval_ldb) return;

    sds prompt = sdsempty();
    if (config.hostsocket != ((void *)0)) {
        prompt = sdscatfmt(prompt,"redis %s",config.hostsocket);
    } else {
        char addr[256];
        anetFormatAddr(addr, sizeof(addr), config.hostip, config.hostport);
        prompt = sdscatlen(prompt,addr,strlen(addr));
    }

     
    if (config.dbnum != 0)
        prompt = sdscatfmt(prompt,"[%i]",config.dbnum);

     
    prompt = sdscatlen(prompt,"> ",2);
    snprintf(config.prompt,sizeof(config.prompt),"%s",prompt);
    sdsfree(prompt);
}








 
static sds getDotfilePath(char *envoverride, char *dotfilename) {
    char *path = ((void *)0);
    sds dotPath = ((void *)0);

     
    path = getenv(envoverride);
    if (path != ((void *)0) && *path != '\0') {
        if (!strcmp("/dev/null", path)) {
            return ((void *)0);
        }

         
        dotPath = sdsnew(path);
    } else {
        char *home = getenv("HOME");
        if (home != ((void *)0) && *home != '\0') {
             
            dotPath = sdscatprintf(sdsempty(), "%s/%s", home, dotfilename);
        }
    }
    return dotPath;
}

 
#define isHexChar(c) (isdigit(c) || (c >= 'a' && c <= 'f'))
#define decodeHexChar(c) (isdigit(c) ? c - '0' : c - 'a' + 10)
#define decodeHex(h, l) ((decodeHexChar(h) << 4) + decodeHexChar(l))

static sds percentDecode(const char *pe, size_t len) {
    const char *end = pe + len;
    sds ret = sdsempty();
    const char *curr = pe;

    while (curr < end) {
        if (*curr == '%') {
            if ((end - curr) < 2) {
                fprintf(stderr, "Incomplete URI encoding\n");
                exit(1);
            }

            char h = tolower(*(++curr));
            char l = tolower(*(++curr));
            if (!(isdigit(h) || (h >= 'a' && h <= 'f')) || !(isdigit(l) || (l >= 'a' && l <= 'f'))) {
                fprintf(stderr, "Illegal character in URI encoding\n");
                exit(1);
            }
            char c = (((isdigit(h) ? h - '0' : h - 'a' + 10) << 4) + (isdigit(l) ? l - '0' : l - 'a' + 10));
            ret = sdscatlen(ret, &c, 1);
            curr++;
        } else {
            ret = sdscatlen(ret, curr++, 1);
        }
    }

    return ret;
}








 
static void parseRedisUri(const char *uri) {

    const char *scheme = "redis://";
    const char *curr = uri;
    const char *end = uri + strlen(uri);
    const char *userinfo, *username, *port, *host, *path;

     
    if (strncasecmp(scheme, curr, strlen(scheme))) {
        fprintf(stderr,"Invalid URI scheme\n");
        exit(1);
    }
    curr += strlen(scheme);
    if (curr == end) return;

     
    if ((userinfo = strchr(curr,'@'))) {
        if ((username = strchr(curr, ':')) && username < userinfo) {
             
            curr = username + 1;
        }

        config.auth = percentDecode(curr, userinfo - curr);
        curr = userinfo + 1;
    }
    if (curr == end) return;

     
    path = strchr(curr, '/');
    if (*curr != '/') {
        host = path ? path - 1 : end;
        if ((port = strchr(curr, ':'))) {
            config.hostport = atoi(port + 1);
            host = port - 1;
        }
        config.hostip = sdsnewlen(curr, host - curr + 1);
    }
    curr = path ? path + 1 : end;
    if (curr == end) return;

     
    config.dbnum = atoi(curr);
}

static uint64_t dictSdsHash(const void *key) {
    return dictGenHashFunction((unsigned char*)key, sdslen((char*)key));
}

static int dictSdsKeyCompare(void *privdata, const void *key1,
        const void *key2)
{
    int l1,l2;
    ((void) privdata);

    l1 = sdslen((sds)key1);
    l2 = sdslen((sds)key2);
    if (l1 != l2) return 0;
    return memcmp(key1, key2, l1) == 0;
}

static void dictSdsDestructor(void *privdata, void *val)
{
    ((void) privdata);
    sdsfree(val);
}

void dictListDestructor(void *privdata, void *val)
{
    ((void) privdata);
    listRelease((list*)val);
}

 
void _serverAssert(const char *estr, const char *file, int line) {
    fprintf(stderr, "=== ASSERTION FAILED ===");
    fprintf(stderr, "==> %s:%d '%s' is not true",file,line,estr);
    *((char*)-1) = 'x';
}



 

#define CLI_HELP_COMMAND 1
#define CLI_HELP_GROUP 2

typedef struct {
    int type;
    int argc;
    sds *argv;
    sds full;

     
    struct commandHelp *org;
} helpEntry;

static helpEntry *helpEntries;
static int helpEntriesLen;

static sds cliVersion(void) {
    sds version;
    version = sdscatprintf(sdsempty(), "%s", "999.999.999");

     
    if (strtoll(redisGitSHA1(),((void *)0),16)) {
        version = sdscatprintf(version, " (git:%s", redisGitSHA1());
        if (strtoll(redisGitDirty(),((void *)0),10))
            version = sdscatprintf(version, "-dirty");
        version = sdscat(version, ")");
    }
    return version;
}

static void cliInitHelp(void) {
    int commandslen = sizeof(commandHelp)/sizeof(struct commandHelp);
    int groupslen = sizeof(commandGroups)/sizeof(char*);
    int i, len, pos = 0;
    helpEntry tmp;

    helpEntriesLen = len = commandslen+groupslen;
    helpEntries = zmalloc(sizeof(helpEntry)*len);

    for (i = 0; i < groupslen; i++) {
        tmp.argc = 1;
        tmp.argv = zmalloc(sizeof(sds));
        tmp.argv[0] = sdscatprintf(sdsempty(),"@%s",commandGroups[i]);
        tmp.full = tmp.argv[0];
        tmp.type = 2;
        tmp.org = ((void *)0);
        helpEntries[pos++] = tmp;
    }

    for (i = 0; i < commandslen; i++) {
        tmp.argv = sdssplitargs(commandHelp[i].name,&tmp.argc);
        tmp.full = sdsnew(commandHelp[i].name);
        tmp.type = 1;
        tmp.org = &commandHelp[i];
        helpEntries[pos++] = tmp;
    }
}





 
static void cliIntegrateHelp(void) {
    if (cliConnect((1<<1)) == -1) return;

    redisReply *reply = redisCommand(context, "COMMAND");
    if(reply == ((void *)0) || reply->type != 2) return;

    
 
    for (size_t j = 0; j < reply->elements; j++) {
        redisReply *entry = reply->element[j];
        if (entry->type != 2 || entry->elements < 4 ||
            entry->element[0]->type != 1 ||
            entry->element[1]->type != 3 ||
            entry->element[3]->type != 3) return;
        char *cmdname = entry->element[0]->str;
        int i;

        for (i = 0; i < helpEntriesLen; i++) {
            helpEntry *he = helpEntries+i;
            if (!strcasecmp(he->argv[0],cmdname))
                break;
        }
        if (i != helpEntriesLen) continue;

        helpEntriesLen++;
        helpEntries = zrealloc(helpEntries,sizeof(helpEntry)*helpEntriesLen);
        helpEntry *new = helpEntries+(helpEntriesLen-1);

        new->argc = 1;
        new->argv = zmalloc(sizeof(sds));
        new->argv[0] = sdsnew(cmdname);
        new->full = new->argv[0];
        new->type = 1;
        sdstoupper(new->argv[0]);

        struct commandHelp *ch = zmalloc(sizeof(*ch));
        ch->name = new->argv[0];
        ch->params = sdsempty();
        int args = llabs(entry->element[1]->integer);
        args--;  
        if (entry->element[3]->integer == 1) {
            ch->params = sdscat(ch->params,"key ");
            args--;
        }
        while(args-- > 0) ch->params = sdscat(ch->params,"arg ");
        if (entry->element[1]->integer < 0)
            ch->params = sdscat(ch->params,"...options...");
        ch->summary = "Help not available";
        ch->group = 0;
        ch->since = "not known";
        new->org = ch;
    }
    freeReplyObject(reply);
}

 
static void cliOutputCommandHelp(struct commandHelp *help, int group) {
    printf("\r\n  \x1b[1m%s\x1b[0m \x1b[90m%s\x1b[0m\r\n", help->name, help->params);
    printf("  \x1b[33msummary:\x1b[0m %s\r\n", help->summary);
    printf("  \x1b[33msince:\x1b[0m %s\r\n", help->since);
    if (group) {
        printf("  \x1b[33mgroup:\x1b[0m %s\r\n", commandGroups[help->group]);
    }
}

 
static void cliOutputGenericHelp(void) {
    sds version = cliVersion();
    printf(
        "redis-cli %s\n"
        "To get help about Redis commands type:\n"
        "      \"help @<group>\" to get a list of commands in <group>\n"
        "      \"help <command>\" for help on <command>\n"
        "      \"help <tab>\" to get a list of possible help topics\n"
        "      \"quit\" to exit\n"
        "\n"
        "To set redis-cli preferences:\n"
        "      \":set hints\" enable online hints\n"
        "      \":set nohints\" disable online hints\n"
        "Set your preferences in ~/.redisclirc\n",
        version
    );
    sdsfree(version);
}

 
static void cliOutputHelp(int argc, char **argv) {
    int i, j, len;
    int group = -1;
    helpEntry *entry;
    struct commandHelp *help;

    if (argc == 0) {
        cliOutputGenericHelp();
        return;
    } else if (argc > 0 && argv[0][0] == '@') {
        len = sizeof(commandGroups)/sizeof(char*);
        for (i = 0; i < len; i++) {
            if (strcasecmp(argv[0]+1,commandGroups[i]) == 0) {
                group = i;
                break;
            }
        }
    }

    ((argc > 0) ? (void) (0) : __assert_fail ("argc > 0", "redis-cli.c", 616, __extension__ __PRETTY_FUNCTION__));
    for (i = 0; i < helpEntriesLen; i++) {
        entry = &helpEntries[i];
        if (entry->type != 1) continue;

        help = entry->org;
        if (group == -1) {
             
            if (argc == entry->argc) {
                for (j = 0; j < argc; j++) {
                    if (strcasecmp(argv[j],entry->argv[j]) != 0) break;
                }
                if (j == argc) {
                    cliOutputCommandHelp(help,1);
                }
            }
        } else {
            if (group == help->group) {
                cliOutputCommandHelp(help,0);
            }
        }
    }
    printf("\r\n");
}

 
static void completionCallback(const char *buf, linenoiseCompletions *lc) {
    size_t startpos = 0;
    int mask;
    int i;
    size_t matchlen;
    sds tmp;

    if (strncasecmp(buf,"help ",5) == 0) {
        startpos = 5;
        while (isspace(buf[startpos])) startpos++;
        mask = 1 | 2;
    } else {
        mask = 1;
    }

    for (i = 0; i < helpEntriesLen; i++) {
        if (!(helpEntries[i].type & mask)) continue;

        matchlen = strlen(buf+startpos);
        if (strncasecmp(buf+startpos,helpEntries[i].full,matchlen) == 0) {
            tmp = sdsnewlen(buf,startpos);
            tmp = sdscat(tmp,helpEntries[i].full);
            linenoiseAddCompletion(lc,tmp);
            sdsfree(tmp);
        }
    }
}

 
static char *hintsCallback(const char *buf, int *color, int *bold) {
    if (!pref.hints) return ((void *)0);

    int i, argc, buflen = strlen(buf);
    sds *argv = sdssplitargs(buf,&argc);
    int endspace = buflen && isspace(buf[buflen-1]);

     
    if (argc == 0) {
        sdsfreesplitres(argv,argc);
        return ((void *)0);
    }

    for (i = 0; i < helpEntriesLen; i++) {
        if (!(helpEntries[i].type & 1)) continue;

        if (strcasecmp(argv[0],helpEntries[i].full) == 0)
        {
            *color = 90;
            *bold = 0;
            sds hint = sdsnew(helpEntries[i].org->params);

            
 
            int toremove = argc-1;
            while(toremove > 0 && sdslen(hint)) {
                if (hint[0] == '[') break;
                if (hint[0] == ' ') toremove--;
                sdsrange(hint,1,-1);
            }

             
            if (!endspace) {
                sds newhint = sdsnewlen(" ",1);
                newhint = sdscatsds(newhint,hint);
                sdsfree(hint);
                hint = newhint;
            }

            sdsfreesplitres(argv,argc);
            return hint;
        }
    }
    sdsfreesplitres(argv,argc);
    return ((void *)0);
}

static void freeHintsCallback(void *ptr) {
    sdsfree(ptr);
}



 

 
static int cliAuth(void) {
    redisReply *reply;
    if (config.auth == ((void *)0)) return 0;

    reply = redisCommand(context,"AUTH %s",config.auth);
    if (reply != ((void *)0)) {
        freeReplyObject(reply);
        return 0;
    }
    return -1;
}

 
static int cliSelect(void) {
    redisReply *reply;
    if (config.dbnum == 0) return 0;

    reply = redisCommand(context,"SELECT %d",config.dbnum);
    if (reply != ((void *)0)) {
        int result = 0;
        if (reply->type == 6) result = -1;
        freeReplyObject(reply);
        return result;
    }
    return -1;
}




 
static int cliConnect(int flags) {
    if (context == ((void *)0) || flags & (1<<0)) {
        if (context != ((void *)0)) {
            redisFree(context);
        }

        if (config.hostsocket == ((void *)0)) {
            context = redisConnect(config.hostip,config.hostport);
        } else {
            context = redisConnectUnix(config.hostsocket);
        }

        if (context->err) {
            if (!(flags & (1<<1))) {
                fprintf(stderr,"Could not connect to Redis at ");
                if (config.hostsocket == ((void *)0))
                    fprintf(stderr,"%s:%d: %s\n",
                        config.hostip,config.hostport,context->errstr);
                else
                    fprintf(stderr,"%s: %s\n",
                        config.hostsocket,context->errstr);
            }
            redisFree(context);
            context = ((void *)0);
            return -1;
        }

        


 
        anetKeepAlive(((void *)0), context->fd, 15);

         
        if (cliAuth() != 0)
            return -1;
        if (cliSelect() != 0)
            return -1;
    }
    return 0;
}

static void cliPrintContextError(void) {
    if (context == ((void *)0)) return;
    fprintf(stderr,"Error: %s\n",context->errstr);
}

static sds cliFormatReplyTTY(redisReply *r, char *prefix) {
    sds out = sdsempty();
    switch (r->type) {
    case 6:
        out = sdscatprintf(out,"(error) %s\n", r->str);
    break;
    case 5:
        out = sdscat(out,r->str);
        out = sdscat(out,"\n");
    break;
    case 3:
        out = sdscatprintf(out,"(integer) %lld\n",r->integer);
    break;
    case 7:
        out = sdscatprintf(out,"(double) %s\n",r->str);
    break;
    case 1:
        
 
        out = sdscatrepr(out,r->str,r->len);
        out = sdscat(out,"\n");
    break;
    case 4:
        out = sdscat(out,"(nil)\n");
    break;
    case 8:
        out = sdscat(out,r->integer ? "(true)\n" : "(false)\n");
    break;
    case 2:
    case 9:
    case 10:
        if (r->elements == 0) {
            if (r->type == 2)
                out = sdscat(out,"(empty array)\n");
            else if (r->type == 9)
                out = sdscat(out,"(empty hash)\n");
            else if (r->type == 10)
                out = sdscat(out,"(empty set)\n");
            else
                out = sdscat(out,"(empty aggregate type)\n");
        } else {
            unsigned int i, idxlen = 0;
            char _prefixlen[16];
            char _prefixfmt[16];
            sds _prefix;
            sds tmp;

             
            i = r->elements;
            if (r->type == 9) i /= 2;
            do {
                idxlen++;
                i /= 10;
            } while(i);

             
            memset(_prefixlen,' ',idxlen+2);
            _prefixlen[idxlen+2] = '\0';
            _prefix = sdscat(sdsnew(prefix),_prefixlen);

             
            char numsep;
            if (r->type == 10) numsep = '~';
            else if (r->type == 9) numsep = '#';
            else numsep = ')';
            snprintf(_prefixfmt,sizeof(_prefixfmt),"%%s%%%ud%c ",idxlen,numsep);

            for (i = 0; i < r->elements; i++) {
                unsigned int human_idx = (r->type == 9) ?
                                         i/2 : i;
                human_idx++;  

                
 
                out = sdscatprintf(out,_prefixfmt,i == 0 ? "" : prefix,human_idx);

                 
                tmp = cliFormatReplyTTY(r->element[i],_prefix);
                out = sdscatlen(out,tmp,sdslen(tmp));
                sdsfree(tmp);

                 
                if (r->type == 9) {
                    i++;
                    sdsrange(out,0,-2);
                    out = sdscat(out," => ");
                    tmp = cliFormatReplyTTY(r->element[i],_prefix);
                    out = sdscatlen(out,tmp,sdslen(tmp));
                    sdsfree(tmp);
                }
            }
            sdsfree(_prefix);
        }
    break;
    default:
        fprintf(stderr,"Unknown reply type: %d\n", r->type);
        exit(1);
    }
    return out;
}

int isColorTerm(void) {
    char *t = getenv("TERM");
    return t != ((void *)0) && strstr(t,"xterm") != ((void *)0);
}


 
sds sdscatcolor(sds o, char *s, size_t len, char *color) {
    if (!isColorTerm()) return sdscatlen(o,s,len);

    int bold = strstr(color,"bold") != ((void *)0);
    int ccode = 37;  
    if (strstr(color,"red")) ccode = 31;
    else if (strstr(color,"green")) ccode = 32;
    else if (strstr(color,"yellow")) ccode = 33;
    else if (strstr(color,"blue")) ccode = 34;
    else if (strstr(color,"magenta")) ccode = 35;
    else if (strstr(color,"cyan")) ccode = 36;
    else if (strstr(color,"white")) ccode = 37;

    o = sdscatfmt(o,"\033[%i;%i;49m",bold,ccode);
    o = sdscatlen(o,s,len);
    o = sdscat(o,"\033[0m");
    return o;
}


 
sds sdsCatColorizedLdbReply(sds o, char *s, size_t len) {
    char *color = "white";

    if (strstr(s,"<debug>")) color = "bold";
    if (strstr(s,"<redis>")) color = "green";
    if (strstr(s,"<reply>")) color = "cyan";
    if (strstr(s,"<error>")) color = "red";
    if (strstr(s,"<hint>")) color = "bold";
    if (strstr(s,"<value>") || strstr(s,"<retval>")) color = "magenta";
    if (len > 4 && isdigit(s[3])) {
        if (s[1] == '>') color = "yellow";  
        else if (s[2] == '#') color = "bold";  
    }
    return sdscatcolor(o,s,len,color);
}

static sds cliFormatReplyRaw(redisReply *r) {
    sds out = sdsempty(), tmp;
    size_t i;

    switch (r->type) {
    case 4:
         
        break;
    case 6:
        out = sdscatlen(out,r->str,r->len);
        out = sdscatlen(out,"\n",1);
        break;
    case 5:
    case 1:
        if (r->type == 5 && config.eval_ldb) {
            

 

             
            if (strstr(r->str,"<endsession>") == r->str) {
                config.enable_ldb_on_eval = 0;
                config.eval_ldb = 0;
                config.eval_ldb_end = 1;  
                config.output = 0;
                cliRefreshPrompt();
            } else {
                out = sdsCatColorizedLdbReply(out,r->str,r->len);
            }
        } else {
            out = sdscatlen(out,r->str,r->len);
        }
        break;
    case 3:
        out = sdscatprintf(out,"%lld",r->integer);
        break;
    case 2:
        for (i = 0; i < r->elements; i++) {
            if (i > 0) out = sdscat(out,config.mb_delim);
            tmp = cliFormatReplyRaw(r->element[i]);
            out = sdscatlen(out,tmp,sdslen(tmp));
            sdsfree(tmp);
        }
        break;
    default:
        fprintf(stderr,"Unknown reply type: %d\n", r->type);
        exit(1);
    }
    return out;
}

static sds cliFormatReplyCSV(redisReply *r) {
    unsigned int i;

    sds out = sdsempty();
    switch (r->type) {
    case 6:
        out = sdscat(out,"ERROR,");
        out = sdscatrepr(out,r->str,strlen(r->str));
    break;
    case 5:
        out = sdscatrepr(out,r->str,r->len);
    break;
    case 3:
        out = sdscatprintf(out,"%lld",r->integer);
    break;
    case 1:
        out = sdscatrepr(out,r->str,r->len);
    break;
    case 4:
        out = sdscat(out,"NIL");
    break;
    case 2:
        for (i = 0; i < r->elements; i++) {
            sds tmp = cliFormatReplyCSV(r->element[i]);
            out = sdscatlen(out,tmp,sdslen(tmp));
            if (i != r->elements-1) out = sdscat(out,",");
            sdsfree(tmp);
        }
    break;
    default:
        fprintf(stderr,"Unknown reply type: %d\n", r->type);
        exit(1);
    }
    return out;
}

static int cliReadReply(int output_raw_strings) {
    void *_reply;
    redisReply *reply;
    sds out = ((void *)0);
    int output = 1;

    if (redisGetReply(context,&_reply) != 0) {
        if (config.shutdown) {
            redisFree(context);
            context = ((void *)0);
            return 0;
        }
        if (config.interactive) {
             
            if (context->err == 1 &&
                (errno == 104 || errno == 32))
                return -1;
            if (context->err == 3)
                return -1;
        }
        cliPrintContextError();
        exit(1);
        return -1;  
    }

    reply = (redisReply*)_reply;

    config.last_cmd_type = reply->type;

    
 
    if (config.cluster_mode && reply->type == 6 &&
        (!strncmp(reply->str,"MOVED",5) || !strcmp(reply->str,"ASK")))
    {
        char *p = reply->str, *s;
        int slot;

        output = 0;
        



 
        s = strchr(p,' ');       
        p = strchr(s+1,' ');     
        *p = '\0';
        slot = atoi(s+1);
        s = strrchr(p+1,':');     
        *s = '\0';
        sdsfree(config.hostip);
        config.hostip = sdsnew(p+1);
        config.hostport = atoi(s+1);
        if (config.interactive)
            printf("-> Redirected to slot [%d] located at %s:%d\n",
                slot, config.hostip, config.hostport);
        config.cluster_reissue_command = 1;
        cliRefreshPrompt();
    }

    if (output) {
        if (output_raw_strings) {
            out = cliFormatReplyRaw(reply);
        } else {
            if (config.output == 1) {
                out = cliFormatReplyRaw(reply);
                out = sdscat(out,"\n");
            } else if (config.output == 0) {
                out = cliFormatReplyTTY(reply,"");
            } else if (config.output == 2) {
                out = cliFormatReplyCSV(reply);
                out = sdscat(out,"\n");
            }
        }
        fwrite(out,sdslen(out),1,stdout);
        sdsfree(out);
    }
    freeReplyObject(reply);
    return 0;
}

static int cliSendCommand(int argc, char **argv, long repeat) {
    char *command = argv[0];
    size_t *argvlen;
    int j, output_raw;

    if (!config.eval_ldb &&  
        (!strcasecmp(command,"help") || !strcasecmp(command,"?"))) {
        cliOutputHelp(--argc, ++argv);
        return 0;
    }

    if (context == ((void *)0)) return -1;

    output_raw = 0;
    if (!strcasecmp(command,"info") ||
        !strcasecmp(command,"lolwut") ||
        (argc >= 2 && !strcasecmp(command,"debug") &&
                       !strcasecmp(argv[1],"htstats")) ||
        (argc >= 2 && !strcasecmp(command,"debug") &&
                       !strcasecmp(argv[1],"htstats-key")) ||
        (argc >= 2 && !strcasecmp(command,"memory") &&
                      (!strcasecmp(argv[1],"malloc-stats") ||
                       !strcasecmp(argv[1],"doctor"))) ||
        (argc == 2 && !strcasecmp(command,"cluster") &&
                      (!strcasecmp(argv[1],"nodes") ||
                       !strcasecmp(argv[1],"info"))) ||
        (argc >= 2 && !strcasecmp(command,"client") &&
                       !strcasecmp(argv[1],"list")) ||
        (argc == 3 && !strcasecmp(command,"latency") &&
                       !strcasecmp(argv[1],"graph")) ||
        (argc == 2 && !strcasecmp(command,"latency") &&
                       !strcasecmp(argv[1],"doctor")))
    {
        output_raw = 1;
    }

    if (!strcasecmp(command,"shutdown")) config.shutdown = 1;
    if (!strcasecmp(command,"monitor")) config.monitor_mode = 1;
    if (!strcasecmp(command,"subscribe") ||
        !strcasecmp(command,"psubscribe")) config.pubsub_mode = 1;
    if (!strcasecmp(command,"sync") ||
        !strcasecmp(command,"psync")) config.slave_mode = 1;

    
 
    if (argc == 3 && !strcasecmp(argv[0],"script") &&
                     !strcasecmp(argv[1],"debug"))
    {
        if (!strcasecmp(argv[2],"yes") || !strcasecmp(argv[2],"sync")) {
            config.enable_ldb_on_eval = 1;
        } else {
            config.enable_ldb_on_eval = 0;
        }
    }

     
    if (!strcasecmp(command,"eval") && config.enable_ldb_on_eval) {
        config.eval_ldb = 1;
        config.output = 1;
    }

     
    argvlen = zmalloc(argc*sizeof(size_t));
    for (j = 0; j < argc; j++)
        argvlen[j] = sdslen(argv[j]);

    
 
    while(repeat < 0 || repeat-- > 0) {
        redisAppendCommandArgv(context,argc,(const char**)argv,argvlen);
        while (config.monitor_mode) {
            if (cliReadReply(output_raw) != 0) exit(1);
            fflush(stdout);
        }

        if (config.pubsub_mode) {
            if (config.output != 1)
                printf("Reading messages... (press Ctrl-C to quit)\n");
            while (1) {
                if (cliReadReply(output_raw) != 0) exit(1);
            }
        }

        if (config.slave_mode) {
            printf("Entering replica output mode...  (press Ctrl-C to quit)\n");
            slaveMode();
            config.slave_mode = 0;
            zfree(argvlen);
            return -1;   
        }

        if (cliReadReply(output_raw) != 0) {
            zfree(argvlen);
            return -1;
        } else {
             
            if (!strcasecmp(command,"select") && argc == 2 && config.last_cmd_type != 6) {
                config.dbnum = atoi(argv[1]);
                cliRefreshPrompt();
            } else if (!strcasecmp(command,"auth") && argc == 2) {
                cliSelect();
            }
        }
        if (config.cluster_reissue_command){
            
 
            break;
        }
        if (config.interval) usleep(config.interval);
        fflush(stdout);  
    }

    zfree(argvlen);
    return 0;
}

 
static redisReply *reconnectingRedisCommand(redisContext *c, const char *fmt, ...) {
    redisReply *reply = ((void *)0);
    int tries = 0;
    va_list ap;

    ((!c->err) ? (void) (0) : __assert_fail ("!c->err", "redis-cli.c", 1239, __extension__ __PRETTY_FUNCTION__));
    while(reply == ((void *)0)) {
        while (c->err & (1 | 3)) {
            printf("\r\x1b[0K");  
            printf("Reconnecting... %d\r", ++tries);
            fflush(stdout);

            redisFree(c);
            c = redisConnect(config.hostip,config.hostport);
            usleep(1000000);
        }

        (*(char* *)&(ap) = (char*)(&__builtin_va_alist));
        reply = redisvCommand(c,fmt,ap);
        ((void)0);

        if (c->err && !(c->err & (1 | 3))) {
            fprintf(stderr, "Error: %s\n", c->errstr);
            exit(1);
        } else if (tries > 0) {
            printf("\r\x1b[0K");  
        }
    }

    context = c;
    return reply;
}



 

static int parseOptions(int argc, char **argv) {
    int i;

    for (i = 1; i < argc; i++) {
        int lastarg = i==argc-1;

        if (!strcmp(argv[i],"-h") && !lastarg) {
            sdsfree(config.hostip);
            config.hostip = sdsnew(argv[++i]);
        } else if (!strcmp(argv[i],"-h") && lastarg) {
            usage();
        } else if (!strcmp(argv[i],"--help")) {
            usage();
        } else if (!strcmp(argv[i],"-x")) {
            config.stdinarg = 1;
        } else if (!strcmp(argv[i],"-p") && !lastarg) {
            config.hostport = atoi(argv[++i]);
        } else if (!strcmp(argv[i],"-s") && !lastarg) {
            config.hostsocket = argv[++i];
        } else if (!strcmp(argv[i],"-r") && !lastarg) {
            config.repeat = strtoll(argv[++i],((void *)0),10);
        } else if (!strcmp(argv[i],"-i") && !lastarg) {
            double seconds = atof(argv[++i]);
            config.interval = seconds*1000000;
        } else if (!strcmp(argv[i],"-n") && !lastarg) {
            config.dbnum = atoi(argv[++i]);
        } else if (!strcmp(argv[i], "--no-auth-warning")) {
            config.no_auth_warning = 1;
        } else if (!strcmp(argv[i],"-a") && !lastarg) {
            config.auth = argv[++i];
        } else if (!strcmp(argv[i],"-u") && !lastarg) {
            parseRedisUri(argv[++i]);
        } else if (!strcmp(argv[i],"--raw")) {
            config.output = 1;
        } else if (!strcmp(argv[i],"--no-raw")) {
            config.output = 0;
        } else if (!strcmp(argv[i],"--csv")) {
            config.output = 2;
        } else if (!strcmp(argv[i],"--latency")) {
            config.latency_mode = 1;
        } else if (!strcmp(argv[i],"--latency-dist")) {
            config.latency_dist_mode = 1;
        } else if (!strcmp(argv[i],"--mono")) {
            spectrum_palette = spectrum_palette_mono;
            spectrum_palette_size = spectrum_palette_mono_size;
        } else if (!strcmp(argv[i],"--latency-history")) {
            config.latency_mode = 1;
            config.latency_history = 1;
        } else if (!strcmp(argv[i],"--lru-test") && !lastarg) {
            config.lru_test_mode = 1;
            config.lru_test_sample_size = strtoll(argv[++i],((void *)0),10);
        } else if (!strcmp(argv[i],"--slave")) {
            config.slave_mode = 1;
        } else if (!strcmp(argv[i],"--replica")) {
            config.slave_mode = 1;
        } else if (!strcmp(argv[i],"--stat")) {
            config.stat_mode = 1;
        } else if (!strcmp(argv[i],"--scan")) {
            config.scan_mode = 1;
        } else if (!strcmp(argv[i],"--pattern") && !lastarg) {
            config.pattern = argv[++i];
        } else if (!strcmp(argv[i],"--intrinsic-latency") && !lastarg) {
            config.intrinsic_latency_mode = 1;
            config.intrinsic_latency_duration = atoi(argv[++i]);
        } else if (!strcmp(argv[i],"--rdb") && !lastarg) {
            config.getrdb_mode = 1;
            config.rdb_filename = argv[++i];
        } else if (!strcmp(argv[i],"--pipe")) {
            config.pipe_mode = 1;
        } else if (!strcmp(argv[i],"--pipe-timeout") && !lastarg) {
            config.pipe_timeout = atoi(argv[++i]);
        } else if (!strcmp(argv[i],"--bigkeys")) {
            config.bigkeys = 1;
        } else if (!strcmp(argv[i],"--memkeys")) {
            config.memkeys = 1;
            config.memkeys_samples = 0;  
        } else if (!strcmp(argv[i],"--memkeys-samples")) {
            config.memkeys = 1;
            config.memkeys_samples = atoi(argv[++i]);
        } else if (!strcmp(argv[i],"--hotkeys")) {
            config.hotkeys = 1;
        } else if (!strcmp(argv[i],"--eval") && !lastarg) {
            config.eval = argv[++i];
        } else if (!strcmp(argv[i],"--ldb")) {
            config.eval_ldb = 1;
            config.output = 1;
        } else if (!strcmp(argv[i],"--ldb-sync-mode")) {
            config.eval_ldb = 1;
            config.eval_ldb_sync = 1;
            config.output = 1;
        } else if (!strcmp(argv[i],"-c")) {
            config.cluster_mode = 1;
        } else if (!strcmp(argv[i],"-d") && !lastarg) {
            sdsfree(config.mb_delim);
            config.mb_delim = sdsnew(argv[++i]);
        } else if (!strcmp(argv[i],"--verbose")) {
            config.verbose = 1;
        } else if (!strcmp(argv[i],"--cluster") && !lastarg) {
            if ((config . cluster_manager_command . name != ((void *)0))) usage();
            char *cmd = argv[++i];
            int j = i;
            while (j < argc && argv[j][0] != '-') j++;
            if (j > i) j--;
            createClusterManagerCommand(cmd, j - i, argv + i + 1);
            i = j;
        } else if (!strcmp(argv[i],"--cluster") && lastarg) {
            usage();
        } else if (!strcmp(argv[i],"--cluster-replicas") && !lastarg) {
            config.cluster_manager_command.replicas = atoi(argv[++i]);
        } else if (!strcmp(argv[i],"--cluster-master-id") && !lastarg) {
            config.cluster_manager_command.master_id = argv[++i];
        } else if (!strcmp(argv[i],"--cluster-from") && !lastarg) {
            config.cluster_manager_command.from = argv[++i];
        } else if (!strcmp(argv[i],"--cluster-to") && !lastarg) {
            config.cluster_manager_command.to = argv[++i];
        } else if (!strcmp(argv[i],"--cluster-weight") && !lastarg) {
            if (config.cluster_manager_command.weight != ((void *)0)) {
                fprintf(stderr, "WARNING: you cannot use --cluster-weight "
                                "more than once.\n"
                                "You can set more weights by adding them "
                                "as a space-separated list, ie:\n"
                                "--cluster-weight n1=w n2=w\n");
                exit(1);
            }
            int widx = i + 1;
            char **weight = argv + widx;
            int wargc = 0;
            for (; widx < argc; widx++) {
                if (strstr(argv[widx], "--") == argv[widx]) break;
                if (strchr(argv[widx], '=') == ((void *)0)) break;
                wargc++;
            }
            if (wargc > 0) {
                config.cluster_manager_command.weight = weight;
                config.cluster_manager_command.weight_argc = wargc;
                i += wargc;
            }
        } else if (!strcmp(argv[i],"--cluster-slots") && !lastarg) {
            config.cluster_manager_command.slots = atoi(argv[++i]);
        } else if (!strcmp(argv[i],"--cluster-timeout") && !lastarg) {
            config.cluster_manager_command.timeout = atoi(argv[++i]);
        } else if (!strcmp(argv[i],"--cluster-pipeline") && !lastarg) {
            config.cluster_manager_command.pipeline = atoi(argv[++i]);
        } else if (!strcmp(argv[i],"--cluster-threshold") && !lastarg) {
            config.cluster_manager_command.threshold = atof(argv[++i]);
        } else if (!strcmp(argv[i],"--cluster-yes")) {
            config.cluster_manager_command.flags |=
                1 << 2;
        } else if (!strcmp(argv[i],"--cluster-simulate")) {
            config.cluster_manager_command.flags |=
                1 << 5;
        } else if (!strcmp(argv[i],"--cluster-replace")) {
            config.cluster_manager_command.flags |=
                1 << 6;
        } else if (!strcmp(argv[i],"--cluster-copy")) {
            config.cluster_manager_command.flags |=
                1 << 7;
        } else if (!strcmp(argv[i],"--cluster-slave")) {
            config.cluster_manager_command.flags |=
                1 << 1;
        } else if (!strcmp(argv[i],"--cluster-use-empty-masters")) {
            config.cluster_manager_command.flags |=
                1 << 4;
        } else if (!strcmp(argv[i],"--cluster-search-multiple-owners")) {
            config.cluster_manager_command.flags |=
                1 << 9;
        } else if (!strcmp(argv[i],"-v") || !strcmp(argv[i], "--version")) {
            sds version = cliVersion();
            printf("redis-cli %s\n", version);
            sdsfree(version);
            exit(0);
        } else if ((config . cluster_manager_command . name != ((void *)0)) && argv[i][0] != '-') {
            if (config.cluster_manager_command.argc == 0) {
                int j = i + 1;
                while (j < argc && argv[j][0] != '-') j++;
                int cmd_argc = j - i;
                config.cluster_manager_command.argc = cmd_argc;
                config.cluster_manager_command.argv = argv + i;
                if (cmd_argc > 1) i = j - 1;
            }
        } else {
            if (argv[i][0] == '-') {
                fprintf(stderr,
                    "Unrecognized option or bad number of args for: '%s'\n",
                    argv[i]);
                exit(1);
            } else {
                 
                break;
            }
        }
    }

     
    if (config.eval_ldb && config.eval == ((void *)0)) {
        fprintf(stderr,"Options --ldb and --ldb-sync-mode require --eval.\n");
        fprintf(stderr,"Try %s --help for more information.\n", argv[0]);
        exit(1);
    }

    if (!config.no_auth_warning && config.auth != ((void *)0)) {
        fputs("Warning: Using a password with '-a' or '-u' option on the command"
              " line interface may not be safe.\n", stderr);
    }

    return i;
}

static void parseEnv() {
     
    char *auth = getenv("REDISCLI_AUTH");
    if (auth != ((void *)0) && config.auth == ((void *)0)) {
        config.auth = auth;
    }
}

static sds readArgFromStdin(void) {
    char buf[1024];
    sds arg = sdsempty();

    while(1) {
        int nread = read(fileno(stdin),buf,1024);

        if (nread == 0) break;
        else if (nread == -1) {
            perror("Reading from standard input");
            exit(1);
        }
        arg = sdscatlen(arg,buf,nread);
    }
    return arg;
}

static void usage(void) {
    sds version = cliVersion();
    fprintf(stderr,
"redis-cli %s\n"
"\n"
"Usage: redis-cli [OPTIONS] [cmd [arg [arg ...]]]\n"
"  -h <hostname>      Server hostname (default: 127.0.0.1).\n"
"  -p <port>          Server port (default: 6379).\n"
"  -s <socket>        Server socket (overrides hostname and port).\n"
"  -a <password>      Password to use when connecting to the server.\n"
"                     You can also use the " "REDISCLI_AUTH" " environment\n"
"                     variable to pass this password more safely\n"
"                     (if both are used, this argument takes predecence).\n"
"  -u <uri>           Server URI.\n"
"  -r <repeat>        Execute specified command N times.\n"
"  -i <interval>      When -r is used, waits <interval> seconds per command.\n"
"                     It is possible to specify sub-second times like -i 0.1.\n"
"  -n <db>            Database number.\n"
"  -x                 Read last argument from STDIN.\n"
"  -d <delimiter>     Multi-bulk delimiter in for raw formatting (default: \\n).\n"
"  -c                 Enable cluster mode (follow -ASK and -MOVED redirections).\n"
"  --raw              Use raw formatting for replies (default when STDOUT is\n"
"                     not a tty).\n"
"  --no-raw           Force formatted output even when STDOUT is not a tty.\n"
"  --csv              Output in CSV format.\n"
"  --stat             Print rolling stats about server: mem, clients, ...\n"
"  --latency          Enter a special mode continuously sampling latency.\n"
"                     If you use this mode in an interactive session it runs\n"
"                     forever displaying real-time stats. Otherwise if --raw or\n"
"                     --csv is specified, or if you redirect the output to a non\n"
"                     TTY, it samples the latency for 1 second (you can use\n"
"                     -i to change the interval), then produces a single output\n"
"                     and exits.\n"
"  --latency-history  Like --latency but tracking latency changes over time.\n"
"                     Default time interval is 15 sec. Change it using -i.\n"
"  --latency-dist     Shows latency as a spectrum, requires xterm 256 colors.\n"
"                     Default time interval is 1 sec. Change it using -i.\n"
"  --lru-test <keys>  Simulate a cache workload with an 80-20 distribution.\n"
"  --replica          Simulate a replica showing commands received from the master.\n"
"  --rdb <filename>   Transfer an RDB dump from remote server to local file.\n"
"  --pipe             Transfer raw Redis protocol from stdin to server.\n"
"  --pipe-timeout <n> In --pipe mode, abort with error if after sending all data.\n"
"                     no reply is received within <n> seconds.\n"
"                     Default timeout: %d. Use 0 to wait forever.\n"
"  --bigkeys          Sample Redis keys looking for keys with many elements (complexity).\n"
"  --memkeys          Sample Redis keys looking for keys consuming a lot of memory.\n"
"  --memkeys-samples <n> Sample Redis keys looking for keys consuming a lot of memory.\n"
"                     And define number of key elements to sample\n"
"  --hotkeys          Sample Redis keys looking for hot keys.\n"
"                     only works when maxmemory-policy is *lfu.\n"
"  --scan             List all keys using the SCAN command.\n"
"  --pattern <pat>    Useful with --scan to specify a SCAN pattern.\n"
"  --intrinsic-latency <sec> Run a test to measure intrinsic system latency.\n"
"                     The test will run for the specified amount of seconds.\n"
"  --eval <file>      Send an EVAL command using the Lua script at <file>.\n"
"  --ldb              Used with --eval enable the Redis Lua debugger.\n"
"  --ldb-sync-mode    Like --ldb but uses the synchronous Lua debugger, in\n"
"                     this mode the server is blocked and script changes are\n"
"                     not rolled back from the server memory.\n"
"  --cluster <command> [args...] [opts...]\n"
"                     Cluster Manager command and arguments (see below).\n"
"  --verbose          Verbose mode.\n"
"  --no-auth-warning  Don't show warning message when using password on command\n"
"                     line interface.\n"
"  --help             Output this help and exit.\n"
"  --version          Output version and exit.\n"
"\n",
    version, 30);
     
    fprintf(stderr,
"Cluster Manager Commands:\n"
"  Use --cluster help to list all available cluster manager commands.\n"
"\n"
"Examples:\n"
"  cat /etc/passwd | redis-cli -x set mypasswd\n"
"  redis-cli get mypasswd\n"
"  redis-cli -r 100 lpush mylist x\n"
"  redis-cli -r 100 -i 1 info | grep used_memory_human:\n"
"  redis-cli --eval myscript.lua key1 key2 , arg1 arg2 arg3\n"
"  redis-cli --scan --pattern '*:12345*'\n"
"\n"
"  (Note: when using --eval the comma separates KEYS[] from ARGV[] items)\n"
"\n"
"When no command is given, redis-cli starts in interactive mode.\n"
"Type \"help\" in interactive mode for information on available commands\n"
"and settings.\n"
"\n");
    sdsfree(version);
    exit(1);
}

static int confirmWithYes(char *msg) {
    printf("%s (type 'yes' to accept): ", msg);
    fflush(stdout);
    char buf[4];
    int nread = read(fileno(stdin),buf,4);
    buf[3] = '\0';
    return (nread != 0 && !strcmp("yes", buf));
}

 
static char **convertToSds(int count, char** args) {
  int j;
  char **sds = zmalloc(sizeof(char*)*count);

  for(j = 0; j < count; j++)
    sds[j] = sdsnew(args[j]);

  return sds;
}

static int issueCommandRepeat(int argc, char **argv, long repeat) {
    while (1) {
        config.cluster_reissue_command = 0;
        if (cliSendCommand(argc,argv,repeat) != 0) {
            cliConnect((1<<0));

            
 
            if (cliSendCommand(argc,argv,repeat) != 0) {
                cliPrintContextError();
                return -1;
            }
        }
         
        if (config.cluster_mode && config.cluster_reissue_command) {
            cliConnect((1<<0));
        } else {
            break;
        }
    }
    return 0;
}

static int issueCommand(int argc, char **argv) {
    return issueCommandRepeat(argc, argv, config.repeat);
}






 
static sds *cliSplitArgs(char *line, int *argc) {
    if (config.eval_ldb && (strstr(line,"eval ") == line ||
                            strstr(line,"e ") == line))
    {
        sds *argv = sds_malloc(sizeof(sds)*2);
        *argc = 2;
        int len = strlen(line);
        int elen = line[1] == ' ' ? 2 : 5;  
        argv[0] = sdsnewlen(line,elen-1);
        argv[1] = sdsnewlen(line+elen,len-elen);
        return argv;
    } else {
        return sdssplitargs(line,argc);
    }
}



 
void cliSetPreferences(char **argv, int argc, int interactive) {
    if (!strcasecmp(argv[0],":set") && argc >= 2) {
        if (!strcasecmp(argv[1],"hints")) pref.hints = 1;
        else if (!strcasecmp(argv[1],"nohints")) pref.hints = 0;
        else {
            printf("%sunknown redis-cli preference '%s'\n",
                interactive ? "" : ".redisclirc: ",
                argv[1]);
        }
    } else {
        printf("%sunknown redis-cli internal command '%s'\n",
            interactive ? "" : ".redisclirc: ",
            argv[0]);
    }
}

 
void cliLoadPreferences(void) {
    sds rcfile = getDotfilePath("REDISCLI_RCFILE",".redisclirc");
    if (rcfile == ((void *)0)) return;
    FILE *fp = fopen(rcfile,"r");
    char buf[1024];

    if (fp) {
        while(fgets(buf,sizeof(buf),fp) != ((void *)0)) {
            sds *argv;
            int argc;

            argv = sdssplitargs(buf,&argc);
            if (argc > 0) cliSetPreferences(argv,argc,0);
            sdsfreesplitres(argv,argc);
        }
        fclose(fp);
    }
    sdsfree(rcfile);
}

static void repl(void) {
    sds historyfile = ((void *)0);
    int history = 0;
    char *line;
    int argc;
    sds *argv;

    
 
    cliInitHelp();
    cliIntegrateHelp();

    config.interactive = 1;
    linenoiseSetMultiLine(1);
    linenoiseSetCompletionCallback(completionCallback);
    linenoiseSetHintsCallback(hintsCallback);
    linenoiseSetFreeHintsCallback(freeHintsCallback);

     
    if (isatty(fileno(stdin))) {
        historyfile = getDotfilePath("REDISCLI_HISTFILE",".rediscli_history");
        
        history = 1;
        if (historyfile != ((void *)0)) {
            linenoiseHistoryLoad(historyfile);
        }
        cliLoadPreferences();
    }

    cliRefreshPrompt();
    while((line = linenoise(context ? config.prompt : "not connected> ")) != ((void *)0)) {
        if (line[0] != '\0') {
            long repeat = 1;
            int skipargs = 0;
            char *endptr = ((void *)0);

            argv = cliSplitArgs(line,&argc);

            
 
            if (argv && argc > 0) {
                errno = 0;
                repeat = strtol(argv[0], &endptr, 10);
                if (argc > 1 && *endptr == '\0') {
                    if (errno == 34 || errno == 22 || repeat <= 0) {
                        fputs("Invalid redis-cli repeat command option value.\n", stdout);
                        sdsfreesplitres(argv, argc);
                        linenoiseFree(line);
                        continue;
                    }
                    skipargs = 1;
                } else {
                    repeat = 1;
                }
            }

             
            if (!(argv && argc > 0 && !strcasecmp(argv[0+skipargs], "auth"))) {
                if (history) linenoiseHistoryAdd(line);
                if (historyfile) linenoiseHistorySave(historyfile);
            }

            if (argv == ((void *)0)) {
                printf("Invalid argument(s)\n");
                linenoiseFree(line);
                continue;
            } else if (argc > 0) {
                if (strcasecmp(argv[0],"quit") == 0 ||
                    strcasecmp(argv[0],"exit") == 0)
                {
                    exit(0);
                } else if (argv[0][0] == ':') {
                    cliSetPreferences(argv,argc,1);
                    sdsfreesplitres(argv,argc);
                    linenoiseFree(line);
                    continue;
                } else if (strcasecmp(argv[0],"restart") == 0) {
                    if (config.eval) {
                        config.eval_ldb = 1;
                        config.output = 1;
                        return;  
                    } else {
                        printf("Use 'restart' only in Lua debugging mode.");
                    }
                } else if (argc == 3 && !strcasecmp(argv[0],"connect")) {
                    sdsfree(config.hostip);
                    config.hostip = sdsnew(argv[1]);
                    config.hostport = atoi(argv[2]);
                    cliRefreshPrompt();
                    cliConnect((1<<0));
                } else if (argc == 1 && !strcasecmp(argv[0],"clear")) {
                    linenoiseClearScreen();
                } else {
                    long long start_time = mstime(), elapsed;

                    issueCommandRepeat(argc-skipargs, argv+skipargs, repeat);

                    
 
                    if (config.eval_ldb_end) {
                        config.eval_ldb_end = 0;
                        cliReadReply(0);
                        printf("\n(Lua debugging session ended%s)\n\n",
                            config.eval_ldb_sync ? "" :
                            " -- dataset changes rolled back");
                    }

                    elapsed = mstime()-start_time;
                    if (elapsed >= 500 &&
                        config.output == 0)
                    {
                        printf("(%.2fs)\n",(double)elapsed/1000);
                    }
                }
            }
             
            sdsfreesplitres(argv,argc);
        }
         
        linenoiseFree(line);
    }
    exit(0);
}

static int noninteractive(int argc, char **argv) {
    int retval = 0;
    if (config.stdinarg) {
        argv = zrealloc(argv, (argc+1)*sizeof(char*));
        argv[argc] = readArgFromStdin();
        retval = issueCommand(argc+1, argv);
    } else {
        retval = issueCommand(argc, argv);
    }
    return retval;
}



 

static int evalMode(int argc, char **argv) {
    sds script = ((void *)0);
    FILE *fp;
    char buf[1024];
    size_t nread;
    char **argv2;
    int j, got_comma, keys;
    int retval = 0;

    while(1) {
        if (config.eval_ldb) {
            printf(
            "Lua debugging session started, please use:\n"
            "quit    -- End the session.\n"
            "restart -- Restart the script in debug mode again.\n"
            "help    -- Show Lua script debugging commands.\n\n"
            );
        }

        sdsfree(script);
        script = sdsempty();
        got_comma = 0;
        keys = 0;

         
        fp = fopen(config.eval,"r");
        if (!fp) {
            fprintf(stderr,
                "Can't open file '%s': %s\n", config.eval, strerror(errno));
            exit(1);
        }
        while((nread = fread(buf,1,sizeof(buf),fp)) != 0) {
            script = sdscatlen(script,buf,nread);
        }
        fclose(fp);

         
        if (config.eval_ldb) {
            redisReply *reply = redisCommand(context,
                    config.eval_ldb_sync ?
                    "SCRIPT DEBUG sync": "SCRIPT DEBUG yes");
            if (reply) freeReplyObject(reply);
        }

         
        argv2 = zmalloc(sizeof(sds)*(argc+3));
        argv2[0] = sdsnew("EVAL");
        argv2[1] = script;
        for (j = 0; j < argc; j++) {
            if (!got_comma && argv[j][0] == ',' && argv[j][1] == 0) {
                got_comma = 1;
                continue;
            }
            argv2[j+3-got_comma] = sdsnew(argv[j]);
            if (!got_comma) keys++;
        }
        argv2[2] = sdscatprintf(sdsempty(),"%d",keys);

         
        int eval_ldb = config.eval_ldb;  
        retval = issueCommand(argc+3-got_comma, argv2);
        if (eval_ldb) {
            if (!config.eval_ldb) {
                

 
                printf("Eval debugging session can't start:\n");
                cliReadReply(0);
                break;  
            } else {
                strncpy(config.prompt,"lua debugger> ",sizeof(config.prompt));
                repl();
                 
                cliConnect((1<<0));
                printf("\n");
            }
        } else {
            break;  
        }
    }
    return retval;
}



 

 
static struct clusterManager {
    list *nodes;     
    list *errors;
} cluster_manager;

 
dict *clusterManagerUncoveredSlots = ((void *)0);

typedef struct clusterManagerNode {
    redisContext *context;
    sds name;
    char *ip;
    int port;
    uint64_t current_epoch;
    time_t ping_sent;
    time_t ping_recv;
    int flags;
    list *flags_str;  
    sds replicate;   
    int dirty;       
    uint8_t slots[16384];
    int slots_count;
    int replicas_count;
    list *friends;
    sds *migrating; 
 
    sds *importing; 
 
    int migrating_count;  
    int importing_count;  
    float weight;    
    int balance;     
} clusterManagerNode;

 
typedef struct clusterManagerNodeArray {
    clusterManagerNode **nodes;  
    clusterManagerNode **alloc;  
    int len;                     
    int count;                   
} clusterManagerNodeArray;

 
typedef struct clusterManagerReshardTableItem {
    clusterManagerNode *source;
    int slot;
} clusterManagerReshardTableItem;

 

typedef struct clusterManagerLink {
    sds node_name;
    sds node_addr;
    int connected;
    int handshaking;
} clusterManagerLink;

static dictType clusterManagerDictType = {
    dictSdsHash,                
    ((void *)0),                       
    ((void *)0),                       
    dictSdsKeyCompare,          
    ((void *)0),                       
    dictSdsDestructor           
};

static dictType clusterManagerLinkDictType = {
    dictSdsHash,                
    ((void *)0),                       
    ((void *)0),                       
    dictSdsKeyCompare,          
    dictSdsDestructor,          
    dictListDestructor          
};

typedef int clusterManagerCommandProc(int argc, char **argv);
typedef int (*clusterManagerOnReplyError)(redisReply *reply,
    clusterManagerNode *n, int bulk_idx);

 

static clusterManagerNode *clusterManagerNewNode(char *ip, int port);
static clusterManagerNode *clusterManagerNodeByName(const char *name);
static clusterManagerNode *clusterManagerNodeByAbbreviatedName(const char *n);
static void clusterManagerNodeResetSlots(clusterManagerNode *node);
static int clusterManagerNodeIsCluster(clusterManagerNode *node, char **err);
static void clusterManagerPrintNotClusterNodeError(clusterManagerNode *node,
                                                   char *err);
static int clusterManagerNodeLoadInfo(clusterManagerNode *node, int opts,
                                      char **err);
static int clusterManagerLoadInfoFromNode(clusterManagerNode *node, int opts);
static int clusterManagerNodeIsEmpty(clusterManagerNode *node, char **err);
static int clusterManagerGetAntiAffinityScore(clusterManagerNodeArray *ipnodes,
    int ip_count, clusterManagerNode ***offending, int *offending_len);
static void clusterManagerOptimizeAntiAffinity(clusterManagerNodeArray *ipnodes,
    int ip_count);
static sds clusterManagerNodeInfo(clusterManagerNode *node, int indent);
static void clusterManagerShowNodes(void);
static void clusterManagerShowClusterInfo(void);
static int clusterManagerFlushNodeConfig(clusterManagerNode *node, char **err);
static void clusterManagerWaitForClusterJoin(void);
static int clusterManagerCheckCluster(int quiet);
static void clusterManagerLog(int level, const char* fmt, ...);
static int clusterManagerIsConfigConsistent(void);
static dict *clusterManagerGetLinkStatus(void);
static void clusterManagerOnError(sds err);
static void clusterManagerNodeArrayInit(clusterManagerNodeArray *array,
                                        int len);
static void clusterManagerNodeArrayReset(clusterManagerNodeArray *array);
static void clusterManagerNodeArrayShift(clusterManagerNodeArray *array,
                                         clusterManagerNode **nodeptr);
static void clusterManagerNodeArrayAdd(clusterManagerNodeArray *array,
                                       clusterManagerNode *node);

 

static int clusterManagerCommandCreate(int argc, char **argv);
static int clusterManagerCommandAddNode(int argc, char **argv);
static int clusterManagerCommandDeleteNode(int argc, char **argv);
static int clusterManagerCommandInfo(int argc, char **argv);
static int clusterManagerCommandCheck(int argc, char **argv);
static int clusterManagerCommandFix(int argc, char **argv);
static int clusterManagerCommandReshard(int argc, char **argv);
static int clusterManagerCommandRebalance(int argc, char **argv);
static int clusterManagerCommandSetTimeout(int argc, char **argv);
static int clusterManagerCommandImport(int argc, char **argv);
static int clusterManagerCommandCall(int argc, char **argv);
static int clusterManagerCommandHelp(int argc, char **argv);
static int clusterManagerCommandBackup(int argc, char **argv);

typedef struct clusterManagerCommandDef {
    char *name;
    clusterManagerCommandProc *proc;
    int arity;
    char *args;
    char *options;
} clusterManagerCommandDef;

clusterManagerCommandDef clusterManagerCommands[] = {
    {"create", clusterManagerCommandCreate, -2, "host1:port1 ... hostN:portN",
     "replicas <arg>"},
    {"check", clusterManagerCommandCheck, -1, "host:port",
     "search-multiple-owners"},
    {"info", clusterManagerCommandInfo, -1, "host:port", ((void *)0)},
    {"fix", clusterManagerCommandFix, -1, "host:port",
     "search-multiple-owners"},
    {"reshard", clusterManagerCommandReshard, -1, "host:port",
     "from <arg>,to <arg>,slots <arg>,yes,timeout <arg>,pipeline <arg>,"
     "replace"},
    {"rebalance", clusterManagerCommandRebalance, -1, "host:port",
     "weight <node1=w1...nodeN=wN>,use-empty-masters,"
     "timeout <arg>,simulate,pipeline <arg>,threshold <arg>,replace"},
    {"add-node", clusterManagerCommandAddNode, 2,
     "new_host:new_port existing_host:existing_port", "slave,master-id <arg>"},
    {"del-node", clusterManagerCommandDeleteNode, 2, "host:port node_id",((void *)0)},
    {"call", clusterManagerCommandCall, -2,
        "host:port command arg arg .. arg", ((void *)0)},
    {"set-timeout", clusterManagerCommandSetTimeout, 2,
     "host:port milliseconds", ((void *)0)},
    {"import", clusterManagerCommandImport, 1, "host:port",
     "from <arg>,copy,replace"},
    {"backup", clusterManagerCommandBackup, 2,  "host:port backup_directory",
     ((void *)0)},
    {"help", clusterManagerCommandHelp, 0, ((void *)0), ((void *)0)}
};

static void getRDB(clusterManagerNode *node);

static void createClusterManagerCommand(char *cmdname, int argc, char **argv) {
    clusterManagerCommand *cmd = &config.cluster_manager_command;
    cmd->name = cmdname;
    cmd->argc = argc;
    cmd->argv = argc ? argv : ((void *)0);
    if (isColorTerm()) cmd->flags |= 1 << 8;
}


static clusterManagerCommandProc *validateClusterManagerCommand(void) {
    int i, commands_count = sizeof(clusterManagerCommands) /
                            sizeof(clusterManagerCommandDef);
    clusterManagerCommandProc *proc = ((void *)0);
    char *cmdname = config.cluster_manager_command.name;
    int argc = config.cluster_manager_command.argc;
    for (i = 0; i < commands_count; i++) {
        clusterManagerCommandDef cmddef = clusterManagerCommands[i];
        if (!strcmp(cmddef.name, cmdname)) {
            if ((cmddef.arity > 0 && argc != cmddef.arity) ||
                (cmddef.arity < 0 && argc < (cmddef.arity * -1))) {
                fprintf(stderr, "[ERR] Wrong number of arguments for "
                                "specified --cluster sub command\n");
                return ((void *)0);
            }
            proc = cmddef.proc;
        }
    }
    if (!proc) fprintf(stderr, "Unknown --cluster subcommand\n");
    return proc;
}

static int parseClusterNodeAddress(char *addr, char **ip_ptr, int *port_ptr,
                                   int *bus_port_ptr)
{
    char *c = strrchr(addr, '@');
    if (c != ((void *)0)) {
        *c = '\0';
        if (bus_port_ptr != ((void *)0))
            *bus_port_ptr = atoi(c + 1);
    }
    c = strrchr(addr, ':');
    if (c != ((void *)0)) {
        *c = '\0';
        *ip_ptr = addr;
        *port_ptr = atoi(++c);
    } else return 0;
    return 1;
}






 
static int getClusterHostFromCmdArgs(int argc, char **argv,
                                     char **ip_ptr, int *port_ptr) {
    int port = 0;
    char *ip = ((void *)0);
    if (argc == 1) {
        char *addr = argv[0];
        if (!parseClusterNodeAddress(addr, &ip, &port, ((void *)0))) return 0;
    } else {
        ip = argv[0];
        port = atoi(argv[1]);
    }
    if (!ip || !port) return 0;
    else {
        *ip_ptr = ip;
        *port_ptr = port;
    }
    return 1;
}

static void freeClusterManagerNodeFlags(list *flags) {
    listIter li;
    listNode *ln;
    listRewind(flags, &li);
    while ((ln = listNext(&li)) != ((void *)0)) {
        sds flag = ln->value;
        sdsfree(flag);
    }
    listRelease(flags);
}

static void freeClusterManagerNode(clusterManagerNode *node) {
    if (node->context != ((void *)0)) redisFree(node->context);
    if (node->friends != ((void *)0)) {
        listIter li;
        listNode *ln;
        listRewind(node->friends,&li);
        while ((ln = listNext(&li)) != ((void *)0)) {
            clusterManagerNode *fn = ln->value;
            freeClusterManagerNode(fn);
        }
        listRelease(node->friends);
        node->friends = ((void *)0);
    }
    if (node->name != ((void *)0)) sdsfree(node->name);
    if (node->replicate != ((void *)0)) sdsfree(node->replicate);
    if ((node->flags & 1 << 2) && node->ip)
        sdsfree(node->ip);
    int i;
    if (node->migrating != ((void *)0)) {
        for (i = 0; i < node->migrating_count; i++) sdsfree(node->migrating[i]);
        zfree(node->migrating);
    }
    if (node->importing != ((void *)0)) {
        for (i = 0; i < node->importing_count; i++) sdsfree(node->importing[i]);
        zfree(node->importing);
    }
    if (node->flags_str != ((void *)0)) {
        freeClusterManagerNodeFlags(node->flags_str);
        node->flags_str = ((void *)0);
    }
    zfree(node);
}

static void freeClusterManager(void) {
    listIter li;
    listNode *ln;
    if (cluster_manager.nodes != ((void *)0)) {
        listRewind(cluster_manager.nodes,&li);
        while ((ln = listNext(&li)) != ((void *)0)) {
            clusterManagerNode *n = ln->value;
            freeClusterManagerNode(n);
        }
        listRelease(cluster_manager.nodes);
        cluster_manager.nodes = ((void *)0);
    }
    if (cluster_manager.errors != ((void *)0)) {
        listRewind(cluster_manager.errors,&li);
        while ((ln = listNext(&li)) != ((void *)0)) {
            sds err = ln->value;
            sdsfree(err);
        }
        listRelease(cluster_manager.errors);
        cluster_manager.errors = ((void *)0);
    }
    if (clusterManagerUncoveredSlots != ((void *)0))
        dictRelease(clusterManagerUncoveredSlots);
}

static clusterManagerNode *clusterManagerNewNode(char *ip, int port) {
    clusterManagerNode *node = zmalloc(sizeof(*node));
    node->context = ((void *)0);
    node->name = ((void *)0);
    node->ip = ip;
    node->port = port;
    node->current_epoch = 0;
    node->ping_sent = 0;
    node->ping_recv = 0;
    node->flags = 0;
    node->flags_str = ((void *)0);
    node->replicate = ((void *)0);
    node->dirty = 0;
    node->friends = ((void *)0);
    node->migrating = ((void *)0);
    node->importing = ((void *)0);
    node->migrating_count = 0;
    node->importing_count = 0;
    node->replicas_count = 0;
    node->weight = 1.0f;
    node->balance = 0;
    clusterManagerNodeResetSlots(node);
    return node;
}

static sds clusterManagerGetNodeRDBFilename(clusterManagerNode *node) {
    ((config . cluster_manager_command . backup_dir) ? (void) (0) : __assert_fail ("config.cluster_manager_command.backup_dir", "redis-cli.c", 2269, __extension__ __PRETTY_FUNCTION__));
    sds filename = sdsnew(config.cluster_manager_command.backup_dir);
    if (filename[sdslen(filename) - 1] != '/')
        filename = sdscat(filename, "/");
    filename = sdscatprintf(filename, "redis-node-%s-%d-%s.rdb", node->ip,
                            node->port, node->name);
    return filename;
}




 
static int clusterManagerCheckRedisReply(clusterManagerNode *n,
                                         redisReply *r, char **err)
{
    int is_err = 0;
    if (!r || (is_err = (r->type == 6))) {
        if (is_err) {
            if (err != ((void *)0)) {
                *err = zmalloc((r->len + 1) * sizeof(char));
                strcpy(*err, r->str);
            } else clusterManagerLog(3,"Node %s:%d replied with error:\n%s\n", n->ip, n->port, r->str);;
        }
        return 0;
    }
    return 1;
}

 
static int clusterManagerStartTransaction(clusterManagerNode *node) {
    redisReply *reply = (redisCommand(node ->context, "MULTI"));
    int success = clusterManagerCheckRedisReply(node, reply, ((void *)0));
    if (reply) freeReplyObject(reply);
    return success;
}

 
static int clusterManagerExecTransaction(clusterManagerNode *node,
                                         clusterManagerOnReplyError onerror)
{
    redisReply *reply = (redisCommand(node ->context, "EXEC"));
    int success = clusterManagerCheckRedisReply(node, reply, ((void *)0));
    if (success) {
        if (reply->type != 2) {
            success = 0;
            goto cleanup;
        }
        size_t i;
        for (i = 0; i < reply->elements; i++) {
            redisReply *r = reply->element[i];
            char *err = ((void *)0);
            success = clusterManagerCheckRedisReply(node, r, &err);
            if (!success && onerror) success = onerror(r, node, i);
            if (err) {
                if (!success)
                    clusterManagerLog(3,"Node %s:%d replied with error:\n%s\n", node ->ip, node ->port, err);;
                zfree(err);
            }
            if (!success) break;
        }
    }
cleanup:
    if (reply) freeReplyObject(reply);
    return success;
}

static int clusterManagerNodeConnect(clusterManagerNode *node) {
    if (node->context) redisFree(node->context);
    node->context = redisConnect(node->ip, node->port);
    if (node->context->err) {
        fprintf(stderr,"Could not connect to Redis at ");
        fprintf(stderr,"%s:%d: %s\n", node->ip, node->port,
                node->context->errstr);
        redisFree(node->context);
        node->context = ((void *)0);
        return 0;
    }
    


 
    anetKeepAlive(((void *)0), node->context->fd, 15);
    if (config.auth) {
        redisReply *reply = redisCommand(node->context,"AUTH %s",config.auth);
        int ok = clusterManagerCheckRedisReply(node, reply, ((void *)0));
        if (reply != ((void *)0)) freeReplyObject(reply);
        if (!ok) return 0;
    }
    return 1;
}

static void clusterManagerRemoveNodeFromList(list *nodelist,
                                             clusterManagerNode *node) {
    listIter li;
    listNode *ln;
    listRewind(nodelist, &li);
    while ((ln = listNext(&li)) != ((void *)0)) {
        if (node == ln->value) {
            listDelNode(nodelist, ln);
            break;
        }
    }
}

 
static clusterManagerNode *clusterManagerNodeByName(const char *name) {
    if (cluster_manager.nodes == ((void *)0)) return ((void *)0);
    clusterManagerNode *found = ((void *)0);
    sds lcname = sdsempty();
    lcname = sdscpy(lcname, name);
    sdstolower(lcname);
    listIter li;
    listNode *ln;
    listRewind(cluster_manager.nodes, &li);
    while ((ln = listNext(&li)) != ((void *)0)) {
        clusterManagerNode *n = ln->value;
        if (n->name && !sdscmp(n->name, lcname)) {
            found = n;
            break;
        }
    }
    sdsfree(lcname);
    return found;
}




 
static clusterManagerNode *clusterManagerNodeByAbbreviatedName(const char*name)
{
    if (cluster_manager.nodes == ((void *)0)) return ((void *)0);
    clusterManagerNode *found = ((void *)0);
    sds lcname = sdsempty();
    lcname = sdscpy(lcname, name);
    sdstolower(lcname);
    listIter li;
    listNode *ln;
    listRewind(cluster_manager.nodes, &li);
    while ((ln = listNext(&li)) != ((void *)0)) {
        clusterManagerNode *n = ln->value;
        if (n->name &&
            strstr(n->name, lcname) == n->name) {
            found = n;
            break;
        }
    }
    sdsfree(lcname);
    return found;
}

static void clusterManagerNodeResetSlots(clusterManagerNode *node) {
    memset(node->slots, 0, sizeof(node->slots));
    node->slots_count = 0;
}

 
static redisReply *clusterManagerGetNodeRedisInfo(clusterManagerNode *node,
                                                  char **err)
{
    redisReply *info = (redisCommand(node ->context, "INFO"));
    if (err != ((void *)0)) *err = ((void *)0);
    if (info == ((void *)0)) return ((void *)0);
    if (info->type == 6) {
        if (err != ((void *)0)) {
            *err = zmalloc((info->len + 1) * sizeof(char));
            strcpy(*err, info->str);
        }
        freeReplyObject(info);
        return  ((void *)0);
    }
    return info;
}

static int clusterManagerNodeIsCluster(clusterManagerNode *node, char **err) {
    redisReply *info = clusterManagerGetNodeRedisInfo(node, err);
    if (info == ((void *)0)) return 0;
    int is_cluster = (int) getLongInfoField(info->str, "cluster_enabled");
    freeReplyObject(info);
    return is_cluster;
}


 
static int clusterManagerNodeIsEmpty(clusterManagerNode *node, char **err) {
    redisReply *info = clusterManagerGetNodeRedisInfo(node, err);
    int is_empty = 1;
    if (info == ((void *)0)) return 0;
    if (strstr(info->str, "db0:") != ((void *)0)) {
        is_empty = 0;
        goto result;
    }
    freeReplyObject(info);
    info = (redisCommand(node ->context, "CLUSTER INFO"));
    if (err != ((void *)0)) *err = ((void *)0);
    if (!clusterManagerCheckRedisReply(node, info, err)) {
        is_empty = 0;
        goto result;
    }
    long known_nodes = getLongInfoField(info->str, "cluster_known_nodes");
    is_empty = (known_nodes == 1);
result:
    freeReplyObject(info);
    return is_empty;
}





























 
static int clusterManagerGetAntiAffinityScore(clusterManagerNodeArray *ipnodes,
    int ip_count, clusterManagerNode ***offending, int *offending_len)
{
    int score = 0, i, j;
    int node_len = cluster_manager.nodes->len;
    clusterManagerNode **offending_p = ((void *)0);
    if (offending != ((void *)0)) {
        *offending = zcalloc(node_len * sizeof(clusterManagerNode*));
        offending_p = *offending;
    }
    

 
    for (i = 0; i < ip_count; i++) {
        clusterManagerNodeArray *node_array = &(ipnodes[i]);
        dict *related = dictCreate(&clusterManagerDictType, ((void *)0));
        char *ip = ((void *)0);
        for (j = 0; j < node_array->len; j++) {
            clusterManagerNode *node = node_array->nodes[j];
            if (node == ((void *)0)) continue;
            if (!ip) ip = node->ip;
            sds types;
             
            sds key = (!node->replicate ? node->name : node->replicate);
            ((key != ((void *)0)) ? (void) (0) : __assert_fail ("key != NULL", "redis-cli.c", 2529, __extension__ __PRETTY_FUNCTION__));
            dictEntry *entry = dictFind(related, key);
            if (entry) types = sdsdup((sds) ((entry)->v . val));
            else types = sdsempty();
            
 
            if (!node->replicate) types = sdscatprintf(types, "m%s", types);
            else types = sdscat(types, "s");
            dictReplace(related, key, types);
        }
        
 
        dictIterator *iter = dictGetIterator(related);
        dictEntry *entry;
        while ((entry = dictNext(iter)) != ((void *)0)) {
            sds types = (sds) ((entry)->v . val);
            sds name = (sds) ((entry)->key);
            int typeslen = sdslen(types);
            if (typeslen < 2) continue;
            if (types[0] == 'm') score += (10000 * (typeslen - 1));
            else score += (1 * typeslen);
            if (offending == ((void *)0)) continue;
             
            listIter li;
            listNode *ln;
            listRewind(cluster_manager.nodes, &li);
            while ((ln = listNext(&li)) != ((void *)0)) {
                clusterManagerNode *n = ln->value;
                if (n->replicate == ((void *)0)) continue;
                if (!strcmp(n->replicate, name) && !strcmp(n->ip, ip)) {
                    *(offending_p++) = n;
                    if (offending_len != ((void *)0)) (*offending_len)++;
                    break;
                }
            }
        }
        
        dictReleaseIterator(iter);
        dictRelease(related);
    }
    return score;
}

static void clusterManagerOptimizeAntiAffinity(clusterManagerNodeArray *ipnodes,
    int ip_count)
{
    clusterManagerNode **offenders = ((void *)0);
    int score = clusterManagerGetAntiAffinityScore(ipnodes, ip_count,
                                                   ((void *)0), ((void *)0));
    if (score == 0) goto cleanup;
    clusterManagerLog(1,">>> Trying to optimize slaves allocation " "for anti-affinity\n");

    int node_len = cluster_manager.nodes->len;
    int maxiter = 500 * node_len; 
    srand(time(((void *)0)));
    while (maxiter > 0) {
        int offending_len = 0;
        if (offenders != ((void *)0)) {
            zfree(offenders);
            offenders = ((void *)0);
        }
        score = clusterManagerGetAntiAffinityScore(ipnodes,
                                                   ip_count,
                                                   &offenders,
                                                   &offending_len);
        if (score == 0) break; 
        

 
        int rand_idx = rand() % offending_len;
        clusterManagerNode *first = offenders[rand_idx],
                           *second = ((void *)0);
        clusterManagerNode **other_replicas = zcalloc((node_len - 1) *
                                                      sizeof(*other_replicas));
        int other_replicas_count = 0;
        listIter li;
        listNode *ln;
        listRewind(cluster_manager.nodes, &li);
        while ((ln = listNext(&li)) != ((void *)0)) {
            clusterManagerNode *n = ln->value;
            if (n != first && n->replicate != ((void *)0))
                other_replicas[other_replicas_count++] = n;
        }
        if (other_replicas_count == 0) {
            zfree(other_replicas);
            break;
        }
        rand_idx = rand() % other_replicas_count;
        second = other_replicas[rand_idx];
        char *first_master = first->replicate,
             *second_master = second->replicate;
        first->replicate = second_master, first->dirty = 1;
        second->replicate = first_master, second->dirty = 1;
        int new_score = clusterManagerGetAntiAffinityScore(ipnodes,
                                                           ip_count,
                                                           ((void *)0), ((void *)0));
        

 
        if (new_score > score) {
            first->replicate = first_master;
            second->replicate = second_master;
        }
        zfree(other_replicas);
        maxiter--;
    }
    score = clusterManagerGetAntiAffinityScore(ipnodes, ip_count, ((void *)0), ((void *)0));
    char *msg;
    int perfect = (score == 0);
    int log_level = (perfect ? 4 :
                               2);
    if (perfect) msg = "[OK] Perfect anti-affinity obtained!";
    else if (score >= 10000)
        msg = ("[WARNING] Some slaves are in the same host as their master");
    else
        msg=("[WARNING] Some slaves of the same master are in the same host");
    clusterManagerLog(log_level, "%s\n", msg);
cleanup:
    zfree(offenders);
}

 
static sds clusterManagerNodeFlagString(clusterManagerNode *node) {
    sds flags = sdsempty();
    if (!node->flags_str) return flags;
    int empty = 1;
    listIter li;
    listNode *ln;
    listRewind(node->flags_str, &li);
    while ((ln = listNext(&li)) != ((void *)0)) {
        sds flag = ln->value;
        if (strcmp(flag, "myself") == 0) continue;
        if (!empty) flags = sdscat(flags, ",");
        flags = sdscatfmt(flags, "%S", flag);
        empty = 0;
    }
    return flags;
}

 
static sds clusterManagerNodeSlotsString(clusterManagerNode *node) {
    sds slots = sdsempty();
    int first_range_idx = -1, last_slot_idx = -1, i;
    for (i = 0; i < 16384; i++) {
        int has_slot = node->slots[i];
        if (has_slot) {
            if (first_range_idx == -1) {
                if (sdslen(slots)) slots = sdscat(slots, ",");
                first_range_idx = i;
                slots = sdscatfmt(slots, "[%u", i);
            }
            last_slot_idx = i;
        } else {
            if (last_slot_idx >= 0) {
                if (first_range_idx == last_slot_idx)
                    slots = sdscat(slots, "]");
                else slots = sdscatfmt(slots, "-%u]", last_slot_idx);
            }
            last_slot_idx = -1;
            first_range_idx = -1;
        }
    }
    if (last_slot_idx >= 0) {
        if (first_range_idx == last_slot_idx) slots = sdscat(slots, "]");
        else slots = sdscatfmt(slots, "-%u]", last_slot_idx);
    }
    return slots;
}

static sds clusterManagerNodeGetJSON(clusterManagerNode *node,
                                     unsigned long error_count)
{
    sds json = sdsempty();
    sds replicate = sdsempty();
    if (node->replicate)
        replicate = sdscatprintf(replicate, "\"%s\"", node->replicate);
    else
        replicate = sdscat(replicate, "null");
    sds slots = clusterManagerNodeSlotsString(node);
    sds flags = clusterManagerNodeFlagString(node);
    char *p = slots;
    while ((p = strchr(p, '-')) != ((void *)0))
        *(p++) = ',';
    json = sdscatprintf(json,
        "  {\n"
        "    \"name\": \"%s\",\n"
        "    \"host\": \"%s\",\n"
        "    \"port\": %d,\n"
        "    \"replicate\": %s,\n"
        "    \"slots\": [%s],\n"
        "    \"slots_count\": %d,\n"
        "    \"flags\": \"%s\",\n"
        "    \"current_epoch\": %llu",
        node->name,
        node->ip,
        node->port,
        replicate,
        slots,
        node->slots_count,
        flags,
        (unsigned long long)node->current_epoch
    );
    if (error_count > 0) {
        json = sdscatprintf(json, ",\n    \"cluster_errors\": %lu",
                            error_count);
    }
    if (node->migrating_count > 0 && node->migrating != ((void *)0)) {
        int i = 0;
        sds migrating = sdsempty();
        for (; i < node->migrating_count; i += 2) {
            sds slot = node->migrating[i];
            sds dest = node->migrating[i + 1];
            if (slot && dest) {
                if (sdslen(migrating) > 0) migrating = sdscat(migrating, ",");
                migrating = sdscatfmt(migrating, "\"%S\": \"%S\"", slot, dest);
            }
        }
        if (sdslen(migrating) > 0)
            json = sdscatfmt(json, ",\n    \"migrating\": {%S}", migrating);
        sdsfree(migrating);
    }
    if (node->importing_count > 0 && node->importing != ((void *)0)) {
        int i = 0;
        sds importing = sdsempty();
        for (; i < node->importing_count; i += 2) {
            sds slot = node->importing[i];
            sds from = node->importing[i + 1];
            if (slot && from) {
                if (sdslen(importing) > 0) importing = sdscat(importing, ",");
                importing = sdscatfmt(importing, "\"%S\": \"%S\"", slot, from);
            }
        }
        if (sdslen(importing) > 0)
            json = sdscatfmt(json, ",\n    \"importing\": {%S}", importing);
        sdsfree(importing);
    }
    json = sdscat(json, "\n  }");
    sdsfree(replicate);
    sdsfree(slots);
    sdsfree(flags);
    return json;
}




 






 
static unsigned int clusterManagerKeyHashSlot(char *key, int keylen) {
    int s, e;  

    for (s = 0; s < keylen; s++)
        if (key[s] == '{') break;

     
    if (s == keylen) return crc16(key,keylen) & 0x3FFF;

     
    for (e = s+1; e < keylen; e++)
        if (key[e] == '}') break;

     
    if (e == keylen || e == s+1) return crc16(key,keylen) & 0x3FFF;

    
 
    return crc16(key+s+1,e-s-1) & 0x3FFF;
}

 
static sds clusterManagerNodeInfo(clusterManagerNode *node, int indent) {
    sds info = sdsempty();
    sds spaces = sdsempty();
    int i;
    for (i = 0; i < indent; i++) spaces = sdscat(spaces, " ");
    if (indent) info = sdscat(info, spaces);
    int is_master = !(node->flags & 1 << 1);
    char *role = (is_master ? "M" : "S");
    sds slots = ((void *)0);
    if (node->dirty && node->replicate != ((void *)0))
        info = sdscatfmt(info, "S: %S %s:%u", node->name, node->ip, node->port);
    else {
        slots = clusterManagerNodeSlotsString(node);
        sds flags = clusterManagerNodeFlagString(node);
        info = sdscatfmt(info, "%s: %S %s:%u\n"
                               "%s   slots:%S (%u slots) "
                               "%S",
                               role, node->name, node->ip, node->port, spaces,
                               slots, node->slots_count, flags);
        sdsfree(slots);
        sdsfree(flags);
    }
    if (node->replicate != ((void *)0))
        info = sdscatfmt(info, "\n%s   replicates %S", spaces, node->replicate);
    else if (node->replicas_count)
        info = sdscatfmt(info, "\n%s   %U additional replica(s)",
                         spaces, node->replicas_count);
    sdsfree(spaces);
    return info;
}

static void clusterManagerShowNodes(void) {
    listIter li;
    listNode *ln;
    listRewind(cluster_manager.nodes, &li);
    while ((ln = listNext(&li)) != ((void *)0)) {
        clusterManagerNode *node = ln->value;
        sds info = clusterManagerNodeInfo(node, 0);
        printf("%s\n", (char *) info);
        sdsfree(info);
    }
}

static void clusterManagerShowClusterInfo(void) {
    int masters = 0;
    int keys = 0;
    listIter li;
    listNode *ln;
    listRewind(cluster_manager.nodes, &li);
    while ((ln = listNext(&li)) != ((void *)0)) {
        clusterManagerNode *node = ln->value;
        if (!(node->flags & 1 << 1)) {
            if (!node->name) continue;
            int replicas = 0;
            int dbsize = -1;
            char name[9];
            memcpy(name, node->name, 8);
            name[8] = '\0';
            listIter ri;
            listNode *rn;
            listRewind(cluster_manager.nodes, &ri);
            while ((rn = listNext(&ri)) != ((void *)0)) {
                clusterManagerNode *n = rn->value;
                if (n == node || !(n->flags & 1 << 1))
                    continue;
                if (n->replicate && !strcmp(n->replicate, node->name))
                    replicas++;
            }
            redisReply *reply = (redisCommand(node ->context, "DBSIZE"));
            if (reply != ((void *)0) && reply->type == 3)
                dbsize = reply->integer;
            if (dbsize < 0) {
                char *err = "";
                if (reply != ((void *)0) && reply->type == 6)
                    err = reply->str;
                clusterManagerLog(3,"Node %s:%d replied with error:\n%s\n", node ->ip, node ->port, err);;
                if (reply != ((void *)0)) freeReplyObject(reply);
                return;
            };
            if (reply != ((void *)0)) freeReplyObject(reply);
            printf("%s:%d (%s...) -> %d keys | %d slots | %d slaves.\n",
                   node->ip, node->port, name, dbsize,
                   node->slots_count, replicas);
            masters++;
            keys += dbsize;
        }
    }
    clusterManagerLog(4,"[OK] %d keys in %d masters.\n", keys, masters);
    float keys_per_slot = keys / (float) 16384;
    printf("%.2f keys per slot on average.\n", keys_per_slot);
}

 
static int clusterManagerAddSlots(clusterManagerNode *node, char**err)
{
    redisReply *reply = ((void *)0);
    void *_reply = ((void *)0);
    int success = 1;
     
    int argc = node->slots_count + 2;
    sds *argv = zmalloc(argc * sizeof(*argv));
    size_t *argvlen = zmalloc(argc * sizeof(*argvlen));
    argv[0] = "CLUSTER";
    argv[1] = "ADDSLOTS";
    argvlen[0] = 7;
    argvlen[1] = 8;
    *err = ((void *)0);
    int i, argv_idx = 2;
    for (i = 0; i < 16384; i++) {
        if (argv_idx >= argc) break;
        if (node->slots[i]) {
            argv[argv_idx] = sdsfromlonglong((long long) i);
            argvlen[argv_idx] = sdslen(argv[argv_idx]);
            argv_idx++;
        }
    }
    if (!argv_idx) {
        success = 0;
        goto cleanup;
    }
    redisAppendCommandArgv(node->context,argc,(const char**)argv,argvlen);
    if (redisGetReply(node->context, &_reply) != 0) {
        success = 0;
        goto cleanup;
    }
    reply = (redisReply*) _reply;
    success = clusterManagerCheckRedisReply(node, reply, err);
cleanup:
    zfree(argvlen);
    if (argv != ((void *)0)) {
        for (i = 2; i < argc; i++) sdsfree(argv[i]);
        zfree(argv);
    }
    if (reply != ((void *)0)) freeReplyObject(reply);
    return success;
}




 
static clusterManagerNode *clusterManagerGetSlotOwner(clusterManagerNode *n,
                                                      int slot, char **err)
{
    ((slot >= 0 && slot < 16384) ? (void) (0) : __assert_fail ("slot >= 0 && slot < CLUSTER_MANAGER_SLOTS", "redis-cli.c", 2949, __extension__ __PRETTY_FUNCTION__));
    clusterManagerNode *owner = ((void *)0);
    redisReply *reply = (redisCommand(n->context, "CLUSTER SLOTS"));
    if (clusterManagerCheckRedisReply(n, reply, err)) {
        ((reply->type == 2) ? (void) (0) : __assert_fail ("reply->type == REDIS_REPLY_ARRAY", "redis-cli.c", 2953, __extension__ __PRETTY_FUNCTION__));
        size_t i;
        for (i = 0; i < reply->elements; i++) {
            redisReply *r = reply->element[i];
            ((r->type == 2 && r->elements >= 3) ? (void) (0) : __assert_fail ("r->type == REDIS_REPLY_ARRAY && r->elements >= 3", "redis-cli.c", 2957, __extension__ __PRETTY_FUNCTION__));
            int from, to;
            from = r->element[0]->integer;
            to = r->element[1]->integer;
            if (slot < from || slot > to) continue;
            redisReply *nr =  r->element[2];
            ((nr->type == 2 && nr->elements >= 2) ? (void) (0) : __assert_fail ("nr->type == REDIS_REPLY_ARRAY && nr->elements >= 2", "redis-cli.c", 2963, __extension__ __PRETTY_FUNCTION__));
            char *name = ((void *)0);
            if (nr->elements >= 3)
                name =  nr->element[2]->str;
            if (name != ((void *)0))
                owner = clusterManagerNodeByName(name);
            else {
                char *ip = nr->element[0]->str;
                ((ip != ((void *)0)) ? (void) (0) : __assert_fail ("ip != NULL", "redis-cli.c", 2971, __extension__ __PRETTY_FUNCTION__));
                int port = (int) nr->element[1]->integer;
                listIter li;
                listNode *ln;
                listRewind(cluster_manager.nodes, &li);
                while ((ln = listNext(&li)) != ((void *)0)) {
                    clusterManagerNode *nd = ln->value;
                    if (strcmp(nd->ip, ip) == 0 && port == nd->port) {
                        owner = nd;
                        break;
                    }
                }
            }
            if (owner) break;
        }
    }
    if (reply) freeReplyObject(reply);
    return owner;
}

 
static int clusterManagerSetSlot(clusterManagerNode *node1,
                                 clusterManagerNode *node2,
                                 int slot, const char *status, char **err) {
    redisReply *reply = (redisCommand(node1->context, "CLUSTER " "SETSLOT %d %s %s", slot, status, (char *) node2->name));



    if (err != ((void *)0)) *err = ((void *)0);
    if (!reply) return 0;
    int success = 1;
    if (reply->type == 6) {
        success = 0;
        if (err != ((void *)0)) {
            *err = zmalloc((reply->len + 1) * sizeof(char));
            strcpy(*err, reply->str);
        } else clusterManagerLog(3,"Node %s:%d replied with error:\n%s\n", node1->ip, node1->port, reply->str);;
        goto cleanup;
    }
cleanup:
    freeReplyObject(reply);
    return success;
}

static int clusterManagerClearSlotStatus(clusterManagerNode *node, int slot) {
    redisReply *reply = (redisCommand(node ->context, "CLUSTER SETSLOT %d %s", slot, "STABLE"));

    int success = clusterManagerCheckRedisReply(node, reply, ((void *)0));
    if (reply) freeReplyObject(reply);
    return success;
}

static int clusterManagerDelSlot(clusterManagerNode *node, int slot,
                                 int ignore_unassigned_err)
{
    redisReply *reply = (redisCommand(node ->context, "CLUSTER DELSLOTS %d", slot));

    char *err = ((void *)0);
    int success = clusterManagerCheckRedisReply(node, reply, &err);
    if (!success && reply && reply->type == 6 &&
        ignore_unassigned_err)
    {
        char *get_owner_err = ((void *)0);
        clusterManagerNode *assigned_to =
            clusterManagerGetSlotOwner(node, slot, &get_owner_err);
        if (!assigned_to) {
            if (get_owner_err == ((void *)0)) success = 1;
            else {
                clusterManagerLog(3,"Node %s:%d replied with error:\n%s\n", node ->ip, node ->port, get_owner_err);;
                zfree(get_owner_err);
            }
        }
    }
    if (!success && err != ((void *)0)) {
        clusterManagerLog(3,"Node %s:%d replied with error:\n%s\n", node ->ip, node ->port, err);;
        zfree(err);
    }
    if (reply) freeReplyObject(reply);
    return success;
}

static int clusterManagerAddSlot(clusterManagerNode *node, int slot) {
    redisReply *reply = (redisCommand(node ->context, "CLUSTER ADDSLOTS %d", slot));

    int success = clusterManagerCheckRedisReply(node, reply, ((void *)0));
    if (reply) freeReplyObject(reply);
    return success;
}

static signed int clusterManagerCountKeysInSlot(clusterManagerNode *node,
                                                int slot)
{
    redisReply *reply = (redisCommand(node ->context, "CLUSTER COUNTKEYSINSLOT %d", slot));

    int count = -1;
    int success = clusterManagerCheckRedisReply(node, reply, ((void *)0));
    if (success && reply->type == 3) count = reply->integer;
    if (reply) freeReplyObject(reply);
    return count;
}

static int clusterManagerBumpEpoch(clusterManagerNode *node) {
    redisReply *reply = (redisCommand(node ->context, "CLUSTER BUMPEPOCH"));
    int success = clusterManagerCheckRedisReply(node, reply, ((void *)0));
    if (reply) freeReplyObject(reply);
    return success;
}



 
static int clusterManagerOnSetOwnerErr(redisReply *reply,
    clusterManagerNode *n, int bulk_idx)
{
    ((void) reply);
    ((void) n);
     
    return (bulk_idx != 1);
}

static int clusterManagerSetSlotOwner(clusterManagerNode *owner,
                                      int slot,
                                      int do_clear)
{
    int success = clusterManagerStartTransaction(owner);
    if (!success) return 0;
     
    clusterManagerDelSlot(owner, slot, 1);
     
    clusterManagerAddSlot(owner, slot);
    if (do_clear) clusterManagerClearSlotStatus(owner, slot);
    clusterManagerBumpEpoch(owner);
    success = clusterManagerExecTransaction(owner, clusterManagerOnSetOwnerErr);
    return success;
}





 
static int clusterManagerCompareKeysValues(clusterManagerNode *n1,
                                          clusterManagerNode *n2,
                                          redisReply *keys_reply,
                                          list *diffs)
{
    size_t i, argc = keys_reply->elements + 2;
    static const char *hash_zero = "0000000000000000000000000000000000000000";
    char **argv = zcalloc(argc * sizeof(char *));
    size_t  *argv_len = zcalloc(argc * sizeof(size_t));
    argv[0] = "DEBUG";
    argv_len[0] = 5;
    argv[1] = "DIGEST-VALUE";
    argv_len[1] = 12;
    for (i = 0; i < keys_reply->elements; i++) {
        redisReply *entry = keys_reply->element[i];
        int idx = i + 2;
        argv[idx] = entry->str;
        argv_len[idx] = entry->len;
    }
    int success = 0;
    void *_reply1 = ((void *)0), *_reply2 = ((void *)0);
    redisReply *r1 = ((void *)0), *r2 = ((void *)0);
    redisAppendCommandArgv(n1->context,argc, (const char**)argv,argv_len);
    success = (redisGetReply(n1->context, &_reply1) == 0);
    if (!success) goto cleanup;
    r1 = (redisReply *) _reply1;
    redisAppendCommandArgv(n2->context,argc, (const char**)argv,argv_len);
    success = (redisGetReply(n2->context, &_reply2) == 0);
    if (!success) goto cleanup;
    r2 = (redisReply *) _reply2;
    success = (r1->type != 6 && r2->type != 6);
    if (r1->type == 6) {
        clusterManagerLog(3,"Node %s:%d replied with error:\n%s\n", n1->ip, n1->port, r1->str);;
        success = 0;
    }
    if (r2->type == 6) {
        clusterManagerLog(3,"Node %s:%d replied with error:\n%s\n", n2->ip, n2->port, r2->str);;
        success = 0;
    }
    if (!success) goto cleanup;
    ((keys_reply->elements == r1->elements && keys_reply->elements == r2->elements) ? (void) (0) : __assert_fail ("keys_reply->elements == r1->elements && keys_reply->elements == r2->elements", "redis-cli.c", 3153, __extension__ __PRETTY_FUNCTION__));

    for (i = 0; i < keys_reply->elements; i++) {
        char *key = keys_reply->element[i]->str;
        char *hash1 = r1->element[i]->str;
        char *hash2 = r2->element[i]->str;
         
        if (strcmp(hash1, hash_zero) == 0 || strcmp(hash2, hash_zero) == 0)
            continue;
        if (strcmp(hash1, hash2) != 0) listAddNodeTail(diffs, key);
    }
cleanup:
    if (r1) freeReplyObject(r1);
    if (r2) freeReplyObject(r2);
    zfree(argv);
    zfree(argv_len);
    return success;
}



 
static redisReply *clusterManagerMigrateKeysInReply(clusterManagerNode *source,
                                                    clusterManagerNode *target,
                                                    redisReply *reply,
                                                    int replace, int timeout,
                                                    char *dots)
{
    redisReply *migrate_reply = ((void *)0);
    char **argv = ((void *)0);
    size_t *argv_len = ((void *)0);
    int c = (replace ? 8 : 7);
    if (config.auth) c += 2;
    size_t argc = c + reply->elements;
    size_t i, offset = 6; 
    argv = zcalloc(argc * sizeof(char *));
    argv_len = zcalloc(argc * sizeof(size_t));
    char portstr[255];
    char timeoutstr[255];
    snprintf(portstr, 10, "%d", target->port);
    snprintf(timeoutstr, 10, "%d", timeout);
    argv[0] = "MIGRATE";
    argv_len[0] = 7;
    argv[1] = target->ip;
    argv_len[1] = strlen(target->ip);
    argv[2] = portstr;
    argv_len[2] = strlen(portstr);
    argv[3] = "";
    argv_len[3] = 0;
    argv[4] = "0";
    argv_len[4] = 1;
    argv[5] = timeoutstr;
    argv_len[5] = strlen(timeoutstr);
    if (replace) {
        argv[offset] = "REPLACE";
        argv_len[offset] = 7;
        offset++;
    }
    if (config.auth) {
        argv[offset] = "AUTH";
        argv_len[offset] = 4;
        offset++;
        argv[offset] = config.auth;
        argv_len[offset] = strlen(config.auth);
        offset++;
    }
    argv[offset] = "KEYS";
    argv_len[offset] = 4;
    offset++;
    for (i = 0; i < reply->elements; i++) {
        redisReply *entry = reply->element[i];
        size_t idx = i + offset;
        ((entry->type == 1) ? (void) (0) : __assert_fail ("entry->type == REDIS_REPLY_STRING", "redis-cli.c", 3224, __extension__ __PRETTY_FUNCTION__));
        argv[idx] = (char *) sdsnew(entry->str);
        argv_len[idx] = entry->len;
        if (dots) dots[i] = '.';
    }
    if (dots) dots[reply->elements] = '\0';
    void *_reply = ((void *)0);
    redisAppendCommandArgv(source->context,argc,
                           (const char**)argv,argv_len);
    int success = (redisGetReply(source->context, &_reply) == 0);
    for (i = 0; i < reply->elements; i++) sdsfree(argv[i + offset]);
    if (!success) goto cleanup;
    migrate_reply = (redisReply *) _reply;
cleanup:
    zfree(argv);
    zfree(argv_len);
    return migrate_reply;
}

 
static int clusterManagerMigrateKeysInSlot(clusterManagerNode *source,
                                           clusterManagerNode *target,
                                           int slot, int timeout,
                                           int pipeline, int verbose,
                                           char **err)
{
    int success = 1;
    int do_fix = config.cluster_manager_command.flags &
                 1 << 0;
    int do_replace = config.cluster_manager_command.flags &
                     1 << 6;
    while (1) {
        char *dots = ((void *)0);
        redisReply *reply = ((void *)0), *migrate_reply = ((void *)0);
        reply = (redisCommand(source ->context, "CLUSTER " "GETKEYSINSLOT %d %d", slot, pipeline));


        success = (reply != ((void *)0));
        if (!success) return 0;
        if (reply->type == 6) {
            success = 0;
            if (err != ((void *)0)) {
                *err = zmalloc((reply->len + 1) * sizeof(char));
                strcpy(*err, reply->str);
                clusterManagerLog(3,"Node %s:%d replied with error:\n%s\n", source ->ip, source ->port, *err);;
            }
            goto next;
        }
        ((reply->type == 2) ? (void) (0) : __assert_fail ("reply->type == REDIS_REPLY_ARRAY", "redis-cli.c", 3272, __extension__ __PRETTY_FUNCTION__));
        size_t count = reply->elements;
        if (count == 0) {
            freeReplyObject(reply);
            break;
        }
        if (verbose) dots = zmalloc((count+1) * sizeof(char));
         
        migrate_reply = clusterManagerMigrateKeysInReply(source, target,
                                                         reply, 0, timeout,
                                                         dots);
        if (migrate_reply == ((void *)0)) goto next;
        if (migrate_reply->type == 6) {
            int is_busy = strstr(migrate_reply->str, "BUSYKEY") != ((void *)0);
            int not_served = 0;
            if (!is_busy) {
                
 
                char *get_owner_err = ((void *)0);
                clusterManagerNode *served_by =
                    clusterManagerGetSlotOwner(source, slot, &get_owner_err);
                if (!served_by) {
                    if (get_owner_err == ((void *)0)) not_served = 1;
                    else {
                        clusterManagerLog(3,"Node %s:%d replied with error:\n%s\n", source ->ip, source ->port, get_owner_err);;

                        zfree(get_owner_err);
                    }
                }
            }
             
            if (is_busy || not_served) {
                
 
                if (do_fix && not_served) {
                    clusterManagerLog(2,"*** Slot was not served, setting " "owner to node %s:%d.\n", target->ip, target->port);


                    clusterManagerSetSlot(source, target, slot, "node", ((void *)0));
                }
                







 
                if (is_busy) {
                    clusterManagerLog(2,"\n*** Target key exists\n");
                    if (!do_replace) {
                        clusterManagerLog(2,"*** Checking key values on " "both nodes...\n");

                        list *diffs = listCreate();
                        success = clusterManagerCompareKeysValues(source,
                            target, reply, diffs);
                        if (!success) {
                            clusterManagerLog(3,"*** Value check failed!\n");
                            listRelease(diffs);
                            goto next;
                        }
                        if (((diffs)->len) > 0) {
                            success = 0;
                            clusterManagerLog(3,"*** Found %d key(s) in both source node and " "target node having different values.\n" "    Source node: %s:%d\n" "    Target node: %s:%d\n" "    Keys(s):\n", ((diffs)->len), source ->ip, source ->port, target->ip, target->port);
# 3345 "redis-cli.c"
                            listIter dli;
                            listNode *dln;
                            listRewind(diffs, &dli);
                            while((dln = listNext(&dli)) != ((void *)0)) {
                                char *k = dln->value;
                                clusterManagerLog(3,"    - %s\n", k);
                            }
                            clusterManagerLog(3,"Please fix the above key(s) " "manually and try again " "or relaunch the command \n" "with --cluster-replace " "option to force key " "overriding.\n");





                            listRelease(diffs);
                            goto next;
                        }
                        listRelease(diffs);
                    }
                    clusterManagerLog(2,"*** Replacing target keys...\n");
                }
                freeReplyObject(migrate_reply);
                migrate_reply = clusterManagerMigrateKeysInReply(source,
                                                                 target,
                                                                 reply,
                                                                 is_busy,
                                                                 timeout,
                                                                 ((void *)0));
                success = (migrate_reply != ((void *)0) &&
                           migrate_reply->type != 6);
            } else success = 0;
            if (!success) {
                if (migrate_reply != ((void *)0)) {
                    if (err) {
                        *err = zmalloc((migrate_reply->len + 1) * sizeof(char));
                        strcpy(*err, migrate_reply->str);
                    }
                    printf("\n");
                    clusterManagerLog(3,"Node %s:%d replied with error:\n%s\n", source ->ip, source ->port, migrate_reply->str);;

                }
                goto next;
            }
        }
        if (verbose) {
            printf("%s", dots);
            fflush(stdout);
        }
next:
        if (reply != ((void *)0)) freeReplyObject(reply);
        if (migrate_reply != ((void *)0)) freeReplyObject(migrate_reply);
        if (dots) zfree(dots);
        if (!success) break;
    }
    return success;
}









 
static int clusterManagerMoveSlot(clusterManagerNode *source,
                                  clusterManagerNode *target,
                                  int slot, int opts,  char**err)
{
    if (!(opts & 1 << 6)) {
        printf("Moving slot %d from %s:%d to %s:%d: ", slot, source->ip,
               source->port, target->ip, target->port);
        fflush(stdout);
    }
    if (err != ((void *)0)) *err = ((void *)0);
    int pipeline = config.cluster_manager_command.pipeline,
        timeout = config.cluster_manager_command.timeout,
        print_dots = (opts & 1 << 7),
        option_cold = (opts & 1 << 1),
        success = 1;
    if (!option_cold) {
        success = clusterManagerSetSlot(target, source, slot,
                                        "importing", err);
        if (!success) return 0;
        success = clusterManagerSetSlot(source, target, slot,
                                        "migrating", err);
        if (!success) return 0;
    }
    success = clusterManagerMigrateKeysInSlot(source, target, slot, timeout,
                                              pipeline, print_dots, err);
    if (!(opts & 1 << 6)) printf("\n");
    if (!success) return 0;
     
    if (!option_cold) {
        listIter li;
        listNode *ln;
        listRewind(cluster_manager.nodes, &li);
        while ((ln = listNext(&li)) != ((void *)0)) {
            clusterManagerNode *n = ln->value;
            if (n->flags & 1 << 1) continue;
            redisReply *r = (redisCommand(n->context, "CLUSTER " "SETSLOT %d %s %s", slot, "node", target->name));



            success = (r != ((void *)0));
            if (!success) return 0;
            if (r->type == 6) {
                success = 0;
                if (err != ((void *)0)) {
                    *err = zmalloc((r->len + 1) * sizeof(char));
                    strcpy(*err, r->str);
                    clusterManagerLog(3,"Node %s:%d replied with error:\n%s\n", n->ip, n->port, *err);;
                }
            }
            freeReplyObject(r);
            if (!success) return 0;
        }
    }
     
    if (opts & 1 << 2) {
        source->slots[slot] = 0;
        target->slots[slot] = 1;
    }
    return 1;
}


 
static int clusterManagerFlushNodeConfig(clusterManagerNode *node, char **err) {
    if (!node->dirty) return 0;
    redisReply *reply = ((void *)0);
    int is_err = 0, success = 1;
    if (err != ((void *)0)) *err = ((void *)0);
    if (node->replicate != ((void *)0)) {
        reply = (redisCommand(node ->context, "CLUSTER REPLICATE %s", node ->replicate));

        if (reply == ((void *)0) || (is_err = (reply->type == 6))) {
            if (is_err && err != ((void *)0)) {
                *err = zmalloc((reply->len + 1) * sizeof(char));
                strcpy(*err, reply->str);
            }
            success = 0;
            


 
            goto cleanup;
        }
    } else {
        int added = clusterManagerAddSlots(node, err);
        if (!added || *err != ((void *)0)) success = 0;
    }
    node->dirty = 0;
cleanup:
    if (reply != ((void *)0)) freeReplyObject(reply);
    return success;
}

 
static void clusterManagerWaitForClusterJoin(void) {
    printf("Waiting for the cluster to join\n");
    int counter = 0,
        check_after = 20 +
                      (int)(((cluster_manager . nodes)->len) * 0.15f);
    while(!clusterManagerIsConfigConsistent()) {
        printf(".");
        fflush(stdout);
        sleep(1);
        if (++counter > check_after) {
            dict *status = clusterManagerGetLinkStatus();
            dictIterator *iter = ((void *)0);
            if (status != ((void *)0) && ((status)->ht[0]. used+(status)->ht[1]. used) > 0) {
                printf("\n");
                clusterManagerLog(3,"Warning: %d node(s) may " "be unreachable\n", ((status)->ht[0]. used+(status)->ht[1]. used));

                iter = dictGetIterator(status);
                dictEntry *entry;
                while ((entry = dictNext(iter)) != ((void *)0)) {
                    sds nodeaddr = (sds) ((entry)->key);
                    char *node_ip = ((void *)0);
                    int node_port = 0, node_bus_port = 0;
                    list *from = (list *) ((entry)->v . val);
                    if (parseClusterNodeAddress(nodeaddr, &node_ip,
                        &node_port, &node_bus_port) && node_bus_port) {
                        clusterManagerLog(3," - The port %d of node %s may " "be unreachable from:\n", node_bus_port, node_ip);


                    } else {
                        clusterManagerLog(3," - Node %s may be unreachable " "from:\n", nodeaddr);

                    }
                    listIter li;
                    listNode *ln;
                    listRewind(from, &li);
                    while ((ln = listNext(&li)) != ((void *)0)) {
                        sds from_addr = ln->value;
                        clusterManagerLog(3,"   %s\n", from_addr);
                        sdsfree(from_addr);
                    }
                    clusterManagerLog(3,"Cluster bus ports must be reachable " "by every node.\nRemember that " "cluster bus ports are different " "from standard instance ports.\n");



                    listEmpty(from);
                }
            }
            if (iter != ((void *)0)) dictReleaseIterator(iter);
            if (status != ((void *)0)) dictRelease(status);
            counter = 0;
        }
    }
    printf("\n");
}





 
static int clusterManagerNodeLoadInfo(clusterManagerNode *node, int opts,
                                      char **err)
{
    redisReply *reply = (redisCommand(node ->context, "CLUSTER NODES"));
    int success = 1;
    *err = ((void *)0);
    if (!clusterManagerCheckRedisReply(node, reply, err)) {
        success = 0;
        goto cleanup;
    }
    int getfriends = (opts & 1 << 0);
    char *lines = reply->str, *p, *line;
    while ((p = strstr(lines, "\n")) != ((void *)0)) {
        *p = '\0';
        line = lines;
        lines = p + 1;
        char *name = ((void *)0), *addr = ((void *)0), *flags = ((void *)0), *master_id = ((void *)0),
             *ping_sent = ((void *)0), *ping_recv = ((void *)0), *config_epoch = ((void *)0),
             *link_status = ((void *)0);
        ((void) link_status);
        int i = 0;
        while ((p = strchr(line, ' ')) != ((void *)0)) {
            *p = '\0';
            char *token = line;
            line = p + 1;
            switch(i++){
            case 0: name = token; break;
            case 1: addr = token; break;
            case 2: flags = token; break;
            case 3: master_id = token; break;
            case 4: ping_sent = token; break;
            case 5: ping_recv = token; break;
            case 6: config_epoch = token; break;
            case 7: link_status = token; break;
            }
            if (i == 8) break; 
        }
        if (!flags) {
            success = 0;
            goto cleanup;
        }
        int myself = (strstr(flags, "myself") != ((void *)0));
        clusterManagerNode *currentNode = ((void *)0);
        if (myself) {
            node->flags |= 1 << 0;
            currentNode = node;
            clusterManagerNodeResetSlots(node);
            if (i == 8) {
                int remaining = strlen(line);
                while (remaining > 0) {
                    p = strchr(line, ' ');
                    if (p == ((void *)0)) p = line + remaining;
                    remaining -= (p - line);

                    char *slotsdef = line;
                    *p = '\0';
                    if (remaining) {
                        line = p + 1;
                        remaining--;
                    } else line = p;
                    char *dash = ((void *)0);
                    if (slotsdef[0] == '[') {
                        slotsdef++;
                        if ((p = strstr(slotsdef, "->-"))) { 
                            *p = '\0';
                            p += 3;
                            char *closing_bracket = strchr(p, ']');
                            if (closing_bracket) *closing_bracket = '\0';
                            sds slot = sdsnew(slotsdef);
                            sds dst = sdsnew(p);
                            node->migrating_count += 2;
                            node->migrating = zrealloc(node->migrating,
                                (node->migrating_count * sizeof(sds)));
                            node->migrating[node->migrating_count - 2] =
                                slot;
                            node->migrating[node->migrating_count - 1] =
                                dst;
                        }  else if ((p = strstr(slotsdef, "-<-"))) {
                            *p = '\0';
                            p += 3;
                            char *closing_bracket = strchr(p, ']');
                            if (closing_bracket) *closing_bracket = '\0';
                            sds slot = sdsnew(slotsdef);
                            sds src = sdsnew(p);
                            node->importing_count += 2;
                            node->importing = zrealloc(node->importing,
                                (node->importing_count * sizeof(sds)));
                            node->importing[node->importing_count - 2] =
                                slot;
                            node->importing[node->importing_count - 1] =
                                src;
                        }
                    } else if ((dash = strchr(slotsdef, '-')) != ((void *)0)) {
                        p = dash;
                        int start, stop;
                        *p = '\0';
                        start = atoi(slotsdef);
                        stop = atoi(p + 1);
                        node->slots_count += (stop - (start - 1));
                        while (start <= stop) node->slots[start++] = 1;
                    } else if (p > slotsdef) {
                        node->slots[atoi(slotsdef)] = 1;
                        node->slots_count++;
                    }
                }
            }
            node->dirty = 0;
        } else if (!getfriends) {
            if (!(node->flags & 1 << 0)) continue;
            else break;
        } else {
            if (addr == ((void *)0)) {
                fprintf(stderr, "Error: invalid CLUSTER NODES reply\n");
                success = 0;
                goto cleanup;
            }
            char *c = strrchr(addr, '@');
            if (c != ((void *)0)) *c = '\0';
            c = strrchr(addr, ':');
            if (c == ((void *)0)) {
                fprintf(stderr, "Error: invalid CLUSTER NODES reply\n");
                success = 0;
                goto cleanup;
            }
            *c = '\0';
            int port = atoi(++c);
            currentNode = clusterManagerNewNode(sdsnew(addr), port);
            currentNode->flags |= 1 << 2;
            if (node->friends == ((void *)0)) node->friends = listCreate();
            listAddNodeTail(node->friends, currentNode);
        }
        if (name != ((void *)0)) {
            if (currentNode->name) sdsfree(currentNode->name);
            currentNode->name = sdsnew(name);
        }
        if (currentNode->flags_str != ((void *)0))
            freeClusterManagerNodeFlags(currentNode->flags_str);
        currentNode->flags_str = listCreate();
        int flag_len;
        while ((flag_len = strlen(flags)) > 0) {
            sds flag = ((void *)0);
            char *fp = strchr(flags, ',');
            if (fp) {
                *fp = '\0';
                flag = sdsnew(flags);
                flags = fp + 1;
            } else {
                flag = sdsnew(flags);
                flags += flag_len;
            }
            if (strcmp(flag, "noaddr") == 0)
                currentNode->flags |= 1 << 3;
            else if (strcmp(flag, "disconnected") == 0)
                currentNode->flags |= 1 << 4;
            else if (strcmp(flag, "fail") == 0)
                currentNode->flags |= 1 << 5;
            else if (strcmp(flag, "slave") == 0) {
                currentNode->flags |= 1 << 1;
                if (master_id != ((void *)0)) {
                    if (currentNode->replicate) sdsfree(currentNode->replicate);
                    currentNode->replicate = sdsnew(master_id);
                }
            }
            listAddNodeTail(currentNode->flags_str, flag);
        }
        if (config_epoch != ((void *)0))
            currentNode->current_epoch = atoll(config_epoch);
        if (ping_sent != ((void *)0)) currentNode->ping_sent = atoll(ping_sent);
        if (ping_recv != ((void *)0)) currentNode->ping_recv = atoll(ping_recv);
        if (!getfriends && myself) break;
    }
cleanup:
    if (reply) freeReplyObject(reply);
    return success;
}




 
static int clusterManagerLoadInfoFromNode(clusterManagerNode *node, int opts) {
    if (node->context == ((void *)0) && !clusterManagerNodeConnect(node)) {
        freeClusterManagerNode(node);
        return 0;
    }
    opts |= 1 << 0;
    char *e = ((void *)0);
    if (!clusterManagerNodeIsCluster(node, &e)) {
        clusterManagerPrintNotClusterNodeError(node, e);
        if (e) zfree(e);
        freeClusterManagerNode(node);
        return 0;
    }
    e = ((void *)0);
    if (!clusterManagerNodeLoadInfo(node, opts, &e)) {
        if (e) {
            clusterManagerLog(3,"Node %s:%d replied with error:\n%s\n", node ->ip, node ->port, e);;
            zfree(e);
        }
        freeClusterManagerNode(node);
        return 0;
    }
    listIter li;
    listNode *ln;
    if (cluster_manager.nodes != ((void *)0)) {
        listRewind(cluster_manager.nodes, &li);
        while ((ln = listNext(&li)) != ((void *)0))
            freeClusterManagerNode((clusterManagerNode *) ln->value);
        listRelease(cluster_manager.nodes);
    }
    cluster_manager.nodes = listCreate();
    listAddNodeTail(cluster_manager.nodes, node);
    if (node->friends != ((void *)0)) {
        listRewind(node->friends, &li);
        while ((ln = listNext(&li)) != ((void *)0)) {
            clusterManagerNode *friend = ln->value;
            if (!friend->ip || !friend->port) goto invalid_friend;
            if (!friend->context && !clusterManagerNodeConnect(friend))
                goto invalid_friend;
            e = ((void *)0);
            if (clusterManagerNodeLoadInfo(friend, 0, &e)) {
                if (friend->flags & (1 << 3 |
                                     1 << 4 |
                                     1 << 5))
                    goto invalid_friend;
                listAddNodeTail(cluster_manager.nodes, friend);
            } else {
                clusterManagerLog(3,"[ERR] Unable to load info for " "node %s:%d\n", friend->ip, friend->port);


                goto invalid_friend;
            }
            continue;
invalid_friend:
            freeClusterManagerNode(friend);
        }
        listRelease(node->friends);
        node->friends = ((void *)0);
    }
    
    listRewind(cluster_manager.nodes, &li);
    while ((ln = listNext(&li)) != ((void *)0)) {
        clusterManagerNode *n = ln->value;
        if (n->replicate != ((void *)0)) {
            clusterManagerNode *master = clusterManagerNodeByName(n->replicate);
            if (master == ((void *)0)) {
                clusterManagerLog(2,"*** WARNING: %s:%d claims to be " "slave of unknown node ID %s.\n", n->ip, n->port, n->replicate);


            } else master->replicas_count++;
        }
    }
    return 1;
}

 
int clusterManagerSlotCompare(const void *slot1, const void *slot2) {
    const char **i1 = (const char **)slot1;
    const char **i2 = (const char **)slot2;
    return strcmp(*i1, *i2);
}

int clusterManagerSlotCountCompareDesc(const void *n1, const void *n2) {
    clusterManagerNode *node1 = *((clusterManagerNode **) n1);
    clusterManagerNode *node2 = *((clusterManagerNode **) n2);
    return node2->slots_count - node1->slots_count;
}

int clusterManagerCompareNodeBalance(const void *n1, const void *n2) {
    clusterManagerNode *node1 = *((clusterManagerNode **) n1);
    clusterManagerNode *node2 = *((clusterManagerNode **) n2);
    return node1->balance - node2->balance;
}

static sds clusterManagerGetConfigSignature(clusterManagerNode *node) {
    sds signature = ((void *)0);
    int node_count = 0, i = 0, name_len = 0;
    char **node_configs = ((void *)0);
    redisReply *reply = (redisCommand(node ->context, "CLUSTER NODES"));
    if (reply == ((void *)0) || reply->type == 6)
        goto cleanup;
    char *lines = reply->str, *p, *line;
    while ((p = strstr(lines, "\n")) != ((void *)0)) {
        i = 0;
        *p = '\0';
        line = lines;
        lines = p + 1;
        char *nodename = ((void *)0);
        int tot_size = 0;
        while ((p = strchr(line, ' ')) != ((void *)0)) {
            *p = '\0';
            char *token = line;
            line = p + 1;
            if (i == 0) {
                nodename = token;
                tot_size = (p - token);
                name_len = tot_size++; 
            }
            if (++i == 8) break;
        }
        if (i != 8) continue;
        if (nodename == ((void *)0)) continue;
        int remaining = strlen(line);
        if (remaining == 0) continue;
        char **slots = ((void *)0);
        int c = 0;
        while (remaining > 0) {
            p = strchr(line, ' ');
            if (p == ((void *)0)) p = line + remaining;
            int size = (p - line);
            remaining -= size;
            tot_size += size;
            char *slotsdef = line;
            *p = '\0';
            if (remaining) {
                line = p + 1;
                remaining--;
            } else line = p;
            if (slotsdef[0] != '[') {
                c++;
                slots = zrealloc(slots, (c * sizeof(char *)));
                slots[c - 1] = slotsdef;
            }
        }
        if (c > 0) {
            if (c > 1)
                qsort(slots, c, sizeof(char *), clusterManagerSlotCompare);
            node_count++;
            node_configs =
                zrealloc(node_configs, (node_count * sizeof(char *)));
             
            tot_size += (sizeof(char) * (c - 1));
            char *cfg = zmalloc((sizeof(char) * tot_size) + 1);
            memcpy(cfg, nodename, name_len);
            char *sp = cfg + name_len;
            *(sp++) = ':';
            for (i = 0; i < c; i++) {
                if (i > 0) *(sp++) = ',';
                int slen = strlen(slots[i]);
                memcpy(sp, slots[i], slen);
                sp += slen;
            }
            *(sp++) = '\0';
            node_configs[node_count - 1] = cfg;
        }
        zfree(slots);
    }
    if (node_count > 0) {
        if (node_count > 1) {
            qsort(node_configs, node_count, sizeof(char *),
                  clusterManagerSlotCompare);
        }
        signature = sdsempty();
        for (i = 0; i < node_count; i++) {
            if (i > 0) signature = sdscatprintf(signature, "%c", '|');
            signature = sdscatfmt(signature, "%s", node_configs[i]);
        }
    }
cleanup:
    if (reply != ((void *)0)) freeReplyObject(reply);
    if (node_configs != ((void *)0)) {
        for (i = 0; i < node_count; i++) zfree(node_configs[i]);
        zfree(node_configs);
    }
    return signature;
}

static int clusterManagerIsConfigConsistent(void) {
    if (cluster_manager.nodes == ((void *)0)) return 0;
    int consistent = (((cluster_manager . nodes)->len) <= 1);
    
    if (consistent) return 1;
    sds first_cfg = ((void *)0);
    listIter li;
    listNode *ln;
    listRewind(cluster_manager.nodes, &li);
    while ((ln = listNext(&li)) != ((void *)0)) {
        clusterManagerNode *node = ln->value;
        sds cfg = clusterManagerGetConfigSignature(node);
        if (cfg == ((void *)0)) {
            consistent = 0;
            break;
        }
        if (first_cfg == ((void *)0)) first_cfg = cfg;
        else {
            consistent = !sdscmp(first_cfg, cfg);
            sdsfree(cfg);
            if (!consistent) break;
        }
    }
    if (first_cfg != ((void *)0)) sdsfree(first_cfg);
    return consistent;
}

static list *clusterManagerGetDisconnectedLinks(clusterManagerNode *node) {
    list *links = ((void *)0);
    redisReply *reply = (redisCommand(node ->context, "CLUSTER NODES"));
    if (!clusterManagerCheckRedisReply(node, reply, ((void *)0))) goto cleanup;
    links = listCreate();
    char *lines = reply->str, *p, *line;
    while ((p = strstr(lines, "\n")) != ((void *)0)) {
        int i = 0;
        *p = '\0';
        line = lines;
        lines = p + 1;
        char *nodename = ((void *)0), *addr = ((void *)0), *flags = ((void *)0), *link_status = ((void *)0);
        while ((p = strchr(line, ' ')) != ((void *)0)) {
            *p = '\0';
            char *token = line;
            line = p + 1;
            if (i == 0) nodename = token;
            else if (i == 1) addr = token;
            else if (i == 2) flags = token;
            else if (i == 7) link_status = token;
            else if (i == 8) break;
            i++;
        }
        if (i == 7) link_status = line;
        if (nodename == ((void *)0) || addr == ((void *)0) || flags == ((void *)0) ||
            link_status == ((void *)0)) continue;
        if (strstr(flags, "myself") != ((void *)0)) continue;
        int disconnected = ((strstr(flags, "disconnected") != ((void *)0)) ||
                            (strstr(link_status, "disconnected")));
        int handshaking = (strstr(flags, "handshake") != ((void *)0));
        if (disconnected || handshaking) {
            clusterManagerLink *link = zmalloc(sizeof(*link));
            link->node_name = sdsnew(nodename);
            link->node_addr = sdsnew(addr);
            link->connected = 0;
            link->handshaking = handshaking;
            listAddNodeTail(links, link);
        }
    }
cleanup:
    if (reply != ((void *)0)) freeReplyObject(reply);
    return links;
}



 
static dict *clusterManagerGetLinkStatus(void) {
    if (cluster_manager.nodes == ((void *)0)) return ((void *)0);
    dict *status = dictCreate(&clusterManagerLinkDictType, ((void *)0));
    listIter li;
    listNode *ln;
    listRewind(cluster_manager.nodes, &li);
    while ((ln = listNext(&li)) != ((void *)0)) {
        clusterManagerNode *node = ln->value;
        list *links = clusterManagerGetDisconnectedLinks(node);
        if (links) {
            listIter lli;
            listNode *lln;
            listRewind(links, &lli);
            while ((lln = listNext(&lli)) != ((void *)0)) {
                clusterManagerLink *link = lln->value;
                list *from = ((void *)0);
                dictEntry *entry = dictFind(status, link->node_addr);
                if (entry) from = ((entry)->v . val);
                else {
                    from = listCreate();
                    dictAdd(status, sdsdup(link->node_addr), from);
                }
                sds myaddr = sdsempty();
                myaddr = sdscatfmt(myaddr, "%s:%u", node->ip, node->port);
                listAddNodeTail(from, myaddr);
                sdsfree(link->node_name);
                sdsfree(link->node_addr);
                zfree(link);
            }
            listRelease(links);
        }
    }
    return status;
}

 
static void clusterManagerOnError(sds err) {
    if (cluster_manager.errors == ((void *)0))
        cluster_manager.errors = listCreate();
    listAddNodeTail(cluster_manager.errors, err);
    clusterManagerLog(3,"%s\n", (char *) err);
}



 
static int clusterManagerGetCoveredSlots(char *all_slots) {
    if (cluster_manager.nodes == ((void *)0)) return 0;
    listIter li;
    listNode *ln;
    listRewind(cluster_manager.nodes, &li);
    int totslots = 0, i;
    while ((ln = listNext(&li)) != ((void *)0)) {
        clusterManagerNode *node = ln->value;
        for (i = 0; i < 16384; i++) {
            if (node->slots[i] && !all_slots[i]) {
                all_slots[i] = 1;
                totslots++;
            }
        }
    }
    return totslots;
}

static void clusterManagerPrintSlotsList(list *slots) {
    listIter li;
    listNode *ln;
    listRewind(slots, &li);
    sds first = ((void *)0);
    while ((ln = listNext(&li)) != ((void *)0)) {
        sds slot = ln->value;
        if (!first) first = slot;
        else printf(", ");
        printf("%s", slot);
    }
    printf("\n");
}


 
static clusterManagerNode * clusterManagerGetNodeWithMostKeysInSlot(list *nodes,
                                                                    int slot,
                                                                    char **err)
{
    clusterManagerNode *node = ((void *)0);
    int numkeys = 0;
    listIter li;
    listNode *ln;
    listRewind(nodes, &li);
    if (err) *err = ((void *)0);
    while ((ln = listNext(&li)) != ((void *)0)) {
        clusterManagerNode *n = ln->value;
        if (n->flags & 1 << 1 || n->replicate)
            continue;
        redisReply *r =
            (redisCommand(n->context, "CLUSTER COUNTKEYSINSLOT %d", slot));
        int success = clusterManagerCheckRedisReply(n, r, err);
        if (success) {
            if (r->integer > numkeys || node == ((void *)0)) {
                numkeys = r->integer;
                node = n;
            }
        }
        if (r != ((void *)0)) freeReplyObject(r);
         
        if (!success) {
            if (err != ((void *)0) && *err != ((void *)0))
                clusterManagerLog(3,"Node %s:%d replied with error:\n%s\n", n->ip, n->port, err);;
            node = ((void *)0);
            break;
        }
    }
    return node;
}



 

static clusterManagerNode *clusterManagerNodeWithLeastReplicas() {
    clusterManagerNode *node = ((void *)0);
    int lowest_count = 0;
    listIter li;
    listNode *ln;
    listRewind(cluster_manager.nodes, &li);
    while ((ln = listNext(&li)) != ((void *)0)) {
        clusterManagerNode *n = ln->value;
        if (n->flags & 1 << 1) continue;
        if (node == ((void *)0) || n->replicas_count < lowest_count) {
            node = n;
            lowest_count = n->replicas_count;
        }
    }
    return node;
}

 

static clusterManagerNode *clusterManagerNodeMasterRandom() {
    int master_count = 0;
    int idx;
    listIter li;
    listNode *ln;
    listRewind(cluster_manager.nodes, &li);
    while ((ln = listNext(&li)) != ((void *)0)) {
        clusterManagerNode *n = ln->value;
        if (n->flags & 1 << 1) continue;
        master_count++;
    }

    srand(time(((void *)0)));
    idx = rand() % master_count;
    listRewind(cluster_manager.nodes, &li);
    while ((ln = listNext(&li)) != ((void *)0)) {
        clusterManagerNode *n = ln->value;
        if (n->flags & 1 << 1) continue;
        if (!idx--) {
            return n;
        }
    }
     
    return ((void *)0);
}

static int clusterManagerFixSlotsCoverage(char *all_slots) {
    int i, fixed = 0;
    list *none = ((void *)0), *single = ((void *)0), *multi = ((void *)0);
    clusterManagerLog(1,">>> Fixing slots coverage...\n");
    printf("List of not covered slots: \n");
    int uncovered_count = 0;
    sds log = sdsempty();
    for (i = 0; i < 16384; i++) {
        int covered = all_slots[i];
        if (!covered) {
            sds key = sdsfromlonglong((long long) i);
            if (uncovered_count++ > 0) printf(",");
            printf("%s", (char *) key);
            list *slot_nodes = listCreate();
            sds slot_nodes_str = sdsempty();
            listIter li;
            listNode *ln;
            listRewind(cluster_manager.nodes, &li);
            while ((ln = listNext(&li)) != ((void *)0)) {
                clusterManagerNode *n = ln->value;
                if (n->flags & 1 << 1 || n->replicate)
                    continue;
                redisReply *reply = (redisCommand(n->context, "CLUSTER GETKEYSINSLOT %d %d", i, 1));

                if (!clusterManagerCheckRedisReply(n, reply, ((void *)0))) {
                    fixed = -1;
                    if (reply) freeReplyObject(reply);
                    goto cleanup;
                }
                ((reply->type == 2) ? (void) (0) : __assert_fail ("reply->type == REDIS_REPLY_ARRAY", "redis-cli.c", 4198, __extension__ __PRETTY_FUNCTION__));
                if (reply->elements > 0) {
                    listAddNodeTail(slot_nodes, n);
                    if (((slot_nodes)->len) > 1)
                        slot_nodes_str = sdscat(slot_nodes_str, ", ");
                    slot_nodes_str = sdscatfmt(slot_nodes_str,
                                               "%s:%u", n->ip, n->port);
                }
                freeReplyObject(reply);
            }
            log = sdscatfmt(log, "\nSlot %S has keys in %u nodes: %S",
                            key, ((slot_nodes)->len), slot_nodes_str);
            sdsfree(slot_nodes_str);
            dictAdd(clusterManagerUncoveredSlots, key, slot_nodes);
        }
    }
    printf("\n%s\n", log);
    


 
    none = listCreate();
    single = listCreate();
    multi = listCreate();
    dictIterator *iter = dictGetIterator(clusterManagerUncoveredSlots);
    dictEntry *entry;
    while ((entry = dictNext(iter)) != ((void *)0)) {
        sds slot = (sds) ((entry)->key);
        list *nodes = (list *) ((entry)->v . val);
        switch (((nodes)->len)){
        case 0: listAddNodeTail(none, slot); break;
        case 1: listAddNodeTail(single, slot); break;
        default: listAddNodeTail(multi, slot); break;
        }
    }
    dictReleaseIterator(iter);

     
    if (((none)->len) > 0) {
        printf("The following uncovered slots have no keys "
               "across the cluster:\n");
        clusterManagerPrintSlotsList(none);
        if (confirmWithYes("Fix these slots by covering with a random node?")){
            listIter li;
            listNode *ln;
            listRewind(none, &li);
            while ((ln = listNext(&li)) != ((void *)0)) {
                sds slot = ln->value;
                int s = atoi(slot);
                clusterManagerNode *n = clusterManagerNodeMasterRandom();
                clusterManagerLog(1,">>> Covering slot %s with %s:%d\n", slot, n->ip, n->port);

                if (!clusterManagerSetSlotOwner(n, s, 0)) {
                    fixed = -1;
                    goto cleanup;
                }
                
 
                n->slots[s] = 1;
                fixed++;
            }
        }
    }

     
    if (((single)->len) > 0) {
        printf("The following uncovered slots have keys in just one node:\n");
        clusterManagerPrintSlotsList(single);
        if (confirmWithYes("Fix these slots by covering with those nodes?")){
            listIter li;
            listNode *ln;
            listRewind(single, &li);
            while ((ln = listNext(&li)) != ((void *)0)) {
                sds slot = ln->value;
                int s = atoi(slot);
                dictEntry *entry = dictFind(clusterManagerUncoveredSlots, slot);
                ((entry != ((void *)0)) ? (void) (0) : __assert_fail ("entry != NULL", "redis-cli.c", 4274, __extension__ __PRETTY_FUNCTION__));
                list *nodes = (list *) ((entry)->v . val);
                listNode *fn = ((nodes)->head);
                ((fn != ((void *)0)) ? (void) (0) : __assert_fail ("fn != NULL", "redis-cli.c", 4277, __extension__ __PRETTY_FUNCTION__));
                clusterManagerNode *n = fn->value;
                clusterManagerLog(1,">>> Covering slot %s with %s:%d\n", slot, n->ip, n->port);

                if (!clusterManagerSetSlotOwner(n, s, 0)) {
                    fixed = -1;
                    goto cleanup;
                }
                
 
                n->slots[atoi(slot)] = 1;
                fixed++;
            }
        }
    }

     
    if (((multi)->len) > 0) {
        printf("The following uncovered slots have keys in multiple nodes:\n");
        clusterManagerPrintSlotsList(multi);
        if (confirmWithYes("Fix these slots by moving keys "
                           "into a single node?")) {
            listIter li;
            listNode *ln;
            listRewind(multi, &li);
            while ((ln = listNext(&li)) != ((void *)0)) {
                sds slot = ln->value;
                dictEntry *entry = dictFind(clusterManagerUncoveredSlots, slot);
                ((entry != ((void *)0)) ? (void) (0) : __assert_fail ("entry != NULL", "redis-cli.c", 4305, __extension__ __PRETTY_FUNCTION__));
                list *nodes = (list *) ((entry)->v . val);
                int s = atoi(slot);
                clusterManagerNode *target =
                    clusterManagerGetNodeWithMostKeysInSlot(nodes, s, ((void *)0));
                if (target == ((void *)0)) {
                    fixed = -1;
                    goto cleanup;
                }
                clusterManagerLog(1,">>> Covering slot %s moving keys " "to %s:%d\n", slot, target->ip, target->port);


                if (!clusterManagerSetSlotOwner(target, s, 1)) {
                    fixed = -1;
                    goto cleanup;
                }
                
 
                target->slots[atoi(slot)] = 1;
                listIter nli;
                listNode *nln;
                listRewind(nodes, &nli);
                while ((nln = listNext(&nli)) != ((void *)0)) {
                    clusterManagerNode *src = nln->value;
                    if (src == target) continue;
                     
                    if (!clusterManagerSetSlot(src, target, s, "NODE", ((void *)0)))
                        fixed = -1;
                    if (fixed < 0) goto cleanup;
                    


 
                    if (!clusterManagerSetSlot(src, target, s,
                                               "IMPORTING", ((void *)0))) fixed = -1;
                    if (fixed < 0) goto cleanup;
                    int opts = 1 << 7 |
                               1 << 1;
                    if (!clusterManagerMoveSlot(src, target, s, opts, ((void *)0))) {
                        fixed = -1;
                        goto cleanup;
                    }
                    if (!clusterManagerClearSlotStatus(src, s))
                        fixed = -1;
                    if (fixed < 0) goto cleanup;
                }
                fixed++;
            }
        }
    }
cleanup:
    sdsfree(log);
    if (none) listRelease(none);
    if (single) listRelease(single);
    if (multi) listRelease(multi);
    return fixed;
}



 
static int clusterManagerFixOpenSlot(int slot) {
    clusterManagerLog(1,">>> Fixing open slot %d\n", slot);
    
 
    int success = 1;
    list *owners = listCreate();
    list *migrating = listCreate();
    list *importing = listCreate();
    sds migrating_str = sdsempty();
    sds importing_str = sdsempty();
    clusterManagerNode *owner = ((void *)0);
    listIter li;
    listNode *ln;
    listRewind(cluster_manager.nodes, &li);
    while ((ln = listNext(&li)) != ((void *)0)) {
        clusterManagerNode *n = ln->value;
        if (n->flags & 1 << 1) continue;
        if (n->slots[slot]) listAddNodeTail(owners, n);
        else {
            redisReply *r = (redisCommand(n->context, "CLUSTER COUNTKEYSINSLOT %d", slot));

            success = clusterManagerCheckRedisReply(n, r, ((void *)0));
            if (success && r->integer > 0) {
                clusterManagerLog(2,"*** Found keys about slot %d " "in non-owner node %s:%d!\n", slot, n->ip, n->port);


                listAddNodeTail(owners, n);
            }
            if (r) freeReplyObject(r);
            if (!success) goto cleanup;
        }
    }
    if (((owners)->len) == 1) owner = ((owners)->head)->value;
    listRewind(cluster_manager.nodes, &li);
    while ((ln = listNext(&li)) != ((void *)0)) {
        clusterManagerNode *n = ln->value;
        if (n->flags & 1 << 1) continue;
        int is_migrating = 0, is_importing = 0;
        if (n->migrating) {
            for (int i = 0; i < n->migrating_count; i += 2) {
                sds migrating_slot = n->migrating[i];
                if (atoi(migrating_slot) == slot) {
                    char *sep = (((migrating)->len) == 0 ? "" : ",");
                    migrating_str = sdscatfmt(migrating_str, "%s%s:%u",
                                              sep, n->ip, n->port);
                    listAddNodeTail(migrating, n);
                    is_migrating = 1;
                    break;
                }
            }
        }
        if (!is_migrating && n->importing) {
            for (int i = 0; i < n->importing_count; i += 2) {
                sds importing_slot = n->importing[i];
                if (atoi(importing_slot) == slot) {
                    char *sep = (((importing)->len) == 0 ? "" : ",");
                    importing_str = sdscatfmt(importing_str, "%s%s:%u",
                                              sep, n->ip, n->port);
                    listAddNodeTail(importing, n);
                    is_importing = 1;
                    break;
                }
            }
        }
        

 
        if (!is_migrating && !is_importing && n != owner) {
            redisReply *r = (redisCommand(n->context, "CLUSTER COUNTKEYSINSLOT %d", slot));

            success = clusterManagerCheckRedisReply(n, r, ((void *)0));
            if (success && r->integer > 0) {
                clusterManagerLog(2,"*** Found keys about slot %d " "in node %s:%d!\n", slot, n->ip, n->port);


                char *sep = (((importing)->len) == 0 ? "" : ",");
                importing_str = sdscatfmt(importing_str, "%s%S:%u",
                                          sep, n->ip, n->port);
                listAddNodeTail(importing, n);
            }
            if (r) freeReplyObject(r);
            if (!success) goto cleanup;
        }
    }
    if (sdslen(migrating_str) > 0)
        printf("Set as migrating in: %s\n", migrating_str);
    if (sdslen(importing_str) > 0)
        printf("Set as importing in: %s\n", importing_str);
    
 
    if (owner == ((void *)0)) {
        clusterManagerLog(1,">>> Nobody claims ownership, " "selecting an owner...\n");

        owner = clusterManagerGetNodeWithMostKeysInSlot(cluster_manager.nodes,
                                                        slot, ((void *)0));
        
        if (owner == ((void *)0)) {
            clusterManagerLog(3,"[ERR] Can't select a slot owner. " "Impossible to fix.\n");

            success = 0;
            goto cleanup;
        }

        
        clusterManagerLog(2,"*** Configuring %s:%d as the slot owner\n", owner->ip, owner->port);

        success = clusterManagerClearSlotStatus(owner, slot);
        if (!success) goto cleanup;
        success = clusterManagerSetSlotOwner(owner, slot, 0);
        if (!success) goto cleanup;
        
 
        owner->slots[slot] = 1;
        

 
        success = clusterManagerBumpEpoch(owner);
        if (!success) goto cleanup;
        
 
        clusterManagerRemoveNodeFromList(migrating, owner);
        clusterManagerRemoveNodeFromList(importing, owner);
    }
    






 
    if (((owners)->len) > 1) {
        
 
        ((owner != ((void *)0)) ? (void) (0) : __assert_fail ("owner != NULL", "redis-cli.c", 4500, __extension__ __PRETTY_FUNCTION__));
        listRewind(owners, &li);
        while ((ln = listNext(&li)) != ((void *)0)) {
            clusterManagerNode *n = ln->value;
            if (n == owner) continue;
            success = clusterManagerDelSlot(n, slot, 1);
            if (!success) goto cleanup;
            n->slots[slot] = 0;
             
            success = clusterManagerSetSlot(n, owner, slot, "node", ((void *)0));
            if (!success) goto cleanup;
            success = clusterManagerSetSlot(n, owner, slot, "importing", ((void *)0));
            if (!success) goto cleanup;
             
            clusterManagerRemoveNodeFromList(importing, n);
            listAddNodeTail(importing, n);
             
            clusterManagerRemoveNodeFromList(migrating, n);
        }
    }
    int move_opts = 1 << 7;
    
 
    if (((migrating)->len) == 1 && ((importing)->len) == 1) {
        clusterManagerNode *src = ((migrating)->head)->value;
        clusterManagerNode *dst = ((importing)->head)->value;
        clusterManagerLog(1,">>> Case 1: Moving slot %d from " "%s:%d to %s:%d\n", slot, src->ip, src->port, dst->ip, dst->port);


        move_opts |= 1 << 2;
        success = clusterManagerMoveSlot(src, dst, slot, move_opts, ((void *)0));
    }
    


 
    else if (((migrating)->len) == 0 && ((importing)->len) > 0) {
        clusterManagerLog(1,">>> Case 2: Moving all the %d slot keys to its " "owner %s:%d\n", slot, owner->ip, owner->port);

        move_opts |= 1 << 1;
        listRewind(importing, &li);
        while ((ln = listNext(&li)) != ((void *)0)) {
            clusterManagerNode *n = ln->value;
            if (n == owner) continue;
            success = clusterManagerMoveSlot(n, owner, slot, move_opts, ((void *)0));
            if (!success) goto cleanup;
            clusterManagerLog(1,">>> Setting %d as STABLE in " "%s:%d\n", slot, n->ip, n->port);

            success = clusterManagerClearSlotStatus(n, slot);
            if (!success) goto cleanup;
        }
        
 
        listRewind(cluster_manager.nodes, &li);
        while ((ln = listNext(&li)) != ((void *)0)) {
            clusterManagerNode *n = ln->value;
            if (n == owner) continue;
            if (n->flags & 1 << 1) continue;
            success = clusterManagerSetSlot(n, owner, slot, "NODE", ((void *)0));
            if (!success) goto cleanup;
        }
    }
    







 
    else if (((migrating)->len) == 1 && ((importing)->len) > 1) {
        int try_to_fix = 1;
        clusterManagerNode *src = ((migrating)->head)->value;
        clusterManagerNode *dst = ((void *)0);
        sds target_id = ((void *)0);
        for (int i = 0; i < src->migrating_count; i += 2) {
            sds migrating_slot = src->migrating[i];
            if (atoi(migrating_slot) == slot) {
                target_id = src->migrating[i + 1];
                break;
            }
        }
        ((target_id != ((void *)0)) ? (void) (0) : __assert_fail ("target_id != NULL", "redis-cli.c", 4583, __extension__ __PRETTY_FUNCTION__));
        listIter li;
        listNode *ln;
        listRewind(importing, &li);
        while ((ln = listNext(&li)) != ((void *)0)) {
            clusterManagerNode *n = ln->value;
            int count = clusterManagerCountKeysInSlot(n, slot);
            if (count > 0) {
                try_to_fix = 0;
                break;
            }
            if (strcmp(n->name, target_id) == 0) dst = n;
        }
        if (!try_to_fix) goto unhandled_case;
        if (dst != ((void *)0)) {
            clusterManagerLog(1,">>> Case 3: Moving slot %d from %s:%d to " "%s:%d and closing it on all the other " "importing nodes.\n", slot, src->ip, src->port, dst->ip, dst->port);




             
            success = clusterManagerMoveSlot(src, dst, slot, move_opts, ((void *)0));
            if (!success) goto cleanup;
             
            listRewind(importing, &li);
            while ((ln = listNext(&li)) != ((void *)0)) {
                clusterManagerNode *n = ln->value;
                if (dst == n) continue;
                success = clusterManagerClearSlotStatus(n, slot);
                if (!success) goto cleanup;
            }
        } else {
            clusterManagerLog(1,">>> Case 3: Closing slot %d on both " "migrating and importing nodes.\n", slot);

            
 
            success = clusterManagerClearSlotStatus(src, slot);
            if (!success) goto cleanup;
            listRewind(importing, &li);
            while ((ln = listNext(&li)) != ((void *)0)) {
                clusterManagerNode *n = ln->value;
                success = clusterManagerClearSlotStatus(n, slot);
                if (!success) goto cleanup;
            }
        }
    } else {
        int try_to_close_slot = (((importing)->len) == 0 &&
                                 ((migrating)->len) == 1);
        if (try_to_close_slot) {
            clusterManagerNode *n = ((migrating)->head)->value;
            if (!owner || owner != n) {
                redisReply *r = (redisCommand(n->context, "CLUSTER GETKEYSINSLOT %d %d", slot, 10));

                success = clusterManagerCheckRedisReply(n, r, ((void *)0));
                if (r) {
                    if (success) try_to_close_slot = (r->elements == 0);
                    freeReplyObject(r);
                }
                if (!success) goto cleanup;
            }
        }
        


 
        if (try_to_close_slot) {
            clusterManagerNode *n = ((migrating)->head)->value;
            clusterManagerLog(1,">>> Case 4: Closing slot %d on %s:%d\n", slot, n->ip, n->port);

            redisReply *r = (redisCommand(n->context, "CLUSTER SETSLOT %d %s", slot, "STABLE"));

            success = clusterManagerCheckRedisReply(n, r, ((void *)0));
            if (r) freeReplyObject(r);
            if (!success) goto cleanup;
        } else {
unhandled_case:
            success = 0;
            clusterManagerLog(3,"[ERR] Sorry, redis-cli can't fix this slot " "yet (work in progress). Slot is set as " "migrating in %s, as importing in %s, " "owner is %s:%d\n", migrating_str, importing_str, owner->ip, owner->port);




        }
    }
cleanup:
    listRelease(owners);
    listRelease(migrating);
    listRelease(importing);
    sdsfree(migrating_str);
    sdsfree(importing_str);
    return success;
}

static int clusterManagerFixMultipleSlotOwners(int slot, list *owners) {
    clusterManagerLog(1,">>> Fixing multiple owners for slot %d...\n", slot);
    int success = 0;
    ((((owners)->len) > 1) ? (void) (0) : __assert_fail ("listLength(owners) > 1", "redis-cli.c", 4679, __extension__ __PRETTY_FUNCTION__));
    clusterManagerNode *owner = clusterManagerGetNodeWithMostKeysInSlot(owners,
                                                                        slot,
                                                                        ((void *)0));
    if (!owner) owner = ((owners)->head)->value;
    clusterManagerLog(1,">>> Setting slot %d owner: %s:%d\n", slot, owner->ip, owner->port);

     
    if (!clusterManagerSetSlotOwner(owner, slot, 0)) return 0;
    listIter li;
    listNode *ln;
    listRewind(cluster_manager.nodes, &li);
    

 
    while ((ln = listNext(&li)) != ((void *)0)) {
        clusterManagerNode *n = ln->value;
        if (n == owner) continue;
        if (n->flags & 1 << 1) continue;
        int count = clusterManagerCountKeysInSlot(n, slot);
        success = (count >= 0);
        if (!success) break;
        clusterManagerDelSlot(n, slot, 1);
        if (!clusterManagerSetSlot(n, owner, slot, "node", ((void *)0))) return 0;
        if (count > 0) {
            int opts = 1 << 7 |
                       1 << 1;
            success = clusterManagerMoveSlot(n, owner, slot, opts, ((void *)0));
            if (!success) break;
        }
    }
    return success;
}

static int clusterManagerCheckCluster(int quiet) {
    listNode *ln = ((cluster_manager . nodes)->head);
    if (!ln) return 0;
    clusterManagerNode *node = ln->value;
    clusterManagerLog(1,">>> Performing Cluster Check (using node %s:%d)\n", node ->ip, node ->port);

    int result = 1, consistent = 0;
    int do_fix = config.cluster_manager_command.flags &
                 1 << 0;
    if (!quiet) clusterManagerShowNodes();
    consistent = clusterManagerIsConfigConsistent();
    if (!consistent) {
        sds err = sdsnew("[ERR] Nodes don't agree about configuration!");
        clusterManagerOnError(err);
        result = 0;
    } else {
        clusterManagerLog(4,"[OK] All nodes agree about slots " "configuration.\n");

    }
     
    clusterManagerLog(1,">>> Check for open slots...\n");
    listIter li;
    listRewind(cluster_manager.nodes, &li);
    int i;
    dict *open_slots = ((void *)0);
    while ((ln = listNext(&li)) != ((void *)0)) {
        clusterManagerNode *n = ln->value;
        if (n->migrating != ((void *)0)) {
            if (open_slots == ((void *)0))
                open_slots = dictCreate(&clusterManagerDictType, ((void *)0));
            sds errstr = sdsempty();
            errstr = sdscatprintf(errstr,
                                "[WARNING] Node %s:%d has slots in "
                                "migrating state ",
                                n->ip,
                                n->port);
            for (i = 0; i < n->migrating_count; i += 2) {
                sds slot = n->migrating[i];
                dictReplace(open_slots, slot, sdsdup(n->migrating[i + 1]));
                char *fmt = (i > 0 ? ",%S" : "%S");
                errstr = sdscatfmt(errstr, fmt, slot);
            }
            errstr = sdscat(errstr, ".");
            clusterManagerOnError(errstr);
        }
        if (n->importing != ((void *)0)) {
            if (open_slots == ((void *)0))
                open_slots = dictCreate(&clusterManagerDictType, ((void *)0));
            sds errstr = sdsempty();
            errstr = sdscatprintf(errstr,
                                "[WARNING] Node %s:%d has slots in "
                                "importing state ",
                                n->ip,
                                n->port);
            for (i = 0; i < n->importing_count; i += 2) {
                sds slot = n->importing[i];
                dictReplace(open_slots, slot, sdsdup(n->importing[i + 1]));
                char *fmt = (i > 0 ? ",%S" : "%S");
                errstr = sdscatfmt(errstr, fmt, slot);
            }
            errstr = sdscat(errstr, ".");
            clusterManagerOnError(errstr);
        }
    }
    if (open_slots != ((void *)0)) {
        result = 0;
        dictIterator *iter = dictGetIterator(open_slots);
        dictEntry *entry;
        sds errstr = sdsnew("[WARNING] The following slots are open: ");
        i = 0;
        while ((entry = dictNext(iter)) != ((void *)0)) {
            sds slot = (sds) ((entry)->key);
            char *fmt = (i++ > 0 ? ",%S" : "%S");
            errstr = sdscatfmt(errstr, fmt, slot);
        }
        clusterManagerLog(3,"%s.\n", (char *) errstr);
        sdsfree(errstr);
        if (do_fix) {
             
            dictReleaseIterator(iter);
            iter = dictGetIterator(open_slots);
            while ((entry = dictNext(iter)) != ((void *)0)) {
                sds slot = (sds) ((entry)->key);
                result = clusterManagerFixOpenSlot(atoi(slot));
                if (!result) break;
            }
        }
        dictReleaseIterator(iter);
        dictRelease(open_slots);
    }
    clusterManagerLog(1,">>> Check slots coverage...\n");
    char slots[16384];
    memset(slots, 0, 16384);
    int coverage = clusterManagerGetCoveredSlots(slots);
    if (coverage == 16384) {
        clusterManagerLog(4,"[OK] All %d slots covered.\n", 16384);

    } else {
        sds err = sdsempty();
        err = sdscatprintf(err, "[ERR] Not all %d slots are "
                                "covered by nodes.\n",
                                16384);
        clusterManagerOnError(err);
        result = 0;
        if (do_fix ) {
            dictType dtype = clusterManagerDictType;
            dtype.keyDestructor = dictSdsDestructor;
            dtype.valDestructor = dictListDestructor;
            clusterManagerUncoveredSlots = dictCreate(&dtype, ((void *)0));
            int fixed = clusterManagerFixSlotsCoverage(slots);
            if (fixed > 0) result = 1;
        }
    }
    int search_multiple_owners = config.cluster_manager_command.flags &
                                 1 << 9;
    if (search_multiple_owners) {
        
 
        clusterManagerLog(1,">>> Check for multiple slot owners...\n");
        int slot = 0, slots_with_multiple_owners = 0;
        for (; slot < 16384; slot++) {
            listIter li;
            listNode *ln;
            listRewind(cluster_manager.nodes, &li);
            list *owners = listCreate();
            while ((ln = listNext(&li)) != ((void *)0)) {
                clusterManagerNode *n = ln->value;
                if (n->flags & 1 << 1) continue;
                if (n->slots[slot]) listAddNodeTail(owners, n);
                else {
                    
 
                    int count = clusterManagerCountKeysInSlot(n, slot);
                    if (count > 0) listAddNodeTail(owners, n);
                }
            }
            if (((owners)->len) > 1) {
                result = 0;
                clusterManagerLog(3,"[WARNING] Slot %d has %d owners:\n", slot, ((owners)->len));

                listRewind(owners, &li);
                while ((ln = listNext(&li)) != ((void *)0)) {
                    clusterManagerNode *n = ln->value;
                    clusterManagerLog(3,"    %s:%d\n", n->ip, n->port);
                }
                slots_with_multiple_owners++;
                if (do_fix) {
                    result = clusterManagerFixMultipleSlotOwners(slot, owners);
                    if (!result) {
                        clusterManagerLog(3,"Failed to fix multiple owners " "for slot %d\n", slot);

                        listRelease(owners);
                        break;
                    } else slots_with_multiple_owners--;
                }
            }
            listRelease(owners);
        }
        if (slots_with_multiple_owners == 0)
            clusterManagerLog(4,"[OK] No multiple owners found.\n");
    }
    return result;
}

static clusterManagerNode *clusterNodeForResharding(char *id,
                                                    clusterManagerNode *target,
                                                    int *raise_err)
{
    clusterManagerNode *node = ((void *)0);
    const char *invalid_node_msg = "*** The specified node (%s) is not known "
                                   "or not a master, please retry.\n";
    node = clusterManagerNodeByName(id);
    *raise_err = 0;
    if (!node || node->flags & 1 << 1) {
        clusterManagerLog(3,invalid_node_msg, id);
        *raise_err = 1;
        return ((void *)0);
    } else if (node != ((void *)0) && target != ((void *)0)) {
        if (!strcmp(node->name, target->name)) {
            clusterManagerLog(3,"*** It is not possible to use " "the target node as " "source node.\n");


            return ((void *)0);
        }
    }
    return node;
}

static list *clusterManagerComputeReshardTable(list *sources, int numslots) {
    list *moved = listCreate();
    int src_count = ((sources)->len), i = 0, tot_slots = 0, j;
    clusterManagerNode **sorted = zmalloc(src_count * sizeof(*sorted));
    listIter li;
    listNode *ln;
    listRewind(sources, &li);
    while ((ln = listNext(&li)) != ((void *)0)) {
        clusterManagerNode *node = ln->value;
        tot_slots += node->slots_count;
        sorted[i++] = node;
    }
    qsort(sorted, src_count, sizeof(clusterManagerNode *),
          clusterManagerSlotCountCompareDesc);
    for (i = 0; i < src_count; i++) {
        clusterManagerNode *node = sorted[i];
        float n = ((float) numslots / tot_slots * node->slots_count);
        if (i == 0) n = ceil(n);
        else n = floor(n);
        int max = (int) n, count = 0;
        for (j = 0; j < 16384; j++) {
            int slot = node->slots[j];
            if (!slot) continue;
            if (count >= max || (int)((moved)->len) >= numslots) break;
            clusterManagerReshardTableItem *item = zmalloc(sizeof(*item));
            item->source = node;
            item->slot = j;
            listAddNodeTail(moved, item);
            count++;
        }
    }
    zfree(sorted);
    return moved;
}

static void clusterManagerShowReshardTable(list *table) {
    listIter li;
    listNode *ln;
    listRewind(table, &li);
    while ((ln = listNext(&li)) != ((void *)0)) {
        clusterManagerReshardTableItem *item = ln->value;
        clusterManagerNode *n = item->source;
        printf("    Moving slot %d from %s\n", item->slot, (char *) n->name);
    }
}

static void clusterManagerReleaseReshardTable(list *table) {
    if (table != ((void *)0)) {
        listIter li;
        listNode *ln;
        listRewind(table, &li);
        while ((ln = listNext(&li)) != ((void *)0)) {
            clusterManagerReshardTableItem *item = ln->value;
            zfree(item);
        }
        listRelease(table);
    }
}

static void clusterManagerLog(int level, const char* fmt, ...) {
    int use_colors =
        (config.cluster_manager_command.flags & 1 << 8);
    if (use_colors) {
        printf("\033[");
        switch (level) {
        case 1: printf("29;1m"); break;
        case 2: printf("33;1m"); break;
        case 3: printf("31;1m"); break;
        case 4: printf("32;1m"); break;
        default: printf("0m"); break;
        }
    }
    va_list ap;
    (*(char* *)&(ap) = (char*)(&__builtin_va_alist));
    vprintf(fmt, ap);
    ((void)0);
    if (use_colors) printf("\033[" "0m");
}

static void clusterManagerNodeArrayInit(clusterManagerNodeArray *array,
                                        int alloc_len)
{
    array->nodes = zcalloc(alloc_len * sizeof(clusterManagerNode*));
    array->alloc = array->nodes;
    array->len = alloc_len;
    array->count = 0;
}


 
static void clusterManagerNodeArrayReset(clusterManagerNodeArray *array) {
    if (array->nodes > array->alloc) {
        array->len = array->nodes - array->alloc;
        array->nodes = array->alloc;
        array->count = 0;
        int i = 0;
        for(; i < array->len; i++) {
            if (array->nodes[i] != ((void *)0)) array->count++;
        }
    }
}

 
static void clusterManagerNodeArrayShift(clusterManagerNodeArray *array,
                                         clusterManagerNode **nodeptr)
{
    ((array->nodes < (array->nodes + array->len)) ? (void) (0) : __assert_fail ("array->nodes < (array->nodes + array->len)", "redis-cli.c", 5007, __extension__ __PRETTY_FUNCTION__));
     
    if (*array->nodes != ((void *)0)) array->count--;
     
    *nodeptr = *array->nodes;
     
    array->nodes++;
    array->len--;
}

static void clusterManagerNodeArrayAdd(clusterManagerNodeArray *array,
                                       clusterManagerNode *node)
{
    ((array->nodes < (array->nodes + array->len)) ? (void) (0) : __assert_fail ("array->nodes < (array->nodes + array->len)", "redis-cli.c", 5020, __extension__ __PRETTY_FUNCTION__));
    ((node != ((void *)0)) ? (void) (0) : __assert_fail ("node != NULL", "redis-cli.c", 5021, __extension__ __PRETTY_FUNCTION__));
    ((array->count < array->len) ? (void) (0) : __assert_fail ("array->count < array->len", "redis-cli.c", 5022, __extension__ __PRETTY_FUNCTION__));
    array->nodes[array->count++] = node;
}

static void clusterManagerPrintNotEmptyNodeError(clusterManagerNode *node,
                                                 char *err)
{
    char *msg;
    if (err) msg = err;
    else {
        msg = "is not empty. Either the node already knows other "
              "nodes (check with CLUSTER NODES) or contains some "
              "key in database 0.";
    }
    clusterManagerLog(3,"[ERR] Node %s:%d %s\n", node ->ip, node ->port, msg);
}

static void clusterManagerPrintNotClusterNodeError(clusterManagerNode *node,
                                                   char *err)
{
    char *msg = (err ? err : "is not configured as a cluster node.");
    clusterManagerLog(3,"[ERR] Node %s:%d %s\n", node ->ip, node ->port, msg);
}

 
static void clusterManagerMode(clusterManagerCommandProc *proc) {
    int argc = config.cluster_manager_command.argc;
    char **argv = config.cluster_manager_command.argv;
    cluster_manager.nodes = ((void *)0);
    if (!proc(argc, argv)) goto cluster_manager_err;
    freeClusterManager();
    exit(0);
cluster_manager_err:
    freeClusterManager();
    sdsfree(config.hostip);
    sdsfree(config.mb_delim);
    exit(1);
}

 

static int clusterManagerCommandCreate(int argc, char **argv) {
    int i, j, success = 1;
    cluster_manager.nodes = listCreate();
    for (i = 0; i < argc; i++) {
        char *addr = argv[i];
        char *c = strrchr(addr, '@');
        if (c != ((void *)0)) *c = '\0';
        c = strrchr(addr, ':');
        if (c == ((void *)0)) {
            fprintf(stderr, "Invalid address format: %s\n", addr);
            return 0;
        }
        *c = '\0';
        char *ip = addr;
        int port = atoi(++c);
        clusterManagerNode *node = clusterManagerNewNode(ip, port);
        if (!clusterManagerNodeConnect(node)) {
            freeClusterManagerNode(node);
            return 0;
        }
        char *err = ((void *)0);
        if (!clusterManagerNodeIsCluster(node, &err)) {
            clusterManagerPrintNotClusterNodeError(node, err);
            if (err) zfree(err);
            freeClusterManagerNode(node);
            return 0;
        }
        err = ((void *)0);
        if (!clusterManagerNodeLoadInfo(node, 0, &err)) {
            if (err) {
                clusterManagerLog(3,"Node %s:%d replied with error:\n%s\n", node ->ip, node ->port, err);;
                zfree(err);
            }
            freeClusterManagerNode(node);
            return 0;
        }
        err = ((void *)0);
        if (!clusterManagerNodeIsEmpty(node, &err)) {
            clusterManagerPrintNotEmptyNodeError(node, err);
            if (err) zfree(err);
            freeClusterManagerNode(node);
            return 0;
        }
        listAddNodeTail(cluster_manager.nodes, node);
    }
    int node_len = cluster_manager.nodes->len;
    int replicas = config.cluster_manager_command.replicas;
    int masters_count = (node_len/(replicas + 1));
    if (masters_count < 3) {
        clusterManagerLog(3,"*** ERROR: Invalid configuration for cluster creation.\n" "*** Redis Cluster requires at least 3 master nodes.\n" "*** This is not possible with %d nodes and %d replicas per node.", node_len, replicas);




        clusterManagerLog(3,"\n*** At least %d nodes are required.\n", 3 * (replicas + 1));

        return 0;
    }
    clusterManagerLog(1,">>> Performing hash slots allocation " "on %d nodes...\n", node_len);

    int interleaved_len = 0, ip_count = 0;
    clusterManagerNode **interleaved = zcalloc(node_len*sizeof(**interleaved));
    char **ips = zcalloc(node_len * sizeof(char*));
    clusterManagerNodeArray *ip_nodes = zcalloc(node_len * sizeof(*ip_nodes));
    listIter li;
    listNode *ln;
    listRewind(cluster_manager.nodes, &li);
    while ((ln = listNext(&li)) != ((void *)0)) {
        clusterManagerNode *n = ln->value;
        int found = 0;
        for (i = 0; i < ip_count; i++) {
            char *ip = ips[i];
            if (!strcmp(ip, n->ip)) {
                found = 1;
                break;
            }
        }
        if (!found) {
            ips[ip_count++] = n->ip;
        }
        clusterManagerNodeArray *node_array = &(ip_nodes[i]);
        if (node_array->nodes == ((void *)0))
            clusterManagerNodeArrayInit(node_array, node_len);
        clusterManagerNodeArrayAdd(node_array, n);
    }
    while (interleaved_len < node_len) {
        for (i = 0; i < ip_count; i++) {
            clusterManagerNodeArray *node_array = &(ip_nodes[i]);
            if (node_array->count > 0) {
                clusterManagerNode *n = ((void *)0);
                clusterManagerNodeArrayShift(node_array, &n);
                interleaved[interleaved_len++] = n;
            }
        }
    }
    clusterManagerNode **masters = interleaved;
    interleaved += masters_count;
    interleaved_len -= masters_count;
    float slots_per_node = 16384 / (float) masters_count;
    long first = 0;
    float cursor = 0.0f;
    for (i = 0; i < masters_count; i++) {
        clusterManagerNode *master = masters[i];
        long last = lround(cursor + slots_per_node - 1);
        if (last > 16384 || i == (masters_count - 1))
            last = 16384 - 1;
        if (last < first) last = first;
        printf("Master[%d] -> Slots %lu - %lu\n", i, first, last);
        master->slots_count = 0;
        for (j = first; j <= last; j++) {
            master->slots[j] = 1;
            master->slots_count++;
        }
        master->dirty = 1;
        first = last + 1;
        cursor += slots_per_node;
    }

    
 
    clusterManagerNode *first_node = interleaved[0];
    for (i = 0; i < (interleaved_len - 1); i++)
        interleaved[i] = interleaved[i + 1];
    interleaved[interleaved_len - 1] = first_node;
    int assign_unused = 0, available_count = interleaved_len;
assign_replicas:
    for (i = 0; i < masters_count; i++) {
        clusterManagerNode *master = masters[i];
        int assigned_replicas = 0;
        while (assigned_replicas < replicas) {
            if (available_count == 0) break;
            clusterManagerNode *found = ((void *)0), *slave = ((void *)0);
            int firstNodeIdx = -1;
            for (j = 0; j < interleaved_len; j++) {
                clusterManagerNode *n = interleaved[j];
                if (n == ((void *)0)) continue;
                if (strcmp(n->ip, master->ip)) {
                    found = n;
                    interleaved[j] = ((void *)0);
                    break;
                }
                if (firstNodeIdx < 0) firstNodeIdx = j;
            }
            if (found) slave = found;
            else if (firstNodeIdx >= 0) {
                slave = interleaved[firstNodeIdx];
                interleaved_len -= (interleaved - (interleaved + firstNodeIdx));
                interleaved += (firstNodeIdx + 1);
            }
            if (slave != ((void *)0)) {
                assigned_replicas++;
                available_count--;
                if (slave->replicate) sdsfree(slave->replicate);
                slave->replicate = sdsnew(master->name);
                slave->dirty = 1;
            } else break;
            printf("Adding replica %s:%d to %s:%d\n", slave->ip, slave->port,
                   master->ip, master->port);
            if (assign_unused) break;
        }
    }
    if (!assign_unused && available_count > 0) {
        assign_unused = 1;
        printf("Adding extra replicas...\n");
        goto assign_replicas;
    }
    for (i = 0; i < ip_count; i++) {
        clusterManagerNodeArray *node_array = ip_nodes + i;
        clusterManagerNodeArrayReset(node_array);
    }
    clusterManagerOptimizeAntiAffinity(ip_nodes, ip_count);
    clusterManagerShowNodes();
    if (confirmWithYes("Can I set the above configuration?")) {
        listRewind(cluster_manager.nodes, &li);
        while ((ln = listNext(&li)) != ((void *)0)) {
            clusterManagerNode *node = ln->value;
            char *err = ((void *)0);
            int flushed = clusterManagerFlushNodeConfig(node, &err);
            if (!flushed && node->dirty && !node->replicate) {
                if (err != ((void *)0)) {
                    clusterManagerLog(3,"Node %s:%d replied with error:\n%s\n", node ->ip, node ->port, err);;
                    zfree(err);
                }
                success = 0;
                goto cleanup;
            } else if (err != ((void *)0)) zfree(err);
        }
        clusterManagerLog(1,">>> Nodes configuration updated\n");
        clusterManagerLog(1,">>> Assign a different config epoch to " "each node\n");

        int config_epoch = 1;
        listRewind(cluster_manager.nodes, &li);
        while ((ln = listNext(&li)) != ((void *)0)) {
            clusterManagerNode *node = ln->value;
            redisReply *reply = ((void *)0);
            reply = (redisCommand(node ->context, "cluster set-config-epoch %d", config_epoch++));


            if (reply != ((void *)0)) freeReplyObject(reply);
        }
        clusterManagerLog(1,">>> Sending CLUSTER MEET messages to join " "the cluster\n");

        clusterManagerNode *first = ((void *)0);
        listRewind(cluster_manager.nodes, &li);
        while ((ln = listNext(&li)) != ((void *)0)) {
            clusterManagerNode *node = ln->value;
            if (first == ((void *)0)) {
                first = node;
                continue;
            }
            redisReply *reply = ((void *)0);
            reply = (redisCommand(node ->context, "cluster meet %s %d", first->ip, first->port));

            int is_err = 0;
            if (reply != ((void *)0)) {
                if ((is_err = reply->type == 6))
                    clusterManagerLog(3,"Node %s:%d replied with error:\n%s\n", node ->ip, node ->port, reply->str);;
                freeReplyObject(reply);
            } else {
                is_err = 1;
                fprintf(stderr, "Failed to send CLUSTER MEET command.\n");
            }
            if (is_err) {
                success = 0;
                goto cleanup;
            }
        }
        

 
        sleep(1);
        clusterManagerWaitForClusterJoin();
         
        listRewind(cluster_manager.nodes, &li);
        while ((ln = listNext(&li)) != ((void *)0)) {
            clusterManagerNode *node = ln->value;
            if (!node->dirty) continue;
            char *err = ((void *)0);
            int flushed = clusterManagerFlushNodeConfig(node, &err);
            if (!flushed && !node->replicate) {
                if (err != ((void *)0)) {
                    clusterManagerLog(3,"Node %s:%d replied with error:\n%s\n", node ->ip, node ->port, err);;
                    zfree(err);
                }
                success = 0;
                goto cleanup;
            }
        }
        
        listRewind(cluster_manager.nodes, &li);
        clusterManagerNode *first_node = ((void *)0);
        while ((ln = listNext(&li)) != ((void *)0)) {
            clusterManagerNode *node = ln->value;
            if (!first_node) first_node = node;
            else freeClusterManagerNode(node);
        }
        listEmpty(cluster_manager.nodes);
        if (!clusterManagerLoadInfoFromNode(first_node, 0)) {
            success = 0;
            goto cleanup;
        }
        clusterManagerCheckCluster(0);
    }
cleanup:
     
    zfree(masters);
    zfree(ips);
    for (i = 0; i < node_len; i++) {
        clusterManagerNodeArray *node_array = ip_nodes + i;
        zfree(node_array->alloc);
    }
    zfree(ip_nodes);
    return success;
}

static int clusterManagerCommandAddNode(int argc, char **argv) {
    int success = 1;
    redisReply *reply = ((void *)0);
    char *ref_ip = ((void *)0), *ip = ((void *)0);
    int ref_port = 0, port = 0;
    if (!getClusterHostFromCmdArgs(argc - 1, argv + 1, &ref_ip, &ref_port))
        goto invalid_args;
    if (!getClusterHostFromCmdArgs(1, argv, &ip, &port))
        goto invalid_args;
    clusterManagerLog(1,">>> Adding node %s:%d to cluster %s:%d\n", ip, port, ref_ip, ref_port);

    
    clusterManagerNode *refnode = clusterManagerNewNode(ref_ip, ref_port);
    if (!clusterManagerLoadInfoFromNode(refnode, 0)) return 0;
    if (!clusterManagerCheckCluster(0)) return 0;

    
 
    clusterManagerNode *master_node = ((void *)0);
    if (config.cluster_manager_command.flags & 1 << 1) {
        char *master_id = config.cluster_manager_command.master_id;
        if (master_id != ((void *)0)) {
            master_node = clusterManagerNodeByName(master_id);
            if (master_node == ((void *)0)) {
                clusterManagerLog(3,"[ERR] No such master ID %s\n", master_id);
                return 0;
            }
        } else {
            master_node = clusterManagerNodeWithLeastReplicas();
            ((master_node != ((void *)0)) ? (void) (0) : __assert_fail ("master_node != NULL", "redis-cli.c", 5367, __extension__ __PRETTY_FUNCTION__));
            printf("Automatically selected master %s:%d\n", master_node->ip,
                   master_node->port);
        }
    }

    
    clusterManagerNode *new_node = clusterManagerNewNode(ip, port);
    int added = 0;
    if (!clusterManagerNodeConnect(new_node)) {
        clusterManagerLog(3,"[ERR] Sorry, can't connect to node %s:%d\n", ip, port);

        success = 0;
        goto cleanup;
    }
    char *err = ((void *)0);
    if (!(success = clusterManagerNodeIsCluster(new_node, &err))) {
        clusterManagerPrintNotClusterNodeError(new_node, err);
        if (err) zfree(err);
        goto cleanup;
    }
    if (!clusterManagerNodeLoadInfo(new_node, 0, &err)) {
        if (err) {
            clusterManagerLog(3,"Node %s:%d replied with error:\n%s\n", new_node ->ip, new_node ->port, err);;
            zfree(err);
        }
        success = 0;
        goto cleanup;
    }
    if (!(success = clusterManagerNodeIsEmpty(new_node, &err))) {
        clusterManagerPrintNotEmptyNodeError(new_node, err);
        if (err) zfree(err);
        goto cleanup;
    }
    clusterManagerNode *first = ((cluster_manager . nodes)->head)->value;
    listAddNodeTail(cluster_manager.nodes, new_node);
    added = 1;

    
    clusterManagerLog(1,">>> Send CLUSTER MEET to node %s:%d to make it " "join the cluster.\n", ip, port);

    reply = (redisCommand(new_node ->context, "CLUSTER MEET %s %d", first->ip, first->port));

    if (!(success = clusterManagerCheckRedisReply(new_node, reply, ((void *)0))))
        goto cleanup;

     
    if (master_node) {
        sleep(1);
        clusterManagerWaitForClusterJoin();
        clusterManagerLog(1,">>> Configure node as replica of %s:%d.\n", master_node ->ip, master_node ->port);

        freeReplyObject(reply);
        reply = (redisCommand(new_node ->context, "CLUSTER REPLICATE %s", master_node ->name));

        if (!(success = clusterManagerCheckRedisReply(new_node, reply, ((void *)0))))
            goto cleanup;
    }
    clusterManagerLog(4,"[OK] New node added correctly.\n");
cleanup:
    if (!added && new_node) freeClusterManagerNode(new_node);
    if (reply) freeReplyObject(reply);
    return success;
invalid_args:
    fprintf(stderr, "[ERR] Invalid arguments: you need to pass either a valid " "address (ie. 120.0.0.1:7000) or space separated IP " "and port (ie. 120.0.0.1 7000)\n");
    return 0;
}

static int clusterManagerCommandDeleteNode(int argc, char **argv) {
    ((void) argc);
    int success = 1;
    int port = 0;
    char *ip = ((void *)0);
    if (!getClusterHostFromCmdArgs(1, argv, &ip, &port)) goto invalid_args;
    char *node_id = argv[1];
    clusterManagerLog(1,">>> Removing node %s from cluster %s:%d\n", node_id, ip, port);

    clusterManagerNode *ref_node = clusterManagerNewNode(ip, port);
    clusterManagerNode *node = ((void *)0);

    
    if (!clusterManagerLoadInfoFromNode(ref_node, 0)) return 0;

    
    node = clusterManagerNodeByName(node_id);
    if (node == ((void *)0)) {
        clusterManagerLog(3,"[ERR] No such node ID %s\n", node_id);
        return 0;
    }
    if (node->slots_count != 0) {
        clusterManagerLog(3,"[ERR] Node %s:%d is not empty! Reshard data " "away and try again.\n", node ->ip, node ->port);

        return 0;
    }

    
    clusterManagerLog(1,">>> Sending CLUSTER FORGET messages to the " "cluster...\n");

    listIter li;
    listNode *ln;
    listRewind(cluster_manager.nodes, &li);
    while ((ln = listNext(&li)) != ((void *)0)) {
        clusterManagerNode *n = ln->value;
        if (n == node) continue;
        if (n->replicate && !strcasecmp(n->replicate, node_id)) {
            
            clusterManagerNode *master = clusterManagerNodeWithLeastReplicas();
            ((master != ((void *)0)) ? (void) (0) : __assert_fail ("master != NULL", "redis-cli.c", 5474, __extension__ __PRETTY_FUNCTION__));
            clusterManagerLog(1,">>> %s:%d as replica of %s:%d\n", n->ip, n->port, master->ip, master->port);

            redisReply *r = (redisCommand(n->context, "CLUSTER REPLICATE %s", master->name));

            success = clusterManagerCheckRedisReply(n, r, ((void *)0));
            if (r) freeReplyObject(r);
            if (!success) return 0;
        }
        redisReply *r = (redisCommand(n->context, "CLUSTER FORGET %s", node_id));

        success = clusterManagerCheckRedisReply(n, r, ((void *)0));
        if (r) freeReplyObject(r);
        if (!success) return 0;
    }

     
    clusterManagerLog(1,">>> Sending CLUSTER RESET SOFT to the " "deleted node.\n");

    redisReply *r = redisCommand(node->context, "CLUSTER RESET %s", "SOFT");
    success = clusterManagerCheckRedisReply(node, r, ((void *)0));
    if (r) freeReplyObject(r);
    return success;
invalid_args:
    fprintf(stderr, "[ERR] Invalid arguments: you need to pass either a valid " "address (ie. 120.0.0.1:7000) or space separated IP " "and port (ie. 120.0.0.1 7000)\n");
    return 0;
}

static int clusterManagerCommandInfo(int argc, char **argv) {
    int port = 0;
    char *ip = ((void *)0);
    if (!getClusterHostFromCmdArgs(argc, argv, &ip, &port)) goto invalid_args;
    clusterManagerNode *node = clusterManagerNewNode(ip, port);
    if (!clusterManagerLoadInfoFromNode(node, 0)) return 0;
    clusterManagerShowClusterInfo();
    return 1;
invalid_args:
    fprintf(stderr, "[ERR] Invalid arguments: you need to pass either a valid " "address (ie. 120.0.0.1:7000) or space separated IP " "and port (ie. 120.0.0.1 7000)\n");
    return 0;
}

static int clusterManagerCommandCheck(int argc, char **argv) {
    int port = 0;
    char *ip = ((void *)0);
    if (!getClusterHostFromCmdArgs(argc, argv, &ip, &port)) goto invalid_args;
    clusterManagerNode *node = clusterManagerNewNode(ip, port);
    if (!clusterManagerLoadInfoFromNode(node, 0)) return 0;
    clusterManagerShowClusterInfo();
    return clusterManagerCheckCluster(0);
invalid_args:
    fprintf(stderr, "[ERR] Invalid arguments: you need to pass either a valid " "address (ie. 120.0.0.1:7000) or space separated IP " "and port (ie. 120.0.0.1 7000)\n");
    return 0;
}

static int clusterManagerCommandFix(int argc, char **argv) {
    config.cluster_manager_command.flags |= 1 << 0;
    return clusterManagerCommandCheck(argc, argv);
}

static int clusterManagerCommandReshard(int argc, char **argv) {
    int port = 0;
    char *ip = ((void *)0);
    if (!getClusterHostFromCmdArgs(argc, argv, &ip, &port)) goto invalid_args;
    clusterManagerNode *node = clusterManagerNewNode(ip, port);
    if (!clusterManagerLoadInfoFromNode(node, 0)) return 0;
    clusterManagerCheckCluster(0);
    if (cluster_manager.errors && ((cluster_manager . errors)->len) > 0) {
        fflush(stdout);
        fprintf(stderr,
                "*** Please fix your cluster problems before resharding\n");
        return 0;
    }
    int slots = config.cluster_manager_command.slots;
    if (!slots) {
        while (slots <= 0 || slots > 16384) {
            printf("How many slots do you want to move (from 1 to %d)? ",
                   16384);
            fflush(stdout);
            char buf[6];
            int nread = read(fileno(stdin),buf,6);
            if (nread <= 0) continue;
            int last_idx = nread - 1;
            if (buf[last_idx] != '\n') {
                int ch;
                while ((ch = getchar()) != '\n' && ch != (-1)) {}
            }
            buf[last_idx] = '\0';
            slots = atoi(buf);
        }
    }
    char buf[255];
    char *to = config.cluster_manager_command.to,
         *from = config.cluster_manager_command.from;
    while (to == ((void *)0)) {
        printf("What is the receiving node ID? ");
        fflush(stdout);
        int nread = read(fileno(stdin),buf,255);
        if (nread <= 0) continue;
        int last_idx = nread - 1;
        if (buf[last_idx] != '\n') {
            int ch;
            while ((ch = getchar()) != '\n' && ch != (-1)) {}
        }
        buf[last_idx] = '\0';
        if (strlen(buf) > 0) to = buf;
    }
    int raise_err = 0;
    clusterManagerNode *target = clusterNodeForResharding(to, ((void *)0), &raise_err);
    if (target == ((void *)0)) return 0;
    list *sources = listCreate();
    list *table = ((void *)0);
    int all = 0, result = 1;
    if (from == ((void *)0)) {
        printf("Please enter all the source node IDs.\n");
        printf("  Type 'all' to use all the nodes as source nodes for "
               "the hash slots.\n");
        printf("  Type 'done' once you entered all the source nodes IDs.\n");
        while (1) {
            printf("Source node #%lu: ", ((sources)->len) + 1);
            fflush(stdout);
            int nread = read(fileno(stdin),buf,255);
            if (nread <= 0) continue;
            int last_idx = nread - 1;
            if (buf[last_idx] != '\n') {
                int ch;
                while ((ch = getchar()) != '\n' && ch != (-1)) {}
            }
            buf[last_idx] = '\0';
            if (!strcmp(buf, "done")) break;
            else if (!strcmp(buf, "all")) {
                all = 1;
                break;
            } else {
                clusterManagerNode *src =
                    clusterNodeForResharding(buf, target, &raise_err);
                if (src != ((void *)0)) listAddNodeTail(sources, src);
                else if (raise_err) {
                    result = 0;
                    goto cleanup;
                }
            }
        }
    } else {
        char *p;
        while((p = strchr(from, ',')) != ((void *)0)) {
            *p = '\0';
            if (!strcmp(from, "all")) {
                all = 1;
                break;
            } else {
                clusterManagerNode *src =
                    clusterNodeForResharding(from, target, &raise_err);
                if (src != ((void *)0)) listAddNodeTail(sources, src);
                else if (raise_err) {
                    result = 0;
                    goto cleanup;
                }
            }
            from = p + 1;
        }
         
        if (!all && strlen(from) > 0) {
            if (!strcmp(from, "all")) all = 1;
            if (!all) {
                clusterManagerNode *src =
                    clusterNodeForResharding(from, target, &raise_err);
                if (src != ((void *)0)) listAddNodeTail(sources, src);
                else if (raise_err) {
                    result = 0;
                    goto cleanup;
                }
            }
        }
    }
    listIter li;
    listNode *ln;
    if (all) {
        listEmpty(sources);
        listRewind(cluster_manager.nodes, &li);
        while ((ln = listNext(&li)) != ((void *)0)) {
            clusterManagerNode *n = ln->value;
            if (n->flags & 1 << 1 || n->replicate)
                continue;
            if (!sdscmp(n->name, target->name)) continue;
            listAddNodeTail(sources, n);
        }
    }
    if (((sources)->len) == 0) {
        fprintf(stderr, "*** No source nodes given, operation aborted.\n");
        result = 0;
        goto cleanup;
    }
    printf("\nReady to move %d slots.\n", slots);
    printf("  Source nodes:\n");
    listRewind(sources, &li);
    while ((ln = listNext(&li)) != ((void *)0)) {
        clusterManagerNode *src = ln->value;
        sds info = clusterManagerNodeInfo(src, 4);
        printf("%s\n", info);
        sdsfree(info);
    }
    printf("  Destination node:\n");
    sds info = clusterManagerNodeInfo(target, 4);
    printf("%s\n", info);
    sdsfree(info);
    table = clusterManagerComputeReshardTable(sources, slots);
    printf("  Resharding plan:\n");
    clusterManagerShowReshardTable(table);
    if (!(config.cluster_manager_command.flags &
          1 << 2))
    {
        printf("Do you want to proceed with the proposed "
               "reshard plan (yes/no)? ");
        fflush(stdout);
        char buf[4];
        int nread = read(fileno(stdin),buf,4);
        buf[3] = '\0';
        if (nread <= 0 || strcmp("yes", buf) != 0) {
            result = 0;
            goto cleanup;
        }
    }
    int opts = 1 << 7;
    listRewind(table, &li);
    while ((ln = listNext(&li)) != ((void *)0)) {
        clusterManagerReshardTableItem *item = ln->value;
        char *err = ((void *)0);
        result = clusterManagerMoveSlot(item->source, target, item->slot,
                                        opts, &err);
        if (!result) {
            if (err != ((void *)0)) {
                
                zfree(err);
            }
            goto cleanup;
        }
    }
cleanup:
    listRelease(sources);
    clusterManagerReleaseReshardTable(table);
    return result;
invalid_args:
    fprintf(stderr, "[ERR] Invalid arguments: you need to pass either a valid " "address (ie. 120.0.0.1:7000) or space separated IP " "and port (ie. 120.0.0.1 7000)\n");
    return 0;
}

static int clusterManagerCommandRebalance(int argc, char **argv) {
    int port = 0;
    char *ip = ((void *)0);
    clusterManagerNode **weightedNodes = ((void *)0);
    list *involved = ((void *)0);
    if (!getClusterHostFromCmdArgs(argc, argv, &ip, &port)) goto invalid_args;
    clusterManagerNode *node = clusterManagerNewNode(ip, port);
    if (!clusterManagerLoadInfoFromNode(node, 0)) return 0;
    int result = 1, i;
    if (config.cluster_manager_command.weight != ((void *)0)) {
        for (i = 0; i < config.cluster_manager_command.weight_argc; i++) {
            char *name = config.cluster_manager_command.weight[i];
            char *p = strchr(name, '=');
            if (p == ((void *)0)) {
                result = 0;
                goto cleanup;
            }
            *p = '\0';
            float w = atof(++p);
            clusterManagerNode *n = clusterManagerNodeByAbbreviatedName(name);
            if (n == ((void *)0)) {
                clusterManagerLog(3,"*** No such master node %s\n", name);
                result = 0;
                goto cleanup;
            }
            n->weight = w;
        }
    }
    float total_weight = 0;
    int nodes_involved = 0;
    int use_empty = config.cluster_manager_command.flags &
                    1 << 4;
    involved = listCreate();
    listIter li;
    listNode *ln;
    listRewind(cluster_manager.nodes, &li);
     
    while ((ln = listNext(&li)) != ((void *)0)) {
        clusterManagerNode *n = ln->value;
        if (n->flags & 1 << 1 || n->replicate)
            continue;
        if (!use_empty && n->slots_count == 0) {
            n->weight = 0;
            continue;
        }
        total_weight += n->weight;
        nodes_involved++;
        listAddNodeTail(involved, n);
    }
    weightedNodes = zmalloc(nodes_involved * sizeof(clusterManagerNode *));
    if (weightedNodes == ((void *)0)) goto cleanup;
     
    clusterManagerCheckCluster(1);
    if (cluster_manager.errors && ((cluster_manager . errors)->len) > 0) {
        clusterManagerLog(3,"*** Please fix your cluster problems " "before rebalancing\n");

        result = 0;
        goto cleanup;
    }
    

 
    int threshold_reached = 0, total_balance = 0;
    float threshold = config.cluster_manager_command.threshold;
    i = 0;
    listRewind(involved, &li);
    while ((ln = listNext(&li)) != ((void *)0)) {
        clusterManagerNode *n = ln->value;
        weightedNodes[i++] = n;
        int expected = (int) (((float)16384 / total_weight) *
                        n->weight);
        n->balance = n->slots_count - expected;
        total_balance += n->balance;
        

 
        int over_threshold = 0;
        if (threshold > 0) {
            if (n->slots_count > 0) {
                float err_perc = fabs((100-(100.0*expected/n->slots_count)));
                if (err_perc > threshold) over_threshold = 1;
            } else if (expected > 1) {
                over_threshold = 1;
            }
        }
        if (over_threshold) threshold_reached = 1;
    }
    if (!threshold_reached) {
        clusterManagerLog(2,"*** No rebalancing needed! " "All nodes are within the %.2f%% threshold.\n", config . cluster_manager_command . threshold);


        goto cleanup;
    }
    

 
    while (total_balance > 0) {
        listRewind(involved, &li);
        while ((ln = listNext(&li)) != ((void *)0)) {
            clusterManagerNode *n = ln->value;
            if (n->balance <= 0 && total_balance > 0) {
                n->balance--;
                total_balance--;
            }
        }
    }
     
    qsort(weightedNodes, nodes_involved, sizeof(clusterManagerNode *),
          clusterManagerCompareNodeBalance);
    clusterManagerLog(1,">>> Rebalancing across %d nodes. " "Total weight = %.2f\n", nodes_involved, total_weight);


    if (config.verbose) {
        for (i = 0; i < nodes_involved; i++) {
            clusterManagerNode *n = weightedNodes[i];
            printf("%s:%d balance is %d slots\n", n->ip, n->port, n->balance);
        }
    }
    



 
    int dst_idx = 0;
    int src_idx = nodes_involved - 1;
    int simulate = config.cluster_manager_command.flags &
                   1 << 5;
    while (dst_idx < src_idx) {
        clusterManagerNode *dst = weightedNodes[dst_idx];
        clusterManagerNode *src = weightedNodes[src_idx];
        int db = abs(dst->balance);
        int sb = abs(src->balance);
        int numslots = (db < sb ? db : sb);
        if (numslots > 0) {
            printf("Moving %d slots from %s:%d to %s:%d\n", numslots,
                                                            src->ip,
                                                            src->port,
                                                            dst->ip,
                                                            dst->port);
             
            list *lsrc = listCreate(), *table = ((void *)0);
            listAddNodeTail(lsrc, src);
            table = clusterManagerComputeReshardTable(lsrc, numslots);
            listRelease(lsrc);
            int table_len = (int) ((table)->len);
            if (!table || table_len != numslots) {
                clusterManagerLog(3,"*** Assertion failed: Reshard table " "!= number of slots");

                result = 0;
                goto end_move;
            }
            if (simulate) {
                for (i = 0; i < table_len; i++) printf("#");
            } else {
                int opts = 1 << 6 |
                           1 << 2;
                listRewind(table, &li);
                while ((ln = listNext(&li)) != ((void *)0)) {
                    clusterManagerReshardTableItem *item = ln->value;
                    result = clusterManagerMoveSlot(item->source,
                                                    dst,
                                                    item->slot,
                                                    opts, ((void *)0));
                    if (!result) goto end_move;
                    printf("#");
                    fflush(stdout);
                }

            }
            printf("\n");
end_move:
            clusterManagerReleaseReshardTable(table);
            if (!result) goto cleanup;
        }
         
        dst->balance += numslots;
        src->balance -= numslots;
        if (dst->balance == 0) dst_idx++;
        if (src->balance == 0) src_idx --;
    }
cleanup:
    if (involved != ((void *)0)) listRelease(involved);
    if (weightedNodes != ((void *)0)) zfree(weightedNodes);
    return result;
invalid_args:
    fprintf(stderr, "[ERR] Invalid arguments: you need to pass either a valid " "address (ie. 120.0.0.1:7000) or space separated IP " "and port (ie. 120.0.0.1 7000)\n");
    return 0;
}

static int clusterManagerCommandSetTimeout(int argc, char **argv) {
    ((void) argc);
    int port = 0;
    char *ip = ((void *)0);
    if (!getClusterHostFromCmdArgs(1, argv, &ip, &port)) goto invalid_args;
    int timeout = atoi(argv[1]);
    if (timeout < 100) {
        fprintf(stderr, "Setting a node timeout of less than 100 "
                "milliseconds is a bad idea.\n");
        return 0;
    }
    
    clusterManagerNode *node = clusterManagerNewNode(ip, port);
    if (!clusterManagerLoadInfoFromNode(node, 0)) return 0;
    int ok_count = 0, err_count = 0;

    clusterManagerLog(1,">>> Reconfiguring node timeout in every " "cluster node...\n");

    listIter li;
    listNode *ln;
    listRewind(cluster_manager.nodes, &li);
    while ((ln = listNext(&li)) != ((void *)0)) {
        clusterManagerNode *n = ln->value;
        char *err = ((void *)0);
        redisReply *reply = (redisCommand(n->context, "CONFIG %s %s %d", "SET", "cluster-node-timeout", timeout));



        if (reply == ((void *)0)) goto reply_err;
        int ok = clusterManagerCheckRedisReply(n, reply, &err);
        freeReplyObject(reply);
        if (!ok) goto reply_err;
        reply = (redisCommand(n->context, "CONFIG %s", "REWRITE"));
        if (reply == ((void *)0)) goto reply_err;
        ok = clusterManagerCheckRedisReply(n, reply, &err);
        freeReplyObject(reply);
        if (!ok) goto reply_err;
        clusterManagerLog(2,"*** New timeout set for %s:%d\n", n->ip, n->port);

        ok_count++;
        continue;
reply_err:;
        int need_free = 0;
        if (err == ((void *)0)) err = "";
        else need_free = 1;
        clusterManagerLog(3,"ERR setting node-timeot for %s:%d: %s\n", n->ip, n->port, err);

        if (need_free) zfree(err);
        err_count++;
    }
    clusterManagerLog(1,">>> New node timeout set. %d OK, %d ERR.\n", ok_count, err_count);

    return 1;
invalid_args:
    fprintf(stderr, "[ERR] Invalid arguments: you need to pass either a valid " "address (ie. 120.0.0.1:7000) or space separated IP " "and port (ie. 120.0.0.1 7000)\n");
    return 0;
}

static int clusterManagerCommandImport(int argc, char **argv) {
    int success = 1;
    int port = 0, src_port = 0;
    char *ip = ((void *)0), *src_ip = ((void *)0);
    char *invalid_args_msg = ((void *)0);
    if (!getClusterHostFromCmdArgs(argc, argv, &ip, &port)) {
        invalid_args_msg = "[ERR] Invalid arguments: you need to pass either a valid " "address (ie. 120.0.0.1:7000) or space separated IP " "and port (ie. 120.0.0.1 7000)\n";
        goto invalid_args;
    }
    if (config.cluster_manager_command.from == ((void *)0)) {
        invalid_args_msg = "[ERR] Option '--cluster-from' is required for "
                           "subcommand 'import'.\n";
        goto invalid_args;
    }
    char *src_host[] = {config.cluster_manager_command.from};
    if (!getClusterHostFromCmdArgs(1, src_host, &src_ip, &src_port)) {
        invalid_args_msg = "[ERR] Invalid --cluster-from host. You need to "
                           "pass a valid address (ie. 120.0.0.1:7000).\n";
        goto invalid_args;
    }
    clusterManagerLog(1,">>> Importing data from %s:%d to cluster %s:%d\n", src_ip, src_port, ip, port);


    clusterManagerNode *refnode = clusterManagerNewNode(ip, port);
    if (!clusterManagerLoadInfoFromNode(refnode, 0)) return 0;
    if (!clusterManagerCheckCluster(0)) return 0;
    char *reply_err = ((void *)0);
    redisReply *src_reply = ((void *)0);
    
    redisContext *src_ctx = redisConnect(src_ip, src_port);
    if (src_ctx->err) {
        success = 0;
        fprintf(stderr,"Could not connect to Redis at %s:%d: %s.\n", src_ip,
                src_port, src_ctx->errstr);
        goto cleanup;
    }
    src_reply = reconnectingRedisCommand(src_ctx, "INFO");
    if (!src_reply || src_reply->type == 6) {
        if (src_reply && src_reply->str) reply_err = src_reply->str;
        success = 0;
        goto cleanup;
    }
    if (getLongInfoField(src_reply->str, "cluster_enabled")) {
        clusterManagerLog(3,"[ERR] The source node should not be a " "cluster node.\n");

        success = 0;
        goto cleanup;
    }
    freeReplyObject(src_reply);
    src_reply = reconnectingRedisCommand(src_ctx, "DBSIZE");
    if (!src_reply || src_reply->type == 6) {
        if (src_reply && src_reply->str) reply_err = src_reply->str;
        success = 0;
        goto cleanup;
    }
    int size = src_reply->integer, i;
    clusterManagerLog(2,"*** Importing %d keys from DB 0\n", size);

    
    clusterManagerNode  *slots_map[16384];
    memset(slots_map, 0, sizeof(slots_map));
    listIter li;
    listNode *ln;
    for (i = 0; i < 16384; i++) {
        listRewind(cluster_manager.nodes, &li);
        while ((ln = listNext(&li)) != ((void *)0)) {
            clusterManagerNode *n = ln->value;
            if (n->flags & 1 << 1) continue;
            if (n->slots_count == 0) continue;
            if (n->slots[i]) {
                slots_map[i] = n;
                break;
            }
        }
    }

    char cmdfmt[50] = "MIGRATE %s %d %s %d %d";
    if (config.cluster_manager_command.flags & 1 << 7)
        strcat(cmdfmt, " %s");
    if (config.cluster_manager_command.flags & 1 << 6)
        strcat(cmdfmt, " %s");

    
 
    int cursor = -999, timeout = config.cluster_manager_command.timeout;
    while (cursor != 0) {
        if (cursor < 0) cursor = 0;
        freeReplyObject(src_reply);
        src_reply = reconnectingRedisCommand(src_ctx, "SCAN %d COUNT %d",
                                             cursor, 1000);
        if (!src_reply || src_reply->type == 6) {
            if (src_reply && src_reply->str) reply_err = src_reply->str;
            success = 0;
            goto cleanup;
        }
        ((src_reply->type == 2) ? (void) (0) : __assert_fail ("src_reply->type == REDIS_REPLY_ARRAY", "redis-cli.c", 6062, __extension__ __PRETTY_FUNCTION__));
        ((src_reply->elements >= 2) ? (void) (0) : __assert_fail ("src_reply->elements >= 2", "redis-cli.c", 6063, __extension__ __PRETTY_FUNCTION__));
        ((src_reply->element[1]->type == 2) ? (void) (0) : __assert_fail ("src_reply->element[1]->type == REDIS_REPLY_ARRAY", "redis-cli.c", 6064, __extension__ __PRETTY_FUNCTION__));
        if (src_reply->element[0]->type == 1)
            cursor = atoi(src_reply->element[0]->str);
        else if (src_reply->element[0]->type == 3)
            cursor = src_reply->element[0]->integer;
        int keycount = src_reply->element[1]->elements;
        for (i = 0; i < keycount; i++) {
            redisReply *kr = src_reply->element[1]->element[i];
            ((kr->type == 1) ? (void) (0) : __assert_fail ("kr->type == REDIS_REPLY_STRING", "redis-cli.c", 6072, __extension__ __PRETTY_FUNCTION__));
            char *key = kr->str;
            uint16_t slot = clusterManagerKeyHashSlot(key, kr->len);
            clusterManagerNode *target = slots_map[slot];
            printf("Migrating %s to %s:%d: ", key, target->ip, target->port);
            redisReply *r = reconnectingRedisCommand(src_ctx, cmdfmt,
                                                     target->ip, target->port,
                                                     key, 0, timeout,
                                                     "COPY", "REPLACE");
            if (!r || r->type == 6) {
                if (r && r->str) {
                    clusterManagerLog(3,"Source %s:%d replied with " "error:\n%s\n", src_ip, src_port, r->str);


                }
                success = 0;
            }
            freeReplyObject(r);
            if (!success) goto cleanup;
            clusterManagerLog(4,"OK\n");
        }
    }
cleanup:
    if (reply_err)
        clusterManagerLog(3,"Source %s:%d replied with error:\n%s\n", src_ip, src_port, reply_err);

    if (src_ctx) redisFree(src_ctx);
    if (src_reply) freeReplyObject(src_reply);
    return success;
invalid_args:
    fprintf(stderr, "%s", invalid_args_msg);
    return 0;
}

static int clusterManagerCommandCall(int argc, char **argv) {
    int port = 0, i;
    char *ip = ((void *)0);
    if (!getClusterHostFromCmdArgs(1, argv, &ip, &port)) goto invalid_args;
    clusterManagerNode *refnode = clusterManagerNewNode(ip, port);
    if (!clusterManagerLoadInfoFromNode(refnode, 0)) return 0;
    argc--;
    argv++;
    size_t *argvlen = zmalloc(argc*sizeof(size_t));
    clusterManagerLog(1,">>> Calling");
    for (i = 0; i < argc; i++) {
        argvlen[i] = strlen(argv[i]);
        printf(" %s", argv[i]);
    }
    printf("\n");
    listIter li;
    listNode *ln;
    listRewind(cluster_manager.nodes, &li);
    while ((ln = listNext(&li)) != ((void *)0)) {
        clusterManagerNode *n = ln->value;
        if (!n->context && !clusterManagerNodeConnect(n)) continue;
        redisReply *reply = ((void *)0);
        redisAppendCommandArgv(n->context, argc, (const char **) argv, argvlen);
        int status = redisGetReply(n->context, (void **)(&reply));
        if (status != 0 || reply == ((void *)0) )
            printf("%s:%d: Failed!\n", n->ip, n->port);
        else {
            sds formatted_reply = cliFormatReplyRaw(reply);
            printf("%s:%d: %s\n", n->ip, n->port, (char *) formatted_reply);
            sdsfree(formatted_reply);
        }
        if (reply != ((void *)0)) freeReplyObject(reply);
    }
    zfree(argvlen);
    return 1;
invalid_args:
    fprintf(stderr, "[ERR] Invalid arguments: you need to pass either a valid " "address (ie. 120.0.0.1:7000) or space separated IP " "and port (ie. 120.0.0.1 7000)\n");
    return 0;
}

static int clusterManagerCommandBackup(int argc, char **argv) {
    ((void) argc);
    int success = 1, port = 0;
    char *ip = ((void *)0);
    if (!getClusterHostFromCmdArgs(1, argv, &ip, &port)) goto invalid_args;
    clusterManagerNode *refnode = clusterManagerNewNode(ip, port);
    if (!clusterManagerLoadInfoFromNode(refnode, 0)) return 0;
    int no_issues = clusterManagerCheckCluster(0);
    int cluster_errors_count = (no_issues ? 0 :
                                ((cluster_manager . errors)->len));
    config.cluster_manager_command.backup_dir = argv[1];
     
    sds json = sdsnew("[\n");
    int first_node = 0;
    listIter li;
    listNode *ln;
    listRewind(cluster_manager.nodes, &li);
    while ((ln = listNext(&li)) != ((void *)0)) {
        if (!first_node) first_node = 1;
        else json = sdscat(json, ",\n");
        clusterManagerNode *node = ln->value;
        sds node_json = clusterManagerNodeGetJSON(node, cluster_errors_count);
        json = sdscat(json, node_json);
        sdsfree(node_json);
        if (node->replicate)
            continue;
        clusterManagerLog(1,">>> Node %s:%d -> Saving RDB...\n", node ->ip, node ->port);

        fflush(stdout);
        getRDB(node);
    }
    json = sdscat(json, "\n]");
    sds jsonpath = sdsnew(config.cluster_manager_command.backup_dir);
    if (jsonpath[sdslen(jsonpath) - 1] != '/')
        jsonpath = sdscat(jsonpath, "/");
    jsonpath = sdscat(jsonpath, "nodes.json");
    fflush(stdout);
    clusterManagerLog(1,"Saving cluster configuration to: %s\n", jsonpath);
    FILE *out = fopen(jsonpath, "w+");
    if (!out) {
        clusterManagerLog(3,"Could not save nodes to: %s\n", jsonpath);
        success = 0;
        goto cleanup;
    }
    fputs(json, out);
    fclose(out);
cleanup:
    sdsfree(json);
    sdsfree(jsonpath);
    if (success) {
        if (!no_issues) {
            clusterManagerLog(2,"*** Cluster seems to have some problems, " "please be aware of it if you're going " "to restore this backup.\n");


        }
        clusterManagerLog(4,"[OK] Backup created into: %s\n", config . cluster_manager_command . backup_dir);

    } else clusterManagerLog(4,"[ERR] Failed to back cluster!\n");
    return success;
invalid_args:
    fprintf(stderr, "[ERR] Invalid arguments: you need to pass either a valid " "address (ie. 120.0.0.1:7000) or space separated IP " "and port (ie. 120.0.0.1 7000)\n");
    return 0;
}

static int clusterManagerCommandHelp(int argc, char **argv) {
    ((void) argc);
    ((void) argv);
    int commands_count = sizeof(clusterManagerCommands) /
                         sizeof(clusterManagerCommandDef);
    int i = 0, j;
    fprintf(stderr, "Cluster Manager Commands:\n");
    int padding = 15;
    for (; i < commands_count; i++) {
        clusterManagerCommandDef *def = &(clusterManagerCommands[i]);
        int namelen = strlen(def->name), padlen = padding - namelen;
        fprintf(stderr, "  %s", def->name);
        for (j = 0; j < padlen; j++) fprintf(stderr, " ");
        fprintf(stderr, "%s\n", (def->args ? def->args : ""));
        if (def->options != ((void *)0)) {
            int optslen = strlen(def->options);
            char *p = def->options, *eos = p + optslen;
            char *comma = ((void *)0);
            while ((comma = strchr(p, ',')) != ((void *)0)) {
                int deflen = (int)(comma - p);
                char buf[255];
                memcpy(buf, p, deflen);
                buf[deflen] = '\0';
                for (j = 0; j < padding; j++) fprintf(stderr, " ");
                fprintf(stderr, "  --cluster-%s\n", buf);
                p = comma + 1;
                if (p >= eos) break;
            }
            if (p < eos) {
                for (j = 0; j < padding; j++) fprintf(stderr, " ");
                fprintf(stderr, "  --cluster-%s\n", p);
            }
        }
    }
    fprintf(stderr, "\nFor check, fix, reshard, del-node, set-timeout you "
                    "can specify the host and port of any working node in "
                    "the cluster.\n\n");
    return 0;
}



 

static void latencyModePrint(long long min, long long max, double avg, long long count) {
    if (config.output == 0) {
        printf("min: %lld, max: %lld, avg: %.2f (%lld samples)",
                min, max, avg, count);
        fflush(stdout);
    } else if (config.output == 2) {
        printf("%lld,%lld,%.2f,%lld\n", min, max, avg, count);
    } else if (config.output == 1) {
        printf("%lld %lld %.2f %lld\n", min, max, avg, count);
    }
}

#define LATENCY_SAMPLE_RATE 10  
#define LATENCY_HISTORY_DEFAULT_INTERVAL 15000  
static void latencyMode(void) {
    redisReply *reply;
    long long start, latency, min = 0, max = 0, tot = 0, count = 0;
    long long history_interval =
        config.interval ? config.interval/1000 :
                          15000;
    double avg;
    long long history_start = mstime();

    
 
    if (config.interval == 0) {
        config.interval = 1000;
    } else {
        config.interval /= 1000;  
    }

    if (!context) exit(1);
    while(1) {
        start = mstime();
        reply = reconnectingRedisCommand(context,"PING");
        if (reply == ((void *)0)) {
            fprintf(stderr,"\nI/O error\n");
            exit(1);
        }
        latency = mstime()-start;
        freeReplyObject(reply);
        count++;
        if (count == 1) {
            min = max = tot = latency;
            avg = (double) latency;
        } else {
            if (latency < min) min = latency;
            if (latency > max) max = latency;
            tot += latency;
            avg = (double) tot/count;
        }

        if (config.output == 0) {
            printf("\x1b[0G\x1b[2K");  
            latencyModePrint(min,max,avg,count);
        } else {
            if (config.latency_history) {
                latencyModePrint(min,max,avg,count);
            } else if (mstime()-history_start > config.interval) {
                latencyModePrint(min,max,avg,count);
                exit(0);
            }
        }

        if (config.latency_history && mstime()-history_start > history_interval)
        {
            printf(" -- %.2f seconds range\n", (float)(mstime()-history_start)/1000);
            history_start = mstime();
            min = max = tot = count = 0;
        }
        usleep(10 * 1000);
    }
}



 

#define LATENCY_DIST_DEFAULT_INTERVAL 1000  

 
struct distsamples {
    long long max;    
    long long count;  
    int character;    
};











 
void showLatencyDistSamples(struct distsamples *samples, long long tot) {
    int j;

     



 
    printf("\033[38;5;0m");  
    for (j = 0; ; j++) {
        int coloridx =
            ceil((float) samples[j].count / tot * (spectrum_palette_size-1));
        int color = spectrum_palette[coloridx];
        printf("\033[48;5;%dm%c", (int)color, samples[j].character);
        samples[j].count = 0;
        if (samples[j].max == 0) break;  
    }
    printf("\033[0m\n");
    fflush(stdout);
}


 
void showLatencyDistLegend(void) {
    int j;

    printf("---------------------------------------------\n");
    printf(". - * #          .01 .125 .25 .5 milliseconds\n");
    printf("1,2,3,...,9      from 1 to 9     milliseconds\n");
    printf("A,B,C,D,E        10,20,30,40,50  milliseconds\n");
    printf("F,G,H,I,J        .1,.2,.3,.4,.5       seconds\n");
    printf("K,L,M,N,O,P,Q,?  1,2,4,8,16,30,60,>60 seconds\n");
    printf("From 0 to 100%%: ");
    for (j = 0; j < spectrum_palette_size; j++) {
        printf("\033[48;5;%dm ", spectrum_palette[j]);
    }
    printf("\033[0m\n");
    printf("---------------------------------------------\n");
}

static void latencyDistMode(void) {
    redisReply *reply;
    long long start, latency, count = 0;
    long long history_interval =
        config.interval ? config.interval/1000 :
                          1000;
    long long history_start = ustime();
    int j, outputs = 0;

    struct distsamples samples[] = {
        

 
        {10,0,'.'},          
        {125,0,'-'},         
        {250,0,'*'},         
        {500,0,'#'},         
        {1000,0,'1'},        
        {2000,0,'2'},        
        {3000,0,'3'},        
        {4000,0,'4'},        
        {5000,0,'5'},        
        {6000,0,'6'},        
        {7000,0,'7'},        
        {8000,0,'8'},        
        {9000,0,'9'},        
        {10000,0,'A'},       
        {20000,0,'B'},       
        {30000,0,'C'},       
        {40000,0,'D'},       
        {50000,0,'E'},       
        {100000,0,'F'},      
        {200000,0,'G'},      
        {300000,0,'H'},      
        {400000,0,'I'},      
        {500000,0,'J'},      
        {1000000,0,'K'},     
        {2000000,0,'L'},     
        {4000000,0,'M'},     
        {8000000,0,'N'},     
        {16000000,0,'O'},    
        {30000000,0,'P'},    
        {60000000,0,'Q'},    
        {0,0,'?'},           
    };

    if (!context) exit(1);
    while(1) {
        start = ustime();
        reply = reconnectingRedisCommand(context,"PING");
        if (reply == ((void *)0)) {
            fprintf(stderr,"\nI/O error\n");
            exit(1);
        }
        latency = ustime()-start;
        freeReplyObject(reply);
        count++;

         
        for (j = 0; ; j++) {
            if (samples[j].max == 0 || latency <= samples[j].max) {
                samples[j].count++;
                break;
            }
        }

         
        if (count && (ustime()-history_start)/1000 > history_interval) {
            if ((outputs++ % 20) == 0)
                showLatencyDistLegend();
            showLatencyDistSamples(samples,count);
            history_start = ustime();
            count = 0;
        }
        usleep(10 * 1000);
    }
}



 

#define RDB_EOF_MARK_SIZE 40

void sendReplconf(const char* arg1, const char* arg2) {
    printf("sending REPLCONF %s %s\n", arg1, arg2);
    redisReply *reply = redisCommand(context, "REPLCONF %s %s", arg1, arg2);

     
    if(reply == ((void *)0)) {
        fprintf(stderr, "\nI/O error\n");
        exit(1);
    } else if(reply->type == 6) {
        fprintf(stderr, "REPLCONF %s error: %s\n", arg1, reply->str);
         
    }
    freeReplyObject(reply);
}

void sendCapa() {
    sendReplconf("capa", "eof");
}



 
unsigned long long sendSync(int fd, char *out_eof) {
    


 
    char buf[4096], *p;
    ssize_t nread;

     
    if (write(fd,"SYNC\r\n",6) != 6) {
        fprintf(stderr,"Error writing to master\n");
        exit(1);
    }

     
    p = buf;
    while(1) {
        nread = read(fd,p,1);
        if (nread <= 0) {
            fprintf(stderr,"Error reading bulk length while SYNCing\n");
            exit(1);
        }
        if (*p == '\n' && p != buf) break;
        if (*p != '\n') p++;
    }
    *p = '\0';
    if (buf[0] == '-') {
        printf("SYNC with master failed: %s\n", buf);
        exit(1);
    }
    if (strncmp(buf+1,"EOF:",4) == 0 && strlen(buf+5) >= 40) {
        memcpy(out_eof, buf+5, 40);
        return 0;
    }
    return strtoull(buf+1,((void *)0),10);
}

static void slaveMode(void) {
    int fd = context->fd;
    static char eofmark[40];
    static char lastbytes[40];
    static int usemark = 0;
    unsigned long long payload = sendSync(fd, eofmark);
    char buf[1024];
    int original_output = config.output;

    if (payload == 0) {
        payload = (0x7fffffffffffffffLL * 2ULL + 1ULL);
        memset(lastbytes,0,40);
        usemark = 1;
        fprintf(stderr,"SYNC with master, discarding "
                       "bytes of bulk transfer until EOF marker...\n");
    } else {
        fprintf(stderr,"SYNC with master, discarding %llu "
                       "bytes of bulk transfer...\n", payload);
    }


     
    while(payload) {
        ssize_t nread;

        nread = read(fd,buf,(payload > sizeof(buf)) ? sizeof(buf) : payload);
        if (nread <= 0) {
            fprintf(stderr,"Error reading RDB payload while SYNCing\n");
            exit(1);
        }
        payload -= nread;

        if (usemark) {
             
            if (nread >= 40) {
                memcpy(lastbytes,buf+nread-40,40);
            } else {
                int rem = 40-nread;
                memmove(lastbytes,lastbytes+nread,rem);
                memcpy(lastbytes+rem,buf,nread);
            }
            if (memcmp(lastbytes,eofmark,40) == 0)
                break;
        }
    }

    if (usemark) {
        unsigned long long offset = (0x7fffffffffffffffLL * 2ULL + 1ULL) - payload;
        fprintf(stderr,"SYNC done after %llu bytes. Logging commands from master.\n", offset);
         
        sleep(1);
        sendReplconf("ACK", "0");
    } else
        fprintf(stderr,"SYNC done. Logging commands from master.\n");

     
    config.output = 2;
    while (cliReadReply(0) == 0);
    config.output = original_output;
}



 


 
static void getRDB(clusterManagerNode *node) {
    int s, fd;
    char *filename;
    if (node != ((void *)0)) {
        ((node ->context) ? (void) (0) : __assert_fail ("node->context", "redis-cli.c", 6606, __extension__ __PRETTY_FUNCTION__));
        s = node->context->fd;
        filename = clusterManagerGetNodeRDBFilename(node);
    } else {
        s = context->fd;
        filename = config.rdb_filename;
    }
    static char eofmark[40];
    static char lastbytes[40];
    static int usemark = 0;
    unsigned long long payload = sendSync(s, eofmark);
    char buf[4096];

    if (payload == 0) {
        payload = (0x7fffffffffffffffLL * 2ULL + 1ULL);
        memset(lastbytes,0,40);
        usemark = 1;
        fprintf(stderr,"SYNC sent to master, writing bytes of bulk transfer "
                "until EOF marker to '%s'\n", filename);
    } else {
        fprintf(stderr,"SYNC sent to master, writing %llu bytes to '%s'\n",
            payload, filename);
    }

     
    if (!strcmp(filename,"-")) {
        fd = 1;
    } else {
        fd = open(filename, 0100|01, 0644);
        if (fd == -1) {
            fprintf(stderr, "Error opening '%s': %s\n", filename,
                strerror(errno));
            exit(1);
        }
    }

    while(payload) {
        ssize_t nread, nwritten;

        nread = read(s,buf,(payload > sizeof(buf)) ? sizeof(buf) : payload);
        if (nread <= 0) {
            fprintf(stderr,"I/O Error reading RDB payload from socket\n");
            exit(1);
        }
        nwritten = write(fd, buf, nread);
        if (nwritten != nread) {
            fprintf(stderr,"Error writing data to file: %s\n",
                (nwritten == -1) ? strerror(errno) : "short write");
            exit(1);
        }
        payload -= nread;

        if (usemark) {
             
            if (nread >= 40) {
                memcpy(lastbytes,buf+nread-40,40);
            } else {
                int rem = 40-nread;
                memmove(lastbytes,lastbytes+nread,rem);
                memcpy(lastbytes+rem,buf,nread);
            }
            if (memcmp(lastbytes,eofmark,40) == 0)
                break;
        }
    }
    if (usemark) {
        payload = (0x7fffffffffffffffLL * 2ULL + 1ULL) - payload - 40;
        if (ftruncate(fd, payload) == -1)
            fprintf(stderr,"ftruncate failed: %s.\n", strerror(errno));
        fprintf(stderr,"Transfer finished with success after %llu bytes\n", payload);
    } else {
        fprintf(stderr,"Transfer finished with success.\n");
    }
    close(s);  
    fsync(fd);
    close(fd);
    fprintf(stderr,"Transfer finished with success.\n");
    if (node) {
        sdsfree(filename);
        return;
    }
    exit(0);
}



 

#define PIPEMODE_WRITE_LOOP_MAX_BYTES (128*1024)
static void pipeMode(void) {
    int fd = context->fd;
    long long errors = 0, replies = 0, obuf_len = 0, obuf_pos = 0;
    char ibuf[1024*16], obuf[1024*16];  
    char aneterr[256];
    redisReader *reader = redisReaderCreate();
    redisReply *reply;
    int eof = 0;  
    int done = 0;
    char magic[20];  
    time_t last_read_time = time(((void *)0));

    srand(time(((void *)0)));

     
    if (anetNonBlock(aneterr,fd) == -1) {
        fprintf(stderr, "Can't set the socket in non blocking mode: %s\n",
            aneterr);
        exit(1);
    }

    
 
    while(!done) {
        int mask = 1;

        if (!eof || obuf_len != 0) mask |= 2;
        mask = aeWait(fd,mask,1000);

         
        if (mask & 1) {
            ssize_t nread;

             
            do {
                nread = read(fd,ibuf,sizeof(ibuf));
                if (nread == -1 && errno != 11 && errno != 4) {
                    fprintf(stderr, "Error reading from the server: %s\n",
                        strerror(errno));
                    exit(1);
                }
                if (nread > 0) {
                    redisReaderFeed(reader,ibuf,nread);
                    last_read_time = time(((void *)0));
                }
            } while(nread > 0);

             
            do {
                if (redisReaderGetReply(reader,(void**)&reply) == -1) {
                    fprintf(stderr, "Error reading replies from server\n");
                    exit(1);
                }
                if (reply) {
                    if (reply->type == 6) {
                        fprintf(stderr,"%s\n", reply->str);
                        errors++;
                    } else if (eof && reply->type == 1 &&
                                      reply->len == 20) {
                        

 
                        if (memcmp(reply->str,magic,20) == 0) {
                            printf("Last reply received from server.\n");
                            done = 1;
                            replies--;
                        }
                    }
                    replies++;
                    freeReplyObject(reply);
                }
            } while(reply);
        }

         
        if (mask & 2) {
            ssize_t loop_nwritten = 0;

            while(1) {
                 
                if (obuf_len != 0) {
                    ssize_t nwritten = write(fd,obuf+obuf_pos,obuf_len);

                    if (nwritten == -1) {
                        if (errno != 11 && errno != 4) {
                            fprintf(stderr, "Error writing to the server: %s\n",
                                strerror(errno));
                            exit(1);
                        } else {
                            nwritten = 0;
                        }
                    }
                    obuf_len -= nwritten;
                    obuf_pos += nwritten;
                    loop_nwritten += nwritten;
                    if (obuf_len != 0) break;  
                }
                 
                if (obuf_len == 0 && !eof) {
                    ssize_t nread = read(0,obuf,sizeof(obuf));

                    if (nread == 0) {
                        


 
                        char echo[] =
                        "\r\n*2\r\n$4\r\nECHO\r\n$20\r\n01234567890123456789\r\n";
                        int j;

                        eof = 1;
                        

 
                        for (j = 0; j < 20; j++)
                            magic[j] = rand() & 0xff;
                        memcpy(echo+21,magic,20);
                        memcpy(obuf,echo,sizeof(echo)-1);
                        obuf_len = sizeof(echo)-1;
                        obuf_pos = 0;
                        printf("All data transferred. Waiting for the last reply...\n");
                    } else if (nread == -1) {
                        fprintf(stderr, "Error reading from stdin: %s\n",
                            strerror(errno));
                        exit(1);
                    } else {
                        obuf_len = nread;
                        obuf_pos = 0;
                    }
                }
                if ((obuf_len == 0 && eof) ||
                    loop_nwritten > (128*1024)) break;
            }
        }

        

 
        if (eof && config.pipe_timeout > 0 &&
            time(((void *)0))-last_read_time > config.pipe_timeout)
        {
            fprintf(stderr,"No replies for %d seconds: exiting.\n",
                config.pipe_timeout);
            errors++;
            break;
        }
    }
    redisReaderFree(reader);
    printf("errors: %lld, replies: %lld\n", errors, replies);
    if (errors)
        exit(1);
    else
        exit(0);
}



 

static redisReply *sendScan(unsigned long long *it) {
    redisReply *reply = redisCommand(context, "SCAN %llu", *it);

     
    if(reply == ((void *)0)) {
        fprintf(stderr, "\nI/O error\n");
        exit(1);
    } else if(reply->type == 6) {
        fprintf(stderr, "SCAN error: %s\n", reply->str);
        exit(1);
    } else if(reply->type != 2) {
        fprintf(stderr, "Non ARRAY response from SCAN!\n");
        exit(1);
    } else if(reply->elements != 2) {
        fprintf(stderr, "Invalid element count from SCAN!\n");
        exit(1);
    }

     
    ((reply->element[0]->type == 1) ? (void) (0) : __assert_fail ("reply->element[0]->type == REDIS_REPLY_STRING", "redis-cli.c", 6873, __extension__ __PRETTY_FUNCTION__));
    ((reply->element[1]->type == 2) ? (void) (0) : __assert_fail ("reply->element[1]->type == REDIS_REPLY_ARRAY", "redis-cli.c", 6874, __extension__ __PRETTY_FUNCTION__));

     
    *it = strtoull(reply->element[0]->str, ((void *)0), 10);

    return reply;
}

static int getDbSize(void) {
    redisReply *reply;
    int size;

    reply = redisCommand(context, "DBSIZE");

    if(reply == ((void *)0) || reply->type != 3) {
        fprintf(stderr, "Couldn't determine DBSIZE!\n");
        exit(1);
    }

     
    size = reply->integer;
    freeReplyObject(reply);

    return size;
}

typedef struct {
    char *name;
    char *sizecmd;
    char *sizeunit;
    unsigned long long biggest;
    unsigned long long count;
    unsigned long long totalsize;
    sds biggest_key;
} typeinfo;

typeinfo type_string = { "string", "STRLEN", "bytes" };
typeinfo type_list = { "list", "LLEN", "items" };
typeinfo type_set = { "set", "SCARD", "members" };
typeinfo type_hash = { "hash", "HLEN", "fields" };
typeinfo type_zset = { "zset", "ZCARD", "members" };
typeinfo type_stream = { "stream", "XLEN", "entries" };
typeinfo type_other = { "other", ((void *)0), "?" };

static typeinfo* typeinfo_add(dict *types, char* name, typeinfo* type_template) {
    typeinfo *info = zmalloc(sizeof(typeinfo));
    *info = *type_template;
    info->name = sdsnew(name);
    dictAdd(types, info->name, info);
    return info;
}

void type_free(void* priv_data, void* val) {
    typeinfo *info = val;
    ((void) priv_data);
    if (info->biggest_key)
        sdsfree(info->biggest_key);
    sdsfree(info->name);
    zfree(info);
}

static dictType typeinfoDictType = {
    dictSdsHash,                
    ((void *)0),                       
    ((void *)0),                       
    dictSdsKeyCompare,          
    ((void *)0),                       
    type_free                   
};

static void getKeyTypes(dict *types_dict, redisReply *keys, typeinfo **types) {
    redisReply *reply;
    unsigned int i;

     
    for(i=0;i<keys->elements;i++) {
        redisAppendCommand(context, "TYPE %s", keys->element[i]->str);
    }

     
    for(i=0;i<keys->elements;i++) {
        if(redisGetReply(context, (void**)&reply)!=0) {
            fprintf(stderr, "Error getting type for key '%s' (%d: %s)\n",
                keys->element[i]->str, context->err, context->errstr);
            exit(1);
        } else if(reply->type != 5) {
            if(reply->type == 6) {
                fprintf(stderr, "TYPE returned an error: %s\n", reply->str);
            } else {
                fprintf(stderr,
                    "Invalid reply type (%d) for TYPE on key '%s'!\n",
                    reply->type, keys->element[i]->str);
            }
            exit(1);
        }

        sds typereply = sdsnew(reply->str);
        dictEntry *de = dictFind(types_dict, typereply);
        sdsfree(typereply);
        typeinfo *type = ((void *)0);
        if (de)
            type = ((de)->v . val);
        else if (strcmp(reply->str, "none"))  
            type = typeinfo_add(types_dict, reply->str, &type_other);
        types[i] = type;
        freeReplyObject(reply);
    }
}

static void getKeySizes(redisReply *keys, typeinfo **types,
                        unsigned long long *sizes, int memkeys,
                        unsigned memkeys_samples)
{
    redisReply *reply;
    unsigned int i;

     
    for(i=0;i<keys->elements;i++) {
         
        if(!types[i] || (!types[i]->sizecmd && !memkeys))
            continue;

        if (!memkeys)
            redisAppendCommand(context, "%s %s",
                types[i]->sizecmd, keys->element[i]->str);
        else if (memkeys_samples==0)
            redisAppendCommand(context, "%s %s %s",
                "MEMORY", "USAGE", keys->element[i]->str);
        else
            redisAppendCommand(context, "%s %s %s SAMPLES %u",
                "MEMORY", "USAGE", keys->element[i]->str, memkeys_samples);
    }

     
    for(i=0;i<keys->elements;i++) {
         
        if(!types[i] || (!types[i]->sizecmd && !memkeys)) {
            sizes[i] = 0;
            continue;
        }

         
        if(redisGetReply(context, (void**)&reply)!=0) {
            fprintf(stderr, "Error getting size for key '%s' (%d: %s)\n",
                keys->element[i]->str, context->err, context->errstr);
            exit(1);
        } else if(reply->type != 3) {
            
 
            fprintf(stderr,
                "Warning:  %s on '%s' failed (may have changed type)\n",
                !memkeys? types[i]->sizecmd: "MEMORY USAGE",
                keys->element[i]->str);
            sizes[i] = 0;
        } else {
            sizes[i] = reply->integer;
        }

        freeReplyObject(reply);
    }
}

static void findBigKeys(int memkeys, unsigned memkeys_samples) {
    unsigned long long sampled = 0, total_keys, totlen=0, *sizes=((void *)0), it=0;
    redisReply *reply, *keys;
    unsigned int arrsize=0, i;
    dictIterator *di;
    dictEntry *de;
    typeinfo **types = ((void *)0);
    double pct;

    dict *types_dict = dictCreate(&typeinfoDictType, ((void *)0));
    typeinfo_add(types_dict, "string", &type_string);
    typeinfo_add(types_dict, "list", &type_list);
    typeinfo_add(types_dict, "set", &type_set);
    typeinfo_add(types_dict, "hash", &type_hash);
    typeinfo_add(types_dict, "zset", &type_zset);
    typeinfo_add(types_dict, "stream", &type_stream);

     
    total_keys = getDbSize();

     
    printf("\n# Scanning the entire keyspace to find biggest keys as well as\n");
    printf("# average sizes per key type.  You can use -i 0.1 to sleep 0.1 sec\n");
    printf("# per 100 SCAN commands (not usually needed).\n\n");

     
    do {
         
        pct = 100 * (double)sampled/total_keys;

         
        reply = sendScan(&it);
        keys  = reply->element[1];

         
        if(keys->elements > arrsize) {
            types = zrealloc(types, sizeof(typeinfo*)*keys->elements);
            sizes = zrealloc(sizes, sizeof(unsigned long long)*keys->elements);

            if(!types || !sizes) {
                fprintf(stderr, "Failed to allocate storage for keys!\n");
                exit(1);
            }

            arrsize = keys->elements;
        }

         
        getKeyTypes(types_dict, keys, types);
        getKeySizes(keys, types, sizes, memkeys, memkeys_samples);

         
        for(i=0;i<keys->elements;i++) {
            typeinfo *type = types[i];
             
            if(!type)
                continue;

            type->totalsize += sizes[i];
            type->count++;
            totlen += keys->element[i]->len;
            sampled++;

            if(type->biggest<sizes[i]) {
                printf(
                   "[%05.2f%%] Biggest %-6s found so far '%s' with %llu %s\n",
                   pct, type->name, keys->element[i]->str, sizes[i],
                   !memkeys? type->sizeunit: "bytes");

                 
                if (type->biggest_key)
                    sdsfree(type->biggest_key);
                type->biggest_key = sdsnew(keys->element[i]->str);
                if(!type->biggest_key) {
                    fprintf(stderr, "Failed to allocate memory for key!\n");
                    exit(1);
                }

                 
                type->biggest = sizes[i];
            }

             
            if(sampled % 1000000 == 0) {
                printf("[%05.2f%%] Sampled %llu keys so far\n", pct, sampled);
            }
        }

         
        if(sampled && (sampled %100) == 0 && config.interval) {
            usleep(config.interval);
        }

        freeReplyObject(reply);
    } while(it != 0);

    if(types) zfree(types);
    if(sizes) zfree(sizes);

     
    printf("\n-------- summary -------\n\n");

    printf("Sampled %llu keys in the keyspace!\n", sampled);
    printf("Total key length in bytes is %llu (avg len %.2f)\n\n",
       totlen, totlen ? (double)totlen/sampled : 0);

     
    di = dictGetIterator(types_dict);
    while ((de = dictNext(di))) {
        typeinfo *type = ((de)->v . val);
        if(type->biggest_key) {
            printf("Biggest %6s found '%s' has %llu %s\n", type->name, type->biggest_key,
               type->biggest, !memkeys? type->sizeunit: "bytes");
        }
    }
    dictReleaseIterator(di);

    printf("\n");

    di = dictGetIterator(types_dict);
    while ((de = dictNext(di))) {
        typeinfo *type = ((de)->v . val);
        printf("%llu %ss with %llu %s (%05.2f%% of keys, avg size %.2f)\n",
           type->count, type->name, type->totalsize, !memkeys? type->sizeunit: "bytes",
           sampled ? 100 * (double)type->count/sampled : 0,
           type->count ? (double)type->totalsize/type->count : 0);
    }
    dictReleaseIterator(di);

    dictRelease(types_dict);

     
    exit(0);
}

static void getKeyFreqs(redisReply *keys, unsigned long long *freqs) {
    redisReply *reply;
    unsigned int i;

     
    for(i=0;i<keys->elements;i++) {
        redisAppendCommand(context, "OBJECT freq %s", keys->element[i]->str);
    }

     
    for(i=0;i<keys->elements;i++) {
        if(redisGetReply(context, (void**)&reply)!=0) {
            fprintf(stderr, "Error getting freq for key '%s' (%d: %s)\n",
                keys->element[i]->str, context->err, context->errstr);
            exit(1);
        } else if(reply->type != 3) {
            if(reply->type == 6) {
                fprintf(stderr, "Error: %s\n", reply->str);
                exit(1);
            } else {
                fprintf(stderr, "Warning: OBJECT freq on '%s' failed (may have been deleted)\n", keys->element[i]->str);
                freqs[i] = 0;
            }
        } else {
            freqs[i] = reply->integer;
        }
        freeReplyObject(reply);
    }
}

#define HOTKEYS_SAMPLE 16
static void findHotKeys(void) {
    redisReply *keys, *reply;
    unsigned long long counters[16] = {0};
    sds hotkeys[16] = {((void *)0)};
    unsigned long long sampled = 0, total_keys, *freqs = ((void *)0), it = 0;
    unsigned int arrsize = 0, i, k;
    double pct;

     
    total_keys = getDbSize();

     
    printf("\n# Scanning the entire keyspace to find hot keys as well as\n");
    printf("# average sizes per key type.  You can use -i 0.1 to sleep 0.1 sec\n");
    printf("# per 100 SCAN commands (not usually needed).\n\n");

     
    do {
         
        pct = 100 * (double)sampled/total_keys;

         
        reply = sendScan(&it);
        keys  = reply->element[1];

         
        if(keys->elements > arrsize) {
            freqs = zrealloc(freqs, sizeof(unsigned long long)*keys->elements);

            if(!freqs) {
                fprintf(stderr, "Failed to allocate storage for keys!\n");
                exit(1);
            }

            arrsize = keys->elements;
        }

        getKeyFreqs(keys, freqs);

         
        for(i=0;i<keys->elements;i++) {
            sampled++;
             
            if(sampled % 1000000 == 0) {
                printf("[%05.2f%%] Sampled %llu keys so far\n", pct, sampled);
            }

             
            k = 0;
            while (k < 16 && freqs[i] > counters[k]) k++;
            if (k == 0) continue;
            k--;
            if (k == 0 || counters[k] == 0) {
                sdsfree(hotkeys[k]);
            } else {
                sdsfree(hotkeys[0]);
                memmove(counters,counters+1,sizeof(counters[0])*k);
                memmove(hotkeys,hotkeys+1,sizeof(hotkeys[0])*k);
            }
            counters[k] = freqs[i];
            hotkeys[k] = sdsnew(keys->element[i]->str);
            printf(
               "[%05.2f%%] Hot key '%s' found so far with counter %llu\n",
               pct, keys->element[i]->str, freqs[i]);
        }

         
        if(sampled && (sampled %100) == 0 && config.interval) {
            usleep(config.interval);
        }

        freeReplyObject(reply);
    } while(it != 0);

    if (freqs) zfree(freqs);

     
    printf("\n-------- summary -------\n\n");

    printf("Sampled %llu keys in the keyspace!\n", sampled);

    for (i=1; i<= 16; i++) {
        k = 16 - i;
        if(counters[k]>0) {
            printf("hot key found with counter: %llu\tkeyname: %s\n", counters[k], hotkeys[k]);
            sdsfree(hotkeys[k]);
        }
    }

    exit(0);
}



 



 
static char *getInfoField(char *info, char *field) {
    char *p = strstr(info,field);
    char *n1, *n2;
    char *result;

    if (!p) return ((void *)0);
    p += strlen(field)+1;
    n1 = strchr(p,'\r');
    n2 = strchr(p,',');
    if (n2 && n2 < n1) n1 = n2;
    result = zmalloc(sizeof(char)*(n1-p)+1);
    memcpy(result,p,(n1-p));
    result[n1-p] = '\0';
    return result;
}


 
static long getLongInfoField(char *info, char *field) {
    char *value = getInfoField(info,field);
    long l;

    if (!value) return (-0x7fffffffffffffffL - 1L);
    l = strtol(value,((void *)0),10);
    zfree(value);
    return l;
}


 
void bytesToHuman(char *s, long long n) {
    double d;

    if (n < 0) {
        *s = '-';
        s++;
        n = -n;
    }
    if (n < 1024) {
         
        sprintf(s,"%lldB",n);
        return;
    } else if (n < (1024*1024)) {
        d = (double)n/(1024);
        sprintf(s,"%.2fK",d);
    } else if (n < (1024LL*1024*1024)) {
        d = (double)n/(1024*1024);
        sprintf(s,"%.2fM",d);
    } else if (n < (1024LL*1024*1024*1024)) {
        d = (double)n/(1024LL*1024*1024);
        sprintf(s,"%.2fG",d);
    }
}

static void statMode(void) {
    redisReply *reply;
    long aux, requests = 0;
    int i = 0;

    while(1) {
        char buf[64];
        int j;

        reply = reconnectingRedisCommand(context,"INFO");
        if (reply->type == 6) {
            printf("ERROR: %s\n", reply->str);
            exit(1);
        }

        if ((i++ % 20) == 0) {
            printf(
"------- data ------ --------------------- load -------------------- - child -\n"
"keys       mem      clients blocked requests            connections          \n");
        }

         
        aux = 0;
        for (j = 0; j < 20; j++) {
            long k;

            sprintf(buf,"db%d:keys",j);
            k = getLongInfoField(reply->str,buf);
            if (k == (-0x7fffffffffffffffL - 1L)) continue;
            aux += k;
        }
        sprintf(buf,"%ld",aux);
        printf("%-11s",buf);

         
        aux = getLongInfoField(reply->str,"used_memory");
        bytesToHuman(buf,aux);
        printf("%-8s",buf);

         
        aux = getLongInfoField(reply->str,"connected_clients");
        sprintf(buf,"%ld",aux);
        printf(" %-8s",buf);

         
        aux = getLongInfoField(reply->str,"blocked_clients");
        sprintf(buf,"%ld",aux);
        printf("%-8s",buf);

         
        aux = getLongInfoField(reply->str,"total_commands_processed");
        sprintf(buf,"%ld (+%ld)",aux,requests == 0 ? 0 : aux-requests);
        printf("%-19s",buf);
        requests = aux;

         
        aux = getLongInfoField(reply->str,"total_connections_received");
        sprintf(buf,"%ld",aux);
        printf(" %-12s",buf);

         
        aux = getLongInfoField(reply->str,"bgsave_in_progress");
        aux |= getLongInfoField(reply->str,"aof_rewrite_in_progress") << 1;
        aux |= getLongInfoField(reply->str,"loading") << 2;
        switch(aux) {
        case 0: break;
        case 1:
            printf("SAVE");
            break;
        case 2:
            printf("AOF");
            break;
        case 3:
            printf("SAVE+AOF");
            break;
        case 4:
            printf("LOAD");
            break;
        }

        printf("\n");
        freeReplyObject(reply);
        usleep(config.interval);
    }
}



 

static void scanMode(void) {
    redisReply *reply;
    unsigned long long cur = 0;

    do {
        if (config.pattern)
            reply = redisCommand(context,"SCAN %llu MATCH %s",
                cur,config.pattern);
        else
            reply = redisCommand(context,"SCAN %llu",cur);
        if (reply == ((void *)0)) {
            printf("I/O error\n");
            exit(1);
        } else if (reply->type == 6) {
            printf("ERROR: %s\n", reply->str);
            exit(1);
        } else {
            unsigned int j;

            cur = strtoull(reply->element[0]->str,((void *)0),10);
            for (j = 0; j < reply->element[1]->elements; j++)
                printf("%s\n", reply->element[1]->element[j]->str);
        }
        freeReplyObject(reply);
    } while(cur != 0);

    exit(0);
}



 






 
long long powerLawRand(long long min, long long max, double alpha) {
    double pl, r;

    max += 1;
    r = ((double)rand()) / 2147483647;
    pl = pow(
        ((pow(max,alpha+1) - pow(min,alpha+1))*r + pow(min,alpha+1)),
        (1.0/(alpha+1)));
    return (max-1-(long long)pl)+min;
}


 
void LRUTestGenKey(char *buf, size_t buflen) {
    snprintf(buf, buflen, "lru:%lld",
        powerLawRand(1, config.lru_test_sample_size, 6.2));
}

#define LRU_CYCLE_PERIOD 1000  
#define LRU_CYCLE_PIPELINE_SIZE 250
static void LRUTestMode(void) {
    redisReply *reply;
    char key[128];
    long long start_cycle;
    int j;

    srand(time(((void *)0))^getpid());
    while(1) {
        

 
        start_cycle = mstime();
        long long hits = 0, misses = 0;
        while(mstime() - start_cycle < 1000) {
             
            for (j = 0; j < 250; j++) {
                char val[6];
                val[5] = '\0';
                for (int i = 0; i < 5; i++) val[i] = 'A'+rand()%('z'-'A');
                LRUTestGenKey(key,sizeof(key));
                redisAppendCommand(context, "SET %s %s",key,val);
            }
            for (j = 0; j < 250; j++)
                redisGetReply(context, (void**)&reply);

             
            for (j = 0; j < 250; j++) {
                LRUTestGenKey(key,sizeof(key));
                redisAppendCommand(context, "GET %s",key);
            }
            for (j = 0; j < 250; j++) {
                if (redisGetReply(context, (void**)&reply) == 0) {
                    switch(reply->type) {
                        case 6:
                            printf("%s\n", reply->str);
                            break;
                        case 4:
                            misses++;
                            break;
                        default:
                            hits++;
                            break;
                    }
                }
            }

            if (context->err) {
                fprintf(stderr,"I/O error during LRU test\n");
                exit(1);
            }
        }
         
        printf(
            "%lld Gets/sec | Hits: %lld (%.2f%%) | Misses: %lld (%.2f%%)\n",
            hits+misses,
            hits, (double)hits/(hits+misses)*100,
            misses, (double)misses/(hits+misses)*100);
    }
    exit(0);
}







 



 
unsigned long compute_something_fast(void) {
    unsigned char s[256], i, j, t;
    int count = 1000, k;
    unsigned long output = 0;

    for (k = 0; k < 256; k++) s[k] = k;

    i = 0;
    j = 0;
    while(count--) {
        i++;
        j = j + s[i];
        t = s[i];
        s[i] = s[j];
        s[j] = t;
        output += s[(s[i]+s[j])&255];
    }
    return output;
}

static void intrinsicLatencyModeStop(int s) {
    ((void) s);
    force_cancel_loop = 1;
}

static void intrinsicLatencyMode(void) {
    long long test_end, run_time, max_latency = 0, runs = 0;

    run_time = config.intrinsic_latency_duration*1000000;
    test_end = ustime() + run_time;
    signal(2, intrinsicLatencyModeStop);

    while(1) {
        long long start, end, latency;

        start = ustime();
        compute_something_fast();
        end = ustime();
        latency = end-start;
        runs++;
        if (latency <= 0) continue;

         
        if (latency > max_latency) {
            max_latency = latency;
            printf("Max latency so far: %lld microseconds.\n", max_latency);
        }

        double avg_us = (double)run_time/runs;
        double avg_ns = avg_us * 1e3;
        if (force_cancel_loop || end > test_end) {
            printf("\n%lld total runs "
                "(avg latency: "
                "%.4f microseconds / %.2f nanoseconds per run).\n",
                runs, avg_us, avg_ns);
            printf("Worst run took %.0fx longer than the average latency.\n",
                max_latency / avg_us);
            exit(0);
        }
    }
}



 

int main(int argc, char **argv) {
    int firstarg;

    config.hostip = sdsnew("127.0.0.1");
    config.hostport = 6379;
    config.hostsocket = ((void *)0);
    config.repeat = 1;
    config.interval = 0;
    config.dbnum = 0;
    config.interactive = 0;
    config.shutdown = 0;
    config.monitor_mode = 0;
    config.pubsub_mode = 0;
    config.latency_mode = 0;
    config.latency_dist_mode = 0;
    config.latency_history = 0;
    config.lru_test_mode = 0;
    config.lru_test_sample_size = 0;
    config.cluster_mode = 0;
    config.slave_mode = 0;
    config.getrdb_mode = 0;
    config.stat_mode = 0;
    config.scan_mode = 0;
    config.intrinsic_latency_mode = 0;
    config.pattern = ((void *)0);
    config.rdb_filename = ((void *)0);
    config.pipe_mode = 0;
    config.pipe_timeout = 30;
    config.bigkeys = 0;
    config.hotkeys = 0;
    config.stdinarg = 0;
    config.auth = ((void *)0);
    config.eval = ((void *)0);
    config.eval_ldb = 0;
    config.eval_ldb_end = 0;
    config.eval_ldb_sync = 0;
    config.enable_ldb_on_eval = 0;
    config.last_cmd_type = -1;
    config.verbose = 0;
    config.no_auth_warning = 0;
    config.cluster_manager_command.name = ((void *)0);
    config.cluster_manager_command.argc = 0;
    config.cluster_manager_command.argv = ((void *)0);
    config.cluster_manager_command.flags = 0;
    config.cluster_manager_command.replicas = 0;
    config.cluster_manager_command.from = ((void *)0);
    config.cluster_manager_command.to = ((void *)0);
    config.cluster_manager_command.weight = ((void *)0);
    config.cluster_manager_command.weight_argc = 0;
    config.cluster_manager_command.slots = 0;
    config.cluster_manager_command.timeout = 60000;
    config.cluster_manager_command.pipeline = 10;
    config.cluster_manager_command.threshold =
        2;
    config.cluster_manager_command.backup_dir = ((void *)0);
    pref.hints = 1;

    spectrum_palette = spectrum_palette_color;
    spectrum_palette_size = spectrum_palette_color_size;

    if (!isatty(fileno(stdout)) && (getenv("FAKETTY") == ((void *)0)))
        config.output = 1;
    else
        config.output = 0;
    config.mb_delim = sdsnew("\n");

    firstarg = parseOptions(argc,argv);
    argc -= firstarg;
    argv += firstarg;

    parseEnv();

     
    if ((config . cluster_manager_command . name != ((void *)0))) {
        clusterManagerCommandProc *proc = validateClusterManagerCommand();
        if (!proc) {
            sdsfree(config.hostip);
            sdsfree(config.mb_delim);
            exit(1);
        }
        clusterManagerMode(proc);
    }

     
    if (config.latency_mode) {
        if (cliConnect(0) == -1) exit(1);
        latencyMode();
    }

     
    if (config.latency_dist_mode) {
        if (cliConnect(0) == -1) exit(1);
        latencyDistMode();
    }

     
    if (config.slave_mode) {
        if (cliConnect(0) == -1) exit(1);
        sendCapa();
        slaveMode();
    }

     
    if (config.getrdb_mode) {
        if (cliConnect(0) == -1) exit(1);
        sendCapa();
        getRDB(((void *)0));
    }

     
    if (config.pipe_mode) {
        if (cliConnect(0) == -1) exit(1);
        pipeMode();
    }

     
    if (config.bigkeys) {
        if (cliConnect(0) == -1) exit(1);
        findBigKeys(0, 0);
    }

     
    if (config.memkeys) {
        if (cliConnect(0) == -1) exit(1);
        findBigKeys(1, config.memkeys_samples);
    }

     
    if (config.hotkeys) {
        if (cliConnect(0) == -1) exit(1);
        findHotKeys();
    }

     
    if (config.stat_mode) {
        if (cliConnect(0) == -1) exit(1);
        if (config.interval == 0) config.interval = 1000000;
        statMode();
    }

     
    if (config.scan_mode) {
        if (cliConnect(0) == -1) exit(1);
        scanMode();
    }

     
    if (config.lru_test_mode) {
        if (cliConnect(0) == -1) exit(1);
        LRUTestMode();
    }

     
    if (config.intrinsic_latency_mode) intrinsicLatencyMode();

     
    if (argc == 0 && !config.eval) {
         
        signal(13, ((__sighandler_t) 1));

        
 
        cliConnect(0);
        repl();
    }

     
    if (cliConnect(0) != 0) exit(1);
    if (config.eval) {
        return evalMode(argc,argv);
    } else {
        return noninteractive(argc,convertToSds(argc,argv));
    }
}
