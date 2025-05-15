Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075D11A28D;
	Thu, 15 May 2025 08:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747298793; cv=none; b=FRVOi2qTB39pDK8huQkrA2QjTAme/MOhFahxz/s2LSjfrrG3tk42rxOXhuj89IAflGV7S8xgVqMGBlVlLxttH3TZz/oxyBB7mI5AivluPtWDNgChlB8FwV7/wLFrxfjEAYDCw2IzNHAuhvyl0RYpAC42h28WXKAKsLxZ4G5I+ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747298793; c=relaxed/simple;
	bh=RaBEVejUBWVrVHhrOXFQBMtESL1DRpV6lkC7nuNepHI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ehDTbvpOvTQWH0tZuUQYkTF/aTp9d6CD/hwVs9EYVWjaGz+vX++qrCmsVO0TO2UV7ckLeEg35dCVr+80Sxp7+MPXTdxecFgr2lJM53zTZhzp3+SonHmJfsSWaoai/11zAKfNwbobrEQz3pq62gXMYjiKTy8w5AeemR0SWgjMvcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QeXFD3md; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QeXFD3md"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E2BC4CEE7;
	Thu, 15 May 2025 08:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747298792;
	bh=RaBEVejUBWVrVHhrOXFQBMtESL1DRpV6lkC7nuNepHI=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=QeXFD3mdSVlfAJmSw3M4/M3dFGSG74apaLIocx1dji2b5TfS9wmsszgMdztGV+1tz
	 FoddcBPvASE/Fh9DdOFWl02YntJbbebW5DzXAHBFt0rDLYDVxqSVqqpPRe1Omu0G5l
	 m7fjrngM+C2wek+ZYYbN+T02Sjzvwx0XWTMDpmJUD+9MG2OSGENCzws+SE9QQ0e1sz
	 366we9g7pEhmZmCRjbgWobGY7Z/SbB/mMJBQJBrJsWJGA70aLjS57kmwLsmQpcJ9Ox
	 TpEvSfE1QTUPkTYqSSWlNExyOzkESNW5cfLnV0JcdQqih+MgRLvPj3TC+vFCANaQiZ
	 cV+7U5BIGJz5Q==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 May 2025 10:46:22 +0200
Message-Id: <D9WLQ3J2TRD1.AA50TVOPKMVQ@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
From: "Benno Lossin" <lossin@kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Gary Guo"
 <gary@garyguo.net>
X-Mailer: aerc 0.20.1
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com> <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com> <D9W5IX9Z7QMU.3DL48O2KYTN1Z@kernel.org> <497D0D1E-B607-4822-A083-C0C5B9DB3C57@collabora.com>
In-Reply-To: <497D0D1E-B607-4822-A083-C0C5B9DB3C57@collabora.com>

On Wed May 14, 2025 at 10:58 PM CEST, Daniel Almeida wrote:
> Hi Benno, I really appreciate you taking the time to review my patches.

Glad I can help :)

>> On 14 May 2025, at 17:04, Benno Lossin <lossin@kernel.org> wrote:
>> On Wed May 14, 2025 at 9:20 PM CEST, Daniel Almeida wrote:
>>> Add support for registering IRQ handlers in Rust.
>>>=20
>>> IRQ handlers are extensively used in drivers when some peripheral wants
>>> to obtain the CPU attention. Registering a handler will make the system
>>> invoke the passed-in function whenever the chosen IRQ line is triggered=
.
>>>=20
>>> Both regular and threaded IRQ handlers are supported through a Handler
>>> (or ThreadedHandler) trait that is meant to be implemented by a type
>>> that:
>>>=20
>>> a) provides a function to be run by the system when the IRQ fires and,
>>>=20
>>> b) holds the shared data (i.e.: `T`) between process and IRQ contexts.
>>>=20
>>> The requirement that T is Sync derives from the fact that handlers migh=
t
>>> run concurrently with other processes executing the same driver,
>>> creating the potential for data races.
>>>=20
>>> Ideally, some interior mutability must be in place if T is to be
>>> mutated. This should usually be done through the in-flight SpinLockIrq
>>> type.
>>>=20
>>> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
>>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>>> ---
>>> rust/bindings/bindings_helper.h |   1 +
>>> rust/helpers/helpers.c          |   1 +
>>> rust/helpers/irq.c              |   9 +
>>> rust/kernel/irq.rs              |  24 +++
>>> rust/kernel/irq/flags.rs        | 102 +++++++++
>>> rust/kernel/irq/request.rs      | 455 +++++++++++++++++++++++++++++++++=
+++++++
>>> rust/kernel/lib.rs              |   1 +
>>> 7 files changed, 593 insertions(+)
>>=20
>> Could you split this patch into smaller chunks?
>
> How? This patch does one thing: it adds request_irq functionality.

You could split off the threaded irq stuff and the flags module.

Smaller patches are much much easier to review IMO.

>>> +pub use request::Handler;
>>> +pub use request::IrqReturn;
>>> +pub use request::Registration;
>>> +pub use request::ThreadedHandler;
>>> +pub use request::ThreadedIrqReturn;
>>> +pub use request::ThreadedRegistration;
>>=20
>> Why not?:
>>=20
>>    pub use request::{Handler, ..., ThreadedRegistration};
>
> I dislike this notation. It is just a magnet for conflicts.

Rust-analyzer has the "normalize imports" code action that can help with
that. In one of our meetings, we once discussed having a custom tool
that could merge imports, but nobody took the time to build it.

I don't see the argument here, as this re-export shouldn't really
change.

>>> diff --git a/rust/kernel/irq/flags.rs b/rust/kernel/irq/flags.rs
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..3cfaef65ae14f6c02f55ebc=
f4d52450c0052df30
>>> --- /dev/null
>>> +++ b/rust/kernel/irq/flags.rs
>>> @@ -0,0 +1,102 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +// SPDX-FileCopyrightText: Copyright 2025 Collabora ltd.
>>> +
>>> +use crate::bindings;
>>> +
>>> +/// Flags to be used when registering IRQ handlers.
>>> +///
>>> +/// They can be combined with the operators `|`, `&`, and `!`.
>>> +#[derive(Clone, Copy, PartialEq, Eq)]
>>> +pub struct Flags(u64);
>>=20
>> The constants below seem to all be 32 bit, why did you choose u64?
>
> The C code takes in ffi::c_ulong. Shouldn=E2=80=99t this map to u64? Or m=
aybe usize.

Maybe bindgen is doing some funky stuff, Gary changed the mappings a
couple months ago (from rust/ffi.rs):

    c_long =3D isize;
    c_ulong =3D usize;

So this indeed should be usize, what is going on here?

>>> +/// A registration of an IRQ handler for a given IRQ line.
>>> +///
>>> +/// # Examples
>>> +///
>>> +/// The following is an example of using `Registration`. It uses a
>>> +/// [`SpinLock`](crate::sync::SpinLockIrq) to provide the interior mut=
ability.
>>> +/// Note that Spinlocks are not safe to use in IRQ context as of now, =
but may be
>>> +/// in the future.
>>=20
>> Didn't your commit message mention SpinLockIrq?
>
> This is not upstream yet. I removed all mentions of SpinLockIrq on
> purpose, but I apparently missed some as you say.
>
> We definitely need interrupt-aware spinlocks to access the data in interr=
upt
> context. It is just a matter of deciding whether we will be referring to =
a type
> whose API is not 100% formalized as we speak, or to SpinLock itself - whi=
ch is
> already upstream - with a caveat. I chose the latter.

I don't think we should knowingly do something that is "not safe". If
this requires `SpinLockIrq`, then that should land first. I think
referring to a not-yet-existing type is fine.

>>> +/// # Invariants
>>> +///
>>> +/// * We own an irq handler using `&self` as its private data.
>>> +///
>>> +#[pin_data(PinnedDrop)]
>>> +pub struct Registration<T: Handler> {
>>> +    irq: u32,
>>> +    #[pin]
>>> +    handler: T,
>>> +    #[pin]
>>> +    /// Pinned because we need address stability so that we can pass a=
 pointer
>>> +    /// to the callback.
>>> +    _pin: PhantomPinned,
>>> +}
>>> +
>>> +impl<T: Handler> Registration<T> {
>>> +    /// Registers the IRQ handler with the system for the given IRQ nu=
mber. The
>>> +    /// handler must be able to be called as soon as this function ret=
urns.
>>=20
>> The first line of documentation should be a single sentence description
>> of what the item does. It will get rendered next to it on the summary &
>> search pages.
>
> Right, I actually rendered the docs before submitting, but apparently I m=
issed this.
>
>>=20
>> What is meant by the second sentence? What about this phrasing?: "The
>> handler might be called immediately after this function returns.".
>
> It's a reminder, inherited from the C side, that literally as soon as
> request_irq() returns, your handler may be called. Anything that you need=
 to
> setup before your handler can run must already have been done by this poi=
nt.
>
> Is this the =E2=80=9Csecond sentence=E2=80=9D you are referring to?

Yes. The sentence was worded in a weird way, since in Rust, I would
normally expect that anything can happen to a value, if I give up
ownership.

Also it is not true, since the code in the function body is only run
once you use the initializer, so running this code doesn't do anything:

    let handler =3D ...;
    let flags =3D ...;
    let irg =3D ...;
   =20

    let reg =3D Registration::register(irq, flags, cstr!("foo"), handler);

    // the registration is not yet created, only an initializer for a regis=
tration.

    let reg =3D Arc::pin_init(reg);

    // now the registration has been created and the handler can be called.

>>> +    pub fn register(
>>> +        irq: u32,
>>> +        flags: Flags,
>>> +        name: &'static CStr,
>>> +        handler: T,
>>> +    ) -> impl PinInit<Self, Error> {

>>> +/// The value that can be returned from `ThreadedHandler::handle_irq`.
>>> +#[repr(u32)]
>>> +pub enum ThreadedIrqReturn {
>>> +    /// The interrupt was not from this device or was not handled.
>>> +    None =3D bindings::irqreturn_IRQ_NONE,
>>> +
>>> +    /// The interrupt was handled by this device.
>>> +    Handled =3D bindings::irqreturn_IRQ_HANDLED,
>>> +
>>> +    /// The handler wants the handler thread to wake up.
>>=20
>> How about "The handler wants the handler thread to take care of the
>> interrupt." or is that incorrect?
>
> This is taken straight from the C docs. As I told Andreas, I=E2=80=99d pr=
efer if we
> didn=E2=80=99t add our own docs for C things that have their own docs alr=
eady.

Fine with me, but we could also change the C docs :)

>>> +///     // This will run (in a separate kthread) if and only if `handl=
e_irq`
>>> +///     // returns `WakeThread`.
>>> +///     fn thread_fn(&self) -> IrqReturn {
>>> +///         // We now have exclusive access to the data by locking the=
 SpinLock.
>>> +///         //
>>> +///         // Ideally, we should disable interrupts while we are doin=
g this to
>>> +///         // avoid deadlocks, but this is not currently possible.
>>=20
>> Would this be solved by SpinLockIrq?
>
>
> Yes, that is the point of SpinLockIrq. The exact syntax is still up for d=
ebate,
> although by this time I think Lyude & Boqun have already settled on somet=
hing.

I also was part of the discussion at some point, but dropped out & was
busy with other things. I'll move it up in my todo-list.

---
Cheers,
Benno
