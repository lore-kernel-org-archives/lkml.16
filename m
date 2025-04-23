Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A541AAA11
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415862; cv=none; b=utRNrNCGCORNRWpkKZJ5SsTHA91J3TGrNG8PfWQLQSu2lwn8GBIXbnez/U+IS/WpByYXVQGYketx82M1d4x4Cg/6mp0OMPRcTlru7lWsQCj6OexuKZ/gsHrDP/pGdBfP9U5jYXHFmP8zVXvDzxtAI07ULryDERryFlwDv9x1xeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415862; c=relaxed/simple;
	bh=CN8O71p41lHp5sLIU4lBMKwAN5kTbEfI4FETCq2Qjp8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PI6NCEdh6w0Ht7FM0R6GWRpokh+KuGeH2ZZZ1HgmfkOq5hbYt2pzfO4sbq3qBbMLsB3VTZq08QzLaOSHYdJT/uScSBM4X/PQHph3mNiBWwMHPDhqi/Zy3LzW+afFrN8o1XWxLLY/B3url99eA4cUkwgpaFOD3haXSdnHzvUEPug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bZld8SfQ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bZld8SfQ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d4d15058dso46104605e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745415859; x=1746020659; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LEepjiKsNPuyK0wSUaPJvB0oqW0ARkmSvjkktOEjdc0=;
        b=bZld8SfQrABoBvt4NvPBBpPwni7tAq1HXp66uUrx93+tJJE6Wyp2kZUoETH50ocv3X
         dODux3gockMxjKleBvTNcOxNSrGIluiCxSlTLs9PFhvz+3VsdjgZw7TC3bnxxGDweGnU
         pZvE/EHzYelI9Nvdqjx0079Usxd5s/it/uR7Sla54ISfN1twCr53Syhwdr6ggFKEP+lf
         zRMvsFjiqFfbd+kxTp+09SuthFiSDyZYbGbPtE+s7P9x7W32rZL3APQMGLQtZf4T6Q8T
         SQ2s5HNPwayVOWbUJNnIt7U/vOG/Vl85dwZTv1vtz0URWi3MxeYo2fnKhlNuN1ntTTTY
         hCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415859; x=1746020659;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LEepjiKsNPuyK0wSUaPJvB0oqW0ARkmSvjkktOEjdc0=;
        b=aP+AIqaB9jhSp6LeUYDOwPF0wxW991iXSZ/+j1hJW3fefG3ado+AYj1ScT0jBFZcWE
         DXjt53BOyvUfbipGtLy/9vLe6erFLOl4YGc15fPwKA5HxGwHZ7hWEEf0l7Oi1fh+3y2g
         MKAvXb+6Mts2B4ljHTohWvcdOk07ZRJnvi0PxdHJy6Vl9GklikYf7Hv+2evCJ6uJa7Xr
         YeZ/BFAZUSCZfSryl13CodZ24rWt+l/El1jENLetRmIQEgmbwGeO8yZZvKmQCw2eqwtt
         lG4+ZkStZrCQm5bqcLXTFoRXzxdIY0lRnEImULRFaJx6L32CjFq5OEuRWZ6VweVc3C4D
         oHzw==
X-Forwarded-Encrypted: i=1; AJvYcCUnPhuuMaIi7MfX/wfmgWtH1Zcg9H10Hcr10IuSfQaI7opDYYa3zLBVfQFDScI4Sz9ILW9k9by5DoXj+VU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwguvZ7W20jNAzklS7OSa6gVgrLMKR3JOiEyd/q4jboT0MrEyZV
	bWoUuVNJ+nSrTLbb9iYA5d6Oo5wviK/3c4NhlHB+yl01Xy7AXoAdLE6MG5+SLudVvw==
X-Google-Smtp-Source: AGHT+IHfaUEw1i+jxVcvorayrz5V74wkjFYpuLjqhE5ICtrq/5XpsFWJpL4TR+KVnqSEx0riPC6Lakg=
X-Received: from wmbbh27.prod.google.com ([2002:a05:600c:3d1b:b0:43d:5828:13ee])
 (user=bqe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:548e:b0:440:6a5f:c31f
 with SMTP id 5b1f17b1804b1-4406ab93420mr173186195e9.11.1745415858978; Wed, 23
 Apr 2025 06:44:18 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:43:35 +0000
In-Reply-To: <20250423134344.3888205-2-bqe@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423134344.3888205-2-bqe@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250423134344.3888205-5-bqe@google.com>
Subject: [PATCH v7 3/5] rust: add bitmap API.
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
We follow the C Bitmap API closely in naming and semantics, with
a few differences that take advantage of Rust language facilities
and idioms:

  * not all operations are exposed yet, to avoid dead code. This commit
    includes enough to implement an Android Binder data structure that
    was introduced in commit 15d9da3f818c ("binder: use bitmap for
    faster descriptor lookup"), namely drivers/android/dbitmap.h. This
    is part of upstreaming the Android Binder driver.

  * API uses Option types where appropriate

  * bound checks are used to treat out-of-bounds access as bug
    (hardening). The C operations treat out-of-bounds parameters
    as a default case e.g. "not found" which is safe (avoids UB) but
    may hide bugs.

  * better naming convention to distinguish non-atomic from atomic
    operations: {set,clear}_bit vs {set,clear}_bit_atomic.
    The Rust type system ensures that all non-atomic operations
    require a &mut reference which amounts to exclusive access.
    Using the atomic variants only makes sense when multiple threads
    have a shared reference &bitmap which amounts to the interior
    mutability pattern.

  * optimized to represent the bitmap inline if it would take the space
    of a pointer. This saves allocations which is relevant in the
    Binder use case.

The underlying C bitmap is *not* exposed. This would lose all static
guarantees.

An alternative route of vendoring an existing Rust bitmap package was
considered but suboptimal overall. Reusing the C implementation is
preferable for a basic data structure like bitmaps. It enables Rust
code to be a lot more similar and predictable with respect to C code
that uses the same data structures and enables the use of code that
has been tried-and-tested in the kernel.

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
 rust/kernel/bitmap.rs | 396 ++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs    |   1 +
 3 files changed, 404 insertions(+)
 create mode 100644 rust/kernel/bitmap.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 1f162f64eded..7d107dc91390 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4135,6 +4135,13 @@ S:	Maintained
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
index 000000000000..79ddbef2b028
--- /dev/null
+++ b/rust/kernel/bitmap.rs
@@ -0,0 +1,396 @@
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
+/// assert_eq!(Some(0), b.next_bit(0));
+/// assert_eq!(Some(1), b.next_zero_bit(0));
+/// assert_eq!(Some(4), b.next_bit(1));
+/// assert_eq!(Some(5), b.next_zero_bit(4));
+/// assert_eq!(Some(12), b.last_bit());
+/// # Ok::<(), Error>(())
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
+    /// ATTENTION: `set_bit` is non-atomic, which differs from the naming
+    /// convention in C code. The corresponding C function is `__set_bit`.
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
+    /// This is a relaxed atomic operation (no implied memory barriers).
+    ///
+    /// ATTENTION: The naming convention differs from C, where the corresponding
+    /// function is called `set_bit`.
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
+    /// ATTENTION: `clear_bit` is non-atomic, which differs from the naming
+    /// convention in C code. The corresponding C function is `__clear_bit`.
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
+    /// This is a relaxed atomic operation (no implied memory barriers).
+    ///
+    /// ATTENTION: The naming convention differs from C, where the corresponding
+    /// function is called `clear_bit`.
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
+    /// Finds next set bit, starting from `start`.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `start` is greater than or equal to `self.nbits`.
+    #[inline]
+    pub fn next_bit(&self, start: usize) -> Option<usize> {
+        assert!(
+            start < self.nbits,
+            "`start` must be < {}, was {}",
+            self.nbits,
+            start
+        );
+
+        // SAFETY: access is within bounds.
+        let index = unsafe { bindings::_find_next_bit(self.as_ptr(), self.nbits, start) };
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
+    /// Panics if `start` is greater than or equal to `self.nbits`.
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
+
+use macros::kunit_tests;
+
+#[kunit_tests(rust_kernel_bitmap)]
+mod tests {
+    use super::*;
+    use kernel::alloc::flags::GFP_KERNEL;
+
+    #[test]
+    fn bitmap_new() {
+        let b = Bitmap::new(0, GFP_KERNEL).unwrap();
+        assert_eq!(0, b.len());
+
+        let b = Bitmap::new(3, GFP_KERNEL).unwrap();
+        assert_eq!(3, b.len());
+
+        let b = Bitmap::new(1024, GFP_KERNEL).unwrap();
+        assert_eq!(1024, b.len());
+
+        // Requesting too large values results in [`AllocError`].
+        let b = Bitmap::new(1 << 31, GFP_KERNEL);
+        assert!(b.is_err());
+    }
+
+    #[test]
+    fn bitmap_set_clear_find() {
+        let mut b = Bitmap::new(128, GFP_KERNEL).unwrap();
+
+        // Zero-initialized
+        assert_eq!(None, b.last_bit());
+
+        b.set_bit(17);
+
+        assert_eq!(Some(17), b.next_bit(0));
+        assert_eq!(Some(17), b.last_bit());
+
+        b.set_bit(107);
+
+        assert_eq!(Some(17), b.next_bit(0));
+        assert_eq!(Some(17), b.next_bit(17));
+        assert_eq!(Some(107), b.next_bit(18));
+        assert_eq!(Some(107), b.last_bit());
+
+        b.clear_bit(17);
+
+        assert_eq!(Some(107), b.next_bit(0));
+        assert_eq!(Some(107), b.last_bit());
+    }
+
+    #[test]
+    fn bitmap_copy_and_extend() {
+        let mut long_bitmap = Bitmap::new(256, GFP_KERNEL).unwrap();
+
+        long_bitmap.set_bit(3);
+        long_bitmap.set_bit(200);
+
+        let mut short_bitmap = Bitmap::new(32, GFP_KERNEL).unwrap();
+
+        short_bitmap.set_bit(17);
+
+        long_bitmap.copy_and_extend(&short_bitmap);
+        // The larger bits have been cleared.
+        assert_eq!(Some(17), long_bitmap.next_bit(0));
+        assert_eq!(Some(17), long_bitmap.last_bit());
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 42ab6cf4053f..94eb150c52c7 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -38,6 +38,7 @@
 pub use ffi;
 
 pub mod alloc;
+pub mod bitmap;
 #[cfg(CONFIG_BLOCK)]
 pub mod block;
 #[doc(hidden)]
-- 
2.49.0.805.g082f7c87e0-goog

