Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B0213B797;
	Wed, 23 Apr 2025 13:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413319; cv=none; b=Q9lxKZnqddg4In5YgRx7czKmNtjv4g5HNTd6KYPmVy3m1jRHlfa+u4rTUkNNXJvfXMc7B6yk1Ltzs8Xijqo6m1N1g6PsAcW1f8RAUjK8JhFltZIQmbxngK549+yOuGsI72+2zRiLc4/Or2JJNLUv89SvRI+mFqxBS/LEIa3a5aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413319; c=relaxed/simple;
	bh=nr7eK+0dqXRK1d1tXygpO9kC8XuZU4HynoNFnbIr94s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rYNqHtG4aw/AS9xhtNxf5NNGYGO6T62bvheb+0i64WQ9v2oKu+IxiP14u73e2bdmaxAPeZjRK0bwJ8g6hbYxPLrjXJRuy/9A08sxHKQom8o6jof3JhShjC+3heKSJn3djTmVjOLO0QFGfQSjKx93hmrGAjcR5+AMUkx7yj14ZGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GT6E4KPG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GT6E4KPG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B33C4CEE2;
	Wed, 23 Apr 2025 13:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745413319;
	bh=nr7eK+0dqXRK1d1tXygpO9kC8XuZU4HynoNFnbIr94s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GT6E4KPGX1gTcnndAeGg/LyYOg5GRjXy0BFKn0uMevUJmalFrX/Y5DwMLkQzJ4UhY
	 SsBr6/yh6rqk0JNhmM7aqtsv4GKeFz5kRNX/8lKlMpUjL3ax3eeDo65mWg8yKqI1pJ
	 RkGBXgb/E4HVJuankYkR9WPlFT3ojrT/KyJFeyoPDpja4HfrQXifk2xPnZQ8I3fjdC
	 JdgV58it8RiGMpsvMXg8z3jvgqZHB7wbRNICHBmt9j1XoBuW6FasR6HOHNi1hEiCQo
	 M4rCeTaU7q94mxNKs0MnE/SfTzNroT8ikSa/3evf6L6dOdono5GZPk4SOaV9WEL1HJ
	 lM9TszioR2lAg==
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
Subject: Re: [PATCH v2 8/8] rust: hrtimer: Add HrTimer::expires()
In-Reply-To: <20250415195020.413478-9-lyude@redhat.com> (Lyude Paul's message
	of "Tue, 15 Apr 2025 15:48:29 -0400")
References: <20250415195020.413478-1-lyude@redhat.com>
	<20250415195020.413478-9-lyude@redhat.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 23 Apr 2025 15:01:41 +0200
Message-ID: <87cyd3kp56.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Lyude Paul <lyude@redhat.com> writes:

> This adds the ability to read the expiry time of the given timer.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>
> ---
> V2:
> * Convert from Ktime to Instant
> * Use read_volatile instead of read and add a FIXME
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/time/hrtimer.rs | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index c84dcdacb4882..b8a74c15e6609 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -73,7 +73,10 @@
>      time::{Delta, Instant},
>      types::Opaque,
>  };
> -use core::{marker::PhantomData, ptr::NonNull};
> +use core::{
> +    marker::PhantomData,
> +    ptr::{addr_of, NonNull},
> +};
>  use pin_init::PinInit;
>  
>  /// A timer backed by a C `struct hrtimer`.
> @@ -136,7 +139,7 @@ unsafe fn raw_get(this: *const Self) -> *mut bindings::hrtimer {
>          // SAFETY: The field projection to `timer` does not go out of bounds,
>          // because the caller of this function promises that `this` points to an
>          // allocation of at least the size of `Self`.
> -        unsafe { Opaque::raw_get(core::ptr::addr_of!((*this).timer)) }
> +        unsafe { Opaque::raw_get(addr_of!((*this).timer)) }
>      }
>  
>      /// Cancel an initialized and potentially running timer.
> @@ -225,6 +228,21 @@ pub fn forward(&mut self, now: Instant, duration: Delta) -> u64 {
>      pub fn forward_now(&mut self, duration: Delta) -> u64 {
>          self.forward(self.clock_base().time(), duration)
>      }
> +
> +    /// Return the time expiry for this [`HrTimer`].
> +    ///
> +    /// This value should only be used as a snapshot, as the actual expiry time could change after
> +    /// this function is called.
> +    pub fn expires(&self) -> Instant {
> +        // SAFETY: `self` is an immutable reference and thus always points to a valid `HrTimer`.
> +        let c_timer_ptr = unsafe { HrTimer::raw_get(self) };
> +
> +        // SAFETY: There's no actual locking here, a racy read is fine and expected.
> +        Instant::from_nanos(unsafe {
> +            // FIXME: read_volatile

Please adopt similar wording as in `file.rs`:

        // This `read_volatile` is intended to correspond to a READ_ONCE call.
        // FIXME(read_once): Replace with `read_once` when available on the Rust side.


Best regards,
Andreas Hindborg


