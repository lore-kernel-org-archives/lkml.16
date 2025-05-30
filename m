Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA8C22B8CE;
	Fri, 30 May 2025 13:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748610252; cv=none; b=Aa6H8Al65zE1mb0e6WGg+5qDpduS2ZCPfrPvVM9AejYwrfOhImAJFeOdaOS1bwJ4t4o4XYfCxlpmLn+K0Gua6NNm25FK/tWkb+PX+8cAkzZomYSh4+5Rdf7PGQzg3T+ECh8Lsrw1CjfUxFrRgpSh2DC4yUG8mitrqRSDn2ypIYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748610252; c=relaxed/simple;
	bh=TSFFCaTGVpTReD3OGz/HgMRwMGOHnyJiu4Qmrd8yvy8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kZo/ujLp/5qHYpE3YYYM9Zw6QZ8JsDQ0iu/thKxj/+mD12sxVHjqvhAAT9IrmtmJkaqNZ4kRmk6FnZGVmM83TZm7Fzglp8gwnRM4qadZZFqqx8z4a3Ut1J8a/EQhOiTTbDaNcOgXMcnIQWxq5jhtdb8YMDvcBQ8VCyVKQQ3qmGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/4GnauI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/4GnauI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7272FC4CEEF;
	Fri, 30 May 2025 13:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748610251;
	bh=TSFFCaTGVpTReD3OGz/HgMRwMGOHnyJiu4Qmrd8yvy8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=G/4GnauIGa3SfNyVofF473di2JujrsbcqWOsZ9NG5eWiviud9xUsRY2QdO6Ds+Ehp
	 bVJu0MomeqpkeekopDyYQN/8FDkSXK3fIS3j7eyy0G74W++0FWtuKuQwp4qpl8Xu3b
	 ggN8hoBlKcpdLbLdQo39FFLxnQCNDqofwmMs/h94+M+hpnEM4xKMR6j7TBzOe6mgBZ
	 ML0soiPrHnPd4WdxYSJCD7aKJq4H7bXqSd3hTr+Lx3Wfgwtn6rU046K/5sUKJFeDDg
	 ePKcQxmfjq6pV9SDSxqgPCwVy+1QNRhhLcVDoB1q5S3KZajyK7DNyRhvnBfINM5Fqv
	 5Xvg0AXW64fNA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org,  boqun.feng@gmail.com,
  frederic@kernel.org,  lyude@redhat.com,  tglx@linutronix.de,
  anna-maria@linutronix.de,  jstultz@google.com,  sboyd@kernel.org,
  ojeda@kernel.org,  alex.gaynor@gmail.com,  gary@garyguo.net,
  bjorn3_gh@protonmail.com,  benno.lossin@proton.me,  aliceryhl@google.com,
  tmgross@umich.edu,  dakr@kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/5] rust: time: Add HrTimerExpires trait
In-Reply-To: <20250504045959.238068-4-fujita.tomonori@gmail.com> (FUJITA
	Tomonori's message of "Sun, 4 May 2025 13:59:56 +0900")
References: <20250504045959.238068-1-fujita.tomonori@gmail.com>
	<20250504045959.238068-4-fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Fri, 30 May 2025 15:04:00 +0200
Message-ID: <87ecw61c8v.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Tomonori,

Thanks for fixing this.

FUJITA Tomonori <fujita.tomonori@gmail.com> writes:

> Introduce the `HrTimerExpires` trait to represent types that can be
> used as expiration values for high-resolution timers. Define a
> required method, `as_nanos()`, which returns the expiration time as a
> raw nanosecond value suitable for use with C's hrtimer APIs.
>
> Also extend the `HrTimerMode` to use the `HrTimerExpires` trait.
>
> This refactoring is a preparation for enabling hrtimer code to work
> uniformly with both absolute and relative expiration modes.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/time.rs         |   5 +
>  rust/kernel/time/hrtimer.rs | 181 ++++++++++++++++++++++++------------
>  2 files changed, 128 insertions(+), 58 deletions(-)
>
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index deca2999ced6..ac9551fca14f 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -194,6 +194,11 @@ pub fn now() -> Self {
>      pub fn elapsed(&self) -> Delta {
>          Self::now() - *self
>      }
> +
> +    #[inline]
> +    pub(crate) fn as_nanos(&self) -> i64 {
> +        self.inner
> +    }
>  }
>  
>  impl<C: ClockSource> core::ops::Sub for Instant<C> {
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index 24d013e47c7b..55e1825425b6 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs

<cut>

> +/// Defines a new `HrTimerMode` implementation with a given expiration type and C mode.
> +#[doc(hidden)]
> +macro_rules! define_hrtimer_mode {
> +    (
> +        $(#[$meta:meta])*
> +        $vis:vis struct $name:ident<$clock:ident> {
> +            c = $mode:ident,
> +            expires = $expires:ty
> +        }
> +    ) => {
> +        $(#[$meta])*
> +        $vis struct $name<$clock: $crate::time::ClockSource>(
> +            ::core::marker::PhantomData<$clock>
> +        );

I think a macro is too much here. The code would be easier to read
without the macro, and the macro does not remove much code here.

Could you try to do the trait implementations without the macro?


Best regards,
Andreas Hindborg


