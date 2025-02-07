Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413F02E64A
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 13:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738935990; cv=none; b=oS2tYpVUkNrLIWqzjoXAuU5qyqOv+PqL4kPflqpfo1TzR+Fr6nG8yQPCihussGm8Q2zEJuplb5cTZzHOPIAdGjk0YhEtx/NvW1b/fKxhHyDGz7arW/PcmA2BjbtPxvHDoxnjnQxQzMO4YKL6/LKGpt+DoLWsy1jZ/i1sfzql67A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738935990; c=relaxed/simple;
	bh=vLuC24EPaivqxLe6lifOx+BXfgDMOD9Mwf5eQ78tRek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mqLRvJ4IrimKcvj1drk90vnxjnJKfH+f438GgAIWx24ISo93yYD1DouF1LkWG/7XHAOL6TQd0f8E26Ry6AAt2nrW/RiMjxv3CPzBS0FvYC21m0IioVSs2WTlq6gEgzAsIFLPDs/1pNKnUyu2sa7qzg2IaQbD1xWAoMAPAanPlvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lCCiTEtD; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lCCiTEtD"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5dcea5d8f16so4135598a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 05:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738935986; x=1739540786; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=REZB0sANexIP4XWMliuMvr5qpUJSVkumhZ+m2qFPPrQ=;
        b=lCCiTEtD2gNfm6AqChHPuRc2KPGoJzTzPE+FKw3ljKMALCYCeHeqnBZrfvLzojc6Fh
         hdkYYBSjFSZmjjKtR+LbaJkCM6awAWxC+LtP32J6R26DuxBfsEtdoe91QSVO+JEhk/A/
         HpoKGudf73n/UhFnNsYkUttzY/RWzl2s0zwMbzIhyupOYUX9AG3Gl64FkjOdP4J/MlDX
         xk76YwkBY5KVfUV/Dx6RzT8iXBwO5eK/cYiTLtWsotjCaK5yQ/xTLuskA99spGgvKDKR
         o9OlbfqsmTsQ8ojvtQOE3TQrY0ydCXbcqHaQbpBsBM9ccbYIzMgV6076Eq47i69bJcLO
         IuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738935986; x=1739540786;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=REZB0sANexIP4XWMliuMvr5qpUJSVkumhZ+m2qFPPrQ=;
        b=g0palsoHMQPpLMEKx2SiFdq27v0CHI48U3IQOtNLvYsbwRQ1w2uGgoGZqMHj60ft25
         3OJSVX9t9VLHKpPvmtuPQWV/7+niUAJ2qGqNnzScewNuOa3N+50YDLSaQuOUuMefIeyt
         I6Fm1aQt19Zlzb+iRBum2sb5UJb0sE7LvYGaT2d1R4VpKpjpTssjQIe9bs60GbxYaKi1
         9qL+Oh4juRbr0UbyksVgcxSXCFj7yVfzn7lFUeSCY0+YaPG2xzfSGJARtnOT4WIO2UXx
         ubTdJ/sfByT9gefkpSM7Hc8aR9TDsMA86/0vmH1W2l9NEtWi07wkvUfyzY/+aT3SSJ1M
         HWBw==
X-Forwarded-Encrypted: i=1; AJvYcCV3v3EHC1sH8w6A3W4xs2YzlcWIvi68er7580ZiUnkNGC08IbSTeQHAnSGJcBXbB1IoyaY9DsRzAXatcjg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yweat7FOP5PGNEyLNNqC44sFqDbYyWV2Qq9m8F7G3yT6b0O9UQV
	JInjnnVBmcYYsnFiRWxDWkYiFLtDoohQQkXZwNcLsAoODmUSNDoJzMUvMY6IlX0wTNmCGTyz1De
	MjABkJgbpOPkyi/T9Hm3ccwvbw6HW4dwy2SL7Hw==
X-Gm-Gg: ASbGnctqQJgKvlfWmQM0Eog4qDUj6S772026JejXnNXtDLiMk4lxkdvRZlos5lllQBh
	JgQgGqpJYYUrTGbORqCURDh2qOr7zabE/RtvybTqjV6Hl8DpxWDxE97VqRUFWv9cHWovT1ECg9p
	L62C3ktVLOrhgakdiae2ZA2hhMIA==
X-Google-Smtp-Source: AGHT+IGY8kij5Gw761pb9WCJ3OdCdQXdihHUkrlAY5K9v1F2nAWhoN0vVHzkn1H9rDSmMNEfVZre/vOTmplsfCnlq0s=
X-Received: by 2002:a05:6402:4607:b0:5de:44b1:478 with SMTP id
 4fb4d7f45d1cf-5de44e5cedcmr3900526a12.0.1738935986461; Fri, 07 Feb 2025
 05:46:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207060917.30201-1-15645113830zzh@gmail.com> <20250207061359.31442-1-15645113830zzh@gmail.com>
In-Reply-To: <20250207061359.31442-1-15645113830zzh@gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 7 Feb 2025 14:46:14 +0100
X-Gm-Features: AWEUYZl6wrK3CIIZekBSGVtJ1GNvTbisrqKhw77_kxRsmvIqReURPFIxoIPae7A
Message-ID: <CAKfTPtBwRV4ndO5Zao1YbNNSi0EtMbrO081nDKjNvdjmJv5xZg@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] sched: Reduce the default slice to avoid tasks
 getting an extra tick
To: zihan zhou <15645113830zzh@gmail.com>
Cc: bsegall@google.com, dietmar.eggemann@arm.com, juri.lelli@redhat.com, 
	linux-kernel@vger.kernel.org, mgorman@suse.de, mingo@redhat.com, 
	peterz@infradead.org, rostedt@goodmis.org, vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 07:15, zihan zhou <15645113830zzh@gmail.com> wrote:
>
> Reduce the default slice, add a comment explaining why this modification
> was made.
>
> Signed-off-by: zihan zhou <15645113830zzh@gmail.com>
> ---
>  kernel/sched/fair.c | 47 +++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 43 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 26958431deb7..754b0785eaa0 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -71,10 +71,49 @@ unsigned int sysctl_sched_tunable_scaling = SCHED_TUNABLESCALING_LOG;
>  /*
>   * Minimal preemption granularity for CPU-bound tasks:
>   *
> - * (default: 0.75 msec * (1 + ilog(ncpus)), units: nanoseconds)
> - */
> -unsigned int sysctl_sched_base_slice                   = 750000ULL;
> -static unsigned int normalized_sysctl_sched_base_slice = 750000ULL;
> + * (default: 0.70 msec * (1 + ilog(ncpus)), units: nanoseconds)
> + *
> + * The old default value for slice is 0.75 msec * (1 + ilog(ncpus)) which
> + * means that we have a default slice of
> + * 0.75 for 1 cpu
> + * 1.50 up to 3 cpus
> + * 2.25 up to 7 cpus
> + * 3.00 for 8 cpus and above.
> + *
> + * For HZ=250 and HZ=100, because of the tick accuracy, the runtime of tasks
> + * is far higher than their slice.
> + * For HZ=1000 with 8 cpus or more, the accuracy of tick is already
> + * satisfactory, but there is still an issue that tasks will get an extra
> + * tick because the tick often arrives a little faster than expected. In this
> + * case, the task can only wait until the next tick to consider that it has
> + * reached its deadline, and will run 1ms longer.
> + *
> + * vruntime + sysctl_sched_base_slice =     deadline
> + *         |-----------|-----------|-----------|-----------|
> + *              1ms          1ms         1ms         1ms
> + *                    ^           ^           ^           ^
> + *                  tick1       tick2       tick3       tick4(nearly 4ms)
> + *
> + * There are two reasons for tick error: clockevent precision and the
> + * CONFIG_IRQ_TIME_ACCOUNTING/CONFIG_PARAVIRT_TIME_ACCOUNTING.
> + * with CONFIG_IRQ_TIME_ACCOUNTING every tick will be less than 1ms, but even
> + * without it, because of clockevent precision, tick still often less than
> + * 1ms.
> + *
> + * In order to make scheduling more precise, we changed 0.75 to 0.70,
> + * Using 0.70 instead of 0.75 should not change much for other configs
> + * and would fix this issue:
> + * 0.70 for 1 cpu
> + * 1.40 up to 3 cpus
> + * 2.10 up to 7 cpus
> + * 2.8 for 8 cpus and above.
> + *
> + * This does not guarantee that tasks can run the slice time accurately every
> + * time, but occasionally running an extra tick has little impact.

The explanation above about why you change sysctl_sched_base_slice
from 0.75 to 0.70 should be put in commit message instead of the code

With this change:

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

> + *
> + */
> +unsigned int sysctl_sched_base_slice                   = 700000ULL;
> +static unsigned int normalized_sysctl_sched_base_slice = 700000ULL;
>
>  const_debug unsigned int sysctl_sched_migration_cost   = 500000UL;
>
> --
> 2.33.0
>
