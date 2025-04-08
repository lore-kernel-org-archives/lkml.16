Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A218225F97B;
	Tue,  8 Apr 2025 12:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114601; cv=none; b=ZXDy0V+miEK19QOx+Wplql1XKMR+M66Oj3KFvYHyK2Eq6xUBXlAAe7ksESBq3qDp4MFbW6qvlN6WAJ2vveKuzeOU0+GpWNaonQXG/wQryUxGNYoXSjiAbVqZnd0mR6irjANZB21uDhB7jiHIVed6t4KvOq5fpnguphcAmUs1tyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114601; c=relaxed/simple;
	bh=EbRZZtx0yMqPw1jeJu6P2lHgOXGS+rmiFw3DwcWHRUc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SxMbzYqmy232//a1bGRdAKewo4zPPpI9CvpVhUBnES6Oc5io4ApqB5NAyWD13mPEQy5RlSbonryW7nOsB09rlzo/U361aov3oOsYyNg3knkugTrCKOFBhnnbZ8158Imuvh1JsUk0oAjTRwRVHINDmMA9/vOLfquWb3bCC84v1r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aP4jRhVs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aP4jRhVs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39842C4CEE5;
	Tue,  8 Apr 2025 12:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744114601;
	bh=EbRZZtx0yMqPw1jeJu6P2lHgOXGS+rmiFw3DwcWHRUc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aP4jRhVsla0f1nxF2ccOrSVMaIq+qtRBLafwDMeByRCD9/oUdKtu/Rp53AByEC0vX
	 331l5xTCZE9ogZE+KhFlrQctlvGIoanB5CNgXIetGYirYJJ/UsOrAAV3//lEhxPEQN
	 Me/S16sppLGa59dUKflPlCqWgQ0d8Hnp/VcmTkTVqCIEKOfP3uPKNpCzr0frcos5wc
	 7RsNKKu0VVcWVdz0dwUqfgEwofDKrs2dSArePj4cQT79VCwOq2J1yjcFfDAN2gtHoM
	 ANAiU5cDiV5JPf2xRbGtShW9vECHjaZufKA5N3sE6j7KLesVeXL4ZLqmD+icJD50yC
	 wtaabcW67r8AQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>
Cc: <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  "Boqun Feng" <boqun.feng@gmail.com>,  "Frederic Weisbecker"
 <frederic@kernel.org>,  "Thomas Gleixner" <tglx@linutronix.de>,
  "Anna-Maria Behnsen" <anna-maria@linutronix.de>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>
Subject: Re: [PATCH 2/6] rust: hrtimer: Add HrTimerCallbackContext and
 ::forward()
In-Reply-To: <20250402214109.653341-3-lyude@redhat.com> (Lyude Paul's message
	of "Wed, 02 Apr 2025 17:40:30 -0400")
References: <20250402214109.653341-1-lyude@redhat.com>
	<AVQT2wHP9t48ZH5r3ywLh-pwv0IGUraoDxWO8KXcxL_y3mE-0YmWlQjLMvP6JBYxG3_1SYJL4Fxp1jc788HniA==@protonmail.internalid>
	<20250402214109.653341-3-lyude@redhat.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 08 Apr 2025 13:47:42 +0200
Message-ID: <87v7rej2n5.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Lyude Paul" <lyude@redhat.com> writes:

> With Linux's hrtimer API, certain functions require we either acquire
> proper locking to call specific methods - or that we call said methods from
> the context of the timer callback. hrtimer_forward() is one of these
> functions, so we start by adding a new HrTimerCallbackContext type which
> provides a way of calling these methods that is inaccessible outside of
> hrtimer callbacks.

Based on tglx comment, we should be able to call this function if the
timer is stopped and we have a unique ownership of the timer. Do you
want to add that? If not, could you add a note about this somewhere?

>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/time/hrtimer.rs         | 50 +++++++++++++++++++++++++++--
>  rust/kernel/time/hrtimer/arc.rs     |  7 +++-
>  rust/kernel/time/hrtimer/pin.rs     |  7 +++-
>  rust/kernel/time/hrtimer/pin_mut.rs |  9 ++++--
>  rust/kernel/time/hrtimer/tbox.rs    |  7 +++-
>  5 files changed, 73 insertions(+), 7 deletions(-)
>
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index 4fc49f1931259..c92b10524f892 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -69,7 +69,7 @@
>
>  use super::ClockId;
>  use crate::{init::PinInit, prelude::*, time::Ktime, types::Opaque};
> -use core::marker::PhantomData;
> +use core::{marker::PhantomData, ptr::NonNull};
>
>  /// A timer backed by a C `struct hrtimer`.
>  ///
> @@ -279,7 +279,10 @@ pub trait HrTimerCallback {
>      type Pointer<'a>: RawHrTimerCallback;
>
>      /// Called by the timer logic when the timer fires.
> -    fn run(this: <Self::Pointer<'_> as RawHrTimerCallback>::CallbackTarget<'_>) -> HrTimerRestart
> +    fn run<T>(
> +        this: <Self::Pointer<'_> as RawHrTimerCallback>::CallbackTarget<'_>,
> +        ctx: HrTimerCallbackContext<'_, T>
> +    ) -> HrTimerRestart
>      where
>          Self: Sized;
>  }
> @@ -470,6 +473,49 @@ fn into_c(self) -> bindings::hrtimer_mode {
>      }
>  }
>
> +/// Privileged smart-pointer for a [`HrTimer`] callback context.
> +///
> +/// This provides access to various methods for a [`HrTimer`] which can only be safely called within
> +/// its callback.
> +///
> +/// # Invariants
> +///
> +/// * The existence of this type means the caller is currently within the callback for a
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

Missing `// INVARIANT` comment.

> +        Self(unsafe { NonNull::new_unchecked(timer) }, PhantomData)
> +    }
> +
> +    /// Get the raw `bindings::hrtimer` pointer for this [`HrTimerCallbackContext`].
> +    pub(crate) fn raw_get_timer(&self) -> *mut bindings::hrtimer {
> +        // SAFETY: By our type invariants, `self.0` always points to a valid [`HrTimer<T>`].
> +        unsafe { HrTimer::raw_get(self.0.as_ptr()) }
> +    }
> +
> +    /// Forward the timer expiry so it will expire in the future.
> +    ///
> +    /// Note that this does not requeue the timer, it simply updates its expiry value. It returns
> +    /// the number of overruns that have occurred as a result of the expiry change.
> +    pub fn forward(&self, now: Ktime, interval: Ktime) -> u64 {
> +        // SAFETY: The C API requirements for this function are fulfilled by our type invariants.
> +        unsafe { bindings::hrtimer_forward(self.raw_get_timer(), now.to_ns(), interval.to_ns()) }
> +    }
> +}
> +
>  /// Use to implement the [`HasHrTimer<T>`] trait.
>  ///
>  /// See [`module`] documentation for an example.
> diff --git a/rust/kernel/time/hrtimer/arc.rs b/rust/kernel/time/hrtimer/arc.rs
> index 4a984d85b4a10..7dd9f46a0720d 100644
> --- a/rust/kernel/time/hrtimer/arc.rs
> +++ b/rust/kernel/time/hrtimer/arc.rs
> @@ -3,6 +3,7 @@
>  use super::HasHrTimer;
>  use super::HrTimer;
>  use super::HrTimerCallback;
> +use super::HrTimerCallbackContext;
>  use super::HrTimerHandle;
>  use super::HrTimerPointer;
>  use super::RawHrTimerCallback;
> @@ -95,6 +96,10 @@ impl<T> RawHrTimerCallback for Arc<T>
>          //    allocation from other `Arc` clones.
>          let receiver = unsafe { ArcBorrow::from_raw(data_ptr) };
>
> -        T::run(receiver).into_c()
> +        // SAFETY: By C API contract `ptr` is the pointer we passed when queuing the timer, so it is
> +        // a `HrTimer<T>` embedded in a `T`.

This safety comment does not match the safety requirements for the
unsafe fn we call.

> +        let context = unsafe { HrTimerCallbackContext::from_raw(timer_ptr) };
> +
> +        T::run(receiver, context).into_c()
>      }
>  }
> diff --git a/rust/kernel/time/hrtimer/pin.rs b/rust/kernel/time/hrtimer/pin.rs
> index f760db265c7b5..a8e1b76bf0736 100644
> --- a/rust/kernel/time/hrtimer/pin.rs
> +++ b/rust/kernel/time/hrtimer/pin.rs
> @@ -3,6 +3,7 @@
>  use super::HasHrTimer;
>  use super::HrTimer;
>  use super::HrTimerCallback;
> +use super::HrTimerCallbackContext;
>  use super::HrTimerHandle;
>  use super::RawHrTimerCallback;
>  use super::UnsafeHrTimerPointer;
> @@ -99,6 +100,10 @@ impl<'a, T> RawHrTimerCallback for Pin<&'a T>
>          // here.
>          let receiver_pin = unsafe { Pin::new_unchecked(receiver_ref) };
>
> -        T::run(receiver_pin).into_c()
> +        // SAFETY: By C API contract `ptr` is the pointer we passed when queuing the timer, so it is
> +        // a `HrTimer<T>` embedded in a `T`.

Same as above.

> +        let context = unsafe { HrTimerCallbackContext::from_raw(timer_ptr) };
> +
> +        T::run(receiver_pin, context).into_c()
>      }
>  }
> diff --git a/rust/kernel/time/hrtimer/pin_mut.rs b/rust/kernel/time/hrtimer/pin_mut.rs
> index 90c0351d62e4b..2dd2ebfd7efaf 100644
> --- a/rust/kernel/time/hrtimer/pin_mut.rs
> +++ b/rust/kernel/time/hrtimer/pin_mut.rs
> @@ -1,7 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  use super::{
> -    HasHrTimer, HrTimer, HrTimerCallback, HrTimerHandle, RawHrTimerCallback, UnsafeHrTimerPointer,
> +    HasHrTimer, HrTimer, HrTimerCallback, HrTimerCallbackContext, HrTimerHandle, RawHrTimerCallback,
> +    UnsafeHrTimerPointer,
>  };
>  use crate::time::Ktime;
>  use core::{marker::PhantomData, pin::Pin, ptr::NonNull};
> @@ -103,6 +104,10 @@ impl<'a, T> RawHrTimerCallback for Pin<&'a mut T>
>          // here.
>          let receiver_pin = unsafe { Pin::new_unchecked(receiver_ref) };
>
> -        T::run(receiver_pin).into_c()
> +        // SAFETY: By C API contract `ptr` is the pointer we passed when queuing the timer, so it is
> +        // a `HrTimer<T>` embedded in a `T`.

Again.

> +        let context = unsafe { HrTimerCallbackContext::from_raw(timer_ptr) };
> +
> +        T::run(receiver_pin, context).into_c()
>      }
>  }
> diff --git a/rust/kernel/time/hrtimer/tbox.rs b/rust/kernel/time/hrtimer/tbox.rs
> index 2071cae072342..e3214f7173beb 100644
> --- a/rust/kernel/time/hrtimer/tbox.rs
> +++ b/rust/kernel/time/hrtimer/tbox.rs
> @@ -3,6 +3,7 @@
>  use super::HasHrTimer;
>  use super::HrTimer;
>  use super::HrTimerCallback;
> +use super::HrTimerCallbackContext;
>  use super::HrTimerHandle;
>  use super::HrTimerPointer;
>  use super::RawHrTimerCallback;
> @@ -115,6 +116,10 @@ impl<T, A> RawHrTimerCallback for Pin<Box<T, A>>
>          //   `data_ptr` exist.
>          let data_mut_ref = unsafe { Pin::new_unchecked(&mut *data_ptr) };
>
> -        T::run(data_mut_ref).into_c()
> +        // SAFETY: By C API contract `ptr` is the pointer we passed when queuing the timer, so it is
> +        // a `HrTimer<T>` embedded in a `T`.

Also here.

> +        let context = unsafe { HrTimerCallbackContext::from_raw(timer_ptr) };
> +
> +        T::run(data_mut_ref, context).into_c()
>      }
>  }


Best regards,
Andreas Hindborg


