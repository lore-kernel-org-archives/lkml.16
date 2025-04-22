Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2518627BF60
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745320896; cv=none; b=X8pcldEqP31qLW4khUZg6IVJUBReuiIot8qiECE4atPUIYcU6zlpenXOwSZgwHpxVCm4hRYRwBcKms+pPFeo/KhovJOMc1I3H7Q7VZEtTCwrRZkgSPdCwwo7proln8RpGeUDqoOJvpdjGeepiwXznTBkwD7O3x9Y4gUlBVKKYig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745320896; c=relaxed/simple;
	bh=A1WBS2ArbcM4mlKZIrV6S7/gv9XcNRksqQmJ3gWkmK8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MbQzGSugzDmMKMI5LB8F60W9/ou8X5Ca2KmCjZLrPgJxDxw9Oxa6/fenc9Wf+DsBe1CgG6bGab6hjJr+xrIwKZIzdr92ZOzha9XYCKywA044F4w86yoGlSM8DI8LxH2e4ehElqoqoyf6E+g6Qkk/9RKCRDc0nBdIL5wMUR8S4dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=F7rvbYW1; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="F7rvbYW1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745320891; x=1745580091;
	bh=koDqDhzrpOrfQ3ZFK3sNuNKKWYvOUisTZDxVWQODIIs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=F7rvbYW18YiCaHo0dvPGTruj8GRxHPeyZTX1rpzf1MsuiLlL2qdLObWX7C1pKVUJr
	 DwXNN2z9ku1pryX/lehsUO1PeBZVQckJGyuIEvEBC7I/saxeT2YxJ/7wqkxyYJnjVc
	 WAkU2BmiM7z6dag8d7EwlkIXUiJNyChF2a7MgEPToMYkJrpArsDVKkwUnBUPmi9taG
	 vv/2Hypy8m7EoJP/q8BLvtLLVDJ1jHHn4Q0/qo94FOTH1EjFm3wQ6jQU2uBX4i2C+B
	 ywaQ60WnuoUb3my8/Q5wvLgEJQFFLHnr2tCKDNQ41hdWVsk1ALakYWqlF08mr2GRiR
	 QFaoGb60wgDWg==
Date: Tue, 22 Apr 2025 11:21:25 +0000
To: Christian Schrefl <chrisi.schrefl@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] rust: pin-init: Implement `Wrapper` for `UnsafePinned` behind feature flag.
Message-ID: <D9D4M8XF14X9.1YUVFH9EW0IMX@proton.me>
In-Reply-To: <4df4e3a0-9caa-4253-bf65-66c238bf0291@gmail.com>
References: <20250421221728.528089-1-benno.lossin@proton.me> <20250421221728.528089-4-benno.lossin@proton.me> <4df4e3a0-9caa-4253-bf65-66c238bf0291@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 33f605292d9a927cceb5cd8455337a1280f52e39
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue Apr 22, 2025 at 11:42 AM CEST, Christian Schrefl wrote:
> On 22.04.25 12:18 AM, Benno Lossin wrote:
>> @@ -1557,3 +1561,11 @@ fn pin_init<E>(value_init: impl PinInit<T, E>) ->=
 impl PinInit<Self, E> {
>>          unsafe { cast_pin_init(value_init) }
>>      }
>>  }
>> +
>> +#[cfg(all(feature =3D "unsafe-pinned", CONFIG_RUSTC_HAS_UNSAFE_PINNED))=
]
>> +impl<T> Wrapper<T> for core::pin::UnsafePinned<T> {
>> +    fn pin_init<E>(init: impl PinInit<T, E>) -> impl PinInit<Self, E> {
>> +        // SAFETY: `UnsafePinned<T>` has a compatible layout to `T`.
>> +        unsafe { cast_pin_init(init) }
>> +    }
>> +}
>
> I've realized that for us to use `UnsafePinned` in `Opaque` internally=20
> we need to have a `T: ?Sized` for this implementation. `cast_pin_init`
> won't work for that since we can't cast pointers between different DSTs.
> We could add something similar that uses a closure to convert a
> `*mut T` to `*mut U`.

I don't follow, which types do you need to wrap in `Opaque` that are not
sized?

Since `Opaque` uses `MaybeUninit` under the hood, it cannot support
`!Sized` types anyways, so I'm a bit confused.

---
Cheers,
Benno

