Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6F28F6B;
	Fri, 18 Apr 2025 12:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744978899; cv=none; b=G5TWrkB9XkRXfMcKB75MssV9b/zySy5/rbKNmu9RImRcd/uHppP6spFSKRb86RbtDOz1V1JTjBwRNraIbzzBQPuVpCjy/upeRzVBJ+qLHqvzo/EKP04S4qgVEgbh1SKVi1puGY562TwIsrFQe+dSy8ex6f/Z7WPf5WBq0LkmXEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744978899; c=relaxed/simple;
	bh=jlMDOH3DWLD7CKfb1nBTwSWgYi/OYKHvzPams3Buc94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NsZoo/epG7Z87h0Se/3ingF84madcD5dMqCB/IDYJwGZjZO2iwuoa42c8LqimryqE6cTr0Erfhh+F5hwdOWEJbwguwI2qfosKdOv6MIQqEAzZnNZHcsZF80S/p6Y4ioXWt7Zp7SGkPYU2y8UlMDjDVDGSG+UUGPnFYoRsIdqAss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZyPPILs+; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZyPPILs+"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38f2f391864so1003317f8f.3;
        Fri, 18 Apr 2025 05:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744978896; x=1745583696; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4tc6v94fXOra6/1vFhmfmv9bDH8DBFjzJMoTvMKSLzc=;
        b=ZyPPILs+CnZhKAxYD4mzY60E+Tp363r6F15Ldhvwsw3dhajo+2drXKnVqc8QDwKBFB
         j7Rhmqeo0TYSrHOkTBEGun/nCra+s6QziumrtYjLclJ928HTz7zg6MXqlvB4TZ+I0ll+
         rmIP+Wa7OtfNcx2w1EkaNjOosLYE8p12h44o+EU7nmI8nxlDRr6hFS1BgtwnLUH8w5Op
         Wr98hFiZRIOMq5RWg0lOsWsEYioRse8VnNJgNWR0uHgbJenvziMCqp7TpCjl+fMgHeDj
         SEuuNIbwM4x9a6FQlLGEsVJxy2jFcZChnNVJFO4eLFWYAjEajteRHkCrSRDZyQHvpsur
         3zWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744978896; x=1745583696;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4tc6v94fXOra6/1vFhmfmv9bDH8DBFjzJMoTvMKSLzc=;
        b=G1WHhYAxE66HmCBnmLBXiKl/sU9GUlCRR3099yWetYys7wv7ntJT/+qQj46kwPmVEq
         toJC1kUvNGDbKDqD/LN+6jiixVJUVV5J2mI5/EkLtZnTZHrC5AUlRnkURfEdEzt9DlGQ
         ReHGI9VlHjR7707Z1vH7+zHdlecXRHX+/WZT8A92ig7v9dSakJ4ffOkW0+GeYPvQoQm5
         aNhvxTfTNzlSIAWSjF4aGYL5YXKhdt9kqgi7thEtG1I0nv3wy7qE3jwMDKk6O8pCjYAX
         K4KMkW+eVfCYrucSoARjURn/LqXuihOlHaymP+tnNTJCO1FCCmi6I8uWYnnf5ccPzOQJ
         b8rw==
X-Forwarded-Encrypted: i=1; AJvYcCUK78og2eGvs6BAfNDUqha0adpCTyVWjLlbtEeUN8zrep+Dyp7hqbxUHHZPKVur36DEtiaMrPVD/dHpifi9EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yye7pWa3OAmOvVBigSbcCW8CoVv+rkUwAWfBRN9i48sgCIlG1UD
	nRWnO4AiVMsfi+/rsWc11blQ9DeQkw25Yc90WEptzw5zCw3GTxIs
X-Gm-Gg: ASbGncs9BonFTZU79MVtldZRcs1F6omD1TGVqHSCosFLI2GduWbZJXDCn2qI8xd6VGe
	SVYs4NCd6MGIv/wsjNGe6+3taYuKeqH8yZ5ZCCSWka3JtxIpnwbVyfnc5STOJZdnGn98Xlw0rZA
	X6KpQJDXD9rWW3Nn4KlW/h1wdDPEfAAXnMIGfeelLZXhMt9zfnhhRHm+Ykb955VDUr+3Y71Q16J
	Ctzq0err97FWbhbGwOoOH2mduQ9Qts6XAIXluWiyWyEYw4In/u01VBUaPI6mOKeoA6YUXroaKPg
	DrPQmcaOW/2/vLeHsDvqoSrmDXLB
X-Google-Smtp-Source: AGHT+IFx7FwltqHseLnqzlNV1bjeTjZjk0bEBzVpolcDb8BI7yikVRKi+Fc2pAFXEROdbp+fqT2XPA==
X-Received: by 2002:a05:6000:420d:b0:38f:483f:8319 with SMTP id ffacd0b85a97d-39efbaee772mr1786123f8f.51.1744978895361;
        Fri, 18 Apr 2025 05:21:35 -0700 (PDT)
Received: from [10.0.1.56] ([2001:871:22a:99c5::1ad1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39efa493145sm2583893f8f.71.2025.04.18.05.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 05:21:35 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Fri, 18 Apr 2025 14:21:22 +0200
Subject: [PATCH RFC] rust: add UnsafePinned type
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-rust_unsafe_pinned-v1-1-c4c7558399f8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMFDAmgC/x2MuwqAMAwAf0UyW7BF8bEKfoCriIiNmiVKY0Uo/
 rvF8TjuAgg6QoEmCeDwJqGDI+g0gWWfeUNFNjKYzBRZrivlvFyTZ5lXnE5iRquqWtsFTRm1hRi
 eDld6/ukAfdfC+L4f4NfRAWkAAAA=
X-Change-ID: 20250418-rust_unsafe_pinned-891dce27418d
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Christian Schrefl <chrisi.schrefl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744978894; l=9877;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=jlMDOH3DWLD7CKfb1nBTwSWgYi/OYKHvzPams3Buc94=;
 b=V8tDXVXAkxXOQeY0boMcgtoYkzwQImmyaGH4bZCCeDlFwiaj4bqJ+OIVPP8DeIHWGt6zcS8RN
 RbVaqOGwhsyD9sRd18VWqkSirG5R1rY1tXPqMZIGV+846GhcLh2NiZQ
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

`UnsafePinned<T>` is useful for cases where a value might be shared with C
code but not directly used by it. In particular this is added for
storing additional data in the `MiscDeviceRegistration` which will be
shared between `fops->open` and the containing struct.

Similar to `Opaque` but guarantees that the value is always initialized
and that the inner value is dropped when `UnsafePinned` is dropped.

This was originally proposed for the IRQ abstractions [0] and is also
useful for other where the inner data may be aliased, but is always valid
and automatic `Drop` is desired.

Since then the `UnsafePinned` type was added to upstream Rust [1] as a
unstable feature, therefore this patch implements the subset required
for additional data in `MiscDeviceRegistration` on older rust versions
and using the upstream type on new rust versions which include this
feature.

Some differences to the upstream type definition are required in the
kernel implementation, because upstream type uses some compiler changes
to opt out of certain optimizations, this is documented in a comment on
the `UnsafePinned` type.

The documentation on is based on the upstream rust documentation with
minor modifications.

Link: https://lore.kernel.org/rust-for-linux/CAH5fLgiOASgjoYKFz6kWwzLaH07DqP2ph+3YyCDh2+gYqGpABA@mail.gmail.com [0]
Link: https://github.com/rust-lang/rust/pull/137043 [1]
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
This patch is mostly to show how the upstream `UnsafePinned`
Rust type can be used once it is stable.

It is probalby not desired to use the unstable feature before
that time.

To test using the upsteam implementation a fairly new nightly
rust version is required.

Tested with rustc 1.88.0-nightly (78f2104e3 2025-04-16) and
rustc 1.78.0 (9b00956e5 2024-04-29).
---
 init/Kconfig                       |  3 ++
 rust/kernel/lib.rs                 |  1 +
 rust/kernel/types.rs               | 34 ++++++++++++++
 rust/kernel/types/unsafe_pinned.rs | 90 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 128 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index dd2ea3b9a799205daa4c1f0c694a9027e344c690..f34e96cd3fb8a058a83e38c2ea9cb17737f5e0b6 100644
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
index 9d0471afc9648f2973235488b441eb109069adb1..c4e234d5c07168295499c2a8fccc70e00e83e7ca 100644
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
@@ -578,3 +581,34 @@ pub enum Either<L, R> {
 /// [`NotThreadSafe`]: type@NotThreadSafe
 #[allow(non_upper_case_globals)]
 pub const NotThreadSafe: NotThreadSafe = PhantomData;
+
+// When available use the upstream `UnsafePinned` type
+#[cfg(CONFIG_RUSTC_HAS_UNSAFE_PINNED)]
+pub use core::pin::UnsafePinned;
+
+// Otherwise us the kernel implementation of `UnsafePinned`
+#[cfg(not(CONFIG_RUSTC_HAS_UNSAFE_PINNED))]
+mod unsafe_pinned;
+#[cfg(not(CONFIG_RUSTC_HAS_UNSAFE_PINNED))]
+pub use unsafe_pinned::UnsafePinned;
+
+/// Trait for creating a [`PinInit`]ialized wrapper containing `T`.
+// Needs to be defined in kernel crate to get around the Orphan Rule when upstream `UnsafePinned`
+// is used.
+pub trait TryPinInitWrapper<T: ?Sized> {
+    /// Create an [`Self`] pin-initializer which contains `T`
+    fn try_pin_init<E>(value: impl PinInit<T, E>) -> impl PinInit<Self, E>;
+}
+impl<T: ?Sized> TryPinInitWrapper<T> for UnsafePinned<T> {
+    fn try_pin_init<E>(value: impl PinInit<T, E>) -> impl PinInit<Self, E> {
+        // SAFETY:
+        //   - In case of an error in `value` the error is returned, otherwise `slot` is fully
+        //     initialized, since `self.value` is initialized and `_pin` is a zero sized type.
+        //   - The `Pin` invariants of `self.value` are upheld, since no moving occurs.
+        unsafe {
+            pin_init::pin_init_from_closure(move |slot| {
+                value.__pinned_init(Self::raw_get_mut(slot))
+            })
+        }
+    }
+}
diff --git a/rust/kernel/types/unsafe_pinned.rs b/rust/kernel/types/unsafe_pinned.rs
new file mode 100644
index 0000000000000000000000000000000000000000..e4e8986a044e9fe9215712dc9837ecfdbd6d5176
--- /dev/null
+++ b/rust/kernel/types/unsafe_pinned.rs
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! This file provides a implementation of a subset of the upstream rust `UnsafePinned` type
+//! for rust versions that don't include this type.
+
+use core::{cell::UnsafeCell, marker::PhantomPinned};
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
+//
+// As opposed to the upstream Rust type this contains a `PhantomPinned`` and `UnsafeCell<T>`
+// - `PhantomPinned` to avoid needing a `impl<T> !Unpin for UnsafePinned<T>`
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

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250418-rust_unsafe_pinned-891dce27418d

Best regards,
-- 
Christian Schrefl <chrisi.schrefl@gmail.com>

