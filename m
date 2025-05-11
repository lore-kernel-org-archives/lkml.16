Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFBD25F97A;
	Sun, 11 May 2025 18:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746987719; cv=none; b=juV81RrpwsocDqm8R/Wh4ZqxmWCDFco6BZcd//FXOGWi09n5cAu2hcktI8CbEu//3HHxfb0iVBisvkIXUuZmTPSO+qUz5zaz1wL0mUGbvNXLOhRYCQUWSGDZj+USLqyj2KrrHZNxLkd4wnrCYM1MQ0GHPHl/l4uPWD5buUQ4Oao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746987719; c=relaxed/simple;
	bh=5KT6o4PwmqhxLMTqeLgps9jLONAfkvBGP8fVPNwouPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sWmfymmrv49D3T2xKyXtavri03lNvwPOAll6IkvewSy+kofDvOY83ZeYkBuR29qK3ErXZ4ogmErAjs/0oaOksIRDvJRPRrbTgXcm6JielLZ02Q5bJIJhetPAtygDSJHWv+MWpTUpv+aCMTriHB1IQotU2pxc72R3NEz5HHspffg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DC4zDPNs; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DC4zDPNs"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so16868885e9.1;
        Sun, 11 May 2025 11:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746987716; x=1747592516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJGae8ej3sDPBpz6YOCR1Ed8bJvIS2qRuUE9rFXc47Y=;
        b=DC4zDPNs/s/mAP87v97F6fmhqHD60xmKHKgxzoi2t4RmrdsDHKlHUVdNsz5bX/sEc8
         Z2qIjCwGeB/KIW+hYBUG09Qa3Kze0yqGMc7uAmEmqedS1PsHLDpgAk1DVHWzbaAQyKa+
         Polk1AgwlPd1hUdjmGhv2Svhw9SemY17cajfOhg3nLII/Qv9kiYD3gjFMpXy+BSevBhW
         N1Gy5jviL/t70BtlSp7JwIzT6VbLL/c6gjGnFNenJUHgJiyWHtOqhFGs0Mr0d5IR6iVr
         2ADZaYa/nqJWjzNnRzZ8OtBmO405FucfOIWvZTnSNCzoQykiPaQHv22xxcjc6OdSHL0q
         4/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746987716; x=1747592516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJGae8ej3sDPBpz6YOCR1Ed8bJvIS2qRuUE9rFXc47Y=;
        b=cTd2ARjzZFVzOVfBT08Qyn27j5dCJi6sNRs+qHqA6AsW1nAYcCopROk4nJHTZEpV+o
         /X9qHgZa3ZLxHDY/WiG1X1Amjz2OEKl9c8xShLl53xokhdRQm3yQlFn6NtP4AVUKvTsR
         1IG4BmDloWquyegWMWH2y1TIsr6L0OH8HnHriVUrh5/s5BxBGdyqzkr8PweTtxN/v4Rr
         b0SG+rTxUn1fhHU7ote7ZGcKnqcAYiL++ybwR5zoxBrFsf66gHdXgFB0YFbfHMxcGzWP
         DwzSF9MnrPruF2qsYMz2bweW8ZbB1ckZChMzJvj5UjAJoum9VI5sxXA6hA8e2D6jdwRY
         OYDA==
X-Forwarded-Encrypted: i=1; AJvYcCUs94EFfnvIb1W+SI8fZ389Q7bPE4YBJQh5e7ADNJZK5gzlbbO7+Ncck08o9mEKbYqwjaXaygB2DJXAEh5ulw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEJ4StYwgJGYdt8BhwmSykFHTJj77Uc5pJ7dbEiPaikFfZCtGA
	O5rEQyDQt3p0j8wENLwdiHcbxgeU7GO9TBiXtf9HkrBOi3J20ki1
X-Gm-Gg: ASbGnctwGyzwo+86Qd7YSbieLbPOqj/d+gaRLidLTby66vur4jfnm76mSMOAKf+TNTp
	pABKhcK4xTNmI/HS41s030OCG+SnNE1PHqfHeZyxB9xphoE9rWEwGNadhGTAd++SKqdcSjeUyij
	lt3Iha9x7/OZ0aB8FAvviPNAwfhf5vG2w9F23NdNJU3SRxIw0D7ZbP+s6KeEe4YvqPmCndt0NyA
	SW09rp9iT1rL+CDTA55Q8kHMWefB2v/MFDycj6D/erysEpEeu774LBvyT9e0hTmJW7tXp5zZXyx
	vVG+lVLHnRy15ITZFjuEIXI2tSkx1RdwqHe3Wbq895LodDaVbA==
X-Google-Smtp-Source: AGHT+IGBoxlvzaPApRkL7T3N31oDhgngmd2RjXxOhYwOHe2lszSJdIdNonaizWEVQD1usNSLeu057A==
X-Received: by 2002:a05:600c:6095:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-442d6c3a186mr103848115e9.0.1746987715563;
        Sun, 11 May 2025 11:21:55 -0700 (PDT)
Received: from [10.0.1.56] ([2001:871:22a:99c5::1ad1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442d67d5c7bsm100418495e9.4.2025.05.11.11.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 11:21:55 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Sun, 11 May 2025 20:21:40 +0200
Subject: [PATCH v4 3/3] rust: use `UnsafePinned` in the implementation of
 `Opaque`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250511-rust_unsafe_pinned-v4-3-a86c32e47e3d@gmail.com>
References: <20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com>
In-Reply-To: <20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com>
To: Sky <sky@sky9.dev>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 =?utf-8?q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 llvm@lists.linux.dev, Christian Schrefl <chrisi.schrefl@gmail.com>, 
 Benno Lossin <lossin@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746987711; l=3832;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=5KT6o4PwmqhxLMTqeLgps9jLONAfkvBGP8fVPNwouPw=;
 b=6DGEo06Gy8SeTNomTbvBz9mPO1ZJQ5zJq9ikIniy/ZM3/jsHbTpA8LvsMkyK1iRXrGw6kfpy1
 +09e2BHcPDBArwvHC3PP8xtc4+PtGIEnI8chobLj75cwhXJsxkhvEoz
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

Make the semantics of the `Opaque` implementation clearer and prepare
for the switch to the upstream rust `UnsafePinned` type in the future.

`Opaque` still uses `UnsafeCell` even though the kernel implementation
of `UnsafePinned` already includes it, since the current upstream
version does not.

Reviewed-by: Gerald Wisböck <gerald.wisboeck@feather.ink>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
 rust/kernel/types.rs | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index f06e8720e012102e5c41e79fd97b0607e927d71c..e32905c42453132fbea49d37a6457547d42465ce 100644
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
@@ -308,8 +308,10 @@ fn drop(&mut self) {
 /// ```
 #[repr(transparent)]
 pub struct Opaque<T> {
-    value: UnsafeCell<MaybeUninit<T>>,
-    _pin: PhantomPinned,
+    // The kernel implementation of `UnsafePinned` uses `UnsafeCell` internally, but the
+    // upstream rust `UnsafePinned` will not. So to make sure this is compatible with
+    // the upstream version use `UnsafeCell` here.
+    value: UnsafePinned<UnsafeCell<MaybeUninit<T>>>,
 }
 
 // SAFETY: `Opaque<T>` allows the inner value to be any bit pattern, including all zeros.
@@ -319,16 +321,14 @@ impl<T> Opaque<T> {
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
 
@@ -371,7 +371,7 @@ pub fn try_ffi_init<E>(
 
     /// Returns a raw pointer to the opaque data.
     pub const fn get(&self) -> *mut T {
-        UnsafeCell::get(&self.value).cast::<T>()
+        UnsafeCell::raw_get(self.value.get()).cast::<T>()
     }
 
     /// Gets the value behind `this`.
@@ -384,14 +384,12 @@ pub const fn raw_get(this: *const Self) -> *mut T {
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

