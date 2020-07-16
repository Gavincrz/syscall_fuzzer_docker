# 1 "rax.c"
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

# 1 "rax.c"




























 

# 1 "/usr/include/stdlib.h"















 



 



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

 
# 212 "/usr/include/features.h"


 
# 223 "/usr/include/features.h"

 


# define __USE_ISOC11	1


 


# define __USE_ISOC99	1


 


# define __USE_ISOC95	1


# 254 "/usr/include/features.h"



 
# 267 "/usr/include/features.h"

# 283 "/usr/include/features.h"






 
# 296 "/usr/include/features.h"



















# 322 "/usr/include/features.h"







# 354 "/usr/include/features.h"




























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




# define __GLIBC_USE_LIB_EXT2 0



 
#undef __GLIBC_USE_IEC_60559_BFP_EXT



# define __GLIBC_USE_IEC_60559_BFP_EXT 0



 
#undef __GLIBC_USE_IEC_60559_FUNCS_EXT



# define __GLIBC_USE_IEC_60559_FUNCS_EXT 0



 
#undef __GLIBC_USE_IEC_60559_TYPES_EXT



# define __GLIBC_USE_IEC_60559_TYPES_EXT 0
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

# 53 "/usr/include/stdlib.h"

 
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


 











































 
extern long int strtol (const char *__restrict __nptr,
			char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
 
extern unsigned long int strtoul (const char *__restrict __nptr,
				  char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

# 196 "/usr/include/stdlib.h"


 
__extension__
extern long long int strtoll (const char *__restrict __nptr,
			      char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
 
__extension__
extern unsigned long long int strtoull (const char *__restrict __nptr,
					char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


 
# 224 "/usr/include/stdlib.h"












































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




# 392 "/usr/include/stdlib.h"

# 450 "/usr/include/stdlib.h"


 
extern int rand (void) __attribute__ ((__nothrow__ , __leaf__));
 
extern void srand (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));







# 537 "/usr/include/stdlib.h"

 
extern void *malloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__warn_unused_result__));
 
extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__warn_unused_result__));


 


 
extern void *realloc (void *__ptr, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));

# 561 "/usr/include/stdlib.h"

 
extern void free (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));


















 
extern void *aligned_alloc (size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__alloc_size__ (2))) __attribute__ ((__warn_unused_result__));


 
extern void abort (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));


 
extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


 




extern int at_quick_exit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



# 610 "/usr/include/stdlib.h"



 
extern void exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));




 
extern void quick_exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));




 
extern void _Exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));



 
extern char *getenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__warn_unused_result__));

# 639 "/usr/include/stdlib.h"

# 646 "/usr/include/stdlib.h"

# 656 "/usr/include/stdlib.h"

# 663 "/usr/include/stdlib.h"


# 674 "/usr/include/stdlib.h"

# 698 "/usr/include/stdlib.h"

# 721 "/usr/include/stdlib.h"

# 730 "/usr/include/stdlib.h"

# 775 "/usr/include/stdlib.h"





 
extern int system (const char *__command) __attribute__ ((__warn_unused_result__));


# 790 "/usr/include/stdlib.h"

# 800 "/usr/include/stdlib.h"


 

# define __COMPAR_FN_T
typedef int (*__compar_fn_t) (const void *, const void *);

# 814 "/usr/include/stdlib.h"


 
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



# 884 "/usr/include/stdlib.h"

# 915 "/usr/include/stdlib.h"



 
extern int mblen (const char *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));

 
extern int mbtowc (wchar_t *__restrict __pwc,
		   const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));

 
extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__ , __leaf__));


 
extern size_t mbstowcs (wchar_t *__restrict  __pwcs,
			const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));
 
extern size_t wcstombs (char *__restrict __s,
			const wchar_t *__restrict __pwcs, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__));


# 945 "/usr/include/stdlib.h"


# 959 "/usr/include/stdlib.h"








 






# 990 "/usr/include/stdlib.h"

# 1001 "/usr/include/stdlib.h"

# 1009 "/usr/include/stdlib.h"







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







# 32 "rax.c"
# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/string.h"










 

 
# 1 "/usr/include/string.h"















 



 


#define	_STRING_H	1

#define __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h"
















 







 





#undef __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION




 
#undef __GLIBC_USE_LIB_EXT2




# define __GLIBC_USE_LIB_EXT2 0



 
#undef __GLIBC_USE_IEC_60559_BFP_EXT



# define __GLIBC_USE_IEC_60559_BFP_EXT 0



 
#undef __GLIBC_USE_IEC_60559_FUNCS_EXT



# define __GLIBC_USE_IEC_60559_FUNCS_EXT 0



 
#undef __GLIBC_USE_IEC_60559_TYPES_EXT



# define __GLIBC_USE_IEC_60559_TYPES_EXT 0
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



 







 
extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int memcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

 
# 90 "/usr/include/string.h"
extern void *memchr (const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


# 118 "/usr/include/string.h"


 
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

# 162 "/usr/include/string.h"

# 169 "/usr/include/string.h"



 





# 200 "/usr/include/string.h"

 
# 225 "/usr/include/string.h"
extern char *strchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));

 
# 252 "/usr/include/string.h"
extern char *strrchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


# 269 "/usr/include/string.h"


 
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






# 363 "/usr/include/string.h"

# 381 "/usr/include/string.h"


 
extern size_t strlen (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));

# 393 "/usr/include/string.h"


 
extern char *strerror (int __errnum) __attribute__ ((__nothrow__ , __leaf__));
# 424 "/usr/include/string.h"






# 443 "/usr/include/string.h"

# 463 "/usr/include/string.h"

# 490 "/usr/include/string.h"



 
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

# 51 "/usr/include/x86_64-linux-gnu/bits/string_fortified.h"






 
extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) void *
__attribute__ ((__nothrow__ , __leaf__)) memset (void *__dest, int __ch, size_t __len)
{
  
 
# 71 "/usr/include/x86_64-linux-gnu/bits/string_fortified.h"
  return __builtin___memset_chk (__dest, __ch, __len, __builtin_object_size(0,0));
}

# 86 "/usr/include/x86_64-linux-gnu/bits/string_fortified.h"

extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) __attribute__ ((__artificial__)) char *
__attribute__ ((__nothrow__ , __leaf__)) strcpy (char *__restrict __dest, const char *__restrict __src)
{
  return __builtin___strcpy_chk (__dest, __src, __builtin_object_size(0,0));
}

# 100 "/usr/include/x86_64-linux-gnu/bits/string_fortified.h"


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




# 33 "rax.c"
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

# 122 "/usr/include/assert.h"





 

#   define __ASSERT_FUNCTION	__extension__ __PRETTY_FUNCTION__
# 137 "/usr/include/assert.h"





# undef static_assert
# define static_assert _Static_assert
# 34 "rax.c"
# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/stdio.h"










 

 
# 1 "/usr/include/stdio.h"
















 



 


#define _STDIO_H	1

#define __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h"
















 







 





#undef __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION




 
#undef __GLIBC_USE_LIB_EXT2




# define __GLIBC_USE_LIB_EXT2 0



 
#undef __GLIBC_USE_IEC_60559_BFP_EXT



# define __GLIBC_USE_IEC_60559_BFP_EXT 0



 
#undef __GLIBC_USE_IEC_60559_FUNCS_EXT



# define __GLIBC_USE_IEC_60559_FUNCS_EXT 0



 
#undef __GLIBC_USE_IEC_60559_TYPES_EXT



# define __GLIBC_USE_IEC_60559_TYPES_EXT 0
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


# 383 "/usr/include/x86_64-linux-gnu/bits/libio.h"






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

# 53 "/usr/include/stdio.h"

# 68 "/usr/include/stdio.h"

# 75 "/usr/include/stdio.h"

 

typedef _G_fpos_t fpos_t;
# 85 "/usr/include/stdio.h"

 
#define _IOFBF 0		 
#define _IOLBF 1		 
#define _IONBF 2		 


 

# define BUFSIZ _IO_BUFSIZ




 






 
#define SEEK_SET	0	 
#define SEEK_CUR	1	 
#define SEEK_END	2	 




















 
# 1 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h"















 


#define _BITS_STDIO_LIM_H 1





#define L_tmpnam 20
#define TMP_MAX 238328
#define FILENAME_MAX 4096

# 35 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h"

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










 

extern FILE *tmpfile (void) __attribute__ ((__warn_unused_result__));
# 167 "/usr/include/stdio.h"





 
extern char *tmpnam (char *__s) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));








# 193 "/usr/include/stdio.h"





 
extern int fclose (FILE *__stream);



 
extern int fflush (FILE *__stream);

# 215 "/usr/include/stdio.h"

# 225 "/usr/include/stdio.h"






 
extern FILE *fopen (const char *__restrict __filename,
		    const char *__restrict __modes) __attribute__ ((__warn_unused_result__));



 
extern FILE *freopen (const char *__restrict __filename,
		      const char *__restrict __modes,
		      FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));
# 262 "/usr/include/stdio.h"






# 275 "/usr/include/stdio.h"

# 286 "/usr/include/stdio.h"



 
extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));


 
extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
		    int __modes, size_t __n) __attribute__ ((__nothrow__ , __leaf__));

# 306 "/usr/include/stdio.h"





 
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


# 362 "/usr/include/stdio.h"

# 371 "/usr/include/stdio.h"





 
extern int fscanf (FILE *__restrict __stream,
		   const char *__restrict __format, ...) __attribute__ ((__warn_unused_result__));



 
extern int scanf (const char *__restrict __format, ...) __attribute__ ((__warn_unused_result__));
 
extern int sscanf (const char *__restrict __s,
		   const char *__restrict __format, ...) __attribute__ ((__nothrow__ , __leaf__));







 
extern int fscanf (FILE *__restrict __stream, const char *__restrict __format, ...) __asm__ ("" "__isoc99_fscanf") __attribute__ ((__warn_unused_result__));


extern int scanf (const char *__restrict __format, ...) __asm__ ("" "__isoc99_scanf") __attribute__ ((__warn_unused_result__));

extern int sscanf (const char *__restrict __s, const char *__restrict __format, ...) __asm__ ("" "__isoc99_sscanf") __attribute__ ((__nothrow__ , __leaf__));
# 414 "/usr/include/stdio.h"





 
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
		    __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) __attribute__ ((__warn_unused_result__));




 
extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) __attribute__ ((__warn_unused_result__));

 
extern int vsscanf (const char *__restrict __s,
		    const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (__scanf__, 2, 0)));







 
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vfscanf")



     __attribute__ ((__format__ (__scanf__, 2, 0))) __attribute__ ((__warn_unused_result__));
extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vscanf")

     __attribute__ ((__format__ (__scanf__, 1, 0))) __attribute__ ((__warn_unused_result__));
extern int vsscanf (const char *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vsscanf") __attribute__ ((__nothrow__ , __leaf__))



     __attribute__ ((__format__ (__scanf__, 2, 0)));
# 471 "/usr/include/stdio.h"





 
extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);




 
extern int getchar (void);


 
#define getc(_fp) _IO_getc (_fp)

# 498 "/usr/include/stdio.h"

# 508 "/usr/include/stdio.h"








 
extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);




 
extern int putchar (int __c);


 
#define putc(_ch, _fp) _IO_putc (_ch, _fp)

# 539 "/usr/include/stdio.h"

# 548 "/usr/include/stdio.h"


# 558 "/usr/include/stdio.h"





 
extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     __attribute__ ((__warn_unused_result__));

# 579 "/usr/include/stdio.h"

# 590 "/usr/include/stdio.h"


# 620 "/usr/include/stdio.h"





 
extern int fputs (const char *__restrict __s, FILE *__restrict __stream);




 
extern int puts (const char *__s);





 
extern int ungetc (int __c, FILE *__stream);





 
extern size_t fread (void *__restrict __ptr, size_t __size,
		     size_t __n, FILE *__restrict __stream) __attribute__ ((__warn_unused_result__));



 
extern size_t fwrite (const void *__restrict __ptr, size_t __size,
		      size_t __n, FILE *__restrict __s);

# 665 "/usr/include/stdio.h"

# 678 "/usr/include/stdio.h"





 
extern int fseek (FILE *__stream, long int __off, int __whence);



 
extern long int ftell (FILE *__stream) __attribute__ ((__warn_unused_result__));



 
extern void rewind (FILE *__stream);




 

# 725 "/usr/include/stdio.h"





 
extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);



 
extern int fsetpos (FILE *__stream, const fpos_t *__pos);
# 748 "/usr/include/stdio.h"

# 755 "/usr/include/stdio.h"

 
extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
 
extern int feof (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
 
extern int ferror (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));

# 769 "/usr/include/stdio.h"





 
extern void perror (const char *__s);




 
# 1 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
















 





 

# 782 "/usr/include/stdio.h"













# 808 "/usr/include/stdio.h"














# 834 "/usr/include/stdio.h"


# 849 "/usr/include/stdio.h"








 
# 1 "/usr/include/x86_64-linux-gnu/bits/stdio.h"
















 








# define __STDIO_INLINE __extern_inline





 
# 41 "/usr/include/x86_64-linux-gnu/bits/stdio.h"

 
extern __inline __attribute__ ((__gnu_inline__)) int
getchar (void)
{
  return _IO_getc (stdin);
}


# 58 "/usr/include/x86_64-linux-gnu/bits/stdio.h"


# 75 "/usr/include/x86_64-linux-gnu/bits/stdio.h"


 
extern __inline __attribute__ ((__gnu_inline__)) int
putchar (int __c)
{
  return _IO_putc (__c, stdout);
}


# 93 "/usr/include/x86_64-linux-gnu/bits/stdio.h"


# 110 "/usr/include/x86_64-linux-gnu/bits/stdio.h"


# 120 "/usr/include/x86_64-linux-gnu/bits/stdio.h"


# 137 "/usr/include/x86_64-linux-gnu/bits/stdio.h"




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

# 155 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"

# 222 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"



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

# 323 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"

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

# 35 "rax.c"
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

# 56 "/usr/include/errno.h"



# 15 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/errno.h"




#define __CSURF_EXTERN_C extern




 

 

#hard_undef errno
extern int errno;



#undef __CSURF_EXTERN_C
# 36 "rax.c"
# 1 "/home/gavin/codesonar-5.0p0.20180811-x86_64-pc-linux/codesonar-5.0p0/csurf/csinclude/math.h"










 

 
# 1 "/usr/include/math.h"
















 



 


#define	_MATH_H	1

#define __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h"
















 







 





#undef __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION




 
#undef __GLIBC_USE_LIB_EXT2




# define __GLIBC_USE_LIB_EXT2 0



 
#undef __GLIBC_USE_IEC_60559_BFP_EXT



# define __GLIBC_USE_IEC_60559_BFP_EXT 0



 
#undef __GLIBC_USE_IEC_60559_FUNCS_EXT



# define __GLIBC_USE_IEC_60559_FUNCS_EXT 0



 
#undef __GLIBC_USE_IEC_60559_TYPES_EXT



# define __GLIBC_USE_IEC_60559_TYPES_EXT 0
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
# 87 "/usr/include/math.h"


 

#  define INFINITY (__builtin_inff ())




 

#  define NAN (__builtin_nanf (""))
# 106 "/usr/include/math.h"

# 136 "/usr/include/math.h"

 
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
# 220 "/usr/include/math.h"











 

# 1 "/usr/include/x86_64-linux-gnu/bits/fp-fast.h"
















 








 












# 234 "/usr/include/math.h"

# 256 "/usr/include/math.h"




 

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








 
extern double acosh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __acosh (double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern double asinh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __asinh (double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern double atanh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atanh (double __x) __attribute__ ((__nothrow__ , __leaf__));


 

 
 extern double exp (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp (double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern double frexp (double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern double __frexp (double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));

 
extern double ldexp (double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern double __ldexp (double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));

 
 extern double log (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log (double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern double log10 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log10 (double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern double modf (double __x, double *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern double __modf (double __x, double *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));







 
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

# 193 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"


 
extern double copysign (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __copysign (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern double nan (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __nan (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



# 214 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"

# 224 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"



 
extern double erf (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __erf (double) __attribute__ ((__nothrow__ , __leaf__));
extern double erfc (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __erfc (double) __attribute__ ((__nothrow__ , __leaf__));
extern double lgamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __lgamma (double) __attribute__ ((__nothrow__ , __leaf__));



 
extern double tgamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __tgamma (double) __attribute__ ((__nothrow__ , __leaf__));


# 244 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"

# 251 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"




 
extern double rint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __rint (double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern double nextafter (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __nextafter (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));

extern double nexttoward (double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __nexttoward (double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));


# 270 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"

 
extern double remainder (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __remainder (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));


 
extern double scalbn (double __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalbn (double __x, int __n) __attribute__ ((__nothrow__ , __leaf__));


 
extern int ilogb (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogb (double __x) __attribute__ ((__nothrow__ , __leaf__));








 
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


# 390 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"

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








 
extern float acoshf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __acoshf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern float asinhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __asinhf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern float atanhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atanhf (float __x) __attribute__ ((__nothrow__ , __leaf__));


 

 
 extern float expf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __expf (float __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern float frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern float __frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));

 
extern float ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern float __ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));

 
 extern float logf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __logf (float __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern float log10f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log10f (float __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern float modff (float __x, float *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern float __modff (float __x, float *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));







 
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

# 193 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"


 
extern float copysignf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __copysignf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern float nanf (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __nanf (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



# 214 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"

# 224 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"



 
extern float erff (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __erff (float) __attribute__ ((__nothrow__ , __leaf__));
extern float erfcf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __erfcf (float) __attribute__ ((__nothrow__ , __leaf__));
extern float lgammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __lgammaf (float) __attribute__ ((__nothrow__ , __leaf__));



 
extern float tgammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __tgammaf (float) __attribute__ ((__nothrow__ , __leaf__));


# 244 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"

# 251 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"




 
extern float rintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __rintf (float __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern float nextafterf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __nextafterf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));

extern float nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));


# 270 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"

 
extern float remainderf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __remainderf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));


 
extern float scalbnf (float __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalbnf (float __x, int __n) __attribute__ ((__nothrow__ , __leaf__));


 
extern int ilogbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbf (float __x) __attribute__ ((__nothrow__ , __leaf__));








 
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


# 390 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"

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








 
extern long double acoshl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __acoshl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern long double asinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __asinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern long double atanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


 

 
 extern long double expl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __expl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern long double __frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern long double __ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));

 
 extern long double logl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __logl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double log10l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log10l (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern long double __modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));







 
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

# 193 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"


 
extern long double copysignl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __copysignl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern long double nanl (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __nanl (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



# 214 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"

# 224 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"



 
extern long double erfl (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __erfl (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double erfcl (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __erfcl (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double lgammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __lgammal (long double) __attribute__ ((__nothrow__ , __leaf__));



 
extern long double tgammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tgammal (long double) __attribute__ ((__nothrow__ , __leaf__));


# 244 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"

# 251 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"




 
extern long double rintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __rintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));

extern long double nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));


# 270 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"

 
extern long double remainderl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __remainderl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));


 
extern long double scalbnl (long double __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalbnl (long double __x, int __n) __attribute__ ((__nothrow__ , __leaf__));


 
extern int ilogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__));








 
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


# 390 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"

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
# 391 "/usr/include/math.h"
# undef _Mdouble_
# undef __MATH_PRECNAME
# undef __MATH_DECLARING_DOUBLE
# undef __MATH_DECLARING_FLOATN



# define _Mdouble_		_Float64
# define __MATH_PRECNAME(name,r) name##f64##r
# define __MATH_DECLARING_DOUBLE  0
# define __MATH_DECLARING_FLOATN  1
# 408 "/usr/include/math.h"
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




# undef _Mdouble_
# undef __MATH_PRECNAME
# undef __MATH_DECLARING_DOUBLE
# undef __MATH_DECLARING_FLOATN



# define _Mdouble_		_Float32x
# define __MATH_PRECNAME(name,r) name##f32x##r
# define __MATH_DECLARING_DOUBLE  0
# define __MATH_DECLARING_FLOATN  1
# 442 "/usr/include/math.h"
# undef _Mdouble_
# undef __MATH_PRECNAME
# undef __MATH_DECLARING_DOUBLE
# undef __MATH_DECLARING_FLOATN



# define _Mdouble_		_Float64x
# define __MATH_PRECNAME(name,r) name##f64x##r
# define __MATH_DECLARING_DOUBLE  0
# define __MATH_DECLARING_FLOATN  1
# 459 "/usr/include/math.h"
# undef _Mdouble_
# undef __MATH_PRECNAME
# undef __MATH_DECLARING_DOUBLE
# undef __MATH_DECLARING_FLOATN


# 481 "/usr/include/math.h"

#undef	__MATHDECL_1
#undef	__MATHDECL
#undef	__MATHCALL







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




# 763 "/usr/include/math.h"







 
# 786 "/usr/include/math.h"



 
# 805 "/usr/include/math.h"

# 821 "/usr/include/math.h"

# 837 "/usr/include/math.h"

# 853 "/usr/include/math.h"

# 869 "/usr/include/math.h"

# 885 "/usr/include/math.h"

# 901 "/usr/include/math.h"







 

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

# 1262 "/usr/include/math.h"




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
# 37 "rax.c"
# 1 "rax.h"




























 


#define RAX_H

# 1 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stdint.h"
# 1 "/usr/include/stdint.h"















 



 


#define _STDINT_H	1

#define __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h"
















 







 





#undef __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION




 
#undef __GLIBC_USE_LIB_EXT2




# define __GLIBC_USE_LIB_EXT2 0



 
#undef __GLIBC_USE_IEC_60559_BFP_EXT



# define __GLIBC_USE_IEC_60559_BFP_EXT 0



 
#undef __GLIBC_USE_IEC_60559_FUNCS_EXT



# define __GLIBC_USE_IEC_60559_FUNCS_EXT 0



 
#undef __GLIBC_USE_IEC_60559_TYPES_EXT



# define __GLIBC_USE_IEC_60559_TYPES_EXT 0
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

 

 
# 1 "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h"
















 


#define _BITS_STDINT_INTN_H	1



typedef __int8_t int8_t;
typedef __int16_t int16_t;
typedef __int32_t int32_t;
typedef __int64_t int64_t;

# 35 "/usr/include/stdint.h"

 
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





# 328 "/usr/include/stdint.h"

# 10 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stdint.h"



#define _GCC_WRAP_STDINT_H
# 35 "rax.h"




























































 

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

# 38 "rax.c"


#define RAX_MALLOC_INCLUDE "rax_malloc.h"


# 1 "rax_malloc.h"




























 






 


#define RAX_ALLOC_H
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




# define __GLIBC_USE_LIB_EXT2 0



 
#undef __GLIBC_USE_IEC_60559_BFP_EXT



# define __GLIBC_USE_IEC_60559_BFP_EXT 0



 
#undef __GLIBC_USE_IEC_60559_FUNCS_EXT



# define __GLIBC_USE_IEC_60559_FUNCS_EXT 0



 
#undef __GLIBC_USE_IEC_60559_TYPES_EXT



# define __GLIBC_USE_IEC_60559_TYPES_EXT 0
# 27 "/usr/include/limits.h"




 
#define MB_LEN_MAX	16



 
# 114 "/usr/include/limits.h"



 



 







 


#  define LLONG_MIN	(-LLONG_MAX-1)


#  define LLONG_MAX	__LONG_LONG_MAX__


#  define ULLONG_MAX	(LLONG_MAX * 2ULL + 1)





 
# 180 "/usr/include/limits.h"










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


# 160 "/usr/lib/gcc/x86_64-linux-gnu/7/include-fixed/limits.h"

# 186 "/usr/lib/gcc/x86_64-linux-gnu/7/include-fixed/limits.h"



 

# 87 "../deps/jemalloc/include/jemalloc/jemalloc.h"
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



 






 
extern int strcasecmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int strncasecmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

# 137 "/usr/include/strings.h"





 
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



# 88 "../deps/jemalloc/include/jemalloc/jemalloc.h"

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






# 41 "rax_malloc.h"
#define rax_malloc zmalloc
#define rax_realloc zrealloc
#define rax_free zfree
# 44 "rax.c"



 
void *raxNotFound = (void*)"rax-not-found-pointer";

 

void raxDebugShowNode(const char *msg, raxNode *n);





 
# 69 "rax.c"
#define debugf(...)
#define debugnode(msg,n)


 
static int raxDebugMsg = 1;



 
void raxSetDebugMsg(int onoff) {
    raxDebugMsg = onoff;
}







 

 
static inline void raxStackInit(raxStack *ts) {
    ts->stack = ts->static_items;
    ts->items = 0;
    ts->maxitems = 32;
    ts->oom = 0;
}

 
static inline int raxStackPush(raxStack *ts, void *ptr) {
    if (ts->items == ts->maxitems) {
        if (ts->stack == ts->static_items) {
            ts->stack = zmalloc(sizeof(void*)*ts->maxitems*2);
            if (ts->stack == ((void *)0)) {
                ts->stack = ts->static_items;
                ts->oom = 1;
                errno = 12;
                return 0;
            }
            memcpy(ts->stack,ts->static_items,sizeof(void*)*ts->maxitems);
        } else {
            void **newalloc = zrealloc(ts->stack,sizeof(void*)*ts->maxitems*2);
            if (newalloc == ((void *)0)) {
                ts->oom = 1;
                errno = 12;
                return 0;
            }
            ts->stack = newalloc;
        }
        ts->maxitems *= 2;
    }
    ts->stack[ts->items] = ptr;
    ts->items++;
    return 1;
}


 
static inline void *raxStackPop(raxStack *ts) {
    if (ts->items == 0) return ((void *)0);
    ts->items--;
    return ts->stack[ts->items];
}


 
static inline void *raxStackPeek(raxStack *ts) {
    if (ts->items == 0) return ((void *)0);
    return ts->stack[ts->items-1];
}

 
static inline void raxStackFree(raxStack *ts) {
    if (ts->stack != ts->static_items) zfree(ts->stack);
}



 




 
#define raxPadding(nodesize) ((sizeof(void*)-((nodesize+4) % sizeof(void*))) & (sizeof(void*)-1))


 
#define raxNodeLastChildPtr(n) ((raxNode**) (     ((char*)(n)) +     raxNodeCurrentLength(n) -     sizeof(raxNode*) -     (((n)->iskey && !(n)->isnull) ? sizeof(void*) : 0) ))






 
#define raxNodeFirstChildPtr(n) ((raxNode**) (     (n)->data +     (n)->size +     raxPadding((n)->size)))






 
#define raxNodeCurrentLength(n) (     sizeof(raxNode)+(n)->size+     raxPadding((n)->size)+     ((n)->iscompr ? sizeof(raxNode*) : sizeof(raxNode*)*(n)->size)+     (((n)->iskey && !(n)->isnull)*sizeof(void*)) )









 
raxNode *raxNewNode(size_t children, int datafield) {
    size_t nodesize = sizeof(raxNode)+children+((sizeof(void*)-((children+4) % sizeof(void*))) & (sizeof(void*)-1))+
                      sizeof(raxNode*)*children;
    if (datafield) nodesize += sizeof(void*);
    raxNode *node = zmalloc(nodesize);
    if (node == ((void *)0)) return ((void *)0);
    node->iskey = 0;
    node->isnull = 0;
    node->iscompr = 0;
    node->size = children;
    return node;
}


 
rax *raxNew(void) {
    rax *rax = zmalloc(sizeof(*rax));
    if (rax == ((void *)0)) return ((void *)0);
    rax->numele = 0;
    rax->numnodes = 1;
    rax->head = raxNewNode(0,0);
    if (rax->head == ((void *)0)) {
        zfree(rax);
        return ((void *)0);
    } else {
        return rax;
    }
}


 
raxNode *raxReallocForData(raxNode *n, void *data) {
    if (data == ((void *)0)) return n;  
    size_t curlen = ( sizeof(raxNode)+(n)->size + ((sizeof(void*)-(((n)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))+ ((n)->iscompr ? sizeof(raxNode*) : sizeof(raxNode*)*(n)->size)+ (((n)->iskey && !(n)->isnull)*sizeof(void*)) );
    return zrealloc(n,curlen+sizeof(void*));
}

 
void raxSetData(raxNode *n, void *data) {
    n->iskey = 1;
    if (data != ((void *)0)) {
        n->isnull = 0;
        void **ndata = (void**)
            ((char*)n+( sizeof(raxNode)+(n)->size + ((sizeof(void*)-(((n)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))+ ((n)->iscompr ? sizeof(raxNode*) : sizeof(raxNode*)*(n)->size)+ (((n)->iskey && !(n)->isnull)*sizeof(void*)) )-sizeof(void*));
        memcpy(ndata,&data,sizeof(data));
    } else {
        n->isnull = 1;
    }
}

 
void *raxGetData(raxNode *n) {
    if (n->isnull) return ((void *)0);
    void **ndata =(void**)((char*)n+( sizeof(raxNode)+(n)->size + ((sizeof(void*)-(((n)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))+ ((n)->iscompr ? sizeof(raxNode*) : sizeof(raxNode*)*(n)->size)+ (((n)->iskey && !(n)->isnull)*sizeof(void*)) )-sizeof(void*));
    void *data;
    memcpy(&data,ndata,sizeof(data));
    return data;
}









 
raxNode *raxAddChild(raxNode *n, unsigned char c, raxNode **childptr, raxNode ***parentlink) {
    ((n->iscompr == 0) ? (void) (0) : __assert_fail ("n->iscompr == 0", "rax.c", 255, __extension__ __PRETTY_FUNCTION__));

    size_t curlen = ( sizeof(raxNode)+(n)->size + ((sizeof(void*)-(((n)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))+ ((n)->iscompr ? sizeof(raxNode*) : sizeof(raxNode*)*(n)->size)+ (((n)->iskey && !(n)->isnull)*sizeof(void*)) );
    n->size++;
    size_t newlen = ( sizeof(raxNode)+(n)->size + ((sizeof(void*)-(((n)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))+ ((n)->iscompr ? sizeof(raxNode*) : sizeof(raxNode*)*(n)->size)+ (((n)->iskey && !(n)->isnull)*sizeof(void*)) );
    n->size--; 
 

     
    raxNode *child = raxNewNode(0,0);
    if (child == ((void *)0)) return ((void *)0);

     
    raxNode *newn = zrealloc(n,newlen);
    if (newn == ((void *)0)) {
        zfree(child);
        return ((void *)0);
    }
    n = newn;

    


























 
    int pos;
    for (pos = 0; pos < n->size; pos++) {
        if (n->data[pos] > c) break;
    }

    




 
    unsigned char *src, *dst;
    if (n->iskey && !n->isnull) {
        src = ((unsigned char*)n+curlen-sizeof(void*));
        dst = ((unsigned char*)n+newlen-sizeof(void*));
        memmove(dst,src,sizeof(void*));
    }

    









 
    size_t shift = newlen - curlen - sizeof(void*);

    








 
    src = n->data+n->size+
          ((sizeof(void*)-((n->size + 4) % sizeof(void*))) & (sizeof(void*)-1))+
          sizeof(raxNode*)*pos;
    memmove(src+shift+sizeof(raxNode*),src,sizeof(raxNode*)*(n->size-pos));

    







 
    if (shift) {
        src = (unsigned char*) ((raxNode* *) ( (n)->data + (n)->size + ((sizeof(void*)-(((n)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))));
        memmove(src+shift,src,sizeof(raxNode*)*pos);
    }

    




 
    src = n->data+pos;
    memmove(src+1,src,n->size-pos);

    



 
    n->data[pos] = c;
    n->size++;
    src = (unsigned char*) ((raxNode* *) ( (n)->data + (n)->size + ((sizeof(void*)-(((n)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))));
    raxNode **childfield = (raxNode**)(src+sizeof(raxNode*)*pos);
    memcpy(childfield,&child,sizeof(child));
    *childptr = child;
    *parentlink = childfield;
    return n;
}








 
raxNode *raxCompressNode(raxNode *n, unsigned char *s, size_t len, raxNode **child) {
    ((n->size == 0 && n->iscompr == 0) ? (void) (0) : __assert_fail ("n->size == 0 && n->iscompr == 0", "rax.c", 396, __extension__ __PRETTY_FUNCTION__));
    void *data = ((void *)0);  
    size_t newsize;

    ;

     
    *child = raxNewNode(0,0);
    if (*child == ((void *)0)) return ((void *)0);

     
    newsize = sizeof(raxNode)+len+((sizeof(void*)-((len+4) % sizeof(void*))) & (sizeof(void*)-1))+sizeof(raxNode*);
    if (n->iskey) {
        data = raxGetData(n);  
        if (!n->isnull) newsize += sizeof(void*);
    }
    raxNode *newn = zrealloc(n,newsize);
    if (newn == ((void *)0)) {
        zfree(*child);
        return ((void *)0);
    }
    n = newn;

    n->iscompr = 1;
    n->size = len;
    memcpy(n->data,s,len);
    if (n->iskey) raxSetData(n,data);
    raxNode **childfield = ((raxNode* *) ( ((char*)(n)) + ( sizeof(raxNode)+(n)->size + ((sizeof(void*)-(((n)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))+ ((n)->iscompr ? sizeof(raxNode*) : sizeof(raxNode*)*(n)->size)+ (((n)->iskey && !(n)->isnull)*sizeof(void*)) ) - sizeof(raxNode*) - (((n)->iskey && !(n)->isnull) ? sizeof(void*) : 0) ));
    memcpy(childfield,child,sizeof(*child));
    return n;
}





























 
static inline size_t raxLowWalk(rax *rax, unsigned char *s, size_t len, raxNode **stopnode, raxNode ***plink, int *splitpos, raxStack *ts) {
    raxNode *h = rax->head;
    raxNode **parentlink = &rax->head;

    size_t i = 0;  
    size_t j = 0;  
    while(h->size && i < len) {
        ;
        unsigned char *v = h->data;

        if (h->iscompr) {
            for (j = 0; j < h->size && i < len; j++, i++) {
                if (v[j] != s[i]) break;
            }
            if (j != h->size) break;
        } else {
            

 
            for (j = 0; j < h->size; j++) {
                if (v[j] == s[i]) break;
            }
            if (j == h->size) break;
            i++;
        }

        if (ts) raxStackPush(ts,h);  
        raxNode **children = ((raxNode* *) ( (h)->data + (h)->size + ((sizeof(void*)-(((h)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))));
        if (h->iscompr) j = 0;  
        memcpy(&h,children+j,sizeof(h));
        parentlink = children+j;
        j = 0; 


 
    }
    ;
    if (stopnode) *stopnode = h;
    if (plink) *plink = parentlink;
    if (splitpos && h->iscompr) *splitpos = j;
    return i;
}







 
int raxGenericInsert(rax *rax, unsigned char *s, size_t len, void *data, void **old, int overwrite) {
    size_t i;
    int j = 0; 


 
    raxNode *h, **parentlink;

    ;
    i = raxLowWalk(rax,s,len,&h,&parentlink,&j,((void *)0));

    



 
    if (i == len && (!h->iscompr || j == 0  )) {
        ;
         
        if (!h->iskey || (h->isnull && overwrite)) {
            h = raxReallocForData(h,data);
            if (h) memcpy(parentlink,&h,sizeof(h));
        }
        if (h == ((void *)0)) {
            errno = 12;
            return 0;
        }

         
        if (h->iskey) {
            if (old) *old = raxGetData(h);
            if (overwrite) raxSetData(h,data);
            errno = 0;
            return 0;  
        }

        
 
        raxSetData(h,data);
        rax->numele++;
        return 1;  
    }

    

























































































































 

     
    if (h->iscompr && i != len) {
        ;

        ;
        ;
        ;

         
        raxNode **childfield = ((raxNode* *) ( ((char*)(h)) + ( sizeof(raxNode)+(h)->size + ((sizeof(void*)-(((h)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))+ ((h)->iscompr ? sizeof(raxNode*) : sizeof(raxNode*)*(h)->size)+ (((h)->iskey && !(h)->isnull)*sizeof(void*)) ) - sizeof(raxNode*) - (((h)->iskey && !(h)->isnull) ? sizeof(void*) : 0) ));
        raxNode *next;
        memcpy(&next,childfield,sizeof(next));
        ;
        ;
        if (h->iskey) {
            ;
        }

         
        size_t trimmedlen = j;
        size_t postfixlen = h->size - j - 1;
        int split_node_is_key = !trimmedlen && h->iskey && !h->isnull;
        size_t nodesize;

        
 
        raxNode *splitnode = raxNewNode(1, split_node_is_key);
        raxNode *trimmed = ((void *)0);
        raxNode *postfix = ((void *)0);

        if (trimmedlen) {
            nodesize = sizeof(raxNode)+trimmedlen+((sizeof(void*)-((trimmedlen+4) % sizeof(void*))) & (sizeof(void*)-1))+
                       sizeof(raxNode*);
            if (h->iskey && !h->isnull) nodesize += sizeof(void*);
            trimmed = zmalloc(nodesize);
        }

        if (postfixlen) {
            nodesize = sizeof(raxNode)+postfixlen+((sizeof(void*)-((postfixlen+4) % sizeof(void*))) & (sizeof(void*)-1))+
                       sizeof(raxNode*);
            postfix = zmalloc(nodesize);
        }

         
        if (splitnode == ((void *)0) ||
            (trimmedlen && trimmed == ((void *)0)) ||
            (postfixlen && postfix == ((void *)0)))
        {
            zfree(splitnode);
            zfree(trimmed);
            zfree(postfix);
            errno = 12;
            return 0;
        }
        splitnode->data[0] = h->data[j];

        if (j == 0) {
             
            if (h->iskey) {
                void *ndata = raxGetData(h);
                raxSetData(splitnode,ndata);
            }
            memcpy(parentlink,&splitnode,sizeof(splitnode));
        } else {
             
            trimmed->size = j;
            memcpy(trimmed->data,h->data,j);
            trimmed->iscompr = j > 1 ? 1 : 0;
            trimmed->iskey = h->iskey;
            trimmed->isnull = h->isnull;
            if (h->iskey && !h->isnull) {
                void *ndata = raxGetData(h);
                raxSetData(trimmed,ndata);
            }
            raxNode **cp = ((raxNode* *) ( ((char*)(trimmed)) + ( sizeof(raxNode)+(trimmed)->size + ((sizeof(void*)-(((trimmed)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))+ ((trimmed)->iscompr ? sizeof(raxNode*) : sizeof(raxNode*)*(trimmed)->size)+ (((trimmed)->iskey && !(trimmed)->isnull)*sizeof(void*)) ) - sizeof(raxNode*) - (((trimmed)->iskey && !(trimmed)->isnull) ? sizeof(void*) : 0) ));
            memcpy(cp,&splitnode,sizeof(splitnode));
            memcpy(parentlink,&trimmed,sizeof(trimmed));
            parentlink = cp;  
            rax->numnodes++;
        }

        
 
        if (postfixlen) {
             
            postfix->iskey = 0;
            postfix->isnull = 0;
            postfix->size = postfixlen;
            postfix->iscompr = postfixlen > 1;
            memcpy(postfix->data,h->data+j+1,postfixlen);
            raxNode **cp = ((raxNode* *) ( ((char*)(postfix)) + ( sizeof(raxNode)+(postfix)->size + ((sizeof(void*)-(((postfix)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))+ ((postfix)->iscompr ? sizeof(raxNode*) : sizeof(raxNode*)*(postfix)->size)+ (((postfix)->iskey && !(postfix)->isnull)*sizeof(void*)) ) - sizeof(raxNode*) - (((postfix)->iskey && !(postfix)->isnull) ? sizeof(void*) : 0) ));
            memcpy(cp,&next,sizeof(next));
            rax->numnodes++;
        } else {
             
            postfix = next;
        }

         
        raxNode **splitchild = ((raxNode* *) ( ((char*)(splitnode)) + ( sizeof(raxNode)+(splitnode)->size + ((sizeof(void*)-(((splitnode)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))+ ((splitnode)->iscompr ? sizeof(raxNode*) : sizeof(raxNode*)*(splitnode)->size)+ (((splitnode)->iskey && !(splitnode)->isnull)*sizeof(void*)) ) - sizeof(raxNode*) - (((splitnode)->iskey && !(splitnode)->isnull) ? sizeof(void*) : 0) ));
        memcpy(splitchild,&postfix,sizeof(postfix));

        

 
        zfree(h);
        h = splitnode;
    } else if (h->iscompr && i == len) {
     
        ;


         
        size_t postfixlen = h->size - j;
        size_t nodesize = sizeof(raxNode)+postfixlen+((sizeof(void*)-((postfixlen+4) % sizeof(void*))) & (sizeof(void*)-1))+
                          sizeof(raxNode*);
        if (data != ((void *)0)) nodesize += sizeof(void*);
        raxNode *postfix = zmalloc(nodesize);

        nodesize = sizeof(raxNode)+j+((sizeof(void*)-((j+4) % sizeof(void*))) & (sizeof(void*)-1))+sizeof(raxNode*);
        if (h->iskey && !h->isnull) nodesize += sizeof(void*);
        raxNode *trimmed = zmalloc(nodesize);

        if (postfix == ((void *)0) || trimmed == ((void *)0)) {
            zfree(postfix);
            zfree(trimmed);
            errno = 12;
            return 0;
        }

         
        raxNode **childfield = ((raxNode* *) ( ((char*)(h)) + ( sizeof(raxNode)+(h)->size + ((sizeof(void*)-(((h)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))+ ((h)->iscompr ? sizeof(raxNode*) : sizeof(raxNode*)*(h)->size)+ (((h)->iskey && !(h)->isnull)*sizeof(void*)) ) - sizeof(raxNode*) - (((h)->iskey && !(h)->isnull) ? sizeof(void*) : 0) ));
        raxNode *next;
        memcpy(&next,childfield,sizeof(next));

         
        postfix->size = postfixlen;
        postfix->iscompr = postfixlen > 1;
        postfix->iskey = 1;
        postfix->isnull = 0;
        memcpy(postfix->data,h->data+j,postfixlen);
        raxSetData(postfix,data);
        raxNode **cp = ((raxNode* *) ( ((char*)(postfix)) + ( sizeof(raxNode)+(postfix)->size + ((sizeof(void*)-(((postfix)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))+ ((postfix)->iscompr ? sizeof(raxNode*) : sizeof(raxNode*)*(postfix)->size)+ (((postfix)->iskey && !(postfix)->isnull)*sizeof(void*)) ) - sizeof(raxNode*) - (((postfix)->iskey && !(postfix)->isnull) ? sizeof(void*) : 0) ));
        memcpy(cp,&next,sizeof(next));
        rax->numnodes++;

         
        trimmed->size = j;
        trimmed->iscompr = j > 1;
        trimmed->iskey = 0;
        trimmed->isnull = 0;
        memcpy(trimmed->data,h->data,j);
        memcpy(parentlink,&trimmed,sizeof(trimmed));
        if (h->iskey) {
            void *aux = raxGetData(h);
            raxSetData(trimmed,aux);
        }

        
 
        cp = ((raxNode* *) ( ((char*)(trimmed)) + ( sizeof(raxNode)+(trimmed)->size + ((sizeof(void*)-(((trimmed)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))+ ((trimmed)->iscompr ? sizeof(raxNode*) : sizeof(raxNode*)*(trimmed)->size)+ (((trimmed)->iskey && !(trimmed)->isnull)*sizeof(void*)) ) - sizeof(raxNode*) - (((trimmed)->iskey && !(trimmed)->isnull) ? sizeof(void*) : 0) ));
        memcpy(cp,&postfix,sizeof(postfix));

        
 
        rax->numele++;
        zfree(h);
        return 1;  
    }

    
 
    while(i < len) {
        raxNode *child;

        

 
        if (h->size == 0 && len-i > 1) {
            ;
            size_t comprsize = len-i;
            if (comprsize > ((1<<29)-1))
                comprsize = ((1<<29)-1);
            raxNode *newh = raxCompressNode(h,s+i,comprsize,&child);
            if (newh == ((void *)0)) goto oom;
            h = newh;
            memcpy(parentlink,&h,sizeof(h));
            parentlink = ((raxNode* *) ( ((char*)(h)) + ( sizeof(raxNode)+(h)->size + ((sizeof(void*)-(((h)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))+ ((h)->iscompr ? sizeof(raxNode*) : sizeof(raxNode*)*(h)->size)+ (((h)->iskey && !(h)->isnull)*sizeof(void*)) ) - sizeof(raxNode*) - (((h)->iskey && !(h)->isnull) ? sizeof(void*) : 0) ));
            i += comprsize;
        } else {
            ;
            raxNode **new_parentlink;
            raxNode *newh = raxAddChild(h,s[i],&child,&new_parentlink);
            if (newh == ((void *)0)) goto oom;
            h = newh;
            memcpy(parentlink,&h,sizeof(h));
            parentlink = new_parentlink;
            i++;
        }
        rax->numnodes++;
        h = child;
    }
    raxNode *newh = raxReallocForData(h,data);
    if (newh == ((void *)0)) goto oom;
    h = newh;
    if (!h->iskey) rax->numele++;
    raxSetData(h,data);
    memcpy(parentlink,&h,sizeof(h));
    return 1;  

oom:
    



 
    if (h->size == 0) {
        h->isnull = 1;
        h->iskey = 1;
        rax->numele++;  
        ((raxRemove(rax,s,i,((void *)0)) != 0) ? (void) (0) : __assert_fail ("raxRemove(rax,s,i,NULL) != 0", "rax.c", 894, __extension__ __PRETTY_FUNCTION__));
    }
    errno = 12;
    return 0;
}


 
int raxInsert(rax *rax, unsigned char *s, size_t len, void *data, void **old) {
    return raxGenericInsert(rax,s,len,data,old,1);
}



 
int raxTryInsert(rax *rax, unsigned char *s, size_t len, void *data, void **old) {
    return raxGenericInsert(rax,s,len,data,old,0);
}



 
void *raxFind(rax *rax, unsigned char *s, size_t len) {
    raxNode *h;

    ;
    int splitpos = 0;
    size_t i = raxLowWalk(rax,s,len,&h,((void *)0),&splitpos,((void *)0));
    if (i != len || (h->iscompr && splitpos != 0) || !h->iskey)
        return raxNotFound;
    return raxGetData(h);
}





 
raxNode **raxFindParentLink(raxNode *parent, raxNode *child) {
    raxNode **cp = ((raxNode* *) ( (parent)->data + (parent)->size + ((sizeof(void*)-(((parent)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))));
    raxNode *c;
    while(1) {
        memcpy(&c,cp,sizeof(c));
        if (c == child) break;
        cp++;
    }
    return cp;
}




 
raxNode *raxRemoveChild(raxNode *parent, raxNode *child) {
    ;
    

 
    if (parent->iscompr) {
        void *data = ((void *)0);
        if (parent->iskey) data = raxGetData(parent);
        parent->isnull = 0;
        parent->iscompr = 0;
        parent->size = 0;
        if (parent->iskey) raxSetData(parent,data);
        ;
        return parent;
    }

    



 
    raxNode **cp = ((raxNode* *) ( (parent)->data + (parent)->size + ((sizeof(void*)-(((parent)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))));
    raxNode **c = cp;
    unsigned char *e = parent->data;

    
 
    while(1) {
        raxNode *aux;
        memcpy(&aux,c,sizeof(aux));
        if (aux == child) break;
        c++;
        e++;
    }

    
 
    int taillen = parent->size - (e - parent->data) - 1;
    ;
    memmove(e,e+1,taillen);

    




 
    size_t shift = ((parent->size+4) % sizeof(void*)) == 1 ? sizeof(void*) : 0;

     
    if (shift)
        memmove(((char*)cp)-shift,cp,(parent->size-taillen-1)*sizeof(raxNode**));

     
    size_t valuelen = (parent->iskey && !parent->isnull) ? sizeof(void*) : 0;
    memmove(((char*)c)-shift,c+1,taillen*sizeof(raxNode**)+valuelen);

     
    parent->size--;

    
 
    raxNode *newnode = zrealloc(parent,( sizeof(raxNode)+(parent)->size + ((sizeof(void*)-(((parent)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))+ ((parent)->iscompr ? sizeof(raxNode*) : sizeof(raxNode*)*(parent)->size)+ (((parent)->iskey && !(parent)->isnull)*sizeof(void*)) ));
    if (newnode) {
        ;
    }
    
 
    return newnode ? newnode : parent;
}


 
int raxRemove(rax *rax, unsigned char *s, size_t len, void **old) {
    raxNode *h;
    raxStack ts;

    ;
    raxStackInit(&ts);
    int splitpos = 0;
    size_t i = raxLowWalk(rax,s,len,&h,((void *)0),&splitpos,&ts);
    if (i != len || (h->iscompr && splitpos != 0) || !h->iskey) {
        raxStackFree(&ts);
        return 0;
    }
    if (old) *old = raxGetData(h);
    h->iskey = 0;
    rax->numele--;

    



 

    int trycompress = 0; 
 

    if (h->size == 0) {
        ;
        raxNode *child = ((void *)0);
        while(h != rax->head) {
            child = h;
            ;

            zfree(child);
            rax->numnodes--;
            h = raxStackPop(&ts);
             
 
            if (h->iskey || (!h->iscompr && h->size != 1)) break;
        }
        if (child) {
            ;

            raxNode *new = raxRemoveChild(h,child);
            if (new != h) {
                raxNode *parent = raxStackPeek(&ts);
                raxNode **parentlink;
                if (parent == ((void *)0)) {
                    parentlink = &rax->head;
                } else {
                    parentlink = raxFindParentLink(parent,h);
                }
                memcpy(parentlink,&new,sizeof(new));
            }

            
 
            if (new->size == 1 && new->iskey == 0) {
                trycompress = 1;
                h = new;
            }
        }
    } else if (h->size == 1) {
        
 
        trycompress = 1;
    }

    
 
    if (trycompress && ts.oom) trycompress = 0;

    









































 
    if (trycompress) {
        ;
        ;
        ;

        

 
        raxNode *parent;
        while(1) {
            parent = raxStackPop(&ts);
            if (!parent || parent->iskey ||
                (!parent->iscompr && parent->size != 1)) break;
            h = parent;
            ;
        }
        raxNode *start = h;  

         
        size_t comprsize = h->size;
        int nodes = 1;
        while(h->size != 0) {
            raxNode **cp = ((raxNode* *) ( ((char*)(h)) + ( sizeof(raxNode)+(h)->size + ((sizeof(void*)-(((h)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))+ ((h)->iscompr ? sizeof(raxNode*) : sizeof(raxNode*)*(h)->size)+ (((h)->iskey && !(h)->isnull)*sizeof(void*)) ) - sizeof(raxNode*) - (((h)->iskey && !(h)->isnull) ? sizeof(void*) : 0) ));
            memcpy(&h,cp,sizeof(h));
            if (h->iskey || (!h->iscompr && h->size != 1)) break;
            
 
            if (comprsize + h->size > ((1<<29)-1)) break;
            nodes++;
            comprsize += h->size;
        }
        if (nodes > 1) {
             
            size_t nodesize =
                sizeof(raxNode)+comprsize+((sizeof(void*)-((comprsize + 4) % sizeof(void*))) & (sizeof(void*)-1))+sizeof(raxNode*);
            raxNode *new = zmalloc(nodesize);
            
 
            if (new == ((void *)0)) {
                raxStackFree(&ts);
                return 1;
            }
            new->iskey = 0;
            new->isnull = 0;
            new->iscompr = 1;
            new->size = comprsize;
            rax->numnodes++;

            

 
            comprsize = 0;
            h = start;
            while(h->size != 0) {
                memcpy(new->data+comprsize,h->data,h->size);
                comprsize += h->size;
                raxNode **cp = ((raxNode* *) ( ((char*)(h)) + ( sizeof(raxNode)+(h)->size + ((sizeof(void*)-(((h)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))+ ((h)->iscompr ? sizeof(raxNode*) : sizeof(raxNode*)*(h)->size)+ (((h)->iskey && !(h)->isnull)*sizeof(void*)) ) - sizeof(raxNode*) - (((h)->iskey && !(h)->isnull) ? sizeof(void*) : 0) ));
                raxNode *tofree = h;
                memcpy(&h,cp,sizeof(h));
                zfree(tofree); rax->numnodes--;
                if (h->iskey || (!h->iscompr && h->size != 1)) break;
            }
            ;

            
 
            raxNode **cp = ((raxNode* *) ( ((char*)(new)) + ( sizeof(raxNode)+(new)->size + ((sizeof(void*)-(((new)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))+ ((new)->iscompr ? sizeof(raxNode*) : sizeof(raxNode*)*(new)->size)+ (((new)->iskey && !(new)->isnull)*sizeof(void*)) ) - sizeof(raxNode*) - (((new)->iskey && !(new)->isnull) ? sizeof(void*) : 0) ));
            memcpy(cp,&h,sizeof(h));

             
            if (parent) {
                raxNode **parentlink = raxFindParentLink(parent,start);
                memcpy(parentlink,&new,sizeof(new));
            } else {
                rax->head = new;
            }

            ;

        }
    }
    raxStackFree(&ts);
    return 1;
}


 
void raxRecursiveFree(rax *rax, raxNode *n, void (*free_callback)(void*)) {
    ;
    int numchildren = n->iscompr ? 1 : n->size;
    raxNode **cp = ((raxNode* *) ( ((char*)(n)) + ( sizeof(raxNode)+(n)->size + ((sizeof(void*)-(((n)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))+ ((n)->iscompr ? sizeof(raxNode*) : sizeof(raxNode*)*(n)->size)+ (((n)->iskey && !(n)->isnull)*sizeof(void*)) ) - sizeof(raxNode*) - (((n)->iskey && !(n)->isnull) ? sizeof(void*) : 0) ));
    while(numchildren--) {
        raxNode *child;
        memcpy(&child,cp,sizeof(child));
        raxRecursiveFree(rax,child,free_callback);
        cp--;
    }
    ;
    if (free_callback && n->iskey && !n->isnull)
        free_callback(raxGetData(n));
    zfree(n);
    rax->numnodes--;
}


 
void raxFreeWithCallback(rax *rax, void (*free_callback)(void*)) {
    raxRecursiveFree(rax,rax->head,free_callback);
    ((rax->numnodes == 0) ? (void) (0) : __assert_fail ("rax->numnodes == 0", "rax.c", 1242, __extension__ __PRETTY_FUNCTION__));
    zfree(rax);
}

 
void raxFree(rax *rax) {
    raxFreeWithCallback(rax,((void *)0));
}

 



 
void raxStart(raxIterator *it, rax *rt) {
    it->flags = (1<<1);  
    it->rt = rt;
    it->key_len = 0;
    it->key = it->key_static_string;
    it->key_max = 128;
    it->data = ((void *)0);
    it->node_cb = ((void *)0);
    raxStackInit(&it->stack);
}



 
int raxIteratorAddChars(raxIterator *it, unsigned char *s, size_t len) {
    if (it->key_max < it->key_len+len) {
        unsigned char *old = (it->key == it->key_static_string) ? ((void *)0) :
                                                                  it->key;
        size_t new_max = (it->key_len+len)*2;
        it->key = zrealloc(old,new_max);
        if (it->key == ((void *)0)) {
            it->key = (!old) ? it->key_static_string : old;
            errno = 12;
            return 0;
        }
        if (old == ((void *)0)) memcpy(it->key,it->key_static_string,it->key_len);
        it->key_max = new_max;
    }
    
 
    memmove(it->key+it->key_len,s,len);
    it->key_len += len;
    return 1;
}


 
void raxIteratorDelChars(raxIterator *it, size_t count) {
    it->key_len -= count;
}














 
int raxIteratorNextStep(raxIterator *it, int noup) {
    if (it->flags & (1<<1)) {
        return 1;
    } else if (it->flags & (1<<0)) {
        it->flags &= ~(1<<0);
        return 1;
    }

    
 
    size_t orig_key_len = it->key_len;
    size_t orig_stack_items = it->stack.items;
    raxNode *orig_node = it->node;

    while(1) {
        int children = it->node->iscompr ? 1 : it->node->size;
        if (!noup && children) {
            ;
            

 
            if (!raxStackPush(&it->stack,it->node)) return 0;
            raxNode **cp = ((raxNode* *) ( (it->node)->data + (it->node)->size + ((sizeof(void*)-(((it->node)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))));
            if (!raxIteratorAddChars(it,it->node->data,
                it->node->iscompr ? it->node->size : 1)) return 0;
            memcpy(&it->node,cp,sizeof(it->node));
            
 
            if (it->node_cb && it->node_cb(&it->node))
                memcpy(cp,&it->node,sizeof(it->node));
            

 
            if (it->node->iskey) {
                it->data = raxGetData(it->node);
                return 1;
            }
        } else {
            


 
            while(1) {
                int old_noup = noup;

                 
                if (!noup && it->node == it->rt->head) {
                    it->flags |= (1<<1);
                    it->stack.items = orig_stack_items;
                    it->key_len = orig_key_len;
                    it->node = orig_node;
                    return 1;
                }
                
 
                unsigned char prevchild = it->key[it->key_len-1];
                if (!noup) {
                    it->node = raxStackPop(&it->stack);
                } else {
                    noup = 0;
                }
                
 
                int todel = it->node->iscompr ? it->node->size : 1;
                raxIteratorDelChars(it,todel);

                
 
                if (!it->node->iscompr && it->node->size > (old_noup ? 0 : 1)) {
                    raxNode **cp = ((raxNode* *) ( (it->node)->data + (it->node)->size + ((sizeof(void*)-(((it->node)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))));
                    int i = 0;
                    while (i < it->node->size) {
                        ;
                        if (it->node->data[i] > prevchild) break;
                        i++;
                        cp++;
                    }
                    if (i != it->node->size) {
                        ;
                        raxIteratorAddChars(it,it->node->data+i,1);
                        if (!raxStackPush(&it->stack,it->node)) return 0;
                        memcpy(&it->node,cp,sizeof(it->node));
                        
 
                        if (it->node_cb && it->node_cb(&it->node))
                            memcpy(cp,&it->node,sizeof(it->node));
                        if (it->node->iskey) {
                            it->data = raxGetData(it->node);
                            return 1;
                        }
                        break;
                    }
                }
            }
        }
    }
}



 
int raxSeekGreatest(raxIterator *it) {
    while(it->node->size) {
        if (it->node->iscompr) {
            if (!raxIteratorAddChars(it,it->node->data,
                it->node->size)) return 0;
        } else {
            if (!raxIteratorAddChars(it,it->node->data+it->node->size-1,1))
                return 0;
        }
        raxNode **cp = ((raxNode* *) ( ((char*)(it->node)) + ( sizeof(raxNode)+(it->node)->size + ((sizeof(void*)-(((it->node)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))+ ((it->node)->iscompr ? sizeof(raxNode*) : sizeof(raxNode*)*(it->node)->size)+ (((it->node)->iskey && !(it->node)->isnull)*sizeof(void*)) ) - sizeof(raxNode*) - (((it->node)->iskey && !(it->node)->isnull) ? sizeof(void*) : 0) ));
        if (!raxStackPush(&it->stack,it->node)) return 0;
        memcpy(&it->node,cp,sizeof(it->node));
    }
    return 1;
}



 
int raxIteratorPrevStep(raxIterator *it, int noup) {
    if (it->flags & (1<<1)) {
        return 1;
    } else if (it->flags & (1<<0)) {
        it->flags &= ~(1<<0);
        return 1;
    }

    
 
    size_t orig_key_len = it->key_len;
    size_t orig_stack_items = it->stack.items;
    raxNode *orig_node = it->node;

    while(1) {
        int old_noup = noup;

         
        if (!noup && it->node == it->rt->head) {
            it->flags |= (1<<1);
            it->stack.items = orig_stack_items;
            it->key_len = orig_key_len;
            it->node = orig_node;
            return 1;
        }

        unsigned char prevchild = it->key[it->key_len-1];
        if (!noup) {
            it->node = raxStackPop(&it->stack);
        } else {
            noup = 0;
        }

        
 
        int todel = it->node->iscompr ? it->node->size : 1;
        raxIteratorDelChars(it,todel);

        
 
        if (!it->node->iscompr && it->node->size > (old_noup ? 0 : 1)) {
            raxNode **cp = ((raxNode* *) ( ((char*)(it->node)) + ( sizeof(raxNode)+(it->node)->size + ((sizeof(void*)-(((it->node)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))+ ((it->node)->iscompr ? sizeof(raxNode*) : sizeof(raxNode*)*(it->node)->size)+ (((it->node)->iskey && !(it->node)->isnull)*sizeof(void*)) ) - sizeof(raxNode*) - (((it->node)->iskey && !(it->node)->isnull) ? sizeof(void*) : 0) ));
            int i = it->node->size-1;
            while (i >= 0) {
                ;
                if (it->node->data[i] < prevchild) break;
                i--;
                cp--;
            }
            

 
            if (i != -1) {
                ;
                 
                if (!raxIteratorAddChars(it,it->node->data+i,1)) return 0;
                if (!raxStackPush(&it->stack,it->node)) return 0;
                memcpy(&it->node,cp,sizeof(it->node));
                 
                if (!raxSeekGreatest(it)) return 0;
            }
        }

        

 
        if (it->node->iskey) {
            it->data = raxGetData(it->node);
            return 1;
        }
    }
}




 
int raxSeek(raxIterator *it, const char *op, unsigned char *ele, size_t len) {
    int eq = 0, lt = 0, gt = 0, first = 0, last = 0;

    it->stack.items = 0;  
    it->flags |= (1<<0);
    it->flags &= ~(1<<1);
    it->key_len = 0;
    it->node = ((void *)0);

     
    if (op[0] == '>') {
        gt = 1;
        if (op[1] == '=') eq = 1;
    } else if (op[0] == '<') {
        lt = 1;
        if (op[1] == '=') eq = 1;
    } else if (op[0] == '=') {
        eq = 1;
    } else if (op[0] == '^') {
        first = 1;
    } else if (op[0] == '$') {
        last = 1;
    } else {
        errno = 0;
        return 0;  
    }

    
 
    if (it->rt->numele == 0) {
        it->flags |= (1<<1);
        return 1;
    }

    if (first) {
        
 
        return raxSeek(it,">=",((void *)0),0);
    }

    if (last) {
        
 
        it->node = it->rt->head;
        if (!raxSeekGreatest(it)) return 0;
        ((it->node ->iskey) ? (void) (0) : __assert_fail ("it->node->iskey", "rax.c", 1553, __extension__ __PRETTY_FUNCTION__));
        it->data = raxGetData(it->node);
        return 1;
    }

    

 
    int splitpos = 0;
    size_t i = raxLowWalk(it->rt,ele,len,&it->node,((void *)0),&splitpos,&it->stack);

     
    if (it->stack.oom) return 0;

    if (eq && i == len && (!it->node->iscompr || splitpos == 0) &&
        it->node->iskey)
    {
        
 
        if (!raxIteratorAddChars(it,ele,len)) return 0;  
        it->data = raxGetData(it->node);
    } else if (lt || gt) {
        



 
        if (!raxStackPush(&it->stack,it->node)) return 0;
        for (size_t j = 1; j < it->stack.items; j++) {
            raxNode *parent = it->stack.stack[j-1];
            raxNode *child = it->stack.stack[j];
            if (parent->iscompr) {
                if (!raxIteratorAddChars(it,parent->data,parent->size))
                    return 0;
            } else {
                raxNode **cp = ((raxNode* *) ( (parent)->data + (parent)->size + ((sizeof(void*)-(((parent)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))));
                unsigned char *p = parent->data;
                while(1) {
                    raxNode *aux;
                    memcpy(&aux,cp,sizeof(aux));
                    if (aux == child) break;
                    cp++;
                    p++;
                }
                if (!raxIteratorAddChars(it,p,1)) return 0;
            }
        }
        raxStackPop(&it->stack);

        
 
        ;

        if (i != len && !it->node->iscompr) {
            



 
            if (!raxIteratorAddChars(it,ele+i,1)) return 0;
            ;


            it->flags &= ~(1<<0);
            if (lt && !raxIteratorPrevStep(it,1)) return 0;
            if (gt && !raxIteratorNextStep(it,1)) return 0;
            it->flags |= (1<<0);  
        } else if (i != len && it->node->iscompr) {
            ;

             
            int nodechar = it->node->data[splitpos];
            int keychar = ele[i];
            it->flags &= ~(1<<0);
            if (gt) {
                

 
                if (nodechar > keychar) {
                    if (!raxIteratorNextStep(it,0)) return 0;
                } else {
                    if (!raxIteratorAddChars(it,it->node->data,it->node->size))
                        return 0;
                    if (!raxIteratorNextStep(it,1)) return 0;
                }
            }
            if (lt) {
                


 
                if (nodechar < keychar) {
                    if (!raxSeekGreatest(it)) return 0;
                    it->data = raxGetData(it->node);
                } else {
                    if (!raxIteratorAddChars(it,it->node->data,it->node->size))
                        return 0;
                    if (!raxIteratorPrevStep(it,1)) return 0;
                }
            }
            it->flags |= (1<<0);  
        } else {
            ;

            



 
            it->flags &= ~(1<<0);
            if (it->node->iscompr && it->node->iskey && splitpos && lt) {
                










 
            } else {
                if (gt && !raxIteratorNextStep(it,0)) return 0;
                if (lt && !raxIteratorPrevStep(it,0)) return 0;
            }
            it->flags |= (1<<0);  
        }
    } else {
         
        it->flags |= (1<<1);
        return 1;
    }
    return 1;
}



 
int raxNext(raxIterator *it) {
    if (!raxIteratorNextStep(it,0)) {
        errno = 12;
        return 0;
    }
    if (it->flags & (1<<1)) {
        errno = 0;
        return 0;
    }
    return 1;
}



 
int raxPrev(raxIterator *it) {
    if (!raxIteratorPrevStep(it,0)) {
        errno = 12;
        return 0;
    }
    if (it->flags & (1<<1)) {
        errno = 0;
        return 0;
    }
    return 1;
}












 
int raxRandomWalk(raxIterator *it, size_t steps) {
    if (it->rt->numele == 0) {
        it->flags |= (1<<1);
        return 0;
    }

    if (steps == 0) {
        size_t fle = floor(log(it->rt->numele));
        fle *= 2;
        steps = 1 + rand() % fle;
    }

    raxNode *n = it->node;
    while(steps > 0 || !n->iskey) {
        int numchildren = n->iscompr ? 1 : n->size;
        int r = rand() % (numchildren+(n != it->rt->head));

        if (r == numchildren) {
             
            n = raxStackPop(&it->stack);
            int todel = n->iscompr ? n->size : 1;
            raxIteratorDelChars(it,todel);
        } else {
             
            if (n->iscompr) {
                if (!raxIteratorAddChars(it,n->data,n->size)) return 0;
            } else {
                if (!raxIteratorAddChars(it,n->data+r,1)) return 0;
            }
            raxNode **cp = ((raxNode* *) ( (n)->data + (n)->size + ((sizeof(void*)-(((n)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))))+r;
            if (!raxStackPush(&it->stack,n)) return 0;
            memcpy(&n,cp,sizeof(n));
        }
        if (n->iskey) steps--;
    }
    it->node = n;
    return 1;
}



 
int raxCompare(raxIterator *iter, const char *op, unsigned char *key, size_t key_len) {
    int eq = 0, lt = 0, gt = 0;

    if (op[0] == '=' || op[1] == '=') eq = 1;
    if (op[0] == '>') gt = 1;
    else if (op[0] == '<') lt = 1;
    else if (op[1] != '=') return 0;  

    size_t minlen = key_len < iter->key_len ? key_len : iter->key_len;
    int cmp = memcmp(iter->key,key,minlen);

     
    if (lt == 0 && gt == 0) return cmp == 0 && key_len == iter->key_len;

     
    if (cmp == 0) {
         
        if (eq && key_len == iter->key_len) return 1;
        else if (lt) return iter->key_len < key_len;
        else if (gt) return iter->key_len > key_len;
    } if (cmp > 0) {
        return gt ? 1 : 0;
    } else   {
        return lt ? 1 : 0;
    }
}

 
void raxStop(raxIterator *it) {
    if (it->key != it->key_static_string) zfree(it->key);
    raxStackFree(&it->stack);
}




 
int raxEOF(raxIterator *it) {
    return it->flags & (1<<1);
}

 
uint64_t raxSize(rax *rax) {
    return rax->numele;
}

 
























 

 
void raxRecursiveShow(int level, int lpad, raxNode *n) {
    char s = n->iscompr ? '"' : '[';
    char e = n->iscompr ? '"' : ']';

    int numchars = printf("%c%.*s%c", s, n->size, n->data, e);
    if (n->iskey) {
        numchars += printf("=%p",raxGetData(n));
    }

    int numchildren = n->iscompr ? 1 : n->size;
    
 
    if (level) {
        lpad += (numchildren > 1) ? 7 : 4;
        if (numchildren == 1) lpad += numchars;
    }
    raxNode **cp = ((raxNode* *) ( (n)->data + (n)->size + ((sizeof(void*)-(((n)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))));
    for (int i = 0; i < numchildren; i++) {
        char *branch = " `-(%c) ";
        if (numchildren > 1) {
            printf("\n");
            for (int j = 0; j < lpad; j++) putchar(' ');
            printf(branch,n->data[i]);
        } else {
            printf(" -> ");
        }
        raxNode *child;
        memcpy(&child,cp,sizeof(child));
        raxRecursiveShow(level+1,lpad,child);
        cp++;
    }
}

 
void raxShow(rax *rax) {
    raxRecursiveShow(0,0,rax->head);
    putchar('\n');
}

 
void raxDebugShowNode(const char *msg, raxNode *n) {
    if (raxDebugMsg == 0) return;
    printf("%s: %p [%.*s] key:%d size:%d children:",
        msg, (void*)n, (int)n->size, (char*)n->data, n->iskey, n->size);
    int numcld = n->iscompr ? 1 : n->size;
    raxNode **cldptr = ((raxNode* *) ( ((char*)(n)) + ( sizeof(raxNode)+(n)->size + ((sizeof(void*)-(((n)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))+ ((n)->iscompr ? sizeof(raxNode*) : sizeof(raxNode*)*(n)->size)+ (((n)->iskey && !(n)->isnull)*sizeof(void*)) ) - sizeof(raxNode*) - (((n)->iskey && !(n)->isnull) ? sizeof(void*) : 0) )) - (numcld-1);
    while(numcld--) {
        raxNode *child;
        memcpy(&child,cldptr,sizeof(child));
        cldptr++;
        printf("%p ", (void*)child);
    }
    printf("\n");
    fflush(stdout);
}

















 
unsigned long raxTouch(raxNode *n) {
    ;
    unsigned long sum = 0;
    if (n->iskey) {
        sum += (unsigned long)raxGetData(n);
    }

    int numchildren = n->iscompr ? 1 : n->size;
    raxNode **cp = ((raxNode* *) ( (n)->data + (n)->size + ((sizeof(void*)-(((n)->size + 4) % sizeof(void*))) & (sizeof(void*)-1))));
    int count = 0;
    for (int i = 0; i < numchildren; i++) {
        if (numchildren > 1) {
            sum += (long)n->data[i];
        }
        raxNode *child;
        memcpy(&child,cp,sizeof(child));
        if (child == (void*)0x65d1760) count++;
        if (count > 1) exit(1);
        sum += raxTouch(child);
        cp++;
    }
    return sum;
}
