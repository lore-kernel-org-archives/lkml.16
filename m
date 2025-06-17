Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47FA22A819;
	Tue, 17 Jun 2025 11:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750160076; cv=none; b=ULPBJDSVQrcapqrup2BwakQwOjhRmH4I/eaISl8hrN+8fC0RYIy1dFYqfZcLUNaA0pKtm7khcTW2aZfqoOp2Fl+0lHPavN1teZAwPZ5sadTv1f2cQa7k7YsJCsOtxH7jprsAP8sPge1x4ICI/RvaU3Sd6VlOkkIrHKv91q/f8eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750160076; c=relaxed/simple;
	bh=DRJcE8diTniQcTLE6xqu8Zzg2MNnUbfcHwoL3VgRNTc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rSsSrFJvnAt42AsAC5clsQjDxHii0umbL7yJUCN4K7TXR4v+ciaS1TwxBBzIl0b6nxJhUrXVlHLtZ+i4EkyiUQjJpLYl6jrwCmf1FSd0GB510/OW8zJlrhblvEyIzyxN6r1/PAlJUbnVk8Zh9SSrDKENwbC7aGbJP7BAZ0yrUFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FmnHSsxj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FmnHSsxj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB8DC4CEE3;
	Tue, 17 Jun 2025 11:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750160075;
	bh=DRJcE8diTniQcTLE6xqu8Zzg2MNnUbfcHwoL3VgRNTc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FmnHSsxj+sDM8fByicA7sTRUUIfHFIo3rk9UyEVTcmAPSeKg61Nxx8cA1cC6p+VYD
	 0u3ZTQumKrGkne5eLRC9dTlecL+Bc4yFxkou1MuUigt/Lm9lZYevDOy1NF0q07704Y
	 LXxIx3cNCcr5HS89IlbyWUL+GTCWgyDd6OjtNqxpZYo3zHygNOmZts5iZxtzOEWSaT
	 kjNzcaDRiW5FCRVl+3BGtBOY3w6fxcneojook3ffwDtr7IVuiVVGMqQWL8uMQO2aR5
	 TfUbWIjBnc7dWBck29nE4AN/DVNC2YNx1bvo/Ludb/o6ye9j4HMNg5fZzb0DED7psP
	 SfOHN0wbcpb/g==
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
Subject: Re: [PATCH v5 7/7] rust: hrtimer: Add forward_now() to HrTimer and
 HrTimerCallbackContext
In-Reply-To: <20250613232754.451450-8-lyude@redhat.com> (Lyude Paul's message
	of "Fri, 13 Jun 2025 19:22:28 -0400")
References: <20250613232754.451450-1-lyude@redhat.com>
	<tukN4NRM_8_XSWRUL0WKgutHrMffeR3pGmMvHvbv4ZHQV9e_RWpvsThzkuMPpEilIyLqwliZydhO1FaQtwfNQA==@protonmail.internalid>
	<20250613232754.451450-8-lyude@redhat.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 17 Jun 2025 13:34:21 +0200
Message-ID: <87jz5aa9fm.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Lyude Paul" <lyude@redhat.com> writes:

> Using the HrTimer::raw_time_cb() function, we can now add an equivalent to

You called it `raw_cb_time`.

> hrtimer_forward_now() to both HrTimer and HrTimerCallbackContext.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>
> ---
> V2:
> * Change from Ktime to Delta
> * Make sure that forward_now() takes a mutable reference to the timer
>   struct
> * Reword this to point out that we're adding forward_now() to both callback
>   context and mutable timer reference
> * Rename interval to duration
>
> V4:
> * Fix rust documentation for HrTimerCallbackContext (forgot to update both
>   forward_now() declarations)
> * Use Pin<&mut Self> for context-less forward.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/time/hrtimer.rs | 58 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 57 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index 79d86e1099a1e..0908359b0550a 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -201,7 +201,6 @@ unsafe fn raw_forward(self_ptr: *mut Self, now: HrTimerInstant<T>, interval: Del
>      /// - The caller must ensure that the `hrtimer_clock_base` cannot possibly change in the context
>      ///   this function is being called in. This means either exclusive access to `self_ptr` is
>      ///   required, or we must be from within the timer callback context of `self_ptr`.
> -    #[expect(unused)]
>      unsafe fn raw_cb_time(self_ptr: *const Self) -> HrTimerInstant<T>
>      where
>          T: HasHrTimer<T>,
> @@ -243,6 +242,44 @@ pub fn forward(self: Pin<&mut Self>, now: HrTimerInstant<T>, interval: Delta) ->
>          //   exclusive access to it - fulfilling the requirements of the C API.
>          unsafe { Self::raw_forward(self.get_unchecked_mut(), now, interval) }
>      }
> +
> +    /// Conditionally forward the timer.
> +    ///
> +    /// This is a variant of [`forward()`](Self::forward) that uses an interval after the current
> +    /// time of the base clock for the [`HrTimer`].
> +    pub fn forward_now(self: Pin<&mut Self>, interval: Delta) -> u64
> +    where
> +        T: HasHrTimer<T>,
> +    {
> +        // SAFETY: `self` is a mutable reference, guaranteeing it is both a valid pointer to Self
> +        // and that we also have exclusive access to `self`.
> +        let now = unsafe { Self::raw_cb_time(&*self.as_ref()) };
> +
> +        self.forward(now, interval)
> +    }
> +
> +    /// Return the time expiry for this [`HrTimer`].
> +    ///
> +    /// This value should only be used as a snapshot, as the actual expiry time could change after
> +    /// this function is called.
> +    pub fn expires(&self) -> HrTimerInstant<T>

Commit message does not mention this method.


Best regards,
Andreas Hindborg


