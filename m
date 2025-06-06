Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A020289371
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 13:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749217909; cv=none; b=soN965z828nEH/8HSfktzVH4nmKeUDvxo4us8mHdNb+Bn45sMpIUpwfCOQY14LPuprAHaV8Z0BZKMnnINJ9P3tfDhttqrlN8oGqHwVtXy2sL4FM3iTLfNUb7u0gbLZvoLlDw9/8tKoPZUtGwVDIeRljeZ00GmajYtRcp7RzRhCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749217909; c=relaxed/simple;
	bh=1cXy0ycIoVFg/MhpMcFWn9S3JLlWV6ejpENRa6Q2LjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UuK+AsedUgwYDxj2UiRvhZrK4AtnUPhSGBdYYes1b+k7cdGMxA4/qFBugvM4Dfzng4+sJB8wuGMiwvBQB5oSZNVDclEfZEcCp56OT1mX81y2wof47OYsuWKtO6GynA5zR3tB93ze6tIF3Th2dXVy0veYalLPRESR51gRbqfUK5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZeKOrfe9; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZeKOrfe9"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so1106016a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 06:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749217906; x=1749822706; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WWPSFukZBDHDG6pN288MbNxWFpqaNB01Y5FNmAhQ1fI=;
        b=ZeKOrfe9WQHxD69vTnaqUfjtC2VAnbXwCwHRDA+cZkWgAbBs3DKwluDQRHoXfIy+U4
         4JVP4THm/j6RbgXT/E6lZoi/IFVZFUQDoUtdZtO8dLYD8wAi8BDvdG7kTmWJXW1+PcO7
         R9SkH8eYCnkgNHEyqzPDwzIFxErHA07ppUUvMkaHsMEwPPx5zuJEEQi4KaXhQa1E4ASS
         2ek6EJSbM/uNjXUFwndp2nQPyVW5QWTO6uFHnfc27eXxf5yGv5h52yocwBVEVcQIxWL/
         i3lCs2xtlVKYKr1QBmXS25TDcbnDCxe3Rne6SbbR3dkPsS72RPFI25u+LERmnbHN4f/5
         6ing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749217906; x=1749822706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WWPSFukZBDHDG6pN288MbNxWFpqaNB01Y5FNmAhQ1fI=;
        b=dPtiatO6fDJfGyyGVziC/a2aZRlyBYv7isf78FjAcJXRuU/R++andqH0o4zSZZgg8o
         U/8Rw3w1FQCAxLpJIQbRPwrhF7IEBeLZXNrs962c8INpxiAc8UjkZewhQ1YLAnl6LMOU
         0PXU7flmDFeL+BwtdbfkTaHeBUagLwFgPWCqOxw7NYvfjyA+NvuHFfMu8dlICZdWDrIL
         DUvOv7alBpXA+eYnlinDBTzfk1R0Gyf1HfMCmoytcuNmjXx1fo7L2rcymHm5dKW8lXqK
         nHqnGKn0uBYoUhImKwknewBmFk+NqUtF454Vv4TbmT/PSNTS8jVZmLeCwdQk6J6AAhaQ
         Lr/w==
X-Forwarded-Encrypted: i=1; AJvYcCV38KuiFe6MeNjKgtU74ldLna+tYS2jT3AXLV5lYGveZka0Xxn1gxPB9pR++v6L6yzVtW8TIUj+xGNN+d0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQWoJKj7X/ZMpecyFZfDSfFlcqNd5BkKaPjCjuUC0oxPuICL9f
	3iKbeg9/48s0tc4CtVHhqtm/XLP3w0sOHmYKgo63Dmyd8vzuNWrTv43ER5hfPyYXIOPHtSVdm29
	kqgUUYHX0ZY5EIPCHC4XOX5OPkUi4ziqDUPVY0vUM3Q==
X-Gm-Gg: ASbGnctyuydyTWIOOVg4rxL9LFl36VXhFQeLxnSOWtaoLlygj7+gDWdVuviarb2jrJ1
	7NBeXZbm3e6AGiMJId8CYPX3YxSJEsoZ7AMofa8REkYRZwBMTioB6gJ4BaXTcavQBMM9IPZKpD5
	C+X3ZzDOqufiVfEwe9ww3ByF+GfRAQ5YaBKdfgZHcu3lCOLnMM6AKgQROUM1wsTIHwr6Qu8kmZ
X-Google-Smtp-Source: AGHT+IHX94roqFXROBXnIx9NhnT4WHs1dfm5kRkaVUWpbVA7IjPnQJNCvIuu9/hYbQzqnvhB5tF5GaD+bQPQk0biGIk=
X-Received: by 2002:a17:907:3f14:b0:ad8:8719:f6f3 with SMTP id
 a640c23a62f3a-ade1a932e69mr291889366b.22.1749217905616; Fri, 06 Jun 2025
 06:51:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416035823.1846307-1-tim.c.chen@linux.intel.com>
In-Reply-To: <20250416035823.1846307-1-tim.c.chen@linux.intel.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 6 Jun 2025 15:51:34 +0200
X-Gm-Features: AX0GCFtQuZ3rgVRNeRNw_KLI4y7VY70dnK5LaR0i6JgbSOrS9GgzORh4iniXqSs
Message-ID: <CAKfTPtA7sLeddYsRU=uftcYt4RpEbWNHWx36tBDzGuPxu8oEmg@mail.gmail.com>
Subject: Re: [PATCH] sched: Skip useless sched_balance_running acquisition if
 load balance is not due
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Chen Yu <yu.c.chen@intel.com>, Doug Nelson <doug.nelson@intel.com>, 
	Mohini Narkhede <mohini.narkhede@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Apr 2025 at 05:51, Tim Chen <tim.c.chen@linux.intel.com> wrote:
>
> At load balance time, balance of last level cache domains and
> above needs to be serialized. The scheduler checks the atomic var
> sched_balance_running first and then see if time is due for a load
> balance. This is an expensive operation as multiple CPUs can attempt
> sched_balance_running acquisition at the same time.
>
> On a 2 socket Granite Rapid systems enabling sub-numa cluster and
> running OLTP workloads, 7.6% of cpu cycles are spent on cmpxchg of
> sched_balance_running.  Most of the time, a balance attempt is aborted
> immediately after acquiring sched_balance_running as load balance time
> is not due.
>
> Instead, check balance due time first before acquiring
> sched_balance_running. This skips many useless acquisitions
> of sched_balance_running and knocks the 7.6% CPU overhead on
> sched_balance_domain() down to 0.05%.  Throughput of the OLTP workload
> improved by 11%.
>
> Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
> Reported-by: Mohini Narkhede <mohini.narkhede@intel.com>
> Tested-by: Mohini Narkhede <mohini.narkhede@intel.com>

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>


> ---
>  kernel/sched/fair.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index e43993a4e580..5e5f7a770b2f 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -12220,13 +12220,13 @@ static void sched_balance_domains(struct rq *rq, enum cpu_idle_type idle)
>
>                 interval = get_sd_balance_interval(sd, busy);
>
> -               need_serialize = sd->flags & SD_SERIALIZE;
> -               if (need_serialize) {
> -                       if (atomic_cmpxchg_acquire(&sched_balance_running, 0, 1))
> -                               goto out;
> -               }
> -
>                 if (time_after_eq(jiffies, sd->last_balance + interval)) {
> +                       need_serialize = sd->flags & SD_SERIALIZE;
> +                       if (need_serialize) {
> +                               if (atomic_cmpxchg_acquire(&sched_balance_running, 0, 1))
> +                                       goto out;
> +                       }
> +
>                         if (sched_balance_rq(cpu, rq, sd, idle, &continue_balancing)) {
>                                 /*
>                                  * The LBF_DST_PINNED logic could have changed
> @@ -12238,9 +12238,9 @@ static void sched_balance_domains(struct rq *rq, enum cpu_idle_type idle)
>                         }
>                         sd->last_balance = jiffies;
>                         interval = get_sd_balance_interval(sd, busy);
> +                       if (need_serialize)
> +                               atomic_set_release(&sched_balance_running, 0);
>                 }
> -               if (need_serialize)
> -                       atomic_set_release(&sched_balance_running, 0);
>  out:
>                 if (time_after(next_balance, sd->last_balance + interval)) {
>                         next_balance = sd->last_balance + interval;
> --
> 2.32.0
>
