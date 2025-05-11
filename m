Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE1C25E441;
	Sun, 11 May 2025 18:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746987717; cv=none; b=OTFciXMWYH7zTS5lYRMvwmopCCY1vXfCjO3KM/BeoJda9GepmCaTLaIl783xt+LOfC/WODVsIEbdAF32Z7ScZWr8iG8vaFxlA+BG4/Msm5iz7uiAz9Ro86NbbB1iRaiaaelb0D1ThWd805JBUu6tokfFFg6KYgsuEoQUXnzcglg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746987717; c=relaxed/simple;
	bh=QhTkajzKAxWgUuhE+SsnQ0WLgzbrN9mbaO5miIxAQv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bj8QcNkyCt9cnaUDgUW01fqmpdlLzY36PIXFhdes0+62Xe9wdi2izeRRq7F/XxYlU+HmaqNVDQCUNVzBWfA4kMgOazON2fMlwJL5orKyfoTrLcFBGvtih3ZKwpcHYQQkgI/2ge0s71DdPKc5G31BMvLA8WDqrBibow1fjby1saY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XL1JdssU; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XL1JdssU"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so27061275e9.1;
        Sun, 11 May 2025 11:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746987713; x=1747592513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/3HklZYW0UfqWPqGSjmRU8CIidceE6c0Ikzvi2T3rJ8=;
        b=XL1JdssUQbnDJLCwpS696VYz5t+KJi1FTBxe+e+B07OJuH7ULeS6BkPiWVZkxPnPjn
         UMaeV5kpmTBF9K4+h1asOBGg05sx7Qq03EpsaTLoEL+WQ1dn1TgMK6xEtxo3vapdb7Di
         4OlEMoj9JwO40uSVmGwIPhdesdSDX8VdcoT6DuOiVRXpSBL9XSLUX6z2TPr8pwtB4+Os
         LdzQA6pe9vm5A9OB/SJipPbgBk64qg3lgwk312fEmU8JXR0zR/cOdtMyxFYTojNM90Hn
         Q53YWAcjj/qmFw2gHCVstI76tsxiViJJkuintStGZxC5+nmBKNonglyzNLxBSQh4lkaF
         DlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746987713; x=1747592513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3HklZYW0UfqWPqGSjmRU8CIidceE6c0Ikzvi2T3rJ8=;
        b=HmKHrwFgiDr2SBjhUP4qCNsCCng6iR3Gz3bbnTpq+kIgoSxDfhFN6CxKWuEZMagPKK
         3LVATl/yUmBMTe37BOJU5bP0L1/84dxYdPCkWnSRjCxRXI3ZVmL1FI6cgxrLFk1kY9Jt
         bz3dQSHxQhhq/oewj5Ikir5Hs8cI7WB6JiCRpI593ZzW433LNv3p5dFTjbKiyojevXgD
         n9uVT/FiNJScNWnpU81uHKtcSabRgHRQ7gqdU2cDoOTl+Il5yQymMJ83m46vOxzpR65P
         1pS4m5LQf4BalxbC95Vc4cGIh7CgObSb36Nxt8/bDbwXiBoe64VSuX/39bp/pZLwE7FD
         YEow==
X-Forwarded-Encrypted: i=1; AJvYcCWkgIpLbL1oZ91iAWr5+Os9IHdiAr/kwCM0KR2m4Ps3Vy4f2k3LQ2El6EPJu6vpIDxsW54PVk0lh6z4mUS6BA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ/Rr2+DoMafmKVM/jjmduBA6JOqR88WYGsr9yF8dn21+fNYJR
	ezJciJOsdOyL/QcoGBagmQEkngwie/5uqwVJBkn04Bbu+BLOo2Nb
X-Gm-Gg: ASbGnctT3UrC4QxNEDXMd9lc2CNuS/XBPSrJsV9dOw3MBGQi2xLo0e2bHdOU1x4ijj2
	1R2/YBO8wnXuCWmplXUIHQOopIK6ldxBC+NLDKmLZGNpwZtE8vGnX7w4R7N/8xZ7mV/Qi0cPe4m
	9vSNu9/hfiD/iHE9UlT4MIexCKTq2dgwZhebWXvkXziHCmO/E/tjJVUY0jHBBKWQo9UrGuhk6yl
	K42KBhVX49gXuN72b6ba9ld8KCf42J9+/IMn5nJyxPRZ0O3if8W1uNdl5mgw1DmoOICLvzIqBfn
	smBHCeJkUTp779iP7+XUtxLf4wLH7SKR2uvc+jA=
X-Google-Smtp-Source: AGHT+IGkeJH/ofwQXOSbok2LaZm3fwBgxHG1sSQWfzDEjcj5xXr/tGevPyUoM/i1Kb1WLFHfESlq0w==
X-Received: by 2002:a05:600c:83ca:b0:43d:2313:7b4a with SMTP id 5b1f17b1804b1-442d6d18302mr108685075e9.3.1746987713202;
        Sun, 11 May 2025 11:21:53 -0700 (PDT)
Received: from [10.0.1.56] ([2001:871:22a:99c5::1ad1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442d67d5c7bsm100418495e9.4.2025.05.11.11.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 11:21:52 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Sun, 11 May 2025 20:21:38 +0200
Subject: [PATCH v4 1/3] rust: add UnsafePinned type
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250511-rust_unsafe_pinned-v4-1-a86c32e47e3d@gmail.com>
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
 llvm@lists.linux.dev, Christian Schrefl <chrisi.schrefl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746987711; l=8462;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=QhTkajzKAxWgUuhE+SsnQ0WLgzbrN9mbaO5miIxAQv0=;
 b=Uy/fXqbRpuiMliNJI1DyK1Mu1s7D8QQByzo32leRblrToRzx25zquo/r2F6ljtuxJwf18PB6o
 eLZqrbk8UGlCwgO63k44/hrHcGifhqV9sUKYdC+8F4ZgkXXGGceKzM9
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
 rust/kernel/types/unsafe_pinned.rs | 111 +++++++++++++++++++++++++++++++++++++
 2 files changed, 117 insertions(+)

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
index 0000000000000000000000000000000000000000..315248cb88c089239bd672c889b5107060175ec3
--- /dev/null
+++ b/rust/kernel/types/unsafe_pinned.rs
@@ -0,0 +1,111 @@
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
+    /// ```rust,no_run
+    /// use kernel::types::UnsafePinned;
+    ///
+    /// unsafe {
+    ///     let mut x = UnsafePinned::new(0);
+    ///     let ptr = x.get(); // read-only pointer, assumes immutability
+    ///     # // Upstream Rust uses `UnsafePinned::get_mut_unchecked` here.
+    ///     UnsafePinned::raw_get_mut(&raw mut x).write(1);
+    ///     ptr.read(); // UB!
+    /// }
+    /// ```
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

