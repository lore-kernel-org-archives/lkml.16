Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA0022424C;
	Fri, 13 Jun 2025 07:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749800737; cv=none; b=CCMWnfb9BtntUkSmhCrAB/q9xoHeRX0vYqvjSRZUIIyQVNEXSlKQJGO+DTn5LeUQ8WbxiPItnvvK2qYihqtASCCSplJ4SoOcaoxYvxIGL5dP/OR72E40P28epHSTIY0wO+MGpsAawsDRnvIdnytu7kNbx4EsAiu/jjdySteVq0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749800737; c=relaxed/simple;
	bh=+Id2wnzVCrR7xLgz9/qEdJXcATcWgDxwiLjnKBiKqJ8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=HVeayQ1KswuL8L4BaKRfEFzlBVJXZFtK/tO+ihUImxVbDcbJeLTFyXE6TiyRy2vr6f0OfiGN6ZwgBdScK054K/SiaGjga1CNouw5ojhZ6KMv5ViIIphouf+HqsxuyxTMVU+70YSJQtEcao4U+9jE+Bc/X68D1RSJ/3DRc4TuNlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5jVRQ1F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5jVRQ1F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC2F6C4CEE3;
	Fri, 13 Jun 2025 07:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749800737;
	bh=+Id2wnzVCrR7xLgz9/qEdJXcATcWgDxwiLjnKBiKqJ8=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=l5jVRQ1F3tKR08AajhLrfPq54BPrS0trkc5iPHeJGgNdkdMJ5UhBPy/QY8agxVyQV
	 IFnG2LB1VLfiFDqIUSRATFlnNeFgGtzTVygUXBx8mPCCFseiNE3vMgFKnm+Wcj8s87
	 fMYkkYhJVIYeOk6UgfC6R2FAlhtxldlpGMLB1wEhG88fz/5W+Cmd4GcZ8YjhhK9v+O
	 a7xCjvFjJ0VOk8n7zk/SXoT0DZRo4c4UuVaib5VY9vhPp9KZJqpXTLJwAW3fuG8gq1
	 QnxEo+U9+t6PNLhZh2TGJNLe+HNKN0HxwXcVFPerNF0kssFOOYoTkg9IYYmOKvSz3g
	 CLpCY215mE/0Q==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Jun 2025 09:45:33 +0200
Message-Id: <DAL8LBJYGJU8.H23CBQ07RAMI@kernel.org>
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
 <DADKPKS4EAWU.D1UJEEBXKS8R@kernel.org>
 <DAL5THET602V.345BOV2PJGATF@nvidia.com>
In-Reply-To: <DAL5THET602V.345BOV2PJGATF@nvidia.com>

On Fri Jun 13, 2025 at 7:35 AM CEST, Alexandre Courbot wrote:
> On Wed Jun 4, 2025 at 4:34 PM JST, Benno Lossin wrote:
>> On Mon Jun 2, 2025 at 3:13 AM CEST, Alexandre Courbot wrote:
>>> Hi Benno,
>>>
>>> On Mon Jun 2, 2025 at 1:11 AM JST, Benno Lossin wrote:
>>>> On Sun Jun 1, 2025 at 5:00 AM CEST, Alexandre Courbot wrote:
>>>>> Implement these two common traits, which allow generic types to store
>>>>> either an owned value or a reference to it.
>>>>
>>>> I don't understand the second part of the sentence.
>>>
>>> I want to say that Borrow allows you to do something like:
>>>
>>>     struct Foo<B: Borrow<u32>>(B);
>>>
>>>     // `foo1` owns its value...
>>>     let foo1 =3D Foo(0x12);
>>>
>>>     let i =3D 0x24;
>>>     // ... but `foo2` just borrows it, subject to the lifetime of `i`.
>>>     let foo2 =3D Foo(&i);
>>>
>>> And the implementations in this series also let you do:
>>>
>>>     // `foo3`'s value is owned, but heap-allocated
>>>     let foo3 =3D Arc::new(KBox::new(0x56, GFP_KERNEL)?);
>>>
>>>     let j =3D Arc::new(0x78, GFP_KERNEL)?;
>>>     // `foo4`'s value is shared and its lifetime runtime-managed.
>>>     let foo4 =3D Foo(j.clone());
>>
>> How about something like:
>>
>>     Implement `Borrow<[T]>` and `BorrowMut<[T]>` for `Vec<T>`. This allo=
ws
>>     `Vec<T>` to be used in generic APIs asking for types implementing th=
ose
>>     traits. `[T; N]` and `&mut [T]` also implement those traits allowing
>>     users to use either owned, borrowed and heap-owned values.
>
> This is super clear, and I think I'll just reuse this message as-is if
> that's ok with you. Thanks!

Sure!

---
Cheers,
Benno
