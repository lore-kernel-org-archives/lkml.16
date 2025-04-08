Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B9026B951;
	Tue,  8 Apr 2025 12:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114594; cv=none; b=lkkWK6FZANbDgPKmChO9ba+I4VzhkD0D8jBVSd2akBBmp3T+QxGe2AoNzo1ReRHl/u++hRQTnjWKxkBNIB56xWnlPRaZz969kJmEzg/tOnWRTn2WZWK4k90KdClrB0ojVQmnXMQK9ka2ncAAuNOm20mxmx3KTfE3JMze4rr0G8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114594; c=relaxed/simple;
	bh=Q4ajw4npvDMQ+FYVreDn+ZF7G53aam/tnthwemUkbgw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k2oVylOiyrQx9vnu1UzTLPgTAjfOEpqk3ttJ7h6R3rjU7unMX7BpkCZOCN/3ylFxokaEESXOfsFcrWo40DG4eIZ38mxgniuVtPe8kWf3Vi17EYfHc5zlF3KOQgx/Nd8N775xLrjGX/ywjWUua91ouvmlBs0axCkKigAbICZjb+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EM80qa3B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EM80qa3B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 983A6C4CEE5;
	Tue,  8 Apr 2025 12:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744114593;
	bh=Q4ajw4npvDMQ+FYVreDn+ZF7G53aam/tnthwemUkbgw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EM80qa3BghiuO6Dc6f411fzGB1T5gck3H6EVZEh9N/W8tVRQHyRzBmzet/cYKGyR9
	 ag9P7EAwbCLDHzcPwwUpLZNtRv2j9Sme/MYU8/2Ux+s1MfSwNM+cij7+lkjkmduPge
	 Hvp7yJ05ARwlKfuRKisyEC6eAnqQ++rMIWSwEesSl7eKD008ihhbaNz5+cY23SzaJx
	 s61prD7uNmaqcjcRAGU8sAfdUofwkTMXTZCFd17DYRWGpP+51Heevz2tspjYqnEwzQ
	 jV1lve9cI2VJ78FXOYxhngrLx6gdd/fp1ihVPghGKpA7+7nyPF2fRLlYrWvl2IPSSr
	 kFA2ARyW66EdQ==
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
Subject: Re: [PATCH 3/6] rust: hrtimer: Add HrTimerClockBase
In-Reply-To: <20250402214109.653341-4-lyude@redhat.com> (Lyude Paul's message
	of "Wed, 02 Apr 2025 17:40:31 -0400")
References: <20250402214109.653341-1-lyude@redhat.com>
	<macQi3_uAE5HRvQ4WbOU1frRp0yxObm0X7mfxWH8564aAiNqSWnZXfj-CL6-Y3A_kZi8pF_CNLUYgpCqSQkpzw==@protonmail.internalid>
	<20250402214109.653341-4-lyude@redhat.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 08 Apr 2025 13:58:51 +0200
Message-ID: <87jz7uj24k.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Lyude Paul" <lyude@redhat.com> writes:

> This adds a simple wrapper for the hrtimer_clock_base struct, which can be
> obtained from a HrTimerCallbackContext. We'll use this in the next commit to
> add a function to acquire the current time for the base clock driving a
> hrtimer.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/time/hrtimer.rs | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index c92b10524f892..f633550882247 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -165,6 +165,29 @@ pub(crate) unsafe fn raw_cancel(this: *const Self) -> bool {
>      }
>  }
>
> +/// The timer base for a specific clock.
> +///
> +/// # Invariants
> +///
> +/// The layout of this type is equivalent to that of `struct hrtimer_clock_base`.
> +#[repr(transparent)]
> +pub struct HrTimerClockBase(Opaque<bindings::hrtimer_clock_base>);
> +
> +impl HrTimerClockBase {
> +    /// Retrieve a reference to a [`HrTimerClockBase`] from `ptr`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `ptr` must point to a live `struct hrtimer_clock_base`.
> +    unsafe fn from_raw<'a>(ptr: *mut bindings::hrtimer_clock_base) -> &'a Self {
> +        // SAFETY:
> +        // - `ptr` is guaranteed to point to a live `struct hrtimer_clock_base` by our safety
> +        //   contract.

I think this next one should be an `// INVARIANT:` comment.


Best regards,
Andreas Hindborg



