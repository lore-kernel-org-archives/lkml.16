Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F090426B2AC;
	Tue,  8 Apr 2025 12:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114590; cv=none; b=lpulfsTVT41RaxwOuPrHFQnGU320n5wWBVrIRQJMgBv31RnJ9+BgyI7lhPKWO5QxJi2l9noLDRjmHad1vOvuXtpfi92SyRkfN9U3ZETFzG6fHU/OWa3uIrmZz/JZl+qXjdB5eZu+/u14X4emO1M8SJnxpZHA/lAaff19rD94Izg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114590; c=relaxed/simple;
	bh=UsnamNtyMGWPnhoDLyNMwCNSIhqt/b+YpGx3Fo5xz5I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gw3GcYpWIpNNP25pisCaCO9JH93Gp1H4zUJM4HuKudEkZX3yeVxiOyALat865p0+SU07HK7gLsjMsKf7/z7/EM9j8pN/ISPxAj6ZQ3ZilHb8z2t5ocsubd9FG5k18yLNWpE6PX1RFMC48y6rW/YklGrpI3oG4BhkrYnvTGxKJvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HmR7bAEi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HmR7bAEi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1FF6C4CEE5;
	Tue,  8 Apr 2025 12:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744114589;
	bh=UsnamNtyMGWPnhoDLyNMwCNSIhqt/b+YpGx3Fo5xz5I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HmR7bAEixc6ae5PcAUys9z8YZnj1plyunvFyCt7LFJC3eOp5FFxyw54A8opmVvdFs
	 2gLPzFu+HrmYN8qssn7ZwfBz8NOnGbaT4HTGBhdS8iTijHU/ZAiBxTz5+btq+BN/pb
	 PmqN8kcsycLPzypbU+yfQUdvDgGKz34W8yHn8/ywt8SvGfAMlTL9q1vFuE2AGAijNG
	 tdEBlMwOGvd2sWuOipXCKJn0noC5OYIZt+NksbPznVGRJ8C87h1APoHtfhdYrEVOIa
	 Ti7n0u+NFKHcNlSM04lVCIK0fAYXUOxYAuiz6l0JHv9obdWuWyEvKqJsiubQ7DeCaN
	 ltZJizemgp01g==
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
Subject: Re: [PATCH 5/6] rust: hrtimer: Add
 HrTimerCallbackContext::forward_now()
In-Reply-To: <20250402214109.653341-6-lyude@redhat.com> (Lyude Paul's message
	of "Wed, 02 Apr 2025 17:40:33 -0400")
References: <20250402214109.653341-1-lyude@redhat.com>
	<ueJj8pB3-60QYEeE32Pwj6WbKiQxl-QHl00w_LNM-B8dLzepPgIw-WWNeD1z7Fz4RxQBUKCo7CGf8YDKnqslDg==@protonmail.internalid>
	<20250402214109.653341-6-lyude@redhat.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 08 Apr 2025 14:05:28 +0200
Message-ID: <878qoaj1tj.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Lyude Paul" <lyude@redhat.com> writes:

> Using the HrTimerClockBase::time() function we just added, add a binding
> for hrtimer_forward_now().
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/time/hrtimer.rs | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index 521ff1a8a5aa8..d52cbb6cfc57f 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -556,6 +556,14 @@ pub fn forward(&self, now: Ktime, interval: Ktime) -> u64 {
>          // SAFETY: The C API requirements for this function are fulfilled by our type invariants.
>          unsafe { bindings::hrtimer_forward(self.raw_get_timer(), now.to_ns(), interval.to_ns()) }
>      }
> +
> +    /// Forward the time expiry so it expires after now.

I would suggest "so it expires at `duration (if renamed)` after now.`

> +    ///
> +    /// This is a variant of [`HrTimerCallbackContext::forward()`] that uses an interval after the
> +    /// current time of the [`HrTimerClockBase`] for this [`HrTimerCallbackContext`].
> +    pub fn forward_now(&self, interval: Ktime) -> u64 {

I think we should rename `interval` to `duration`, that will match the
upcoming changes to `Ktime`.


Best regards,
Andreas Hindborg



