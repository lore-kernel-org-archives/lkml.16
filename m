Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49151C6FEC;
	Tue, 27 May 2025 19:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748372613; cv=none; b=BUQtnN3FA9L0Z1B0snMIG5l9uPWmn64W7z5TwIEXgh/feHnTz0R4VZMqyc0Aq3hdBLGgPFw9TgdvTXBZ6l90kAD30ywuDMDhKGLzPa2EMsiYcs/8GOxuA7UBuLMHPIIg17ZgNWAZzGue/frIDyDsQnw7QhGeckXttkyI882ySPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748372613; c=relaxed/simple;
	bh=WVf+TL56oV2aKB53YKCdOUzvcUS7l1dZoeXjL0+hSEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nk51AX8AAoHTphBkLpKcQPJwghGpXofVjJxCa0Ryka8PlgwxIY0yamV/qYmxp7f+sqMNzXhGDGWEZHWbH3pq1LJv1D9N9RjBcCyZKUe6FT5O8oBUbmqKy9sbyhMKgtyuYnJa9LbA8kYersSSEJqnpU6HdDz9lBHlCLGypG52Ty8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WpBHE4Dw; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpBHE4Dw"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad55d6aeb07so713687366b.0;
        Tue, 27 May 2025 12:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748372610; x=1748977410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uqL3BuTa32r+mcWNmQcAh/RC8cO57+wwwYvYXDnjjBg=;
        b=WpBHE4Dw2IlTS04zWQfRMC9u2oECEEYCDF+v4ci7lqWBYYojPb30iAsBuh4Q0DeTcy
         qJvf085h8JOqeqURoHKoOmh/BcRQsf9kpsdXBL2AwrHnxS9h2w/SPz4LWGvQwHyxeKJO
         /9BYIEgbBxYQ1NPEi9LpNXKGlOulIFZnQ1W7VAwnUrBJ1Wjy/QqEPmvYLKo7h3XfaRgl
         FTLUSk9cjoVcBAHVaNQFan+3lutgFrJhnkhhofQX/cX+5aPiqGP+D6rP8iV7an3KPbwz
         s/jDwEqjuKdQJSOJbP0L0tqVhOp5tfVINxZ19R/ihkC7cXtpLikE4ipJmmk3Wzt82ZGi
         XzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748372610; x=1748977410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uqL3BuTa32r+mcWNmQcAh/RC8cO57+wwwYvYXDnjjBg=;
        b=IuhoIiRaytMdFtnGGtt7L2ajXdW7Gv6VdGJPW9rHNtKftXwroKphtBPEW5/unk+4ux
         N93e7P2ysC5oLSyNRWyPvv58stxigLY6vzH7EcwrtD2NWtrjigt0IyXrSVgreksaTDds
         1Mue2g8fiapWwWa+pbAxPHt+5zva8Hi7t+4lm9H6lFYhsLBvxEFOKgHeKlflPGIWXN3C
         IgAj6aabJyURbmOJukCBnsFA2JuDZolMz5oO1EsBD2uYkhqoRGxTFiPBbJRV/Pr4rulc
         KnKhScamYHsEq6IEcp7D4hVAdJAho33N/8KvFHtoGMGJKSfqdXYpjSP6gZG++Jc42cer
         /CrA==
X-Forwarded-Encrypted: i=1; AJvYcCVlLbUJRbamNZZ3SjGvGvroKb1LQ+YK1c4BHS3hkN25CmSr/Nuj0898RGZDfmG7wwu1AXUMT122uhT/wljlo3c=@vger.kernel.org, AJvYcCVwhcIDd2vaEdmqshQzgBLV1aI5pFZvq/hlBL9JdMbGokgkFEkIUVe4r8LhUFNgGSnHqECa4C6ESNIbSbw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWjT1sDXIatvciK50mFMe7bz8katK2ImdK7aFPSlj659OqL0TC
	uPfi9e2Tsc58+wdb4FlnWaJcwAOjN5VRDx17dDj2aX5IADgSE8vrx+ZC
X-Gm-Gg: ASbGncuUIPnFqKhVU4G3+pd61l42ZHitOVGG+r5NEm1VXEsXaTh/CE1Xd52YaFKQ9EK
	bmGgbOO6GxeuQvKr++EA7Ovbha4RVhQs+H7rnwoZjYwb2ZUY5vZVKOKN9JdO9J/3zdxAA+fYyNB
	U/GfLbJ54qPWEPojlv1yp9UlLvlGLuNqgNdZKovkbOG4/kEIWuyuooypvVLIUUpqwRJDMwuCT9E
	jAX1n6I6RhSZdl6F+h1g+SshHUOpqPiwHttDW8DbQMuCqMa4+LK/oWTYu6/BUqW9H3gBr4MyxmS
	RZjmK8RYpF22slyYsNIdJQHxp7mG715XLqJVFd7FExvCFnUR2d+3To+QXXQqTpt6Rd9+OjNSYQ=
	=
X-Google-Smtp-Source: AGHT+IGWBAotwee+v0vPv3p8CdpbZ3G11p73pDNP8MzFW8ybviCcTxo/0K+5vN2QtP7czqOjqiaUEA==
X-Received: by 2002:a17:907:7e93:b0:ad4:d135:cf68 with SMTP id a640c23a62f3a-ad85b1d7ce3mr1276961466b.59.1748372609651;
        Tue, 27 May 2025 12:03:29 -0700 (PDT)
Received: from [10.20.99.184] ([193.170.124.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d490a30sm1862680966b.127.2025.05.27.12.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 12:03:29 -0700 (PDT)
Message-ID: <83969228-bc7c-4eda-8531-53681e7f6600@gmail.com>
Date: Tue, 27 May 2025 21:03:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] uaccess: rust: use newtype for user pointers
To: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250527-userptr-newtype-v2-1-a789d266f6b0@google.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250527-userptr-newtype-v2-1-a789d266f6b0@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Alice,

On 27.05.25 3:53 PM, Alice Ryhl wrote:
> In C code we use sparse with the __user annotation to detect cases where
> a user pointer is mixed up with other things. To replicate that, we
> introduce a new struct UserPtr that serves the same purpose using the
> newtype pattern.
> 
> The UserPtr type is not marked with #[derive(Debug)], which means that
> it's not possible to print values of this type. This avoids ASLR
> leakage.
> 
> The type is added to the prelude as it is a fairly fundamental type
> similar to c_int. The wrapping_add() method is renamed to
> wrapping_byte_add() for consistency with the method name found on raw
> pointers.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> This is based on top of the strncpy_from_user for Rust patch.
> ---
> Changes in v2:
> - Change usize to raw pointer.
> - Make field private.
> - Rename wrapping_add to wrapping_byte_add.
> - Add to prelude.
> - Rebase on v4 of strncpy_from_user
> - Link to v1: https://lore.kernel.org/r/20250506-userptr-newtype-v1-1-a0f6f8ce9fc5@google.com
> ---
>  rust/kernel/prelude.rs           |  2 ++
>  rust/kernel/uaccess.rs           | 68 +++++++++++++++++++++++++++++++++-------
>  samples/rust/rust_misc_device.rs |  2 ++
>  3 files changed, 60 insertions(+), 12 deletions(-)
> 
> diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
> index baa774a351ceeb995a2a647f78a27b408d9f3834..081af5bc07b0bcefb1da16e5a81fc611b3178aea 100644
> --- a/rust/kernel/prelude.rs
> +++ b/rust/kernel/prelude.rs
> @@ -41,3 +41,5 @@
>  pub use super::init::InPlaceInit;
>  
>  pub use super::current;
> +
> +pub use super::uaccess::UserPtr;
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index e6534b52a1920254d61f8349426d4cdb38286089..02e0561eb1c6f4d813a4ab13a124bfac2d2a5c75 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -14,8 +14,48 @@
>  };
>  use core::mem::{size_of, MaybeUninit};
>  
> -/// The type used for userspace addresses.
> -pub type UserPtr = usize;
> +/// A pointer into userspace.
> +///
> +/// This is the Rust equivalent to C pointers tagged with `__user`.
> +#[repr(transparent)]
> +#[derive(Copy, Clone)]
> +pub struct UserPtr(*mut c_void);
> +
> +impl UserPtr {
> +    /// Create a `UserPtr` from an integer representing the userspace address.
> +    pub fn from_addr(addr: usize) -> Self {
> +        Self(addr as *mut c_void)
> +    }
> +
> +    /// Create a `UserPtr` from a pointer representing the userspace address.
> +    pub fn from_ptr(addr: *mut c_void) -> Self {
> +        Self(addr)
> +    }
> +
> +    /// Cast this userspace pointer to a raw const void pointer.
> +    ///
> +    /// It is up to the caller to use the returned pointer correctly.
> +    #[inline]
> +    pub fn as_const_ptr(self) -> *const c_void {
> +        self.0
> +    }
> +
> +    /// Cast this userspace pointer to a raw mutable void pointer.
> +    ///
> +    /// It is up to the caller to use the returned pointer correctly.
> +    #[inline]
> +    pub fn as_mut_ptr(self) -> *mut c_void {
> +        self.0
> +    }
> +
> +    /// Increment this user pointer by `add` bytes.
> +    ///
> +    /// This addition is wrapping, so wrapping around the address space does not result in a panic
> +    /// even if `CONFIG_RUST_OVERFLOW_CHECKS` is enabled.
> +    pub fn wrapping_byte_add(self, add: usize) -> UserPtr {
> +        UserPtr(self.0.wrapping_add(add))

Why use `ptr::wrapping_add` instead of `ptr::wrapping_byte_add`?

Should not really matter in this case, because `c_void` is 
`repr(u8)`, but I find it a bit weird to use `wrapping_add` here.

With that fixed:

Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>

> +    }
> +}
>  
>  /// A pointer to an area in userspace memory, which can be either read-only or read-write.
>  ///
> @@ -179,7 +219,7 @@ impl UserSliceReader {
>      pub fn skip(&mut self, num_skip: usize) -> Result {
>          // Update `self.length` first since that's the fallible part of this operation.
>          self.length = self.length.checked_sub(num_skip).ok_or(EFAULT)?;
> -        self.ptr = self.ptr.wrapping_add(num_skip);
> +        self.ptr = self.ptr.wrapping_byte_add(num_skip);
>          Ok(())
>      }
>  
> @@ -226,11 +266,11 @@ pub fn read_raw(&mut self, out: &mut [MaybeUninit<u8>]) -> Result {
>          }
>          // SAFETY: `out_ptr` points into a mutable slice of length `len`, so we may write
>          // that many bytes to it.
> -        let res = unsafe { bindings::copy_from_user(out_ptr, self.ptr as *const c_void, len) };
> +        let res = unsafe { bindings::copy_from_user(out_ptr, self.ptr.as_const_ptr(), len) };
>          if res != 0 {
>              return Err(EFAULT);
>          }
> -        self.ptr = self.ptr.wrapping_add(len);
> +        self.ptr = self.ptr.wrapping_byte_add(len);
>          self.length -= len;
>          Ok(())
>      }
> @@ -264,14 +304,14 @@ pub fn read<T: FromBytes>(&mut self) -> Result<T> {
>          let res = unsafe {
>              bindings::_copy_from_user(
>                  out.as_mut_ptr().cast::<c_void>(),
> -                self.ptr as *const c_void,
> +                self.ptr.as_const_ptr(),
>                  len,
>              )
>          };
>          if res != 0 {
>              return Err(EFAULT);
>          }
> -        self.ptr = self.ptr.wrapping_add(len);
> +        self.ptr = self.ptr.wrapping_byte_add(len);
>          self.length -= len;
>          // SAFETY: The read above has initialized all bytes in `out`, and since `T` implements
>          // `FromBytes`, any bit-pattern is a valid value for this type.
> @@ -384,11 +424,11 @@ pub fn write_slice(&mut self, data: &[u8]) -> Result {
>          }
>          // SAFETY: `data_ptr` points into an immutable slice of length `len`, so we may read
>          // that many bytes from it.
> -        let res = unsafe { bindings::copy_to_user(self.ptr as *mut c_void, data_ptr, len) };
> +        let res = unsafe { bindings::copy_to_user(self.ptr.as_mut_ptr(), data_ptr, len) };
>          if res != 0 {
>              return Err(EFAULT);
>          }
> -        self.ptr = self.ptr.wrapping_add(len);
> +        self.ptr = self.ptr.wrapping_byte_add(len);
>          self.length -= len;
>          Ok(())
>      }
> @@ -411,7 +451,7 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
>          // is a compile-time constant.
>          let res = unsafe {
>              bindings::_copy_to_user(
> -                self.ptr as *mut c_void,
> +                self.ptr.as_mut_ptr(),
>                  (value as *const T).cast::<c_void>(),
>                  len,
>              )
> @@ -419,7 +459,7 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
>          if res != 0 {
>              return Err(EFAULT);
>          }
> -        self.ptr = self.ptr.wrapping_add(len);
> +        self.ptr = self.ptr.wrapping_byte_add(len);
>          self.length -= len;
>          Ok(())
>      }
> @@ -444,7 +484,11 @@ fn raw_strncpy_from_user(dst: &mut [MaybeUninit<u8>], src: UserPtr) -> Result<us
>  
>      // SAFETY: `dst` is valid for writing `dst.len()` bytes.
>      let res = unsafe {
> -        bindings::strncpy_from_user(dst.as_mut_ptr().cast::<c_char>(), src as *const c_char, len)
> +        bindings::strncpy_from_user(
> +            dst.as_mut_ptr().cast::<c_char>(),
> +            src.as_const_ptr().cast::<c_char>(),
> +            len,
> +        )
>      };
>  
>      if res < 0 {
> diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
> index c881fd6dbd08cf4308fe1bd37d11d28374c1f034..e7ab77448f754906615b6f89d72b51fa268f6c41 100644
> --- a/samples/rust/rust_misc_device.rs
> +++ b/samples/rust/rust_misc_device.rs
> @@ -176,6 +176,8 @@ fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Se
>      fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd: u32, arg: usize) -> Result<isize> {
>          dev_info!(me.dev, "IOCTLing Rust Misc Device Sample\n");
>  
> +        // Treat the ioctl argument as a user pointer.
> +        let arg = UserPtr::from_addr(arg);
>          let size = _IOC_SIZE(cmd);
>  
>          match cmd {
> 
> ---
> base-commit: f34da179a4517854b2ffbe4bce8c3405bd9be04e
> change-id: 20250506-userptr-newtype-2f060985c33b
> prerequisite-change-id: 20250424-strncpy-from-user-1f2d06b0cdde:v4
> prerequisite-patch-id: d35c479ddb84bacc541dbb226c7911e5a22cad7e
> prerequisite-patch-id: e0c345945dabfa18e9ca11f7fe11f8178d071285
> 
> Best regards,

