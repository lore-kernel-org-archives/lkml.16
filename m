Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0B91DED5C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 08:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188710; cv=none; b=cScZCn71SOBjnFi+CswC6zeRtoCMRZvTTWnV2hYNF8AR6dx0/oAYuAxs/SbQkX9mWBwYVMHglgFcZPcbI0U1qMtU05bNbwmK9tGfG1v8E9Bm0hrtglS4Z1VCOHKOF0avkrFej4WtqmSDCcOxP9dAj1AmlYc2dSdgyjAgSt+km/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188710; c=relaxed/simple;
	bh=ZdX4ylzskOvlzS/dy0Hz+BZ5yhPSDECThaJX99P04N8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GY5C3bCfWV/MmcsOpzUpzLvZHdQj3WYw9JvTlI9R2rIkYgNkI6OInRbr8bEviagsQIGhNOTPvyvNHbaCNOb65ugJKlSZtEXDouh671dxh4BMNhRFg9rcwHLS4SvkCuChgfR3VhzKLudNm2Ujpypmfb6hgkkAbDOtJ6SjVV4Hcgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UCaxguYr; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UCaxguYr"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so48566055e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 01:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744188707; x=1744793507; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W9EIcXKJmOaJtQk62oAIpx09pwCOcTfkyNYjV4byDb0=;
        b=UCaxguYrNZtdhVJfn0EZBgznR4z/EiwhjffgxZJNqRiyl0f+9HY6LoepRSMvgzQ38a
         oeESJrVnJ7+Cd6Yv+Bu45cTa89pFmiMiLb58+Uq+5kYtXg6AojMoieH0ZvF2ONwjkSu3
         TY1P+AU5FtGmnzRitJgqWzLCo3gvF5jeUvR57+OpPgWl2tXkjDC4LkCVY4CtGjzfZ2zG
         LspSlPHZ4zWpjxUWcnvxFR7xzc4Oz7CUGnL7jg10cGq/6tmt13Al9iz+SU/DMAIBDhLJ
         N4IMjPQJor7/Qblj3OB9rymsUNWaGy6WLMQN3LhaviNsgwGiMB+lvy/bpDO4/00RdRIO
         TfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744188707; x=1744793507;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W9EIcXKJmOaJtQk62oAIpx09pwCOcTfkyNYjV4byDb0=;
        b=ehHMeTkZKZRCc7NoD5oKrf1Nd6SDV0Q+FF7xuQ/y/EoC9wTQeH5qrqQAuwTGODar7R
         evovWo67fi7y2VKtwImt4YKVY9VaZ75V6wk7yw3LcyOe1xuyQVLmXx3oesafLaRCD0Uw
         14Dl2O/aDDioYYiu1P0aeKDn0X4mEJBSf3rqjO62Wi+MbuIfuqRgWicyc7pOkxVpDrhf
         IHhCZTpvlkVeFlVP2aZ2j+ogSE48nn4BkBZBq2zPG6HjuAyKPB0/SdAqZvkLi5QrwAEI
         TU9/DnCsdScWdwyGmTEP+IditgOtSrZyw5ChGf1MhMH6umGZ0L35if/tona665qVe+5T
         WOgA==
X-Gm-Message-State: AOJu0YybUGfAmaJW3+8mbJw02JFjgfTdM0LhfbBGdP0z0Y5e9LceIAfB
	K0mS1myGTLxkLxHKFdFA4VzYxalM75BWDwdOOH5xFacWZFPDoK1pBUFXpXLA7aV94DwsAS9V4/E
	GQzp9QAwjCdAtZg==
X-Google-Smtp-Source: AGHT+IFFC1oenasUlX25FhpPJr1NS865doQr/pWc7WJ9+kFbWFNqv3muUFiv4LensE/F5lJnwv2wYu4ZTJalJZ4=
X-Received: from wmbg24.prod.google.com ([2002:a05:600c:a418:b0:43c:fce2:1db2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5492:b0:43d:40b0:5b with SMTP id 5b1f17b1804b1-43f1ed4b96amr12837835e9.25.1744188706743;
 Wed, 09 Apr 2025 01:51:46 -0700 (PDT)
Date: Wed, 9 Apr 2025 08:51:44 +0000
In-Reply-To: <20250406110718.126146-3-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250406110718.126146-1-fujita.tomonori@gmail.com> <20250406110718.126146-3-fujita.tomonori@gmail.com>
Message-ID: <Z_Y1IBcp_NNnks8R@google.com>
Subject: Re: [PATCH v1 2/2] rust: task: add Rust version of might_sleep()
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	boqun.feng@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@samsung.com, tmgross@umich.edu, dakr@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, pmladek@suse.com
Content-Type: text/plain; charset="utf-8"

On Sun, Apr 06, 2025 at 08:07:18PM +0900, FUJITA Tomonori wrote:
> Adds a helper function equivalent to the C's might_sleep(), which
> serves as a debugging aid and a potential scheduling point.
> 
> Note that this function can only be used in a nonatomic context.
> 
> This will be used by Rust version of read_poll_timeout().
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/helpers/task.c |  6 ++++++
>  rust/kernel/task.rs | 26 ++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/rust/helpers/task.c b/rust/helpers/task.c
> index 31c33ea2dce6..2c85bbc2727e 100644
> --- a/rust/helpers/task.c
> +++ b/rust/helpers/task.c
> @@ -1,7 +1,13 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
> +#include <linux/kernel.h>
>  #include <linux/sched/task.h>
>  
> +void rust_helper_might_resched(void)
> +{
> +	might_resched();
> +}
> +
>  struct task_struct *rust_helper_get_current(void)
>  {
>  	return current;
> diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
> index 9e6f6854948d..1f0156b38ab5 100644
> --- a/rust/kernel/task.rs
> +++ b/rust/kernel/task.rs
> @@ -380,3 +380,29 @@ fn eq(&self, other: &Kuid) -> bool {
>  }
>  
>  impl Eq for Kuid {}
> +
> +/// Annotation for functions that can sleep.
> +///
> +/// Equivalent to the C side [`might_sleep()`], this function serves as
> +/// a debugging aid and a potential scheduling point.
> +///
> +/// This function can only be used in a nonatomic context.
> +#[track_caller]
> +#[inline]
> +pub fn might_sleep() {
> +    #[cfg(CONFIG_DEBUG_ATOMIC_SLEEP)]
> +    {
> +        let loc = core::panic::Location::caller();
> +        // SAFETY: FFI call.

Overall this looks okay to me, but this safety comment could be
improved. This being an FFI call is not the reason *why* it is safe to
make this call.

// SAFETY: `file.as_ptr()` is valid for reading for `file.len()` bytes.

And I might separate the file into a separate variable for clarity:
let loc = core::panic::Location::caller();
let file = loc.file();

> +        unsafe {
> +            crate::bindings::__might_sleep_precision(
> +                loc.file().as_ptr().cast(),
> +                loc.file().len() as i32,
> +                loc.line() as i32,
> +            )
> +        }
> +    }
> +
> +    // SAFETY: FFI call.
> +    unsafe { crate::bindings::might_resched() }

And here you can say
// SAFETY: Always safe to call.

Alice
