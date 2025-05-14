Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com [136.143.184.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8446C2206B7;
	Wed, 14 May 2025 20:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747256348; cv=pass; b=p0yBHDRQqlPY0LgNS+e2fGYCl8SZ/HUsKb7/BFDZ4KXvFqHE1/4QPMiq+RqP/TRQfEmfrbKIrHYpl+OTtsADRG5hlWik+BweCgqtVdsUMrYI2yupCjKwFKT1qs1IYvjSFZOkDqPmSoY+WTcxgGetTjKdN9BGXasm8Awr037x0GA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747256348; c=relaxed/simple;
	bh=r7xQcTv7MsHNtfYhn+s6tZS0vUXuz5Xfcft2RhASlW4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=VzUmNnC9uag2jGyDhhSPHpS/lIOTT5V7x5VtGSDVSoPG156OO1w5m4lhCC1S9uaCFKJIZy5BMoDd1Y6uk3WFwScFxTdyt3/rn4Ocqz0zeKQkpk2rjCblPP1DpcquF+8HVd4Dr4P6Q9hNAcK2yBA4wT3LDXVQADcWm7jRHhKdVYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=ioBI5Cq3; arc=pass smtp.client-ip=136.143.184.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="ioBI5Cq3"
ARC-Seal: i=1; a=rsa-sha256; t=1747256324; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CejelUjwBOWrj5J7WRVr+Rw1bZID2oVz5jwWEyyTiTRY5xbOgQ5dMK924Tf5AJ+ofBoNkpurXIZ1Vl78IIfzxFLHm7IU8bnCTzM2f6ihZL4dqDrcwy+Adx3l66Cscz1Lt4VDWFWa77SYBl6tvwywpmYYjbzywAw3EW2ebX+ReFs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747256324; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PhMm3nXqJj2Lfie12YHpTC1K87GpptmtSTo7AX4h2LI=; 
	b=Z80QQVmUKhXyUpVkmGoDGQdHE8ERRmIAlRiUPvSjGk7vNQISCjOI0gANGfBUTO12WnTBnFWsseWXznVB0gHiYR0EyA1xE+TQkM5b0n+txKgJJe7qpl3wqGcs6wgmqRKpXCWDkN73sznpc29IfkS5mbs4lX4qNP81LprLRiVZv6c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747256324;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=PhMm3nXqJj2Lfie12YHpTC1K87GpptmtSTo7AX4h2LI=;
	b=ioBI5Cq3wkZEEZlSBhoXL1rYBqE4fM4SZgVgGOfVNw+y8FsrLFrgs8uVj84HAyhl
	jDmRQkWZhRqrbQWCtDLZlQgflOQN7nAPfu+fyXpHYTV9WQEPSmdYEQp5xHdWBtQmny/
	BXF4IwxmnRrm48rzaI3JbgONImeiXMW4IS4Ie5n8=
Received: by mx.zohomail.com with SMTPS id 1747256322049695.1860421633909;
	Wed, 14 May 2025 13:58:42 -0700 (PDT)
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
In-Reply-To: <D9W5IX9Z7QMU.3DL48O2KYTN1Z@kernel.org>
Date: Wed, 14 May 2025 17:58:25 -0300
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <497D0D1E-B607-4822-A083-C0C5B9DB3C57@collabora.com>
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
 <D9W5IX9Z7QMU.3DL48O2KYTN1Z@kernel.org>
To: Benno Lossin <lossin@kernel.org>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-ZohoMailClient: External

Hi Benno, I really appreciate you taking the time to review my patches.


> On 14 May 2025, at 17:04, Benno Lossin <lossin@kernel.org> wrote:
>=20
> On Wed May 14, 2025 at 9:20 PM CEST, Daniel Almeida wrote:
>> Add support for registering IRQ handlers in Rust.
>>=20
>> IRQ handlers are extensively used in drivers when some peripheral =
wants
>> to obtain the CPU attention. Registering a handler will make the =
system
>> invoke the passed-in function whenever the chosen IRQ line is =
triggered.
>>=20
>> Both regular and threaded IRQ handlers are supported through a =
Handler
>> (or ThreadedHandler) trait that is meant to be implemented by a type
>> that:
>>=20
>> a) provides a function to be run by the system when the IRQ fires =
and,
>>=20
>> b) holds the shared data (i.e.: `T`) between process and IRQ =
contexts.
>>=20
>> The requirement that T is Sync derives from the fact that handlers =
might
>> run concurrently with other processes executing the same driver,
>> creating the potential for data races.
>>=20
>> Ideally, some interior mutability must be in place if T is to be
>> mutated. This should usually be done through the in-flight =
SpinLockIrq
>> type.
>>=20
>> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>> ---
>> rust/bindings/bindings_helper.h |   1 +
>> rust/helpers/helpers.c          |   1 +
>> rust/helpers/irq.c              |   9 +
>> rust/kernel/irq.rs              |  24 +++
>> rust/kernel/irq/flags.rs        | 102 +++++++++
>> rust/kernel/irq/request.rs      | 455 =
++++++++++++++++++++++++++++++++++++++++
>> rust/kernel/lib.rs              |   1 +
>> 7 files changed, 593 insertions(+)
>=20
> Could you split this patch into smaller chunks?

How? This patch does one thing: it adds request_irq functionality.

>=20
>> +pub use request::Handler;
>> +pub use request::IrqReturn;
>> +pub use request::Registration;
>> +pub use request::ThreadedHandler;
>> +pub use request::ThreadedIrqReturn;
>> +pub use request::ThreadedRegistration;
>=20
> Why not?:
>=20
>    pub use request::{Handler, ..., ThreadedRegistration};

I dislike this notation. It is just a magnet for conflicts.

>=20
>> diff --git a/rust/kernel/irq/flags.rs b/rust/kernel/irq/flags.rs
>> new file mode 100644
>> index =
0000000000000000000000000000000000000000..3cfaef65ae14f6c02f55ebcf4d52450c=
0052df30
>> --- /dev/null
>> +++ b/rust/kernel/irq/flags.rs
>> @@ -0,0 +1,102 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// SPDX-FileCopyrightText: Copyright 2025 Collabora ltd.
>> +
>> +use crate::bindings;
>> +
>> +/// Flags to be used when registering IRQ handlers.
>> +///
>> +/// They can be combined with the operators `|`, `&`, and `!`.
>> +#[derive(Clone, Copy, PartialEq, Eq)]
>> +pub struct Flags(u64);
>=20
> The constants below seem to all be 32 bit, why did you choose u64?

The C code takes in ffi::c_ulong. Shouldn=E2=80=99t this map to u64? Or =
maybe usize.

>=20
>> +
>> +impl Flags {
>> +    pub(crate) fn into_inner(self) -> u64 {
>> +        self.0
>> +    }
>> +}
>> +pub const NO_DEBUG: Flags =3D Flags(bindings::IRQF_NO_DEBUG as u64);
>=20
>> diff --git a/rust/kernel/irq/request.rs b/rust/kernel/irq/request.rs
>> new file mode 100644
>> index =
0000000000000000000000000000000000000000..55f0ea8f9a93dc9ada67ce91af686a96=
34c8e8ed
>> --- /dev/null
>> +++ b/rust/kernel/irq/request.rs
>> @@ -0,0 +1,455 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// SPDX-FileCopyrightText: Copyright 2025 Collabora ltd.
>> +
>> +//! IRQ allocation and handling
>=20
> Missing `.`.
>=20
>> +
>> +use core::marker::PhantomPinned;
>> +use core::ptr::addr_of_mut;
>> +
>> +use pin_init::pin_init_from_closure;
>> +
>> +use crate::alloc::Allocator;
>> +use crate::error::to_result;
>> +use crate::irq::flags::Flags;
>> +use crate::prelude::*;
>> +use crate::str::CStr;
>> +use crate::sync::Arc;
>> +
>> +/// The value that can be returned from an IrqHandler or a =
ThreadedIrqHandler.
>> +#[repr(u32)]
>=20
> I think we should let the compiler decide the layout & discriminants, =
it
> might do something smarter when returning this value together with
> others. Then we just need this function:
>=20
>    fn into_inner(self) -> u32 {
>        match self {
>            Self::None =3D> bindings::irqreturn_IRQ_NONE,
>            Self::Handled =3D> bindings::irqreturn_IRQ_HANDLED,
>        }
>    }

Right

>=20
>> +pub enum IrqReturn {
>> +    /// The interrupt was not from this device or was not handled.
>> +    None =3D bindings::irqreturn_IRQ_NONE,
>> +
>> +    /// The interrupt was handled by this device.
>> +    Handled =3D bindings::irqreturn_IRQ_HANDLED,
>> +}
>> +
>> +/// Callbacks for an IRQ handler.
>> +pub trait Handler: Sync {
>> +    /// The actual handler function. As usual, sleeps are not =
allowed in IRQ
>> +    /// context.
>> +    fn handle_irq(&self) -> IrqReturn;
>> +}
>> +
>> +impl<T: ?Sized + Handler + Send> Handler for Arc<T> {
>> +    fn handle_irq(&self) -> IrqReturn {
>> +        T::handle_irq(self)
>> +    }
>> +}
>> +
>> +impl<T: ?Sized + Handler, A: Allocator> Handler for Box<T, A> {
>> +    fn handle_irq(&self) -> IrqReturn {
>> +        T::handle_irq(self)
>> +    }
>> +}
>> +
>> +/// A registration of an IRQ handler for a given IRQ line.
>> +///
>> +/// # Examples
>> +///
>> +/// The following is an example of using `Registration`. It uses a
>> +/// [`SpinLock`](crate::sync::SpinLockIrq) to provide the interior =
mutability.
>> +/// Note that Spinlocks are not safe to use in IRQ context as of =
now, but may be
>> +/// in the future.
>=20
> Didn't your commit message mention SpinLockIrq?

This is not upstream yet. I removed all mentions of SpinLockIrq on
purpose, but I apparently missed some as you say.

We definitely need interrupt-aware spinlocks to access the data in =
interrupt
context. It is just a matter of deciding whether we will be referring to =
a type
whose API is not 100% formalized as we speak, or to SpinLock itself - =
which is
already upstream - with a caveat. I chose the latter.


>=20
>> +///
>> +/// ```
>> +/// use kernel::prelude::*;
>> +/// use kernel::irq::flags;
>> +/// use kernel::irq::Registration;
>> +/// use kernel::irq::IrqReturn;
>> +/// use kernel::sync::Arc;
>> +/// use kernel::sync::SpinLock;
>> +/// use kernel::c_str;
>> +/// use kernel::alloc::flags::GFP_KERNEL;
>> +///
>> +/// // Declare a struct that will be passed in when the interrupt =
fires. The u32
>> +/// // merely serves as an example of some internal data.
>> +/// struct Data(SpinLock<u32>);
>> +///
>> +/// // [`handle_irq`] takes &self. This example illustrates interior
>> +/// // mutability can be used when share the data between process =
context and IRQ
>> +/// // context.
>> +///
>> +/// type Handler =3D Data;
>> +///
>> +/// impl kernel::irq::request::Handler for Handler {
>> +///     // This is executing in IRQ context in some CPU. Other CPUs =
can still
>> +///     // try to access to data.
>> +///     fn handle_irq(&self) -> IrqReturn {
>> +///         // We now have exclusive access to the data by locking =
the
>> +///         // SpinLock.
>> +///         let mut data =3D self.0.lock();
>> +///         *data +=3D 1;
>> +///
>> +///         IrqReturn::Handled
>> +///     }
>> +/// }
>> +///
>> +/// // This is running in process context.
>> +/// fn register_irq(irq: u32, handler: Handler) -> =
Result<Arc<Registration<Handler>>> {
>> +///     let registration =3D Registration::register(irq, =
flags::SHARED, c_str!("my-device"), handler);
>> +///
>> +///     // You can have as many references to the registration as =
you want, so
>> +///     // multiple parts of the driver can access it.
>> +///     let registration =3D Arc::pin_init(registration, =
GFP_KERNEL)?;
>> +///
>> +///     // The handler may be called immediately after the function =
above
>> +///     // returns, possibly in a different CPU.
>> +///
>> +///     {
>> +///         // The data can be accessed from the process context =
too.
>> +///         let mut data =3D registration.handler().0.lock();
>> +///         *data =3D 42;
>> +///     }
>> +///
>> +///     Ok(registration)
>> +/// }
>> +///
>> +/// # Ok::<(), Error>(())
>> +///```
>> +///
>> +/// # Invariants
>> +///
>> +/// * We own an irq handler using `&self` as its private data.
>> +///
>> +#[pin_data(PinnedDrop)]
>> +pub struct Registration<T: Handler> {
>> +    irq: u32,
>> +    #[pin]
>> +    handler: T,
>> +    #[pin]
>> +    /// Pinned because we need address stability so that we can pass =
a pointer
>> +    /// to the callback.
>> +    _pin: PhantomPinned,
>> +}
>> +
>> +impl<T: Handler> Registration<T> {
>> +    /// Registers the IRQ handler with the system for the given IRQ =
number. The
>> +    /// handler must be able to be called as soon as this function =
returns.
>=20
> The first line of documentation should be a single sentence =
description
> of what the item does. It will get rendered next to it on the summary =
&
> search pages.

Right, I actually rendered the docs before submitting, but apparently I =
missed this.

>=20
> What is meant by the second sentence? What about this phrasing?: "The
> handler might be called immediately after this function returns.".

It's a reminder, inherited from the C side, that literally as soon as
request_irq() returns, your handler may be called. Anything that you =
need to
setup before your handler can run must already have been done by this =
point.

Is this the =E2=80=9Csecond sentence=E2=80=9D you are referring to?

>=20
>> +    pub fn register(
>> +        irq: u32,
>> +        flags: Flags,
>> +        name: &'static CStr,
>> +        handler: T,
>> +    ) -> impl PinInit<Self, Error> {
>> +        let closure =3D move |slot: *mut Self| {
>> +            // SAFETY: The slot passed to pin initializer is valid =
for writing.
>> +            unsafe {
>> +                slot.write(Self {
>> +                    irq,
>> +                    handler,
>> +                    _pin: PhantomPinned,
>> +                })
>> +            };
>> +
>> +            // SAFETY:
>> +            // - The callbacks are valid for use with request_irq.
>> +            // - If this succeeds, the slot is guaranteed to be =
valid until the
>> +            // destructor of Self runs, which will deregister the =
callbacks
>> +            // before the memory location becomes invalid.
>> +            let res =3D to_result(unsafe {
>> +                bindings::request_irq(
>> +                    irq,
>> +                    Some(handle_irq_callback::<T>),
>> +                    flags.into_inner() as usize,
>> +                    name.as_char_ptr(),
>> +                    &*slot as *const _ as *mut core::ffi::c_void,
>=20
> Please don't use `as` casts when possible, instead use `.cast()` on
> pointers.

Ack

>=20
>> +                )
>> +            });
>> +
>> +            if res.is_err() {
>> +                // SAFETY: We are returning an error, so we can =
destroy the slot.
>> +                unsafe { =
core::ptr::drop_in_place(addr_of_mut!((*slot).handler)) };
>> +            }
>> +
>> +            res
>> +        };
>> +
>> +        // SAFETY:
>> +        // - if this returns Ok, then every field of `slot` is fully
>> +        // initialized.
>> +        // - if this returns an error, then the slot does not need =
to remain
>> +        // valid.
>> +        unsafe { pin_init_from_closure(closure) }
>=20
> Please don't use `pin_init_from_closure`, instead do this:
>=20
>    pin_init!(Self {
>        irq,
>        handler,
>        _pin: PhantomPinned
>    })
>    .pin_chain(|this| {
>        // SAFETY: TODO: correct FFI safety requirements
>        to_result(unsafe {
>            bindings::request_irq(...)
>        })
>    })
>=20
> The `pin_chain` function is exactly for this use-case, doing some
> operation that might fail after initializing & it will drop the value
> when the closure fails.

Ack

>=20
>> +    }
>> +
>> +    /// Returns a reference to the handler that was registered with =
the system.
>> +    pub fn handler(&self) -> &T {
>> +        &self.handler
>> +    }
>> +}
>> +
>> +#[pinned_drop]
>> +impl<T: Handler> PinnedDrop for Registration<T> {
>> +    fn drop(self: Pin<&mut Self>) {
>> +        // SAFETY:
>> +        // - `self.irq` is the same as the one passed to =
`reques_irq`.
>> +        // -  `&self` was passed to `request_irq` as the cookie. It =
is
>> +        // guaranteed to be unique by the type system, since each =
call to
>> +        // `register` will return a different instance of =
`Registration`.
>=20
> This is missing important information: `self` is `!Unpin` **and** was
> initializing using pin-init, so it occupied the same memory location =
for
> the entirety of its lifetime.
>=20

Ack

>> +        //
>> +        // Notice that this will block until all handlers finish =
executing,
>> +        // i.e.: at no point will &self be invalid while the handler =
is running.
>=20
> This is good to know!
>=20
>> +        unsafe { bindings::free_irq(self.irq, &*self as *const Self =
as *mut core::ffi::c_void) };
>> +    }
>> +}
>> +
>> +/// The value that can be returned from =
`ThreadedHandler::handle_irq`.
>> +#[repr(u32)]
>> +pub enum ThreadedIrqReturn {
>> +    /// The interrupt was not from this device or was not handled.
>> +    None =3D bindings::irqreturn_IRQ_NONE,
>> +
>> +    /// The interrupt was handled by this device.
>> +    Handled =3D bindings::irqreturn_IRQ_HANDLED,
>> +
>> +    /// The handler wants the handler thread to wake up.
>=20
> How about "The handler wants the handler thread to take care of the
> interrupt." or is that incorrect?

This is taken straight from the C docs. As I told Andreas, I=E2=80=99d =
prefer if we
didn=E2=80=99t add our own docs for C things that have their own docs =
already.

>=20
>> +    WakeThread =3D bindings::irqreturn_IRQ_WAKE_THREAD,
>> +}
>> +
>> +/// Callbacks for a threaded IRQ handler.
>=20
> What is the difference to a normal one?
>=20
>> +pub trait ThreadedHandler: Sync {
>> +    /// The actual handler function. As usual, sleeps are not =
allowed in IRQ
>> +    /// context.
>> +    fn handle_irq(&self) -> ThreadedIrqReturn;
>=20
> Why does this `handle_irq` function return a `ThreadedIrqReturn`...
>=20
>> +
>> +    /// The threaded handler function. This function is called from =
the irq
>> +    /// handler thread, which is automatically created by the =
system.
>> +    fn thread_fn(&self) -> IrqReturn;
>=20
> ... and this `thread_fn` an `IrqReturn`? I would have expected it to =
be
> the other way around.
>=20
>> +}
>> +
>> +impl<T: ?Sized + ThreadedHandler + Send> ThreadedHandler for Arc<T> =
{
>> +    fn handle_irq(&self) -> ThreadedIrqReturn {
>> +        T::handle_irq(self)
>> +    }
>> +
>> +    fn thread_fn(&self) -> IrqReturn {
>> +        T::thread_fn(self)
>> +    }
>> +}
>> +
>> +impl<T: ?Sized + ThreadedHandler, A: Allocator> ThreadedHandler for =
Box<T, A> {
>> +    fn handle_irq(&self) -> ThreadedIrqReturn {
>> +        T::handle_irq(self)
>> +    }
>> +
>> +    fn thread_fn(&self) -> IrqReturn {
>> +        T::thread_fn(self)
>> +    }
>> +}
>> +
>> +/// A registration of a threaded IRQ handler for a given IRQ line.
>> +///
>> +/// Two callbacks are required: one to handle the IRQ, and one to =
handle any
>> +/// other work in a separate thread.
>> +///
>> +/// The thread handler is only called if the IRQ handler returns =
`WakeThread`.
>=20
> Ah this is some information that should be on `ThreadedHandler`. (it
> also explains the difference in return types above)

Ack

>=20
>> +///
>> +/// # Examples
>> +///
>> +/// The following is an example of using `ThreadedRegistration`. It =
uses a
>> +/// [`SpinLock`](crate::sync::SpinLockIrq) to provide the interior =
mutability.
>> +/// Note that Spinlocks are not safe to use in IRQ context as of =
now, but may be
>> +/// in the future.
>> +///
>> +/// ```
>> +/// use kernel::prelude::*;
>> +/// use kernel::irq::flags;
>> +/// use kernel::irq::ThreadedIrqReturn;
>> +/// use kernel::irq::ThreadedRegistration;
>> +/// use kernel::irq::IrqReturn;
>> +/// use kernel::sync::Arc;
>> +/// use kernel::sync::SpinLock;
>> +/// use kernel::alloc::flags::GFP_KERNEL;
>> +/// use kernel::c_str;
>> +///
>> +/// // Declare a struct that will be passed in when the interrupt =
fires. The u32
>> +/// // merely serves as an example of some internal data.
>> +/// struct Data(SpinLock<u32>);
>> +///
>> +/// // [`handle_irq`] takes &self. This example illustrates interior
>> +/// // mutability can be used when share the data between process =
context and IRQ
>> +/// // context.
>> +///
>> +/// type Handler =3D Data;
>> +///
>> +/// impl kernel::irq::request::ThreadedHandler for Handler {
>> +///     // This is executing in IRQ context in some CPU. Other CPUs =
can still
>> +///     // try to access to data.
>> +///     fn handle_irq(&self) -> ThreadedIrqReturn {
>> +///         // We now have exclusive access to the data by locking =
the
>> +///         // SpinLockIrq.
>> +///         let mut data =3D self.0.lock();
>> +///         *data +=3D 1;
>> +///
>> +///         // By returning `WakeThread`, we indicate to the system =
that the
>> +///         // thread function should be called. Otherwise, return
>> +///         // ThreadedIrqReturn::Handled.
>> +///         ThreadedIrqReturn::WakeThread
>> +///     }
>> +///
>> +///     // This will run (in a separate kthread) if and only if =
`handle_irq`
>> +///     // returns `WakeThread`.
>> +///     fn thread_fn(&self) -> IrqReturn {
>> +///         // We now have exclusive access to the data by locking =
the SpinLock.
>> +///         //
>> +///         // Ideally, we should disable interrupts while we are =
doing this to
>> +///         // avoid deadlocks, but this is not currently possible.
>=20
> Would this be solved by SpinLockIrq?


Yes, that is the point of SpinLockIrq. The exact syntax is still up for =
debate,
although by this time I think Lyude & Boqun have already settled on =
something.


>=20
> ---
> Cheers,
> Benno
>=20
>> +///         let mut data =3D self.0.lock();
>> +///         *data +=3D 1;
>> +///
>> +///         IrqReturn::Handled
>> +///     }
>> +/// }

=E2=80=94 Daniel


