Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34509292087;
	Fri,  9 May 2025 13:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746799168; cv=pass; b=hrzDZp1CkE2aIjPEzvuQD/U7YUBq2RdZr8uMiqJVP4CIzJXoWh4NWDqU1FADKBSJewY7CsTKqaFccA3L9BQs36EnInD9gq4fJKn+lVSEAHMnKCu11Bf4kmfLizCa/h4ON4TKjSsSUDIyZkxR1G2UYcTM0jQbYLdRkqn/Bzz2sWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746799168; c=relaxed/simple;
	bh=+uYAL6ECur2e83PjAyjSzCLvW1GpqC8MjdC1O23/k6Q=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=NOr9tyJpR+VMc2cIyMOSIsuHv7/hQBefOfWKPXO44l5ckf9wI2f/5tSBSedu02n2xafPefUpENkcUdtT0tauBc8ueFzfEh7QgSeoLwwzqOKPC2RUEAtOdvztbHl+5CmvAaI9hv8sWivLqk5uyE3oOGDMmv1rfUUfHg1BzLC1xEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=dy6Cyp3g; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="dy6Cyp3g"
ARC-Seal: i=1; a=rsa-sha256; t=1746799146; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FBwTQTDImajKkF/4UZ6lzrLBV66kYKi1j/6fLyjBXKj+LWRkcoolb8P6rB5TTxRqe57Pg4Y28FZ0mty4Eqa8nVA/GL9P0RHSSmoQaFlcs5ogqcQEhDGJ9mFdG1Abg0XlGha4w2PRXMTzzAkDYS3GpJgj7aoB3gzJI0RRogoNlT4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746799146; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uVKTD0NbDgNxHyHyQd5EqjZMHOq/pvPZysSKYUtDwhE=; 
	b=cJ0AP9PmX71uUp+sxXxESZThOEotsthUfl56OVhd0CSWUG8XeN/4KKIkX5mBe41B2ucg5SkpW71mRiFalo1sLU2a1mDTN3oT6ZKUVAfLpXjM0pBlaiBBCJH1/hDU2iReW6cHqFQeopVgT2tjYeWvzkZQT8CFg6eyceySTU6pidQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746799146;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=uVKTD0NbDgNxHyHyQd5EqjZMHOq/pvPZysSKYUtDwhE=;
	b=dy6Cyp3g/IDQ53lKFgD6GL6/GBp13Y8tfhlBBYKZnQZQ+Grx3ChdtcNCtZCsppfS
	/+fgcJQbsmJJ/0H5ZJ9FUXGCUHi96YAPSDoYivV/hTMvVulZYoJWlLM0sRCZnwwekp2
	ummGLxSbNFybYXTobWhDinae4JDh+a0HFukz51eA=
Received: by mx.zohomail.com with SMTPS id 174679914282180.23781432424187;
	Fri, 9 May 2025 06:59:02 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH v2] rust: irq: add support for request_irq()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <87cyewhpxj.fsf@kernel.org>
Date: Fri, 9 May 2025 10:58:46 -0300
Cc: ojeda@kernel.org,
 alex.gaynor@gmail.com,
 boqun.feng@gmail.com,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 benno.lossin@proton.me,
 tmgross@umich.edu,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Alice Ryhl <aliceryhl@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <608A7955-1A23-4559-AE93-FBBD34A9B01E@collabora.com>
References: <u-vC1KbeOK3Fd2PClzinb8LmqS_dntOW-pOSmZIFWotCZeTOg30xR_GYUc4oReAKZeuuu7ZaXWzfeTkpGMlr0A==@protonmail.internalid>
 <20250122163932.46697-1-daniel.almeida@collabora.com>
 <87cyewhpxj.fsf@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-ZohoMailClient: External

Hi Andreas,

I am going to work on a new iteration of this patch. Are you satisfied =
with the
answers Alice gave you w.r.t ForeignOwnable? My take is the same as =
hers: we
don't need it here. The code you linked to is more restrictive in the =
sense
that it requires an allocation, which is not the case currently.

Her solution will cater to the use case you've described, so this should =
be OK
on your end?

> On 4 Mar 2025, at 10:43, Andreas Hindborg <a.hindborg@kernel.org> =
wrote:
>=20
> "Daniel Almeida" <daniel.almeida@collabora.com> writes:
>=20
>> Add support for registering IRQ handlers in Rust.
>>=20
>> IRQ handlers are extensively used in drivers when some peripheral =
wants to
>> obtain the CPU attention. Registering a handler will make the system =
invoke the
>> passed-in function whenever the chosen IRQ line is triggered.
>>=20
>> Both regular and threaded IRQ handlers are supported through a =
Handler (or
>> ThreadedHandler) trait that is meant to be implemented by a type =
that:
>>=20
>> a) provides a function to be run by the system when the IRQ fires =
and,
>>=20
>> b) holds the shared data (i.e.: `T`) between process and IRQ =
contexts.
>>=20
>> The requirement that T is Sync derives from the fact that handlers =
might run
>> concurrently with other processes executing the same driver, creating =
the
>> potential for data races.
>>=20
>> Ideally, some interior mutability must be in place if T is to be =
mutated. This
>> should usually be done through the in-flight SpinLockIrq type.
>>=20
>> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>=20
> What is the base commit to apply this patch to? I am getting some
> compiler errors when trying it out:
>=20
>    error[E0308]: mismatched types
>      --> =
/home/aeh/src/linux-rust/linux/rust/kernel/irq/request.rs:240:21
>        |
>    237 |                 bindings::request_irq(
>        |                 --------------------- arguments to this =
function are incorrect
>    ...
>    240 |                     flags.0,
>        |                     ^^^^^^^ expected `usize`, found `u64`
>        |
>=20
> [...]

I will rebase on top of the newest rc for 6.15

>=20
>> diff --git a/rust/kernel/irq.rs b/rust/kernel/irq.rs
>> new file mode 100644
>> index 000000000000..3ab83c5bdb83
>> --- /dev/null
>> +++ b/rust/kernel/irq.rs
>> @@ -0,0 +1,6 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! IRQ abstractions
>=20
> We could do with a longer story here. Also, missing a period.
>=20
>> +
>> +/// IRQ allocation and handling
>> +pub mod request;
>> diff --git a/rust/kernel/irq/request.rs b/rust/kernel/irq/request.rs
>> new file mode 100644
>> index 000000000000..61e7d4a8f555
>> --- /dev/null
>> +++ b/rust/kernel/irq/request.rs
>> @@ -0,0 +1,517 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// SPDX-FileCopyrightText: Copyright 2025 Collabora ltd.
>> +
>> +//! IRQ allocation and handling
>> +
>> +use core::marker::PhantomPinned;
>> +use core::ptr::addr_of_mut;
>> +
>> +use init::pin_init_from_closure;
>> +
>> +use crate::error::to_result;
>> +use crate::prelude::*;
>> +use crate::str::CStr;
>> +
>> +/// Flags to be used when registering IRQ handlers.
>> +///
>> +/// They can be combined with the operators `|`, `&`, and `!`.
>> +///
>> +/// Values can be used from the [`flags`] module.
>> +#[derive(Clone, Copy)]
>> +pub struct Flags(u64);
>> +
>> +impl core::ops::BitOr for Flags {
>> +    type Output =3D Self;
>> +    fn bitor(self, rhs: Self) -> Self::Output {
>> +        Self(self.0 | rhs.0)
>> +    }
>> +}
>> +
>> +impl core::ops::BitAnd for Flags {
>> +    type Output =3D Self;
>> +    fn bitand(self, rhs: Self) -> Self::Output {
>> +        Self(self.0 & rhs.0)
>> +    }
>> +}
>> +
>> +impl core::ops::Not for Flags {
>> +    type Output =3D Self;
>> +    fn not(self) -> Self::Output {
>> +        Self(!self.0)
>> +    }
>> +}
>> +
>> +/// The flags that can be used when registering an IRQ handler.
>> +pub mod flags {
>> +    use super::Flags;
>> +
>> +    use crate::bindings;
>> +
>> +    /// Use the interrupt line as already configured.
>> +    pub const TRIGGER_NONE: Flags =3D =
Flags(bindings::IRQF_TRIGGER_NONE as _);
>=20
> What is the reason for the `as _` in all these? Should the flag type =
be
> something else?

I think this was before Gary=E2=80=99s patch to improve the mapping of =
FFI types in bindgen.

>=20
>> +
>> +    /// The interrupt is triggered when the signal goes from low to =
high.
>> +    pub const TRIGGER_RISING: Flags =3D =
Flags(bindings::IRQF_TRIGGER_RISING as _);
>> +
>> +    /// The interrupt is triggered when the signal goes from high to =
low.
>> +    pub const TRIGGER_FALLING: Flags =3D =
Flags(bindings::IRQF_TRIGGER_FALLING as _);
>> +
>> +    /// The interrupt is triggered while the signal is held high.
>> +    pub const TRIGGER_HIGH: Flags =3D =
Flags(bindings::IRQF_TRIGGER_HIGH as _);
>> +
>> +    /// The interrupt is triggered while the signal is held low.
>> +    pub const TRIGGER_LOW: Flags =3D =
Flags(bindings::IRQF_TRIGGER_LOW as _);
>> +
>> +    /// Allow sharing the irq among several devices.
>> +    pub const SHARED: Flags =3D Flags(bindings::IRQF_SHARED as _);
>> +
>> +    /// Set by callers when they expect sharing mismatches to occur.
>=20
> What is a sharing mismatch?
>=20
>> +    pub const PROBE_SHARED: Flags =3D =
Flags(bindings::IRQF_PROBE_SHARED as _);
>> +
>> +    /// Flag to mark this interrupt as timer interrupt.
>=20
> The "Flag to ..." strikes me as odd when most of the other =
descriptions
> have a different wording.
>=20
>> +    pub const TIMER: Flags =3D Flags(bindings::IRQF_TIMER as _);
>> +
>> +    /// Interrupt is per cpu.
>> +    pub const PERCPU: Flags =3D Flags(bindings::IRQF_PERCPU as _);
>> +
>> +    /// Flag to exclude this interrupt from irq balancing.
>> +    pub const NOBALANCING: Flags =3D =
Flags(bindings::IRQF_NOBALANCING as _);
>> +
>> +    /// Interrupt is used for polling (only the interrupt that is =
registered
>> +    /// first in a shared interrupt is considered for performance =
reasons).
>> +    pub const IRQPOLL: Flags =3D Flags(bindings::IRQF_IRQPOLL as _);
>> +
>> +    /// Interrupt is not reenabled after the hardirq handler =
finished. Used by
>> +    /// threaded interrupts which need to keep the irq line disabled =
until the
>> +    /// threaded handler has been run.
>> +    pub const ONESHOT: Flags =3D Flags(bindings::IRQF_ONESHOT as _);
>> +
>> +    /// Do not disable this IRQ during suspend. Does not guarantee =
that this
>> +    /// interrupt will wake the system from a suspended state.
>> +    pub const NO_SUSPEND: Flags =3D Flags(bindings::IRQF_NO_SUSPEND =
as _);
>> +
>> +    /// Force enable it on resume even if [`NO_SUSPEND`] is set.
>=20
> Perhaps: Force enable the interrupt even if ...


All your comments above are addressing the documentation that was =
deliberately
copied and pasted from C. IMHO, we should refrain from introducing our =
own
documentation in this case because it will just confuse users. Any =
changes here
should be proposed to the C side directly.

>=20
>> +    pub const FORCE_RESUME: Flags =3D =
Flags(bindings::IRQF_FORCE_RESUME as _);
>> +
>> +    /// Interrupt cannot be threaded.
>> +    pub const NO_THREAD: Flags =3D Flags(bindings::IRQF_NO_THREAD as =
_);
>> +
>> +    /// Resume IRQ early during syscore instead of at device resume =
time.
>> +    pub const EARLY_RESUME: Flags =3D =
Flags(bindings::IRQF_EARLY_RESUME as _);
>> +
>> +    /// If the IRQ is shared with a NO_SUSPEND user, execute this =
interrupt
>=20
> Please link `NO_SUSPEND`.

Sure

>=20
>> +    /// handler after suspending interrupts. For system wakeup =
devices users
>> +    /// need to implement wakeup detection in their interrupt =
handlers.
>> +    pub const COND_SUSPEND: Flags =3D =
Flags(bindings::IRQF_COND_SUSPEND as _);
>> +
>> +    /// Don't enable IRQ or NMI automatically when users request it. =
Users will
>> +    /// enable it explicitly by `enable_irq` or `enable_nmi` later.
>> +    pub const NO_AUTOEN: Flags =3D Flags(bindings::IRQF_NO_AUTOEN as =
_);
>> +
>> +    /// Exclude from runnaway detection for IPI and similar =
handlers, depends on
>> +    /// `PERCPU`.
>> +    pub const NO_DEBUG: Flags =3D Flags(bindings::IRQF_NO_DEBUG as =
_);
>> +}
>> +
>> +/// The value that can be returned from an IrqHandler or a =
ThreadedIrqHandler.
>> +pub enum IrqReturn {
>=20
> I learned recently that if you choose the right representation here, =
you
> don't need to cast here and when you call `Handler::handle_irq`. I =
think
> `#[repr(u32)]` is the one to use here.

Thanks!

>=20
>> +    /// The interrupt was not from this device or was not handled.
>> +    None =3D bindings::irqreturn_IRQ_NONE as _,
>> +
>> +    /// The interrupt was handled by this device.
>> +    Handled =3D bindings::irqreturn_IRQ_HANDLED as _,
>> +}
>> +
>> +/// Callbacks for an IRQ handler.
>> +pub trait Handler: Sync {
>> +    /// The actual handler function. As usual, sleeps are not =
allowed in IRQ
>> +    /// context.
>> +    fn handle_irq(&self) -> IrqReturn;
>> +}
>=20
> What is the reason for moving away from the following:
>=20
>=20
>    pub trait Handler {
>        /// The context data associated with and made available to the =
handler.
>        type Data: ForeignOwnable;
>=20
>        /// Called from interrupt context when the irq happens.
>        fn handle_irq(data: <Self::Data as =
ForeignOwnable>::Borrowed<'_>) -> Return;
>    }
>=20
>=20
> I think we will run into problems if we want to pass `Arc<Foo>` as the
> handler. I don't think we can `impl Handler for Arc<Foo>` in a driver
> crate, since both `Handler` and `Arc` are defined in external crates
>=20
>=20
> [...]
>=20
>> +#[pin_data(PinnedDrop)]
>> +pub struct ThreadedRegistration<T: ThreadedHandler> {
>> +    irq: u32,
>> +    #[pin]
>> +    handler: T,
>> +    #[pin]
>> +    /// Pinned because we need address stability so that we can pass =
a pointer
>> +    /// to the callback.
>> +    _pin: PhantomPinned,
>> +}
>=20
> As others have mentioned, I wonder if we can avoid the code =
duplication
> that makes up most of the rest of this patch.
>=20
>=20
> Best regards,
> Andreas Hindborg

=E2=80=94 Daniel=
