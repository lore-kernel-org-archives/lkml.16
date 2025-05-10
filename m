Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9500A221FB6;
	Sat, 10 May 2025 09:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746869593; cv=none; b=aTu+UMUIUWkMu9QTDiTUsG736Tm8smoVNoTkuTh6X/5+EIo9R7s527p2dAKuagxvM57ontXK/t5eLcJClcqU3eoEL50VtzU33FZgD/Kz5ftL1y38HSXX7w02FPZjAGJVeOmQmquGpX5YhIm8tMErL+ToGhfu/I1jE7ESJEK39Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746869593; c=relaxed/simple;
	bh=5KT6o4PwmqhxLMTqeLgps9jLONAfkvBGP8fVPNwouPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gM277ML5xsK9RxQtTsARrCfRjbP9aC/Ny/ZEVqoye6xoPT/cVbTIIZxmJR7pgmJJ/K9V0GgFxeDFmUX8Eyoydf1NHWW7rW5OaDbKkAbQFYct4HyxAa4XY9YlhmKOwNUbWzGyKkAhXvOq/XNRahT4q/6rGczHdmMlwf5t43aAkK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bo1WgPTT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bo1WgPTT"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so17760875e9.1;
        Sat, 10 May 2025 02:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746869590; x=1747474390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJGae8ej3sDPBpz6YOCR1Ed8bJvIS2qRuUE9rFXc47Y=;
        b=bo1WgPTTgjfkAHja0j3jtJlyDv0Sy6TFrI6VZ7av5KP13zPI0yF8wN28L9vK+iCHUC
         SeZhZhzddt8qQI8P3tKaYhdmg/4UsdwR+pqWE1M11uPlSFHvm1v9U5BTH56bzlNtansY
         RDJR/ty3YDYwojFJsDA9ReaSHi7XwsjUXYn25jzeo+EGFOU/IKfWft6Ft0ElbasnEe3u
         M9EkLkk+vKt+pH1RodsSy5+MYDmGSfTRNqRWUWxATAjj4pITwDOclpxyfTbmgTEK9dZb
         kMErUP3bS41AHyupPCB8M1O2wzWhUKPD4IqeQJIpCoPES12WJIPKxeHa8CxB5n+xbIZo
         TNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746869590; x=1747474390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJGae8ej3sDPBpz6YOCR1Ed8bJvIS2qRuUE9rFXc47Y=;
        b=s82dkmaPym/GadLXL2rwG1G160hjnDgHrOrWYmB5zvMircGw0ZKCPbx1ScZYMQuMc2
         DX+ETRUrq9fCnXHXiUtoVxdjHore4huKgaNe7lG2nZaUVft3lcUUonhrJ5fhtyFVsqaw
         /6xDiwZJXu0dzoLkERJ2f4DsQ1OXDNlWO5OQsZ6Sh51La3yBricZzKJgiLEJ/HwqUNQc
         JSkkR7hKgRjjs3Fj2L1tLlh8bgz6p/ax+GJg2U2CYYuUmJwAnujGA3n1I+qTvMvZkhXi
         JLe547yrlEXrnHUMUo0oXegP6Tf2+tFfOTHJLOvkQ0omKv/6S8dGwl2PTKb3zho5BDry
         Acow==
X-Forwarded-Encrypted: i=1; AJvYcCXFytgBhGUlmB41YDdzz96jVAboqwLyHTiE4oYCIo2YEqdhbjArL0QaeN4L8XseKRZEjx0r5QF1TzwyP4W7/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHwo7ZXlHGBPGqeEl92LipdEjtlN6iTwHaELY+zJjGK9no2ZVZ
	O2f/uASXvCKWw8O1yuJszgHOd3gFiv1jkAchIVjM0/hQtMNYIKdb
X-Gm-Gg: ASbGncuBRfz916EZHqqF1Eqy3h+FdaMRa5iLsBW9J9Yr2CqIoCHWNSV74uN7YL+2kei
	1I4bdbcDNE7K3vmyqPAbQ3EMwDLyfAi/GQB2HIphfYw8eO8A+mndK/s8motmuo92hIKhpw0TCRc
	QvQ/GIt0HG6+qcB1fAh4rAjfkS0sqdToojtq1vXo8mFE5QA8wMqYUyIh+krcXG9yAo1ySySexeD
	WS2XQcyzUMcKjfIEWfOH4Rj3rNK68kU7SerEnJE1Vb60GeaKlDRFJPQndOQ36dfpPLvc28zhfhl
	0IQTltKsTc7dnBqARzgi6PGzlrKvOOxSPday6J8=
X-Google-Smtp-Source: AGHT+IEg1/H0El+/s/3aWcVhdWbxHVw1Udl2ugtERSi/35TGMzTQrvSKRwgi4Tre6zdrnfZXi4TQfw==
X-Received: by 2002:a05:600c:1808:b0:43b:bb72:1dce with SMTP id 5b1f17b1804b1-442d02ca7c1mr59656315e9.5.1746869589503;
        Sat, 10 May 2025 02:33:09 -0700 (PDT)
Received: from [10.0.1.56] ([2001:871:22a:99c5::1ad1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddde0sm5981485f8f.14.2025.05.10.02.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 02:33:08 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Sat, 10 May 2025 11:32:28 +0200
Subject: [PATCH v3 3/3] rust: use `UnsafePinned` in the implementation of
 `Opaque`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250510-rust_unsafe_pinned-v3-3-57ce151123f9@gmail.com>
References: <20250510-rust_unsafe_pinned-v3-0-57ce151123f9@gmail.com>
In-Reply-To: <20250510-rust_unsafe_pinned-v3-0-57ce151123f9@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746869583; l=3832;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=5KT6o4PwmqhxLMTqeLgps9jLONAfkvBGP8fVPNwouPw=;
 b=O03eBIbL5UUfDLmO9G++7mRpLilPiCWENfC0kOwkiOjTKRhiusfaGwbDVpzcN4yCA+XK63cSI
 6waJnMQBqL6CNpcpcyvssiNEEshP/3aq9BK08G2EIxEd2wy72t89ycA
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

