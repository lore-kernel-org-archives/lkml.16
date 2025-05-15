Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E1E29992C;
	Thu, 15 May 2025 12:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747313065; cv=none; b=dZ5FamE+2mFNatoTundXp6pLgZbVYO6XGGvvbvHRgxNWW2Ov/wmep3I2r0KTfCFiFFImKDfoarefxZlPG+Hym1FS7Eiz0MqzjZpWfTYRqAsq7ew/pMthz4rkpMq0eXuzZMR+f2EOAcVU2dmTK7ssVDrRA8yOlTjya0qxPeQ2Piw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747313065; c=relaxed/simple;
	bh=Z8N8paqUuxQVMujLvpuq1m5MGidnqZugN6MjWEMFtH0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=tv6M9Tzf7e5waWtlZ34nyfVqOVvJ8c3McMLImnDp+GzAzzlhJxNPC2FmLzpX0JeeGnl/xPbgJhM8q9bsIQeGeLOkXIrtLCJAQPClV0oarU96JnDvlbogk0yJ0ZhVj7MF8+f15xOXrAJT0bsyCeW891vuZXkLlqcX4m1FnXOjyNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gR98CX5a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gR98CX5a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE616C4CEE7;
	Thu, 15 May 2025 12:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747313065;
	bh=Z8N8paqUuxQVMujLvpuq1m5MGidnqZugN6MjWEMFtH0=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=gR98CX5aQ180D9LNwddyC/RnPFYXbQeGgSP9t7JJ08i4XiIR3XNkqj3AzRlJ9gLm1
	 Eu/b4SCXkH5SYuYqHWkHTlyj2Vg2zXCtr31Y4j/bquS3kWFpzIjT6Erh8H7y/v+1Bo
	 u9C2Mj031wwAfcldATci3FG66m6h6NlpthHntDFyfxj/G7ej8k8fi2I5UF4c/ufHKD
	 NTY6CweUf+gEPcYvC/gwifvlBnyfn+6UkQ5u4VltdU/RgyzScFRDgUMhesdU1wXvs+
	 FC4EjURemppKCZPfG5NC6vqCnufLQojbU6kZqoxI6Am62sd/a0drdtw0hVzbvxr9G/
	 de5vslbbwB9rQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 May 2025 14:44:16 +0200
Message-Id: <D9WQS8SVDO0V.2DS5K831HCP7X@kernel.org>
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
From: "Benno Lossin" <lossin@kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com> <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com> <D9W5IX9Z7QMU.3DL48O2KYTN1Z@kernel.org> <497D0D1E-B607-4822-A083-C0C5B9DB3C57@collabora.com> <D9WLQ3J2TRD1.AA50TVOPKMVQ@kernel.org> <BA37BE0B-33A6-4B23-9405-ED796B451427@collabora.com>
In-Reply-To: <BA37BE0B-33A6-4B23-9405-ED796B451427@collabora.com>

On Thu May 15, 2025 at 2:06 PM CEST, Daniel Almeida wrote:
>>>>> rust/bindings/bindings_helper.h |   1 +
>>>>> rust/helpers/helpers.c          |   1 +
>>>>> rust/helpers/irq.c              |   9 +
>>>>> rust/kernel/irq.rs              |  24 +++
>>>>> rust/kernel/irq/flags.rs        | 102 +++++++++
>>>>> rust/kernel/irq/request.rs      | 455 +++++++++++++++++++++++++++++++=
+++++++++
>>>>> rust/kernel/lib.rs              |   1 +
>>>>> 7 files changed, 593 insertions(+)
>>>>=20
>>>> Could you split this patch into smaller chunks?
>>>=20
>>> How? This patch does one thing: it adds request_irq functionality.
>>=20
>> You could split off the threaded irq stuff and the flags module.
>>=20
>> Smaller patches are much much easier to review IMO.
>
> The flags are needed for non-threaded IRQs too.

Oh yeah, I didn't suggest an order, but rather a set of things :)

> I think this can probably be split into:
>
> "Add IRQ module"
> "Add IRQ flags" <--- in preparation for next patch
> "Add non-threaded IRQs"
> "Add threaded IRQs=E2=80=9D
>
> WDYT?

Yeah that looks good.

>>>>> diff --git a/rust/kernel/irq/flags.rs b/rust/kernel/irq/flags.rs
>>>>> new file mode 100644
>>>>> index 0000000000000000000000000000000000000000..3cfaef65ae14f6c02f55e=
bcf4d52450c0052df30
>>>>> --- /dev/null
>>>>> +++ b/rust/kernel/irq/flags.rs
>>>>> @@ -0,0 +1,102 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>> +// SPDX-FileCopyrightText: Copyright 2025 Collabora ltd.
>>>>> +
>>>>> +use crate::bindings;
>>>>> +
>>>>> +/// Flags to be used when registering IRQ handlers.
>>>>> +///
>>>>> +/// They can be combined with the operators `|`, `&`, and `!`.
>>>>> +#[derive(Clone, Copy, PartialEq, Eq)]
>>>>> +pub struct Flags(u64);
>>>>=20
>>>> The constants below seem to all be 32 bit, why did you choose u64?
>>>=20
>>> The C code takes in ffi::c_ulong. Shouldn=E2=80=99t this map to u64? Or=
 maybe usize.
>>=20
>> Maybe bindgen is doing some funky stuff, Gary changed the mappings a
>> couple months ago (from rust/ffi.rs):
>>=20
>>    c_long =3D isize;
>>    c_ulong =3D usize;
>>=20
>> So this indeed should be usize, what is going on here?
>
> I think this is working as intended. The C bindgen function does take usi=
ze, so
> the u64 can go away. I guess this confusion started because the individua=
l
> flags are u32 though, so at least a conversion from u32 to usize will be
> needed.

Ah we were talking about two different things. The functions take
`c_ulong`, but the definitions are pre-processor macros and thus don't
have a type annotation. That's why bindgen uses `u32`, because that's
the type that the constant fits in (AFAIK there are also some weird
rules in C about this? but don't quote me on that).

One way would be to turn the `#define`s into constants, but from
previous discussions I remember there were some reasons to not do that,
so I have no idea. The casts are unfortunate, but if we can't change the
C side to include the types in these constants, then it's fine.

>>>>> +/// A registration of an IRQ handler for a given IRQ line.
>>>>> +///
>>>>> +/// # Examples
>>>>> +///
>>>>> +/// The following is an example of using `Registration`. It uses a
>>>>> +/// [`SpinLock`](crate::sync::SpinLockIrq) to provide the interior m=
utability.
>>>>> +/// Note that Spinlocks are not safe to use in IRQ context as of now=
, but may be
>>>>> +/// in the future.
>>>>=20
>>>> Didn't your commit message mention SpinLockIrq?
>>>=20
>>> This is not upstream yet. I removed all mentions of SpinLockIrq on
>>> purpose, but I apparently missed some as you say.
>>>=20
>>> We definitely need interrupt-aware spinlocks to access the data in inte=
rrupt
>>> context. It is just a matter of deciding whether we will be referring t=
o a type
>>> whose API is not 100% formalized as we speak, or to SpinLock itself - w=
hich is
>>> already upstream - with a caveat. I chose the latter.
>>=20
>> I don't think we should knowingly do something that is "not safe". If
>> this requires `SpinLockIrq`, then that should land first. I think
>> referring to a not-yet-existing type is fine.
>
> Well, SpinLockIrq has been brewing for quite a while. Waiting for it to l=
and
> can introduce an unbounded delay here. Note that IRQ handling is extremel=
y
> important for drivers.

But is it useful even without `SpinLockIrq`?

> What we can do is to simply remove the locks from all the examples. The c=
ode
> will still work fine, you just won't be able to mutate the data without t=
he
> interior mutability, of course.

Do atomics work normally in IRQ context? (I know that Boqun's atomic
series also needs some work, so maybe not a good alternative)

> A subsequent patch can (re)introduce the examples where the data is mutat=
ed
> when SpinLockIrq lands. WDYT?

I think that is better than including wrong examples with a caveat, as
some people might not read it or assume that the restriction somehow
doesn't apply to them.

---
Cheers,
Benno
