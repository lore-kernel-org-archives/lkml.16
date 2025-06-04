Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182C52C327E;
	Wed,  4 Jun 2025 07:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749022446; cv=none; b=DGi3GFTcEmI2A4dwAhVpYX1h0o/VvHXEUN37fF9Uje+cl1/rdMNJz6fOloZUjsEK4y5xN1M0a5iRwcuoMd3eWfvOXqmJNS38AEzJ3BOgQ8IiE4h+IBfEBxd11nDPsR/Fk1V5yGO2gv0HQ3CzJnvO2ffTDi614pz8ohRC4cDMBoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749022446; c=relaxed/simple;
	bh=mdAwNb61yUTWrBJLPllVcfMeb3EZaTyAP4Mb8MRk+eA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gB/M6G+AlTJNGvYXJU8OsE95R78CrHi8X9pH+NV0cM2xqTj/wFMcWRsAiWB5HU5hj7E80CL4DvofzBEYjxgd26F4kAI56X7dD7dIl5TfuqMtWQ88obN/SV2xslXjuwnJ4oaT8tfAX+wDtTYb6dde4XVPjpASQaSf6JUFfKktRvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YO1AlZQL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YO1AlZQL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E13C4CEE7;
	Wed,  4 Jun 2025 07:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749022444;
	bh=mdAwNb61yUTWrBJLPllVcfMeb3EZaTyAP4Mb8MRk+eA=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=YO1AlZQLW2ll3z7Iri4iyDyDZ6/2VPeYEssSNiXfbZ0kGHhgYDOImhxlDP9LwxtWU
	 VmJkW97Oe6FNI5DSywy+54teIUXYFgbMhNKHJaAfYAHhBoempM2xfJXR84L6rhnGeW
	 c312MD4K/XOjQpF245+DZmN52olwwJOt4F7pCypi5hs3VDQVFX66XDgDu6Fe74wBfZ
	 8ShIyWtdjmUpvGRkVXiM18KxbI7UCyr+aDxr1ifkJjbYipIC1jdAgn9+G00r0tbpkp
	 1XyLChcq+lYmxpNedrojVqZuItEhQXb0o6Pa4QrBbcHfFGaT8def5liWynvZY8+hb9
	 iZ3EJinCWZuPQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Jun 2025 09:34:00 +0200
Message-Id: <DADKPKS4EAWU.D1UJEEBXKS8R@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] rust: alloc: implement `Borrow` and `BorrowMut` for
 `Vec`
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.20.1
References: <20250601-borrow_impls-v1-0-e1caeb428db4@nvidia.com>
 <20250601-borrow_impls-v1-1-e1caeb428db4@nvidia.com>
 <DABBUFXP4O5X.1JG9O6Z2BRAQX@kernel.org>
 <DABND24P80ZZ.NLCKU3AYPN4X@nvidia.com>
In-Reply-To: <DABND24P80ZZ.NLCKU3AYPN4X@nvidia.com>

On Mon Jun 2, 2025 at 3:13 AM CEST, Alexandre Courbot wrote:
> Hi Benno,
>
> On Mon Jun 2, 2025 at 1:11 AM JST, Benno Lossin wrote:
>> On Sun Jun 1, 2025 at 5:00 AM CEST, Alexandre Courbot wrote:
>>> Implement these two common traits, which allow generic types to store
>>> either an owned value or a reference to it.
>>
>> I don't understand the second part of the sentence.
>
> I want to say that Borrow allows you to do something like:
>
>     struct Foo<B: Borrow<u32>>(B);
>
>     // `foo1` owns its value...
>     let foo1 =3D Foo(0x12);
>
>     let i =3D 0x24;
>     // ... but `foo2` just borrows it, subject to the lifetime of `i`.
>     let foo2 =3D Foo(&i);
>
> And the implementations in this series also let you do:
>
>     // `foo3`'s value is owned, but heap-allocated
>     let foo3 =3D Arc::new(KBox::new(0x56, GFP_KERNEL)?);
>
>     let j =3D Arc::new(0x78, GFP_KERNEL)?;
>     // `foo4`'s value is shared and its lifetime runtime-managed.
>     let foo4 =3D Foo(j.clone());

How about something like:

    Implement `Borrow<[T]>` and `BorrowMut<[T]>` for `Vec<T>`. This allows
    `Vec<T>` to be used in generic APIs asking for types implementing those
    traits. `[T; N]` and `&mut [T]` also implement those traits allowing
    users to use either owned, borrowed and heap-owned values.

Also note this paragraph from the docs:

    In particular `Eq`, `Ord` and `Hash` must be equivalent for borrowed
    and owned values: `x.borrow() =3D=3D y.borrow()` should give the same
    result as `x =3D=3D y`.

(This holds for the types that you implement it for, but I wanted to
mention it)

---
Cheers,
Benno
