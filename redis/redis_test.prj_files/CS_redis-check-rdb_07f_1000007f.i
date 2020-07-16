# 1 "redis-check-rdb.c"
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

# 1 "redis-check-rdb.c"



























 

# 1 "server.h"



























 


#define __REDIS_H

# 1 "fmacros.h"



























 


#define _REDIS_FMACRO_H

#define _BSD_SOURCE


#define _GNU_SOURCE
#define _DEFAULT_SOURCE







#define _XOPEN_SOURCE 700



 








#define _LARGEFILE_SOURCE
#define _FILE_OFFSET_BITS 64

# 34 "server.h"
# 1 "config.h"



























 


#define __CONFIG_H





# 1 "/usr/include/linux/version.h"
#define LINUX_VERSION_CODE 266002
#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))
# 39 "config.h"
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


# 40 "config.h"


 




#define redis_fstat fstat
#define redis_stat stat


 

#define HAVE_PROC_STAT 1
#define HAVE_PROC_MAPS 1
#define HAVE_PROC_SMAPS 1
#define HAVE_PROC_SOMAXCONN 1


 




 



#define HAVE_BACKTRACE 1


 

#define HAVE_MSG_NOSIGNAL 1


 

#define HAVE_EPOLL 1






# 91 "config.h"

 

#define redis_fsync fdatasync





 



#define HAVE_SYNC_FILE_RANGE 1
# 112 "config.h"


#define rdb_fsync_range(fd,off,size) sync_file_range(fd,off,size,SYNC_FILE_RANGE_WAIT_BEFORE|SYNC_FILE_RANGE_WRITE)






 





#define USE_SETPROCTITLE
#define INIT_SETPROCTITLE_REPLACEMENT
void spt_init(int argc, char *argv[]);
void setproctitle(const char *fmt, ...);


 
# 1 "/usr/include/x86_64-linux-gnu/sys/types.h"















 



 


#define	_SYS_TYPES_H	1





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

# 30 "/usr/include/x86_64-linux-gnu/sys/types.h"



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






typedef __off64_t off_t;

# define __off_t_defined


typedef __off64_t off64_t;
# define __off64_t_defined



typedef __pid_t pid_t;
# define __pid_t_defined




typedef __id_t id_t;
# define __id_t_defined



typedef __ssize_t ssize_t;
# define __ssize_t_defined




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




# 135 "config.h"

# 166 "config.h"




 
# 188 "config.h"

# 198 "config.h"


#define GNUC_VERSION (__GNUC__ * 10000 + __GNUC_MINOR__ * 100 + __GNUC_PATCHLEVEL__)





#define HAVE_ATOMIC





 
# 219 "config.h"

 








# 35 "server.h"
# 1 "solarisfixes.h"




























 

# 36 "server.h"
# 1 "rio.h"




























 



#define __REDIS_RIO_H

# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stdio.h"










 

 
# 1 "/usr/include/stdio.h"
















 



 


#define _STDIO_H	1

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
# 28 "/usr/include/stdio.h"



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
# 34 "/usr/include/stdio.h"

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






# 68 "/usr/include/stdio.h"

# 75 "/usr/include/stdio.h"

 



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

# 36 "rio.h"
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


 


typedef long int		intptr_t;
#  define __intptr_t_defined

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
# 37 "rio.h"
# 1 "sds.h"






























 


#define __SDS_H

#define SDS_MAX_PREALLOC (1024*1024)
const char *SDS_NOINIT;

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
# 41 "sds.h"


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
#define SDS_HDR_VAR(T,s) struct sdshdr##T *sh = (void*)((s)-(sizeof(struct sdshdr##T)));
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
            struct sdshdr8 *sh = (void*)((s)-(sizeof(struct sdshdr8)));;
            return sh->alloc - sh->len;
        }
        case 2: {
            struct sdshdr16 *sh = (void*)((s)-(sizeof(struct sdshdr16)));;
            return sh->alloc - sh->len;
        }
        case 3: {
            struct sdshdr32 *sh = (void*)((s)-(sizeof(struct sdshdr32)));;
            return sh->alloc - sh->len;
        }
        case 4: {
            struct sdshdr64 *sh = (void*)((s)-(sizeof(struct sdshdr64)));;
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
void sdsrange(sds s, ssize_t start, ssize_t end);
void sdsupdatelen(sds s);
void sdsclear(sds s);
int sdscmp(const sds s1, const sds s2);
sds *sdssplitlen(const char *s, ssize_t len, const char *sep, int seplen, int *count);
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
void sdsIncrLen(sds s, ssize_t incr);
sds sdsRemoveFreeSpace(sds s);
size_t sdsAllocSize(sds s);
void *sdsAllocPtr(sds s);




 
void *sds_malloc(size_t size);
void *sds_realloc(void *ptr, size_t size);
void sds_free(void *ptr);





# 38 "rio.h"

struct _rio {
    

 
    size_t (*read)(struct _rio *, void *buf, size_t len);
    size_t (*write)(struct _rio *, const void *buf, size_t len);
    off_t (*tell)(struct _rio *);
    int (*flush)(struct _rio *);
    



 
    void (*update_cksum)(struct _rio *, const void *buf, size_t len);

     
    uint64_t cksum;

     
    size_t processed_bytes;

     
    size_t max_processing_chunk;

     
    union {
         
        struct {
            sds ptr;
            off_t pos;
        } buffer;
         
        struct {
            FILE *fp;
            off_t buffered;  
            off_t autosync;  
        } file;
         
        struct {
            int *fds;        
            int *state;      
            int numfds;
            off_t pos;
            sds buf;
        } fdset;
    } io;
};

typedef struct _rio rio;



 

static inline size_t rioWrite(rio *r, const void *buf, size_t len) {
    while (len) {
        size_t bytes_to_write = (r->max_processing_chunk && r->max_processing_chunk < len) ? r->max_processing_chunk : len;
        if (r->update_cksum) r->update_cksum(r,buf,bytes_to_write);
        if (r->write(r,buf,bytes_to_write) == 0)
            return 0;
        buf = (char*)buf + bytes_to_write;
        len -= bytes_to_write;
        r->processed_bytes += bytes_to_write;
    }
    return 1;
}

static inline size_t rioRead(rio *r, void *buf, size_t len) {
    while (len) {
        size_t bytes_to_read = (r->max_processing_chunk && r->max_processing_chunk < len) ? r->max_processing_chunk : len;
        if (r->read(r,buf,bytes_to_read) == 0)
            return 0;
        if (r->update_cksum) r->update_cksum(r,buf,bytes_to_read);
        buf = (char*)buf + bytes_to_read;
        len -= bytes_to_read;
        r->processed_bytes += bytes_to_read;
    }
    return 1;
}

static inline off_t rioTell(rio *r) {
    return r->tell(r);
}

static inline int rioFlush(rio *r) {
    return r->flush(r);
}

void rioInitWithFile(rio *r, FILE *fp);
void rioInitWithBuffer(rio *r, sds s);
void rioInitWithFdset(rio *r, int *fds, int numfds);

void rioFreeFdset(rio *r);

size_t rioWriteBulkCount(rio *r, char prefix, long count);
size_t rioWriteBulkString(rio *r, const char *buf, size_t len);
size_t rioWriteBulkLongLong(rio *r, long long l);
size_t rioWriteBulkDouble(rio *r, double d);

struct redisObject;
int rioWriteBulkObject(rio *r, struct redisObject *obj);

void rioGenericUpdateChecksum(rio *r, const void *buf, size_t len);
void rioSetAutoSync(rio *r, off_t bytes);

# 37 "server.h"

# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stdio.h"










 

 






 
# 39 "server.h"
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

# 273 "/usr/include/stdlib.h"

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







# 40 "server.h"
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




# 41 "server.h"
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




# 42 "server.h"
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



 

# 43 "server.h"
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












# 274 "/usr/include/unistd.h"



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




# 44 "server.h"
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
# 45 "server.h"
# 1 "/usr/include/inttypes.h"















 



 


#define _INTTYPES_H	1


 


 




typedef int __gwchar_t;





# define ____gwchar_t_defined	1



#  define __PRI64_PREFIX	"l"
#  define __PRIPTR_PREFIX	"l"





 

 
# define PRId8		"d"
# define PRId16		"d"
# define PRId32		"d"
# define PRId64		__PRI64_PREFIX "d"

# define PRIdLEAST8	"d"
# define PRIdLEAST16	"d"
# define PRIdLEAST32	"d"
# define PRIdLEAST64	__PRI64_PREFIX "d"

# define PRIdFAST8	"d"
# define PRIdFAST16	__PRIPTR_PREFIX "d"
# define PRIdFAST32	__PRIPTR_PREFIX "d"
# define PRIdFAST64	__PRI64_PREFIX "d"


# define PRIi8		"i"
# define PRIi16		"i"
# define PRIi32		"i"
# define PRIi64		__PRI64_PREFIX "i"

# define PRIiLEAST8	"i"
# define PRIiLEAST16	"i"
# define PRIiLEAST32	"i"
# define PRIiLEAST64	__PRI64_PREFIX "i"

# define PRIiFAST8	"i"
# define PRIiFAST16	__PRIPTR_PREFIX "i"
# define PRIiFAST32	__PRIPTR_PREFIX "i"
# define PRIiFAST64	__PRI64_PREFIX "i"

 
# define PRIo8		"o"
# define PRIo16		"o"
# define PRIo32		"o"
# define PRIo64		__PRI64_PREFIX "o"

# define PRIoLEAST8	"o"
# define PRIoLEAST16	"o"
# define PRIoLEAST32	"o"
# define PRIoLEAST64	__PRI64_PREFIX "o"

# define PRIoFAST8	"o"
# define PRIoFAST16	__PRIPTR_PREFIX "o"
# define PRIoFAST32	__PRIPTR_PREFIX "o"
# define PRIoFAST64	__PRI64_PREFIX "o"

 
# define PRIu8		"u"
# define PRIu16		"u"
# define PRIu32		"u"
# define PRIu64		__PRI64_PREFIX "u"

# define PRIuLEAST8	"u"
# define PRIuLEAST16	"u"
# define PRIuLEAST32	"u"
# define PRIuLEAST64	__PRI64_PREFIX "u"

# define PRIuFAST8	"u"
# define PRIuFAST16	__PRIPTR_PREFIX "u"
# define PRIuFAST32	__PRIPTR_PREFIX "u"
# define PRIuFAST64	__PRI64_PREFIX "u"

 
# define PRIx8		"x"
# define PRIx16		"x"
# define PRIx32		"x"
# define PRIx64		__PRI64_PREFIX "x"

# define PRIxLEAST8	"x"
# define PRIxLEAST16	"x"
# define PRIxLEAST32	"x"
# define PRIxLEAST64	__PRI64_PREFIX "x"

# define PRIxFAST8	"x"
# define PRIxFAST16	__PRIPTR_PREFIX "x"
# define PRIxFAST32	__PRIPTR_PREFIX "x"
# define PRIxFAST64	__PRI64_PREFIX "x"

 
# define PRIX8		"X"
# define PRIX16		"X"
# define PRIX32		"X"
# define PRIX64		__PRI64_PREFIX "X"

# define PRIXLEAST8	"X"
# define PRIXLEAST16	"X"
# define PRIXLEAST32	"X"
# define PRIXLEAST64	__PRI64_PREFIX "X"

# define PRIXFAST8	"X"
# define PRIXFAST16	__PRIPTR_PREFIX "X"
# define PRIXFAST32	__PRIPTR_PREFIX "X"
# define PRIXFAST64	__PRI64_PREFIX "X"


 
# define PRIdMAX	__PRI64_PREFIX "d"
# define PRIiMAX	__PRI64_PREFIX "i"
# define PRIoMAX	__PRI64_PREFIX "o"
# define PRIuMAX	__PRI64_PREFIX "u"
# define PRIxMAX	__PRI64_PREFIX "x"
# define PRIXMAX	__PRI64_PREFIX "X"


 
# define PRIdPTR	__PRIPTR_PREFIX "d"
# define PRIiPTR	__PRIPTR_PREFIX "i"
# define PRIoPTR	__PRIPTR_PREFIX "o"
# define PRIuPTR	__PRIPTR_PREFIX "u"
# define PRIxPTR	__PRIPTR_PREFIX "x"
# define PRIXPTR	__PRIPTR_PREFIX "X"


 

 
# define SCNd8		"hhd"
# define SCNd16		"hd"
# define SCNd32		"d"
# define SCNd64		__PRI64_PREFIX "d"

# define SCNdLEAST8	"hhd"
# define SCNdLEAST16	"hd"
# define SCNdLEAST32	"d"
# define SCNdLEAST64	__PRI64_PREFIX "d"

# define SCNdFAST8	"hhd"
# define SCNdFAST16	__PRIPTR_PREFIX "d"
# define SCNdFAST32	__PRIPTR_PREFIX "d"
# define SCNdFAST64	__PRI64_PREFIX "d"

 
# define SCNi8		"hhi"
# define SCNi16		"hi"
# define SCNi32		"i"
# define SCNi64		__PRI64_PREFIX "i"

# define SCNiLEAST8	"hhi"
# define SCNiLEAST16	"hi"
# define SCNiLEAST32	"i"
# define SCNiLEAST64	__PRI64_PREFIX "i"

# define SCNiFAST8	"hhi"
# define SCNiFAST16	__PRIPTR_PREFIX "i"
# define SCNiFAST32	__PRIPTR_PREFIX "i"
# define SCNiFAST64	__PRI64_PREFIX "i"

 
# define SCNu8		"hhu"
# define SCNu16		"hu"
# define SCNu32		"u"
# define SCNu64		__PRI64_PREFIX "u"

# define SCNuLEAST8	"hhu"
# define SCNuLEAST16	"hu"
# define SCNuLEAST32	"u"
# define SCNuLEAST64	__PRI64_PREFIX "u"

# define SCNuFAST8	"hhu"
# define SCNuFAST16	__PRIPTR_PREFIX "u"
# define SCNuFAST32	__PRIPTR_PREFIX "u"
# define SCNuFAST64	__PRI64_PREFIX "u"

 
# define SCNo8		"hho"
# define SCNo16		"ho"
# define SCNo32		"o"
# define SCNo64		__PRI64_PREFIX "o"

# define SCNoLEAST8	"hho"
# define SCNoLEAST16	"ho"
# define SCNoLEAST32	"o"
# define SCNoLEAST64	__PRI64_PREFIX "o"

# define SCNoFAST8	"hho"
# define SCNoFAST16	__PRIPTR_PREFIX "o"
# define SCNoFAST32	__PRIPTR_PREFIX "o"
# define SCNoFAST64	__PRI64_PREFIX "o"

 
# define SCNx8		"hhx"
# define SCNx16		"hx"
# define SCNx32		"x"
# define SCNx64		__PRI64_PREFIX "x"

# define SCNxLEAST8	"hhx"
# define SCNxLEAST16	"hx"
# define SCNxLEAST32	"x"
# define SCNxLEAST64	__PRI64_PREFIX "x"

# define SCNxFAST8	"hhx"
# define SCNxFAST16	__PRIPTR_PREFIX "x"
# define SCNxFAST32	__PRIPTR_PREFIX "x"
# define SCNxFAST64	__PRI64_PREFIX "x"


 
# define SCNdMAX	__PRI64_PREFIX "d"
# define SCNiMAX	__PRI64_PREFIX "i"
# define SCNoMAX	__PRI64_PREFIX "o"
# define SCNuMAX	__PRI64_PREFIX "u"
# define SCNxMAX	__PRI64_PREFIX "x"

 
# define SCNdPTR	__PRIPTR_PREFIX "d"
# define SCNiPTR	__PRIPTR_PREFIX "i"
# define SCNoPTR	__PRIPTR_PREFIX "o"
# define SCNuPTR	__PRIPTR_PREFIX "u"
# define SCNxPTR	__PRIPTR_PREFIX "x"






 
typedef struct
  {
    long int quot;		 
    long int rem;		 
  } imaxdiv_t;

# 287 "/usr/include/inttypes.h"


 
extern intmax_t imaxabs (intmax_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern imaxdiv_t imaxdiv (intmax_t __numer, intmax_t __denom)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern intmax_t strtoimax (const char *__restrict __nptr,
			   char **__restrict __endptr, int __base) __attribute__ ((__nothrow__ , __leaf__));

 
extern uintmax_t strtoumax (const char *__restrict __nptr,
			    char ** __restrict __endptr, int __base) __attribute__ ((__nothrow__ , __leaf__));

 
extern intmax_t wcstoimax (const __gwchar_t *__restrict __nptr,
			   __gwchar_t **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__));

 
extern uintmax_t wcstoumax (const __gwchar_t *__restrict __nptr,
			    __gwchar_t ** __restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__));





extern long int __strtol_internal (const char *__restrict __nptr,
				   char **__restrict __endptr,
				   int __base, int __group)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));
 
extern __inline __attribute__ ((__gnu_inline__)) intmax_t

__attribute__ ((__nothrow__ , __leaf__)) strtoimax (const char *__restrict nptr, char * *__restrict endptr, int base)
{
  return __strtol_internal (nptr, endptr, base, 0);
}

extern unsigned long int __strtoul_internal (const char *__restrict __nptr,
					     char ** __restrict __endptr,
					     int __base, int __group)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));
 
extern __inline __attribute__ ((__gnu_inline__)) uintmax_t

__attribute__ ((__nothrow__ , __leaf__)) strtoumax (const char *__restrict nptr, char * *__restrict endptr, int base)
{
  return __strtoul_internal (nptr, endptr, base, 0);
}

extern long int __wcstol_internal (const __gwchar_t * __restrict __nptr,
				   __gwchar_t **__restrict __endptr,
				   int __base, int __group)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));
 
extern __inline __attribute__ ((__gnu_inline__)) intmax_t

__attribute__ ((__nothrow__ , __leaf__)) wcstoimax (const __gwchar_t *__restrict nptr, __gwchar_t * *__restrict endptr, int base)
{
  return __wcstol_internal (nptr, endptr, base, 0);
}

extern unsigned long int __wcstoul_internal (const __gwchar_t *
					     __restrict __nptr,
					     __gwchar_t **
					     __restrict __endptr,
					     int __base, int __group)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));
 
extern __inline __attribute__ ((__gnu_inline__)) uintmax_t

__attribute__ ((__nothrow__ , __leaf__)) wcstoumax (const __gwchar_t *__restrict nptr, __gwchar_t * *__restrict endptr, int base)
{
  return __wcstoul_internal (nptr, endptr, base, 0);
}

# 431 "/usr/include/inttypes.h"



# 46 "server.h"
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




# 47 "server.h"
# 1 "/usr/include/syslog.h"
# 1 "/usr/include/x86_64-linux-gnu/sys/syslog.h"





























 


#define _SYS_SYSLOG_H 1


#define __need___va_list
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
# 38 "/usr/include/x86_64-linux-gnu/sys/syslog.h"

 
# 1 "/usr/include/x86_64-linux-gnu/bits/syslog-path.h"
















 






#define _BITS_SYSLOG_PATH_H 1

#define	_PATH_LOG	"/dev/log"

# 41 "/usr/include/x86_64-linux-gnu/sys/syslog.h"









 
#define	LOG_EMERG	0	 
#define	LOG_ALERT	1	 
#define	LOG_CRIT	2	 
#define	LOG_ERR		3	 
#define	LOG_WARNING	4	 
#define	LOG_NOTICE	5	 
#define	LOG_INFO	6	 
#define	LOG_DEBUG	7	 

#define	LOG_PRIMASK	0x07	 
				 
#define	LOG_PRI(p)	((p) & LOG_PRIMASK)
#define	LOG_MAKEPRI(fac, pri)	((fac) | (pri))

# 91 "/usr/include/x86_64-linux-gnu/sys/syslog.h"

 
#define	LOG_KERN	(0<<3)	 
#define	LOG_USER	(1<<3)	 
#define	LOG_MAIL	(2<<3)	 
#define	LOG_DAEMON	(3<<3)	 
#define	LOG_AUTH	(4<<3)	 
#define	LOG_SYSLOG	(5<<3)	 
#define	LOG_LPR		(6<<3)	 
#define	LOG_NEWS	(7<<3)	 
#define	LOG_UUCP	(8<<3)	 
#define	LOG_CRON	(9<<3)	 
#define	LOG_AUTHPRIV	(10<<3)	 
#define	LOG_FTP		(11<<3)	 

	 
#define	LOG_LOCAL0	(16<<3)	 
#define	LOG_LOCAL1	(17<<3)	 
#define	LOG_LOCAL2	(18<<3)	 
#define	LOG_LOCAL3	(19<<3)	 
#define	LOG_LOCAL4	(20<<3)	 
#define	LOG_LOCAL5	(21<<3)	 
#define	LOG_LOCAL6	(22<<3)	 
#define	LOG_LOCAL7	(23<<3)	 

#define	LOG_NFACILITIES	24	 
#define	LOG_FACMASK	0x03f8	 
				 
#define	LOG_FAC(p)	(((p) & LOG_FACMASK) >> 3)

# 149 "/usr/include/x86_64-linux-gnu/sys/syslog.h"



 
#define	LOG_MASK(pri)	(1 << (pri))		 
#define	LOG_UPTO(pri)	((1 << ((pri)+1)) - 1)	 






 
#define	LOG_PID		0x01	 
#define	LOG_CONS	0x02	 
#define	LOG_ODELAY	0x04	 
#define	LOG_NDELAY	0x08	 
#define	LOG_NOWAIT	0x10	 
#define	LOG_PERROR	0x20	 






 
extern void closelog (void);




 
extern void openlog (const char *__ident, int __option, int __facility);

 
extern int setlogmask (int __mask) __attribute__ ((__nothrow__ , __leaf__));




 
extern void syslog (int __pri, const char *__fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));







 
extern void vsyslog (int __pri, const char *__fmt, __gnuc_va_list __ap)
     __attribute__ ((__format__ (__printf__, 2, 0)));



 
# 1 "/usr/include/x86_64-linux-gnu/bits/syslog.h"
















 






extern void __syslog_chk (int __pri, int __flag, const char *__fmt, ...)
     __attribute__ ((__format__ (__printf__, 3, 4)));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) void
syslog (int __pri, const char *__fmt, ...)
{
  __syslog_chk (__pri, 2 - 1, __fmt, (__builtin_va_alist));
}







extern void __vsyslog_chk (int __pri, int __flag, const char *__fmt,
			   __gnuc_va_list __ap)
     __attribute__ ((__format__ (__printf__, 3, 0)));

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) void
vsyslog (int __pri, const char *__fmt, __gnuc_va_list __ap)
{
  __vsyslog_chk (__pri,  2 - 1, __fmt, __ap);
}
# 208 "/usr/include/x86_64-linux-gnu/sys/syslog.h"







# 2 "/usr/include/syslog.h"
# 48 "server.h"
# 1 "/usr/include/netinet/in.h"















 


#define	_NETINET_IN_H	1

# 1 "/usr/include/x86_64-linux-gnu/sys/socket.h"
















 


#define	_SYS_SOCKET_H	1





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

# 27 "/usr/include/x86_64-linux-gnu/sys/socket.h"
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
# 29 "/usr/include/x86_64-linux-gnu/sys/socket.h"



 
# 1 "/usr/include/x86_64-linux-gnu/bits/socket.h"
















 


#define __BITS_SOCKET_H





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
# 28 "/usr/include/x86_64-linux-gnu/bits/socket.h"



 





 
# 1 "/usr/include/x86_64-linux-gnu/bits/socket_type.h"
















 





 
enum __socket_type
{
  SOCK_STREAM = 1,		
 
#define SOCK_STREAM SOCK_STREAM
  SOCK_DGRAM = 2,		
 
#define SOCK_DGRAM SOCK_DGRAM
  SOCK_RAW = 3,			 
#define SOCK_RAW SOCK_RAW
  SOCK_RDM = 4,			 
#define SOCK_RDM SOCK_RDM
  SOCK_SEQPACKET = 5,		
 
#define SOCK_SEQPACKET SOCK_SEQPACKET
  SOCK_DCCP = 6,		 
#define SOCK_DCCP SOCK_DCCP
  SOCK_PACKET = 10,		

 
#define SOCK_PACKET SOCK_PACKET

  
 

  SOCK_CLOEXEC = 02000000,	
 
#define SOCK_CLOEXEC SOCK_CLOEXEC
  SOCK_NONBLOCK = 00004000	
 
#define SOCK_NONBLOCK SOCK_NONBLOCK
};
# 39 "/usr/include/x86_64-linux-gnu/bits/socket.h"

 
#define PF_UNSPEC	0	 
#define PF_LOCAL	1	 
#define PF_UNIX		PF_LOCAL  
#define PF_FILE		PF_LOCAL  
#define PF_INET		2	 
#define PF_AX25		3	 
#define PF_IPX		4	 
#define PF_APPLETALK	5	 
#define PF_NETROM	6	 
#define PF_BRIDGE	7	 
#define PF_ATMPVC	8	 
#define PF_X25		9	 
#define PF_INET6	10	 
#define PF_ROSE		11	 
#define PF_DECnet	12	 
#define PF_NETBEUI	13	 
#define PF_SECURITY	14	 
#define PF_KEY		15	 
#define PF_NETLINK	16
#define PF_ROUTE	PF_NETLINK  
#define PF_PACKET	17	 
#define PF_ASH		18	 
#define PF_ECONET	19	 
#define PF_ATMSVC	20	 
#define PF_RDS		21	 
#define PF_SNA		22	 
#define PF_IRDA		23	 
#define PF_PPPOX	24	 
#define PF_WANPIPE	25	 
#define PF_LLC		26	 
#define PF_IB		27	 
#define PF_MPLS		28	 
#define PF_CAN		29	 
#define PF_TIPC		30	 
#define PF_BLUETOOTH	31	 
#define PF_IUCV		32	 
#define PF_RXRPC	33	 
#define PF_ISDN		34	 
#define PF_PHONET	35	 
#define PF_IEEE802154	36	 
#define PF_CAIF		37	 
#define PF_ALG		38	 
#define PF_NFC		39	 
#define PF_VSOCK	40	 
#define PF_KCM		41	 
#define PF_QIPCRTR	42	 
#define PF_SMC		43	 
#define PF_MAX		44	 

 
#define AF_UNSPEC	PF_UNSPEC
#define AF_LOCAL	PF_LOCAL
#define AF_UNIX		PF_UNIX
#define AF_FILE		PF_FILE
#define AF_INET		PF_INET
#define AF_AX25		PF_AX25
#define AF_IPX		PF_IPX
#define AF_APPLETALK	PF_APPLETALK
#define AF_NETROM	PF_NETROM
#define AF_BRIDGE	PF_BRIDGE
#define AF_ATMPVC	PF_ATMPVC
#define AF_X25		PF_X25
#define AF_INET6	PF_INET6
#define AF_ROSE		PF_ROSE
#define AF_DECnet	PF_DECnet
#define AF_NETBEUI	PF_NETBEUI
#define AF_SECURITY	PF_SECURITY
#define AF_KEY		PF_KEY
#define AF_NETLINK	PF_NETLINK
#define AF_ROUTE	PF_ROUTE
#define AF_PACKET	PF_PACKET
#define AF_ASH		PF_ASH
#define AF_ECONET	PF_ECONET
#define AF_ATMSVC	PF_ATMSVC
#define AF_RDS		PF_RDS
#define AF_SNA		PF_SNA
#define AF_IRDA		PF_IRDA
#define AF_PPPOX	PF_PPPOX
#define AF_WANPIPE	PF_WANPIPE
#define AF_LLC		PF_LLC
#define AF_IB		PF_IB
#define AF_MPLS		PF_MPLS
#define AF_CAN		PF_CAN
#define AF_TIPC		PF_TIPC
#define AF_BLUETOOTH	PF_BLUETOOTH
#define AF_IUCV		PF_IUCV
#define AF_RXRPC	PF_RXRPC
#define AF_ISDN		PF_ISDN
#define AF_PHONET	PF_PHONET
#define AF_IEEE802154	PF_IEEE802154
#define AF_CAIF		PF_CAIF
#define AF_ALG		PF_ALG
#define AF_NFC		PF_NFC
#define AF_VSOCK	PF_VSOCK
#define AF_KCM		PF_KCM
#define AF_QIPCRTR	PF_QIPCRTR
#define AF_SMC		PF_SMC
#define AF_MAX		PF_MAX




 
#define SOL_RAW		255
#define SOL_DECNET      261
#define SOL_X25         262
#define SOL_PACKET	263
#define SOL_ATM		264	 
#define SOL_AAL		265	 
#define SOL_IRDA	266
#define SOL_NETBEUI	267
#define SOL_LLC		268
#define SOL_DCCP	269
#define SOL_NETLINK	270
#define SOL_TIPC	271
#define SOL_RXRPC	272
#define SOL_PPPOL2TP	273
#define SOL_BLUETOOTH	274
#define SOL_PNPIPE	275
#define SOL_RDS		276
#define SOL_IUCV	277
#define SOL_CAIF	278
#define SOL_ALG		279
#define SOL_NFC		280
#define SOL_KCM		281
#define SOL_TLS		282

 
#define SOMAXCONN	128

 
# 1 "/usr/include/x86_64-linux-gnu/bits/sockaddr.h"
















 



 


#define _BITS_SOCKADDR_H	1


 
typedef unsigned short int sa_family_t;



 

#define	__SOCKADDR_COMMON(sa_prefix)   sa_family_t sa_prefix##family


#define __SOCKADDR_COMMON_SIZE	(sizeof (unsigned short int))

 
#define _SS_SIZE 128

# 173 "/usr/include/x86_64-linux-gnu/bits/socket.h"

 
struct sockaddr
  {
    sa_family_t sa_family;	 
    char sa_data[14];		 
  };



 
#define __ss_aligntype	unsigned long int
#define _SS_PADSIZE   (_SS_SIZE - __SOCKADDR_COMMON_SIZE - sizeof (__ss_aligntype))


struct sockaddr_storage
  {
    sa_family_t ss_family;	 
    char __ss_padding[(128 - (sizeof (unsigned short int)) - sizeof (unsigned long int))];
    unsigned long int __ss_align;	 
  };


 
enum
  {
    MSG_OOB		= 0x01,	 
#define MSG_OOB		MSG_OOB
    MSG_PEEK		= 0x02,	 
#define MSG_PEEK	MSG_PEEK
    MSG_DONTROUTE	= 0x04,	 
#define MSG_DONTROUTE	MSG_DONTROUTE

     
    MSG_TRYHARD		= MSG_DONTROUTE,
# define MSG_TRYHARD	MSG_DONTROUTE

    MSG_CTRUNC		= 0x08,	 
#define MSG_CTRUNC	MSG_CTRUNC
    MSG_PROXY		= 0x10,	 
#define MSG_PROXY	MSG_PROXY
    MSG_TRUNC		= 0x20,
#define MSG_TRUNC	MSG_TRUNC
    MSG_DONTWAIT	= 0x40,  
#define MSG_DONTWAIT	MSG_DONTWAIT
    MSG_EOR		= 0x80,  
#define MSG_EOR		MSG_EOR
    MSG_WAITALL		= 0x100,  
#define MSG_WAITALL	MSG_WAITALL
    MSG_FIN		= 0x200,
#define MSG_FIN		MSG_FIN
    MSG_SYN		= 0x400,
#define MSG_SYN		MSG_SYN
    MSG_CONFIRM		= 0x800,  
#define MSG_CONFIRM	MSG_CONFIRM
    MSG_RST		= 0x1000,
#define MSG_RST		MSG_RST
    MSG_ERRQUEUE	= 0x2000,  
#define MSG_ERRQUEUE	MSG_ERRQUEUE
    MSG_NOSIGNAL	= 0x4000,  
#define MSG_NOSIGNAL	MSG_NOSIGNAL
    MSG_MORE		= 0x8000,   
#define MSG_MORE	MSG_MORE
    MSG_WAITFORONE	= 0x10000,  
#define MSG_WAITFORONE	MSG_WAITFORONE
    MSG_BATCH		= 0x40000,  
#define MSG_BATCH	MSG_BATCH
    MSG_ZEROCOPY	= 0x4000000,  
#define MSG_ZEROCOPY	MSG_ZEROCOPY
    MSG_FASTOPEN	= 0x20000000,  
#define MSG_FASTOPEN	MSG_FASTOPEN

    MSG_CMSG_CLOEXEC	= 0x40000000	

 
#define MSG_CMSG_CLOEXEC MSG_CMSG_CLOEXEC
  };



 
struct msghdr
  {
    void *msg_name;		 
    socklen_t msg_namelen;	 

    struct iovec *msg_iov;	 
    size_t msg_iovlen;		 

    void *msg_control;		 
    size_t msg_controllen;	


 

    int msg_flags;		 
  };

 
struct cmsghdr
  {
    size_t cmsg_len;		



 
    int cmsg_level;		 
    int cmsg_type;		 

    __extension__ unsigned char __cmsg_data [];  

  };

 

# define CMSG_DATA(cmsg) ((cmsg)->__cmsg_data)



#define CMSG_NXTHDR(mhdr, cmsg) __cmsg_nxthdr (mhdr, cmsg)
#define CMSG_FIRSTHDR(mhdr)   ((size_t) (mhdr)->msg_controllen >= sizeof (struct cmsghdr)		         ? (struct cmsghdr *) (mhdr)->msg_control : (struct cmsghdr *) 0)


#define CMSG_ALIGN(len) (((len) + sizeof (size_t) - 1) 			 & (size_t) ~(sizeof (size_t) - 1))

#define CMSG_SPACE(len) (CMSG_ALIGN (len) 			 + CMSG_ALIGN (sizeof (struct cmsghdr)))

#define CMSG_LEN(len)   (CMSG_ALIGN (sizeof (struct cmsghdr)) + (len))

extern struct cmsghdr *__cmsg_nxthdr (struct msghdr *__mhdr,
				      struct cmsghdr *__cmsg) __attribute__ ((__nothrow__ , __leaf__));


#  define _EXTERN_INLINE __extern_inline

extern __inline __attribute__ ((__gnu_inline__)) struct cmsghdr *
__attribute__ ((__nothrow__ , __leaf__)) __cmsg_nxthdr (struct msghdr *__mhdr, struct cmsghdr *__cmsg)
{
  if ((size_t) __cmsg->cmsg_len < sizeof (struct cmsghdr))
     
    return (struct cmsghdr *) 0;

  __cmsg = (struct cmsghdr *) ((unsigned char *) __cmsg
			       + (((__cmsg->cmsg_len) + sizeof (size_t) - 1) & (size_t) ~(sizeof (size_t) - 1)));
  if ((unsigned char *) (__cmsg + 1) > ((unsigned char *) __mhdr->msg_control
					+ __mhdr->msg_controllen)
      || ((unsigned char *) __cmsg + (((__cmsg->cmsg_len) + sizeof (size_t) - 1) & (size_t) ~(sizeof (size_t) - 1))
	  > ((unsigned char *) __mhdr->msg_control + __mhdr->msg_controllen)))
     
    return (struct cmsghdr *) 0;
  return __cmsg;
}



 
enum
  {
    SCM_RIGHTS = 0x01		 
#define SCM_RIGHTS SCM_RIGHTS

    , SCM_CREDENTIALS = 0x02	 
# define SCM_CREDENTIALS SCM_CREDENTIALS

  };


 
struct ucred
{
  pid_t pid;			 
  uid_t uid;			 
  gid_t gid;			 
};


 
# 374 "/usr/include/x86_64-linux-gnu/bits/socket.h"
# define __SYS_SOCKET_H_undef_IOCSIZE_MASK


# define __SYS_SOCKET_H_undef_IOCSIZE_SHIFT


# define __SYS_SOCKET_H_undef_IOC_IN


# define __SYS_SOCKET_H_undef_IOC_INOUT


# define __SYS_SOCKET_H_undef_IOC_OUT


 
# 1 "/usr/include/x86_64-linux-gnu/asm/socket.h"
# 1 "/usr/include/asm-generic/socket.h"
 

#define __ASM_GENERIC_SOCKET_H

# 1 "/usr/include/x86_64-linux-gnu/asm/sockios.h"
# 1 "/usr/include/asm-generic/sockios.h"
 

#define __ASM_GENERIC_SOCKIOS_H

 
#define FIOSETOWN	0x8901
#define SIOCSPGRP	0x8902
#define FIOGETOWN	0x8903
#define SIOCGPGRP	0x8904
#define SIOCATMARK	0x8905
#define SIOCGSTAMP	0x8906		 
#define SIOCGSTAMPNS	0x8907		 

# 2 "/usr/include/x86_64-linux-gnu/asm/sockios.h"
# 6 "/usr/include/asm-generic/socket.h"

 
#define SOL_SOCKET	1

#define SO_DEBUG	1
#define SO_REUSEADDR	2
#define SO_TYPE		3
#define SO_ERROR	4
#define SO_DONTROUTE	5
#define SO_BROADCAST	6
#define SO_SNDBUF	7
#define SO_RCVBUF	8
#define SO_SNDBUFFORCE	32
#define SO_RCVBUFFORCE	33
#define SO_KEEPALIVE	9
#define SO_OOBINLINE	10
#define SO_NO_CHECK	11
#define SO_PRIORITY	12
#define SO_LINGER	13
#define SO_BSDCOMPAT	14
#define SO_REUSEPORT	15

#define SO_PASSCRED	16
#define SO_PEERCRED	17
#define SO_RCVLOWAT	18
#define SO_SNDLOWAT	19
#define SO_RCVTIMEO	20
#define SO_SNDTIMEO	21


 
#define SO_SECURITY_AUTHENTICATION		22
#define SO_SECURITY_ENCRYPTION_TRANSPORT	23
#define SO_SECURITY_ENCRYPTION_NETWORK		24

#define SO_BINDTODEVICE	25

 
#define SO_ATTACH_FILTER	26
#define SO_DETACH_FILTER	27
#define SO_GET_FILTER		SO_ATTACH_FILTER

#define SO_PEERNAME		28
#define SO_TIMESTAMP		29
#define SCM_TIMESTAMP		SO_TIMESTAMP

#define SO_ACCEPTCONN		30

#define SO_PEERSEC		31
#define SO_PASSSEC		34
#define SO_TIMESTAMPNS		35
#define SCM_TIMESTAMPNS		SO_TIMESTAMPNS

#define SO_MARK			36

#define SO_TIMESTAMPING		37
#define SCM_TIMESTAMPING	SO_TIMESTAMPING

#define SO_PROTOCOL		38
#define SO_DOMAIN		39

#define SO_RXQ_OVFL             40

#define SO_WIFI_STATUS		41
#define SCM_WIFI_STATUS	SO_WIFI_STATUS
#define SO_PEEK_OFF		42

 
#define SO_NOFCS		43

#define SO_LOCK_FILTER		44

#define SO_SELECT_ERR_QUEUE	45

#define SO_BUSY_POLL		46

#define SO_MAX_PACING_RATE	47

#define SO_BPF_EXTENSIONS	48

#define SO_INCOMING_CPU		49

#define SO_ATTACH_BPF		50
#define SO_DETACH_BPF		SO_DETACH_FILTER

#define SO_ATTACH_REUSEPORT_CBPF	51
#define SO_ATTACH_REUSEPORT_EBPF	52

#define SO_CNX_ADVICE		53

#define SCM_TIMESTAMPING_OPT_STATS	54

#define SO_MEMINFO		55

#define SO_INCOMING_NAPI_ID	56

#define SO_COOKIE		57

#define SCM_TIMESTAMPING_PKTINFO	58

#define SO_PEERGROUPS		59

#define SO_ZEROCOPY		60

# 2 "/usr/include/x86_64-linux-gnu/asm/socket.h"
# 391 "/usr/include/x86_64-linux-gnu/bits/socket.h"

# 423 "/usr/include/x86_64-linux-gnu/bits/socket.h"
# undef __SYS_SOCKET_H_undef_IOCSIZE_MASK
# undef IOCSIZE_MASK


# undef __SYS_SOCKET_H_undef_IOCSIZE_SHIFT
# undef IOCSIZE_SHIFT


# undef __SYS_SOCKET_H_undef_IOC_IN
# undef IOC_IN


# undef __SYS_SOCKET_H_undef_IOC_INOUT
# undef IOC_INOUT


# undef __SYS_SOCKET_H_undef_IOC_OUT
# undef IOC_OUT


 
struct linger
  {
    int l_onoff;		 
    int l_linger;		 
  };

# 34 "/usr/include/x86_64-linux-gnu/sys/socket.h"

# 1 "/usr/include/x86_64-linux-gnu/bits/types/struct_osockaddr.h"

#define __osockaddr_defined 1


 
struct osockaddr
{
  unsigned short int sa_family;
  unsigned char sa_data[14];
};

# 37 "/usr/include/x86_64-linux-gnu/sys/socket.h"



 
enum
{
  SHUT_RD = 0,		 
#define SHUT_RD		SHUT_RD
  SHUT_WR,		 
#define SHUT_WR		SHUT_WR
  SHUT_RDWR		 
#define SHUT_RDWR	SHUT_RDWR
};






 





 
# define __SOCKADDR_ALLTYPES   __SOCKADDR_ONETYPE (sockaddr)   __SOCKADDR_ONETYPE (sockaddr_at)   __SOCKADDR_ONETYPE (sockaddr_ax25)   __SOCKADDR_ONETYPE (sockaddr_dl)   __SOCKADDR_ONETYPE (sockaddr_eon)   __SOCKADDR_ONETYPE (sockaddr_in)   __SOCKADDR_ONETYPE (sockaddr_in6)   __SOCKADDR_ONETYPE (sockaddr_inarp)   __SOCKADDR_ONETYPE (sockaddr_ipx)   __SOCKADDR_ONETYPE (sockaddr_iso)   __SOCKADDR_ONETYPE (sockaddr_ns)   __SOCKADDR_ONETYPE (sockaddr_un)   __SOCKADDR_ONETYPE (sockaddr_x25)
# 77 "/usr/include/x86_64-linux-gnu/sys/socket.h"

# define __SOCKADDR_ONETYPE(type) struct type *__restrict __##type##__;
typedef union { struct sockaddr *__restrict __sockaddr__; struct sockaddr_at *__restrict __sockaddr_at__; struct sockaddr_ax25 *__restrict __sockaddr_ax25__; struct sockaddr_dl *__restrict __sockaddr_dl__; struct sockaddr_eon *__restrict __sockaddr_eon__; struct sockaddr_in *__restrict __sockaddr_in__; struct sockaddr_in6 *__restrict __sockaddr_in6__; struct sockaddr_inarp *__restrict __sockaddr_inarp__; struct sockaddr_ipx *__restrict __sockaddr_ipx__; struct sockaddr_iso *__restrict __sockaddr_iso__; struct sockaddr_ns *__restrict __sockaddr_ns__; struct sockaddr_un *__restrict __sockaddr_un__; struct sockaddr_x25 *__restrict __sockaddr_x25__;
	      } __SOCKADDR_ARG __attribute__ ((__transparent_union__));
# undef __SOCKADDR_ONETYPE
# define __SOCKADDR_ONETYPE(type) const struct type *__restrict __##type##__;
typedef union { const struct sockaddr *__restrict __sockaddr__; const struct sockaddr_at *__restrict __sockaddr_at__; const struct sockaddr_ax25 *__restrict __sockaddr_ax25__; const struct sockaddr_dl *__restrict __sockaddr_dl__; const struct sockaddr_eon *__restrict __sockaddr_eon__; const struct sockaddr_in *__restrict __sockaddr_in__; const struct sockaddr_in6 *__restrict __sockaddr_in6__; const struct sockaddr_inarp *__restrict __sockaddr_inarp__; const struct sockaddr_ipx *__restrict __sockaddr_ipx__; const struct sockaddr_iso *__restrict __sockaddr_iso__; const struct sockaddr_ns *__restrict __sockaddr_ns__; const struct sockaddr_un *__restrict __sockaddr_un__; const struct sockaddr_x25 *__restrict __sockaddr_x25__;
	      } __CONST_SOCKADDR_ARG __attribute__ ((__transparent_union__));
# undef __SOCKADDR_ONETYPE



 
struct mmsghdr
  {
    struct msghdr msg_hdr;	 
    unsigned int msg_len;	
 
  };





 
extern int socket (int __domain, int __type, int __protocol) __attribute__ ((__nothrow__ , __leaf__));




 
extern int socketpair (int __domain, int __type, int __protocol,
		       int __fds[2]) __attribute__ ((__nothrow__ , __leaf__));

 
extern int bind (int __fd, __CONST_SOCKADDR_ARG __addr, socklen_t __len)
     __attribute__ ((__nothrow__ , __leaf__));

 
extern int getsockname (int __fd, __SOCKADDR_ARG __addr,
			socklen_t *__restrict __len) __attribute__ ((__nothrow__ , __leaf__));







 
extern int connect (int __fd, __CONST_SOCKADDR_ARG __addr, socklen_t __len);


 
extern int getpeername (int __fd, __SOCKADDR_ARG __addr,
			socklen_t *__restrict __len) __attribute__ ((__nothrow__ , __leaf__));





 
extern ssize_t send (int __fd, const void *__buf, size_t __n, int __flags);





 
extern ssize_t recv (int __fd, void *__buf, size_t __n, int __flags);





 
extern ssize_t sendto (int __fd, const void *__buf, size_t __n,
		       int __flags, __CONST_SOCKADDR_ARG __addr,
		       socklen_t __addr_len);







 
extern ssize_t recvfrom (int __fd, void *__restrict __buf, size_t __n,
			 int __flags, __SOCKADDR_ARG __addr,
			 socklen_t *__restrict __addr_len);






 
extern ssize_t sendmsg (int __fd, const struct msghdr *__message,
			int __flags);






 
extern int sendmmsg (int __fd, struct mmsghdr *__vmessages,
		     unsigned int __vlen, int __flags);






 
extern ssize_t recvmsg (int __fd, struct msghdr *__message, int __flags);






 
extern int recvmmsg (int __fd, struct mmsghdr *__vmessages,
		     unsigned int __vlen, int __flags,
		     struct timespec *__tmo);





 
extern int getsockopt (int __fd, int __level, int __optname,
		       void *__restrict __optval,
		       socklen_t *__restrict __optlen) __attribute__ ((__nothrow__ , __leaf__));



 
extern int setsockopt (int __fd, int __level, int __optname,
		       const void *__optval, socklen_t __optlen) __attribute__ ((__nothrow__ , __leaf__));




 
extern int listen (int __fd, int __n) __attribute__ ((__nothrow__ , __leaf__));








 
extern int accept (int __fd, __SOCKADDR_ARG __addr,
		   socklen_t *__restrict __addr_len);





 
extern int accept4 (int __fd, __SOCKADDR_ARG __addr,
		    socklen_t *__restrict __addr_len, int __flags);







 
extern int shutdown (int __fd, int __how) __attribute__ ((__nothrow__ , __leaf__));



 
extern int sockatmark (int __fd) __attribute__ ((__nothrow__ , __leaf__));






 
extern int isfdtype (int __fd, int __fdtype) __attribute__ ((__nothrow__ , __leaf__));



 
# 1 "/usr/include/x86_64-linux-gnu/bits/socket2.h"
















 





extern ssize_t __recv_chk (int __fd, void *__buf, size_t __n, size_t __buflen,
			   int __flags);
extern ssize_t __recv_alias (int __fd, void *__buf, size_t __n, int __flags) __asm__ ("" "recv");

extern ssize_t __recv_chk_warn (int __fd, void *__buf, size_t __n, size_t __buflen, int __flags) __asm__ ("" "__recv_chk")


     __attribute__((__warning__ ("recv called with bigger length than size of destination " "buffer")));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) ssize_t
recv (int __fd, void *__buf, size_t __n, int __flags)
{
  if (__builtin_object_size(0,0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__n))
	return __recv_chk (__fd, __buf, __n, __builtin_object_size(0,0), __flags);

      if (__n > __builtin_object_size(0,0))
	return __recv_chk_warn (__fd, __buf, __n, __builtin_object_size(0,0), __flags);
    }
  return __recv_alias (__fd, __buf, __n, __flags);
}

extern ssize_t __recvfrom_chk (int __fd, void *__restrict __buf, size_t __n,
			       size_t __buflen, int __flags,
			       __SOCKADDR_ARG __addr,
			       socklen_t *__restrict __addr_len);
extern ssize_t __recvfrom_alias (int __fd, void *__restrict __buf, size_t __n, int __flags, __SOCKADDR_ARG __addr, socklen_t *__restrict __addr_len) __asm__ ("" "recvfrom");



extern ssize_t __recvfrom_chk_warn (int __fd, void *__restrict __buf, size_t __n, size_t __buflen, int __flags, __SOCKADDR_ARG __addr, socklen_t *__restrict __addr_len) __asm__ ("" "__recvfrom_chk")




     __attribute__((__warning__ ("recvfrom called with bigger length than size of " "destination buffer")));


extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) ssize_t
recvfrom (int __fd, void *__restrict __buf, size_t __n, int __flags,
	  __SOCKADDR_ARG __addr, socklen_t *__restrict __addr_len)
{
  if (__builtin_object_size(0,0) != (size_t) -1)
    {
      if (!__builtin_constant_p (__n))
	return __recvfrom_chk (__fd, __buf, __n, __builtin_object_size(0,0), __flags,
			       __addr, __addr_len);
      if (__n > __builtin_object_size(0,0))
	return __recvfrom_chk_warn (__fd, __buf, __n, __builtin_object_size(0,0), __flags,
				    __addr, __addr_len);
    }
  return __recvfrom_alias (__fd, __buf, __n, __flags, __addr, __addr_len);
}
# 270 "/usr/include/x86_64-linux-gnu/sys/socket.h"




# 24 "/usr/include/netinet/in.h"





 
typedef uint32_t in_addr_t;
struct in_addr
  {
    in_addr_t s_addr;
  };

 
# 1 "/usr/include/x86_64-linux-gnu/bits/in.h"















 

 












 
# 41 "/usr/include/x86_64-linux-gnu/bits/in.h"
# define __USE_KERNEL_IPV6_DEFS 0




 
#define        IP_OPTIONS      4        
#define        IP_HDRINCL      3        
#define        IP_TOS          1        
#define        IP_TTL          2        
#define        IP_RECVOPTS     6        
 
#define        IP_RECVRETOPTS  IP_RETOPTS        
#define        IP_RETOPTS      7        
#define IP_MULTICAST_IF 32	 
#define IP_MULTICAST_TTL 33	 
#define IP_MULTICAST_LOOP 34	 
#define IP_ADD_MEMBERSHIP 35	 
#define IP_DROP_MEMBERSHIP 36	 
#define IP_UNBLOCK_SOURCE 37	 
#define IP_BLOCK_SOURCE 38	 
#define IP_ADD_SOURCE_MEMBERSHIP 39  
#define IP_DROP_SOURCE_MEMBERSHIP 40  
#define IP_MSFILTER 41

# define MCAST_JOIN_GROUP 42	 
# define MCAST_BLOCK_SOURCE 43	 
# define MCAST_UNBLOCK_SOURCE 44  
# define MCAST_LEAVE_GROUP 45	 
# define MCAST_JOIN_SOURCE_GROUP 46  
# define MCAST_LEAVE_SOURCE_GROUP 47  
# define MCAST_MSFILTER 48
# define IP_MULTICAST_ALL 49
# define IP_UNICAST_IF 50

# define MCAST_EXCLUDE   0
# define MCAST_INCLUDE   1


#define IP_ROUTER_ALERT	5	 
#define IP_PKTINFO	8	 
#define IP_PKTOPTIONS	9
#define IP_PMTUDISC	10	 
#define IP_MTU_DISCOVER	10	 
#define IP_RECVERR	11	 
#define IP_RECVTTL	12	 
#define IP_RECVTOS	13	 
#define IP_MTU		14	 
#define IP_FREEBIND	15
#define IP_IPSEC_POLICY 16
#define IP_XFRM_POLICY	17
#define IP_PASSSEC	18
#define IP_TRANSPARENT	19
#define IP_MULTICAST_ALL 49	 

 
#define IP_ORIGDSTADDR       20
#define IP_RECVORIGDSTADDR   IP_ORIGDSTADDR

#define IP_MINTTL       21
#define IP_NODEFRAG     22
#define IP_CHECKSUM     23
#define IP_BIND_ADDRESS_NO_PORT 24
#define IP_RECVFRAGSIZE 25

 
#define IP_PMTUDISC_DONT   0	 
#define IP_PMTUDISC_WANT   1	 
#define IP_PMTUDISC_DO     2	 
#define IP_PMTUDISC_PROBE  3	 


 
#define IP_PMTUDISC_INTERFACE           4
 
#define IP_PMTUDISC_OMIT		5

#define IP_MULTICAST_IF			32
#define IP_MULTICAST_TTL 		33
#define IP_MULTICAST_LOOP 		34
#define IP_ADD_MEMBERSHIP		35
#define IP_DROP_MEMBERSHIP		36
#define IP_UNBLOCK_SOURCE		37
#define IP_BLOCK_SOURCE			38
#define IP_ADD_SOURCE_MEMBERSHIP	39
#define IP_DROP_SOURCE_MEMBERSHIP	40
#define IP_MSFILTER			41
#define IP_MULTICAST_ALL		49
#define IP_UNICAST_IF			50

 
#define SOL_IP	0

#define IP_DEFAULT_MULTICAST_TTL        1
#define IP_DEFAULT_MULTICAST_LOOP       1
#define IP_MAX_MEMBERSHIPS              20




 
struct ip_opts
  {
    struct in_addr ip_dst;	 
    char ip_opts[40];		 
  };

 
struct ip_mreqn
  {
    struct in_addr imr_multiaddr;	 
    struct in_addr imr_address;		 
    int	imr_ifindex;			 
  };

 
struct in_pktinfo
  {
    int ipi_ifindex;			 
    struct in_addr ipi_spec_dst;	 
    struct in_addr ipi_addr;		 
  };




 
#define IPV6_ADDRFORM		1
#define IPV6_2292PKTINFO	2
#define IPV6_2292HOPOPTS	3
#define IPV6_2292DSTOPTS	4
#define IPV6_2292RTHDR		5
#define IPV6_2292PKTOPTIONS	6
#define IPV6_CHECKSUM		7
#define IPV6_2292HOPLIMIT	8

#define SCM_SRCRT		IPV6_RXSRCRT

#define IPV6_NEXTHOP		9
#define IPV6_AUTHHDR		10
#define IPV6_UNICAST_HOPS	16
#define IPV6_MULTICAST_IF	17
#define IPV6_MULTICAST_HOPS	18
#define IPV6_MULTICAST_LOOP	19
#define IPV6_JOIN_GROUP		20
#define IPV6_LEAVE_GROUP	21
#define IPV6_ROUTER_ALERT	22
#define IPV6_MTU_DISCOVER	23
#define IPV6_MTU		24
#define IPV6_RECVERR		25
#define IPV6_V6ONLY		26
#define IPV6_JOIN_ANYCAST	27
#define IPV6_LEAVE_ANYCAST	28
#define IPV6_IPSEC_POLICY	34
#define IPV6_XFRM_POLICY	35
#define IPV6_HDRINCL		36

 
#define IPV6_RECVPKTINFO	49
#define IPV6_PKTINFO		50
#define IPV6_RECVHOPLIMIT	51
#define IPV6_HOPLIMIT		52
#define IPV6_RECVHOPOPTS	53
#define IPV6_HOPOPTS		54
#define IPV6_RTHDRDSTOPTS	55
#define IPV6_RECVRTHDR		56
#define IPV6_RTHDR		57
#define IPV6_RECVDSTOPTS	58
#define IPV6_DSTOPTS		59
#define IPV6_RECVPATHMTU	60
#define IPV6_PATHMTU		61
#define IPV6_DONTFRAG		62

 
#define IPV6_RECVTCLASS		66
#define IPV6_TCLASS		67

#define IPV6_AUTOFLOWLABEL	70

 
#define IPV6_ADDR_PREFERENCES	72

 
#define IPV6_MINHOPCOUNT	73

#define IPV6_ORIGDSTADDR	74
#define IPV6_RECVORIGDSTADDR	IPV6_ORIGDSTADDR
#define IPV6_TRANSPARENT	75
#define IPV6_UNICAST_IF		76
#define IPV6_RECVFRAGSIZE	77

 

# define IPV6_ADD_MEMBERSHIP	IPV6_JOIN_GROUP
# define IPV6_DROP_MEMBERSHIP	IPV6_LEAVE_GROUP

#define IPV6_RXHOPOPTS		IPV6_HOPOPTS
#define IPV6_RXDSTOPTS		IPV6_DSTOPTS

 
#define IPV6_PMTUDISC_DONT	0	 
#define IPV6_PMTUDISC_WANT	1	 
#define IPV6_PMTUDISC_DO	2	 
#define IPV6_PMTUDISC_PROBE	3	 
#define IPV6_PMTUDISC_INTERFACE	4	 
#define IPV6_PMTUDISC_OMIT	5	 

 
#define SOL_IPV6        41
#define SOL_ICMPV6      58

 
#define IPV6_RTHDR_LOOSE	0	 
#define IPV6_RTHDR_STRICT	1	 

#define IPV6_RTHDR_TYPE_0	0	 
# 38 "/usr/include/netinet/in.h"

 
enum
  {
    IPPROTO_IP = 0,	    
#define IPPROTO_IP		IPPROTO_IP
    IPPROTO_ICMP = 1,	    
#define IPPROTO_ICMP		IPPROTO_ICMP
    IPPROTO_IGMP = 2,	    
#define IPPROTO_IGMP		IPPROTO_IGMP
    IPPROTO_IPIP = 4,	    
#define IPPROTO_IPIP		IPPROTO_IPIP
    IPPROTO_TCP = 6,	    
#define IPPROTO_TCP		IPPROTO_TCP
    IPPROTO_EGP = 8,	    
#define IPPROTO_EGP		IPPROTO_EGP
    IPPROTO_PUP = 12,	    
#define IPPROTO_PUP		IPPROTO_PUP
    IPPROTO_UDP = 17,	    
#define IPPROTO_UDP		IPPROTO_UDP
    IPPROTO_IDP = 22,	    
#define IPPROTO_IDP		IPPROTO_IDP
    IPPROTO_TP = 29,	    
#define IPPROTO_TP		IPPROTO_TP
    IPPROTO_DCCP = 33,	    
#define IPPROTO_DCCP		IPPROTO_DCCP
    IPPROTO_IPV6 = 41,      
#define IPPROTO_IPV6		IPPROTO_IPV6
    IPPROTO_RSVP = 46,	    
#define IPPROTO_RSVP		IPPROTO_RSVP
    IPPROTO_GRE = 47,	    
#define IPPROTO_GRE		IPPROTO_GRE
    IPPROTO_ESP = 50,       
#define IPPROTO_ESP		IPPROTO_ESP
    IPPROTO_AH = 51,        
#define IPPROTO_AH		IPPROTO_AH
    IPPROTO_MTP = 92,	    
#define IPPROTO_MTP		IPPROTO_MTP
    IPPROTO_BEETPH = 94,    
#define IPPROTO_BEETPH		IPPROTO_BEETPH
    IPPROTO_ENCAP = 98,	    
#define IPPROTO_ENCAP		IPPROTO_ENCAP
    IPPROTO_PIM = 103,	    
#define IPPROTO_PIM		IPPROTO_PIM
    IPPROTO_COMP = 108,	    
#define IPPROTO_COMP		IPPROTO_COMP
    IPPROTO_SCTP = 132,	    
#define IPPROTO_SCTP		IPPROTO_SCTP
    IPPROTO_UDPLITE = 136,  
#define IPPROTO_UDPLITE		IPPROTO_UDPLITE
    IPPROTO_MPLS = 137,     
#define IPPROTO_MPLS		IPPROTO_MPLS
    IPPROTO_RAW = 255,	    
#define IPPROTO_RAW		IPPROTO_RAW
    IPPROTO_MAX
  };



 

enum
  {
    IPPROTO_HOPOPTS = 0,    
#define IPPROTO_HOPOPTS		IPPROTO_HOPOPTS
    IPPROTO_ROUTING = 43,   
#define IPPROTO_ROUTING		IPPROTO_ROUTING
    IPPROTO_FRAGMENT = 44,  
#define IPPROTO_FRAGMENT	IPPROTO_FRAGMENT
    IPPROTO_ICMPV6 = 58,    
#define IPPROTO_ICMPV6		IPPROTO_ICMPV6
    IPPROTO_NONE = 59,      
#define IPPROTO_NONE		IPPROTO_NONE
    IPPROTO_DSTOPTS = 60,   
#define IPPROTO_DSTOPTS		IPPROTO_DSTOPTS
    IPPROTO_MH = 135        
#define IPPROTO_MH		IPPROTO_MH
  };


 
typedef uint16_t in_port_t;

 
enum
  {
    IPPORT_ECHO = 7,		 
    IPPORT_DISCARD = 9,		 
    IPPORT_SYSTAT = 11,		 
    IPPORT_DAYTIME = 13,	 
    IPPORT_NETSTAT = 15,	 
    IPPORT_FTP = 21,		 
    IPPORT_TELNET = 23,		 
    IPPORT_SMTP = 25,		 
    IPPORT_TIMESERVER = 37,	 
    IPPORT_NAMESERVER = 42,	 
    IPPORT_WHOIS = 43,		 
    IPPORT_MTP = 57,

    IPPORT_TFTP = 69,		 
    IPPORT_RJE = 77,
    IPPORT_FINGER = 79,		 
    IPPORT_TTYLINK = 87,
    IPPORT_SUPDUP = 95,		 


    IPPORT_EXECSERVER = 512,	 
    IPPORT_LOGINSERVER = 513,	 
    IPPORT_CMDSERVER = 514,
    IPPORT_EFSSERVER = 520,

     
    IPPORT_BIFFUDP = 512,
    IPPORT_WHOSERVER = 513,
    IPPORT_ROUTESERVER = 520,

     
    IPPORT_RESERVED = 1024,

     
    IPPORT_USERRESERVED = 5000
  };




 

#define	IN_CLASSA(a)		((((in_addr_t)(a)) & 0x80000000) == 0)
#define	IN_CLASSA_NET		0xff000000
#define	IN_CLASSA_NSHIFT	24
#define	IN_CLASSA_HOST		(0xffffffff & ~IN_CLASSA_NET)
#define	IN_CLASSA_MAX		128

#define	IN_CLASSB(a)		((((in_addr_t)(a)) & 0xc0000000) == 0x80000000)
#define	IN_CLASSB_NET		0xffff0000
#define	IN_CLASSB_NSHIFT	16
#define	IN_CLASSB_HOST		(0xffffffff & ~IN_CLASSB_NET)
#define	IN_CLASSB_MAX		65536

#define	IN_CLASSC(a)		((((in_addr_t)(a)) & 0xe0000000) == 0xc0000000)
#define	IN_CLASSC_NET		0xffffff00
#define	IN_CLASSC_NSHIFT	8
#define	IN_CLASSC_HOST		(0xffffffff & ~IN_CLASSC_NET)

#define	IN_CLASSD(a)		((((in_addr_t)(a)) & 0xf0000000) == 0xe0000000)
#define	IN_MULTICAST(a)		IN_CLASSD(a)

#define	IN_EXPERIMENTAL(a)	((((in_addr_t)(a)) & 0xe0000000) == 0xe0000000)
#define	IN_BADCLASS(a)		((((in_addr_t)(a)) & 0xf0000000) == 0xf0000000)

 
#define	INADDR_ANY		((in_addr_t) 0x00000000)
 
#define	INADDR_BROADCAST	((in_addr_t) 0xffffffff)
 
#define	INADDR_NONE		((in_addr_t) 0xffffffff)

 
#define	IN_LOOPBACKNET		127
 

# define INADDR_LOOPBACK	((in_addr_t) 0x7f000001)  


 
#define INADDR_UNSPEC_GROUP	((in_addr_t) 0xe0000000)  
#define INADDR_ALLHOSTS_GROUP	((in_addr_t) 0xe0000001)  
#define INADDR_ALLRTRS_GROUP    ((in_addr_t) 0xe0000002)  
#define INADDR_MAX_LOCAL_GROUP  ((in_addr_t) 0xe00000ff)  


 
struct in6_addr
  {
    union
      {
	uint8_t	__u6_addr8[16];
	uint16_t __u6_addr16[8];
	uint32_t __u6_addr32[4];
      } __in6_u;
#define s6_addr			__in6_u.__u6_addr8

# define s6_addr16		__in6_u.__u6_addr16
# define s6_addr32		__in6_u.__u6_addr32

  };


extern const struct in6_addr in6addr_any;         
extern const struct in6_addr in6addr_loopback;    
#define IN6ADDR_ANY_INIT { { { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 } } }
#define IN6ADDR_LOOPBACK_INIT { { { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1 } } }

#define INET_ADDRSTRLEN 16
#define INET6_ADDRSTRLEN 46


 
struct sockaddr_in
  {
    sa_family_t sin_family;
    in_port_t sin_port;			 
    struct in_addr sin_addr;		 

     
    unsigned char sin_zero[sizeof (struct sockaddr) -
			   (sizeof (unsigned short int)) -
			   sizeof (in_port_t) -
			   sizeof (struct in_addr)];
  };


 
struct sockaddr_in6
  {
    sa_family_t sin6_family;
    in_port_t sin6_port;	 
    uint32_t sin6_flowinfo;	 
    struct in6_addr sin6_addr;	 
    uint32_t sin6_scope_id;	 
  };



 
struct ip_mreq
  {
     
    struct in_addr imr_multiaddr;

     
    struct in_addr imr_interface;
  };

struct ip_mreq_source
  {
     
    struct in_addr imr_multiaddr;

     
    struct in_addr imr_interface;

     
    struct in_addr imr_sourceaddr;
  };



 
struct ipv6_mreq
  {
     
    struct in6_addr ipv6mr_multiaddr;

     
    unsigned int ipv6mr_interface;
  };



 
struct group_req
  {
     
    uint32_t gr_interface;

     
    struct sockaddr_storage gr_group;
  };

struct group_source_req
  {
     
    uint32_t gsr_interface;

     
    struct sockaddr_storage gsr_group;

     
    struct sockaddr_storage gsr_source;
  };


 
struct ip_msfilter
  {
     
    struct in_addr imsf_multiaddr;

     
    struct in_addr imsf_interface;

     
    uint32_t imsf_fmode;

     
    uint32_t imsf_numsrc;
     
    struct in_addr imsf_slist[1];
  };

#define IP_MSFILTER_SIZE(numsrc) (sizeof (struct ip_msfilter) 				  - sizeof (struct in_addr)		      				  + (numsrc) * sizeof (struct in_addr))



struct group_filter
  {
     
    uint32_t gf_interface;

     
    struct sockaddr_storage gf_group;

     
    uint32_t gf_fmode;

     
    uint32_t gf_numsrc;
     
    struct sockaddr_storage gf_slist[1];
};

#define GROUP_FILTER_SIZE(numsrc) (sizeof (struct group_filter) 				   - sizeof (struct sockaddr_storage)	      				   + ((numsrc)				      				      * sizeof (struct sockaddr_storage)))










 

extern uint32_t ntohl (uint32_t __netlong) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern uint16_t ntohs (uint16_t __netshort)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern uint32_t htonl (uint32_t __hostlong)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern uint16_t htons (uint16_t __hostshort)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
# 1 "/usr/include/x86_64-linux-gnu/bits/byteswap.h"
















 





# 386 "/usr/include/netinet/in.h"
# 1 "/usr/include/x86_64-linux-gnu/bits/uintn-identity.h"
















 





# 387 "/usr/include/netinet/in.h"




 
# 401 "/usr/include/netinet/in.h"
#   define ntohl(x)	__bswap_32 (x)
#   define ntohs(x)	__bswap_16 (x)
#   define htonl(x)	__bswap_32 (x)
#   define htons(x)	__bswap_16 (x)





# define IN6_IS_ADDR_UNSPECIFIED(a)   (__extension__							         ({ const struct in6_addr *__a = (const struct in6_addr *) (a);	            __a->__in6_u.__u6_addr32[0] == 0					            && __a->__in6_u.__u6_addr32[1] == 0				            && __a->__in6_u.__u6_addr32[2] == 0				            && __a->__in6_u.__u6_addr32[3] == 0; }))
# 417 "/usr/include/netinet/in.h"

# define IN6_IS_ADDR_LOOPBACK(a)   (__extension__							         ({ const struct in6_addr *__a = (const struct in6_addr *) (a);	            __a->__in6_u.__u6_addr32[0] == 0					            && __a->__in6_u.__u6_addr32[1] == 0				            && __a->__in6_u.__u6_addr32[2] == 0				            && __a->__in6_u.__u6_addr32[3] == htonl (1); }))
# 425 "/usr/include/netinet/in.h"

# define IN6_IS_ADDR_LINKLOCAL(a)   (__extension__							         ({ const struct in6_addr *__a = (const struct in6_addr *) (a);	            (__a->__in6_u.__u6_addr32[0] & htonl (0xffc00000)) == htonl (0xfe800000); }))




# define IN6_IS_ADDR_SITELOCAL(a)   (__extension__							         ({ const struct in6_addr *__a = (const struct in6_addr *) (a);	            (__a->__in6_u.__u6_addr32[0] & htonl (0xffc00000)) == htonl (0xfec00000); }))




# define IN6_IS_ADDR_V4MAPPED(a)   (__extension__							         ({ const struct in6_addr *__a = (const struct in6_addr *) (a);	            __a->__in6_u.__u6_addr32[0] == 0					            && __a->__in6_u.__u6_addr32[1] == 0				            && __a->__in6_u.__u6_addr32[2] == htonl (0xffff); }))






# define IN6_IS_ADDR_V4COMPAT(a)   (__extension__							         ({ const struct in6_addr *__a = (const struct in6_addr *) (a);	            __a->__in6_u.__u6_addr32[0] == 0					            && __a->__in6_u.__u6_addr32[1] == 0				            && __a->__in6_u.__u6_addr32[2] == 0				            && ntohl (__a->__in6_u.__u6_addr32[3]) > 1; }))
# 450 "/usr/include/netinet/in.h"

# define IN6_ARE_ADDR_EQUAL(a,b)   (__extension__							         ({ const struct in6_addr *__a = (const struct in6_addr *) (a);	            const struct in6_addr *__b = (const struct in6_addr *) (b);	            __a->__in6_u.__u6_addr32[0] == __b->__in6_u.__u6_addr32[0]	            && __a->__in6_u.__u6_addr32[1] == __b->__in6_u.__u6_addr32[1]	            && __a->__in6_u.__u6_addr32[2] == __b->__in6_u.__u6_addr32[2]	            && __a->__in6_u.__u6_addr32[3] == __b->__in6_u.__u6_addr32[3]; }))
# 497 "/usr/include/netinet/in.h"

#define IN6_IS_ADDR_MULTICAST(a) (((const uint8_t *) (a))[0] == 0xff)


 
extern int bindresvport (int __sockfd, struct sockaddr_in *__sock_in) __attribute__ ((__nothrow__ , __leaf__));

 
extern int bindresvport6 (int __sockfd, struct sockaddr_in6 *__sock_in)
     __attribute__ ((__nothrow__ , __leaf__));



#define IN6_IS_ADDR_MC_NODELOCAL(a) 	(IN6_IS_ADDR_MULTICAST(a)					      	 && ((((const uint8_t *) (a))[1] & 0xf) == 0x1))



#define IN6_IS_ADDR_MC_LINKLOCAL(a) 	(IN6_IS_ADDR_MULTICAST(a)					      	 && ((((const uint8_t *) (a))[1] & 0xf) == 0x2))



#define IN6_IS_ADDR_MC_SITELOCAL(a) 	(IN6_IS_ADDR_MULTICAST(a)					      	 && ((((const uint8_t *) (a))[1] & 0xf) == 0x5))



#define IN6_IS_ADDR_MC_ORGLOCAL(a) 	(IN6_IS_ADDR_MULTICAST(a)					      	 && ((((const uint8_t *) (a))[1] & 0xf) == 0x8))



#define IN6_IS_ADDR_MC_GLOBAL(a) 	(IN6_IS_ADDR_MULTICAST(a)					      	 && ((((const uint8_t *) (a))[1] & 0xf) == 0xe))





struct cmsghdr;			 


 
struct in6_pktinfo
  {
    struct in6_addr ipi6_addr;	 
    unsigned int ipi6_ifindex;	 
  };

 
struct ip6_mtuinfo
  {
    struct sockaddr_in6 ip6m_addr;  
    uint32_t ip6m_mtu;		    
  };


 
extern int inet6_option_space (int __nbytes)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__deprecated__));
extern int inet6_option_init (void *__bp, struct cmsghdr **__cmsgp,
			      int __type) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__deprecated__));
extern int inet6_option_append (struct cmsghdr *__cmsg,
				const uint8_t *__typep, int __multx,
				int __plusy) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__deprecated__));
extern uint8_t *inet6_option_alloc (struct cmsghdr *__cmsg, int __datalen,
				    int __multx, int __plusy)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__deprecated__));
extern int inet6_option_next (const struct cmsghdr *__cmsg,
			      uint8_t **__tptrp)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__deprecated__));
extern int inet6_option_find (const struct cmsghdr *__cmsg,
			      uint8_t **__tptrp, int __type)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__deprecated__));


 
extern int inet6_opt_init (void *__extbuf, socklen_t __extlen) __attribute__ ((__nothrow__ , __leaf__));
extern int inet6_opt_append (void *__extbuf, socklen_t __extlen, int __offset,
			     uint8_t __type, socklen_t __len, uint8_t __align,
			     void **__databufp) __attribute__ ((__nothrow__ , __leaf__));
extern int inet6_opt_finish (void *__extbuf, socklen_t __extlen, int __offset)
     __attribute__ ((__nothrow__ , __leaf__));
extern int inet6_opt_set_val (void *__databuf, int __offset, void *__val,
			      socklen_t __vallen) __attribute__ ((__nothrow__ , __leaf__));
extern int inet6_opt_next (void *__extbuf, socklen_t __extlen, int __offset,
			   uint8_t *__typep, socklen_t *__lenp,
			   void **__databufp) __attribute__ ((__nothrow__ , __leaf__));
extern int inet6_opt_find (void *__extbuf, socklen_t __extlen, int __offset,
			   uint8_t __type, socklen_t *__lenp,
			   void **__databufp) __attribute__ ((__nothrow__ , __leaf__));
extern int inet6_opt_get_val (void *__databuf, int __offset, void *__val,
			      socklen_t __vallen) __attribute__ ((__nothrow__ , __leaf__));


 
extern socklen_t inet6_rth_space (int __type, int __segments) __attribute__ ((__nothrow__ , __leaf__));
extern void *inet6_rth_init (void *__bp, socklen_t __bp_len, int __type,
			     int __segments) __attribute__ ((__nothrow__ , __leaf__));
extern int inet6_rth_add (void *__bp, const struct in6_addr *__addr) __attribute__ ((__nothrow__ , __leaf__));
extern int inet6_rth_reverse (const void *__in, void *__out) __attribute__ ((__nothrow__ , __leaf__));
extern int inet6_rth_segments (const void *__bp) __attribute__ ((__nothrow__ , __leaf__));
extern struct in6_addr *inet6_rth_getaddr (const void *__bp, int __index)
     __attribute__ ((__nothrow__ , __leaf__));


 

 
extern int getipv4sourcefilter (int __s, struct in_addr __interface_addr,
				struct in_addr __group, uint32_t *__fmode,
				uint32_t *__numsrc, struct in_addr *__slist)
     __attribute__ ((__nothrow__ , __leaf__));

 
extern int setipv4sourcefilter (int __s, struct in_addr __interface_addr,
				struct in_addr __group, uint32_t __fmode,
				uint32_t __numsrc,
				const struct in_addr *__slist)
     __attribute__ ((__nothrow__ , __leaf__));


 
extern int getsourcefilter (int __s, uint32_t __interface_addr,
			    const struct sockaddr *__group,
			    socklen_t __grouplen, uint32_t *__fmode,
			    uint32_t *__numsrc,
			    struct sockaddr_storage *__slist) __attribute__ ((__nothrow__ , __leaf__));

 
extern int setsourcefilter (int __s, uint32_t __interface_addr,
			    const struct sockaddr *__group,
			    socklen_t __grouplen, uint32_t __fmode,
			    uint32_t __numsrc,
			    const struct sockaddr_storage *__slist) __attribute__ ((__nothrow__ , __leaf__));




# 49 "server.h"
# 1 "../deps/lua/src/lua.h"





 



#define lua_h

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
# 13 "../deps/lua/src/lua.h"
# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"










 





# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





















 



 








 



#define _STDDEF_H
#define _STDDEF_H_
 
#define _ANSI_STDDEF_H




 


 



 







 
# 91 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 









 
# 116 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





 

 


 
# 137 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#define _PTRDIFF_T
#define _T_PTRDIFF_
#define _T_PTRDIFF
#define __PTRDIFF_T
#define _PTRDIFF_T_
#define _BSD_PTRDIFF_T_
#define ___int_ptrdiff_t_h
#define _GCC_PTRDIFF_T
#define _PTRDIFF_T_DECLARED



typedef long int ptrdiff_t;
# 159 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

 
#undef	__need_ptrdiff_t



 


 
# 238 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#undef	__need_size_t






 


 
# 347 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#undef	__need_wchar_t


# 361 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 
 
 
# 395 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 


#undef NULL		 




#define NULL ((void *)0)





#undef	__need_NULL



 
#define offsetof(TYPE, MEMBER) __builtin_offsetof (TYPE, MEMBER)




#define _GCC_MAX_ALIGN_T


 
typedef struct {
  long long __max_align_ll __attribute__((__aligned__(__alignof__(long long))));
  long double __max_align_ld __attribute__((__aligned__(__alignof__(long double))));
  



 



} max_align_t;



# 447 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



# 19 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"
# 14 "../deps/lua/src/lua.h"


# 1 "../deps/lua/src/luaconf.h"




 



#define lconfig_h

# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include-fixed/limits.h"





















 


 


 
# 192 "/usr/lib/gcc/x86_64-linux-gnu/7/include-fixed/limits.h"





# 12 "../deps/lua/src/luaconf.h"
# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"










 





# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"





















 



 
# 19 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stddef.h"
# 13 "../deps/lua/src/luaconf.h"






 






 

#define LUA_ANSI
























 
# 60 "../deps/lua/src/luaconf.h"








 
#define LUA_PATH        "LUA_PATH"
#define LUA_CPATH       "LUA_CPATH"
#define LUA_INIT	"LUA_INIT"










 
# 97 "../deps/lua/src/luaconf.h"
#define LUA_ROOT	"/usr/local/"
#define LUA_LDIR	LUA_ROOT "share/lua/5.1/"
#define LUA_CDIR	LUA_ROOT "lib/lua/5.1/"
#define LUA_PATH_DEFAULT  		"./?.lua;"  LUA_LDIR"?.lua;"  LUA_LDIR"?/init.lua;" 		            LUA_CDIR"?.lua;"  LUA_CDIR"?/init.lua"


#define LUA_CPATH_DEFAULT 	"./?.so;"  LUA_CDIR"?.so;" LUA_CDIR"loadall.so"








 



#define LUA_DIRSEP	"/"














 
#define LUA_PATHSEP	";"
#define LUA_PATH_MARK	"?"
#define LUA_EXECDIR	"!"
#define LUA_IGMARK	"-"






 
#define LUA_INTEGER	ptrdiff_t









 
# 163 "../deps/lua/src/luaconf.h"

#define LUA_API		extern



 
#define LUALIB_API	LUA_API










 
# 187 "../deps/lua/src/luaconf.h"
#define LUAI_FUNC	__attribute__((visibility("hidden"))) extern
#define LUAI_DATA	LUAI_FUNC











 
#define LUA_QL(x)	"'" x "'"
#define LUA_QS		LUA_QL("%s")






 
#define LUA_IDSIZE	60






 

# 291 "../deps/lua/src/luaconf.h"

 








 
#define LUAI_GCPAUSE	200   









 
#define LUAI_GCMUL	200  







 
#undef LUA_COMPAT_GETN





 
#undef LUA_COMPAT_LOADLIB





 
#define LUA_COMPAT_VARARG





 
#define LUA_COMPAT_MOD






 
#define LUA_COMPAT_LSTR		1





 
#define LUA_COMPAT_GFIND






 
#define LUA_COMPAT_OPENLIB









 




#define luai_apicheck(L,o)	{ (void)L; }







 
 



 
#define LUAI_BITSINT	32
















 

#define LUAI_UINT32	unsigned int
#define LUAI_INT32	int
#define LUAI_MAXINT32	INT_MAX
#define LUAI_UMEM	size_t
#define LUAI_MEM	ptrdiff_t
# 427 "../deps/lua/src/luaconf.h"







 
#define LUAI_MAXCALLS	20000









 
#define LUAI_MAXCSTACK	8000














 





 
#define LUAI_MAXCCALLS		200





 
#define LUAI_MAXVARS		200





 
#define LUAI_MAXUPVALUES	60




 
#define LUAL_BUFFERSIZE		BUFSIZ

 











 

#define LUA_NUMBER_DOUBLE
#define LUA_NUMBER	double




 
#define LUAI_UACNUMBER	double








 
#define LUA_NUMBER_SCAN		"%lf"
#define LUA_NUMBER_FMT		"%.14g"
#define lua_number2str(s,n)	sprintf((s), LUA_NUMBER_FMT, (n))
#define LUAI_MAXNUMBER2STR	32  
#define lua_str2number(s,p)	strtod((s), (p))




 
# 545 "../deps/lua/src/luaconf.h"









 

 
# 580 "../deps/lua/src/luaconf.h"
#define lua_number2int(i,d)	((i)=(int)(d))
#define lua_number2integer(i,d)	((i)=(lua_Integer)(d))



 








 
#define LUAI_USER_ALIGNMENT_T	union { double u; void *s; long l; }









 
# 620 "../deps/lua/src/luaconf.h"
 
#define LUAI_THROW(L,c)	longjmp((c)->b, 1)
#define LUAI_TRY(L,c,a)	if (setjmp((c)->b) == 0) { a }
#define luai_jmpbuf	jmp_buf








 
#define LUA_MAXCAPTURES		32









 
# 661 "../deps/lua/src/luaconf.h"






 
# 679 "../deps/lua/src/luaconf.h"

#define lua_popen(L,c,m)	((void)((void)c, m),  		luaL_error(L, LUA_QL("popen") " not supported"), (FILE*)0)

#define lua_pclose(L,file)		((void)((void)L, file), 0)
















 














 
#define LUAI_EXTRASPACE		0






 
#define luai_userstateopen(L)		((void)L)
#define luai_userstateclose(L)		((void)L)
#define luai_userstatethread(L,L1)	((void)L)
#define luai_userstatefree(L)		((void)L)
#define luai_userstateresume(L,n)	((void)L)
#define luai_userstateyield(L,n)	((void)L)








 

# 745 "../deps/lua/src/luaconf.h"

#define LUA_INTFRMLEN		"l"
#define LUA_INTFRM_T		long





 




 





# 17 "../deps/lua/src/lua.h"


#define LUA_VERSION	"Lua 5.1"
#define LUA_RELEASE	"Lua 5.1.5"
#define LUA_VERSION_NUM	501
#define LUA_COPYRIGHT	"Copyright (C) 1994-2012 Lua.org, PUC-Rio"
#define LUA_AUTHORS 	"R. Ierusalimschy, L. H. de Figueiredo & W. Celes"


 
#define	LUA_SIGNATURE	"\033Lua"

 
#define LUA_MULTRET	(-1)




 
#define LUA_REGISTRYINDEX	(-10000)
#define LUA_ENVIRONINDEX	(-10001)
#define LUA_GLOBALSINDEX	(-10002)
#define lua_upvalueindex(i)	(LUA_GLOBALSINDEX-(i))


 
#define LUA_YIELD	1
#define LUA_ERRRUN	2
#define LUA_ERRSYNTAX	3
#define LUA_ERRMEM	4
#define LUA_ERRERR	5


typedef struct lua_State lua_State;

typedef int (*lua_CFunction) (lua_State *L);




 
typedef const char * (*lua_Reader) (lua_State *L, void *ud, size_t *sz);

typedef int (*lua_Writer) (lua_State *L, const void* p, size_t sz, void* ud);




 
typedef void * (*lua_Alloc) (void *ud, void *ptr, size_t osize, size_t nsize);




 
#define LUA_TNONE		(-1)

#define LUA_TNIL		0
#define LUA_TBOOLEAN		1
#define LUA_TLIGHTUSERDATA	2
#define LUA_TNUMBER		3
#define LUA_TSTRING		4
#define LUA_TTABLE		5
#define LUA_TFUNCTION		6
#define LUA_TUSERDATA		7
#define LUA_TTHREAD		8



 
#define LUA_MINSTACK	20




 





 
typedef double lua_Number;


 
typedef ptrdiff_t lua_Integer;





 
extern lua_State *(lua_newstate) (lua_Alloc f, void *ud);
extern void       (lua_close) (lua_State *L);
extern lua_State *(lua_newthread) (lua_State *L);

extern lua_CFunction (lua_atpanic) (lua_State *L, lua_CFunction panicf);




 
extern int   (lua_gettop) (lua_State *L);
extern void  (lua_settop) (lua_State *L, int idx);
extern void  (lua_pushvalue) (lua_State *L, int idx);
extern void  (lua_remove) (lua_State *L, int idx);
extern void  (lua_insert) (lua_State *L, int idx);
extern void  (lua_replace) (lua_State *L, int idx);
extern int   (lua_checkstack) (lua_State *L, int sz);

extern void  (lua_xmove) (lua_State *from, lua_State *to, int n);




 

extern int             (lua_isnumber) (lua_State *L, int idx);
extern int             (lua_isstring) (lua_State *L, int idx);
extern int             (lua_iscfunction) (lua_State *L, int idx);
extern int             (lua_isuserdata) (lua_State *L, int idx);
extern int             (lua_type) (lua_State *L, int idx);
extern const char     *(lua_typename) (lua_State *L, int tp);

extern int            (lua_equal) (lua_State *L, int idx1, int idx2);
extern int            (lua_rawequal) (lua_State *L, int idx1, int idx2);
extern int            (lua_lessthan) (lua_State *L, int idx1, int idx2);

extern lua_Number      (lua_tonumber) (lua_State *L, int idx);
extern lua_Integer     (lua_tointeger) (lua_State *L, int idx);
extern int             (lua_toboolean) (lua_State *L, int idx);
extern const char     *(lua_tolstring) (lua_State *L, int idx, size_t *len);
extern size_t          (lua_objlen) (lua_State *L, int idx);
extern lua_CFunction   (lua_tocfunction) (lua_State *L, int idx);
extern void	       *(lua_touserdata) (lua_State *L, int idx);
extern lua_State      *(lua_tothread) (lua_State *L, int idx);
extern const void     *(lua_topointer) (lua_State *L, int idx);




 
extern void  (lua_pushnil) (lua_State *L);
extern void  (lua_pushnumber) (lua_State *L, lua_Number n);
extern void  (lua_pushinteger) (lua_State *L, lua_Integer n);
extern void  (lua_pushlstring) (lua_State *L, const char *s, size_t l);
extern void  (lua_pushstring) (lua_State *L, const char *s);
extern const char *(lua_pushvfstring) (lua_State *L, const char *fmt,
                                                      va_list argp);
extern const char *(lua_pushfstring) (lua_State *L, const char *fmt, ...);
extern void  (lua_pushcclosure) (lua_State *L, lua_CFunction fn, int n);
extern void  (lua_pushboolean) (lua_State *L, int b);
extern void  (lua_pushlightuserdata) (lua_State *L, void *p);
extern int   (lua_pushthread) (lua_State *L);




 
extern void  (lua_gettable) (lua_State *L, int idx);
extern void  (lua_getfield) (lua_State *L, int idx, const char *k);
extern void  (lua_rawget) (lua_State *L, int idx);
extern void  (lua_rawgeti) (lua_State *L, int idx, int n);
extern void  (lua_createtable) (lua_State *L, int narr, int nrec);
extern void *(lua_newuserdata) (lua_State *L, size_t sz);
extern int   (lua_getmetatable) (lua_State *L, int objindex);
extern void  (lua_getfenv) (lua_State *L, int idx);




 
extern void  (lua_settable) (lua_State *L, int idx);
extern void  (lua_setfield) (lua_State *L, int idx, const char *k);
extern void  (lua_rawset) (lua_State *L, int idx);
extern void  (lua_rawseti) (lua_State *L, int idx, int n);
extern int   (lua_setmetatable) (lua_State *L, int objindex);
extern int   (lua_setfenv) (lua_State *L, int idx);




 
extern void  (lua_call) (lua_State *L, int nargs, int nresults);
extern int   (lua_pcall) (lua_State *L, int nargs, int nresults, int errfunc);
extern int   (lua_cpcall) (lua_State *L, lua_CFunction func, void *ud);
extern int   (lua_load) (lua_State *L, lua_Reader reader, void *dt,
                                        const char *chunkname);

extern int (lua_dump) (lua_State *L, lua_Writer writer, void *data);




 
extern int  (lua_yield) (lua_State *L, int nresults);
extern int  (lua_resume) (lua_State *L, int narg);
extern int  (lua_status) (lua_State *L);



 

#define LUA_GCSTOP		0
#define LUA_GCRESTART		1
#define LUA_GCCOLLECT		2
#define LUA_GCCOUNT		3
#define LUA_GCCOUNTB		4
#define LUA_GCSTEP		5
#define LUA_GCSETPAUSE		6
#define LUA_GCSETSTEPMUL	7

extern int (lua_gc) (lua_State *L, int what, int data);




 

extern int   (lua_error) (lua_State *L);

extern int   (lua_next) (lua_State *L, int idx);

extern void  (lua_concat) (lua_State *L, int n);

extern lua_Alloc (lua_getallocf) (lua_State *L, void **ud);
extern void lua_setallocf (lua_State *L, lua_Alloc f, void *ud);







 

#define lua_pop(L,n)		lua_settop(L, -(n)-1)

#define lua_newtable(L)		lua_createtable(L, 0, 0)

#define lua_register(L,n,f) (lua_pushcfunction(L, (f)), lua_setglobal(L, (n)))

#define lua_pushcfunction(L,f)	lua_pushcclosure(L, (f), 0)

#define lua_strlen(L,i)		lua_objlen(L, (i))

#define lua_isfunction(L,n)	(lua_type(L, (n)) == LUA_TFUNCTION)
#define lua_istable(L,n)	(lua_type(L, (n)) == LUA_TTABLE)
#define lua_islightuserdata(L,n)	(lua_type(L, (n)) == LUA_TLIGHTUSERDATA)
#define lua_isnil(L,n)		(lua_type(L, (n)) == LUA_TNIL)
#define lua_isboolean(L,n)	(lua_type(L, (n)) == LUA_TBOOLEAN)
#define lua_isthread(L,n)	(lua_type(L, (n)) == LUA_TTHREAD)
#define lua_isnone(L,n)		(lua_type(L, (n)) == LUA_TNONE)
#define lua_isnoneornil(L, n)	(lua_type(L, (n)) <= 0)

#define lua_pushliteral(L, s)		lua_pushlstring(L, "" s, (sizeof(s)/sizeof(char))-1)


#define lua_setglobal(L,s)	lua_setfield(L, LUA_GLOBALSINDEX, (s))
#define lua_getglobal(L,s)	lua_getfield(L, LUA_GLOBALSINDEX, (s))

#define lua_tostring(L,i)	lua_tolstring(L, (i), NULL)





 

#define lua_open()	luaL_newstate()

#define lua_getregistry(L)	lua_pushvalue(L, LUA_REGISTRYINDEX)

#define lua_getgccount(L)	lua_gc(L, LUA_GCCOUNT, 0)

#define lua_Chunkreader		lua_Reader
#define lua_Chunkwriter		lua_Writer


 
extern void lua_setlevel	(lua_State *from, lua_State *to);






 




 
#define LUA_HOOKCALL	0
#define LUA_HOOKRET	1
#define LUA_HOOKLINE	2
#define LUA_HOOKCOUNT	3
#define LUA_HOOKTAILRET 4




 
#define LUA_MASKCALL	(1 << LUA_HOOKCALL)
#define LUA_MASKRET	(1 << LUA_HOOKRET)
#define LUA_MASKLINE	(1 << LUA_HOOKLINE)
#define LUA_MASKCOUNT	(1 << LUA_HOOKCOUNT)

typedef struct lua_Debug lua_Debug;   


 
typedef void (*lua_Hook) (lua_State *L, lua_Debug *ar);


extern int lua_getstack (lua_State *L, int level, lua_Debug *ar);
extern int lua_getinfo (lua_State *L, const char *what, lua_Debug *ar);
extern const char *lua_getlocal (lua_State *L, const lua_Debug *ar, int n);
extern const char *lua_setlocal (lua_State *L, const lua_Debug *ar, int n);
extern const char *lua_getupvalue (lua_State *L, int funcindex, int n);
extern const char *lua_setupvalue (lua_State *L, int funcindex, int n);

extern int lua_sethook (lua_State *L, lua_Hook func, int mask, int count);
extern lua_Hook lua_gethook (lua_State *L);
extern int lua_gethookmask (lua_State *L);
extern int lua_gethookcount (lua_State *L);


struct lua_Debug {
  int event;
  const char *name;	 
  const char *namewhat;	 
  const char *what;	 
  const char *source;	 
  int currentline;	 
  int nups;		 
  int linedefined;	 
  int lastlinedefined;	 
  char short_src[60];  
   
  int i_ci;   
};

 























 


# 50 "server.h"
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





 

 


 
# 159 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

 
#undef	__need_ptrdiff_t



 


 
# 238 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#undef	__need_size_t






 


 
# 347 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#undef	__need_wchar_t


# 361 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 
 
 
# 395 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 


#undef NULL		 




#define NULL ((void *)0)





#undef	__need_NULL



 
#define offsetof(TYPE, MEMBER) __builtin_offsetof (TYPE, MEMBER)

# 440 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

# 447 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



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





 

 


 
# 159 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

 
#undef	__need_ptrdiff_t



 


 
# 238 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#undef	__need_size_t






 


 
# 347 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
#undef	__need_wchar_t


# 361 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"


 
 
 
# 395 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



 


#undef NULL		 




#define NULL ((void *)0)





#undef	__need_NULL



 
#define offsetof(TYPE, MEMBER) __builtin_offsetof (TYPE, MEMBER)

# 440 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"

# 447 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"



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



# 51 "server.h"

typedef long long mstime_t;  

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

# 55 "server.h"
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

# 57 "server.h"
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

# 58 "server.h"
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






# 59 "server.h"
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

# 60 "server.h"
# 1 "ziplist.h"




























 


#define _ZIPLIST_H

#define ZIPLIST_HEAD 0
#define ZIPLIST_TAIL 1

unsigned char *ziplistNew(void);
unsigned char *ziplistMerge(unsigned char **first, unsigned char **second);
unsigned char *ziplistPush(unsigned char *zl, unsigned char *s, unsigned int slen, int where);
unsigned char *ziplistIndex(unsigned char *zl, int index);
unsigned char *ziplistNext(unsigned char *zl, unsigned char *p);
unsigned char *ziplistPrev(unsigned char *zl, unsigned char *p);
unsigned int ziplistGet(unsigned char *p, unsigned char **sval, unsigned int *slen, long long *lval);
unsigned char *ziplistInsert(unsigned char *zl, unsigned char *p, unsigned char *s, unsigned int slen);
unsigned char *ziplistDelete(unsigned char *zl, unsigned char **p);
unsigned char *ziplistDeleteRange(unsigned char *zl, int index, unsigned int num);
unsigned int ziplistCompare(unsigned char *p, unsigned char *s, unsigned int slen);
unsigned char *ziplistFind(unsigned char *p, unsigned char *vstr, unsigned int vlen, unsigned int skip);
unsigned int ziplistLen(unsigned char *zl);
size_t ziplistBlobLen(unsigned char *zl);
void ziplistRepr(unsigned char *zl);





# 61 "server.h"
# 1 "intset.h"




























 


#define __INTSET_H


typedef struct intset {
    uint32_t encoding;
    uint32_t length;
    int8_t contents[];
} intset;

intset *intsetNew(void);
intset *intsetAdd(intset *is, int64_t value, uint8_t *success);
intset *intsetRemove(intset *is, int64_t value, int *success);
uint8_t intsetFind(intset *is, int64_t value);
int64_t intsetRandom(intset *is);
uint8_t intsetGet(intset *is, uint32_t pos, int64_t *value);
uint32_t intsetLen(const intset *is);
size_t intsetBlobLen(intset *is);





# 62 "server.h"
# 1 "version.h"
#define REDIS_VERSION "999.999.999"
# 63 "server.h"
# 1 "util.h"



























 


#define __REDIS_UTIL_H






 
#define MAX_LONG_DOUBLE_CHARS 5*1024

int stringmatchlen(const char *p, int plen, const char *s, int slen, int nocase);
int stringmatch(const char *p, const char *s, int nocase);
int stringmatchlen_fuzz_test(void);
long long memtoll(const char *p, int *err);
uint32_t digits10(uint64_t v);
uint32_t sdigits10(int64_t v);
int ll2string(char *s, size_t len, long long value);
int string2ll(const char *s, size_t slen, long long *value);
int string2l(const char *s, size_t slen, long *value);
int string2ld(const char *s, size_t slen, long double *dp);
int d2string(char *buf, size_t len, double value);
int ld2string(char *buf, size_t len, long double value, int humanfriendly);
sds getAbsolutePath(char *filename);
unsigned long getTimeZone(void);
int pathIsBaseName(char *path);





# 64 "server.h"
# 1 "latency.h"































 


#define __LATENCY_H

#define LATENCY_TS_LEN 160  


 
struct latencySample {
    int32_t time;  
    uint32_t latency;  
};

 
struct latencyTimeSeries {
    int idx;  
    uint32_t max;  
    struct latencySample samples[160];  
};

 
struct latencyStats {
    uint32_t all_time_high;  
    uint32_t avg;            
    uint32_t min;            
    uint32_t max;            
    uint32_t mad;            
    uint32_t samples;        
    time_t period;           
};

void latencyMonitorInit(void);
void latencyAddSample(char *event, mstime_t latency);
int THPIsEnabled(void);

 

 
#define latencyStartMonitor(var) if (server.latency_monitor_threshold) {     var = mstime(); } else {     var = 0; }






 
#define latencyEndMonitor(var) if (server.latency_monitor_threshold) {     var = mstime() - var; }



 
#define latencyAddSampleIfNeeded(event,var)     if (server.latency_monitor_threshold &&         (var) >= server.latency_monitor_threshold)           latencyAddSample((event),(var));




 
#define latencyRemoveNestedEvent(event_var,nested_var)     event_var += nested_var;


# 65 "server.h"
# 1 "sparkline.h"



























 


#define __SPARKLINE_H

 
struct sample {
    double value;
    char *label;
};

struct sequence {
    int length;
    int labels;
    struct sample *samples;
    double min, max;
};

#define SPARKLINE_NO_FLAGS 0
#define SPARKLINE_FILL 1       
#define SPARKLINE_LOG_SCALE 2  

struct sequence *createSparklineSequence(void);
void sparklineSequenceAddSample(struct sequence *seq, double value, char *label);
void freeSparklineSequence(struct sequence *seq);
sds sparklineRenderRange(sds output, struct sequence *seq, int rows, int offset, int len, int flags);
sds sparklineRender(sds output, struct sequence *seq, int columns, int rows, int flags);

# 66 "server.h"
# 1 "quicklist.h"




























 


#define __QUICKLIST_H__

 








 
typedef struct quicklistNode {
    struct quicklistNode *prev;
    struct quicklistNode *next;
    unsigned char *zl;
    unsigned int sz;              
    unsigned int count : 16;      
    unsigned int encoding : 2;    
    unsigned int container : 2;   
    unsigned int recompress : 1;  
    unsigned int attempted_compress : 1;  
    unsigned int extra : 10;  
} quicklistNode;





 
typedef struct quicklistLZF {
    unsigned int sz;  
    char compressed[];
} quicklistLZF;






 
typedef struct quicklist {
    quicklistNode *head;
    quicklistNode *tail;
    unsigned long count;         
    unsigned long len;           
    int fill : 16;               
    unsigned int compress : 16;  
} quicklist;

typedef struct quicklistIter {
    const quicklist *quicklist;
    quicklistNode *current;
    unsigned char *zi;
    long offset;  
    int direction;
} quicklistIter;

typedef struct quicklistEntry {
    const quicklist *quicklist;
    quicklistNode *node;
    unsigned char *zi;
    unsigned char *value;
    long long longval;
    unsigned int sz;
    int offset;
} quicklistEntry;

#define QUICKLIST_HEAD 0
#define QUICKLIST_TAIL -1

 
#define QUICKLIST_NODE_ENCODING_RAW 1
#define QUICKLIST_NODE_ENCODING_LZF 2

 
#define QUICKLIST_NOCOMPRESS 0

 
#define QUICKLIST_NODE_CONTAINER_NONE 1
#define QUICKLIST_NODE_CONTAINER_ZIPLIST 2

#define quicklistNodeIsCompressed(node)                                            ((node)->encoding == QUICKLIST_NODE_ENCODING_LZF)


 
quicklist *quicklistCreate(void);
quicklist *quicklistNew(int fill, int compress);
void quicklistSetCompressDepth(quicklist *quicklist, int depth);
void quicklistSetFill(quicklist *quicklist, int fill);
void quicklistSetOptions(quicklist *quicklist, int fill, int depth);
void quicklistRelease(quicklist *quicklist);
int quicklistPushHead(quicklist *quicklist, void *value, const size_t sz);
int quicklistPushTail(quicklist *quicklist, void *value, const size_t sz);
void quicklistPush(quicklist *quicklist, void *value, const size_t sz,
                   int where);
void quicklistAppendZiplist(quicklist *quicklist, unsigned char *zl);
quicklist *quicklistAppendValuesFromZiplist(quicklist *quicklist,
                                            unsigned char *zl);
quicklist *quicklistCreateFromZiplist(int fill, int compress,
                                      unsigned char *zl);
void quicklistInsertAfter(quicklist *quicklist, quicklistEntry *node,
                          void *value, const size_t sz);
void quicklistInsertBefore(quicklist *quicklist, quicklistEntry *node,
                           void *value, const size_t sz);
void quicklistDelEntry(quicklistIter *iter, quicklistEntry *entry);
int quicklistReplaceAtIndex(quicklist *quicklist, long index, void *data,
                            int sz);
int quicklistDelRange(quicklist *quicklist, const long start, const long stop);
quicklistIter *quicklistGetIterator(const quicklist *quicklist, int direction);
quicklistIter *quicklistGetIteratorAtIdx(const quicklist *quicklist,
                                         int direction, const long long idx);
int quicklistNext(quicklistIter *iter, quicklistEntry *node);
void quicklistReleaseIterator(quicklistIter *iter);
quicklist *quicklistDup(quicklist *orig);
int quicklistIndex(const quicklist *quicklist, const long long index,
                   quicklistEntry *entry);
void quicklistRewind(quicklist *quicklist, quicklistIter *li);
void quicklistRewindTail(quicklist *quicklist, quicklistIter *li);
void quicklistRotate(quicklist *quicklist);
int quicklistPopCustom(quicklist *quicklist, int where, unsigned char **data,
                       unsigned int *sz, long long *sval,
                       void *(*saver)(unsigned char *data, unsigned int sz));
int quicklistPop(quicklist *quicklist, int where, unsigned char **data,
                 unsigned int *sz, long long *slong);
unsigned long quicklistCount(const quicklist *ql);
int quicklistCompare(unsigned char *p1, unsigned char *p2, int p2_len);
size_t quicklistGetLzf(const quicklistNode *node, void **data);





 
#define AL_START_HEAD 0
#define AL_START_TAIL 1

# 68 "server.h"
# 1 "rax.h"




























 


#define RAX_H






























































 

#define RAX_NODE_MAX_SIZE ((1<<29)-1)
typedef struct raxNode {
    uint32_t iskey:1;      
    uint32_t isnull:1;     
    uint32_t iscompr:1;    
    uint32_t size:29;      
    

























 
    unsigned char data[];
} raxNode;

typedef struct rax {
    raxNode *head;
    uint64_t numele;
    uint64_t numnodes;
} rax;



 
#define RAX_STACK_STATIC_ITEMS 32
typedef struct raxStack {
    void **stack;  
    size_t items, maxitems;  
    
 
    void *static_items[32];
    int oom;  
} raxStack;













 
typedef int (*raxNodeCallback)(raxNode **noderef);

 
#define RAX_ITER_STATIC_LEN 128
#define RAX_ITER_JUST_SEEKED (1<<0) #define RAX_ITER_EOF (1<<1)     



#define RAX_ITER_SAFE (1<<2)   typedef struct raxIterator {


    int flags;
    rax *rt;                 
    unsigned char *key;      
    void *data;              
    size_t key_len;          
    size_t key_max;          
    unsigned char key_static_string[128];
    raxNode *node;           
    raxStack stack;          
    raxNodeCallback node_cb;  
} raxIterator;

 
extern void *raxNotFound;

 
rax *raxNew(void);
int raxInsert(rax *rax, unsigned char *s, size_t len, void *data, void **old);
int raxTryInsert(rax *rax, unsigned char *s, size_t len, void *data, void **old);
int raxRemove(rax *rax, unsigned char *s, size_t len, void **old);
void *raxFind(rax *rax, unsigned char *s, size_t len);
void raxFree(rax *rax);
void raxFreeWithCallback(rax *rax, void (*free_callback)(void*));
void raxStart(raxIterator *it, rax *rt);
int raxSeek(raxIterator *it, const char *op, unsigned char *ele, size_t len);
int raxNext(raxIterator *it);
int raxPrev(raxIterator *it);
int raxRandomWalk(raxIterator *it, size_t steps);
int raxCompare(raxIterator *iter, const char *op, unsigned char *key, size_t key_len);
void raxStop(raxIterator *it);
int raxEOF(raxIterator *it);
void raxShow(rax *rax);
uint64_t raxSize(rax *rax);
unsigned long raxTouch(raxNode *n);
void raxSetDebugMsg(int onoff);


 
void raxSetData(raxNode *n, void *data);

# 69 "server.h"

 
# 1 "zipmap.h"
































 


#define _ZIPMAP_H

unsigned char *zipmapNew(void);
unsigned char *zipmapSet(unsigned char *zm, unsigned char *key, unsigned int klen, unsigned char *val, unsigned int vlen, int *update);
unsigned char *zipmapDel(unsigned char *zm, unsigned char *key, unsigned int klen, int *deleted);
unsigned char *zipmapRewind(unsigned char *zm);
unsigned char *zipmapNext(unsigned char *zm, unsigned char **key, unsigned int *klen, unsigned char **value, unsigned int *vlen);
int zipmapGet(unsigned char *zm, unsigned char *key, unsigned int klen, unsigned char **value, unsigned int *vlen);
int zipmapExists(unsigned char *zm, unsigned char *key, unsigned int klen);
unsigned int zipmapLen(unsigned char *zm);
size_t zipmapBlobLen(unsigned char *zm);
void zipmapRepr(unsigned char *p);





# 72 "server.h"
# 1 "sha1.h"

#define SHA1_H
 




 

typedef struct {
    uint32_t state[5];
    uint32_t count[2];
    unsigned char buffer[64];
} SHA1_CTX;

void SHA1Transform(uint32_t state[5], const unsigned char buffer[64]);
void SHA1Init(SHA1_CTX* context);
void SHA1Update(SHA1_CTX* context, const unsigned char* data, uint32_t len);
void SHA1Final(unsigned char digest[20], SHA1_CTX* context);

# 73 "server.h"
# 1 "endianconv.h"






























 


#define __ENDIANCONV_H




void memrev16(void *p);
void memrev32(void *p);
void memrev64(void *p);
uint16_t intrev16(uint16_t v);
uint32_t intrev32(uint32_t v);
uint64_t intrev64(uint64_t v);


 

#define memrev16ifbe(p) ((void)(0))
#define memrev32ifbe(p) ((void)(0))
#define memrev64ifbe(p) ((void)(0))
#define intrev16ifbe(v) (v)
#define intrev32ifbe(v) (v)
#define intrev64ifbe(v) (v)
# 63 "endianconv.h"


 




#define htonu64(v) intrev64(v)
#define ntohu64(v) intrev64(v)






# 74 "server.h"
# 1 "crc64.h"

#define CRC64_H



uint64_t crc64(uint64_t crc, const unsigned char *s, uint64_t l);





# 75 "server.h"

 
#define C_OK                    0
#define C_ERR                   -1

 
#define CONFIG_DEFAULT_DYNAMIC_HZ 1              
#define CONFIG_DEFAULT_HZ        10              
#define CONFIG_MIN_HZ            1
#define CONFIG_MAX_HZ            500
#define MAX_CLIENTS_PER_CLOCK_TICK 200           
#define CONFIG_DEFAULT_SERVER_PORT        6379   
#define CONFIG_DEFAULT_TCP_BACKLOG       511     
#define CONFIG_DEFAULT_CLIENT_TIMEOUT       0    
#define CONFIG_DEFAULT_DBNUM     16
#define CONFIG_DEFAULT_IO_THREADS_NUM 1          
#define CONFIG_DEFAULT_IO_THREADS_DO_READS 0     
#define CONFIG_MAX_LINE    1024
#define CRON_DBS_PER_CALL 16
#define NET_MAX_WRITES_PER_EVENT (1024*64)
#define PROTO_SHARED_SELECT_CMDS 10
#define OBJ_SHARED_INTEGERS 10000
#define OBJ_SHARED_BULKHDR_LEN 32
#define LOG_MAX_LEN    1024  
#define AOF_REWRITE_PERC  100
#define AOF_REWRITE_MIN_SIZE (64*1024*1024)
#define AOF_REWRITE_ITEMS_PER_CMD 64
#define AOF_READ_DIFF_INTERVAL_BYTES (1024*10)
#define CONFIG_DEFAULT_SLOWLOG_LOG_SLOWER_THAN 10000
#define CONFIG_DEFAULT_SLOWLOG_MAX_LEN 128
#define CONFIG_DEFAULT_MAX_CLIENTS 10000
#define CONFIG_AUTHPASS_MAX_LEN 512
#define CONFIG_DEFAULT_SLAVE_PRIORITY 100
#define CONFIG_DEFAULT_REPL_TIMEOUT 60
#define CONFIG_DEFAULT_REPL_PING_SLAVE_PERIOD 10
#define CONFIG_RUN_ID_SIZE 40
#define RDB_EOF_MARK_SIZE 40
#define CONFIG_DEFAULT_REPL_BACKLOG_SIZE (1024*1024)     
#define CONFIG_DEFAULT_REPL_BACKLOG_TIME_LIMIT (60*60)   
#define CONFIG_REPL_BACKLOG_MIN_SIZE (1024*16)           
#define CONFIG_BGSAVE_RETRY_DELAY 5  
#define CONFIG_DEFAULT_PID_FILE "/var/run/redis.pid"
#define CONFIG_DEFAULT_SYSLOG_IDENT "redis"
#define CONFIG_DEFAULT_CLUSTER_CONFIG_FILE "nodes.conf"
#define CONFIG_DEFAULT_CLUSTER_ANNOUNCE_IP NULL          
#define CONFIG_DEFAULT_CLUSTER_ANNOUNCE_PORT 0           
#define CONFIG_DEFAULT_CLUSTER_ANNOUNCE_BUS_PORT 0       
#define CONFIG_DEFAULT_DAEMONIZE 0
#define CONFIG_DEFAULT_UNIX_SOCKET_PERM 0
#define CONFIG_DEFAULT_TCP_KEEPALIVE 300
#define CONFIG_DEFAULT_PROTECTED_MODE 1
#define CONFIG_DEFAULT_GOPHER_ENABLED 0
#define CONFIG_DEFAULT_LOGFILE ""
#define CONFIG_DEFAULT_SYSLOG_ENABLED 0
#define CONFIG_DEFAULT_STOP_WRITES_ON_BGSAVE_ERROR 1
#define CONFIG_DEFAULT_RDB_COMPRESSION 1
#define CONFIG_DEFAULT_RDB_CHECKSUM 1
#define CONFIG_DEFAULT_RDB_FILENAME "dump.rdb"
#define CONFIG_DEFAULT_REPL_DISKLESS_SYNC 0
#define CONFIG_DEFAULT_REPL_DISKLESS_SYNC_DELAY 5
#define CONFIG_DEFAULT_SLAVE_SERVE_STALE_DATA 1
#define CONFIG_DEFAULT_SLAVE_READ_ONLY 1
#define CONFIG_DEFAULT_SLAVE_IGNORE_MAXMEMORY 1
#define CONFIG_DEFAULT_SLAVE_ANNOUNCE_IP NULL
#define CONFIG_DEFAULT_SLAVE_ANNOUNCE_PORT 0
#define CONFIG_DEFAULT_REPL_DISABLE_TCP_NODELAY 0
#define CONFIG_DEFAULT_MAXMEMORY 0
#define CONFIG_DEFAULT_MAXMEMORY_SAMPLES 5
#define CONFIG_DEFAULT_LFU_LOG_FACTOR 10
#define CONFIG_DEFAULT_LFU_DECAY_TIME 1
#define CONFIG_DEFAULT_AOF_FILENAME "appendonly.aof"
#define CONFIG_DEFAULT_AOF_NO_FSYNC_ON_REWRITE 0
#define CONFIG_DEFAULT_AOF_LOAD_TRUNCATED 1
#define CONFIG_DEFAULT_AOF_USE_RDB_PREAMBLE 1
#define CONFIG_DEFAULT_ACTIVE_REHASHING 1
#define CONFIG_DEFAULT_AOF_REWRITE_INCREMENTAL_FSYNC 1
#define CONFIG_DEFAULT_RDB_SAVE_INCREMENTAL_FSYNC 1
#define CONFIG_DEFAULT_MIN_SLAVES_TO_WRITE 0
#define CONFIG_DEFAULT_MIN_SLAVES_MAX_LAG 10
#define CONFIG_DEFAULT_ACL_FILENAME ""
#define NET_IP_STR_LEN 46  
#define NET_PEER_ID_LEN (NET_IP_STR_LEN+32)  
#define CONFIG_BINDADDR_MAX 16
#define CONFIG_MIN_RESERVED_FDS 32
#define CONFIG_DEFAULT_LATENCY_MONITOR_THRESHOLD 0
#define CONFIG_DEFAULT_SLAVE_LAZY_FLUSH 0
#define CONFIG_DEFAULT_LAZYFREE_LAZY_EVICTION 0
#define CONFIG_DEFAULT_LAZYFREE_LAZY_EXPIRE 0
#define CONFIG_DEFAULT_LAZYFREE_LAZY_SERVER_DEL 0
#define CONFIG_DEFAULT_ALWAYS_SHOW_LOGO 0
#define CONFIG_DEFAULT_ACTIVE_DEFRAG 0
#define CONFIG_DEFAULT_DEFRAG_THRESHOLD_LOWER 10  
#define CONFIG_DEFAULT_DEFRAG_THRESHOLD_UPPER 100  
#define CONFIG_DEFAULT_DEFRAG_IGNORE_BYTES (100<<20)  
#define CONFIG_DEFAULT_DEFRAG_CYCLE_MIN 5  
#define CONFIG_DEFAULT_DEFRAG_CYCLE_MAX 75  
#define CONFIG_DEFAULT_DEFRAG_MAX_SCAN_FIELDS 1000  
#define CONFIG_DEFAULT_PROTO_MAX_BULK_LEN (512ll*1024*1024)  

#define ACTIVE_EXPIRE_CYCLE_LOOKUPS_PER_LOOP 20  
#define ACTIVE_EXPIRE_CYCLE_FAST_DURATION 1000  
#define ACTIVE_EXPIRE_CYCLE_SLOW_TIME_PERC 25  
#define ACTIVE_EXPIRE_CYCLE_SLOW 0
#define ACTIVE_EXPIRE_CYCLE_FAST 1

 
#define STATS_METRIC_SAMPLES 16      
#define STATS_METRIC_COMMAND 0       
#define STATS_METRIC_NET_INPUT 1     
#define STATS_METRIC_NET_OUTPUT 2    
#define STATS_METRIC_COUNT 3

 
#define PROTO_MAX_QUERYBUF_LEN  (1024*1024*1024)  
#define PROTO_IOBUF_LEN         (1024*16)   
#define PROTO_REPLY_CHUNK_BYTES (16*1024)  
#define PROTO_INLINE_MAX_SIZE   (1024*64)  
#define PROTO_MBULK_BIG_ARG     (1024*32)
#define LONG_STR_SIZE      21           
#define REDIS_AUTOSYNC_BYTES (1024*1024*32)  

#define LIMIT_PENDING_QUERYBUF (4*1024*1024)  




 
#define CONFIG_FDSET_INCR (CONFIG_MIN_RESERVED_FDS+96)

 
#define HASHTABLE_MIN_FILL        10       


 
#define CMD_WRITE (1ULL<<0)             
#define CMD_READONLY (1ULL<<1)          
#define CMD_DENYOOM (1ULL<<2)           
#define CMD_MODULE (1ULL<<3)            
#define CMD_ADMIN (1ULL<<4)             
#define CMD_PUBSUB (1ULL<<5)            
#define CMD_NOSCRIPT (1ULL<<6)          
#define CMD_RANDOM (1ULL<<7)            
#define CMD_SORT_FOR_SCRIPT (1ULL<<8)   
#define CMD_LOADING (1ULL<<9)           
#define CMD_STALE (1ULL<<10)            
#define CMD_SKIP_MONITOR (1ULL<<11)     
#define CMD_ASKING (1ULL<<12)           
#define CMD_FAST (1ULL<<13)             

 
#define CMD_MODULE_GETKEYS (1ULL<<14)   
#define CMD_MODULE_NO_CLUSTER (1ULL<<15)  

 
#define CMD_CATEGORY_KEYSPACE (1ULL<<16)
#define CMD_CATEGORY_READ (1ULL<<17)
#define CMD_CATEGORY_WRITE (1ULL<<18)
#define CMD_CATEGORY_SET (1ULL<<19)
#define CMD_CATEGORY_SORTEDSET (1ULL<<20)
#define CMD_CATEGORY_LIST (1ULL<<21)
#define CMD_CATEGORY_HASH (1ULL<<22)
#define CMD_CATEGORY_STRING (1ULL<<23)
#define CMD_CATEGORY_BITMAP (1ULL<<24)
#define CMD_CATEGORY_HYPERLOGLOG (1ULL<<25)
#define CMD_CATEGORY_GEO (1ULL<<26)
#define CMD_CATEGORY_STREAM (1ULL<<27)
#define CMD_CATEGORY_PUBSUB (1ULL<<28)
#define CMD_CATEGORY_ADMIN (1ULL<<29)
#define CMD_CATEGORY_FAST (1ULL<<30)
#define CMD_CATEGORY_SLOW (1ULL<<31)
#define CMD_CATEGORY_BLOCKING (1ULL<<32)
#define CMD_CATEGORY_DANGEROUS (1ULL<<33)
#define CMD_CATEGORY_CONNECTION (1ULL<<34)
#define CMD_CATEGORY_TRANSACTION (1ULL<<35)
#define CMD_CATEGORY_SCRIPTING (1ULL<<36)

 
#define AOF_OFF 0              
#define AOF_ON 1               
#define AOF_WAIT_REWRITE 2     

 
#define CLIENT_SLAVE (1<<0)    
#define CLIENT_MASTER (1<<1)   
#define CLIENT_MONITOR (1<<2)  
#define CLIENT_MULTI (1<<3)    
#define CLIENT_BLOCKED (1<<4)  
#define CLIENT_DIRTY_CAS (1<<5)  
#define CLIENT_CLOSE_AFTER_REPLY (1<<6)  
#define CLIENT_UNBLOCKED (1<<7) #define CLIENT_LUA (1<<8)  


#define CLIENT_ASKING (1<<9)      
#define CLIENT_CLOSE_ASAP (1<<10) 
#define CLIENT_UNIX_SOCKET (1<<11)  
#define CLIENT_DIRTY_EXEC (1<<12)   
#define CLIENT_MASTER_FORCE_REPLY (1<<13)   
#define CLIENT_FORCE_AOF (1<<14)    
#define CLIENT_FORCE_REPL (1<<15)   
#define CLIENT_PRE_PSYNC (1<<16)    
#define CLIENT_READONLY (1<<17)     
#define CLIENT_PUBSUB (1<<18)       
#define CLIENT_PREVENT_AOF_PROP (1<<19)   
#define CLIENT_PREVENT_REPL_PROP (1<<20)   
#define CLIENT_PREVENT_PROP (CLIENT_PREVENT_AOF_PROP|CLIENT_PREVENT_REPL_PROP)
#define CLIENT_PENDING_WRITE (1<<21) #define CLIENT_REPLY_OFF (1<<22)    


#define CLIENT_REPLY_SKIP_NEXT (1<<23)   
#define CLIENT_REPLY_SKIP (1<<24)   
#define CLIENT_LUA_DEBUG (1<<25)   
#define CLIENT_LUA_DEBUG_SYNC (1<<26)   
#define CLIENT_MODULE (1<<27)  
#define CLIENT_PROTECTED (1<<28)  
#define CLIENT_PENDING_READ (1<<29) #define CLIENT_PENDING_COMMAND (1<<30)  





 
#define BLOCKED_NONE 0     
#define BLOCKED_LIST 1     
#define BLOCKED_WAIT 2     
#define BLOCKED_MODULE 3   
#define BLOCKED_STREAM 4   
#define BLOCKED_ZSET 5     
#define BLOCKED_NUM 6      

 
#define PROTO_REQ_INLINE 1
#define PROTO_REQ_MULTIBULK 2


 
#define CLIENT_TYPE_NORMAL 0  
#define CLIENT_TYPE_SLAVE 1   
#define CLIENT_TYPE_PUBSUB 2  
#define CLIENT_TYPE_MASTER 3  
#define CLIENT_TYPE_OBUF_COUNT 3 




 
#define REPL_STATE_NONE 0  
#define REPL_STATE_CONNECT 1  
#define REPL_STATE_CONNECTING 2  
 
#define REPL_STATE_RECEIVE_PONG 3  
#define REPL_STATE_SEND_AUTH 4  
#define REPL_STATE_RECEIVE_AUTH 5  
#define REPL_STATE_SEND_PORT 6  
#define REPL_STATE_RECEIVE_PORT 7  
#define REPL_STATE_SEND_IP 8  
#define REPL_STATE_RECEIVE_IP 9  
#define REPL_STATE_SEND_CAPA 10  
#define REPL_STATE_RECEIVE_CAPA 11  
#define REPL_STATE_SEND_PSYNC 12  
#define REPL_STATE_RECEIVE_PSYNC 13  
 
#define REPL_STATE_TRANSFER 14  
#define REPL_STATE_CONNECTED 15  




 
#define SLAVE_STATE_WAIT_BGSAVE_START 6  
#define SLAVE_STATE_WAIT_BGSAVE_END 7  
#define SLAVE_STATE_SEND_BULK 8  
#define SLAVE_STATE_ONLINE 9  

 
#define SLAVE_CAPA_NONE 0
#define SLAVE_CAPA_EOF (1<<0)     
#define SLAVE_CAPA_PSYNC2 (1<<1)  

 
#define CONFIG_REPL_SYNCIO_TIMEOUT 5

 
#define LIST_HEAD 0
#define LIST_TAIL 1
#define ZSET_MIN 0
#define ZSET_MAX 1

 
#define SORT_OP_GET 0

 
#define LL_DEBUG 0
#define LL_VERBOSE 1
#define LL_NOTICE 2
#define LL_WARNING 3
#define LL_RAW (1<<10)  
#define CONFIG_DEFAULT_VERBOSITY LL_NOTICE

 
#define SUPERVISED_NONE 0
#define SUPERVISED_AUTODETECT 1
#define SUPERVISED_SYSTEMD 2
#define SUPERVISED_UPSTART 3

 
#define UNUSED(V) ((void) V)

#define ZSKIPLIST_MAXLEVEL 64  
#define ZSKIPLIST_P 0.25       

 
#define AOF_FSYNC_NO 0
#define AOF_FSYNC_ALWAYS 1
#define AOF_FSYNC_EVERYSEC 2
#define CONFIG_DEFAULT_AOF_FSYNC AOF_FSYNC_EVERYSEC

 
#define OBJ_HASH_MAX_ZIPLIST_ENTRIES 512
#define OBJ_HASH_MAX_ZIPLIST_VALUE 64
#define OBJ_SET_MAX_INTSET_ENTRIES 512
#define OBJ_ZSET_MAX_ZIPLIST_ENTRIES 128
#define OBJ_ZSET_MAX_ZIPLIST_VALUE 64
#define OBJ_STREAM_NODE_MAX_BYTES 4096
#define OBJ_STREAM_NODE_MAX_ENTRIES 100

 
#define OBJ_LIST_MAX_ZIPLIST_SIZE -2
#define OBJ_LIST_COMPRESS_DEPTH 0

 
#define CONFIG_DEFAULT_HLL_SPARSE_MAX_BYTES 3000

 
#define SET_OP_UNION 0
#define SET_OP_DIFF 1
#define SET_OP_INTER 2



 
#define MAXMEMORY_FLAG_LRU (1<<0)
#define MAXMEMORY_FLAG_LFU (1<<1)
#define MAXMEMORY_FLAG_ALLKEYS (1<<2)
#define MAXMEMORY_FLAG_NO_SHARED_INTEGERS     (MAXMEMORY_FLAG_LRU|MAXMEMORY_FLAG_LFU)


#define MAXMEMORY_VOLATILE_LRU ((0<<8)|MAXMEMORY_FLAG_LRU)
#define MAXMEMORY_VOLATILE_LFU ((1<<8)|MAXMEMORY_FLAG_LFU)
#define MAXMEMORY_VOLATILE_TTL (2<<8)
#define MAXMEMORY_VOLATILE_RANDOM (3<<8)
#define MAXMEMORY_ALLKEYS_LRU ((4<<8)|MAXMEMORY_FLAG_LRU|MAXMEMORY_FLAG_ALLKEYS)
#define MAXMEMORY_ALLKEYS_LFU ((5<<8)|MAXMEMORY_FLAG_LFU|MAXMEMORY_FLAG_ALLKEYS)
#define MAXMEMORY_ALLKEYS_RANDOM ((6<<8)|MAXMEMORY_FLAG_ALLKEYS)
#define MAXMEMORY_NO_EVICTION (7<<8)

#define CONFIG_DEFAULT_MAXMEMORY_POLICY MAXMEMORY_NO_EVICTION

 
#define LUA_SCRIPT_TIME_LIMIT 5000  

 
#define UNIT_SECONDS 0
#define UNIT_MILLISECONDS 1

 
#define SHUTDOWN_NOFLAGS 0       
#define SHUTDOWN_SAVE 1         #define SHUTDOWN_NOSAVE 2        



 
#define CMD_CALL_NONE 0
#define CMD_CALL_SLOWLOG (1<<0)
#define CMD_CALL_STATS (1<<1)
#define CMD_CALL_PROPAGATE_AOF (1<<2)
#define CMD_CALL_PROPAGATE_REPL (1<<3)
#define CMD_CALL_PROPAGATE (CMD_CALL_PROPAGATE_AOF|CMD_CALL_PROPAGATE_REPL)
#define CMD_CALL_FULL (CMD_CALL_SLOWLOG | CMD_CALL_STATS | CMD_CALL_PROPAGATE)

 
#define PROPAGATE_NONE 0
#define PROPAGATE_AOF 1
#define PROPAGATE_REPL 2

 
#define RDB_CHILD_TYPE_NONE 0
#define RDB_CHILD_TYPE_DISK 1      
#define RDB_CHILD_TYPE_SOCKET 2    


 
#define NOTIFY_KEYSPACE (1<<0)     
#define NOTIFY_KEYEVENT (1<<1)     
#define NOTIFY_GENERIC (1<<2)      
#define NOTIFY_STRING (1<<3)       
#define NOTIFY_LIST (1<<4)         
#define NOTIFY_SET (1<<5)          
#define NOTIFY_HASH (1<<6)         
#define NOTIFY_ZSET (1<<7)         
#define NOTIFY_EXPIRED (1<<8)      
#define NOTIFY_EVICTED (1<<9)      
#define NOTIFY_STREAM (1<<10)      
#define NOTIFY_KEY_MISS (1<<11)    
#define NOTIFY_ALL (NOTIFY_GENERIC | NOTIFY_STRING | NOTIFY_LIST | NOTIFY_SET | NOTIFY_HASH | NOTIFY_ZSET | NOTIFY_EXPIRED | NOTIFY_EVICTED | NOTIFY_STREAM | NOTIFY_KEY_MISS)  

 
#define NET_FIRST_BIND_ADDR (server.bindaddr_count ? server.bindaddr[0] : NULL)



 
#define run_with_period(_ms_) if ((_ms_ <= 1000/server.hz) || !(server.cronloops%((_ms_)/(1000/server.hz))))

 
#define serverAssertWithInfo(_c,_o,_e) ((_e)?(void)0 : (_serverAssertWithInfo(_c,_o,#_e,__FILE__,__LINE__),_exit(1)))
#define serverAssert(_e) ((_e)?(void)0 : (_serverAssert(#_e,__FILE__,__LINE__),_exit(1)))
#define serverPanic(...) _serverPanic(__FILE__,__LINE__,__VA_ARGS__),_exit(1)



 

 

 
#define OBJ_STRING 0     
#define OBJ_LIST 1       
#define OBJ_SET 2        
#define OBJ_ZSET 3       
#define OBJ_HASH 4       











 
#define OBJ_MODULE 5     
#define OBJ_STREAM 6     

 
#define REDISMODULE_TYPE_ENCVER_BITS 10
#define REDISMODULE_TYPE_ENCVER_MASK ((1<<REDISMODULE_TYPE_ENCVER_BITS)-1)
#define REDISMODULE_TYPE_ENCVER(id) (id & REDISMODULE_TYPE_ENCVER_MASK)
#define REDISMODULE_TYPE_SIGN(id) ((id & ~((uint64_t)REDISMODULE_TYPE_ENCVER_MASK)) >>REDISMODULE_TYPE_ENCVER_BITS)

struct RedisModule;
struct RedisModuleIO;
struct RedisModuleDigest;
struct RedisModuleCtx;
struct redisObject;




 
typedef void *(*moduleTypeLoadFunc)(struct RedisModuleIO *io, int encver);
typedef void (*moduleTypeSaveFunc)(struct RedisModuleIO *io, void *value);
typedef void (*moduleTypeRewriteFunc)(struct RedisModuleIO *io, struct redisObject *key, void *value);
typedef void (*moduleTypeDigestFunc)(struct RedisModuleDigest *digest, void *value);
typedef size_t (*moduleTypeMemUsageFunc)(const void *value);
typedef void (*moduleTypeFreeFunc)(void *value);


 
typedef struct RedisModuleType {
    uint64_t id;  
    struct RedisModule *module;
    moduleTypeLoadFunc rdb_load;
    moduleTypeSaveFunc rdb_save;
    moduleTypeRewriteFunc aof_rewrite;
    moduleTypeMemUsageFunc mem_usage;
    moduleTypeDigestFunc digest;
    moduleTypeFreeFunc free;
    char name[10];  
} moduleType;















 
typedef struct moduleValue {
    moduleType *type;
    void *value;
} moduleValue;



 
typedef struct RedisModuleIO {
    size_t bytes;        
    rio *rio;            
    moduleType *type;    
    int error;           
    int ver;            
 
    struct RedisModuleCtx *ctx;  
    struct redisObject *key;     
} RedisModuleIO;


 
#define moduleInitIOContext(iovar,mtype,rioptr,keyptr) do {     iovar.rio = rioptr;     iovar.type = mtype;     iovar.bytes = 0;     iovar.error = 0;     iovar.ver = 0;     iovar.key = keyptr;     iovar.ctx = NULL; } while(0);
# 602 "server.h"





 
typedef struct RedisModuleDigest {
    unsigned char o[20];     
    unsigned char x[20];     
} RedisModuleDigest;

 
#define moduleInitDigestContext(mdvar) do {     memset(mdvar.o,0,sizeof(mdvar.o));     memset(mdvar.x,0,sizeof(mdvar.x)); } while(0);






 
#define OBJ_ENCODING_RAW 0      
#define OBJ_ENCODING_INT 1      
#define OBJ_ENCODING_HT 2       
#define OBJ_ENCODING_ZIPMAP 3   
#define OBJ_ENCODING_LINKEDLIST 4  
#define OBJ_ENCODING_ZIPLIST 5  
#define OBJ_ENCODING_INTSET 6   
#define OBJ_ENCODING_SKIPLIST 7   
#define OBJ_ENCODING_EMBSTR 8   
#define OBJ_ENCODING_QUICKLIST 9  
#define OBJ_ENCODING_STREAM 10  

#define LRU_BITS 24
#define LRU_CLOCK_MAX ((1<<LRU_BITS)-1)  
#define LRU_CLOCK_RESOLUTION 1000  

#define OBJ_SHARED_REFCOUNT INT_MAX
typedef struct redisObject {
    unsigned type:4;
    unsigned encoding:4;
    unsigned lru:24; 

 
    int refcount;
    void *ptr;
} robj;




 
#define initStaticStringObject(_var,_ptr) do {     _var.refcount = 1;     _var.type = OBJ_STRING;     _var.encoding = OBJ_ENCODING_RAW;     _var.ptr = _ptr; } while(0)






struct evictionPoolEntry;  


 
typedef struct clientReplyBlock {
    size_t size, used;
    char buf[];
} clientReplyBlock;



 
typedef struct redisDb {
    dict *dict;                  
    dict *expires;               
    dict *blocking_keys;         
    dict *ready_keys;            
    dict *watched_keys;          
    int id;                      
    long long avg_ttl;           
    list *defrag_later;          
} redisDb;

 
typedef struct multiCmd {
    robj **argv;
    int argc;
    struct redisCommand *cmd;
} multiCmd;

typedef struct multiState {
    multiCmd *commands;      
    int count;               
    int cmd_flags;          

 
    int minreplicas;         
    time_t minreplicas_timeout;  
} multiState;


 
typedef struct blockingState {
     
    mstime_t timeout;       
 

     
    dict *keys;             
 
    robj *target;           
 

     
    size_t xread_count;      
    robj *xread_group;       
    robj *xread_consumer;    
    mstime_t xread_retry_time, xread_retry_ttl;
    int xread_group_noack;

     
    int numreplicas;         
    long long reploffset;    

     
    void *module_blocked_handle; 

 
} blockingState;











 
typedef struct readyList {
    redisDb *db;
    robj *key;
} readyList;



 
#define USER_COMMAND_BITS_COUNT 1024    #define USER_FLAG_ENABLED (1<<0)         




#define USER_FLAG_DISABLED (1<<1)        
#define USER_FLAG_ALLKEYS (1<<2)         
#define USER_FLAG_ALLCOMMANDS (1<<3)     
#define USER_FLAG_NOPASS      (1<<4)    typedef struct user {
# 764 "server.h"
    sds name;        
    uint64_t flags;  

    





 
    uint64_t allowed_commands[1024/64];

    



 
    sds **allowed_subcommands;
    list *passwords;  
    list *patterns;  

 
} user;


 
typedef struct client {
    uint64_t id;             
    int fd;                  
    int resp;                
    redisDb *db;             
    robj *name;              
    sds querybuf;            
    size_t qb_pos;           
    sds pending_querybuf;   


 
    size_t querybuf_peak;    
    int argc;                
    robj **argv;             
    struct redisCommand *cmd, *lastcmd;   
    user *user;             

 
    int reqtype;             
    int multibulklen;        
    long bulklen;            
    list *reply;             
    unsigned long long reply_bytes;  
    size_t sentlen;         
 
    time_t ctime;            
    time_t lastinteraction;  
    time_t obuf_soft_limit_reached_time;
    int flags;               
    int authenticated;       
    int replstate;           
    int repl_put_online_on_ack;  
    int repldbfd;            
    off_t repldboff;         
    off_t repldbsize;        
    sds replpreamble;        
    long long read_reploff;  
    long long reploff;       
    long long repl_ack_off;  
    long long repl_ack_time; 
    long long psync_initial_offset; 

 
    char replid[40+1];  
    int slave_listening_port;  
    char slave_ip[46];  
    int slave_capa;          
    multiState mstate;       
    int btype;               
    blockingState bpop;      
    long long woff;          
    list *watched_keys;      
    dict *pubsub_channels;   
    list *pubsub_patterns;   
    sds peerid;              
    listNode *client_list_node;  

     
    int bufpos;
    char buf[(16*1024)];
} client;

struct saveparam {
    time_t seconds;
    int changes;
};

struct moduleLoadQueueEntry {
    sds path;
    int argc;
    robj **argv;
};

struct sharedObjectsStruct {
    robj *crlf, *ok, *err, *emptybulk, *czero, *cone, *pong, *space,
    *colon, *queued, *null[4], *nullarray[4],
    *emptyarray, *wrongtypeerr, *nokeyerr, *syntaxerr, *sameobjecterr,
    *outofrangeerr, *noscripterr, *loadingerr, *slowscripterr, *bgsaveerr,
    *masterdownerr, *roslaveerr, *execaborterr, *noautherr, *noreplicaserr,
    *busykeyerr, *oomerr, *plus, *messagebulk, *pmessagebulk, *subscribebulk,
    *unsubscribebulk, *psubscribebulk, *punsubscribebulk, *del, *unlink,
    *rpop, *lpop, *lpush, *rpoplpush, *zpopmin, *zpopmax, *emptyscan,
    *select[10],
    *integers[10000],
    *mbulkhdr[32],  
    *bulkhdr[32];   
    sds minstring, maxstring;
};

 
typedef struct zskiplistNode {
    sds ele;
    double score;
    struct zskiplistNode *backward;
    struct zskiplistLevel {
        struct zskiplistNode *forward;
        unsigned long span;
    } level[];
} zskiplistNode;

typedef struct zskiplist {
    struct zskiplistNode *header, *tail;
    unsigned long length;
    int level;
} zskiplist;

typedef struct zset {
    dict *dict;
    zskiplist *zsl;
} zset;

typedef struct clientBufferLimitsConfig {
    unsigned long long hard_limit_bytes;
    unsigned long long soft_limit_bytes;
    time_t soft_limit_seconds;
} clientBufferLimitsConfig;

extern clientBufferLimitsConfig clientBufferLimitsDefaults[3];






 
typedef struct redisOp {
    robj **argv;
    int argc, dbid, target;
    struct redisCommand *cmd;
} redisOp;







 
typedef struct redisOpArray {
    redisOp *ops;
    int numops;
} redisOpArray;


 
struct redisMemOverhead {
    size_t peak_allocated;
    size_t total_allocated;
    size_t startup_allocated;
    size_t repl_backlog;
    size_t clients_slaves;
    size_t clients_normal;
    size_t aof_buffer;
    size_t lua_caches;
    size_t overhead_total;
    size_t dataset;
    size_t total_keys;
    size_t bytes_per_key;
    float dataset_perc;
    float peak_perc;
    float total_frag;
    ssize_t total_frag_bytes;
    float allocator_frag;
    ssize_t allocator_frag_bytes;
    float allocator_rss;
    ssize_t allocator_rss_bytes;
    float rss_extra;
    size_t rss_extra_bytes;
    size_t num_dbs;
    struct {
        size_t dbid;
        size_t overhead_ht_main;
        size_t overhead_ht_expires;
    } *db;
};








 
typedef struct rdbSaveInfo {
     
    int repl_stream_db;   

     
    int repl_id_is_set;   
    char repl_id[40+1];      
    long long repl_offset;                   
} rdbSaveInfo;

#define RDB_SAVE_INFO_INIT {-1,0,"000000000000000000000000000000",-1}

struct malloc_stats {
    size_t zmalloc_used;
    size_t process_rss;
    size_t allocator_allocated;
    size_t allocator_active;
    size_t allocator_resident;
};



 

struct clusterState;


 




#define CHILD_INFO_MAGIC 0xC17DDA7A12345678LL
#define CHILD_INFO_TYPE_RDB 0
#define CHILD_INFO_TYPE_AOF 1

struct redisServer {
     
    pid_t pid;                   
    char *configfile;            
    char *executable;            
    char **exec_argv;            
    int dynamic_hz;              
    int config_hz;              

 
    int hz;                      
    redisDb *db;
    dict *commands;              
    dict *orig_commands;         
    aeEventLoop *el;
    _Atomic unsigned int lruclock;  
    int shutdown_asap;           
    int activerehashing;         
    int active_defrag_running;   
    char *pidfile;               
    int arch_bits;               
    int cronloops;               
    char runid[40+1];   
    int sentinel_mode;           
    size_t initial_memory_usage;  
    int always_show_logo;        
     
    dict *moduleapi;             
    dict *sharedapi;            
 
    list *loadmodule_queue;      
    int module_blocked_pipe[2]; 

 
     
    int port;                    
    int tcp_backlog;             
    char *bindaddr[16];  
    int bindaddr_count;          
    char *unixsocket;            
    mode_t unixsocketperm;       
    int ipfd[16];  
    int ipfd_count;              
    int sofd;                    
    int cfd[16]; 
    int cfd_count;               
    list *clients;               
    list *clients_to_close;      
    list *clients_pending_write;  
    list *clients_pending_read;   
    list *slaves, *monitors;     
    client *current_client;  
    rax *clients_index;          
    int clients_paused;          
    mstime_t clients_pause_end_time;  
    char neterr[256];    
    dict *migrate_cached_sockets; 
    _Atomic uint64_t next_client_id;  
    int protected_mode;          
    int gopher_enabled;         
 
    int io_threads_num;          
    int io_threads_do_reads;     

     
    int loading;                 
    off_t loading_total_bytes;
    off_t loading_loaded_bytes;
    time_t loading_start_time;
    off_t loading_process_events_interval_bytes;
     
    struct redisCommand *delCommand, *multiCommand, *lpushCommand,
                        *lpopCommand, *rpopCommand, *zpopminCommand,
                        *zpopmaxCommand, *sremCommand, *execCommand,
                        *expireCommand, *pexpireCommand, *xclaimCommand,
                        *xgroupCommand;
     
    time_t stat_starttime;           
    long long stat_numcommands;      
    long long stat_numconnections;   
    long long stat_expiredkeys;      
    double stat_expired_stale_perc;  
    long long stat_expired_time_cap_reached_count;  
    long long stat_evictedkeys;      
    long long stat_keyspace_hits;    
    long long stat_keyspace_misses;  
    long long stat_active_defrag_hits;       
    long long stat_active_defrag_misses;     
    long long stat_active_defrag_key_hits;   
    long long stat_active_defrag_key_misses; 
    long long stat_active_defrag_scanned;    
    size_t stat_peak_memory;         
    long long stat_fork_time;        
    double stat_fork_rate;           
    long long stat_rejected_conn;    
    long long stat_sync_full;        
    long long stat_sync_partial_ok;  
    long long stat_sync_partial_err; 
    list *slowlog;                   
    long long slowlog_entry_id;      
    long long slowlog_log_slower_than;  
    unsigned long slowlog_max_len;      
    struct malloc_stats cron_malloc_stats;  
    _Atomic long long stat_net_input_bytes;  
    _Atomic long long stat_net_output_bytes;  
    size_t stat_rdb_cow_bytes;       
    size_t stat_aof_cow_bytes;       
    
 
    struct {
        long long last_sample_time;  
        long long last_sample_count; 
        long long samples[16];
        int idx;
    } inst_metric[3];
     
    int verbosity;                   
    int maxidletime;                 
    int tcpkeepalive;                
    int active_expire_enabled;       
    int active_defrag_enabled;
    size_t active_defrag_ignore_bytes;  
    int active_defrag_threshold_lower;  
    int active_defrag_threshold_upper;  
    int active_defrag_cycle_min;        
    int active_defrag_cycle_max;        
    unsigned long active_defrag_max_scan_fields;  
    _Atomic size_t client_max_querybuf_len;  
    int dbnum;                       
    int supervised;                  
    int supervised_mode;             
    int daemonize;                   
    clientBufferLimitsConfig client_obuf_limits[3];
     
    int aof_state;                   
    int aof_fsync;                   
    char *aof_filename;              
    int aof_no_fsync_on_rewrite;     
    int aof_rewrite_perc;            
    off_t aof_rewrite_min_size;      
    off_t aof_rewrite_base_size;     
    off_t aof_current_size;          
    off_t aof_fsync_offset;          
    int aof_rewrite_scheduled;       
    pid_t aof_child_pid;             
    list *aof_rewrite_buf_blocks;    
    sds aof_buf;       
    int aof_fd;        
    int aof_selected_db;  
    time_t aof_flush_postponed_start;  
    time_t aof_last_fsync;             
    time_t aof_rewrite_time_last;    
    time_t aof_rewrite_time_start;   
    int aof_lastbgrewrite_status;    
    unsigned long aof_delayed_fsync;   
    int aof_rewrite_incremental_fsync; 
    int rdb_save_incremental_fsync;    
    int aof_last_write_status;       
    int aof_last_write_errno;        
    int aof_load_truncated;          
    int aof_use_rdb_preamble;        
     
    int aof_pipe_write_data_to_child;
    int aof_pipe_read_data_from_parent;
    int aof_pipe_write_ack_to_parent;
    int aof_pipe_read_ack_from_child;
    int aof_pipe_write_ack_to_child;
    int aof_pipe_read_ack_from_parent;
    int aof_stop_sending_diff;     
 
    sds aof_child_diff;              
     
    long long dirty;                 
    long long dirty_before_bgsave;   
    pid_t rdb_child_pid;             
    struct saveparam *saveparams;    
    int saveparamslen;               
    char *rdb_filename;              
    int rdb_compression;             
    int rdb_checksum;                
    time_t lastsave;                 
    time_t lastbgsave_try;           
    time_t rdb_save_time_last;       
    time_t rdb_save_time_start;      
    int rdb_bgsave_scheduled;        
    int rdb_child_type;              
    int lastbgsave_status;           
    int stop_writes_on_bgsave_err;   
    int rdb_pipe_write_result_to_parent;  
    int rdb_pipe_read_result_from_child;  
     
    int child_info_pipe[2];          
    struct {
        int process_type;            
        size_t cow_size;             
        unsigned long long magic;    
    } child_info_data;
     
    redisOpArray also_propagate;     
     
    char *logfile;                   
    int syslog_enabled;              
    char *syslog_ident;              
    int syslog_facility;             
     
    char replid[40+1];   
    char replid2[40+1];  
    long long master_repl_offset;    
    long long second_replid_offset;  
    int slaveseldb;                  
    int repl_ping_slave_period;      
    char *repl_backlog;              
    long long repl_backlog_size;     
    long long repl_backlog_histlen;  
    long long repl_backlog_idx;     
 
    long long repl_backlog_off;     
 
    time_t repl_backlog_time_limit; 
 
    time_t repl_no_slaves_since;    
 
    int repl_min_slaves_to_write;    
    int repl_min_slaves_max_lag;     
    int repl_good_slaves_count;      
    int repl_diskless_sync;          
    int repl_diskless_sync_delay;    
     
    char *masteruser;                
    char *masterauth;                
    char *masterhost;                
    int masterport;                  
    int repl_timeout;                
    client *master;      
    client *cached_master;  
    int repl_syncio_timeout;  
    int repl_state;           
    off_t repl_transfer_size;  
    off_t repl_transfer_read;  
    off_t repl_transfer_last_fsync_off;  
    int repl_transfer_s;      
    int repl_transfer_fd;     
    char *repl_transfer_tmpfile;  
    time_t repl_transfer_lastio;  
    int repl_serve_stale_data;  
    int repl_slave_ro;           
    int repl_slave_ignore_maxmemory;     
    time_t repl_down_since;  
    int repl_disable_tcp_nodelay;    
    int slave_priority;              
    int slave_announce_port;         
    char *slave_announce_ip;         
    

 
    char master_replid[40+1];   
    long long master_initial_offset;            
    int repl_slave_lazy_flush;           
     
    dict *repl_scriptcache_dict;         
    list *repl_scriptcache_fifo;         
    unsigned int repl_scriptcache_size;  
     
    list *clients_waiting_acks;          
    int get_ack_from_slaves;             
     
    unsigned int maxclients;             
    unsigned long long maxmemory;    
    int maxmemory_policy;            
    int maxmemory_samples;           
    int lfu_log_factor;              
    int lfu_decay_time;              
    long long proto_max_bulk_len;    
     
    unsigned int blocked_clients;    
    unsigned int blocked_clients_by_type[6];
    list *unblocked_clients;  
    list *ready_keys;         
    
 
    int sort_desc;
    int sort_alpha;
    int sort_bypattern;
    int sort_store;
     
    size_t hash_max_ziplist_entries;
    size_t hash_max_ziplist_value;
    size_t set_max_intset_entries;
    size_t zset_max_ziplist_entries;
    size_t zset_max_ziplist_value;
    size_t hll_sparse_max_bytes;
    size_t stream_node_max_bytes;
    int64_t stream_node_max_entries;
     
    int list_max_ziplist_size;
    int list_compress_depth;
     
    _Atomic time_t unixtime;     
    time_t timezone;             
    int daylight_active;         
    long long mstime;            
     
    dict *pubsub_channels;   
    list *pubsub_patterns;   
    int notify_keyspace_events; 
 
     
    int cluster_enabled;       
    mstime_t cluster_node_timeout;  
    char *cluster_configfile;  
    struct clusterState *cluster;   
    int cluster_migration_barrier;  
    int cluster_slave_validity_factor;  
    int cluster_require_full_coverage; 
 
    int cluster_slave_no_failover;  
 
    char *cluster_announce_ip;   
    int cluster_announce_port;      
    int cluster_announce_bus_port;  
    int cluster_module_flags;      


 
     
    lua_State *lua;  
    client *lua_client;    
    client *lua_caller;    
    dict *lua_scripts;          
    unsigned long long lua_scripts_mem;   
    mstime_t lua_time_limit;   
    mstime_t lua_time_start;   
    int lua_write_dirty;  
 
    int lua_random_dirty; 
 
    int lua_replicate_commands;  
    int lua_multi_emitted; 
    int lua_repl;          
    int lua_timedout;     
 
    int lua_kill;          
    int lua_always_replicate_commands;  
     
    int lazyfree_lazy_eviction;
    int lazyfree_lazy_expire;
    int lazyfree_lazy_server_del;
     
    long long latency_monitor_threshold;
    dict *latency_events;
     
    char *acl_filename;      
     
    const char *assert_failed;
    const char *assert_file;
    int assert_line;
    int bug_report_start;  
    int watchdog_period;   
     
    size_t system_memory_size;   
};

typedef struct pubsubPattern {
    client *client;
    robj *pattern;
} pubsubPattern;

typedef void redisCommandProc(client *c);
typedef int *redisGetKeysProc(struct redisCommand *cmd, robj **argv, int argc, int *numkeys);
struct redisCommand {
    char *name;
    redisCommandProc *proc;
    int arity;
    char *sflags;    
    uint64_t flags;  
    
 
    redisGetKeysProc *getkeys_proc;
     
    int firstkey;  
    int lastkey;   
    int keystep;   
    long long microseconds, calls;
    int id;     



 
};

struct redisFunctionSym {
    char *name;
    unsigned long pointer;
};

typedef struct _redisSortObject {
    robj *obj;
    union {
        double score;
        robj *cmpobj;
    } u;
} redisSortObject;

typedef struct _redisSortOperation {
    int type;
    robj *pattern;
} redisSortOperation;

 
typedef struct {
    robj *subject;
    unsigned char encoding;
    unsigned char direction;  
    quicklistIter *iter;
} listTypeIterator;

 
typedef struct {
    listTypeIterator *li;
    quicklistEntry entry;  
} listTypeEntry;

 
typedef struct {
    robj *subject;
    int encoding;
    int ii;  
    dictIterator *di;
} setTypeIterator;




 
typedef struct {
    robj *subject;
    int encoding;

    unsigned char *fptr, *vptr;

    dictIterator *di;
    dictEntry *de;
} hashTypeIterator;

# 1 "stream.h"

#define STREAM_H

# 1 "listpack.h"
































 


#define __LISTPACK_H



#define LP_INTBUF_SIZE 21  

 
#define LP_BEFORE 0
#define LP_AFTER 1
#define LP_REPLACE 2

unsigned char *lpNew(void);
void lpFree(unsigned char *lp);
unsigned char *lpInsert(unsigned char *lp, unsigned char *ele, uint32_t size, unsigned char *p, int where, unsigned char **newp);
unsigned char *lpAppend(unsigned char *lp, unsigned char *ele, uint32_t size);
unsigned char *lpDelete(unsigned char *lp, unsigned char *p, unsigned char **newp);
uint32_t lpLength(unsigned char *lp);
unsigned char *lpGet(unsigned char *p, int64_t *count, unsigned char *intbuf);
unsigned char *lpFirst(unsigned char *lp);
unsigned char *lpLast(unsigned char *lp);
unsigned char *lpNext(unsigned char *lp, unsigned char *p);
unsigned char *lpPrev(unsigned char *lp, unsigned char *p);
uint32_t lpBytes(unsigned char *lp);
unsigned char *lpSeek(unsigned char *lp, long index);

# 6 "stream.h"




 
typedef struct streamID {
    uint64_t ms;         
    uint64_t seq;        
} streamID;

typedef struct stream {
    rax *rax;                
    uint64_t length;         
    streamID last_id;        
    rax *cgroups;            
} stream;






 
typedef struct streamIterator {
    stream *stream;          
    streamID master_id;      
    uint64_t master_fields_count;        
    unsigned char *master_fields_start;  
    unsigned char *master_fields_ptr;    
    int entry_flags;                     
    int rev;                 
    uint64_t start_key[2];   
    uint64_t end_key[2];     
    raxIterator ri;          
    unsigned char *lp;       
    unsigned char *lp_ele;   
    unsigned char *lp_flags;  
    

 
    unsigned char field_buf[21];
    unsigned char value_buf[21];
} streamIterator;

 
typedef struct streamCG {
    streamID last_id;       

 
    rax *pel;               




 
    rax *consumers;         

 
} streamCG;

 
typedef struct streamConsumer {
    mstime_t seen_time;          
    sds name;                   

 
    rax *pel;                   





 
} streamConsumer;

 
typedef struct streamNACK {
    mstime_t delivery_time;      
    uint64_t delivery_count;     
    streamConsumer *consumer;   
 
} streamNACK;


 
typedef struct sreamPropInfo {
    robj *keyname;
    robj *groupname;
} streamPropInfo;

 
struct client;

stream *streamNew(void);
void freeStream(stream *s);
size_t streamReplyWithRange(client *c, stream *s, streamID *start, streamID *end, size_t count, int rev, streamCG *group, streamConsumer *consumer, int flags, streamPropInfo *spi);
void streamIteratorStart(streamIterator *si, stream *s, streamID *start, streamID *end, int rev);
int streamIteratorGetID(streamIterator *si, streamID *id, int64_t *numfields);
void streamIteratorGetField(streamIterator *si, unsigned char **fieldptr, unsigned char **valueptr, int64_t *fieldlen, int64_t *valuelen);
void streamIteratorStop(streamIterator *si);
streamCG *streamLookupCG(stream *s, sds groupname);
streamConsumer *streamLookupConsumer(streamCG *cg, sds name, int create);
streamCG *streamCreateCG(stream *s, char *name, size_t namelen, streamID *id);
streamNACK *streamCreateNACK(streamConsumer *consumer);
void streamDecodeID(void *buf, streamID *id);
int streamCompareID(streamID *a, streamID *b);

# 1456 "server.h"

#define OBJ_HASH_KEY 1
#define OBJ_HASH_VALUE 2



 

extern struct redisServer server;
extern struct sharedObjectsStruct shared;
extern dictType objectKeyPointerValueDictType;
extern dictType objectKeyHeapPointerValueDictType;
extern dictType setDictType;
extern dictType zsetDictType;
extern dictType clusterNodesDictType;
extern dictType clusterNodesBlackListDictType;
extern dictType dbDictType;
extern dictType shaScriptObjectDictType;
extern double R_Zero, R_PosInf, R_NegInf, R_Nan;
extern dictType hashDictType;
extern dictType replScriptCacheDictType;
extern dictType keyptrDictType;
extern dictType modulesDictType;



 

 
void moduleInitModulesSystem(void);
int moduleLoad(const char *path, void **argv, int argc);
void moduleLoadFromQueue(void);
int *moduleGetCommandKeysViaAPI(struct redisCommand *cmd, robj **argv, int argc, int *numkeys);
moduleType *moduleTypeLookupModuleByID(uint64_t id);
void moduleTypeNameByID(char *name, uint64_t moduleid);
void moduleFreeContext(struct RedisModuleCtx *ctx);
void unblockClientFromModule(client *c);
void moduleHandleBlockedClients(void);
void moduleBlockedClientTimedOut(client *c);
void moduleBlockedClientPipeReadable(aeEventLoop *el, int fd, void *privdata, int mask);
size_t moduleCount(void);
void moduleAcquireGIL(void);
void moduleReleaseGIL(void);
void moduleNotifyKeyspaceEvent(int type, const char *event, robj *key, int dbid);
void moduleCallCommandFilters(client *c);

 
long long ustime(void);
long long mstime(void);
void getRandomHexChars(char *p, size_t len);
void getRandomBytes(unsigned char *p, size_t len);
uint64_t crc64(uint64_t crc, const unsigned char *s, uint64_t l);
void exitFromChild(int retcode);
size_t redisPopcount(void *s, long count);
void redisSetProcTitle(char *title);

 
client *createClient(int fd);
void closeTimedoutClients(void);
void freeClient(client *c);
void freeClientAsync(client *c);
void resetClient(client *c);
void sendReplyToClient(aeEventLoop *el, int fd, void *privdata, int mask);
void *addReplyDeferredLen(client *c);
void setDeferredArrayLen(client *c, void *node, long length);
void setDeferredMapLen(client *c, void *node, long length);
void setDeferredSetLen(client *c, void *node, long length);
void setDeferredAttributeLen(client *c, void *node, long length);
void setDeferredPushLen(client *c, void *node, long length);
void processInputBuffer(client *c);
void processInputBufferAndReplicate(client *c);
void processGopherRequest(client *c);
void acceptHandler(aeEventLoop *el, int fd, void *privdata, int mask);
void acceptTcpHandler(aeEventLoop *el, int fd, void *privdata, int mask);
void acceptUnixHandler(aeEventLoop *el, int fd, void *privdata, int mask);
void readQueryFromClient(aeEventLoop *el, int fd, void *privdata, int mask);
void addReplyNull(client *c);
void addReplyNullArray(client *c);
void addReplyBool(client *c, int b);
void addReplyVerbatim(client *c, const char *s, size_t len, const char *ext);
void addReplyProto(client *c, const char *s, size_t len);
void AddReplyFromClient(client *c, client *src);
void addReplyBulk(client *c, robj *obj);
void addReplyBulkCString(client *c, const char *s);
void addReplyBulkCBuffer(client *c, const void *p, size_t len);
void addReplyBulkLongLong(client *c, long long ll);
void addReply(client *c, robj *obj);
void addReplySds(client *c, sds s);
void addReplyBulkSds(client *c, sds s);
void addReplyError(client *c, const char *err);
void addReplyStatus(client *c, const char *status);
void addReplyDouble(client *c, double d);
void addReplyHumanLongDouble(client *c, long double d);
void addReplyLongLong(client *c, long long ll);
void addReplyArrayLen(client *c, long length);
void addReplyMapLen(client *c, long length);
void addReplySetLen(client *c, long length);
void addReplyAttributeLen(client *c, long length);
void addReplyPushLen(client *c, long length);
void addReplyHelp(client *c, const char **help);
void addReplySubcommandSyntaxError(client *c);
void addReplyLoadedModules(client *c);
void copyClientOutputBuffer(client *dst, client *src);
size_t sdsZmallocSize(sds s);
size_t getStringObjectSdsUsedMemory(robj *o);
void freeClientReplyValue(void *o);
void *dupClientReplyValue(void *o);
void getClientsMaxBuffers(unsigned long *longest_output_list,
                          unsigned long *biggest_input_buffer);
char *getClientPeerId(client *client);
sds catClientInfoString(sds s, client *client);
sds getAllClientsInfoString(int type);
void rewriteClientCommandVector(client *c, int argc, ...);
void rewriteClientCommandArgument(client *c, int i, robj *newval);
void replaceClientCommandVector(client *c, int argc, robj **argv);
unsigned long getClientOutputBufferMemoryUsage(client *c);
void freeClientsInAsyncFreeQueue(void);
void asyncCloseClientOnOutputBufferLimitReached(client *c);
int getClientType(client *c);
int getClientTypeByName(char *name);
char *getClientTypeName(int class);
void flushSlavesOutputBuffers(void);
void disconnectSlaves(void);
int listenToPort(int port, int *fds, int *count);
void pauseClients(mstime_t duration);
int clientsArePaused(void);
int processEventsWhileBlocked(void);
int handleClientsWithPendingWrites(void);
int handleClientsWithPendingWritesUsingThreads(void);
int handleClientsWithPendingReadsUsingThreads(void);
int stopThreadedIOIfNeeded(void);
int clientHasPendingReplies(client *c);
void unlinkClient(client *c);
int writeToClient(int fd, client *c, int handler_installed);
void linkClient(client *c);
void protectClient(client *c);
void unprotectClient(client *c);
void initThreadedIO(void);


void addReplyErrorFormat(client *c, const char *fmt, ...)
    __attribute__((format(printf, 2, 3)));
void addReplyStatusFormat(client *c, const char *fmt, ...)
    __attribute__((format(printf, 2, 3)));





 
void listTypeTryConversion(robj *subject, robj *value);
void listTypePush(robj *subject, robj *value, int where);
robj *listTypePop(robj *subject, int where);
unsigned long listTypeLength(const robj *subject);
listTypeIterator *listTypeInitIterator(robj *subject, long index, unsigned char direction);
void listTypeReleaseIterator(listTypeIterator *li);
int listTypeNext(listTypeIterator *li, listTypeEntry *entry);
robj *listTypeGet(listTypeEntry *entry);
void listTypeInsert(listTypeEntry *entry, robj *value, int where);
int listTypeEqual(listTypeEntry *entry, robj *o);
void listTypeDelete(listTypeIterator *iter, listTypeEntry *entry);
void listTypeConvert(robj *subject, int enc);
void unblockClientWaitingData(client *c);
void popGenericCommand(client *c, int where);

 
void unwatchAllKeys(client *c);
void initClientMultiState(client *c);
void freeClientMultiState(client *c);
void queueMultiCommand(client *c);
void touchWatchedKey(redisDb *db, robj *key);
void touchWatchedKeysOnFlush(int dbid);
void discardTransaction(client *c);
void flagTransaction(client *c);
void execCommandPropagateMulti(client *c);

 
void decrRefCount(robj *o);
void decrRefCountVoid(void *o);
void incrRefCount(robj *o);
robj *makeObjectShared(robj *o);
robj *resetRefCount(robj *obj);
void freeStringObject(robj *o);
void freeListObject(robj *o);
void freeSetObject(robj *o);
void freeZsetObject(robj *o);
void freeHashObject(robj *o);
robj *createObject(int type, void *ptr);
robj *createStringObject(const char *ptr, size_t len);
robj *createRawStringObject(const char *ptr, size_t len);
robj *createEmbeddedStringObject(const char *ptr, size_t len);
robj *dupStringObject(const robj *o);
int isSdsRepresentableAsLongLong(sds s, long long *llval);
int isObjectRepresentableAsLongLong(robj *o, long long *llongval);
robj *tryObjectEncoding(robj *o);
robj *getDecodedObject(robj *o);
size_t stringObjectLen(robj *o);
robj *createStringObjectFromLongLong(long long value);
robj *createStringObjectFromLongLongForValue(long long value);
robj *createStringObjectFromLongDouble(long double value, int humanfriendly);
robj *createQuicklistObject(void);
robj *createZiplistObject(void);
robj *createSetObject(void);
robj *createIntsetObject(void);
robj *createHashObject(void);
robj *createZsetObject(void);
robj *createZsetZiplistObject(void);
robj *createStreamObject(void);
robj *createModuleObject(moduleType *mt, void *value);
int getLongFromObjectOrReply(client *c, robj *o, long *target, const char *msg);
int checkType(client *c, robj *o, int type);
int getLongLongFromObjectOrReply(client *c, robj *o, long long *target, const char *msg);
int getDoubleFromObjectOrReply(client *c, robj *o, double *target, const char *msg);
int getDoubleFromObject(const robj *o, double *target);
int getLongLongFromObject(robj *o, long long *target);
int getLongDoubleFromObject(robj *o, long double *target);
int getLongDoubleFromObjectOrReply(client *c, robj *o, long double *target, const char *msg);
char *strEncoding(int encoding);
int compareStringObjects(robj *a, robj *b);
int collateStringObjects(robj *a, robj *b);
int equalStringObjects(robj *a, robj *b);
unsigned long long estimateObjectIdleTime(robj *o);
void trimStringObjectIfNeeded(robj *o);
#define sdsEncodedObject(objptr) (objptr->encoding == OBJ_ENCODING_RAW || objptr->encoding == OBJ_ENCODING_EMBSTR)

 
ssize_t syncWrite(int fd, char *ptr, ssize_t size, long long timeout);
ssize_t syncRead(int fd, char *ptr, ssize_t size, long long timeout);
ssize_t syncReadLine(int fd, char *ptr, ssize_t size, long long timeout);

 
void replicationFeedSlaves(list *slaves, int dictid, robj **argv, int argc);
void replicationFeedSlavesFromMasterStream(list *slaves, char *buf, size_t buflen);
void replicationFeedMonitors(client *c, list *monitors, int dictid, robj **argv, int argc);
void updateSlavesWaitingBgsave(int bgsaveerr, int type);
void replicationCron(void);
void replicationHandleMasterDisconnection(void);
void replicationCacheMaster(client *c);
void resizeReplicationBacklog(long long newsize);
void replicationSetMaster(char *ip, int port);
void replicationUnsetMaster(void);
void refreshGoodSlavesCount(void);
void replicationScriptCacheInit(void);
void replicationScriptCacheFlush(void);
void replicationScriptCacheAdd(sds sha1);
int replicationScriptCacheExists(sds sha1);
void processClientsWaitingReplicas(void);
void unblockClientWaitingReplicas(client *c);
int replicationCountAcksByOffset(long long offset);
void replicationSendNewlineToMaster(void);
long long replicationGetSlaveOffset(void);
char *replicationGetSlaveName(client *c);
long long getPsyncInitialOffset(void);
int replicationSetupSlaveForFullResync(client *slave, long long offset);
void changeReplicationId(void);
void clearReplicationId2(void);
void chopReplicationBacklog(void);
void replicationCacheMasterUsingMyself(void);
void feedReplicationBacklog(void *ptr, size_t len);

 
void startLoading(FILE *fp);
void loadingProgress(off_t pos);
void stopLoading(void);

#define DISK_ERROR_TYPE_AOF 1        
#define DISK_ERROR_TYPE_RDB 2        
#define DISK_ERROR_TYPE_NONE 0       
int writeCommandsDeniedByDiskError(void);

 
# 1 "rdb.h"



























 


#define __RDB_H

# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stdio.h"










 

 






 
# 34 "rdb.h"


 
# 1 "server.h"



























 

# 38 "rdb.h"


 
#define RDB_VERSION 9














 
#define RDB_6BITLEN 0
#define RDB_14BITLEN 1
#define RDB_32BITLEN 0x80
#define RDB_64BITLEN 0x81
#define RDB_ENCVAL 3
#define RDB_LENERR UINT64_MAX



 
#define RDB_ENC_INT8 0         
#define RDB_ENC_INT16 1        
#define RDB_ENC_INT32 2        
#define RDB_ENC_LZF 3          



 
#define RDB_TYPE_STRING 0
#define RDB_TYPE_LIST   1
#define RDB_TYPE_SET    2
#define RDB_TYPE_ZSET   3
#define RDB_TYPE_HASH   4
#define RDB_TYPE_ZSET_2 5  
#define RDB_TYPE_MODULE 6
#define RDB_TYPE_MODULE_2 7  



 
#define RDB_TYPE_HASH_ZIPMAP    9
#define RDB_TYPE_LIST_ZIPLIST  10
#define RDB_TYPE_SET_INTSET    11
#define RDB_TYPE_ZSET_ZIPLIST  12
#define RDB_TYPE_HASH_ZIPLIST  13
#define RDB_TYPE_LIST_QUICKLIST 14
#define RDB_TYPE_STREAM_LISTPACKS 15
 

 
#define rdbIsObjectType(t) ((t >= 0 && t <= 7) || (t >= 9 && t <= 15))

 
#define RDB_OPCODE_MODULE_AUX 247    
#define RDB_OPCODE_IDLE       248    
#define RDB_OPCODE_FREQ       249    
#define RDB_OPCODE_AUX        250    
#define RDB_OPCODE_RESIZEDB   251    
#define RDB_OPCODE_EXPIRETIME_MS 252     
#define RDB_OPCODE_EXPIRETIME 253        
#define RDB_OPCODE_SELECTDB   254    
#define RDB_OPCODE_EOF        255    

 
#define RDB_MODULE_OPCODE_EOF   0    
#define RDB_MODULE_OPCODE_SINT  1    
#define RDB_MODULE_OPCODE_UINT  2    
#define RDB_MODULE_OPCODE_FLOAT 3    
#define RDB_MODULE_OPCODE_DOUBLE 4   
#define RDB_MODULE_OPCODE_STRING 5   

 
#define RDB_LOAD_NONE   0
#define RDB_LOAD_ENC    (1<<0)
#define RDB_LOAD_PLAIN  (1<<1)
#define RDB_LOAD_SDS    (1<<2)

#define RDB_SAVE_NONE 0
#define RDB_SAVE_AOF_PREAMBLE (1<<0)

int rdbSaveType(rio *rdb, unsigned char type);
int rdbLoadType(rio *rdb);
int rdbSaveTime(rio *rdb, time_t t);
time_t rdbLoadTime(rio *rdb);
int rdbSaveLen(rio *rdb, uint64_t len);
int rdbSaveMillisecondTime(rio *rdb, long long t);
long long rdbLoadMillisecondTime(rio *rdb, int rdbver);
uint64_t rdbLoadLen(rio *rdb, int *isencoded);
int rdbLoadLenByRef(rio *rdb, int *isencoded, uint64_t *lenptr);
int rdbSaveObjectType(rio *rdb, robj *o);
int rdbLoadObjectType(rio *rdb);
int rdbLoad(char *filename, rdbSaveInfo *rsi);
int rdbSaveBackground(char *filename, rdbSaveInfo *rsi);
int rdbSaveToSlavesSockets(rdbSaveInfo *rsi);
void rdbRemoveTempFile(pid_t childpid);
int rdbSave(char *filename, rdbSaveInfo *rsi);
ssize_t rdbSaveObject(rio *rdb, robj *o, robj *key);
size_t rdbSavedObjectLen(robj *o);
robj *rdbLoadObject(int type, rio *rdb, robj *key);
void backgroundSaveDoneHandler(int exitcode, int bysignal);
int rdbSaveKeyValuePair(rio *rdb, robj *key, robj *val, long long expiretime);
robj *rdbLoadStringObject(rio *rdb);
ssize_t rdbSaveStringObject(rio *rdb, robj *obj);
ssize_t rdbSaveRawString(rio *rdb, unsigned char *s, size_t len);
void *rdbGenericLoadStringObject(rio *rdb, int flags, size_t *lenptr);
int rdbSaveBinaryDoubleValue(rio *rdb, double val);
int rdbLoadBinaryDoubleValue(rio *rdb, double *val);
int rdbSaveBinaryFloatValue(rio *rdb, float val);
int rdbLoadBinaryFloatValue(rio *rdb, float *val);
int rdbLoadRio(rio *rdb, rdbSaveInfo *rsi, int loading_aof);
rdbSaveInfo *rdbPopulateSaveInfo(rdbSaveInfo *rsi);

# 1728 "server.h"
int rdbSaveRio(rio *rdb, int *error, int flags, rdbSaveInfo *rsi);
void killRDBChild(void);

 
void flushAppendOnlyFile(int force);
void feedAppendOnlyFile(struct redisCommand *cmd, int dictid, robj **argv, int argc);
void aofRemoveTempFile(pid_t childpid);
int rewriteAppendOnlyFileBackground(void);
int loadAppendOnlyFile(char *filename);
void stopAppendOnly(void);
int startAppendOnly(void);
void backgroundRewriteDoneHandler(int exitcode, int bysignal);
void aofRewriteBufferReset(void);
unsigned long aofRewriteBufferSize(void);
ssize_t aofReadDiffFromParent(void);
void killAppendOnlyChild(void);

 
void openChildInfoPipe(void);
void closeChildInfoPipe(void);
void sendChildInfo(int process_type);
void receiveChildInfo(void);

 
extern rax *Users;
extern user *DefaultUser;
void ACLInit(void);
 
#define ACL_OK 0
#define ACL_DENIED_CMD 1
#define ACL_DENIED_KEY 2
int ACLCheckUserCredentials(robj *username, robj *password);
int ACLAuthenticateUser(client *c, robj *username, robj *password);
unsigned long ACLGetCommandID(const char *cmdname);
user *ACLGetUserByName(const char *name, size_t namelen);
int ACLCheckCommandPerm(client *c);
int ACLSetUser(user *u, const char *op, ssize_t oplen);
sds ACLDefaultUserFirstPassword(void);
uint64_t ACLGetCommandCategoryFlagByName(const char *name);
int ACLAppendUserForLoading(sds *argv, int argc, int *argc_err);
char *ACLSetUserStringError(void);
int ACLLoadConfiguredUsers(void);
sds ACLDescribeUser(user *u);
void ACLLoadUsersAtStartup(void);
void addReplyCommandCategories(client *c, struct redisCommand *cmd);

 

 
#define ZADD_NONE 0
#define ZADD_INCR (1<<0)     
#define ZADD_NX (1<<1)       
#define ZADD_XX (1<<2)       

 
#define ZADD_NOP (1<<3)      
#define ZADD_NAN (1<<4)      
#define ZADD_ADDED (1<<5)    
#define ZADD_UPDATED (1<<6)  

 
#define ZADD_CH (1<<16)       

 
typedef struct {
    double min, max;
    int minex, maxex;  
} zrangespec;

 
typedef struct {
    sds min, max;      
    int minex, maxex;  
} zlexrangespec;

zskiplist *zslCreate(void);
void zslFree(zskiplist *zsl);
zskiplistNode *zslInsert(zskiplist *zsl, double score, sds ele);
unsigned char *zzlInsert(unsigned char *zl, sds ele, double score);
int zslDelete(zskiplist *zsl, double score, sds ele, zskiplistNode **node);
zskiplistNode *zslFirstInRange(zskiplist *zsl, zrangespec *range);
zskiplistNode *zslLastInRange(zskiplist *zsl, zrangespec *range);
double zzlGetScore(unsigned char *sptr);
void zzlNext(unsigned char *zl, unsigned char **eptr, unsigned char **sptr);
void zzlPrev(unsigned char *zl, unsigned char **eptr, unsigned char **sptr);
unsigned char *zzlFirstInRange(unsigned char *zl, zrangespec *range);
unsigned char *zzlLastInRange(unsigned char *zl, zrangespec *range);
unsigned long zsetLength(const robj *zobj);
void zsetConvert(robj *zobj, int encoding);
void zsetConvertToZiplistIfNeeded(robj *zobj, size_t maxelelen);
int zsetScore(robj *zobj, sds member, double *score);
unsigned long zslGetRank(zskiplist *zsl, double score, sds o);
int zsetAdd(robj *zobj, double score, sds ele, int *flags, double *newscore);
long zsetRank(robj *zobj, sds ele, int reverse);
int zsetDel(robj *zobj, sds ele);
void genericZpopCommand(client *c, robj **keyv, int keyc, int where, int emitkey, robj *countarg);
sds ziplistGetObject(unsigned char *sptr);
int zslValueGteMin(double value, zrangespec *spec);
int zslValueLteMax(double value, zrangespec *spec);
void zslFreeLexRange(zlexrangespec *spec);
int zslParseLexRange(robj *min, robj *max, zlexrangespec *spec);
unsigned char *zzlFirstInLexRange(unsigned char *zl, zlexrangespec *range);
unsigned char *zzlLastInLexRange(unsigned char *zl, zlexrangespec *range);
zskiplistNode *zslFirstInLexRange(zskiplist *zsl, zlexrangespec *range);
zskiplistNode *zslLastInLexRange(zskiplist *zsl, zlexrangespec *range);
int zzlLexValueGteMin(unsigned char *p, zlexrangespec *spec);
int zzlLexValueLteMax(unsigned char *p, zlexrangespec *spec);
int zslLexValueGteMin(sds value, zlexrangespec *spec);
int zslLexValueLteMax(sds value, zlexrangespec *spec);

 
int getMaxmemoryState(size_t *total, size_t *logical, size_t *tofree, float *level);
size_t freeMemoryGetNotCountedMemory();
int freeMemoryIfNeeded(void);
int freeMemoryIfNeededAndSafe(void);
int processCommand(client *c);
void setupSignalHandlers(void);
struct redisCommand *lookupCommand(sds name);
struct redisCommand *lookupCommandByCString(char *s);
struct redisCommand *lookupCommandOrOriginal(sds name);
void call(client *c, int flags);
void propagate(struct redisCommand *cmd, int dbid, robj **argv, int argc, int flags);
void alsoPropagate(struct redisCommand *cmd, int dbid, robj **argv, int argc, int target);
void forceCommandPropagation(client *c, int flags);
void preventCommandPropagation(client *c);
void preventCommandAOF(client *c);
void preventCommandReplication(client *c);
int prepareForShutdown();

void serverLog(int level, const char *fmt, ...)
    __attribute__((format(printf, 2, 3)));



void serverLogRaw(int level, const char *msg);
void serverLogFromHandler(int level, const char *msg);
void usage(void);
void updateDictResizePolicy(void);
int htNeedsResize(dict *dict);
void populateCommandTable(void);
void resetCommandTableStats(void);
void adjustOpenFilesLimit(void);
void closeListeningSockets(int unlink_unix_socket);
void updateCachedTime(void);
void resetServerStats(void);
void activeDefragCycle(void);
unsigned int getLRUClock(void);
unsigned int LRU_CLOCK(void);
const char *evictPolicyToString(void);
struct redisMemOverhead *getMemoryOverheadData(void);
void freeMemoryOverheadData(struct redisMemOverhead *mh);

#define RESTART_SERVER_NONE 0
#define RESTART_SERVER_GRACEFULLY (1<<0)      
#define RESTART_SERVER_CONFIG_REWRITE (1<<1)  
int restartServer(int flags, mstime_t delay);

 
robj *setTypeCreate(sds value);
int setTypeAdd(robj *subject, sds value);
int setTypeRemove(robj *subject, sds value);
int setTypeIsMember(robj *subject, sds value);
setTypeIterator *setTypeInitIterator(robj *subject);
void setTypeReleaseIterator(setTypeIterator *si);
int setTypeNext(setTypeIterator *si, sds *sdsele, int64_t *llele);
sds setTypeNextObject(setTypeIterator *si);
int setTypeRandomElement(robj *setobj, sds *sdsele, int64_t *llele);
unsigned long setTypeRandomElements(robj *set, unsigned long count, robj *aux_set);
unsigned long setTypeSize(const robj *subject);
void setTypeConvert(robj *subject, int enc);

 
#define HASH_SET_TAKE_FIELD (1<<0)
#define HASH_SET_TAKE_VALUE (1<<1)
#define HASH_SET_COPY 0

void hashTypeConvert(robj *o, int enc);
void hashTypeTryConversion(robj *subject, robj **argv, int start, int end);
int hashTypeExists(robj *o, sds key);
int hashTypeDelete(robj *o, sds key);
unsigned long hashTypeLength(const robj *o);
hashTypeIterator *hashTypeInitIterator(robj *subject);
void hashTypeReleaseIterator(hashTypeIterator *hi);
int hashTypeNext(hashTypeIterator *hi);
void hashTypeCurrentFromZiplist(hashTypeIterator *hi, int what,
                                unsigned char **vstr,
                                unsigned int *vlen,
                                long long *vll);
sds hashTypeCurrentFromHashTable(hashTypeIterator *hi, int what);
void hashTypeCurrentObject(hashTypeIterator *hi, int what, unsigned char **vstr, unsigned int *vlen, long long *vll);
sds hashTypeCurrentObjectNewSds(hashTypeIterator *hi, int what);
robj *hashTypeLookupWriteOrCreate(client *c, robj *key);
robj *hashTypeGetValueObject(robj *o, sds field);
int hashTypeSet(robj *o, sds field, sds value, int flags);

 
int pubsubUnsubscribeAllChannels(client *c, int notify);
int pubsubUnsubscribeAllPatterns(client *c, int notify);
void freePubsubPattern(void *p);
int listMatchPubsubPattern(void *a, void *b);
int pubsubPublishMessage(robj *channel, robj *message);

 
void notifyKeyspaceEvent(int type, char *event, robj *key, int dbid);
int keyspaceEventsStringToFlags(char *classes);
sds keyspaceEventsFlagsToString(int flags);

 
void loadServerConfig(char *filename, char *options);
void appendServerSaveParams(time_t seconds, int changes);
void resetServerSaveParams(void);
struct rewriteConfigState;  
void rewriteConfigRewriteLine(struct rewriteConfigState *state, const char *option, sds line, int force);
int rewriteConfig(char *path);

 
int removeExpire(redisDb *db, robj *key);
void propagateExpire(redisDb *db, robj *key, int lazy);
int expireIfNeeded(redisDb *db, robj *key);
long long getExpire(redisDb *db, robj *key);
void setExpire(client *c, redisDb *db, robj *key, long long when);
robj *lookupKey(redisDb *db, robj *key, int flags);
robj *lookupKeyRead(redisDb *db, robj *key);
robj *lookupKeyWrite(redisDb *db, robj *key);
robj *lookupKeyReadOrReply(client *c, robj *key, robj *reply);
robj *lookupKeyWriteOrReply(client *c, robj *key, robj *reply);
robj *lookupKeyReadWithFlags(redisDb *db, robj *key, int flags);
robj *objectCommandLookup(client *c, robj *key);
robj *objectCommandLookupOrReply(client *c, robj *key, robj *reply);
void objectSetLRUOrLFU(robj *val, long long lfu_freq, long long lru_idle,
                       long long lru_clock);
#define LOOKUP_NONE 0
#define LOOKUP_NOTOUCH (1<<0)
void dbAdd(redisDb *db, robj *key, robj *val);
void dbOverwrite(redisDb *db, robj *key, robj *val);
void setKey(redisDb *db, robj *key, robj *val);
int dbExists(redisDb *db, robj *key);
robj *dbRandomKey(redisDb *db);
int dbSyncDelete(redisDb *db, robj *key);
int dbDelete(redisDb *db, robj *key);
robj *dbUnshareStringValue(redisDb *db, robj *key, robj *o);

#define EMPTYDB_NO_FLAGS 0       
#define EMPTYDB_ASYNC (1<<0)     
long long emptyDb(int dbnum, int flags, void(callback)(void*));

int selectDb(client *c, int id);
void signalModifiedKey(redisDb *db, robj *key);
void signalFlushedDb(int dbid);
unsigned int getKeysInSlot(unsigned int hashslot, robj **keys, unsigned int count);
unsigned int countKeysInSlot(unsigned int hashslot);
unsigned int delKeysInSlot(unsigned int hashslot);
int verifyClusterConfigWithData(void);
void scanGenericCommand(client *c, robj *o, unsigned long cursor);
int parseScanCursorOrReply(client *c, robj *o, unsigned long *cursor);
void slotToKeyAdd(robj *key);
void slotToKeyDel(robj *key);
void slotToKeyFlush(void);
int dbAsyncDelete(redisDb *db, robj *key);
void emptyDbAsync(redisDb *db);
void slotToKeyFlushAsync(void);
size_t lazyfreeGetPendingObjectsCount(void);
void freeObjAsync(robj *o);

 
int *getKeysFromCommand(struct redisCommand *cmd, robj **argv, int argc, int *numkeys);
void getKeysFreeResult(int *result);
int *zunionInterGetKeys(struct redisCommand *cmd,robj **argv, int argc, int *numkeys);
int *evalGetKeys(struct redisCommand *cmd, robj **argv, int argc, int *numkeys);
int *sortGetKeys(struct redisCommand *cmd, robj **argv, int argc, int *numkeys);
int *migrateGetKeys(struct redisCommand *cmd, robj **argv, int argc, int *numkeys);
int *georadiusGetKeys(struct redisCommand *cmd, robj **argv, int argc, int *numkeys);
int *xreadGetKeys(struct redisCommand *cmd, robj **argv, int argc, int *numkeys);

 
void clusterInit(void);
unsigned short crc16(const char *buf, int len);
unsigned int keyHashSlot(char *key, int keylen);
void clusterCron(void);
void clusterPropagatePublish(robj *channel, robj *message);
void migrateCloseTimedoutSockets(void);
void clusterBeforeSleep(void);
int clusterSendModuleMessageToTarget(const char *target, uint64_t module_id, uint8_t type, unsigned char *payload, uint32_t len);

 
void initSentinelConfig(void);
void initSentinel(void);
void sentinelTimer(void);
char *sentinelHandleConfiguration(char **argv, int argc);
void sentinelIsRunning(void);

 
int redis_check_rdb(char *rdbfilename, FILE *fp);
int redis_check_rdb_main(int argc, char **argv, FILE *fp);
int redis_check_aof_main(int argc, char **argv);

 
void scriptingInit(int setup);
int ldbRemoveChild(pid_t pid);
void ldbKillForkedSessions(void);
int ldbPendingChildren(void);
sds luaCreateFunction(client *c, lua_State *lua, robj *body);

 
void processUnblockedClients(void);
void blockClient(client *c, int btype);
void unblockClient(client *c);
void queueClientForReprocessing(client *c);
void replyToBlockedClientTimedOut(client *c);
int getTimeoutFromObjectOrReply(client *c, robj *object, mstime_t *timeout, int unit);
void disconnectAllBlockedClients(void);
void handleClientsBlockedOnKeys(void);
void signalKeyAsReady(redisDb *db, robj *key);
void blockForKeys(client *c, int btype, robj **keys, int numkeys, mstime_t timeout, robj *target, streamID *ids);

 
void activeExpireCycle(int type);
void expireSlaveKeys(void);
void rememberSlaveKeyWithExpire(redisDb *db, robj *key);
void flushSlaveKeysWithExpireList(void);
size_t getSlaveKeyWithExpireCount(void);

 
void evictionPoolAlloc(void);
#define LFU_INIT_VAL 5
unsigned long LFUGetTimeInMinutes(void);
uint8_t LFULogIncr(uint8_t value);
unsigned long LFUDecrAndReturn(robj *o);

 
uint64_t dictSdsHash(const void *key);
int dictSdsKeyCompare(void *privdata, const void *key1, const void *key2);
void dictSdsDestructor(void *privdata, void *val);

 
char *redisGitSHA1(void);
char *redisGitDirty(void);
uint64_t redisBuildId(void);

 
void authCommand(client *c);
void pingCommand(client *c);
void echoCommand(client *c);
void commandCommand(client *c);
void setCommand(client *c);
void setnxCommand(client *c);
void setexCommand(client *c);
void psetexCommand(client *c);
void getCommand(client *c);
void delCommand(client *c);
void unlinkCommand(client *c);
void existsCommand(client *c);
void setbitCommand(client *c);
void getbitCommand(client *c);
void bitfieldCommand(client *c);
void setrangeCommand(client *c);
void getrangeCommand(client *c);
void incrCommand(client *c);
void decrCommand(client *c);
void incrbyCommand(client *c);
void decrbyCommand(client *c);
void incrbyfloatCommand(client *c);
void selectCommand(client *c);
void swapdbCommand(client *c);
void randomkeyCommand(client *c);
void keysCommand(client *c);
void scanCommand(client *c);
void dbsizeCommand(client *c);
void lastsaveCommand(client *c);
void saveCommand(client *c);
void bgsaveCommand(client *c);
void bgrewriteaofCommand(client *c);
void shutdownCommand(client *c);
void moveCommand(client *c);
void renameCommand(client *c);
void renamenxCommand(client *c);
void lpushCommand(client *c);
void rpushCommand(client *c);
void lpushxCommand(client *c);
void rpushxCommand(client *c);
void linsertCommand(client *c);
void lpopCommand(client *c);
void rpopCommand(client *c);
void llenCommand(client *c);
void lindexCommand(client *c);
void lrangeCommand(client *c);
void ltrimCommand(client *c);
void typeCommand(client *c);
void lsetCommand(client *c);
void saddCommand(client *c);
void sremCommand(client *c);
void smoveCommand(client *c);
void sismemberCommand(client *c);
void scardCommand(client *c);
void spopCommand(client *c);
void srandmemberCommand(client *c);
void sinterCommand(client *c);
void sinterstoreCommand(client *c);
void sunionCommand(client *c);
void sunionstoreCommand(client *c);
void sdiffCommand(client *c);
void sdiffstoreCommand(client *c);
void sscanCommand(client *c);
void syncCommand(client *c);
void flushdbCommand(client *c);
void flushallCommand(client *c);
void sortCommand(client *c);
void lremCommand(client *c);
void rpoplpushCommand(client *c);
void infoCommand(client *c);
void mgetCommand(client *c);
void monitorCommand(client *c);
void expireCommand(client *c);
void expireatCommand(client *c);
void pexpireCommand(client *c);
void pexpireatCommand(client *c);
void getsetCommand(client *c);
void ttlCommand(client *c);
void touchCommand(client *c);
void pttlCommand(client *c);
void persistCommand(client *c);
void replicaofCommand(client *c);
void roleCommand(client *c);
void debugCommand(client *c);
void msetCommand(client *c);
void msetnxCommand(client *c);
void zaddCommand(client *c);
void zincrbyCommand(client *c);
void zrangeCommand(client *c);
void zrangebyscoreCommand(client *c);
void zrevrangebyscoreCommand(client *c);
void zrangebylexCommand(client *c);
void zrevrangebylexCommand(client *c);
void zcountCommand(client *c);
void zlexcountCommand(client *c);
void zrevrangeCommand(client *c);
void zcardCommand(client *c);
void zremCommand(client *c);
void zscoreCommand(client *c);
void zremrangebyscoreCommand(client *c);
void zremrangebylexCommand(client *c);
void zpopminCommand(client *c);
void zpopmaxCommand(client *c);
void bzpopminCommand(client *c);
void bzpopmaxCommand(client *c);
void multiCommand(client *c);
void execCommand(client *c);
void discardCommand(client *c);
void blpopCommand(client *c);
void brpopCommand(client *c);
void brpoplpushCommand(client *c);
void appendCommand(client *c);
void strlenCommand(client *c);
void zrankCommand(client *c);
void zrevrankCommand(client *c);
void hsetCommand(client *c);
void hsetnxCommand(client *c);
void hgetCommand(client *c);
void hmsetCommand(client *c);
void hmgetCommand(client *c);
void hdelCommand(client *c);
void hlenCommand(client *c);
void hstrlenCommand(client *c);
void zremrangebyrankCommand(client *c);
void zunionstoreCommand(client *c);
void zinterstoreCommand(client *c);
void zscanCommand(client *c);
void hkeysCommand(client *c);
void hvalsCommand(client *c);
void hgetallCommand(client *c);
void hexistsCommand(client *c);
void hscanCommand(client *c);
void configCommand(client *c);
void hincrbyCommand(client *c);
void hincrbyfloatCommand(client *c);
void subscribeCommand(client *c);
void unsubscribeCommand(client *c);
void psubscribeCommand(client *c);
void punsubscribeCommand(client *c);
void publishCommand(client *c);
void pubsubCommand(client *c);
void watchCommand(client *c);
void unwatchCommand(client *c);
void clusterCommand(client *c);
void restoreCommand(client *c);
void migrateCommand(client *c);
void askingCommand(client *c);
void readonlyCommand(client *c);
void readwriteCommand(client *c);
void dumpCommand(client *c);
void objectCommand(client *c);
void memoryCommand(client *c);
void clientCommand(client *c);
void helloCommand(client *c);
void evalCommand(client *c);
void evalShaCommand(client *c);
void scriptCommand(client *c);
void timeCommand(client *c);
void bitopCommand(client *c);
void bitcountCommand(client *c);
void bitposCommand(client *c);
void replconfCommand(client *c);
void waitCommand(client *c);
void geoencodeCommand(client *c);
void geodecodeCommand(client *c);
void georadiusbymemberCommand(client *c);
void georadiusbymemberroCommand(client *c);
void georadiusCommand(client *c);
void georadiusroCommand(client *c);
void geoaddCommand(client *c);
void geohashCommand(client *c);
void geoposCommand(client *c);
void geodistCommand(client *c);
void pfselftestCommand(client *c);
void pfaddCommand(client *c);
void pfcountCommand(client *c);
void pfmergeCommand(client *c);
void pfdebugCommand(client *c);
void latencyCommand(client *c);
void moduleCommand(client *c);
void securityWarningCommand(client *c);
void xaddCommand(client *c);
void xrangeCommand(client *c);
void xrevrangeCommand(client *c);
void xlenCommand(client *c);
void xreadCommand(client *c);
void xgroupCommand(client *c);
void xsetidCommand(client *c);
void xackCommand(client *c);
void xpendingCommand(client *c);
void xclaimCommand(client *c);
void xinfoCommand(client *c);
void xdelCommand(client *c);
void xtrimCommand(client *c);
void lolwutCommand(client *c);
void aclCommand(client *c);


void *calloc(size_t count, size_t size) __attribute__ ((deprecated));
void free(void *ptr) __attribute__ ((deprecated));
void *malloc(size_t size) __attribute__ ((deprecated));
void *realloc(void *ptr, size_t size) __attribute__ ((deprecated));


 
void _serverAssertWithInfo(const client *c, const robj *o, const char *estr, const char *file, int line);
void _serverAssert(const char *estr, const char *file, int line);
void _serverPanic(const char *file, int line, const char *msg, ...);
void bugReportStart(void);
void serverLogObjectDebugInfo(const robj *o);
void sigsegvHandler(int sig, siginfo_t *info, void *secret);
sds genRedisInfoString(char *section);
void enableWatchdog(int period);
void disableWatchdog(void);
void watchdogScheduleSignal(int period);
void serverLogHexDump(int level, char *descr, void *value, size_t len);
int memtest_preserving_test(unsigned long *m, size_t bytes, int passes);
void mixDigest(unsigned char *digest, void *ptr, size_t len);
void xorDigest(unsigned char *digest, void *ptr, size_t len);
int populateCommandTableParseFlags(struct redisCommand *c, char *strflags);

#define redisDebug(fmt, ...)     printf("DEBUG %s:%d > " fmt "\n", __FILE__, __LINE__, __VA_ARGS__)

#define redisDebugMark()     printf("-- MARK %s:%d --\n", __FILE__, __LINE__)


# 31 "redis-check-rdb.c"


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
# 34 "redis-check-rdb.c"

void createSharedObjects(void);
void rdbLoadProgressCallback(rio *r, const void *buf, size_t len);
int rdbCheckMode = 0;

struct {
    rio *rio;
    robj *key;                       
    int key_type;                    
    unsigned long keys;              
    unsigned long expires;           
    unsigned long already_expired;   
    int doing;                       
    int error_set;                   
    char error[1024];
} rdbstate;


 
#define RDB_CHECK_DOING_START 0
#define RDB_CHECK_DOING_READ_TYPE 1
#define RDB_CHECK_DOING_READ_EXPIRE 2
#define RDB_CHECK_DOING_READ_KEY 3
#define RDB_CHECK_DOING_READ_OBJECT_VALUE 4
#define RDB_CHECK_DOING_CHECK_SUM 5
#define RDB_CHECK_DOING_READ_LEN 6
#define RDB_CHECK_DOING_READ_AUX 7

char *rdb_check_doing_string[] = {
    "start",
    "read-type",
    "read-expire",
    "read-key",
    "read-object-value",
    "check-sum",
    "read-len",
    "read-aux"
};

char *rdb_type_string[] = {
    "string",
    "list-linked",
    "set-hashtable",
    "zset-v1",
    "hash-hashtable",
    "zset-v2",
    "module-value",
    "","",
    "hash-zipmap",
    "list-ziplist",
    "set-intset",
    "zset-ziplist",
    "hash-ziplist",
    "quicklist",
    "stream"
};

 
void rdbShowGenericInfo(void) {
    printf("[info] %lu keys read\n", rdbstate.keys);
    printf("[info] %lu expires\n", rdbstate.expires);
    printf("[info] %lu already expired\n", rdbstate.already_expired);
}


 
void rdbCheckError(const char *fmt, ...) {
    char msg[1024];
    va_list ap;

    (*(char* *)&(ap) = (char*)(&__builtin_va_alist));
    vsnprintf(msg, sizeof(msg), fmt, ap);
    ((void)0);

    printf("--- RDB ERROR DETECTED ---\n");
    printf("[offset %llu] %s\n",
        (unsigned long long) (rdbstate.rio ?
            rdbstate.rio->processed_bytes : 0), msg);
    printf("[additional info] While doing: %s\n",
        rdb_check_doing_string[rdbstate.doing]);
    if (rdbstate.key)
        printf("[additional info] Reading key '%s'\n",
            (char*)rdbstate.key->ptr);
    if (rdbstate.key_type != -1)
        printf("[additional info] Reading type %d (%s)\n",
            rdbstate.key_type,
            ((unsigned)rdbstate.key_type <
             sizeof(rdb_type_string)/sizeof(char*)) ?
                rdb_type_string[rdbstate.key_type] : "unknown");
    rdbShowGenericInfo();
}

 
void rdbCheckInfo(const char *fmt, ...) {
    char msg[1024];
    va_list ap;

    (*(char* *)&(ap) = (char*)(&__builtin_va_alist));
    vsnprintf(msg, sizeof(msg), fmt, ap);
    ((void)0);

    printf("[offset %llu] %s\n",
        (unsigned long long) (rdbstate.rio ?
            rdbstate.rio->processed_bytes : 0), msg);
}


 
void rdbCheckSetError(const char *fmt, ...) {
    va_list ap;

    (*(char* *)&(ap) = (char*)(&__builtin_va_alist));
    vsnprintf(rdbstate.error, sizeof(rdbstate.error), fmt, ap);
    ((void)0);
    rdbstate.error_set = 1;
}



 
void rdbCheckHandleCrash(int sig, siginfo_t *info, void *secret) {
    ((void) sig);
    ((void) info);
    ((void) secret);

    rdbCheckError("Server crash checking the specified RDB file!");
    exit(1);
}

void rdbCheckSetupSignals(void) {
    struct sigaction act;

    sigemptyset(&act.sa_mask);
    act.sa_flags = 0x40000000 | 0x80000000 | 4;
    act. __sigaction_handler . sa_sigaction = rdbCheckHandleCrash;
    sigaction(11, &act, ((void *)0));
    sigaction(7, &act, ((void *)0));
    sigaction(8, &act, ((void *)0));
    sigaction(4, &act, ((void *)0));
}




 
int redis_check_rdb(char *rdbfilename, FILE *fp) {
    uint64_t dbid;
    int type, rdbver;
    char buf[1024];
    long long expiretime, now = mstime();
    static rio rdb;  

    int closefile = (fp == ((void *)0));
    if (fp == ((void *)0) && (fp = fopen(rdbfilename,"r")) == ((void *)0)) return 1;

    rioInitWithFile(&rdb,fp);
    rdbstate.rio = &rdb;
    rdb.update_cksum = rdbLoadProgressCallback;
    if (rioRead(&rdb,buf,9) == 0) goto eoferr;
    buf[9] = '\0';
    if (memcmp(buf,"REDIS",5) != 0) {
        rdbCheckError("Wrong signature trying to load DB from file");
        goto err;
    }
    rdbver = atoi(buf+5);
    if (rdbver < 1 || rdbver > 9) {
        rdbCheckError("Can't handle RDB format version %d",rdbver);
        goto err;
    }

    expiretime = -1;
    startLoading(fp);
    while(1) {
        robj *key, *val;

         
        rdbstate.doing = 1;
        if ((type = rdbLoadType(&rdb)) == -1) goto eoferr;

         
        if (type == 253) {
            rdbstate.doing = 2;
            

 
            if ((expiretime = rdbLoadTime(&rdb)) == -1) goto eoferr;
            expiretime *= 1000;
            continue;  
        } else if (type == 252) {
            
 
            rdbstate.doing = 2;
            if ((expiretime = rdbLoadMillisecondTime(&rdb, rdbver)) == -1) goto eoferr;
            continue;  
        } else if (type == 249) {
             
            uint8_t byte;
            if (rioRead(&rdb,&byte,1) == 0) goto eoferr;
            continue;  
        } else if (type == 248) {
             
            if (rdbLoadLen(&rdb,((void *)0)) == (18446744073709551615UL)) goto eoferr;
            continue;  
        } else if (type == 255) {
             
            break;
        } else if (type == 254) {
             
            rdbstate.doing = 6;
            if ((dbid = rdbLoadLen(&rdb,((void *)0))) == (18446744073709551615UL))
                goto eoferr;
            rdbCheckInfo("Selecting DB ID %d", dbid);
            continue;  
        } else if (type == 251) {
            
 
            uint64_t db_size, expires_size;
            rdbstate.doing = 6;
            if ((db_size = rdbLoadLen(&rdb,((void *)0))) == (18446744073709551615UL))
                goto eoferr;
            if ((expires_size = rdbLoadLen(&rdb,((void *)0))) == (18446744073709551615UL))
                goto eoferr;
            continue;  
        } else if (type == 250) {
            



 
            robj *auxkey, *auxval;
            rdbstate.doing = 7;
            if ((auxkey = rdbLoadStringObject(&rdb)) == ((void *)0)) goto eoferr;
            if ((auxval = rdbLoadStringObject(&rdb)) == ((void *)0)) goto eoferr;

            rdbCheckInfo("AUX FIELD %s = '%s'",
                (char*)auxkey->ptr, (char*)auxval->ptr);
            decrRefCount(auxkey);
            decrRefCount(auxval);
            continue;  
        } else {
            if (!((type >= 0 && type <= 7) || (type >= 9 && type <= 15))) {
                rdbCheckError("Invalid object type: %d", type);
                goto err;
            }
            rdbstate.key_type = type;
        }

         
        rdbstate.doing = 3;
        if ((key = rdbLoadStringObject(&rdb)) == ((void *)0)) goto eoferr;
        rdbstate.key = key;
        rdbstate.keys++;
         
        rdbstate.doing = 4;
        if ((val = rdbLoadObject(type,&rdb,key)) == ((void *)0)) goto eoferr;
         
        if (expiretime != -1 && expiretime < now)
            rdbstate.already_expired++;
        if (expiretime != -1) rdbstate.expires++;
        rdbstate.key = ((void *)0);
        decrRefCount(key);
        decrRefCount(val);
        rdbstate.key_type = -1;
        expiretime = -1;
    }
     
    if (rdbver >= 5 && server.rdb_checksum) {
        uint64_t cksum, expected = rdb.cksum;

        rdbstate.doing = 5;
        if (rioRead(&rdb,&cksum,8) == 0) goto eoferr;
        ((void)(0));
        if (cksum == 0) {
            rdbCheckInfo("RDB file was saved with checksum disabled: no check performed.");
        } else if (cksum != expected) {
            rdbCheckError("RDB CRC error");
            goto err;
        } else {
            rdbCheckInfo("Checksum OK");
        }
    }

    if (closefile) fclose(fp);
    return 0;

eoferr:  
    if (rdbstate.error_set) {
        rdbCheckError(rdbstate.error);
    } else {
        rdbCheckError("Unexpected EOF reading RDB file");
    }
err:
    if (closefile) fclose(fp);
    return 1;
}












 
int redis_check_rdb_main(int argc, char **argv, FILE *fp) {
    if (argc != 2 && fp == ((void *)0)) {
        fprintf(stderr, "Usage: %s <rdb-file-name>\n", argv[0]);
        exit(1);
    }
    

 
    if (shared.integers[0] == ((void *)0))
        createSharedObjects();
    server.loading_process_events_interval_bytes = 0;
    rdbCheckMode = 1;
    rdbCheckInfo("Checking RDB file %s", argv[1]);
    rdbCheckSetupSignals();
    int retval = redis_check_rdb(argv[1],fp);
    if (retval == 0) {
        rdbCheckInfo("\\o/ RDB looks OK! \\o/");
        rdbShowGenericInfo();
    }
    if (fp) return (retval == 0) ? 0 : -1;
    exit(retval);
}
