Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6893527F012;
	Wed,  2 Jul 2025 13:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462693; cv=none; b=LuR5dozj++G58dNFunRYQgCbuLuO/xkyJLD1AOa5SgviuwfRlJ+e4fILh8QGdu7y06pTkTKVmbFIj3pnak29ZMEW4AFbyYltUXQ8GBHNeRoqsOwwo7kwtvo2yQoriTMtuRoOs0EQ9WNOdmXK5aNo/4A1YProzPXS2XtGFomeQGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462693; c=relaxed/simple;
	bh=uYEviD6m/6DukLOUz1n6hydV/ZbFarkjRRLaJSugb+Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Kho5fEcB1FlBRKUt/zLEKAMD6ovgSvZg4rtybjE1G0woxSXnr/OBv1VplpImkSfcdCjLK49d8rk4Ko0Q/uKcHIpa9M4fnyhqJBFrv+nm6cF3XqRWUzhon+C1eNB7oXMfL6vZQwG2tDCHMeje5c33CUo3kvmABovdT3kiardrT+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQfIgT0x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQfIgT0x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5826CC4CEED;
	Wed,  2 Jul 2025 13:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751462692;
	bh=uYEviD6m/6DukLOUz1n6hydV/ZbFarkjRRLaJSugb+Y=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=RQfIgT0xSGQIBGCbtzg/VpYTcL6ATUV6zd7EHcoOex0vsvsTGEQzHOeRR3DaZUMqe
	 YvJaG6FKR9CVLVboJh7G/OTmfdq1i012+1n0yX/yrdVw49T4XP82ZXIJUgNxAjs5cF
	 WbaKsJFDyuqaXuChNA9YDZwtlgrI20/Mqo95Sh13lRxG7bZJR2PPTiAV4llGBiXTWf
	 UpRJRc3tPyWVlg592QDp/ttAuK0tlDKk3387fJgS5hwsgUN/H/5CMom0a5cRsjQvPN
	 WqECeFEz5goDWQ5A7JSKvMn5ydnSPrFuLCywc1XoER/ogao6f88JCl7b+CHNcpCfIB
	 Q+NetNEvB0mvw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Jul 2025 15:24:48 +0200
Message-Id: <DB1LPFAX66WG.1QL5JDCWI7RN4@kernel.org>
To: "Oliver Mangold" <oliver.mangold@pm.me>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Asahi Lina"
 <lina+kernel@asahilina.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 4/4] rust: Add `OwnableRefCounted`
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me>
 <20250618-unique-ref-v11-4-49eadcdc0aa6@pm.me>
In-Reply-To: <20250618-unique-ref-v11-4-49eadcdc0aa6@pm.me>

On Wed Jun 18, 2025 at 2:27 PM CEST, Oliver Mangold wrote:
> diff --git a/rust/kernel/types/ownable.rs b/rust/kernel/types/ownable.rs
> index 80cd990f6601767aa5a742a6c0997f4f67d06453..b5626dead6bb25ea76a0ae577=
db1b130308d98b1 100644
> --- a/rust/kernel/types/ownable.rs
> +++ b/rust/kernel/types/ownable.rs
> @@ -2,6 +2,7 @@
> =20
>  //! Owned reference types.
> =20
> +use crate::types::{ARef, RefCounted};
>  use core::{
>      marker::PhantomData,
>      mem::ManuallyDrop,
> @@ -18,8 +19,9 @@
>  ///
>  /// Note: Implementing this trait allows types to be wrapped in an [`Own=
ed<Self>`]. This does not
>  /// provide reference counting but represents a unique, owned reference.=
 If reference counting is
> -/// required [`RefCounted`](crate::types::RefCounted) should be implemen=
ted which allows types to be
> -/// wrapped in an [`ARef<Self>`](crate::types::ARef).
> +/// required [`RefCounted`] should be implemented which allows types to =
be wrapped in an
> +/// [`ARef<Self>`]. Implementing the trait [`OwnableRefCounted`] allows =
to convert between unique
> +/// and shared references (i.e. [`Owned<Self>`] and [`ARef<Self>`]).

This change should probably be in the earlier patch.

>  ///
>  /// # Safety
>  ///
> @@ -132,3 +134,124 @@ fn drop(&mut self) {
>          unsafe { T::release(self.ptr) };
>      }
>  }
> +
> +/// A trait for objects that can be wrapped in either one of the referen=
ce types [`Owned`] and
> +/// [`ARef`].
> +///
> +/// # Safety
> +///
> +/// Implementers must ensure that:
> +///
> +/// - [`try_from_shared()`](OwnableRefCounted::into_shared) only returns=
 an [`Owned<Self>`] if
> +///   exactly one [`ARef<Self>`] exists.

This shouldn't be required?

> +/// - [`into_shared()`](OwnableRefCounted::into_shared) set the referenc=
e count to the value which
> +///   the returned [`ARef<Self>`] expects for an object with a single re=
ference in existence. This
> +///   implies that if [`into_shared()`](OwnableRefCounted::into_shared) =
is left on the default
> +///   implementation, which just rewraps the underlying object, the refe=
rence count needs not to be
> +///   modified when converting an [`Owned<Self>`] to an [`ARef<Self>`].

This also seems pretty weird...

I feel like `OwnableRefCounted` is essentially just a compatibility
condition between `Ownable` and `RefCounted`. It ensures that the
ownership declared in `Ownable` corresponds to exactly one refcount
declared in `RefCounted`.

That being said, I think a `RefCounted` *always* canonically is
`Ownable` by the following impl:

    unsafe impl<T: RefCounted> Ownable for T {
        unsafe fn release(this: NonNull<Self>) {
            T::dec_ref(this)
        }
    }

So I don't think that we need this trait at all?

> +///
> +/// # Examples

If we're having an example here, then we should also have on on `Owned`.

> +///
> +/// A minimal example implementation of [`OwnableRefCounted`], [`Ownable=
`] and its usage with
> +/// [`ARef`] and [`Owned`] looks like this:
> +///
> +/// ```
> +/// # #![expect(clippy::disallowed_names)]
> +/// use core::cell::Cell;
> +/// use core::ptr::NonNull;
> +/// use kernel::alloc::{flags, kbox::KBox, AllocError};
> +/// use kernel::types::{
> +///     ARef, RefCounted, Owned, Ownable, OwnableRefCounted,
> +/// };
> +///
> +/// struct Foo {
> +///     refcount: Cell<usize>,
> +/// }
> +///
> +/// impl Foo {
> +///     fn new() -> Result<Owned<Self>, AllocError> {
> +///         // Use a `KBox` to handle the actual allocation.
> +///         let result =3D KBox::new(
> +///             Foo {
> +///                 refcount: Cell::new(1),
> +///             },
> +///             flags::GFP_KERNEL,
> +///         )?;
> +///         let result =3D NonNull::new(KBox::into_raw(result))
> +///             .expect("Raw pointer to newly allocation KBox is null, t=
his should never happen.");

I'm not really convinced that an example using `KBox` is a good one...
Maybe we should just have a local invisible `bindings` module that
exposes a `-> *mut foo`. (internally it can just create a KBox`)

> +///         // SAFETY: We just allocated the `Foo`, thus it is valid.

This isn't going through all the requirements on `from_raw`...

---
Cheers,
Benno

> +///         Ok(unsafe { Owned::from_raw(result) })
> +///     }
> +/// }
> +///
> +/// // SAFETY: We increment and decrement each time the respective funct=
ion is called and only free
> +/// // the `Foo` when the refcount reaches zero.
> +/// unsafe impl RefCounted for Foo {
> +///     fn inc_ref(&self) {
> +///         self.refcount.replace(self.refcount.get() + 1);
> +///     }
> +///
> +///     unsafe fn dec_ref(this: NonNull<Self>) {
> +///         // SAFETY: The underlying object is always valid when the fu=
nction is called.
> +///         let refcount =3D unsafe { &this.as_ref().refcount };
> +///         let new_refcount =3D refcount.get() - 1;
> +///         if new_refcount =3D=3D 0 {
> +///             // The `Foo` will be dropped when `KBox` goes out of sco=
pe.
> +///             // SAFETY: The `Box<Foo>` is still alive as the old refc=
ount is 1.
> +///             unsafe { KBox::from_raw(this.as_ptr()) };
> +///         } else {
> +///             refcount.replace(new_refcount);
> +///         }
> +///     }
> +/// }
> +///
> +/// // SAFETY: We only convert into an `Owned` when the refcount is 1.
> +/// unsafe impl OwnableRefCounted for Foo {
> +///     fn try_from_shared(this: ARef<Self>) -> Result<Owned<Self>, ARef=
<Self>> {
> +///         if this.refcount.get() =3D=3D 1 {
> +///             // SAFETY: The `Foo` is still alive as the refcount is 1=
.
> +///             Ok(unsafe { Owned::from_raw(ARef::into_raw(this)) })
> +///         } else {
> +///             Err(this)
> +///         }
> +///     }
> +/// }
> +///
> +/// // SAFETY: We are not `AlwaysRefCounted`.
> +/// unsafe impl Ownable for Foo {
> +///     unsafe fn release(this: NonNull<Self>) {
> +///         // SAFETY: Using `dec_ref()` from `RefCounted` to release is=
 okay, as the refcount is
> +///         // always 1 for an `Owned<Foo>`.
> +///         unsafe{ Foo::dec_ref(this) };
> +///     }
> +/// }
> +///
> +/// let foo =3D Foo::new().unwrap();
> +/// let mut foo =3D ARef::from(foo);
> +/// {
> +///     let bar =3D foo.clone();
> +///     assert!(Owned::try_from(bar).is_err());
> +/// }
> +/// assert!(Owned::try_from(foo).is_ok());
> +/// ```
> +pub unsafe trait OwnableRefCounted: RefCounted + Ownable + Sized {
> +    /// Checks if the [`ARef`] is unique and convert it to an [`Owned`] =
it that is that case.
> +    /// Otherwise it returns again an [`ARef`] to the same underlying ob=
ject.
> +    fn try_from_shared(this: ARef<Self>) -> Result<Owned<Self>, ARef<Sel=
f>>;
> +
> +    /// Converts the [`Owned`] into an [`ARef`].
> +    fn into_shared(this: Owned<Self>) -> ARef<Self> {
> +        // SAFETY: Safe by the requirements on implementing the trait.
> +        unsafe { ARef::from_raw(Owned::into_raw(this)) }
> +    }
> +}
> +
> +impl<T: OwnableRefCounted> TryFrom<ARef<T>> for Owned<T> {
> +    type Error =3D ARef<T>;
> +    /// Tries to convert the [`ARef`] to an [`Owned`] by calling
> +    /// [`try_from_shared()`](OwnableRefCounted::try_from_shared). In ca=
se the [`ARef`] is not
> +    /// unique, it returns again an [`ARef`] to the same underlying obje=
ct.
> +    fn try_from(b: ARef<T>) -> Result<Owned<T>, Self::Error> {
> +        T::try_from_shared(b)
> +    }
> +}

