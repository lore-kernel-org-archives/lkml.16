Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3659194098;
	Mon, 19 May 2025 10:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652011; cv=pass; b=QDfS98Kn+EfABs8VdMzyXpLkxSzyceqeMN9lqK3y1WHypkyh+daaHt+1R+S/eehc39Us/WztgziTrgsMl7iYA2eCpOASOKCDuaLXWo/hF6OlwUrCNB4uM1ozqxXkhZ5rZzGfoJb7X455AiZdbVSFI76P9c2SK3eALVawsfQIUSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652011; c=relaxed/simple;
	bh=bWc7Jma6xawQpfCWQ8sMFIUE4fzRraPT+YuzcGuXDl0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=fwjwKbGnYPsyXuvXgfULjka16SoDTLHt4yEGwC/hO2bb9sLBUoAjC1hsXanyFFkczg+PEuWDZKhKeetrc/fa2ANBWrbhEsAtOmg94RtxUGL/WkCY0bZ+LeRdk1m1dPQcaAbzApBqt/W1Fdkf83zuGfeEhD3zpVhf8LCdSp+1N8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=R0xFYFkK; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="R0xFYFkK"
ARC-Seal: i=1; a=rsa-sha256; t=1747651980; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X5DYjqFBe57gxXWuc6x1Ll8kEKWMjEMvJsOw9wIjYK3+rh+1/tYKC3aY+RedhU0jd0+4BuXfMxCZ0NjL0yRCVJqWV2n08dYsGIEOQi85NecPrd/t1inmzoDzW0xvpOUyH9MMagu+RqYuakGwKIpJXiDpQxhhuYOPW2p7eDOxo8w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747651980; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RjS5t3OT9jROMXVPQma0hsNunDtpkAqf76W3TPchlKE=; 
	b=J+7OYsQ9b0PhMGDjNCq/msngfCdAFmRurJugGjJhePvEOGiw42Fj+9KGvj26e9GEB1EQJxDdatpVxbFsxc5bGlBDRJRvNDQm7zWzdx66/0AASg+C2UPtMb7UKXj+U/krAlcM/d9S+ctLVZl7DhW84cGW+FJFg0/++I7OE7k4VcY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747651980;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=RjS5t3OT9jROMXVPQma0hsNunDtpkAqf76W3TPchlKE=;
	b=R0xFYFkKe2rYJZgj2lLhuLBujqr08Z2+JdPy5Xdfyf/jKQKPLTz6o0ZCk4zct+Dt
	qUCOP+7unzBX279BfO3hZSBQE+E850egYTolAbWBCNTMFegsp+2V1FNMEaSPnneeffk
	89RgmLVrDgl+9qR+3PYKGJtpSSsgS9A0n8s5wnC4=
Received: by mx.zohomail.com with SMTPS id 1747651975112583.8563066102321;
	Mon, 19 May 2025 03:52:55 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <D9ZQUUA4FLXD.19MJI9HD48EMZ@nvidia.com>
Date: Mon, 19 May 2025 07:52:38 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8517D6F0-C1A2-4E38-8E62-57DCCD5E58D4@collabora.com>
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
 <498AB71C-58EF-487E-8D9B-C7C113862948@collabora.com>
 <D9ZQUUA4FLXD.19MJI9HD48EMZ@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-ZohoMailClient: External

Hi Alex,

I still don=E2=80=99t understand your use case 100% :/

>=20
> I just mean the cases where users will want to enable and disable the
> regulator more frequently than just enabling it at probe time.

This is already possible through kernel::types::Either.=20

i.e.: the current design - or the proposed typestate one - can already =
switch
back and forth between Regulator and EnabledRegulator. Using Either =
makes it
just work, because you can change the variant at runtime without hassle. =
This
lets you consume self in an ergonomic way.

By the way, the reason I'm pushing back slightly here is because you =
seem
(IIUC) to be trying to reintroduce the pattern we had to move away from =
in v1.

i.e.: we explicitly had to move away from trying to match enables and =
disables
in Rust, because it was hard to get this right.

The current design is a simplification that apparently works, because at =
best
you have +1 on the count and that is encoded in the type itself, so =
there is
nothing to actually "track" or "balance" within a given instance. =
Multiple
calls to _get() or _enable() on the same instance are simply forbidden.

Can you add some pseudocode that shows how this doesn't work (or is =
otherwise
unergonomic) in Nova? I think it will make your point clearer.

>=20
>>=20
>>>=20
>>> It has been proposed earlier to use a typestate, and this would =
indeed
>>> provide several benefits, the first one being the ability to have =
shared
>>> impl blocks (and shared documentation) between the enabled and =
disabled
>>> states for methods like set/get_voltage().
>>>=20
>>> But the key benefit I see is that it could also address the
>>> aforementioned dynamic management problem through the introduction =
of a
>>> third state.
>>>=20
>>> Alongside the `Enabled` and `Disabled` states, there would be a =
third
>>> state (`Dynamic`?) in which the regulator could either be enabled or
>>> disabled. This `Dynamic` state is the only one providing `enable` =
and
>>> `disable` methods (as well as `is_enabled`) to change its =
operational
>>> state without affecting its type.
>>=20
>> Dynamic is just "Regulator" in the current version of this patch. =
There is no
>> "Disabled" because there is no guarantee that someone else won't =
enable the
>> regulator, trivially breaking this invariant at any moment.
>=20
> There is a core difference, which is that in your version of
> `Regulator`, `enable` takes ownership of `self` and returns a =
different
> type, whereas `Dynamic` would take `&mut self` and change its internal
> state, like the C API does.

I see now, but consuming self is something we're trying after =
considering the
&mut self approach, which did not work very well in v1.

>=20
>>=20
>> The only thing we can guarantee is "Enabled", through our own call to
>> "regulator_enable()".
>>=20
>> In fact, for the typestate solution, I was thinking about =
"UnknownState" and
>> "Enabled", or any nomenclature along these lines.
>>=20
>>>=20
>>> All three states then implement `set_voltage` and `get_voltage` =
through
>>> a common impl block, that could be extended with other methods from =
the
>>> C API that are independent of the state, as needed.
>>>=20
>>> To handle typestate transitions:
>>>=20
>>> - The `Disabled` and `Dynamic` states provide a `try_into_enabled()`
>>> method to transition the regulator to the `Enabled` state.
>>=20
>> Why not =E2=80=9Cenable()=E2=80=9D as we currently have?
>=20
> `enable()` to me sounds like a method that mutates `self` in-place,
> whereas your version consumes it and turns it into a different type.
> Such methods are typically named `into_*`, or `try_into_*` when they =
can
> fail.
>=20
> Actually, this could even be a `TryInto` implementation, but in this
> particular case having methods with the target state in their names =
may
> result in clearer code and allow the reader to model the transition
> graph more easily.
>=20
>>=20
>> If we go with the "Dynamic" nomenclature, and we agree that there's =
no
>> "Disabled",  then we can implement "pub fn enable(self) -> =
Regulator<Enabled>",
>> for "Dynamic", which is what we currently have, but with other names.
>=20
> Not if we want to provide the behavior of the C consumer API, which
> requires multiple calls to `regulator_enable()` to be matched by an =
equal
> number of calls to `regulator_disable()`, which could be useful to =
some
> drivers (lest they reimplement their own counter).

This is explicitly not supported, because (given the current code) why =
should it be?

If you want a given regulator to be enabled, just make sure you have
Regulator<Enabled> in your kernel::types::Either container.

You don't need a counter either: Regulator<Enabled> has a count of one, =
and
when that goes out of scope, it's decremented.

>=20
>>=20
>> Also, I personally dislike this term: it's hard to tell what =
Regulator<Dynamic>
>> means on a first glance.
>=20
> Yeah I'm not a fan of it and I'm sure there are better alternatives.
> Maybe `Controlled`?
>=20
>>=20
>>> - The `Enabled` and `Dynamic` states provide `try_into_disabled()`.
>>> - `Enabled` and `Disabled` also provide `into_dynamic()` (which =
cannot
>>> fail).
>>>=20
>>> Essentially, the `Enabled` and `Disabled` states simply enforce an
>>> additional operational state invariant on the underlying regulator, =
and
>>> do not provide methods to change it.
>>>=20
>>> The `Dynamic` state would be the default for `Regulator`, so by just
>>> using `Regulator`, the user gets an interface that works very =
similarly
>>> to the C API it abstracts, making it intuitive to those familiar =
with
>>> it.
>>=20
>> This is already how it works: Regulator is the default and =
EnabledRegulator
>> adds an extra invariant.
>=20
> Hopefully the above clarified the differences.
>=20
>>=20
>>>=20
>>> But for cases where the regulator is known to always be in a =
specific
>>> state like `Enabled`, one can use `Regulator<Enabled>` and simplify
>>> their code.
>>>=20
>>> This should retain the compile-time safety that your version =
proposed
>>> for common cases, while still exposing the flexibility of the C API =
when
>>> needed.
>>>=20
>>=20
>> Yeah, I agree.
>=20
> I think the concept looks better if you consider the generic parameter
> of `Regulator` not as a state, but as a marker of guaranteed =
invariants
> and allowed transitions.
>=20
> - `Regulator<Enabled>` guarantees that the regulator is enabled on the
>  consumer side. It is also disabled when the object is dropped. Many
>  drivers will just do `Regulator::<Enabled>::get()` at probe time (the
>  equivalent of `regulator_get_enable()`), store the object into the
>  device's state, and forget about it.
>=20
> - `Regulator<Disabled>` guarantees that the regulator is not enabled =
on
>  the consumer side. It could be useful to have for drivers that use
>  distinct types to store their state depending on their power status:
>  the powered-on type would store a `Regulator<Enabled>`, the
>  powered-off type a `Regulator<Disabled>`. That way you cannot even
>  write code transitioning between the states if you omit the regulator
>  - which I think is really neat.
>=20

I thought we had agreed that there is no =E2=80=9CDisabled=E2=80=9D, =
even in C?

> These two should cover a large percentage of consumer needs, but for
> those that need more fine-grained control we should also have one or =
two
> policies that follow the C API a bit closer, e.g.:
>=20
> - `Regulator<Controlled>` (or just `Regulator`): user is granted an =
API
>  very close to the C one, and is responsible for balancing calls to
>  `enable()` and `disable()`. Regulator remains in the state it was in
>  when dropped.
>=20
> - `Regulator<Switch>`: calls to `enable()` and `disable()` do not need
>  to be balanced, and the regulator always transitions to one state if
>  it was in the other. Regulator gets automatically disabled on drop.
>  This provides a simpler, safer alternative to `Controlled`.
>=20
> Note that I am not advocating for including these two policies
> specifically, these are just examples. My main point is that we should
> also provide a way to change the regulator's enabled state without
> requiring a change of type ; which policy(es) to adopt will depend on
> which restrictions we conclude are adequate to place on the C API, if
> any.

Can you expand a bit on the issues of changing types? Again, some =
pseudocode
will probably help a lot :)

=E2=80=94 Daniel

