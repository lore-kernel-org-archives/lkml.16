Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BA8C120;
	Wed, 14 May 2025 20:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253088; cv=none; b=FNEHJSFMGHLW3iwjzhMvAV7Xmsh6GkBecQ1Vn+BGX8sn9IaZQkTu+vu+JIQPMMCheErZWFgoQblwFmd5bPnnfhUtXkL7BKKmcEDfNslbtwcr24uGQtBNBWMTuMDhd/sEecOK9gZKzrCXzpq+fJWV4XWDGJph/La885T2T8G971c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253088; c=relaxed/simple;
	bh=246Are/mRoUxNFRbYb0hiCd2/mp652DLO+8XgKyNyZg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=P1RWdPHLhCu0ImCJavSQF3y+q8z76Frw7rawtAK9XnysOqJ9EnwtOJ0RXIMNbqpfNuDzzG3/aJ+BFMspmPdGh99QdKBcXmfMmL2vOgaFtE2aIG7E6qqnsfBpb348kx2qkaiaaQktgjBmR9NDYGI5uYPvWHOqJ32nqjZwWclHqjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QHrqa1hk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QHrqa1hk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49D1C4CEE3;
	Wed, 14 May 2025 20:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747253088;
	bh=246Are/mRoUxNFRbYb0hiCd2/mp652DLO+8XgKyNyZg=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=QHrqa1hkyHdg5BQE9zJg5hzT2huZEvl5JaJtXhsr889AcpaEv2wC7jrb/sxRjqx9y
	 FckrvB5zc33/cDOKCa9Eq2pl/iqvof72JyvIZor4Kd/yVEpjsXoz1uAQ8iUxz23/EQ
	 gXwPngA4VgBzAYd3CnFBaYFk3zIESznnjPTyg/YgeG6G07KeA31JIsREGH9f8XS0ay
	 AmO7gImif1KXRac1MpmGfAM73+1jxtp9GhkOY2nv1Aun/Jn+M5l52sYXbcYQOEk8Fu
	 9+PQYraZJsZwmi3ZMMT1GTA33MgUXQCeMnM1fb8qyfCclhDjeaPl4kOU6HoOStgo3u
	 TKyO14MBSHpWA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 May 2025 22:04:43 +0200
Message-Id: <D9W5IX9Z7QMU.3DL48O2KYTN1Z@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
From: "Benno Lossin" <lossin@kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>
X-Mailer: aerc 0.20.1
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com> <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
In-Reply-To: <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>

On Wed May 14, 2025 at 9:20 PM CEST, Daniel Almeida wrote:
> Add support for registering IRQ handlers in Rust.
>
> IRQ handlers are extensively used in drivers when some peripheral wants
> to obtain the CPU attention. Registering a handler will make the system
> invoke the passed-in function whenever the chosen IRQ line is triggered.
>
> Both regular and threaded IRQ handlers are supported through a Handler
> (or ThreadedHandler) trait that is meant to be implemented by a type
> that:
>
> a) provides a function to be run by the system when the IRQ fires and,
>
> b) holds the shared data (i.e.: `T`) between process and IRQ contexts.
>
> The requirement that T is Sync derives from the fact that handlers might
> run concurrently with other processes executing the same driver,
> creating the potential for data races.
>
> Ideally, some interior mutability must be in place if T is to be
> mutated. This should usually be done through the in-flight SpinLockIrq
> type.
>
> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  rust/bindings/bindings_helper.h |   1 +
>  rust/helpers/helpers.c          |   1 +
>  rust/helpers/irq.c              |   9 +
>  rust/kernel/irq.rs              |  24 +++
>  rust/kernel/irq/flags.rs        | 102 +++++++++
>  rust/kernel/irq/request.rs      | 455 ++++++++++++++++++++++++++++++++++=
++++++
>  rust/kernel/lib.rs              |   1 +
>  7 files changed, 593 insertions(+)

Could you split this patch into smaller chunks?

> +pub use request::Handler;
> +pub use request::IrqReturn;
> +pub use request::Registration;
> +pub use request::ThreadedHandler;
> +pub use request::ThreadedIrqReturn;
> +pub use request::ThreadedRegistration;

Why not?:

    pub use request::{Handler, ..., ThreadedRegistration};

> diff --git a/rust/kernel/irq/flags.rs b/rust/kernel/irq/flags.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..3cfaef65ae14f6c02f55ebcf4=
d52450c0052df30
> --- /dev/null
> +++ b/rust/kernel/irq/flags.rs
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: Copyright 2025 Collabora ltd.
> +
> +use crate::bindings;
> +
> +/// Flags to be used when registering IRQ handlers.
> +///
> +/// They can be combined with the operators `|`, `&`, and `!`.
> +#[derive(Clone, Copy, PartialEq, Eq)]
> +pub struct Flags(u64);

The constants below seem to all be 32 bit, why did you choose u64?

> +
> +impl Flags {
> +    pub(crate) fn into_inner(self) -> u64 {
> +        self.0
> +    }
> +}
> +pub const NO_DEBUG: Flags =3D Flags(bindings::IRQF_NO_DEBUG as u64);

> diff --git a/rust/kernel/irq/request.rs b/rust/kernel/irq/request.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..55f0ea8f9a93dc9ada67ce91a=
f686a9634c8e8ed
> --- /dev/null
> +++ b/rust/kernel/irq/request.rs
> @@ -0,0 +1,455 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: Copyright 2025 Collabora ltd.
> +
> +//! IRQ allocation and handling

Missing `.`.

> +
> +use core::marker::PhantomPinned;
> +use core::ptr::addr_of_mut;
> +
> +use pin_init::pin_init_from_closure;
> +
> +use crate::alloc::Allocator;
> +use crate::error::to_result;
> +use crate::irq::flags::Flags;
> +use crate::prelude::*;
> +use crate::str::CStr;
> +use crate::sync::Arc;
> +
> +/// The value that can be returned from an IrqHandler or a ThreadedIrqHa=
ndler.
> +#[repr(u32)]

I think we should let the compiler decide the layout & discriminants, it
might do something smarter when returning this value together with
others. Then we just need this function:

    fn into_inner(self) -> u32 {
        match self {
            Self::None =3D> bindings::irqreturn_IRQ_NONE,
            Self::Handled =3D> bindings::irqreturn_IRQ_HANDLED,
        }
    }

> +pub enum IrqReturn {
> +    /// The interrupt was not from this device or was not handled.
> +    None =3D bindings::irqreturn_IRQ_NONE,
> +
> +    /// The interrupt was handled by this device.
> +    Handled =3D bindings::irqreturn_IRQ_HANDLED,
> +}
> +
> +/// Callbacks for an IRQ handler.
> +pub trait Handler: Sync {
> +    /// The actual handler function. As usual, sleeps are not allowed in=
 IRQ
> +    /// context.
> +    fn handle_irq(&self) -> IrqReturn;
> +}
> +
> +impl<T: ?Sized + Handler + Send> Handler for Arc<T> {
> +    fn handle_irq(&self) -> IrqReturn {
> +        T::handle_irq(self)
> +    }
> +}
> +
> +impl<T: ?Sized + Handler, A: Allocator> Handler for Box<T, A> {
> +    fn handle_irq(&self) -> IrqReturn {
> +        T::handle_irq(self)
> +    }
> +}
> +
> +/// A registration of an IRQ handler for a given IRQ line.
> +///
> +/// # Examples
> +///
> +/// The following is an example of using `Registration`. It uses a
> +/// [`SpinLock`](crate::sync::SpinLockIrq) to provide the interior mutab=
ility.
> +/// Note that Spinlocks are not safe to use in IRQ context as of now, bu=
t may be
> +/// in the future.

Didn't your commit message mention SpinLockIrq?

> +///
> +/// ```
> +/// use kernel::prelude::*;
> +/// use kernel::irq::flags;
> +/// use kernel::irq::Registration;
> +/// use kernel::irq::IrqReturn;
> +/// use kernel::sync::Arc;
> +/// use kernel::sync::SpinLock;
> +/// use kernel::c_str;
> +/// use kernel::alloc::flags::GFP_KERNEL;
> +///
> +/// // Declare a struct that will be passed in when the interrupt fires.=
 The u32
> +/// // merely serves as an example of some internal data.
> +/// struct Data(SpinLock<u32>);
> +///
> +/// // [`handle_irq`] takes &self. This example illustrates interior
> +/// // mutability can be used when share the data between process contex=
t and IRQ
> +/// // context.
> +///
> +/// type Handler =3D Data;
> +///
> +/// impl kernel::irq::request::Handler for Handler {
> +///     // This is executing in IRQ context in some CPU. Other CPUs can =
still
> +///     // try to access to data.
> +///     fn handle_irq(&self) -> IrqReturn {
> +///         // We now have exclusive access to the data by locking the
> +///         // SpinLock.
> +///         let mut data =3D self.0.lock();
> +///         *data +=3D 1;
> +///
> +///         IrqReturn::Handled
> +///     }
> +/// }
> +///
> +/// // This is running in process context.
> +/// fn register_irq(irq: u32, handler: Handler) -> Result<Arc<Registrati=
on<Handler>>> {
> +///     let registration =3D Registration::register(irq, flags::SHARED, =
c_str!("my-device"), handler);
> +///
> +///     // You can have as many references to the registration as you wa=
nt, so
> +///     // multiple parts of the driver can access it.
> +///     let registration =3D Arc::pin_init(registration, GFP_KERNEL)?;
> +///
> +///     // The handler may be called immediately after the function abov=
e
> +///     // returns, possibly in a different CPU.
> +///
> +///     {
> +///         // The data can be accessed from the process context too.
> +///         let mut data =3D registration.handler().0.lock();
> +///         *data =3D 42;
> +///     }
> +///
> +///     Ok(registration)
> +/// }
> +///
> +/// # Ok::<(), Error>(())
> +///```
> +///
> +/// # Invariants
> +///
> +/// * We own an irq handler using `&self` as its private data.
> +///
> +#[pin_data(PinnedDrop)]
> +pub struct Registration<T: Handler> {
> +    irq: u32,
> +    #[pin]
> +    handler: T,
> +    #[pin]
> +    /// Pinned because we need address stability so that we can pass a p=
ointer
> +    /// to the callback.
> +    _pin: PhantomPinned,
> +}
> +
> +impl<T: Handler> Registration<T> {
> +    /// Registers the IRQ handler with the system for the given IRQ numb=
er. The
> +    /// handler must be able to be called as soon as this function retur=
ns.

The first line of documentation should be a single sentence description
of what the item does. It will get rendered next to it on the summary &
search pages.

What is meant by the second sentence? What about this phrasing?: "The
handler might be called immediately after this function returns.".

> +    pub fn register(
> +        irq: u32,
> +        flags: Flags,
> +        name: &'static CStr,
> +        handler: T,
> +    ) -> impl PinInit<Self, Error> {
> +        let closure =3D move |slot: *mut Self| {
> +            // SAFETY: The slot passed to pin initializer is valid for w=
riting.
> +            unsafe {
> +                slot.write(Self {
> +                    irq,
> +                    handler,
> +                    _pin: PhantomPinned,
> +                })
> +            };
> +
> +            // SAFETY:
> +            // - The callbacks are valid for use with request_irq.
> +            // - If this succeeds, the slot is guaranteed to be valid un=
til the
> +            // destructor of Self runs, which will deregister the callba=
cks
> +            // before the memory location becomes invalid.
> +            let res =3D to_result(unsafe {
> +                bindings::request_irq(
> +                    irq,
> +                    Some(handle_irq_callback::<T>),
> +                    flags.into_inner() as usize,
> +                    name.as_char_ptr(),
> +                    &*slot as *const _ as *mut core::ffi::c_void,

Please don't use `as` casts when possible, instead use `.cast()` on
pointers.

> +                )
> +            });
> +
> +            if res.is_err() {
> +                // SAFETY: We are returning an error, so we can destroy =
the slot.
> +                unsafe { core::ptr::drop_in_place(addr_of_mut!((*slot).h=
andler)) };
> +            }
> +
> +            res
> +        };
> +
> +        // SAFETY:
> +        // - if this returns Ok, then every field of `slot` is fully
> +        // initialized.
> +        // - if this returns an error, then the slot does not need to re=
main
> +        // valid.
> +        unsafe { pin_init_from_closure(closure) }

Please don't use `pin_init_from_closure`, instead do this:

    pin_init!(Self {
        irq,
        handler,
        _pin: PhantomPinned
    })
    .pin_chain(|this| {
        // SAFETY: TODO: correct FFI safety requirements
        to_result(unsafe {
            bindings::request_irq(...)
        })
    })

The `pin_chain` function is exactly for this use-case, doing some
operation that might fail after initializing & it will drop the value
when the closure fails.

> +    }
> +
> +    /// Returns a reference to the handler that was registered with the =
system.
> +    pub fn handler(&self) -> &T {
> +        &self.handler
> +    }
> +}
> +
> +#[pinned_drop]
> +impl<T: Handler> PinnedDrop for Registration<T> {
> +    fn drop(self: Pin<&mut Self>) {
> +        // SAFETY:
> +        // - `self.irq` is the same as the one passed to `reques_irq`.
> +        // -  `&self` was passed to `request_irq` as the cookie. It is
> +        // guaranteed to be unique by the type system, since each call t=
o
> +        // `register` will return a different instance of `Registration`=
.

This is missing important information: `self` is `!Unpin` **and** was
initializing using pin-init, so it occupied the same memory location for
the entirety of its lifetime.

> +        //
> +        // Notice that this will block until all handlers finish executi=
ng,
> +        // i.e.: at no point will &self be invalid while the handler is =
running.

This is good to know!

> +        unsafe { bindings::free_irq(self.irq, &*self as *const Self as *=
mut core::ffi::c_void) };
> +    }
> +}
> +
> +/// The value that can be returned from `ThreadedHandler::handle_irq`.
> +#[repr(u32)]
> +pub enum ThreadedIrqReturn {
> +    /// The interrupt was not from this device or was not handled.
> +    None =3D bindings::irqreturn_IRQ_NONE,
> +
> +    /// The interrupt was handled by this device.
> +    Handled =3D bindings::irqreturn_IRQ_HANDLED,
> +
> +    /// The handler wants the handler thread to wake up.

How about "The handler wants the handler thread to take care of the
interrupt." or is that incorrect?

> +    WakeThread =3D bindings::irqreturn_IRQ_WAKE_THREAD,
> +}
> +
> +/// Callbacks for a threaded IRQ handler.

What is the difference to a normal one?

> +pub trait ThreadedHandler: Sync {
> +    /// The actual handler function. As usual, sleeps are not allowed in=
 IRQ
> +    /// context.
> +    fn handle_irq(&self) -> ThreadedIrqReturn;

Why does this `handle_irq` function return a `ThreadedIrqReturn`...

> +
> +    /// The threaded handler function. This function is called from the =
irq
> +    /// handler thread, which is automatically created by the system.
> +    fn thread_fn(&self) -> IrqReturn;

... and this `thread_fn` an `IrqReturn`? I would have expected it to be
the other way around.

> +}
> +
> +impl<T: ?Sized + ThreadedHandler + Send> ThreadedHandler for Arc<T> {
> +    fn handle_irq(&self) -> ThreadedIrqReturn {
> +        T::handle_irq(self)
> +    }
> +
> +    fn thread_fn(&self) -> IrqReturn {
> +        T::thread_fn(self)
> +    }
> +}
> +
> +impl<T: ?Sized + ThreadedHandler, A: Allocator> ThreadedHandler for Box<=
T, A> {
> +    fn handle_irq(&self) -> ThreadedIrqReturn {
> +        T::handle_irq(self)
> +    }
> +
> +    fn thread_fn(&self) -> IrqReturn {
> +        T::thread_fn(self)
> +    }
> +}
> +
> +/// A registration of a threaded IRQ handler for a given IRQ line.
> +///
> +/// Two callbacks are required: one to handle the IRQ, and one to handle=
 any
> +/// other work in a separate thread.
> +///
> +/// The thread handler is only called if the IRQ handler returns `WakeTh=
read`.

Ah this is some information that should be on `ThreadedHandler`. (it
also explains the difference in return types above)

> +///
> +/// # Examples
> +///
> +/// The following is an example of using `ThreadedRegistration`. It uses=
 a
> +/// [`SpinLock`](crate::sync::SpinLockIrq) to provide the interior mutab=
ility.
> +/// Note that Spinlocks are not safe to use in IRQ context as of now, bu=
t may be
> +/// in the future.
> +///
> +/// ```
> +/// use kernel::prelude::*;
> +/// use kernel::irq::flags;
> +/// use kernel::irq::ThreadedIrqReturn;
> +/// use kernel::irq::ThreadedRegistration;
> +/// use kernel::irq::IrqReturn;
> +/// use kernel::sync::Arc;
> +/// use kernel::sync::SpinLock;
> +/// use kernel::alloc::flags::GFP_KERNEL;
> +/// use kernel::c_str;
> +///
> +/// // Declare a struct that will be passed in when the interrupt fires.=
 The u32
> +/// // merely serves as an example of some internal data.
> +/// struct Data(SpinLock<u32>);
> +///
> +/// // [`handle_irq`] takes &self. This example illustrates interior
> +/// // mutability can be used when share the data between process contex=
t and IRQ
> +/// // context.
> +///
> +/// type Handler =3D Data;
> +///
> +/// impl kernel::irq::request::ThreadedHandler for Handler {
> +///     // This is executing in IRQ context in some CPU. Other CPUs can =
still
> +///     // try to access to data.
> +///     fn handle_irq(&self) -> ThreadedIrqReturn {
> +///         // We now have exclusive access to the data by locking the
> +///         // SpinLockIrq.
> +///         let mut data =3D self.0.lock();
> +///         *data +=3D 1;
> +///
> +///         // By returning `WakeThread`, we indicate to the system that=
 the
> +///         // thread function should be called. Otherwise, return
> +///         // ThreadedIrqReturn::Handled.
> +///         ThreadedIrqReturn::WakeThread
> +///     }
> +///
> +///     // This will run (in a separate kthread) if and only if `handle_=
irq`
> +///     // returns `WakeThread`.
> +///     fn thread_fn(&self) -> IrqReturn {
> +///         // We now have exclusive access to the data by locking the S=
pinLock.
> +///         //
> +///         // Ideally, we should disable interrupts while we are doing =
this to
> +///         // avoid deadlocks, but this is not currently possible.

Would this be solved by SpinLockIrq?

---
Cheers,
Benno

> +///         let mut data =3D self.0.lock();
> +///         *data +=3D 1;
> +///
> +///         IrqReturn::Handled
> +///     }
> +/// }
