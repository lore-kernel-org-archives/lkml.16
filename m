Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E362EA160
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249690; cv=none; b=mOwQ24u35G1ppKTR1vxTBQFArx0yyacokLEeOv28w14L8dnaars1L+VROUXoaFIC8+7OEooZOIlDChuqumtmQTgNwBrkFhfXlku9Z3vbTvayIG44dem2+bvDgS72wLTwbGO9gWDdF1toY++aOlWEZ7yQV6mpzvKPp5HX+XAskPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249690; c=relaxed/simple;
	bh=9u/lhjMuZxt5gdzNXkvyQGTpF7x7HkbR30b0gP7pFTQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pCmuDNkCEObOgZbpc/vRNzeBsEFGmZ9axQ8X+UB26snML5hXfS4ty06hhTEEjfc83F05+3s9CMxa/BmmN09pXT5HeTglTqzYspQTjeC+zGof3/pOEa+dBOqHJqUjxc6Ylxr4YDOCF3DGHx/I5VCvm40OLgWN2os7daCLQxTgtC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=FzBotmvK; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="FzBotmvK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1750249683; x=1750508883;
	bh=7QKZ3i7hDc5KAkLRl23tMe4ErKiHt7foEwQ0JMk9U1Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=FzBotmvK9PAiuMwDfGBa6o2B4C8mwMNhDBLuNyo3WYqwzarJaAbPEt73tBw7/vbKQ
	 USPorzbIHZOtoqZzFxmTPtEaN9Vnv5g0fUGz47hNZBu2xtNvtHCazvlB27tf5kG9Sh
	 5GGhHnHmJFYe1Pj3+B+U/BknaIiFUO//LpFO3WY8cMDTNjeqxbNlRQgqwQFsnsgfPd
	 dtkkIR1R4t9DjEQccSWqxhcAu9k4ZSQSlarl91KtoBQH4wvS0JksXLb3Wdt3LV6HJb
	 8ol1HNhOFAkmvak/OfJ3ZLZma/bpHGD1Ao+Jkl32xEHKDYlt1GwFv4UTouC14iKS1k
	 zZ5uVgArRyi8g==
Date: Wed, 18 Jun 2025 12:27:59 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>, Asahi Lina <lina+kernel@asahilina.net>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver Mangold <oliver.mangold@pm.me>
Subject: [PATCH v11 4/4] rust: Add `OwnableRefCounted`
Message-ID: <20250618-unique-ref-v11-4-49eadcdc0aa6@pm.me>
In-Reply-To: <20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me>
References: <20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: d2c8d1c6b9c72fcd37fa43299ef51e953e572141
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Types implementing one of these traits can safely convert between an
`ARef<T>` and an `Owned<T>`.

This is useful for types which generally are accessed through an `ARef`
but have methods which can only safely be called when the reference is
unique, like e.g. `block::mq::Request::end_ok()`.

Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/types.rs         |  10 +++-
 rust/kernel/types/ownable.rs | 127 +++++++++++++++++++++++++++++++++++++++=
+++-
 2 files changed, 134 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index a22d5d39d89edfe357fdfe903ef42e5d5404237f..af0bda4ea50f54aed3c51327db0=
e43f960868501 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -12,7 +12,7 @@
 use pin_init::{PinInit, Zeroable};
=20
 pub mod ownable;
-pub use ownable::{Ownable, OwnableMut, Owned};
+pub use ownable::{Ownable, OwnableMut, OwnableRefCounted, Owned};
=20
 /// Used to transfer ownership to and from foreign (non-Rust) languages.
 ///
@@ -429,6 +429,8 @@ pub const fn raw_get(this: *const Self) -> *mut T {
 /// Note: Implementing this trait allows types to be wrapped in an [`ARef<=
Self>`]. It requires an
 /// internal reference count and provides only shared references. If uniqu=
e references are required
 /// [`Ownable`] should be implemented which allows types to be wrapped in =
an [`Owned<Self>`].
+/// Implementing the trait [`OwnableRefCounted`] allows to convert between=
 unique and shared
+/// references (i.e. [`Owned<Self>`] and [`ARef<Self>`]).
 ///
 /// # Safety
 ///
@@ -572,6 +574,12 @@ fn from(b: &T) -> Self {
     }
 }
=20
+impl<T: OwnableRefCounted> From<Owned<T>> for ARef<T> {
+    fn from(b: Owned<T>) -> Self {
+        T::into_shared(b)
+    }
+}
+
 impl<T: RefCounted> Drop for ARef<T> {
     fn drop(&mut self) {
         // SAFETY: The type invariants guarantee that the `ARef` owns the =
reference we're about to
diff --git a/rust/kernel/types/ownable.rs b/rust/kernel/types/ownable.rs
index 80cd990f6601767aa5a742a6c0997f4f67d06453..b5626dead6bb25ea76a0ae577db=
1b130308d98b1 100644
--- a/rust/kernel/types/ownable.rs
+++ b/rust/kernel/types/ownable.rs
@@ -2,6 +2,7 @@
=20
 //! Owned reference types.
=20
+use crate::types::{ARef, RefCounted};
 use core::{
     marker::PhantomData,
     mem::ManuallyDrop,
@@ -18,8 +19,9 @@
 ///
 /// Note: Implementing this trait allows types to be wrapped in an [`Owned=
<Self>`]. This does not
 /// provide reference counting but represents a unique, owned reference. I=
f reference counting is
-/// required [`RefCounted`](crate::types::RefCounted) should be implemente=
d which allows types to be
-/// wrapped in an [`ARef<Self>`](crate::types::ARef).
+/// required [`RefCounted`] should be implemented which allows types to be=
 wrapped in an
+/// [`ARef<Self>`]. Implementing the trait [`OwnableRefCounted`] allows to=
 convert between unique
+/// and shared references (i.e. [`Owned<Self>`] and [`ARef<Self>`]).
 ///
 /// # Safety
 ///
@@ -132,3 +134,124 @@ fn drop(&mut self) {
         unsafe { T::release(self.ptr) };
     }
 }
+
+/// A trait for objects that can be wrapped in either one of the reference=
 types [`Owned`] and
+/// [`ARef`].
+///
+/// # Safety
+///
+/// Implementers must ensure that:
+///
+/// - [`try_from_shared()`](OwnableRefCounted::into_shared) only returns a=
n [`Owned<Self>`] if
+///   exactly one [`ARef<Self>`] exists.
+/// - [`into_shared()`](OwnableRefCounted::into_shared) set the reference =
count to the value which
+///   the returned [`ARef<Self>`] expects for an object with a single refe=
rence in existence. This
+///   implies that if [`into_shared()`](OwnableRefCounted::into_shared) is=
 left on the default
+///   implementation, which just rewraps the underlying object, the refere=
nce count needs not to be
+///   modified when converting an [`Owned<Self>`] to an [`ARef<Self>`].
+///
+/// # Examples
+///
+/// A minimal example implementation of [`OwnableRefCounted`], [`Ownable`]=
 and its usage with
+/// [`ARef`] and [`Owned`] looks like this:
+///
+/// ```
+/// # #![expect(clippy::disallowed_names)]
+/// use core::cell::Cell;
+/// use core::ptr::NonNull;
+/// use kernel::alloc::{flags, kbox::KBox, AllocError};
+/// use kernel::types::{
+///     ARef, RefCounted, Owned, Ownable, OwnableRefCounted,
+/// };
+///
+/// struct Foo {
+///     refcount: Cell<usize>,
+/// }
+///
+/// impl Foo {
+///     fn new() -> Result<Owned<Self>, AllocError> {
+///         // Use a `KBox` to handle the actual allocation.
+///         let result =3D KBox::new(
+///             Foo {
+///                 refcount: Cell::new(1),
+///             },
+///             flags::GFP_KERNEL,
+///         )?;
+///         let result =3D NonNull::new(KBox::into_raw(result))
+///             .expect("Raw pointer to newly allocation KBox is null, thi=
s should never happen.");
+///         // SAFETY: We just allocated the `Foo`, thus it is valid.
+///         Ok(unsafe { Owned::from_raw(result) })
+///     }
+/// }
+///
+/// // SAFETY: We increment and decrement each time the respective functio=
n is called and only free
+/// // the `Foo` when the refcount reaches zero.
+/// unsafe impl RefCounted for Foo {
+///     fn inc_ref(&self) {
+///         self.refcount.replace(self.refcount.get() + 1);
+///     }
+///
+///     unsafe fn dec_ref(this: NonNull<Self>) {
+///         // SAFETY: The underlying object is always valid when the func=
tion is called.
+///         let refcount =3D unsafe { &this.as_ref().refcount };
+///         let new_refcount =3D refcount.get() - 1;
+///         if new_refcount =3D=3D 0 {
+///             // The `Foo` will be dropped when `KBox` goes out of scope=
.
+///             // SAFETY: The `Box<Foo>` is still alive as the old refcou=
nt is 1.
+///             unsafe { KBox::from_raw(this.as_ptr()) };
+///         } else {
+///             refcount.replace(new_refcount);
+///         }
+///     }
+/// }
+///
+/// // SAFETY: We only convert into an `Owned` when the refcount is 1.
+/// unsafe impl OwnableRefCounted for Foo {
+///     fn try_from_shared(this: ARef<Self>) -> Result<Owned<Self>, ARef<S=
elf>> {
+///         if this.refcount.get() =3D=3D 1 {
+///             // SAFETY: The `Foo` is still alive as the refcount is 1.
+///             Ok(unsafe { Owned::from_raw(ARef::into_raw(this)) })
+///         } else {
+///             Err(this)
+///         }
+///     }
+/// }
+///
+/// // SAFETY: We are not `AlwaysRefCounted`.
+/// unsafe impl Ownable for Foo {
+///     unsafe fn release(this: NonNull<Self>) {
+///         // SAFETY: Using `dec_ref()` from `RefCounted` to release is o=
kay, as the refcount is
+///         // always 1 for an `Owned<Foo>`.
+///         unsafe{ Foo::dec_ref(this) };
+///     }
+/// }
+///
+/// let foo =3D Foo::new().unwrap();
+/// let mut foo =3D ARef::from(foo);
+/// {
+///     let bar =3D foo.clone();
+///     assert!(Owned::try_from(bar).is_err());
+/// }
+/// assert!(Owned::try_from(foo).is_ok());
+/// ```
+pub unsafe trait OwnableRefCounted: RefCounted + Ownable + Sized {
+    /// Checks if the [`ARef`] is unique and convert it to an [`Owned`] it=
 that is that case.
+    /// Otherwise it returns again an [`ARef`] to the same underlying obje=
ct.
+    fn try_from_shared(this: ARef<Self>) -> Result<Owned<Self>, ARef<Self>=
>;
+
+    /// Converts the [`Owned`] into an [`ARef`].
+    fn into_shared(this: Owned<Self>) -> ARef<Self> {
+        // SAFETY: Safe by the requirements on implementing the trait.
+        unsafe { ARef::from_raw(Owned::into_raw(this)) }
+    }
+}
+
+impl<T: OwnableRefCounted> TryFrom<ARef<T>> for Owned<T> {
+    type Error =3D ARef<T>;
+    /// Tries to convert the [`ARef`] to an [`Owned`] by calling
+    /// [`try_from_shared()`](OwnableRefCounted::try_from_shared). In case=
 the [`ARef`] is not
+    /// unique, it returns again an [`ARef`] to the same underlying object=
.
+    fn try_from(b: ARef<T>) -> Result<Owned<T>, Self::Error> {
+        T::try_from_shared(b)
+    }
+}

--=20
2.49.0


