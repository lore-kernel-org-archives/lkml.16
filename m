Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262BB2820D6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 15:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745509805; cv=none; b=QoZOUp6aVBuI2/z1vbM64gjIzggJdZ3DcpR0iwZsE09n39S8tCq39A36r2YzYnDSaWmLbSjIeotkuj/bHZACisQF/D2RFeDEcxwgPXj3kSzvJLbFnkrZLtiGYuLZSTWyag1+5XocBRUedG66RLgxZ5pywvyQ2nBI5D8rsivwCts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745509805; c=relaxed/simple;
	bh=oFJwqoQmqhV3tzHXCWAUpYCv3zuZzrnJtBsf11IlA0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z0WVWshj9gmL8p9RUyttZ35j7CCUmr80B6EFf8fbn3q6Y079Mjx1FeKyAUOGP9hJSKwFILZ1LjhGBD4fbbCs87kj7MUF0JNO66mB70ngfUdXizFQPok4zZw30nezxg1V5xUjvpxbEixjYL+k4lls2NtISdrmZDqgOuO9C3fUmWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e7pK23q/; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e7pK23q/"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-476b4c9faa2so17214171cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745509803; x=1746114603; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0o6BLaXfzfjoaNBSiIYFkgY7e+QgbYR/AIhLDiGSo6Q=;
        b=e7pK23q/plo8euDSZwHpZc/d2S6lU9itqTvB72wt74XrEdN34U09iM7WAd3tn0pPgf
         hfXCMucJmRL427E1ZISx4eSY9oHM1bHi0W/8UjixfHmp91xHx90uV+QTRl6z8j6Oa1Nv
         uyH0NSFnrda+jQRa1lcm/erzufJSTHSG0GPqEn3X4Q0/9Gn59OEXuc5QPZ4t03rDAk8s
         T7TKhI4aIo2sY+9fbUMSLKapoGldEJ+7PtsSwAuAXDlRd6c3NWndOj8dpS49knt9DNml
         Ol2OkXVF6Q8HxBGMyZsvjlv7VocSRKF2P+zh5UDPm84j1oNyiXD+jG9USsFvbcrZM5P7
         uBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745509803; x=1746114603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0o6BLaXfzfjoaNBSiIYFkgY7e+QgbYR/AIhLDiGSo6Q=;
        b=sO6N6XnPDxd7iZjUoHngZRFMJeHbO27KlUx9hygLbsUoLpUzHJcZzBxRDS4jzZFwRT
         J/2sBdwG6kbyvI74eeWvG1YXhq+nzFxXYabM85SQ1vifYWaO8hsl0vKsjffqo+KRP6Ma
         9GdbZaGZhAVwa/EvwoxLpreo7ccOStcB8B1wYsn4FXFcUNEYakCWUcNIQLaf4WC+zsTj
         TTj8npuGl/HsAe9FtG4mSELluBPNz8fsdGW0lfrcdHR8NW5utQqCOycMTVEO/r7RslZu
         Iw/vYWTGDztSotb/cM5Iu/jiqyShUVHw0QXtS/m2tL0CIKa4Vpi2xzBBwmnvDHgWVd+M
         aLQA==
X-Forwarded-Encrypted: i=1; AJvYcCVLqNXtRJ3GowDCn0JSdgV/tuvYZgxLvA1CyGC7kSEo0MwQD7RLczm36OUhfevitgli4NSXF1ZXF6xUuGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL9QXhyHNhEacabY+oEBiI0B1nQw3fxZmewhd0uzjYu28/nYmU
	xvYlp/smW48+g0/vpR9IcdRj5NFfv1aMY2YTb4XOZ3Eoab9qIPBiCYPb2T/2W+dj4I33JMwIg2K
	5KDKWmAcaZDW0KU5JdgQz9nBgpdP2wjkaR6Xv
X-Gm-Gg: ASbGncux6mG8dSeBt2K8v2P6b6CYScczS+cqJD+oppypYvEwVtg7tK4tyNhSQsSQ2WO
	hMrDVZaxMe8Wf1OP5dkkMekGK4qK7mvwrZ1pwXE5WUZTQySTLcJgjgZgQS3hz17YRQRXJSqgnHw
	v0T60w37ivxNoveT7BLzf1oMZ+nEEHA+hk5gFhe4A0V7JUr0JvFz4=
X-Google-Smtp-Source: AGHT+IFdUdc6+btc9WZxKMnVDHdgdd8nMBWu7mWur19Wfp1IZWZYf9toIto/BbEFGQmnQxOPTIJPFSqL3Aw/4FMr9Hc=
X-Received: by 2002:a05:622a:4cc:b0:478:f8bb:b5e with SMTP id
 d75a77b69052e-47fb97eb2efmr3400341cf.13.1745509802731; Thu, 24 Apr 2025
 08:50:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423174634.3009657-1-edumazet@google.com> <CALOAHbDT=z4xYQq0WXqGzAQycNhaBdCfZDs5mB5Rvyx9iK4JbQ@mail.gmail.com>
In-Reply-To: <CALOAHbDT=z4xYQq0WXqGzAQycNhaBdCfZDs5mB5Rvyx9iK4JbQ@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 24 Apr 2025 08:49:51 -0700
X-Gm-Features: ATxdqUGqVqn1fNpA7HSwsbZHEzfZjTuOE8iPsyKccc6IEipwLb5tRY65CeVZTTc
Message-ID: <CANn89iLuGSZFrhfQGMRo579CCv4Cie9Vq3SNkcvYM9XPjmzccA@mail.gmail.com>
Subject: Re: [PATCH] sched/fair: reduce false sharing on sched_balance_running
To: Yafang Shao <laoar.shao@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Eric Dumazet <eric.dumazet@gmail.com>, Sean Christopherson <seanjc@google.com>, 
	Josh Don <joshdon@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 7:46=E2=80=AFAM Yafang Shao <laoar.shao@gmail.com> =
wrote:
>
> On Thu, Apr 24, 2025 at 1:46=E2=80=AFAM Eric Dumazet <edumazet@google.com=
> wrote:
> >
> > rebalance_domains() can attempt to change sched_balance_running
> > more than 350,000 times per second on our servers.
> >
> > If sched_clock_irqtime and sched_balance_running share the
> > same cache line, we see a very high cost on hosts with 480 threads
> > dealing with many interrupts.
>
> CONFIG_IRQ_TIME_ACCOUNTING is enabled on your systems, right?
> Have you observed any impact on task CPU utilization measurements due
> to this configuration? [0]
>
> If cache misses on sched_clock_irqtime are indeed the bottleneck,  why
> not align it to improve performance?

"Align it" meaning what exactly ? Once sched_clock_irqtime is in a
read-mostly location everything is fine.

The main bottleneck is the false sharing on these Intel 6980P cpus...

On a dual socket system, this false sharing is using something like 4%
of the total memory bandwidth,
and causes apparent high costs on other parts of the kernel.

>
> [0]. https://lore.kernel.org/all/20250103022409.2544-1-laoar.shao@gmail.c=
om/

What part should I look at, and how is this related to my patch ?

>
> >
> > This patch only acquires sched_balance_running when sd->last_balance
> > is old enough.
> >
> > It also moves sched_balance_running into a dedicated cache line on SMP.
> >
> > Signed-off-by: Eric Dumazet <edumazet@google.com>
> > Cc: Yafang Shao <laoar.shao@gmail.com>
> > Cc: Sean Christopherson <seanjc@google.com>
> > Cc: Josh Don <joshdon@google.com>
> > ---
> >  kernel/sched/fair.c | 28 ++++++++++++++--------------
> >  1 file changed, 14 insertions(+), 14 deletions(-)
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index e43993a4e5807eaffcacaf761c289e8adb354cfd..460008d0dc459b3ca602095=
65e89c419ea32a4e2 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -12144,7 +12144,7 @@ static int active_load_balance_cpu_stop(void *d=
ata)
> >   *   execution, as non-SD_SERIALIZE domains will still be
> >   *   load-balanced in parallel.
> >   */
> > -static atomic_t sched_balance_running =3D ATOMIC_INIT(0);
> > +static __cacheline_aligned_in_smp atomic_t sched_balance_running =3D A=
TOMIC_INIT(0);
> >
> >  /*
> >   * Scale the max sched_balance_rq interval with the number of CPUs in =
the system.
> > @@ -12220,25 +12220,25 @@ static void sched_balance_domains(struct rq *=
rq, enum cpu_idle_type idle)
> >
> >                 interval =3D get_sd_balance_interval(sd, busy);
> >
> > +               if (!time_after_eq(jiffies, sd->last_balance + interval=
))
> > +                       goto out;
> > +
> >                 need_serialize =3D sd->flags & SD_SERIALIZE;
> >                 if (need_serialize) {
> >                         if (atomic_cmpxchg_acquire(&sched_balance_runni=
ng, 0, 1))
> >                                 goto out;
> >                 }
> > -
> > -               if (time_after_eq(jiffies, sd->last_balance + interval)=
) {
> > -                       if (sched_balance_rq(cpu, rq, sd, idle, &contin=
ue_balancing)) {
> > -                               /*
> > -                                * The LBF_DST_PINNED logic could have =
changed
> > -                                * env->dst_cpu, so we can't know our i=
dle
> > -                                * state even if we migrated tasks. Upd=
ate it.
> > -                                */
> > -                               idle =3D idle_cpu(cpu);
> > -                               busy =3D !idle && !sched_idle_cpu(cpu);
> > -                       }
> > -                       sd->last_balance =3D jiffies;
> > -                       interval =3D get_sd_balance_interval(sd, busy);
> > +               if (sched_balance_rq(cpu, rq, sd, idle, &continue_balan=
cing)) {
> > +                       /*
> > +                        * The LBF_DST_PINNED logic could have changed
> > +                        * env->dst_cpu, so we can't know our idle
> > +                        * state even if we migrated tasks. Update it.
> > +                        */
> > +                       idle =3D idle_cpu(cpu);
> > +                       busy =3D !idle && !sched_idle_cpu(cpu);
> >                 }
> > +               sd->last_balance =3D jiffies;
> > +               interval =3D get_sd_balance_interval(sd, busy);
> >                 if (need_serialize)
> >                         atomic_set_release(&sched_balance_running, 0);
> >  out:
> > --
> > 2.49.0.805.g082f7c87e0-goog
> >
>
>
> --
> Regards
> Yafang
