Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E13C1A23B7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745505965; cv=none; b=mHwww+QHk9ouNnGDKYgBWJ0ocqlGSonon8VRMc3+NqUZwOaMlPORZoj9Dyg/YZnUKQE/7Mdu3xF9oQl0kcJXtz0Ryjf6748s+ag7Ytbyu0l+gFgVm8x59oGYA6OED2fOIcZErrnlUotN5cor4feUlimQO7CMAFY726VE44nuuP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745505965; c=relaxed/simple;
	bh=o2RBZVSwwymoOwOHsr7X7tY2TYV6PDEU88LDFFfByo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=At+2LT6T/rShBxu6f4xVhNwpMXGsiUgU4tUDlBEDH5r7rdOCx/qDloB6Y2TV1Ebv6DpJvnT6iDw5j6uSELJOVuG/3V+HMYpmLZ10vJA5Qy0WdM87SDXczOM/47ild3wv17dyUV40ivMPAe3p+Zby2Jr4cJiLgFw3f7cPdLYK8mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eMrlDXwC; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eMrlDXwC"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-47691d82bfbso24042951cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745505962; x=1746110762; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djiw2uRfK6UBOIy5EO9pfxKm7dpOiSpJC1m5A7rq/I0=;
        b=eMrlDXwCIiMNIYtT3VYlNi9r8ZDyzobMzhf9h6DIivmSuzSZipbYKD8BCPeqjAZEg7
         rzp9khL02r6ktGzVGakGktZ1sdQ/s2R4BmmqQ7RO7Q2RUTmWFB8erXTeOEx1Er4FAtI5
         Dojo5sExewqXvSG8MoQq80FNUOsrq7SLnBSWCOYxKr82Oi96Rp1TRpigqiAjjbCqVLc6
         9HH3RV+1Hd1xCu+pRJtWFLYc8W0XRVH7yLgCNZHzUT9sa7NvaNf32/9GuxUdezx2tZVT
         q1jdKOocmhlHQMA8D19lgVL1N/25G669RB9xrO1hKvmY0a0lvZL+CCKSFvX0enLubTgo
         yvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745505962; x=1746110762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djiw2uRfK6UBOIy5EO9pfxKm7dpOiSpJC1m5A7rq/I0=;
        b=qc44Kh4wPiPSMMyJV8pqS+C9sWU3leVVsqP1KxkYZR+TDQ3v9BWQiqMSQ+8n5iNWuF
         zBJdFHPPkXjaoaQjCyvVxBa52rgU4iI4bD89VukKwrWRBliPeBkhyu4Wpb6SbyJRnjTL
         PWdsgi1ZgdNnNT5VUHs15y6URcHWpKed5cg9rh6/1K6Uc4eFPLAgMDlsbzyxjJmcMqOD
         nzoBtxCGNeWgMLT/w9cBtYbnE0gztdfOBANgy7h7n2BQesFRQ8voKG3wyNZBkXJvIIa6
         3jyne7TWTVtQYhbXbhE6gVoAWRPHxS0f1t47/zL0Nco6Iqq5ggxaxmpxj94kWIvVDpFS
         6QXg==
X-Forwarded-Encrypted: i=1; AJvYcCVHbmc8Lp2K5Q7JHgp9vSwYAVAhPe8+ZaroD1kQlvY8xuCnzkbvn+stz5Ds5Z4oODWomeU4+DQJtWKg9As=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGxQ6uPmPJgdIfgbnI07VXo48AF070xqhXoGp5DjUFC3gajOk7
	CFjs6qeiwdDesMKng+KikyVgGaYBBMBP54pXC2upvCbh17qHaHPiwMMRTPLHMtXz5F9Qz42sWzt
	MHxJa+lYBi7PnyCzWjoBYJGxV8BU=
X-Gm-Gg: ASbGncuGxiasfypa+gRZflBUGsaHghzpTRixJoDEKDno2/RLDYts0+VVY/rLuP3NhDL
	WPIJ5ABYXzMYhSUNi6wY1omKfleWJrBwJMAiqpXZ1oHn+8KLDHhDw9QjlmlXdCKDXVaoSFXZ2vK
	6E/eIUu7LaPxeS2U2jl5wwjrI=
X-Google-Smtp-Source: AGHT+IFGaPkE6RL+WHWDWAL5vZOpOKCCFkUXuZ2C29tV+pt/3ETbhcrTI+CSd8av3dhQsiIAjaNy5GTuFsD83soT7nU=
X-Received: by 2002:a05:6214:4015:b0:6e8:f99c:7939 with SMTP id
 6a1803df08f44-6f4bfcb0542mr41311646d6.44.1745505962215; Thu, 24 Apr 2025
 07:46:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423174634.3009657-1-edumazet@google.com>
In-Reply-To: <20250423174634.3009657-1-edumazet@google.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Thu, 24 Apr 2025 22:45:26 +0800
X-Gm-Features: ATxdqUF-ovgbBxduQnEu1wue-NNLCVb2y0ggWdAMR61_FYb2MQzImAQcwI8q970
Message-ID: <CALOAHbDT=z4xYQq0WXqGzAQycNhaBdCfZDs5mB5Rvyx9iK4JbQ@mail.gmail.com>
Subject: Re: [PATCH] sched/fair: reduce false sharing on sched_balance_running
To: Eric Dumazet <edumazet@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Eric Dumazet <eric.dumazet@gmail.com>, Sean Christopherson <seanjc@google.com>, 
	Josh Don <joshdon@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 1:46=E2=80=AFAM Eric Dumazet <edumazet@google.com> =
wrote:
>
> rebalance_domains() can attempt to change sched_balance_running
> more than 350,000 times per second on our servers.
>
> If sched_clock_irqtime and sched_balance_running share the
> same cache line, we see a very high cost on hosts with 480 threads
> dealing with many interrupts.

CONFIG_IRQ_TIME_ACCOUNTING is enabled on your systems, right?
Have you observed any impact on task CPU utilization measurements due
to this configuration? [0]

If cache misses on sched_clock_irqtime are indeed the bottleneck,  why
not align it to improve performance?

[0]. https://lore.kernel.org/all/20250103022409.2544-1-laoar.shao@gmail.com=
/

>
> This patch only acquires sched_balance_running when sd->last_balance
> is old enough.
>
> It also moves sched_balance_running into a dedicated cache line on SMP.
>
> Signed-off-by: Eric Dumazet <edumazet@google.com>
> Cc: Yafang Shao <laoar.shao@gmail.com>
> Cc: Sean Christopherson <seanjc@google.com>
> Cc: Josh Don <joshdon@google.com>
> ---
>  kernel/sched/fair.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index e43993a4e5807eaffcacaf761c289e8adb354cfd..460008d0dc459b3ca60209565=
e89c419ea32a4e2 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -12144,7 +12144,7 @@ static int active_load_balance_cpu_stop(void *dat=
a)
>   *   execution, as non-SD_SERIALIZE domains will still be
>   *   load-balanced in parallel.
>   */
> -static atomic_t sched_balance_running =3D ATOMIC_INIT(0);
> +static __cacheline_aligned_in_smp atomic_t sched_balance_running =3D ATO=
MIC_INIT(0);
>
>  /*
>   * Scale the max sched_balance_rq interval with the number of CPUs in th=
e system.
> @@ -12220,25 +12220,25 @@ static void sched_balance_domains(struct rq *rq=
, enum cpu_idle_type idle)
>
>                 interval =3D get_sd_balance_interval(sd, busy);
>
> +               if (!time_after_eq(jiffies, sd->last_balance + interval))
> +                       goto out;
> +
>                 need_serialize =3D sd->flags & SD_SERIALIZE;
>                 if (need_serialize) {
>                         if (atomic_cmpxchg_acquire(&sched_balance_running=
, 0, 1))
>                                 goto out;
>                 }
> -
> -               if (time_after_eq(jiffies, sd->last_balance + interval)) =
{
> -                       if (sched_balance_rq(cpu, rq, sd, idle, &continue=
_balancing)) {
> -                               /*
> -                                * The LBF_DST_PINNED logic could have ch=
anged
> -                                * env->dst_cpu, so we can't know our idl=
e
> -                                * state even if we migrated tasks. Updat=
e it.
> -                                */
> -                               idle =3D idle_cpu(cpu);
> -                               busy =3D !idle && !sched_idle_cpu(cpu);
> -                       }
> -                       sd->last_balance =3D jiffies;
> -                       interval =3D get_sd_balance_interval(sd, busy);
> +               if (sched_balance_rq(cpu, rq, sd, idle, &continue_balanci=
ng)) {
> +                       /*
> +                        * The LBF_DST_PINNED logic could have changed
> +                        * env->dst_cpu, so we can't know our idle
> +                        * state even if we migrated tasks. Update it.
> +                        */
> +                       idle =3D idle_cpu(cpu);
> +                       busy =3D !idle && !sched_idle_cpu(cpu);
>                 }
> +               sd->last_balance =3D jiffies;
> +               interval =3D get_sd_balance_interval(sd, busy);
>                 if (need_serialize)
>                         atomic_set_release(&sched_balance_running, 0);
>  out:
> --
> 2.49.0.805.g082f7c87e0-goog
>


--=20
Regards
Yafang
