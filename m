Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADF02A8D0;
	Wed, 30 Apr 2025 08:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002202; cv=none; b=aGJnLcGynXA0vsUc6+8XoXiiumJeQ5219c3Q8ooXXFIyKDHt62oQzcJJyH68sSEF3b+Dltf/nHD834QvCu7gT0Qpj8mpmrcl7ioWYofe6iMUyDSB/zmJMHpJcGzeBjSDJDruEtxkXG6SyEBPKYT0TLjpg84JG4O6Jp28c62F4KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002202; c=relaxed/simple;
	bh=kA6Ty50SPOFgimp7Tg2K3Ce2nrWbjdG63Xnq0binEW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HcG/tXB5l3Veq3IPTS2lIU88UKKtqDuhWVvg3Del+UQm05i85IaeRQH03w2RPoXuHHDvBcUIIaMtjIlR53TBJvCv0ewoSxpooRyud+V30jAfBg7xhcw0mcGp4W7xrdypxpzl3RNQtvzdguZH/Ff5gIydIUQNW9X3CvIVxF+fS68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H72Y/NFt; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H72Y/NFt"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so11071351a12.1;
        Wed, 30 Apr 2025 01:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746002198; x=1746606998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H+wYAZz/pbkATVqPvOnfiWnwAhCBTt7BUcOohLnoILI=;
        b=H72Y/NFtSWOwk7AOpUn8AL59ISt+UQ8vKjpQvilgHflppHilvjXUbGXXJ7Qv5ARcdr
         N+wtvspf69ZU+D7fpMicgrdH64+JFuXstkPfzWtWngqT44vqS3rxDPfSgUTyjXjDgGLh
         utb96JcuI5FeCRlg0CbUxqrnC5CBC7Eusl13jRpfk0QAg/OCsAnJYmDp2AMCg6khdUPm
         Rmwlj73tMLjD7x+KJRknPoCdi9zZLOdFUbyFaPMLbrVZhk3TIiIH8AhIcZvoXbvc8HO7
         yWrljwWShcl05ykfiixr7WqofkRNBbCk+/eiZMRZBpCGK7k4zoQj8o66NKHLHobnwgEm
         AaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746002198; x=1746606998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+wYAZz/pbkATVqPvOnfiWnwAhCBTt7BUcOohLnoILI=;
        b=MOxhj3VUViu8ZRk9w9BjuszSvlRwHxZLHJgKliTGSe3+6AmNQIaGkQCIZz7RK5Esc3
         YwSagxdI1YtT4lINRS+UxgpsVnyF/H8rLNO4qj/0SHWbusepNH16I0bCiCzkxYN3T0lX
         ByozqmZRYLQGDLiU7IFSc9qGRPBr23td2VTJ+uzrRUk+JRinlDpk5lfAtGff3FlbYHv5
         2bd6yxh3sDIL254Jmi9lZeujKq5dC+A4g0MAF9m5FRdmYv0B8Rhe3nOLudap+eqOvpx5
         D+aODihEZY8HMpnjyUe6G3p1RaCVGg5LXymIxmVfYJ/rlRPpBCo0BnaGh0PXksh71jsW
         yESQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu47tmwYNGYsnQXhonkNoug0zjC1c2bSCEYbR6Vr6S4ofop3S2eBeqk6yx6g8TTnu8BC3SUub2TI6iWqPVVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YymKapGSlDJ1plo3iA0EwxmSfgiaD8S4hhSdZfdSk6nNouh7aON
	bB2WaOWfOAFjQ8sniHkxdrOCg2w+bFtaqnVhK9o+8Yd6NJXxPJdYFXQxPeKdApQ=
X-Gm-Gg: ASbGncvNYzVn/JQZ3N30AB83+gxqVoo/baeA44Z/2arpNScqyxR6lsX9hi2P9CRPWaI
	WB4xMDel0zTblRYkRGM2xsZDypTZN+w6YSL2R7aUS0RORIQ1MIO9JPV8kZhZ24pkeYiWwl+B+gK
	YbirYCYZ/QWqWoZaNhmHSvaWJvOAbdx5rwRbCYPC1FD9VE8PimapfprkJbqjvXe57XiyVxuzHiN
	MKL6RgCO3J0yrUKn/qo8F56PQM7lhgINDLrcZjkXf2JkgNesqFoCuxP+97/lD15oMRCqjwr3VP6
	5FjmKA6KUJRQ34WJHgPdkXtTEEs5uyHi3Gg86eetfrlSDbmlHajQ
X-Google-Smtp-Source: AGHT+IFxT0EHxnU/Tbheyf1WL4mHvoav41cX+gwWGSY8CLEBag0Ts+UCjDR01lL3z3Do+ZByojBMCA==
X-Received: by 2002:a05:6402:27c6:b0:5ec:9e6e:c48f with SMTP id 4fb4d7f45d1cf-5f8af0ca29bmr1057356a12.29.1746002198259;
        Wed, 30 Apr 2025 01:36:38 -0700 (PDT)
Received: from [10.27.99.142] ([193.170.124.198])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f6424sm8653721a12.42.2025.04.30.01.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:36:37 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Wed, 30 Apr 2025 10:36:11 +0200
Subject: [PATCH v2 1/3] rust: add UnsafePinned type
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250430-rust_unsafe_pinned-v2-1-fc8617a74024@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746002196; l=9573;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=kA6Ty50SPOFgimp7Tg2K3Ce2nrWbjdG63Xnq0binEW0=;
 b=jADf8Ze8rWeUVdGz1P5CE1xekmV4ZVhR5ZFj0GGCB+JPLZM1JA1/6kRpI05ZXfL3hRnlSbKnD
 tPNVCleEBakCe7lx1kSs7VjSzFeqCP7dHtSgQRq7Zeg+ednPfVWmLfF
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
Co-developed-by: Sky <sky@sky9.dev>
Signed-off-by: Sky <sky@sky9.dev>
Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
 init/Kconfig                       |   3 +
 rust/kernel/lib.rs                 |   1 +
 rust/kernel/types.rs               |   6 ++
 rust/kernel/types/unsafe_pinned.rs | 115 +++++++++++++++++++++++++++++++++++++
 4 files changed, 125 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index 63f5974b9fa6ea3f5c92203cedd1f2f82aa468a1..727d85d2b59f555f1c33103bb78698551a41e7ca 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -140,6 +140,9 @@ config LD_CAN_USE_KEEP_IN_OVERLAY
 config RUSTC_HAS_COERCE_POINTEE
 	def_bool RUSTC_VERSION >= 108400
 
+config RUSTC_HAS_UNSAFE_PINNED
+	def_bool RUSTC_VERSION >= 108800
+
 config PAHOLE_VERSION
 	int
 	default $(shell,$(srctree)/scripts/pahole-version.sh $(PAHOLE))
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index de07aadd1ff5fe46fd89517e234b97a6590c8e93..c08f0a50f1d8db95799478caa8e85558a1fcae8d 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -17,6 +17,7 @@
 #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(coerce_unsized))]
 #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(dispatch_from_dyn))]
 #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(unsize))]
+#![cfg_attr(CONFIG_RUSTC_HAS_UNSAFE_PINNED, feature(unsafe_pinned))]
 #![feature(inline_const)]
 #![feature(lint_reasons)]
 // Stable in Rust 1.82
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
index 0000000000000000000000000000000000000000..5a200aac30792bf71098087aee0fd9d2d51c468f
--- /dev/null
+++ b/rust/kernel/types/unsafe_pinned.rs
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
+//! The contents of this file partially come from the Rust standard library, hosted in
+//! the <https://github.com/rust-lang/rust> repository, licensed under
+//! "Apache-2.0 OR MIT" and adapted for kernel use. For copyright details,
+//! see <https://github.com/rust-lang/rust/blob/master/COPYRIGHT>.
+//!
+//! This file provides a implementation / polyfill of a subset of the upstream
+//! rust `UnsafePinned` type.
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
+///
+/// In order to disable niche optimizations this implementation uses [`UnsafeCell`] internally,
+/// the upstream version however will not. So the fact that [`UnsafePinned`] contains an
+/// [`UnsafeCell`] must not be relied on (Other than the niche blocking).
+// As opposed to the upstream Rust type this contains a `PhantomPinned`` and `UnsafeCell<T>`
+// - `PhantomPinned` to avoid needing a `impl<T> !Unpin for UnsafePinned<T>`
+//      Required to use the `!Unpin hack`.
+// - `UnsafeCell<T>` instead of T to disallow niche optimizations,
+//     which is handled in the compiler in upstream Rust
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
+    ///
+    /// The difference from `get_mut_pinned` and `get_mut_unchecked` is that this function
+    /// accepts a raw pointer, which is useful to avoid the creation of temporary references.
+    ///
+    /// These functions mentioned here are currently not implemented in the kernel.
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

