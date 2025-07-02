Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368CC2676E6;
	Wed,  2 Jul 2025 11:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751454232; cv=none; b=lt6rhCxWC+p14ljctHcoYXrUCIEDEFbdD/JoZUPBnkwu+YoPgpM/XToOWuiN/bVKPwP2judMhBcGM4VsON6TWGRqaEPz8os4vQzeRI6tI0rKeJnsb/QXoyze/QyM91XHcSZFz258kD29sXGn5ZDxmffQO/GUL0zppkRdFC7zyDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751454232; c=relaxed/simple;
	bh=uu6AfIohInP3Mgzha6zPCTI5vgvL1syt3xRV6g5cXhY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=siBsdtpRtvs/YnvtaRe/KIjiTBYV5nKu9rx0aPgER4zKYIT8Wk+EvXQz+n2ehrOIp+n42jhp0HcZF8PfeE3YQmMsarDm4Hwy6e1spmhrRu02ARQrzj+zTZ+Sg1Y5OXxcdDBU9JIaVfXkr+O5NQBqyQ+CmW5tJKYJ0A4yd5fYy4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lq61jscJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lq61jscJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 823A5C4CEF1;
	Wed,  2 Jul 2025 11:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751454231;
	bh=uu6AfIohInP3Mgzha6zPCTI5vgvL1syt3xRV6g5cXhY=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Lq61jscJZYLaC/eKYJlchCrNe+Daok3U78TmfnFNq+eJ5eW98SoetYTZoo3utWPPI
	 d0b+Px0r1K2Pp3SBLqocGnXRBouOcM2m9cHCaLvR4RngLtUtqup5s8IMOf+TO2FSem
	 Nnvhxdk0/zZXJL5MkWp14oxX2n7oV1rh+ZrrJLJIYRNYTRJlup5bG9LSzZxpbjufG3
	 aCqzFqwiqnUYa7xwcbwkZ7Z8coZ/NYaGfhjnyn8QnrNxkcXJKTHgFXoaOoG/3PjbSf
	 7mJGG2eJ9agFt6fIRFejjbqDS+MsLmFCahiErTiRFy6UW8+6tjlisl99mwbA8hVShQ
	 wtVIPrm7RbR2w==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Jul 2025 13:03:45 +0200
Message-Id: <DB1IPFNLFDWV.2V5O73DOB2RV6@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 1/4] rust: types: Add Ownable/Owned types
From: "Benno Lossin" <lossin@kernel.org>
To: "Oliver Mangold" <oliver.mangold@pm.me>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Asahi Lina"
 <lina+kernel@asahilina.net>
X-Mailer: aerc 0.20.1
References: <20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me>
 <20250618-unique-ref-v11-1-49eadcdc0aa6@pm.me>
In-Reply-To: <20250618-unique-ref-v11-1-49eadcdc0aa6@pm.me>

On Wed Jun 18, 2025 at 2:27 PM CEST, Oliver Mangold wrote:
> From: Asahi Lina <lina+kernel@asahilina.net>
>
> By analogy to `AlwaysRefCounted` and `ARef`, an `Ownable` type is a
> (typically C FFI) type that *may* be owned by Rust, but need not be. Unli=
ke
> `AlwaysRefCounted`, this mechanism expects the reference to be unique
> within Rust, and does not allow cloning.
>
> Conceptually, this is similar to a `KBox<T>`, except that it delegates
> resource management to the `T` instead of using a generic allocator.
>
> Link: https://lore.kernel.org/all/20250202-rust-page-v1-1-e3170d7fe55e@as=
ahilina.net/
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> [ om:
>   - split code into separate file and `pub use` it from types.rs
>   - make from_raw() and into_raw() public
>   - fixes to documentation and commit message
> ]
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> ---
>  rust/kernel/types.rs         |   7 +++
>  rust/kernel/types/ownable.rs | 134 +++++++++++++++++++++++++++++++++++++=
++++++

I think we should name this file `owned.rs` instead. It's also what
we'll have for `ARef` when that is moved to `sync/`.

Also, I do wonder does this really belong into the `types` module? I
feel like it's becoming our `utils` module and while it does fit, I
think we should just make this a top level module. So
`rust/kernel/owned.rs`. Thoughts?

>  2 files changed, 141 insertions(+)
>
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index 22985b6f69820d6df8ff3aae0bf815fad36a9d92..c12ff4d2a3f2d79b760c34c0b=
84a51b507d0cfb1 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -11,6 +11,9 @@
>  };
>  use pin_init::{PinInit, Zeroable};
> =20
> +pub mod ownable;
> +pub use ownable::{Ownable, OwnableMut, Owned};
> +
>  /// Used to transfer ownership to and from foreign (non-Rust) languages.
>  ///
>  /// Ownership is transferred from Rust to a foreign language by calling =
[`Self::into_foreign`] and
> @@ -425,6 +428,10 @@ pub const fn raw_get(this: *const Self) -> *mut T {
>  /// Rust code, the recommendation is to use [`Arc`](crate::sync::Arc) to=
 create reference-counted
>  /// instances of a type.
>  ///
> +/// Note: Implementing this trait allows types to be wrapped in an [`ARe=
f<Self>`]. It requires an
> +/// internal reference count and provides only shared references. If uni=
que references are required
> +/// [`Ownable`] should be implemented which allows types to be wrapped i=
n an [`Owned<Self>`].
> +///
>  /// # Safety
>  ///
>  /// Implementers must ensure that increments to the reference count keep=
 the object alive in memory
> diff --git a/rust/kernel/types/ownable.rs b/rust/kernel/types/ownable.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..f4065a0d627a62d3ecb15edab=
f306e9b812556e1
> --- /dev/null
> +++ b/rust/kernel/types/ownable.rs
> @@ -0,0 +1,134 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Owned reference types.

I think it's a good idea to expand the docs here a bit.

> +
> +use core::{
> +    marker::PhantomData,
> +    mem::ManuallyDrop,
> +    ops::{Deref, DerefMut},
> +    ptr::NonNull,
> +};
> +
> +/// Types that may be owned by Rust code or borrowed, but have a lifetim=
e managed by C code.

This seems wrong, `var: Owned<T>` should life until `min(var, T)`, so
whatever is earlier: until the user drops the `var` or `T`'s lifetime
ends.

How about we just say:

    Type allocated and destroyed on the C side, but owned by Rust.

> +///
> +/// It allows such types to define their own custom destructor function =
to be called when a
> +/// Rust-owned reference is dropped.

We shouldn't call this a reference. Also we should start the first
paragraph with how this trait enables the usage of `Owned<Self>`.

> +///
> +/// This is usually implemented by wrappers to existing structures on th=
e C side of the code.
> +///
> +/// Note: Implementing this trait allows types to be wrapped in an [`Own=
ed<Self>`]. This does not
> +/// provide reference counting but represents a unique, owned reference.=
 If reference counting is
> +/// required [`AlwaysRefCounted`](crate::types::AlwaysRefCounted) should=
 be implemented which allows
> +/// types to be wrapped in an [`ARef<Self>`](crate::types::ARef).

I think this is more confusing than helpful. We should mention
`AlwaysRefCounted`, but the phrasing needs to be changed. Something
along the lines: if you need reference counting, implement
`AlwaysRefCounted` instead.

> +///
> +/// # Safety
> +///
> +/// Implementers must ensure that:
> +/// - The [`release()`](Ownable::release) method leaves the underlying o=
bject in a state which the
> +///   kernel expects after ownership has been relinquished (i.e. no dang=
ling references in the
> +///   kernel is case it frees the object, etc.).

This invariant sounds weird to me. It's vague "a state which the kernel
expects" and difficult to use (what needs this invariant?).

> +pub unsafe trait Ownable {
> +    /// Releases the object (frees it or returns it to foreign ownership=
).

Let's remove the part in parenthesis.

> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that:
> +    /// - `this` points to a valid `Self`.
> +    /// - The object is no longer referenced after this call.

s/The object/`*this`/

s/referenced/used/

> +    unsafe fn release(this: NonNull<Self>);
> +}
> +
> +/// Type where [`Owned<Self>`] derefs to `&mut Self`.

How about:

    Type allowing mutable access via [`Owned<Self>`].

> +///
> +/// # Safety
> +///
> +/// Implementers must ensure that access to a `&mut T` is safe, implying=
 that:

s/T/Self/

> +/// - It is safe to call [`core::mem::swap`] on the [`Ownable`]. This ex=
cludes pinned types
> +///   (i.e. most kernel types).

Can't we implicitly pin `Owned`?

> +/// - The kernel will never access the underlying object (excluding inte=
rnal mutability that follows
> +///   the usual rules) while Rust owns it.
> +pub unsafe trait OwnableMut: Ownable {}
> +
> +/// An owned reference to an ownable kernel object.

How about
   =20
    An owned `T`.

> +///
> +/// The object is automatically freed or released when an instance of [`=
Owned`] is
> +/// dropped.

I don't think we need to say this, I always assume this for all Rust
types except they document otherwise (eg `ManuallyDrop`, `MaybeUninit`
and thus also `Opaque`.)

How about we provide some examples here?

> +///
> +/// # Invariants
> +///
> +/// The pointer stored in `ptr` can be considered owned by the [`Owned`]=
 instance.

What exactly is "owned" supposed to mean? It depends on the concrete `T`
and that isn't well-defined (since it's a generic)...

Maybe we should give `Ownable` the task to document the exact ownership
semantics of `T`?

> +pub struct Owned<T: Ownable> {
> +    ptr: NonNull<T>,
> +    _p: PhantomData<T>,
> +}
> +
> +// SAFETY: It is safe to send `Owned<T>` to another thread when the unde=
rlying `T` is `Send` because
> +// it effectively means sending a `&mut T` (which is safe because `T` is=
 `Send`).

How does this amount to sending a `&mut T`?

I guess this also needs to be guaranteed by `Owned::from_raw`... ah the
list grows...

I'll try to come up with something to simplify this design a bit wrt the
safety docs.

> +unsafe impl<T: Ownable + Send> Send for Owned<T> {}
> +
> +// SAFETY: It is safe to send `&Owned<T>` to another thread when the und=
erlying `T` is `Sync`
> +// because it effectively means sharing `&T` (which is safe because `T` =
is `Sync`).

Same here.

> +unsafe impl<T: Ownable + Sync> Sync for Owned<T> {}
> +
> +impl<T: Ownable> Owned<T> {
> +    /// Creates a new instance of [`Owned`].
> +    ///
> +    /// It takes over ownership of the underlying object.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that:
> +    /// - Ownership of the underlying object can be transferred to the `=
Owned<T>` (i.e. operations
> +    ///   which require ownership will be safe).
> +    /// - No other Rust references to the underlying object exist. This =
implies that the underlying
> +    ///   object is not accessed through `ptr` anymore after the functio=
n call (at least until the
> +    ///   the `Owned<T>` is dropped).
> +    /// - The C code follows the usual shared reference requirements. Th=
at is, the kernel will never
> +    ///   mutate or free the underlying object (excluding interior mutab=
ility that follows the usual
> +    ///   rules) while Rust owns it.
> +    /// - In case `T` implements [`OwnableMut`] the previous requirement=
 is extended from shared to
> +    ///   mutable reference requirements. That is, the kernel will not m=
utate or free the underlying
> +    ///   object and is okay with it being modified by Rust code.
> +    pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
> +        // INVARIANT: The safety requirements guarantee that the new ins=
tance now owns the
> +        // reference.

This doesn't follow for me. Well the first issue is that the safety
invariant of `Self` isn't well-defined, so let's revisit this when that
is fixed.

---
Cheers,
Benno

> +        Self {
> +            ptr,
> +            _p: PhantomData,
> +        }
> +    }
> +
> +    /// Consumes the [`Owned`], returning a raw pointer.
> +    ///
> +    /// This function does not actually relinquish ownership of the obje=
ct. After calling this
> +    /// function, the caller is responsible for ownership previously man=
aged
> +    /// by the [`Owned`].
> +    pub fn into_raw(me: Self) -> NonNull<T> {
> +        ManuallyDrop::new(me).ptr
> +    }
> +}
> +
> +impl<T: Ownable> Deref for Owned<T> {
> +    type Target =3D T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: The type invariants guarantee that the object is vali=
d.
> +        unsafe { self.ptr.as_ref() }
> +    }
> +}
> +
> +impl<T: OwnableMut> DerefMut for Owned<T> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        // SAFETY: The type invariants guarantee that the object is vali=
d, and that we can safely
> +        // return a mutable reference to it.
> +        unsafe { self.ptr.as_mut() }
> +    }
> +}
> +
> +impl<T: Ownable> Drop for Owned<T> {
> +    fn drop(&mut self) {
> +        // SAFETY: The type invariants guarantee that the `Owned` owns t=
he object we're about to
> +        // release.
> +        unsafe { T::release(self.ptr) };
> +    }
> +}

