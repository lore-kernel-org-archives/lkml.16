Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875EB28A1D5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874143; cv=none; b=pY/yFA8dcyzavptl3Nqlwlbtvzc9NcBg0eGSt5rtu/v8P6RP+7yZZTzcrSgvYdqTLla/0DMPqzadhozcnSe3Zkb3I3qR25ObWCqOfh8zoDmhOKik+yngRyb1fugPDGckToGvHmU1dg0zv0lb3my64L9yVci3YG17IOgS30nPZXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874143; c=relaxed/simple;
	bh=yVwJr8aTR432s0rBM+n7RBaGuFfXXDj39+PJzBsRSa8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SOrSFqn+n6JsUHsi4MoNcjtkay/wqRwi216EXOSEbHKMJOfKcKIbenK9oDQv82JP23tQF7XdbuWaB4ASHg3WHsWtghwTHBmBdQmpK9t6f6/fG5xMfkJ5n48XWPaRz6CnTO2DunszTLz8yYuS6tkcWwvxDBuOSSCnzd8wPhjmLl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=aKSXO0BV; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="aKSXO0BV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1751874137; x=1752133337;
	bh=B36w5AqVLdS7ID+Qou3MMKc+btIXvIpkpVMniRAbSVI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=aKSXO0BVIPGBLR0xuo/P5yD6wONOOrOk5VIoSJOTk/euuMIX4CNTH9Yt5klyEO5dJ
	 tvVLRClKLPMcAA906aUSHa1gcb81S7EJz+ET8sEnwRN0vhVtjz/f+y86gikaIZIfTS
	 17VBIRxTH6x+5BZhzc7HDbbqOTcGPK931GHjaZ/NN0QeGMyfA5TMRH12wTp2GMNCxY
	 8YV5bI4MnAtIeX6hUULo/r9J05gHOH9Sb4JI/KzSrn31h61tYqQoAXgfugHVwBsk8R
	 3Nclmi9FylU051GeWrEWtTscNGrMnVkA+l3x7oo6pdpqA59F87+skc3/C7dEqnct+/
	 LUKi3Y5ZnftMw==
Date: Mon, 07 Jul 2025 07:42:14 +0000
To: Benno Lossin <lossin@kernel.org>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina+kernel@asahilina.net>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 2/4] rust: Split `AlwaysRefCounted` into two traits
Message-ID: <aGt6U2jCDnU7dzRA@mango>
In-Reply-To: <DB1J4UQLG76V.69HKATSZZVNO@kernel.org>
References: <20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me> <20250618-unique-ref-v11-2-49eadcdc0aa6@pm.me> <DB1J4UQLG76V.69HKATSZZVNO@kernel.org>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 7f80a12fdc11ce419642d5cb2b1a3f748f0744db
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 250702 1323, Benno Lossin wrote:
> On Wed Jun 18, 2025 at 2:27 PM CEST, Oliver Mangold wrote:
> > diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> > index c12ff4d2a3f2d79b760c34c0b84a51b507d0cfb1..40c0138bd336057e7d3a835=
a9e81391baa2fd2b1 100644
> > --- a/rust/kernel/types.rs
> > +++ b/rust/kernel/types.rs
> > @@ -418,11 +418,9 @@ pub const fn raw_get(this: *const Self) -> *mut T =
{
> >      }
> >  }
> >
> > -/// Types that are _always_ reference counted.
> > +/// Types that are internally reference counted.
> >  ///
> >  /// It allows such types to define their own custom ref increment and =
decrement functions.
> > -/// Additionally, it allows users to convert from a shared reference `=
&T` to an owned reference
> > -/// [`ARef<T>`].
> >  ///
> >  /// This is usually implemented by wrappers to existing structures on =
the C side of the code. For
> >  /// Rust code, the recommendation is to use [`Arc`](crate::sync::Arc) =
to create reference-counted
> > @@ -438,9 +436,8 @@ pub const fn raw_get(this: *const Self) -> *mut T {
> >  /// at least until matching decrements are performed.
> >  ///
> >  /// Implementers must also ensure that all instances are reference-cou=
nted. (Otherwise they
> > -/// won't be able to honour the requirement that [`AlwaysRefCounted::i=
nc_ref`] keep the object
> > -/// alive.)
> > -pub unsafe trait AlwaysRefCounted {
> > +/// won't be able to honour the requirement that [`RefCounted::inc_ref=
`] keep the object alive.)
> > +pub unsafe trait RefCounted {
> >      /// Increments the reference count on the object.
> >      fn inc_ref(&self);
>=20
> This seems a bit problematic for `Owned`, since now I can do:
>=20
>     fn bad<T: Ownable + RefCounted>(t: &Owned<T>) {
>         t.inc_ref();
>     }
>=20
> And now the `Owned<T>` is no longer "unique" in the sense that the
> refcount is 1...

Yes, that is clear. But that isn't a soundness issue or is it? It just
means the `T` can be leaked, but that cannot be prevented anyway.

> Similarly, we should probably make this an associated function, such
> that people don't accidentally call `.inc_ref()` on `ARef<T>`.
>=20
> > @@ -453,11 +450,21 @@ pub unsafe trait AlwaysRefCounted {
> >      /// Callers must ensure that there was a previous matching increme=
nt to the reference count,
> >      /// and that the object is no longer used after its reference coun=
t is decremented (as it may
> >      /// result in the object being freed), unless the caller owns anot=
her increment on the refcount
> > -    /// (e.g., it calls [`AlwaysRefCounted::inc_ref`] twice, then call=
s
> > -    /// [`AlwaysRefCounted::dec_ref`] once).
> > +    /// (e.g., it calls [`RefCounted::inc_ref`] twice, then calls [`Re=
fCounted::dec_ref`] once).
> >      unsafe fn dec_ref(obj: NonNull<Self>);
> >  }
> >
> > +/// An extension to RefCounted, which declares that it is allowed to c=
onvert from a shared reference
> > +/// `&T` to an owned reference [`ARef<T>`].
>=20
> This is a bit too long for the first sentence... How about
>=20
>     Always reference counted type.
>=20
>     Allows the creation of `ARef<T>` from `&T`.
>=20
> Feel free to add more information.

Yes, should be okay.

> > +///
> > +/// # Safety
> > +///
> > +/// Implementers must ensure that no safety invariants are violated by=
 upgrading an `&T` to an
> > +/// [`ARef<T>`]. In particular that implies [`AlwaysRefCounted`] and [=
`Ownable`] cannot be
> > +/// implemented for the same type, as this would allow to violate the =
uniqueness guarantee of
> > +/// [`Owned<T>`] by derefencing it into an `&T` and obtaining an [`ARe=
f`] from that.
> > +pub unsafe trait AlwaysRefCounted: RefCounted {}
>=20
> It's a bit sad that we can't just say `: !Ownable` (or rather a
> blanket-implemented marker trait, since that might land earlier). Anyone
> aware of progress in this area?

Yes. But as far as I am aware negative constraints are considered to be
deeply problematic because of combinatoric explosion in binary logic.

Best,

Oliver

