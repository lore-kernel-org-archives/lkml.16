Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE341231A32
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 05:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743572335; cv=none; b=NGFI7v2lNlntF5pz3B6f2CNhbbBMQ2zUWdcde9u97r0cBvET2LakdkBhTDOWraoxRTe0RBXa4wWzo4A1CqeAMDvtbx7HkJwp9PCGXTRBJROgXliebB+I+yP5cWxX0O0KwepXbNNp2AuyNw7uCANcGNnzkmxfWlHYtw8b61Z5lk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743572335; c=relaxed/simple;
	bh=ttLg1HcNgivrHUeqtU7AhquQvYl8brGHnJxkRRBE7Es=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FAfKC4OedeTx7Y0W9G7TwLZHt6kWUocGDEPLXR/D75GCCFsVSH0ZWEGlChuNbUjgsoJZIoRXTizfQsaJHq88RuhfdmDZHwswfYJSoBPaLzq95xC6rTXeQcfKVLIVhstK4NSfJknT3kB0rxAjTL+tfCxMlVEOU1S6NoKnLRohzp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dxPRVlop; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dxPRVlop"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22622ddcc35so52442715ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 22:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743572333; x=1744177133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNOUGdwWfStaer+R9sgUtj4YnrPxUBt4w24A0vjSOrs=;
        b=dxPRVloplOpzuz5qXsoCZV3EQ5tkEnegfad4WJidtw1aJ/yTTX3+4R+V3U3P7ieUKQ
         6q1MbsZ0swbcfv0fx3LgxjAjWjkX/iMJnam+70UDS+T979rR+8cZyR8VjYlJHiSNLPaK
         9jlLnDYzbOZRGUqxJTRCKHU2ugDxdGRuOPZNldLbFx64sDoJ0/lBMc0/Qo2XffJTyZMm
         aULb1ON8QU90dbjFSCXf7hVegsY2ynlRUvugC+jMD9+0E1vso3HP1+74h3TzzGRlGCqz
         MqgUxjGXphk18RIwtTrORFZEk2sFTGu6Gh0zF7W3YhPpNu2uIBvpqqrpz0BS0UkptWsA
         yPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743572333; x=1744177133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNOUGdwWfStaer+R9sgUtj4YnrPxUBt4w24A0vjSOrs=;
        b=NBKvDxcNIK86O8vMHECq1PgjJzIyc/ovzl/+tvW4ZzFt/11TxPXOjq4XLlw26+zdYG
         LMQdROcccvKzP/Ca3W4aTWTyo0+NzJU+rYnmZuhvJN8+Yn2s0/tArQjm+WtunQIgl6oA
         If53RUxGk/4kN38ZxhFZZLsaSe/UbMusLFrjTwJlr6S6+XvXxgzPVI7ZtUiDATF05ASM
         SBQUmXdu9aYWKMeI5dWNpJmoJxoSa5anLyLwmn/4m/DNqW6YXppYufM3d3lzDDtWnmmk
         Oe0pn6gBfjHyjLozKsVD0mVsyO09up8849Xw1fIR5uZBYgVFfFlzw6+gr8kRF8ZL1sgX
         uWmQ==
X-Gm-Message-State: AOJu0Ywn//EByMwzwJgoAd4hE3UiDXO8C5RuJrLptqgW6iGvqnf8old9
	VaApMuAZCwQPjvb3RR44ZC9vhuKRNnsyMorqkdgF/3bWwpUptq9KXYwUW8Fbf1o=
X-Gm-Gg: ASbGncuuQ3UwxLwl+qisMoQpGEXcq+FBRvxcXb3qprH15gX0DZ120MFV7FORNjzOeNz
	oQJ7Re0sMZ8Ue3JEQ9sQWW5/T8iq9a7xpBbeNEVM5cPrf0JimblnF3x6mfBo83FrFh1zYgDZF+j
	VEJhW+a8O+tQZB+bFJEqpQolOQ49sltBIFin8uPqlH8v8RXyEDmKgr/HnnX+RnzRifwFdDhweYk
	s/9Rv1QmHXs7r9J2LoBU8yZbDQDN7LpYQ5qiBHThFIxC4sugIRR/AYpvKtw28UHx2D0gqfMgt2v
	EaLb3bynY5Y/ZijG2b415kapOripKfI3MFdhCgmTy14/KQ==
X-Google-Smtp-Source: AGHT+IFjiI9q9rJKqFIPVMe4VZ6iO7ECK6efDobxOca60uhTGBFS2pIFKEIPwQYz3yTHMCgnAUGI7w==
X-Received: by 2002:a05:6a00:2e9d:b0:736:52d7:daca with SMTP id d2e1a72fcca58-739c7942052mr1632580b3a.18.1743572333125;
        Tue, 01 Apr 2025 22:38:53 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73971091ccesm9991604b3a.127.2025.04.01.22.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 22:38:52 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>,
	rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Burak Emir <bqe@google.com>
Subject: [PATCH V4 1/2] rust: Add initial cpumask abstractions
Date: Wed,  2 Apr 2025 11:08:42 +0530
Message-Id: <35f4223be4a51139348fed82420481b370d7b1db.1743572195.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1743572195.git.viresh.kumar@linaro.org>
References: <cover.1743572195.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial Rust abstractions for struct cpumask, covering a subset of
its APIs. Additional APIs can be added as needed.

These abstractions will be used in upcoming Rust support for cpufreq and
OPP frameworks.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/kernel/cpumask.rs | 301 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |   1 +
 2 files changed, 302 insertions(+)
 create mode 100644 rust/kernel/cpumask.rs

diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
new file mode 100644
index 000000000000..792210a77770
--- /dev/null
+++ b/rust/kernel/cpumask.rs
@@ -0,0 +1,301 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! CPU Mask abstractions.
+//!
+//! C header: [`include/linux/cpumask.h`](srctree/include/linux/cpumask.h)
+
+use crate::{
+    alloc::{AllocError, Flags},
+    bindings,
+    prelude::*,
+    types::Opaque,
+};
+
+#[cfg(CONFIG_CPUMASK_OFFSTACK)]
+use core::ptr::{self, NonNull};
+
+#[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
+use core::mem::MaybeUninit;
+
+use core::ops::{Deref, DerefMut};
+
+/// A CPU Mask.
+///
+/// This represents the Rust abstraction for the C `struct cpumask`.
+///
+/// # Invariants
+///
+/// A [`Cpumask`] instance always corresponds to a valid C `struct cpumask`.
+///
+/// The callers must ensure that the `struct cpumask` is valid for access and remains valid for the
+/// lifetime of the returned reference.
+///
+/// ## Examples
+///
+/// The following example demonstrates how to update a [`Cpumask`].
+///
+/// ```
+/// use kernel::bindings;
+/// use kernel::cpumask::Cpumask;
+///
+/// fn set_clear_cpu(ptr: *mut bindings::cpumask, set_cpu: u32, clear_cpu: i32) {
+///     // SAFETY: The `ptr` is valid for writing and remains valid for the lifetime of the
+///     // returned reference.
+///     let mask = unsafe { Cpumask::from_raw_mut(ptr) };
+///     mask.set(set_cpu);
+///     mask.clear(clear_cpu);
+/// }
+/// ```
+#[repr(transparent)]
+pub struct Cpumask(Opaque<bindings::cpumask>);
+
+impl Cpumask {
+    /// Creates a mutable reference to an existing `struct cpumask` pointer.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` is valid for writing and remains valid for the lifetime
+    /// of the returned reference.
+    pub unsafe fn from_raw_mut<'a>(ptr: *mut bindings::cpumask) -> &'a mut Self {
+        // SAFETY: Guaranteed by the safety requirements of the function.
+        //
+        // INVARIANT: The caller ensures that `ptr` is valid for writing and remains valid for the
+        // lifetime of the returned reference.
+        unsafe { &mut *ptr.cast() }
+    }
+
+    /// Creates a reference to an existing `struct cpumask` pointer.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` is valid for reading and remains valid for the lifetime
+    /// of the returned reference.
+    pub unsafe fn from_raw<'a>(ptr: *const bindings::cpumask) -> &'a Self {
+        // SAFETY: Guaranteed by the safety requirements of the function.
+        //
+        // INVARIANT: The caller ensures that `ptr` is valid for reading and remains valid for the
+        // lifetime of the returned reference.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Obtain the raw `struct cpumask` pointer.
+    pub fn as_raw(&self) -> *mut bindings::cpumask {
+        self as *const Cpumask as *mut bindings::cpumask
+    }
+
+    /// Set `cpu` in the cpumask.
+    ///
+    /// Equivalent to the kernel's `cpumask_set_cpu` API.
+    #[inline]
+    pub fn set(&mut self, cpu: u32) {
+        // SAFETY: By the type invariant, `self.as_raw` is a valid argument to `cpumask_set_cpus`.
+        unsafe { bindings::cpumask_set_cpu(cpu, self.as_raw()) };
+    }
+
+    /// Clear `cpu` in the cpumask.
+    ///
+    /// Equivalent to the kernel's `cpumask_clear_cpu` API.
+    #[inline]
+    pub fn clear(&mut self, cpu: i32) {
+        // SAFETY: By the type invariant, `self.as_raw` is a valid argument to `cpumask_clear_cpu`.
+        unsafe { bindings::cpumask_clear_cpu(cpu, self.as_raw()) };
+    }
+
+    /// Set all CPUs in the cpumask.
+    ///
+    /// Equivalent to the kernel's `cpumask_setall` API.
+    #[inline]
+    pub fn set_all(&mut self) {
+        // SAFETY: By the type invariant, `self.as_raw` is a valid argument to `cpumask_setall`.
+        unsafe { bindings::cpumask_setall(self.as_raw()) };
+    }
+
+    /// Get weight of the cpumask.
+    ///
+    /// Equivalent to the kernel's `cpumask_weight` API.
+    #[inline]
+    pub fn weight(&self) -> u32 {
+        // SAFETY: By the type invariant, `self.as_raw` is a valid argument to `cpumask_weight`.
+        unsafe { bindings::cpumask_weight(self.as_raw()) }
+    }
+
+    /// Copy cpumask.
+    ///
+    /// Equivalent to the kernel's `cpumask_copy` API.
+    #[inline]
+    pub fn copy(&self, dstp: &mut Self) {
+        // SAFETY: By the type invariant, `Self::as_raw` is a valid argument to `cpumask_copy`.
+        unsafe { bindings::cpumask_copy(dstp.as_raw(), self.as_raw()) };
+    }
+}
+
+/// A CPU Mask pointer.
+///
+/// This represents the Rust abstraction for the C `struct cpumask_var_t`.
+///
+/// # Invariants
+///
+/// A [`CpumaskBox`] instance always corresponds to a valid C `struct cpumask_var_t`.
+///
+/// The callers must ensure that the `struct cpumask_var_t` is valid for access and remains valid
+/// for the lifetime of [`CpumaskBox`].
+///
+/// ## Examples
+///
+/// The following example demonstrates how to create and update a [`CpumaskBox`].
+///
+/// ```
+/// use kernel::cpumask::CpumaskBox;
+/// use kernel::error::Result;
+///
+/// fn cpumask_foo() -> Result {
+///     let mut mask = CpumaskBox::new(GFP_KERNEL)?;
+///
+///     assert_eq!(mask.weight(), 0);
+///     mask.set(2);
+///     assert_eq!(mask.weight(), 1);
+///     mask.set(3);
+///     assert_eq!(mask.weight(), 2);
+///
+///     let mask2 = CpumaskBox::try_clone(&mask)?;
+///     assert_eq!(mask2.weight(), 2);
+///
+///     Ok(())
+/// }
+/// ```
+pub struct CpumaskBox {
+    #[cfg(CONFIG_CPUMASK_OFFSTACK)]
+    ptr: NonNull<Cpumask>,
+    #[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
+    mask: Cpumask,
+}
+
+impl CpumaskBox {
+    /// Creates an initialized instance of the [`CpumaskBox`].
+    pub fn new(_flags: Flags) -> Result<Self, AllocError> {
+        Ok(Self {
+            #[cfg(CONFIG_CPUMASK_OFFSTACK)]
+            ptr: {
+                let mut ptr: *mut bindings::cpumask = ptr::null_mut();
+
+                // SAFETY: Depending on the value of `_flags`, this call may sleep. Other than
+                // that, it is always safe to call this method.
+                //
+                // INVARIANT: The associated memory is freed when the `CpumaskBox` goes out of
+                // scope.
+                unsafe { bindings::zalloc_cpumask_var(&mut ptr, _flags.as_raw()) };
+                NonNull::new(ptr.cast()).ok_or(AllocError)?
+            },
+
+            #[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
+            // SAFETY: FFI type is valid to be zero-initialized.
+            //
+            // INVARIANT: The associated memory is freed when the `CpumaskBox` goes out of scope.
+            mask: unsafe { core::mem::zeroed() },
+        })
+    }
+
+    /// Creates an uninitialized instance of the [`CpumaskBox`].
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that the returned [`CpumaskBox`] is properly initialized before
+    /// getting used.
+    unsafe fn new_uninit(_flags: Flags) -> Result<Self, AllocError> {
+        Ok(Self {
+            #[cfg(CONFIG_CPUMASK_OFFSTACK)]
+            ptr: {
+                let mut ptr: *mut bindings::cpumask = ptr::null_mut();
+
+                // SAFETY: Depending on the value of `_flags`, this call may sleep. Other than
+                // that, it is always safe to call this method.
+                //
+                // INVARIANT: The associated memory is freed when the `CpumaskBox` goes out of
+                // scope.
+                unsafe { bindings::alloc_cpumask_var(&mut ptr, _flags.as_raw()) };
+                NonNull::new(ptr.cast()).ok_or(AllocError)?
+            },
+            #[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
+            // SAFETY: Guaranteed by the safety requirements of the function.
+            //
+            // INVARIANT: The associated memory is freed when the `CpumaskBox` goes out of scope.
+            mask: unsafe { MaybeUninit::uninit().assume_init() },
+        })
+    }
+
+    /// Creates a mutable reference to an existing `struct cpumask_var_t` pointer.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` is valid for writing and remains valid for the lifetime
+    /// of the returned reference.
+    pub unsafe fn from_raw_mut<'a>(ptr: *mut bindings::cpumask_var_t) -> &'a mut Self {
+        // SAFETY: Guaranteed by the safety requirements of the function.
+        //
+        // INVARIANT: The caller ensures that `ptr` is valid for writing and remains valid for the
+        // lifetime of the returned reference.
+        unsafe { &mut *ptr.cast() }
+    }
+
+    /// Creates a reference to an existing `struct cpumask_var_t` pointer.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` is valid for reading and remains valid for the lifetime
+    /// of the returned reference.
+    pub unsafe fn from_raw<'a>(ptr: *const bindings::cpumask_var_t) -> &'a Self {
+        // SAFETY: Guaranteed by the safety requirements of the function.
+        //
+        // INVARIANT: The caller ensures that `ptr` is valid for reading and remains valid for the
+        // lifetime of the returned reference.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Clones cpumask.
+    pub fn try_clone(cpumask: &Cpumask) -> Result<Self> {
+        // SAFETY: The returned cpumask_box is initialized right after this call.
+        let mut cpumask_box = unsafe { Self::new_uninit(GFP_KERNEL) }?;
+
+        cpumask.copy(&mut cpumask_box);
+        Ok(cpumask_box)
+    }
+}
+
+// Make [`CpumaskBox`] behave like a pointer to [`Cpumask`].
+impl Deref for CpumaskBox {
+    type Target = Cpumask;
+
+    #[cfg(CONFIG_CPUMASK_OFFSTACK)]
+    fn deref(&self) -> &Cpumask {
+        // SAFETY: The caller owns CpumaskBox, so it is safe to deref the cpumask.
+        unsafe { &*self.ptr.as_ptr() }
+    }
+
+    #[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
+    fn deref(&self) -> &Cpumask {
+        &self.mask
+    }
+}
+
+impl DerefMut for CpumaskBox {
+    #[cfg(CONFIG_CPUMASK_OFFSTACK)]
+    fn deref_mut(&mut self) -> &mut Cpumask {
+        // SAFETY: The caller owns CpumaskBox, so it is safe to deref the cpumask.
+        unsafe { self.ptr.as_mut() }
+    }
+
+    #[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
+    fn deref_mut(&mut self) -> &mut Cpumask {
+        &mut self.mask
+    }
+}
+
+impl Drop for CpumaskBox {
+    fn drop(&mut self) {
+        #[cfg(CONFIG_CPUMASK_OFFSTACK)]
+        // SAFETY: By the type invariant, `self.as_raw` is a valid argument to `free_cpumask_var`.
+        unsafe {
+            bindings::free_cpumask_var(self.as_raw())
+        };
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 398242f92a96..dbed774ea9f7 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -40,6 +40,7 @@
 pub mod block;
 #[doc(hidden)]
 pub mod build_assert;
+pub mod cpumask;
 pub mod cred;
 pub mod device;
 pub mod device_id;
-- 
2.31.1.272.g89b43f80a514

