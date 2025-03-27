Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52891C6FEA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743092201; cv=none; b=c3sLUXSDpH4k4/vKFhCmfDMsSw39+qJrpj0vcMMS9jhHjpvLoe6ZLV/pw+/vXDt0NUoKnPPwgsCGgy2AQnR9jehzubXl7PmSSf53iRMpTXnSid5i6KNGwJRnvXtin0w6LGsnYpCfhgDqjl9IiDTA7xo6/xIHmVQuIWDp1LjHEpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743092201; c=relaxed/simple;
	bh=zmnAqC5qRCSe5r4ZjWrVErU8lAUrelb3r5oQIujjv1M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=M2fXgqGgBgx55GhUtyns82Qfr2U1T8jIsXuajFw8fM3VWF60vOtpSjxuRwCv1eEXeUzujVUdEcC6naOxKPPtz8weOnCgeNg3u6AEFGJEujz4Gnts0e72lXIZzkCSyc/M58mi/PWYj6rcyUh5BHyfI2lZtdasYjYrUHtK8+z2DqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yqkkAAG9; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yqkkAAG9"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d6c65dc52so8626565e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743092197; x=1743696997; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tWgK+vM2qYd4vsDYa3IMYYN7Le3zEN7GhGCXVcAjvtk=;
        b=yqkkAAG9hwoRaR2dkD/31vxgLQPCPeLROSuddY6tVfS0FSUCiR9l7KuoFmPVKJzYAG
         RhkdpNhRKsZNMwYe7iRrL3fh3Za2uNTde8jERS6D7MPUUJBbk0UkeCPqLZxzarMk4s3R
         nrsx9i+9pTJBUE+BFZoIopfqX2mjKYu3vBA15FaXMjzH48OySyU6YqKfxm1aq197Ql3w
         +K1QXBWk+inNFINorlaxWVU7nvUkJipEBKHOhku3cmKgb/g687rJ1fHfg6XdA5p8tSYA
         DnPh1GJVPl9d52b7jmV54JToAB0uFfhETSCZvSUa9olsD0dnbVy3sTs+aOfi8p1GnuYw
         NShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743092197; x=1743696997;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tWgK+vM2qYd4vsDYa3IMYYN7Le3zEN7GhGCXVcAjvtk=;
        b=JaTc1ADoHLkBXEXrkf3g7cyktegRcgFyuqk+/6Y5bTzAYnjzrqh0fnDClkySVYJ53L
         3x+naAcDf7cUu1tiUc6rnST7eMOriR2V86Kb6gpclacizbXgCiw6vvY/eXkOb8y1UIwF
         zwzKMvblaWamHq3lysC3U/Okebd89L6WyvsnPdE4bnz1v4eqv3qFNdh+c/s9butinQ4b
         bUcrry+SLXbbN1nZWp5tmO2BwBZAtnOgzvLBlE0QOt693NwUxD2BhbO3pDngXwB6qkMc
         sLuAP4SgDorvCboJf9Lzok3BnZYTvTHJic0dm7x//46LaiApTVwe919/XoBKoF6mP7wM
         Gq/A==
X-Forwarded-Encrypted: i=1; AJvYcCU3mjfafswOp1l8jtfCkMf3YqLTQaFD8fGNJVOvPQccwfBBZPLmc2L5CI0cA9P2WwJ6+Xa5ToQIsH/TNog=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFsq85NyTnPGgv7hBynKWrIPW+XhsaYfNOVP6jlxTWDNgGoPvL
	AoImXeEuRM228HSCgSigU85mmJBgDf2zY6Y+2RPir2Qn/AdqdSF1gIKW1oQVVIIKzw==
X-Google-Smtp-Source: AGHT+IGu/X/wlR7A1iD+dyK26qyAHDIZ7lGaClaV9KSEjEu2b+BiDBqBjYVbeCEqjwtHsTMQ2HXqMeg=
X-Received: from wmbbi11.prod.google.com ([2002:a05:600c:3d8b:b0:43c:ebbe:4bce])
 (user=bqe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4fd0:b0:43c:fa24:873e
 with SMTP id 5b1f17b1804b1-43d84fb1f59mr43428965e9.13.1743092197264; Thu, 27
 Mar 2025 09:16:37 -0700 (PDT)
Date: Thu, 27 Mar 2025 16:16:13 +0000
In-Reply-To: <20250327161617.117748-1-bqe@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250327161617.117748-1-bqe@google.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250327161617.117748-4-bqe@google.com>
Subject: [PATCH v6 3/4] rust: add bitmap API.
From: Burak Emir <bqe@google.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Burak Emir <bqe@google.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Provides an abstraction for C bitmap API and bitops operations.
Includes enough to implement a Binder data structure that was
introduced in commit 15d9da3f818c ("binder: use bitmap for faster
descriptor lookup"), namely drivers/android/dbitmap.h.

The implementation is optimized to represent the bitmap inline
if it would take the space of a pointer. This saves allocations.
We offer a safe API through bounds checks which panic if violated.

Atomic variants set_bit_atomic and clear_bit_atomic are provided.
For these, absence of data races is ensured by the Rust type system:
all non-atomic operations require a &mut reference which amounts
to exclusive access.

We use the `usize` type for sizes and indices into the bitmap,
because Rust generally always uses that type for indices and lengths
and it will be more convenient if the API accepts that type. This means
that we need to perform some casts to/from u32 and usize, since the C
headers use unsigned int instead of size_t/unsigned long for these
numbers in some places.

Adds new MAINTAINERS section BITMAP API [RUST].

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Suggested-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Burak Emir <bqe@google.com>
---
 MAINTAINERS           |   7 +
 rust/kernel/bitmap.rs | 306 ++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs    |   1 +
 3 files changed, 314 insertions(+)
 create mode 100644 rust/kernel/bitmap.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 11bc11945838..efb0d367dea2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4034,6 +4034,13 @@ S:	Maintained
 F:	rust/helpers/bitmap.c
 F:	rust/helpers/cpumask.c
 
+BITMAP API [RUST]
+M:	Alice Ryhl <aliceryhl@google.com>
+M:	Burak Emir <bqe@google.com>
+R:	Yury Norov <yury.norov@gmail.com>
+S:	Maintained
+F:	rust/kernel/bitmap.rs
+
 BITOPS API
 M:	Yury Norov <yury.norov@gmail.com>
 R:	Rasmus Villemoes <linux@rasmusvillemoes.dk>
diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
new file mode 100644
index 000000000000..2622af3af1ec
--- /dev/null
+++ b/rust/kernel/bitmap.rs
@@ -0,0 +1,306 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Google LLC.
+
+//! Rust API for bitmap.
+//!
+//! C headers: [`include/linux/bitmap.h`](srctree/include/linux/bitmap.h).
+
+use crate::alloc::{AllocError, Flags};
+use crate::bindings;
+use core::ptr::NonNull;
+
+/// Holds either a pointer to array of `unsigned long` or a small bitmap.
+#[repr(C)]
+union BitmapRepr {
+    bitmap: usize,
+    ptr: NonNull<usize>,
+}
+
+/// Represents a bitmap.
+///
+/// Wraps underlying C bitmap API.
+///
+/// # Examples
+///
+/// Basic usage
+///
+/// ```
+/// use kernel::alloc::flags::GFP_KERNEL;
+/// use kernel::bitmap::Bitmap;
+///
+/// let mut b = Bitmap::new(16, GFP_KERNEL)?;
+///
+/// assert_eq!(16, b.len());
+/// for i in 0..16 {
+///     if i % 4 == 0 {
+///       b.set_bit(i);
+///     }
+/// }
+/// assert_eq!(Some(1), b.next_zero_bit(0));
+/// assert_eq!(Some(5), b.next_zero_bit(5));
+/// assert_eq!(Some(12), b.last_bit());
+/// # Ok::<(), Error>(())
+/// ```
+///
+/// Requesting too large values results in [`AllocError`]
+///
+/// ```
+/// use kernel::alloc::flags::GFP_KERNEL;
+/// use kernel::bitmap::Bitmap;
+///
+/// assert!(Bitmap::new(1 << 31, GFP_KERNEL).is_err());
+/// ```
+///
+/// # Invariants
+///
+/// * `nbits` is `<= i32::MAX` and never changes.
+/// * if `nbits <= bindings::BITS_PER_LONG`, then `repr` is a bitmap.
+/// * otherwise, `repr` holds a non-null pointer that was obtained from a
+///   successful call to `bitmap_zalloc` and holds the address of an initialized
+///   array of `unsigned long` that is large enough to hold `nbits` bits.
+pub struct Bitmap {
+    /// Representation of bitmap.
+    repr: BitmapRepr,
+    /// Length of this bitmap. Must be `<= i32::MAX`.
+    nbits: usize,
+}
+
+impl Drop for Bitmap {
+    fn drop(&mut self) {
+        if self.nbits <= bindings::BITS_PER_LONG as _ {
+            return;
+        }
+        // SAFETY: `self.ptr` was returned by the C `bitmap_zalloc`.
+        //
+        // INVARIANT: there is no other use of the `self.ptr` after this
+        // call and the value is being dropped so the broken invariant is
+        // not observable on function exit.
+        unsafe { bindings::bitmap_free(self.as_mut_ptr()) };
+    }
+}
+
+impl Bitmap {
+    /// Constructs a new [`Bitmap`].
+    ///
+    /// Fails with [`AllocError`] when the [`Bitmap`] could not be allocated. This
+    /// includes the case when `nbits` is greater than `i32::MAX`.
+    #[inline]
+    pub fn new(nbits: usize, flags: Flags) -> Result<Self, AllocError> {
+        if nbits <= bindings::BITS_PER_LONG as _ {
+            return Ok(Bitmap {
+                repr: BitmapRepr { bitmap: 0 },
+                nbits,
+            });
+        }
+        if nbits > i32::MAX.try_into().unwrap() {
+            return Err(AllocError);
+        }
+        let nbits_u32 = u32::try_from(nbits).unwrap();
+        // SAFETY: `bindings::BITS_PER_LONG < nbits` and `nbits <= i32::MAX`.
+        let ptr = unsafe { bindings::bitmap_zalloc(nbits_u32, flags.as_raw()) };
+        let ptr = NonNull::new(ptr).ok_or(AllocError)?;
+        // INVARIANT: `ptr` returned by C `bitmap_zalloc` and `nbits` checked.
+        return Ok(Bitmap {
+            repr: BitmapRepr { ptr },
+            nbits,
+        });
+    }
+
+    /// Returns length of this [`Bitmap`].
+    #[inline]
+    pub fn len(&self) -> usize {
+        self.nbits
+    }
+
+    /// Returns a mutable raw pointer to the backing [`Bitmap`].
+    #[inline]
+    fn as_mut_ptr(&mut self) -> *mut usize {
+        if self.nbits <= bindings::BITS_PER_LONG as _ {
+            // SAFETY: Bitmap is represented inline.
+            unsafe { core::ptr::addr_of_mut!(self.repr.bitmap) }
+        } else {
+            // SAFETY: Bitmap is represented as array of `unsigned long`.
+            unsafe { self.repr.ptr.as_mut() }
+        }
+    }
+
+    /// Returns a raw pointer to the backing [`Bitmap`].
+    #[inline]
+    fn as_ptr(&self) -> *const usize {
+        if self.nbits <= bindings::BITS_PER_LONG as _ {
+            // SAFETY: Bitmap is represented inline.
+            unsafe { core::ptr::addr_of!(self.repr.bitmap) }
+        } else {
+            // SAFETY: Bitmap is represented as array of `unsigned long`.
+            unsafe { self.repr.ptr.as_ptr() }
+        }
+    }
+
+    /// Set bit with index `index`.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `index` is greater than or equal to `self.nbits`.
+    #[inline]
+    pub fn set_bit(&mut self, index: usize) {
+        assert!(
+            index < self.nbits,
+            "Bit `index` must be < {}, was {}",
+            self.nbits,
+            index
+        );
+        // SAFETY: Bit `index` is within bounds.
+        unsafe { bindings::__set_bit(index as u32, self.as_mut_ptr()) };
+    }
+
+    /// Set bit with index `index`, atomically.
+    ///
+    /// WARNING: this is a relaxed atomic operation (no implied memory barriers).
+    ///
+    /// # Panics
+    ///
+    /// Panics if `index` is greater than or equal to `self.nbits`.
+    #[inline]
+    pub fn set_bit_atomic(&self, index: usize) {
+        assert!(
+            index < self.nbits,
+            "Bit `index` must be < {}, was {}",
+            self.nbits,
+            index
+        );
+        // SAFETY: `index` is within bounds and there cannot be any data races
+        // because all non-atomic operations require exclusive access through
+        // a &mut reference.
+        unsafe { bindings::set_bit(index as u32, self.as_ptr() as *mut usize) };
+    }
+
+    /// Clear `index` bit.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `index` is greater than or equal to `self.nbits`.
+    #[inline]
+    pub fn clear_bit(&mut self, index: usize) {
+        assert!(
+            index < self.nbits,
+            "Bit `index` must be < {}, was {}",
+            self.nbits,
+            index
+        );
+        // SAFETY: `index` is within bounds.
+        unsafe { bindings::__clear_bit(index as u32, self.as_mut_ptr()) };
+    }
+
+    /// Clear `index` bit, atomically.
+    ///
+    /// WARNING: this is a relaxed atomic operation (no implied memory barriers).
+    ///
+    /// # Panics
+    ///
+    /// Panics if `index` is greater than or equal to `self.nbits`.
+    #[inline]
+    pub fn clear_bit_atomic(&self, index: usize) {
+        assert!(
+            index < self.nbits,
+            "Bit `index` must be < {}, was {}",
+            self.nbits,
+            index
+        );
+        // SAFETY: `index` is within bounds and there cannot be any data races
+        // because all non-atomic operations require exclusive access through
+        // a &mut reference.
+        unsafe { bindings::clear_bit(index as u32, self.as_ptr() as *mut usize) };
+    }
+
+    /// Copy `src` into this [`Bitmap`] and set any remaining bits to zero.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
+    /// use kernel::bitmap::Bitmap;
+    ///
+    /// let mut long_bitmap = Bitmap::new(256, GFP_KERNEL)?;
+    //
+    /// assert_eq!(None, long_bitmap.last_bit());
+    //
+    /// let mut short_bitmap = Bitmap::new(16, GFP_KERNEL)?;
+    //
+    /// short_bitmap.set_bit(7);
+    /// long_bitmap.copy_and_extend(&short_bitmap);
+    /// assert_eq!(Some(7), long_bitmap.last_bit());
+    ///
+    /// long_bitmap.clear_bit(7);
+    /// assert_eq!(None, long_bitmap.last_bit());
+    ///
+    /// # Ok::<(), AllocError>(())
+    /// ```
+    #[inline]
+    pub fn copy_and_extend(&mut self, src: &Bitmap) {
+        let len = core::cmp::min(src.nbits, self.nbits);
+        // SAFETY: access to `self` and `src` is within bounds.
+        unsafe {
+            bindings::bitmap_copy_and_extend(
+                self.as_mut_ptr(),
+                src.as_ptr(),
+                len as u32,
+                self.nbits as u32,
+            )
+        };
+    }
+
+    /// Finds last set bit.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
+    /// use kernel::bitmap::Bitmap;
+    ///
+    /// let bitmap = Bitmap::new(64, GFP_KERNEL)?;
+    ///
+    /// match bitmap.last_bit() {
+    ///     Some(idx) => {
+    ///         pr_info!("The last bit has index {idx}.\n");
+    ///     }
+    ///     None => {
+    ///         pr_info!("All bits in this bitmap are 0.\n");
+    ///     }
+    /// }
+    /// # Ok::<(), AllocError>(())
+    /// ```
+    #[inline]
+    pub fn last_bit(&self) -> Option<usize> {
+        // SAFETY: access is within bounds.
+        let index = unsafe { bindings::_find_last_bit(self.as_ptr(), self.nbits) };
+        if index == self.nbits {
+            None
+        } else {
+            Some(index)
+        }
+    }
+
+    /// Finds next zero bit, starting from `start`.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `index` is greater than or equal to `self.nbits`.
+    #[inline]
+    pub fn next_zero_bit(&self, start: usize) -> Option<usize> {
+        assert!(
+            start < self.nbits,
+            "`start` must be < {}, was {}",
+            self.nbits,
+            start
+        );
+
+        // SAFETY: access is within bounds.
+        let index = unsafe { bindings::_find_next_zero_bit(self.as_ptr(), self.nbits, start) };
+        if index == self.nbits {
+            None
+        } else {
+            Some(index)
+        }
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 7697c60b2d1a..c82b23236056 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -36,6 +36,7 @@
 pub use ffi;
 
 pub mod alloc;
+pub mod bitmap;
 #[cfg(CONFIG_BLOCK)]
 pub mod block;
 #[doc(hidden)]
-- 
2.49.0.395.g12beb8f557-goog

