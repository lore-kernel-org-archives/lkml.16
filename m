Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA3B3597E;
	Sun, 22 Jun 2025 09:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750583909; cv=none; b=JCg7tC04Wx5lJK/PVSbKKtmRoIaOVoruYi5iGo+XaWYoB3aeZtr7LgYrTDh1+9dJBRVY+8XwLlViTs0mTbCBsM8c63jEx8NwLrDCnKr/CXdZ7e1r+bJ5xrA64nRIbZDF3B5fFDTJf+xVuMdbRWaTNABzFYg3+Jyaf1mkQNOhszQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750583909; c=relaxed/simple;
	bh=ULzFgtp1ptoqf68hd35V/2QqP6kNAwJxF5Ov9RkKsBM=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=alcZ3C5FFVMQB5rKGRZIAeEVS+0+49ftHFt0kji7fGTdAg1tIr3EDhPUVQtzEaY7t5QdHi98pEJeB5Nyb1+79DdiX+XXG14mM/l+M7eaR3qZUdQ+RyPQWFnxBJXLwv26JZoX8N3jyEmpmeYbLcc37/TCikwchqr3GKq6lX/e9ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qYyzFheV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qYyzFheV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE308C4CEE3;
	Sun, 22 Jun 2025 09:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750583909;
	bh=ULzFgtp1ptoqf68hd35V/2QqP6kNAwJxF5Ov9RkKsBM=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=qYyzFheVetvfQqUiWosGmNIq3UVfBzRF3MEHl5auGlq4V6Qt2c0K3m6tkvazSCbRD
	 4sKxPDJk6q4J9p9FMDHeWUAigg9do+NGUHL6pV6fBYTCzEw1zTP3nY+3Gg4Q1DmohQ
	 Fm4rvYsekf+Jg0ZpUhAcziXBinmozhh5CyNdrotVhkrCLfYlyiO34Y5MSBSbfuSSTY
	 FgdFGIc98bFv+75dGPTjCxVLzqjBn8Xw+IPpDPlwmKLIsufBuBvfrpdX6mu0ozNd3K
	 zO9viI30JCDnBQ4nwb26mipKnT1yczUP6pHKfT9pHN7pG2KzwwVlG74uxhUipBjCVO
	 kznLXbYJTpauw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Jun 2025 11:18:24 +0200
Message-Id: <DASY7BECFRCT.332X5ZHZMV2W@kernel.org>
To: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Cc: <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <dakr@kernel.org>, <peterz@infradead.org>,
 <mingo@redhat.com>, <will@kernel.org>, <longman@redhat.com>,
 <felipe_life@live.com>, <daniel@sedlak.dev>, <bjorn3_gh@protonmail.com>
Subject: Re: [PATCH v5 2/3] implement ww_mutex abstraction for the Rust tree
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250621184454.8354-1-work@onurozkan.dev>
 <20250621184454.8354-3-work@onurozkan.dev>
In-Reply-To: <20250621184454.8354-3-work@onurozkan.dev>

On Sat Jun 21, 2025 at 8:44 PM CEST, Onur =C3=96zkan wrote:
> Adds Rust bindings for the kernel's `ww_mutex` infrastructure to enable
> deadlock-free acquisition of multiple related locks.
>
> The patch abstracts `ww_mutex.h` header and wraps the existing
> C `ww_mutex` with three main types:
>     - `WwClass` for grouping related mutexes
>     - `WwAcquireCtx` for tracking lock acquisition context
>     - `WwMutex<T>` for the actual lock

Going to repeat my question from the previous version:

    I don't know the design of `struct ww_mutex`, but from the code below I
    gathered that it has some special error return values that signify that
    one should release other locks.
   =20
    Did anyone think about making a more Rusty API that would allow one to
    try to lock multiple mutexes at the same time (in a specified order) an=
d
    if it fails, it would do the resetting automatically?

I'm not familiar with ww_mutex, so I can't tell if there is something
good that we could do.

> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  rust/kernel/error.rs              |   1 +
>  rust/kernel/sync/lock.rs          |   1 +
>  rust/kernel/sync/lock/ww_mutex.rs | 421 ++++++++++++++++++++++++++++++
>  3 files changed, 423 insertions(+)
>  create mode 100644 rust/kernel/sync/lock/ww_mutex.rs

Thanks for splitting the tests into its own patch, but I still think
it's useful to do the abstractions for `ww_class`, `ww_acquire_ctx` and
`ww_mutex` separately.

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

I really don't see the value in having a macro here. The user can just
declare the static themselves.

> +
> +/// A group of mutexes that can participate in deadlock avoidance togeth=
er.

This isn't a group of mutexes, but rather a class that can be used to
group mutexes together.

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

Is this really needed? Can't we do without this macro?

> +
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

This doesn't work together with `#[pin_data]`, you shouldn't return it
by-value if it is supposed to be pin-initialized.

Is this type address sensitive? If yes, this function needs to be
`unsafe`, if no, then we can remove `#[pin_data]`.

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

This can just be `new(name, true)` instead.

> +    }
> +
> +    /// Creates wound-wait [`WwClass`].
> +    pub fn new_wound_wait(name: &'static CStr) -> impl PinInit<Self> {
> +        pin_init!(WwClass {
> +            inner: ww_class_init_helper!(name, false),
> +        })

Ditto with `false`.

> +    }
> +}
> +
> +/// An acquire context is used to group multiple mutex acquisitions toge=
ther
> +/// for deadlock avoidance. It must be used when acquiring multiple mute=
xes
> +/// of the same class.

The first paragraph will be displayed by rustdoc in several summary
views, so it should be a single short sentence.

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

I don't think it makes sense to have examples using mutexes that are on
the stack. Please use `Arc` instead.

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

s/raw_ptr/class/

> +        pin_init!(WwMutex {
> +            mutex <- Opaque::ffi_init(|slot: *mut bindings::ww_mutex| {
> +                // SAFETY: The caller guarantees that `ww_class` remains=
 valid.

The caller doesn't need to guarantees that (and in fact they don't),
because it's a reference that lives until `'ww_class` which is captured
by `Self`. So the borrow checker guarantees that the class remains
valid.

---
Cheers,
Benno

> +                unsafe { bindings::ww_mutex_init(slot, raw_ptr) }
> +            }),
> +            data: UnsafeCell::new(t),
> +            _p: PhantomData,
> +        })
> +    }
> +}
