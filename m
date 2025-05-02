Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D005255F55;
	Fri,  2 May 2025 13:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746193620; cv=none; b=t3eg3H8ZOLiaf1nKdQGk7BpUWTm0bTVJwkEAcGlJuNHnNJZI7b5KS+BXwva/G51MfEGyJb+UtHcsmhkfO+eUTn+/tQ3YimxA7DMbJ091zv7vXoG96a8Jq00LcC6+eZ3GJ2ZMBxUe+wfAZEMNdIhUzIcaqI/kPzSOTZ4qrNkpC/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746193620; c=relaxed/simple;
	bh=k1VD3xpFASvnDMMDLrtk8RoNkfG78S1jAVJd+19NNic=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XMAK/331O9c8vCaJieQ7vw7upohBJnfte01qbAV3DDLC6d2AeSWPjPd0/zoSc79oV3XT+h4pH/uzQqId0FT0Bit07ub5D7UK7snk4wMJgm63GoYqURbX+8TJ3jEpToOd+/X9eVvmolshTZESpfQ01GajHuDrqPq0qoXV0KcyTxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ygf9/o7c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ygf9/o7c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF85C4CEE4;
	Fri,  2 May 2025 13:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746193619;
	bh=k1VD3xpFASvnDMMDLrtk8RoNkfG78S1jAVJd+19NNic=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ygf9/o7cOpaatRKXkkR+2sytOAZ7kTZJMMJOGMp39kM3Sgs8AdV5/46jTsRh8f8g8
	 Ob0KIHYRlcj2iV5QB6FsLq81pHMcRKJ8lyXiG6uYjzod8bUMngpXfibYo5UNTfQ2MX
	 ne2n5A9Q+u69xfPKD1vLRhtxoz6VUh9lXmgwE6trpt8UEhqcyPfWeeno7FoqRbG0JW
	 ePPuKHVj2Mi6kCETDY0zegMv1jp04m4xguulLtT64vjkLVrSVHpcMNOxshBxAMn/ru
	 84I81SOCAaSrB+UFL/6kh3FkH7afnwioT8Vwet8j0ZvPSUVZwC/9MspJMAT5a+0xq5
	 2Rqe+L4t2MN3Q==
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
In-Reply-To: <CAH5fLgj3j2BEyOmVw+T_988e_h1TYRmYVuEDYaL-baRu_mQq4g@mail.gmail.com>
 (Alice
	Ryhl's message of "Fri, 02 May 2025 14:37:19 +0200")
References: <20250502-aref-from-raw-v1-1-eb0630626bba@kernel.org>
	<y-zNJ4bc_qB45bZdnhojbouRbKGZCnzfvM4um6WShQHCTrvN6WikMId_DeZsZz2iSiSQwfNZ13cabCinPpDDlA==@protonmail.internalid>
	<aBS0ZP9tFnujvodq@google.com> <87plgrxkg4.fsf@kernel.org>
	<qZAEtgU86ydRPcawnXwt7UOsRcAfCyf5mIAIMphh-cEtVyojnatuHHk5JvkzdPOBszAHFDw7-eOouW_KB46AHw==@protonmail.internalid>
	<CAH5fLgj3j2BEyOmVw+T_988e_h1TYRmYVuEDYaL-baRu_mQq4g@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Fri, 02 May 2025 15:46:46 +0200
Message-ID: <87jz6zxgzd.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Fri, May 2, 2025 at 2:32=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> "Alice Ryhl" <aliceryhl@google.com> writes:
>>
>> > On Fri, May 02, 2025 at 01:53:57PM +0200, Andreas Hindborg wrote:
>> >> Clarify that implementers of `AlwaysReferenceCounted` must prevent the
>> >> implementer from being directly initialized by users.
>> >>
>> >> It is a violation of the safety requirements of `AlwaysReferenceCount=
ed` if
>> >> its implementers can be initialized on the stack by users. Although t=
his
>> >> follows from the safety requirements, it is not immediately obvious.
>> >>
>> >> The following example demonstrates the issue. Note that the safety
>> >> requirements for implementing `AlwaysRefCounted` and for calling
>> >> `ARef::from_raw` are satisfied.
>> >>
>> >>   struct Empty {}
>> >>
>> >>   unsafe impl AlwaysRefCounted for Empty {
>> >>       fn inc_ref(&self) {}
>> >>       unsafe fn dec_ref(_obj: NonNull<Self>) {}
>> >>   }
>> >>
>> >>   fn unsound() -> ARef<Empty> {
>> >>       use core::ptr::NonNull;
>> >>       use kernel::types::{ARef, RefCounted};
>> >>
>> >>       let mut data =3D Empty {};
>> >>       let ptr =3D NonNull::<Empty>::new(&mut data).unwrap();
>> >>       let aref: ARef<Empty> =3D unsafe { ARef::from_raw(ptr) };
>> >>
>> >>       aref
>> >>   }
>> >
>> > I don't think it's entirely impossible to write an AlwaysRefCounted
>> > value that can be on the stack. The type just needs a lifetime
>> > parameter. For example, this API is not unsound:
>> >
>> > struct MyDataStorage {
>> >     // ...
>> > }
>> >
>> > impl MyDataStorage {
>> >     fn as_aref(&self) -> ARef<MyData<'_>> {
>> >         unsafe { ARef::from_raw(ptr::from_ref(self).cast()) }
>> >     }
>> > }
>> >
>> > #[repr(transparent)]
>> > struct MyData<'s> {
>> >     storage: MyDataStorage,
>> >     _lifetime: PhantomData<&'s MyDataStorage>,
>> > }
>> >
>> > unsafe impl AlwaysRefCounted for MyData<'_> {
>> >     fn inc_ref(&self) {}
>> >     unsafe fn dec_ref(_obj: NonNull<Self>) {}
>> > }
>> >
>> > impl Deref for MyData<'_> {
>> >     type Target =3D MyDataStorage;
>> >     fn deref(&self) -> &MyDataStorage {
>> >         &self.storage
>> >     }
>> > }
>>
>> Right. I would rephrase then:
>>
>> It is a violation of the safety requirements of `AlwaysReferenceCounted`
>> if its implementers can be initialized on the stack by users and an
>> `ARef` referencing the object can outlive the object. Although this foll=
ows from
>> the safety requirements, it is not immediately obvious.
>>
>> and
>>
>> +/// Note: This means that implementers must prevent users from directly
>> +/// initializing the implementer when the implementer is `'static`. Oth=
erwise users could
>> +/// initialize the implementer on
>> +/// the stack, which would violate the safety requirements.
>>
>> What do you think?
>
> Hmm. Perhaps we should say that you can never own it "by value". There
> must always be pointer indirection.

Yes, that could work. I'll send a new version.


Best regards,
Andreas Hindborg




