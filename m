Received: from forward501b.mail.yandex.net (forward501b.mail.yandex.net [178.154.239.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22CC223328;
	Mon, 23 Jun 2025 18:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750702679; cv=none; b=PtZt0vUaMW4BVOz9jjsbHdWXTjQ3lFNSqAdTn4garyXiMNX/4k1FON+NC5DfRSphg9eTUy5reUNpkoECd4PjyXCMmH1FjKTux+JejBzQvRmJ64uM6zmxfAtHa1vYLjzy2G5xR96gmQvPbERKYYO/9xkDpNOuPLEDBQnk6ipkid4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750702679; c=relaxed/simple;
	bh=D+/v7TuU2GoeaETlDsdUtbZJ6dC4i3YTMcm8D2c97Nc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SjzwxMEd2xeWw5xFlxs29VpSntEJnuIZlhNIPZDogPs1fJSZDiL1KF0mMWqTSRdCIKmbznmIuh51eS8Ch++wabWlYDfdB/0Uqk678sYQPRwHAxROxE3QOOOhqHQz6XAGKYS+UuBWpi/m6fApIaQ+rm9nT7PbMON4T6IDPR+52IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=mS6ed7kB; arc=none smtp.client-ip=178.154.239.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="mS6ed7kB"
Received: from mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:5b8e:0:640:78f0:0])
	by forward501b.mail.yandex.net (Yandex) with ESMTPS id B8D2560DD1;
	Mon, 23 Jun 2025 21:17:46 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id fHX0NMhLb0U0-J0Hm20nW;
	Mon, 23 Jun 2025 21:17:45 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1750702665;
	bh=PAnJeYkpwPcTveZ2du1jhNjmMb6m/1pYEnrih+1nazg=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=mS6ed7kBUtxjI0r5h5pQnUYLxvFu2tkuTfdM4W2HpH142mtrHg7zoADOgp0uyhoT5
	 HmZCi6CQmdwCYHIFlGuF9yTYaZvO7GpVupfNcs1rz2Biz3fKmjHHCF5qHHOgTH9nU+
	 N7WiGahgLUSaV4SUSyb/cEztIogrstpK2FTsFp7U=
Authentication-Results: mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Mon, 23 Jun 2025 21:17:40 +0300
From: Onur <work@onurozkan.dev>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, peterz@infradead.org, mingo@redhat.com,
 will@kernel.org, longman@redhat.com, felipe_life@live.com,
 daniel@sedlak.dev, bjorn3_gh@protonmail.com
Subject: Re: [PATCH v5 2/3] implement ww_mutex abstraction for the Rust tree
Message-ID: <20250623211740.00a5bfea@nimda.home>
In-Reply-To: <aFlV9ky2RKrYnrJX@Mac.home>
References: <20250621184454.8354-1-work@onurozkan.dev>
	<20250621184454.8354-3-work@onurozkan.dev>
	<aFlV9ky2RKrYnrJX@Mac.home>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 23 Jun 2025 06:26:14 -0700
Boqun Feng <boqun.feng@gmail.com> wrote:

> On Sat, Jun 21, 2025 at 09:44:53PM +0300, Onur =C3=96zkan wrote:
> [...]
> > +#[pin_data(PinnedDrop)]
> > +pub struct WwAcquireCtx<'a> {
> > +    #[pin]
> > +    inner: Opaque<bindings::ww_acquire_ctx>,
> > +    _p: PhantomData<&'a WwClass>,
> > +}
> > +
> > +// SAFETY: Used in controlled ways during lock acquisition. No
> > race risk. +unsafe impl Sync for WwAcquireCtx<'_> {}
> > +// SAFETY: Doesn't rely on thread-local state. Safe to move
> > between threads. +unsafe impl Send for WwAcquireCtx<'_> {}
> > +
>=20
> I don't think `WwAcquireCtx` is `Send`, if you look at C code when
> LOCKDEP is enabled, `ww_acquire_init()` calls a few `mutex_acquire()`
> and expects `ww_acquire_fini()` to call the corresponding
> `mutex_release()`, and these two have to be on the same task. Also I
> don't think there is a need for sending `WwAcquireCtx` to another
> thread.

I wasn't very sure about myself analyzing the C API of ww_mutex thank
you. I will address this along with the other notes you pointed out.

> Besides, the `Sync` of `WwAcquireCtx` also doesn't make sense, I would
> drop it if there is no real usage for now.
>=20
> > +impl<'ctx> WwAcquireCtx<'ctx> {
> > +    /// Initializes `Self` with calling C side `ww_acquire_init`
> > inside.
> > +    pub fn new<'class: 'ctx>(ww_class: &'class WwClass) -> impl
> > PinInit<Self> {
> > +        let raw_ptr =3D ww_class.inner.get();
> > +        pin_init!(WwAcquireCtx {
> > +            inner <- Opaque::ffi_init(|slot: *mut
> > bindings::ww_acquire_ctx| {
> > +                // SAFETY: The caller guarantees that `ww_class`
> > remains valid.
> > +                unsafe { bindings::ww_acquire_init(slot, raw_ptr) }
> > +            }),
> > +            _p: PhantomData
> > +        })
> > +    }
> > +
> > +    /// Marks the end of the acquire phase with C side
> > `ww_acquire_done`.
> > +    ///
> > +    /// After calling this function, no more mutexes can be
> > acquired with this context.
> > +    pub fn done(self: Pin<&mut Self>) {
> > +        // SAFETY: The context is pinned and valid.
> > +        unsafe { bindings::ww_acquire_done(self.inner.get()) };
> > +    }
> > +
> > +    /// Returns a raw pointer to the inner `ww_acquire_ctx`.
> > +    fn as_ptr(&self) -> *mut bindings::ww_acquire_ctx {
> > +        self.inner.get()
> > +    }
> > +}
> > +
> > +#[pinned_drop]
> > +impl PinnedDrop for WwAcquireCtx<'_> {
> > +    fn drop(self: Pin<&mut Self>) {
> > +        // SAFETY: The context is being dropped and is pinned.
> > +        unsafe { bindings::ww_acquire_fini(self.inner.get()) };
> > +    }
> > +}
> > +
> [...]
> > +#[pin_data]
> > +pub struct WwMutex<'a, T: ?Sized> {
> > +    _p: PhantomData<&'a WwClass>,
> > +    #[pin]
> > +    mutex: Opaque<bindings::ww_mutex>,
> > +    data: UnsafeCell<T>,
> > +}
> > +
> > +// SAFETY: [`WwMutex`] can be shared between threads.
> > +unsafe impl<T: ?Sized + Send> Send for WwMutex<'_, T> {}
> > +// SAFETY: [`WwMutex`] can be safely accessed from multiple
> > threads concurrently. +unsafe impl<T: ?Sized + Sync> Sync for
> > WwMutex<'_, T> {}
>=20
> I believe this requires `T` being `Send` as well, because if
> `&WwMutex` is shared between threads, that means any thread can
> access `&mut T` when the lock acquired.
>=20
> > +
> > +impl<'ww_class, T> WwMutex<'ww_class, T> {
> > +    /// Creates `Self` with calling `ww_mutex_init` inside.
> > +    pub fn new(t: T, ww_class: &'ww_class WwClass) -> impl
> > PinInit<Self> {
> > +        let raw_ptr =3D ww_class.inner.get();
> > +        pin_init!(WwMutex {
> > +            mutex <- Opaque::ffi_init(|slot: *mut
> > bindings::ww_mutex| {
> > +                // SAFETY: The caller guarantees that `ww_class`
> > remains valid.
> > +                unsafe { bindings::ww_mutex_init(slot, raw_ptr) }
> > +            }),
> > +            data: UnsafeCell::new(t),
> > +            _p: PhantomData,
> > +        })
> > +    }
> > +}
> > +
> [...]
> > +    /// Checks if the mutex is currently locked.
> > +    pub fn is_locked(&self) -> bool {
>=20
> Did I miss a reply from you regarding:
>=20
> 	https://lore.kernel.org/rust-for-linux/aFReIdlPPg4MmaYX@tardis.local/
>=20
> no public is_lock() please. Do an assert_is_locked() instead. We need
> to avoid users from abusing this.

Sorry, I missed that. Perhaps, using `#[cfg(CONFIG_KUNIT)]` e.g.,:

    /// Checks if the mutex is currently locked.
    #[cfg(CONFIG_KUNIT)]
    fn is_locked(&self) -> bool {
        // SAFETY: The mutex is pinned and valid.
        unsafe { bindings::ww_mutex_is_locked(self.mutex.get()) }
    }

would be better? What do you think?

---

On Mon, 23 Jun 2025 11:51:56 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Sat, Jun 21, 2025 at 09:44:53PM +0300, Onur =C3=96zkan wrote:
> > Adds Rust bindings for the kernel's `ww_mutex` infrastructure to
> > enable deadlock-free acquisition of multiple related locks.
> >=20
> > The patch abstracts `ww_mutex.h` header and wraps the existing
> > C `ww_mutex` with three main types:
> >     - `WwClass` for grouping related mutexes
> >     - `WwAcquireCtx` for tracking lock acquisition context
> >     - `WwMutex<T>` for the actual lock
> >=20
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> > ---
> >  rust/kernel/error.rs              |   1 +
> >  rust/kernel/sync/lock.rs          |   1 +
> >  rust/kernel/sync/lock/ww_mutex.rs | 421
> > ++++++++++++++++++++++++++++++ 3 files changed, 423 insertions(+)
> >  create mode 100644 rust/kernel/sync/lock/ww_mutex.rs
> >=20
> > diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> > index 3dee3139fcd4..28157541e12c 100644
> > --- a/rust/kernel/error.rs
> > +++ b/rust/kernel/error.rs
> > @@ -64,6 +64,7 @@ macro_rules! declare_err {
> >      declare_err!(EPIPE, "Broken pipe.");
> >      declare_err!(EDOM, "Math argument out of domain of func.");
> >      declare_err!(ERANGE, "Math result not representable.");
> > +    declare_err!(EDEADLK, "Resource deadlock avoided.");
> >      declare_err!(EOVERFLOW, "Value too large for defined data
> > type."); declare_err!(ERESTARTSYS, "Restart the system call.");
> >      declare_err!(ERESTARTNOINTR, "System call was interrupted by a
> > signal and will be restarted."); diff --git
> > a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs index
> > e82fa5be289c..8824ebc81084 100644 --- a/rust/kernel/sync/lock.rs
> > +++ b/rust/kernel/sync/lock.rs
> > @@ -15,6 +15,7 @@
> > =20
> >  pub mod mutex;
> >  pub mod spinlock;
> > +pub mod ww_mutex;
> > =20
> >  pub(super) mod global;
> >  pub use global::{GlobalGuard, GlobalLock, GlobalLockBackend,
> > GlobalLockedBy}; diff --git a/rust/kernel/sync/lock/ww_mutex.rs
> > b/rust/kernel/sync/lock/ww_mutex.rs new file mode 100644
> > index 000000000000..dcb23941813c
> > --- /dev/null
> > +++ b/rust/kernel/sync/lock/ww_mutex.rs
> > @@ -0,0 +1,421 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! A kernel Wound/Wait Mutex.
> > +//!
> > +//! This module provides Rust abstractions for the Linux kernel's
> > `ww_mutex` implementation, +//! which provides deadlock avoidance
> > through a wait-wound or wait-die algorithm. +//!
> > +//! C header:
> > [`include/linux/ww_mutex.h`](srctree/include/linux/ww_mutex.h) +//!
> > +//! For more information:
> > <https://docs.kernel.org/locking/ww-mutex-design.html> +
> > +use crate::bindings;
> > +use crate::error::to_result;
> > +use crate::prelude::*;
> > +use crate::types::{NotThreadSafe, Opaque};
> > +use core::cell::UnsafeCell;
> > +use core::marker::PhantomData;
> > +
> > +/// Create static [`WwClass`] instances.
> > +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// use kernel::{c_str, define_ww_class};
> > +///
> > +/// define_ww_class!(WOUND_WAIT_GLOBAL_CLASS, wound_wait,
> > c_str!("wound_wait_global_class")); +///
> > define_ww_class!(WAIT_DIE_GLOBAL_CLASS, wait_die,
> > c_str!("wait_die_global_class")); +/// ```
>=20
> should we split this into two macros define_ww_class! and
> define_wd_class! to match the C macros?

I don't have a strong opinion on that. I like having small helper
macros but Benno doesn't seem to like having any macro at all for
creating global `WwClass`.

---

On Sun, 22 Jun 2025 11:18:24 +0200
"Benno Lossin" <lossin@kernel.org> wrote:

> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> > ---
> >  rust/kernel/error.rs              |   1 +
> >  rust/kernel/sync/lock.rs          |   1 +
> >  rust/kernel/sync/lock/ww_mutex.rs | 421
> > ++++++++++++++++++++++++++++++ 3 files changed, 423 insertions(+)
> >  create mode 100644 rust/kernel/sync/lock/ww_mutex.rs
>=20
> Thanks for splitting the tests into its own patch, but I still think
> it's useful to do the abstractions for `ww_class`, `ww_acquire_ctx`
> and `ww_mutex` separately.
>=20
> > +/// Create static [`WwClass`] instances.
> > +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// use kernel::{c_str, define_ww_class};
> > +///
> > +/// define_ww_class!(WOUND_WAIT_GLOBAL_CLASS, wound_wait,
> > c_str!("wound_wait_global_class")); +///
> > define_ww_class!(WAIT_DIE_GLOBAL_CLASS, wait_die,
> > c_str!("wait_die_global_class")); +/// ``` +#[macro_export]
> > +macro_rules! define_ww_class {
> > +    ($name:ident, wound_wait, $class_name:expr) =3D> {
> > +        static $name: $crate::sync::lock::ww_mutex::WwClass =3D
> > +            {
> > $crate::sync::lock::ww_mutex::WwClass::new($class_name, false) };
> > +    };
> > +    ($name:ident, wait_die, $class_name:expr) =3D> {
> > +        static $name: $crate::sync::lock::ww_mutex::WwClass =3D
> > +            {
> > $crate::sync::lock::ww_mutex::WwClass::new($class_name, true) };
> > +    };
> > +}
>=20
> I really don't see the value in having a macro here. The user can just
> declare the static themselves.

Yes, they can. This is just a helper to make things a bit simpler.
I am fine with either keeping or removing it, I don't have a strong
opinion on this macro.

Alice also made a suggestion about it (it should be visible in this
e-mail as I replied that as well): splitting `define_ww_class!` into two
macros, `define_wd_class!` and `define_ww_class!`.

In my opinion, having this macro doesn't add much value but it also
doesn't introduce any complexity, so it leaves us with a small gain, I
guess.

> > +
> > +impl WwClass {
> > +    /// Creates a [`WwClass`].
> > +    ///
> > +    /// It's `pub` only so it can be used by the
> > `define_ww_class!` macro.
> > +    ///
> > +    /// You should not use this function directly. Use the
> > `define_ww_class!`
> > +    /// macro or call [`WwClass::new_wait_die`] or
> > [`WwClass::new_wound_wait`] instead.
> > +    pub const fn new(name: &'static CStr, is_wait_die: bool) ->
> > Self {
>=20
> This doesn't work together with `#[pin_data]`, you shouldn't return it
> by-value if it is supposed to be pin-initialized.
>=20
> Is this type address sensitive? If yes, this function needs to be
> `unsafe`, if no, then we can remove `#[pin_data]`.

It should be `unsafe` function, thanks.


---

Regards,
Onur


