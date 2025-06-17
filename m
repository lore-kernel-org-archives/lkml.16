Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39FD2980AC;
	Tue, 17 Jun 2025 11:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750158389; cv=none; b=GiQKKMVeKwDEcJpu/vHINVtlooop93KBhRcobw/9XZsPege7DDIIRLg/CP5PnPytK2yWeAm2swihUqUotlmfZ16cAvhVjuHDhFN1Rj4wACVa6DeLrvyYESSnrrHjkr/d+7zEqYIatBI54uuzhlJl4cydbM/KIkpC1bLrHh+ZaCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750158389; c=relaxed/simple;
	bh=1C4RRmc7ffNd2QpyjYUYw7u+vmX6TfyP5K837LcQEno=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uNsDDBXue6ckwtSHBgE6ERD+09j+rm7vNzrA/BrtHgwZpZyGx5DRnpN7uBVrIZktkUAFqUxJ61Yroqzdz7GXOFmxvMuKSWIuyMc0lenYpUnjN7p9D834RynBzyYpu38Xj2ew4mb+UmpqxeWXKK+aXeVFf2vSwWnMP4/VG4BI4mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXqpEiK2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXqpEiK2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E41C4CEE3;
	Tue, 17 Jun 2025 11:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750158389;
	bh=1C4RRmc7ffNd2QpyjYUYw7u+vmX6TfyP5K837LcQEno=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KXqpEiK2nFDL6/l9q3agJVUgyF/PKDx4TKPoZklTYYpTTxR+6siihPsgaHeImXAGg
	 89ZRjGrmRtxQziHAxlBw/xzh3WIvMp8ZfA1nwcrhztdKw7SIyTbs2OjFNwYnQmn900
	 YhUJ0nVlW/cMoou9y21okZuQ8UzM6fWYmJiJ58SsEgXmtK4TnG5xSLe7VEkZ05NPRd
	 3cypkmBQ0RkinuBfoGKjWssev+wVMhAfh+jtqI6308pKW6IERQxt31QsvjbyMiDDi/
	 9Fzq2sN1qW803AwD2EpYoWUlD89wHsaO3nD1pYaK6HhWtveuFZoCtuvnIw2E5Z+qu+
	 v1l8XxMmCSBmw==
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
Subject: Re: [PATCH v5 3/7] rust: hrtimer: Add HrTimer::raw_forward() and
 forward()
In-Reply-To: <20250613232754.451450-4-lyude@redhat.com> (Lyude Paul's message
	of "Fri, 13 Jun 2025 19:22:24 -0400")
References: <20250613232754.451450-1-lyude@redhat.com>
	<4Rf91KlM5JnN2uS8MTxNNV8J9cfytVsmWEZbqfkjQmTtSmXkj2pYyGt9Z8IrzTfjWuFTPIlfAbm1faXoY8X7fw==@protonmail.internalid>
	<20250613232754.451450-4-lyude@redhat.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 17 Jun 2025 13:06:18 +0200
Message-ID: <875xgubpat.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Lyude Paul" <lyude@redhat.com> writes:

> Within the hrtimer API there are quite a number of functions that can only
> be safely called from one of two contexts:
>
> * When we have exclusive access to the hrtimer and the timer is not active.
> * When we're within the hrtimer's callback context as it is being executed.
>
> This commit adds bindings for hrtimer_forward() for the first such context,
> along with HrTimer::raw_forward() for later use in implementing the
> hrtimer_forward() in the latter context.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>
> ---
> V4:
> * Fix the safety contract for raw_forward()
> * Require Pin<&mut Self>, not &mut self
> * Drop incorrect UniquePin example
> * Rewrite documentation a bit (re: Andreas)
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/time/hrtimer.rs | 48 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index c775d7abdf5ce..6fdd54e3328c5 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -168,6 +168,54 @@ pub(crate) unsafe fn raw_cancel(this: *const Self) -> bool {
>          // handled on the C side.
>          unsafe { bindings::hrtimer_cancel(c_timer_ptr) != 0 }
>      }
> +
> +    /// Forward the timer expiry for a given timer pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `self_ptr` must point to a valid `Self`.
> +    /// - The caller must either have exclusive access to the data pointed at by `self_ptr`, or be
> +    ///   within the context of the timer callback.
> +    #[inline]
> +    unsafe fn raw_forward(self_ptr: *mut Self, now: HrTimerInstant<T>, interval: Delta) -> u64
> +    where
> +        T: HasHrTimer<T>,
> +    {
> +        // SAFETY:
> +        // * The C API requirements for this function are fulfilled by our safety contract.
> +        // * `self_ptr` is guaranteed to point to a valid `Self` via our safety contract
> +        unsafe {
> +            bindings::hrtimer_forward(
> +                Self::raw_get(self_ptr),
> +                now.into_nanos(),
> +                interval.into_nanos(),
> +            )
> +        }
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
> +    /// timer when the timer is not running. For forwarding the timer from within the timer callback
> +    /// context, see [`HrTimerCallbackContext::forward()`].

I think rustdoc is going to complain about this link being broken. Can
you add the last sentence when add the target of the link?


Best regards,
Andreas Hindborg


