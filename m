Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71AA24500A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750679522; cv=none; b=fQc0FDXvr3L3M0/1cglQ/EBUA5bb5mmUWCNkB1bkE+9DfRqS7EmWzzC7gwvc7UMphvhj+gn6tas211DHmdoqcaHTE1VCF99TMhhDdNGVHzvPTtwkFmSl8Qic5D+WCf0Fsxgiz/kCs3yGuBrZoM5lJOBuaq/YG4Iy3GFFzVyCTko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750679522; c=relaxed/simple;
	bh=35q3+3Dst46F90cgYvA8Ip8ilPUMGpZtF+iNktgNiW0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gh9pQ93UUwkK9uwzLU80Uc7dr364kgALmiIdtw1dnfdjvxea5o0Y0QRg559SxkAWCx8CdNlCB3k4vaxDnNrK0rp0snmF9hD84kfkGuL7jBatofedBqeh2P4CPD07H3rpHa+ZOJNICgEkeFKlXhQfnvbz3D48mVrcAbzh8FmHZ5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P0Ry8l55; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P0Ry8l55"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-451d2037f1eso25164465e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 04:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750679518; x=1751284318; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNQFE1dzVUP2EPz+7GhwVKOGlMLdpdEd0aK9n7pXfug=;
        b=P0Ry8l55FTtE/7ACbReIiOGc+UV4UCW9Amjmu71+rS/aqtOl00EL5MnIpfma/lL3p0
         a0FSWFZLBwoTIYZ7Rtt+2pZJqIo67NGX2j8Vtp3VYmNtxI2u8im5JXMGnvddC93Wkkqs
         x24RiRTXq328fpdbLN+mYiUxUkCEV4ev0gfTn8YGSszRI4ImyGDLSTnHtE0VWy2F2dBZ
         F/O27G8KkQyjuV631yUqE4Oh8F7Zgu2jaqPIbW+rBXrPV+cfodW6dlPoo3psSANvofQG
         FAWcVKED0+QCn/IW12DkZp3J1E75a2igcQjwh2HKmLGMMDOYBeHfQeHqdCWc7rxMrstL
         3IZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750679518; x=1751284318;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SNQFE1dzVUP2EPz+7GhwVKOGlMLdpdEd0aK9n7pXfug=;
        b=sOfO2Cr8gkXswekOVE1l6Cx/KxO7v2cCVa0vBn6fR0F+yA1phDZcIY16aXLnFJ6z3W
         WMhjH+TM2swiGP31+Op5WtTXiWhKiCuaBQU5JOq6NpFF09151orVlW7Zm/kis4YF4FZ8
         GCianYd2heSRi1V88LOtfoHqzmo9HRDCSNs1AqvREXHNot9zxIiJNJlyZnA3Y4XmR19B
         PfyCrCrJFoOuY+ispiopspc7x/Q/FAS4zhk9u5RPop0eukFJXVL75EgFtBJy56G4RjEu
         6XyfOFzYgsVfofRznam97u99H6vyWnxxI00kkeGyqLdhiqP2u4ixU4Is4y2XXME7BBbF
         mOMA==
X-Gm-Message-State: AOJu0YyKnYG6aiZjPx63zTOjJAoW9Yss0xX17omiyM8yA7oLBbOtv3c+
	jBXccBiihFKFbBGoOycKrRPyl0pEedZgCuZc4v7D9kzkyTflXxBtKvyJ2x4COVj5qGumDMPMShu
	FP5dRrubmr7LR04/xtQ==
X-Google-Smtp-Source: AGHT+IHabWqiqpGtJ9nFNLa1HYaufq5OnuFzLVDdfdV1amJKInRAujJP3VtAVPeiQuCXRiSJhwvE+NSFtzsnbjY=
X-Received: from wmth14.prod.google.com ([2002:a05:600c:8b6e:b0:43c:ebbe:4bce])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b15:b0:450:cf46:5510 with SMTP id 5b1f17b1804b1-453656c3641mr125618225e9.29.1750679518354;
 Mon, 23 Jun 2025 04:51:58 -0700 (PDT)
Date: Mon, 23 Jun 2025 11:51:56 +0000
In-Reply-To: <20250621184454.8354-3-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250621184454.8354-1-work@onurozkan.dev> <20250621184454.8354-3-work@onurozkan.dev>
Message-ID: <aFk_3F7Xus2VAVg3@google.com>
Subject: Re: [PATCH v5 2/3] implement ww_mutex abstraction for the Rust tree
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	dakr@kernel.org, peterz@infradead.org, mingo@redhat.com, will@kernel.org, 
	longman@redhat.com, felipe_life@live.com, daniel@sedlak.dev, 
	bjorn3_gh@protonmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 09:44:53PM +0300, Onur =C3=96zkan wrote:
> Adds Rust bindings for the kernel's `ww_mutex` infrastructure to enable
> deadlock-free acquisition of multiple related locks.
>=20
> The patch abstracts `ww_mutex.h` header and wraps the existing
> C `ww_mutex` with three main types:
>     - `WwClass` for grouping related mutexes
>     - `WwAcquireCtx` for tracking lock acquisition context
>     - `WwMutex<T>` for the actual lock
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  rust/kernel/error.rs              |   1 +
>  rust/kernel/sync/lock.rs          |   1 +
>  rust/kernel/sync/lock/ww_mutex.rs | 421 ++++++++++++++++++++++++++++++
>  3 files changed, 423 insertions(+)
>  create mode 100644 rust/kernel/sync/lock/ww_mutex.rs
>=20
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 3dee3139fcd4..28157541e12c 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -64,6 +64,7 @@ macro_rules! declare_err {
>      declare_err!(EPIPE, "Broken pipe.");
>      declare_err!(EDOM, "Math argument out of domain of func.");
>      declare_err!(ERANGE, "Math result not representable.");
> +    declare_err!(EDEADLK, "Resource deadlock avoided.");
>      declare_err!(EOVERFLOW, "Value too large for defined data type.");
>      declare_err!(ERESTARTSYS, "Restart the system call.");
>      declare_err!(ERESTARTNOINTR, "System call was interrupted by a signa=
l and will be restarted.");
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index e82fa5be289c..8824ebc81084 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -15,6 +15,7 @@
> =20
>  pub mod mutex;
>  pub mod spinlock;
> +pub mod ww_mutex;
> =20
>  pub(super) mod global;
>  pub use global::{GlobalGuard, GlobalLock, GlobalLockBackend, GlobalLocke=
dBy};
> diff --git a/rust/kernel/sync/lock/ww_mutex.rs b/rust/kernel/sync/lock/ww=
_mutex.rs
> new file mode 100644
> index 000000000000..dcb23941813c
> --- /dev/null
> +++ b/rust/kernel/sync/lock/ww_mutex.rs
> @@ -0,0 +1,421 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! A kernel Wound/Wait Mutex.
> +//!
> +//! This module provides Rust abstractions for the Linux kernel's `ww_mu=
tex` implementation,
> +//! which provides deadlock avoidance through a wait-wound or wait-die a=
lgorithm.
> +//!
> +//! C header: [`include/linux/ww_mutex.h`](srctree/include/linux/ww_mute=
x.h)
> +//!
> +//! For more information: <https://docs.kernel.org/locking/ww-mutex-desi=
gn.html>
> +
> +use crate::bindings;
> +use crate::error::to_result;
> +use crate::prelude::*;
> +use crate::types::{NotThreadSafe, Opaque};
> +use core::cell::UnsafeCell;
> +use core::marker::PhantomData;
> +
> +/// Create static [`WwClass`] instances.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::{c_str, define_ww_class};
> +///
> +/// define_ww_class!(WOUND_WAIT_GLOBAL_CLASS, wound_wait, c_str!("wound_=
wait_global_class"));
> +/// define_ww_class!(WAIT_DIE_GLOBAL_CLASS, wait_die, c_str!("wait_die_g=
lobal_class"));
> +/// ```

should we split this into two macros define_ww_class! and
define_wd_class! to match the C macros?

> +#[macro_export]
> +macro_rules! define_ww_class {
> +    ($name:ident, wound_wait, $class_name:expr) =3D> {
> +        static $name: $crate::sync::lock::ww_mutex::WwClass =3D
> +            { $crate::sync::lock::ww_mutex::WwClass::new($class_name, fa=
lse) };
> +    };
> +    ($name:ident, wait_die, $class_name:expr) =3D> {
> +        static $name: $crate::sync::lock::ww_mutex::WwClass =3D
> +            { $crate::sync::lock::ww_mutex::WwClass::new($class_name, tr=
ue) };
> +    };
> +}
> +
> +/// A group of mutexes that can participate in deadlock avoidance togeth=
er.
> +///
> +/// All mutexes that might be acquired together should use the same clas=
s.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::sync::lock::ww_mutex::WwClass;
> +/// use kernel::c_str;
> +/// use pin_init::stack_pin_init;
> +///
> +/// stack_pin_init!(let _wait_die_class =3D WwClass::new_wait_die(c_str!=
("graphics_buffers")));
> +/// stack_pin_init!(let _wound_wait_class =3D WwClass::new_wound_wait(c_=
str!("memory_pools")));
> +///
> +/// # Ok::<(), Error>(())
> +/// ```
> +#[pin_data]
> +pub struct WwClass {
> +    #[pin]
> +    inner: Opaque<bindings::ww_class>,
> +}
> +
> +// SAFETY: [`WwClass`] is set up once and never modified. It's fine to s=
hare it across threads.
> +unsafe impl Sync for WwClass {}
> +// SAFETY: Doesn't hold anything thread-specific. It's safe to send to o=
ther threads.
> +unsafe impl Send for WwClass {}
> +
> +macro_rules! ww_class_init_helper {
> +    ($name:expr, $is_wait_die:expr) =3D> {
> +        Opaque::new(bindings::ww_class {
> +            stamp: bindings::atomic_long_t { counter: 0 },
> +            acquire_name: $name.as_char_ptr(),
> +            mutex_name: $name.as_char_ptr(),
> +            is_wait_die: $is_wait_die as u32,
> +            // TODO: Replace with `bindings::lock_class_key::default()` =
once stabilized for `const`.
> +            //
> +            // SAFETY: This is always zero-initialized when defined with=
 `DEFINE_WD_CLASS`
> +            // globally on C side.
> +            //
> +            // Ref: <https://git.kernel.org/pub/scm/linux/kernel/git/tor=
valds/linux.git/tree/include/linux/ww_mutex.h?h=3Dv6.16-rc2#n85>
> +            acquire_key: unsafe { core::mem::zeroed() },
> +            // TODO: Replace with `bindings::lock_class_key::default()` =
once stabilized for `const`.
> +            //
> +            // SAFETY: This is always zero-initialized when defined with=
 `DEFINE_WD_CLASS`
> +            // globally on C side.
> +            //
> +            // Ref: <https://git.kernel.org/pub/scm/linux/kernel/git/tor=
valds/linux.git/tree/include/linux/ww_mutex.h?h=3Dv6.16-rc2#n85>
> +            mutex_key: unsafe { core::mem::zeroed() },
> +        })
> +    };
> +}

You don't need this macro. You can have `new_wait_die` or
`new_wound_wait` call `new` directly and just move the macro into `new`.

> +impl WwClass {
> +    /// Creates a [`WwClass`].
> +    ///
> +    /// It's `pub` only so it can be used by the `define_ww_class!` macr=
o.
> +    ///
> +    /// You should not use this function directly. Use the `define_ww_cl=
ass!`
> +    /// macro or call [`WwClass::new_wait_die`] or [`WwClass::new_wound_=
wait`] instead.
> +    pub const fn new(name: &'static CStr, is_wait_die: bool) -> Self {
> +        WwClass {
> +            inner: ww_class_init_helper!(name, is_wait_die),
> +        }
> +    }
> +
> +    /// Creates wait-die [`WwClass`].
> +    pub fn new_wait_die(name: &'static CStr) -> impl PinInit<Self> {
> +        pin_init!(WwClass {
> +            inner: ww_class_init_helper!(name, true),
> +        })
> +    }
> +
> +    /// Creates wound-wait [`WwClass`].
> +    pub fn new_wound_wait(name: &'static CStr) -> impl PinInit<Self> {
> +        pin_init!(WwClass {
> +            inner: ww_class_init_helper!(name, false),
> +        })
> +    }
> +}
> +
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
> +/// use kernel::c_str;
> +/// use kernel::alloc::KBox;
> +/// use pin_init::stack_pin_init;
> +///
> +/// stack_pin_init!(let class =3D WwClass::new_wound_wait(c_str!("my_cla=
ss")));
> +///
> +/// // Create mutexes.
> +/// stack_pin_init!(let mutex1 =3D WwMutex::new(1, &class));
> +/// stack_pin_init!(let mutex2 =3D WwMutex::new(2, &class));
> +///
> +/// // Create acquire context for deadlock avoidance.
> +/// let mut ctx =3D KBox::pin_init(WwAcquireCtx::new(&class), GFP_KERNEL=
)?;
> +///
> +/// // Acquire multiple locks safely.
> +/// let guard1 =3D mutex1.lock(Some(&ctx))?;
> +/// let guard2 =3D mutex2.lock(Some(&ctx))?;
> +///
> +/// // Mark acquisition phase as complete.
> +/// ctx.as_mut().done();
> +///
> +/// # Ok::<(), Error>(())
> +/// ```
> +#[pin_data(PinnedDrop)]
> +pub struct WwAcquireCtx<'a> {
> +    #[pin]
> +    inner: Opaque<bindings::ww_acquire_ctx>,
> +    _p: PhantomData<&'a WwClass>,
> +}
> +
> +// SAFETY: Used in controlled ways during lock acquisition. No race risk=
.
> +unsafe impl Sync for WwAcquireCtx<'_> {}
> +// SAFETY: Doesn't rely on thread-local state. Safe to move between thre=
ads.
> +unsafe impl Send for WwAcquireCtx<'_> {}
> +
> +impl<'ctx> WwAcquireCtx<'ctx> {
> +    /// Initializes `Self` with calling C side `ww_acquire_init` inside.
> +    pub fn new<'class: 'ctx>(ww_class: &'class WwClass) -> impl PinInit<=
Self> {

I would rename 'ctx to 'class and get rid of this super-lifetime.

impl<'class> WwAcquireCtx<'class> {
    /// Initializes `Self` with calling C side `ww_acquire_init` inside.
    pub fn new(ww_class: &'class WwClass) -> impl PinInit<Self> {

> +        let raw_ptr =3D ww_class.inner.get();
> +        pin_init!(WwAcquireCtx {
> +            inner <- Opaque::ffi_init(|slot: *mut bindings::ww_acquire_c=
tx| {
> +                // SAFETY: The caller guarantees that `ww_class` remains=
 valid.
> +                unsafe { bindings::ww_acquire_init(slot, raw_ptr) }
> +            }),
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
> +        unsafe { bindings::ww_acquire_done(self.inner.get()) };
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
> +        unsafe { bindings::ww_acquire_fini(self.inner.get()) };
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
> +/// use kernel::c_str;
> +/// use pin_init::stack_pin_init;
> +///
> +/// stack_pin_init!(let class =3D WwClass::new_wound_wait(c_str!("buffer=
_class")));
> +/// stack_pin_init!(let mutex =3D WwMutex::new(42, &class));
> +///
> +/// // Simple lock without context.
> +/// let guard =3D mutex.lock(None)?;
> +/// assert_eq!(*guard, 42);
> +///
> +/// # Ok::<(), Error>(())
> +/// ```
> +///
> +/// ## Multiple Locks
> +///
> +/// ```
> +/// use kernel::c_str;
> +/// use kernel::prelude::*;
> +/// use kernel::sync::lock::ww_mutex::{WwClass, WwAcquireCtx, WwMutex};
> +/// use pin_init::stack_pin_init;
> +///
> +/// stack_pin_init!(let class =3D WwClass::new_wait_die(c_str!("resource=
_class")));
> +/// stack_pin_init!(let mutex_a =3D WwMutex::new("Resource A", &class));
> +/// stack_pin_init!(let mutex_b =3D WwMutex::new("Resource B", &class));
> +///
> +/// let mut ctx =3D KBox::pin_init(WwAcquireCtx::new(&class), GFP_KERNEL=
)?;
> +///
> +/// // Try to acquire both locks.
> +/// let guard_a =3D match mutex_a.lock(Some(&ctx)) {
> +///     Ok(guard) =3D> guard,
> +///     Err(e) if e =3D=3D EDEADLK =3D> {
> +///         // Deadlock detected, use slow path.
> +///         mutex_a.lock_slow(&ctx)?
> +///     }
> +///     Err(e) =3D> return Err(e),
> +/// };
> +///
> +/// let guard_b =3D mutex_b.lock(Some(&ctx))?;
> +/// ctx.as_mut().done();
> +///
> +/// # Ok::<(), Error>(())
> +/// ```
> +#[pin_data]
> +pub struct WwMutex<'a, T: ?Sized> {
> +    _p: PhantomData<&'a WwClass>,
> +    #[pin]
> +    mutex: Opaque<bindings::ww_mutex>,
> +    data: UnsafeCell<T>,
> +}
> +
> +// SAFETY: [`WwMutex`] can be shared between threads.
> +unsafe impl<T: ?Sized + Send> Send for WwMutex<'_, T> {}
> +// SAFETY: [`WwMutex`] can be safely accessed from multiple threads conc=
urrently.
> +unsafe impl<T: ?Sized + Sync> Sync for WwMutex<'_, T> {}
> +
> +impl<'ww_class, T> WwMutex<'ww_class, T> {
> +    /// Creates `Self` with calling `ww_mutex_init` inside.
> +    pub fn new(t: T, ww_class: &'ww_class WwClass) -> impl PinInit<Self>=
 {
> +        let raw_ptr =3D ww_class.inner.get();
> +        pin_init!(WwMutex {
> +            mutex <- Opaque::ffi_init(|slot: *mut bindings::ww_mutex| {
> +                // SAFETY: The caller guarantees that `ww_class` remains=
 valid.
> +                unsafe { bindings::ww_mutex_init(slot, raw_ptr) }
> +            }),
> +            data: UnsafeCell::new(t),
> +            _p: PhantomData,
> +        })
> +    }
> +}
> +
> +impl<T: ?Sized> WwMutex<'_, T> {
> +    /// Locks the mutex with the given acquire context.
> +    pub fn lock<'a>(&'a self, ctx: Option<&WwAcquireCtx<'_>>) -> Result<=
WwMutexGuard<'a, T>> {
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
> +        &'a self,
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
k` returns [`EDEADLK`].
> +    pub fn lock_slow<'a>(&'a self, ctx: &WwAcquireCtx<'_>) -> Result<WwM=
utexGuard<'a, T>> {
> +        // SAFETY: The mutex is pinned and valid, and we're in the slow =
path.
> +        unsafe { bindings::ww_mutex_lock_slow(self.mutex.get(), ctx.as_p=
tr()) };
> +
> +        Ok(WwMutexGuard::new(self))
> +    }
> +
> +    /// Locks the mutex in the slow path after a die case, interruptible=
.
> +    pub fn lock_slow_interruptible<'a>(
> +        &'a self,
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
> +    pub fn try_lock<'a>(&'a self, ctx: Option<&WwAcquireCtx<'_>>) -> Res=
ult<WwMutexGuard<'a, T>> {
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
> +    pub fn is_locked(&self) -> bool {
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
> +/// A guard that provides exclusive access to the data protected
> +/// by a [`WwMutex`].
> +///
> +/// # Invariants
> +///
> +/// The guard holds an exclusive lock on the associated [`WwMutex`]. The=
 lock is held
> +/// for the entire lifetime of this guard and is automatically released =
when the
> +/// guard is dropped.
> +#[must_use =3D "the lock unlocks immediately when the guard is unused"]
> +pub struct WwMutexGuard<'a, T: ?Sized> {
> +    mutex: &'a WwMutex<'a, T>,
> +    _not_send: NotThreadSafe,
> +}
> +
> +// SAFETY: [`WwMutexGuard`] can be transferred across thread boundaries =
if the data can.
> +unsafe impl<T: ?Sized + Send> Send for WwMutexGuard<'_, T> {}
> +
> +// SAFETY: [`WwMutexGuard`] can be shared between threads if the data ca=
n.
> +unsafe impl<T: ?Sized + Send + Sync> Sync for WwMutexGuard<'_, T> {}
> +
> +impl<'a, T: ?Sized> WwMutexGuard<'a, T> {
> +    /// Creates a new guard for a locked mutex.
> +    fn new(mutex: &'a WwMutex<'a, T>) -> Self {
> +        Self {
> +            mutex,
> +            _not_send: NotThreadSafe,
> +        }
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
> +        unsafe { bindings::ww_mutex_unlock(self.mutex.as_ptr()) };
> +    }
> +}
> --=20
> 2.49.0
>=20
