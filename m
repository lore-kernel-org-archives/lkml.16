Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9437E220686
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 07:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750402925; cv=none; b=J5M/XaZ6ExnsvzvEUlKQqpTnHZprdmBm59XcLbnU0eULSA2E5yCgGHd093TaOAHvhzV4ZZllq8tcrj5Xu5cmTBnt174dV2QTmktgZ6yEMVQm1il50HuQYv2IfF3UOB1MDrfktXTxqaWSEOc6ZQseuts3vvcxhwNj29Q8b0gC0T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750402925; c=relaxed/simple;
	bh=GvtVq+ofHW/htAxcXQEoeyYdEDhq9U76CmZN6QzabDQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GdpDYy0lUpxdirH80jMZySnyWW1ZP3Vv3mBfkUaHWv3DvPZhYaZAeS97t/1urIMiLYCGrGY40IMiQrf1I98BqwekDtdkc+VqZYapDQPOwoyIDfjFl4QNWhkOI0qJW3tMD/hZEMhzamniLlgmhvM/7ddlgAXD5IeD0JSFISn4kHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=b7PVteZ6; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="b7PVteZ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1750402915; x=1750662115;
	bh=ZomiTmy/Mokp/VP87JWffaAAvQX8m1ge4zOANZCRHuw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=b7PVteZ6EfoZKxCGyQ4qMFqEB8PMbV17KjTI+ihrSYiAzRS1anxOElIeouqfRVHr/
	 lFqbVTg7DuBC1lYQX8ONyrWnDICWgGgne+M9vn8jYPtXRrDXfRiwxdosu1Xy9qaIzp
	 Mrw9NMwOmQKvv5fV9fiphrWNHgZFHMhqZiGWnUSDBHN50I+rGTkXQuaz9CU4VHBnWo
	 VcQoD7ACuBFXv+wTcVjdScPeyRkMmTVRxNgIq0CApgHPdqEWvQLXJr2UF/aP3BwMbn
	 SUPnmmZk4LZyiLrGBl5RyNzF077uOxjb0aMofuhOmkBQFZP6K9AUYlc0Qxrx2B7duR
	 dXXRXW+CRMvZg==
Date: Fri, 20 Jun 2025 07:01:49 +0000
To: Benno Lossin <lossin@kernel.org>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina@asahilina.net>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 1/5] rust: types: Add Ownable/Owned types
Message-ID: <aFUHWtE2dm3_-Rbs@mango>
In-Reply-To: <DAPZ3WLBCBVL.3KA57Y90UKNRT@kernel.org>
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me> <20250502-unique-ref-v10-1-25de64c0307f@pm.me> <D9VS2Q4IX7LH.3JLXQUMWYJ2FP@kernel.org> <aFE8PFNmpFeWNgTN@mango> <DAPZ3WLBCBVL.3KA57Y90UKNRT@kernel.org>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 6cdf635b60cf7b5d021babf819cb11d3aa65dbda
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 250618 2322, Benno Lossin wrote:
> On Tue Jun 17, 2025 at 11:58 AM CEST, Oliver Mangold wrote:
> > On 250514 1132, Benno Lossin wrote:
> >> On Fri May 2, 2025 at 11:02 AM CEST, Oliver Mangold wrote:
> >> > +///
> >> > +/// # Safety
> >> > +///
> >> > +/// Implementers must ensure that:
> >> > +/// - Any objects owned by Rust as [`Owned<T>`] stay alive while th=
at owned reference exists (i.e.
> >> > +///   until the [`release()`](Ownable::release) trait method is cal=
led).
> >>
> >> I don't immediately understand what this means. How about "Any value o=
f
> >> type `Self` needs to be stored as [`Owned<Self>`]."?
> >
> > Let me think. The safety requirements here talk about safety of
> > implementing the trait.  But if you have a `Self` which is not wrapped,=
 you
> > still cannot create an `Owned<Self>` in safe code. It's different from =
an
> > `AlwaysRefCounted`, where an `ARef<Self>` can be created from a `&Self`=
.
>=20
> That might be true, but AFAIK this trait is designed to be used for
> stuff that has a `create_foo` and `destroy_foo` function in C returning
> and taking a raw pointer to `foo` respectively. So creating it on the
> stack doesn't make sense.

I didn't mean creating one on the stack, but keeping it in a raw pointer or
`NonNull<T>`, not bothering to wrap in in an `Owned<T>`. But doesn't
matter. In any case in v11 (which predates your answer), I moved this
requirement to `Owned::from_raw()`, as, you asked below, which should be
okay as that function is the only way to create an `Owned<T>`. But I can
add the "needs to be stored as `Owned<Self>`" requirement, if you think it
is important.


> If we do want to make this trait more general, then we can do so, but
> this is my current understanding.
>=20
> >> And then ask in
> >> `Owned::from_raw` for a pointer that is valid indefinitely (or at leas=
t
> >> until `release` is called).
> >
> > So, hmm, I think one could even move this safety requirement to `Owned:=
:from_raw()`.
> >
> >> > +/// - That the C code follows the usual mutable reference requireme=
nts. That is, the kernel will
> >> > +///   never mutate the [`Ownable`] (excluding internal mutability t=
hat follows the usual rules)
> >> > +///   while Rust owns it.
> >>
> >> I feel like this requirement is better put on the `Owned::from_raw`
> >> function.
> >
> > Together with the above, this would leave to safety requirements for `O=
wnable.
> > Make `Ownable` a safe trait, then? Instead of safety requirements just =
add an invariant:
> >
> >     # Invariant
> >
> >     An `Owned<Self>` represents a unique reference to a `Self`, thus ho=
lding
> >     an `Owned<Self>` or `&mut Owned<Self>` allows one to assume that th=
e object
> >     is not accessed concurrently from elsewhere.
> >
> > Not sure what is best. Would that make sense?
>=20
> Making it safe makes sense, when we can move all requirements to
> `Owned::from_raw`. I don't think the invariants section makes sense, how
> would the trait have any influence in that when `Owned::from_raw`
> already guarantees it?

I think you are right on that. Let's not do that.

Best,

Oliver

