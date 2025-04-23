Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FFD3C1F;
	Wed, 23 Apr 2025 12:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411061; cv=none; b=VOS/xYY/joPurBqPjqSspwMCrlF8X/+ZER54zu/DYrT2Y5jcPOke9dVFAjkFKSz8hbMUX+lQFQNyTrpIlB+OjnsQOhym1VymbunF9yEk170I7gj0vL0biU2+ypQ2Y80hUOQk5noVWjhz08TZl7i8BOdZSyv/7xH5nWLgHcAn4yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411061; c=relaxed/simple;
	bh=TZtTB377HTVmvNYYpv+aypNwFzVqY1qeiZzkRtzEG2A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=b3jMfkqIi4YA8PUnjY/xjQ5ZMQxxV4U8rgwJ3lHoypHDnHrlziYGh9fnwC47iEwYPuqN7ovwqTi9zZ1Duzi1QkpW6TG3KcLRGJ0UNuz1+Q5VCYM8QaaJ+mYtZ6RvPvGmEEwiDamRJ6TXAhzsfCYnOaFDw7FRA+PMNMsPLGECD0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bLXUgFnW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bLXUgFnW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A5AC4CEEB;
	Wed, 23 Apr 2025 12:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745411061;
	bh=TZtTB377HTVmvNYYpv+aypNwFzVqY1qeiZzkRtzEG2A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bLXUgFnWDRYjl1Y+yWUmB+jRy7NmMWBAfVvzkCLFjQnuOaVa0+hO9EyLmE0yXS//e
	 Vx6W0E2m6YwSmjM2PI0Z7y4444fhQdjyKuFMRx6Hi+tJv6LiO7GZPRl/4cG01KWLe6
	 J6MVleKbtisruGHzaxpC/ZNJ4yD5/ONXPOPFqLb0ApTEoldESwaR1wjnpWy1P59FKd
	 HUjD2QUzlLHoe1IokJnHIUaYkLGW1QiWmhSpo29x8Iqqi2ykeKLrcFph9YUYcJ5by3
	 MEjpm8TWmuInuEfCncdF5qQVFJnB4s8m1SaEsqajcWHvrbNthJptPqGWHDI/H2EGR2
	 WxfJwTngPVWnA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org,  linux-kernel@vger.kernel.org,  Boqun
 Feng <boqun.feng@gmail.com>,  FUJITA Tomonori <fujita.tomonori@gmail.com>,
  Frederic Weisbecker <frederic@kernel.org>,  Thomas Gleixner
 <tglx@linutronix.de>,  Anna-Maria Behnsen <anna-maria@linutronix.de>,
  John Stultz <jstultz@google.com>,  Stephen Boyd <sboyd@kernel.org>,
  Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,
  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
  Benno Lossin <benno.lossin@proton.me>,  Alice Ryhl
 <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,  Danilo
 Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 3/8] rust: hrtimer: Add HrTimerCallbackContext and
 ::forward()
In-Reply-To: <20250415195020.413478-4-lyude@redhat.com> (Lyude Paul's message
	of "Tue, 15 Apr 2025 15:48:24 -0400")
References: <20250415195020.413478-1-lyude@redhat.com>
	<20250415195020.413478-4-lyude@redhat.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 23 Apr 2025 14:24:10 +0200
Message-ID: <874iyfm5g5.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Lyude Paul <lyude@redhat.com> writes:

> With Linux's hrtimer API, there's a number of methods that can only be
> called in two situations:
>
> * When we have exclusive access to the hrtimer and it is not currently
>   active
> * When we're within the context of an hrtimer callback context
>
> This commit handles the second situation and implements hrtimer_forward()
> support in the context of a timer callback. We do this by introducing a
> HrTimerCallbackContext type which is provided to users during the
> RawHrTimerCallback::run() callback, and then add a forward() function to
> the type.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>
> ---
>
> V2:
> * Improve SAFETY comments for HrTimerCallbackContext uses (I forgot to
>   mention that we're within RawHrTimerCallback::run()
> * Split forward into forward() and raw_forward() since we're going to have
>   two contexts that we can call forward() from now.
> * Clarify contexts in which certain hrtimer methods can be called.
> * Make sure that we use a mutable reference for forward() here - just in
>   case :).
> * Rename interval to duration
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/time/hrtimer.rs         | 51 +++++++++++++++++++++++++++--
>  rust/kernel/time/hrtimer/arc.rs     |  9 ++++-
>  rust/kernel/time/hrtimer/pin.rs     |  9 ++++-
>  rust/kernel/time/hrtimer/pin_mut.rs | 11 +++++--
>  rust/kernel/time/hrtimer/tbox.rs    |  9 ++++-
>  5 files changed, 82 insertions(+), 7 deletions(-)
>
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index aadae8666f7ea..507fff67f8ab2 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -73,7 +73,7 @@
>      time::{Delta, Instant},
>      types::Opaque,
>  };
> -use core::marker::PhantomData;
> +use core::{marker::PhantomData, ptr::NonNull};
>  use pin_init::PinInit;
>  
>  /// A timer backed by a C `struct hrtimer`.
> @@ -314,7 +314,10 @@ pub trait HrTimerCallback {
>      type Pointer<'a>: RawHrTimerCallback;
>  
>      /// Called by the timer logic when the timer fires.
> -    fn run(this: <Self::Pointer<'_> as RawHrTimerCallback>::CallbackTarget<'_>) -> HrTimerRestart
> +    fn run<T>(
> +        this: <Self::Pointer<'_> as RawHrTimerCallback>::CallbackTarget<'_>,
> +        ctx: HrTimerCallbackContext<'_, T>,
> +    ) -> HrTimerRestart
>      where
>          Self: Sized;
>  }
> @@ -507,6 +510,50 @@ fn into_c(self) -> bindings::hrtimer_mode {
>      }
>  }
>  
> +/// Privileged smart-pointer for a [`HrTimer`] callback context.
> +///
> +/// Many [`HrTimer`] methods can only be called in two situations:
> +///
> +/// * When the caller has exclusive access to the `HrTimer` and the `HrTimer` is guaranteed not to
> +///   be running.
> +/// * From within the context of an `HrTimer`'s callback method.
> +///
> +/// This type provides access to said methods from within a timer callback context.
> +///
> +/// # Invariants
> +///
> +/// * The existence of this type means the caller is currently within the callback for an
> +///   [`HrTimer`].
> +/// * `self.0` always points to a live instance of [`HrTimer<T>`].
> +pub struct HrTimerCallbackContext<'a, T>(NonNull<HrTimer<T>>, PhantomData<&'a ()>);
> +
> +impl<'a, T> HrTimerCallbackContext<'a, T> {
> +    /// Create a new [`HrTimerCallbackContext`].
> +    ///
> +    /// # Safety
> +    ///
> +    /// This function relies on the caller being within the context of a timer callback, so it must
> +    /// not be used anywhere except for within implementations of [`RawHrTimerCallback::run`]. The
> +    /// caller promises that `timer` points to a valid initialized instance of
> +    /// [`bindings::hrtimer`].
> +    pub(crate) unsafe fn from_raw(timer: *mut HrTimer<T>) -> Self {
> +        // SAFETY: The caller guarantees `timer` is a valid pointer to an initialized
> +        // `bindings::hrtimer`
> +        Self(unsafe { NonNull::new_unchecked(timer) }, PhantomData)
> +    }
> +
> +    /// Forward the timer expiry so it expires at `duration` after `now`.
> +    ///
> +    /// Note that this does not requeue the timer, it simply updates its expiry value. It returns
> +    /// the number of overruns that have occurred as a result of the expiry change.
> +    pub fn forward(&mut self, now: Instant, duration: Delta) -> u64 {
> +        // SAFETY:
> +        // - We are guaranteed to be within the context of a timer callback by our type invariants
> +        // - By our type invariants, `self.0` always points to a valid `HrTimer<T>`
> +        unsafe { HrTimer::<T>::raw_forward(self.0.as_ptr(), now, duration) }

Safety comment do not match requirements for `raw_forward`. We should
require that either we are in timer context, or the timer is stopped and
we have exclusive access.


Best regards,
Andreas Hindborg


