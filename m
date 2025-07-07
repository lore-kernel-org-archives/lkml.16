Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6283A2797AB;
	Mon,  7 Jul 2025 06:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751871494; cv=none; b=iPugobOxe2p6sPxyuhKD4P93f48U9VGvSkIfLwTkmoV3LE9CooN/CPGRVkO0xfWj7iF4jqn3GNBWh16MVhsXt+syQY8QcyNuIjtwy6dOw9jcxYE4Z89GB+WCSdj6qB2Hlf3N8VtX2kb5DQaBA6K1BkSpmJjR/3rZARYtdByXs/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751871494; c=relaxed/simple;
	bh=QuwqS+8MrnD/aJe2B9yZ3QUkShfxUPXSEz4mXhp5jks=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZtKkPPxQOsxzgf3wVCLCotQlVmuwj33R03nUStGkrtlo40q3JIJNTJKQ1+pTx6qabf1fKQ9D8sCDqWRcwf6bkfkJdTK9Up6TguY1dD09mVeT1U4AFLCUHbg+iUwSWqRDqmZx1LKYJX/+sRZh6aiz95gElNnugnYyxpjM7CPc2P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=OgCt0eZX; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="OgCt0eZX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1751871489; x=1752130689;
	bh=4gyyhHWGHbnB8HN6frabXfV0QvcOoiL0TK5svu7brX8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=OgCt0eZXnJcWB8NLtdnBQtkxl0GB6guz2xJjt88lHiMSRm9mRPVXVpj6t073HekVN
	 n9F3FZM/4PxT74SVT8Php+pJVVU4bMPKJirSTmBUtcoGIkqL0+sLIDp4dStDmaBAmS
	 qvF4MYQgO4XZtgy5k889BkDUK5QbtK/o7pw4+gb1GqRabV/0Q96YZFZBtpXTNhaWsN
	 s8NMN1ouhiwR4KmIHaUAQa1Juq0FcxR0SQ/OaYpSSVKqS0qpaDPHYrY+IxFhHZz2qD
	 B8A6t/WZ1IUSelw9kanfZuxzypRRmWDRPN65v28ih0OKOhQNzSubSp0QwJDd4j7b6x
	 F5RCoKbrd9QLw==
Date: Mon, 07 Jul 2025 06:58:01 +0000
To: Benno Lossin <lossin@kernel.org>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina+kernel@asahilina.net>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 1/4] rust: types: Add Ownable/Owned types
Message-ID: <aGtv9qs682gTyQWX@mango>
In-Reply-To: <DB1IPFNLFDWV.2V5O73DOB2RV6@kernel.org>
References: <20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me> <20250618-unique-ref-v11-1-49eadcdc0aa6@pm.me> <DB1IPFNLFDWV.2V5O73DOB2RV6@kernel.org>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 94d6cf8bb8ca11cb7bf715761831682a66010d46
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 250702 1303, Benno Lossin wrote:
> On Wed Jun 18, 2025 at 2:27 PM CEST, Oliver Mangold wrote:
> > From: Asahi Lina <lina+kernel@asahilina.net>
> >
> > By analogy to `AlwaysRefCounted` and `ARef`, an `Ownable` type is a
> > (typically C FFI) type that *may* be owned by Rust, but need not be. Un=
like
> > `AlwaysRefCounted`, this mechanism expects the reference to be unique
> > within Rust, and does not allow cloning.
> >
> > Conceptually, this is similar to a `KBox<T>`, except that it delegates
> > resource management to the `T` instead of using a generic allocator.
> >
> > Link: https://lore.kernel.org/all/20250202-rust-page-v1-1-e3170d7fe55e@=
asahilina.net/
> > Signed-off-by: Asahi Lina <lina@asahilina.net>
> > [ om:
> >   - split code into separate file and `pub use` it from types.rs
> >   - make from_raw() and into_raw() public
> >   - fixes to documentation and commit message
> > ]
> > Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> > Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> > ---
> >  rust/kernel/types.rs         |   7 +++
> >  rust/kernel/types/ownable.rs | 134 +++++++++++++++++++++++++++++++++++=
++++++++
>=20
> I think we should name this file `owned.rs` instead. It's also what
> we'll have for `ARef` when that is moved to `sync/`.
>=20
> Also, I do wonder does this really belong into the `types` module? I
> feel like it's becoming our `utils` module and while it does fit, I
> think we should just make this a top level module. So
> `rust/kernel/owned.rs`. Thoughts?

I don't have much of an opinion on on that. But maybe refactoring types.rs
should be an independent task?

>=20
> > +
> > +use core::{
> > +    marker::PhantomData,
> > +    mem::ManuallyDrop,
> > +    ops::{Deref, DerefMut},
> > +    ptr::NonNull,
> > +};
> > +
> > +/// Types that may be owned by Rust code or borrowed, but have a lifet=
ime managed by C code.
>=20
> This seems wrong, `var: Owned<T>` should life until `min(var, T)`, so
> whatever is earlier: until the user drops the `var` or `T`'s lifetime
> ends.

Yes, I guess that sounds sloppy.

> How about we just say:
>=20
>     Type allocated and destroyed on the C side, but owned by Rust.

Would be okay with me.

> > +///
> > +/// It allows such types to define their own custom destructor functio=
n to be called when a
> > +/// Rust-owned reference is dropped.
>=20
> We shouldn't call this a reference. Also we should start the first
> paragraph with how this trait enables the usage of `Owned<Self>`.
>=20
> > +///
> > +/// This is usually implemented by wrappers to existing structures on =
the C side of the code.
> > +///
> > +/// Note: Implementing this trait allows types to be wrapped in an [`O=
wned<Self>`]. This does not
> > +/// provide reference counting but represents a unique, owned referenc=
e. If reference counting is
> > +/// required [`AlwaysRefCounted`](crate::types::AlwaysRefCounted) shou=
ld be implemented which allows
> > +/// types to be wrapped in an [`ARef<Self>`](crate::types::ARef).
>=20
> I think this is more confusing than helpful. We should mention
> `AlwaysRefCounted`, but the phrasing needs to be changed. Something
> along the lines: if you need reference counting, implement
> `AlwaysRefCounted` instead.

I guess you have a point. The shortened version is probably good enough.

> > +///
> > +/// # Safety
> > +///
> > +/// Implementers must ensure that:
> > +/// - The [`release()`](Ownable::release) method leaves the underlying=
 object in a state which the
> > +///   kernel expects after ownership has been relinquished (i.e. no da=
ngling references in the
> > +///   kernel is case it frees the object, etc.).
>=20
> This invariant sounds weird to me. It's vague "a state which the kernel
> expects" and difficult to use (what needs this invariant?).
>=20
> > +pub unsafe trait Ownable {
> > +    /// Releases the object (frees it or returns it to foreign ownersh=
ip).
>=20
> Let's remove the part in parenthesis.
>=20
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// Callers must ensure that:
> > +    /// - `this` points to a valid `Self`.
> > +    /// - The object is no longer referenced after this call.
>=20
> s/The object/`*this`/
>=20
> s/referenced/used/
>=20
> > +    unsafe fn release(this: NonNull<Self>);
> > +}
> > +
> > +/// Type where [`Owned<Self>`] derefs to `&mut Self`.
>=20
> How about:
>=20
>     Type allowing mutable access via [`Owned<Self>`].
>=20
> > +///
> > +/// # Safety
> > +///
> > +/// Implementers must ensure that access to a `&mut T` is safe, implyi=
ng that:
>=20
> s/T/Self/

Okay with all of the above.

> > +/// - It is safe to call [`core::mem::swap`] on the [`Ownable`]. This =
excludes pinned types
> > +///   (i.e. most kernel types).
>=20
> Can't we implicitly pin `Owned`?

I have been thinking about that. But this would mean that the blanket
implementation for `Deref` would conflict with the one for `OwnableMut`.

> > +/// - The kernel will never access the underlying object (excluding in=
ternal mutability that follows
> > +///   the usual rules) while Rust owns it.
> > +pub unsafe trait OwnableMut: Ownable {}
> > +
> > +/// An owned reference to an ownable kernel object.
>=20
> How about
>=20
>     An owned `T`.

    A wrapper around `T`.

maybe?

> > +///
> > +/// The object is automatically freed or released when an instance of =
[`Owned`] is
> > +/// dropped.
>=20
> I don't think we need to say this, I always assume this for all Rust
> types except they document otherwise (eg `ManuallyDrop`, `MaybeUninit`
> and thus also `Opaque`.)

Hmm, it is an important feature of the wrapper that it turns the `*Ownable`
into an object that is automatically dropped. So shouldn't that be
mentioned here?

> How about we provide some examples here?
>=20
> > +///
> > +/// # Invariants
> > +///
> > +/// The pointer stored in `ptr` can be considered owned by the [`Owned=
`] instance.
>=20
> What exactly is "owned" supposed to mean? It depends on the concrete `T`
> and that isn't well-defined (since it's a generic)...

"owned" means that access to the `T` is exclusive through the `Owned<T>`,
so normal Rust semantics can be applied.

> Maybe we should give `Ownable` the task to document the exact ownership
> semantics of `T`?
>=20
> > +pub struct Owned<T: Ownable> {
> > +    ptr: NonNull<T>,
> > +    _p: PhantomData<T>,
> > +}
> > +
> > +// SAFETY: It is safe to send `Owned<T>` to another thread when the un=
derlying `T` is `Send` because
> > +// it effectively means sending a `&mut T` (which is safe because `T` =
is `Send`).
>=20
> How does this amount to sending a `&mut T`?

Good point. That documentation hasn't been updated since `&mut T` access
has been split out into `OwnableMut`. Not sure how to phrase it now.

> I guess this also needs to be guaranteed by `Owned::from_raw`... ah the
> list grows...
>=20
> I'll try to come up with something to simplify this design a bit wrt the
> safety docs.
>=20
> > +unsafe impl<T: Ownable + Send> Send for Owned<T> {}
> > +
> > +// SAFETY: It is safe to send `&Owned<T>` to another thread when the u=
nderlying `T` is `Sync`
> > +// because it effectively means sharing `&T` (which is safe because `T=
` is `Sync`).
>=20
> Same here.
>=20
> > +unsafe impl<T: Ownable + Sync> Sync for Owned<T> {}
> > +
> > +impl<T: Ownable> Owned<T> {
> > +    /// Creates a new instance of [`Owned`].
> > +    ///
> > +    /// It takes over ownership of the underlying object.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// Callers must ensure that:
> > +    /// - Ownership of the underlying object can be transferred to the=
 `Owned<T>` (i.e. operations
> > +    ///   which require ownership will be safe).
> > +    /// - No other Rust references to the underlying object exist. Thi=
s implies that the underlying
> > +    ///   object is not accessed through `ptr` anymore after the funct=
ion call (at least until the
> > +    ///   the `Owned<T>` is dropped).
> > +    /// - The C code follows the usual shared reference requirements. =
That is, the kernel will never
> > +    ///   mutate or free the underlying object (excluding interior mut=
ability that follows the usual
> > +    ///   rules) while Rust owns it.
> > +    /// - In case `T` implements [`OwnableMut`] the previous requireme=
nt is extended from shared to
> > +    ///   mutable reference requirements. That is, the kernel will not=
 mutate or free the underlying
> > +    ///   object and is okay with it being modified by Rust code.
> > +    pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
> > +        // INVARIANT: The safety requirements guarantee that the new i=
nstance now owns the
> > +        // reference.
>=20
> This doesn't follow for me. Well the first issue is that the safety
> invariant of `Self` isn't well-defined, so let's revisit this when that
> is fixed.

I guess it follows from:

> > +    /// It takes over ownership of the underlying object.

Okay, sure, it not in the safety requirement.

Best,

Oliver

