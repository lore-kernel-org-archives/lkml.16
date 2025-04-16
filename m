Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27A32BAF4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744772153; cv=none; b=fOBD17w5J59Ewbr5c6ZKfl0TAInIgSP4LvsbyKMT4zT0ofAQ4hr3+eU8UOcX/1ITV2LlbWnN8lwhbggRDvMI+ZVef0iXN6t9rHQLmZvzboIa6l3HSOSYXkcgMufSGA01WAHkRt9VDHqcXwvLUcsMdjD4ypiIxLNY823wDqIdAKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744772153; c=relaxed/simple;
	bh=oAokXkuZNiMD4NRr2WFvKf8KvR/v4Wz3OZEUdNgVmRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mCXk2Vl/rLHIH4BHyH4re2ZEdpYnJtHvloKQQ4Twzonxcr7ctn4sr982kXCWTeM53ab44ilsvgp3D3ZX5M7/ACQ6y0Wq7hW+NoZTokiDYldj17hSUhgTQtH7dtPPz4Flm5F4pc1yTEVfo1HNvw6jeBTIRhaRMxHQvDIXzpY0GLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Moi6gXch; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Moi6gXch"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-477296dce8dso60950421cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 19:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744772151; x=1745376951; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQApA44nPBOCQAElcgWIO7K/icwgydIhVEvn8ir3fmw=;
        b=Moi6gXchk63SBxwk5yFc7AVRiA3wsh5flxmgPInsXR4SO7tTF02JkejNspTyOTle2Y
         //WB8Y/MvUPtN/rtXAMmzGy1+2dsZ0ctYcmOStROQELUkEsvRDMDcVfP2J42lfraipXt
         G/ThkTuEEdsZYRRStzUEpXPXa6/3jNHzRwT/azzx63XASLzWSMKarmnN5cxdsGR28hNu
         oB5ekCcHYCXN7zLr9VCy9nKHb23UzKbiKwIv3DxfTtaUp6loQZl6Iq/Ns5HT2oyrmJom
         GJ2/HYaEPnYt0jS+fW7XchvnTNrSnaQiTNAb0X31nR+yau7PgcA9HCCpz6uGPRX+N5RQ
         tQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744772151; x=1745376951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQApA44nPBOCQAElcgWIO7K/icwgydIhVEvn8ir3fmw=;
        b=VVmk/q5j++yg653lVRS21I2+f+ZT1i07gpEDKdiBmqDVCBcTKfNH/R0LufgXs9YG7K
         yVF6uNmpaxoj6aiwILnQ0k9Q3bbG54lwfzlHQjWw8IIDT6KE9LK6/NjdP9PEgaHTO55B
         49gMqyWgAO3b5nOqKhRXv7E4HKsXgskBliQ+TE42uhntGYWf8v6B9Qt3g/wj8SMp6jq8
         73JPRSvMT0Lz8EFwrCLyQP1LQL6Y/e5kpxto61KNruRfDTJYPlNgIaLNJ/zxWnhqXb4H
         5PG3I58l1EO/9I0X/PMXjOjFf4RuLI2ryC9cOEzjSEnaf2BPiUdwn7519QNZQojvYiKA
         iuyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiW+knDGyXxWQ7NttjztZygNGa+2IP4GisfpncN5XAALHnQcVKpyyW19JNZ6tMq0qHOedgqcNfKxihLxo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnchtsCW6yYBRuTEQj+wi+4E+LtnzWWWs2ZmcCxwRA1ASIUMH9
	1hyerTwEzPgbQKk1cRByBgjREwfrWKs1lxq7SpVCcK6LiswF2uFFD8SSKLPs50LWi2r2JFl4Pzz
	e3rUCdhyjk9jBocuHzjMSSgMWbS8=
X-Gm-Gg: ASbGncsya9tGcsfsuCok2oWSyNg6zkb8svgWt9iIg/e4Kdhdgq2ammnNMzibEqFpXJj
	CYCb2/gwXJHb7v4rIBU319IZHqoeEuecTUJ4RSoUgJF0G0hz0lN4+0CxIIcH01VWJh0pJ0lqgKb
	qmUZyO+EeDppnEZL0vRNiCwRM=
X-Google-Smtp-Source: AGHT+IEVIMg1jbsWuAJnV/hnlgtQ1pf3ApeF1yQUNvNx/Ilqvnpyt4hd9rrLIrLPSHTBiJgvnec04sgIOEeOpwxZcQQ=
X-Received: by 2002:ac8:5f4a:0:b0:476:8ee8:d8a1 with SMTP id
 d75a77b69052e-47ad81674c7mr106341cf.45.1744772150790; Tue, 15 Apr 2025
 19:55:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325014733.18405-1-xuewen.yan@unisoc.com> <CAKfTPtA06D1EGg2VdVHt-P0PDE-1XZVJOp3myZPSNknnFT3nNg@mail.gmail.com>
In-Reply-To: <CAKfTPtA06D1EGg2VdVHt-P0PDE-1XZVJOp3myZPSNknnFT3nNg@mail.gmail.com>
From: Xuewen Yan <xuewen.yan94@gmail.com>
Date: Wed, 16 Apr 2025 10:55:40 +0800
X-Gm-Features: ATxdqUH2t1gr0NGV19AlAejpSL8vcj7lw6C6UpPex3TbM96TTtNjQswJRHYXvvw
Message-ID: <CAB8ipk_uOKn+U0ozZyaQ8J9OjifoZWSh-9NUQ9UD+K-kLV28vw@mail.gmail.com>
Subject: Re: [PATCH v2] sched/uclamp: Align uclamp and util_est and call
 before freq update
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Xuewen Yan <xuewen.yan@unisoc.com>, dietmar.eggemann@arm.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	hongyan.xia2@arm.com, qyousef@layalina.io, ke.wang@unisoc.com, 
	di.shen@unisoc.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 1:05=E2=80=AFAM Vincent Guittot
<vincent.guittot@linaro.org> wrote:
>
> On Tue, 25 Mar 2025 at 02:48, Xuewen Yan <xuewen.yan@unisoc.com> wrote:
> >
> > When task's uclamp is set, we hope that the CPU frequency
> > can increase as quickly as possible when the task is enqueued.
> > Because the cpu frequency updating happens during the enqueue_task(),
>
> Strictly speaking, it doesn't happen during enqueue_task but when :
> - attach/detach tasks when migrating
> - update_load_avg decayed
> - io_wait
>
> This often happens during an enqueue but not always ...

Okay, I would make some adjustments to these descriptions.

>
> > so the rq's uclamp needs to be updated before the task is enqueued,
>
> this doesn't ensure that new rq's uclamp will be taken into account

Did I miss something?

As following stack:
enqueue_task_fair()
update_load_avg()
cfs_rq_util_change(cfs_rq, 0);
cpufreq_update_util()
  sugov_update_shared()
    sugov_next_freq_shared()
     sugov_get_util()
        effective_cpu_util()
            *min =3D max(irq + cpu_bw_dl(rq), uclamp_rq_get(rq, UCLAMP_MIN)=
);
            *max =3D min(scale, uclamp_rq_get(rq, UCLAMP_MAX));

So, the rq's uclamp value should update before enqueue_task().
>
> > just like util_est.
>
> just like util_est
>
> > So, aline the uclamp and util_est and call before freq update.
>
> nit s/aline/align/ ?
align.
>
> >
> > For sched-delayed tasks, the rq uclamp/util_est should only be updated
> > when they are enqueued upon being awakened.
> > So simply the logic of util_est's enqueue/dequeue check.
> >
> > Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
> > ---
> > v2:
> > - simply the util-est's en/dequeue check;
> > ---
> > Previous discussion:
> > https://lore.kernel.org/all/CAB8ipk8pEvOtCm-d0o1rsekwxPWUHk9iBGtt9TLTWW=
-iWTQKiA@mail.gmail.com/
> > https://lore.kernel.org/all/84441660bef0a5e67fd09dc3787178d0276dad31.17=
40664400.git.hongyan.xia2@arm.com/T/#u
> > https://lore.kernel.org/all/CAB8ipk9LpbiUDnbcV6+59+Sa=3DAi7tFzO=3D=3D=
=3DmpLD3obNdV4=3DJ-A@mail.gmail.com/T/#u
> > https://lore.kernel.org/all/aa8baf67-a8ec-4ad8-a6a8-afdcd7036771@arm.co=
m/
> > ---
> >  kernel/sched/core.c | 17 ++++++++++-------
> >  kernel/sched/fair.c |  4 ++--
> >  2 files changed, 12 insertions(+), 9 deletions(-)
> >
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index 042351c7afce..72fbe2031e54 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -1747,7 +1747,7 @@ static inline void uclamp_rq_dec_id(struct rq *rq=
, struct task_struct *p,
> >         }
> >  }
> >
> > -static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p)
> > +static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p,=
 int flags)
> >  {
> >         enum uclamp_id clamp_id;
> >
> > @@ -1763,7 +1763,8 @@ static inline void uclamp_rq_inc(struct rq *rq, s=
truct task_struct *p)
> >         if (unlikely(!p->sched_class->uclamp_enabled))
> >                 return;
> >
> > -       if (p->se.sched_delayed)
> > +       /* Only inc the delayed task which being woken up. */
> > +       if (p->se.sched_delayed && !(flags & ENQUEUE_DELAYED))
> >                 return;
> >
> >         for_each_clamp_id(clamp_id)
> > @@ -2031,7 +2032,7 @@ static void __init init_uclamp(void)
> >  }
> >
> >  #else /* !CONFIG_UCLAMP_TASK */
> > -static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p)=
 { }
> > +static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p,=
 int flags) { }
> >  static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)=
 { }
> >  static inline void uclamp_fork(struct task_struct *p) { }
> >  static inline void uclamp_post_fork(struct task_struct *p) { }
> > @@ -2067,12 +2068,14 @@ void enqueue_task(struct rq *rq, struct task_st=
ruct *p, int flags)
> >         if (!(flags & ENQUEUE_NOCLOCK))
> >                 update_rq_clock(rq);
> >
> > -       p->sched_class->enqueue_task(rq, p, flags);
> >         /*
> > -        * Must be after ->enqueue_task() because ENQUEUE_DELAYED can c=
lear
> > -        * ->sched_delayed.
> > +        * Can be before ->enqueue_task() because uclamp considers the
> > +        * ENQUEUE_DELAYED task before its ->sched_delayed gets cleared
> > +        * in ->enqueue_task().
> >          */
> > -       uclamp_rq_inc(rq, p);
> > +       uclamp_rq_inc(rq, p, flags);
> > +
> > +       p->sched_class->enqueue_task(rq, p, flags);
> >
> >         psi_enqueue(p, flags);
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index c798d2795243..c92fee07fb7b 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -6930,7 +6930,7 @@ enqueue_task_fair(struct rq *rq, struct task_stru=
ct *p, int flags)
> >          * Let's add the task's estimated utilization to the cfs_rq's
> >          * estimated utilization, before we update schedutil.
> >          */
> > -       if (!(p->se.sched_delayed && (task_on_rq_migrating(p) || (flags=
 & ENQUEUE_RESTORE))))
> > +       if (!p->se.sched_delayed || (flags & ENQUEUE_DELAYED))
>
> commit message doesn't explain why you change util_est condition

Because, the sched_delayed flag is set when dequeue_entity, and clear
after the condition,
so for migrating/prio_change, we could just check the sched_delayed.
And for the wakeup, because the the sched_delayed flag is cleared after thi=
s,
so use the ENQUEUE_DELAYED flag to ensure the util_est could enqueue.

>
> >                 util_est_enqueue(&rq->cfs, p);
> >
> >         if (flags & ENQUEUE_DELAYED) {
> > @@ -7168,7 +7168,7 @@ static int dequeue_entities(struct rq *rq, struct=
 sched_entity *se, int flags)
> >   */
> >  static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, in=
t flags)
> >  {
> > -       if (!(p->se.sched_delayed && (task_on_rq_migrating(p) || (flags=
 & DEQUEUE_SAVE))))
> > +       if (!p->se.sched_delayed)
>
> same here, you should explain in commit message why it's okay to do so

Same as above,  the sched_delayed flag is set when dequeue_entity, so
this place,
the sched_delayed was not set when sleeping, If the flag is set, it
indicates that it
was migrating or prio changing.

By the way, I will kindly update these reasons in the commit message.

Thanks!

BR
---
xuewen
