Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A0214F70;
	Mon,  2 Jun 2025 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748868081; cv=none; b=plcDzF0m1choyWjKko8KyAinaifemo1KblNJmW6iWxiCS+O8V8v5uYnGkgEooPFzUMhKgI9z7P0sQ2r/HVed2PCExhUZDhQt6UqOQ6TDZKpORjMmlzgRMLHQheEcqqvmCm6CV6O8jAEt3WmbDQmVLTafrSeBotw8ds0amM5jcQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748868081; c=relaxed/simple;
	bh=kz/ozhzfzYQI+bSbQCl/NLHFLo2+5yc6Xm0+YiRP1xQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZYpnhMy96iA/tEImX7IFDY3gcAd6WRLhfn1MzLKFryBnqHL6mEjWa8abl2OLbu8OlchZdV3YgVKn0+t+fhaB6rktq8yicIrgbXvlbvZxXZwFskrOflNp+wpOspgQx0cKkhVIFh7Nwr05jj42cCXCwwY5Y0+rPPyk2SQU11NYhLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYgaaj79; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYgaaj79"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD019C4CEEB;
	Mon,  2 Jun 2025 12:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748868080;
	bh=kz/ozhzfzYQI+bSbQCl/NLHFLo2+5yc6Xm0+YiRP1xQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aYgaaj79rEyv/VLcC6pvzVY69NqOTaOkUhVZbIgHN2L1AA7iaWCmIfatQoR0mkXXC
	 Z0fA6r63aZfYxUrEFPNCk4Ns3rmkZcom1SnQcvmHp8squbGs9/GUxcGJzBwILz50el
	 rNLzbywJjQBNhcUpgCvv6CyQRXjYR4wEpSF6iEIV01RUtv5MpnrQ33GQCWdKvExkvS
	 PmiyZZxytmgqxP14tEjeUNHnimp18wZLEtdYng2FnBPGt9MDSq/NhxYq8JDXknSpmG
	 GwhDDP7T8jDdcuXLZVMkxrYo4rluQ825yDiGnoQ7dx+EGHMWKNmDIxGwZxUpm7d0fK
	 2Og7FvVYHt5iQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>,  <boqun.feng@gmail.com>,
  <frederic@kernel.org>,  <lyude@redhat.com>,  <tglx@linutronix.de>,
  <anna-maria@linutronix.de>,  <jstultz@google.com>,  <sboyd@kernel.org>,
  <ojeda@kernel.org>,  <alex.gaynor@gmail.com>,  <gary@garyguo.net>,
  <bjorn3_gh@protonmail.com>,  <benno.lossin@proton.me>,
  <aliceryhl@google.com>,  <tmgross@umich.edu>,  <dakr@kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 4/5] rust: time: Make HasHrTimer generic over
 HrTimerMode
In-Reply-To: <20250504045959.238068-5-fujita.tomonori@gmail.com> (FUJITA
	Tomonori's message of "Sun, 04 May 2025 13:59:57 +0900")
References: <20250504045959.238068-1-fujita.tomonori@gmail.com>
	<HhGhHOv9fvWu0G7TihU0V5UMif0USODr5QagKogYlf-zE9P6uyPWYdEckCaFi747sl_vkLi5XDB_O9BFcwsjow==@protonmail.internalid>
	<20250504045959.238068-5-fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 02 Jun 2025 14:41:10 +0200
Message-ID: <877c1u71uh.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> Add a `TimerMode` associated type to the `HasHrTimer` trait to
> represent the operational mode of the timer, such as absolute or
> relative expiration.  This new type must implement the `HrTimerMode`
> trait, which defines how expiration values are interpreted.
>
> Update the `start()` method to accept an `expires` parameter of type
> `<Self::TimerMode as HrTimerMode>::Expires` instead of the fixed `Ktime`.
> This enables different timer modes to provide strongly typed expiration
> values, such as `Instant<C>` or `Delta`.
>
> The `impl_has_hr_timer` macro is also extended to allow specifying the
> `HrTimerMode`. In the following example, it guarantees that the
> `start()` method for `Foo` only accepts `Instant<Monotonic>`. Using a
> `Delta` or an `Instant` with a different clock source will result in a
> compile-time error:
>
> struct Foo {
>     #[pin]
>     timer: HrTimer<Self>,
>
> }
>
> impl_has_hr_timer! {
>     impl HasHrTimer<Self> for Foo {
>         mode = AbsoluteMode<Monotonic>,
>         self.timer
>     }
> }
>
> This design eliminates runtime mismatches between expires types and
> clock sources, and enables stronger type-level guarantees throughout
> hrtimer.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/time/hrtimer.rs         | 55 ++++++++++++++++++++++-------
>  rust/kernel/time/hrtimer/arc.rs     |  8 +++--
>  rust/kernel/time/hrtimer/pin.rs     |  8 +++--
>  rust/kernel/time/hrtimer/pin_mut.rs |  8 +++--
>  rust/kernel/time/hrtimer/tbox.rs    |  8 +++--
>  5 files changed, 66 insertions(+), 21 deletions(-)
>
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index 55e1825425b6..3355ae6fe76d 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -98,7 +98,6 @@ pub fn to_ns(self) -> i64 {
>  pub struct HrTimer<T> {
>      #[pin]
>      timer: Opaque<bindings::hrtimer>,
> -    mode: bindings::hrtimer_mode,
>      _t: PhantomData<T>,
>  }
>
> @@ -112,9 +111,10 @@ unsafe impl<T> Sync for HrTimer<T> {}
>
>  impl<T> HrTimer<T> {
>      /// Return an initializer for a new timer instance.
> -    pub fn new<U: ClockSource, M: HrTimerMode>() -> impl PinInit<Self>
> +    pub fn new() -> impl PinInit<Self>
>      where
>          T: HrTimerCallback,
> +        T: HasHrTimer<T>,
>      {
>          pin_init!(Self {
>              // INVARIANT: We initialize `timer` with `hrtimer_setup` below.
> @@ -126,12 +126,11 @@ pub fn new<U: ClockSource, M: HrTimerMode>() -> impl PinInit<Self>
>                      bindings::hrtimer_setup(
>                          place,
>                          Some(T::Pointer::run),
> -                        U::ID,
> -                        M::C_MODE,
> +                        <<T as HasHrTimer<T>>::TimerMode as HrTimerMode>::Clock::ID,
> +                        <T as HasHrTimer<T>>::TimerMode::C_MODE,
>                      );
>                  }
>              }),
> -            mode: M::C_MODE,
>              _t: PhantomData,
>          })
>      }
> @@ -193,6 +192,11 @@ pub(crate) unsafe fn raw_cancel(this: *const Self) -> bool {
>  /// exist. A timer can be manipulated through any of the handles, and a handle
>  /// may represent a cancelled timer.
>  pub trait HrTimerPointer: Sync + Sized {
> +    /// The operational mode associated with this timer.
> +    ///
> +    /// This defines how the expiration value is interpreted.
> +    type TimerMode: HrTimerMode;
> +
>      /// A handle representing a started or restarted timer.
>      ///
>      /// If the timer is running or if the timer callback is executing when the
> @@ -205,7 +209,7 @@ pub trait HrTimerPointer: Sync + Sized {
>
>      /// Start the timer with expiry after `expires` time units. If the timer was
>      /// already running, it is restarted with the new expiry time.
> -    fn start(self, expires: Ktime) -> Self::TimerHandle;
> +    fn start(self, expires: <Self::TimerMode as HrTimerMode>::Expires) -> Self::TimerHandle;
>  }
>
>  /// Unsafe version of [`HrTimerPointer`] for situations where leaking the
> @@ -220,6 +224,11 @@ pub trait HrTimerPointer: Sync + Sized {
>  /// [`UnsafeHrTimerPointer`] outlives any associated [`HrTimerPointer::TimerHandle`]
>  /// instances.
>  pub unsafe trait UnsafeHrTimerPointer: Sync + Sized {
> +    /// The operational mode associated with this timer.
> +    ///
> +    /// This defines how the expiration value is interpreted.
> +    type TimerMode: HrTimerMode;
> +
>      /// A handle representing a running timer.
>      ///
>      /// # Safety
> @@ -236,7 +245,7 @@ pub unsafe trait UnsafeHrTimerPointer: Sync + Sized {
>      ///
>      /// Caller promises keep the timer structure alive until the timer is dead.
>      /// Caller can ensure this by not leaking the returned [`Self::TimerHandle`].
> -    unsafe fn start(self, expires: Ktime) -> Self::TimerHandle;
> +    unsafe fn start(self, expires: <Self::TimerMode as HrTimerMode>::Expires) -> Self::TimerHandle;
>  }
>
>  /// A trait for stack allocated timers.
> @@ -246,9 +255,14 @@ pub unsafe trait UnsafeHrTimerPointer: Sync + Sized {
>  /// Implementers must ensure that `start_scoped` does not return until the
>  /// timer is dead and the timer handler is not running.
>  pub unsafe trait ScopedHrTimerPointer {
> +    /// The operational mode associated with this timer.
> +    ///
> +    /// This defines how the expiration value is interpreted.
> +    type TimerMode: HrTimerMode;
> +
>      /// Start the timer to run after `expires` time units and immediately
>      /// after call `f`. When `f` returns, the timer is cancelled.
> -    fn start_scoped<T, F>(self, expires: Ktime, f: F) -> T
> +    fn start_scoped<T, F>(self, expires: <Self::TimerMode as HrTimerMode>::Expires, f: F) -> T
>      where
>          F: FnOnce() -> T;
>  }
> @@ -260,7 +274,13 @@ unsafe impl<T> ScopedHrTimerPointer for T
>  where
>      T: UnsafeHrTimerPointer,
>  {
> -    fn start_scoped<U, F>(self, expires: Ktime, f: F) -> U
> +    type TimerMode = T::TimerMode;
> +
> +    fn start_scoped<U, F>(
> +        self,
> +        expires: <<T as UnsafeHrTimerPointer>::TimerMode as HrTimerMode>::Expires,
> +        f: F,
> +    ) -> U
>      where
>          F: FnOnce() -> U,
>      {
> @@ -335,6 +355,11 @@ pub unsafe trait HrTimerHandle {
>  /// their documentation. All the methods of this trait must operate on the same
>  /// field.
>  pub unsafe trait HasHrTimer<T> {
> +    /// The operational mode associated with this timer.
> +    ///
> +    /// This defines how the expiration value is interpreted.
> +    type TimerMode: HrTimerMode;
> +
>      /// Return a pointer to the [`HrTimer`] within `Self`.
>      ///
>      /// This function is useful to get access to the value without creating
> @@ -382,14 +407,14 @@ unsafe fn c_timer_ptr(this: *const Self) -> *const bindings::hrtimer {
>      /// - `this` must point to a valid `Self`.
>      /// - Caller must ensure that the pointee of `this` lives until the timer
>      ///   fires or is canceled.
> -    unsafe fn start(this: *const Self, expires: Ktime) {
> +    unsafe fn start(this: *const Self, expires: <Self::TimerMode as HrTimerMode>::Expires) {
>          // SAFETY: By function safety requirement, `this` is a valid `Self`.
>          unsafe {
>              bindings::hrtimer_start_range_ns(
>                  Self::c_timer_ptr(this).cast_mut(),
> -                expires.to_ns(),
> +                expires.as_nanos(),
>                  0,
> -                (*Self::raw_get_timer(this)).mode,
> +                <Self::TimerMode as HrTimerMode>::Clock::ID as u32,
>              );
>          }
>      }
> @@ -579,12 +604,16 @@ macro_rules! impl_has_hr_timer {
>          impl$({$($generics:tt)*})?
>              HasHrTimer<$timer_type:ty>
>              for $self:ty
> -        { self.$field:ident }
> +        {
> +            mode = $mode:ty,
> +            self.$field:ident

How about:

  mode = $mode:ty,
  field = self.$field:ident

So that there is some sort of red line when calling this. We could also
consider adopting another syntax for association:

  mode: $mode:ty,
  field: self.$field:ident

or something else like `<-` or `->` ?


Best regards,
Andreas Hindborg


