Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005C7283FEA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 08:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875675; cv=none; b=j3hzSmJEl+Phxn4ud8iOpZsD2cqb/xzfB0E5OKm6M8ikhdBeJ4mn6u0WQUUEiaCVx2/O9plVHsGukGVNdi/ryTW4eS4t70OQ4QEjbAOPfYRxhiHCPktboSGY4CAA/f4PZuwC6L2FhOvjM27+UTQcx/gnYP8hdldAlO5tHhmdixs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875675; c=relaxed/simple;
	bh=BreYJuDfZoFdRiabZxtNWF9SABVBZKncFsrha+MOSMw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bpLNoa4wel2pA1IT8VNuCyE97FvuYPPMkWUwIE9UEIlxxgeirWhVysltp2QrPOoubs3qUmU/hv6CTwxXTSsTnllgUeg2tPYb2elGIlvrn9L7OMiTQyjObAZcabBl7W2jGEr6M5tpWsjbmY6P3iZChB9WBRGqXFqSH2lmqpx4AmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=GSgjWZWa; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="GSgjWZWa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1751875666; x=1752134866;
	bh=eTGqtzCvOXwTu3qziUAcUbBhhfKcqKOqyU9syJBnr6M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GSgjWZWavYTnlP1AW4PKEQag9P5elGs/5VhwUpQAnf1Hii942CYuSJEvTfRyO28XS
	 9dQywgyfGftoz07t+Na6ebjSbH+ln2RtD6k/UIJ6UChsSTqe19vkUdV2GomHbXPb2o
	 kv014ypTHGbjerukjjFBjP5brP5BdBCegDT3woKf6+BBnLccspuIF3bn1TP0VmyCtI
	 RZbfkz5oMWpJmIDasGEhvFWEdZ/g0aroEETv3vhnFe59yKVo0/ehsu03Sh4J+cDas6
	 vFQeDXgtwp/spPXJQCHDfWq5hmhtmFKtLc9PVVyPSvyy/dO9Z0Or5HriU5KUfEJFb+
	 QgRYZr55oN/EA==
Date: Mon, 07 Jul 2025 08:07:40 +0000
To: Benno Lossin <lossin@kernel.org>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina+kernel@asahilina.net>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 4/4] rust: Add `OwnableRefCounted`
Message-ID: <aGuAR7JCrlmzQrx4@mango>
In-Reply-To: <DB1LPFAX66WG.1QL5JDCWI7RN4@kernel.org>
References: <20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me> <20250618-unique-ref-v11-4-49eadcdc0aa6@pm.me> <DB1LPFAX66WG.1QL5JDCWI7RN4@kernel.org>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 84a19212b4ee4925539886f811bb5b09e24fb104
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 250702 1524, Benno Lossin wrote:
> On Wed Jun 18, 2025 at 2:27 PM CEST, Oliver Mangold wrote:
> > diff --git a/rust/kernel/types/ownable.rs b/rust/kernel/types/ownable.r=
s
> > index 80cd990f6601767aa5a742a6c0997f4f67d06453..b5626dead6bb25ea76a0ae5=
77db1b130308d98b1 100644
> > --- a/rust/kernel/types/ownable.rs
> > +++ b/rust/kernel/types/ownable.rs
> > @@ -2,6 +2,7 @@
> >
> >  //! Owned reference types.
> >
> > +use crate::types::{ARef, RefCounted};
> >  use core::{
> >      marker::PhantomData,
> >      mem::ManuallyDrop,
> > @@ -18,8 +19,9 @@
> >  ///
> >  /// Note: Implementing this trait allows types to be wrapped in an [`O=
wned<Self>`]. This does not
> >  /// provide reference counting but represents a unique, owned referenc=
e. If reference counting is
> > -/// required [`RefCounted`](crate::types::RefCounted) should be implem=
ented which allows types to be
> > -/// wrapped in an [`ARef<Self>`](crate::types::ARef).
> > +/// required [`RefCounted`] should be implemented which allows types t=
o be wrapped in an
> > +/// [`ARef<Self>`]. Implementing the trait [`OwnableRefCounted`] allow=
s to convert between unique
> > +/// and shared references (i.e. [`Owned<Self>`] and [`ARef<Self>`]).
>=20
> This change should probably be in the earlier patch.

Ah, yes. Must have happened while splitting the patches.

> >  ///
> >  /// # Safety
> >  ///
> > @@ -132,3 +134,124 @@ fn drop(&mut self) {
> >          unsafe { T::release(self.ptr) };
> >      }
> >  }
> > +
> > +/// A trait for objects that can be wrapped in either one of the refer=
ence types [`Owned`] and
> > +/// [`ARef`].
> > +///
> > +/// # Safety
> > +///
> > +/// Implementers must ensure that:
> > +///
> > +/// - [`try_from_shared()`](OwnableRefCounted::into_shared) only retur=
ns an [`Owned<Self>`] if
> > +///   exactly one [`ARef<Self>`] exists.
>=20
> This shouldn't be required?

Ehm, why not? `Owned<T>` is supposed to be unique.

> > +/// - [`into_shared()`](OwnableRefCounted::into_shared) set the refere=
nce count to the value which
> > +///   the returned [`ARef<Self>`] expects for an object with a single =
reference in existence. This
> > +///   implies that if [`into_shared()`](OwnableRefCounted::into_shared=
) is left on the default
> > +///   implementation, which just rewraps the underlying object, the re=
ference count needs not to be
> > +///   modified when converting an [`Owned<Self>`] to an [`ARef<Self>`]=
.
>=20
> This also seems pretty weird...
>=20
> I feel like `OwnableRefCounted` is essentially just a compatibility
> condition between `Ownable` and `RefCounted`. It ensures that the
> ownership declared in `Ownable` corresponds to exactly one refcount
> declared in `RefCounted`.
>=20
> That being said, I think a `RefCounted` *always* canonically is
> `Ownable` by the following impl:
>=20
>     unsafe impl<T: RefCounted> Ownable for T {
>         unsafe fn release(this: NonNull<Self>) {
>             T::dec_ref(this)
>         }
>     }
>=20
> So I don't think that we need this trait at all?

No. For an `ARef<T>` to be converted to an `Owned<T>` it requires a
`try_from_shared()` implementation. It is not even a given that the
function can implemented, if all the kernel exposes are some kind of
`inc_ref()` and `dec_ref()`.

Also there are more complicated cases like with `Mq::Request`, where the
existence of an `Owned<T>` cannot be represented by the same refcount value
as the existence of exactly one `ARef<T>`.

> > +///
> > +/// # Examples
>=20
> If we're having an example here, then we should also have on on `Owned`.

Yes, maybe. I mostly felt the need to create one for `OwnableRefCounted`
because it is a more complex idea than `Ownable`.

If I remember correctly, I didn't create one for `Owned`, as it should
probably more or less the same as for `ARef` and the one there has even
more problems of the kind you are pointing out. So maybe it would be best
to wait until someone fixes that and have the fixed version copied over to
`Owned` in the process?

> > +///
> > +/// A minimal example implementation of [`OwnableRefCounted`], [`Ownab=
le`] and its usage with
> > +/// [`ARef`] and [`Owned`] looks like this:
> > +///
> > +/// ```
> > +/// # #![expect(clippy::disallowed_names)]
> > +/// use core::cell::Cell;
> > +/// use core::ptr::NonNull;
> > +/// use kernel::alloc::{flags, kbox::KBox, AllocError};
> > +/// use kernel::types::{
> > +///     ARef, RefCounted, Owned, Ownable, OwnableRefCounted,
> > +/// };
> > +///
> > +/// struct Foo {
> > +///     refcount: Cell<usize>,
> > +/// }
> > +///
> > +/// impl Foo {
> > +///     fn new() -> Result<Owned<Self>, AllocError> {
> > +///         // Use a `KBox` to handle the actual allocation.
> > +///         let result =3D KBox::new(
> > +///             Foo {
> > +///                 refcount: Cell::new(1),
> > +///             },
> > +///             flags::GFP_KERNEL,
> > +///         )?;
> > +///         let result =3D NonNull::new(KBox::into_raw(result))
> > +///             .expect("Raw pointer to newly allocation KBox is null,=
 this should never happen.");
>=20
> I'm not really convinced that an example using `KBox` is a good one...
> Maybe we should just have a local invisible `bindings` module that
> exposes a `-> *mut foo`. (internally it can just create a KBox`)

The example would become quite a bit more complicated then, no?

> > +///         // SAFETY: We just allocated the `Foo`, thus it is valid.
>=20
> This isn't going through all the requirements on `from_raw`...

Yes, this comment should probably be detailed.

Best,

Oliver

