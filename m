Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C802C4A35
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743158225; cv=none; b=qICV216wnDoLuxxoh7iuGrFin2Wtz488Uitogrv+ZclWiHJbzjKjm7Q7OzSqpCemAFgXdd5y41wo2LLXNYvaSTqc7QrZe36BMbfDcaszt8s4bm+t24gWrprq6wvJFDdLlmOBBTbU6fq8QIhlsG0yv2EgkHei7YBNVrWT36OLYT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743158225; c=relaxed/simple;
	bh=z3ksBUtKGMhnSAUFixflk3lu7mtpyOLXTJP5h+pPtoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=deQFHZiw22FgDomwZF6lntQ7Sg9M+PN4kCMyzQO+80SdzNSRtSSh9vBLSG7PJyWrqkdMqOW57mUdR3pdPoYXUXLztEfnne16H1165GZWs4Mwe81O1gFrgJ1hfKna/3hm+WWfqGYl4ceowS3gIoMEL+C9DoK8poQHdWPpPklOZ2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dgzem1jN; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dgzem1jN"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5fc6cd89f85so1064959eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 03:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743158223; x=1743763023; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D71hAvxN4dfg0uyyLwXMt1dR0b7weYtqf2f47TrEbos=;
        b=dgzem1jNgRh9v5bnyuTCZ9tSdnwwgIRC+C965AEX/X4qXmRDJYB5PMCTNPzIPOEn+w
         OSEfa2WNq0akaY4SVEawwPgM0Og4sAgzjhQ4coYALevzxjP7CNUO8RvPbAOc6Vnb/NDa
         XpkLZKMstQtX95Ktfgd+LxuPqZhnNT7CBaDI38ugdESlEU0tYY/xv+WL31n9w1JfR8TH
         PsmNtl3/QCF/uPsJPXOUkfCGBXguTSMaumQY7PZYMtXXP6dbnDc+bDB+SzVV92FYn1Aa
         R4fdEv7lYd1P78X6q1wrZ/3d7Dsrj8lrsPnEHC4LClIWWw0hkzeFXlfQj7YujFRqGvE3
         ecSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743158223; x=1743763023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D71hAvxN4dfg0uyyLwXMt1dR0b7weYtqf2f47TrEbos=;
        b=jYELM5nuhbJnA+/sL/m2mUXV5nwTpm29TTnhwQzVHQJhB6rHVpcrkERymAVaXnR/WT
         fYb1gpZh60Kt8E4wkxM1Jhoj2shtxGKbE+tiA0Ij6H66TPrj08gYA6NClH26x10joNMd
         tKA193vhoOPaMlCsnnEHDrQT5l1wIsM3BOKT8tSqUs4Z+Z8QHI7sabOCq5aeRIQeiw4K
         N1s040kxIhZZhjtYwgbQipF+v0MAOXq64zqQwd9r8jRN3vSOxN/f26NKkapu4hMyy3aK
         4N+RcB3aTz0dTf5aaneTP/P+vc+Kd4ivIqFQXcKxfTvsq+F0KZwO2Jt47/Sim8/17JsD
         PMpA==
X-Forwarded-Encrypted: i=1; AJvYcCVyyQApvE6XOMVA9g4uNPupSvYyxRYJM3JjC+/033HU2ChiZDVZXyZg+S5Y1ltb5yu3O1o4x9sYEtTNoHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvHJX5+qkPgErQEWxkS+HiGdcAGTg12zKogFziXfqfZk2abhbl
	03Xr0/1JsFce7CSq/rtSa5G0qGNoLqvrHuCE7dgLivPiS3HKk7j95vzuiWkTCCPVrTD4cJWPjpr
	8KoVusUXMEw4WGpitWWMsKr8hO/1qnNEDE73K
X-Gm-Gg: ASbGncs+t+sAq4QmvH+Z2ml6iN+X0MqhgKO0icKwjYQm5i/p8QjYUGHpqTBhxmOAh2s
	xw5zxdpeNfuhFIYqjlmajPqhdYbaVfRhLE+hEHJv3f069pR40cNl0zLMWPFRQsk2CFebsi2oQSv
	qrnmPrv9Y0IHQbXi/+rS0E22qtI7RRrSCeEch3niRPSRf9oYeYYihuRBwzA44jnMZU/YE=
X-Google-Smtp-Source: AGHT+IGbQFY+OTvXiffGq25jj6WoNUuJwbo2McO34CraqtsUmhmrMS62JZIYcYdOaljJ8NDLv4M/yQAwWoC564Meu44=
X-Received: by 2002:a05:6820:740d:b0:602:ad5:b0ac with SMTP id
 006d021491bc7-60278522d38mr3460889eaf.1.1743158222387; Fri, 28 Mar 2025
 03:37:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327161617.117748-1-bqe@google.com> <20250327161617.117748-4-bqe@google.com>
In-Reply-To: <20250327161617.117748-4-bqe@google.com>
From: Burak Emir <bqe@google.com>
Date: Fri, 28 Mar 2025 11:36:51 +0100
X-Gm-Features: AQ5f1Jpcfy2_0dKhF4eYEUoEZqUiDNncf6n38IWDuHZt6UoTlViv916E6kawBGA
Message-ID: <CACQBu=VBYx+LoZnSjAsU7DJsnQJ0R1WEc3aJfgNxoU1zG4=emg@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] rust: add bitmap API.
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 5:16=E2=80=AFPM Burak Emir <bqe@google.com> wrote:
>
> Provides an abstraction for C bitmap API and bitops operations.
> Includes enough to implement a Binder data structure that was
> introduced in commit 15d9da3f818c ("binder: use bitmap for faster
> descriptor lookup"), namely drivers/android/dbitmap.h.
>
> The implementation is optimized to represent the bitmap inline
> if it would take the space of a pointer. This saves allocations.
> We offer a safe API through bounds checks which panic if violated.
>
> Atomic variants set_bit_atomic and clear_bit_atomic are provided.
> For these, absence of data races is ensured by the Rust type system:
> all non-atomic operations require a &mut reference which amounts
> to exclusive access.
>
> We use the `usize` type for sizes and indices into the bitmap,
> because Rust generally always uses that type for indices and lengths
> and it will be more convenient if the API accepts that type. This means
> that we need to perform some casts to/from u32 and usize, since the C
> headers use unsigned int instead of size_t/unsigned long for these
> numbers in some places.
>
> Adds new MAINTAINERS section BITMAP API [RUST].
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Suggested-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Burak Emir <bqe@google.com>
> ---
>  MAINTAINERS           |   7 +
>  rust/kernel/bitmap.rs | 306 ++++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs    |   1 +
>  3 files changed, 314 insertions(+)
>  create mode 100644 rust/kernel/bitmap.rs
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 11bc11945838..efb0d367dea2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4034,6 +4034,13 @@ S:       Maintained
>  F:     rust/helpers/bitmap.c
>  F:     rust/helpers/cpumask.c
>
> +BITMAP API [RUST]
> +M:     Alice Ryhl <aliceryhl@google.com>
> +M:     Burak Emir <bqe@google.com>
> +R:     Yury Norov <yury.norov@gmail.com>
> +S:     Maintained
> +F:     rust/kernel/bitmap.rs
> +
>  BITOPS API
>  M:     Yury Norov <yury.norov@gmail.com>
>  R:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
> diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
> new file mode 100644
> index 000000000000..2622af3af1ec
> --- /dev/null
> +++ b/rust/kernel/bitmap.rs
> @@ -0,0 +1,306 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2025 Google LLC.
> +
> +//! Rust API for bitmap.
> +//!
> +//! C headers: [`include/linux/bitmap.h`](srctree/include/linux/bitmap.h=
).
> +
> +use crate::alloc::{AllocError, Flags};
> +use crate::bindings;
> +use core::ptr::NonNull;
> +
> +/// Holds either a pointer to array of `unsigned long` or a small bitmap=
.
> +#[repr(C)]
> +union BitmapRepr {
> +    bitmap: usize,
> +    ptr: NonNull<usize>,
> +}
> +
> +/// Represents a bitmap.
> +///
> +/// Wraps underlying C bitmap API.
> +///
> +/// # Examples
> +///
> +/// Basic usage
> +///
> +/// ```
> +/// use kernel::alloc::flags::GFP_KERNEL;
> +/// use kernel::bitmap::Bitmap;
> +///
> +/// let mut b =3D Bitmap::new(16, GFP_KERNEL)?;
> +///
> +/// assert_eq!(16, b.len());
> +/// for i in 0..16 {
> +///     if i % 4 =3D=3D 0 {
> +///       b.set_bit(i);
> +///     }
> +/// }
> +/// assert_eq!(Some(1), b.next_zero_bit(0));
> +/// assert_eq!(Some(5), b.next_zero_bit(5));
> +/// assert_eq!(Some(12), b.last_bit());
> +/// # Ok::<(), Error>(())
> +/// ```
> +///
> +/// Requesting too large values results in [`AllocError`]
> +///
> +/// ```
> +/// use kernel::alloc::flags::GFP_KERNEL;
> +/// use kernel::bitmap::Bitmap;
> +///
> +/// assert!(Bitmap::new(1 << 31, GFP_KERNEL).is_err());
> +/// ```
> +///
> +/// # Invariants
> +///
> +/// * `nbits` is `<=3D i32::MAX` and never changes.
> +/// * if `nbits <=3D bindings::BITS_PER_LONG`, then `repr` is a bitmap.
> +/// * otherwise, `repr` holds a non-null pointer that was obtained from =
a
> +///   successful call to `bitmap_zalloc` and holds the address of an ini=
tialized
> +///   array of `unsigned long` that is large enough to hold `nbits` bits=
.
> +pub struct Bitmap {
> +    /// Representation of bitmap.
> +    repr: BitmapRepr,
> +    /// Length of this bitmap. Must be `<=3D i32::MAX`.
> +    nbits: usize,
> +}
> +
> +impl Drop for Bitmap {
> +    fn drop(&mut self) {
> +        if self.nbits <=3D bindings::BITS_PER_LONG as _ {
> +            return;
> +        }
> +        // SAFETY: `self.ptr` was returned by the C `bitmap_zalloc`.
> +        //
> +        // INVARIANT: there is no other use of the `self.ptr` after this
> +        // call and the value is being dropped so the broken invariant i=
s
> +        // not observable on function exit.
> +        unsafe { bindings::bitmap_free(self.as_mut_ptr()) };
> +    }
> +}
> +
> +impl Bitmap {
> +    /// Constructs a new [`Bitmap`].
> +    ///
> +    /// Fails with [`AllocError`] when the [`Bitmap`] could not be alloc=
ated. This
> +    /// includes the case when `nbits` is greater than `i32::MAX`.
> +    #[inline]
> +    pub fn new(nbits: usize, flags: Flags) -> Result<Self, AllocError> {
> +        if nbits <=3D bindings::BITS_PER_LONG as _ {
> +            return Ok(Bitmap {
> +                repr: BitmapRepr { bitmap: 0 },
> +                nbits,
> +            });
> +        }
> +        if nbits > i32::MAX.try_into().unwrap() {
> +            return Err(AllocError);
> +        }
> +        let nbits_u32 =3D u32::try_from(nbits).unwrap();
> +        // SAFETY: `bindings::BITS_PER_LONG < nbits` and `nbits <=3D i32=
::MAX`.
> +        let ptr =3D unsafe { bindings::bitmap_zalloc(nbits_u32, flags.as=
_raw()) };
> +        let ptr =3D NonNull::new(ptr).ok_or(AllocError)?;
> +        // INVARIANT: `ptr` returned by C `bitmap_zalloc` and `nbits` ch=
ecked.
> +        return Ok(Bitmap {
> +            repr: BitmapRepr { ptr },
> +            nbits,
> +        });
> +    }
> +
> +    /// Returns length of this [`Bitmap`].
> +    #[inline]
> +    pub fn len(&self) -> usize {
> +        self.nbits
> +    }
> +
> +    /// Returns a mutable raw pointer to the backing [`Bitmap`].
> +    #[inline]
> +    fn as_mut_ptr(&mut self) -> *mut usize {
> +        if self.nbits <=3D bindings::BITS_PER_LONG as _ {
> +            // SAFETY: Bitmap is represented inline.
> +            unsafe { core::ptr::addr_of_mut!(self.repr.bitmap) }
> +        } else {
> +            // SAFETY: Bitmap is represented as array of `unsigned long`=
.
> +            unsafe { self.repr.ptr.as_mut() }
> +        }
> +    }
> +
> +    /// Returns a raw pointer to the backing [`Bitmap`].
> +    #[inline]
> +    fn as_ptr(&self) -> *const usize {
> +        if self.nbits <=3D bindings::BITS_PER_LONG as _ {
> +            // SAFETY: Bitmap is represented inline.
> +            unsafe { core::ptr::addr_of!(self.repr.bitmap) }
> +        } else {
> +            // SAFETY: Bitmap is represented as array of `unsigned long`=
.
> +            unsafe { self.repr.ptr.as_ptr() }
> +        }
> +    }
> +
> +    /// Set bit with index `index`.

I missed this, will change to /// Set `index` bit,

> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if `index` is greater than or equal to `self.nbits`.
> +    #[inline]
> +    pub fn set_bit(&mut self, index: usize) {
> +        assert!(
> +            index < self.nbits,
> +            "Bit `index` must be < {}, was {}",
> +            self.nbits,
> +            index
> +        );
> +        // SAFETY: Bit `index` is within bounds.
> +        unsafe { bindings::__set_bit(index as u32, self.as_mut_ptr()) };
> +    }
> +
> +    /// Set bit with index `index`, atomically.

dto, will change to /// Set `index` bit, atomically.

> +    ///
> +    /// WARNING: this is a relaxed atomic operation (no implied memory b=
arriers).

Is this the kind of warning you had in mind?

> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if `index` is greater than or equal to `self.nbits`.
> +    #[inline]
> +    pub fn set_bit_atomic(&self, index: usize) {
> +        assert!(
> +            index < self.nbits,
> +            "Bit `index` must be < {}, was {}",
> +            self.nbits,
> +            index
> +        );
> +        // SAFETY: `index` is within bounds and there cannot be any data=
 races
> +        // because all non-atomic operations require exclusive access th=
rough
> +        // a &mut reference.

I have considered marking set_bit_atomic as unsafe, but then come
around to think that it is actually safe.

I'd appreciate a review of the reasoning by my fellow Rust-for-Linux folks.

What must be ensured is absence of data race, e.g. that an atomic op
does not happen concurrently with a conflicting non-synchronized,
non-atomic op.
Do I need to worry about non-atomic accesses in the same thread
(temporarily reborrowing a &mut to & in the same thread is a
possibility)?

> +        unsafe { bindings::set_bit(index as u32, self.as_ptr() as *mut u=
size) };
> +    }
> +
> +    /// Clear `index` bit.
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if `index` is greater than or equal to `self.nbits`.
> +    #[inline]
> +    pub fn clear_bit(&mut self, index: usize) {
> +        assert!(
> +            index < self.nbits,
> +            "Bit `index` must be < {}, was {}",
> +            self.nbits,
> +            index
> +        );
> +        // SAFETY: `index` is within bounds.
> +        unsafe { bindings::__clear_bit(index as u32, self.as_mut_ptr()) =
};
> +    }
> +
> +    /// Clear `index` bit, atomically.
> +    ///
> +    /// WARNING: this is a relaxed atomic operation (no implied memory b=
arriers).
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if `index` is greater than or equal to `self.nbits`.
> +    #[inline]
> +    pub fn clear_bit_atomic(&self, index: usize) {
> +        assert!(
> +            index < self.nbits,
> +            "Bit `index` must be < {}, was {}",
> +            self.nbits,
> +            index
> +        );
> +        // SAFETY: `index` is within bounds and there cannot be any data=
 races
> +        // because all non-atomic operations require exclusive access th=
rough
> +        // a &mut reference.
> +        unsafe { bindings::clear_bit(index as u32, self.as_ptr() as *mut=
 usize) };
> +    }
> +
> +    /// Copy `src` into this [`Bitmap`] and set any remaining bits to ze=
ro.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
> +    /// use kernel::bitmap::Bitmap;
> +    ///
> +    /// let mut long_bitmap =3D Bitmap::new(256, GFP_KERNEL)?;
> +    //
> +    /// assert_eq!(None, long_bitmap.last_bit());
> +    //
> +    /// let mut short_bitmap =3D Bitmap::new(16, GFP_KERNEL)?;
> +    //
> +    /// short_bitmap.set_bit(7);
> +    /// long_bitmap.copy_and_extend(&short_bitmap);
> +    /// assert_eq!(Some(7), long_bitmap.last_bit());
> +    ///
> +    /// long_bitmap.clear_bit(7);
> +    /// assert_eq!(None, long_bitmap.last_bit());
> +    ///
> +    /// # Ok::<(), AllocError>(())
> +    /// ```
> +    #[inline]
> +    pub fn copy_and_extend(&mut self, src: &Bitmap) {
> +        let len =3D core::cmp::min(src.nbits, self.nbits);
> +        // SAFETY: access to `self` and `src` is within bounds.
> +        unsafe {
> +            bindings::bitmap_copy_and_extend(
> +                self.as_mut_ptr(),
> +                src.as_ptr(),
> +                len as u32,
> +                self.nbits as u32,
> +            )
> +        };
> +    }
> +
> +    /// Finds last set bit.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
> +    /// use kernel::bitmap::Bitmap;
> +    ///
> +    /// let bitmap =3D Bitmap::new(64, GFP_KERNEL)?;
> +    ///
> +    /// match bitmap.last_bit() {
> +    ///     Some(idx) =3D> {
> +    ///         pr_info!("The last bit has index {idx}.\n");
> +    ///     }
> +    ///     None =3D> {
> +    ///         pr_info!("All bits in this bitmap are 0.\n");
> +    ///     }
> +    /// }
> +    /// # Ok::<(), AllocError>(())
> +    /// ```
> +    #[inline]
> +    pub fn last_bit(&self) -> Option<usize> {
> +        // SAFETY: access is within bounds.
> +        let index =3D unsafe { bindings::_find_last_bit(self.as_ptr(), s=
elf.nbits) };
> +        if index =3D=3D self.nbits {
> +            None
> +        } else {
> +            Some(index)
> +        }
> +    }
> +
> +    /// Finds next zero bit, starting from `start`.
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if `index` is greater than or equal to `self.nbits`.
> +    #[inline]
> +    pub fn next_zero_bit(&self, start: usize) -> Option<usize> {
> +        assert!(
> +            start < self.nbits,
> +            "`start` must be < {}, was {}",
> +            self.nbits,
> +            start
> +        );
> +
> +        // SAFETY: access is within bounds.
> +        let index =3D unsafe { bindings::_find_next_zero_bit(self.as_ptr=
(), self.nbits, start) };
> +        if index =3D=3D self.nbits {
> +            None
> +        } else {
> +            Some(index)
> +        }
> +    }
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 7697c60b2d1a..c82b23236056 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -36,6 +36,7 @@
>  pub use ffi;
>
>  pub mod alloc;
> +pub mod bitmap;
>  #[cfg(CONFIG_BLOCK)]
>  pub mod block;
>  #[doc(hidden)]
> --
> 2.49.0.395.g12beb8f557-goog
>
