Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A99238141
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 09:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746176559; cv=none; b=LYelbEOht+1GqbQpwiGx+ErJSz6fTZL8lVlHAAr6sMPwO+IF0jjkE++i5L3DzQm2TKJa2MmAwLrHizILqY2Q/w0QZjFQLpHxlmdwzfXHq7uv+QmYyBJE7cR0Gcr643VpAyICv1DUtiDzPf8RLAgIS5uXSjBawGQE7o6LRzNGMIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746176559; c=relaxed/simple;
	bh=ozAupGYHVSRKUknmmChuAkml7ixrXIgiyS8gR3oiaYg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dp0FL9hNO2I33FzN5aAZl0koFanaQJxLlwWdqY+q8/0kzMkvKdG4YMvMsSkiaeg2zMFOmxmCG9y3xWtegbUQwycyo7o11YE66XcC10czaDbSYzBj4YC2bFZoucQqRmkU64HgAhmoGXzy9D8f1TCmNC5ypSQBU6acSPp/VLNCs/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=EHIPZinl; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="EHIPZinl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1746176554; x=1746435754;
	bh=tH6qiUlK/jdZcb5djM2SKrcrDvCZTR4InRqz2V4jPnA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=EHIPZinlcd2tfdxK6e8OoRWhWphZBKh6maCAn0YY/TP2mQBD+33UqR73CP/Bch4uj
	 k+/PUmZ5+8y61tUhnfq6hi8CzAefuyZmHJprZ91OT1mwHGQAFTBLLNN9vAKWSLmJuD
	 ypq7epRks6OiaZ2vGxAFm2LuRVjCsjWP+BHvNRmR6psDCqVxrKuAtA6yTyG2Rqtjjn
	 vwQ2vGgJA11pKfcMucM3rl+cnsePpVej2Swi7H2BPu0ysCtIWy1Wtk2WIla7jsC7dS
	 vItiX72EVdr8wxDngG2tikVyb+920Dyb58pajaXMaKggKuRJjttiBcCFyoDzo7mNoP
	 dk+6pQHGtj5/w==
Date: Fri, 02 May 2025 09:02:29 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina@asahilina.net>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver Mangold <oliver.mangold@pm.me>
Subject: [PATCH v10 1/5] rust: types: Add Ownable/Owned types
Message-ID: <20250502-unique-ref-v10-1-25de64c0307f@pm.me>
In-Reply-To: <20250502-unique-ref-v10-0-25de64c0307f@pm.me>
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 4acd5acd5dc38b7f6147f3f413fa5d334514127a
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Asahi Lina <lina@asahilina.net>

By analogy to AlwaysRefCounted and ARef, an Ownable type is a (typically
C FFI) type that *may* be owned by Rust, but need not be. Unlike
AlwaysRefCounted, this mechanism expects the reference to be unique
within Rust, and does not allow cloning.

Conceptually, this is similar to a KBox<T>, except that it delegates
resource management to the T instead of using a generic allocator.

Link: https://lore.kernel.org/all/20250202-rust-page-v1-1-e3170d7fe55e@asah=
ilina.net/
Signed-off-by: Asahi Lina <lina@asahilina.net>
[ om:
  - split code into separate file and `pub use` it from types.rs
  - make from_raw() and into_raw() public
  - fixes to documentation
]
Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/types.rs         |   3 ++
 rust/kernel/types/ownable.rs | 117 +++++++++++++++++++++++++++++++++++++++=
++++
 2 files changed, 120 insertions(+)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 9d0471afc9648f2973235488b441eb109069adb1..5d8a99dcba4bf733107635bf3f0=
c15840ec33e4c 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -11,6 +11,9 @@
 };
 use pin_init::{PinInit, Zeroable};
=20
+pub mod ownable;
+pub use ownable::{Ownable, OwnableMut, Owned};
+
 /// Used to transfer ownership to and from foreign (non-Rust) languages.
 ///
 /// Ownership is transferred from Rust to a foreign language by calling [`=
Self::into_foreign`] and
diff --git a/rust/kernel/types/ownable.rs b/rust/kernel/types/ownable.rs
new file mode 100644
index 0000000000000000000000000000000000000000..52e7a69019f1e2bbbe3cf715651=
b67a5a5c7c13d
--- /dev/null
+++ b/rust/kernel/types/ownable.rs
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Owned reference types.
+
+use core::{
+    marker::PhantomData,
+    mem::ManuallyDrop,
+    ops::{Deref, DerefMut},
+    ptr::NonNull,
+};
+
+/// Types that may be owned by Rust code or borrowed, but have a lifetime =
managed by C code.
+///
+/// It allows such types to define their own custom destructor function to=
 be called when
+/// a Rust-owned reference is dropped.
+///
+/// This is usually implemented by wrappers to existing structures on the =
C side of the code.
+///
+/// # Safety
+///
+/// Implementers must ensure that:
+/// - Any objects owned by Rust as [`Owned<T>`] stay alive while that owne=
d reference exists (i.e.
+///   until the [`release()`](Ownable::release) trait method is called).
+/// - That the C code follows the usual mutable reference requirements. Th=
at is, the kernel will
+///   never mutate the [`Ownable`] (excluding internal mutability that fol=
lows the usual rules)
+///   while Rust owns it.
+pub unsafe trait Ownable {
+    /// Releases the object (frees it or returns it to foreign ownership).
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that the object is no longer referenced after =
this call.
+    unsafe fn release(this: NonNull<Self>);
+}
+
+/// A subtrait of Ownable that asserts that an [`Owned<T>`] or `&mut Owned=
<T>` Rust reference
+/// may be dereferenced into a `&mut T`.
+///
+/// # Safety
+///
+/// Implementers must ensure that access to a `&mut T` is safe, implying t=
hat it is okay to call
+/// [`core::mem::swap`] on the `Ownable`. This excludes pinned types (mean=
ing: most kernel types).
+pub unsafe trait OwnableMut: Ownable {}
+
+/// An owned reference to an ownable kernel object.
+///
+/// The object is automatically freed or released when an instance of [`Ow=
ned`] is
+/// dropped.
+///
+/// # Invariants
+///
+/// The pointer stored in `ptr` is valid for the lifetime of the [`Owned`]=
 instance.
+pub struct Owned<T: Ownable> {
+    ptr: NonNull<T>,
+    _p: PhantomData<T>,
+}
+
+// SAFETY: It is safe to send `Owned<T>` to another thread when the underl=
ying `T` is `Send` because
+// it effectively means sending a `&mut T` (which is safe because `T` is `=
Send`).
+unsafe impl<T: Ownable + Send> Send for Owned<T> {}
+
+// SAFETY: It is safe to send `&Owned<T>` to another thread when the under=
lying `T` is `Sync`
+// because it effectively means sharing `&T` (which is safe because `T` is=
 `Sync`).
+unsafe impl<T: Ownable + Sync> Sync for Owned<T> {}
+
+impl<T: Ownable> Owned<T> {
+    /// Creates a new instance of [`Owned`].
+    ///
+    /// It takes over ownership of the underlying object.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that the underlying object is acquired and can=
 be considered owned by
+    /// Rust.
+    pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
+        // INVARIANT: The safety requirements guarantee that the new insta=
nce now owns the
+        // reference.
+        Self {
+            ptr,
+            _p: PhantomData,
+        }
+    }
+
+    /// Consumes the [`Owned`], returning a raw pointer.
+    ///
+    /// This function does not actually relinquish ownership of the object=
.
+    /// After calling this function, the caller is responsible for ownersh=
ip previously managed
+    /// by the [`Owned`].
+    pub fn into_raw(me: Self) -> NonNull<T> {
+        ManuallyDrop::new(me).ptr
+    }
+}
+
+impl<T: Ownable> Deref for Owned<T> {
+    type Target =3D T;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: The type invariants guarantee that the object is valid.
+        unsafe { self.ptr.as_ref() }
+    }
+}
+
+impl<T: OwnableMut> DerefMut for Owned<T> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        // SAFETY: The type invariants guarantee that the object is valid,
+        // and that we can safely return a mutable reference to it.
+        unsafe { self.ptr.as_mut() }
+    }
+}
+
+impl<T: Ownable> Drop for Owned<T> {
+    fn drop(&mut self) {
+        // SAFETY: The type invariants guarantee that the `Owned` owns the=
 object we're about to
+        // release.
+        unsafe { T::release(self.ptr) };
+    }
+}

--=20
2.49.0


