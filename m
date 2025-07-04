Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A1C2D3EE3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 09:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751621184; cv=none; b=S0aYGa2FlAGlEkNzG0zmuC+O4Tipn+j2qUBn9T42ISF4jt+Q+EIZuvnGzqDwt4BIBDyqbIhIy1Hf0aI+E0I/1vI8GSE+knjUHCfa91sLQ3cjgrJaPlOkvQ7bkK5ME54GouPXgl0dmKRzeunQM19wrgFa0j9Vx0upODgX6gb+ytE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751621184; c=relaxed/simple;
	bh=GUVBYe3ElqgZ8myVjRq1MC1lE7GgjoXJmCVS8swISF0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sI0EuTyLPRsKRbQZWX9/LA8gQDaFXYzDtXcpd+f1JK9wrkzzCZ2rTOHli0gckSKH8mLnW2VvCsWuYBmRf5KfYE2Zq8+IJARYnPD6vGWnObghnuOHT1HxadfawKks9X83qATDJAbZkQR+y2RZln33mFbfH25GWy3dLSEM7LmGWQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F46mgFf0; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F46mgFf0"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4535ee06160so6045165e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 02:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751621181; x=1752225981; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=c32w900jPJ+cRo3HavDez6oS0pxYHFGoO7PGXsKOmnE=;
        b=F46mgFf0HjHT0hQtIUvoHBKd4Y3//9j+RGEyfx1Y6uc+aE0u/MHNR2k+xG/L5ynR4k
         E384q+WK4iUH4YmGayOO+c7Z8r0HSJuF8EWDs3bjgnkHtJGZ1IzJT2COjxXIkFn03hgR
         lNW2x95CBrce45/qAPE2KZoS+WXFuNCY6+/I2ykij6Gei5s+5gbbJLADPq89rcENPSlm
         w0iePzm3DTatcoG8AK1Naao/HI7ACcN+o1MeiV6ZMSrymSsCAk+rn/EoKcL4sQLRy96A
         9104nhy0/2JIGYUPxn+tnb7OO+Z2mbMxbtmJ8KpIyYWF2vONw7FQTxVWYuhiRCY52J/u
         tkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751621181; x=1752225981;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c32w900jPJ+cRo3HavDez6oS0pxYHFGoO7PGXsKOmnE=;
        b=poHQxcK19sXw9VwyITpvsWWd9UYjigeJuaxrV7roAuH2MeSdYmdRRqMxfoHR7UkapK
         ztd8txJuahpf+o6FYtZ/clIQc6u3F0i45gW4cunXb/Kr7c6RkQR4WZQj79gMNz5fh4bn
         NoL0HTAn8LhEWkjUzAkwTm6T3FJs8wP75iSnBbKsaygHMdf58ZPMIuYz10VzJIxRI0R0
         TgvuCFlaUpEMfT7kQoOpfna/p0767z4miws8T4Qk4TuQUigJz7UePSlgRqgnhgONKxtO
         eTbMfxjp0AW445m0INIlzYvO2Jsij4t2GBQTEHAQl2xCnrbQoG3iWcHVNUwJTlWi/6QC
         R8Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVcvl3ez1l09gJWUdxh/O6x39QuKxenK/NIw/qttebgkxx8e0xtFZtZtGyfmR4v5kIuUtFpPze1vGyMAuU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2VFWNsgte0Jm0c0ZfNT7YrW5I1+rjUQGQqKhDQPQRJjnqLMve
	Qswolsyf47QV8di2RErcihvqPwu6IdVvn3QdXgsM0r1rmf5Y/Xr0vwqxnmBelHPDLSDpGJqTv1j
	7PhX/qmJ2O4MOX7+9ww==
X-Google-Smtp-Source: AGHT+IFJVeeE9iVd5s1Jk2vz/11bsqhZ1mGVQj4/jhzG4VqZ7medZF9PnozW8BWzsiISkuPr2gX4qlzv0WXMqW4=
X-Received: from wmgg12.prod.google.com ([2002:a05:600d:c:b0:442:f45c:c10c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3493:b0:442:cd03:3e2 with SMTP id 5b1f17b1804b1-454b306a122mr18684725e9.2.1751621180890;
 Fri, 04 Jul 2025 02:26:20 -0700 (PDT)
Date: Fri, 04 Jul 2025 09:26:00 +0000
In-Reply-To: <20250704-iov-iter-v2-0-e69aa7c1f40e@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250704-iov-iter-v2-0-e69aa7c1f40e@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=7303; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=GUVBYe3ElqgZ8myVjRq1MC1lE7GgjoXJmCVS8swISF0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoZ545EoGErSoI63LAE38PekMbVIHg7PDc6pC4O
 qNnHAM+I9eJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaGeeOQAKCRAEWL7uWMY5
 Rq7BD/47wCOhT3Qlevvp2V5GBBvM9BPm0DyYGM9/9tOunllOMEguVAeIzwraOKVBw0r5BvAPheB
 7P1po0DKh+Ytjm/mcBphq+mL8HNOD0DylXGteBcB2ZnyDlGq2sxvLBXMuPVKgG11qJ+EZQkXMO+
 t7cCkoM8VB2Y94rWRruwNfJoPuu/enaP6D5z77hllA5Lye187dVQPeqGTYS4Xh8p5RFRJqnn8XM
 lww83xRAcpYqPTIV7pzFKUwOJFG/319QJ/e9nuQspd2je2YavFVav9T/0F0PXI8F4rXb1hKtay1
 xDF7+xmLkDhcMIb92sjCnCRNskv649o/rzM6X+bLGLQ4+kLvRJJS4ZJumj3mgS6QUil/rGmsPhT
 oPGMwYUdi3yC+32QQwH8eYXMY2LrP/E0oi/AZCUZwEwvuNlxtMUVl9rFscdEjo4WUeTS/lr7JKx
 hckinfj+e+oObnmfKEIni9PCKmc8/KitDW8vpRn+vcd8YjGzviIKLK9DTucsIAClM+5eEan8mqp
 i8yLEzaMgmm/Yng2PYYcOJcEyZvn3fNmVS2SjlVyAyHUrTRbtJUwf1OzGBzFZ+pFLJ7o0PgNZKv
 LxOm9bmovy2CATWI+IRjSGXWa+jrdx3KWo7XJRyWftXxmPS0tIG7UdWo7XgnvVUpdGGbE5wHDdB WEd65Yxbt50xB0g==
X-Mailer: b4 0.14.2
Message-ID: <20250704-iov-iter-v2-1-e69aa7c1f40e@google.com>
Subject: [PATCH v2 1/4] rust: iov: add iov_iter abstractions for ITER_SOURCE
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="utf-8"

This adds abstractions for the iov_iter type in the case where
data_source is ITER_SOURCE. This will make Rust implementations of
fops->write_iter possible.

This series only has support for using existing IO vectors created by C
code. Additional abstractions will be needed to support the creation of
IO vectors in Rust code.

These abstractions make the assumption that `struct iov_iter` does not
have internal self-references, which implies that it is valid to move it
between different local variables.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/iov.rs | 152 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs |   1 +
 2 files changed, 153 insertions(+)

diff --git a/rust/kernel/iov.rs b/rust/kernel/iov.rs
new file mode 100644
index 0000000000000000000000000000000000000000..b4d7ec14c57a561a01cd65b6bdf0f94b1b373b84
--- /dev/null
+++ b/rust/kernel/iov.rs
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Google LLC.
+
+//! IO vectors.
+//!
+//! C headers: [`include/linux/iov_iter.h`](srctree/include/linux/iov_iter.h),
+//! [`include/linux/uio.h`](srctree/include/linux/uio.h)
+
+use crate::{
+    alloc::{Allocator, Flags},
+    bindings,
+    prelude::*,
+    types::Opaque,
+};
+use core::{marker::PhantomData, mem::MaybeUninit, slice};
+
+const ITER_SOURCE: bool = bindings::ITER_SOURCE != 0;
+
+/// An IO vector that acts as a source of data.
+///
+/// The data may come from many different sources. This includes both things in kernel-space and
+/// reading from userspace. It's not necessarily the case that the data source is immutable, so
+/// rewinding the IO vector to read the same data twice is not guaranteed to result in the same
+/// bytes. It's also possible that the data source is mapped in a thread-local manner using e.g.
+/// `kmap_local_page()`, so this type is not `Send` to ensure that the mapping is read from the
+/// right context in that scenario.
+///
+/// # Invariants
+///
+/// Must hold a valid `struct iov_iter` with `data_source` set to `ITER_SOURCE`. For the duration
+/// of `'data`, it must be safe to read the data in this IO vector.
+#[repr(transparent)]
+pub struct IovIterSource<'data> {
+    iov: Opaque<bindings::iov_iter>,
+    /// Represent to the type system that this value contains a pointer to readable data it does
+    /// not own.
+    _source: PhantomData<&'data [u8]>,
+}
+
+impl<'data> IovIterSource<'data> {
+    /// Obtain an `IovIterSource` from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// * For the duration of `'iov`, the `struct iov_iter` must remain valid and must not be
+    ///   accessed except through the returned reference.
+    /// * For the duration of `'data`, the buffers backing this IO vector must be valid for
+    ///   reading.
+    #[track_caller]
+    #[inline]
+    pub unsafe fn from_raw<'iov>(ptr: *mut bindings::iov_iter) -> &'iov mut IovIterSource<'data> {
+        // SAFETY: The caller ensures that `ptr` is valid.
+        let data_source = unsafe { (*ptr).data_source };
+        assert_eq!(data_source, ITER_SOURCE);
+
+        // SAFETY: The caller ensures the struct invariants for the right durations.
+        unsafe { &mut *ptr.cast::<IovIterSource<'data>>() }
+    }
+
+    /// Access this as a raw `struct iov_iter`.
+    #[inline]
+    pub fn as_raw(&mut self) -> *mut bindings::iov_iter {
+        self.iov.get()
+    }
+
+    /// Returns the number of bytes available in this IO vector.
+    ///
+    /// Note that this may overestimate the number of bytes. For example, reading from userspace
+    /// memory could fail with `EFAULT`, which will be treated as the end of the IO vector.
+    #[inline]
+    pub fn len(&self) -> usize {
+        // SAFETY: It is safe to access the `count` field.
+        unsafe {
+            (*self.iov.get())
+                .__bindgen_anon_1
+                .__bindgen_anon_1
+                .as_ref()
+                .count
+        }
+    }
+
+    /// Returns whether there are any bytes left in this IO vector.
+    ///
+    /// This may return `true` even if there are no more bytes available. For example, reading from
+    /// userspace memory could fail with `EFAULT`, which will be treated as the end of the IO vector.
+    #[inline]
+    pub fn is_empty(&self) -> bool {
+        self.len() == 0
+    }
+
+    /// Advance this IO vector by `bytes` bytes.
+    ///
+    /// If `bytes` is larger than the size of this IO vector, it is advanced to the end.
+    #[inline]
+    pub fn advance(&mut self, bytes: usize) {
+        // SAFETY: `self.iov` is a valid IO vector.
+        unsafe { bindings::iov_iter_advance(self.as_raw(), bytes) };
+    }
+
+    /// Advance this IO vector backwards by `bytes` bytes.
+    ///
+    /// # Safety
+    ///
+    /// The IO vector must not be reverted to before its beginning.
+    #[inline]
+    pub unsafe fn revert(&mut self, bytes: usize) {
+        // SAFETY: `self.iov` is a valid IO vector, and `bytes` is in bounds.
+        unsafe { bindings::iov_iter_revert(self.as_raw(), bytes) };
+    }
+
+    /// Read data from this IO vector.
+    ///
+    /// Returns the number of bytes that have been copied.
+    #[inline]
+    pub fn copy_from_iter(&mut self, out: &mut [u8]) -> usize {
+        // SAFETY: We will not write uninitialized bytes to `out`.
+        let out = unsafe { &mut *(out as *mut [u8] as *mut [MaybeUninit<u8>]) };
+
+        self.copy_from_iter_raw(out).len()
+    }
+
+    /// Read data from this IO vector and append it to a vector.
+    ///
+    /// Returns the number of bytes that have been copied.
+    #[inline]
+    pub fn copy_from_iter_vec<A: Allocator>(
+        &mut self,
+        out: &mut Vec<u8, A>,
+        flags: Flags,
+    ) -> Result<usize> {
+        out.reserve(self.len(), flags)?;
+        let len = self.copy_from_iter_raw(out.spare_capacity_mut()).len();
+        // SAFETY: The next `len` bytes of the vector have been initialized.
+        unsafe { out.inc_len(len) };
+        Ok(len)
+    }
+
+    /// Read data from this IO vector into potentially uninitialized memory.
+    ///
+    /// Returns the sub-slice of the output that has been initialized. If the returned slice is
+    /// shorter than the input buffer, then the entire IO vector has been read.
+    #[inline]
+    pub fn copy_from_iter_raw(&mut self, out: &mut [MaybeUninit<u8>]) -> &mut [u8] {
+        // SAFETY: `out` is valid for `out.len()` bytes.
+        let len =
+            unsafe { bindings::_copy_from_iter(out.as_mut_ptr().cast(), out.len(), self.as_raw()) };
+
+        // SAFETY: We just initialized the first `len` bytes of `out`.
+        unsafe { slice::from_raw_parts_mut(out.as_mut_ptr().cast(), len) }
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6b4774b2b1c37f4da1866e993be6230bc6715841..278b6fdee62156f4ed997c13fa10bd2fb0fa3ad6 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -81,6 +81,7 @@
 pub mod init;
 pub mod io;
 pub mod ioctl;
+pub mod iov;
 pub mod jump_label;
 #[cfg(CONFIG_KUNIT)]
 pub mod kunit;

-- 
2.50.0.727.gbf7dc18ff4-goog

