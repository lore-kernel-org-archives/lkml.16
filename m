Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E28610B;
	Sun, 18 May 2025 09:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747562241; cv=none; b=UOn6Sp3BANrWozXAYAM8YLGKZ4jb79WSSiA3XfUx8Mva8WKZUrrbZbZxC9iZjmvm88XeNnv0UGami/iQq2zEM1PE5y4+IvDknY0mB5gC8gpkQ0poh9NNseH6ZD7GeV6Qe4L5SkZpYrecyUC1I4i/qQ2BlIpnZBFH6hCZHMH/fpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747562241; c=relaxed/simple;
	bh=aGG91ZOUGaZ+vS6lFxwbX+zNkPnDLTw8cp1EfiaaiB0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=bJbHpAjiTLThG/Le0XleTOdX79LzMxck/WTg1fOOfpPSRLIIqINRS9LHx1Ng93ifYFufRiK+ZoVb2c1spfZuwbgrsUejQvQE7y5Gr7HU5i7+KX5Mr4Nnr4ENg8MA4ESPCfQOXUmzOD4Ae49xQR807eWVEHLOZEwmHYak96PKXjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f1UdbzmX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f1UdbzmX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E9FC4CEE7;
	Sun, 18 May 2025 09:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747562239;
	bh=aGG91ZOUGaZ+vS6lFxwbX+zNkPnDLTw8cp1EfiaaiB0=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=f1UdbzmXf504mYfv8spxb1Nb7MHAPWymd53lys4Bwf9UVawUDgAWg3vGRwwaiMeZa
	 ysqChoxIzvLZA+mLTsnptefLyegU1UyQjvZuS5FUdOPd6l3IbOHvsmBJ5wJPGjDoJ8
	 mq6durykFw1ygJoiettiwhBfthl4iZPi9kOkNR56qoi1Zr7oLtbzou9GuXgGvGNxIv
	 qKtdW42hgo1PrZ7z0HimWS02agoWptXWX2K5pfbnXqnqJ4vOhmI13Nr44QJL+nPli3
	 0GLUJ3Q4P0710onrj98lN0EvUEt3L83qKmu7IZzDUhIbMmVtIfoPI2eW54pEqprfkS
	 h+/EjdLyPE2Cw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 May 2025 11:57:11 +0200
Message-Id: <D9Z73XZUSYWO.R0P38ASITWR7@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
 <D9Z3R4EYAXV9.211IFNRTOPM6O@kernel.org>
 <D9Z4XGQ2QHXA.2H5X1NZ5IZECC@nvidia.com>
 <D9Z59JWL4BTC.3DTN0LWCJX5AZ@nvidia.com>
In-Reply-To: <D9Z59JWL4BTC.3DTN0LWCJX5AZ@nvidia.com>

On Sun May 18, 2025 at 10:30 AM CEST, Alexandre Courbot wrote:
> On Sun May 18, 2025 at 5:14 PM JST, Alexandre Courbot wrote:
>> On Sun May 18, 2025 at 4:19 PM JST, Benno Lossin wrote:
>>> On Sun May 18, 2025 at 4:28 AM CEST, Alexandre Courbot wrote:
>>>> On Wed May 14, 2025 at 12:44 AM JST, Daniel Almeida wrote:
>>>>> +//! Regulator abstractions, providing a standard kernel interface to=
 control
>>>>> +//! voltage and current regulators.
>>>>> +//!
>>>>> +//! The intention is to allow systems to dynamically control regulat=
or power
>>>>> +//! output in order to save power and prolong battery life. This app=
lies to both
>>>>> +//! voltage regulators (where voltage output is controllable) and cu=
rrent sinks
>>>>> +//! (where current limit is controllable).
>>>>> +//!
>>>>> +//! C header: [`include/linux/regulator/consumer.h`](srctree/include=
/linux/regulator/consumer.h)
>>>>> +//!
>>>>> +//! Regulators are modeled in Rust with two types: [`Regulator`] and
>>>>> +//! [`EnabledRegulator`].
>>>>> +//!
>>>>> +//! The transition between these types is done by calling
>>>>> +//! [`Regulator::enable()`] and [`EnabledRegulator::disable()`] resp=
ectively.
>>>>> +//!
>>>>> +//! Use an enum or [`kernel::types::Either`] to gracefully transitio=
n between
>>>>> +//! the two states at runtime if needed. Store [`EnabledRegulator`] =
directly
>>>>> +//! otherwise.
>>>>
>>>> Having the enabled or disabled state baked into the type is indeed
>>>> valuable for drivers that just need to acquire and enable a regulator =
at
>>>> probe time. However, there are also more dynamic use cases and I don't
>>>> think the burden of managing this aspect - by either performing a manu=
al
>>>> match to call any method (even the shared ones), or implementing custo=
m
>>>> dispatch types (which will lead to many similar ad-hoc implementations=
)
>>>> - should fall on the user. Thus I strongly suggest that this module
>>>> provides a solution for this as well.
>>>>
>>>> It has been proposed earlier to use a typestate, and this would indeed
>>>> provide several benefits, the first one being the ability to have shar=
ed
>>>> impl blocks (and shared documentation) between the enabled and disable=
d
>>>> states for methods like set/get_voltage().
>>>>
>>>> But the key benefit I see is that it could also address the
>>>> aforementioned dynamic management problem through the introduction of =
a
>>>> third state.
>>>>
>>>> Alongside the `Enabled` and `Disabled` states, there would be a third
>>>> state (`Dynamic`?) in which the regulator could either be enabled or
>>>> disabled. This `Dynamic` state is the only one providing `enable` and
>>>> `disable` methods (as well as `is_enabled`) to change its operational
>>>> state without affecting its type.
>>>>
>>>> All three states then implement `set_voltage` and `get_voltage` throug=
h
>>>> a common impl block, that could be extended with other methods from th=
e
>>>> C API that are independent of the state, as needed.
>>>>
>>>> To handle typestate transitions:
>>>>
>>>> - The `Disabled` and `Dynamic` states provide a `try_into_enabled()`
>>>>   method to transition the regulator to the `Enabled` state.
>>>> - The `Enabled` and `Dynamic` states provide `try_into_disabled()`.
>>>> - `Enabled` and `Disabled` also provide `into_dynamic()` (which cannot
>>>>   fail).
>>>>
>>>> Essentially, the `Enabled` and `Disabled` states simply enforce an
>>>> additional operational state invariant on the underlying regulator, an=
d
>>>> do not provide methods to change it.
>>>>
>>>> The `Dynamic` state would be the default for `Regulator`, so by just
>>>> using `Regulator`, the user gets an interface that works very similarl=
y
>>>> to the C API it abstracts, making it intuitive to those familiar with
>>>> it.
>>>
>>> How will the `Dynamic` typestate track the enable refcount? AFAIK one
>>> has to drop all enable refcounts before removing the regulator.
>>
>> I guess a choice has to be made about whether to just proxy the C API
>> as-is (where an unbalanced number of enable/disable calls can result in
>> a dropped regulator still being enabled), or whether to clamp the number
>> of times a Rust consumer can enable a regulator to 0 and 1 and disable
>> an enabled regulator in the destructor.
>>
>> The initial proposal does such clamping by design, but I also suspect
>> the C API behave like it does for good reasons (which I am not familiar
>> enough to be aware of unfortunately).
>
> Well after thinking a bit more about it, it is clear that is does that
> because a single consumer may need to ensure a regulator is on across
> multiple internal states. I suspect we will have Rust drivers complex
> enough to benefit from this behavior sometime soon.
>
> So I'd say the `Dynamic` state should probably mirror the C API as
> closely as possible and not try to outsmart the user. The
> `Enabled`/`Disabled` typestates will cover the simpler use-cases
> perfectly well and ensure a well-controlled enable count.

So just let users ensure that they always match each `enable` call with
a `disable` call in the `Dynamic` typestate?

That is ok, if no memory issues can arise from forgetting to do so,
otherwise those functions need to be `unsafe`. Also we should clearly
document that the `Enabled`/`Disabled` typestates should be preferred if
possible.

---
Cheers,
Benno

> I guess this also means transitions to/from `Dynamic` and the other
> states will have to be limited to the ones where we can clearly infer
> the enable count. That's probably ok anyway because I can't think of a
> reason to switch from one pattern to the other for the same regulator.
> Maybe we don't even need these transitions at all?

