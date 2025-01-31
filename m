Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9818A1DE4E5;
	Fri, 31 Jan 2025 15:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738336105; cv=none; b=PZPuOmKE9fYNIwhn8LjvJ1exAlUP4/Ak6zPNoxzij9gbfvb4jgcHLb9tEk4VbFzhH60lbrZsS/QM6CpGN/K4jvcjIH9tK/hnbCDHrMpbCq2ZWsZ4r7+2jcIYMjhrCWO27GvVsGw8Xuz4dh6KHwUcnKfTeY2ZdRBD0fuwvaITlzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738336105; c=relaxed/simple;
	bh=xAEnZ7bRI9MGSFtBwP1gsbkfBflvSwAiHaQcFi+NBGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L9jVrLhS8phDXSxGGpo4geODNRM31SAbnGJB+X1Pb4XsQHy5xkRW2KzzKzqDMYaNnNg/RFN4ZopZCdWmfEZrcC+g6CA1KjdfymPESU6i4akQM0NSiFt8rHevxndtQ+sQ6hjTramLx5hCW17K2eUuBGRwkOSf7at0CYZ5pVSDgpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NP4e+llJ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NP4e+llJ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so1323485f8f.0;
        Fri, 31 Jan 2025 07:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738336102; x=1738940902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ab7bqlgvZTUAqANn/N2gtXKKfdu+ZO1ULo5xsqJxgDo=;
        b=NP4e+llJDdxAoojlKGfWkyQR4xm/iTHpVWxMs4dTVehopkf1gSKRiViXmHWuA2doB/
         kHFK5QCaDBWVf5/qSL09xH7+4poRiT9PHf89dqN6jXQwbisiNCqDscSWZ89jGs/VE8cy
         2PtfN1cMSTgt339cq5Bg6LyZX2VE100sQLlZYl0Tn09E2pfbNGL/T/lCqL8FrI7DlERY
         CVP+aRY8C/VxXbJsbkJrzleqvdDI/v9fW8DNEYddpJ2dE/lKNf0Mhn9Yb0NIoQvA054d
         JjtFbxuKOuMyldXxt+2djXnpTXQ3YtiJ9hS+1iOEJ7AiQmjNWbqTEl0+y+g3kVzIbtAp
         v5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738336102; x=1738940902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ab7bqlgvZTUAqANn/N2gtXKKfdu+ZO1ULo5xsqJxgDo=;
        b=TrEr6sKNw34R5rg1io6rUZ0JUEMMKCNMxiKXu/FPEBB78WXLpG96q1I7ZPk8r6yMCs
         sB3W5OIvBtObSI/hJKdD5Tebs96bTdygaBDIjKxfq7+LivKnkG8kY0oHL0QZU1w0U2yL
         xmePyRuSoaos1M/6Edl9PZPtSxjS/tCjLY8A85e53JHI/LYc30/RNxQ4MlWJYh22Eh+v
         p7BhCHHwdrVfazK8QOMInRGD8djmaKYhtdBuNsMUZlQ4gbaVP3uP8wKkhSt4vbFmjzL+
         gASeCfQnOosHo3rAaclQW7tHKXHQ1uyi2j3+2VW6XKYTiFQAPWZuOe6LKNpZSUnhPsis
         5rig==
X-Forwarded-Encrypted: i=1; AJvYcCWt/JBwpMxXH/T6/CVvfDFTUe6l4CisRDn4GEPKoYJ1t9COgKWFZoXN2ouoLH2T4+G8MjamA4ql5JXc8sk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfAf1U2wMYXiw1I/uqycNkxw8MWmr2q605Ge/BLdDp5Hw3vSrP
	GAtK5nRBLs/Bt5Tv5lhAg0c419ec0gR1SGBbu0ISCq7kbFjmIi6N
X-Gm-Gg: ASbGncuffxYX6SBC6oUl1J082fxmBhxMbkF0cK0NGHmFAFRIJAuexu6SWf/N61w7QWy
	n5Z96s7wiVylHvrGF8KidB7TSQ2CkCEHD9uQllnCr27+vgF9HYWJIJh+Sa20q+xlBJDhjrimJfT
	TJJBETbOohQTjfKi+BYN6WVP7yIjU3evgEil4D6FyOqL59266t5qJZpoF4WHlNNLU/wASsyumpH
	qycnzhpJAhxrhCGxSVYmk17yu+noPeZ+N4E6lsuCJdIRCxhoVJ43Cq7waEgE0GuPLvlp3R+OxMr
	SCc=
X-Google-Smtp-Source: AGHT+IFotVDiuS2up/NlNR0JeqrFZgLgx8MbTOaY+Dudjm7fdZ37KqMNvT/Ckhixcp4Uc/6SUEsldA==
X-Received: by 2002:a05:6000:402b:b0:38b:ee9f:52d5 with SMTP id ffacd0b85a97d-38c5a98e04cmr6319044f8f.16.1738336099844;
        Fri, 31 Jan 2025 07:08:19 -0800 (PST)
Received: from [10.0.1.56] ([2001:871:22a:8634::1ad1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38c5c102f7dsm4961479f8f.30.2025.01.31.07.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 07:08:19 -0800 (PST)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Fri, 31 Jan 2025 16:08:14 +0100
Subject: [PATCH v2 1/3] rust: add UnsafePinned type
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-b4-rust_miscdevice_registrationdata-v2-1-588f1e6cfabe@gmail.com>
References: <20250131-b4-rust_miscdevice_registrationdata-v2-0-588f1e6cfabe@gmail.com>
In-Reply-To: <20250131-b4-rust_miscdevice_registrationdata-v2-0-588f1e6cfabe@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christian Schrefl <chrisi.schrefl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738336097; l=4162;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=xAEnZ7bRI9MGSFtBwP1gsbkfBflvSwAiHaQcFi+NBGQ=;
 b=Rkq/fWnyxtYXZ31MhfCDDBxW5arPynA9KvgMg5+SGYc69NO6bL/XnYqxOrQxgxSFQlRKw35UT
 nm4do8Rxx17Cvyg2ExeTU9iGDcsaEMPCka5Z54JiybJpJN4vlOEf4zP
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

`UnsafePinned<T>` is useful for cases where a value might be shared with C
code but not directly used by it. In particular this is added for
additional data in the `MiscDeviceRegistration` which will be shared
between `fops->open` and the containing struct.

Similar to `Opaque` but guarantees that the value is always initialized
and that the inner value is dropped when `UnsafePinned` is dropped.

This was originally proposed for the IRQ abstractions [0] and is also
useful for other where the inner data may be aliased, but is always valid
and automatic `Drop` is desired.

Link: https://lore.kernel.org/rust-for-linux/CAH5fLgiOASgjoYKFz6kWwzLaH07DqP2ph+3YyCDh2+gYqGpABA@mail.gmail.com [0]
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
 rust/kernel/types.rs | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 2bbaab83b9d65da667a07e85b3c89c7fa881b53c..3c2f6ac62d161f1187b5e7ade86689eec667ff4d 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -253,6 +253,9 @@ fn drop(&mut self) {
 ///
 /// `Opaque<T>` is meant to be used with FFI objects that are never interpreted by Rust code.
 ///
+/// In cases where the contained data is only used by Rust, is not allowed to be
+/// uninitialized and automatic [`Drop`] is desired [`UnsafePinned`] should be used instead.
+///
 /// It is used to wrap structs from the C side, like for example `Opaque<bindings::mutex>`.
 /// It gets rid of all the usual assumptions that Rust has for a value:
 ///
@@ -573,3 +576,57 @@ pub enum Either<L, R> {
 /// [`NotThreadSafe`]: type@NotThreadSafe
 #[allow(non_upper_case_globals)]
 pub const NotThreadSafe: NotThreadSafe = PhantomData;
+
+/// Stores a value that may be used from multiple mutable pointers.
+///
+/// `UnsafePinned` gets rid of some of the usual assumptions that Rust has for a value:
+/// - The value is allowed to be mutated, when a `&UnsafePinned<T>` exists on the Rust side.
+/// - No uniqueness for mutable references: it is fine to have multiple `&mut UnsafePinned<T>`
+///   point to the same value.
+///
+/// To avoid the ability to use [`core::mem::swap`] this still needs to be used through a
+/// [`core::pin::Pin`] reference.
+///
+/// This is useful for cases where a value might be shared with C code
+/// but not interpreted by it or in cases where it can not always be guaranteed that the
+/// references are unique.
+///
+/// This is similar to [`Opaque<T>`] but is guaranteed to always contain valid data and will
+/// call the [`Drop`] implementation of `T` when dropped.
+#[repr(transparent)]
+pub struct UnsafePinned<T> {
+    value: UnsafeCell<T>,
+    _pin: PhantomPinned,
+}
+
+impl<T> UnsafePinned<T> {
+    /// Creates a new [`UnsafePinned`] value.
+    pub const fn new(value: T) -> Self {
+        Self {
+            value: UnsafeCell::new(value),
+            _pin: PhantomPinned,
+        }
+    }
+
+    /// Create an [`UnsafePinned`] pin-initializer from the given pin-initializer.
+    pub fn try_pin_init<E>(value: impl PinInit<T, E>) -> impl PinInit<Self, E> {
+        // SAFETY:
+        //   - In case of an error in `value` the error is returned, otherwise `slot` is fully
+        //     initialized, since `self.value` is initialized and `_pin` is a zero sized type.
+        //   - The `Pin` invariants of `self.value` are upheld, since no moving occurs.
+        unsafe { init::pin_init_from_closure(move |slot| value.__pinned_init(Self::raw_get(slot))) }
+    }
+
+    /// Returns a raw pointer to the contained data.
+    pub const fn get(&self) -> *mut T {
+        UnsafeCell::get(&self.value).cast::<T>()
+    }
+
+    /// Gets the value behind `this`.
+    ///
+    /// This function is useful to get access to the value without creating intermediate
+    /// references.
+    pub const fn raw_get(this: *const Self) -> *mut T {
+        UnsafeCell::raw_get(this.cast::<UnsafeCell<MaybeUninit<T>>>()).cast::<T>()
+    }
+}

-- 
2.48.1

