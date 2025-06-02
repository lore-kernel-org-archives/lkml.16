Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A3B23CE;
	Mon,  2 Jun 2025 20:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748895679; cv=none; b=tvq6Q/A5LrcACQiS1PBrwDet5dmAdLlgZL+Ss3NDRKBLZaXw284d9jdflNBo/81L09bemiVYiUlvpEkk2X0jQyTqSXoFzgOx4qxIkF2VeRcJT7MvNRsI7Iuj9xs1AsSApxLInzn4DDYfJ2ssK0ugjYnO237BVXEDYiKxjG5+MU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748895679; c=relaxed/simple;
	bh=AbAA39BeBTC8EmhrmyqS8RkGk6nWxaurq2Bfwb7Nqnk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DVlvvM/WXmD7f9Gwe22ZdCGSK56/uz2nDh4PRjarLSLY5ajY30wh19WRcR9Ta8FOtSOVXntEhcL+2m4HL7KR7w1uJ2YND4gvDL+yDKS+p4dvmlrmLlAwepXLNBCfG4qlbc7JFwP+tNhd48sgFp++fuPADD5gJwwMjRUCuEDSK7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEtJU/A1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEtJU/A1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4C2C4CEEB;
	Mon,  2 Jun 2025 20:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748895677;
	bh=AbAA39BeBTC8EmhrmyqS8RkGk6nWxaurq2Bfwb7Nqnk=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=AEtJU/A1P3nHbXf7T19nOoS/9Gz0iXSgES9cbwE/ydWE4+1GVegRqPp9VHlBuyYyE
	 NL9+Krh0dS1mY7x0BI4dcETR1MSZUlJUjJbpnnja/wCFn2+X9itn4AqqoL37mMBEBp
	 hzUqD4XQUwM9nwUzlKqWHY3KjrIenpKQsfEfBUZnFCKk728z6EZGcXFSP6o6i+c4JC
	 LtsQ0E/9h/KEsTGQ9pTcloF0Y3oxy3n5zqHQzBAnvcFgsfP+JMccppi++Um6tGxmPH
	 ALx/gJgm72fT6urXkoXH21NzH3lxnZg+MkbMpgrwGKvHvL4HzwwpowfpoPbiFrpeV1
	 0c0lFx6g3K8Eg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Jun 2025 22:21:12 +0200
Message-Id: <DACBRWLT0TOK.3BLVIST5ICH36@kernel.org>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] rust: alloc: implement `Borrow` and `BorrowMut` for
 `Vec`
From: "Benno Lossin" <lossin@kernel.org>
To: "Boqun Feng" <boqun.feng@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1
References: <20250601-borrow_impls-v1-0-e1caeb428db4@nvidia.com>
 <20250601-borrow_impls-v1-1-e1caeb428db4@nvidia.com>
 <DABBUFXP4O5X.1JG9O6Z2BRAQX@kernel.org>
 <DABND24P80ZZ.NLCKU3AYPN4X@nvidia.com> <aD29_GfdV02X4q5N@Mac.home>
In-Reply-To: <aD29_GfdV02X4q5N@Mac.home>

On Mon Jun 2, 2025 at 5:06 PM CEST, Boqun Feng wrote:
> On Mon, Jun 02, 2025 at 10:13:22AM +0900, Alexandre Courbot wrote:
>> On Mon Jun 2, 2025 at 1:11 AM JST, Benno Lossin wrote:
>> > On Sun Jun 1, 2025 at 5:00 AM CEST, Alexandre Courbot wrote:
>> >> Implement these two common traits, which allow generic types to store
>> >> either an owned value or a reference to it.
>> >
>> > I don't understand the second part of the sentence.
>>=20
>> I want to say that Borrow allows you to do something like:
>>=20
>>     struct Foo<B: Borrow<u32>>(B);
>>=20
>>     // `foo1` owns its value...
>>     let foo1 =3D Foo(0x12);
>>=20
>>     let i =3D 0x24;
>>     // ... but `foo2` just borrows it, subject to the lifetime of `i`.
>>     let foo2 =3D Foo(&i);
>>=20
>> And the implementations in this series also let you do:
>>=20
>>     // `foo3`'s value is owned, but heap-allocated
>>     let foo3 =3D Arc::new(KBox::new(0x56, GFP_KERNEL)?);
>>=20
>>     let j =3D Arc::new(0x78, GFP_KERNEL)?;
>>     // `foo4`'s value is shared and its lifetime runtime-managed.
>>     let foo4 =3D Foo(j.clone());
>
> Maybe you could put these in the "# Examples" section before impl
> blocks. E.g
>
> 	/// # Examples
> 	/// ```
> 	/// <you case above>
> 	/// ```
> 	impl<T, A> Borrow<[T]> for Vec<T, A> ...

Does that get rendered in the docs? If not, I don't think we should do
it.

---
Cheers,
Benno
