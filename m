Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECF417CA1B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744988458; cv=none; b=SeMojRxpmDcIEM4hWNvZIp4Gm4/qb/J2ca5RZthSw4DCADYzl4EAD0QjVUAb6unYNN79ITBCk1cSIYYVLJPECTF3AZlbmXXQfYc38ekIy2GdllzYG0mfORRbBJ43vNVc/bVQB4CMPc5360EVjzXt9BUr5Zr4qYyZIWBR9RC4TB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744988458; c=relaxed/simple;
	bh=xaKzDjJF+0Qpwh7i5dScwUHQePpvcTtNCFB+dI2amdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KNu0yD5gxdrLY+btWIa3M1ajl420A12+Fp89eB8FvpoN7cttVjK7kU3v3tWrza+c5XpddLa8OKZjixei7lvzkb3nlB+RJVs9nYehF9IcW+gHDEaQ32hPv+M0XNPMSY2Npxe/t4OnTr+ZCvGuP+SDmBGdLNvYohQQp1iTRC64c4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kt/WbP0K; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kt/WbP0K"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5f435c9f2f9so2973019a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744988454; x=1745593254; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QY/DZ1t7cyPYmmHRsG8rVIv+QsxZe4rLYm+PnDn8G+w=;
        b=kt/WbP0KsnY8HdEsFcmYtc2BWI2RHp8NDvLtpZdPgBGlr/yQOsr5DRDgQH6UCXYvqj
         E6KllgzKw7J0LZreE8s+w75+5R7Yr1it4PNKhIErMHP8OsvpScqVZsEUtP1VdK8XXkb8
         NnuVWjjqAY9VEz3Y3a7HPZc1IFeGTzTovCl8hj0Td/BKobY/4O3t7GP5QBe5uQ0EAH5I
         caOoChiWkAUXdSrAwiychp9j9bzbEg+YLFn1m/3bJ4YIImJLX2BNStPkSyt1JViIzjsM
         TeqXBjwrFR0VF3HGF8zqrhWfcqTEHH/vKAMf8RNUoNNs6xS3bSYhjZ8NyiX96/bL4PUv
         ORgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988454; x=1745593254;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QY/DZ1t7cyPYmmHRsG8rVIv+QsxZe4rLYm+PnDn8G+w=;
        b=hDMT0baU+BbHPWjtQUps6plM1iEDm3GSiia4s2+J+IxaGkhzMGRx7iydo3d/83eOnx
         JMwm0hdNczm9LEc0yCDoeTkwBMFQSJ4we6EU54DmYIi5r1vrH/mnrzp/R05GlWWC54J0
         Ibr9NaFLp3273kcnSHzWYPBvzoCfrJHZGIJ2ChKY3InIXZZtuJ6CMuTRIwL9mTKCXXId
         OeexFtrST5sv/z7jnzzSFPbNwPcYAugCGMz/ZDTIsnrIobBFLrhDbnAn4zRCXswZ2ZD3
         MCltW4V8ZJbC5SIAKVrNFcoNzZNec/Q9TftmJ6aMcGltkTnlrgg2Mx3hQyUYcMXz2+p+
         fOvw==
X-Forwarded-Encrypted: i=1; AJvYcCWFcUQIGnGdvp1AmQySxV5349s39LePgXK9j2JvvRaUQd75gapWMXKdnNMLjCqFRtCirbSRfsMtdoHSivM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk26BTXv2dg28l7CZqcD8DOxrZ49oIdZ8zK0aEe3NWvZ9uDq4K
	Fj453JhelTIeaW0MCU6QcZjOPAbnU+peEbys3e/xy4Htuas2/KL0z+IOfAPwJJ8NobUbRwD7TBk
	MFl11L6Mp7j8F+n5LTYrkhe8jGuJljExjkFLxdQ==
X-Gm-Gg: ASbGncs//lakxmCJYNkwzxTzv6vft14HKTkLFtuRltLFb/7sb79o9dy8GJ4XNKQyVPb
	Kx4TbeyiGH0Y6MuYuf6VlisnB8Q1VxpnhnIGOn0mIt5ONtWgQPWBbP9fMM7N4yDNThIv+Ldvic5
	iuEX/FVZaB/TTU2pkQHEN5BN/tg1VaZF/Kabck+PuS6pCdiMQPVDI=
X-Google-Smtp-Source: AGHT+IEsTxUJjL6vylcJ4KHXCKrN9rANAVSxqacAf5JHb47ZEZ9DtkIsSuSB3dPrXoj6b8pu6sXREkqFD2dSmcr+qb4=
X-Received: by 2002:a17:907:1b21:b0:acb:33c6:5c71 with SMTP id
 a640c23a62f3a-acb74b8189cmr280217766b.29.1744988454438; Fri, 18 Apr 2025
 08:00:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417043457.10632-1-xuewen.yan@unisoc.com> <20250417043457.10632-3-xuewen.yan@unisoc.com>
In-Reply-To: <20250417043457.10632-3-xuewen.yan@unisoc.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 18 Apr 2025 17:00:41 +0200
X-Gm-Features: ATxdqUFu9ilxx9NvSepN20JA0doxruwcqFmiXEBuDMI87-1W2J4Pe0N_LiFrork
Message-ID: <CAKfTPtBbBL=FNCO8bzm-2p6n6o2omzUNfXuUz-s=4nW_E3ShYQ@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] sched/uclamp: Align uclamp and util_est and call
 before freq update
To: Xuewen Yan <xuewen.yan@unisoc.com>
Cc: dietmar.eggemann@arm.com, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, hongyan.xia2@arm.com, 
	linux-kernel@vger.kernel.org, ke.wang@unisoc.com, di.shen@unisoc.com, 
	xuewen.yan94@gmail.com, kprateek.nayak@amd.com, kuyo.chang@mediatek.com, 
	juju.sung@mediatek.com, qyousef@layalina.io
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Apr 2025 at 06:36, Xuewen Yan <xuewen.yan@unisoc.com> wrote:
>
> The commit dfa0a574cbc47 ("sched/uclamg: Handle delayed dequeue")
> has add the sched_delayed check to prevent double uclamp_dec/inc.
> However, it put the uclamp_rq_inc() after enqueue_task().
> This may lead to the following issues:
> When a task with uclamp goes through enqueue_task() and could trigger
> cpufreq update, its uclamp won't even be considered in the cpufreq
> update. It is only after enqueue will the uclamp be added to rq
> buckets, and cpufreq will only pick it up at the next update.
> This could cause a delay in frequency updating. It may affect
> the performance(uclamp_min > 0) or power(uclamp_max < 1024).
>
> So, just like util_est, put the uclamp_rq_inc() before enqueue_task().
> And as for the sched_delayed_task, same as util_est, using the
> sched_delayed flag to prevent inc the sched_delayed_task's uclamp,
> using the ENQUEUE_DELAYED flag to allow inc the sched_delayed_task's uclamp
> which is being woken up.
>
> Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>


> ---
> v3:
> - rework the commit message;
> - remove the util_est change;
> v2:
> - simply the util-est's en/dequeue check;
> ---
>  kernel/sched/core.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index c81cf642dba0..0f4ab0c17c58 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -1752,7 +1752,7 @@ static inline void uclamp_rq_dec_id(struct rq *rq, struct task_struct *p,
>         }
>  }
>
> -static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p)
> +static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags)
>  {
>         enum uclamp_id clamp_id;
>
> @@ -1768,7 +1768,8 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p)
>         if (unlikely(!p->sched_class->uclamp_enabled))
>                 return;
>
> -       if (p->se.sched_delayed)
> +       /* Only inc the delayed task which being woken up. */
> +       if (p->se.sched_delayed && !(flags & ENQUEUE_DELAYED))
>                 return;
>
>         for_each_clamp_id(clamp_id)
> @@ -2036,7 +2037,7 @@ static void __init init_uclamp(void)
>  }
>
>  #else /* !CONFIG_UCLAMP_TASK */
> -static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p) { }
> +static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags) { }
>  static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p) { }
>  static inline void uclamp_fork(struct task_struct *p) { }
>  static inline void uclamp_post_fork(struct task_struct *p) { }
> @@ -2072,12 +2073,14 @@ void enqueue_task(struct rq *rq, struct task_struct *p, int flags)
>         if (!(flags & ENQUEUE_NOCLOCK))
>                 update_rq_clock(rq);
>
> -       p->sched_class->enqueue_task(rq, p, flags);
>         /*
> -        * Must be after ->enqueue_task() because ENQUEUE_DELAYED can clear
> -        * ->sched_delayed.
> +        * Can be before ->enqueue_task() because uclamp considers the
> +        * ENQUEUE_DELAYED task before its ->sched_delayed gets cleared
> +        * in ->enqueue_task().
>          */
> -       uclamp_rq_inc(rq, p);
> +       uclamp_rq_inc(rq, p, flags);
> +
> +       p->sched_class->enqueue_task(rq, p, flags);
>
>         psi_enqueue(p, flags);
>
> --
> 2.25.1
>
>
