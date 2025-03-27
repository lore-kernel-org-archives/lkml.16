Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD96F19E819
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743092203; cv=none; b=ZX5v6LHgac/x5RXgWttUwgjSXDMhgYT/AlfYA5uD1pslKYCw12Z+gDvXKQ0J1v5M1HkBNMIg9Gtx7OTolAzg5aZsELLoeKTJ4Gv3urmdI4vQERN2rd4XEdZegOKWr2RTNg6wSc9L6SuXq6PIw6Tb1AHwS3lbowVi8i0UFSRv1iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743092203; c=relaxed/simple;
	bh=F+x+UW53qVwetpZ4xzLhdPdzOKCpWVY/5F+38EvXfyE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qAr79mfjd13wJ+Re8mqTBJphKZvHhDHuFNCAs0YdqKWsS8ztuS1bVpt2FxPV0YisDUG34TnBVbO6kQiBN6d+st+dYFnPHzajunW2qUC0Fvl+xot+9lS4szMk8+/pP7yMQoCozDC/zwtHR+mehsRX7KYgMNP07BbIDRfEib1z8uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wrNtItv6; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wrNtItv6"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-391492acb59so752635f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743092200; x=1743697000; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CaI5jeiepnCukVYTE/StOGk7ZSuQkrGrfxX0IW/jO00=;
        b=wrNtItv6YvDhyUHvL1iRO/l9NhCK4zZmB+V1HpXSvMWjqb65+e9DYWEbWTsfDIAstK
         dI60ENuK9Cjias/AhF20ByhxHnPZvcp+C+ZfRxnfWfHBWqpzElFhm/pMPoKHER7D1wsR
         BSx+186h/vaXIoSMOAnSxt5NykiaL/mFMcyxno3rzE0z43/ZEv2YLxl8AmCNj7jrkzGi
         vsS/6MDif2lVGvZaMtpL1VyAeDGztqSukBL+b02ZqId6LyXpTOp6wGkc27PEsEtpIcH9
         PzGef+t/t0SjpemAX9ur6c5sXkbhfD8XcOmSrXzidXSDa/po3WqyIXaR8GxyfOkbeNsk
         QszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743092200; x=1743697000;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CaI5jeiepnCukVYTE/StOGk7ZSuQkrGrfxX0IW/jO00=;
        b=wPxHCbbj/ofFbKrQjQbctvqOJYvNk3X/I0Eh/L+7/5DSiS3sL0I+fZmFxgv/egetH9
         UqHs1KSkISA/D0Unh2GzwVKWQoyrinnJRjNobsOTMTdTBKCQJIUvlkDZc60FJLD5PrEU
         GNtvmy2aCeIDWw9hDFFg2d2OpJXZWz/w3uVMTVi8KmCcSYxrC8HpcLrvaBeo8gFAuDIM
         IKcTtbeVGMEQj9LvcM0O1Iz4h51A4Zvfa4erOF0iYQV0pndxpcvYqf+GumP2bdqk19ib
         3vNFByS3srJtRq5zrQukP8hu9fcylJJ7BvKjT9SkgvQdN0UiKQ2DPzNMII0My1zZivjd
         vkQg==
X-Forwarded-Encrypted: i=1; AJvYcCVII16f/CA7IW3VKRTrklMQtdL+TjSD2Xt2YmcZUPS/ezw5vGTTyYBnOFPszM+xyMQWLLFuZyBTiry4Z6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLBOI2NWSfWd0FPOpfetx6DOKGA2upN8QJw1Wd48XU+yxMFXmr
	mNxJ9x50SXt9BhQcqGDw3JkQXvKecjV+6hj0jB3O+YV846dS75yZNN/SbeGW3Hfqog==
X-Google-Smtp-Source: AGHT+IGMNNLBeGoFDGM/YN3dohqRU/VHAkNClOFV3WlHWzboKThygC1+BFMBGcJLJZuE8N9hNGiNS+c=
X-Received: from wmdd9.prod.google.com ([2002:a05:600c:a209:b0:43d:896f:72e5])
 (user=bqe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:40e0:b0:399:7f43:b3a4
 with SMTP id ffacd0b85a97d-39ad1748dc1mr3646412f8f.24.1743092200090; Thu, 27
 Mar 2025 09:16:40 -0700 (PDT)
Date: Thu, 27 Mar 2025 16:16:14 +0000
In-Reply-To: <20250327161617.117748-1-bqe@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250327161617.117748-1-bqe@google.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250327161617.117748-5-bqe@google.com>
Subject: [PATCH v6 4/4] rust: add dynamic ID pool abstraction for bitmap
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

This is a port of the Binder data structure introduced in commit
15d9da3f818c ("binder: use bitmap for faster descriptor lookup") to
Rust.

Like drivers/android/dbitmap.h, the ID pool abstraction lets
clients acquire and release IDs. The implementation uses a bitmap to
know what IDs are in use, and gives clients fine-grained control over
the time of allocation. This fine-grained control is needed in the
Android Binder. We provide an example that release a spinlock for
allocation and unit tests (rustdoc examples).

The implementation is not aware that the underlying Bitmap abstraction
handles lengths below BITS_PER_LONG without allocation.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Suggested-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Burak Emir <bqe@google.com>
---
 MAINTAINERS            |   1 +
 rust/kernel/id_pool.rs | 201 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |   1 +
 3 files changed, 203 insertions(+)
 create mode 100644 rust/kernel/id_pool.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index efb0d367dea2..13bc1c695858 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4040,6 +4040,7 @@ M:	Burak Emir <bqe@google.com>
 R:	Yury Norov <yury.norov@gmail.com>
 S:	Maintained
 F:	rust/kernel/bitmap.rs
+F:	rust/kernel/id_pool.rs
 
 BITOPS API
 M:	Yury Norov <yury.norov@gmail.com>
diff --git a/rust/kernel/id_pool.rs b/rust/kernel/id_pool.rs
new file mode 100644
index 000000000000..8f07526bb580
--- /dev/null
+++ b/rust/kernel/id_pool.rs
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Google LLC.
+
+//! Rust API for an ID pool backed by a `Bitmap`.
+
+use crate::alloc::{AllocError, Flags};
+use crate::bitmap::Bitmap;
+
+/// Represents a dynamic ID pool backed by a `Bitmap`.
+///
+/// Clients acquire and release IDs from zero bits in a bitmap.
+///
+/// The ID pool can grow or shrink as needed. It has been designed
+/// to support the scenario where users need to control the time
+/// of allocation of a new backing bitmap, which may require release
+/// of locks.
+/// These operations then, are verified to determine if the grow or
+/// shrink is sill valid.
+///
+/// # Examples
+///
+/// Basic usage
+///
+/// ```
+/// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
+/// use kernel::id_pool::IdPool;
+///
+/// let mut pool = IdPool::new(64, GFP_KERNEL)?;
+/// for i in 0..64 {
+///   assert_eq!(i, pool.acquire_next_id(i).ok_or(ENOSPC)?);
+/// }
+///
+/// pool.release_id(23);
+/// assert_eq!(23, pool.acquire_next_id(0).ok_or(ENOSPC)?);
+///
+/// assert_eq!(None, pool.acquire_next_id(0));  // time to realloc.
+/// let resizer = pool.grow_alloc().alloc(GFP_KERNEL)?;
+/// pool.grow(resizer);
+///
+/// assert_eq!(pool.acquire_next_id(0), Some(64));
+/// # Ok::<(), Error>(())
+/// ```
+///
+/// Releasing spinlock to grow the pool
+///
+/// ```no_run
+/// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
+/// use kernel::sync::{new_spinlock, SpinLock};
+/// use kernel::id_pool::IdPool;
+///
+/// fn get_id_maybe_alloc(guarded_pool: &SpinLock<IdPool>) -> Result<usize, AllocError> {
+///   let mut pool = guarded_pool.lock();
+///   loop {
+///     match pool.acquire_next_id(0) {
+///       Some(index) => return Ok(index),
+///       None => {
+///         let alloc_request = pool.grow_alloc();
+///         drop(pool);
+///         let resizer = alloc_request.alloc(GFP_KERNEL)?;
+///         pool = guarded_pool.lock();
+///         pool.grow(resizer)
+///       }
+///     }
+///   }
+/// }
+/// ```
+pub struct IdPool {
+    map: Bitmap,
+}
+
+/// Returned when the `IdPool` should change size.
+pub struct AllocRequest {
+    nbits: usize,
+}
+
+/// Contains an allocated `Bitmap` for resizing `IdPool`.
+pub struct PoolResizer {
+    new: Bitmap,
+}
+
+impl AllocRequest {
+    /// Allocates a new `Bitmap` for `IdPool`.
+    pub fn alloc(&self, flags: Flags) -> Result<PoolResizer, AllocError> {
+        let new = Bitmap::new(self.nbits, flags)?;
+        Ok(PoolResizer { new })
+    }
+}
+
+impl IdPool {
+    /// Constructs a new `[IdPool]`.
+    #[inline]
+    pub fn new(nbits: usize, flags: Flags) -> Result<Self, AllocError> {
+        let map = Bitmap::new(nbits, flags)?;
+        Ok(Self { map })
+    }
+
+    /// Returns how many IDs this pool can currently have.
+    #[inline]
+    pub fn len(&self) -> usize {
+        self.map.len()
+    }
+
+    /// Returns an [`AllocRequest`] if the [`IdPool`] can be shrunk, [`None`] otherwise.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
+    /// use kernel::id_pool::{AllocRequest, IdPool};
+    ///
+    /// let mut pool = IdPool::new(1024, GFP_KERNEL)?;
+    /// let alloc_request = pool.shrink_alloc().ok_or(AllocError)?;
+    /// let resizer = alloc_request.alloc(GFP_KERNEL)?;
+    /// pool.shrink(resizer);
+    /// assert_eq!(pool.len(), kernel::bindings::BITS_PER_LONG as usize);
+    /// # Ok::<(), AllocError>(())
+    /// ```
+    #[inline]
+    pub fn shrink_alloc(&self) -> Option<AllocRequest> {
+        let len = self.map.len();
+        if len <= bindings::BITS_PER_LONG as usize {
+            return None;
+        }
+        /*
+         * Determine if the bitmap can shrink based on the position of
+         * its last set bit. If the bit is within the first quarter of
+         * the bitmap then shrinking is possible. In this case, the
+         * bitmap should shrink to half its current size.
+         */
+        match self.map.last_bit() {
+            Some(bit) => {
+                if bit < (len >> 2) {
+                    Some(AllocRequest { nbits: len >> 1 })
+                } else {
+                    None
+                }
+            }
+            None => Some(AllocRequest {
+                nbits: bindings::BITS_PER_LONG as usize,
+            }),
+        }
+    }
+
+    /// Shrinks pool by using a new `Bitmap`, if still possible.
+    #[inline]
+    pub fn shrink(&mut self, mut resizer: PoolResizer) {
+        // Verify that shrinking is still possible. The `resizer`
+        // bitmap might have been allocated without locks, so this call
+        // could now be outdated. In this case, drop `resizer` and move on.
+        if let Some(AllocRequest { nbits }) = self.shrink_alloc() {
+            if nbits <= resizer.new.len() {
+                resizer.new.copy_and_extend(&self.map);
+                self.map = resizer.new;
+                return;
+            }
+        }
+    }
+
+    /// Returns an `AllocRequest` for growing this `IdPool`.
+    #[inline]
+    pub fn grow_alloc(&self) -> AllocRequest {
+        AllocRequest {
+            nbits: self.map.len() << 1,
+        }
+    }
+
+    /// Grows pool by using a new `Bitmap`, if still necessary.
+    #[inline]
+    pub fn grow(&mut self, mut resizer: PoolResizer) {
+        // `resizer` bitmap might have been allocated without locks,
+        // so this call could now be outdated. In this case, drop
+        // `resizer` and move on.
+        if resizer.new.len() <= self.map.len() {
+            return;
+        }
+
+        resizer.new.copy_and_extend(&self.map);
+        self.map = resizer.new;
+    }
+
+    /// Acquires a new ID by finding and setting the next zero bit in the
+    /// bitmap. Upon success, returns its index. Otherwise, returns `None`
+    /// to indicate that a `grow_alloc` is needed.
+    #[inline]
+    pub fn acquire_next_id(&mut self, offset: usize) -> Option<usize> {
+        match self.map.next_zero_bit(offset) {
+            res @ Some(nr) => {
+                self.map.set_bit(nr);
+                res
+            }
+            None => None,
+        }
+    }
+
+    /// Releases an ID.
+    #[inline]
+    pub fn release_id(&mut self, id: usize) {
+        self.map.clear_bit(id);
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index c82b23236056..fc19d97f7b9b 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -51,6 +51,7 @@
 #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
 pub mod firmware;
 pub mod fs;
+pub mod id_pool;
 pub mod init;
 pub mod io;
 pub mod ioctl;
-- 
2.49.0.395.g12beb8f557-goog

