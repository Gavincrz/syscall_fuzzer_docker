# 1 "redis-benchmark.c"
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

# 1 "redis-benchmark.c"




























 

# 1 "fmacros.h"



























 


#define _REDIS_FMACRO_H

#define _BSD_SOURCE


#define _GNU_SOURCE
#define _DEFAULT_SOURCE







#define _XOPEN_SOURCE 700



 








#define _LARGEFILE_SOURCE
#define _FILE_OFFSET_BITS 64

# 32 "redis-benchmark.c"

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

# 34 "redis-benchmark.c"
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




# 35 "redis-benchmark.c"
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







# 36 "redis-benchmark.c"
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




# 37 "redis-benchmark.c"
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
# 38 "redis-benchmark.c"
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




# 39 "redis-benchmark.c"
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



# 40 "redis-benchmark.c"
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



# 41 "redis-benchmark.c"
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
# 42 "redis-benchmark.c"
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
# 43 "redis-benchmark.c"
# 1 "/usr/include/pthread.h"















 


#define _PTHREAD_H	1

# 1 "/usr/include/sched.h"
















 


#define	_SCHED_H	1



 


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
# 30 "/usr/include/sched.h"












 
# 1 "/usr/include/x86_64-linux-gnu/bits/sched.h"

















 


#define _BITS_SCHED_H 1





 
#define SCHED_OTHER		0
#define SCHED_FIFO		1
#define SCHED_RR		2

# define SCHED_BATCH		3
# define SCHED_ISO		4
# define SCHED_IDLE		5
# define SCHED_DEADLINE		6

# define SCHED_RESET_ON_FORK	0x40000000



 
# define CSIGNAL       0x000000ff  
# define CLONE_VM      0x00000100  
# define CLONE_FS      0x00000200  
# define CLONE_FILES   0x00000400  
# define CLONE_SIGHAND 0x00000800  
# define CLONE_PTRACE  0x00002000  
# define CLONE_VFORK   0x00004000 # define CLONE_PARENT  0x00008000 # define CLONE_THREAD  0x00010000  




# define CLONE_NEWNS   0x00020000  
# define CLONE_SYSVSEM 0x00040000  
# define CLONE_SETTLS  0x00080000  
# define CLONE_PARENT_SETTID 0x00100000 # define CLONE_CHILD_CLEARTID 0x00200000 # define CLONE_DETACHED 0x00400000  




# define CLONE_UNTRACED 0x00800000 # define CLONE_CHILD_SETTID 0x01000000 # define CLONE_NEWCGROUP    0x02000000	 




# define CLONE_NEWUTS	0x04000000	 
# define CLONE_NEWIPC	0x08000000	 
# define CLONE_NEWUSER	0x10000000	 
# define CLONE_NEWPID	0x20000000	 
# define CLONE_NEWNET	0x40000000	 
# define CLONE_IO	0x80000000	 


 
struct sched_param
{
  int sched_priority;
};




 
extern int clone (int (*__fn) (void *__arg), void *__child_stack,
		  int __flags, void *__arg, ...) __attribute__ ((__nothrow__ , __leaf__));

 
extern int unshare (int __flags) __attribute__ ((__nothrow__ , __leaf__));

 
extern int sched_getcpu (void) __attribute__ ((__nothrow__ , __leaf__));

 
extern int setns (int __fd, int __nstype) __attribute__ ((__nothrow__ , __leaf__));




# 44 "/usr/include/sched.h"
# 1 "/usr/include/x86_64-linux-gnu/bits/cpu-set.h"

















 


#define _BITS_CPU_SET_H 1





 
#define __CPU_SETSIZE	1024
#define __NCPUBITS	(8 * sizeof (__cpu_mask))

 
typedef unsigned long int __cpu_mask;

 
#define __CPUELT(cpu)	((cpu) / __NCPUBITS)
#define __CPUMASK(cpu)	((__cpu_mask) 1 << ((cpu) % __NCPUBITS))

 
typedef struct
{
  __cpu_mask __bits[1024 / (8 * sizeof (__cpu_mask))];
} cpu_set_t;

 

# define __CPU_ZERO_S(setsize, cpusetp)   do __builtin_memset (cpusetp, '\0', setsize); while (0)
# 58 "/usr/include/x86_64-linux-gnu/bits/cpu-set.h"
#define __CPU_SET_S(cpu, setsize, cpusetp)   (__extension__							         ({ size_t __cpu = (cpu);						            __cpu / 8 < (setsize)						            ? (((__cpu_mask *) ((cpusetp)->__bits))[__CPUELT (__cpu)]		      	 |= __CPUMASK (__cpu))						            : 0; }))
# 65 "/usr/include/x86_64-linux-gnu/bits/cpu-set.h"
#define __CPU_CLR_S(cpu, setsize, cpusetp)   (__extension__							         ({ size_t __cpu = (cpu);						            __cpu / 8 < (setsize)						            ? (((__cpu_mask *) ((cpusetp)->__bits))[__CPUELT (__cpu)]		      	 &= ~__CPUMASK (__cpu))						            : 0; }))
# 72 "/usr/include/x86_64-linux-gnu/bits/cpu-set.h"
#define __CPU_ISSET_S(cpu, setsize, cpusetp)   (__extension__							         ({ size_t __cpu = (cpu);						            __cpu / 8 < (setsize)						            ? ((((const __cpu_mask *) ((cpusetp)->__bits))[__CPUELT (__cpu)]	      	  & __CPUMASK (__cpu))) != 0					            : 0; }))
# 79 "/usr/include/x86_64-linux-gnu/bits/cpu-set.h"

#define __CPU_COUNT_S(setsize, cpusetp)   __sched_cpucount (setsize, cpusetp)



# define __CPU_EQUAL_S(setsize, cpusetp1, cpusetp2)   (__builtin_memcmp (cpusetp1, cpusetp2, setsize) == 0)
# 98 "/usr/include/x86_64-linux-gnu/bits/cpu-set.h"

#define __CPU_OP_S(setsize, destset, srcset1, srcset2, op)   (__extension__							         ({ cpu_set_t *__dest = (destset);					            const __cpu_mask *__arr1 = (srcset1)->__bits;			            const __cpu_mask *__arr2 = (srcset2)->__bits;			            size_t __imax = (setsize) / sizeof (__cpu_mask);			            size_t __i;							            for (__i = 0; __i < __imax; ++__i)				      	((__cpu_mask *) __dest->__bits)[__i] = __arr1[__i] op __arr2[__i];          __dest; }))
# 109 "/usr/include/x86_64-linux-gnu/bits/cpu-set.h"

#define __CPU_ALLOC_SIZE(count)   ((((count) + __NCPUBITS - 1) / __NCPUBITS) * sizeof (__cpu_mask))

#define __CPU_ALLOC(count) __sched_cpualloc (count)
#define __CPU_FREE(cpuset) __sched_cpufree (cpuset)



extern int __sched_cpucount (size_t __setsize, const cpu_set_t *__setp)
     __attribute__ ((__nothrow__ , __leaf__));
extern cpu_set_t *__sched_cpualloc (size_t __count) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
extern void __sched_cpufree (cpu_set_t *__set) __attribute__ ((__nothrow__ , __leaf__));



# 45 "/usr/include/sched.h"

 
#define sched_priority    sched_priority
#define __sched_priority  sched_priority




 
extern int sched_setparam (__pid_t __pid, const struct sched_param *__param)
     __attribute__ ((__nothrow__ , __leaf__));

 
extern int sched_getparam (__pid_t __pid, struct sched_param *__param) __attribute__ ((__nothrow__ , __leaf__));

 
extern int sched_setscheduler (__pid_t __pid, int __policy,
			       const struct sched_param *__param) __attribute__ ((__nothrow__ , __leaf__));

 
extern int sched_getscheduler (__pid_t __pid) __attribute__ ((__nothrow__ , __leaf__));

 
extern int sched_yield (void) __attribute__ ((__nothrow__ , __leaf__));

 
extern int sched_get_priority_max (int __algorithm) __attribute__ ((__nothrow__ , __leaf__));

 
extern int sched_get_priority_min (int __algorithm) __attribute__ ((__nothrow__ , __leaf__));

 
extern int sched_rr_get_interval (__pid_t __pid, struct timespec *__t) __attribute__ ((__nothrow__ , __leaf__));



 
# define CPU_SETSIZE __CPU_SETSIZE
# define CPU_SET(cpu, cpusetp)	 __CPU_SET_S (cpu, sizeof (cpu_set_t), cpusetp)
# define CPU_CLR(cpu, cpusetp)	 __CPU_CLR_S (cpu, sizeof (cpu_set_t), cpusetp)
# define CPU_ISSET(cpu, cpusetp) __CPU_ISSET_S (cpu, sizeof (cpu_set_t), 						cpusetp)

# define CPU_ZERO(cpusetp)	 __CPU_ZERO_S (sizeof (cpu_set_t), cpusetp)
# define CPU_COUNT(cpusetp)	 __CPU_COUNT_S (sizeof (cpu_set_t), cpusetp)

# define CPU_SET_S(cpu, setsize, cpusetp)   __CPU_SET_S (cpu, setsize, cpusetp)
# define CPU_CLR_S(cpu, setsize, cpusetp)   __CPU_CLR_S (cpu, setsize, cpusetp)
# define CPU_ISSET_S(cpu, setsize, cpusetp) __CPU_ISSET_S (cpu, setsize, 							   cpusetp)

# define CPU_ZERO_S(setsize, cpusetp)	    __CPU_ZERO_S (setsize, cpusetp)
# define CPU_COUNT_S(setsize, cpusetp)	    __CPU_COUNT_S (setsize, cpusetp)

# define CPU_EQUAL(cpusetp1, cpusetp2)   __CPU_EQUAL_S (sizeof (cpu_set_t), cpusetp1, cpusetp2)

# define CPU_EQUAL_S(setsize, cpusetp1, cpusetp2)   __CPU_EQUAL_S (setsize, cpusetp1, cpusetp2)


# define CPU_AND(destset, srcset1, srcset2)   __CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2, &)

# define CPU_OR(destset, srcset1, srcset2)   __CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2, |)

# define CPU_XOR(destset, srcset1, srcset2)   __CPU_OP_S (sizeof (cpu_set_t), destset, srcset1, srcset2, ^)

# define CPU_AND_S(setsize, destset, srcset1, srcset2)   __CPU_OP_S (setsize, destset, srcset1, srcset2, &)

# define CPU_OR_S(setsize, destset, srcset1, srcset2)   __CPU_OP_S (setsize, destset, srcset1, srcset2, |)

# define CPU_XOR_S(setsize, destset, srcset1, srcset2)   __CPU_OP_S (setsize, destset, srcset1, srcset2, ^)


# define CPU_ALLOC_SIZE(count) __CPU_ALLOC_SIZE (count)
# define CPU_ALLOC(count) __CPU_ALLOC (count)
# define CPU_FREE(cpuset) __CPU_FREE (cpuset)


 
extern int sched_setaffinity (__pid_t __pid, size_t __cpusetsize,
			      const cpu_set_t *__cpuset) __attribute__ ((__nothrow__ , __leaf__));

 
extern int sched_getaffinity (__pid_t __pid, size_t __cpusetsize,
			      cpu_set_t *__cpuset) __attribute__ ((__nothrow__ , __leaf__));




# 24 "/usr/include/pthread.h"


# 1 "/usr/include/x86_64-linux-gnu/bits/setjmp.h"















 

 

#define _BITS_SETJMP_H  1





# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
 


# define __WORDSIZE	64







# define __WORDSIZE_TIME64_COMPAT32	1
 
# define __SYSCALL_WORDSIZE		64
# 27 "/usr/include/x86_64-linux-gnu/bits/setjmp.h"




typedef long int __jmp_buf[8];








# 28 "/usr/include/pthread.h"
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
 


# define __WORDSIZE	64







# define __WORDSIZE_TIME64_COMPAT32	1
 
# define __SYSCALL_WORDSIZE		64
# 29 "/usr/include/pthread.h"



 
enum
{
  PTHREAD_CREATE_JOINABLE,
#define PTHREAD_CREATE_JOINABLE	PTHREAD_CREATE_JOINABLE
  PTHREAD_CREATE_DETACHED
#define PTHREAD_CREATE_DETACHED	PTHREAD_CREATE_DETACHED
};


 
enum
{
  PTHREAD_MUTEX_TIMED_NP,
  PTHREAD_MUTEX_RECURSIVE_NP,
  PTHREAD_MUTEX_ERRORCHECK_NP,
  PTHREAD_MUTEX_ADAPTIVE_NP

  ,
  PTHREAD_MUTEX_NORMAL = PTHREAD_MUTEX_TIMED_NP,
  PTHREAD_MUTEX_RECURSIVE = PTHREAD_MUTEX_RECURSIVE_NP,
  PTHREAD_MUTEX_ERRORCHECK = PTHREAD_MUTEX_ERRORCHECK_NP,
  PTHREAD_MUTEX_DEFAULT = PTHREAD_MUTEX_NORMAL


   
  , PTHREAD_MUTEX_FAST_NP = PTHREAD_MUTEX_TIMED_NP

};



 
enum
{
  PTHREAD_MUTEX_STALLED,
  PTHREAD_MUTEX_STALLED_NP = PTHREAD_MUTEX_STALLED,
  PTHREAD_MUTEX_ROBUST,
  PTHREAD_MUTEX_ROBUST_NP = PTHREAD_MUTEX_ROBUST
};




 
enum
{
  PTHREAD_PRIO_NONE,
  PTHREAD_PRIO_INHERIT,
  PTHREAD_PRIO_PROTECT
};




# define PTHREAD_MUTEX_INITIALIZER   { { 0, 0, 0, 0, 0, __PTHREAD_SPINS, { 0, 0 } } }


#  define PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP   { { 0, 0, 0, 0, PTHREAD_MUTEX_RECURSIVE_NP, __PTHREAD_SPINS, { 0, 0 } } }

#  define PTHREAD_ERRORCHECK_MUTEX_INITIALIZER_NP   { { 0, 0, 0, 0, PTHREAD_MUTEX_ERRORCHECK_NP, __PTHREAD_SPINS, { 0, 0 } } }

#  define PTHREAD_ADAPTIVE_MUTEX_INITIALIZER_NP   { { 0, 0, 0, 0, PTHREAD_MUTEX_ADAPTIVE_NP, __PTHREAD_SPINS, { 0, 0 } } }


# 111 "/usr/include/pthread.h"


 

enum
{
  PTHREAD_RWLOCK_PREFER_READER_NP,
  PTHREAD_RWLOCK_PREFER_WRITER_NP,
  PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP,
  PTHREAD_RWLOCK_DEFAULT_NP = PTHREAD_RWLOCK_PREFER_READER_NP
};



 






 
# define PTHREAD_RWLOCK_INITIALIZER   { { 0, 0, 0, 0, 0, 0, 0, 0, __PTHREAD_RWLOCK_ELISION_EXTRA, 0, 0 } }



#   define PTHREAD_RWLOCK_WRITER_NONRECURSIVE_INITIALIZER_NP   { { 0, 0, 0, 0, 0, 0, 0, 0, __PTHREAD_RWLOCK_ELISION_EXTRA, 0,					      	PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP } }
# 153 "/usr/include/pthread.h"


 
enum
{
  PTHREAD_INHERIT_SCHED,
#define PTHREAD_INHERIT_SCHED   PTHREAD_INHERIT_SCHED
  PTHREAD_EXPLICIT_SCHED
#define PTHREAD_EXPLICIT_SCHED  PTHREAD_EXPLICIT_SCHED
};


 
enum
{
  PTHREAD_SCOPE_SYSTEM,
#define PTHREAD_SCOPE_SYSTEM    PTHREAD_SCOPE_SYSTEM
  PTHREAD_SCOPE_PROCESS
#define PTHREAD_SCOPE_PROCESS   PTHREAD_SCOPE_PROCESS
};


 
enum
{
  PTHREAD_PROCESS_PRIVATE,
#define PTHREAD_PROCESS_PRIVATE PTHREAD_PROCESS_PRIVATE
  PTHREAD_PROCESS_SHARED
#define PTHREAD_PROCESS_SHARED  PTHREAD_PROCESS_SHARED
};



 
#define PTHREAD_COND_INITIALIZER { { {0}, {0}, {0, 0}, {0, 0}, 0, 0, {0, 0} } }


 
struct _pthread_cleanup_buffer
{
  void (*__routine) (void *);              
  void *__arg;                             
  int __canceltype;                        
  struct _pthread_cleanup_buffer *__prev;  
};

 
enum
{
  PTHREAD_CANCEL_ENABLE,
#define PTHREAD_CANCEL_ENABLE   PTHREAD_CANCEL_ENABLE
  PTHREAD_CANCEL_DISABLE
#define PTHREAD_CANCEL_DISABLE  PTHREAD_CANCEL_DISABLE
};
enum
{
  PTHREAD_CANCEL_DEFERRED,
#define PTHREAD_CANCEL_DEFERRED	PTHREAD_CANCEL_DEFERRED
  PTHREAD_CANCEL_ASYNCHRONOUS
#define PTHREAD_CANCEL_ASYNCHRONOUS	PTHREAD_CANCEL_ASYNCHRONOUS
};
#define PTHREAD_CANCELED ((void *) -1)


 
#define PTHREAD_ONCE_INIT 0





 
# define PTHREAD_BARRIER_SERIAL_THREAD -1







 
extern int pthread_create (pthread_t *__restrict __newthread,
			   const pthread_attr_t *__restrict __attr,
			   void *(*__start_routine) (void *),
			   void *__restrict __arg) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 3)));




 
extern void pthread_exit (void *__retval) __attribute__ ((__noreturn__));






 
extern int pthread_join (pthread_t __th, void **__thread_return);



 
extern int pthread_tryjoin_np (pthread_t __th, void **__thread_return) __attribute__ ((__nothrow__ , __leaf__));






 
extern int pthread_timedjoin_np (pthread_t __th, void **__thread_return,
				 const struct timespec *__abstime);





 
extern int pthread_detach (pthread_t __th) __attribute__ ((__nothrow__ , __leaf__));


 
extern pthread_t pthread_self (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int pthread_equal (pthread_t __thread1, pthread_t __thread2)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


 



 
extern int pthread_attr_init (pthread_attr_t *__attr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_attr_destroy (pthread_attr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_attr_getdetachstate (const pthread_attr_t *__attr,
					int *__detachstate)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int pthread_attr_setdetachstate (pthread_attr_t *__attr,
					int __detachstate)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


 
extern int pthread_attr_getguardsize (const pthread_attr_t *__attr,
				      size_t *__guardsize)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int pthread_attr_setguardsize (pthread_attr_t *__attr,
				      size_t __guardsize)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


 
extern int pthread_attr_getschedparam (const pthread_attr_t *__restrict __attr,
				       struct sched_param *__restrict __param)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int pthread_attr_setschedparam (pthread_attr_t *__restrict __attr,
				       const struct sched_param *__restrict
				       __param) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int pthread_attr_getschedpolicy (const pthread_attr_t *__restrict
					__attr, int *__restrict __policy)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int pthread_attr_setschedpolicy (pthread_attr_t *__attr, int __policy)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_attr_getinheritsched (const pthread_attr_t *__restrict
					 __attr, int *__restrict __inherit)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int pthread_attr_setinheritsched (pthread_attr_t *__attr,
					 int __inherit)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


 
extern int pthread_attr_getscope (const pthread_attr_t *__restrict __attr,
				  int *__restrict __scope)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int pthread_attr_setscope (pthread_attr_t *__attr, int __scope)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_attr_getstackaddr (const pthread_attr_t *__restrict
				      __attr, void **__restrict __stackaddr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2))) __attribute__ ((__deprecated__));




 
extern int pthread_attr_setstackaddr (pthread_attr_t *__attr,
				      void *__stackaddr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__deprecated__));

 
extern int pthread_attr_getstacksize (const pthread_attr_t *__restrict
				      __attr, size_t *__restrict __stacksize)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



 
extern int pthread_attr_setstacksize (pthread_attr_t *__attr,
				      size_t __stacksize)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


 
extern int pthread_attr_getstack (const pthread_attr_t *__restrict __attr,
				  void **__restrict __stackaddr,
				  size_t *__restrict __stacksize)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2, 3)));



 
extern int pthread_attr_setstack (pthread_attr_t *__attr, void *__stackaddr,
				  size_t __stacksize) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




 
extern int pthread_attr_setaffinity_np (pthread_attr_t *__attr,
					size_t __cpusetsize,
					const cpu_set_t *__cpuset)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));


 
extern int pthread_attr_getaffinity_np (const pthread_attr_t *__attr,
					size_t __cpusetsize,
					cpu_set_t *__cpuset)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));

 
extern int pthread_getattr_default_np (pthread_attr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


 
extern int pthread_setattr_default_np (const pthread_attr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



 
extern int pthread_getattr_np (pthread_t __th, pthread_attr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));



 


 
extern int pthread_setschedparam (pthread_t __target_thread, int __policy,
				  const struct sched_param *__param)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));

 
extern int pthread_getschedparam (pthread_t __target_thread,
				  int *__restrict __policy,
				  struct sched_param *__restrict __param)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));

 
extern int pthread_setschedprio (pthread_t __target_thread, int __prio)
     __attribute__ ((__nothrow__ , __leaf__));



 
extern int pthread_getname_np (pthread_t __target_thread, char *__buf,
			       size_t __buflen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

 
extern int pthread_setname_np (pthread_t __target_thread, const char *__name)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));




 
extern int pthread_getconcurrency (void) __attribute__ ((__nothrow__ , __leaf__));

 
extern int pthread_setconcurrency (int __level) __attribute__ ((__nothrow__ , __leaf__));






 
extern int pthread_yield (void) __attribute__ ((__nothrow__ , __leaf__));



 
extern int pthread_setaffinity_np (pthread_t __th, size_t __cpusetsize,
				   const cpu_set_t *__cpuset)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));

 
extern int pthread_getaffinity_np (pthread_t __th, size_t __cpusetsize,
				   cpu_set_t *__cpuset)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));



 







 
extern int pthread_once (pthread_once_t *__once_control,
			 void (*__init_routine) (void)) __attribute__ ((__nonnull__ (1, 2)));






 


 
extern int pthread_setcancelstate (int __state, int *__oldstate);


 
extern int pthread_setcanceltype (int __type, int *__oldtype);

 
extern int pthread_cancel (pthread_t __th);



 
extern void pthread_testcancel (void);


 

typedef struct
{
  struct
  {
    __jmp_buf __cancel_jmp_buf;
    int __mask_was_saved;
  } __cancel_jmp_buf[1];
  void *__pad[4];
} __pthread_unwind_buf_t __attribute__ ((__aligned__));

 

# define __cleanup_fct_attribute



 
struct __pthread_cleanup_frame
{
  void (*__cancel_routine) (void *);
  void *__cancel_arg;
  int __do_it;
  int __cancel_type;
};

# 658 "/usr/include/pthread.h"






 
# define pthread_cleanup_push(routine, arg)   do {									          __pthread_unwind_buf_t __cancel_buf;				          void (*__cancel_routine) (void *) = (routine);			          void *__cancel_arg = (arg);						          int __not_first_call = __sigsetjmp ((struct __jmp_buf_tag *) (void *)     					__cancel_buf.__cancel_jmp_buf, 0);        if (__glibc_unlikely (__not_first_call))				            {									      	__cancel_routine (__cancel_arg);				      	__pthread_unwind_next (&__cancel_buf);				      	 						            }									      									          __pthread_register_cancel (&__cancel_buf);				          do {
# 681 "/usr/include/pthread.h"
extern void __pthread_register_cancel (__pthread_unwind_buf_t *__buf)
     ;


 
# define pthread_cleanup_pop(execute)       do { } while (0);     } while (0);							          __pthread_unregister_cancel (&__cancel_buf);			          if (execute)							            __cancel_routine (__cancel_arg);					        } while (0)
# 693 "/usr/include/pthread.h"
extern void __pthread_unregister_cancel (__pthread_unwind_buf_t *__buf)
  ;




 
#  define pthread_cleanup_push_defer_np(routine, arg)   do {									          __pthread_unwind_buf_t __cancel_buf;				          void (*__cancel_routine) (void *) = (routine);			          void *__cancel_arg = (arg);						          int __not_first_call = __sigsetjmp ((struct __jmp_buf_tag *) (void *)     					__cancel_buf.__cancel_jmp_buf, 0);        if (__glibc_unlikely (__not_first_call))				            {									      	__cancel_routine (__cancel_arg);				      	__pthread_unwind_next (&__cancel_buf);				      	 						            }									      									          __pthread_register_cancel_defer (&__cancel_buf);			          do {
# 716 "/usr/include/pthread.h"
extern void __pthread_register_cancel_defer (__pthread_unwind_buf_t *__buf)
     ;



 
#  define pthread_cleanup_pop_restore_np(execute)       do { } while (0);     } while (0);							          __pthread_unregister_cancel_restore (&__cancel_buf);		          if (execute)							            __cancel_routine (__cancel_arg);					        } while (0)
# 729 "/usr/include/pthread.h"
extern void __pthread_unregister_cancel_restore (__pthread_unwind_buf_t *__buf)
  ;


 
extern void __pthread_unwind_next (__pthread_unwind_buf_t *__buf)
      __attribute__ ((__noreturn__))

     __attribute__ ((__weak__))

     ;


 
struct __jmp_buf_tag;
extern int __sigsetjmp (struct __jmp_buf_tag *__env, int __savemask) __attribute__ ((__nothrow__));


 

 
extern int pthread_mutex_init (pthread_mutex_t *__mutex,
			       const pthread_mutexattr_t *__mutexattr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_mutex_destroy (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_mutex_trylock (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_mutex_lock (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


 
extern int pthread_mutex_timedlock (pthread_mutex_t *__restrict __mutex,
				    const struct timespec *__restrict
				    __abstime) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


 
extern int pthread_mutex_unlock (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


 
extern int pthread_mutex_getprioceiling (const pthread_mutex_t *
					 __restrict __mutex,
					 int *__restrict __prioceiling)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


 
extern int pthread_mutex_setprioceiling (pthread_mutex_t *__restrict __mutex,
					 int __prioceiling,
					 int *__restrict __old_ceiling)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));



 
extern int pthread_mutex_consistent (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern int pthread_mutex_consistent_np (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




 


 
extern int pthread_mutexattr_init (pthread_mutexattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_mutexattr_destroy (pthread_mutexattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_mutexattr_getpshared (const pthread_mutexattr_t *
					 __restrict __attr,
					 int *__restrict __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int pthread_mutexattr_setpshared (pthread_mutexattr_t *__attr,
					 int __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


 
extern int pthread_mutexattr_gettype (const pthread_mutexattr_t *__restrict
				      __attr, int *__restrict __kind)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



 
extern int pthread_mutexattr_settype (pthread_mutexattr_t *__attr, int __kind)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


 
extern int pthread_mutexattr_getprotocol (const pthread_mutexattr_t *
					  __restrict __attr,
					  int *__restrict __protocol)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


 
extern int pthread_mutexattr_setprotocol (pthread_mutexattr_t *__attr,
					  int __protocol)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_mutexattr_getprioceiling (const pthread_mutexattr_t *
					     __restrict __attr,
					     int *__restrict __prioceiling)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int pthread_mutexattr_setprioceiling (pthread_mutexattr_t *__attr,
					     int __prioceiling)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


 
extern int pthread_mutexattr_getrobust (const pthread_mutexattr_t *__attr,
					int *__robustness)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern int pthread_mutexattr_getrobust_np (const pthread_mutexattr_t *__attr,
					   int *__robustness)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


 
extern int pthread_mutexattr_setrobust (pthread_mutexattr_t *__attr,
					int __robustness)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern int pthread_mutexattr_setrobust_np (pthread_mutexattr_t *__attr,
					   int __robustness)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





 


 
extern int pthread_rwlock_init (pthread_rwlock_t *__restrict __rwlock,
				const pthread_rwlockattr_t *__restrict
				__attr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_rwlock_destroy (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_rwlock_rdlock (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_rwlock_tryrdlock (pthread_rwlock_t *__rwlock)
  __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


 
extern int pthread_rwlock_timedrdlock (pthread_rwlock_t *__restrict __rwlock,
				       const struct timespec *__restrict
				       __abstime) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


 
extern int pthread_rwlock_wrlock (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_rwlock_trywrlock (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


 
extern int pthread_rwlock_timedwrlock (pthread_rwlock_t *__restrict __rwlock,
				       const struct timespec *__restrict
				       __abstime) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


 
extern int pthread_rwlock_unlock (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


 

 
extern int pthread_rwlockattr_init (pthread_rwlockattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_rwlockattr_destroy (pthread_rwlockattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_rwlockattr_getpshared (const pthread_rwlockattr_t *
					  __restrict __attr,
					  int *__restrict __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int pthread_rwlockattr_setpshared (pthread_rwlockattr_t *__attr,
					  int __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_rwlockattr_getkind_np (const pthread_rwlockattr_t *
					  __restrict __attr,
					  int *__restrict __pref)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int pthread_rwlockattr_setkind_np (pthread_rwlockattr_t *__attr,
					  int __pref) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



 


 
extern int pthread_cond_init (pthread_cond_t *__restrict __cond,
			      const pthread_condattr_t *__restrict __cond_attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_cond_destroy (pthread_cond_t *__cond)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_cond_signal (pthread_cond_t *__cond)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_cond_broadcast (pthread_cond_t *__cond)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));





 
extern int pthread_cond_wait (pthread_cond_t *__restrict __cond,
			      pthread_mutex_t *__restrict __mutex)
     __attribute__ ((__nonnull__ (1, 2)));







 
extern int pthread_cond_timedwait (pthread_cond_t *__restrict __cond,
				   pthread_mutex_t *__restrict __mutex,
				   const struct timespec *__restrict __abstime)
     __attribute__ ((__nonnull__ (1, 2, 3)));

 

 
extern int pthread_condattr_init (pthread_condattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_condattr_destroy (pthread_condattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_condattr_getpshared (const pthread_condattr_t *
					__restrict __attr,
					int *__restrict __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int pthread_condattr_setpshared (pthread_condattr_t *__attr,
					int __pshared) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


 
extern int pthread_condattr_getclock (const pthread_condattr_t *
				      __restrict __attr,
				      __clockid_t *__restrict __clock_id)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int pthread_condattr_setclock (pthread_condattr_t *__attr,
				      __clockid_t __clock_id)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




 


 
extern int pthread_spin_init (pthread_spinlock_t *__lock, int __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_spin_destroy (pthread_spinlock_t *__lock)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_spin_lock (pthread_spinlock_t *__lock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_spin_trylock (pthread_spinlock_t *__lock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_spin_unlock (pthread_spinlock_t *__lock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


 


 
extern int pthread_barrier_init (pthread_barrier_t *__restrict __barrier,
				 const pthread_barrierattr_t *__restrict
				 __attr, unsigned int __count)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_barrier_destroy (pthread_barrier_t *__barrier)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_barrier_wait (pthread_barrier_t *__barrier)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


 
extern int pthread_barrierattr_init (pthread_barrierattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_barrierattr_destroy (pthread_barrierattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_barrierattr_getpshared (const pthread_barrierattr_t *
					   __restrict __attr,
					   int *__restrict __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int pthread_barrierattr_setpshared (pthread_barrierattr_t *__attr,
					   int __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



 






 
extern int pthread_key_create (pthread_key_t *__key,
			       void (*__destr_function) (void *))
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int pthread_key_delete (pthread_key_t __key) __attribute__ ((__nothrow__ , __leaf__));

 
extern void *pthread_getspecific (pthread_key_t __key) __attribute__ ((__nothrow__ , __leaf__));

 
extern int pthread_setspecific (pthread_key_t __key,
				const void *__pointer) __attribute__ ((__nothrow__ , __leaf__)) ;



 
extern int pthread_getcpuclockid (pthread_t __thread_id,
				  __clockid_t *__clock_id)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));












 

extern int pthread_atfork (void (*__prepare) (void),
			   void (*__parent) (void),
			   void (*__child) (void)) __attribute__ ((__nothrow__ , __leaf__));



 
extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) pthread_equal (pthread_t __thread1, pthread_t __thread2)
{
  return __thread1 == __thread2;
}




# 44 "redis-benchmark.c"

# 1 "../deps/hiredis/sds.h"






























 


#define __SDS_H

#define SDS_MAX_PREALLOC (1024*1024)

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
# 40 "../deps/hiredis/sds.h"
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
# 41 "../deps/hiredis/sds.h"

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





# 46 "redis-benchmark.c"
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

# 47 "redis-benchmark.c"
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





# 48 "redis-benchmark.c"
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

# 49 "redis-benchmark.c"
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

# 50 "redis-benchmark.c"
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






# 51 "redis-benchmark.c"
# 1 "atomicvar.h"

























































 




#define __ATOMIC_VAR_H




 



 

#define atomicIncr(var,count) __atomic_add_fetch(&var,(count),__ATOMIC_RELAXED)
#define atomicGetIncr(var,oldvalue_var,count) do {     oldvalue_var = __atomic_fetch_add(&var,(count),__ATOMIC_RELAXED); } while(0)


#define atomicDecr(var,count) __atomic_sub_fetch(&var,(count),__ATOMIC_RELAXED)
#define atomicGet(var,dstvar) do {     dstvar = __atomic_load_n(&var,__ATOMIC_RELAXED); } while(0)


#define atomicSet(var,value) __atomic_store_n(&var,value,__ATOMIC_RELAXED)
#define REDIS_ATOMIC_API "atomic-builtin"

# 52 "redis-benchmark.c"
# 1 "crc16_slottable.h"

#define _CRC16_TABLE_H__






 

const char *crc16_slot_table[] = {
"06S", "Qi", "5L5", "4Iu", "4gY", "460", "1Y7", "1LV", "0QG", "ru", "7Ok", "4ji", "4DE", "65n", "2JH", "I8", "F9", "SX", "7nF", "4KD", 
"4eh", "6PK", "2ke", "1Ng", "0Sv", "4L", "491", "4hX", "4Ft", "5C4", "2Hy", "09R", "021", "0cX", "4Xv", "6mU", "6Cy", "42R", "0Mt", "nF", 
"cv", "1Pe", "5kK", "6NI", "74L", "4UF", "0nh", "MZ", "2TJ", "0ai", "4ZG", "6od", "6AH", "40c", "0OE", "lw", "aG", "0Bu", "5iz", "6Lx", 
"5R7", "4Ww", "0lY", "Ok", "5n3", "4ks", "8YE", "7g", "2KR", "1nP", "714", "64t", "69D", "4Ho", "07I", "Ps", "2hN", "1ML", "4fC", "7CA", 
"avs", "4iB", "0Rl", "5V", "2Ic", "08H", "4Gn", "66E", "aUo", "b4e", "05x", "RB", "8f", "8VD", "4dr", "5a2", "4zp", "6OS", "bl", "355", 
"0or", "1j2", "75V", "bno", "4Yl", "6lO", "Ap", "0bB", "0Ln", "2yM", "6Bc", "43H", "4xA", "6Mb", "22D", "14", "0mC", "Nq", "6cN", "4Vm", 
"ban", "aDl", "CA", "14Z", "8GG", "mm", "549", "41y", "53t", "464", "1Y3", "1LR", "06W", "Qm", "5L1", "4Iq", "4DA", "65j", "2JL", "1oN", 
"0QC", "6y", "7Oo", "4jm", "4el", "6PO", "9x", "1Nc", "04f", "2EM", "7nB", "bqs", "4Fp", "5C0", "d6F", "09V", "0Sr", "4H", "495", "bRo", 
"aio", "42V", "0Mp", "nB", "025", "17u", "4Xr", "6mQ", "74H", "4UB", "0nl", "3Kn", "cr", "1Pa", "5kO", "6NM", "6AL", "40g", "0OA", "ls", 
"2TN", "0am", "4ZC", "aEr", "5R3", "4Ws", "18t", "Oo", "aC", "0Bq", "bCl", "afn", "2KV", "1nT", "5Uz", "64p", "5n7", "4kw", "0PY", "7c", 
"2hJ", "1MH", "4fG", "6Sd", "7mi", "4Hk", "07M", "Pw", "2Ig", "08L", "4Gj", "66A", "7LD", "4iF", "0Rh", "5R", "8b", "1Oy", "4dv", "5a6", 
"7oX", "4JZ", "0qt", "RF", "0ov", "LD", "4A9", "4TX", "4zt", "6OW", "bh", "0AZ", "z9", "oX", "6Bg", "43L", "4Yh", "6lK", "At", "0bF", 
"0mG", "Nu", "6cJ", "4Vi", "4xE", "6Mf", "2vH", "10", "8GC", "mi", "5p5", "4uu", "5Kx", "4N8", "CE", "1pV", "0QO", "6u", "7Oc", "4ja", 
"4DM", "65f", "3Za", "I0", "0rS", "Qa", "68V", "b7F", "4gQ", "468", "dSo", "285", "274", "4D", "499", "4hP", "b8G", "67W", "0h3", "09Z", 
"F1", "SP", "7nN", "4KL", "51I", "6PC", "9t", "1No", "21g", "1Pm", "5kC", "6NA", "74D", "4UN", "X3", "MR", "029", "0cP", "bbM", "79t", 
"4c3", "42Z", "8Dd", "nN", "aO", "8Ke", "4yS", "4l2", "76u", "635", "0lQ", "Oc", "BS", "W2", "4ZO", "6ol", "7Qa", "40k", "0OM", "2zn", 
"69L", "4Hg", "07A", "2Fj", "2hF", "k6", "4fK", "6Sh", "7Ny", "6K9", "0PU", "7o", "2KZ", "1nX", "4EW", "4P6", "7oT", "4JV", "05p", "RJ", 
"8n", "1Ou", "4dz", "6QY", "7LH", "4iJ", "d7", "qV", "2Ik", "1li", "4Gf", "66M", "4Yd", "6lG", "Ax", "0bJ", "z5", "oT", "6Bk", "4wH", 
"4zx", "aeI", "bd", "0AV", "0oz", "LH", "4A5", "4TT", "5Kt", "4N4", "CI", "14R", "0NW", "me", "541", "41q", "4xI", "6Mj", "22L", "u4", 
"0mK", "Ny", "6cF", "4Ve", "4DI", "65b", "2JD", "I4", "0QK", "6q", "7Og", "4je", "4gU", "4r4", "2iX", "1LZ", "0rW", "Qe", "5L9", "4Iy", 
"4Fx", "5C8", "0h7", "1mw", "0Sz", "pH", "7MV", "4hT", "4ed", "6PG", "9p", "1Nk", "F5", "ST", "7nJ", "4KH", "7pH", "4UJ", "X7", "MV", 
"cz", "1Pi", "5kG", "6NE", "4c7", "4vV", "0Mx", "nJ", "0v5", "0cT", "4Xz", "6mY", "6bX", "5GZ", "0lU", "Og", "aK", "0By", "4yW", "4l6", 
"6AD", "40o", "0OI", "2zj", "BW", "W6", "4ZK", "6oh", "2hB", "k2", "4fO", "6Sl", "69H", "4Hc", "07E", "2Fn", "d5e", "83m", "4ES", "4P2", 
"a0F", "bQL", "0PQ", "7k", "8j", "1Oq", "50W", "hbv", "7oP", "4JR", "05t", "RN", "2Io", "08D", "4Gb", "66I", "7LL", "4iN", "d3", "5Z", 
"z1", "oP", "6Bo", "43D", "5IA", "6lC", "2Wm", "0bN", "8ff", "LL", "4A1", "4TP", "cPn", "aeM", "0T3", "0AR", "0NS", "ma", "545", "41u", 
"5Kp", "4N0", "CM", "14V", "0mO", "2Xl", "6cB", "4Va", "4xM", "6Mn", "22H", "18", "04s", "SI", "7nW", "4KU", "4ey", "6PZ", "9m", "1Nv", 
"e4", "pU", "7MK", "4hI", "4Fe", "67N", "2Hh", "09C", "06B", "Qx", "68O", "4Id", "4gH", "6Rk", "2iE", "j5", "0QV", "6l", "5o8", "4jx", 
"4DT", "4Q5", "2JY", "82j", "BJ", "0ax", "4ZV", "4O7", "552", "40r", "0OT", "lf", "aV", "t7", "4yJ", "6Li", "6bE", "4Wf", "0lH", "Oz", 
"2Vj", "0cI", "4Xg", "6mD", "6Ch", "42C", "0Me", "nW", "cg", "1Pt", "5kZ", "6NX", "7pU", "4UW", "0ny", "MK", "7LQ", "4iS", "267", "5G", 
"0i0", "08Y", "b9D", "66T", "7oM", "4JO", "G2", "RS", "8w", "1Ol", "4dc", "7Aa", "atS", "4kb", "0PL", "7v", "2KC", "H3", "4EN", "64e", 
"69U", "b6E", "07X", "Pb", "dRl", "296", "4fR", "4s3", "4xP", "4m1", "22U", "8Jf", "0mR", "0x3", "77v", "626", "5Km", "6no", "CP", "V1", 
"0NN", "3kL", "7Pb", "41h", "4za", "6OB", "20d", "0AO", "Y0", "LQ", "6an", "4TM", "bcN", "78w", "Aa", "0bS", "8Eg", "oM", "4b0", "43Y", 
"51T", "azL", "9i", "1Nr", "04w", "SM", "7nS", "4KQ", "4Fa", "67J", "2Hl", "09G", "e0", "4Y", "7MO", "4hM", "4gL", "6Ro", "2iA", "j1", 
"06F", "2Gm", "68K", "5YA", "4DP", "4Q1", "d4f", "82n", "0QR", "6h", "a1E", "bPO", "556", "40v", "0OP", "lb", "BN", "15U", "4ZR", "4O3", 
"6bA", "4Wb", "0lL", "2Yo", "aR", "t3", "4yN", "6Lm", "6Cl", "42G", "0Ma", "nS", "2Vn", "0cM", "4Xc", "79i", "74Y", "4US", "8ge", "MO", 
"cc", "1Pp", "bAL", "adN", "0i4", "1lt", "5WZ", "66P", "7LU", "4iW", "0Ry", "5C", "8s", "1Oh", "4dg", "6QD", "7oI", "4JK", "G6", "RW", 
"2KG", "H7", "4EJ", "64a", "7Nd", "4kf", "0PH", "7r", "1X8", "1MY", "4fV", "4s7", "69Q", "4Hz", "0sT", "Pf", "0mV", "Nd", "5S8", "4Vx", 
"4xT", "4m5", "22Q", "0Cz", "0NJ", "mx", "7Pf", "41l", "5Ki", "6nk", "CT", "V5", "Y4", "LU", "6aj", "4TI", "4ze", "6OF", "by", "0AK", 
"2l9", "oI", "4b4", "4wU", "4Yy", "6lZ", "Ae", "0bW", "0So", "4U", "7MC", "4hA", "4Fm", "67F", "3XA", "09K", "0ps", "SA", "aTl", "b5f", 
"4eq", "6PR", "9e", "8WG", "8XF", "6d", "5o0", "4jp", "707", "65w", "1z2", "1oS", "06J", "Qp", "68G", "4Il", "53i", "6Rc", "2iM", "1LO", 
"23G", "07", "4yB", "6La", "6bM", "4Wn", "18i", "Or", "BB", "0ap", "c4D", "aEo", "5q2", "40z", "8FD", "ln", "co", "346", "5kR", "6NP", 
"74U", "bol", "0nq", "MC", "2Vb", "0cA", "4Xo", "6mL", "7SA", "42K", "0Mm", "2xN", "7oE", "4JG", "05a", "2DJ", "2jf", "1Od", "4dk", "6QH", 
"482", "5yz", "0Ru", "5O", "0i8", "08Q", "4Gw", "5B7", "5M6", "4Hv", "07P", "Pj", "1X4", "1MU", "4fZ", "473", "7Nh", "4kj", "0PD", "sv", 
"2KK", "1nI", "4EF", "64m", "5Ke", "6ng", "CX", "V9", "0NF", "mt", "7Pj", "4uh", "4xX", "4m9", "1F6", "0Cv", "0mZ", "Nh", "5S4", "4Vt", 
"4Yu", "6lV", "Ai", "16r", "0Lw", "oE", "4b8", "43Q", "4zi", "6OJ", "bu", "0AG", "Y8", "LY", "6af", "4TE", "4Fi", "67B", "2Hd", "09O", 
"e8", "4Q", "7MG", "4hE", "4eu", "6PV", "9a", "1Nz", "0pw", "SE", "aTh", "4KY", "4DX", "4Q9", "1z6", "1oW", "0QZ", "rh", "5o4", "4jt", 
"4gD", "6Rg", "2iI", "j9", "06N", "Qt", "68C", "4Ih", "6bI", "4Wj", "0lD", "Ov", "aZ", "03", "4yF", "6Le", "5q6", "4tv", "0OX", "lj", 
"BF", "0at", "4ZZ", "6oy", "74Q", "5Ez", "0nu", "MG", "ck", "1Px", "5kV", "6NT", "6Cd", "42O", "0Mi", "2xJ", "2Vf", "0cE", "4Xk", "6mH", 
"2jb", "8VY", "4do", "6QL", "7oA", "4JC", "05e", "2DN", "d7E", "08U", "4Gs", "5B3", "486", "bSl", "0Rq", "5K", "1X0", "1MQ", "52w", "477", 
"5M2", "4Hr", "07T", "Pn", "2KO", "1nM", "4EB", "64i", "7Nl", "4kn", "8YX", "7z", "0NB", "mp", "7Pn", "41d", "5Ka", "6nc", "2UM", "14G", 
"19w", "Nl", "5S0", "4Vp", "bBo", "agm", "1F2", "0Cr", "0Ls", "oA", "ahl", "43U", "4Yq", "6lR", "Am", "16v", "0oo", "2ZL", "6ab", "4TA", 
"4zm", "6ON", "bq", "0AC", "2VY", "0cz", "4XT", "4M5", "570", "42p", "0MV", "nd", "cT", "v5", "5ki", "6Nk", "74n", "4Ud", "0nJ", "Mx", 
"By", "0aK", "4Ze", "6oF", "6Aj", "40A", "y4", "lU", "ae", "0BW", "4yy", "581", "4B4", "4WU", "18R", "OI", "06q", "QK", "7lU", "4IW", 
"53R", "6RX", "0I4", "1Lt", "g6", "rW", "7OI", "4jK", "4Dg", "65L", "2Jj", "1oh", "0pH", "Sz", "7nd", "4Kf", "4eJ", "6Pi", "2kG", "h7", 
"0ST", "4n", "7Mx", "4hz", "4FV", "4S7", "1x8", "09p", "4zR", "4o3", "bN", "8Hd", "0oP", "Lb", "75t", "604", "4YN", "6lm", "AR", "T3", 
"0LL", "2yo", "6BA", "43j", "4xc", "agR", "22f", "0CM", "0ma", "NS", "6cl", "4VO", "baL", "aDN", "Cc", "14x", "8Ge", "mO", "7PQ", "4uS", 
"7NS", "4kQ", "245", "7E", "0k2", "1nr", "coo", "64V", "69f", "4HM", "E0", "PQ", "2hl", "1Mn", "4fa", "6SB", "7Lb", "5yA", "0RN", "5t", 
"2IA", "J1", "4GL", "66g", "aUM", "b4G", "05Z", "0d3", "8D", "8Vf", "4dP", "459", "574", "42t", "0MR", "0X3", "dln", "17W", "4XP", "4M1", 
"74j", "5EA", "0nN", "3KL", "cP", "29", "5km", "6No", "6An", "40E", "y0", "lQ", "2Tl", "0aO", "4Za", "6oB", "4B0", "4WQ", "18V", "OM", 
"aa", "0BS", "bCN", "585", "53V", "axN", "0I0", "1Lp", "06u", "QO", "68x", "4IS", "4Dc", "65H", "2Jn", "1ol", "g2", "rS", "7OM", "4jO", 
"4eN", "6Pm", "9Z", "h3", "04D", "2Eo", "aTS", "4Kb", "4FR", "4S3", "d6d", "09t", "0SP", "4j", "a3G", "bRM", "0oT", "Lf", "6aY", "4Tz", 
"4zV", "4o7", "bJ", "0Ax", "0LH", "oz", "6BE", "43n", "4YJ", "6li", "AV", "T7", "0me", "NW", "6ch", "4VK", "4xg", "6MD", "22b", "0CI", 
"0Ny", "mK", "7PU", "4uW", "5KZ", "6nX", "Cg", "1pt", "0k6", "1nv", "4Ey", "64R", "7NW", "4kU", "241", "7A", "2hh", "1Mj", "4fe", "6SF", 
"69b", "4HI", "E4", "PU", "2IE", "J5", "4GH", "66c", "7Lf", "4id", "0RJ", "5p", "2jY", "8Vb", "4dT", "4q5", "5O8", "4Jx", "0qV", "Rd", 
"21E", "25", "5ka", "6Nc", "74f", "4Ul", "0nB", "Mp", "1f2", "0cr", "bbo", "79V", "578", "42x", "395", "nl", "am", "364", "4yq", "589", 
"76W", "bmn", "0ls", "OA", "Bq", "0aC", "4Zm", "6oN", "6Ab", "40I", "0Oo", "2zL", "0Qm", "6W", "7OA", "4jC", "4Do", "65D", "2Jb", "82Q", 
"06y", "QC", "68t", "b7d", "4gs", "5b3", "dSM", "8UE", "8ZD", "4f", "5m2", "4hr", "725", "67u", "1x0", "09x", "04H", "Sr", "7nl", "4Kn", 
"4eB", "6Pa", "9V", "1NM", "4YF", "6le", "AZ", "0bh", "0LD", "ov", "6BI", "43b", "4zZ", "6Oy", "bF", "0At", "0oX", "Lj", "5Q6", "4Tv", 
"5KV", "6nT", "Ck", "14p", "0Nu", "mG", "7PY", "41S", "4xk", "6MH", "22n", "0CE", "0mi", "2XJ", "6cd", "4VG", "69n", "4HE", "E8", "PY", 
"2hd", "1Mf", "4fi", "6SJ", "ath", "4kY", "0Pw", "7M", "2Kx", "1nz", "4Eu", "6pV", "5O4", "4Jt", "05R", "Rh", "8L", "1OW", "4dX", "451", 
"7Lj", "4ih", "0RF", "qt", "2II", "J9", "4GD", "66o", "74b", "4Uh", "0nF", "Mt", "cX", "21", "5ke", "6Ng", "5s4", "4vt", "0MZ", "nh", 
"1f6", "0cv", "4XX", "4M9", "4B8", "4WY", "0lw", "OE", "ai", "1Rz", "4yu", "6LV", "6Af", "40M", "y8", "lY", "Bu", "0aG", "4Zi", "6oJ", 
"4Dk", "6qH", "2Jf", "1od", "0Qi", "6S", "7OE", "4jG", "4gw", "5b7", "0I8", "1Lx", "0ru", "QG", "68p", "5Yz", "4FZ", "67q", "1x4", "1mU", 
"0SX", "4b", "5m6", "4hv", "4eF", "6Pe", "9R", "1NI", "04L", "Sv", "7nh", "4Kj", "8EX", "or", "6BM", "43f", "4YB", "6la", "2WO", "0bl", 
"8fD", "Ln", "5Q2", "4Tr", "cPL", "aeo", "bB", "0Ap", "0Nq", "mC", "ajn", "41W", "5KR", "6nP", "Co", "14t", "0mm", "2XN", "77I", "4VC", 
"4xo", "6ML", "22j", "0CA", "3xA", "1Mb", "4fm", "6SN", "69j", "4HA", "07g", "2FL", "d5G", "83O", "4Eq", "64Z", "a0d", "bQn", "0Ps", "7I", 
"8H", "1OS", "50u", "455", "5O0", "4Jp", "05V", "Rl", "2IM", "08f", "5Wa", "66k", "7Ln", "4il", "0RB", "5x", "Bh", "0aZ", "4Zt", "6oW", 
"4a9", "40P", "0Ov", "lD", "at", "0BF", "4yh", "6LK", "6bg", "4WD", "Z9", "OX", "2VH", "U8", "4XE", "6mf", "6CJ", "42a", "0MG", "nu", 
"cE", "1PV", "5kx", "4n8", "5P5", "4Uu", "8gC", "Mi", "04Q", "Sk", "5N7", "4Kw", "51r", "442", "9O", "1NT", "0SE", "pw", "7Mi", "4hk", 
"4FG", "67l", "2HJ", "09a", "3", "QZ", "68m", "4IF", "4gj", "6RI", "2ig", "1Le", "0Qt", "6N", "7OX", "4jZ", "4Dv", "5A6", "0j9", "1oy", 
"4xr", "6MQ", "22w", "377", "0mp", "NB", "77T", "blm", "5KO", "6nM", "Cr", "14i", "0Nl", "3kn", "ajs", "41J", "4zC", "aer", "20F", "36", 
"0oA", "Ls", "6aL", "4To", "bcl", "78U", "AC", "0bq", "386", "oo", "5r3", "4ws", "5l1", "4iq", "9Kf", "5e", "1y3", "1lR", "736", "66v", 
"7oo", "4Jm", "05K", "Rq", "8U", "1ON", "4dA", "6Qb", "7NB", "bQs", "0Pn", "7T", "2Ka", "1nc", "4El", "64G", "69w", "b6g", "07z", "1v2", 
"dRN", "8TF", "4fp", "5c0", "akm", "40T", "0Or", "1J2", "Bl", "15w", "4Zp", "6oS", "6bc", "5Ga", "0ln", "2YM", "ap", "0BB", "4yl", "6LO", 
"6CN", "42e", "0MC", "nq", "2VL", "0co", "4XA", "6mb", "5P1", "4Uq", "8gG", "Mm", "cA", "1PR", "bAn", "adl", "51v", "446", "9K", "1NP", 
"04U", "So", "5N3", "4Ks", "4FC", "67h", "2HN", "09e", "0SA", "ps", "7Mm", "4ho", "4gn", "6RM", "2ic", "1La", "7", "2GO", "68i", "4IB", 
"4Dr", "5A2", "d4D", "82L", "0Qp", "6J", "a1g", "bPm", "0mt", "NF", "6cy", "4VZ", "4xv", "6MU", "0V9", "0CX", "0Nh", "mZ", "7PD", "41N", 
"5KK", "6nI", "Cv", "14m", "0oE", "Lw", "6aH", "4Tk", "4zG", "6Od", "20B", "32", "0LY", "ok", "5r7", "4ww", "5Iz", "6lx", "AG", "0bu", 
"1y7", "1lV", "4GY", "4R8", "5l5", "4iu", "1Bz", "5a", "8Q", "i8", "4dE", "6Qf", "7ok", "4Ji", "05O", "Ru", "2Ke", "1ng", "4Eh", "64C", 
"7NF", "4kD", "f9", "7P", "2hy", "3m9", "4ft", "5c4", "69s", "4HX", "0sv", "PD", "23e", "0BN", "5iA", "6LC", "6bo", "4WL", "Z1", "OP", 
"0t3", "0aR", "c4f", "aEM", "4a1", "40X", "8Ff", "lL", "cM", "8Ig", "5kp", "4n0", "74w", "617", "0nS", "Ma", "3Fa", "U0", "4XM", "6mn", 
"6CB", "42i", "0MO", "2xl", "0SM", "4w", "7Ma", "4hc", "4FO", "67d", "2HB", "K2", "04Y", "Sc", "aTN", "b5D", "4eS", "4p2", "9G", "8We", 
"256", "6F", "7OP", "4jR", "cnl", "65U", "0j1", "1oq", "D3", "QR", "68e", "4IN", "4gb", "6RA", "2io", "1Lm", "5KG", "6nE", "Cz", "14a", 
"x7", "mV", "7PH", "41B", "4xz", "592", "0V5", "0CT", "0mx", "NJ", "4C7", "4VV", "4YW", "4L6", "AK", "0by", "0LU", "og", "563", "43s", 
"4zK", "6Oh", "bW", "w6", "0oI", "2Zj", "6aD", "4Tg", "7og", "4Je", "05C", "Ry", "2jD", "i4", "4dI", "6Qj", "5l9", "4iy", "0RW", "5m", 
"2IX", "08s", "4GU", "4R4", "7mV", "4HT", "07r", "PH", "0H7", "1Mw", "4fx", "5c8", "7NJ", "4kH", "f5", "sT", "2Ki", "1nk", "4Ed", "64O", 
"6bk", "4WH", "Z5", "OT", "ax", "0BJ", "4yd", "6LG", "4a5", "4tT", "0Oz", "lH", "Bd", "0aV", "4Zx", "aEI", "5P9", "4Uy", "0nW", "Me", 
"cI", "1PZ", "5kt", "4n4", "6CF", "42m", "0MK", "ny", "2VD", "U4", "4XI", "6mj", "4FK", "6sh", "2HF", "K6", "0SI", "4s", "7Me", "4hg", 
"4eW", "4p6", "9C", "1NX", "0pU", "Sg", "7ny", "6k9", "4Dz", "65Q", "0j5", "1ou", "0Qx", "6B", "7OT", "4jV", "4gf", "6RE", "2ik", "1Li", 
"D7", "QV", "68a", "4IJ", "x3", "mR", "7PL", "41F", "5KC", "6nA", "2Uo", "14e", "19U", "NN", "4C3", "4VR", "bBM", "596", "0V1", "0CP", 
"0LQ", "oc", "567", "43w", "4YS", "4L2", "AO", "16T", "0oM", "2Zn", "75i", "4Tc", "4zO", "6Ol", "bS", "w2", "8Y", "i0", "4dM", "6Qn", 
"7oc", "4Ja", "05G", "2Dl", "d7g", "08w", "4GQ", "4R0", "a2D", "bSN", "0RS", "5i", "0H3", "1Ms", "52U", "ayM", "7mR", "4HP", "07v", "PL", 
"2Km", "1no", "5UA", "64K", "7NN", "4kL", "f1", "7X", "5nw", "4k7", "fJ", "0Ex", "0kT", "Hf", "6eY", "4Pz", "5Mk", "6hi", "EV", "P7", 
"0HH", "kz", "6FE", "47n", "48o", "6ID", "26b", "0GI", "0ie", "JW", "6gh", "4RK", "5OZ", "6jX", "Gg", "0dU", "0Jy", "iK", "4d6", "4qW", 
"4z4", "4oU", "1DZ", "3A", "Ye", "0zW", "4Ay", "5D9", "6yj", "4LI", "A4", "TU", "zy", "0YK", "4be", "6WF", "6XG", "4md", "0VJ", "1p", 
"2ME", "N5", "4CH", "62c", "5K8", "4Nx", "0uV", "Vd", "xH", "8Rb", "5pu", "4u5", "D", "13W", "5Lq", "4I1", "534", "46t", "0IR", "28y", 
"gP", "69", "5om", "6Jo", "6dC", "5AA", "0jN", "3OL", "2Pl", "0eO", "aT1", "6kB", "6En", "44E", "98", "hQ", "ea", "0FS", "49u", "abL", 
"4F0", "4SQ", "8ag", "KM", "02u", "UO", "4X2", "4MS", "57V", "a8F", "0M0", "0XQ", "c2", "vS", "7KM", "4nO", "5PB", "61H", "2Nn", "1kl", 
"00D", "2Ao", "6zA", "4Ob", "4aN", "6Tm", "yR", "l3", "0WP", "0j", "a7G", "58W", "4BR", "4W3", "ZN", "84l", "0kP", "Hb", "71t", "644", 
"5ns", "4k3", "fN", "8Ld", "0HL", "29g", "6FA", "47j", "5Mo", "6hm", "ER", "P3", "0ia", "JS", "6gl", "4RO", "48k", "7Ya", "26f", "0GM", 
"8Ce", "iO", "4d2", "4qS", "beL", "hYw", "Gc", "0dQ", "Ya", "0zS", "cko", "60V", "4z0", "4oQ", "205", "3E", "2ll", "0YO", "4ba", "6WB", 
"6yn", "4LM", "A0", "TQ", "2MA", "N1", "4CL", "62g", "6XC", "59I", "0VN", "1t", "xL", "8Rf", "54y", "419", "aQM", "b0G", "01Z", "3PP", 
"530", "46p", "0IV", "jd", "DH", "0gz", "5Lu", "4I5", "6dG", "4Qd", "0jJ", "Ix", "gT", "r5", "5oi", "6Jk", "6Ej", "44A", "0Kg", "hU", 
"Fy", "0eK", "5ND", "6kF", "4F4", "4SU", "1xZ", "KI", "ee", "0FW", "49q", "5x9", "57R", "6VX", "0M4", "0XU", "02q", "UK", "4X6", "4MW", 
"5PF", "61L", "2Nj", "1kh", "c6", "vW", "7KI", "4nK", "4aJ", "6Ti", "yV", "l7", "0tH", "Wz", "6zE", "4Of", "4BV", "4W7", "ZJ", "0yx", 
"0WT", "0n", "6YY", "4lz", "5Mc", "6ha", "2SO", "0fl", "1Xa", "kr", "6FM", "47f", "bDm", "aao", "fB", "0Ep", "8bD", "Hn", "5U2", "4Pr", 
"5OR", "5Z3", "Go", "10t", "0Jq", "iC", "ann", "45W", "48g", "6IL", "ds", "0GA", "0im", "3Lo", "73I", "4RC", "6yb", "4LA", "03g", "2BL", 
"zq", "0YC", "4bm", "6WN", "a4d", "bUn", "0Ts", "3I", "Ym", "87O", "4Aq", "5D1", "5K0", "4Np", "01V", "Vl", "2nQ", "1KS", "54u", "415", 
"6XO", "4ml", "0VB", "1x", "2MM", "0xn", "5Sa", "62k", "gX", "61", "5oe", "6Jg", "6dK", "4Qh", "0jF", "It", "L", "0gv", "5Ly", "4I9", 
"5w4", "4rt", "0IZ", "jh", "ei", "1Vz", "5mT", "5x5", "4F8", "4SY", "0hw", "KE", "Fu", "0eG", "5NH", "6kJ", "6Ef", "44M", "90", "hY", 
"0Ui", "2S", "7KE", "4nG", "5PJ", "6uH", "Xw", "1kd", "0vu", "UG", "6xx", "790", "4cw", "5f7", "0M8", "0XY", "0WX", "0b", "5i6", "4lv", 
"4BZ", "63q", "ZF", "0yt", "00L", "Wv", "6zI", "4Oj", "4aF", "6Te", "yZ", "0Zh", "0HD", "kv", "6FI", "47b", "5Mg", "6he", "EZ", "0fh", 
"0kX", "Hj", "5U6", "4Pv", "7N9", "6Ky", "fF", "0Et", "0Ju", "iG", "6Dx", "45S", "5OV", "5Z7", "Gk", "0dY", "0ii", "3Lk", "6gd", "4RG", 
"48c", "6IH", "dw", "0GE", "zu", "0YG", "4bi", "6WJ", "6yf", "4LE", "A8", "TY", "Yi", "1jz", "4Au", "5D5", "4z8", "4oY", "0Tw", "3M", 
"xD", "1KW", "54q", "411", "5K4", "4Nt", "01R", "Vh", "2MI", "N9", "4CD", "62o", "6XK", "4mh", "0VF", "ut", "6dO", "4Ql", "0jB", "Ip", 
"25E", "65", "5oa", "6Jc", "538", "46x", "9Pg", "jl", "H", "0gr", "bfo", "aCm", "72W", "bin", "0hs", "KA", "em", "324", "49y", "5x1", 
"6Eb", "44I", "94", "3nm", "Fq", "0eC", "5NL", "6kN", "5PN", "61D", "Xs", "86Q", "0Um", "2W", "7KA", "4nC", "4cs", "5f3", "39W", "8QE", 
"02y", "UC", "aRn", "794", "765", "63u", "ZB", "0yp", "9Ne", "0f", "5i2", "4lr", "4aB", "6Ta", "2oO", "0Zl", "00H", "Wr", "6zM", "4On", 
"5lW", "5y6", "dj", "0GX", "0it", "JF", "6gy", "4RZ", "5OK", "6jI", "Gv", "0dD", "83", "iZ", "6De", "45N", "5nf", "6Kd", "24B", "72", 
"0kE", "Hw", "6eH", "4Pk", "5Mz", "6hx", "EG", "0fu", "0HY", "kk", "5v7", "4sw", "5h5", "4mu", "1Fz", "1a", "2MT", "0xw", "4CY", "4V8", 
"7kk", "4Ni", "01O", "Vu", "xY", "m8", "54l", "6Uf", "6Zg", "4oD", "b9", "3P", "Yt", "0zF", "4Ah", "60C", "4Y9", "4LX", "0wv", "TD", 
"zh", "0YZ", "4bt", "5g4", "Fl", "11w", "5NQ", "6kS", "aom", "44T", "0Kr", "1N2", "ep", "0FB", "49d", "6HO", "6fc", "5Ca", "0hn", "3Ml", 
"U", "0go", "bfr", "6ib", "6GN", "46e", "0IC", "jq", "gA", "0Ds", "bEn", "hyU", "5T1", "4Qq", "8cG", "Im", "00U", "Wo", "5J3", "4Os", 
"55v", "406", "yC", "0Zq", "0WA", "ts", "6YL", "4lo", "4BC", "63h", "2LN", "0ym", "02d", "2CO", "6xa", "4MB", "4cn", "6VM", "2mc", "1Ha", 
"0Up", "2J", "a5g", "bTm", "5PS", "5E2", "Xn", "86L", "0ip", "JB", "73T", "bhm", "48z", "5y2", "dn", "337", "87", "3on", "6Da", "45J", 
"5OO", "6jM", "Gr", "10i", "0kA", "Hs", "6eL", "4Po", "5nb", "aar", "24F", "76", "8AE", "ko", "5v3", "4ss", "bgl", "aBn", "EC", "0fq", 
"2MP", "0xs", "776", "62v", "5h1", "4mq", "9Of", "1e", "2nL", "1KN", "54h", "6Ub", "7ko", "4Nm", "01K", "Vq", "Yp", "0zB", "4Al", "60G", 
"6Zc", "bUs", "0Tn", "3T", "zl", "8PF", "4bp", "5g0", "aSm", "787", "03z", "1r2", "4e9", "44P", "0Kv", "hD", "Fh", "0eZ", "5NU", "6kW", 
"6fg", "4SD", "0hj", "KX", "et", "0FF", "5mI", "6HK", "6GJ", "46a", "0IG", "ju", "Q", "Q8", "5Ld", "6if", "5T5", "4Qu", "1zz", "Ii", 
"gE", "0Dw", "5ox", "4j8", "55r", "402", "yG", "0Zu", "00Q", "Wk", "5J7", "4Ow", "4BG", "63l", "2LJ", "0yi", "0WE", "tw", "6YH", "4lk", 
"4cj", "6VI", "2mg", "0XD", "0vh", "UZ", "6xe", "4MF", "5PW", "5E6", "Xj", "1ky", "0Ut", "2N", "7KX", "4nZ", "5OC", "6jA", "2Qo", "0dL", 
"1ZA", "iR", "6Dm", "45F", "48v", "acO", "db", "0GP", "94M", "JN", "4G3", "4RR", "5Mr", "4H2", "EO", "12T", "0HQ", "kc", "527", "47w", 
"5nn", "6Kl", "fS", "s2", "0kM", "3NO", "71i", "4Pc", "7kc", "4Na", "01G", "3PM", "xQ", "m0", "54d", "6Un", "a6D", "59T", "0VS", "1i", 
"197", "85o", "4CQ", "4V0", "4Y1", "4LP", "03v", "TL", "0L3", "0YR", "56U", "a9E", "6Zo", "4oL", "b1", "3X", "2Om", "0zN", "5QA", "60K", 
"ex", "0FJ", "49l", "6HG", "6fk", "4SH", "0hf", "KT", "Fd", "0eV", "5NY", "aAI", "4e5", "4pT", "0Kz", "hH", "gI", "1TZ", "5ot", "4j4", 
"5T9", "4Qy", "0jW", "Ie", "DU", "Q4", "5Lh", "6ij", "6GF", "46m", "0IK", "jy", "0WI", "0s", "6YD", "4lg", "4BK", "6wh", "ZW", "O6", 
"0tU", "Wg", "6zX", "6o9", "4aW", "4t6", "yK", "0Zy", "0Ux", "2B", "7KT", "4nV", "bzI", "61Q", "Xf", "1ku", "02l", "UV", "6xi", "4MJ", 
"4cf", "6VE", "2mk", "0XH", "0Jd", "iV", "6Di", "45B", "5OG", "6jE", "Gz", "0dH", "0ix", "JJ", "4G7", "4RV", "48r", "6IY", "df", "0GT", 
"0HU", "kg", "523", "47s", "5Mv", "4H6", "EK", "0fy", "0kI", "3NK", "6eD", "4Pg", "5nj", "6Kh", "fW", "s6", "xU", "m4", "5ph", "6Uj", 
"7kg", "4Ne", "01C", "Vy", "193", "1hZ", "4CU", "4V4", "5h9", "4my", "0VW", "1m", "zd", "0YV", "4bx", "5g8", "4Y5", "4LT", "03r", "TH", 
"Yx", "0zJ", "4Ad", "60O", "6Zk", "4oH", "b5", "wT", "6fo", "4SL", "0hb", "KP", "27e", "0FN", "49h", "6HC", "4e1", "44X", "8Bf", "hL", 
"0p3", "0eR", "bdO", "aAM", "70w", "657", "0jS", "Ia", "gM", "8Mg", "5op", "4j0", "6GB", "46i", "0IO", "28d", "Y", "Q0", "5Ll", "6in", 
"4BO", "63d", "ZS", "O2", "0WM", "0w", "7Ia", "4lc", "4aS", "4t2", "yO", "8Se", "00Y", "Wc", "aPN", "b1D", "bzM", "61U", "Xb", "1kq", 
"216", "2F", "7KP", "4nR", "4cb", "6VA", "2mo", "0XL", "02h", "UR", "6xm", "4MN", "5j7", "4ow", "0TY", "3c", "YG", "0zu", "5Qz", "60p", 
"6yH", "4Lk", "03M", "Tw", "2lJ", "0Yi", "4bG", "6Wd", "6Xe", "4mF", "0Vh", "1R", "2Mg", "0xD", "4Cj", "62A", "7kX", "4NZ", "0ut", "VF", 
"xj", "1Ky", "5pW", "5e6", "5nU", "6KW", "fh", "0EZ", "0kv", "HD", "4E9", "4PX", "5MI", "6hK", "Et", "0fF", "0Hj", "kX", "6Fg", "47L", 
"48M", "6If", "dY", "50", "0iG", "Ju", "6gJ", "4Ri", "5Ox", "4J8", "GE", "0dw", "1Zz", "ii", "5t5", "4qu", "02W", "Um", "5H1", "4Mq", 
"57t", "424", "2mP", "0Xs", "0UC", "2y", "7Ko", "4nm", "bzr", "61j", "2NL", "1kN", "00f", "2AM", "6zc", "bus", "4al", "6TO", "yp", "0ZB", 
"0Wr", "0H", "a7e", "58u", "4Bp", "5G0", "Zl", "84N", "f", "13u", "5LS", "5Y2", "amo", "46V", "0Ip", "jB", "gr", "1Ta", "5oO", "6JM", 
"6da", "4QB", "0jl", "3On", "2PN", "0em", "5Nb", "aAr", "6EL", "44g", "0KA", "hs", "eC", "0Fq", "49W", "abn", "5V3", "4Ss", "8aE", "Ko", 
"YC", "0zq", "754", "60t", "5j3", "4os", "9Md", "3g", "2lN", "0Ym", "4bC", "7GA", "6yL", "4Lo", "03I", "Ts", "2Mc", "1ha", "4Cn", "62E", 
"6Xa", "4mB", "0Vl", "1V", "xn", "8RD", "5pS", "5e2", "aQo", "b0e", "01x", "VB", "0kr", "1n2", "71V", "bjo", "5nQ", "6KS", "fl", "315", 
"0Hn", "29E", "6Fc", "47H", "5MM", "6hO", "Ep", "0fB", "0iC", "Jq", "6gN", "4Rm", "48I", "6Ib", "26D", "54", "8CG", "im", "509", "45y", 
"ben", "hYU", "GA", "0ds", "4cY", "420", "2mT", "0Xw", "02S", "Ui", "5H5", "4Mu", "5Pd", "61n", "XY", "M8", "0UG", "vu", "7Kk", "4ni", 
"4ah", "6TK", "yt", "0ZF", "B9", "WX", "6zg", "4OD", "4Bt", "5G4", "Zh", "0yZ", "0Wv", "0L", "4y9", "4lX", "6Gy", "46R", "0It", "jF", 
"b", "0gX", "5LW", "5Y6", "6de", "4QF", "0jh", "IZ", "gv", "0DD", "5oK", "6JI", "6EH", "44c", "0KE", "hw", "2PJ", "0ei", "5Nf", "6kd", 
"5V7", "4Sw", "0hY", "Kk", "eG", "0Fu", "49S", "6Hx", "7ia", "4Lc", "03E", "2Bn", "zS", "o2", "4bO", "6Wl", "a4F", "bUL", "0TQ", "3k", 
"YO", "87m", "4AS", "4T2", "7kP", "4NR", "01t", "VN", "xb", "1Kq", "54W", "hfv", "6Xm", "4mN", "1FA", "1Z", "2Mo", "0xL", "4Cb", "62I", 
"5MA", "6hC", "2Sm", "0fN", "0Hb", "kP", "6Fo", "47D", "bDO", "aaM", "0P3", "0ER", "8bf", "HL", "4E1", "4PP", "5Op", "4J0", "GM", "10V", 
"0JS", "ia", "505", "45u", "48E", "6In", "dQ", "58", "0iO", "3LM", "6gB", "4Ra", "0UK", "2q", "7Kg", "4ne", "5Ph", "61b", "XU", "M4", 
"0vW", "Ue", "5H9", "4My", "4cU", "4v4", "2mX", "1HZ", "0Wz", "tH", "4y5", "4lT", "4Bx", "5G8", "Zd", "0yV", "B5", "WT", "6zk", "4OH", 
"4ad", "6TG", "yx", "0ZJ", "gz", "0DH", "5oG", "6JE", "6di", "4QJ", "0jd", "IV", "n", "0gT", "680", "6iY", "4g7", "4rV", "0Ix", "jJ", 
"eK", "0Fy", "5mv", "4h6", "6fX", "5CZ", "0hU", "Kg", "FW", "S6", "5Nj", "6kh", "6ED", "44o", "0KI", "3nK", "zW", "o6", "4bK", "6Wh", 
"6yD", "4Lg", "03A", "2Bj", "YK", "0zy", "4AW", "4T6", "6ZX", "6O9", "0TU", "3o", "xf", "1Ku", "54S", "6UY", "7kT", "4NV", "01p", "VJ", 
"2Mk", "0xH", "4Cf", "62M", "6Xi", "4mJ", "0Vd", "uV", "0Hf", "kT", "6Fk", "4sH", "5ME", "6hG", "Ex", "0fJ", "0kz", "HH", "4E5", "4PT", 
"5nY", "aaI", "fd", "0EV", "0JW", "ie", "501", "45q", "5Ot", "4J4", "GI", "10R", "0iK", "Jy", "6gF", "4Re", "48A", "6Ij", "dU", "q4", 
"5Pl", "61f", "XQ", "M0", "0UO", "2u", "7Kc", "4na", "4cQ", "428", "39u", "8Qg", "0vS", "Ua", "aRL", "b3F", "bxO", "63W", "0l3", "0yR", 
"234", "0D", "4y1", "4lP", "55I", "6TC", "2om", "0ZN", "B1", "WP", "6zo", "4OL", "6dm", "4QN", "1zA", "IR", "25g", "0DL", "5oC", "6JA", 
"4g3", "46Z", "9PE", "jN", "j", "0gP", "684", "aCO", "72u", "675", "0hQ", "Kc", "eO", "8Oe", "5mr", "4h2", "7Ua", "44k", "0KM", "3nO", 
"FS", "S2", "5Nn", "6kl", "4x6", "4mW", "0Vy", "1C", "0m4", "0xU", "5SZ", "62P", "7kI", "4NK", "C6", "VW", "2nj", "1Kh", "54N", "6UD", 
"6ZE", "4of", "0TH", "3r", "YV", "L7", "4AJ", "60a", "6yY", "4Lz", "0wT", "Tf", "zJ", "0Yx", "4bV", "4w7", "5lu", "4i5", "dH", "0Gz", 
"0iV", "Jd", "5W8", "4Rx", "5Oi", "6jk", "GT", "R5", "0JJ", "ix", "6DG", "45l", "5nD", "6KF", "fy", "0EK", "0kg", "HU", "6ej", "4PI", 
"5MX", "5X9", "Ee", "0fW", "1XZ", "kI", "4f4", "4sU", "00w", "WM", "4Z0", "4OQ", "55T", "hgu", "ya", "0ZS", "a0", "0Y", "6Yn", "4lM", 
"4Ba", "63J", "2Ll", "0yO", "02F", "2Cm", "6xC", "aG0", "4cL", "6Vo", "2mA", "n1", "0UR", "2h", "a5E", "bTO", "5Pq", "4U1", "XL", "86n", 
"FN", "11U", "5Ns", "4K3", "516", "44v", "0KP", "hb", "eR", "p3", "49F", "6Hm", "6fA", "4Sb", "0hL", "3MN", "w", "0gM", "5LB", "7ya", 
"6Gl", "46G", "0Ia", "jS", "gc", "0DQ", "bEL", "hyw", "4D2", "4QS", "8ce", "IO", "0m0", "0xQ", "byL", "62T", "4x2", "4mS", "227", "1G", 
"2nn", "1Kl", "54J", "7Ea", "7kM", "4NO", "C2", "VS", "YR", "L3", "4AN", "60e", "6ZA", "4ob", "0TL", "3v", "zN", "8Pd", "4bR", "4w3", 
"aSO", "b2E", "03X", "Tb", "0iR", "3LP", "73v", "666", "48X", "4i1", "dL", "8Nf", "0JN", "3oL", "6DC", "45h", "5Om", "6jo", "GP", "R1", 
"0kc", "HQ", "6en", "4PM", "a09", "6KB", "24d", "0EO", "8Ag", "kM", "4f0", "47Y", "697", "aBL", "Ea", "0fS", "4ay", "5d9", "ye", "0ZW", 
"00s", "WI", "4Z4", "4OU", "4Be", "63N", "Zy", "0yK", "a4", "tU", "6Yj", "4lI", "4cH", "6Vk", "2mE", "n5", "02B", "Ux", "6xG", "4Md", 
"5Pu", "4U5", "XH", "86j", "0UV", "2l", "5k8", "4nx", "512", "44r", "0KT", "hf", "FJ", "0ex", "5Nw", "4K7", "6fE", "4Sf", "0hH", "Kz", 
"eV", "p7", "49B", "6Hi", "6Gh", "46C", "0Ie", "jW", "s", "0gI", "5LF", "6iD", "4D6", "4QW", "0jy", "IK", "gg", "0DU", "5oZ", "6JX", 
"7kA", "4NC", "01e", "3Po", "xs", "8RY", "54F", "6UL", "a6f", "59v", "0Vq", "1K", "d3E", "85M", "4Cs", "5F3", "5I2", "4Lr", "03T", "Tn", 
"zB", "0Yp", "56w", "437", "6ZM", "4on", "1Da", "3z", "2OO", "0zl", "4AB", "60i", "5Oa", "6jc", "2QM", "0dn", "0JB", "ip", "6DO", "45d", 
"48T", "acm", "1B2", "0Gr", "94o", "Jl", "5W0", "4Rp", "5MP", "5X1", "Em", "12v", "0Hs", "kA", "all", "47U", "5nL", "6KN", "fq", "0EC", 
"0ko", "3Nm", "6eb", "4PA", "a8", "0Q", "6Yf", "4lE", "4Bi", "63B", "Zu", "0yG", "0tw", "WE", "4Z8", "4OY", "4au", "5d5", "yi", "1Jz", 
"0UZ", "vh", "5k4", "4nt", "5Py", "4U9", "XD", "1kW", "02N", "Ut", "6xK", "4Mh", "4cD", "6Vg", "2mI", "n9", "eZ", "43", "49N", "6He", 
"6fI", "4Sj", "0hD", "Kv", "FF", "0et", "7n9", "6ky", "5u6", "4pv", "0KX", "hj", "gk", "0DY", "5oV", "5z7", "6dx", "5Az", "0ju", "IG", 
"Dw", "0gE", "5LJ", "6iH", "6Gd", "46O", "0Ii", "28B", "xw", "1Kd", "54B", "6UH", "7kE", "4NG", "01a", "3Pk", "0m8", "0xY", "4Cw", "5F7", 
"6Xx", "59r", "0Vu", "1O", "zF", "0Yt", "4bZ", "433", "5I6", "4Lv", "03P", "Tj", "YZ", "0zh", "4AF", "60m", "6ZI", "4oj", "0TD", "wv", 
"0JF", "it", "6DK", "4qh", "5Oe", "6jg", "GX", "R9", "0iZ", "Jh", "5W4", "4Rt", "48P", "4i9", "dD", "0Gv", "0Hw", "kE", "4f8", "47Q", 
"5MT", "5X5", "Ei", "12r", "0kk", "HY", "6ef", "4PE", "5nH", "6KJ", "fu", "0EG", "4Bm", "63F", "Zq", "0yC", "0Wo", "0U", "6Yb", "4lA", 
"4aq", "5d1", "ym", "8SG", "0ts", "WA", "aPl", "b1f", "747", "61w", "2NQ", "1kS", "9Lg", "2d", "5k0", "4np", "57i", "6Vc", "2mM", "0Xn", 
"02J", "Up", "6xO", "4Ml", "6fM", "4Sn", "1xa", "Kr", "27G", "47", "49J", "6Ha", "5u2", "44z", "8BD", "hn", "FB", "0ep", "bdm", "aAo", 
"70U", "bkl", "0jq", "IC", "go", "306", "5oR", "5z3", "7WA", "46K", "0Im", "28F", "Ds", "0gA", "5LN", "6iL", "0cY", "020", "6mT", "4Xw", 
"42S", "6Cx", "nG", "0Mu", "1Pd", "cw", "6NH", "5kJ", "4UG", "74M", "3Kk", "0ni", "0ah", "BZ", "6oe", "4ZF", "40b", "6AI", "lv", "0OD", 
"0Bt", "aF", "6Ly", "4yZ", "4Wv", "5R6", "Oj", "0lX", "Qh", "06R", "4It", "5L4", "461", "4gX", "1LW", "1Y6", "rt", "0QF", "4jh", "7Oj", 
"65o", "4DD", "I9", "2JI", "SY", "F8", "4KE", "7nG", "6PJ", "4ei", "1Nf", "2kd", "4M", "0Sw", "4hY", "490", "5C5", "4Fu", "09S", "2Hx", 
"6OR", "4zq", "354", "bm", "LA", "0os", "bnn", "75W", "6lN", "4Ym", "0bC", "Aq", "2yL", "0Lo", "43I", "6Bb", "6Mc", "5ha", "15", "22E", 
"Np", "0mB", "4Vl", "6cO", "aDm", "bao", "1pS", "1e2", "ml", "8GF", "41x", "548", "4kr", "5n2", "7f", "8YD", "1nQ", "2KS", "64u", "715", 
"4Hn", "69E", "Pr", "07H", "1MM", "2hO", "6Sa", "4fB", "4iC", "7LA", "5W", "0Rm", "08I", "2Ib", "66D", "4Go", "b4d", "aUn", "RC", "05y", 
"8VE", "8g", "5a3", "4ds", "42W", "ain", "nC", "0Mq", "17t", "024", "6mP", "4Xs", "4UC", "74I", "3Ko", "0nm", "8IY", "cs", "6NL", "5kN", 
"40f", "6AM", "lr", "8FX", "0al", "2TO", "6oa", "4ZB", "4Wr", "5R2", "On", "18u", "0Bp", "aB", "afo", "bCm", "465", "53u", "1LS", "1Y2", 
"Ql", "06V", "4Ip", "5L0", "65k", "5Ta", "1oO", "2JM", "6x", "0QB", "4jl", "7On", "6PN", "4em", "1Nb", "9y", "2EL", "04g", "4KA", "7nC", 
"5C1", "4Fq", "09W", "d6G", "4I", "0Ss", "bRn", "494", "LE", "0ow", "4TY", "4A8", "6OV", "4zu", "1Qz", "bi", "oY", "z8", "43M", "6Bf", 
"6lJ", "4Yi", "0bG", "Au", "Nt", "0mF", "4Vh", "6cK", "6Mg", "4xD", "11", "22A", "mh", "0NZ", "4ut", "5p4", "4N9", "5Ky", "1pW", "CD", 
"1nU", "2KW", "64q", "4EZ", "4kv", "5n6", "7b", "0PX", "1MI", "2hK", "6Se", "4fF", "4Hj", "69A", "Pv", "07L", "08M", "2If", "6rH", "4Gk", 
"4iG", "7LE", "5S", "0Ri", "1Ox", "8c", "5a7", "4dw", "5Zz", "7oY", "RG", "0qu", "1Pl", "21f", "adR", "5kB", "4UO", "74E", "MS", "X2", 
"0cQ", "028", "79u", "bbL", "4vS", "4c2", "nO", "8De", "8Kd", "aN", "4l3", "4yR", "634", "76t", "Ob", "0lP", "W3", "BR", "6om", "4ZN", 
"40j", "6AA", "2zo", "0OL", "6t", "0QN", "5zA", "7Ob", "65g", "4DL", "I1", "2JA", "0g3", "06Z", "b7G", "68W", "469", "4gP", "284", "dSn", 
"4E", "275", "4hQ", "498", "67V", "b8F", "1mr", "0h2", "SQ", "F0", "4KM", "7nO", "6PB", "4ea", "1Nn", "9u", "6lF", "4Ye", "0bK", "Ay", 
"oU", "z4", "43A", "6Bj", "6OZ", "4zy", "0AW", "be", "LI", "2O9", "4TU", "4A4", "4N5", "5Ku", "14S", "CH", "md", "0NV", "41p", "540", 
"6Mk", "4xH", "u5", "22M", "Nx", "0mJ", "4Vd", "6cG", "4Hf", "69M", "Pz", "0sH", "k7", "2hG", "6Si", "4fJ", "4kz", "7Nx", "7n", "0PT", 
"1nY", "dqh", "4P7", "4EV", "4JW", "7oU", "RK", "05q", "1Ot", "8o", "6QX", "50R", "4iK", "7LI", "qW", "d6", "08A", "2Ij", "66L", "4Gg", 
"4UK", "74A", "MW", "X6", "1Ph", "21b", "6ND", "5kF", "4vW", "4c6", "nK", "0My", "0cU", "0v4", "6mX", "5HZ", "4Wz", "6bY", "Of", "0lT", 
"0Bx", "aJ", "4l7", "4yV", "40n", "6AE", "lz", "0OH", "W7", "BV", "6oi", "4ZJ", "65c", "4DH", "I5", "2JE", "6p", "0QJ", "4jd", "7Of", 
"4r5", "4gT", "280", "2iY", "Qd", "0rV", "4Ix", "5L8", "5C9", "4Fy", "1mv", "0h6", "4A", "1CZ", "4hU", "7MW", "6PF", "4ee", "1Nj", "9q", 
"SU", "F4", "4KI", "7nK", "oQ", "z0", "43E", "6Bn", "6lB", "4Ya", "0bO", "2Wl", "LM", "8fg", "4TQ", "4A0", "aeL", "cPo", "0AS", "ba", 
"3kP", "0NR", "41t", "544", "4N1", "5Kq", "14W", "CL", "2Xm", "0mN", "5FA", "6cC", "6Mo", "4xL", "19", "22I", "k3", "2hC", "6Sm", "4fN", 
"4Hb", "69I", "2Fo", "07D", "83l", "d5d", "4P3", "4ER", "bQM", "a0G", "7j", "0PP", "1Op", "8k", "hbw", "50V", "4JS", "7oQ", "RO", "05u", 
"08E", "2In", "66H", "4Gc", "4iO", "7LM", "qS", "d2", "0ay", "BK", "4O6", "4ZW", "40s", "553", "lg", "0OU", "t6", "aW", "6Lh", "4yK", 
"4Wg", "6bD", "2Yj", "0lI", "0cH", "2Vk", "6mE", "4Xf", "42B", "6Ci", "nV", "0Md", "1Pu", "cf", "6NY", "bAI", "4UV", "7pT", "MJ", "0nx", 
"SH", "04r", "4KT", "7nV", "azI", "4ex", "1Nw", "9l", "pT", "e5", "4hH", "7MJ", "67O", "4Fd", "09B", "2Hi", "Qy", "06C", "4Ie", "68N", 
"6Rj", "4gI", "j4", "2iD", "6m", "0QW", "4jy", "5o9", "4Q4", "4DU", "1oZ", "2JX", "4m0", "4xQ", "8Jg", "22T", "Na", "0mS", "627", "77w", 
"6nn", "5Kl", "V0", "CQ", "3kM", "0NO", "41i", "7Pc", "6OC", "5jA", "0AN", "20e", "LP", "Y1", "4TL", "6ao", "78v", "bcO", "0bR", "0w3", 
"oL", "8Ef", "43X", "4b1", "4iR", "7LP", "5F", "266", "08X", "0i1", "66U", "b9E", "4JN", "7oL", "RR", "G3", "1Om", "8v", "6QA", "4db", 
"4kc", "7Na", "7w", "0PM", "H2", "2KB", "64d", "4EO", "b6D", "69T", "Pc", "07Y", "297", "dRm", "4s2", "4fS", "40w", "557", "lc", "0OQ", 
"15T", "BO", "4O2", "4ZS", "4Wc", "76i", "2Yn", "0lM", "t2", "aS", "6Ll", "4yO", "42F", "6Cm", "nR", "8Dx", "0cL", "2Vo", "6mA", "4Xb", 
"4UR", "74X", "MN", "8gd", "1Pq", "cb", "adO", "bAM", "azM", "51U", "1Ns", "9h", "SL", "04v", "4KP", "7nR", "67K", "5VA", "09F", "2Hm", 
"4X", "e1", "4hL", "7MN", "6Rn", "4gM", "j0", "3ya", "2Gl", "06G", "4Ia", "68J", "4Q0", "4DQ", "82o", "d4g", "6i", "0QS", "bPN", "a1D", 
"Ne", "0mW", "4Vy", "5S9", "4m4", "4xU", "1SZ", "22P", "my", "0NK", "41m", "7Pg", "6nj", "5Kh", "V4", "CU", "LT", "Y5", "4TH", "6ak", 
"6OG", "4zd", "0AJ", "bx", "oH", "0Lz", "4wT", "4b5", "78r", "4Yx", "0bV", "Ad", "1lu", "0i5", "66Q", "4Gz", "4iV", "7LT", "5B", "0Rx", 
"1Oi", "8r", "6QE", "4df", "4JJ", "7oH", "RV", "G7", "H6", "2KF", "6ph", "4EK", "4kg", "7Ne", "7s", "0PI", "1MX", "1X9", "4s6", "4fW", 
"5XZ", "69P", "Pg", "0sU", "06", "23F", "afr", "4yC", "4Wo", "6bL", "Os", "0lA", "0aq", "BC", "aEn", "c4E", "4ts", "5q3", "lo", "8FE", 
"347", "cn", "6NQ", "5kS", "bom", "74T", "MB", "0np", "17i", "2Vc", "6mM", "4Xn", "42J", "6Ca", "2xO", "0Ml", "4T", "0Sn", "5xa", "7MB", 
"67G", "4Fl", "09J", "2Ha", "1u2", "04z", "b5g", "aTm", "6PS", "4ep", "8WF", "9d", "6e", "8XG", "4jq", "5o1", "65v", "706", "1oR", "1z3", 
"Qq", "06K", "4Im", "68F", "6Rb", "4gA", "1LN", "2iL", "6nf", "5Kd", "V8", "CY", "mu", "0NG", "41a", "7Pk", "4m8", "4xY", "0Cw", "1F7", 
"Ni", "19r", "4Vu", "5S5", "6lW", "4Yt", "0bZ", "Ah", "oD", "0Lv", "43P", "4b9", "6OK", "4zh", "0AF", "bt", "LX", "Y9", "4TD", "6ag", 
"4JF", "7oD", "RZ", "0qh", "1Oe", "2jg", "6QI", "4dj", "4iZ", "483", "5N", "0Rt", "08P", "0i9", "5B6", "4Gv", "4Hw", "5M7", "Pk", "07Q", 
"1MT", "1X5", "472", "52r", "4kk", "7Ni", "sw", "0PE", "1nH", "2KJ", "64l", "4EG", "4Wk", "6bH", "Ow", "0lE", "02", "23B", "6Ld", "4yG", 
"4tw", "5q7", "lk", "0OY", "0au", "BG", "6ox", "5Jz", "4UZ", "74P", "MF", "0nt", "1Py", "cj", "6NU", "5kW", "42N", "6Ce", "nZ", "0Mh", 
"0cD", "2Vg", "6mI", "4Xj", "67C", "4Fh", "09N", "2He", "4P", "e9", "4hD", "7MF", "6PW", "4et", "3n9", "2ky", "SD", "0pv", "4KX", "7nZ", 
"4Q8", "4DY", "1oV", "1z7", "6a", "1Az", "4ju", "5o5", "6Rf", "4gE", "j8", "2iH", "Qu", "06O", "4Ii", "68B", "mq", "0NC", "41e", "7Po", 
"6nb", "bar", "14F", "2UL", "Nm", "19v", "4Vq", "5S1", "agl", "bBn", "0Cs", "1F3", "1I2", "0Lr", "43T", "ahm", "6lS", "4Yp", "16w", "Al", 
"2ZM", "0on", "5Da", "6ac", "6OO", "4zl", "0AB", "bp", "1Oa", "8z", "6QM", "4dn", "4JB", "aUs", "2DO", "05d", "08T", "d7D", "5B2", "4Gr", 
"bSm", "487", "5J", "0Rp", "1MP", "1X1", "476", "52v", "4Hs", "5M3", "Po", "07U", "1nL", "2KN", "64h", "4EC", "4ko", "7Nm", "ss", "0PA", 
"QJ", "06p", "4IV", "7lT", "6RY", "4gz", "1Lu", "0I5", "rV", "g7", "4jJ", "7OH", "65M", "4Df", "1oi", "2Jk", "2Ej", "04A", "4Kg", "7ne", 
"6Ph", "4eK", "h6", "2kF", "4o", "0SU", "5xZ", "7My", "4S6", "4FW", "09q", "1x9", "17R", "2VX", "4M4", "4XU", "42q", "571", "ne", "0MW", 
"v4", "cU", "6Nj", "5kh", "4Ue", "74o", "My", "0nK", "0aJ", "Bx", "6oG", "4Zd", "4tH", "6Ak", "lT", "y5", "0BV", "ad", "580", "4yx", 
"4WT", "4B5", "OH", "0lz", "4kP", "7NR", "7D", "244", "1ns", "0k3", "64W", "con", "4HL", "69g", "PP", "E1", "1Mo", "2hm", "6SC", "52I", 
"4ia", "7Lc", "5u", "0RO", "J0", "3Ya", "66f", "4GM", "b4F", "aUL", "Ra", "0qS", "8Vg", "8E", "458", "4dQ", "4o2", "4zS", "8He", "bO", 
"Lc", "0oQ", "605", "75u", "6ll", "4YO", "T2", "AS", "2yn", "0LM", "43k", "7Ra", "6MA", "4xb", "0CL", "22g", "NR", "19I", "4VN", "6cm", 
"aDO", "baM", "14y", "Cb", "mN", "8Gd", "41Z", "7PP", "axO", "53W", "1Lq", "0I1", "QN", "06t", "4IR", "68y", "65I", "4Db", "1om", "2Jo", 
"6Z", "g3", "4jN", "7OL", "6Pl", "4eO", "h2", "2kB", "2En", "04E", "4Kc", "7na", "4S2", "4FS", "09u", "d6e", "4k", "0SQ", "bRL", "a3F", 
"42u", "575", "na", "0MS", "17V", "dlo", "4M0", "4XQ", "4Ua", "74k", "3KM", "0nO", "28", "cQ", "6Nn", "5kl", "40D", "6Ao", "lP", "y1", 
"0aN", "2Tm", "6oC", "5JA", "4WP", "4B1", "OL", "18W", "0BR", "0W3", "584", "bCO", "1nw", "0k7", "64S", "4Ex", "4kT", "7NV", "sH", "0Pz", 
"1Mk", "2hi", "6SG", "4fd", "4HH", "69c", "PT", "E5", "J4", "2ID", "66b", "4GI", "4ie", "7Lg", "5q", "0RK", "1OZ", "8A", "4q4", "4dU", 
"4Jy", "5O9", "Re", "0qW", "Lg", "0oU", "5DZ", "6aX", "4o6", "4zW", "0Ay", "bK", "2yj", "0LI", "43o", "6BD", "6lh", "4YK", "T6", "AW", 
"NV", "0md", "4VJ", "6ci", "6ME", "4xf", "0CH", "22c", "mJ", "0Nx", "4uV", "7PT", "6nY", "baI", "1pu", "Cf", "6V", "0Ql", "4jB", "aus", 
"65E", "4Dn", "1oa", "2Jc", "QB", "06x", "b7e", "68u", "5b2", "4gr", "8UD", "dSL", "4g", "8ZE", "4hs", "5m3", "67t", "724", "09y", "1x1", 
"Ss", "04I", "4Ko", "7nm", "azr", "4eC", "1NL", "9W", "24", "21D", "6Nb", "bAr", "4Um", "74g", "Mq", "0nC", "0cs", "1f3", "79W", "bbn", 
"42y", "579", "nm", "394", "365", "al", "588", "4yp", "bmo", "76V", "1i2", "0lr", "0aB", "Bp", "6oO", "4Zl", "40H", "6Ac", "2zM", "0On", 
"4HD", "69o", "PX", "E9", "1Mg", "2he", "6SK", "4fh", "4kX", "7NZ", "7L", "0Pv", "3N9", "2Ky", "6pW", "4Et", "4Ju", "5O5", "Ri", "05S", 
"1OV", "8M", "450", "4dY", "4ii", "7Lk", "qu", "0RG", "J8", "2IH", "66n", "4GE", "6ld", "4YG", "0bi", "2WJ", "ow", "0LE", "43c", "6BH", 
"6Ox", "5jz", "0Au", "bG", "Lk", "0oY", "4Tw", "5Q7", "6nU", "5KW", "14q", "Cj", "mF", "0Nt", "41R", "7PX", "6MI", "4xj", "0CD", "22o", 
"NZ", "0mh", "4VF", "6ce", "65A", "4Dj", "1oe", "2Jg", "6R", "0Qh", "4jF", "7OD", "5b6", "4gv", "1Ly", "0I9", "QF", "0rt", "4IZ", "68q", 
"67p", "5Vz", "1mT", "1x5", "4c", "0SY", "4hw", "5m7", "6Pd", "4eG", "1NH", "9S", "Sw", "04M", "4Kk", "7ni", "4Ui", "74c", "Mu", "0nG", 
"20", "cY", "6Nf", "5kd", "4vu", "5s5", "ni", "390", "0cw", "1f7", "4M8", "4XY", "4WX", "4B9", "OD", "0lv", "0BZ", "ah", "6LW", "4yt", 
"40L", "6Ag", "lX", "y9", "0aF", "Bt", "6oK", "4Zh", "1Mc", "2ha", "6SO", "4fl", "5Xa", "69k", "2FM", "07f", "83N", "d5F", "6pS", "4Ep", 
"bQo", "a0e", "7H", "0Pr", "1OR", "8I", "454", "50t", "4Jq", "5O1", "Rm", "05W", "08g", "2IL", "66j", "4GA", "4im", "7Lo", "5y", "0RC", 
"os", "0LA", "43g", "6BL", "78I", "4YC", "0bm", "2WN", "Lo", "8fE", "4Ts", "5Q3", "aen", "cPM", "0Aq", "bC", "mB", "0Np", "41V", "ajo", 
"6nQ", "5KS", "14u", "Cn", "2XO", "0ml", "4VB", "6ca", "6MM", "4xn", "1Sa", "22k", "Sj", "04P", "4Kv", "5N6", "443", "4eZ", "1NU", "9N", 
"pv", "0SD", "4hj", "7Mh", "67m", "4FF", "1mI", "2HK", "2GJ", "2", "4IG", "68l", "6RH", "4gk", "1Ld", "2if", "6O", "0Qu", "5zz", "7OY", 
"5A7", "4Dw", "1ox", "0j8", "15r", "Bi", "6oV", "4Zu", "40Q", "4a8", "lE", "0Ow", "0BG", "au", "6LJ", "4yi", "4WE", "6bf", "OY", "Z8", 
"U9", "2VI", "6mg", "4XD", "4vh", "6CK", "nt", "0MF", "1PW", "cD", "4n9", "5ky", "4Ut", "5P4", "Mh", "0nZ", "4ip", "5l0", "5d", "9Kg", 
"08z", "1y2", "66w", "737", "4Jl", "7on", "Rp", "05J", "1OO", "8T", "6Qc", "50i", "4kA", "7NC", "7U", "0Po", "1nb", "dqS", "64F", "4Em", 
"b6f", "69v", "PA", "0ss", "8TG", "dRO", "5c1", "4fq", "6MP", "4xs", "376", "22v", "NC", "0mq", "bll", "77U", "6nL", "5KN", "14h", "Cs", 
"3ko", "0Nm", "41K", "7PA", "6Oa", "4zB", "37", "20G", "Lr", "8fX", "4Tn", "6aM", "78T", "bcm", "0bp", "AB", "on", "387", "43z", "5r2", 
"447", "51w", "1NQ", "9J", "Sn", "04T", "4Kr", "5N2", "67i", "4FB", "09d", "2HO", "4z", "1Ca", "4hn", "7Ml", "6RL", "4go", "8UY", "2ib", 
"2GN", "6", "4IC", "68h", "5A3", "4Ds", "82M", "d4E", "6K", "0Qq", "bPl", "a1f", "40U", "akl", "lA", "0Os", "15v", "Bm", "6oR", "4Zq", 
"4WA", "6bb", "2YL", "0lo", "0BC", "aq", "6LN", "4ym", "42d", "6CO", "np", "0MB", "0cn", "2VM", "6mc", "5Ha", "4Up", "5P0", "Ml", "8gF", 
"1PS", "1E2", "adm", "bAo", "1lW", "1y6", "4R9", "4GX", "4it", "5l4", "qh", "0RZ", "i9", "8P", "6Qg", "4dD", "4Jh", "7oj", "Rt", "05N", 
"1nf", "2Kd", "64B", "4Ei", "4kE", "7NG", "7Q", "f8", "1Mz", "2hx", "5c5", "4fu", "4HY", "69r", "PE", "0sw", "NG", "0mu", "5Fz", "6cx", 
"6MT", "4xw", "0CY", "0V8", "3kk", "0Ni", "41O", "7PE", "6nH", "5KJ", "14l", "Cw", "Lv", "0oD", "4Tj", "6aI", "6Oe", "4zF", "33", "bZ", 
"oj", "0LX", "4wv", "5r6", "6ly", "4YZ", "0bt", "AF", "4v", "0SL", "4hb", "awS", "67e", "4FN", "K3", "2HC", "Sb", "04X", "b5E", "aTO", 
"4p3", "4eR", "8Wd", "9F", "6G", "257", "4jS", "7OQ", "65T", "cnm", "1op", "0j0", "QS", "D2", "4IO", "68d", "7Ba", "4gc", "1Ll", "2in", 
"0BO", "23d", "6LB", "4ya", "4WM", "6bn", "OQ", "Z0", "0aS", "Ba", "aEL", "c4g", "40Y", "4a0", "lM", "8Fg", "8If", "cL", "4n1", "5kq", 
"616", "74v", "3KP", "0nR", "U1", "2VA", "6mo", "4XL", "42h", "6CC", "2xm", "0MN", "4Jd", "7of", "Rx", "05B", "i5", "2jE", "6Qk", "4dH", 
"4ix", "5l8", "5l", "0RV", "08r", "2IY", "4R5", "4GT", "4HU", "7mW", "PI", "07s", "1Mv", "0H6", "5c9", "4fy", "4kI", "7NK", "sU", "f4", 
"1nj", "2Kh", "64N", "4Ee", "6nD", "5KF", "1ph", "2Uj", "mW", "x6", "41C", "7PI", "593", "5hZ", "0CU", "0V4", "NK", "0my", "4VW", "4C6", 
"4L7", "4YV", "0bx", "AJ", "of", "0LT", "43r", "562", "6Oi", "4zJ", "w7", "bV", "Lz", "0oH", "4Tf", "6aE", "67a", "4FJ", "K7", "2HG", 
"4r", "0SH", "4hf", "7Md", "4p7", "4eV", "1NY", "9B", "Sf", "0pT", "4Kz", "7nx", "65P", "5TZ", "1ot", "0j4", "6C", "0Qy", "4jW", "7OU", 
"6RD", "4gg", "1Lh", "2ij", "QW", "D6", "4IK", "7lI", "4WI", "6bj", "OU", "Z4", "0BK", "ay", "6LF", "4ye", "4tU", "4a4", "lI", "2o9", 
"0aW", "Be", "6oZ", "4Zy", "4Ux", "5P8", "Md", "0nV", "8Ib", "cH", "4n5", "5ku", "42l", "6CG", "nx", "0MJ", "U5", "2VE", "6mk", "4XH", 
"i1", "8X", "6Qo", "4dL", "5ZA", "7ob", "2Dm", "05F", "08v", "d7f", "4R1", "4GP", "bSO", "a2E", "5h", "0RR", "1Mr", "0H2", "ayL", "52T", 
"4HQ", "69z", "PM", "07w", "1nn", "2Kl", "64J", "4Ea", "4kM", "7NO", "7Y", "f0", "mS", "x2", "41G", "7PM", "aDR", "5KB", "14d", "2Un", 
"NO", "19T", "4VS", "4C2", "597", "bBL", "0CQ", "0V0", "ob", "0LP", "43v", "566", "4L3", "4YR", "16U", "AN", "2Zo", "0oL", "4Tb", "6aA", 
"6Om", "4zN", "w3", "bR", "4oT", "4z5", "wH", "0Tz", "0zV", "Yd", "5D8", "4Ax", "4LH", "6yk", "TT", "A5", "0YJ", "zx", "6WG", "4bd", 
"4me", "6XF", "1q", "0VK", "N4", "2MD", "62b", "4CI", "4Ny", "5K9", "Ve", "0uW", "1KZ", "xI", "4u4", "5pt", "4k6", "5nv", "0Ey", "fK", 
"Hg", "0kU", "641", "6eX", "6hh", "5Mj", "P6", "EW", "29b", "0HI", "47o", "6FD", "6IE", "48n", "0GH", "dz", "JV", "0id", "4RJ", "6gi", 
"6jY", "beI", "0dT", "Gf", "iJ", "0Jx", "4qV", "4d7", "UN", "02t", "4MR", "4X3", "a8G", "57W", "0XP", "0M1", "2Z", "c3", "4nN", "7KL", 
"61I", "5PC", "1km", "2No", "2An", "00E", "4Oc", "7ja", "6Tl", "4aO", "l2", "yS", "0k", "0WQ", "58V", "a7F", "4W2", "4BS", "84m", "ZO", 
"13V", "E", "4I0", "5Lp", "46u", "535", "ja", "0IS", "68", "gQ", "6Jn", "5ol", "4Qa", "6dB", "3OM", "0jO", "0eN", "2Pm", "6kC", "5NA", 
"44D", "6Eo", "hP", "99", "0FR", "0S3", "abM", "49t", "4SP", "4F1", "KL", "8af", "0zR", "0o3", "60W", "ckn", "4oP", "4z1", "3D", "204", 
"0YN", "2lm", "6WC", "56I", "4LL", "6yo", "TP", "A1", "N0", "903", "62f", "4CM", "4ma", "6XB", "1u", "0VO", "8Rg", "xM", "418", "54x", 
"b0F", "aQL", "Va", "0uS", "Hc", "0kQ", "645", "71u", "4k2", "5nr", "8Le", "fO", "29f", "0HM", "47k", "7Va", "6hl", "5Mn", "P2", "ES", 
"JR", "1yA", "4RN", "6gm", "6IA", "48j", "0GL", "26g", "iN", "8Cd", "45Z", "4d3", "hYv", "beM", "0dP", "Gb", "6VY", "4cz", "0XT", "0M5", 
"UJ", "02p", "4MV", "4X7", "61M", "5PG", "1ki", "Xz", "vV", "c7", "4nJ", "7KH", "6Th", "4aK", "l6", "yW", "2Aj", "00A", "4Og", "6zD", 
"4W6", "4BW", "0yy", "ZK", "0o", "0WU", "58R", "6YX", "46q", "531", "je", "0IW", "13R", "A", "4I4", "5Lt", "4Qe", "6dF", "Iy", "0jK", 
"r4", "gU", "6Jj", "5oh", "4pH", "6Ek", "hT", "0Kf", "0eJ", "Fx", "6kG", "5NE", "4ST", "4F5", "KH", "0hz", "0FV", "ed", "5x8", "49p", 
"bvs", "6yc", "2BM", "03f", "0YB", "zp", "6WO", "4bl", "bUo", "a4e", "3H", "0Tr", "87N", "Yl", "5D0", "4Ap", "4Nq", "5K1", "Vm", "01W", 
"1KR", "xA", "414", "54t", "4mm", "6XN", "1y", "0VC", "0xo", "2ML", "62j", "4CA", "7xA", "5Mb", "0fm", "2SN", "ks", "0HA", "47g", "6FL", 
"aan", "bDl", "0Eq", "fC", "Ho", "8bE", "4Ps", "5U3", "5Z2", "5OS", "10u", "Gn", "iB", "0Jp", "45V", "ano", "6IM", "48f", "1Wa", "dr", 
"3Ln", "0il", "4RB", "6ga", "2R", "0Uh", "4nF", "7KD", "61A", "5PK", "1ke", "Xv", "UF", "0vt", "4MZ", "6xy", "5f6", "4cv", "0XX", "0M9", 
"0c", "0WY", "4lw", "5i7", "63p", "5Rz", "0yu", "ZG", "Ww", "00M", "4Ok", "6zH", "6Td", "4aG", "0Zi", "2oJ", "60", "gY", "6Jf", "5od", 
"4Qi", "6dJ", "Iu", "0jG", "0gw", "M", "4I8", "5Lx", "4ru", "5w5", "ji", "1Yz", "0FZ", "eh", "5x4", "5mU", "4SX", "4F9", "KD", "0hv", 
"0eF", "Ft", "6kK", "5NI", "44L", "6Eg", "hX", "91", "0YF", "zt", "6WK", "4bh", "4LD", "6yg", "TX", "A9", "0zZ", "Yh", "5D4", "4At", 
"4oX", "4z9", "3L", "0Tv", "1KV", "xE", "410", "54p", "4Nu", "5K5", "Vi", "01S", "N8", "2MH", "62n", "4CE", "4mi", "6XJ", "uu", "0VG", 
"kw", "0HE", "47c", "6FH", "6hd", "5Mf", "0fi", "2SJ", "Hk", "0kY", "4Pw", "5U7", "6Kx", "5nz", "0Eu", "fG", "iF", "0Jt", "45R", "6Dy", 
"5Z6", "5OW", "0dX", "Gj", "JZ", "0ih", "4RF", "6ge", "6II", "48b", "0GD", "dv", "61E", "5PO", "1ka", "Xr", "2V", "0Ul", "4nB", "aqs", 
"5f2", "4cr", "8QD", "39V", "UB", "02x", "795", "aRo", "63t", "764", "0yq", "ZC", "0g", "9Nd", "4ls", "5i3", "7DA", "4aC", "0Zm", "2oN", 
"Ws", "00I", "4Oo", "6zL", "4Qm", "6dN", "Iq", "0jC", "64", "25D", "6Jb", "bEr", "46y", "539", "jm", "9Pf", "0gs", "I", "aCl", "bfn", 
"bio", "72V", "1m2", "0hr", "325", "el", "5x0", "49x", "44H", "6Ec", "3nl", "95", "0eB", "Fp", "6kO", "5NM", "4mt", "5h4", "uh", "0VZ", 
"0xv", "2MU", "4V9", "4CX", "4Nh", "7kj", "Vt", "01N", "m9", "xX", "6Ug", "54m", "4oE", "6Zf", "3Q", "b8", "0zG", "Yu", "60B", "4Ai", 
"4LY", "4Y8", "TE", "0ww", "1Iz", "zi", "5g5", "4bu", "5y7", "5lV", "0GY", "dk", "JG", "0iu", "5Bz", "6gx", "6jH", "5OJ", "0dE", "Gw", 
"3ok", "82", "45O", "6Dd", "6Ke", "5ng", "73", "fZ", "Hv", "0kD", "4Pj", "6eI", "6hy", "7m9", "0ft", "EF", "kj", "0HX", "4sv", "5v6", 
"Wn", "00T", "4Or", "5J2", "407", "55w", "0Zp", "yB", "0z", "1Ga", "4ln", "6YM", "63i", "4BB", "0yl", "2LO", "2CN", "02e", "4MC", "7hA", 
"6VL", "4co", "0XA", "2mb", "2K", "0Uq", "bTl", "a5f", "5E3", "5PR", "86M", "Xo", "11v", "Fm", "6kR", "5NP", "44U", "aol", "hA", "0Ks", 
"0FC", "eq", "6HN", "49e", "4SA", "6fb", "3Mm", "0ho", "0gn", "T", "6ic", "5La", "46d", "6GO", "jp", "0IB", "0Dr", "1A2", "hyT", "bEo", 
"4Qp", "5T0", "Il", "8cF", "0xr", "2MQ", "62w", "777", "4mp", "5h0", "1d", "9Og", "1KO", "2nM", "6Uc", "54i", "4Nl", "7kn", "Vp", "01J", 
"0zC", "Yq", "60F", "4Am", "4oA", "6Zb", "3U", "0To", "8PG", "zm", "5g1", "4bq", "786", "aSl", "TA", "0ws", "JC", "0iq", "bhl", "73U", 
"5y3", "5lR", "336", "do", "3oo", "86", "45K", "7TA", "6jL", "5ON", "0dA", "Gs", "Hr", "8bX", "4Pn", "6eM", "6Ka", "5nc", "77", "24G", 
"kn", "8AD", "47z", "5v2", "aBo", "bgm", "0fp", "EB", "403", "4aZ", "0Zt", "yF", "Wj", "00P", "4Ov", "5J6", "63m", "4BF", "0yh", "ZZ", 
"tv", "0WD", "4lj", "6YI", "6VH", "4ck", "0XE", "2mf", "2CJ", "02a", "4MG", "6xd", "5E7", "5PV", "1kx", "Xk", "2O", "0Uu", "bTh", "7KY", 
"44Q", "4e8", "hE", "0Kw", "11r", "Fi", "6kV", "5NT", "4SE", "6ff", "KY", "0hk", "0FG", "eu", "6HJ", "49a", "4rh", "6GK", "jt", "0IF", 
"Q9", "P", "6ig", "5Le", "4Qt", "5T4", "Ih", "0jZ", "0Dv", "gD", "4j9", "5oy", "aD0", "7kb", "3PL", "01F", "m1", "xP", "6Uo", "54e", 
"59U", "a6E", "1h", "0VR", "85n", "196", "4V1", "4CP", "4LQ", "4Y0", "TM", "03w", "0YS", "za", "a9D", "56T", "4oM", "6Zn", "3Y", "b0", 
"0zO", "2Ol", "60J", "4Aa", "7za", "5OB", "0dM", "2Qn", "iS", "0Ja", "45G", "6Dl", "acN", "48w", "0GQ", "dc", "JO", "94L", "4RS", "4G2", 
"4H3", "5Ms", "12U", "EN", "kb", "0HP", "47v", "526", "6Km", "5no", "s3", "fR", "3NN", "0kL", "4Pb", "6eA", "0r", "0WH", "4lf", "6YE", 
"63a", "4BJ", "O7", "ZV", "Wf", "0tT", "4Oz", "6zY", "4t7", "4aV", "0Zx", "yJ", "2C", "0Uy", "4nW", "7KU", "61P", "5PZ", "1kt", "Xg", 
"UW", "02m", "4MK", "6xh", "6VD", "4cg", "0XI", "2mj", "0FK", "ey", "6HF", "49m", "4SI", "6fj", "KU", "0hg", "0eW", "Fe", "6kZ", "5NX", 
"4pU", "4e4", "hI", "2k9", "0Dz", "gH", "4j5", "5ou", "4Qx", "5T8", "Id", "0jV", "Q5", "DT", "6ik", "5Li", "46l", "6GG", "jx", "0IJ", 
"m5", "xT", "6Uk", "54a", "4Nd", "7kf", "Vx", "01B", "0xz", "192", "4V5", "4CT", "4mx", "5h8", "1l", "0VV", "0YW", "ze", "5g9", "4by", 
"4LU", "4Y4", "TI", "03s", "0zK", "Yy", "60N", "4Ae", "4oI", "6Zj", "wU", "b4", "iW", "0Je", "45C", "6Dh", "6jD", "5OF", "0dI", "2Qj", 
"JK", "0iy", "4RW", "4G6", "6IX", "48s", "0GU", "dg", "kf", "0HT", "47r", "522", "4H7", "5Mw", "0fx", "EJ", "Hz", "0kH", "4Pf", "6eE", 
"6Ki", "5nk", "s7", "fV", "63e", "4BN", "O3", "ZR", "0v", "0WL", "4lb", "6YA", "4t3", "4aR", "8Sd", "yN", "Wb", "00X", "b1E", "aPO", 
"61T", "bzL", "1kp", "Xc", "2G", "217", "4nS", "7KQ", "7Fa", "4cc", "0XM", "2mn", "US", "02i", "4MO", "6xl", "4SM", "6fn", "KQ", "0hc", 
"0FO", "27d", "6HB", "49i", "44Y", "4e0", "hM", "8Bg", "0eS", "Fa", "aAL", "bdN", "656", "70v", "3OP", "0jR", "8Mf", "gL", "4j1", "5oq", 
"46h", "6GC", "28e", "0IN", "Q1", "X", "6io", "5Lm", "6KV", "5nT", "1Uz", "fi", "HE", "0kw", "4PY", "4E8", "6hJ", "5MH", "0fG", "Eu", 
"kY", "0Hk", "47M", "6Ff", "6Ig", "48L", "51", "dX", "Jt", "0iF", "4Rh", "6gK", "4J9", "5Oy", "0dv", "GD", "ih", "0JZ", "4qt", "5t4", 
"4ov", "5j6", "3b", "0TX", "0zt", "YF", "60q", "4AZ", "4Lj", "6yI", "Tv", "03L", "0Yh", "zZ", "6We", "4bF", "4mG", "6Xd", "1S", "0Vi", 
"0xE", "2Mf", "6vH", "4Ck", "bth", "7kY", "VG", "0uu", "1Kx", "xk", "5e7", "5pV", "13t", "g", "5Y3", "5LR", "46W", "amn", "jC", "0Iq", 
"0DA", "gs", "6JL", "5oN", "4QC", "70I", "3Oo", "0jm", "0el", "2PO", "6ka", "5Nc", "44f", "6EM", "hr", "8BX", "0Fp", "eB", "abo", "49V", 
"4Sr", "5V2", "Kn", "8aD", "Ul", "02V", "4Mp", "5H0", "425", "57u", "0Xr", "2mQ", "2x", "0UB", "4nl", "7Kn", "61k", "5Pa", "1kO", "2NM", 
"2AL", "00g", "4OA", "6zb", "6TN", "4am", "0ZC", "yq", "0I", "0Ws", "58t", "a7d", "5G1", "4Bq", "84O", "Zm", "HA", "0ks", "bjn", "71W", 
"6KR", "5nP", "314", "fm", "29D", "0Ho", "47I", "6Fb", "6hN", "5ML", "0fC", "Eq", "Jp", "0iB", "4Rl", "6gO", "6Ic", "48H", "55", "26E", 
"il", "8CF", "45x", "508", "hYT", "beo", "0dr", "1a2", "0zp", "YB", "60u", "755", "4or", "5j2", "3f", "9Me", "0Yl", "2lO", "6Wa", "4bB", 
"4Ln", "6yM", "Tr", "03H", "0xA", "2Mb", "62D", "4Co", "4mC", "7HA", "1W", "0Vm", "8RE", "xo", "5e3", "54Z", "b0d", "aQn", "VC", "01y", 
"46S", "6Gx", "jG", "0Iu", "0gY", "c", "5Y7", "5LV", "4QG", "6dd", "3Ok", "0ji", "0DE", "gw", "6JH", "5oJ", "44b", "6EI", "hv", "0KD", 
"0eh", "FZ", "6ke", "5Ng", "4Sv", "5V6", "Kj", "0hX", "0Ft", "eF", "6Hy", "49R", "421", "4cX", "0Xv", "2mU", "Uh", "02R", "4Mt", "5H4", 
"61o", "5Pe", "M9", "XX", "vt", "0UF", "4nh", "7Kj", "6TJ", "4ai", "0ZG", "yu", "WY", "B8", "4OE", "6zf", "5G5", "4Bu", "1iz", "Zi", 
"0M", "0Ww", "4lY", "4y8", "6hB", "aW1", "0fO", "2Sl", "kQ", "0Hc", "47E", "6Fn", "aaL", "bDN", "0ES", "fa", "HM", "8bg", "4PQ", "4E0", 
"4J1", "5Oq", "10W", "GL", "3oP", "0JR", "45t", "504", "6Io", "48D", "59", "dP", "3LL", "0iN", "5BA", "6gC", "4Lb", "6yA", "2Bo", "03D", 
"o3", "zR", "6Wm", "4bN", "bUM", "a4G", "3j", "0TP", "87l", "YN", "4T3", "4AR", "4NS", "7kQ", "VO", "01u", "1Kp", "xc", "hfw", "54V", 
"4mO", "6Xl", "uS", "0Va", "0xM", "2Mn", "62H", "4Cc", "0DI", "25b", "6JD", "5oF", "4QK", "6dh", "IW", "0je", "0gU", "o", "6iX", "5LZ", 
"4rW", "4g6", "jK", "0Iy", "0Fx", "eJ", "4h7", "5mw", "4Sz", "6fY", "Kf", "0hT", "S7", "FV", "6ki", "5Nk", "44n", "6EE", "hz", "0KH", 
"2p", "0UJ", "4nd", "7Kf", "61c", "5Pi", "M5", "XT", "Ud", "0vV", "4Mx", "5H8", "4v5", "4cT", "0Xz", "2mY", "0A", "1GZ", "4lU", "4y4", 
"5G9", "4By", "0yW", "Ze", "WU", "B4", "4OI", "6zj", "6TF", "4ae", "0ZK", "yy", "kU", "0Hg", "47A", "6Fj", "6hF", "5MD", "0fK", "Ey", 
"HI", "2K9", "4PU", "4E4", "6KZ", "5nX", "0EW", "fe", "id", "0JV", "45p", "500", "4J5", "5Ou", "0dz", "GH", "Jx", "0iJ", "4Rd", "6gG", 
"6Ik", "5li", "q5", "dT", "o7", "zV", "6Wi", "4bJ", "4Lf", "6yE", "Tz", "0wH", "0zx", "YJ", "4T7", "4AV", "4oz", "6ZY", "3n", "0TT", 
"1Kt", "xg", "6UX", "54R", "4NW", "7kU", "VK", "01q", "0xI", "2Mj", "62L", "4Cg", "4mK", "6Xh", "uW", "0Ve", "4QO", "6dl", "IS", "0ja", 
"0DM", "25f", "7Za", "5oB", "4rS", "4g2", "jO", "9PD", "0gQ", "k", "aCN", "685", "674", "72t", "Kb", "0hP", "8Od", "eN", "4h3", "49Z", 
"44j", "6EA", "3nN", "0KL", "S3", "FR", "6km", "5No", "61g", "5Pm", "M1", "XP", "2t", "0UN", "ad0", "7Kb", "429", "4cP", "8Qf", "39t", 
"0c3", "02Z", "b3G", "aRM", "63V", "bxN", "0yS", "Za", "0E", "235", "4lQ", "4y0", "6TB", "4aa", "0ZO", "2ol", "WQ", "B0", "4OM", "6zn", 
"4i4", "5lt", "1WZ", "dI", "Je", "0iW", "4Ry", "5W9", "6jj", "5Oh", "R4", "GU", "iy", "0JK", "45m", "6DF", "6KG", "5nE", "0EJ", "fx", 
"HT", "0kf", "4PH", "6ek", "5X8", "5MY", "0fV", "Ed", "kH", "0Hz", "4sT", "4f5", "4mV", "4x7", "1B", "0Vx", "0xT", "0m5", "62Q", "4Cz", 
"4NJ", "7kH", "VV", "C7", "1Ki", "xz", "6UE", "54O", "4og", "6ZD", "3s", "0TI", "L6", "YW", "6th", "4AK", "6l9", "6yX", "Tg", "0wU", 
"0Yy", "zK", "4w6", "4bW", "11T", "FO", "4K2", "5Nr", "44w", "517", "hc", "0KQ", "p2", "eS", "6Hl", "49G", "4Sc", "72i", "3MO", "0hM", 
"0gL", "v", "6iA", "5LC", "46F", "6Gm", "jR", "1YA", "0DP", "gb", "hyv", "bEM", "4QR", "4D3", "IN", "8cd", "WL", "00v", "4OP", "4Z1", 
"hgt", "55U", "0ZR", "0O3", "0X", "a1", "4lL", "6Yo", "63K", "5RA", "0yN", "2Lm", "2Cl", "02G", "4Ma", "6xB", "6Vn", "4cM", "n0", "39i", 
"2i", "0US", "bTN", "a5D", "4U0", "5Pp", "86o", "XM", "Ja", "0iS", "667", "73w", "4i0", "48Y", "8Ng", "dM", "3oM", "0JO", "45i", "6DB", 
"6jn", "5Ol", "R0", "GQ", "HP", "0kb", "4PL", "6eo", "6KC", "5nA", "0EN", "24e", "kL", "8Af", "47X", "4f1", "aBM", "696", "0fR", "0s3", 
"0xP", "0m1", "62U", "byM", "4mR", "4x3", "1F", "226", "1Km", "2no", "6UA", "54K", "4NN", "7kL", "VR", "C3", "L2", "YS", "60d", "4AO", 
"4oc", "7Ja", "3w", "0TM", "8Pe", "zO", "4w2", "4bS", "b2D", "aSN", "Tc", "03Y", "44s", "513", "hg", "0KU", "0ey", "FK", "4K6", "5Nv", 
"4Sg", "6fD", "3MK", "0hI", "p6", "eW", "6Hh", "49C", "46B", "6Gi", "jV", "0Id", "0gH", "r", "6iE", "5LG", "4QV", "4D7", "IJ", "0jx", 
"0DT", "gf", "6JY", "bEI", "5d8", "4ax", "0ZV", "yd", "WH", "00r", "4OT", "4Z5", "63O", "4Bd", "0yJ", "Zx", "tT", "a5", "4lH", "6Yk", 
"6Vj", "4cI", "n4", "2mD", "Uy", "02C", "4Me", "6xF", "4U4", "5Pt", "1kZ", "XI", "2m", "0UW", "4ny", "5k9", "6jb", "ber", "0do", "2QL", 
"iq", "0JC", "45e", "6DN", "acl", "48U", "0Gs", "dA", "Jm", "94n", "4Rq", "5W1", "5X0", "5MQ", "12w", "El", "1M2", "0Hr", "47T", "alm", 
"6KO", "5nM", "0EB", "fp", "3Nl", "0kn", "bjs", "6ec", "4NB", "aQs", "3Pn", "01d", "1Ka", "xr", "6UM", "54G", "59w", "a6g", "1J", "0Vp", 
"85L", "d3D", "5F2", "4Cr", "4Ls", "5I3", "To", "03U", "0Yq", "zC", "436", "56v", "4oo", "6ZL", "ws", "0TA", "0zm", "2ON", "60h", "4AC", 
"42", "27B", "6Hd", "49O", "4Sk", "6fH", "Kw", "0hE", "0eu", "FG", "6kx", "5Nz", "4pw", "5u7", "hk", "0KY", "0DX", "gj", "5z6", "5oW", 
"4QZ", "6dy", "IF", "0jt", "0gD", "Dv", "6iI", "5LK", "46N", "6Ge", "jZ", "0Ih", "0P", "a9", "4lD", "6Yg", "63C", "4Bh", "0yF", "Zt", 
"WD", "0tv", "4OX", "4Z9", "5d4", "4at", "0ZZ", "yh", "2a", "1Ez", "4nu", "5k5", "4U8", "5Px", "1kV", "XE", "Uu", "02O", "4Mi", "6xJ", 
"6Vf", "4cE", "n8", "2mH", "iu", "0JG", "45a", "6DJ", "6jf", "5Od", "R8", "GY", "Ji", "1yz", "4Ru", "5W5", "4i8", "48Q", "0Gw", "dE", 
"kD", "0Hv", "47P", "4f9", "5X4", "5MU", "0fZ", "Eh", "HX", "0kj", "4PD", "6eg", "6KK", "5nI", "0EF", "ft", "1Ke", "xv", "6UI", "54C", 
"4NF", "7kD", "VZ", "0uh", "0xX", "0m9", "5F6", "4Cv", "4mZ", "6Xy", "1N", "0Vt", "0Yu", "zG", "432", "56r", "4Lw", "5I7", "Tk", "03Q", 
"0zi", "2OJ", "60l", "4AG", "4ok", "6ZH", "ww", "0TE", "4So", "6fL", "Ks", "0hA", "46", "27F", "7XA", "49K", "4ps", "5u3", "ho", "8BE", 
"0eq", "FC", "aAn", "bdl", "bkm", "70T", "IB", "0jp", "307", "gn", "5z2", "5oS", "46J", "6Ga", "28G", "0Il", "13i", "z", "6iM", "5LO", 
"63G", "4Bl", "0yB", "Zp", "0T", "0Wn", "58i", "6Yc", "5d0", "4ap", "8SF", "yl", "1q2", "00z", "b1g", "aPm", "61v", "746", "1kR", "XA", 
"2e", "9Lf", "4nq", "5k1", "6Vb", "4cA", "0Xo", "2mL", "Uq", "02K", "4Mm", "6xN", "8YG", "7e", "5n1", "4kq", "716", "64v", "2KP", "1nR", 
"07K", "Pq", "69F", "4Hm", "4fA", "6Sb", "2hL", "1MN", "0Rn", "5T", "7LB", "5ya", "4Gl", "66G", "2Ia", "08J", "05z", "1t2", "aUm", "b4g", 
"4dp", "5a0", "8d", "8VF", "bn", "357", "4zr", "6OQ", "75T", "bnm", "0op", "LB", "Ar", "16i", "4Yn", "6lM", "6Ba", "43J", "0Ll", "2yO", 
"22F", "16", "4xC", "agr", "6cL", "4Vo", "0mA", "Ns", "CC", "14X", "bal", "aDn", "5p3", "4us", "8GE", "mo", "5L7", "4Iw", "06Q", "Qk", 
"1Y5", "1LT", "53r", "462", "7Oi", "4jk", "0QE", "rw", "2JJ", "1oH", "4DG", "65l", "7nD", "4KF", "0ph", "SZ", "2kg", "1Ne", "4ej", "6PI", 
"493", "4hZ", "0St", "4N", "0h9", "09P", "4Fv", "5C6", "4Xt", "6mW", "023", "0cZ", "0Mv", "nD", "4c9", "42P", "5kI", "6NK", "ct", "1Pg", 
"X9", "MX", "74N", "4UD", "4ZE", "6of", "BY", "W8", "0OG", "lu", "6AJ", "40a", "4yY", "4l8", "aE", "0Bw", "18r", "Oi", "5R5", "4Wu", 
"4EY", "4P8", "2KT", "1nV", "8YC", "7a", "5n5", "4ku", "4fE", "6Sf", "2hH", "k8", "07O", "Pu", "69B", "4Hi", "4Gh", "66C", "2Ie", "08N", 
"d9", "5P", "7LF", "4iD", "4dt", "5a4", "2jy", "3o9", "0qv", "RD", "7oZ", "4JX", "6ay", "4TZ", "0ot", "LF", "bj", "0AX", "4zv", "6OU", 
"6Be", "43N", "0Lh", "oZ", "Av", "0bD", "4Yj", "6lI", "6cH", "4Vk", "0mE", "Nw", "22B", "12", "4xG", "6Md", "5p7", "4uw", "0NY", "mk", 
"CG", "1pT", "5Kz", "6nx", "1Y1", "1LP", "53v", "466", "5L3", "4Is", "06U", "Qo", "2JN", "1oL", "4DC", "65h", "7Om", "4jo", "0QA", "rs", 
"9z", "1Na", "4en", "6PM", "aTs", "4KB", "04d", "2EO", "d6D", "09T", "4Fr", "5C2", "497", "bRm", "0Sp", "4J", "0Mr", "1H2", "aim", "42T", 
"4Xp", "6mS", "027", "17w", "0nn", "3Kl", "74J", "5Ea", "5kM", "6NO", "cp", "1Pc", "0OC", "lq", "6AN", "40e", "4ZA", "6ob", "2TL", "0ao", 
"18v", "Om", "5R1", "4Wq", "bCn", "afl", "aA", "0Bs", "07C", "Py", "69N", "4He", "4fI", "6Sj", "2hD", "k4", "0PW", "7m", "5n9", "4ky", 
"4EU", "4P4", "2KX", "1nZ", "05r", "RH", "7oV", "4JT", "4dx", "5a8", "8l", "1Ow", "d5", "qT", "7LJ", "4iH", "4Gd", "66O", "2Ii", "08B", 
"Az", "0bH", "4Yf", "6lE", "6Bi", "43B", "z7", "oV", "bf", "0AT", "4zz", "6OY", "4A7", "4TV", "0ox", "LJ", "CK", "14P", "5Kv", "4N6", 
"543", "41s", "0NU", "mg", "22N", "u6", "4xK", "6Mh", "6cD", "4Vg", "0mI", "2Xj", "7Oa", "4jc", "0QM", "6w", "2JB", "I2", "4DO", "65d", 
"68T", "b7D", "06Y", "Qc", "dSm", "287", "4gS", "4r2", "7MP", "4hR", "276", "4F", "0h1", "09X", "b8E", "67U", "7nL", "4KN", "F3", "SR", 
"9v", "1Nm", "4eb", "6PA", "5kA", "6NC", "21e", "1Po", "X1", "MP", "74F", "4UL", "bbO", "79v", "0v3", "0cR", "8Df", "nL", "4c1", "42X", 
"4yQ", "4l0", "aM", "8Kg", "0lS", "Oa", "76w", "637", "4ZM", "6on", "BQ", "W0", "0OO", "2zl", "6AB", "40i", "4fM", "6Sn", "3xa", "k0", 
"07G", "2Fl", "69J", "4Ha", "4EQ", "4P0", "d5g", "83o", "0PS", "7i", "a0D", "bQN", "50U", "hbt", "8h", "1Os", "05v", "RL", "7oR", "4JP", 
"5WA", "66K", "2Im", "08F", "d1", "5X", "7LN", "4iL", "6Bm", "43F", "z3", "oR", "2Wo", "0bL", "4Yb", "6lA", "4A3", "4TR", "8fd", "LN", 
"bb", "0AP", "cPl", "aeO", "547", "41w", "0NQ", "mc", "CO", "14T", "5Kr", "4N2", "77i", "4Vc", "0mM", "2Xn", "22J", "u2", "4xO", "6Ml", 
"2JF", "I6", "4DK", "6qh", "7Oe", "4jg", "0QI", "6s", "1Y9", "1LX", "4gW", "4r6", "68P", "5YZ", "0rU", "Qg", "0h5", "1mu", "4Fz", "67Q", 
"7MT", "4hV", "0Sx", "4B", "9r", "1Ni", "4ef", "6PE", "7nH", "4KJ", "F7", "SV", "X5", "MT", "74B", "4UH", "5kE", "6NG", "cx", "1Pk", 
"0Mz", "nH", "4c5", "4vT", "4Xx", "79r", "0v7", "0cV", "0lW", "Oe", "5R9", "4Wy", "4yU", "4l4", "aI", "1RZ", "0OK", "ly", "6AF", "40m", 
"4ZI", "6oj", "BU", "W4", "265", "5E", "488", "4iQ", "b9F", "66V", "0i2", "1lr", "G0", "RQ", "7oO", "4JM", "4da", "6QB", "8u", "1On", 
"0PN", "7t", "7Nb", "aa0", "4EL", "64g", "2KA", "H1", "07Z", "0f3", "69W", "b6G", "4fP", "479", "dRn", "294", "22W", "8Jd", "4xR", "4m3", 
"77t", "624", "0mP", "Nb", "CR", "V3", "5Ko", "6nm", "ajS", "41j", "0NL", "3kN", "20f", "0AM", "4zc", "aeR", "6al", "4TO", "Y2", "LS", 
"Ac", "0bQ", "bcL", "78u", "4b2", "4wS", "8Ee", "oO", "7nU", "4KW", "04q", "SK", "9o", "1Nt", "51R", "6PX", "7MI", "4hK", "e6", "pW", 
"2Hj", "09A", "4Fg", "67L", "68M", "4If", "0rH", "Qz", "2iG", "j7", "4gJ", "6Ri", "7Ox", "4jz", "0QT", "6n", "1z8", "1oY", "4DV", "4Q7", 
"4ZT", "4O5", "BH", "0az", "0OV", "ld", "550", "40p", "4yH", "6Lk", "aT", "t5", "0lJ", "Ox", "6bG", "4Wd", "4Xe", "6mF", "2Vh", "0cK", 
"0Mg", "nU", "6Cj", "42A", "5kX", "6NZ", "ce", "1Pv", "2N9", "MI", "7pW", "4UU", "4Gy", "5B9", "0i6", "1lv", "1BZ", "5A", "7LW", "4iU", 
"4de", "6QF", "8q", "1Oj", "G4", "RU", "7oK", "4JI", "4EH", "64c", "2KE", "H5", "0PJ", "7p", "7Nf", "4kd", "4fT", "4s5", "2hY", "290", 
"0sV", "Pd", "5M8", "4Hx", "6cY", "4Vz", "0mT", "Nf", "1F8", "0Cx", "4xV", "4m7", "7Pd", "41n", "0NH", "mz", "CV", "V7", "5Kk", "6ni", 
"6ah", "4TK", "Y6", "LW", "20b", "0AI", "4zg", "6OD", "4b6", "4wW", "0Ly", "oK", "Ag", "0bU", "5IZ", "6lX", "9k", "1Np", "51V", "azN", 
"7nQ", "4KS", "04u", "SO", "2Hn", "09E", "4Fc", "67H", "7MM", "4hO", "e2", "pS", "2iC", "j3", "4gN", "6Rm", "68I", "4Ib", "06D", "2Go", 
"d4d", "82l", "4DR", "4Q3", "a1G", "bPM", "0QP", "6j", "0OR", "0Z3", "554", "40t", "4ZP", "4O1", "BL", "15W", "0lN", "2Ym", "6bC", "5GA", 
"4yL", "6Lo", "aP", "09", "0Mc", "nQ", "6Cn", "42E", "4Xa", "6mB", "2Vl", "0cO", "8gg", "MM", "7pS", "4UQ", "bAN", "adL", "ca", "1Pr", 
"G8", "RY", "7oG", "4JE", "4di", "6QJ", "2jd", "1Of", "0Rw", "5M", "480", "4iY", "4Gu", "5B5", "2Ix", "08S", "07R", "Ph", "5M4", "4Ht", 
"4fX", "471", "1X6", "1MW", "0PF", "st", "7Nj", "4kh", "4ED", "64o", "2KI", "H9", "CZ", "14A", "5Kg", "6ne", "7Ph", "41b", "0ND", "mv", 
"1F4", "0Ct", "4xZ", "6My", "5S6", "4Vv", "0mX", "Nj", "Ak", "0bY", "4Yw", "6lT", "6Bx", "43S", "0Lu", "oG", "bw", "0AE", "4zk", "6OH", 
"6ad", "4TG", "0oi", "2ZJ", "7MA", "4hC", "0Sm", "4W", "2Hb", "09I", "4Fo", "67D", "aTn", "b5d", "04y", "SC", "9g", "8WE", "4es", "6PP", 
"5o2", "4jr", "8XD", "6f", "1z0", "1oQ", "705", "65u", "68E", "4In", "06H", "Qr", "2iO", "1LM", "4gB", "6Ra", "5ia", "6Lc", "23E", "05", 
"0lB", "Op", "6bO", "4Wl", "c4F", "aEm", "1d2", "0ar", "8FF", "ll", "558", "40x", "5kP", "6NR", "cm", "344", "0ns", "MA", "74W", "bon", 
"4Xm", "6mN", "3FA", "0cC", "0Mo", "2xL", "6Cb", "42I", "4dm", "6QN", "8y", "1Ob", "05g", "2DL", "7oC", "4JA", "4Gq", "5B1", "d7G", "08W", 
"0Rs", "5I", "484", "bSn", "52u", "475", "1X2", "1MS", "07V", "Pl", "5M0", "4Hp", "5Ua", "64k", "2KM", "1nO", "0PB", "7x", "7Nn", "4kl", 
"7Pl", "41f", "8GX", "mr", "2UO", "14E", "5Kc", "6na", "5S2", "4Vr", "19u", "Nn", "1F0", "0Cp", "bBm", "ago", "ahn", "43W", "0Lq", "oC", 
"Ao", "16t", "4Ys", "6lP", "75I", "4TC", "0om", "2ZN", "bs", "0AA", "4zo", "6OL", "2Hf", "09M", "4Fk", "6sH", "7ME", "4hG", "0Si", "4S", 
"9c", "1Nx", "4ew", "6PT", "7nY", "bqh", "0pu", "SG", "1z4", "1oU", "4DZ", "65q", "5o6", "4jv", "0QX", "6b", "2iK", "1LI", "4gF", "6Re", 
"68A", "4Ij", "06L", "Qv", "0lF", "Ot", "6bK", "4Wh", "4yD", "6Lg", "aX", "01", "0OZ", "lh", "5q4", "4tt", "4ZX", "4O9", "BD", "0av", 
"0nw", "ME", "74S", "4UY", "5kT", "6NV", "ci", "1Pz", "0Mk", "nY", "6Cf", "42M", "4Xi", "6mJ", "2Vd", "0cG", "bL", "8Hf", "4zP", "4o1", 
"75v", "606", "0oR", "0z3", "AP", "T1", "4YL", "6lo", "6BC", "43h", "0LN", "2ym", "22d", "0CO", "4xa", "6MB", "6cn", "4VM", "0mc", "NQ", 
"Ca", "14z", "baN", "aDL", "7PS", "41Y", "8Gg", "mM", "247", "7G", "7NQ", "4kS", "com", "64T", "0k0", "1np", "E2", "PS", "69d", "4HO", 
"4fc", "7Ca", "2hn", "1Ml", "0RL", "5v", "avS", "4ib", "4GN", "66e", "2IC", "J3", "05X", "Rb", "aUO", "b4E", "4dR", "4q3", "8F", "8Vd", 
"4XV", "4M7", "1f8", "0cx", "0MT", "nf", "572", "42r", "5kk", "6Ni", "cV", "v7", "0nH", "Mz", "74l", "4Uf", "4Zg", "6oD", "2Tj", "0aI", 
"y6", "lW", "6Ah", "40C", "5iZ", "583", "ag", "0BU", "0ly", "OK", "4B6", "4WW", "7lW", "4IU", "06s", "QI", "0I6", "1Lv", "4gy", "5b9", 
"7OK", "4jI", "g4", "rU", "2Jh", "1oj", "4De", "65N", "7nf", "4Kd", "04B", "Sx", "2kE", "h5", "4eH", "6Pk", "5m8", "4hx", "0SV", "4l", 
"2HY", "09r", "4FT", "4S5", "5Q8", "4Tx", "0oV", "Ld", "bH", "0Az", "4zT", "4o5", "6BG", "43l", "0LJ", "ox", "AT", "T5", "4YH", "6lk", 
"6cj", "4VI", "0mg", "NU", "2vh", "0CK", "4xe", "6MF", "7PW", "4uU", "2n9", "mI", "Ce", "1pv", "5KX", "6nZ", "5UZ", "64P", "0k4", "1nt", 
"0Py", "7C", "7NU", "4kW", "4fg", "6SD", "2hj", "1Mh", "E6", "PW", "7mI", "4HK", "4GJ", "66a", "2IG", "J7", "0RH", "5r", "7Ld", "4if", 
"4dV", "4q7", "8B", "1OY", "0qT", "Rf", "7ox", "4Jz", "0MP", "nb", "576", "42v", "4XR", "4M3", "dll", "17U", "0nL", "3KN", "74h", "4Ub", 
"5ko", "6Nm", "cR", "v3", "y2", "lS", "6Al", "40G", "4Zc", "aER", "2Tn", "0aM", "18T", "OO", "4B2", "4WS", "bCL", "587", "ac", "0BQ", 
"0I2", "1Lr", "53T", "axL", "68z", "4IQ", "06w", "QM", "2Jl", "1on", "4Da", "65J", "7OO", "4jM", "g0", "6Y", "9X", "h1", "4eL", "6Po", 
"7nb", "aA0", "04F", "2Em", "d6f", "09v", "4FP", "4S1", "a3E", "bRO", "0SR", "4h", "AX", "T9", "4YD", "6lg", "6BK", "4wh", "0LF", "ot", 
"bD", "0Av", "4zX", "4o9", "5Q4", "4Tt", "0oZ", "Lh", "Ci", "14r", "5KT", "6nV", "ajh", "41Q", "0Nw", "mE", "22l", "0CG", "4xi", "6MJ", 
"6cf", "4VE", "0mk", "NY", "07a", "2FJ", "69l", "4HG", "4fk", "6SH", "2hf", "1Md", "0Pu", "7O", "7NY", "bQh", "4Ew", "6pT", "0k8", "1nx", 
"05P", "Rj", "5O6", "4Jv", "4dZ", "453", "8N", "1OU", "0RD", "qv", "7Lh", "4ij", "4GF", "66m", "2IK", "1lI", "5kc", "6Na", "21G", "27", 
"8gX", "Mr", "74d", "4Un", "bbm", "79T", "1f0", "0cp", "397", "nn", "5s2", "42z", "4ys", "6LP", "ao", "366", "0lq", "OC", "76U", "bml", 
"4Zo", "6oL", "Bs", "0aA", "0Om", "2zN", "7QA", "40K", "7OC", "4jA", "0Qo", "6U", "3ZA", "1ob", "4Dm", "65F", "68v", "b7f", "0rs", "QA", 
"dSO", "8UG", "4gq", "5b1", "5m0", "4hp", "8ZF", "4d", "1x2", "09z", "727", "67w", "7nn", "4Kl", "04J", "Sp", "9T", "1NO", "51i", "6Pc", 
"6BO", "43d", "0LB", "op", "2WM", "0bn", "5Ia", "6lc", "5Q0", "4Tp", "8fF", "Ll", "1D2", "0Ar", "cPN", "aem", "ajl", "41U", "0Ns", "mA", 
"Cm", "14v", "5KP", "6nR", "6cb", "4VA", "0mo", "2XL", "22h", "0CC", "4xm", "6MN", "4fo", "6SL", "2hb", "8TY", "07e", "2FN", "69h", "4HC", 
"4Es", "64X", "d5E", "83M", "0Pq", "7K", "a0f", "bQl", "50w", "457", "8J", "1OQ", "05T", "Rn", "5O2", "4Jr", "4GB", "66i", "2IO", "08d", 
"1Ba", "5z", "7Ll", "4in", "0nD", "Mv", "7ph", "4Uj", "5kg", "6Ne", "cZ", "23", "0MX", "nj", "5s6", "4vv", "4XZ", "6my", "1f4", "0ct", 
"0lu", "OG", "6bx", "5Gz", "4yw", "6LT", "ak", "0BY", "0Oi", "2zJ", "6Ad", "40O", "4Zk", "6oH", "Bw", "0aE", "2Jd", "1of", "4Di", "65B", 
"7OG", "4jE", "g8", "6Q", "2ix", "1Lz", "4gu", "5b5", "68r", "4IY", "0rw", "QE", "1x6", "1mW", "4FX", "4S9", "5m4", "4ht", "0SZ", "ph", 
"9P", "h9", "4eD", "6Pg", "7nj", "4Kh", "04N", "St", "22u", "375", "4xp", "598", "77V", "blo", "0mr", "1h2", "Cp", "14k", "5KM", "6nO", 
"7PB", "41H", "0Nn", "3kl", "20D", "34", "4zA", "6Ob", "6aN", "4Tm", "0oC", "Lq", "AA", "0bs", "bcn", "78W", "569", "43y", "384", "om", 
"9Kd", "5g", "5l3", "4is", "734", "66t", "1y1", "08y", "05I", "Rs", "7om", "4Jo", "4dC", "7AA", "8W", "1OL", "0Pl", "7V", "ats", "4kB", 
"4En", "64E", "2Kc", "1na", "07x", "PB", "69u", "b6e", "4fr", "5c2", "dRL", "8TD", "4Zv", "6oU", "Bj", "0aX", "0Ot", "lF", "6Ay", "40R", 
"4yj", "6LI", "av", "0BD", "0lh", "OZ", "6be", "4WF", "4XG", "6md", "2VJ", "0ci", "0ME", "nw", "6CH", "42c", "5kz", "6Nx", "cG", "1PT", 
"0nY", "Mk", "5P7", "4Uw", "5N5", "4Ku", "04S", "Si", "9M", "1NV", "4eY", "440", "7Mk", "4hi", "0SG", "pu", "2HH", "K8", "4FE", "67n", 
"68o", "4ID", "1", "QX", "2ie", "1Lg", "4gh", "6RK", "7OZ", "4jX", "0Qv", "6L", "2Jy", "3O9", "4Dt", "5A4", "4C9", "4VX", "0mv", "ND", 
"22q", "0CZ", "4xt", "6MW", "7PF", "41L", "x9", "mX", "Ct", "14o", "5KI", "6nK", "6aJ", "4Ti", "0oG", "Lu", "bY", "30", "4zE", "6Of", 
"5r5", "4wu", "380", "oi", "AE", "0bw", "4YY", "4L8", "5Wz", "66p", "1y5", "1lT", "0RY", "5c", "5l7", "4iw", "4dG", "6Qd", "8S", "1OH", 
"05M", "Rw", "7oi", "4Jk", "4Ej", "64A", "2Kg", "1ne", "0Ph", "7R", "7ND", "4kF", "4fv", "5c6", "0H9", "1My", "0st", "PF", "69q", "4HZ", 
"0Op", "lB", "ako", "40V", "4Zr", "6oQ", "Bn", "15u", "0ll", "2YO", "6ba", "4WB", "4yn", "6LM", "ar", "1Ra", "0MA", "ns", "6CL", "42g", 
"4XC", "79I", "2VN", "0cm", "8gE", "Mo", "5P3", "4Us", "bAl", "adn", "cC", "1PP", "9I", "1NR", "51t", "444", "5N1", "4Kq", "04W", "Sm", 
"2HL", "09g", "4FA", "67j", "7Mo", "4hm", "0SC", "4y", "2ia", "1Lc", "4gl", "6RO", "68k", "5Ya", "5", "2GM", "d4F", "82N", "4Dp", "5A0", 
"a1e", "bPo", "0Qr", "6H", "Cx", "14c", "5KE", "6nG", "7PJ", "4uH", "x5", "mT", "0V7", "0CV", "4xx", "590", "4C5", "4VT", "0mz", "NH", 
"AI", "16R", "4YU", "4L4", "561", "43q", "0LW", "oe", "bU", "w4", "4zI", "6Oj", "6aF", "4Te", "0oK", "Ly", "05A", "2Dj", "7oe", "4Jg", 
"4dK", "6Qh", "2jF", "i6", "0RU", "5o", "7Ly", "5yZ", "4GW", "4R6", "1y9", "08q", "07p", "PJ", "7mT", "4HV", "4fz", "6SY", "0H5", "1Mu", 
"f7", "sV", "7NH", "4kJ", "4Ef", "64M", "2Kk", "1ni", "4yb", "6LA", "23g", "0BL", "Z3", "OR", "6bm", "4WN", "c4d", "aEO", "Bb", "0aP", 
"8Fd", "lN", "4a3", "40Z", "5kr", "4n2", "cO", "8Ie", "0nQ", "Mc", "74u", "615", "4XO", "6ml", "2VB", "U2", "0MM", "2xn", "7Sa", "42k", 
"7Mc", "4ha", "0SO", "4u", "3Xa", "K0", "4FM", "67f", "aTL", "b5F", "0pS", "Sa", "9E", "8Wg", "4eQ", "448", "7OR", "4jP", "254", "6D", 
"0j3", "1os", "cnn", "65W", "68g", "4IL", "9", "QP", "2im", "1Lo", "53I", "6RC", "7PN", "41D", "x1", "mP", "2Um", "14g", "5KA", "6nC", 
"4C1", "4VP", "19W", "NL", "0V3", "0CR", "bBO", "594", "565", "43u", "0LS", "oa", "AM", "16V", "4YQ", "4L0", "6aB", "4Ta", "0oO", "2Zl", 
"bQ", "38", "4zM", "6On", "4dO", "6Ql", "2jB", "i2", "05E", "2Dn", "7oa", "4Jc", "4GS", "4R2", "d7e", "08u", "0RQ", "5k", "a2F", "bSL", 
"52W", "ayO", "0H1", "1Mq", "07t", "PN", "69y", "4HR", "4Eb", "64I", "2Ko", "1nm", "f3", "7Z", "7NL", "4kN", "Z7", "OV", "6bi", "4WJ", 
"4yf", "6LE", "az", "0BH", "0Ox", "lJ", "4a7", "4tV", "4Zz", "6oY", "Bf", "0aT", "0nU", "Mg", "74q", "5EZ", "5kv", "4n6", "cK", "1PX", 
"0MI", "2xj", "6CD", "42o", "4XK", "6mh", "2VF", "U6", "2HD", "K4", "4FI", "67b", "7Mg", "4he", "0SK", "4q", "9A", "1NZ", "4eU", "4p4", 
"5N9", "4Ky", "0pW", "Se", "0j7", "1ow", "4Dx", "5A8", "7OV", "4jT", "0Qz", "rH", "2ii", "1Lk", "4gd", "6RG", "68c", "4IH", "D5", "QT", 
"5Ls", "4I3", "F", "13U", "0IP", "jb", "536", "46v", "5oo", "6Jm", "gR", "r3", "0jL", "3ON", "6dA", "4Qb", "5NB", "aAR", "2Pn", "0eM", 
"0Ka", "hS", "6El", "44G", "49w", "abN", "ec", "0FQ", "8ae", "KO", "4F2", "4SS", "4X0", "4MQ", "02w", "UM", "0M2", "0XS", "57T", "a8D", 
"7KO", "4nM", "c0", "2Y", "2Nl", "1kn", "aJ1", "61J", "6zC", "aE0", "00F", "2Am", "yP", "l1", "4aL", "6To", "a7E", "58U", "0WR", "0h", 
"ZL", "84n", "4BP", "4W1", "fH", "0Ez", "5nu", "4k5", "5U8", "4Px", "0kV", "Hd", "ET", "P5", "5Mi", "6hk", "6FG", "47l", "0HJ", "kx", 
"dy", "0GK", "48m", "6IF", "6gj", "4RI", "0ig", "JU", "Ge", "0dW", "5OX", "5Z9", "4d4", "4qU", "1ZZ", "iI", "0Ty", "3C", "4z6", "4oW", 
"5QZ", "60P", "Yg", "0zU", "A6", "TW", "6yh", "4LK", "4bg", "6WD", "2lj", "0YI", "0VH", "1r", "6XE", "4mf", "4CJ", "62a", "2MG", "N7", 
"0uT", "Vf", "7kx", "4Nz", "5pw", "4u7", "xJ", "1KY", "0IT", "jf", "532", "46r", "5Lw", "4I7", "B", "0gx", "0jH", "Iz", "6dE", "4Qf", 
"5ok", "6Ji", "gV", "r7", "0Ke", "hW", "6Eh", "44C", "5NF", "6kD", "2Pj", "0eI", "0hy", "KK", "4F6", "4SW", "49s", "6HX", "eg", "0FU", 
"0M6", "0XW", "4cy", "5f9", "4X4", "4MU", "02s", "UI", "Xy", "1kj", "5PD", "61N", "7KK", "4nI", "c4", "vU", "yT", "l5", "4aH", "6Tk", 
"6zG", "4Od", "00B", "Wx", "ZH", "0yz", "4BT", "4W5", "5i8", "4lx", "0WV", "0l", "71v", "646", "0kR", "3NP", "fL", "8Lf", "5nq", "4k1", 
"6FC", "47h", "0HN", "29e", "EP", "P1", "5Mm", "6ho", "6gn", "4RM", "0ic", "JQ", "26d", "0GO", "48i", "6IB", "4d0", "45Y", "8Cg", "iM", 
"Ga", "0dS", "beN", "hYu", "ckm", "60T", "Yc", "0zQ", "207", "3G", "4z2", "4oS", "4bc", "7Ga", "2ln", "0YM", "A2", "TS", "6yl", "4LO", 
"4CN", "62e", "2MC", "N3", "0VL", "1v", "6XA", "4mb", "5ps", "4u3", "xN", "8Rd", "01X", "Vb", "aQO", "b0E", "5og", "6Je", "gZ", "63", 
"0jD", "Iv", "6dI", "4Qj", "7l9", "6iy", "N", "0gt", "0IX", "jj", "5w6", "4rv", "5mV", "5x7", "ek", "0FY", "0hu", "KG", "6fx", "5Cz", 
"5NJ", "6kH", "Fw", "0eE", "92", "3nk", "6Ed", "44O", "7KG", "4nE", "c8", "2Q", "Xu", "1kf", "5PH", "61B", "4X8", "4MY", "0vw", "UE", 
"2mx", "1Hz", "4cu", "5f5", "5i4", "4lt", "0WZ", "th", "ZD", "0yv", "4BX", "4W9", "6zK", "4Oh", "00N", "Wt", "yX", "l9", "4aD", "6Tg", 
"2SM", "0fn", "5Ma", "6hc", "6FO", "47d", "0HB", "kp", "24Y", "0Er", "bDo", "aam", "5U0", "4Pp", "8bF", "Hl", "Gm", "10v", "5OP", "5Z1", 
"anl", "45U", "0Js", "iA", "dq", "0GC", "48e", "6IN", "6gb", "4RA", "0io", "3Lm", "03e", "2BN", "7iA", "4LC", "4bo", "6WL", "zs", "0YA", 
"0Tq", "3K", "a4f", "bUl", "4As", "5D3", "Yo", "87M", "01T", "Vn", "5K2", "4Nr", "54w", "417", "xB", "1KQ", "1Fa", "1z", "6XM", "4mn", 
"4CB", "62i", "2MO", "0xl", "1za", "Ir", "6dM", "4Qn", "5oc", "6Ja", "25G", "67", "9Pe", "jn", "5w2", "46z", "bfm", "aCo", "J", "0gp", 
"0hq", "KC", "72U", "bil", "5mR", "5x3", "eo", "326", "96", "3no", "7UA", "44K", "5NN", "6kL", "Fs", "0eA", "Xq", "1kb", "5PL", "61F", 
"7KC", "4nA", "0Uo", "2U", "39U", "8QG", "4cq", "5f1", "aRl", "796", "0vs", "UA", "2LQ", "0yr", "767", "63w", "5i0", "4lp", "9Ng", "0d", 
"2oM", "0Zn", "55i", "6Tc", "6zO", "4Ol", "00J", "Wp", "6FK", "4sh", "0HF", "kt", "EX", "P9", "5Me", "6hg", "5U4", "4Pt", "0kZ", "Hh", 
"fD", "0Ev", "5ny", "4k9", "4d8", "45Q", "0Jw", "iE", "Gi", "10r", "5OT", "5Z5", "6gf", "4RE", "0ik", "JY", "du", "0GG", "48a", "6IJ", 
"4bk", "6WH", "zw", "0YE", "03a", "2BJ", "6yd", "4LG", "4Aw", "5D7", "Yk", "0zY", "0Tu", "3O", "6Zx", "bUh", "54s", "413", "xF", "1KU", 
"01P", "Vj", "5K6", "4Nv", "4CF", "62m", "2MK", "0xh", "0VD", "uv", "6XI", "4mj", "5NS", "6kQ", "Fn", "11u", "0Kp", "hB", "aoo", "44V", 
"49f", "6HM", "er", "1Va", "0hl", "3Mn", "6fa", "4SB", "5Lb", "7yA", "W", "0gm", "0IA", "js", "6GL", "46g", "bEl", "hyW", "gC", "0Dq", 
"8cE", "Io", "5T3", "4Qs", "5J1", "4Oq", "00W", "Wm", "yA", "0Zs", "55t", "404", "6YN", "4lm", "0WC", "0y", "2LL", "0yo", "4BA", "63j", 
"6xc", "bws", "02f", "2CM", "2ma", "0XB", "4cl", "6VO", "a5e", "bTo", "0Ur", "2H", "Xl", "86N", "5PQ", "5E0", "dh", "0GZ", "5lU", "5y4", 
"4G9", "4RX", "0iv", "JD", "Gt", "0dF", "5OI", "6jK", "6Dg", "45L", "81", "iX", "fY", "70", "5nd", "6Kf", "6eJ", "4Pi", "0kG", "Hu", 
"EE", "0fw", "5Mx", "4H8", "5v5", "4su", "1Xz", "ki", "0VY", "1c", "5h7", "4mw", "5Sz", "62p", "2MV", "0xu", "01M", "Vw", "7ki", "4Nk", 
"54n", "6Ud", "2nJ", "1KH", "0Th", "3R", "6Ze", "4oF", "4Aj", "60A", "Yv", "0zD", "0wt", "TF", "6yy", "4LZ", "4bv", "5g6", "zj", "0YX", 
"0Kt", "hF", "6Ey", "44R", "5NW", "6kU", "Fj", "0eX", "0hh", "KZ", "6fe", "4SF", "49b", "6HI", "ev", "0FD", "0IE", "jw", "6GH", "46c", 
"5Lf", "6id", "S", "0gi", "0jY", "Ik", "5T7", "4Qw", "5oz", "6Jx", "gG", "0Du", "yE", "0Zw", "4aY", "400", "5J5", "4Ou", "00S", "Wi", 
"ZY", "O8", "4BE", "63n", "6YJ", "4li", "0WG", "tu", "2me", "0XF", "4ch", "6VK", "6xg", "4MD", "02b", "UX", "Xh", "3K9", "5PU", "5E4", 
"7KZ", "4nX", "0Uv", "2L", "73V", "bho", "0ir", "1l2", "dl", "335", "48x", "5y0", "6Dc", "45H", "85", "3ol", "Gp", "0dB", "5OM", "6jO", 
"6eN", "4Pm", "0kC", "Hq", "24D", "74", "bDr", "6Kb", "529", "47y", "8AG", "km", "EA", "0fs", "bgn", "aBl", "774", "62t", "199", "0xq", 
"9Od", "1g", "5h3", "4ms", "54j", "7EA", "2nN", "1KL", "01I", "Vs", "7km", "4No", "4An", "60E", "Yr", "1ja", "0Tl", "3V", "6Za", "4oB", 
"4br", "5g2", "zn", "8PD", "03x", "TB", "aSo", "785", "49n", "6HE", "ez", "0FH", "0hd", "KV", "6fi", "4SJ", "bdI", "6kY", "Ff", "0eT", 
"0Kx", "hJ", "4e7", "4pV", "5ov", "4j6", "gK", "0Dy", "0jU", "Ig", "6dX", "5AZ", "5Lj", "6ih", "DW", "Q6", "0II", "28b", "6GD", "46o", 
"6YF", "4le", "0WK", "0q", "ZU", "O4", "4BI", "63b", "5J9", "4Oy", "0tW", "We", "yI", "1JZ", "4aU", "4t4", "7KV", "4nT", "0Uz", "vH", 
"Xd", "1kw", "5PY", "5E8", "6xk", "4MH", "02n", "UT", "2mi", "0XJ", "4cd", "6VG", "2Qm", "0dN", "5OA", "6jC", "6Do", "45D", "89", "iP", 
"0R3", "0GR", "48t", "acM", "4G1", "4RP", "94O", "JL", "EM", "12V", "5Mp", "4H0", "525", "47u", "0HS", "ka", "fQ", "78", "5nl", "6Kn", 
"6eB", "4Pa", "0kO", "3NM", "01E", "3PO", "7ka", "4Nc", "54f", "6Ul", "xS", "m2", "0VQ", "1k", "a6F", "59V", "4CS", "4V2", "195", "85m", 
"03t", "TN", "4Y3", "4LR", "56W", "a9G", "zb", "0YP", "b3", "3Z", "6Zm", "4oN", "4Ab", "60I", "2Oo", "0zL", "1xA", "KR", "6fm", "4SN", 
"49j", "6HA", "27g", "0FL", "8Bd", "hN", "4e3", "44Z", "bdM", "aAO", "Fb", "0eP", "0jQ", "Ic", "70u", "655", "5or", "4j2", "gO", "8Me", 
"0IM", "28f", "7Wa", "46k", "5Ln", "6il", "DS", "Q2", "ZQ", "O0", "4BM", "63f", "6YB", "4la", "0WO", "0u", "yM", "8Sg", "4aQ", "408", 
"aPL", "b1F", "0tS", "Wa", "0n3", "1ks", "bzO", "61W", "7KR", "4nP", "214", "2D", "2mm", "0XN", "57I", "6VC", "6xo", "4ML", "02j", "UP", 
"6Dk", "4qH", "0Jf", "iT", "Gx", "0dJ", "5OE", "6jG", "4G5", "4RT", "0iz", "JH", "dd", "0GV", "48p", "5y8", "521", "47q", "0HW", "ke", 
"EI", "12R", "5Mt", "4H4", "6eF", "4Pe", "0kK", "Hy", "fU", "s4", "5nh", "6Kj", "54b", "6Uh", "xW", "m6", "01A", "3PK", "7ke", "4Ng", 
"4CW", "4V6", "191", "0xy", "0VU", "1o", "6XX", "59R", "4bz", "6WY", "zf", "0YT", "03p", "TJ", "4Y7", "4LV", "4Af", "60M", "Yz", "0zH", 
"b7", "wV", "6Zi", "4oJ", "5H3", "4Ms", "02U", "Uo", "2mR", "0Xq", "57v", "426", "7Km", "4no", "0UA", "vs", "2NN", "1kL", "5Pb", "61h", 
"6za", "4OB", "00d", "2AO", "yr", "1Ja", "4an", "6TM", "a7g", "58w", "0Wp", "0J", "Zn", "84L", "4Br", "5G2", "5LQ", "5Y0", "d", "13w", 
"0Ir", "1L2", "amm", "46T", "5oM", "6JO", "gp", "0DB", "0jn", "3Ol", "6dc", "5Aa", "bdr", "6kb", "2PL", "0eo", "0KC", "hq", "6EN", "44e", 
"49U", "abl", "eA", "0Fs", "8aG", "Km", "5V1", "4Sq", "1Dz", "3a", "5j5", "4ou", "4AY", "4T8", "YE", "0zw", "03O", "Tu", "6yJ", "4Li", 
"4bE", "6Wf", "zY", "o8", "0Vj", "1P", "6Xg", "4mD", "4Ch", "62C", "2Me", "0xF", "0uv", "VD", "7kZ", "4NX", "5pU", "5e4", "xh", "3k9", 
"fj", "0EX", "5nW", "6KU", "6ey", "4PZ", "0kt", "HF", "Ev", "0fD", "5MK", "6hI", "6Fe", "47N", "0Hh", "kZ", "26B", "52", "48O", "6Id", 
"6gH", "4Rk", "0iE", "Jw", "GG", "0du", "5Oz", "6jx", "5t7", "4qw", "0JY", "ik", "2mV", "0Xu", "57r", "422", "5H7", "4Mw", "02Q", "Uk", 
"2NJ", "1kH", "5Pf", "61l", "7Ki", "4nk", "0UE", "vw", "yv", "0ZD", "4aj", "6TI", "6ze", "4OF", "0th", "WZ", "Zj", "0yX", "4Bv", "5G6", 
"6Yy", "4lZ", "0Wt", "0N", "0Iv", "jD", "4g9", "46P", "5LU", "5Y4", "Dh", "0gZ", "0jj", "IX", "6dg", "4QD", "5oI", "6JK", "gt", "0DF", 
"0KG", "hu", "6EJ", "44a", "5Nd", "6kf", "FY", "S8", "1xz", "Ki", "5V5", "4Su", "49Q", "4h8", "eE", "0Fw", "756", "60v", "YA", "0zs", 
"9Mf", "3e", "5j1", "4oq", "4bA", "6Wb", "2lL", "0Yo", "03K", "Tq", "6yN", "4Lm", "4Cl", "62G", "2Ma", "0xB", "0Vn", "1T", "6Xc", "59i", 
"54Y", "5e0", "xl", "8RF", "01z", "1p2", "aQm", "b0g", "71T", "bjm", "0kp", "HB", "fn", "317", "5nS", "6KQ", "6Fa", "47J", "0Hl", "29G", 
"Er", "12i", "5MO", "6hM", "6gL", "4Ro", "0iA", "Js", "26F", "56", "48K", "7YA", "5t3", "4qs", "8CE", "io", "GC", "0dq", "bel", "hYW", 
"7Ke", "4ng", "0UI", "2s", "XW", "M6", "5Pj", "6uh", "6xX", "6m9", "0vU", "Ug", "2mZ", "0Xy", "4cW", "4v6", "4y7", "4lV", "0Wx", "0B", 
"Zf", "0yT", "4Bz", "63Q", "6zi", "4OJ", "B7", "WV", "yz", "0ZH", "4af", "6TE", "5oE", "6JG", "gx", "0DJ", "0jf", "IT", "6dk", "4QH", 
"5LY", "5Y8", "l", "0gV", "0Iz", "jH", "4g5", "4rT", "5mt", "4h4", "eI", "1VZ", "0hW", "Ke", "5V9", "4Sy", "5Nh", "6kj", "FU", "S4", 
"0KK", "hy", "6EF", "44m", "03G", "2Bl", "6yB", "4La", "4bM", "6Wn", "zQ", "o0", "0TS", "3i", "a4D", "bUN", "4AQ", "4T0", "YM", "87o", 
"01v", "VL", "7kR", "4NP", "54U", "hft", "0N3", "1Ks", "0Vb", "1X", "6Xo", "4mL", "5SA", "62K", "2Mm", "0xN", "2So", "0fL", "5MC", "6hA", 
"6Fm", "47F", "1XA", "kR", "fb", "0EP", "bDM", "aaO", "4E3", "4PR", "8bd", "HN", "GO", "10T", "5Or", "4J2", "507", "45w", "0JQ", "ic", 
"dS", "q2", "48G", "6Il", "73i", "4Rc", "0iM", "3LO", "XS", "M2", "5Pn", "61d", "7Ka", "4nc", "0UM", "2w", "39w", "8Qe", "4cS", "4v2", 
"aRN", "b3D", "02Y", "Uc", "Zb", "0yP", "bxM", "63U", "4y3", "4lR", "236", "0F", "2oo", "0ZL", "4ab", "6TA", "6zm", "4ON", "B3", "WR", 
"0jb", "IP", "6do", "4QL", "5oA", "6JC", "25e", "0DN", "9PG", "jL", "4g1", "46X", "686", "aCM", "h", "0gR", "0hS", "Ka", "72w", "677", 
"49Y", "4h0", "eM", "8Og", "0KO", "3nM", "6EB", "44i", "5Nl", "6kn", "FQ", "S0", "4bI", "6Wj", "zU", "o4", "03C", "Ty", "6yF", "4Le", 
"4AU", "4T4", "YI", "1jZ", "0TW", "3m", "5j9", "4oy", "54Q", "5e8", "xd", "1Kw", "01r", "VH", "7kV", "4NT", "4Cd", "62O", "2Mi", "0xJ", 
"0Vf", "uT", "6Xk", "4mH", "6Fi", "47B", "0Hd", "kV", "Ez", "0fH", "5MG", "6hE", "4E7", "4PV", "0kx", "HJ", "ff", "0ET", "bDI", "6KY", 
"503", "45s", "0JU", "ig", "GK", "0dy", "5Ov", "4J6", "6gD", "4Rg", "0iI", "3LK", "dW", "q6", "48C", "6Ih", "4Z2", "4OS", "00u", "WO", 
"yc", "0ZQ", "55V", "hgw", "6Yl", "4lO", "a2", "tS", "2Ln", "0yM", "4Bc", "63H", "6xA", "4Mb", "02D", "2Co", "2mC", "n3", "4cN", "6Vm", 
"a5G", "bTM", "0UP", "2j", "XN", "86l", "5Ps", "4U3", "5Nq", "4K1", "FL", "11W", "0KR", "3nP", "514", "44t", "49D", "6Ho", "eP", "49", 
"0hN", "3ML", "6fC", "5CA", "aV1", "6iB", "u", "0gO", "0Ic", "jQ", "6Gn", "46E", "bEN", "hyu", "ga", "0DS", "8cg", "IM", "4D0", "4QQ", 
"1FZ", "1A", "4x4", "4mU", "4Cy", "5F9", "0m6", "0xW", "C4", "VU", "7kK", "4NI", "54L", "6UF", "xy", "1Kj", "0TJ", "3p", "6ZG", "4od", 
"4AH", "60c", "YT", "L5", "0wV", "Td", "5I8", "4Lx", "4bT", "4w5", "zH", "0Yz", "dJ", "0Gx", "5lw", "4i7", "6gY", "4Rz", "0iT", "Jf", 
"GV", "R7", "5Ok", "6ji", "6DE", "45n", "0JH", "iz", "24b", "0EI", "5nF", "6KD", "6eh", "4PK", "0ke", "HW", "Eg", "0fU", "5MZ", "6hX", 
"4f6", "4sW", "0Hy", "kK", "yg", "0ZU", "55R", "6TX", "4Z6", "4OW", "00q", "WK", "2Lj", "0yI", "4Bg", "63L", "6Yh", "4lK", "a6", "tW", 
"2mG", "n7", "4cJ", "6Vi", "6xE", "4Mf", "0vH", "Uz", "XJ", "1kY", "5Pw", "4U7", "7Kx", "4nz", "0UT", "2n", "0KV", "hd", "510", "44p", 
"5Nu", "4K5", "FH", "0ez", "0hJ", "Kx", "6fG", "4Sd", "5mi", "6Hk", "eT", "p5", "0Ig", "jU", "6Gj", "46A", "5LD", "6iF", "q", "0gK", 
"1zZ", "II", "4D4", "4QU", "5oX", "5z9", "ge", "0DW", "byN", "62V", "0m2", "0xS", "225", "1E", "4x0", "4mQ", "54H", "6UB", "2nl", "1Kn", 
"C0", "VQ", "7kO", "4NM", "4AL", "60g", "YP", "L1", "0TN", "3t", "6ZC", "ae0", "4bP", "439", "zL", "8Pf", "03Z", "0b3", "aSM", "b2G", 
"73t", "664", "0iP", "Jb", "dN", "8Nd", "48Z", "4i3", "6DA", "45j", "0JL", "3oN", "GR", "R3", "5Oo", "6jm", "6el", "4PO", "0ka", "HS", 
"24f", "0EM", "5nB", "aaR", "4f2", "4sS", "8Ae", "kO", "Ec", "0fQ", "695", "aBN", "6Yd", "4lG", "0Wi", "0S", "Zw", "0yE", "4Bk", "6wH", 
"6zx", "buh", "0tu", "WG", "yk", "0ZY", "4aw", "5d7", "5k6", "4nv", "0UX", "2b", "XF", "1kU", "741", "61q", "6xI", "4Mj", "02L", "Uv", 
"2mK", "0Xh", "4cF", "6Ve", "49L", "6Hg", "eX", "41", "0hF", "Kt", "6fK", "4Sh", "5Ny", "4K9", "FD", "0ev", "0KZ", "hh", "5u4", "4pt", 
"5oT", "5z5", "gi", "1Tz", "0jw", "IE", "4D8", "4QY", "5LH", "6iJ", "Du", "0gG", "0Ik", "jY", "6Gf", "46M", "01g", "3Pm", "7kC", "4NA", 
"54D", "6UN", "xq", "1Kb", "0Vs", "1I", "a6d", "59t", "4Cq", "5F1", "d3G", "85O", "03V", "Tl", "5I0", "4Lp", "56u", "435", "2lQ", "0Yr", 
"0TB", "3x", "6ZO", "4ol", "5Qa", "60k", "2OM", "0zn", "2QO", "0dl", "5Oc", "6ja", "6DM", "45f", "1Za", "ir", "dB", "0Gp", "48V", "aco", 
"5W2", "4Rr", "94m", "Jn", "Eo", "12t", "5MR", "5X3", "aln", "47W", "0Hq", "kC", "fs", "0EA", "5nN", "6KL", "71I", "4PC", "0km", "3No", 
"Zs", "0yA", "4Bo", "63D", "7IA", "4lC", "0Wm", "0W", "yo", "8SE", "4as", "5d3", "aPn", "b1d", "00y", "WC", "XB", "1kQ", "745", "61u", 
"5k2", "4nr", "9Le", "2f", "2mO", "0Xl", "4cB", "6Va", "6xM", "4Mn", "02H", "Ur", "0hB", "Kp", "6fO", "4Sl", "49H", "6Hc", "27E", "45", 
"8BF", "hl", "518", "44x", "bdo", "aAm", "2PQ", "0er", "0js", "IA", "70W", "bkn", "5oP", "5z1", "gm", "304", "0Io", "28D", "6Gb", "46I", 
"5LL", "6iN", "y", "0gC", "5pH", "6UJ", "xu", "1Kf", "C8", "VY", "7kG", "4NE", "4Cu", "5F5", "2Mx", "1hz", "0Vw", "1M", "4x8", "4mY", 
"4bX", "431", "zD", "0Yv", "03R", "Th", "5I4", "4Lt", "4AD", "60o", "YX", "L9", "0TF", "wt", "6ZK", "4oh", "6DI", "45b", "0JD", "iv", 
"GZ", "0dh", "5Og", "6je", "5W6", "4Rv", "0iX", "Jj", "dF", "0Gt", "48R", "6Iy", "6Fx", "47S", "0Hu", "kG", "Ek", "0fY", "5MV", "5X7", 
"6ed", "4PG", "0ki", "3Nk", "fw", "0EE", "5nJ", "6KH", "356", "bo", "6OP", "4zs", "bnl", "75U", "LC", "0oq", "0bA", "As", "6lL", "4Yo", 
"43K", "7RA", "2yN", "0Lm", "17", "22G", "6Ma", "4xB", "4Vn", "6cM", "Nr", "19i", "14Y", "CB", "aDo", "bam", "41z", "5p2", "mn", "8GD", 
"7d", "8YF", "4kp", "5n0", "64w", "717", "1nS", "2KQ", "Pp", "07J", "4Hl", "69G", "6Sc", "52i", "1MO", "2hM", "5U", "0Ro", "4iA", "7LC", 
"66F", "4Gm", "08K", "3YA", "RA", "0qs", "b4f", "aUl", "5a1", "4dq", "8VG", "8e", "6mV", "4Xu", "17r", "022", "nE", "0Mw", "42Q", "4c8", 
"6NJ", "5kH", "1Pf", "cu", "MY", "X8", "4UE", "74O", "6og", "4ZD", "W9", "BX", "lt", "0OF", "4th", "6AK", "4l9", "4yX", "0Bv", "aD", 
"Oh", "0lZ", "4Wt", "5R4", "4Iv", "5L6", "Qj", "06P", "1LU", "1Y4", "463", "4gZ", "4jj", "7Oh", "rv", "0QD", "1oI", "2JK", "65m", "4DF", 
"4KG", "7nE", "2EJ", "04a", "1Nd", "2kf", "6PH", "4ek", "5xz", "492", "4O", "0Su", "09Q", "0h8", "5C7", "4Fw", "5Dz", "6ax", "LG", "0ou", 
"0AY", "bk", "6OT", "4zw", "43O", "6Bd", "2yJ", "0Li", "0bE", "Aw", "6lH", "4Yk", "4Vj", "6cI", "Nv", "0mD", "13", "22C", "6Me", "4xF", 
"4uv", "5p6", "mj", "0NX", "1pU", "CF", "6ny", "7k9", "4P9", "4EX", "1nW", "2KU", "sh", "0PZ", "4kt", "5n4", "6Sg", "4fD", "k9", "2hI", 
"Pt", "07N", "4Hh", "69C", "66B", "4Gi", "08O", "2Id", "5Q", "d8", "4iE", "7LG", "5a5", "4du", "1Oz", "8a", "RE", "0qw", "4JY", "aUh", 
"nA", "0Ms", "42U", "ail", "6mR", "4Xq", "17v", "026", "3Km", "0no", "4UA", "74K", "6NN", "5kL", "1Pb", "cq", "lp", "0OB", "40d", "6AO", 
"6oc", "5Ja", "0an", "2TM", "Ol", "18w", "4Wp", "5R0", "afm", "bCo", "0Br", "1G2", "1LQ", "1Y0", "467", "53w", "4Ir", "5L2", "Qn", "06T", 
"1oM", "2JO", "65i", "4DB", "4jn", "7Ol", "6z", "1Aa", "8WY", "2kb", "6PL", "4eo", "4KC", "7nA", "2EN", "04e", "09U", "d6E", "5C3", "4Fs", 
"bRl", "496", "4K", "0Sq", "0bI", "2Wj", "6lD", "4Yg", "43C", "6Bh", "oW", "z6", "0AU", "bg", "6OX", "5jZ", "4TW", "4A6", "LK", "0oy", 
"14Q", "CJ", "4N7", "5Kw", "41r", "542", "mf", "0NT", "u7", "22O", "6Mi", "4xJ", "4Vf", "6cE", "Nz", "0mH", "Px", "07B", "4Hd", "69O", 
"6Sk", "4fH", "k5", "2hE", "7l", "0PV", "4kx", "5n8", "4P5", "4ET", "83j", "2KY", "RI", "05s", "4JU", "7oW", "5a9", "4dy", "1Ov", "8m", 
"qU", "d4", "4iI", "7LK", "66N", "4Ge", "08C", "2Ih", "6NB", "a59", "1Pn", "21d", "MQ", "X0", "4UM", "74G", "79w", "bbN", "0cS", "0v2", 
"nM", "8Dg", "42Y", "4c0", "4l1", "4yP", "8Kf", "aL", "0y3", "0lR", "636", "76v", "6oo", "4ZL", "W1", "BP", "2zm", "0ON", "40h", "6AC", 
"4jb", "auS", "6v", "0QL", "I3", "2JC", "65e", "4DN", "b7E", "68U", "Qb", "06X", "286", "dSl", "4r3", "4gR", "4hS", "7MQ", "4G", "277", 
"09Y", "0h0", "67T", "b8D", "4KO", "7nM", "SS", "F2", "1Nl", "9w", "azR", "4ec", "43G", "6Bl", "oS", "z2", "0bM", "2Wn", "78i", "4Yc", 
"4TS", "4A2", "LO", "8fe", "0AQ", "bc", "aeN", "cPm", "41v", "546", "mb", "0NP", "14U", "CN", "4N3", "5Ks", "4Vb", "6cA", "2Xo", "0mL", 
"u3", "22K", "6Mm", "4xN", "6So", "4fL", "k1", "2hA", "2Fm", "07F", "5XA", "69K", "4P1", "4EP", "83n", "d5f", "7h", "0PR", "bQO", "a0E", 
"hbu", "50T", "1Or", "8i", "RM", "05w", "4JQ", "7oS", "66J", "4Ga", "08G", "2Il", "5Y", "d0", "4iM", "7LO", "MU", "X4", "4UI", "74C", 
"6NF", "5kD", "1Pj", "cy", "nI", "2m9", "4vU", "4c4", "6mZ", "4Xy", "0cW", "0v6", "Od", "0lV", "4Wx", "5R8", "4l5", "4yT", "0Bz", "aH", 
"lx", "0OJ", "40l", "6AG", "6ok", "4ZH", "W5", "BT", "I7", "2JG", "65a", "4DJ", "4jf", "7Od", "6r", "0QH", "1LY", "1Y8", "4r7", "4gV", 
"4Iz", "68Q", "Qf", "0rT", "1mt", "0h4", "67P", "5VZ", "4hW", "7MU", "4C", "0Sy", "1Nh", "9s", "6PD", "4eg", "4KK", "7nI", "SW", "F6", 
"8Je", "22V", "4m2", "4xS", "625", "77u", "Nc", "0mQ", "V2", "CS", "6nl", "5Kn", "41k", "7Pa", "3kO", "0NM", "0AL", "20g", "6OA", "4zb", 
"4TN", "6am", "LR", "Y3", "0bP", "Ab", "78t", "bcM", "43Z", "4b3", "oN", "8Ed", "5D", "264", "4iP", "489", "66W", "b9G", "08Z", "0i3", 
"RP", "G1", "4JL", "7oN", "6QC", "50I", "1Oo", "8t", "7u", "0PO", "4ka", "7Nc", "64f", "4EM", "H0", "963", "Pa", "0sS", "b6F", "69V", 
"478", "4fQ", "295", "dRo", "4O4", "4ZU", "15R", "BI", "le", "0OW", "40q", "551", "6Lj", "4yI", "t4", "aU", "Oy", "0lK", "4We", "6bF", 
"6mG", "4Xd", "0cJ", "2Vi", "nT", "0Mf", "4vH", "6Ck", "adI", "5kY", "1Pw", "cd", "MH", "0nz", "4UT", "7pV", "4KV", "7nT", "SJ", "04p", 
"1Nu", "9n", "6PY", "4ez", "4hJ", "7MH", "pV", "e7", "1mi", "2Hk", "67M", "4Ff", "4Ig", "68L", "2Gj", "06A", "j6", "2iF", "6Rh", "4gK", 
"5zZ", "7Oy", "6o", "0QU", "1oX", "1z9", "4Q6", "4DW", "5FZ", "6cX", "Ng", "0mU", "0Cy", "1F9", "4m6", "4xW", "41o", "7Pe", "3kK", "0NI", 
"V6", "CW", "6nh", "5Kj", "4TJ", "6ai", "LV", "Y7", "0AH", "bz", "6OE", "4zf", "4wV", "4b7", "oJ", "0Lx", "0bT", "Af", "6lY", "4Yz", 
"5B8", "4Gx", "1lw", "0i7", "qH", "0Rz", "4iT", "7LV", "6QG", "4dd", "1Ok", "8p", "RT", "G5", "4JH", "7oJ", "64b", "4EI", "H4", "2KD", 
"7q", "0PK", "4ke", "7Ng", "4s4", "4fU", "1MZ", "2hX", "Pe", "0sW", "4Hy", "5M9", "la", "0OS", "40u", "555", "4O0", "4ZQ", "15V", "BM", 
"2Yl", "0lO", "4Wa", "6bB", "6Ln", "4yM", "08", "aQ", "nP", "0Mb", "42D", "6Co", "6mC", "5HA", "0cN", "2Vm", "ML", "8gf", "4UP", "74Z", 
"adM", "bAO", "1Ps", "0U3", "1Nq", "9j", "azO", "51W", "4KR", "7nP", "SN", "04t", "09D", "2Ho", "67I", "4Fb", "4hN", "7ML", "4Z", "e3", 
"j2", "2iB", "6Rl", "4gO", "4Ic", "68H", "2Gn", "06E", "82m", "d4e", "4Q2", "4DS", "bPL", "a1F", "6k", "0QQ", "1pH", "2UJ", "6nd", "5Kf", 
"41c", "7Pi", "mw", "0NE", "0Cu", "1F5", "6Mx", "5hz", "4Vw", "5S7", "Nk", "0mY", "0bX", "Aj", "6lU", "4Yv", "43R", "6By", "oF", "0Lt", 
"0AD", "bv", "6OI", "4zj", "4TF", "6ae", "LZ", "0oh", "RX", "G9", "4JD", "7oF", "6QK", "4dh", "1Og", "2je", "5L", "0Rv", "4iX", "481", 
"5B4", "4Gt", "08R", "2Iy", "Pi", "07S", "4Hu", "5M5", "470", "4fY", "1MV", "1X7", "su", "0PG", "4ki", "7Nk", "64n", "4EE", "H8", "2KH", 
"6Lb", "4yA", "04", "23D", "Oq", "0lC", "4Wm", "6bN", "aEl", "c4G", "0as", "BA", "lm", "8FG", "40y", "559", "6NS", "5kQ", "345", "cl", 
"1k2", "0nr", "boo", "74V", "6mO", "4Xl", "0cB", "2Va", "2xM", "0Mn", "42H", "6Cc", "4hB", "aws", "4V", "0Sl", "09H", "2Hc", "67E", "4Fn", 
"b5e", "aTo", "SB", "04x", "8WD", "9f", "6PQ", "4er", "4js", "5o3", "6g", "8XE", "1oP", "1z1", "65t", "704", "4Io", "68D", "Qs", "06I", 
"1LL", "2iN", "7BA", "4gC", "41g", "7Pm", "ms", "0NA", "14D", "2UN", "aDr", "5Kb", "4Vs", "5S3", "No", "19t", "0Cq", "1F1", "agn", "bBl", 
"43V", "aho", "oB", "0Lp", "16u", "An", "6lQ", "4Yr", "4TB", "6aa", "2ZO", "0ol", "1Qa", "br", "6OM", "4zn", "6QO", "4dl", "1Oc", "8x", 
"2DM", "05f", "5Za", "7oB", "5B0", "4Gp", "08V", "d7F", "5H", "0Rr", "bSo", "485", "474", "52t", "1MR", "1X3", "Pm", "07W", "4Hq", "5M1", 
"64j", "4EA", "1nN", "2KL", "7y", "0PC", "4km", "7No", "Ou", "0lG", "4Wi", "6bJ", "6Lf", "4yE", "00", "aY", "li", "8FC", "4tu", "5q5", 
"4O8", "4ZY", "0aw", "BE", "MD", "0nv", "4UX", "74R", "6NW", "5kU", "341", "ch", "nX", "0Mj", "42L", "6Cg", "6mK", "4Xh", "0cF", "2Ve", 
"09L", "2Hg", "67A", "4Fj", "4hF", "7MD", "4R", "0Sh", "1Ny", "9b", "6PU", "4ev", "4KZ", "7nX", "SF", "0pt", "1oT", "1z5", "65p", "5Tz", 
"4jw", "5o7", "6c", "0QY", "1LH", "2iJ", "6Rd", "4gG", "4Ik", "7li", "Qw", "06M", "7F", "246", "4kR", "7NP", "64U", "col", "1nq", "0k1", 
"PR", "E3", "4HN", "69e", "6SA", "4fb", "1Mm", "2ho", "5w", "0RM", "4ic", "7La", "66d", "4GO", "J2", "2IB", "Rc", "05Y", "b4D", "aUN", 
"4q2", "4dS", "8Ve", "8G", "8Hg", "bM", "4o0", "4zQ", "607", "75w", "La", "0oS", "T0", "AQ", "6ln", "4YM", "43i", "6BB", "2yl", "0LO", 
"0CN", "22e", "6MC", "5hA", "4VL", "6co", "NP", "0mb", "1ps", "0u3", "aDM", "baO", "41X", "7PR", "mL", "8Gf", "4IT", "7lV", "QH", "06r", 
"1Lw", "0I7", "5b8", "4gx", "4jH", "7OJ", "rT", "g5", "1ok", "2Ji", "65O", "4Dd", "4Ke", "7ng", "Sy", "04C", "h4", "2kD", "6Pj", "4eI", 
"4hy", "5m9", "4m", "0SW", "09s", "2HX", "4S4", "4FU", "4M6", "4XW", "0cy", "1f9", "ng", "0MU", "42s", "573", "6Nh", "5kj", "v6", "cW", 
"3KK", "0nI", "4Ug", "74m", "6oE", "4Zf", "0aH", "Bz", "lV", "y7", "40B", "6Ai", "582", "4yz", "0BT", "af", "OJ", "0lx", "4WV", "4B7", 
"64Q", "4Ez", "1nu", "0k5", "7B", "0Px", "4kV", "7NT", "6SE", "4ff", "1Mi", "2hk", "PV", "E7", "4HJ", "69a", "6rh", "4GK", "J6", "2IF", 
"5s", "0RI", "4ig", "7Le", "4q6", "4dW", "1OX", "8C", "Rg", "0qU", "5ZZ", "7oy", "4Ty", "5Q9", "Le", "0oW", "1QZ", "bI", "4o4", "4zU", 
"43m", "6BF", "oy", "0LK", "T4", "AU", "6lj", "4YI", "4VH", "6ck", "NT", "0mf", "0CJ", "22a", "6MG", "4xd", "4uT", "7PV", "mH", "0Nz", 
"1pw", "Cd", "aDI", "5KY", "1Ls", "0I3", "axM", "53U", "4IP", "7lR", "QL", "06v", "1oo", "2Jm", "65K", "5TA", "4jL", "7ON", "6X", "g1", 
"h0", "9Y", "6Pn", "4eM", "4Ka", "7nc", "2El", "04G", "09w", "d6g", "4S0", "4FQ", "bRN", "a3D", "4i", "0SS", "nc", "0MQ", "42w", "577", 
"4M2", "4XS", "17T", "dlm", "3KO", "0nM", "4Uc", "74i", "6Nl", "5kn", "v2", "cS", "lR", "y3", "40F", "6Am", "6oA", "4Zb", "0aL", "2To", 
"ON", "18U", "4WR", "4B3", "586", "bCM", "0BP", "ab", "PZ", "0sh", "4HF", "69m", "6SI", "4fj", "1Me", "2hg", "7N", "0Pt", "4kZ", "7NX", 
"6pU", "4Ev", "1ny", "0k9", "Rk", "05Q", "4Jw", "5O7", "452", "50r", "1OT", "8O", "qw", "0RE", "4ik", "7Li", "66l", "4GG", "08a", "2IJ", 
"T8", "AY", "6lf", "4YE", "43a", "6BJ", "ou", "0LG", "0Aw", "bE", "4o8", "4zY", "4Tu", "5Q5", "Li", "8fC", "14s", "Ch", "6nW", "5KU", 
"41P", "7PZ", "mD", "0Nv", "0CF", "22m", "6MK", "4xh", "4VD", "6cg", "NX", "0mj", "5za", "7OB", "6T", "0Qn", "1oc", "2Ja", "65G", "4Dl", 
"b7g", "68w", "1w2", "06z", "8UF", "dSN", "5b0", "4gp", "4hq", "5m1", "4e", "8ZG", "1mR", "1x3", "67v", "726", "4Km", "7no", "Sq", "04K", 
"1NN", "9U", "6Pb", "4eA", "adr", "5kb", "26", "21F", "Ms", "0nA", "4Uo", "74e", "79U", "bbl", "0cq", "1f1", "no", "396", "4vs", "5s3", 
"6LQ", "4yr", "367", "an", "OB", "0lp", "bmm", "76T", "6oM", "4Zn", "15i", "Br", "2zO", "0Ol", "40J", "6Aa", "6SM", "4fn", "1Ma", "2hc", 
"2FO", "07d", "4HB", "69i", "64Y", "4Er", "83L", "d5D", "7J", "0Pp", "bQm", "a0g", "456", "50v", "1OP", "8K", "Ro", "05U", "4Js", "5O3", 
"66h", "4GC", "08e", "2IN", "qs", "0RA", "4io", "7Lm", "43e", "6BN", "oq", "0LC", "0bo", "2WL", "6lb", "4YA", "4Tq", "5Q1", "Lm", "8fG", 
"0As", "bA", "ael", "cPO", "41T", "ajm", "1K2", "0Nr", "14w", "Cl", "6nS", "5KQ", "5Fa", "6cc", "2XM", "0mn", "0CB", "22i", "6MO", "4xl", 
"1og", "2Je", "65C", "4Dh", "4jD", "7OF", "6P", "g9", "3l9", "2iy", "5b4", "4gt", "4IX", "68s", "QD", "0rv", "1mV", "1x7", "4S8", "4FY", 
"4hu", "5m5", "4a", "1Cz", "h8", "9Q", "6Pf", "4eE", "4Ki", "7nk", "Su", "04O", "Mw", "0nE", "4Uk", "74a", "6Nd", "5kf", "22", "21B", 
"nk", "0MY", "4vw", "5s7", "6mx", "5Hz", "0cu", "1f5", "OF", "0lt", "4WZ", "6by", "6LU", "4yv", "0BX", "aj", "lZ", "0Oh", "40N", "6Ae", 
"6oI", "4Zj", "0aD", "Bv", "5f", "9Ke", "4ir", "5l2", "66u", "735", "08x", "1y0", "Rr", "05H", "4Jn", "7ol", "6Qa", "4dB", "1OM", "8V", 
"7W", "0Pm", "4kC", "7NA", "64D", "4Eo", "83Q", "2Kb", "PC", "07y", "b6d", "69t", "5c3", "4fs", "8TE", "dRM", "374", "22t", "599", "4xq", 
"bln", "77W", "NA", "0ms", "14j", "Cq", "6nN", "5KL", "41I", "7PC", "3km", "0No", "35", "20E", "6Oc", "5ja", "4Tl", "6aO", "Lp", "0oB", 
"0br", "1g2", "78V", "bco", "43x", "568", "ol", "385", "4Kt", "5N4", "Sh", "04R", "1NW", "9L", "441", "4eX", "4hh", "7Mj", "pt", "0SF", 
"K9", "2HI", "67o", "4FD", "4IE", "68n", "QY", "0", "1Lf", "2id", "6RJ", "4gi", "4jY", "auh", "6M", "0Qw", "1oz", "2Jx", "5A5", "4Du", 
"6oT", "4Zw", "0aY", "Bk", "lG", "0Ou", "40S", "6Ax", "6LH", "4yk", "0BE", "aw", "2YJ", "0li", "4WG", "6bd", "6me", "4XF", "0ch", "2VK", 
"nv", "0MD", "42b", "6CI", "6Ny", "7K9", "1PU", "cF", "Mj", "0nX", "4Uv", "5P6", "66q", "4GZ", "1lU", "1y4", "5b", "0RX", "4iv", "5l6", 
"6Qe", "4dF", "1OI", "8R", "Rv", "05L", "4Jj", "7oh", "6pH", "4Ek", "1nd", "2Kf", "7S", "0Pi", "4kG", "7NE", "5c7", "4fw", "1Mx", "0H8", 
"PG", "0su", "5Xz", "69p", "4VY", "4C8", "NE", "0mw", "1Sz", "22p", "6MV", "4xu", "41M", "7PG", "mY", "x8", "14n", "Cu", "6nJ", "5KH", 
"4Th", "6aK", "Lt", "0oF", "31", "bX", "6Og", "4zD", "4wt", "5r4", "oh", "0LZ", "0bv", "AD", "4L9", "4YX", "1NS", "9H", "445", "51u", 
"4Kp", "5N0", "Sl", "04V", "09f", "2HM", "67k", "5Va", "4hl", "7Mn", "4x", "0SB", "1Lb", "3yA", "6RN", "4gm", "4IA", "68j", "2GL", "4", 
"82O", "d4G", "5A1", "4Dq", "bPn", "a1d", "6I", "0Qs", "lC", "0Oq", "40W", "akn", "6oP", "4Zs", "15t", "Bo", "2YN", "0lm", "4WC", "76I", 
"6LL", "4yo", "0BA", "as", "nr", "8DX", "42f", "6CM", "6ma", "4XB", "0cl", "2VO", "Mn", "8gD", "4Ur", "5P2", "ado", "bAm", "1PQ", "cB", 
"Rz", "0qH", "4Jf", "7od", "6Qi", "4dJ", "i7", "2jG", "5n", "0RT", "4iz", "7Lx", "4R7", "4GV", "08p", "1y8", "PK", "07q", "4HW", "7mU", 
"6SX", "52R", "1Mt", "0H4", "sW", "f6", "4kK", "7NI", "64L", "4Eg", "1nh", "2Kj", "14b", "Cy", "6nF", "5KD", "41A", "7PK", "mU", "x4", 
"0CW", "0V6", "591", "4xy", "4VU", "4C4", "NI", "19R", "0bz", "AH", "4L5", "4YT", "43p", "560", "od", "0LV", "w5", "bT", "6Ok", "4zH", 
"4Td", "6aG", "Lx", "0oJ", "5xA", "7Mb", "4t", "0SN", "K1", "2HA", "67g", "4FL", "b5G", "aTM", "0e3", "04Z", "8Wf", "9D", "449", "4eP", 
"4jQ", "7OS", "6E", "255", "1or", "0j2", "65V", "cno", "4IM", "68f", "QQ", "8", "1Ln", "2il", "6RB", "4ga", "afR", "4yc", "0BM", "23f", 
"OS", "Z2", "4WO", "6bl", "aEN", "c4e", "0aQ", "Bc", "lO", "8Fe", "4tS", "4a2", "4n3", "5ks", "8Id", "cN", "Mb", "0nP", "614", "74t", 
"6mm", "4XN", "U3", "2VC", "2xo", "0ML", "42j", "6CA", "6Qm", "4dN", "i3", "8Z", "2Do", "05D", "4Jb", "aUS", "4R3", "4GR", "08t", "d7d", 
"5j", "0RP", "bSM", "a2G", "ayN", "52V", "1Mp", "0H0", "PO", "07u", "4HS", "69x", "64H", "4Ec", "1nl", "2Kn", "sS", "f2", "4kO", "7NM", 
"41E", "7PO", "mQ", "x0", "14f", "2Ul", "6nB", "aQ1", "4VQ", "4C0", "NM", "19V", "0CS", "0V2", "595", "bBN", "43t", "564", "0Y3", "0LR", 
"16W", "AL", "4L1", "4YP", "5DA", "6aC", "2Zm", "0oN", "39", "bP", "6Oo", "4zL", "K5", "2HE", "67c", "4FH", "4hd", "7Mf", "4p", "0SJ", 
"8Wb", "2kY", "4p5", "4eT", "4Kx", "5N8", "Sd", "0pV", "1ov", "0j6", "5A9", "4Dy", "4jU", "7OW", "6A", "1AZ", "1Lj", "2ih", "6RF", "4ge", 
"4II", "68b", "QU", "D4", "OW", "Z6", "4WK", "6bh", "6LD", "4yg", "0BI", "23b", "lK", "0Oy", "4tW", "4a6", "6oX", "5JZ", "0aU", "Bg", 
"Mf", "0nT", "4Uz", "74p", "4n7", "5kw", "1PY", "cJ", "nz", "0MH", "42n", "6CE", "6mi", "4XJ", "U7", "2VG", "4MP", "4X1", "UL", "02v", 
"0XR", "0M3", "a8E", "57U", "4nL", "7KN", "2X", "c1", "1ko", "2Nm", "61K", "5PA", "4Oa", "6zB", "2Al", "00G", "l0", "yQ", "6Tn", "4aM", 
"58T", "a7D", "0i", "0WS", "84o", "ZM", "4W0", "4BQ", "4I2", "5Lr", "13T", "G", "jc", "0IQ", "46w", "537", "6Jl", "5on", "r2", "gS", 
"3OO", "0jM", "4Qc", "70i", "6kA", "5NC", "0eL", "2Po", "hR", "8Bx", "44F", "6Em", "abO", "49v", "0FP", "eb", "KN", "8ad", "4SR", "4F3", 
"3B", "0Tx", "4oV", "4z7", "60Q", "4Az", "0zT", "Yf", "TV", "A7", "4LJ", "6yi", "6WE", "4bf", "0YH", "zz", "1s", "0VI", "4mg", "6XD", 
"6vh", "4CK", "N6", "2MF", "Vg", "0uU", "6n9", "7ky", "4u6", "5pv", "1KX", "xK", "1UZ", "fI", "4k4", "5nt", "4Py", "5U9", "He", "0kW", 
"P4", "EU", "6hj", "5Mh", "47m", "6FF", "ky", "0HK", "0GJ", "dx", "6IG", "48l", "4RH", "6gk", "JT", "0if", "0dV", "Gd", "5Z8", "5OY", 
"4qT", "4d5", "iH", "0Jz", "0XV", "0M7", "5f8", "4cx", "4MT", "4X5", "UH", "02r", "1kk", "Xx", "61O", "5PE", "4nH", "7KJ", "vT", "c5", 
"l4", "yU", "6Tj", "4aI", "4Oe", "6zF", "Wy", "00C", "1iZ", "ZI", "4W4", "4BU", "4ly", "5i9", "0m", "0WW", "jg", "0IU", "46s", "533", 
"4I6", "5Lv", "0gy", "C", "3OK", "0jI", "4Qg", "6dD", "6Jh", "5oj", "r6", "gW", "hV", "0Kd", "44B", "6Ei", "6kE", "5NG", "0eH", "Fz", 
"KJ", "0hx", "4SV", "4F7", "6HY", "49r", "0FT", "ef", "60U", "ckl", "0zP", "Yb", "3F", "206", "4oR", "4z3", "6WA", "4bb", "0YL", "2lo", 
"TR", "A3", "4LN", "6ym", "62d", "4CO", "N2", "2MB", "1w", "0VM", "4mc", "7Ha", "4u2", "54z", "8Re", "xO", "Vc", "01Y", "b0D", "aQN", 
"647", "71w", "Ha", "0kS", "8Lg", "fM", "4k0", "5np", "47i", "6FB", "29d", "0HO", "P0", "EQ", "6hn", "5Ml", "4RL", "6go", "JP", "0ib", 
"0GN", "26e", "6IC", "48h", "45X", "4d1", "iL", "8Cf", "0dR", "0q3", "hYt", "beO", "4nD", "7KF", "2P", "c9", "1kg", "Xt", "61C", "5PI", 
"4MX", "4X9", "UD", "0vv", "0XZ", "2my", "5f4", "4ct", "4lu", "5i5", "0a", "1Gz", "0yw", "ZE", "4W8", "4BY", "4Oi", "6zJ", "Wu", "00O", 
"l8", "yY", "6Tf", "4aE", "6Jd", "5of", "62", "25B", "Iw", "0jE", "4Qk", "6dH", "6ix", "5Lz", "0gu", "O", "jk", "0IY", "4rw", "5w7", 
"5x6", "5mW", "0FX", "ej", "KF", "0ht", "4SZ", "6fy", "6kI", "5NK", "0eD", "Fv", "hZ", "93", "44N", "6Ee", "2BO", "03d", "4LB", "6ya", 
"6WM", "4bn", "1Ia", "zr", "3J", "0Tp", "bUm", "a4g", "5D2", "4Ar", "87L", "Yn", "Vo", "01U", "4Ns", "5K3", "416", "54v", "1KP", "xC", 
"us", "0VA", "4mo", "6XL", "62h", "4CC", "0xm", "2MN", "0fo", "2SL", "6hb", "bgr", "47e", "6FN", "kq", "0HC", "0Es", "fA", "aal", "bDn", 
"4Pq", "5U1", "Hm", "8bG", "10w", "Gl", "5Z0", "5OQ", "45T", "anm", "1O2", "0Jr", "0GB", "dp", "6IO", "48d", "5Ba", "6gc", "3Ll", "0in", 
"1kc", "Xp", "61G", "5PM", "bTs", "7KB", "2T", "0Un", "8QF", "39T", "5f0", "4cp", "797", "aRm", "1s2", "02z", "0ys", "ZA", "63v", "766", 
"4lq", "5i1", "0e", "9Nf", "0Zo", "2oL", "6Tb", "4aA", "4Om", "6zN", "Wq", "00K", "Is", "0jA", "4Qo", "6dL", "7ZA", "5ob", "66", "25F", 
"jo", "9Pd", "4rs", "5w3", "aCn", "bfl", "0gq", "K", "KB", "0hp", "bim", "72T", "5x2", "49z", "327", "en", "3nn", "97", "44J", "6Ea", 
"6kM", "5NO", "11i", "Fr", "6WI", "4bj", "0YD", "zv", "TZ", "0wh", "4LF", "6ye", "5D6", "4Av", "0zX", "Yj", "3N", "0Tt", "4oZ", "6Zy", 
"412", "54r", "1KT", "xG", "Vk", "01Q", "4Nw", "5K7", "62l", "4CG", "0xi", "2MJ", "uw", "0VE", "4mk", "6XH", "47a", "6FJ", "ku", "0HG", 
"P8", "EY", "6hf", "5Md", "4Pu", "5U5", "Hi", "8bC", "0Ew", "fE", "4k8", "5nx", "45P", "4d9", "iD", "0Jv", "0dZ", "Gh", "5Z4", "5OU", 
"4RD", "6gg", "JX", "0ij", "0GF", "dt", "6IK", "5lI", "4Op", "5J0", "Wl", "00V", "0Zr", "2oQ", "405", "55u", "4ll", "6YO", "0x", "0WB", 
"0yn", "2LM", "63k", "5Ra", "4MA", "6xb", "2CL", "02g", "0XC", "39I", "6VN", "4cm", "bTn", "a5d", "2I", "0Us", "86O", "Xm", "5E1", "5PP", 
"6kP", "5NR", "11t", "Fo", "hC", "0Kq", "44W", "aon", "6HL", "49g", "0FA", "es", "3Mo", "0hm", "4SC", "72I", "6ia", "5Lc", "0gl", "V", 
"jr", "1Ya", "46f", "6GM", "hyV", "bEm", "0Dp", "gB", "In", "8cD", "4Qr", "5T2", "1b", "0VX", "4mv", "5h6", "62q", "4CZ", "0xt", "2MW", 
"Vv", "01L", "4Nj", "7kh", "6Ue", "54o", "1KI", "xZ", "3S", "0Ti", "4oG", "6Zd", "6tH", "4Ak", "0zE", "Yw", "TG", "0wu", "780", "6yx", 
"5g7", "4bw", "0YY", "zk", "1Wz", "di", "5y5", "5lT", "4RY", "4G8", "JE", "0iw", "0dG", "Gu", "6jJ", "5OH", "45M", "6Df", "iY", "80", 
"71", "fX", "6Kg", "5ne", "4Ph", "6eK", "Ht", "0kF", "0fv", "ED", "4H9", "5My", "4st", "5v4", "kh", "0HZ", "0Zv", "yD", "401", "4aX", 
"4Ot", "5J4", "Wh", "00R", "O9", "ZX", "63o", "4BD", "4lh", "6YK", "tt", "0WF", "0XG", "2md", "6VJ", "4ci", "4ME", "6xf", "UY", "02c", 
"1kz", "Xi", "5E5", "5PT", "4nY", "aqh", "2M", "0Uw", "hG", "0Ku", "44S", "6Ex", "6kT", "5NV", "0eY", "Fk", "3Mk", "0hi", "4SG", "6fd", 
"6HH", "49c", "0FE", "ew", "jv", "0ID", "46b", "6GI", "6ie", "5Lg", "0gh", "R", "Ij", "0jX", "4Qv", "5T6", "6Jy", "7O9", "0Dt", "gF", 
"62u", "775", "0xp", "198", "1f", "9Oe", "4mr", "5h2", "6Ua", "54k", "1KM", "2nO", "Vr", "01H", "4Nn", "7kl", "60D", "4Ao", "0zA", "Ys", 
"3W", "0Tm", "4oC", "7JA", "5g3", "4bs", "8PE", "zo", "TC", "03y", "784", "aSn", "bhn", "73W", "JA", "0is", "334", "dm", "5y1", "48y", 
"45I", "6Db", "3om", "84", "0dC", "Gq", "6jN", "5OL", "4Pl", "6eO", "Hp", "0kB", "75", "24E", "6Kc", "5na", "47x", "528", "kl", "8AF", 
"0fr", "1c2", "aBm", "bgo", "4ld", "6YG", "0p", "0WJ", "O5", "ZT", "63c", "4BH", "4Ox", "5J8", "Wd", "0tV", "0Zz", "yH", "4t5", "4aT", 
"4nU", "7KW", "2A", "1EZ", "1kv", "Xe", "5E9", "5PX", "4MI", "6xj", "UU", "02o", "0XK", "2mh", "6VF", "4ce", "6HD", "49o", "0FI", "27b", 
"KW", "0he", "4SK", "6fh", "6kX", "5NZ", "0eU", "Fg", "hK", "0Ky", "4pW", "4e6", "4j7", "5ow", "0Dx", "gJ", "If", "0jT", "4Qz", "6dY", 
"6ii", "5Lk", "Q7", "DV", "jz", "0IH", "46n", "6GE", "3PN", "01D", "4Nb", "aQS", "6Um", "54g", "m3", "xR", "1j", "0VP", "59W", "a6G", 
"4V3", "4CR", "85l", "194", "TO", "03u", "4LS", "4Y2", "a9F", "56V", "0YQ", "zc", "wS", "b2", "4oO", "6Zl", "60H", "4Ac", "0zM", "2On", 
"0dO", "2Ql", "6jB", "aU1", "45E", "6Dn", "iQ", "88", "0GS", "da", "acL", "48u", "4RQ", "4G0", "JM", "94N", "12W", "EL", "4H1", "5Mq", 
"47t", "524", "29y", "0HR", "79", "fP", "6Ko", "5nm", "aZ0", "6eC", "3NL", "0kN", "O1", "ZP", "63g", "4BL", "58I", "6YC", "0t", "0WN", 
"8Sf", "yL", "409", "4aP", "b1G", "aPM", "0a3", "00Z", "1kr", "Xa", "61V", "bzN", "4nQ", "7KS", "2E", "215", "0XO", "2ml", "6VB", "4ca", 
"4MM", "6xn", "UQ", "02k", "KS", "0ha", "4SO", "6fl", "7Xa", "49k", "0FM", "27f", "hO", "8Be", "4pS", "4e2", "aAN", "bdL", "0eQ", "Fc", 
"Ib", "0jP", "654", "70t", "4j3", "5os", "8Md", "gN", "28g", "0IL", "46j", "6GA", "6im", "5Lo", "Q3", "Z", "6Ui", "54c", "m7", "xV", 
"Vz", "0uH", "4Nf", "7kd", "4V7", "4CV", "0xx", "190", "1n", "0VT", "4mz", "6XY", "6WX", "56R", "0YU", "zg", "TK", "03q", "4LW", "4Y6", 
"60L", "4Ag", "0zI", "2Oj", "wW", "b6", "4oK", "6Zh", "45A", "6Dj", "iU", "0Jg", "0dK", "Gy", "6jF", "5OD", "4RU", "4G4", "JI", "1yZ", 
"0GW", "de", "5y9", "48q", "47p", "520", "kd", "0HV", "0fz", "EH", "4H5", "5Mu", "4Pd", "6eG", "Hx", "0kJ", "s5", "fT", "6Kk", "5ni", 
"5Y1", "5LP", "13v", "e", "jA", "0Is", "46U", "aml", "6JN", "5oL", "0DC", "gq", "3Om", "0jo", "4QA", "6db", "6kc", "5Na", "0en", "2PM", 
"hp", "0KB", "44d", "6EO", "abm", "49T", "0Fr", "1C2", "Kl", "8aF", "4Sp", "5V0", "4Mr", "5H2", "Un", "02T", "0Xp", "2mS", "427", "57w", 
"4nn", "7Kl", "2z", "1Ea", "1kM", "2NO", "61i", "5Pc", "4OC", "7jA", "2AN", "00e", "0ZA", "ys", "6TL", "4ao", "58v", "a7f", "0K", "0Wq", 
"84M", "Zo", "5G3", "4Bs", "0EY", "fk", "6KT", "5nV", "bjh", "6ex", "HG", "0ku", "0fE", "Ew", "6hH", "5MJ", "47O", "6Fd", "29B", "0Hi", 
"53", "dZ", "6Ie", "48N", "4Rj", "6gI", "Jv", "0iD", "0dt", "GF", "6jy", "7o9", "4qv", "5t6", "ij", "0JX", "wh", "0TZ", "4ot", "5j4", 
"4T9", "4AX", "0zv", "YD", "Tt", "03N", "4Lh", "6yK", "6Wg", "4bD", "o9", "zX", "1Q", "0Vk", "4mE", "6Xf", "62B", "4Ci", "0xG", "2Md", 
"VE", "0uw", "4NY", "aQh", "5e5", "5pT", "1Kz", "xi", "jE", "0Iw", "46Q", "4g8", "5Y5", "5LT", "13r", "a", "IY", "0jk", "4QE", "6df", 
"6JJ", "5oH", "0DG", "gu", "ht", "0KF", "4ph", "6EK", "6kg", "5Ne", "S9", "FX", "Kh", "0hZ", "4St", "5V4", "4h9", "49P", "0Fv", "eD", 
"0Xt", "2mW", "423", "4cZ", "4Mv", "5H6", "Uj", "02P", "1kI", "XZ", "61m", "5Pg", "4nj", "7Kh", "vv", "0UD", "0ZE", "yw", "6TH", "4ak", 
"4OG", "6zd", "2AJ", "00a", "0yY", "Zk", "5G7", "4Bw", "58r", "6Yx", "0O", "0Wu", "bjl", "71U", "HC", "0kq", "316", "fo", "6KP", "5nR", 
"47K", "7VA", "29F", "0Hm", "0fA", "Es", "6hL", "5MN", "4Rn", "6gM", "Jr", "1ya", "57", "26G", "6Ia", "48J", "45z", "5t2", "in", "8CD", 
"0dp", "GB", "hYV", "bem", "60w", "757", "0zr", "2OQ", "3d", "9Mg", "4op", "5j0", "6Wc", "56i", "0Yn", "2lM", "Tp", "03J", "4Ll", "6yO", 
"62F", "4Cm", "0xC", "dwS", "1U", "0Vo", "4mA", "6Xb", "5e1", "54X", "8RG", "xm", "VA", "0us", "b0f", "aQl", "6JF", "5oD", "0DK", "gy", 
"IU", "0jg", "4QI", "6dj", "5Y9", "5LX", "0gW", "m", "jI", "1YZ", "4rU", "4g4", "4h5", "5mu", "0Fz", "eH", "Kd", "0hV", "4Sx", "5V8", 
"6kk", "5Ni", "S5", "FT", "hx", "0KJ", "44l", "6EG", "4nf", "7Kd", "2r", "0UH", "M7", "XV", "61a", "5Pk", "4Mz", "6xY", "Uf", "0vT", 
"0Xx", "39r", "4v7", "4cV", "4lW", "4y6", "0C", "0Wy", "0yU", "Zg", "63P", "5RZ", "4OK", "6zh", "WW", "B6", "0ZI", "2oj", "6TD", "4ag", 
"0fM", "2Sn", "7xa", "5MB", "47G", "6Fl", "kS", "0Ha", "0EQ", "fc", "aaN", "bDL", "4PS", "4E2", "HO", "8be", "10U", "GN", "4J3", "5Os", 
"45v", "506", "ib", "0JP", "q3", "dR", "6Im", "48F", "4Rb", "6gA", "3LN", "0iL", "2Bm", "03F", "aF0", "6yC", "6Wo", "4bL", "o1", "zP", 
"3h", "0TR", "bUO", "a4E", "4T1", "4AP", "87n", "YL", "VM", "01w", "4NQ", "7kS", "hfu", "54T", "1Kr", "xa", "1Y", "0Vc", "4mM", "6Xn", 
"62J", "4Ca", "0xO", "2Ml", "IQ", "0jc", "4QM", "6dn", "6JB", "a19", "0DO", "25d", "jM", "9PF", "46Y", "4g0", "aCL", "687", "0gS", "i", 
"3MP", "0hR", "676", "72v", "4h1", "49X", "8Of", "eL", "3nL", "0KN", "44h", "6EC", "6ko", "5Nm", "S1", "FP", "M3", "XR", "61e", "5Po", 
"4nb", "aqS", "2v", "0UL", "8Qd", "39v", "4v3", "4cR", "b3E", "aRO", "Ub", "02X", "0yQ", "Zc", "63T", "bxL", "4lS", "4y2", "0G", "237", 
"0ZM", "2on", "7Da", "4ac", "4OO", "6zl", "WS", "B2", "47C", "6Fh", "kW", "0He", "0fI", "2Sj", "6hD", "5MF", "4PW", "4E6", "HK", "0ky", 
"0EU", "fg", "6KX", "5nZ", "45r", "502", "if", "0JT", "0dx", "GJ", "4J7", "5Ow", "4Rf", "6gE", "Jz", "0iH", "q7", "dV", "6Ii", "48B", 
"6Wk", "4bH", "o5", "zT", "Tx", "03B", "4Ld", "6yG", "4T5", "4AT", "0zz", "YH", "3l", "0TV", "4ox", "5j8", "5e9", "54P", "1Kv", "xe", 
"VI", "01s", "4NU", "7kW", "62N", "4Ce", "0xK", "2Mh", "uU", "0Vg", "4mI", "6Xj", "4K0", "5Np", "11V", "FM", "ha", "0KS", "44u", "515", 
"6Hn", "49E", "48", "eQ", "3MM", "0hO", "4Sa", "6fB", "6iC", "5LA", "0gN", "t", "jP", "0Ib", "46D", "6Go", "hyt", "bEO", "0DR", "0Q3", 
"IL", "8cf", "4QP", "4D1", "4OR", "4Z3", "WN", "00t", "0ZP", "yb", "hgv", "55W", "4lN", "6Ym", "0Z", "a3", "0yL", "2Lo", "63I", "4Bb", 
"4Mc", "7ha", "2Cn", "02E", "n2", "2mB", "6Vl", "4cO", "bTL", "a5F", "2k", "0UQ", "86m", "XO", "4U2", "5Pr", "0Gy", "dK", "4i6", "5lv", 
"5BZ", "6gX", "Jg", "0iU", "R6", "GW", "6jh", "5Oj", "45o", "6DD", "3oK", "0JI", "0EH", "fz", "6KE", "5nG", "4PJ", "6ei", "HV", "0kd", 
"0fT", "Ef", "6hY", "690", "4sV", "4f7", "kJ", "0Hx", "uH", "0Vz", "4mT", "4x5", "5F8", "4Cx", "0xV", "0m7", "VT", "C5", "4NH", "7kJ", 
"6UG", "54M", "1Kk", "xx", "3q", "0TK", "4oe", "6ZF", "60b", "4AI", "L4", "YU", "Te", "0wW", "4Ly", "5I9", "4w4", "4bU", "1IZ", "zI", 
"he", "0KW", "44q", "511", "4K4", "5Nt", "11R", "FI", "Ky", "0hK", "4Se", "6fF", "6Hj", "49A", "p4", "eU", "jT", "0If", "4rH", "6Gk", 
"6iG", "5LE", "0gJ", "p", "IH", "0jz", "4QT", "4D5", "5z8", "5oY", "0DV", "gd", "0ZT", "yf", "6TY", "4az", "4OV", "4Z7", "WJ", "00p", 
"0yH", "Zz", "63M", "4Bf", "4lJ", "6Yi", "tV", "a7", "n6", "2mF", "6Vh", "4cK", "4Mg", "6xD", "2Cj", "02A", "1kX", "XK", "4U6", "5Pv", 
"6N9", "7Ky", "2o", "0UU", "665", "73u", "Jc", "0iQ", "8Ne", "dO", "4i2", "5lr", "45k", "7Ta", "3oO", "0JM", "R2", "GS", "6jl", "5On", 
"4PN", "6em", "HR", "8bx", "0EL", "24g", "6KA", "5nC", "47Z", "4f3", "kN", "8Ad", "0fP", "Eb", "aBO", "694", "62W", "byO", "0xR", "0m3", 
"1D", "224", "4mP", "4x1", "6UC", "54I", "1Ko", "2nm", "VP", "C1", "4NL", "7kN", "60f", "4AM", "L0", "YQ", "3u", "0TO", "4oa", "6ZB", 
"438", "4bQ", "8Pg", "zM", "Ta", "0wS", "b2F", "aSL", "6Hf", "49M", "40", "eY", "Ku", "0hG", "4Si", "6fJ", "4K8", "5Nx", "0ew", "FE", 
"hi", "8BC", "4pu", "5u5", "5z4", "5oU", "0DZ", "gh", "ID", "0jv", "4QX", "4D9", "6iK", "5LI", "0gF", "Dt", "jX", "0Ij", "46L", "6Gg", 
"4lF", "6Ye", "0R", "0Wh", "0yD", "Zv", "63A", "4Bj", "4OZ", "6zy", "WF", "0tt", "0ZX", "yj", "5d6", "4av", "4nw", "5k7", "2c", "0UY", 
"1kT", "XG", "61p", "5Pz", "4Mk", "6xH", "Uw", "02M", "0Xi", "2mJ", "6Vd", "4cG", "0dm", "2QN", "7zA", "5Ob", "45g", "6DL", "is", "0JA", 
"0Gq", "dC", "acn", "48W", "4Rs", "5W3", "Jo", "94l", "12u", "En", "5X2", "5MS", "47V", "alo", "kB", "0Hp", "1Ua", "fr", "6KM", "5nO", 
"4PB", "6ea", "3Nn", "0kl", "3Pl", "01f", "bts", "7kB", "6UO", "54E", "1Kc", "xp", "1H", "0Vr", "59u", "a6e", "5F0", "4Cp", "85N", "d3F", 
"Tm", "03W", "4Lq", "5I1", "434", "56t", "0Ys", "zA", "3y", "0TC", "4om", "6ZN", "60j", "4AA", "0zo", "2OL", "Kq", "0hC", "4Sm", "6fN", 
"6Hb", "49I", "44", "27D", "hm", "8BG", "44y", "519", "aAl", "bdn", "0es", "FA", "1o2", "0jr", "bko", "70V", "5z0", "5oQ", "305", "gl", 
"28E", "0In", "46H", "6Gc", "6iO", "5LM", "0gB", "x", "1ia", "Zr", "63E", "4Bn", "4lB", "6Ya", "0V", "0Wl", "8SD", "yn", "5d2", "4ar", 
"b1e", "aPo", "WB", "00x", "1kP", "XC", "61t", "744", "4ns", "5k3", "2g", "9Ld", "0Xm", "2mN", "7FA", "4cC", "4Mo", "6xL", "Us", "02I", 
"45c", "6DH", "iw", "0JE", "0di", "2QJ", "6jd", "5Of", "4Rw", "5W7", "Jk", "0iY", "0Gu", "dG", "6Ix", "48S", "47R", "6Fy", "kF", "0Ht", 
"0fX", "Ej", "5X6", "5MW", "4PF", "6ee", "HZ", "0kh", "0ED", "fv", "6KI", "5nK", "6UK", "54A", "1Kg", "xt", "VX", "C9", "4ND", "7kF", 
"5F4", "4Ct", "0xZ", "2My", "1L", "0Vv", "4mX", "4x9", "430", "4bY", "0Yw", "zE", "Ti", "03S", "4Lu", "5I5", "60n", "4AE", "L8", "YY", 
"wu", "0TG", "4oi", "6ZJ" };




# 53 "redis-benchmark.c"

#define UNUSED(V) ((void) V)
#define RANDPTR_INITIAL_SIZE 8
#define MAX_LATENCY_PRECISION 3
#define MAX_THREADS 500
#define CLUSTER_SLOTS 16384

#define CLIENT_GET_EVENTLOOP(c)     (c->thread_id >= 0 ? config.threads[c->thread_id]->el : config.el)


struct benchmarkThread;
struct clusterNode;
struct redisConfig;

static struct config {
    aeEventLoop *el;
    const char *hostip;
    int hostport;
    const char *hostsocket;
    int numclients;
    int liveclients;
    int requests;
    int requests_issued;
    int requests_finished;
    int keysize;
    int datasize;
    int randomkeys;
    int randomkeys_keyspacelen;
    int keepalive;
    int pipeline;
    int showerrors;
    long long start;
    long long totlatency;
    long long *latency;
    const char *title;
    list *clients;
    int quiet;
    int csv;
    int loop;
    int idlemode;
    int dbnum;
    sds dbnumstr;
    char *tests;
    char *auth;
    int precision;
    int num_threads;
    struct benchmarkThread **threads;
    int cluster_mode;
    int cluster_node_count;
    struct clusterNode **cluster_nodes;
    struct redisConfig *redis_config;
    int is_fetching_slots;
    int is_updating_slots;
    int slots_last_update;
     
    pthread_mutex_t requests_issued_mutex;
    pthread_mutex_t requests_finished_mutex;
    pthread_mutex_t liveclients_mutex;
    pthread_mutex_t is_fetching_slots_mutex;
    pthread_mutex_t is_updating_slots_mutex;
    pthread_mutex_t updating_slots_mutex;
    pthread_mutex_t slots_last_update_mutex;
} config;

typedef struct _client {
    redisContext *context;
    sds obuf;
    char **randptr;          
    size_t randlen;          
    size_t randfree;         
    char **stagptr;          
    size_t staglen;          
    size_t stagfree;         
    size_t written;          
    long long start;         
    long long latency;       
    int pending;             
    int prefix_pending;     

 
    int prefixlen;           
    int thread_id;
    struct clusterNode *cluster_node;
    int slots_last_update;
} *client;

 

typedef struct benchmarkThread {
    int index;
    pthread_t thread;
    aeEventLoop *el;
} benchmarkThread;

 
typedef struct clusterNode {
    char *ip;
    int port;
    sds name;
    int flags;
    sds replicate;   
    int *slots;
    int slots_count;
    int current_slot_index;
    int *updated_slots;          
    int updated_slots_count;     
    int replicas_count;
    sds *migrating; 
 
    sds *importing; 
 
    int migrating_count;  
    int importing_count;  
    struct redisConfig *redis_config;
} clusterNode;

typedef struct redisConfig {
    sds save;
    sds appendonly;
} redisConfig;

 
static void writeHandler(aeEventLoop *el, int fd, void *privdata, int mask);
static void createMissingClients(client c);
static benchmarkThread *createBenchmarkThread(int index);
static void freeBenchmarkThread(benchmarkThread *thread);
static void freeBenchmarkThreads();
static void *execBenchmarkThread(void *ptr);
static clusterNode *createClusterNode(char *ip, int port);
static redisConfig *getRedisConfig(const char *ip, int port,
                                   const char *hostsocket);
static void freeRedisConfig(redisConfig *cfg);
static int fetchClusterSlotsConfiguration(client c);
static void updateClusterSlotsConfiguration();
int showThroughput(struct aeEventLoop *eventLoop, long long id,
                   void *clientData);

 
static uint64_t dictSdsHash(const void *key);
static int dictSdsKeyCompare(void *privdata, const void *key1,
    const void *key2);

 
static long long ustime(void) {
    struct timeval tv;
    long long ust;

    gettimeofday(&tv, ((void *)0));
    ust = ((long)tv.tv_sec)*1000000;
    ust += tv.tv_usec;
    return ust;
}

static long long mstime(void) {
    struct timeval tv;
    long long mst;

    gettimeofday(&tv, ((void *)0));
    mst = ((long long)tv.tv_sec)*1000;
    mst += tv.tv_usec/1000;
    return mst;
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

 
void _serverAssert(const char *estr, const char *file, int line) {
    fprintf(stderr, "=== ASSERTION FAILED ===");
    fprintf(stderr, "==> %s:%d '%s' is not true",file,line,estr);
    *((char*)-1) = 'x';
}

static redisConfig *getRedisConfig(const char *ip, int port,
                                   const char *hostsocket)
{
    redisConfig *cfg = zcalloc(sizeof(*cfg));
    if (!cfg) return ((void *)0);
    redisContext *c = ((void *)0);
    redisReply *reply = ((void *)0), *sub_reply = ((void *)0);
    if (hostsocket == ((void *)0))
        c = redisConnect(ip, port);
    else
        c = redisConnectUnix(hostsocket);
    if (c == ((void *)0) || c->err) {
        fprintf(stderr,"Could not connect to Redis at ");
        char *err = (c != ((void *)0) ? c->errstr : "");
        if (hostsocket == ((void *)0)) fprintf(stderr,"%s:%d: %s\n",ip,port,err);
        else fprintf(stderr,"%s: %s\n",hostsocket,err);
        goto fail;
    }

    if(config.auth){
        void *authReply = ((void *)0);
        redisAppendCommand(c, "AUTH %s", config.auth);
        if (0 != redisGetReply(c, &authReply)) goto fail;
        if (reply) freeReplyObject(reply);
        reply = ((redisReply *) authReply);
        if (reply->type == 6) {
            fprintf(stderr, "ERROR: %s\n", reply->str);
            goto fail;
        }
    }

    redisAppendCommand(c, "CONFIG GET %s", "save");
    redisAppendCommand(c, "CONFIG GET %s", "appendonly");
    int i = 0;
    void *r = ((void *)0);
    for (; i < 2; i++) {
        int res = redisGetReply(c, &r);
        if (reply) freeReplyObject(reply);
        reply = ((redisReply *) r);
        if (res != 0 || !r) goto fail;
        if (reply->type == 6) {
            fprintf(stderr, "ERROR: %s\n", reply->str);
            goto fail;
        }
        if (reply->type != 2 || reply->elements < 2) goto fail;
        sub_reply = reply->element[1];
        char *value = sub_reply->str;
        if (!value) value = "";
        switch (i) {
        case 0: cfg->save = sdsnew(value); break;
        case 1: cfg->appendonly = sdsnew(value); break;
        }
    }
    freeReplyObject(reply);
    redisFree(c);
    return cfg;
fail:
    fprintf(stderr, "ERROR: failed to fetch CONFIG from ");
    if (hostsocket == ((void *)0)) fprintf(stderr, "%s:%d\n", ip, port);
    else fprintf(stderr, "%s\n", hostsocket);
    freeReplyObject(reply);
    redisFree(c);
    zfree(cfg);
    return ((void *)0);
}
static void freeRedisConfig(redisConfig *cfg) {
    if (cfg->save) sdsfree(cfg->save);
    if (cfg->appendonly) sdsfree(cfg->appendonly);
    zfree(cfg);
}

static void freeClient(client c) {
    aeEventLoop *el = (c->thread_id >= 0 ? config . threads[c->thread_id]->el : config . el);
    listNode *ln;
    aeDeleteFileEvent(el,c->context->fd,2);
    aeDeleteFileEvent(el,c->context->fd,1);
    if (c->thread_id >= 0) {
        int requests_finished = 0;
        do { requests_finished = (({ typeof(*(&config . requests_finished)) __csonar_gcc_atomic_val; csonar_mutex_acquire( __csonar_gcc_atomic_mutex ); __csonar_gcc_atomic_val = (*(&config . requests_finished)); csonar_mutex_release( __csonar_gcc_atomic_mutex ); (void)__csonar_gcc_atomic_val; __csonar_gcc_atomic_val; })); } while(0);
        if (requests_finished >= config.requests) {
            aeStop(el);
        }
    }
    redisFree(c->context);
    sdsfree(c->obuf);
    zfree(c->randptr);
    zfree(c->stagptr);
    zfree(c);
    if (config.num_threads) pthread_mutex_lock(&(config.liveclients_mutex));
    config.liveclients--;
    ln = listSearchKey(config.clients,c);
    ((ln != ((void *)0)) ? (void) (0) : __assert_fail ("ln != NULL", "redis-benchmark.c", 330, __extension__ __PRETTY_FUNCTION__));
    listDelNode(config.clients,ln);
    if (config.num_threads) pthread_mutex_unlock(&(config.liveclients_mutex));
}

static void freeAllClients(void) {
    listNode *ln = config.clients->head, *next;

    while(ln) {
        next = ln->next;
        freeClient(ln->value);
        ln = next;
    }
}

static void resetClient(client c) {
    aeEventLoop *el = (c->thread_id >= 0 ? config . threads[c->thread_id]->el : config . el);
    aeDeleteFileEvent(el,c->context->fd,2);
    aeDeleteFileEvent(el,c->context->fd,1);
    aeCreateFileEvent(el,c->context->fd,2,writeHandler,c);
    c->written = 0;
    c->pending = config.pipeline;
}

static void randomizeClientKey(client c) {
    size_t i;

    for (i = 0; i < c->randlen; i++) {
        char *p = c->randptr[i]+11;
        size_t r = 0;
        if (config.randomkeys_keyspacelen != 0)
            r = random() % config.randomkeys_keyspacelen;
        size_t j;

        for (j = 0; j < 12; j++) {
            *p = '0'+r%10;
            r/=10;
            p--;
        }
    }
}

static void setClusterKeyHashTag(client c) {
    ((c->thread_id >= 0) ? (void) (0) : __assert_fail ("c->thread_id >= 0", "redis-benchmark.c", 373, __extension__ __PRETTY_FUNCTION__));
    clusterNode *node = c->cluster_node;
    ((node) ? (void) (0) : __assert_fail ("node", "redis-benchmark.c", 375, __extension__ __PRETTY_FUNCTION__));
    ((node ->current_slot_index < node ->slots_count) ? (void) (0) : __assert_fail ("node->current_slot_index < node->slots_count", "redis-benchmark.c", 376, __extension__ __PRETTY_FUNCTION__));
    int is_updating_slots = 0;
    do { is_updating_slots = (({ typeof(*(&config . is_updating_slots)) __csonar_gcc_atomic_val; csonar_mutex_acquire( __csonar_gcc_atomic_mutex ); __csonar_gcc_atomic_val = (*(&config . is_updating_slots)); csonar_mutex_release( __csonar_gcc_atomic_mutex ); (void)__csonar_gcc_atomic_val; __csonar_gcc_atomic_val; })); } while(0);
    




 
    if (is_updating_slots) updateClusterSlotsConfiguration();
    int slot = node->slots[node->current_slot_index];
    const char *tag = crc16_slot_table[slot];
    int taglen = strlen(tag);
    size_t i;
    for (i = 0; i < c->staglen; i++) {
        char *p = c->stagptr[i] + 1;
        p[0] = tag[0];
        p[1] = (taglen >= 2 ? tag[1] : '}');
        p[2] = (taglen == 3 ? tag[2] : '}');
    }
}

static void clientDone(client c) {
    int requests_finished = 0;
    do { requests_finished = (({ typeof(*(&config . requests_finished)) __csonar_gcc_atomic_val; csonar_mutex_acquire( __csonar_gcc_atomic_mutex ); __csonar_gcc_atomic_val = (*(&config . requests_finished)); csonar_mutex_release( __csonar_gcc_atomic_mutex ); (void)__csonar_gcc_atomic_val; __csonar_gcc_atomic_val; })); } while(0);
    if (requests_finished >= config.requests) {
        freeClient(c);
        if (!config.num_threads && config.el) aeStop(config.el);
        return;
    }
    if (config.keepalive) {
        resetClient(c);
    } else {
        if (config.num_threads) pthread_mutex_lock(&(config.liveclients_mutex));
        config.liveclients--;
        createMissingClients(c);
        config.liveclients++;
        if (config.num_threads)
            pthread_mutex_unlock(&(config.liveclients_mutex));
        freeClient(c);
    }
}

static void readHandler(aeEventLoop *el, int fd, void *privdata, int mask) {
    client c = privdata;
    void *reply = ((void *)0);
    ((void) el);
    ((void) fd);
    ((void) mask);

    

 
    if (c->latency < 0) c->latency = ustime()-(c->start);

    if (redisBufferRead(c->context) != 0) {
        fprintf(stderr,"Error: %s\n",c->context->errstr);
        exit(1);
    } else {
        while(c->pending) {
            if (redisGetReply(c->context,&reply) != 0) {
                fprintf(stderr,"Error: %s\n",c->context->errstr);
                exit(1);
            }
            if (reply != ((void *)0)) {
                if (reply == (void*)6) {
                    fprintf(stderr,"Unexpected error reply, exiting...\n");
                    exit(1);
                }
                redisReply *r = reply;
                int is_err = (r->type == 6);

                if (is_err && config.showerrors) {
                     
                    static time_t lasterr_time = 0;
                    time_t now = time(((void *)0));
                    if (lasterr_time != now) {
                        lasterr_time = now;
                        if (c->cluster_node) {
                            printf("Error from server %s:%d: %s\n",
                                   c->cluster_node->ip,
                                   c->cluster_node->port,
                                   r->str);
                        } else printf("Error from server: %s\n", r->str);
                    }
                }

                

 
                if (is_err && c->cluster_node && c->staglen) {
                    int fetch_slots = 0, do_wait = 0;
                    if (!strncmp(r->str,"MOVED",5) || !strncmp(r->str,"ASK",3))
                        fetch_slots = 1;
                    else if (!strncmp(r->str,"CLUSTERDOWN",11)) {
                        

 
                        fetch_slots = 1;
                        do_wait = 1;
                        printf("Error from server %s:%d: %s\n",
                               c->cluster_node->ip,
                               c->cluster_node->port,
                               r->str);
                    }
                    if (do_wait) sleep(1);
                    if (fetch_slots && !fetchClusterSlotsConfiguration(c))
                        exit(1);
                }

                freeReplyObject(reply);
                 
                if (c->prefix_pending > 0) {
                    c->prefix_pending--;
                    c->pending--;
                     
                    if (c->prefixlen > 0) {
                        size_t j;
                        sdsrange(c->obuf, c->prefixlen, -1);
                        
 
                        for (j = 0; j < c->randlen; j++)
                            c->randptr[j] -= c->prefixlen;
                        c->prefixlen = 0;
                    }
                    continue;
                }
                int requests_finished = 0;
                do { requests_finished = (({ typeof(({ typeof(&config . requests_finished) __csonar_ptr = (&config . requests_finished); typeof(*__csonar_ptr) __csonar_old = *__csonar_ptr; *__csonar_ptr += ((1)); __csonar_old; })) __csonar_gcc_atomic_val; csonar_mutex_acquire( __csonar_gcc_atomic_mutex ); __csonar_gcc_atomic_val = (({ typeof(&config . requests_finished) __csonar_ptr = (&config . requests_finished); typeof(*__csonar_ptr) __csonar_old = *__csonar_ptr; *__csonar_ptr += ((1)); __csonar_old; })); csonar_mutex_release( __csonar_gcc_atomic_mutex ); (void)__csonar_gcc_atomic_val; __csonar_gcc_atomic_val; })); } while(0);
                if (requests_finished < config.requests)
                    config.latency[requests_finished] = c->latency;
                c->pending--;
                if (c->pending == 0) {
                    clientDone(c);
                    break;
                }
            } else {
                break;
            }
        }
    }
}

static void writeHandler(aeEventLoop *el, int fd, void *privdata, int mask) {
    client c = privdata;
    ((void) el);
    ((void) fd);
    ((void) mask);

     
    if (c->written == 0) {
         
        int requests_issued = 0;
        do { requests_issued = (({ typeof(({ typeof(&config . requests_issued) __csonar_ptr = (&config . requests_issued); typeof(*__csonar_ptr) __csonar_old = *__csonar_ptr; *__csonar_ptr += ((1)); __csonar_old; })) __csonar_gcc_atomic_val; csonar_mutex_acquire( __csonar_gcc_atomic_mutex ); __csonar_gcc_atomic_val = (({ typeof(&config . requests_issued) __csonar_ptr = (&config . requests_issued); typeof(*__csonar_ptr) __csonar_old = *__csonar_ptr; *__csonar_ptr += ((1)); __csonar_old; })); csonar_mutex_release( __csonar_gcc_atomic_mutex ); (void)__csonar_gcc_atomic_val; __csonar_gcc_atomic_val; })); } while(0);
        if (requests_issued >= config.requests) {
            freeClient(c);
            return;
        }

         
        if (config.randomkeys) randomizeClientKey(c);
        if (config.cluster_mode && c->staglen > 0) setClusterKeyHashTag(c);
        do { c->slots_last_update = (({ typeof(*(&config . slots_last_update)) __csonar_gcc_atomic_val; csonar_mutex_acquire( __csonar_gcc_atomic_mutex ); __csonar_gcc_atomic_val = (*(&config . slots_last_update)); csonar_mutex_release( __csonar_gcc_atomic_mutex ); (void)__csonar_gcc_atomic_val; __csonar_gcc_atomic_val; })); } while(0);
        c->start = ustime();
        c->latency = -1;
    }
    if (sdslen(c->obuf) > c->written) {
        void *ptr = c->obuf+c->written;
        ssize_t nwritten = write(c->context->fd,ptr,sdslen(c->obuf)-c->written);
        if (nwritten == -1) {
            if (errno != 32)
                fprintf(stderr, "Writing to socket: %s\n", strerror(errno));
            freeClient(c);
            return;
        }
        c->written += nwritten;
        if (sdslen(c->obuf) == c->written) {
            aeDeleteFileEvent(el,c->context->fd,2);
            aeCreateFileEvent(el,c->context->fd,1,readHandler,c);
        }
    }
}





















 
static client createClient(char *cmd, size_t len, client from, int thread_id) {
    int j;
    int is_cluster_client = (config.cluster_mode && thread_id >= 0);
    client c = zmalloc(sizeof(struct _client));

    const char *ip = ((void *)0);
    int port = 0;
    c->cluster_node = ((void *)0);
    if (config.hostsocket == ((void *)0) || is_cluster_client) {
        if (!is_cluster_client) {
            ip = config.hostip;
            port = config.hostport;
        } else {
            int node_idx = 0;
            if (config.num_threads < config.cluster_node_count)
                node_idx = config.liveclients % config.cluster_node_count;
            else
                node_idx = thread_id % config.cluster_node_count;
            clusterNode *node = config.cluster_nodes[node_idx];
            ((node != ((void *)0)) ? (void) (0) : __assert_fail ("node != NULL", "redis-benchmark.c", 599, __extension__ __PRETTY_FUNCTION__));
            ip = (const char *) node->ip;
            port = node->port;
            c->cluster_node = node;
        }
        c->context = redisConnectNonBlock(ip,port);
    } else {
        c->context = redisConnectUnixNonBlock(config.hostsocket);
    }
    if (c->context->err) {
        fprintf(stderr,"Could not connect to Redis at ");
        if (config.hostsocket == ((void *)0) || is_cluster_client)
            fprintf(stderr,"%s:%d: %s\n",ip,port,c->context->errstr);
        else
            fprintf(stderr,"%s: %s\n",config.hostsocket,c->context->errstr);
        exit(1);
    }
    c->thread_id = thread_id;
     
    c->context->reader->maxbuf = 0;

    

 
    c->obuf = sdsempty();
    

 
    c->prefix_pending = 0;
    if (config.auth) {
        char *buf = ((void *)0);
        int len = redisFormatCommand(&buf, "AUTH %s", config.auth);
        c->obuf = sdscatlen(c->obuf, buf, len);
        free(buf);
        c->prefix_pending++;
    }

    


 
    if (config.dbnum != 0 && !is_cluster_client) {
        c->obuf = sdscatprintf(c->obuf,"*2\r\n$6\r\nSELECT\r\n$%d\r\n%s\r\n",
            (int)sdslen(config.dbnumstr),config.dbnumstr);
        c->prefix_pending++;
    }
    c->prefixlen = sdslen(c->obuf);
     
    if (from) {
        c->obuf = sdscatlen(c->obuf,
            from->obuf+from->prefixlen,
            sdslen(from->obuf)-from->prefixlen);
    } else {
        for (j = 0; j < config.pipeline; j++)
            c->obuf = sdscatlen(c->obuf,cmd,len);
    }

    c->written = 0;
    c->pending = config.pipeline+c->prefix_pending;
    c->randptr = ((void *)0);
    c->randlen = 0;
    c->stagptr = ((void *)0);
    c->staglen = 0;

     
    if (config.randomkeys) {
        if (from) {
            c->randlen = from->randlen;
            c->randfree = 0;
            c->randptr = zmalloc(sizeof(char*)*c->randlen);
             
            for (j = 0; j < (int)c->randlen; j++) {
                c->randptr[j] = c->obuf + (from->randptr[j]-from->obuf);
                 
                c->randptr[j] += c->prefixlen - from->prefixlen;
            }
        } else {
            char *p = c->obuf;

            c->randlen = 0;
            c->randfree = 8;
            c->randptr = zmalloc(sizeof(char*)*c->randfree);
            while ((p = strstr(p,"__rand_int__")) != ((void *)0)) {
                if (c->randfree == 0) {
                    c->randptr = zrealloc(c->randptr,sizeof(char*)*c->randlen*2);
                    c->randfree += c->randlen;
                }
                c->randptr[c->randlen++] = p;
                c->randfree--;
                p += 12;  
            }
        }
    }
     
    if (config.cluster_mode) {
        if (from) {
            c->staglen = from->staglen;
            c->stagfree = 0;
            c->stagptr = zmalloc(sizeof(char*)*c->staglen);
             
            for (j = 0; j < (int)c->staglen; j++) {
                c->stagptr[j] = c->obuf + (from->stagptr[j]-from->obuf);
                 
                c->stagptr[j] += c->prefixlen - from->prefixlen;
            }
        } else {
            char *p = c->obuf;

            c->staglen = 0;
            c->stagfree = 8;
            c->stagptr = zmalloc(sizeof(char*)*c->stagfree);
            while ((p = strstr(p,"{tag}")) != ((void *)0)) {
                if (c->stagfree == 0) {
                    c->stagptr = zrealloc(c->stagptr,
                                          sizeof(char*) * c->staglen*2);
                    c->stagfree += c->staglen;
                }
                c->stagptr[c->staglen++] = p;
                c->stagfree--;
                p += 5;  
            }
        }
    }
    aeEventLoop *el = ((void *)0);
    if (thread_id < 0) el = config.el;
    else {
        benchmarkThread *thread = config.threads[thread_id];
        el = thread->el;
    }
    if (config.idlemode == 0)
        aeCreateFileEvent(el,c->context->fd,2,writeHandler,c);
    listAddNodeTail(config.clients,c);
    (({ typeof(({ typeof(&config . liveclients) __csonar_ptr = (&config . liveclients); *__csonar_ptr += ((1)); *__csonar_ptr; })) __csonar_gcc_atomic_val; csonar_mutex_acquire( __csonar_gcc_atomic_mutex ); __csonar_gcc_atomic_val = (({ typeof(&config . liveclients) __csonar_ptr = (&config . liveclients); *__csonar_ptr += ((1)); *__csonar_ptr; })); csonar_mutex_release( __csonar_gcc_atomic_mutex ); (void)__csonar_gcc_atomic_val; __csonar_gcc_atomic_val; }));
    do { c->slots_last_update = (({ typeof(*(&config . slots_last_update)) __csonar_gcc_atomic_val; csonar_mutex_acquire( __csonar_gcc_atomic_mutex ); __csonar_gcc_atomic_val = (*(&config . slots_last_update)); csonar_mutex_release( __csonar_gcc_atomic_mutex ); (void)__csonar_gcc_atomic_val; __csonar_gcc_atomic_val; })); } while(0);
    return c;
}

static void createMissingClients(client c) {
    int n = 0;
    while(config.liveclients < config.numclients) {
        int thread_id = -1;
        if (config.num_threads)
            thread_id = config.liveclients % config.num_threads;
        createClient(((void *)0),0,c,thread_id);

         
        if (++n > 64) {
            usleep(50000);
            n = 0;
        }
    }
}

static int compareLatency(const void *a, const void *b) {
    return (*(long long*)a)-(*(long long*)b);
}

static int ipow(int base, int exp) {
    int result = 1;
    while (exp) {
        if (exp & 1) result *= base;
        exp /= 2;
        base *= base;
    }
    return result;
}

static void showLatencyReport(void) {
    int i, curlat = 0;
    int usbetweenlat = ipow(10, 3-config.precision);
    float perc, reqpersec;

    reqpersec = (float)config.requests_finished/((float)config.totlatency/1000);
    if (!config.quiet && !config.csv) {
        printf("====== %s ======\n", config.title);
        printf("  %d requests completed in %.2f seconds\n", config.requests_finished,
            (float)config.totlatency/1000);
        printf("  %d parallel clients\n", config.numclients);
        printf("  %d bytes payload\n", config.datasize);
        printf("  keep alive: %d\n", config.keepalive);
        if (config.cluster_mode) {
            printf("  cluster mode: yes (%d masters)\n",
                   config.cluster_node_count);
            int m ;
            for (m = 0; m < config.cluster_node_count; m++) {
                clusterNode *node =  config.cluster_nodes[m];
                redisConfig *cfg = node->redis_config;
                if (cfg == ((void *)0)) continue;
                printf("  node [%d] configuration:\n",m );
                printf("    save: %s\n",
                    sdslen(cfg->save) ? cfg->save : "NONE");
                printf("    appendonly: %s\n", cfg->appendonly);
            }
        } else {
            if (config.redis_config) {
                printf("  host configuration \"save\": %s\n",
                       config.redis_config->save);
                printf("  host configuration \"appendonly\": %s\n",
                       config.redis_config->appendonly);
            }
        }
        printf("  multi-thread: %s\n", (config.num_threads ? "yes" : "no"));
        if (config.num_threads)
            printf("  threads: %d\n", config.num_threads);

        printf("\n");

        qsort(config.latency,config.requests,sizeof(long long),compareLatency);
        for (i = 0; i < config.requests; i++) {
            if (config.latency[i]/usbetweenlat != curlat ||
                i == (config.requests-1))
            {
                
 
                if (config.latency[i] >= 2000) {
                    config.precision = 0;
                    usbetweenlat = ipow(10,
                        3-config.precision);
                }

                curlat = config.latency[i]/usbetweenlat;
                perc = ((float)(i+1)*100)/config.requests;
                printf("%.2f%% <= %.*f milliseconds\n", perc, config.precision,
                    curlat/pow(10.0, config.precision));
            }
        }
        printf("%.2f requests per second\n\n", reqpersec);
    } else if (config.csv) {
        printf("\"%s\",\"%.2f\"\n", config.title, reqpersec);
    } else {
        printf("%s: %.2f requests per second\n", config.title, reqpersec);
    }
}

static void initBenchmarkThreads() {
    int i;
    if (config.threads) freeBenchmarkThreads();
    config.threads = zmalloc(config.num_threads * sizeof(benchmarkThread*));
    for (i = 0; i < config.num_threads; i++) {
        benchmarkThread *thread = createBenchmarkThread(i);
        config.threads[i] = thread;
    }
}

static void startBenchmarkThreads() {
    int i;
    for (i = 0; i < config.num_threads; i++) {
        benchmarkThread *t = config.threads[i];
        if (pthread_create(&(t->thread), ((void *)0), execBenchmarkThread, t)){
            fprintf(stderr, "FATAL: Failed to start thread %d.\n", i);
            exit(1);
        }
    }
    for (i = 0; i < config.num_threads; i++)
        pthread_join(config.threads[i]->thread, ((void *)0));
}

static void benchmark(char *title, char *cmd, int len) {
    client c;

    config.title = title;
    config.requests_issued = 0;
    config.requests_finished = 0;

    if (config.num_threads) initBenchmarkThreads();

    int thread_id = config.num_threads > 0 ? 0 : -1;
    c = createClient(cmd,len,((void *)0),thread_id);
    createMissingClients(c);

    config.start = mstime();
    if (!config.num_threads) aeMain(config.el);
    else startBenchmarkThreads();
    config.totlatency = mstime()-config.start;

    showLatencyReport();
    freeAllClients();
    if (config.threads) freeBenchmarkThreads();
}

 

static benchmarkThread *createBenchmarkThread(int index) {
    benchmarkThread *thread = zmalloc(sizeof(*thread));
    if (thread == ((void *)0)) return ((void *)0);
    thread->index = index;
    thread->el = aeCreateEventLoop(1024*10);
    aeCreateTimeEvent(thread->el,1,showThroughput,((void *)0),((void *)0));
    return thread;
}

static void freeBenchmarkThread(benchmarkThread *thread) {
    if (thread->el) aeDeleteEventLoop(thread->el);
    zfree(thread);
}

static void freeBenchmarkThreads() {
    int i = 0;
    for (; i < config.num_threads; i++) {
        benchmarkThread *thread = config.threads[i];
        if (thread) freeBenchmarkThread(thread);
    }
    zfree(config.threads);
    config.threads = ((void *)0);
}

static void *execBenchmarkThread(void *ptr) {
    benchmarkThread *thread = (benchmarkThread *) ptr;
    aeMain(thread->el);
    return ((void *)0);
}

 

static clusterNode *createClusterNode(char *ip, int port) {
    clusterNode *node = zmalloc(sizeof(*node));
    if (!node) return ((void *)0);
    node->ip = ip;
    node->port = port;
    node->name = ((void *)0);
    node->flags = 0;
    node->replicate = ((void *)0);
    node->replicas_count = 0;
    node->slots = zmalloc(16384 * sizeof(int));
    node->slots_count = 0;
    node->current_slot_index = 0;
    node->updated_slots = ((void *)0);
    node->updated_slots_count = 0;
    node->migrating = ((void *)0);
    node->importing = ((void *)0);
    node->migrating_count = 0;
    node->importing_count = 0;
    node->redis_config = ((void *)0);
    return node;
}

static void freeClusterNode(clusterNode *node) {
    int i;
    if (node->name) sdsfree(node->name);
    if (node->replicate) sdsfree(node->replicate);
    if (node->migrating != ((void *)0)) {
        for (i = 0; i < node->migrating_count; i++) sdsfree(node->migrating[i]);
        zfree(node->migrating);
    }
    if (node->importing != ((void *)0)) {
        for (i = 0; i < node->importing_count; i++) sdsfree(node->importing[i]);
        zfree(node->importing);
    }
    

 
    if (node->ip && strcmp(node->ip, config.hostip) != 0) sdsfree(node->ip);
    if (node->redis_config != ((void *)0)) freeRedisConfig(node->redis_config);
    zfree(node->slots);
    zfree(node);
}

static void freeClusterNodes() {
    int i = 0;
    for (; i < config.cluster_node_count; i++) {
        clusterNode *n = config.cluster_nodes[i];
        if (n) freeClusterNode(n);
    }
    zfree(config.cluster_nodes);
    config.cluster_nodes = ((void *)0);
}

static clusterNode **addClusterNode(clusterNode *node) {
    int count = config.cluster_node_count + 1;
    config.cluster_nodes = zrealloc(config.cluster_nodes,
                                    count * sizeof(*node));
    if (!config.cluster_nodes) return ((void *)0);
    config.cluster_nodes[config.cluster_node_count++] = node;
    return config.cluster_nodes;
}

static int fetchClusterConfiguration() {
    int success = 1;
    redisContext *ctx = ((void *)0);
    redisReply *reply =  ((void *)0);
    if (config.hostsocket == ((void *)0))
        ctx = redisConnect(config.hostip,config.hostport);
    else
        ctx = redisConnectUnix(config.hostsocket);
    if (ctx->err) {
        fprintf(stderr,"Could not connect to Redis at ");
        if (config.hostsocket == ((void *)0)) {
            fprintf(stderr,"%s:%d: %s\n",config.hostip,config.hostport,
                    ctx->errstr);
        } else fprintf(stderr,"%s: %s\n",config.hostsocket,ctx->errstr);
        exit(1);
    }
    clusterNode *firstNode = createClusterNode((char *) config.hostip,
                                               config.hostport);
    if (!firstNode) {success = 0; goto cleanup;}
    reply = redisCommand(ctx, "CLUSTER NODES");
    success = (reply != ((void *)0));
    if (!success) goto cleanup;
    success = (reply->type != 6);
    if (!success) {
        if (config.hostsocket == ((void *)0)) {
            fprintf(stderr, "Cluster node %s:%d replied with error:\n%s\n",
                    config.hostip, config.hostport, reply->str);
        } else {
            fprintf(stderr, "Cluster node %s replied with error:\n%s\n",
                    config.hostsocket, reply->str);
        }
        goto cleanup;
    }
    char *lines = reply->str, *p, *line;
    while ((p = strstr(lines, "\n")) != ((void *)0)) {
        *p = '\0';
        line = lines;
        lines = p + 1;
        char *name = ((void *)0), *addr = ((void *)0), *flags = ((void *)0), *master_id = ((void *)0);
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
            }
            if (i == 8) break; 
        }
        if (!flags) {
            fprintf(stderr, "Invalid CLUSTER NODES reply: missing flags.\n");
            success = 0;
            goto cleanup;
        }
        int myself = (strstr(flags, "myself") != ((void *)0));
        int is_replica = (strstr(flags, "slave") != ((void *)0) ||
                         (master_id != ((void *)0) && master_id[0] != '-'));
        if (is_replica) continue;
        if (addr == ((void *)0)) {
            fprintf(stderr, "Invalid CLUSTER NODES reply: missing addr.\n");
            success = 0;
            goto cleanup;
        }
        clusterNode *node = ((void *)0);
        char *ip = ((void *)0);
        int port = 0;
        char *paddr = strchr(addr, ':');
        if (paddr != ((void *)0)) {
            *paddr = '\0';
            ip = addr;
            addr = paddr + 1;
             
            if ((paddr = strchr(addr, '@')) != ((void *)0)) *paddr = '\0';
            port = atoi(addr);
        }
        if (myself) {
            node = firstNode;
            if (node->ip == ((void *)0) && ip != ((void *)0)) {
                node->ip = ip;
                node->port = port;
            }
        } else {
            node = createClusterNode(sdsnew(ip), port);
        }
        if (node == ((void *)0)) {
            success = 0;
            goto cleanup;
        }
        if (name != ((void *)0)) node->name = sdsnew(name);
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
                        node->migrating =
                            zrealloc(node->migrating,
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
                    while (start <= stop) {
                        int slot = start++;
                        node->slots[node->slots_count++] = slot;
                    }
                } else if (p > slotsdef) {
                    int slot = atoi(slotsdef);
                    node->slots[node->slots_count++] = slot;
                }
            }
        }
        if (node->slots_count == 0) {
            printf("WARNING: master node %s:%d has no slots, skipping...\n",
                   node->ip, node->port);
            continue;
        }
        if (!addClusterNode(node)) {
            success = 0;
            goto cleanup;
        }
    }
cleanup:
    if (ctx) redisFree(ctx);
    if (!success) {
        if (config.cluster_nodes) freeClusterNodes();
    }
    if (reply) freeReplyObject(reply);
    return success;
}


 
static int fetchClusterSlotsConfiguration(client c) {
    ((void) c);
    int success = 1, is_fetching_slots = 0, last_update = 0;
    size_t i;
    do { last_update = (({ typeof(*(&config . slots_last_update)) __csonar_gcc_atomic_val; csonar_mutex_acquire( __csonar_gcc_atomic_mutex ); __csonar_gcc_atomic_val = (*(&config . slots_last_update)); csonar_mutex_release( __csonar_gcc_atomic_mutex ); (void)__csonar_gcc_atomic_val; __csonar_gcc_atomic_val; })); } while(0);
    if (c->slots_last_update < last_update) {
        c->slots_last_update = last_update;
        return -1;
    }
    redisReply *reply = ((void *)0);
    do { is_fetching_slots = (({ typeof(({ typeof(&config . is_fetching_slots) __csonar_ptr = (&config . is_fetching_slots); typeof(*__csonar_ptr) __csonar_old = *__csonar_ptr; *__csonar_ptr += ((1)); __csonar_old; })) __csonar_gcc_atomic_val; csonar_mutex_acquire( __csonar_gcc_atomic_mutex ); __csonar_gcc_atomic_val = (({ typeof(&config . is_fetching_slots) __csonar_ptr = (&config . is_fetching_slots); typeof(*__csonar_ptr) __csonar_old = *__csonar_ptr; *__csonar_ptr += ((1)); __csonar_old; })); csonar_mutex_release( __csonar_gcc_atomic_mutex ); (void)__csonar_gcc_atomic_val; __csonar_gcc_atomic_val; })); } while(0);
    if (is_fetching_slots) return -1; 
    (((void)({ typeof(*(&config . is_fetching_slots) = (1)) __csonar_gcc_atomic_val; csonar_mutex_acquire( __csonar_gcc_atomic_mutex ); __csonar_gcc_atomic_val = (*(&config . is_fetching_slots) = (1)); csonar_mutex_release( __csonar_gcc_atomic_mutex ); (void)__csonar_gcc_atomic_val; __csonar_gcc_atomic_val; })));
    if (config.showerrors)
        printf("Cluster slots configuration changed, fetching new one...\n");
    const char *errmsg = "Failed to update cluster slots configuration";
    static dictType dtype = {
        dictSdsHash,                
        ((void *)0),                       
        ((void *)0),                       
        dictSdsKeyCompare,          
        ((void *)0),                       
        ((void *)0)                        
    };
     
    dict *masters = dictCreate(&dtype, ((void *)0));
    redisContext *ctx = ((void *)0);
    for (i = 0; i < (size_t) config.cluster_node_count; i++) {
        clusterNode *node = config.cluster_nodes[i];
        ((node ->ip != ((void *)0)) ? (void) (0) : __assert_fail ("node->ip != NULL", "redis-benchmark.c", 1179, __extension__ __PRETTY_FUNCTION__));
        ((node ->name != ((void *)0)) ? (void) (0) : __assert_fail ("node->name != NULL", "redis-benchmark.c", 1180, __extension__ __PRETTY_FUNCTION__));
        ((node ->port) ? (void) (0) : __assert_fail ("node->port", "redis-benchmark.c", 1181, __extension__ __PRETTY_FUNCTION__));
         
        if (ctx == ((void *)0)) {
            ctx = redisConnect(node->ip, node->port);
            if (!ctx || ctx->err) {
                success = 0;
                if (ctx && ctx->err)
                    fprintf(stderr, "REDIS CONNECTION ERROR: %s\n", ctx->errstr);
                goto cleanup;
            }
        }
        if (node->updated_slots != ((void *)0))
            zfree(node->updated_slots);
        node->updated_slots = ((void *)0);
        node->updated_slots_count = 0;
        dictReplace(masters, node->name, node) ;
    }
    reply = redisCommand(ctx, "CLUSTER SLOTS");
    if (reply == ((void *)0) || reply->type == 6) {
        success = 0;
        if (reply)
            fprintf(stderr,"%s\nCLUSTER SLOTS ERROR: %s\n",errmsg,reply->str);
        goto cleanup;
    }
    ((reply->type == 2) ? (void) (0) : __assert_fail ("reply->type == REDIS_REPLY_ARRAY", "redis-benchmark.c", 1205, __extension__ __PRETTY_FUNCTION__));
    for (i = 0; i < reply->elements; i++) {
        redisReply *r = reply->element[i];
        ((r->type == 2) ? (void) (0) : __assert_fail ("r->type == REDIS_REPLY_ARRAY", "redis-benchmark.c", 1208, __extension__ __PRETTY_FUNCTION__));
        ((r->elements >= 3) ? (void) (0) : __assert_fail ("r->elements >= 3", "redis-benchmark.c", 1209, __extension__ __PRETTY_FUNCTION__));
        int from, to, slot;
        from = r->element[0]->integer;
        to = r->element[1]->integer;
        redisReply *nr =  r->element[2];
        ((nr->type == 2 && nr->elements >= 3) ? (void) (0) : __assert_fail ("nr->type == REDIS_REPLY_ARRAY && nr->elements >= 3", "redis-benchmark.c", 1214, __extension__ __PRETTY_FUNCTION__));
        ((nr->element[2]->str != ((void *)0)) ? (void) (0) : __assert_fail ("nr->element[2]->str != NULL", "redis-benchmark.c", 1215, __extension__ __PRETTY_FUNCTION__));
        sds name =  sdsnew(nr->element[2]->str);
        dictEntry *entry = dictFind(masters, name);
        if (entry == ((void *)0)) {
            success = 0;
            fprintf(stderr, "%s: could not find node with ID %s in current "
                            "configuration.\n", errmsg, name);
            if (name) sdsfree(name);
            goto cleanup;
        }
        sdsfree(name);
        clusterNode *node = ((entry)->v . val);
        if (node->updated_slots == ((void *)0))
            node->updated_slots = zcalloc(16384 * sizeof(int));
        for (slot = from; slot <= to; slot++)
            node->updated_slots[node->updated_slots_count++] = slot;
    }
    updateClusterSlotsConfiguration();
cleanup:
    freeReplyObject(reply);
    redisFree(ctx);
    dictRelease(masters);
    (((void)({ typeof(*(&config . is_fetching_slots) = (0)) __csonar_gcc_atomic_val; csonar_mutex_acquire( __csonar_gcc_atomic_mutex ); __csonar_gcc_atomic_val = (*(&config . is_fetching_slots) = (0)); csonar_mutex_release( __csonar_gcc_atomic_mutex ); (void)__csonar_gcc_atomic_val; __csonar_gcc_atomic_val; })));
    return success;
}

 
static void updateClusterSlotsConfiguration() {
    pthread_mutex_lock(&config.is_updating_slots_mutex);
    (((void)({ typeof(*(&config . is_updating_slots) = (1)) __csonar_gcc_atomic_val; csonar_mutex_acquire( __csonar_gcc_atomic_mutex ); __csonar_gcc_atomic_val = (*(&config . is_updating_slots) = (1)); csonar_mutex_release( __csonar_gcc_atomic_mutex ); (void)__csonar_gcc_atomic_val; __csonar_gcc_atomic_val; })));
    int i;
    for (i = 0; i < config.cluster_node_count; i++) {
        clusterNode *node = config.cluster_nodes[i];
        if (node->updated_slots != ((void *)0)) {
            int *oldslots = node->slots;
            node->slots = node->updated_slots;
            node->slots_count = node->updated_slots_count;
            node->current_slot_index = 0;
            node->updated_slots = ((void *)0);
            node->updated_slots_count = 0;
            zfree(oldslots);
        }
    }
    (((void)({ typeof(*(&config . is_updating_slots) = (0)) __csonar_gcc_atomic_val; csonar_mutex_acquire( __csonar_gcc_atomic_mutex ); __csonar_gcc_atomic_val = (*(&config . is_updating_slots) = (0)); csonar_mutex_release( __csonar_gcc_atomic_mutex ); (void)__csonar_gcc_atomic_val; __csonar_gcc_atomic_val; })));
    (({ typeof(({ typeof(&config . slots_last_update) __csonar_ptr = (&config . slots_last_update); *__csonar_ptr += ((1)); *__csonar_ptr; })) __csonar_gcc_atomic_val; csonar_mutex_acquire( __csonar_gcc_atomic_mutex ); __csonar_gcc_atomic_val = (({ typeof(&config . slots_last_update) __csonar_ptr = (&config . slots_last_update); *__csonar_ptr += ((1)); *__csonar_ptr; })); csonar_mutex_release( __csonar_gcc_atomic_mutex ); (void)__csonar_gcc_atomic_val; __csonar_gcc_atomic_val; }));
    pthread_mutex_unlock(&config.is_updating_slots_mutex);
}

 
int parseOptions(int argc, const char **argv) {
    int i;
    int lastarg;
    int exit_status = 1;

    for (i = 1; i < argc; i++) {
        lastarg = (i == (argc-1));

        if (!strcmp(argv[i],"-c")) {
            if (lastarg) goto invalid;
            config.numclients = atoi(argv[++i]);
        } else if (!strcmp(argv[i],"-n")) {
            if (lastarg) goto invalid;
            config.requests = atoi(argv[++i]);
        } else if (!strcmp(argv[i],"-k")) {
            if (lastarg) goto invalid;
            config.keepalive = atoi(argv[++i]);
        } else if (!strcmp(argv[i],"-h")) {
            if (lastarg) goto invalid;
            config.hostip = strdup(argv[++i]);
        } else if (!strcmp(argv[i],"-p")) {
            if (lastarg) goto invalid;
            config.hostport = atoi(argv[++i]);
        } else if (!strcmp(argv[i],"-s")) {
            if (lastarg) goto invalid;
            config.hostsocket = strdup(argv[++i]);
        } else if (!strcmp(argv[i],"-a") ) {
            if (lastarg) goto invalid;
            config.auth = strdup(argv[++i]);
        } else if (!strcmp(argv[i],"-d")) {
            if (lastarg) goto invalid;
            config.datasize = atoi(argv[++i]);
            if (config.datasize < 1) config.datasize=1;
            if (config.datasize > 1024*1024*1024) config.datasize = 1024*1024*1024;
        } else if (!strcmp(argv[i],"-P")) {
            if (lastarg) goto invalid;
            config.pipeline = atoi(argv[++i]);
            if (config.pipeline <= 0) config.pipeline=1;
        } else if (!strcmp(argv[i],"-r")) {
            if (lastarg) goto invalid;
            const char *next = argv[++i], *p = next;
            if (*p == '-') {
                p++;
                if (*p < '0' || *p > '9') goto invalid;
            }
            config.randomkeys = 1;
            config.randomkeys_keyspacelen = atoi(next);
            if (config.randomkeys_keyspacelen < 0)
                config.randomkeys_keyspacelen = 0;
        } else if (!strcmp(argv[i],"-q")) {
            config.quiet = 1;
        } else if (!strcmp(argv[i],"--csv")) {
            config.csv = 1;
        } else if (!strcmp(argv[i],"-l")) {
            config.loop = 1;
        } else if (!strcmp(argv[i],"-I")) {
            config.idlemode = 1;
        } else if (!strcmp(argv[i],"-e")) {
            config.showerrors = 1;
        } else if (!strcmp(argv[i],"-t")) {
            if (lastarg) goto invalid;
            



 
            config.tests = sdsnew(",");
            config.tests = sdscat(config.tests,(char*)argv[++i]);
            config.tests = sdscat(config.tests,",");
            sdstolower(config.tests);
        } else if (!strcmp(argv[i],"--dbnum")) {
            if (lastarg) goto invalid;
            config.dbnum = atoi(argv[++i]);
            config.dbnumstr = sdsfromlonglong(config.dbnum);
        } else if (!strcmp(argv[i],"--precision")) {
            if (lastarg) goto invalid;
            config.precision = atoi(argv[++i]);
            if (config.precision < 0) config.precision = 0;
            if (config.precision > 3) config.precision = 3;
        } else if (!strcmp(argv[i],"--threads")) {
             if (lastarg) goto invalid;
             config.num_threads = atoi(argv[++i]);
             if (config.num_threads > 500) {
                printf("WARNING: too many threads, limiting threads to %d.\n",
                       500);
                config.num_threads = 500;
             } else if (config.num_threads < 0) config.num_threads = 0;
        } else if (!strcmp(argv[i],"--cluster")) {
            config.cluster_mode = 1;
        } else if (!strcmp(argv[i],"--help")) {
            exit_status = 0;
            goto usage;
        } else {
            

 
            if (argv[i][0] == '-') goto invalid;
            return i;
        }
    }

    return i;

invalid:
    printf("Invalid option \"%s\" or option argument missing\n\n",argv[i]);

usage:
    printf(
"Usage: redis-benchmark [-h <host>] [-p <port>] [-c <clients>] [-n <requests>] [-k <boolean>]\n\n"
" -h <hostname>      Server hostname (default 127.0.0.1)\n"
" -p <port>          Server port (default 6379)\n"
" -s <socket>        Server socket (overrides host and port)\n"
" -a <password>      Password for Redis Auth\n"
" -c <clients>       Number of parallel connections (default 50)\n"
" -n <requests>      Total number of requests (default 100000)\n"
" -d <size>          Data size of SET/GET value in bytes (default 3)\n"
" --dbnum <db>       SELECT the specified db number (default 0)\n"
" --threads <num>    Enable multi-thread mode.\n"
" --cluster          Enable cluster mode.\n"
" -k <boolean>       1=keep alive 0=reconnect (default 1)\n"
" -r <keyspacelen>   Use random keys for SET/GET/INCR, random values for SADD\n"
"  Using this option the benchmark will expand the string __rand_int__\n"
"  inside an argument with a 12 digits number in the specified range\n"
"  from 0 to keyspacelen-1. The substitution changes every time a command\n"
"  is executed. Default tests use this to hit random keys in the\n"
"  specified range.\n"
" -P <numreq>        Pipeline <numreq> requests. Default 1 (no pipeline).\n"
" -e                 If server replies with errors, show them on stdout.\n"
"                    (no more than 1 error per second is displayed)\n"
" -q                 Quiet. Just show query/sec values\n"
" --precision        Number of decimal places to display in latency output (default 0)\n"
" --csv              Output in CSV format\n"
" -l                 Loop. Run the tests forever\n"
" -t <tests>         Only run the comma separated list of tests. The test\n"
"                    names are the same as the ones produced as output.\n"
" -I                 Idle mode. Just open N idle connections and wait.\n\n"
"Examples:\n\n"
" Run the benchmark with the default configuration against 127.0.0.1:6379:\n"
"   $ redis-benchmark\n\n"
" Use 20 parallel clients, for a total of 100k requests, against 192.168.1.1:\n"
"   $ redis-benchmark -h 192.168.1.1 -p 6379 -n 100000 -c 20\n\n"
" Fill 127.0.0.1:6379 with about 1 million keys only using the SET test:\n"
"   $ redis-benchmark -t set -n 1000000 -r 100000000\n\n"
" Benchmark 127.0.0.1:6379 for a few commands producing CSV output:\n"
"   $ redis-benchmark -t ping,set,get -n 100000 --csv\n\n"
" Benchmark a specific command line:\n"
"   $ redis-benchmark -r 10000 -n 10000 eval 'return redis.call(\"ping\")' 0\n\n"
" Fill a list with 10000 random elements:\n"
"   $ redis-benchmark -r 10000 -n 10000 lpush mylist __rand_int__\n\n"
" On user specified command lines __rand_int__ is replaced with a random integer\n"
" with a range of values selected by the -r option.\n"
    );
    exit(exit_status);
}

int showThroughput(struct aeEventLoop *eventLoop, long long id, void *clientData) {
    ((void) eventLoop);
    ((void) id);
    ((void) clientData);
    int liveclients = 0;
    int requests_finished = 0;
    do { liveclients = (({ typeof(*(&config . liveclients)) __csonar_gcc_atomic_val; csonar_mutex_acquire( __csonar_gcc_atomic_mutex ); __csonar_gcc_atomic_val = (*(&config . liveclients)); csonar_mutex_release( __csonar_gcc_atomic_mutex ); (void)__csonar_gcc_atomic_val; __csonar_gcc_atomic_val; })); } while(0);
    do { requests_finished = (({ typeof(*(&config . requests_finished)) __csonar_gcc_atomic_val; csonar_mutex_acquire( __csonar_gcc_atomic_mutex ); __csonar_gcc_atomic_val = (*(&config . requests_finished)); csonar_mutex_release( __csonar_gcc_atomic_mutex ); (void)__csonar_gcc_atomic_val; __csonar_gcc_atomic_val; })); } while(0);

    if (liveclients == 0 && requests_finished != config.requests) {
        fprintf(stderr,"All clients disconnected... aborting.\n");
        exit(1);
    }
    if (config.num_threads && requests_finished >= config.requests) {
        aeStop(eventLoop);
        return -1;
    }
    if (config.csv) return 250;
    if (config.idlemode == 1) {
        printf("clients: %d\r", config.liveclients);
        fflush(stdout);
	return 250;
    }
    float dt = (float)(mstime()-config.start)/1000.0;
    float rps = (float)requests_finished/dt;
    printf("%s: %.2f\r", config.title, rps);
    fflush(stdout);
    return 250;  
}


 
int test_is_selected(char *name) {
    char buf[256];
    int l = strlen(name);

    if (config.tests == ((void *)0)) return 1;
    buf[0] = ',';
    memcpy(buf+1,name,l);
    buf[l+1] = ',';
    buf[l+2] = '\0';
    return strstr(config.tests,buf) != ((void *)0);
}

int main(int argc, const char **argv) {
    int i;
    char *data, *cmd;
    int len;

    client c;

    srandom(time(((void *)0)));
    signal(1, ((__sighandler_t) 1));
    signal(13, ((__sighandler_t) 1));

    config.numclients = 50;
    config.requests = 100000;
    config.liveclients = 0;
    config.el = aeCreateEventLoop(1024*10);
    aeCreateTimeEvent(config.el,1,showThroughput,((void *)0),((void *)0));
    config.keepalive = 1;
    config.datasize = 3;
    config.pipeline = 1;
    config.showerrors = 0;
    config.randomkeys = 0;
    config.randomkeys_keyspacelen = 0;
    config.quiet = 0;
    config.csv = 0;
    config.loop = 0;
    config.idlemode = 0;
    config.latency = ((void *)0);
    config.clients = listCreate();
    config.hostip = "127.0.0.1";
    config.hostport = 6379;
    config.hostsocket = ((void *)0);
    config.tests = ((void *)0);
    config.dbnum = 0;
    config.auth = ((void *)0);
    config.precision = 1;
    config.num_threads = 0;
    config.threads = ((void *)0);
    config.cluster_mode = 0;
    config.cluster_node_count = 0;
    config.cluster_nodes = ((void *)0);
    config.redis_config = ((void *)0);
    config.is_fetching_slots = 0;
    config.is_updating_slots = 0;
    config.slots_last_update = 0;

    i = parseOptions(argc,argv);
    argc -= i;
    argv += i;

    config.latency = zmalloc(sizeof(long long)*config.requests);

    if (config.cluster_mode) {
         
        if (!fetchClusterConfiguration() || !config.cluster_nodes) {
            if (!config.hostsocket) {
                fprintf(stderr, "Failed to fetch cluster configuration from "
                                "%s:%d\n", config.hostip, config.hostport);
            } else {
                fprintf(stderr, "Failed to fetch cluster configuration from "
                                "%s\n", config.hostsocket);
            }
            exit(1);
        }
        if (config.cluster_node_count <= 1) {
            fprintf(stderr, "Invalid cluster: %d node(s).\n",
                    config.cluster_node_count);
            exit(1);
        }
        printf("Cluster has %d master nodes:\n\n", config.cluster_node_count);
        int i = 0;
        for (; i < config.cluster_node_count; i++) {
            clusterNode *node = config.cluster_nodes[i];
            if (!node) {
                fprintf(stderr, "Invalid cluster node #%d\n", i);
                exit(1);
            }
            printf("Master %d: ", i);
            if (node->name) printf("%s ", node->name);
            printf("%s:%d\n", node->ip, node->port);
            node->redis_config = getRedisConfig(node->ip, node->port, ((void *)0));
            if (node->redis_config == ((void *)0)) exit(1);
        }
        printf("\n");
        
 
        if (config.num_threads == 0)
            config.num_threads = config.cluster_node_count;
    } else {
        config.redis_config =
            getRedisConfig(config.hostip, config.hostport, config.hostsocket);
        if (config.redis_config == ((void *)0)) exit(1);
    }

    if (config.num_threads > 0) {
        pthread_mutex_init(&(config.requests_issued_mutex), ((void *)0));
        pthread_mutex_init(&(config.requests_finished_mutex), ((void *)0));
        pthread_mutex_init(&(config.liveclients_mutex), ((void *)0));
        pthread_mutex_init(&(config.is_fetching_slots_mutex), ((void *)0));
        pthread_mutex_init(&(config.is_updating_slots_mutex), ((void *)0));
        pthread_mutex_init(&(config.updating_slots_mutex), ((void *)0));
        pthread_mutex_init(&(config.slots_last_update_mutex), ((void *)0));
    }

    if (config.keepalive == 0) {
        printf("WARNING: keepalive disabled, you probably need 'echo 1 > /proc/sys/net/ipv4/tcp_tw_reuse' for Linux and 'sudo sysctl -w net.inet.tcp.msl=1000' for Mac OS X in order to use a lot of clients/requests\n");
    }

    if (config.idlemode) {
        printf("Creating %d idle connections and waiting forever (Ctrl+C when done)\n", config.numclients);
        int thread_id = -1, use_threads = (config.num_threads > 0);
        if (use_threads) {
            thread_id = 0;
            initBenchmarkThreads();
        }
        c = createClient("",0,((void *)0),thread_id);  
        createMissingClients(c);
        if (use_threads) startBenchmarkThreads();
        else aeMain(config.el);
         
    }

     
    if (argc) {
        sds title = sdsnew(argv[0]);
        for (i = 1; i < argc; i++) {
            title = sdscatlen(title, " ", 1);
            title = sdscatlen(title, (char*)argv[i], strlen(argv[i]));
        }

        do {
            len = redisFormatCommandArgv(&cmd,argc,argv,((void *)0));
            benchmark(title,cmd,len);
            free(cmd);
        } while(config.loop);

        if (config.redis_config != ((void *)0)) freeRedisConfig(config.redis_config);
        return 0;
    }

     
    data = zmalloc(config.datasize+1);
    do {
        memset(data,'x',config.datasize);
        data[config.datasize] = '\0';

        if (test_is_selected("ping_inline") || test_is_selected("ping"))
            benchmark("PING_INLINE","PING\r\n",6);

        if (test_is_selected("ping_mbulk") || test_is_selected("ping")) {
            len = redisFormatCommand(&cmd,"PING");
            benchmark("PING_BULK",cmd,len);
            free(cmd);
        }

        if (test_is_selected("set")) {
            len = redisFormatCommand(&cmd,"SET key:{tag}:__rand_int__ %s",data);
            benchmark("SET",cmd,len);
            free(cmd);
        }

        if (test_is_selected("get")) {
            len = redisFormatCommand(&cmd,"GET key:{tag}:__rand_int__");
            benchmark("GET",cmd,len);
            free(cmd);
        }

        if (test_is_selected("incr")) {
            len = redisFormatCommand(&cmd,"INCR counter:{tag}:__rand_int__");
            benchmark("INCR",cmd,len);
            free(cmd);
        }

        if (test_is_selected("lpush")) {
            len = redisFormatCommand(&cmd,"LPUSH mylist:{tag} %s",data);
            benchmark("LPUSH",cmd,len);
            free(cmd);
        }

        if (test_is_selected("rpush")) {
            len = redisFormatCommand(&cmd,"RPUSH mylist:{tag} %s",data);
            benchmark("RPUSH",cmd,len);
            free(cmd);
        }

        if (test_is_selected("lpop")) {
            len = redisFormatCommand(&cmd,"LPOP mylist:{tag}");
            benchmark("LPOP",cmd,len);
            free(cmd);
        }

        if (test_is_selected("rpop")) {
            len = redisFormatCommand(&cmd,"RPOP mylist:{tag}");
            benchmark("RPOP",cmd,len);
            free(cmd);
        }

        if (test_is_selected("sadd")) {
            len = redisFormatCommand(&cmd,
                "SADD myset:{tag} element:__rand_int__");
            benchmark("SADD",cmd,len);
            free(cmd);
        }

        if (test_is_selected("hset")) {
            len = redisFormatCommand(&cmd,
                "HSET myhash:{tag}:__rand_int__ element:__rand_int__ %s",data);
            benchmark("HSET",cmd,len);
            free(cmd);
        }

        if (test_is_selected("spop")) {
            len = redisFormatCommand(&cmd,"SPOP myset:{tag}");
            benchmark("SPOP",cmd,len);
            free(cmd);
        }

        if (test_is_selected("lrange") ||
            test_is_selected("lrange_100") ||
            test_is_selected("lrange_300") ||
            test_is_selected("lrange_500") ||
            test_is_selected("lrange_600"))
        {
            len = redisFormatCommand(&cmd,"LPUSH mylist:{tag} %s",data);
            benchmark("LPUSH (needed to benchmark LRANGE)",cmd,len);
            free(cmd);
        }

        if (test_is_selected("lrange") || test_is_selected("lrange_100")) {
            len = redisFormatCommand(&cmd,"LRANGE mylist:{tag} 0 99");
            benchmark("LRANGE_100 (first 100 elements)",cmd,len);
            free(cmd);
        }

        if (test_is_selected("lrange") || test_is_selected("lrange_300")) {
            len = redisFormatCommand(&cmd,"LRANGE mylist:{tag} 0 299");
            benchmark("LRANGE_300 (first 300 elements)",cmd,len);
            free(cmd);
        }

        if (test_is_selected("lrange") || test_is_selected("lrange_500")) {
            len = redisFormatCommand(&cmd,"LRANGE mylist:{tag} 0 449");
            benchmark("LRANGE_500 (first 450 elements)",cmd,len);
            free(cmd);
        }

        if (test_is_selected("lrange") || test_is_selected("lrange_600")) {
            len = redisFormatCommand(&cmd,"LRANGE mylist:{tag} 0 599");
            benchmark("LRANGE_600 (first 600 elements)",cmd,len);
            free(cmd);
        }

        if (test_is_selected("mset")) {
            const char *argv[21];
            argv[0] = "MSET";
            for (i = 1; i < 21; i += 2) {
                argv[i] = "key:{tag}:__rand_int__";
                argv[i+1] = data;
            }
            len = redisFormatCommandArgv(&cmd,21,argv,((void *)0));
            benchmark("MSET (10 keys)",cmd,len);
            free(cmd);
        }

        if (!config.csv) printf("\n");
    } while(config.loop);

    if (config.redis_config != ((void *)0)) freeRedisConfig(config.redis_config);

    return 0;
}
