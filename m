Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC1E54BC6;
	Tue, 17 Jun 2025 11:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750159855; cv=none; b=sME85S1cEvQSTEHC9+kq1gTaRG3PhrXeB+G7qI79TJAXN386IZT0b+9MmuermgLEHnMpZ5gdMMAU7mdeB00X4v4zHaMZ7qTqep37M2XedNzeQhVN6qQWVHITzdUxLLGG0tV1mbNDIx6b4QgI7zIWkI8VJezaWU6AjVwByz/a2zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750159855; c=relaxed/simple;
	bh=iMCb50p7rxnXbxnr7XiM6CNnSH2nQCxIWIt2MGYN5As=;
	h=From:To:Cc:Subject:In-Reply-To:Message-ID:References:Date:
	 MIME-Version:Content-Type; b=LFJ0d+GxWcW04C+pxGgMfsozAgZS5suQRD6XM1k9OxxRC8AphTzCoBJ+bUdVdWUS4y+FOi5kuvnN2PYSWr37SUUDHIzK7JEh+9JIXxBSdKJkorWdcBU9sOCQtWwUFPtWpNgdW3Xp07UtdlFXmS7ieJvCgaLmdIcSalydEcqqhlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWvt+4P5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWvt+4P5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C225EC4CEE3;
	Tue, 17 Jun 2025 11:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750159855;
	bh=iMCb50p7rxnXbxnr7XiM6CNnSH2nQCxIWIt2MGYN5As=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oWvt+4P5MOB/NKAmeXPWbhzsR5dXBJYYEj5CYNgwo3rzLokLdk+88C+u1XVah0dfG
	 kXSkHUF/GQDGepciGpsoFThUaIKVZoHHtPKmpgLv02EqBGY4RnttJzDElR+yMlcQRd
	 gLnzS9SUj+vrXmRXJiHz1AF6FFSostl0bb01eYiOJH+yP37LIXxe+GlkdGuXdzQgAa
	 B3W/NOr++IC4isr/AVPRRJh2Mn5U9p4FvRUv9Rhns8fS1/+TY5SPkp7QkCfTzLXheS
	 SN6WkPEFS8VU+WqP7IEFJlPuNek5I1tHNViQP9pcpdDyF6XN2HpuyBpMdDgsicR2AF
	 5ygYqHaXQzUTQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>
Cc: <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  "Boqun Feng" <boqun.feng@gmail.com>,  "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>,  "Frederic Weisbecker" <frederic@kernel.org>,
  "Thomas Gleixner" <tglx@linutronix.de>,  "Anna-Maria Behnsen"
 <anna-maria@linutronix.de>,  "John Stultz" <jstultz@google.com>,  "Stephen
 Boyd" <sboyd@kernel.org>,  "Miguel Ojeda" <ojeda@kernel.org>,  "Alex
 Gaynor" <alex.gaynor@gmail.com>,  "Gary Guo" <gary@garyguo.net>,
  =?us-ascii?Q?=3D=3Futf-8=3FQ=3FBj=3DC3=3DB6rn=3F=3D?=
 Roy Baron <bjorn3_gh@protonmail.com>,  "Benno Lossin" <lossin@kernel.org>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 4/7] rust: hrtimer: Add HrTimerCallbackContext and
 ::forward()
In-Reply-To: <20250613232754.451450-5-lyude@redhat.com> (Lyude Paul's message
	of "Fri, 13 Jun 2025 19:22:25 -0400")
Message-ID: <87zfe6aa7p.fsf@kernel.org>
References: <20250613232754.451450-1-lyude@redhat.com>
	<h8NJ9qEtwXmyXhSHgSUHG-Ua6wXYwU32JNhko7b1XULEnNAcnwLQIrylV87Wpl-35r0kPa33Fo0pTi5CvwCzEA==@protonmail.internalid>
	<20250613232754.451450-5-lyude@redhat.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 17 Jun 2025 13:18:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Lyude Paul" <lyude@redhat.com> writes:

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
> V2:
> * Improve SAFETY comments for HrTimerCallbackContext uses (I forgot to
>   mention that we're within RawHrTimerCallback::run()
> * Split forward into forward() and raw_forward() since we're going to have
>   two contexts that we can call forward() from now.
> * Clarify contexts in which certain hrtimer methods can be called.
> * Make sure that we use a mutable reference for forward() here - just in
>   case :).
> * Rename interval to duration
> V3:
> * Rename duration -back- to interval (now that I actually have read
>   hrtimer_forward's source, interval does make more sense than duration
>   considering the fact we return the number of overruns that occurred
>   according to the given interval).
> * Rewrite documentation a bit (re: Andreas)
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/time/hrtimer.rs         | 62 ++++++++++++++++++++++++++++-
>  rust/kernel/time/hrtimer/arc.rs     |  9 ++++-
>  rust/kernel/time/hrtimer/pin.rs     |  9 ++++-
>  rust/kernel/time/hrtimer/pin_mut.rs | 12 ++++--
>  rust/kernel/time/hrtimer/tbox.rs    |  9 ++++-
>  5 files changed, 93 insertions(+), 8 deletions(-)
>
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index 6fdd54e3328c5..4a8416fbd187d 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -69,7 +69,7 @@
>
>  use super::{ClockSource, Delta, Instant};
>  use crate::{prelude::*, types::Opaque};
> -use core::marker::PhantomData;
> +use core::{marker::PhantomData, ptr::NonNull};
>  use pin_init::PinInit;
>
>  /// A type-alias to refer to the [`Instant<C>`] for a given `T` from [`HrTimer<T>`].
> @@ -353,7 +353,10 @@ pub trait HrTimerCallback {
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
> @@ -619,6 +622,61 @@ impl<C: ClockSource> HrTimerMode for RelativePinnedHardMode<C> {
>      type Expires = Delta;
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

The lifetime of the returned value is unbounded, so I think we need to add:

  The returned `Self` must not outlive the function context of
  `RawHrTimerCallback::run` where this function is called.

Or something to that effect. What do you think?

> +    pub(crate) unsafe fn from_raw(timer: *mut HrTimer<T>) -> Self {
> +        // SAFETY: The caller guarantees `timer` is a valid pointer to an initialized
> +        // `bindings::hrtimer`

We need to have an `# Invariant` section here.

> +        Self(unsafe { NonNull::new_unchecked(timer) }, PhantomData)
> +    }
> +
> +    /// Conditionally forward the timer.
> +    ///
> +    /// If the timer expires after `now`, this function does nothing and returns 0. If the timer
> +    /// expired at or before `now`, this function forwards the timer by `interval` until the timer
> +    /// expires after `now` and then returns the number of times the timer was forwarded by
> +    /// `interval`.
> +    ///
> +    /// This function is mainly useful for timer types which can provide exclusive access to the
> +    /// timer when the timer is not running. For forwarding the timer when you have exclusive access
> +    /// to the timer, see [`HrTimer::forward()`].
> +    ///
> +    /// Returns the number of overruns that occurred as a result of the timer expiry change.

Maybe we should just drop a link to `HrTimer::forward` for the docs
here? Or are we OK duplicating these docs?


Best regards,
Andreas Hindborg


