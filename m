Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80B5278162;
	Wed, 14 May 2025 13:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747231047; cv=none; b=IAQUCCV6jH8SE5z6BYYRH75TR5CVSo5r6h7IgUEnwigeh/MFjj4550MGm7F+Qu9eKTjtTaI/9ebHSQ9Itj7v5pJV8slS9RChtcG/HGpg0hK9AY7kzV8aK0YSaQdDML70gTWpbx5U440T4anoYfG/DVsHrlhygucp5bgBkd8N/o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747231047; c=relaxed/simple;
	bh=BhLOVDIWnEq0nnThxI1EmaSEQnntC6wSwC5bMYkcfp4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=bANhV5LSG5itctH5nU8IqopKsKWYoIo7CZ5ZtM0T8h29n1cet8D8Qe8CHgLaA0qP0RWOO4EmWmcqJxgtHdTpqi2o8RTD+Jutkj/JowWThVO/eYf8T/mjHKpS+yEcI3DVnMsGRh9eENx1j/EFSwhSAHXh7kU+McbfE6iJy8NhhRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZM/eWa2I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZM/eWa2I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B56AC4CEE9;
	Wed, 14 May 2025 13:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747231047;
	bh=BhLOVDIWnEq0nnThxI1EmaSEQnntC6wSwC5bMYkcfp4=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ZM/eWa2IafVzJRCl6gFkh6G4SyEEzlPqnE78PZMlVIxe60Cxw5OI9Chs9PlTWlY6N
	 rz83gkG+VTD0SQFjj0MgeZP146TRVO7PqJ0wsiAGqpvGYziieFEr095GlvoRB7AB3/
	 smJ34QR+cpv96hoJejaQ/5OXZvDBp0EU3Y8m8JuqU+fGuRi8d7Hc+p6smX/totyldB
	 2hS85ErNgrxexWxXTTSNfqiv4CfKoW27usKvwe436uCMcrF2Tr5WUc19YBuZf34vOW
	 F6RvJMLiJr+hjbF8eJHJH6nVl+SFG8B5zSWn0b9mlp/+/AAPT0Si1eRMOKuhNxYRx0
	 JqOP0gJfjH6/g==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 May 2025 15:57:22 +0200
Message-Id: <D9VXPNT4HNXP.1PKET0Q1H7O9Y@kernel.org>
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
In-Reply-To: <B288AFB1-BA0A-4383-9823-EAC9E5DCA59F@collabora.com>

On Wed May 14, 2025 at 3:01 PM CEST, Daniel Almeida wrote:
>> On 13 May 2025, at 17:01, Benno Lossin <lossin@kernel.org> wrote:
>> On Tue May 13, 2025 at 5:44 PM CEST, Daniel Almeida wrote:
>>> diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..7b07b64f61fdd4a84ffb38e=
9b0f90830d5291ab9
>>> --- /dev/null
>>> +++ b/rust/kernel/regulator.rs
>>> @@ -0,0 +1,211 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +//! Regulator abstractions, providing a standard kernel interface to c=
ontrol
>>> +//! voltage and current regulators.
>>> +//!
>>> +//! The intention is to allow systems to dynamically control regulator=
 power
>>> +//! output in order to save power and prolong battery life. This appli=
es to both
>>> +//! voltage regulators (where voltage output is controllable) and curr=
ent sinks
>>> +//! (where current limit is controllable).
>>> +//!
>>> +//! C header: [`include/linux/regulator/consumer.h`](srctree/include/l=
inux/regulator/consumer.h)
>>> +//!
>>> +//! Regulators are modeled in Rust with two types: [`Regulator`] and
>>> +//! [`EnabledRegulator`].
>>=20
>> Would it make sense to store this in a generic variable acting as a type
>> state instead of using two different names? So:
>>=20
>>    pub struct Regulator<State: RegulatorState> { /* ... */ }
>>=20
>>    pub trait RegulatorState: private::Sealed {}
>>=20
>>    pub struct Enabled;
>>    pub struct Disabled;
>>=20
>>    impl RegulatorState for Enabled {}
>>    impl RegulatorState for Disabled {}
>>=20
>> And then one would use `Regulator<Enabled>` and `Regulator<Disabled>`.
>
> This seems like just another way of doing the same thing.
>
> I have nothing against a typestate, it's an elegant solution really, but =
so is
> the current one. I'd say let's keep what we have unless there is somethin=
g
> objectively better about a typestatethat makes it worthy to change this.

I'd say it's cleaner and we already have some APIs that utilize type
states, so I'd prefer we use that where it makes sense.

>>> +/// # Invariants
>>> +///
>>> +/// - [`Regulator`] is a non-null wrapper over a pointer to a `struct
>>> +///   regulator` obtained from [`regulator_get()`](https://docs.kernel=
.org/driver-api/regulator.html#c.regulator_get).
>>=20
>> This should be "`inner` is a pointer obtained from
>> [`regulator_get()`](...)".
>>=20
>>> +/// - Each instance of [`Regulator`] is associated with a single count=
 of
>>> +///   [`regulator_get()`](https://docs.kernel.org/driver-api/regulator=
.html#c.regulator_get).
>>=20
>> This is redundant, so we should remove it.
>
> Why is this redundant? It says that we are associated with a *single* ref=
count.

I'd fold it into the previous bullet point. To me they aren't really
disjoint.

>>> +/// A [`Regulator`] that is known to be enabled.
>>> +///
>>> +/// # Invariants
>>> +///
>>> +/// - [`EnabledRegulator`] is a valid regulator that has been enabled.
>>=20
>> This isn't fully clear what it's supposed to mean to me. Maybe mention
>> the `regulator_enable` function?
>>=20
>>> +/// - Each instance of [`EnabledRegulator`] is associated with a singl=
e count
>>> +///   of [`regulator_enable()`](https://docs.kernel.org/driver-api/reg=
ulator.html#c.regulator_enable)
>>> +///   that was obtained from the [`Regulator`] instance once it was en=
abled.
>>=20
>> Ah I see you mention it here, then what is the bullet point above about?
>
> Again, the word _single_ is what is important here.

I don't see the point in stating it in two separate bullet points.

>>> +pub struct EnabledRegulator {
>>> +    inner: Regulator,
>>> +}
>>> +
>>> +impl EnabledRegulator {
>>> +    fn as_ptr(&self) -> *mut bindings::regulator {
>>> +        self.inner.inner.as_ptr()
>>> +    }
>>> +
>>> +    /// Disables the regulator.
>>> +    pub fn disable(self) -> Result<Regulator> {
>>> +        // Keep the count on `regulator_get()`.
>>> +        let regulator =3D ManuallyDrop::new(self);
>>=20
>> Why don't we drop the refcount if the `regulator_disable` call fails?
>
> I am operating under the assumption that regulator_enable() and
> regulator_disable() do not touch the reference count. Note that we do not
> acquire a new reference when we build EnabledRegulator in Regulator::enab=
le(),
> we merely move our instance of Regulator into EnabledRegulator.
>
> disable() takes EnabledRegulator by value in order to convert it to Regul=
ator.
> If we let the destructor run, that will decrement the refcount as it call=
s
> inner.drop(), so that is why the ManuallyDrop is there in the first place=
. =20
>
> Now if disable() fails, perhaps we should somehow return `self` to the ca=
ller.
> That would let them retry the operation, even if it's unlikely to be of a=
ny
> help, as Mark said. In this sense, I agree that there is a leak that I
> overlooked.

I see two different options on what to do about the leak:

(1) implement `disable` in terms of a new function `try_disable`
    returning `Result<Regulator, DisableError>` where `DisableError`
    gives access to the `EnabledRegulator`.

(2) document that the `disable` function leaks the refcount if an error
    is returned.

I have a slight preference for (1), but if Mark & you decide that it's
not necessary, since users of regulators won't need it any time soon,
then go with (2).

> On a second note, Benno, do you have a clean way to return both kernel::E=
rror
> and `self` here? I assume that introducing a separate error type just for=
 this
> function is overkill.

It's pretty common in Rust to have a custom error type for those cases.
I think we should also do it here, Alice already used the pattern in the
alloc module [1].

[1]: https://lore.kernel.org/all/20250502-vec-methods-v5-3-06d20ad9366f@goo=
gle.com

>>> +
>>> +        // SAFETY: Safe as per the type invariants of `Self`.
>>> +        let res =3D to_result(unsafe { bindings::regulator_disable(reg=
ulator.as_ptr()) });
>>> +
>>> +        res.map(|()| Regulator {
>>> +            inner: regulator.inner.inner,
>>> +        })
>>> +    }
>>> +
>>> +    /// Sets the voltage for the regulator.
>>> +    pub fn set_voltage(&self, min_uv: Microvolt, max_uv: Microvolt) ->=
 Result {
>>> +        self.inner.set_voltage(min_uv, max_uv)
>>> +    }
>>> +
>>> +    /// Gets the current voltage of the regulator.
>>> +    pub fn get_voltage(&self) -> Result<Microvolt> {
>>> +        self.inner.get_voltage()
>>> +    }
>>> +}
>>> +
>>> +impl Drop for EnabledRegulator {
>>> +    fn drop(&mut self) {
>>> +        // SAFETY: By the type invariants, we know that `self` owns a =
reference,
>>> +        // so it is safe to relinquish it now.
>>> +        unsafe { bindings::regulator_disable(self.as_ptr()) };
>>=20
>> Same here, what happens to the refcount?
>
> It remains the same, we never acquired one when we enabled, so we are rel=
ying
> on inner.drop() to decrement it.

Ah I overlooked that. Then it's fine.

---
Cheers,
Benno
