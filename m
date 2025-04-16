Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2942356C1
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744796576; cv=none; b=Ur2ik8nqAewKd94OJ7FwPQ5ckWRY8xPXQ3iP0bMilTSGpK1OUA2UFDUyNTXSYvKLoKuqxxfh0j+oTGPMh9WFm87BpU98710cu0WZ8Z+/5h+H4hC+it3ZvnPpJGxOvM53/ZKXN2pTdVhDk0o/chdcExlgPH4YUp6ydQqOGqMcbdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744796576; c=relaxed/simple;
	bh=wbJzpFvbnrMe4yRayOSqpN6jfIzWhqfIcuxD3eRafKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VtGTBvsoN262GZcUSATF4ZzJBfh6mwAntunhiDJ4xB0UO5UF2531rNaEKEiLDxaPaV4yB/V0Uc1Gs/WqyozxTcyoLZN6b7O3G55sVR0ve8+FxNrRB/tqev4Dike/l2n/mgx4ArAacSJZnfACsEFkLCKaWSQLSFogwLxPZbytEUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AzoHjEg6; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AzoHjEg6"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e6ff035e9aso11991292a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744796572; x=1745401372; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/Lk+Us+/SdpuZ0Yv9Idr4m9qWKq4xyaV6D0y4pquko=;
        b=AzoHjEg688s3z3fOmTmDGzUfTA/k3i/9fGex7qQX1I085dv+rnM7ht6V7JfkQenxOz
         xH5jWJz2eVIGcaytaWoBvAEvYWZ1ZByNWMpAy1H5CxfhuEpEXTM7UBAhBb69xc2GowUs
         3pStkcu3H6VLwEG1hMD6SST5CmgOpw4XQJMYqbv9xF55+7XkvRFUIfaN4hjn3kq0Bnr7
         smNwd73PCkyn6tMcBd3RrkIDT0nEXndU/DOGjlKnrCb2ZEu5/6ob/ZyrYisudK4+lYt1
         cHNYTZHzCI2Oe/1U1t6VX1UglUMQ4aKCNvV8I8cxM68414GzDFsqVwylmrlt+I3e4GL4
         JC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744796572; x=1745401372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/Lk+Us+/SdpuZ0Yv9Idr4m9qWKq4xyaV6D0y4pquko=;
        b=Db+KuG2dDMP15LAKnZJK+MkAv9UFUhvIIaj0cttJXnndkeooOxGNSY4o52Hw9WjQba
         BXt1QWyyWnob6S1eGN/K+q6uP8mlx2OUvAkzuhdeQCwY5rDrwXwddNLrRRf0vjNz8KTR
         ScdyCw4lgWjB6AeXTdEVJQ1COCS5AYUJGiBkusdID2a6lBjd2IZ9gu0RzQk7eeeHdAgn
         34i1ofvXcSNkEEvsdjp1X5BNPhybq3gZk75/uGppIDovYVsg5gKUkLJa5MF8p0LQVAZb
         UPfQ3hkNbK56CCu85xIan3ndxEYhb2xXrnsbvG1vFQzQy0NXugoQOdAcCA7Uf43Im1ev
         r3Hw==
X-Forwarded-Encrypted: i=1; AJvYcCU+229PluzISjtf095IWB/+EH7fG+dJaiacFCKqH/5japkBA74jykBRtfSDhuAvt/C2pSrX7zkSstXkw1E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz7ciU/13k9LcqM555Lh6qJioYuhW10ifOswv05koNy3XZRydf
	h7ocdoXXMPe54/enSZdNa51f8ztSmpwgmNk3DYFo94KJtNkWk7Vtfi9l742xRqlp4oyciQxza7C
	B6PM0Om/ZSVLOgAnUHc9Yg+xjCJaOCZCMKgutLA==
X-Gm-Gg: ASbGncumB2C8WWs1BVsCAVVnEiCBNh+j6kAzWtoTKec5EOsorSPoEj/FOmPd2lvxp1D
	tQuftMZS0JMK9sZ1ZNOBpCWyys3M1VUErHxAPbEJlgSZh/H5QQSdGzfb9bBrIdNvFkdn8O/M1fJ
	W4LG2jrPJuzbKczzD00MHc43MBW1AFG/g+22IYVnngNXIgGGtuDMM=
X-Google-Smtp-Source: AGHT+IHaJ3Yj5/LwOv2u8tYcCNwajfl9HtiVhO0Y5sAyEoPfaknClMTtKdEEUw6QBfrsw52zWQGRfJIq42SFpjvH2Ds=
X-Received: by 2002:a17:907:3d8d:b0:aca:d48f:4d48 with SMTP id
 a640c23a62f3a-acb42d4b16bmr90852666b.60.1744796572114; Wed, 16 Apr 2025
 02:42:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325014733.18405-1-xuewen.yan@unisoc.com> <CAKfTPtA06D1EGg2VdVHt-P0PDE-1XZVJOp3myZPSNknnFT3nNg@mail.gmail.com>
 <CAB8ipk_uOKn+U0ozZyaQ8J9OjifoZWSh-9NUQ9UD+K-kLV28vw@mail.gmail.com>
In-Reply-To: <CAB8ipk_uOKn+U0ozZyaQ8J9OjifoZWSh-9NUQ9UD+K-kLV28vw@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 16 Apr 2025 11:42:40 +0200
X-Gm-Features: ATxdqUHqZq40_m3dCBBTUzHW_QayZDET_zr-nwBl5Vs_QWe5EolQ4w2SvJKIQxE
Message-ID: <CAKfTPtD2T8Qm-6Nq-9qODQASoU9Wn1Ujk4uQbbN1Dvo3+EFZFA@mail.gmail.com>
Subject: Re: [PATCH v2] sched/uclamp: Align uclamp and util_est and call
 before freq update
To: Xuewen Yan <xuewen.yan94@gmail.com>
Cc: Xuewen Yan <xuewen.yan@unisoc.com>, dietmar.eggemann@arm.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	hongyan.xia2@arm.com, qyousef@layalina.io, ke.wang@unisoc.com, 
	di.shen@unisoc.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 16 Apr 2025 at 04:55, Xuewen Yan <xuewen.yan94@gmail.com> wrote:
>
> On Wed, Apr 16, 2025 at 1:05=E2=80=AFAM Vincent Guittot
> <vincent.guittot@linaro.org> wrote:
> >
> > On Tue, 25 Mar 2025 at 02:48, Xuewen Yan <xuewen.yan@unisoc.com> wrote:
> > >
> > > When task's uclamp is set, we hope that the CPU frequency
> > > can increase as quickly as possible when the task is enqueued.
> > > Because the cpu frequency updating happens during the enqueue_task(),
> >
> > Strictly speaking, it doesn't happen during enqueue_task but when :
> > - attach/detach tasks when migrating
> > - update_load_avg decayed
> > - io_wait
> >
> > This often happens during an enqueue but not always ...
>
> Okay, I would make some adjustments to these descriptions.
>
> >
> > > so the rq's uclamp needs to be updated before the task is enqueued,
> >
> > this doesn't ensure that new rq's uclamp will be taken into account
>
> Did I miss something?
>
> As following stack:
> enqueue_task_fair()
> update_load_avg()
> cfs_rq_util_change(cfs_rq, 0);

As mentioned above, this doesn't always happen so you are not ensured
to take uclamp into account. If you mandate to take uclamp value into
account immediately this is not enough

> cpufreq_update_util()
>   sugov_update_shared()
>     sugov_next_freq_shared()
>      sugov_get_util()
>         effective_cpu_util()
>             *min =3D max(irq + cpu_bw_dl(rq), uclamp_rq_get(rq, UCLAMP_MI=
N));
>             *max =3D min(scale, uclamp_rq_get(rq, UCLAMP_MAX));
>
> So, the rq's uclamp value should update before enqueue_task().
> >
> > > just like util_est.
> >
> > just like util_est
> >
> > > So, aline the uclamp and util_est and call before freq update.
> >
> > nit s/aline/align/ ?
> align.
> >
> > >
> > > For sched-delayed tasks, the rq uclamp/util_est should only be update=
d
> > > when they are enqueued upon being awakened.
> > > So simply the logic of util_est's enqueue/dequeue check.
> > >
> > > Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
> > > ---
> > > v2:
> > > - simply the util-est's en/dequeue check;
> > > ---
> > > Previous discussion:
> > > https://lore.kernel.org/all/CAB8ipk8pEvOtCm-d0o1rsekwxPWUHk9iBGtt9TLT=
WW-iWTQKiA@mail.gmail.com/
> > > https://lore.kernel.org/all/84441660bef0a5e67fd09dc3787178d0276dad31.=
1740664400.git.hongyan.xia2@arm.com/T/#u
> > > https://lore.kernel.org/all/CAB8ipk9LpbiUDnbcV6+59+Sa=3DAi7tFzO=3D=3D=
=3DmpLD3obNdV4=3DJ-A@mail.gmail.com/T/#u
> > > https://lore.kernel.org/all/aa8baf67-a8ec-4ad8-a6a8-afdcd7036771@arm.=
com/
> > > ---
> > >  kernel/sched/core.c | 17 ++++++++++-------
> > >  kernel/sched/fair.c |  4 ++--
> > >  2 files changed, 12 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > > index 042351c7afce..72fbe2031e54 100644
> > > --- a/kernel/sched/core.c
> > > +++ b/kernel/sched/core.c
> > > @@ -1747,7 +1747,7 @@ static inline void uclamp_rq_dec_id(struct rq *=
rq, struct task_struct *p,
> > >         }
> > >  }
> > >
> > > -static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *=
p)
> > > +static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *=
p, int flags)
> > >  {
> > >         enum uclamp_id clamp_id;
> > >
> > > @@ -1763,7 +1763,8 @@ static inline void uclamp_rq_inc(struct rq *rq,=
 struct task_struct *p)
> > >         if (unlikely(!p->sched_class->uclamp_enabled))
> > >                 return;
> > >
> > > -       if (p->se.sched_delayed)
> > > +       /* Only inc the delayed task which being woken up. */
> > > +       if (p->se.sched_delayed && !(flags & ENQUEUE_DELAYED))
> > >                 return;
> > >
> > >         for_each_clamp_id(clamp_id)
> > > @@ -2031,7 +2032,7 @@ static void __init init_uclamp(void)
> > >  }
> > >
> > >  #else /* !CONFIG_UCLAMP_TASK */
> > > -static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *=
p) { }
> > > +static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *=
p, int flags) { }
> > >  static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *=
p) { }
> > >  static inline void uclamp_fork(struct task_struct *p) { }
> > >  static inline void uclamp_post_fork(struct task_struct *p) { }
> > > @@ -2067,12 +2068,14 @@ void enqueue_task(struct rq *rq, struct task_=
struct *p, int flags)
> > >         if (!(flags & ENQUEUE_NOCLOCK))
> > >                 update_rq_clock(rq);
> > >
> > > -       p->sched_class->enqueue_task(rq, p, flags);
> > >         /*
> > > -        * Must be after ->enqueue_task() because ENQUEUE_DELAYED can=
 clear
> > > -        * ->sched_delayed.
> > > +        * Can be before ->enqueue_task() because uclamp considers th=
e
> > > +        * ENQUEUE_DELAYED task before its ->sched_delayed gets clear=
ed
> > > +        * in ->enqueue_task().
> > >          */
> > > -       uclamp_rq_inc(rq, p);
> > > +       uclamp_rq_inc(rq, p, flags);
> > > +
> > > +       p->sched_class->enqueue_task(rq, p, flags);
> > >
> > >         psi_enqueue(p, flags);
> > >
> > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > index c798d2795243..c92fee07fb7b 100644
> > > --- a/kernel/sched/fair.c
> > > +++ b/kernel/sched/fair.c
> > > @@ -6930,7 +6930,7 @@ enqueue_task_fair(struct rq *rq, struct task_st=
ruct *p, int flags)
> > >          * Let's add the task's estimated utilization to the cfs_rq's
> > >          * estimated utilization, before we update schedutil.
> > >          */
> > > -       if (!(p->se.sched_delayed && (task_on_rq_migrating(p) || (fla=
gs & ENQUEUE_RESTORE))))
> > > +       if (!p->se.sched_delayed || (flags & ENQUEUE_DELAYED))
> >
> > commit message doesn't explain why you change util_est condition
>
> Because, the sched_delayed flag is set when dequeue_entity, and clear
> after the condition,
> so for migrating/prio_change, we could just check the sched_delayed.

Why is testing sched_delayed enough for migrating/prio_change ?
With your change, we will remove then add back util_est when changing
prio of the task which is useless


> And for the wakeup, because the the sched_delayed flag is cleared after t=
his,
> so use the ENQUEUE_DELAYED flag to ensure the util_est could enqueue.
>
> >
> > >                 util_est_enqueue(&rq->cfs, p);
> > >
> > >         if (flags & ENQUEUE_DELAYED) {
> > > @@ -7168,7 +7168,7 @@ static int dequeue_entities(struct rq *rq, stru=
ct sched_entity *se, int flags)
> > >   */
> > >  static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, =
int flags)
> > >  {
> > > -       if (!(p->se.sched_delayed && (task_on_rq_migrating(p) || (fla=
gs & DEQUEUE_SAVE))))
> > > +       if (!p->se.sched_delayed)
> >
> > same here, you should explain in commit message why it's okay to do so
>
> Same as above,  the sched_delayed flag is set when dequeue_entity, so
> this place,
> the sched_delayed was not set when sleeping, If the flag is set, it
> indicates that it
> was migrating or prio changing.
>
> By the way, I will kindly update these reasons in the commit message.
>
> Thanks!
>
> BR
> ---
> xuewen
