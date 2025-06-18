Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F1527A451;
	Wed, 18 Jun 2025 21:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750281782; cv=none; b=Mk58rinJTO1WOI/6342758sOxZlj55iWKNXkFgUz5mxHy+ca3ENgl0oSaR692vYFq4qnSOcq4KoPN4qGozVR26g6uEMXC6rxLBSNtKiKSQaor2wwpk0SSAd5ThH/RNz3UtRJhLCDGmXQZ0PGQFtjjxslWVUJ807HSymTyU/GoRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750281782; c=relaxed/simple;
	bh=vQwT2nBd+4N0fXQDNoxipvCStzYgcbM53spJA2guQJ0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=moJvXEe54EE/RvZrCbSFRIVbCOjHN1kULZHvowSjlywnRcwioQE5hrCUfgAqPR2UilxdV/KYdUXZdKr3aoV20KlQyy/W/Bn/EHgY9jkFeRmk+AbqRoL/veE2Uvnc0phjWhv/KblM+6p1V74l4b6DvhlYMEhBl21KVAahDTQmNjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=smpQbFNL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="smpQbFNL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C583BC4CEE7;
	Wed, 18 Jun 2025 21:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750281782;
	bh=vQwT2nBd+4N0fXQDNoxipvCStzYgcbM53spJA2guQJ0=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=smpQbFNLY2q3nAxFYV8dezr+L7YvObXtZUquyjRYlXYMJzZVFFcTHOR6peyxmLW7c
	 ABrBQ1jN3+EFo5R8Ldy3mZslSSnZ1EpzJ8H1bafISGsEb8CRKLFp+1+FKl3auMTDB/
	 iKB0kBMi2evO0lc5PToRPcoULojk0868YFvrvR+wJzlErDTkUUDGDgNL8Lg/zLW44P
	 fFlJ+onNe6i/vBTX6XXEZklkmEdf946rssWnZ7nvtL3/9Bw77loDUtTLv5wdjXcfgh
	 yM+VECLqo7kJ4q1c4NQIHELLa3BAPTkgSCNtnjwbRGSFSxp8GrJpFTbPiZ5KPnDxoO
	 7vFSC1zvg257g==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Jun 2025 23:22:58 +0200
Message-Id: <DAPZ3WLBCBVL.3KA57Y90UKNRT@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Asahi Lina"
 <lina@asahilina.net>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 1/5] rust: types: Add Ownable/Owned types
From: "Benno Lossin" <lossin@kernel.org>
To: "Oliver Mangold" <oliver.mangold@pm.me>
X-Mailer: aerc 0.20.1
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me>
 <20250502-unique-ref-v10-1-25de64c0307f@pm.me>
 <D9VS2Q4IX7LH.3JLXQUMWYJ2FP@kernel.org> <aFE8PFNmpFeWNgTN@mango>
In-Reply-To: <aFE8PFNmpFeWNgTN@mango>

On Tue Jun 17, 2025 at 11:58 AM CEST, Oliver Mangold wrote:
> On 250514 1132, Benno Lossin wrote:
>> On Fri May 2, 2025 at 11:02 AM CEST, Oliver Mangold wrote:
>> > +///
>> > +/// # Safety
>> > +///
>> > +/// Implementers must ensure that:
>> > +/// - Any objects owned by Rust as [`Owned<T>`] stay alive while that=
 owned reference exists (i.e.
>> > +///   until the [`release()`](Ownable::release) trait method is calle=
d).
>>=20
>> I don't immediately understand what this means. How about "Any value of
>> type `Self` needs to be stored as [`Owned<Self>`]."?
>
> Let me think. The safety requirements here talk about safety of
> implementing the trait.  But if you have a `Self` which is not wrapped, y=
ou
> still cannot create an `Owned<Self>` in safe code. It's different from an
> `AlwaysRefCounted`, where an `ARef<Self>` can be created from a `&Self`.

That might be true, but AFAIK this trait is designed to be used for
stuff that has a `create_foo` and `destroy_foo` function in C returning
and taking a raw pointer to `foo` respectively. So creating it on the
stack doesn't make sense.

If we do want to make this trait more general, then we can do so, but
this is my current understanding.

>> And then ask in
>> `Owned::from_raw` for a pointer that is valid indefinitely (or at least
>> until `release` is called).
>
> So, hmm, I think one could even move this safety requirement to `Owned::f=
rom_raw()`.
>
>> > +/// - That the C code follows the usual mutable reference requirement=
s. That is, the kernel will
>> > +///   never mutate the [`Ownable`] (excluding internal mutability tha=
t follows the usual rules)
>> > +///   while Rust owns it.
>>=20
>> I feel like this requirement is better put on the `Owned::from_raw`
>> function.
>
> Together with the above, this would leave to safety requirements for `Own=
able.
> Make `Ownable` a safe trait, then? Instead of safety requirements just ad=
d an invariant:
>
>     # Invariant
>    =20
>     An `Owned<Self>` represents a unique reference to a `Self`, thus hold=
ing
>     an `Owned<Self>` or `&mut Owned<Self>` allows one to assume that the =
object
>     is not accessed concurrently from elsewhere.
>
> Not sure what is best. Would that make sense?

Making it safe makes sense, when we can move all requirements to
`Owned::from_raw`. I don't think the invariants section makes sense, how
would the trait have any influence in that when `Owned::from_raw`
already guarantees it?

---
Cheers,
Benno
