Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D20216E23;
	Wed, 30 Apr 2025 08:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002204; cv=none; b=foUkN5B4Bf0B7SQqvrjy8ZzxLTdEqFM2RBn1TMof2nabKQkP85+MNfYgjxJQ68vx76gzN2hFxwASajtTU4n8fw6iMwxMXT0qoqPsRLpdqVMsserY3I4CbAl0ydigyxq/ZcHouaBRIN4bfrw8PdaqkXdcinATikRm4kZNVrLvkKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002204; c=relaxed/simple;
	bh=xahLNgygqJTiJVigFRn+IzsVCeHFMXE9X3Pdq7CmgYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DgVsEDWdPsPg7JduHd/B8O5UZD66PNC39Au0c8bx4+0hoUP4INfC9tKtZg/k2v2zzoorT0Zj2WwZO+sDkloDjBb1MFGChWbx1iaK8sms/m6ZHaNHizkjTeA4jsvLOTtogPhsxFFQpx/MrYBBCNHa47cssM/St0F3Wg0i20T+jlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYF1Roky; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYF1Roky"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso1971785a12.3;
        Wed, 30 Apr 2025 01:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746002201; x=1746607001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9uCVKDq6jp9oxx83/rvCXFQf3N8D+OHF8dGA1W5v+/w=;
        b=SYF1RokyzAhUNOH4SUyHtAL7naSqCNvt3UhaKtuT7XwVALz+FcdwQhP8bxPLpMRk8C
         MzOInrV9s7FdxvwJsHpnFv8gQ0G43Y+0ePjMc1wc4bekS7hnYTu8vVYw6cvUS41OrFCj
         nBdLXU6EkUsWMbIfwVqF5k3c2wDOzCM8fBw7gne0ol5fWc8BwfpDzUTkwrFQCykwNXwC
         +KEMMSQe/K6bctm0KZuLg0DOsHd3N9EzDuMx+mZnRp5QVzIRsAi+Kbcvn1lmkfAG7iFp
         7EkR5qlbcJzxwUYVDJK+SRCJ+8DT+KaxcjnzFBDVhe913/JgGl93ZU9jA0Jo6JVDMKHY
         sCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746002201; x=1746607001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uCVKDq6jp9oxx83/rvCXFQf3N8D+OHF8dGA1W5v+/w=;
        b=QPAUu/Geip76CgK311ktuMAKOUmNWB3PiNlULuHbvHdvVw8Y8tLMxvtR1dP89+77BT
         99pK+SbYbI2S2S4rLubdsG58KFDz0HncGeH8Me923UVn9YCpI/V/m0S3QA0HhwO0NyTU
         SSdbePwtSPkXpg3XCmeoNDfEK/NZbCgC+HhR4x7HEz+DujHd3tDPD9kthQyBpeUCLAbJ
         1GBM6RzgJfGrxLrt6FVWiJ2LD4iJGthLOjLNDCYY3wjhHkUDGJJ5eRmfPJ1xxR0/qaxv
         sqrYp6XrceG+pWsB5XHiUmmoQ0zzGt+NWH5MUzXQ+xi+Q7CE3gXSLYwOmUlhEMap4o9X
         lFuw==
X-Forwarded-Encrypted: i=1; AJvYcCU3Xe8hklhu7YuwKOVqzYSW4IbOtxAHVi7gFYlDtd9P553+I1873+aUpF5j7tndY09dSsDms47WfJ3brcyF/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7v2hsQB959p2FwidaQW+QpKz7GuWLVyuwm4FUJ/ifvsvBhLpW
	KlhKpPs8Ea/f6RwBEfL0luJ7s96MD8384SYZqbMIL6z/CSSWiWnZydmDxKm2Q6U=
X-Gm-Gg: ASbGncv543J3xKq5yRsz5hE1jPUAmKmZPZtvce9i3FNEWUOAK5dnHXt93XqQnyb54Bg
	LmULy6UPLNfPhTfaxCndsdfWldDWhhJS6udgRkPnn5lqg4DQIJBjhdQAHftfDq/B/RIHJMj34vt
	GBIGTMAPzihcxwXRyjRUX0jz2HKPljZbFkdtLeQbGyN6uq1yr0/sf4TD0GULI/a8AD07PIto3bC
	YyIE9b9KggWEkFkKjlOzZLMfl4uoJMP6cVpUoU6Fu/IgnHU5MrQRLJ2nR/uFVTbFl8mYq4kdjrD
	0/ncHnsEJTy62tar2pjGuNl9zIoCNo2sXCfdjOtPaMagMxsU03LDBwsJ4ZBikOU=
X-Google-Smtp-Source: AGHT+IHgdUyDb7Npa79GgVeGUIa/uULKZUeqZatBXuTZuum3H0JpJVQL0VyV11HYP9jjk1dqKdMIWw==
X-Received: by 2002:a05:6402:e86:b0:5ec:cc90:b126 with SMTP id 4fb4d7f45d1cf-5f89b557d7cmr1445950a12.19.1746002200393;
        Wed, 30 Apr 2025 01:36:40 -0700 (PDT)
Received: from [10.27.99.142] ([193.170.124.198])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f6424sm8653721a12.42.2025.04.30.01.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:36:40 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Wed, 30 Apr 2025 10:36:13 +0200
Subject: [PATCH v2 3/3] rust: use `UnsafePinned` in the implementation of
 `Opaque`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250430-rust_unsafe_pinned-v2-3-fc8617a74024@gmail.com>
References: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com>
In-Reply-To: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com>
To: Sky <sky@sky9.dev>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 =?utf-8?q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Christian Schrefl <chrisi.schrefl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746002196; l=3515;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=xahLNgygqJTiJVigFRn+IzsVCeHFMXE9X3Pdq7CmgYs=;
 b=z/maNiGs7sluI5WE1/LfJTpFFqrItwR11ffc9FYjYlnWtq7VLtet30b3QsHpDF2dVZ7W6feOI
 3AJ8IIbOy7JD4KILoLpybmZSgsdBzXT4ApukNgph1GYq8we20VS4zWV
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

This change makes the semantics of the `Opaque` implementation
clearer and prepares for the switch to the upstream rust UnsafePinned`
type in the future.

`Opaque` still uses `UnsafeCell` even though the kernel implementation
of `UnsafePinned` already includes it, since the current upstream
version does not.

Reviewed-by: Gerald Wisböck <gerald.wisboeck@feather.ink>
Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
 rust/kernel/types.rs | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index f06e8720e012102e5c41e79fd97b0607e927d71c..44d96423a8a6c358bb7ebf12c24fad98e5c2cb61 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -4,12 +4,12 @@
 
 use core::{
     cell::UnsafeCell,
-    marker::{PhantomData, PhantomPinned},
+    marker::PhantomData,
     mem::{ManuallyDrop, MaybeUninit},
     ops::{Deref, DerefMut},
     ptr::NonNull,
 };
-use pin_init::{PinInit, Wrapper, Zeroable};
+use pin_init::{cast_pin_init, PinInit, Wrapper, Zeroable};
 
 /// Used to transfer ownership to and from foreign (non-Rust) languages.
 ///
@@ -308,8 +308,7 @@ fn drop(&mut self) {
 /// ```
 #[repr(transparent)]
 pub struct Opaque<T> {
-    value: UnsafeCell<MaybeUninit<T>>,
-    _pin: PhantomPinned,
+    value: UnsafePinned<UnsafeCell<MaybeUninit<T>>>,
 }
 
 // SAFETY: `Opaque<T>` allows the inner value to be any bit pattern, including all zeros.
@@ -319,16 +318,14 @@ impl<T> Opaque<T> {
     /// Creates a new opaque value.
     pub const fn new(value: T) -> Self {
         Self {
-            value: UnsafeCell::new(MaybeUninit::new(value)),
-            _pin: PhantomPinned,
+            value: UnsafePinned::new(UnsafeCell::new(MaybeUninit::new(value))),
         }
     }
 
     /// Creates an uninitialised value.
     pub const fn uninit() -> Self {
         Self {
-            value: UnsafeCell::new(MaybeUninit::uninit()),
-            _pin: PhantomPinned,
+            value: UnsafePinned::new(UnsafeCell::new(MaybeUninit::uninit())),
         }
     }
 
@@ -371,7 +368,7 @@ pub fn try_ffi_init<E>(
 
     /// Returns a raw pointer to the opaque data.
     pub const fn get(&self) -> *mut T {
-        UnsafeCell::get(&self.value).cast::<T>()
+        UnsafeCell::raw_get(self.value.get()).cast::<T>()
     }
 
     /// Gets the value behind `this`.
@@ -384,14 +381,12 @@ pub const fn raw_get(this: *const Self) -> *mut T {
 }
 impl<T> Wrapper<T> for Opaque<T> {
     /// Create an opaque pin-initializer from the given pin-initializer.
-    fn pin_init<E>(slot: impl PinInit<T, E>) -> impl PinInit<Self, E> {
-        Self::try_ffi_init(|ptr: *mut T| {
-            // SAFETY:
-            //   - `ptr` is a valid pointer to uninitialized memory,
-            //   - `slot` is not accessed on error; the call is infallible,
-            //   - `slot` is pinned in memory.
-            unsafe { PinInit::<T, E>::__pinned_init(slot, ptr) }
-        })
+    fn pin_init<E>(value_init: impl PinInit<T, E>) -> impl PinInit<Self, E> {
+        let value_init =
+            UnsafePinned::pin_init(UnsafeCell::pin_init(MaybeUninit::pin_init(value_init)));
+        // SAFETY: `Opaque<T>` is a `repr(transparent)` wrapper around
+        // `UnsafePinned<UnsafeCell<MabeUninit<T>>>` so the memory representation is compatible.
+        unsafe { cast_pin_init(value_init) }
     }
 }
 

-- 
2.49.0

