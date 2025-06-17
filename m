Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BB11FAC50
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750160120; cv=none; b=PRDhD0ZxVEOOIhUaUq4DytHqiiKJvT/Yym5yIuVKYTrz6+oVeoyiYGWaS2M1/UW26Usv+7M1aXEqWt2RiK17URhnOAi7J94XsdHV92sr3U6T9xKI12BfRc55EpP3GXj85pvWBDPL0sP7toVTC3bJYxxVlr5trEbGbHc69kM5GM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750160120; c=relaxed/simple;
	bh=ReN/u7c0nvun+FcHbqO8EcFXc1PNzXyVS2UBEt5vsHc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=STHHSbwCBfdfZtc2e76kv6FQ0Mskrp8hjA38kHs4zNPDqMQS+TFxUQ0NMaeY8VVgJE7QOoLc1QWOdf3tC2AsB0r+KvJDhHKWDKxw35RnuvA9r4I8E8YU9ZOSqEJO7VMWNouwpd34iaEANGULSNqBMpgn156q4hH7ufVFJJXCRVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EXI9wOLE; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EXI9wOLE"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-451d30992bcso46704985e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 04:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750160116; x=1750764916; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4ZxZRD7Du57jom/PYI8ha6Z4B/xSvOR+r7+O6M0yHw=;
        b=EXI9wOLEmBi0fiBuPGLTnjRveyEEYlTc3fRb22YPV/gOqHOByUh3OSFOXwa1J531m2
         lf4p2FK/9WzGEdS+HRBVBAXn64P0ipWvGxvcmq8Nfu+KuHy5Fw0m+zbA2BXK9YvYYipl
         g1bU/0TXybQVfkThhiqA8eZJNZcPCw5Wvrge2NLi7QiW1sJalBj6drvmCrH4h3qktZmT
         Ji1tEcOX0WSwdeQkdqDVSO+bxIcMU3dAZEz2FTm4Yvj9NwXIQKoXqr9Avce2LH/cPEjV
         Sy5z3C3p5S+N1qGOAyeWF4jaH5CdHQHJDqtOded3qGedkf2w5kPFIkNqg58wlBHfqThr
         tpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750160116; x=1750764916;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c4ZxZRD7Du57jom/PYI8ha6Z4B/xSvOR+r7+O6M0yHw=;
        b=qUz8lDfX3gQ8gbJn19twRxWyNRVimRvZvQ+flNVN02UqpOCPOo2hIuDBHIPQbL0o7w
         TDAoqLvkCMVO4a6lgafMTE8XT8ylTyG1lWQMQh58X8GzoPROfvg755lWi69CZ0G7HhDR
         OnzTrzvJQXojLdxX70WtMMhtnmDqckECDxms97XutCv8DfGPfP5y6ZiHtMZI3y5sBmoy
         QTxCCk5j/QYuX9jvH/fCBJPYjxKcwcBJ3cehVJxq2idRaCiLlVmODZyVLAN3l8FuaqBg
         xINPgQJ5PFrjh0XzykroNo8TZZ2VjwCaiBue+o9F6XWCFVTEIkHWqyEORnb9ViQ4cwQ5
         e9Og==
X-Gm-Message-State: AOJu0YxpDIJxa1QPI9AgC3waIPlMg+EKCoIkEn93ZKOWyxl1wQiOGOka
	RW5WgeSQoDQ6WgWf02ep/UaDSY1OGsVbHbVjCiZ/ktdObpPpxwxQH1kbu6N3mfw/b9zy1zxqU/Y
	oeeXcioT9S3KQC3nokg==
X-Google-Smtp-Source: AGHT+IEK7YEdVmVkRQwdTDsfK/5bVwvtxmXjsiTeva3g8AonIglHSZh0bbgyHAxqNKF3Gs40alN4RXLfr5/YmL0=
X-Received: from wmpz18.prod.google.com ([2002:a05:600c:a12:b0:43d:5828:13ee])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:502b:b0:442:ccfa:fa with SMTP id 5b1f17b1804b1-4533cb0d71bmr115246055e9.27.1750160116063;
 Tue, 17 Jun 2025 04:35:16 -0700 (PDT)
Date: Tue, 17 Jun 2025 11:35:14 +0000
In-Reply-To: <20250617053821.7666-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250617053821.7666-1-work@onurozkan.dev>
Message-ID: <aFFS8iKWPytEnwZi@google.com>
Subject: Re: [PATCH v2] implement `ww_mutex` abstraction for the Rust tree
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	peterz@infradead.org, mingo@redhat.com, will@kernel.org, boqun.feng@gmail.com, 
	longman@redhat.com, ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, thatslyude@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 08:38:21AM +0300, Onur =C3=96zkan wrote:
> From: onur-ozkan <work@onurozkan.dev>
>=20
> Adds Rust bindings for the kernel's `ww_mutex` infrastructure to enable
> deadlock-free acquisition of multiple related locks.
>=20
> The implementation abstracts `ww_mutex.h` header and wraps the existing
> C `ww_mutex` with three main types:
>     - `WwClass` for grouping related mutexes
>     - `WwAcquireCtx` for tracking lock acquisition context
>     - `WwMutex<T>` for the actual lock
>=20
> Some of the kernel's `ww_mutex` functions are implemented as `static inli=
ne`,
> so they are inaccessible from Rust as bindgen can't generate code on them=
.
> The `rust/helpers/ww_mutex.c file provides C function wrappers around the=
se inline
> implementations, so bindgen can see them and generate the corresponding R=
ust code.
>=20
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/291566-Library=
/topic/Writing.20up.20wrappers.20for.20ww_mutex.3F/with/524269974
> Suggested-by: thatslyude@gmail.com
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  rust/helpers/helpers.c            |   1 +
>  rust/helpers/ww_mutex.c           |  39 +++
>  rust/kernel/error.rs              |   1 +
>  rust/kernel/sync/lock.rs          |   1 +
>  rust/kernel/sync/lock/ww_mutex.rs | 469 ++++++++++++++++++++++++++++++
>  5 files changed, 511 insertions(+)
>  create mode 100644 rust/helpers/ww_mutex.c
>  create mode 100644 rust/kernel/sync/lock/ww_mutex.rs
>=20
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 0f1b5d115985..fd071cbe20a1 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -44,3 +44,4 @@
>  #include "wait.c"
>  #include "workqueue.c"
>  #include "xarray.c"
> +#include "ww_mutex.c"
> diff --git a/rust/helpers/ww_mutex.c b/rust/helpers/ww_mutex.c
> new file mode 100644
> index 000000000000..61a487653394
> --- /dev/null
> +++ b/rust/helpers/ww_mutex.c
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/ww_mutex.h>
> +
> +void rust_helper_ww_mutex_init(struct ww_mutex *lock, struct ww_class *w=
w_class)
> +{
> +	ww_mutex_init(lock, ww_class);
> +}
> +
> +void rust_helper_ww_acquire_init(struct ww_acquire_ctx *ctx, struct ww_c=
lass *ww_class)
> +{
> +	ww_acquire_init(ctx, ww_class);
> +}
> +
> +void rust_helper_ww_acquire_done(struct ww_acquire_ctx *ctx)
> +{
> +	ww_acquire_done(ctx);
> +}
> +
> +void rust_helper_ww_acquire_fini(struct ww_acquire_ctx *ctx)
> +{
> +	ww_acquire_fini(ctx);
> +}
> +
> +void rust_helper_ww_mutex_lock_slow(struct ww_mutex *lock, struct ww_acq=
uire_ctx *ctx)
> +{
> +	ww_mutex_lock_slow(lock, ctx);
> +}
> +
> +int rust_helper_ww_mutex_lock_slow_interruptible(struct ww_mutex *lock, =
struct ww_acquire_ctx *ctx)
> +{
> +	return ww_mutex_lock_slow_interruptible(lock, ctx);
> +}
> +
> +bool rust_helper_ww_mutex_is_locked(struct ww_mutex *lock)
> +{
> +	return ww_mutex_is_locked(lock);
> +}
> +
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 3dee3139fcd4..94d8014b236b 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -84,6 +84,7 @@ macro_rules! declare_err {
>      declare_err!(EIOCBQUEUED, "iocb queued, will get completion event.")=
;
>      declare_err!(ERECALLCONFLICT, "Conflict with recalled state.");
>      declare_err!(ENOGRACE, "NFS file lock reclaim refused.");
> +    declare_err!(EDEADLK, "Resource deadlock avoided.");
>  }
>=20
>  /// Generic integer kernel error.
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index e82fa5be289c..8824ebc81084 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -15,6 +15,7 @@
>=20
>  pub mod mutex;
>  pub mod spinlock;
> +pub mod ww_mutex;
>=20
>  pub(super) mod global;
>  pub use global::{GlobalGuard, GlobalLock, GlobalLockBackend, GlobalLocke=
dBy};
> diff --git a/rust/kernel/sync/lock/ww_mutex.rs b/rust/kernel/sync/lock/ww=
_mutex.rs
> new file mode 100644
> index 000000000000..884784bc47a1
> --- /dev/null
> +++ b/rust/kernel/sync/lock/ww_mutex.rs
> @@ -0,0 +1,469 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! A kernel Wound/Wait Mutex.
> +//!
> +//! This module provides Rust abstractions for the Linux kernel's `ww_mu=
tex` implementation,
> +//! which provides deadlock avoidance through a wait/die algorithm.
> +
> +use crate::error::{to_result, Result};
> +use crate::prelude::EBUSY;
> +use crate::{bindings, str::CStr, types::Opaque};
> +use core::marker::{PhantomData, PhantomPinned};
> +use core::{cell::UnsafeCell, pin::Pin};
> +use macros::kunit_tests;
> +use pin_init::{pin_data, pin_init, pinned_drop, PinInit};
> +
> +/// Implementation of C side `ww_class`.
> +///
> +/// Represents a group of mutexes that can participate in deadlock avoid=
ance together.
> +/// All mutexes that might be acquired together should use the same clas=
s.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::sync::lock::ww_mutex::WwClass;
> +/// use kernel::c_str;
> +///
> +/// let _wait_die_class =3D KBox::pin_init(WwClass::new(c_str!("graphics=
_buffers"), true), GFP_KERNEL).unwrap();
> +/// let _wound_wait_class =3D KBox::pin_init(WwClass::new(c_str!("memory=
_pools"), false), GFP_KERNEL).unwrap();
> +///
> +/// # Ok::<(), Error>(())
> +/// ```
> +#[pin_data]
> +pub struct WwClass {
> +    #[pin]
> +    inner: Opaque<bindings::ww_class>,
> +}
> +
> +// SAFETY: `WwClass` can be shared between threads.
> +unsafe impl Sync for WwClass {}

We probably want Send too.

> +impl WwClass {
> +    /// Creates `WwClass` that wraps C side `ww_class`.
> +    pub fn new(name: &'static CStr, is_wait_die: bool) -> impl PinInit<S=
elf> {

It may be easier to read code using this if you make two constructors:

fn new(name: &'static CStr, is_wait_die: bool) -> impl PinInit<Self> {
    pin_init!(WwClass { ... })
}

pub fn new_wait_die(name: &'static CStr) -> impl PinInit<Self> {
    Self::new(name, true)
}

pub fn new_wound_wait(name: &'static CStr) -> impl PinInit<Self> {
    Self::new(name, false)
}

> +        pin_init!(WwClass {
> +            inner: Opaque::new(bindings::ww_class {
> +                stamp: bindings::atomic_long_t { counter: 0 },
> +                acquire_name: name.as_char_ptr(),
> +                mutex_name: name.as_char_ptr(),
> +                is_wait_die: is_wait_die as u32,
> +
> +                // `lock_class_key` doesn't have any value
> +                acquire_key: bindings::lock_class_key {},
> +                mutex_key: bindings::lock_class_key {},
> +            })
> +        })
> +    }
> +}
> +
> +/// Implementation of C side `ww_acquire_ctx`.
> +///
> +/// An acquire context is used to group multiple mutex acquisitions toge=
ther
> +/// for deadlock avoidance. It must be used when acquiring multiple mute=
xes
> +/// of the same class.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::sync::lock::ww_mutex::{WwClass, WwAcquireCtx, WwMutex};
> +/// use kernel::alloc::KBox;
> +/// use kernel::c_str;
> +///
> +/// let class =3D KBox::pin_init(WwClass::new(c_str!("my_class"), false)=
, GFP_KERNEL).unwrap();
> +///
> +/// // Create mutexes
> +/// let mutex1 =3D KBox::pin_init(WwMutex::new(1, &class), GFP_KERNEL).u=
nwrap();
> +/// let mutex2 =3D KBox::pin_init(WwMutex::new(2, &class), GFP_KERNEL).u=
nwrap();
> +///
> +/// // Create acquire context for deadlock avoidance
> +/// let mut ctx =3D KBox::pin_init(
> +///     unsafe { WwAcquireCtx::new(&class) },
> +///     GFP_KERNEL
> +/// ).unwrap();

What is the unsafe operation here?

> +/// // Acquire multiple locks safely
> +/// let guard1 =3D mutex1.as_ref().lock(Some(&ctx)).unwrap();
> +/// let guard2 =3D mutex2.as_ref().lock(Some(&ctx)).unwrap();
> +///
> +/// // Mark acquisition phase as complete
> +/// ctx.as_mut().done();

I think it would be nice to initialize them on the stack rather than
making a box for every one.

> +/// ```
> +#[pin_data(PinnedDrop)]
> +pub struct WwAcquireCtx<'a> {
> +    #[pin]
> +    inner: Opaque<bindings::ww_acquire_ctx>,
> +    #[pin]
> +    _pin: PhantomPinned,

The use of Opaque implies PhantomPinned so you do not need
PhantomPinned.

> +    _p: PhantomData<&'a WwClass>,
> +}
> +
> +// SAFETY: `WwAcquireCtx` is safe to send between threads when not in us=
e.
> +unsafe impl Send for WwAcquireCtx<'_> {}

What about Sync?

> +impl<'ctx> WwAcquireCtx<'ctx> {
> +    /// Initializes `Self` with calling C side `ww_acquire_init` inside.
> +    pub fn new<'class: 'ctx>(ww_class: &'class WwClass) -> impl PinInit<=
Self> {
> +        let raw_ptr =3D ww_class.inner.get();
> +        pin_init!(WwAcquireCtx {
> +            inner <- Opaque::ffi_init(|slot: *mut bindings::ww_acquire_c=
tx| {
> +                // SAFETY: The caller guarantees that `ww_class` remains=
 valid.
> +                unsafe {
> +                    bindings::ww_acquire_init(slot, raw_ptr)
> +                }

This looks like you did not run rustfmt on the code? Rustfmt would
format it like this:
                unsafe { bindings::ww_acquire_init(slot, raw_ptr) }

> +            }),
> +            _pin: PhantomPinned,
> +            _p: PhantomData
> +        })
> +    }
> +
> +    /// Marks the end of the acquire phase with C side `ww_acquire_done`=
.
> +    ///
> +    /// After calling this function, no more mutexes can be acquired wit=
h this context.
> +    pub fn done(self: Pin<&mut Self>) {
> +        // SAFETY: The context is pinned and valid.
> +        unsafe {
> +            bindings::ww_acquire_done(self.inner.get());
> +        }

We usually place the semicolon outside the unsafe block so that it
formats on one line:
unsafe { bindings::ww_acquire_done(self.inner.get()) };

> +    }
> +
> +    /// Returns a raw pointer to the inner `ww_acquire_ctx`.
> +    fn as_ptr(&self) -> *mut bindings::ww_acquire_ctx {
> +        self.inner.get()
> +    }
> +}
> +
> +#[pinned_drop]
> +impl PinnedDrop for WwAcquireCtx<'_> {
> +    fn drop(self: Pin<&mut Self>) {
> +        // SAFETY: The context is being dropped and is pinned.
> +        unsafe {
> +            bindings::ww_acquire_fini(self.inner.get());
> +        }
> +    }
> +}
> +
> +/// A wound/wait mutex backed with C side `ww_mutex`.
> +///
> +/// This is a mutual exclusion primitive that provides deadlock avoidanc=
e when
> +/// acquiring multiple locks of the same class.
> +///
> +/// # Examples
> +///
> +/// ## Basic Usage
> +///
> +/// ```
> +/// use kernel::sync::lock::ww_mutex::{WwClass, WwMutex};
> +/// use kernel::alloc::KBox;
> +/// use kernel::c_str;
> +///
> +/// let class =3D KBox::pin_init(WwClass::new(c_str!("buffer_class"), fa=
lse), GFP_KERNEL).unwrap();
> +/// let mutex =3D KBox::pin_init(WwMutex::new(42, &class), GFP_KERNEL).u=
nwrap();
> +///
> +/// // Simple lock without context
> +/// let guard =3D mutex.as_ref().lock(None).unwrap();
> +/// assert_eq!(*guard, 42);
> +///
> +/// # Ok::<(), Error>(())
> +/// ```
> +///
> +/// ## Multiple Lock Acquisition with Deadlock Avoidance
> +///
> +/// ```
> +/// use kernel::sync::lock::ww_mutex::{WwClass, WwAcquireCtx, WwMutex};
> +/// use kernel::alloc::KBox;
> +/// use kernel::c_str;
> +/// use kernel::error::code::*;
> +///
> +/// let class =3D KBox::pin_init(WwClass::new(c_str!("resource_class"), =
true), GFP_KERNEL).unwrap();
> +/// let mutex_a =3D KBox::pin_init(WwMutex::new("Resource A", &class), G=
FP_KERNEL).unwrap();
> +/// let mutex_b =3D KBox::pin_init(WwMutex::new("Resource B", &class), G=
FP_KERNEL).unwrap();
> +///
> +/// let mut ctx =3D KBox::pin_init(unsafe { WwAcquireCtx::new(&class) },=
 GFP_KERNEL).unwrap();
> +///
> +/// // Try to acquire both locks
> +/// let guard_a =3D match mutex_a.as_ref().lock(Some(&ctx)) {
> +///     Ok(guard) =3D> guard,
> +///     Err(e) if e =3D=3D EDEADLK =3D> {
> +///         // Deadlock detected, use slow path
> +///         mutex_a.as_ref().lock_slow(&ctx).unwrap()
> +///     }
> +///     Err(e) =3D> return Err(e),
> +/// };
> +///
> +/// let guard_b =3D mutex_b.as_ref().lock(Some(&ctx)).unwrap();
> +/// ctx.as_mut().done();
> +///
> +/// # Ok::<(), Error>(())
> +/// ```
> +#[pin_data]
> +pub struct WwMutex<'a, T: ?Sized> {
> +    _p: PhantomData<&'a WwClass>,
> +    #[pin]
> +    mutex: Opaque<bindings::ww_mutex>,
> +    #[pin]
> +    data: UnsafeCell<T>,

Although the lifetime does enforce the things we need, I'm concerned
that having a lifetime will make this very hard to use in practice.

Question: Could we require the user to place the class in a global
variable? That would mean that different instances of the same set of
mutexes end up using the same class ... is that okay? What does C code
usually do?

> +}
> +
> +// SAFETY: `WwMutex` can be transferred across thread boundaries.
> +unsafe impl<T: ?Sized + Send> Send for WwMutex<'_, T> {}
> +
> +// SAFETY: `WwMutex` can be shared between threads.
> +unsafe impl<T: ?Sized + Send> Sync for WwMutex<'_, T> {}
> +
> +impl<'ww_mutex, T> WwMutex<'ww_mutex, T> {

I would not call this lifetime 'ww_mutex. It's the lifetime of the
class, not the mutex.

> +    /// Creates `Self` with calling `ww_mutex_init` inside.
> +    pub fn new<'class: 'ww_mutex>(t: T, ww_class: &'class WwClass) -> im=
pl PinInit<Self> {
> +        let raw_ptr =3D ww_class.inner.get();
> +        pin_init!(WwMutex {
> +            mutex <- Opaque::ffi_init(|slot: *mut bindings::ww_mutex| {
> +                // SAFETY: The caller guarantees that `ww_class` remains=
 valid.
> +                unsafe {
> +                    bindings::ww_mutex_init(slot, raw_ptr)
> +                }
> +            }),
> +            data: UnsafeCell::new(t),
> +            _p: PhantomData,
> +        })
> +    }
> +}
> +
> +impl<T: ?Sized> WwMutex<'_, T> {
> +    /// Locks the mutex with the given acquire context.
> +    pub fn lock<'a>(
> +        self: Pin<&'a Self>,
> +        ctx: Option<&WwAcquireCtx<'_>>,
> +    ) -> Result<WwMutexGuard<'a, T>> {
> +        // SAFETY: The mutex is pinned and valid.
> +        let ret =3D unsafe {
> +            bindings::ww_mutex_lock(
> +                self.mutex.get(),
> +                ctx.map_or(core::ptr::null_mut(), |c| c.as_ptr()),
> +            )
> +        };
> +
> +        to_result(ret)?;
> +
> +        Ok(WwMutexGuard::new(self))
> +    }
> +
> +    /// Locks the mutex with the given acquire context, interruptible.
> +    ///
> +    /// Similar to `lock`, but can be interrupted by signals.
> +    pub fn lock_interruptible<'a>(
> +        self: Pin<&'a Self>,
> +        ctx: Option<&WwAcquireCtx<'_>>,
> +    ) -> Result<WwMutexGuard<'a, T>> {
> +        // SAFETY: The mutex is pinned and valid.
> +        let ret =3D unsafe {
> +            bindings::ww_mutex_lock_interruptible(
> +                self.mutex.get(),
> +                ctx.map_or(core::ptr::null_mut(), |c| c.as_ptr()),
> +            )
> +        };
> +
> +        to_result(ret)?;
> +
> +        Ok(WwMutexGuard::new(self))
> +    }
> +
> +    /// Locks the mutex in the slow path after a die case.
> +    ///
> +    /// This should be called after releasing all held mutexes when `loc=
k` returns `EDEADLK`.
> +    pub fn lock_slow<'a>(
> +        self: Pin<&'a Self>,
> +        ctx: &WwAcquireCtx<'_>,
> +    ) -> Result<WwMutexGuard<'a, T>> {
> +        // SAFETY: The mutex is pinned and valid, and we're in the slow =
path.
> +        unsafe {
> +            bindings::ww_mutex_lock_slow(self.mutex.get(), ctx.as_ptr())=
;
> +        }
> +
> +        Ok(WwMutexGuard::new(self))
> +    }
> +
> +    /// Locks the mutex in the slow path after a die case, interruptible=
.
> +    pub fn lock_slow_interruptible<'a>(
> +        self: Pin<&'a Self>,
> +        ctx: &WwAcquireCtx<'_>,
> +    ) -> Result<WwMutexGuard<'a, T>> {
> +        // SAFETY: The mutex is pinned and valid, and we are in the slow=
 path.
> +        let ret =3D
> +            unsafe { bindings::ww_mutex_lock_slow_interruptible(self.mut=
ex.get(), ctx.as_ptr()) };
> +
> +        to_result(ret)?;
> +
> +        Ok(WwMutexGuard::new(self))
> +    }
> +
> +    /// Tries to lock the mutex without blocking.
> +    pub fn try_lock<'a>(
> +        self: Pin<&'a Self>,
> +        ctx: Option<&WwAcquireCtx<'_>>,
> +    ) -> Result<WwMutexGuard<'a, T>> {
> +        // SAFETY: The mutex is pinned and valid.
> +        let ret =3D unsafe {
> +            bindings::ww_mutex_trylock(
> +                self.mutex.get(),
> +                ctx.map_or(core::ptr::null_mut(), |c| c.as_ptr()),
> +            )
> +        };
> +
> +        if ret =3D=3D 0 {
> +            return Err(EBUSY);
> +        }
> +
> +        to_result(if ret < 0 { ret } else { 0 })?;
> +
> +        Ok(WwMutexGuard::new(self))
> +    }
> +
> +    /// Checks if the mutex is currently locked.
> +    pub fn is_locked(self: Pin<&Self>) -> bool {
> +        // SAFETY: The mutex is pinned and valid.
> +        unsafe { bindings::ww_mutex_is_locked(self.mutex.get()) }
> +    }
> +
> +    /// Returns a raw pointer to the inner mutex.
> +    fn as_ptr(&self) -> *mut bindings::ww_mutex {
> +        self.mutex.get()
> +    }
> +}
> +
> +/// A guard that provides exclusive access to the data protected by a
> +// [`WwMutex`] (a.k.a `ww_mutex` on the C side).
> +pub struct WwMutexGuard<'a, T: ?Sized> {
> +    mutex: Pin<&'a WwMutex<'a, T>>,
> +}
> +
> +// SAFETY: `WwMutexGuard` can be transferred across thread boundaries if=
 the data can.
> +unsafe impl<T: ?Sized + Send> Send for WwMutexGuard<'_, T> {}
> +
> +// SAFETY: `WwMutexGuard` can be shared between threads if the data can.
> +unsafe impl<T: ?Sized + Send + Sync> Sync for WwMutexGuard<'_, T> {}
> +
> +impl<'a, T: ?Sized> WwMutexGuard<'a, T> {
> +    /// Creates a new guard for a locked mutex.
> +    fn new(mutex: Pin<&'a WwMutex<'a, T>>) -> Self {
> +        Self { mutex }
> +    }
> +}
> +
> +impl<T: ?Sized> core::ops::Deref for WwMutexGuard<'_, T> {
> +    type Target =3D T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: We hold the lock, so we have exclusive access.
> +        unsafe { &*self.mutex.data.get() }
> +    }
> +}
> +
> +impl<T: ?Sized> core::ops::DerefMut for WwMutexGuard<'_, T> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        // SAFETY: We hold the lock, so we have exclusive access.
> +        unsafe { &mut *self.mutex.data.get() }
> +    }
> +}
> +
> +impl<T: ?Sized> Drop for WwMutexGuard<'_, T> {
> +    fn drop(&mut self) {
> +        // SAFETY: We hold the lock and are about to release it.
> +        unsafe {
> +            bindings::ww_mutex_unlock(self.mutex.as_ptr());
> +        }
> +    }
> +}
> +
> +#[kunit_tests(rust_kernel_ww_mutex)]
> +mod tests {
> +    use crate::alloc::KBox;
> +    use crate::c_str;
> +    use crate::init::InPlaceInit;
> +    use crate::prelude::*;
> +
> +    use super::*;
> +
> +    #[test]
> +    fn test_ww_mutex_basic_lock_unlock() {
> +        let class =3D
> +            KBox::pin_init(WwClass::new(c_str!("test_mutex_class"), fals=
e), GFP_KERNEL).unwrap();
> +
> +        let mutex =3D KBox::pin_init(WwMutex::new(42, &class), GFP_KERNE=
L).unwrap();
> +
> +        // Lock without context
> +        let guard =3D mutex.as_ref().lock(None).unwrap();
> +        assert_eq!(*guard, 42);
> +
> +        // Drop the lock
> +        drop(guard);
> +
> +        // Lock it again
> +        let mut guard =3D mutex.as_ref().lock(None).unwrap();
> +        *guard =3D 100;
> +        assert_eq!(*guard, 100);
> +    }
> +
> +    #[test]
> +    fn test_ww_mutex_trylock() {
> +        let class =3D
> +            KBox::pin_init(WwClass::new(c_str!("trylock_class"), false),=
 GFP_KERNEL).unwrap();
> +
> +        let mutex =3D KBox::pin_init(WwMutex::new(123, &class), GFP_KERN=
EL).unwrap();
> +
> +        // trylock on unlocked mutex should succeed
> +        let guard =3D mutex.as_ref().try_lock(None).unwrap();
> +        assert_eq!(*guard, 123);
> +        drop(guard);
> +
> +        // lock it first
> +        let _guard1 =3D mutex.as_ref().lock(None).unwrap();
> +
> +        // trylock should fail with EBUSY when already locked
> +        let result =3D mutex.as_ref().try_lock(None);
> +        match result {
> +            Err(e) =3D> assert_eq!(e, EBUSY),
> +            Ok(_) =3D> panic!("Expected `EBUSY` but got success"),
> +        }
> +    }
> +
> +    #[test]
> +    fn test_ww_mutex_is_locked() {
> +        let class =3D
> +            KBox::pin_init(WwClass::new(c_str!("locked_check_class"), tr=
ue), GFP_KERNEL).unwrap();
> +
> +        let mutex =3D KBox::pin_init(WwMutex::new("hello", &class), GFP_=
KERNEL).unwrap();
> +
> +        // should not be locked initially
> +        assert!(!mutex.as_ref().is_locked());
> +
> +        let guard =3D mutex.as_ref().lock(None).unwrap();
> +        assert!(mutex.as_ref().is_locked());
> +
> +        drop(guard);
> +        assert!(!mutex.as_ref().is_locked());
> +    }
> +
> +    #[test]
> +    fn test_ww_acquire_context() {
> +        let class =3D KBox::pin_init(WwClass::new(c_str!("ctx_class"), f=
alse), GFP_KERNEL).unwrap();
> +
> +        let mutex1 =3D KBox::pin_init(WwMutex::new(1, &class), GFP_KERNE=
L).unwrap();
> +        let mutex2 =3D KBox::pin_init(WwMutex::new(2, &class), GFP_KERNE=
L).unwrap();
> +
> +        let mut ctx =3D KBox::pin_init(WwAcquireCtx::new(&class), GFP_KE=
RNEL).unwrap();
> +
> +        // acquire multiple mutexes with same context
> +        let guard1 =3D mutex1.as_ref().lock(Some(&ctx)).unwrap();
> +        let guard2 =3D mutex2.as_ref().lock(Some(&ctx)).unwrap();
> +
> +        assert_eq!(*guard1, 1);
> +        assert_eq!(*guard2, 2);
> +
> +        ctx.as_mut().done();
> +
> +        // we shouldn't be able to lock once it's `done`.
> +        assert!(mutex1.as_ref().lock(Some(&ctx)).is_err());
> +        assert!(mutex2.as_ref().lock(Some(&ctx)).is_err());
> +    }
> +}
> 2.49.0
>=20
