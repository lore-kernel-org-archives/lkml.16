Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5859D1367;
	Sat,  7 Jun 2025 18:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749319886; cv=none; b=tG0TYdrGv0aIDKsjs191ZVrg1OnxwWohuXCJmpklfZyQNieZoakMoHof5bWkUuA5/CjXCGqUsCFEHiMu5ZctgAz4Hl25g3daeI+6+R3G0AF6jl+aFwavAKtKv/VIqvzg3qFsh8ohzwfMaPn1jH1kJ/YTimLf4lbloYWG8wD0br4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749319886; c=relaxed/simple;
	bh=hIx779T6RGdr+Ds8yo5sprWZ/7Wu6+fOcQ10ks7W0sA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ZKxwaqjYzCgqtZ72Kginl8cr94Yzq3XyJSbXnheWt5AbjpQLw26dB/iFH3HqdvTiI10m0LWW25IhBYc7F3J1U+4tRalfW1VsJ1iyRtl1DOfSwyIJdctAlw7DMBxuZIXDWtuORaAnZEbhpIFPxh/1glmx/TcPRA9DMmAG7BYiQg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LUgIBkkp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LUgIBkkp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB9FCC4CEE4;
	Sat,  7 Jun 2025 18:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749319886;
	bh=hIx779T6RGdr+Ds8yo5sprWZ/7Wu6+fOcQ10ks7W0sA=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=LUgIBkkpN0sUUHE4ZqGIUGqnHpq4L58gsZNHfU99dPCKgzsCEfGL+E9Kb3H2Vl4hZ
	 0RyqbeeouTio4Tjrag+afWZs68bgZpD04psUN9AZR9U6tOfHBz8s7JeeuKY1J9WM+W
	 7AHwnbQf1n+H+JP1LOZsZk9vo0Em26xOIozDsHnDpIuG06RV95XKa43VXwdPp3gpGN
	 9/7V71ACOycc0V/A5esZnNHn7L5n59P+SUxT52m668Cs+7Avjg/xZWMvOYonIubu+A
	 UJ9nW88opaoddx3ATJNvbYcIJE/zOIGM+C2Cf7ibXMno3Tmt7GCCe7sgJ6hQDJsEck
	 Es0FTPGjZpFsA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Jun 2025 20:11:21 +0200
Message-Id: <DAGI57J7WBD0.2BOT553TRIXH8@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: add `assert_sync` function
From: "Benno Lossin" <lossin@kernel.org>
To: "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250607-assert_sync-v1-1-b18261da83e2@gmail.com>
 <DAGEZCRR61A0.30H1MJQXW4CV5@kernel.org>
 <2531463d-fa6e-430c-a3a6-b179654cfbbe@gmail.com>
In-Reply-To: <2531463d-fa6e-430c-a3a6-b179654cfbbe@gmail.com>

On Sat Jun 7, 2025 at 5:54 PM CEST, Christian Schrefl wrote:
> On 07.06.25 5:42 PM, Benno Lossin wrote:
>> On Sat Jun 7, 2025 at 3:02 PM CEST, Christian Schrefl wrote:
>>> - Add `assert_send` as well.
>>=20
>> Sounds like a good idea.
>
> Should I already add this in V2 for this series?

If you want to then sure, but we can also wait until we have a use-case.
Also, let's finish the discussion about the macro idea below.

>>> +///     assert_sync::<i32>(); // Succeeds because `i32` is Sync
>>> +///     // assert_sync::<NotThreadSafe>(); // Fails because `NotThread=
Safe` is not `Sync`.
>>=20
>> Can you split this into two examples and mark the failing one with
>> `compile_fail`?
>
> I've tried it with `compile_fail` and it didn't work, I think
> that's not supported in (kernel) doc tests yet.=20

Hmm, I thought that this worked... @Miguel any idea?

>> We also could provide a macro similar to [1].
>>
>> [1]: https://docs.rs/static_assertions/latest/static_assertions/
>
> You mean the `assert_impl_*!` macros?

Yes, but the others might also be useful from time to time.

> That might make sense, with macros we would not need to write
> a const block to ensure its not executed at runtime (although
> it's probably optimized out anyways).

It 100% will be optimized out.

> It would also mean that we won't need a assert for every Trait, which
> seems nice. So a macro sounds pretty good to me.

It depends, the macro impl needs to define its own function, which might
be inefficient if one uses it a lot. But there is no way to be generic
over traits, so there is no other way.

Let's see what the others think.

---
Cheers,
Benno
