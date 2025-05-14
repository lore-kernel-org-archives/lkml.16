Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B46C18787A;
	Wed, 14 May 2025 15:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747237126; cv=none; b=QJqjU8vzFvcvzCgi8k/4DaV23Xk0SCbCM1rjam4lL+XJShRAntL8U6TmiVUELVw/Izis7Q/1pQsLvtQb0PaW6+KjS5hpDAC3uLozKPjJeD3ARpRrImNjGu1PJiZqBKEBLq7gCArr9/DKNjYS+p2VSwCY9qbomwFsQZkKwp+4peQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747237126; c=relaxed/simple;
	bh=R69ez1ph1lySVhUsnR9NNbRDh/xDL6YmpvuDozJSYjI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ir/nvxp3hLQUSWx8WpOs8Q/Z4s1+GwIDB2jIxy5QrNW5li10pHN/L+HFAZeSrSLIrIiZR/cOSOpLwOYSZWwcsfFH/OvaMyIzy2tvhBmD0G02d+Y3wja9D1yeI8aNWvUxheQprVKPk7gaWnwA6rTpXIlNwrSv/8eG++kCPEcDFuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2OsbE/B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W2OsbE/B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A90EC4CEE3;
	Wed, 14 May 2025 15:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747237125;
	bh=R69ez1ph1lySVhUsnR9NNbRDh/xDL6YmpvuDozJSYjI=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=W2OsbE/B2dnaccPi38ue8ygZhSPgKxYZs11bdc0faF+F4ZIIW21PfVifcsqAAP/mf
	 NF9hcNxQsovpcV9giBaR825vKOlZaPaNHN1vEzVCHIq/f+0jeLm0GBWEt4Vc5a9dGv
	 yFmZXh7jnK/CIPs9ESWURXv5jz7o/w2CT51ee6M8cncYNfkoVK/avqGr8+8QNPR0Ha
	 GiBtNhZtux9AEKbPtXl2+d0jZOOFf/aDiLWlXYwm7F1Zf0u+u3VPhQeKIPYBdoWpPr
	 5zjKqLqN+wxKmQh6uA0f5D5W/DIw/U3ao/oyOv1MV6UaTX8V4WW3rAaRIJBJNyWYtr
	 wnsUnFREeSQwg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 May 2025 17:38:40 +0200
Message-Id: <D9VZV8APBYWU.2SWXJLHIQ18ZB@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
From: "Benno Lossin" <lossin@kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
X-Mailer: aerc 0.20.1
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9VATLUHDGU8.53I80TGVRV0J@kernel.org>
 <B288AFB1-BA0A-4383-9823-EAC9E5DCA59F@collabora.com>
 <D9VXPNT4HNXP.1PKET0Q1H7O9Y@kernel.org>
 <52CFFCA2-F253-49F1-9EA5-2865BD094B25@collabora.com>
In-Reply-To: <52CFFCA2-F253-49F1-9EA5-2865BD094B25@collabora.com>

On Wed May 14, 2025 at 4:40 PM CEST, Daniel Almeida wrote:
>> On 14 May 2025, at 10:57, Benno Lossin <lossin@kernel.org> wrote:
>> On Wed May 14, 2025 at 3:01 PM CEST, Daniel Almeida wrote:
>>>> On 13 May 2025, at 17:01, Benno Lossin <lossin@kernel.org> wrote:
>>>> On Tue May 13, 2025 at 5:44 PM CEST, Daniel Almeida wrote:
>>>>> diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
>>>>> new file mode 100644
>>>>> index 0000000000000000000000000000000000000000..7b07b64f61fdd4a84ffb3=
8e9b0f90830d5291ab9
>>>>> --- /dev/null
>>>>> +++ b/rust/kernel/regulator.rs
>>>>> @@ -0,0 +1,211 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>> +
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
>>>>=20
>>>> Would it make sense to store this in a generic variable acting as a ty=
pe
>>>> state instead of using two different names? So:
>>>>=20
>>>>   pub struct Regulator<State: RegulatorState> { /* ... */ }
>>>>=20
>>>>   pub trait RegulatorState: private::Sealed {}
>>>>=20
>>>>   pub struct Enabled;
>>>>   pub struct Disabled;
>>>>=20
>>>>   impl RegulatorState for Enabled {}
>>>>   impl RegulatorState for Disabled {}
>>>>=20
>>>> And then one would use `Regulator<Enabled>` and `Regulator<Disabled>`.
>>>=20
>>> This seems like just another way of doing the same thing.
>>>=20
>>> I have nothing against a typestate, it's an elegant solution really, bu=
t so is
>>> the current one. I'd say let's keep what we have unless there is someth=
ing
>>> objectively better about a typestatethat makes it worthy to change this=
.
>>=20
>> I'd say it's cleaner and we already have some APIs that utilize type
>> states, so I'd prefer we use that where it makes sense.
>>=20
>
> By the way, IIUC, regulator_disable() does not disable a regulator necess=
arily.
> It just tells the system that you don't care about it being enabled anymo=
re. It can
> still remain on if there are other users.

Hmm, so a `struct regulator` might already be enabled and calling
`regulator_enable` doesn't do anything?

> This means that Regulator<Disabled> is a misnomer.

Yeah.

> Also, the current solution relies on Regulator being a member of
> EnabledRegulator to keep the refcounts sane. I wonder how that is going t=
o work
> now that Regulator<Disabled> is obviously not a member of Regulator<Enabl=
ed>, i.e.:
>
> impl Drop for Regulator<Enabled> {
>  fn drop(&mut self) {
>   regulator_disable(); =20
>  =20
>   // We now have to call this explicitly, because no one else will call i=
t for
>   // us.
>   regulator_put();
>  }
> }
>
> impl Drop for Regulator<Disabled> {
>  fn drop(&mut self) {
>   // We now have to repeat this in both destructors.
>   regulator_put(); =20
>  }
> }
>
> Just to confirm: is that what you have in mind?

You can't specialize the `Drop` impl, you'd have to do this:

    impl<State: RegulatorState> Drop for Regulator<State> {
        fn drop(&mut self) {
            if State::ENABLED {
                regulator_disable();
            }
            regulator_put();
        }
    }

I still think it's an improvement though.

---
Cheers,
Benno
