Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD332853E3;
	Mon, 23 Jun 2025 15:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691683; cv=none; b=lKSeraqktOsbLivvDxCwVcoP5z50Q/8imv6izGc9ma2iycsuyuKL5mAOTgqOqrWX2qmx4po5fCWjx+SMI5SAcFdWdI6xy8IkI5bixyXsZo0yr0zCD9+U2Hyk1jIb3zLnxx5TL3W3a8Y+4Tpd/7KYOamZZ/Ty2H0FF5pZviL/xbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691683; c=relaxed/simple;
	bh=bNo4u1rasC/6lBuKSnTXnbSkB3draWhrAu0LbyFSuls=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=QidVDOGN2CK2WpOpzWauIm6fxauDGlsAoJjrHOCnCtyInlX8cQ20WzhK4Q7f38KagGvQVaNHdXXs7DNxiHocV+GBwvSzWih+HWd7+FkghnOTt0RFDGzb/q079WJnl9ISBYzBMbUZc+o9Xx4HwK4k0qQhPGL9EOfZN7HqwBY9m0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CqSQS/ja; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CqSQS/ja"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C62EC4CEF0;
	Mon, 23 Jun 2025 15:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750691682;
	bh=bNo4u1rasC/6lBuKSnTXnbSkB3draWhrAu0LbyFSuls=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=CqSQS/jajiRZQBCwp7ZAuejlTZxBQXyDkZlKW8YldcUOuFYRl52KTHqh2QNDinSBG
	 4WEjNMxOf5JivIekNJPBLm7smt12WO7PfxFGmZ5bYtJId8XY7CXCw4L98qQSSb3/kN
	 Uw5pML5L1wgpCeXX0IykE1evSm5DHG6udmrOryMgiLs0p+HlAn0F3cAvsQIa2Ceg3S
	 nRA4eY116Mr2rmIw6tzc1K1Hnz/IEl/CWJgMUU1D+cVlp1h8ZzSoQAFSwLvSaPtnJm
	 jrDF1XJ8UQcSOpwfe7Ciz0xM3ADtaS+MoJq+4hOzOMdXqN4F4IBDa4D0JHzkhQymRV
	 eyKIfUT/9aT3g==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Jun 2025 17:14:37 +0200
Message-Id: <DAU0ELV91E2Q.35FZOII18W44J@kernel.org>
Cc: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <gary@garyguo.net>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <dakr@kernel.org>, <peterz@infradead.org>, <mingo@redhat.com>,
 <will@kernel.org>, <longman@redhat.com>, <felipe_life@live.com>,
 <daniel@sedlak.dev>, <bjorn3_gh@protonmail.com>
Subject: Re: [PATCH v5 2/3] implement ww_mutex abstraction for the Rust tree
From: "Benno Lossin" <lossin@kernel.org>
To: "Boqun Feng" <boqun.feng@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250621184454.8354-1-work@onurozkan.dev>
 <20250621184454.8354-3-work@onurozkan.dev>
 <DASY7BECFRCT.332X5ZHZMV2W@kernel.org> <aFlQ7K_mYYbrG8Cl@Mac.home>
 <DATYHYJVPL3L.3NLMH7PPHYU9@kernel.org> <aFlpFQ4ivKw81d-y@Mac.home>
In-Reply-To: <aFlpFQ4ivKw81d-y@Mac.home>

On Mon Jun 23, 2025 at 4:47 PM CEST, Boqun Feng wrote:
> On Mon, Jun 23, 2025 at 03:44:58PM +0200, Benno Lossin wrote:
>> I didn't have a concrete API in mind, but after having read the
>> abstractions more, would this make sense?
>>=20
>>     let ctx: &WwAcquireCtx =3D ...;
>>     let m1: &WwMutex<T> =3D ...;
>>     let m2: &WwMutex<Foo> =3D ...;
>>=20
>>     let (t, foo, foo2) =3D ctx
>>         .begin()
>>         .lock(m1)
>>         .lock(m2)
>>         .lock_with(|(t, foo)| &*foo.other)
>>         .finish();
>>=20
>
> Cute!
>
> However, each `.lock()` will need to be polymorphic over a tuple of
> locks that are already held, right? Otherwise I don't see how
> `.lock_with()` knows it's already held two locks. That sounds like a
> challenge for implementation.

I think it's doable if we have=20

    impl WwActiveCtx {
        fn begin(&self) -> WwActiveCtx<'_, ()>;
    }

    struct WwActiveCtx<'a, Locks> {
        locks: Locks,
        _ctx: PhantomData<&'a WwAcquireCtx>,
    }

    impl<'a, Locks> WwActiveCtx<'a, Locks>
    where
        Locks: Tuple
    {
        fn lock<'b, T>(
            self,
            lock: &'b WwMutex<T>,
        ) -> WwActiveCtx<'a, Locks::Append<WwMutexGuard<'b, T>>>;

        fn lock_with<'b, T>(
            self,
            get_lock: impl FnOnce(&Locks) -> &'b WwMutex<T>,
        ) -> WwActiveCtx<'a, Locks::Append<WwMutexGuard<'b, T>>>;
        // I'm not 100% sure that the lifetimes will work out...

        fn finish(self) -> Locks;
    }

    trait Tuple {
        type Append<T>;

        fn append<T>(self, value: T) -> Self::Append<T>;
    }

    impl Tuple for () {
        type Append<T> =3D (T,);

        fn append<T>(self, value: T) -> Self::Append<T> {
            (value,)
        }
    }
   =20
    impl<T1> Tuple for (T1,) {
        type Append<T> =3D (T1, T);

        fn append<T>(self, value: T) -> Self::Append<T> {
            (self.0, value,)
        }
    }

    impl<T1, T2> Tuple for (T1, T2) {
        type Append<T> =3D (T1, T2, T);

        fn append<T>(self, value: T) -> Self::Append<T> {
            (self.0, self.1, value,)
        }
    }

    /* these can easily be generated by a macro */

> We also need to take into consideration that the user want to drop any
> lock in the sequence? E.g. the user acquires a, b and c, and then drop
> b, and then acquires d. Which I think is possible for ww_mutex.

Hmm what about adding this to the above idea?:

    impl<'a, Locks> WwActiveCtx<'a, Locks>
    where
        Locks: Tuple
    {
        fn custom<L2>(self, action: impl FnOnce(Locks) -> L2) -> WwActiveCt=
x<'a, L2>;
    }

Then you can do:

    let (a, c, d) =3D ctx.begin()
        .lock(a)
        .lock(b)
        .lock(c)
        .custom(|(a, _, c)| (a, c))
        .lock(d)
        .finish();

>>     let _: &mut T =3D t;
>>     let _: &mut Foo =3D foo;
>>     let _: &mut Foo =3D foo2;

Ah these will actually be `WwMutexGuard<'_, ...>`, but that should be
expected.

---
Cheers,
Benno
