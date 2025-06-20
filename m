Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326A922A1E9;
	Fri, 20 Jun 2025 08:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406954; cv=none; b=FDSKMW/sTlJ2+QiVDa8S345mWWmmWNhcLZGupMQsCDMpEurYIlBVkMnF7SzejtPKQSb2VdMIXZ05U5dOd1gjTl9BCDOrIjQsoorLk/pREzWtQUahAD+4/Y92mjW2Vrnp0PynQANsKeZF1MJ2UfnTNwQAjO9xF6AtLKLzfsD9NX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406954; c=relaxed/simple;
	bh=HYKgPE/DTO/7zsFIBAmEO/1XOE3FM0lL5rL2FL+sL6A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=PjPbjU64/9iM/ljpQXAR66tLVWmQuVtQxqWIFfYMiLsjcH7W48Lbg06tc9jtCeIMZ6fLgop94zFL+P4tZnENaP2ysEQXr3zYjGPgxL5gbpXEdkxC6ikB5gQZ8zHN1HyhLC4gb+erfj0lItGu/PLok43xFJZohHgy51nqkUCudnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O6tq1Rld; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O6tq1Rld"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C1CC4CEE3;
	Fri, 20 Jun 2025 08:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750406953;
	bh=HYKgPE/DTO/7zsFIBAmEO/1XOE3FM0lL5rL2FL+sL6A=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=O6tq1RldxFCSz69QTSzSi01QVUpNTc9ubgFmOL2ftfR1Dbdc6F0m2VK39Y62TBs5f
	 /M6mnbPXOH/MV6SlBrJsD1PRR6WP2+ErtIklPS+jIiltN84axYSeTvC/v28jk8Km0J
	 rJfABbbAr6giDJxqUHCIXd0aYdm4KLd8idAnZVLrwnHwwv4fb3iTV2lx4TaNmUCBgE
	 jNDjyaMA5CLp/6jcX7hEvDnHlsRkzOBHjucXUizxf/M2ZMLbos+bvDoBeRfKw+t0q9
	 jmTISXAgprzEuE9RtzGF2Yz9fS/EgF4VwBCg+x8Mdq6XJtTiHi2O7t7jCi0/SAhBWw
	 0fK9NeCQxp9ZA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Jun 2025 10:09:09 +0200
Message-Id: <DAR7H7EY3ITC.1VEEK0VQCUGAJ@kernel.org>
Subject: Re: [PATCH v10 1/5] rust: types: Add Ownable/Owned types
From: "Benno Lossin" <lossin@kernel.org>
To: "Oliver Mangold" <oliver.mangold@pm.me>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Asahi Lina"
 <lina@asahilina.net>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me>
 <20250502-unique-ref-v10-1-25de64c0307f@pm.me>
 <D9VS2Q4IX7LH.3JLXQUMWYJ2FP@kernel.org> <aFE8PFNmpFeWNgTN@mango>
 <DAPZ3WLBCBVL.3KA57Y90UKNRT@kernel.org> <aFUHWtE2dm3_-Rbs@mango>
In-Reply-To: <aFUHWtE2dm3_-Rbs@mango>

On Fri Jun 20, 2025 at 9:01 AM CEST, Oliver Mangold wrote:
> On 250618 2322, Benno Lossin wrote:
>> On Tue Jun 17, 2025 at 11:58 AM CEST, Oliver Mangold wrote:
>> > On 250514 1132, Benno Lossin wrote:
>> >> On Fri May 2, 2025 at 11:02 AM CEST, Oliver Mangold wrote:
>> >> > +///
>> >> > +/// # Safety
>> >> > +///
>> >> > +/// Implementers must ensure that:
>> >> > +/// - Any objects owned by Rust as [`Owned<T>`] stay alive while t=
hat owned reference exists (i.e.
>> >> > +///   until the [`release()`](Ownable::release) trait method is ca=
lled).
>> >>
>> >> I don't immediately understand what this means. How about "Any value =
of
>> >> type `Self` needs to be stored as [`Owned<Self>`]."?
>> >
>> > Let me think. The safety requirements here talk about safety of
>> > implementing the trait.  But if you have a `Self` which is not wrapped=
, you
>> > still cannot create an `Owned<Self>` in safe code. It's different from=
 an
>> > `AlwaysRefCounted`, where an `ARef<Self>` can be created from a `&Self=
`.
>>=20
>> That might be true, but AFAIK this trait is designed to be used for
>> stuff that has a `create_foo` and `destroy_foo` function in C returning
>> and taking a raw pointer to `foo` respectively. So creating it on the
>> stack doesn't make sense.
>
> I didn't mean creating one on the stack, but keeping it in a raw pointer =
or
> `NonNull<T>`, not bothering to wrap in in an `Owned<T>`. But doesn't
> matter. In any case in v11 (which predates your answer), I moved this
> requirement to `Owned::from_raw()`, as, you asked below, which should be
> okay as that function is the only way to create an `Owned<T>`. But I can
> add the "needs to be stored as `Owned<Self>`" requirement, if you think i=
t
> is important.

I'm not so sure, it depends on what we want `Owned<T>` to be. When I
take a look at v11, I might be able to figure it out.

---
Cheers,
Benno
