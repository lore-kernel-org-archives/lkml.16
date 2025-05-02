Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE6E254AF3;
	Fri,  2 May 2025 12:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746189124; cv=none; b=Ag76oNl6/yL+XwIr2TV1t3EWodOhfNxWHK6KsdrpcRhKFSnmBsy9l6ajxRyan2ZOF9fsxz4PDoGkGNdo59NIiWQjUk0F+PGcCu31nLjhnqxQ+YodbclA4mekW1msiesENAuAffCYMAGMoX/XsdF0SkOP55TxZue7GtKeu50B6rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746189124; c=relaxed/simple;
	bh=IGdaO2A/M4SfrvXrLhWuIG91zV2VLydm1UtEi2pY81o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MVsYpkDJvwmbzmzjRvGiaTILzuxdnMQK6N+lvuaI5+G/1QpE0GaLaCwkZ5zuxRjjlptcLEj+prN/G6Wtla2TxzRQs/Uftxj+XoNGhmeertfamtmudsr20phodvqNotKmKHS25CZkI+fLMzyZrBcrB7lK05ZTkgh2qOxEsjpFp1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DJR0yLzQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DJR0yLzQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52DF4C4CEEF;
	Fri,  2 May 2025 12:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746189124;
	bh=IGdaO2A/M4SfrvXrLhWuIG91zV2VLydm1UtEi2pY81o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DJR0yLzQ8IZehPtDOH74CDb6XFTRXszbIOCH0+twTczQ8qMPDoIRYadse3B8QaR5g
	 TAlnYn3lyRxanBVRHsXw5MqXxiVYXWK9T2s1MV0fQpDVOv8NqQ10Cgq4im3dab6YVW
	 PXTMFLlGZPmK5YTyEAPiAYROgwK96LnXsc/9VP1e9eSrOc4lmSfbHFEl3jFYMC+6V3
	 mayg+XKI/+17dwdaOf+q10oZNa0wV1TKHo9iilZ5Q+fxHLrEypKwPlfc7yMmvmYyN6
	 Ns6vNm21S9axvS/tdH0+hXgW9pUHaRJSYmiLjq6AgCeyK+STpVSOD99hq+kc8BME8e
	 0CyM/3fImhRaA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Trevor Gross" <tmgross@umich.edu>,
  "Danilo Krummrich" <dakr@kernel.org>,  "Oliver Mangold"
 <oliver.mangold@pm.me>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: elaborate safety requirements for
 `AlwaysReferenceCounted`
In-Reply-To: <aBS0ZP9tFnujvodq@google.com> (Alice Ryhl's message of "Fri, 02
	May 2025 12:02:44 +0000")
References: <20250502-aref-from-raw-v1-1-eb0630626bba@kernel.org>
	<y-zNJ4bc_qB45bZdnhojbouRbKGZCnzfvM4um6WShQHCTrvN6WikMId_DeZsZz2iSiSQwfNZ13cabCinPpDDlA==@protonmail.internalid>
	<aBS0ZP9tFnujvodq@google.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Fri, 02 May 2025 14:31:55 +0200
Message-ID: <87plgrxkg4.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Fri, May 02, 2025 at 01:53:57PM +0200, Andreas Hindborg wrote:
>> Clarify that implementers of `AlwaysReferenceCounted` must prevent the
>> implementer from being directly initialized by users.
>>
>> It is a violation of the safety requirements of `AlwaysReferenceCounted` if
>> its implementers can be initialized on the stack by users. Although this
>> follows from the safety requirements, it is not immediately obvious.
>>
>> The following example demonstrates the issue. Note that the safety
>> requirements for implementing `AlwaysRefCounted` and for calling
>> `ARef::from_raw` are satisfied.
>>
>>   struct Empty {}
>>
>>   unsafe impl AlwaysRefCounted for Empty {
>>       fn inc_ref(&self) {}
>>       unsafe fn dec_ref(_obj: NonNull<Self>) {}
>>   }
>>
>>   fn unsound() -> ARef<Empty> {
>>       use core::ptr::NonNull;
>>       use kernel::types::{ARef, RefCounted};
>>
>>       let mut data = Empty {};
>>       let ptr = NonNull::<Empty>::new(&mut data).unwrap();
>>       let aref: ARef<Empty> = unsafe { ARef::from_raw(ptr) };
>>
>>       aref
>>   }
>
> I don't think it's entirely impossible to write an AlwaysRefCounted
> value that can be on the stack. The type just needs a lifetime
> parameter. For example, this API is not unsound:
>
> struct MyDataStorage {
>     // ...
> }
>
> impl MyDataStorage {
>     fn as_aref(&self) -> ARef<MyData<'_>> {
>         unsafe { ARef::from_raw(ptr::from_ref(self).cast()) }
>     }
> }
>
> #[repr(transparent)]
> struct MyData<'s> {
>     storage: MyDataStorage,
>     _lifetime: PhantomData<&'s MyDataStorage>,
> }
>
> unsafe impl AlwaysRefCounted for MyData<'_> {
>     fn inc_ref(&self) {}
>     unsafe fn dec_ref(_obj: NonNull<Self>) {}
> }
>
> impl Deref for MyData<'_> {
>     type Target = MyDataStorage;
>     fn deref(&self) -> &MyDataStorage {
>         &self.storage
>     }
> }

Right. I would rephrase then:

It is a violation of the safety requirements of `AlwaysReferenceCounted`
if its implementers can be initialized on the stack by users and an
`ARef` referencing the object can outlive the object. Although this follows from
the safety requirements, it is not immediately obvious.

and

+/// Note: This means that implementers must prevent users from directly
+/// initializing the implementer when the implementer is `'static`. Otherwise users could
+/// initialize the implementer on
+/// the stack, which would violate the safety requirements.

What do you think?


Best regards,
Andreas Hindborg


