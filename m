Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D872E3B12;
	Wed, 18 Jun 2025 12:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249676; cv=none; b=Jpoar0eiw/ZwJjQNxHShIOfuAwgctALuJK9ymbYrNxyK8RpT5Ok0L6UYhaMc358SiXbx4BJ5CJ4qbAEtZgWEVfSzv4SujFYhlfbnMbsCzgLdtpiWvm372daFgv+c9b5Rh/GE7KVKogfY3Et3puvBdC+5RJTm0qCwLsQXw9VqSqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249676; c=relaxed/simple;
	bh=ARp0XvdRHptwJHdPyZbXBPQF+FSBwcUm72r29Of/fko=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JP0mOwo/4sa83ws86hqTgPZfjptyhNWCGijVKnheTrZoNRej9boKr6+hyR7KEfiQ9IzhklRbkmq9v/2sz7KuYy+oXYpzHOFYhuY27nNqPwlDfv7TRpWuvxIBOMV2EOyKiRDioNbdx0EHNkbSL7y/0nwQ7KqYEw3ByqmW5C8qzDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=DtHrg2Ep; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="DtHrg2Ep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1750249666; x=1750508866;
	bh=4li1tGRJOI/fthB7Y4tx8/VU2ULNmgwbETEpIi0vvPA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=DtHrg2EpbFQ1zeNbeSDn+e85T1iKxv/HfXj98R+Ms0qcyj+Z0653idj6yHGMumoBp
	 SQHlvJdyVBWgqmTONco+JE81bnLUjrpHEJTt3P47ISnRgW2h0qihq1hXit3lGqFBlG
	 daHh52j9SU6UAa5m9GC1ugdAIvlTCmJ4ePjd16B6yPbBvFAShcOqx3pudD6lJIU2GA
	 1QCwpY9My+zc/jYqhWhy7ngDG+8LrzhjQ3SGfkabm+mzc+J+mqTQhBiTRTVeOBCN9z
	 SR1GbTfLT+mg4L+fWBKC1NajTjaeMIixOkmh8uceuPgad39sTqKlI9Xm83Aavw5SIi
	 9bApR2cYCEi9g==
Date: Wed, 18 Jun 2025 12:27:41 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>, Asahi Lina <lina+kernel@asahilina.net>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver Mangold <oliver.mangold@pm.me>
Subject: [PATCH v11 1/4] rust: types: Add Ownable/Owned types
Message-ID: <20250618-unique-ref-v11-1-49eadcdc0aa6@pm.me>
In-Reply-To: <20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me>
References: <20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 997fc21581854683f6f182f42e7856e03e6f537f
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Asahi Lina <lina+kernel@asahilina.net>

By analogy to `AlwaysRefCounted` and `ARef`, an `Ownable` type is a
(typically C FFI) type that *may* be owned by Rust, but need not be. Unlike
`AlwaysRefCounted`, this mechanism expects the reference to be unique
within Rust, and does not allow cloning.

Conceptually, this is similar to a `KBox<T>`, except that it delegates
resource management to the `T` instead of using a generic allocator.

Link: https://lore.kernel.org/all/20250202-rust-page-v1-1-e3170d7fe55e@asah=
ilina.net/
Signed-off-by: Asahi Lina <lina@asahilina.net>
[ om:
  - split code into separate file and `pub use` it from types.rs
  - make from_raw() and into_raw() public
  - fixes to documentation and commit message
]
Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/types.rs         |   7 +++
 rust/kernel/types/ownable.rs | 134 +++++++++++++++++++++++++++++++++++++++=
++++
 2 files changed, 141 insertions(+)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 22985b6f69820d6df8ff3aae0bf815fad36a9d92..c12ff4d2a3f2d79b760c34c0b84=
a51b507d0cfb1 100644
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
@@ -425,6 +428,10 @@ pub const fn raw_get(this: *const Self) -> *mut T {
 /// Rust code, the recommendation is to use [`Arc`](crate::sync::Arc) to c=
reate reference-counted
 /// instances of a type.
 ///
+/// Note: Implementing this trait allows types to be wrapped in an [`ARef<=
Self>`]. It requires an
+/// internal reference count and provides only shared references. If uniqu=
e references are required
+/// [`Ownable`] should be implemented which allows types to be wrapped in =
an [`Owned<Self>`].
+///
 /// # Safety
 ///
 /// Implementers must ensure that increments to the reference count keep t=
he object alive in memory
diff --git a/rust/kernel/types/ownable.rs b/rust/kernel/types/ownable.rs
new file mode 100644
index 0000000000000000000000000000000000000000..f4065a0d627a62d3ecb15edabf3=
06e9b812556e1
--- /dev/null
+++ b/rust/kernel/types/ownable.rs
@@ -0,0 +1,134 @@
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
 be called when a
+/// Rust-owned reference is dropped.
+///
+/// This is usually implemented by wrappers to existing structures on the =
C side of the code.
+///
+/// Note: Implementing this trait allows types to be wrapped in an [`Owned=
<Self>`]. This does not
+/// provide reference counting but represents a unique, owned reference. I=
f reference counting is
+/// required [`AlwaysRefCounted`](crate::types::AlwaysRefCounted) should b=
e implemented which allows
+/// types to be wrapped in an [`ARef<Self>`](crate::types::ARef).
+///
+/// # Safety
+///
+/// Implementers must ensure that:
+/// - The [`release()`](Ownable::release) method leaves the underlying obj=
ect in a state which the
+///   kernel expects after ownership has been relinquished (i.e. no dangli=
ng references in the
+///   kernel is case it frees the object, etc.).
+pub unsafe trait Ownable {
+    /// Releases the object (frees it or returns it to foreign ownership).
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that:
+    /// - `this` points to a valid `Self`.
+    /// - The object is no longer referenced after this call.
+    unsafe fn release(this: NonNull<Self>);
+}
+
+/// Type where [`Owned<Self>`] derefs to `&mut Self`.
+///
+/// # Safety
+///
+/// Implementers must ensure that access to a `&mut T` is safe, implying t=
hat:
+/// - It is safe to call [`core::mem::swap`] on the [`Ownable`]. This excl=
udes pinned types
+///   (i.e. most kernel types).
+/// - The kernel will never access the underlying object (excluding intern=
al mutability that follows
+///   the usual rules) while Rust owns it.
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
+/// The pointer stored in `ptr` can be considered owned by the [`Owned`] i=
nstance.
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
+    /// Callers must ensure that:
+    /// - Ownership of the underlying object can be transferred to the `Ow=
ned<T>` (i.e. operations
+    ///   which require ownership will be safe).
+    /// - No other Rust references to the underlying object exist. This im=
plies that the underlying
+    ///   object is not accessed through `ptr` anymore after the function =
call (at least until the
+    ///   the `Owned<T>` is dropped).
+    /// - The C code follows the usual shared reference requirements. That=
 is, the kernel will never
+    ///   mutate or free the underlying object (excluding interior mutabil=
ity that follows the usual
+    ///   rules) while Rust owns it.
+    /// - In case `T` implements [`OwnableMut`] the previous requirement i=
s extended from shared to
+    ///   mutable reference requirements. That is, the kernel will not mut=
ate or free the underlying
+    ///   object and is okay with it being modified by Rust code.
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
. After calling this
+    /// function, the caller is responsible for ownership previously manag=
ed
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
+        // SAFETY: The type invariants guarantee that the object is valid,=
 and that we can safely
+        // return a mutable reference to it.
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


