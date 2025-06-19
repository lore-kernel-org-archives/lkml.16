Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AED21F4C9F;
	Thu, 19 Jun 2025 14:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344141; cv=none; b=ULqZme+WKxi8NDMO3Catn//2hOfRbgMS8aPxovl56irCp5AaESJzwkNS8y19LuTkS39zo/99y+uQIiVpZ0L0Ff5fU+IJGzF0o/6/+frkoIfzMSoZU0mvrT1EZjDXdhwTN53gXWd3bOjKETNCzx1/rcnTT0KNPA/9La6W+5qSKWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344141; c=relaxed/simple;
	bh=He86N1iZvbCIzC1x8L6OfWM68IqUKqhJ31Uw8QsM96M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=uM7IMNwRrnUQeILdSlEOPVSK0GDvKdgatfqq1MQycrD9WaTqvNGUm00rEt9y00IV+7RYC7BbyDcZyeCmnzcEm8ry4NzYoU+TfCbd0vVupdugmsSTAW99RVJmL06eZnyZpcQNvfg//lgQYqMBb9SGmAGpi16/8U0JVcAUWBO4xy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SEu0E4sM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SEu0E4sM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8254DC4CEEA;
	Thu, 19 Jun 2025 14:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750344140;
	bh=He86N1iZvbCIzC1x8L6OfWM68IqUKqhJ31Uw8QsM96M=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=SEu0E4sMH7ABZPWquLFjA66L4aWyUUF7GlbhzZym10f05mx0IBUoottCkhJaj+Sc/
	 QM4sDut4xtGwdV4G6UombGwbqn2k/1etl8HYRwwD7OouMQk8M3nLcVBWv0BRZLi3RW
	 ix3Z7dCXTu2HC+nVNlbEaO5+/arl9Sf1k40hXKpF1dtiYLuQOEO0BTz25zvB+ONYm3
	 k3faQ9sryoizbOSMrp2wAY1xhUVwxtToRKr14zf/2/q4/5idmrI+ZZ7uRzlWdcoTxg
	 2tfOZcC8yEToM86vcg4fVx+OSbJXdyTwMe/uqo8qwWypWhGDmEjYMgCZgK/aTBbDvo
	 iSZIu56KWfQ+Q==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jun 2025 16:42:15 +0200
Message-Id: <DAQL7NBDD68Q.1ZS3PUR0AGN0R@kernel.org>
Subject: Re: [PATCH V3] implement `ww_mutex` abstraction for the Rust tree
From: "Benno Lossin" <lossin@kernel.org>
To: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Cc: <peterz@infradead.org>, <mingo@redhat.com>, <will@kernel.org>,
 <boqun.feng@gmail.com>, <longman@redhat.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <dakr@kernel.org>, <thatslyude@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250619140656.498-1-work@onurozkan.dev>
In-Reply-To: <20250619140656.498-1-work@onurozkan.dev>

On Thu Jun 19, 2025 at 4:06 PM CEST, Onur =C3=96zkan wrote:
> From: onur-ozkan <work@onurozkan.dev>

Can you double-check your name in your git config? This doesn't match
the Signed-off-by below.

> Adds Rust bindings for the kernel's `ww_mutex` infrastructure to enable
> deadlock-free acquisition of multiple related locks.
>
> The implementation abstracts `ww_mutex.h` header and wraps the existing
> C `ww_mutex` with three main types:
>     - `WwClass` for grouping related mutexes
>     - `WwAcquireCtx` for tracking lock acquisition context
>     - `WwMutex<T>` for the actual lock
>
> Some of the kernel's `ww_mutex` functions are implemented as `static inli=
ne`,
> so they are inaccessible from Rust as bindgen can't generate code on them=
.
> The `rust/helpers/ww_mutex.c` file provides C function wrappers around th=
ese inline
> implementations, so bindgen can see them and generate the corresponding R=
ust code.
>
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/291566-Library=
/topic/Writing.20up.20wrappers.20for.20ww_mutex.3F/with/524269974
> Suggested-by: thatslyude@gmail.com
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  rust/helpers/helpers.c            |   1 +
>  rust/helpers/ww_mutex.c           |  39 +++
>  rust/kernel/error.rs              |   1 +
>  rust/kernel/sync/lock.rs          |   1 +
>  rust/kernel/sync/lock/ww_mutex.rs | 556 ++++++++++++++++++++++++++++++
>  5 files changed, 598 insertions(+)
>  create mode 100644 rust/helpers/ww_mutex.c
>  create mode 100644 rust/kernel/sync/lock/ww_mutex.rs

Can you split this patch into multiple smaller ones? For example all the
tests can be done separately as well as the abstractions for `ww_class`,
`ww_acquire_ctx` and `ww_mutex`.

Thanks.

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
>
>  /// Generic integer kernel error.
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index e82fa5be289c..8824ebc81084 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -15,6 +15,7 @@
>
>  pub mod mutex;
>  pub mod spinlock;
> +pub mod ww_mutex;
>
>  pub(super) mod global;
>  pub use global::{GlobalGuard, GlobalLock, GlobalLockBackend, GlobalLocke=
dBy};
> diff --git a/rust/kernel/sync/lock/ww_mutex.rs b/rust/kernel/sync/lock/ww=
_mutex.rs
> new file mode 100644
> index 000000000000..888db286fc4b
> --- /dev/null
> +++ b/rust/kernel/sync/lock/ww_mutex.rs
> @@ -0,0 +1,556 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! A kernel Wound/Wait Mutex.
> +//!
> +//! This module provides Rust abstractions for the Linux kernel's `ww_mu=
tex` implementation,
> +//! which provides deadlock avoidance through a wait-wound or wait-die a=
lgorithm.
> +
> +use crate::error::{to_result, Result};
> +use crate::prelude::EBUSY;
> +use crate::{bindings, str::CStr, types::Opaque};
> +use core::marker::PhantomData;
> +use core::{cell::UnsafeCell, pin::Pin};
> +use macros::kunit_tests;
> +use pin_init::{pin_data, pin_init, pinned_drop, PinInit};
> +
> +/// A helper macro for creating static `WwClass` instances.

s/A helper macro for creating/Create/

> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::c_str;
> +/// use kernel::define_ww_class;
> +///
> +/// define_ww_class!(WOUND_WAIT_GLOBAL_CLASS, wound_wait, c_str!("wound_=
wait_global_class"));
> +/// define_ww_class!(WAIT_DIE_GLOBAL_CLASS, wait_die, c_str!("wait_die_g=
lobal_class"));
> +/// ```
> +#[macro_export]
> +macro_rules! define_ww_class {

What's the reason for this being a macro?

> +    ($name:ident, wound_wait, $class_name:expr) =3D> {
> +        static $name: $crate::sync::lock::ww_mutex::WwClass =3D {
> +            $crate::sync::lock::ww_mutex::WwClass {
> +                inner: $crate::types::Opaque::new($crate::bindings::ww_c=
lass {
> +                    stamp: $crate::bindings::atomic_long_t { counter: 0 =
},
> +                    acquire_name: $class_name.as_char_ptr(),
> +                    mutex_name: $class_name.as_char_ptr(),
> +                    is_wait_die: 0,
> +                    // TODO: Replace with `bindings::lock_class_key::def=
ault()` once stabilized for `const`.
> +                    //
> +                    // SAFETY: This is always zero-initialized when defi=
ned with `DEFINE_WD_CLASS`
> +                    // globally on C side.
> +                    //
> +                    // Ref: https://github.com/torvalds/linux/blob/maste=
r/include/linux/ww_mutex.h#L85-L89
> +                    acquire_key: unsafe { core::mem::zeroed() },

This (and the others) can use [1] instead of `unsafe`. That series will
most likely land in v6.17.

[1]: https://lore.kernel.org/all/20250523145125.523275-1-lossin@kernel.org

> +                    // TODO: Replace with `bindings::lock_class_key::def=
ault()` once stabilized for `const`.
> +                    //
> +                    // SAFETY: This is always zero-initialized when defi=
ned with `DEFINE_WD_CLASS`
> +                    // globally on C side.
> +                    //
> +                    // Ref: https://github.com/torvalds/linux/blob/maste=
r/include/linux/ww_mutex.h#L85-L89
> +                    mutex_key: unsafe { core::mem::zeroed() },
> +                }),
> +            }
> +        };
> +    };
> +    ($name:ident, wait_die, $class_name:expr) =3D> {
> +        static $name: $crate::sync::lock::ww_mutex::WwClass =3D {
> +            $crate::sync::lock::ww_mutex::WwClass {
> +                inner: $crate::types::Opaque::new($crate::bindings::ww_c=
lass {
> +                    stamp: $crate::bindings::atomic_long_t { counter: 0 =
},
> +                    acquire_name: $class_name.as_char_ptr(),
> +                    mutex_name: $class_name.as_char_ptr(),
> +                    is_wait_die: 1,
> +                    // TODO: Replace with `bindings::lock_class_key::def=
ault()` once stabilized for `const`.
> +                    //
> +                    // SAFETY: This is always zero-initialized when defi=
ned with `DEFINE_WD_CLASS`
> +                    // globally on C side.
> +                    //
> +                    // Ref: https://github.com/torvalds/linux/blob/maste=
r/include/linux/ww_mutex.h#L85-L89
> +                    acquire_key: unsafe { core::mem::zeroed() },
> +                    // TODO: Replace with `bindings::lock_class_key::def=
ault()` once stabilized for `const`.
> +                    //
> +                    // SAFETY: This is always zero-initialized when defi=
ned with `DEFINE_WD_CLASS`
> +                    // globally on C side.
> +                    //
> +                    // Ref: https://github.com/torvalds/linux/blob/maste=
r/include/linux/ww_mutex.h#L85-L89
> +                    mutex_key: unsafe { core::mem::zeroed() },
> +                }),
> +            }
> +        };
> +    };
> +}
> +
> +/// Implementation of C side `ww_class`.

This isn't informative at all. The names already match, so I wouldn't
have thought otherwise.

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
> +    /// Wrapper of the underlying C `ww_class`.
> +    ///
> +    /// You should not construct this type manually. Use the `define_ww_=
class` macro
> +    /// or call `WwClass::new_wait_die` or `WwClass::new_wound_wait` ins=
tead.
> +    #[pin]
> +    pub inner: Opaque<bindings::ww_class>,

Why `pub`? Abstractions normally don't expose `Opaque` wrappers for
bindings. Especially because this type is marked `#[pin_data]` this
seems wrong, because this would allow people to construct it in a
non-pinned state & also non-initialized state.

> +}
> +
> +// SAFETY: `WwClass` can be safely accessed from multiple threads concur=
rently.

Why? This is supposed to justify that.

> +unsafe impl Sync for WwClass {}
> +// SAFETY: `WwClass` can be shared between threads.
> +unsafe impl Send for WwClass {}
> +
> +impl WwClass {
> +    fn new(name: &'static CStr, is_wait_die: bool) -> impl PinInit<Self>=
 {
> +        pin_init!(WwClass {
> +            inner: Opaque::new(bindings::ww_class {
> +                stamp: bindings::atomic_long_t { counter: 0 },
> +                acquire_name: name.as_char_ptr(),
> +                mutex_name: name.as_char_ptr(),
> +                is_wait_die: is_wait_die as u32,
> +                acquire_key: bindings::lock_class_key::default(),
> +                mutex_key: bindings::lock_class_key::default(),
> +            })
> +        })
> +    }
> +
> +    /// Creates wait-die `WwClass` that wraps C side `ww_class`.
> +    pub fn new_wait_die(name: &'static CStr) -> impl PinInit<Self> {
> +        Self::new(name, true)
> +    }
> +
> +    /// Creates wound-wait `WwClass` that wraps C side `ww_class`.
> +    pub fn new_wound_wait(name: &'static CStr) -> impl PinInit<Self> {
> +        Self::new(name, false)
> +    }
> +}
> +
> +/// Implementation of C side `ww_acquire_ctx`.

This also isn't informative.

> +///
> +/// An acquire context is used to group multiple mutex acquisitions toge=
ther
> +/// for deadlock avoidance. It must be used when acquiring multiple mute=
xes
> +/// of the same class.
> +///

[...]

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
> +/// // Simple lock without context
> +/// let guard =3D mutex.as_ref().lock(None).unwrap();
> +/// assert_eq!(*guard, 42);
> +///
> +/// # Ok::<(), Error>(())
> +/// ```
> +///
> +/// ## Multiple Locks with KBox
> +///
> +/// ```
> +/// use kernel::sync::lock::ww_mutex::{WwClass, WwAcquireCtx, WwMutex};
> +/// use kernel::alloc::KBox;
> +/// use kernel::c_str;
> +/// use kernel::error::code::*;
> +///
> +/// let class =3D KBox::pin_init(WwClass::new_wait_die(c_str!("resource_=
class")), GFP_KERNEL).unwrap();
> +/// let mutex_a =3D KBox::pin_init(WwMutex::new("Resource A", &class), G=
FP_KERNEL).unwrap();
> +/// let mutex_b =3D KBox::pin_init(WwMutex::new("Resource B", &class), G=
FP_KERNEL).unwrap();

Storing mutexes in `KBox` doesn't really make sense there might be
special cases, but for this example, we should use `Arc` instead.

> +///
> +/// let mut ctx =3D KBox::pin_init(WwAcquireCtx::new(&class), GFP_KERNEL=
).unwrap();
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

You marked the data as `#[pin]`, but `lock()` gives access to
`WwMutexGuard` which implements `DerefMut`, circumventing the pinning.
So either remove the `#[pin]` on `data`, or only return
`Pin<WwMutexGuard>`.

> +}
> +
> +// SAFETY: `WwMutex` can be shared between threads.
> +unsafe impl<T: ?Sized + Send> Send for WwMutex<'_, T> {}
> +// SAFETY: `WwMutex` can be safely accessed from multiple threads concur=
rently.
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
> +    pub fn lock<'a>(
> +        self: Pin<&'a Self>,

This receiver type is pretty annoying, because `Arc<T>` and
`Pin<Box<T>>` deref to `&T` and thus you don't get `Pin<&T>`. Just use
`&self` instead, if your type is only constructible using `impl
PinInit<Self>`, then it's guaranteed that all instances of the type are
pinned.

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

[...]

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

This needs a type invariant on `Self`.

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

What happens when this guard is forgotten and the lock is never
released?

---
Cheers,
Benno

> +    }
> +}
