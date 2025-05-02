Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B55819D07B;
	Fri,  2 May 2025 10:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746182470; cv=none; b=VGQBZDZaGTPyEBX6dhOzNFnGdgzvHgUuuW+blGAD4tfqVgIitHxF14XBjkBYoIKQf33+tXY+KCjcq1IbmQtevgF7Inw+UYYu8GLx78UOD9KbbOx/0bDGwaIXxg5prerrq1pwO1JxNRy7P/eUSQGKtnfCd8P8EBvLGxEvXuBkF18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746182470; c=relaxed/simple;
	bh=Rz0Qih9lSzGsvPQiejzdU1f5IL7TNYNCqsNY4rSm438=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VYZO3qQ5dYFl+B1RvFKYzpGSrGfYip8QhVjOA7Umt6DQXw1Xq0dNfcn01I6zGB2j9tu1UFu1jlC2Q9vvKP0nHHOMyZfi0DZAwm7caWdJ+PP7goRzILafi/BjlF0Mjbaqok8JlYjC2+hRAImV8E/KqbbOrg9notJy5GRAB3XMzDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s6TUZPG4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s6TUZPG4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C215C4CEE4;
	Fri,  2 May 2025 10:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746182469;
	bh=Rz0Qih9lSzGsvPQiejzdU1f5IL7TNYNCqsNY4rSm438=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=s6TUZPG48rABimNsD+1R3G8S1KHw4twNDiwOxV43C8MK68U7IwkcbujBPgjdWsPW9
	 Eu6Gob5elHBrfUyOUjrnzFWMSOt6KqlcuqCO9aH+VAROaQTr3CvviL0rPCJThc5NvW
	 +lTvs6dH6jdRLQLCK1Yd46JkfYuXxGe6uK/RBY3QaEby8l9fqmcfhJV+XQsP/bXpsW
	 QcixYPGP1Cb1tgbiWdvu7F00LcrTirvQSyEF2y0GJhqIJTpHc6YCWBnKBROV78t+4v
	 wFqyC+0eq6AG+IGvq5FKytDw4A9s7yL9AOhqXGlOhQMmzNrnPBeo8g/vsQ5LSUrMqf
	 ioP3tam3RJETw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,
  Boqun Feng <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,
  =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>,  Benno Lossin
 <benno.lossin@proton.me>,  Alice Ryhl <aliceryhl@google.com>,  Trevor
 Gross <tmgross@umich.edu>,  Asahi Lina <lina@asahilina.net>,
  rust-for-linux@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 3/5] rust: Add missing SAFETY documentation for ARef
 example
In-Reply-To: <Z_33ntAgpRU_541N@mango> (Oliver Mangold's message of "Tue, 15
	Apr 2025 06:07:30 +0000")
References: <20250325-unique-ref-v9-0-e91618c1de26@pm.me>
	<BilXj9TIYuQxgQ8GYVKxO0m88NUME1b-jtwrV9ZX3W9GXO-QJGFpb9rChJZarPa4e2AAvgJTm_DINEIW1JINlA==@protonmail.internalid>
	<20250325-unique-ref-v9-3-e91618c1de26@pm.me> <87a58pd6t4.fsf@kernel.org>
	<Z_33ntAgpRU_541N@mango>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Fri, 02 May 2025 12:40:29 +0200
Message-ID: <87o6wbz46a.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Oliver Mangold <oliver.mangold@pm.me> writes:

> On 250409 1126, Andreas Hindborg wrote:
>> "Oliver Mangold" <oliver.mangold@pm.me> writes:
>>=20
>> > SAFETY comment in rustdoc example was just 'TODO'. Fixed.
>> >
>> > Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
>> > ---
>> >  rust/kernel/types.rs | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>> > index c8b78bcad259132808cc38c56b9f2bd525a0b755..db29f7c725e631c11099fa=
9122901ec2b3f4a039 100644
>> > --- a/rust/kernel/types.rs
>> > +++ b/rust/kernel/types.rs
>> > @@ -492,7 +492,7 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
>> >      ///
>> >      /// struct Empty {}
>> >      ///
>> > -    /// # // SAFETY: TODO.
>> > +    /// // SAFETY: We do not free anything.
>>=20
>> How about:
>>=20
>>   This implementation will never free the underlying object, so the
>>   object is kept alive longer than the safety requirement specifies.
>
> Yes, was rather sloppy wording. Thanks, I will use your version.
>
>> >      /// unsafe impl RefCounted for Empty {
>> >      ///     fn inc_ref(&self) {}
>> >      ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
>> > @@ -500,7 +500,7 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
>> >      ///
>> >      /// let mut data =3D Empty {};
>> >      /// let ptr =3D NonNull::<Empty>::new(&mut data).unwrap();
>> > -    /// # // SAFETY: TODO.
>> > +    /// // SAFETY: We keep `data` around longer than the `ARef`.
>>=20
>> This is not sufficient. The safety requirement is:
>>=20
>>   Callers must ensure that the reference count was incremented at least =
once, and that they
>>   are properly relinquishing one increment. That is, if there is only on=
e increment, callers
>>   must not use the underlying object anymore -- it is only safe to do so=
 via the newly
>>   created [`ARef`].
>>=20
>> How about:
>>=20
>>   The `RefCounted` implementation for `Empty` does not count references
>>   and never frees the underlying object. Thus we can act as having a
>>   refcount on the object that we pass to the newly created `ARef`.
>>=20
>> I think this example actually exposes a soundness hole. When the
>> underlying object is allocated on the stack, the safety requirements are
>> not sufficient to ensure the lifetime of the object. We could safely
>> return `data_ref` and have the underlying object go away. We should add
>> to the safety requirement of `ARef::from_raw`:
>>=20
>>   `ptr` must be valid while the refcount is positive.
>
> Wouldn't this already be covered by the below in the doc for
> AlwaysRefCounted?
>
>     Implementers must ensure that increments to the reference count keep
>     the object alive in memory at least until matching decrements are
>     performed."

No, I don't think that is enough. We can implement the trait properly
with refcounts and still we can allocate an object on the stack and then
do a `from_raw` on that object without violating any safety
requirements. I think the `ARef::from_raw` should have the safety
requirement above. But we can do that as a separate patch.

>
> OTOH, it also says this (which would be violated):
>
>     Implementers must also ensure that all instances are reference-counte=
d.
>     (Otherwise they won=E2=80=99t be able to honour the requirement that
>     AlwaysRefCounted::inc_ref keep the object alive.)"
>
> Should I change the example to one with an actual reference count?
> Not sure, would make it more complex and less readable, of course.

No I think that is fine. `Empty` is reference counted in the sense that
the refcount can considered to always be positive.



Best regards,
Andreas Hindborg


