Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE061D90DF;
	Wed, 23 Apr 2025 12:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745410420; cv=none; b=oWOc1BaJIcil32AmjAuab4yn3Q665zIQVJOZS0w3w7lXO2o5yyOn3IuxgKviIOw8LSOxcnt7NeF/RVK0zKFP6cbMc4s2AxBArhQI6GxENRKJfDvbIVOfBBQ3vyKhRchbq2Et+8T0Xn5V+N+AKOM50MpCP7J82f7K1iP3JXp+GwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745410420; c=relaxed/simple;
	bh=ie25swbCMytjz5HDEWQYENjaFL7uOc8t4ya3tafvnNw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LCSpFg2mYW9dn5ciRZF8yvZUmTmoYTkjVPlTtMWTxFb/6NOELCoATgLuvpX6S4q+3Mlig4Dyth4+i7wswFM7jtMfboQE0jAWFrPu1ZxPwzv2M5PNtnW4lutwbr74DJ7MQa2znqagdbNuzsCcRWUGz3s2/CGiNZHqV/n4lWAY90M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u0xzUWRt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u0xzUWRt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BCDC4CEEC;
	Wed, 23 Apr 2025 12:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745410420;
	bh=ie25swbCMytjz5HDEWQYENjaFL7uOc8t4ya3tafvnNw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=u0xzUWRtCw5nvQZp7fYFRX1J3VoFddTZX6AsGncQ4coGKcbrzjhennmxIk11Loyz9
	 gNlaV0l2cd5dYI5VTDCTvaOGLDDRceLdRCO4onGZAaOvRiKAmulKKpF2f0vLxair3p
	 GK2GMA3FLTsRbCKgJyGwQ0+TIXvTPj8NqE1Sl1K+jZ2QXQf3Z9ddHNYm0GDp+VZYx4
	 o+ScdLQf21zxA0aOCGWX9swbhoyDa/kMF/Qd5+BKcGE+pCVrjsx6QllF0tgEgchcI8
	 NQNWW4cpCMZRJCQWcqQ1W8IhCwvgtl3C5jzgTrzyJMZVXltzfsZV98oswaJKPzZLKa
	 rpXHPl3A1S9wQ==
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
Subject: Re: [PATCH v2 2/8] rust: hrtimer: Add HrTimer::raw_forward() and
 forward()
In-Reply-To: <20250415195020.413478-3-lyude@redhat.com> (Lyude Paul's message
	of "Tue, 15 Apr 2025 15:48:23 -0400")
References: <20250415195020.413478-1-lyude@redhat.com>
	<20250415195020.413478-3-lyude@redhat.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 23 Apr 2025 14:13:22 +0200
Message-ID: <87frhzm5y5.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Lyude Paul <lyude@redhat.com> writes:

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
> Since we can only retrieve a &mut reference to an HrTimer<T> in contexts
> where it is not possible for the timer to be accessed by others or
> currently executing (e.g. a UniqueArc), a &mut is actually enough of a
> guarantee to safely fulfill the C API requirements here.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/time/hrtimer.rs | 36 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index bfe0e25f5abd0..aadae8666f7ea 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -68,7 +68,11 @@
>  //! `start` operation.
>  
>  use super::ClockId;
> -use crate::{prelude::*, time::Instant, types::Opaque};
> +use crate::{
> +    prelude::*,
> +    time::{Delta, Instant},
> +    types::Opaque,
> +};
>  use core::marker::PhantomData;
>  use pin_init::PinInit;
>  
> @@ -164,6 +168,36 @@ pub(crate) unsafe fn raw_cancel(this: *const Self) -> bool {
>          // handled on the C side.
>          unsafe { bindings::hrtimer_cancel(c_timer_ptr) != 0 }
>      }
> +
> +    /// Forward the timer expiry for a given timer pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `self_ptr` must point to a valid `Self`.

I don't think safety requirements are tight enough. We must also have
exclusive ownership of the pointee of `self_ptr`.


Best regards,
Andreas Hindborg



