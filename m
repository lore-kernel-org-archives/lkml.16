Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8401EDA3C;
	Tue, 17 Jun 2025 11:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750159851; cv=none; b=NT4miekeSdjRiBjwDQJQeq65ts9dQcSm07QVQ4ckS38eWf0FzOv41PjOgZmsdsL5MFUbJnPSkI39svUpGK9EkOdAddPhLaYeAt8qr1xyCKI3NDRDkf//dlIFa1Wl2u7HOCUCLyTDGwBJ7fOZOfwD8wbpTAPhngkMFf6RzUvv3XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750159851; c=relaxed/simple;
	bh=6U82WYyW+bhJEQaJbsyh/F0bmSo9xdIKxkvx8FzUrWg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VVsdeJgGiw1NNxFxj3LxEq6yQ7R+RVPZbTZsFvJr6LLAECc8Ky0r5cG3m3T9n2DY8e7oN02rAln0pI+hPHzJSSQyTGg1y57PfPmpgZmLaK42Z5AY3IwYalRRH/vg4biq5KkiQV4oNY6rjdaxJkElyqSREURMiajrNVAf4sGcmKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKAbfP9z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKAbfP9z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD78C4CEE3;
	Tue, 17 Jun 2025 11:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750159851;
	bh=6U82WYyW+bhJEQaJbsyh/F0bmSo9xdIKxkvx8FzUrWg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AKAbfP9zRX8b53yeE8YUQpsTbbsvPXHCVm0IrQQJK5snVEHuHh7R9YwsQD4a07jBL
	 sslikHOZytcgBHWrniW+akefv103y5y36xjYDsJ+/1mnoXNW/saqijKbsrdBsP8tHn
	 YAZje4Q4ZdOWW4rKpTp+GGFvFSWSU62cES8f3rO29IdbP77RO0xQWLaXshMMspgI8N
	 QBpMpzNCsVrApHxk/BOgBhiFaGmQetaT7zObmsev6cEeukZhYQzce3nH/R1vYc7WG5
	 dIEN3XgcsETdKyHS3dOjic4/d04+l+c6Y4H76TCUiZkpIZUFFqzLtRKbF6287Q0qJB
	 G/56cJ6H5iJMQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>
Cc: <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  "Boqun Feng" <boqun.feng@gmail.com>,  "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>,  "Frederic Weisbecker" <frederic@kernel.org>,
  "Thomas Gleixner" <tglx@linutronix.de>,  "Anna-Maria Behnsen"
 <anna-maria@linutronix.de>,  "John Stultz" <jstultz@google.com>,  "Stephen
 Boyd" <sboyd@kernel.org>,  "Miguel Ojeda" <ojeda@kernel.org>,  "Alex
 Gaynor" <alex.gaynor@gmail.com>,  "Gary Guo" <gary@garyguo.net>,
  =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>,  "Benno Lossin" <lossin@kernel.org>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 6/7] rust: hrtimer: Add HrTimer::raw_cb_time()
In-Reply-To: <20250613232754.451450-7-lyude@redhat.com> (Lyude Paul's message
	of "Fri, 13 Jun 2025 19:22:27 -0400")
References: <20250613232754.451450-1-lyude@redhat.com>
	<4TbClQnbyQckuIEF2SqIwmeX5XIEl_pAJVKS5S7JCGA1OCWbA1vTjhPs6NDpQQ9RlUvb79n00_21CV2PTi-ZWQ==@protonmail.internalid>
	<20250613232754.451450-7-lyude@redhat.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 17 Jun 2025 13:30:43 +0200
Message-ID: <87plf2a9lo.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Lyude Paul" <lyude@redhat.com> writes:

> This is a simple private unsafe wrapper for retrieving the current time
> according to the hrtimer_clock_base struct for a given timer. This will be
> used for implementing functions such as forward_now(), which rely on
> retrieving the current time from the hrtimer's clock base.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>
> ---
> V2:
> - Convert safety comment to invariant comment in from_raw()
> - Add raw_clock_base() and implement clock_base() on HrTimer<T> as well
>
> V4:
> - Drop HrTimerClockBase entirely, reword commit as this is now about adding
>   raw_cb_time()
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/time.rs         |  1 -
>  rust/kernel/time/hrtimer.rs | 27 +++++++++++++++++++++++++++
>  2 files changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index eed77297d58a6..27ee78070d72e 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -209,7 +209,6 @@ pub(crate) fn into_nanos(self) -> i64 {
>      /// # Safety
>      ///
>      /// The caller promises that `nanos` is in the range from 0 to `KTIME_MAX`.
> -    #[expect(unused)]
>      #[inline]
>      pub(crate) unsafe fn from_nanos(nanos: i64) -> Self {
>          debug_assert!(nanos >= 0);
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index 4a8416fbd187d..79d86e1099a1e 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -193,6 +193,33 @@ unsafe fn raw_forward(self_ptr: *mut Self, now: HrTimerInstant<T>, interval: Del
>          }
>      }
>
> +    /// Retrieve the current time according to the `struct hrtimer_clock_base` for `self_ptr`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `self_ptr` must point to a valid `Self`.
> +    /// - The caller must ensure that the `hrtimer_clock_base` cannot possibly change in the context
> +    ///   this function is being called in. This means either exclusive access to `self_ptr` is
> +    ///   required, or we must be from within the timer callback context of `self_ptr`.
> +    #[expect(unused)]
> +    unsafe fn raw_cb_time(self_ptr: *const Self) -> HrTimerInstant<T>

Can we call it `raw_clock_base_time`?

> +    where
> +        T: HasHrTimer<T>,
> +    {
> +        // SAFETY: We're guaranteed `self_ptr` points to a valid `Self` by our safety contract.
> +        let clock_base = unsafe { (*Self::raw_get(self_ptr)).base };
> +
> +        // SAFETY: The C API guarantees that `get_time` is initialized to a valid function pointer
> +        // for as long as we expose hrtimers to users.
> +        let get_time_fn = unsafe { (*clock_base).get_time.unwrap_unchecked() };
> +
> +        // SAFETY:
> +        // - get_time_fn() returns a ktime_t, so we're guaranteed its return value is between `0`
> +        //   and `KTIME_MAX`.
> +        // - get_time_fn() itself has no special requirements.
> +        unsafe { Instant::from_nanos(get_time_fn()) }
> +    }
> +

How does this differ from Instant<C>::now()? Could we do this statically
by going through `<<T as HasHrTimer<T>>::TimerMode as HrTimerMode>::Clock`?


Best regards,
Andreas Hindborg


