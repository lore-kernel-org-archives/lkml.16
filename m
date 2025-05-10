Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5064D22171A;
	Sat, 10 May 2025 09:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746869591; cv=none; b=RMibqremqdHlLQpqtVH38LLEo1jW98qis/H5w2nLqZsd1eZjRwYv5BznMSPDat+npYwaeW+z8I8KUwmtUs6XlPHlP6O93o7IZcxr7S/LK5bMt1sZaZwlHaeQY+hKFRv1+iEOTXdTjJJbBzQaGOIlFo1MhYImj7yo5my9yskphVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746869591; c=relaxed/simple;
	bh=dWjiyob69G2GucTul/lsXlGpP89mKJGQ4P8+IWoJ7pA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IpqKIPQCb2Q0KeeFqdFQk+nP8qolfe3nj5scFeHNhj/+6hbxEx0UBxvSCoAhood7WUNbk358D+BcHqt1xYG++JCSbJ4vcp6weFEBkJauilvEtytrJ61HJbLPyImV2/3oKJwHXeYozwjrjYdBF6GhcFfCqzgBERRwRhrNvpuADj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfGkughh; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfGkughh"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a1b8e8b2b2so1284743f8f.2;
        Sat, 10 May 2025 02:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746869587; x=1747474387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SOE7sdT8D61vDqGwsVaxjwgujETa56pyZ4FYk1rPCD4=;
        b=gfGkughhRDp9XEwHhvE+jqkq90PrO7ZGIzuYUNKI4lYgaRpcjTE6mgnivB/CrG1+mF
         bLCdXrha99z03ztNIEe4ovu+HBgBeKPiNyw3qBTAYo7ueEgYTO6+THq7Q1ZTbsF1PjnV
         mJCtU+bCR6qZLiJ5eVzdwi0xf/W4lRTb7ROOSHaEHMML1NA20JM4RSgMdSa6zP+MfWZc
         /zP4GLSyGcbqhExQqA30YjFy7bD+3zQMXPzjjMZy/AkOPzAz3acMEZOHfMKOpq8bf04+
         wGane6K5zgN+6be+wOE+32iA+f6hNSJ4f1qsXrXZmpwyjggNA10Z9BlYa+y+BzvP4uey
         GyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746869587; x=1747474387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOE7sdT8D61vDqGwsVaxjwgujETa56pyZ4FYk1rPCD4=;
        b=KlTPax8uR2vdLTiGvMneNZFNru2sLAUq/iPZvPG6KJ6JFnOl8rbpxAQPK07yxnisFt
         PuxU6FyiCs1lTkpWlgEy5y0nuYVpARZvuJixZ8UpBdfnmBdvu0HOUqNetRmPp1CofvSq
         XIBnmtWu/Gn9At2oWIz7JubH6kySqtFkkY7iXgB6iCejVoe4BKBdgJMhJgdFNjHeJkMQ
         DwJuThC9cN2Xu0NCuDwLdvOdOtLLjazXWhmUcJZ2UF12EYg34/StJWEvjXgoFJwtdpQx
         fxSWcaBug/Da9359ZrAuFIPhvU5Krxb8bixCKKVWBHcS0lgOAagxfvqueLrfIZkAWSWo
         9jQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNn46HKBaZQFqrVJRUKB1A4Yy8IFFdDFxkRNFiMcz3Kg4roTbi1BRWJt+uoimdKCritK4h/QY6FigtAjk7ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLTJAzU35q6BScfyPk68BCQAX/A0582OWh6gbDlbdB/5vBJ1mx
	K3vLOZjOwwCYd52QgmpKdCd7J3/hyIcxFnjXbVcn01vP3QltDIzPWMhWY3fH
X-Gm-Gg: ASbGncsOklf8Ezk+9c1wD5QHMrdixs+Pb2F2du+RS29HYWmfIyQplYJEASmVpzpdLHP
	g6a5d9BC3cuhe5YQy8ck8hY9RecPGUdVCUougp95m9Ze2OCtbXzGUCG1uknQxI5lg4yMc/vusQX
	oR8w3+LYh3TXMqPJHLRlZe1VXgPL1QET0ItD4/Rw75/otvy9wFOX1nWEzaC7zY9blPXtRryaHw4
	sfsWjSzXjG/Fx4lVs4fXA+WQ57kTEB1rmUaAoSZznO4uYSgY92/8cZGz0ljj6+R5xEpekNkDHBN
	lAJkiu8u+LZ/HS23tbpAmQ1FTQvvxPP2yLLFmG8=
X-Google-Smtp-Source: AGHT+IFVbblIDN2ouLSx9sgtkfmF6TDVCexrpp5Doe3paIz95KUyn+eXRyz6dYaHj9TZC+ejqCcpgg==
X-Received: by 2002:a05:6000:401e:b0:3a0:aee0:c647 with SMTP id ffacd0b85a97d-3a1f64374e1mr5493421f8f.17.1746869586609;
        Sat, 10 May 2025 02:33:06 -0700 (PDT)
Received: from [10.0.1.56] ([2001:871:22a:99c5::1ad1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddde0sm5981485f8f.14.2025.05.10.02.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 02:33:06 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Sat, 10 May 2025 11:32:26 +0200
Subject: [PATCH v3 1/3] rust: add UnsafePinned type
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250510-rust_unsafe_pinned-v3-1-57ce151123f9@gmail.com>
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
 llvm@lists.linux.dev, Christian Schrefl <chrisi.schrefl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746869583; l=8523;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=dWjiyob69G2GucTul/lsXlGpP89mKJGQ4P8+IWoJ7pA=;
 b=qz6jwCq5QCTjxafiO7g3wJAMoBTTNDpYvHhtgDrKF8imb7cwNHmpLvQ6G4jXPxK2xqz+C6zf/
 cgmCZYY7ltoAhopI0I0sjxOMih2ndKndO8ovfWHIXrlA7XwFUdnc4qu
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

`UnsafePinned<T>` is useful for cases where a value might be shared with
C code but not directly used by it. In particular this is added for
storing additional data in the `MiscDeviceRegistration` which will be
shared between `fops->open` and the containing struct.

Similar to `Opaque` but guarantees that the value is always initialized
and that the inner value is dropped when `UnsafePinned` is dropped.

This was originally proposed for the IRQ abstractions [0] and is also
useful for other where the inner data may be aliased, but is always
valid and automatic `Drop` is desired.

Since then the `UnsafePinned` type was added to upstream Rust [1] by Sky
as a unstable feature, therefore this patch implements the subset of the
upstream API for the `UnsafePinned` type required for additional data in
`MiscDeviceRegistration` and in the implementation of the `Opaque` type.

Some differences to the upstream type definition are required in the
kernel implementation, because upstream type uses some compiler changes
to opt out of certain optimizations, this is documented in the
documentation and a comment on the `UnsafePinned` type.

The documentation on is based on the upstream rust documentation with
minor modifications for the kernel implementation.

Link: https://lore.kernel.org/rust-for-linux/CAH5fLgiOASgjoYKFz6kWwzLaH07DqP2ph+3YyCDh2+gYqGpABA@mail.gmail.com [0]
Link: https://github.com/rust-lang/rust/pull/137043 [1]
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gerald Wisböck <gerald.wisboeck@feather.ink>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Co-developed-by: Sky <sky@sky9.dev>
Signed-off-by: Sky <sky@sky9.dev>
Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
 rust/kernel/types.rs               |   6 ++
 rust/kernel/types/unsafe_pinned.rs | 113 +++++++++++++++++++++++++++++++++++++
 2 files changed, 119 insertions(+)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 9d0471afc9648f2973235488b441eb109069adb1..705f420fdfbc4a576de1c4546578f2f04cdf615e 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -253,6 +253,9 @@ fn drop(&mut self) {
 ///
 /// [`Opaque<T>`] is meant to be used with FFI objects that are never interpreted by Rust code.
 ///
+/// In cases where the contained data is only used by Rust, is not allowed to be
+/// uninitialized and automatic [`Drop`] is desired [`UnsafePinned`] should be used instead.
+///
 /// It is used to wrap structs from the C side, like for example `Opaque<bindings::mutex>`.
 /// It gets rid of all the usual assumptions that Rust has for a value:
 ///
@@ -578,3 +581,6 @@ pub enum Either<L, R> {
 /// [`NotThreadSafe`]: type@NotThreadSafe
 #[allow(non_upper_case_globals)]
 pub const NotThreadSafe: NotThreadSafe = PhantomData;
+
+mod unsafe_pinned;
+pub use unsafe_pinned::UnsafePinned;
diff --git a/rust/kernel/types/unsafe_pinned.rs b/rust/kernel/types/unsafe_pinned.rs
new file mode 100644
index 0000000000000000000000000000000000000000..612b67b400ff361335803c29799b6aeb375ed52c
--- /dev/null
+++ b/rust/kernel/types/unsafe_pinned.rs
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
+//! The contents of this file partially come from the Rust standard library, hosted in
+//! the <https://github.com/rust-lang/rust> repository, licensed under
+//! "Apache-2.0 OR MIT" and adapted for kernel use. For copyright details,
+//! see <https://github.com/rust-lang/rust/blob/master/COPYRIGHT>.
+//!
+//! This file provides a implementation / polyfill of a subset of the upstream
+//! rust `UnsafePinned` type. For details on the difference to the upstream
+//! implementation see the comment on the [`UnsafePinned`] struct definition.
+
+use core::{cell::UnsafeCell, marker::PhantomPinned};
+use pin_init::{cast_pin_init, PinInit, Wrapper};
+
+/// This type provides a way to opt-out of typical aliasing rules;
+/// specifically, `&mut UnsafePinned<T>` is not guaranteed to be a unique pointer.
+///
+/// However, even if you define your type like `pub struct Wrapper(UnsafePinned<...>)`, it is still
+/// very risky to have an `&mut Wrapper` that aliases anything else. Many functions that work
+/// generically on `&mut T` assume that the memory that stores `T` is uniquely owned (such as
+/// `mem::swap`). In other words, while having aliasing with `&mut Wrapper` is not immediate
+/// Undefined Behavior, it is still unsound to expose such a mutable reference to code you do not
+/// control! Techniques such as pinning via [`Pin`](core::pin::Pin) are needed to ensure soundness.
+///
+/// Similar to [`UnsafeCell`], [`UnsafePinned`] will not usually show up in
+/// the public API of a library. It is an internal implementation detail of libraries that need to
+/// support aliasing mutable references.
+///
+/// Further note that this does *not* lift the requirement that shared references must be read-only!
+/// Use [`UnsafeCell`] for that.
+///
+/// This type blocks niches the same way [`UnsafeCell`] does.
+///
+/// # Kernel implementation notes
+///
+/// This implementation works because of the "`!Unpin` hack" in rustc, which allows (some kinds of)
+/// mutual aliasing of `!Unpin` types. This hack might be removed at some point, after which only
+/// the `core::pin::UnsafePinned` type will allow this behavior. In order to simplify the migration
+/// to future rust versions only this polyfill of this type should be used when this behavior is
+/// required.
+//
+// As opposed to the upstream Rust type this contains a `PhantomPinned` and `UnsafeCell<T>`
+// - `PhantomPinned` to ensure the struct always is `!Unpin` and thus enables the `!Unpin` hack.
+//   This causes the LLVM `noalias` and `dereferenceable` attributes to be removed from
+//   `&mut !Unpin` types.
+// - In order to disable niche optimizations this implementation uses `UnsafeCell` internally,
+//   the upstream version however currently does not. This will most likely change in the future
+//   but for now we don't expose this in the documentation, since adding the guarantee is simpler
+//   than removing it. Meaning that for now the fact that `UnsafePinned` contains an `UnsafeCell`
+//   must not be relied on (Other than the niche blocking).
+//   See this Rust tracking issue: https://github.com/rust-lang/rust/issues/137750
+#[repr(transparent)]
+pub struct UnsafePinned<T: ?Sized> {
+    _ph: PhantomPinned,
+    value: UnsafeCell<T>,
+}
+
+impl<T> UnsafePinned<T> {
+    /// Constructs a new instance of [`UnsafePinned`] which will wrap the specified value.
+    ///
+    /// All access to the inner value through `&UnsafePinned<T>` or `&mut UnsafePinned<T>` or
+    /// `Pin<&mut UnsafePinned<T>>` requires `unsafe` code.
+    #[inline(always)]
+    #[must_use]
+    pub const fn new(value: T) -> Self {
+        UnsafePinned {
+            value: UnsafeCell::new(value),
+            _ph: PhantomPinned,
+        }
+    }
+}
+impl<T: ?Sized> UnsafePinned<T> {
+    /// Get read-only access to the contents of a shared `UnsafePinned`.
+    ///
+    /// Note that `&UnsafePinned<T>` is read-only if `&T` is read-only. This means that if there is
+    /// mutation of the `T`, future reads from the `*const T` returned here are UB! Use
+    /// [`UnsafeCell`] if you also need interior mutability.
+    ///
+    /// [`UnsafeCell`]: core::cell::UnsafeCell
+    ///
+    /// ```rust,no_build
+    /// use kernel::types::UnsafePinned;
+    ///
+    /// unsafe {
+    ///     let mut x = UnsafePinned::new(0);
+    ///     let ptr = x.get(); // read-only pointer, assumes immutability
+    ///     x.get_mut_unchecked().write(1);
+    ///     ptr.read(); // UB!
+    /// }
+    /// ```
+    ///
+    /// Note that the `get_mut_unchecked` function used by this example is
+    /// currently not implemented in the kernel implementation.
+    #[inline(always)]
+    #[must_use]
+    pub const fn get(&self) -> *const T {
+        self.value.get()
+    }
+
+    /// Gets a mutable pointer to the wrapped value.
+    #[inline(always)]
+    #[must_use]
+    pub const fn raw_get_mut(this: *mut Self) -> *mut T {
+        this as *mut T
+    }
+}
+
+impl<T> Wrapper<T> for UnsafePinned<T> {
+    fn pin_init<E>(init: impl PinInit<T, E>) -> impl PinInit<Self, E> {
+        // SAFETY: `UnsafePinned<T>` has a compatible layout to `T`.
+        unsafe { cast_pin_init(init) }
+    }
+}

-- 
2.49.0

