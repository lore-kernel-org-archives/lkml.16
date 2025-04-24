Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B64D1F4176
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 20:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745525226; cv=none; b=Lz/bpD0X8UzVUPUWtj0M58Uabk+N9M9UGR8lNMLld7iNlmK9mO+A3xoki8KcusmKsFT/SG/tfcE50llWAn23M8dVPKxe1jZFpqu/e9NMe1+NGudYfd0wgms4PAlBxWHw+hg7hv8ERClRUqImjXEbtex9zAksPLKfxhkgMB8CDe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745525226; c=relaxed/simple;
	bh=lRHSkX05dWBVSeKbWMSph7cGAkZBCFFKsTaQG3S3KSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tLysj8ETRdwKV4EfL2sboYge2JP6rV4mkk96CLF+gdHT+p8FDDx0XdLjlBKgpDe4NxQgbvG5wGnHAjAu5jT0aSqONKbgjP/MlGELCdpH35PYXkYrW83MEO8EN0t+kIOp55kRrPOu+5YWpYVZ2wzkRqOxItmElILd6WMNn0/SmOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yZEqqjgO; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yZEqqjgO"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-47e9fea29easo2191cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745525224; x=1746130024; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uxq4mA9+XOIuI/AzZqCpXG75eOtzOO56XVutFKOtGIY=;
        b=yZEqqjgO0ljPMdXFuj3kcq8ElS/AB27WLVoO+0+xAXN2zTepSoK/vjBS5n1I0pjLGU
         QvCXPihaPAgrfRYe8l2m2btg3EDZu8Y+eIYfTnAYMdf9G61sbKMTAl/27epiOfp7AZVo
         OvbXeaAEVHeRg/lw6C+1rqc8WOj6Psm9/BqAKTy46cZ2MzJfk9Cfq97rCzdzoigVXVrw
         kkN/ZLpwFeShHDKSRSwIbTekNrhIN4rxdTuxWuqKqEOIef+FXAmuWvgvSWYWFgIJJ0NM
         e6sOZdYVPPPDsl4ps7AHE1YrKIKTmFvsSfcE6Ple0GfGjuABsS92x/NzMmNtyrXNI4Xh
         DPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745525224; x=1746130024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uxq4mA9+XOIuI/AzZqCpXG75eOtzOO56XVutFKOtGIY=;
        b=ntnSMk+CK3zX/NL6GCd+pMMIDR5oN3Hg+z/F20ZSxU2ys9sVu5qMWnShUXebQbw6Vz
         ymt1tCAM/BWxl/IQrfTnsDWLwgkNbR7933NkY7QrbZjOFEc3dJruSPpagsxXUTpBQnwF
         7PF0uh37mYDuSYvpXzKBnP+BhM239DInHXe4Y4I/6YQ1g7+MWlOyzyX0penr1xtO2n5h
         fUz49w32bKFilzCru4hqBbQtzOJiiPomlgMWGHAvW2zPeGkDfXte2ko6vf2hBf7MfuKs
         04I8Xvw49ewUoyJOaNWDsfDUpgB1cFxKXguiaXf4HdLleQUWwsRQBpO2liEZ4wROoP/M
         STNA==
X-Forwarded-Encrypted: i=1; AJvYcCVNQLRojwdL5gy/S2WhcrWTQKj8P/VVxEGZLgGJUHmlNUpuoKHCj+jUbHsue2ml9YTPDhY98WkfX9RFj2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqLooEEfdmXRv/MyvqcVSRwMgXx1cj3NGsdQv2Q1yT07jTwaEP
	3bvR0oONuk+PztlZwgEtr1rUS0Wj/kIcEh4xkk0104lIL7JmbCeainUhGq3HYQDSixu/D/ABmoK
	OlRQC+tyBGMKPRya5P3RgBHmVXA4d4C++ayQt
X-Gm-Gg: ASbGncuscn9Y6r1aliNZcL7MlI9A051Ni0/paf5Zst5IFS2TPi7ez6jVR7UC52CpceP
	3qAB92IE3Ufpa+6eEgXTfO2PyLHhfAUVMr2qoHgNpWdVO1XKYfp7oXZkb8UxZtcvE01u7pgfmeU
	alYfNnmWzl3HoXRZxY2pd5bnM=
X-Google-Smtp-Source: AGHT+IGBbqNeSHdEooV8ULztm8uAtCV7dvRbj6CnrJ3fVu/OaXW1HuITl8l0rNO3LgGgKCEcbqp1inYi8VH1YV205no=
X-Received: by 2002:a05:622a:1929:b0:477:7644:b738 with SMTP id
 d75a77b69052e-47fe6dc0734mr507201cf.17.1745525223583; Thu, 24 Apr 2025
 13:07:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423174634.3009657-1-edumazet@google.com>
In-Reply-To: <20250423174634.3009657-1-edumazet@google.com>
From: Josh Don <joshdon@google.com>
Date: Thu, 24 Apr 2025 13:06:52 -0700
X-Gm-Features: ATxdqUH5QN3ENpFCf8wz9xDJSABxgXPzI_lvoVXeHdN_10VzBXBw6FvJImztr-Q
Message-ID: <CABk29NsmE6ovcJ9O8W+SMS1sQ6h_D=MOXgqk9Hi_OfeyZPJCFA@mail.gmail.com>
Subject: Re: [PATCH] sched/fair: reduce false sharing on sched_balance_running
To: Eric Dumazet <edumazet@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Eric Dumazet <eric.dumazet@gmail.com>, Yafang Shao <laoar.shao@gmail.com>, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 10:46=E2=80=AFAM Eric Dumazet <edumazet@google.com>=
 wrote:
>
> rebalance_domains() can attempt to change sched_balance_running
> more than 350,000 times per second on our servers.
>
> If sched_clock_irqtime and sched_balance_running share the
> same cache line, we see a very high cost on hosts with 480 threads
> dealing with many interrupts.
>
> This patch only acquires sched_balance_running when sd->last_balance
> is old enough.
>
> It also moves sched_balance_running into a dedicated cache line on SMP.

Thanks Eric, looks good to me.

Reviewed-By: Josh Don <joshdon@google.com>

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
