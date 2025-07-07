Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB2E28DB69;
	Mon,  7 Jul 2025 09:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751880445; cv=none; b=BrB2vQW7I6AG44cNnXt1aNbTZKqf0m2G/46uIjlstMyy6lZnCquaXGIEvS9jUQRTCMzeEXOQablntUEAWeXOFf3B24GibbhhZcb9s6MovxrJ0UC1EKi2KwUCcwt2JbZlvnHB1OSKOcVQf0wrGIA8MEjarak7Y8AYivBqvwxuhFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751880445; c=relaxed/simple;
	bh=3N+dxJ/pYp0RztBAu4k2bBGj9JOro7842A4Q2y3OIW8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Bdoh0TwywHma+gOdgpMS5cf7YtIj8QQCeJMznQYGxCZGh5m4D5sHx9ccmMxLEGYMCHT7lbGg/22tkQA034F2gXNkXWG2sYWtSYWxChoefanf5EAxAGzGnmkN7JtDKdK9KWH1m1wxWBxTne7oFL3r7uppUnf9zIq7/zs6ZeXa9p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPbXu681; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPbXu681"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57438C4CEE3;
	Mon,  7 Jul 2025 09:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751880445;
	bh=3N+dxJ/pYp0RztBAu4k2bBGj9JOro7842A4Q2y3OIW8=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=QPbXu681niYrGCdH6O4zB1oOc3IRT2lXTf09EACqLHRM4iWd/vkCxj6R9GQ+3HRUT
	 tHf3ygnS86/OwVZ6k25Itrlq18y7x3dpaHJFbHTIImd6E/isRIZVw8Io9oYnMjHLZg
	 M7Oak+mrM0vJ/jOGjrJ+fysJXUOzHW3satj8lQve0PcffeE6bqPZ0/Yc4c2OTtMMtZ
	 QXBFi3ZYHrraDH7kr3bGbr2E2PLAFFFGT8j6juZfvhjDIXwBZUg4GUpadU1fSoPT9/
	 i+IbnQIs+XO7ILpR4Z46yb8v0UGNTymnCmeOfttGjFw1gTcYyVaDKM9FR2yJPSf0Fq
	 2+QB0eUr7wb5g==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Jul 2025 11:27:21 +0200
Message-Id: <DB5PSCBJA3YW.29RU3J2CT4ZPM@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Asahi Lina" <lina+kernel@asahilina.net>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 2/4] rust: Split `AlwaysRefCounted` into two traits
From: "Benno Lossin" <lossin@kernel.org>
To: "Oliver Mangold" <oliver.mangold@pm.me>
X-Mailer: aerc 0.20.1
References: <20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me>
 <20250618-unique-ref-v11-2-49eadcdc0aa6@pm.me>
 <DB1J4UQLG76V.69HKATSZZVNO@kernel.org> <aGt6U2jCDnU7dzRA@mango>
In-Reply-To: <aGt6U2jCDnU7dzRA@mango>

On Mon Jul 7, 2025 at 9:42 AM CEST, Oliver Mangold wrote:
> On 250702 1323, Benno Lossin wrote:
>> On Wed Jun 18, 2025 at 2:27 PM CEST, Oliver Mangold wrote:
>> > diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>> > index c12ff4d2a3f2d79b760c34c0b84a51b507d0cfb1..40c0138bd336057e7d3a83=
5a9e81391baa2fd2b1 100644
>> > --- a/rust/kernel/types.rs
>> > +++ b/rust/kernel/types.rs
>> > @@ -418,11 +418,9 @@ pub const fn raw_get(this: *const Self) -> *mut T=
 {
>> >      }
>> >  }
>> >
>> > -/// Types that are _always_ reference counted.
>> > +/// Types that are internally reference counted.
>> >  ///
>> >  /// It allows such types to define their own custom ref increment and=
 decrement functions.
>> > -/// Additionally, it allows users to convert from a shared reference =
`&T` to an owned reference
>> > -/// [`ARef<T>`].
>> >  ///
>> >  /// This is usually implemented by wrappers to existing structures on=
 the C side of the code. For
>> >  /// Rust code, the recommendation is to use [`Arc`](crate::sync::Arc)=
 to create reference-counted
>> > @@ -438,9 +436,8 @@ pub const fn raw_get(this: *const Self) -> *mut T =
{
>> >  /// at least until matching decrements are performed.
>> >  ///
>> >  /// Implementers must also ensure that all instances are reference-co=
unted. (Otherwise they
>> > -/// won't be able to honour the requirement that [`AlwaysRefCounted::=
inc_ref`] keep the object
>> > -/// alive.)
>> > -pub unsafe trait AlwaysRefCounted {
>> > +/// won't be able to honour the requirement that [`RefCounted::inc_re=
f`] keep the object alive.)
>> > +pub unsafe trait RefCounted {
>> >      /// Increments the reference count on the object.
>> >      fn inc_ref(&self);
>>=20
>> This seems a bit problematic for `Owned`, since now I can do:
>>=20
>>     fn bad<T: Ownable + RefCounted>(t: &Owned<T>) {
>>         t.inc_ref();
>>     }
>>=20
>> And now the `Owned<T>` is no longer "unique" in the sense that the
>> refcount is 1...
>
> Yes, that is clear. But that isn't a soundness issue or is it? It just
> means the `T` can be leaked, but that cannot be prevented anyway.

Yeah that is true.

>> Similarly, we should probably make this an associated function, such
>> that people don't accidentally call `.inc_ref()` on `ARef<T>`.

Filed https://github.com/Rust-for-Linux/linux/issues/1177

---
Cheers,
Benno
