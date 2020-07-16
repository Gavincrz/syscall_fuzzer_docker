# 1 "dict.c"
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

# 1 "dict.c"

































 

# 1 "fmacros.h"



























 


#define _REDIS_FMACRO_H

#define _BSD_SOURCE


#define _GNU_SOURCE
#define _DEFAULT_SOURCE







#define _XOPEN_SOURCE 700



 








#define _LARGEFILE_SOURCE
#define _FILE_OFFSET_BITS 64

# 37 "dict.c"

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

# 39 "dict.c"
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







# 40 "dict.c"
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
# 41 "dict.c"
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




# 42 "dict.c"
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
# 43 "dict.c"
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



 

# 44 "dict.c"
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



# 45 "dict.c"

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

# 47 "dict.c"
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






# 48 "dict.c"
# 1 "redisassert.h"



































 


#define __REDIS_ASSERT_H__

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




# 42 "redisassert.h"

#define assert(_e) ((_e)?(void)0 : (_serverAssert(#_e,__FILE__,__LINE__),_exit(1)))
#define panic(...) _serverPanic(__FILE__,__LINE__,__VA_ARGS__),_exit(1)

void _serverAssert(char *estr, char *file, int line);
void _serverPanic(const char *file, int line, const char *msg, ...);

# 50 "dict.c"











 
static int dict_can_resize = 1;
static unsigned int dict_force_resize_ratio = 5;

 

static int _dictExpandIfNeeded(dict *ht);
static unsigned long _dictNextPower(unsigned long size);
static long _dictKeyIndex(dict *ht, const void *key, uint64_t hash, dictEntry **existing);
static int _dictInit(dict *ht, dictType *type, void *privDataPtr);

 

static uint8_t dict_hash_function_seed[16];

void dictSetHashFunctionSeed(uint8_t *seed) {
    memcpy(dict_hash_function_seed,seed,sizeof(dict_hash_function_seed));
}

uint8_t *dictGetHashFunctionSeed(void) {
    return dict_hash_function_seed;
}


 

uint64_t siphash(const uint8_t *in, const size_t inlen, const uint8_t *k);
uint64_t siphash_nocase(const uint8_t *in, const size_t inlen, const uint8_t *k);

uint64_t dictGenHashFunction(const void *key, int len) {
    return siphash(key,len,dict_hash_function_seed);
}

uint64_t dictGenCaseHashFunction(const unsigned char *buf, int len) {
    return siphash_nocase(buf,len,dict_hash_function_seed);
}

 


 
static void _dictReset(dictht *ht)
{
    ht->table = ((void *)0);
    ht->size = 0;
    ht->sizemask = 0;
    ht->used = 0;
}

 
dict *dictCreate(dictType *type,
        void *privDataPtr)
{
    dict *d = zmalloc(sizeof(*d));

    _dictInit(d,type,privDataPtr);
    return d;
}

 
int _dictInit(dict *d, dictType *type,
        void *privDataPtr)
{
    _dictReset(&d->ht[0]);
    _dictReset(&d->ht[1]);
    d->type = type;
    d->privdata = privDataPtr;
    d->rehashidx = -1;
    d->iterators = 0;
    return 0;
}


 
int dictResize(dict *d)
{
    int minimal;

    if (!dict_can_resize || ((d)->rehashidx != -1)) return 1;
    minimal = d->ht[0].used;
    if (minimal < 4)
        minimal = 4;
    return dictExpand(d, minimal);
}

 
int dictExpand(dict *d, unsigned long size)
{
    
 
    if (((d)->rehashidx != -1) || d->ht[0].used > size)
        return 1;

    dictht n;  
    unsigned long realsize = _dictNextPower(size);

     
    if (realsize == d->ht[0].size) return 1;

     
    n.size = realsize;
    n.sizemask = realsize-1;
    n.table = zcalloc(realsize*sizeof(dictEntry*));
    n.used = 0;

    
 
    if (d->ht[0].table == ((void *)0)) {
        d->ht[0] = n;
        return 0;
    }

     
    d->ht[1] = n;
    d->rehashidx = 0;
    return 0;
}









 
int dictRehash(dict *d, int n) {
    int empty_visits = n*10;  
    if (!((d)->rehashidx != -1)) return 0;

    while(n-- && d->ht[0].used != 0) {
        dictEntry *de, *nextde;

        
 
        ((d->ht[0]. size > (unsigned long)d->rehashidx)?(void)0 : (_serverAssert("d->ht[0].size > (unsigned long)d->rehashidx","dict.c",197),_exit(1)));
        while(d->ht[0].table[d->rehashidx] == ((void *)0)) {
            d->rehashidx++;
            if (--empty_visits == 0) return 1;
        }
        de = d->ht[0].table[d->rehashidx];
         
        while(de) {
            uint64_t h;

            nextde = de->next;
             
            h = (d)->type ->hashFunction(de ->key) & d->ht[1].sizemask;
            de->next = d->ht[1].table[h];
            d->ht[1].table[h] = de;
            d->ht[0].used--;
            d->ht[1].used++;
            de = nextde;
        }
        d->ht[0].table[d->rehashidx] = ((void *)0);
        d->rehashidx++;
    }

     
    if (d->ht[0].used == 0) {
        zfree(d->ht[0].table);
        d->ht[0] = d->ht[1];
        _dictReset(&d->ht[1]);
        d->rehashidx = -1;
        return 0;
    }

     
    return 1;
}

long long timeInMilliseconds(void) {
    struct timeval tv;

    gettimeofday(&tv,((void *)0));
    return (((long long)tv.tv_sec)*1000)+(tv.tv_usec/1000);
}

 
int dictRehashMilliseconds(dict *d, int ms) {
    long long start = timeInMilliseconds();
    int rehashes = 0;

    while(dictRehash(d,100)) {
        rehashes += 100;
        if (timeInMilliseconds()-start > ms) break;
    }
    return rehashes;
}








 
static void _dictRehashStep(dict *d) {
    if (d->iterators == 0) dictRehash(d,1);
}

 
int dictAdd(dict *d, void *key, void *val)
{
    dictEntry *entry = dictAddRaw(d,key,((void *)0));

    if (!entry) return 1;
    do { if ((d)->type ->valDup) (entry)->v . val = (d)->type ->valDup((d)->privdata, val); else (entry)->v . val = (val); } while(0);
    return 0;
}


















 
dictEntry *dictAddRaw(dict *d, void *key, dictEntry **existing)
{
    long index;
    dictEntry *entry;
    dictht *ht;

    if (((d)->rehashidx != -1)) _dictRehashStep(d);

    
 
    if ((index = _dictKeyIndex(d, key, (d)->type ->hashFunction(key), existing)) == -1)
        return ((void *)0);

    


 
    ht = ((d)->rehashidx != -1) ? &d->ht[1] : &d->ht[0];
    entry = zmalloc(sizeof(*entry));
    entry->next = ht->table[index];
    ht->table[index] = entry;
    ht->used++;

     
    do { if ((d)->type ->keyDup) (entry)->key = (d)->type ->keyDup((d)->privdata, key); else (entry)->key = (key); } while(0);
    return entry;
}





 
int dictReplace(dict *d, void *key, void *val)
{
    dictEntry *entry, *existing, auxentry;

    
 
    entry = dictAddRaw(d,key,&existing);
    if (entry) {
        do { if ((d)->type ->valDup) (entry)->v . val = (d)->type ->valDup((d)->privdata, val); else (entry)->v . val = (val); } while(0);
        return 1;
    }

    



 
    auxentry = *existing;
    do { if ((d)->type ->valDup) (existing)->v . val = (d)->type ->valDup((d)->privdata, val); else (existing)->v . val = (val); } while(0);
    if ((d)->type ->valDestructor) (d)->type ->valDestructor((d)->privdata, (&auxentry)->v . val);
    return 0;
}







 
dictEntry *dictAddOrFind(dict *d, void *key) {
    dictEntry *entry, *existing;
    entry = dictAddRaw(d,key,&existing);
    return entry ? entry : existing;
}



 
static dictEntry *dictGenericDelete(dict *d, const void *key, int nofree) {
    uint64_t h, idx;
    dictEntry *he, *prevHe;
    int table;

    if (d->ht[0].used == 0 && d->ht[1].used == 0) return ((void *)0);

    if (((d)->rehashidx != -1)) _dictRehashStep(d);
    h = (d)->type ->hashFunction(key);

    for (table = 0; table <= 1; table++) {
        idx = h & d->ht[table].sizemask;
        he = d->ht[table].table[idx];
        prevHe = ((void *)0);
        while(he) {
            if (key==he->key || (((d)->type ->keyCompare) ? (d)->type ->keyCompare((d)->privdata, key, he ->key) : (key) == (he ->key))) {
                 
                if (prevHe)
                    prevHe->next = he->next;
                else
                    d->ht[table].table[idx] = he->next;
                if (!nofree) {
                    if ((d)->type ->keyDestructor) (d)->type ->keyDestructor((d)->privdata, (he)->key);
                    if ((d)->type ->valDestructor) (d)->type ->valDestructor((d)->privdata, (he)->v . val);
                    zfree(he);
                }
                d->ht[table].used--;
                return he;
            }
            prevHe = he;
            he = he->next;
        }
        if (!((d)->rehashidx != -1)) break;
    }
    return ((void *)0);  
}


 
int dictDelete(dict *ht, const void *key) {
    return dictGenericDelete(ht,key,0) ? 0 : 1;
}





















 
dictEntry *dictUnlink(dict *ht, const void *key) {
    return dictGenericDelete(ht,key,1);
}


 
void dictFreeUnlinkedEntry(dict *d, dictEntry *he) {
    if (he == ((void *)0)) return;
    if ((d)->type ->keyDestructor) (d)->type ->keyDestructor((d)->privdata, (he)->key);
    if ((d)->type ->valDestructor) (d)->type ->valDestructor((d)->privdata, (he)->v . val);
    zfree(he);
}

 
int _dictClear(dict *d, dictht *ht, void(callback)(void *)) {
    unsigned long i;

     
    for (i = 0; i < ht->size && ht->used > 0; i++) {
        dictEntry *he, *nextHe;

        if (callback && (i & 65535) == 0) callback(d->privdata);

        if ((he = ht->table[i]) == ((void *)0)) continue;
        while(he) {
            nextHe = he->next;
            if ((d)->type ->keyDestructor) (d)->type ->keyDestructor((d)->privdata, (he)->key);
            if ((d)->type ->valDestructor) (d)->type ->valDestructor((d)->privdata, (he)->v . val);
            zfree(he);
            ht->used--;
            he = nextHe;
        }
    }
     
    zfree(ht->table);
     
    _dictReset(ht);
    return 0;  
}

 
void dictRelease(dict *d)
{
    _dictClear(d,&d->ht[0],((void *)0));
    _dictClear(d,&d->ht[1],((void *)0));
    zfree(d);
}

dictEntry *dictFind(dict *d, const void *key)
{
    dictEntry *he;
    uint64_t h, idx, table;

    if (d->ht[0].used + d->ht[1].used == 0) return ((void *)0);  
    if (((d)->rehashidx != -1)) _dictRehashStep(d);
    h = (d)->type ->hashFunction(key);
    for (table = 0; table <= 1; table++) {
        idx = h & d->ht[table].sizemask;
        he = d->ht[table].table[idx];
        while(he) {
            if (key==he->key || (((d)->type ->keyCompare) ? (d)->type ->keyCompare((d)->privdata, key, he ->key) : (key) == (he ->key)))
                return he;
            he = he->next;
        }
        if (!((d)->rehashidx != -1)) return ((void *)0);
    }
    return ((void *)0);
}

void *dictFetchValue(dict *d, const void *key) {
    dictEntry *he;

    he = dictFind(d,key);
    return he ? ((he)->v . val) : ((void *)0);
}






 
long long dictFingerprint(dict *d) {
    long long integers[6], hash = 0;
    int j;

    integers[0] = (long) d->ht[0].table;
    integers[1] = d->ht[0].size;
    integers[2] = d->ht[0].used;
    integers[3] = (long) d->ht[1].table;
    integers[4] = d->ht[1].size;
    integers[5] = d->ht[1].used;

    





 
    for (j = 0; j < 6; j++) {
        hash += integers[j];
         
        hash = (~hash) + (hash << 21); 
        hash = hash ^ (hash >> 24);
        hash = (hash + (hash << 3)) + (hash << 8); 
        hash = hash ^ (hash >> 14);
        hash = (hash + (hash << 2)) + (hash << 4); 
        hash = hash ^ (hash >> 28);
        hash = hash + (hash << 31);
    }
    return hash;
}

dictIterator *dictGetIterator(dict *d)
{
    dictIterator *iter = zmalloc(sizeof(*iter));

    iter->d = d;
    iter->table = 0;
    iter->index = -1;
    iter->safe = 0;
    iter->entry = ((void *)0);
    iter->nextEntry = ((void *)0);
    return iter;
}

dictIterator *dictGetSafeIterator(dict *d) {
    dictIterator *i = dictGetIterator(d);

    i->safe = 1;
    return i;
}

dictEntry *dictNext(dictIterator *iter)
{
    while (1) {
        if (iter->entry == ((void *)0)) {
            dictht *ht = &iter->d->ht[iter->table];
            if (iter->index == -1 && iter->table == 0) {
                if (iter->safe)
                    iter->d->iterators++;
                else
                    iter->fingerprint = dictFingerprint(iter->d);
            }
            iter->index++;
            if (iter->index >= (long) ht->size) {
                if (((iter->d)->rehashidx != -1) && iter->table == 0) {
                    iter->table++;
                    iter->index = 0;
                    ht = &iter->d->ht[1];
                } else {
                    break;
                }
            }
            iter->entry = ht->table[iter->index];
        } else {
            iter->entry = iter->nextEntry;
        }
        if (iter->entry) {
            
 
            iter->nextEntry = iter->entry->next;
            return iter->entry;
        }
    }
    return ((void *)0);
}

void dictReleaseIterator(dictIterator *iter)
{
    if (!(iter->index == -1 && iter->table == 0)) {
        if (iter->safe)
            iter->d->iterators--;
        else
            ((iter->fingerprint == dictFingerprint(iter->d))?(void)0 : (_serverAssert("iter->fingerprint == dictFingerprint(iter->d)","dict.c",603),_exit(1)));
    }
    zfree(iter);
}


 
dictEntry *dictGetRandomKey(dict *d)
{
    dictEntry *he, *orighe;
    unsigned long h;
    int listlen, listele;

    if (((d)->ht[0]. used+(d)->ht[1]. used) == 0) return ((void *)0);
    if (((d)->rehashidx != -1)) _dictRehashStep(d);
    if (((d)->rehashidx != -1)) {
        do {
            
 
            h = d->rehashidx + (random() % (d->ht[0].size +
                                            d->ht[1].size -
                                            d->rehashidx));
            he = (h >= d->ht[0].size) ? d->ht[1].table[h - d->ht[0].size] :
                                      d->ht[0].table[h];
        } while(he == ((void *)0));
    } else {
        do {
            h = random() & d->ht[0].sizemask;
            he = d->ht[0].table[h];
        } while(he == ((void *)0));
    }

    


 
    listlen = 0;
    orighe = he;
    while(he) {
        he = he->next;
        listlen++;
    }
    listele = random() % listlen;
    he = orighe;
    while(listele--) he = he->next;
    return he;
}






















 
unsigned int dictGetSomeKeys(dict *d, dictEntry **des, unsigned int count) {
    unsigned long j;  
    unsigned long tables;  
    unsigned long stored = 0, maxsizemask;
    unsigned long maxsteps;

    if (((d)->ht[0]. used+(d)->ht[1]. used) < count) count = ((d)->ht[0]. used+(d)->ht[1]. used);
    maxsteps = count*10;

     
    for (j = 0; j < count; j++) {
        if (((d)->rehashidx != -1))
            _dictRehashStep(d);
        else
            break;
    }

    tables = ((d)->rehashidx != -1) ? 2 : 1;
    maxsizemask = d->ht[0].sizemask;
    if (tables > 1 && maxsizemask < d->ht[1].sizemask)
        maxsizemask = d->ht[1].sizemask;

     
    unsigned long i = random() & maxsizemask;
    unsigned long emptylen = 0;  
    while(stored < count && maxsteps--) {
        for (j = 0; j < tables; j++) {
            

 
            if (tables == 2 && j == 0 && i < (unsigned long) d->rehashidx) {
                


 
                if (i >= d->ht[1].size)
                    i = d->rehashidx;
                else
                    continue;
            }
            if (i >= d->ht[j].size) continue;  
            dictEntry *he = d->ht[j].table[i];

            
 
            if (he == ((void *)0)) {
                emptylen++;
                if (emptylen >= 5 && emptylen > count) {
                    i = random() & maxsizemask;
                    emptylen = 0;
                }
            } else {
                emptylen = 0;
                while (he) {
                    
 
                    *des = he;
                    des++;
                    he = he->next;
                    stored++;
                    if (stored == count) return stored;
                }
            }
        }
        i = (i+1) & maxsizemask;
    }
    return stored;
}











 
#define GETFAIR_NUM_ENTRIES 15
dictEntry *dictGetFairRandomKey(dict *d) {
    dictEntry *entries[15];
    unsigned int count = dictGetSomeKeys(d,entries,15);
    


 
    if (count == 0) return dictGetRandomKey(d);
    unsigned int idx = rand() % count;
    return entries[idx];
}


 
static unsigned long rev(unsigned long v) {
    unsigned long s = 8 * sizeof(v); 
    unsigned long mask = ~0;
    while ((s >>= 1) > 0) {
        mask ^= (mask << s);
        v = ((v >> s) & mask) | ((v << s) & ~mask);
    }
    return v;
}




















































































 
unsigned long dictScan(dict *d,
                       unsigned long v,
                       dictScanFunction *fn,
                       dictScanBucketFunction* bucketfn,
                       void *privdata)
{
    dictht *t0, *t1;
    const dictEntry *de, *next;
    unsigned long m0, m1;

    if (((d)->ht[0]. used+(d)->ht[1]. used) == 0) return 0;

    if (!((d)->rehashidx != -1)) {
        t0 = &(d->ht[0]);
        m0 = t0->sizemask;

         
        if (bucketfn) bucketfn(privdata, &t0->table[v & m0]);
        de = t0->table[v & m0];
        while (de) {
            next = de->next;
            fn(privdata, de);
            de = next;
        }

        
 
        v |= ~m0;

         
        v = rev(v);
        v++;
        v = rev(v);

    } else {
        t0 = &d->ht[0];
        t1 = &d->ht[1];

         
        if (t0->size > t1->size) {
            t0 = &d->ht[1];
            t1 = &d->ht[0];
        }

        m0 = t0->sizemask;
        m1 = t1->sizemask;

         
        if (bucketfn) bucketfn(privdata, &t0->table[v & m0]);
        de = t0->table[v & m0];
        while (de) {
            next = de->next;
            fn(privdata, de);
            de = next;
        }

        
 
        do {
             
            if (bucketfn) bucketfn(privdata, &t1->table[v & m1]);
            de = t1->table[v & m1];
            while (de) {
                next = de->next;
                fn(privdata, de);
                de = next;
            }

             
            v |= ~m1;
            v = rev(v);
            v++;
            v = rev(v);

             
        } while (v & (m0 ^ m1));
    }

    return v;
}

 

 
static int _dictExpandIfNeeded(dict *d)
{
     
    if (((d)->rehashidx != -1)) return 0;

     
    if (d->ht[0].size == 0) return dictExpand(d, 4);

    


 
    if (d->ht[0].used >= d->ht[0].size &&
        (dict_can_resize ||
         d->ht[0].used/d->ht[0].size > dict_force_resize_ratio))
    {
        return dictExpand(d, d->ht[0].used*2);
    }
    return 0;
}

 
static unsigned long _dictNextPower(unsigned long size)
{
    unsigned long i = 4;

    if (size >= 0x7fffffffffffffffL) return 0x7fffffffffffffffL + 1LU;
    while(1) {
        if (i >= size)
            return i;
        i *= 2;
    }
}







 
static long _dictKeyIndex(dict *d, const void *key, uint64_t hash, dictEntry **existing)
{
    unsigned long idx, table;
    dictEntry *he;
    if (existing) *existing = ((void *)0);

     
    if (_dictExpandIfNeeded(d) == 1)
        return -1;
    for (table = 0; table <= 1; table++) {
        idx = hash & d->ht[table].sizemask;
         
        he = d->ht[table].table[idx];
        while(he) {
            if (key==he->key || (((d)->type ->keyCompare) ? (d)->type ->keyCompare((d)->privdata, key, he ->key) : (key) == (he ->key))) {
                if (existing) *existing = he;
                return -1;
            }
            he = he->next;
        }
        if (!((d)->rehashidx != -1)) break;
    }
    return idx;
}

void dictEmpty(dict *d, void(callback)(void*)) {
    _dictClear(d,&d->ht[0],callback);
    _dictClear(d,&d->ht[1],callback);
    d->rehashidx = -1;
    d->iterators = 0;
}

void dictEnableResize(void) {
    dict_can_resize = 1;
}

void dictDisableResize(void) {
    dict_can_resize = 0;
}

uint64_t dictGetHash(dict *d, const void *key) {
    return (d)->type ->hashFunction(key);
}





 
dictEntry **dictFindEntryRefByPtrAndHash(dict *d, const void *oldptr, uint64_t hash) {
    dictEntry *he, **heref;
    unsigned long idx, table;

    if (d->ht[0].used + d->ht[1].used == 0) return ((void *)0);  
    for (table = 0; table <= 1; table++) {
        idx = hash & d->ht[table].sizemask;
        heref = &d->ht[table].table[idx];
        he = *heref;
        while(he) {
            if (oldptr==he->key)
                return heref;
            heref = &he->next;
            he = *heref;
        }
        if (!((d)->rehashidx != -1)) return ((void *)0);
    }
    return ((void *)0);
}

 

#define DICT_STATS_VECTLEN 50
size_t _dictGetStatsHt(char *buf, size_t bufsize, dictht *ht, int tableid) {
    unsigned long i, slots = 0, chainlen, maxchainlen = 0;
    unsigned long totchainlen = 0;
    unsigned long clvector[50];
    size_t l = 0;

    if (ht->used == 0) {
        return snprintf(buf,bufsize,
            "No stats available for empty dictionaries\n");
    }

     
    for (i = 0; i < 50; i++) clvector[i] = 0;
    for (i = 0; i < ht->size; i++) {
        dictEntry *he;

        if (ht->table[i] == ((void *)0)) {
            clvector[0]++;
            continue;
        }
        slots++;
         
        chainlen = 0;
        he = ht->table[i];
        while(he) {
            chainlen++;
            he = he->next;
        }
        clvector[(chainlen < 50) ? chainlen : (50-1)]++;
        if (chainlen > maxchainlen) maxchainlen = chainlen;
        totchainlen += chainlen;
    }

     
    l += snprintf(buf+l,bufsize-l,
        "Hash table %d stats (%s):\n"
        " table size: %ld\n"
        " number of elements: %ld\n"
        " different slots: %ld\n"
        " max chain length: %ld\n"
        " avg chain length (counted): %.02f\n"
        " avg chain length (computed): %.02f\n"
        " Chain length distribution:\n",
        tableid, (tableid == 0) ? "main hash table" : "rehashing target",
        ht->size, ht->used, slots, maxchainlen,
        (float)totchainlen/slots, (float)ht->used/slots);

    for (i = 0; i < 50-1; i++) {
        if (clvector[i] == 0) continue;
        if (l >= bufsize) break;
        l += snprintf(buf+l,bufsize-l,
            "   %s%ld: %ld (%.02f%%)\n",
            (i == 50-1)?">= ":"",
            i, clvector[i], ((float)clvector[i]/ht->size)*100);
    }

     
    if (bufsize) buf[bufsize-1] = '\0';
    return strlen(buf);
}

void dictGetStats(char *buf, size_t bufsize, dict *d) {
    size_t l;
    char *orig_buf = buf;
    size_t orig_bufsize = bufsize;

    l = _dictGetStatsHt(buf,bufsize,&d->ht[0],0);
    buf += l;
    bufsize -= l;
    if (((d)->rehashidx != -1) && bufsize > 0) {
        _dictGetStatsHt(buf,bufsize,&d->ht[1],1);
    }
     
    if (orig_bufsize) orig_buf[orig_bufsize-1] = '\0';
}

 

