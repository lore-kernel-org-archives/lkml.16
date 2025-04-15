Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A83218589;
	Tue, 15 Apr 2025 06:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744697258; cv=none; b=VRmXr2sg2LJZuifLeHc3lv6Xck0xADWQOGsMCGCrr/8Zu+XOaaHe2oQVJ1X/Pl5gE2vGSZDXl4ZoIx2TmVg277KJGp+IDRVOedS1PRdTNS3Z7SItlC9pEyG/viTnlWQFC0FIXuRFHXjj7HaFMsbPcfgrmj8jD1UW8Gu4aYMv7no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744697258; c=relaxed/simple;
	bh=s8wdev5wTYvKT07jw9RP07WeWwlhi1DEXyalqo7RjWY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jLSwnt4KTw+srMy71EjgydUQJRx46VHalu+6XCWrLJbYmg0o+LzUoWAsmR8PrEPU7g8jERhOP9J/GLWu7ci0LIFXWFyKHgMB6tarZwwirmve4aiugAEgHwMvIiw8dBt3CKydVWWnOfkZD3dWCYmYhIMeEQtXV7uyf9GY5PRAEKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=OzRKYkxv; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="OzRKYkxv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1744697254; x=1744956454;
	bh=UG0lLR2VMki/BGIRLd9ZkUd6VWGBVyK8ubdXDpa0Hz0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=OzRKYkxvnSR1QeB+vImZwHPUUk7Ldg8wUc4+86tyQ1i3GSU9hW7/MyoD3KmqwrX9O
	 e1GvyqYzbWaofwaODI/VKF+1bOSUNVBRFRGbTQojHUJpidfoqWEQkBB4pN9lKqwwd/
	 P9xzPtbbta0GoXJgO4OaaSE9/PmLa/uEx9rLN7s+OUSROf01xiEhF9NYJThT7CcUjP
	 ZBFnl7iZ2gcFrp/SjcrNK/mZyY+k0RfrOUV96WCzVo1jM8RJttjtSCLtd7vjaaH/1u
	 F0MFAgPB57XDkKmoyHknWyQxDbVh1rtJYt592HdMxYHcaUjx9NmyHnXijlqf6v73P4
	 LKe5a1QSsuJ1A==
Date: Tue, 15 Apr 2025 06:07:30 +0000
To: Andreas Hindborg <a.hindborg@kernel.org>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina@asahilina.net>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 3/5] rust: Add missing SAFETY documentation for ARef example
Message-ID: <Z_33ntAgpRU_541N@mango>
In-Reply-To: <87a58pd6t4.fsf@kernel.org>
References: <20250325-unique-ref-v9-0-e91618c1de26@pm.me> <BilXj9TIYuQxgQ8GYVKxO0m88NUME1b-jtwrV9ZX3W9GXO-QJGFpb9rChJZarPa4e2AAvgJTm_DINEIW1JINlA==@protonmail.internalid> <20250325-unique-ref-v9-3-e91618c1de26@pm.me> <87a58pd6t4.fsf@kernel.org>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 2ed9ed16ac0cceb4acbba1044782c4b878a0f66b
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 250409 1126, Andreas Hindborg wrote:
> "Oliver Mangold" <oliver.mangold@pm.me> writes:
>=20
> > SAFETY comment in rustdoc example was just 'TODO'. Fixed.
> >
> > Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> > ---
> >  rust/kernel/types.rs | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> > index c8b78bcad259132808cc38c56b9f2bd525a0b755..db29f7c725e631c11099fa9=
122901ec2b3f4a039 100644
> > --- a/rust/kernel/types.rs
> > +++ b/rust/kernel/types.rs
> > @@ -492,7 +492,7 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
> >      ///
> >      /// struct Empty {}
> >      ///
> > -    /// # // SAFETY: TODO.
> > +    /// // SAFETY: We do not free anything.
>=20
> How about:
>=20
>   This implementation will never free the underlying object, so the
>   object is kept alive longer than the safety requirement specifies.

Yes, was rather sloppy wording. Thanks, I will use your version.

> >      /// unsafe impl RefCounted for Empty {
> >      ///     fn inc_ref(&self) {}
> >      ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
> > @@ -500,7 +500,7 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
> >      ///
> >      /// let mut data =3D Empty {};
> >      /// let ptr =3D NonNull::<Empty>::new(&mut data).unwrap();
> > -    /// # // SAFETY: TODO.
> > +    /// // SAFETY: We keep `data` around longer than the `ARef`.
>=20
> This is not sufficient. The safety requirement is:
>=20
>   Callers must ensure that the reference count was incremented at least o=
nce, and that they
>   are properly relinquishing one increment. That is, if there is only one=
 increment, callers
>   must not use the underlying object anymore -- it is only safe to do so =
via the newly
>   created [`ARef`].
>=20
> How about:
>=20
>   The `RefCounted` implementation for `Empty` does not count references
>   and never frees the underlying object. Thus we can act as having a
>   refcount on the object that we pass to the newly created `ARef`.
>=20
> I think this example actually exposes a soundness hole. When the
> underlying object is allocated on the stack, the safety requirements are
> not sufficient to ensure the lifetime of the object. We could safely
> return `data_ref` and have the underlying object go away. We should add
> to the safety requirement of `ARef::from_raw`:
>=20
>   `ptr` must be valid while the refcount is positive.

Wouldn't this already be covered by the below in the doc for
AlwaysRefCounted?

    Implementers must ensure that increments to the reference count keep
    the object alive in memory at least until matching decrements are
    performed."

OTOH, it also says this (which would be violated):

    Implementers must also ensure that all instances are reference-counted.
    (Otherwise they won=E2=80=99t be able to honour the requirement that
    AlwaysRefCounted::inc_ref keep the object alive.)"

Should I change the example to one with an actual reference count?
Not sure, would make it more complex and less readable, of course.

Best regards,

Oliver

