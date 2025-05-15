Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18BF29B20A;
	Thu, 15 May 2025 12:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310820; cv=pass; b=rq25eVrj+z36+4biVKgyYsNuma5JB2NGeZ1g9Op4KJ/OmQ+l4YkWLNFLMTh85TXOj3Ac7KNrrvOfRGwy7c07mM55vWvC6tfeWHvljYl6TS96NW8GTc0EMW8EslMnwtAeKme31+jHQ3Fhczr8lTEGZSh4/iZi74kOM+geZ138/O8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310820; c=relaxed/simple;
	bh=YHBcZfj+gpOyd1pbp1wvKIUykdBNSwdEb0Hvd5YLVg4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=UgaELASK8fYX12zmcHgnHHHrbniFCncdv7aOiN3tQhnzxp92U8Bagie16iiS0RqSTOH1xWIgJML4hoXOuglPW0GrRGSMkaOvXCJwObK9WnaNWoOYsotbcFVmirLAVpV+bHHHDpq+t3Cy1/Gkj0FAWpAFlDdpgyDtlsmfNGyqj1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=jCe2m7/G; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="jCe2m7/G"
ARC-Seal: i=1; a=rsa-sha256; t=1747310786; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a6Gpr9s71JpP8q0FaDIH5QIJBcHXWhKBPHo3wcrAFWMsbGpcoVLJbyg1bge8PwdsHJQFR65aP9LjWJeHzrF5YUHW2K2PlSXazJi4ogmiuBpmwy57ViWN/KzZbEXLDWhXWq/YgOGgcsDHK4jyF7KvQdnV8O+P1ZNuS/yHSigJgk8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747310786; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xSGp2fjruvmM+cWh+o5418ZbfERk+gGKDQg0b2YWQEU=; 
	b=IdDFKCyRlkGGQ2ej5fcAQhDY8QA9ZGPfNbI8RkSiUMALitG1PVryVnpBFGv/gk4sDh7gDY2YXq5sJl59AqDBWwbgHjHgGn76El++0svN9BYwjO0iu1ZfdlVpD2iRb/1CBi80bIzH/+hGHntmGTV73DFEWXiURgOc1aPCwCn1h1I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747310786;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=xSGp2fjruvmM+cWh+o5418ZbfERk+gGKDQg0b2YWQEU=;
	b=jCe2m7/Gj8+ebINvfEYUYCgOT6wxqi9Rv6R2UvL/v+MzeRyHzTYJG7cSixgtStKO
	0NMONVx1aS3tVnUQchebaNwt9kEwoYZD07772ppxmhd0TgVZAgTZL3MfWLQOEQ82vnO
	Hlwxq5PMQZiFNZV6duX83bgAd/OQr7gSFG5oiXtg=
Received: by mx.zohomail.com with SMTPS id 1747310785107904.5936302375475;
	Thu, 15 May 2025 05:06:25 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <D9WLQ3J2TRD1.AA50TVOPKMVQ@kernel.org>
Date: Thu, 15 May 2025 09:06:09 -0300
Cc: Gary Guo <gary@garyguo.net>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <BA37BE0B-33A6-4B23-9405-ED796B451427@collabora.com>
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
 <D9W5IX9Z7QMU.3DL48O2KYTN1Z@kernel.org>
 <497D0D1E-B607-4822-A083-C0C5B9DB3C57@collabora.com>
 <D9WLQ3J2TRD1.AA50TVOPKMVQ@kernel.org>
To: Benno Lossin <lossin@kernel.org>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-ZohoMailClient: External

Hi Benno,

> On 15 May 2025, at 05:46, Benno Lossin <lossin@kernel.org> wrote:
>=20
> On Wed May 14, 2025 at 10:58 PM CEST, Daniel Almeida wrote:
>> Hi Benno, I really appreciate you taking the time to review my =
patches.
>=20
> Glad I can help :)
>=20
>>> On 14 May 2025, at 17:04, Benno Lossin <lossin@kernel.org> wrote:
>>> On Wed May 14, 2025 at 9:20 PM CEST, Daniel Almeida wrote:
>>>> Add support for registering IRQ handlers in Rust.
>>>>=20
>>>> IRQ handlers are extensively used in drivers when some peripheral =
wants
>>>> to obtain the CPU attention. Registering a handler will make the =
system
>>>> invoke the passed-in function whenever the chosen IRQ line is =
triggered.
>>>>=20
>>>> Both regular and threaded IRQ handlers are supported through a =
Handler
>>>> (or ThreadedHandler) trait that is meant to be implemented by a =
type
>>>> that:
>>>>=20
>>>> a) provides a function to be run by the system when the IRQ fires =
and,
>>>>=20
>>>> b) holds the shared data (i.e.: `T`) between process and IRQ =
contexts.
>>>>=20
>>>> The requirement that T is Sync derives from the fact that handlers =
might
>>>> run concurrently with other processes executing the same driver,
>>>> creating the potential for data races.
>>>>=20
>>>> Ideally, some interior mutability must be in place if T is to be
>>>> mutated. This should usually be done through the in-flight =
SpinLockIrq
>>>> type.
>>>>=20
>>>> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
>>>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>>>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>>>> ---
>>>> rust/bindings/bindings_helper.h |   1 +
>>>> rust/helpers/helpers.c          |   1 +
>>>> rust/helpers/irq.c              |   9 +
>>>> rust/kernel/irq.rs              |  24 +++
>>>> rust/kernel/irq/flags.rs        | 102 +++++++++
>>>> rust/kernel/irq/request.rs      | 455 =
++++++++++++++++++++++++++++++++++++++++
>>>> rust/kernel/lib.rs              |   1 +
>>>> 7 files changed, 593 insertions(+)
>>>=20
>>> Could you split this patch into smaller chunks?
>>=20
>> How? This patch does one thing: it adds request_irq functionality.
>=20
> You could split off the threaded irq stuff and the flags module.
>=20
> Smaller patches are much much easier to review IMO.

The flags are needed for non-threaded IRQs too.

I think this can probably be split into:

"Add IRQ module"
"Add IRQ flags" <--- in preparation for next patch
"Add non-threaded IRQs"
"Add threaded IRQs=E2=80=9D

WDYT?

>=20
>>>> +pub use request::Handler;
>>>> +pub use request::IrqReturn;
>>>> +pub use request::Registration;
>>>> +pub use request::ThreadedHandler;
>>>> +pub use request::ThreadedIrqReturn;
>>>> +pub use request::ThreadedRegistration;
>>>=20
>>> Why not?:
>>>=20
>>>   pub use request::{Handler, ..., ThreadedRegistration};
>>=20
>> I dislike this notation. It is just a magnet for conflicts.
>=20
> Rust-analyzer has the "normalize imports" code action that can help =
with
> that. In one of our meetings, we once discussed having a custom tool
> that could merge imports, but nobody took the time to build it.
>=20
> I don't see the argument here, as this re-export shouldn't really
> change.

Yeah, in this instance that is true.=20


>=20
>>>> diff --git a/rust/kernel/irq/flags.rs b/rust/kernel/irq/flags.rs
>>>> new file mode 100644
>>>> index =
0000000000000000000000000000000000000000..3cfaef65ae14f6c02f55ebcf4d52450c=
0052df30
>>>> --- /dev/null
>>>> +++ b/rust/kernel/irq/flags.rs
>>>> @@ -0,0 +1,102 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +// SPDX-FileCopyrightText: Copyright 2025 Collabora ltd.
>>>> +
>>>> +use crate::bindings;
>>>> +
>>>> +/// Flags to be used when registering IRQ handlers.
>>>> +///
>>>> +/// They can be combined with the operators `|`, `&`, and `!`.
>>>> +#[derive(Clone, Copy, PartialEq, Eq)]
>>>> +pub struct Flags(u64);
>>>=20
>>> The constants below seem to all be 32 bit, why did you choose u64?
>>=20
>> The C code takes in ffi::c_ulong. Shouldn=E2=80=99t this map to u64? =
Or maybe usize.
>=20
> Maybe bindgen is doing some funky stuff, Gary changed the mappings a
> couple months ago (from rust/ffi.rs):
>=20
>    c_long =3D isize;
>    c_ulong =3D usize;
>=20
> So this indeed should be usize, what is going on here?

I think this is working as intended. The C bindgen function does take =
usize, so
the u64 can go away. I guess this confusion started because the =
individual
flags are u32 though, so at least a conversion from u32 to usize will be
needed.

>=20
>>>> +/// A registration of an IRQ handler for a given IRQ line.
>>>> +///
>>>> +/// # Examples
>>>> +///
>>>> +/// The following is an example of using `Registration`. It uses a
>>>> +/// [`SpinLock`](crate::sync::SpinLockIrq) to provide the interior =
mutability.
>>>> +/// Note that Spinlocks are not safe to use in IRQ context as of =
now, but may be
>>>> +/// in the future.
>>>=20
>>> Didn't your commit message mention SpinLockIrq?
>>=20
>> This is not upstream yet. I removed all mentions of SpinLockIrq on
>> purpose, but I apparently missed some as you say.
>>=20
>> We definitely need interrupt-aware spinlocks to access the data in =
interrupt
>> context. It is just a matter of deciding whether we will be referring =
to a type
>> whose API is not 100% formalized as we speak, or to SpinLock itself - =
which is
>> already upstream - with a caveat. I chose the latter.
>=20
> I don't think we should knowingly do something that is "not safe". If
> this requires `SpinLockIrq`, then that should land first. I think
> referring to a not-yet-existing type is fine.

Well, SpinLockIrq has been brewing for quite a while. Waiting for it to =
land
can introduce an unbounded delay here. Note that IRQ handling is =
extremely
important for drivers.

What we can do is to simply remove the locks from all the examples. The =
code
will still work fine, you just won't be able to mutate the data without =
the
interior mutability, of course.

A subsequent patch can (re)introduce the examples where the data is =
mutated
when SpinLockIrq lands. WDYT?

>=20
>>>> +/// # Invariants
>>>> +///
>>>> +/// * We own an irq handler using `&self` as its private data.
>>>> +///
>>>> +#[pin_data(PinnedDrop)]
>>>> +pub struct Registration<T: Handler> {
>>>> +    irq: u32,
>>>> +    #[pin]
>>>> +    handler: T,
>>>> +    #[pin]
>>>> +    /// Pinned because we need address stability so that we can =
pass a pointer
>>>> +    /// to the callback.
>>>> +    _pin: PhantomPinned,
>>>> +}
>>>> +
>>>> +impl<T: Handler> Registration<T> {
>>>> +    /// Registers the IRQ handler with the system for the given =
IRQ number. The
>>>> +    /// handler must be able to be called as soon as this function =
returns.
>>>=20
>>> The first line of documentation should be a single sentence =
description
>>> of what the item does. It will get rendered next to it on the =
summary &
>>> search pages.
>>=20
>> Right, I actually rendered the docs before submitting, but apparently =
I missed this.
>>=20
>>>=20
>>> What is meant by the second sentence? What about this phrasing?: =
"The
>>> handler might be called immediately after this function returns.".
>>=20
>> It's a reminder, inherited from the C side, that literally as soon as
>> request_irq() returns, your handler may be called. Anything that you =
need to
>> setup before your handler can run must already have been done by this =
point.
>>=20
>> Is this the =E2=80=9Csecond sentence=E2=80=9D you are referring to?
>=20
> Yes. The sentence was worded in a weird way, since in Rust, I would
> normally expect that anything can happen to a value, if I give up
> ownership.
>=20
> Also it is not true, since the code in the function body is only run
> once you use the initializer, so running this code doesn't do =
anything:
>=20
>    let handler =3D ...;
>    let flags =3D ...;
>    let irg =3D ...;
>=20
>=20
>    let reg =3D Registration::register(irq, flags, cstr!("foo"), =
handler);
>=20
>    // the registration is not yet created, only an initializer for a =
registration.
>=20
>    let reg =3D Arc::pin_init(reg);
>=20
>    // now the registration has been created and the handler can be =
called.

Right, this is true.

>=20
>>>> +    pub fn register(
>>>> +        irq: u32,
>>>> +        flags: Flags,
>>>> +        name: &'static CStr,
>>>> +        handler: T,
>>>> +    ) -> impl PinInit<Self, Error> {
>=20
>>>> +/// The value that can be returned from =
`ThreadedHandler::handle_irq`.
>>>> +#[repr(u32)]
>>>> +pub enum ThreadedIrqReturn {
>>>> +    /// The interrupt was not from this device or was not handled.
>>>> +    None =3D bindings::irqreturn_IRQ_NONE,
>>>> +
>>>> +    /// The interrupt was handled by this device.
>>>> +    Handled =3D bindings::irqreturn_IRQ_HANDLED,
>>>> +
>>>> +    /// The handler wants the handler thread to wake up.
>>>=20
>>> How about "The handler wants the handler thread to take care of the
>>> interrupt." or is that incorrect?
>>=20
>> This is taken straight from the C docs. As I told Andreas, I=E2=80=99d =
prefer if we
>> didn=E2=80=99t add our own docs for C things that have their own docs =
already.
>=20
> Fine with me, but we could also change the C docs :)
>=20
>>>> +///     // This will run (in a separate kthread) if and only if =
`handle_irq`
>>>> +///     // returns `WakeThread`.
>>>> +///     fn thread_fn(&self) -> IrqReturn {
>>>> +///         // We now have exclusive access to the data by locking =
the SpinLock.
>>>> +///         //
>>>> +///         // Ideally, we should disable interrupts while we are =
doing this to
>>>> +///         // avoid deadlocks, but this is not currently =
possible.
>>>=20
>>> Would this be solved by SpinLockIrq?
>>=20
>>=20
>> Yes, that is the point of SpinLockIrq. The exact syntax is still up =
for debate,
>> although by this time I think Lyude & Boqun have already settled on =
something.
>=20
> I also was part of the discussion at some point, but dropped out & was
> busy with other things. I'll move it up in my todo-list.

Ah yes, that would be very helpful. SpinLockIrq is another very =
important
missing piece in the ecosystem.

>=20
> ---
> Cheers,
> Benno


