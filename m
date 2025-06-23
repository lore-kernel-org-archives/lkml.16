Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369CD24EAB1;
	Mon, 23 Jun 2025 13:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750686304; cv=none; b=fIpQqBOhz2Zb+3AYjp+OTUQDfBPmMldwKa0qiV/lk3pTJoLKcbWvZ56OQ/oIl7PgC2NdJb7TGK7xEZN/Ym/AUYMoCH8l9gbc2DNWNWbyOzHGan28DuAnD8uv2CjkqPbP3TlQ2U1tIIuEC40gtd2/D0FzkUcLe26c/nnppGr//oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750686304; c=relaxed/simple;
	bh=Qpdo2JYgAWplBWZwtCweIuG180S3M/uw3ulQ5ctfcag=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ZGBKqYcVgQ/jF9TITRqpherjvNkGOAX6KFu4yAOX5A9p7x4usaUTxuYwvubm4OoQvEGICCoirvufUw4/jhMLAxqq0HOYzFmwnZ7cQj0ijqUWxTCn+jtNOXTT1HojKfE9SilXVeRQdKZGslIvKuZ15Rj99eRbzvTw01nu1vROWGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s3AyusYF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s3AyusYF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3EEC4CEF2;
	Mon, 23 Jun 2025 13:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750686303;
	bh=Qpdo2JYgAWplBWZwtCweIuG180S3M/uw3ulQ5ctfcag=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=s3AyusYFJTL0vRbPeCXDURpuCgzTwe+IvaQjX88PxUqQEnTb7fEKjY88l2VNL6/YX
	 qPDZ3AeEsU9sgI3BxZjFPl8+GlzDLVOHHUTSUnPiA2Z+8oqhW5tJVJkg3WfA3DuD+k
	 0nC9oE9068R3yQx5eO80GxvJYubWS9awRhgOsiQmZu0YQVqXutnZXhjPMWeVaitjDp
	 73IG56JKMEt9tNzXJYTdsnr+A2OvWK1ykyNzwAOpVtBFMqwB8voDCz7VtlM2IU36w5
	 vnRXgfKE06mmgIlJw2iAvG0afEpUidF7ygCLUqiK6nFNf2FQcKeOPX+BAgGpZyji0A
	 jy0/EHhxwXOSw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Jun 2025 15:44:58 +0200
Message-Id: <DATYHYJVPL3L.3NLMH7PPHYU9@kernel.org>
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
In-Reply-To: <aFlQ7K_mYYbrG8Cl@Mac.home>

On Mon Jun 23, 2025 at 3:04 PM CEST, Boqun Feng wrote:
> On Sun, Jun 22, 2025 at 11:18:24AM +0200, Benno Lossin wrote:
>> On Sat Jun 21, 2025 at 8:44 PM CEST, Onur =C3=96zkan wrote:
>> > Adds Rust bindings for the kernel's `ww_mutex` infrastructure to enabl=
e
>> > deadlock-free acquisition of multiple related locks.
>> >
>> > The patch abstracts `ww_mutex.h` header and wraps the existing
>> > C `ww_mutex` with three main types:
>> >     - `WwClass` for grouping related mutexes
>> >     - `WwAcquireCtx` for tracking lock acquisition context
>> >     - `WwMutex<T>` for the actual lock
>>=20
>> Going to repeat my question from the previous version:
>>=20
>>     I don't know the design of `struct ww_mutex`, but from the code belo=
w I
>>     gathered that it has some special error return values that signify t=
hat
>>     one should release other locks.
>>    =20
>>     Did anyone think about making a more Rusty API that would allow one =
to
>>     try to lock multiple mutexes at the same time (in a specified order)=
 and
>>     if it fails, it would do the resetting automatically?
>
> But the order may not be known ahead of time, for example say you have
> a few:
>
>     pub struct Foo {
>         other: Arc<WwMutex<Foo>>,
> 	data: i32,
>     }
>
> you need to get the lock of the current object in order to know what's
> the next object to lock.
>
>>=20
>> I'm not familiar with ww_mutex, so I can't tell if there is something
>> good that we could do.
>>=20
>
> It's not a bad idea when it can apply, but we still need to support the
> case where the order is unknown.

I didn't have a concrete API in mind, but after having read the
abstractions more, would this make sense?

    let ctx: &WwAcquireCtx =3D ...;
    let m1: &WwMutex<T> =3D ...;
    let m2: &WwMutex<Foo> =3D ...;

    let (t, foo, foo2) =3D ctx
        .begin()
        .lock(m1)
        .lock(m2)
        .lock_with(|(t, foo)| &*foo.other)
        .finish();

    let _: &mut T =3D t;
    let _: &mut Foo =3D foo;
    let _: &mut Foo =3D foo2;

---
Cheers,
Benno
