Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6466D3FBB3;
	Tue, 17 Jun 2025 09:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750154325; cv=none; b=CoTk0Ji7qoJ/qn/GwkLx7Pws4mJGwJL2jjwP4JIFcAClFN2sjvTZ+DtmpSNs1E/aGeVXpLtMxpRGnVmoKXNUivBRLuYj4ob8eetm0if7dYwxlt3JERbQuAGVWb4QpSZC0JDvngqE/yll40SpSrUKBbJLku1GkxIFEuyMwjM+aIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750154325; c=relaxed/simple;
	bh=oijUs8+Xq9m8g16pkGlAvXjS02qo5kHFOvEoZ5KV/KA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SwG4IzU4IzgDssfMKfa9fVBDSEh164AEeqdEWpQTFg8A6TQo5bff2W4BQ8/k2Yphyze1+059PlELmAG5f+hH+OAFgLyVc7NEQG2W/flss8B6VSiV5xWSMbvhs5hXLUhDvdrprjU+3AnrIXOhU61WT+mH7qYE1GTjDOkK+q2muLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=riqfNuwL; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="riqfNuwL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1750154313; x=1750413513;
	bh=FEkYvxtOnHw+PScykAa4O9TSw3Q5mLK6W/7DjJYdtHw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=riqfNuwLrtXGjl86xzwUzt/O9uvLQ+f5/sDqpeQUXRkVcxhB4LL8oThygz5frhGMS
	 7UxBDG/Mz1Wkh3qgsZBIMnjfdebtCOCul6iJnbz9RPoQGXoLhodz4bn4L3wky6N/Gi
	 6l+rGOfXRYb4j76Hge7KeSlm0w7Gsqp0M5revdrJhi8t6cgxA15R79Rzr55PIbY7Kz
	 mXxL6KUGb5jyS3LbWZ623CHxSgW6WoNq8Zqze93E0RJpuC3Bc0fQodjYaxcxOT7AI8
	 aF2cto0azh22I8MyGPF6qXUm6D+1OxWgGhW8pLOhzLBzX7fUrf90VF+e4k6BY1ktCY
	 1rkztXu4k3/ug==
Date: Tue, 17 Jun 2025 09:58:27 +0000
To: Benno Lossin <lossin@kernel.org>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina@asahilina.net>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 1/5] rust: types: Add Ownable/Owned types
Message-ID: <aFE8PFNmpFeWNgTN@mango>
In-Reply-To: <D9VS2Q4IX7LH.3JLXQUMWYJ2FP@kernel.org>
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me> <20250502-unique-ref-v10-1-25de64c0307f@pm.me> <D9VS2Q4IX7LH.3JLXQUMWYJ2FP@kernel.org>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 11e6d017549826e14000306366a47274dad0eb41
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 250514 1132, Benno Lossin wrote:
> On Fri May 2, 2025 at 11:02 AM CEST, Oliver Mangold wrote:
> > +/// Types that may be owned by Rust code or borrowed, but have a lifet=
ime managed by C code.
> > +///
> > +/// It allows such types to define their own custom destructor functio=
n to be called when
> > +/// a Rust-owned reference is dropped.
> > +///
> > +/// This is usually implemented by wrappers to existing structures on =
the C side of the code.
>=20
> The docs should mention `AlwaysRefCounted` and when to use it instead of
> this trait. We should probably also backlink from `AlwaysRefCounted` to
> `Ownable`.

Will do.

> > +///
> > +/// # Safety
> > +///
> > +/// Implementers must ensure that:
> > +/// - Any objects owned by Rust as [`Owned<T>`] stay alive while that =
owned reference exists (i.e.
> > +///   until the [`release()`](Ownable::release) trait method is called=
).
>=20
> I don't immediately understand what this means. How about "Any value of
> type `Self` needs to be stored as [`Owned<Self>`]."?

Let me think. The safety requirements here talk about safety of
implementing the trait.  But if you have a `Self` which is not wrapped, you
still cannot create an `Owned<Self>` in safe code. It's different from an
`AlwaysRefCounted`, where an `ARef<Self>` can be created from a `&Self`.

> And then ask in
> `Owned::from_raw` for a pointer that is valid indefinitely (or at least
> until `release` is called).

So, hmm, I think one could even move this safety requirement to `Owned::fro=
m_raw()`.

> > +/// - That the C code follows the usual mutable reference requirements=
. That is, the kernel will
> > +///   never mutate the [`Ownable`] (excluding internal mutability that=
 follows the usual rules)
> > +///   while Rust owns it.
>=20
> I feel like this requirement is better put on the `Owned::from_raw`
> function.

Together with the above, this would leave to safety requirements for `Ownab=
le.
Make `Ownable` a safe trait, then? Instead of safety requirements just add =
an invariant:

    # Invariant
   =20
    An `Owned<Self>` represents a unique reference to a `Self`, thus holdin=
g
    an `Owned<Self>` or `&mut Owned<Self>` allows one to assume that the ob=
ject
    is not accessed concurrently from elsewhere.

Not sure what is best. Would that make sense?

> > +pub unsafe trait Ownable {
> > +    /// Releases the object (frees it or returns it to foreign ownersh=
ip).
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// Callers must ensure that the object is no longer referenced af=
ter this call.
> > +    unsafe fn release(this: NonNull<Self>);
> > +}
> > +
> > +/// A subtrait of Ownable that asserts that an [`Owned<T>`] or `&mut O=
wned<T>` Rust reference
> > +/// may be dereferenced into a `&mut T`.
>=20
> The "A subtrait of Ownable that asserts" sounds a bit clumsy to me, how
> about "Type where [`Owned<Self>`] derefs to `&mut Self`."?

That's okay with me.

> > +///
> > +/// # Safety
> > +///
> > +/// Implementers must ensure that access to a `&mut T` is safe, implyi=
ng that it is okay to call
> > +/// [`core::mem::swap`] on the `Ownable`. This excludes pinned types (=
meaning: most kernel types).
>=20
> I don't like that we put this requirement here, since it's actually
> something that should be asserted by `Owned::from_raw`.
> The reason for that is that anyone can call `Owned::from_raw` with a
> pointer pointing to `Self` and there is no safety requirement on that
> function that ensures the correctness of the `DerefMut` impl.
>=20
> > +pub unsafe trait OwnableMut: Ownable {}
>=20
> I don't like the name, but at the same time I also have no good
> suggestion :( I'll think some more about it.
>=20
> ---
> Cheers,
> Benno

Best regards,

Oliver

