Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96945242D69
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745403605; cv=none; b=M9ITKYm/fQ/GfsMAPaI8e/L96U236UACGOkLU1EpFavxVU/oGw6MSxXSj0y0Cd5cyRyjZtbr8k1mkkOTqImZ7ysyOWvG55I5p3mtqPWGBFM4niU9JowgBlkWSDO9XZ9RAkChyrF66EDrSQU6F1y4/6royY72eQ7Zu+XIFsEfut8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745403605; c=relaxed/simple;
	bh=Y5WhhHoTooSeCgTbRixLjPy4xiZ1x/HplHdocuD3LRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Moy/slgkjmrcA4e1YmxS5OQ0F8GfTCI6VbMAc/sMuBJIhd+blbLHAhbGKacjMfZbtcAfhjRmYv+u1qJv9g6PMoREX6SVhD1RwUiJ8ycmVZB9FSdhLn5wi//0gwVLsCbMHzPNfCBJL/Dq6447bfIVeJG9Igg2Qq9nlJq/dIkqGnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K4tnuNvZ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K4tnuNvZ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac345bd8e13so882477066b.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745403602; x=1746008402; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s2vdS/sQrACs5XpBhnJifnqgEvAwBwUZAEYFyylpqvk=;
        b=K4tnuNvZmFa5WAqFAY03eM4SIxM4mDgYzsfoZz/aP8sdwQ2Myp5GYXDoWDAxlepUfp
         gizE7Bs9fl4ZXbyOrUEniRnWpnArT8goZjs6kVOYEhUcZfkaidZ6QbRTntD0vwcmIhMB
         gzdnjvZh80+EU9TMau1LkXJW4E5+T8Mfx41hroTBVZpWwEkj50yDOcrMffI8thhuDVkr
         NE+O4JaiLV3gRPQM3bVK9TQvDSI0WAS/O0fC3vl+oMbBqyWEHh3UnCFo3r2ZS2x9i0xH
         JKF9htWGSaxmYwGT290iCxgtGO2cHPMkZIhx+fCWYkMO2qYEV5xXqJLkeG0eAzwketNm
         jEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745403602; x=1746008402;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2vdS/sQrACs5XpBhnJifnqgEvAwBwUZAEYFyylpqvk=;
        b=GSN2U1MkRwYvJ8r53Y5d5+KSVs3xfN/HM9cq2BQ+2L2ht4XO8PkMGpIDtTG/zq0+7g
         oqfA3AHr6Z2r5GeFRjOgBk5y0m85n2vuoEJgbtJK+AN8hkImYNYsAFMtOPZTyOvuzG6O
         cyLSSZoX7eQPMB1FDUv5v7QRE39NXD0AA+KqPmJU9dC9ssylxBhCFZY0/jpPmzjzQCDi
         babDcTnhX/9lpGX5TkQoV+T3dtyS+VSJW6gn+omwHMzlQgkw7vZ3vOPTgKuJAJBYViS0
         vUYoR6L5b+4EY94qhCpja/moO8ulRrHElsr4MtE4tC4BytkcjrIvF4JLcBZ32IPqEoX+
         IEyA==
X-Forwarded-Encrypted: i=1; AJvYcCWS7R2N8nYbobczy0kHpUYNsGSpRx0f/oDT5acTwnPhEwIAnkoIn2Rg2UsIu75GLAvZUdjagHDNA3rLgwk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfuTFE8auT1fgPObuMsdDLAIc/fN3CEBXv5jxhkfZuHIXJcsQn
	5e3IUGdDJXBfVyNnXLZSpHt2I458qpGaYZ5Xhz1fn2qZoFV3iAy4AZR2Ft2LMP3aFGVAGFo/8O8
	UJhwlM70FLb6fxgLrH+n3ac9dV5a/MhZb29+hJA==
X-Gm-Gg: ASbGnctZ5gLbOTdlzYxOI21uNGTxq/iS2i5fNX5HsUYoTVGAmnuMWYeJb+b42JImtGu
	eNjFr0RLc5j/mp9ekeF1PBQlDD4IoTAFi/PUXsAIAfOyKFnoDw4NiUQpMdCWI6fE2WC5XVpgtOe
	FYNoP0vsHsiX5rr/u2gfscfAhwbNl01uQzYOUCmzNR4X7FIBPe8LsjlNdAmauiWw==
X-Google-Smtp-Source: AGHT+IEWSPIlARmqhfPiw6LIaQrR8Cc9JW8AVGxXz7K0qY6TzzsEgLVrPFA57OjF65DQeT1E6lffvU0m9YgD/u8jT4I=
X-Received: by 2002:a17:907:d1b:b0:ac6:fcdd:5a97 with SMTP id
 a640c23a62f3a-acb74db7d2dmr1989843266b.48.1745403601688; Wed, 23 Apr 2025
 03:20:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418151225.3006867-1-vincent.guittot@linaro.org>
 <20250418155115.GI17910@noisy.programming.kicks-ass.net> <20250422101628.GA33555@noisy.programming.kicks-ass.net>
In-Reply-To: <20250422101628.GA33555@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 23 Apr 2025 12:19:50 +0200
X-Gm-Features: ATxdqUF5Kg7T350hC-fvlOEipmNyhGv_obCQxfzuJ59QFYlo4NrTFKSpdPDPxNs
Message-ID: <CAKfTPtDCDZtmc-kNthF-txf4-J8byROSbPseQ_b6W+Q0Q2W9xQ@mail.gmail.com>
Subject: Re: [PATCH] sched/fair: Increase max lag clamping
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	linux-kernel@vger.kernel.org, dhaval@gianis.ca
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

On Tue, 22 Apr 2025 at 12:16, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, Apr 18, 2025 at 05:51:15PM +0200, Peter Zijlstra wrote:
> > On Fri, Apr 18, 2025 at 05:12:25PM +0200, Vincent Guittot wrote:
> > > sched_entity lag is currently limited to the maximum between the tick and
> > > twice the slice. This is too short compared to the maximum custom slice
> > > that can be set and accumulated by other tasks.
> > > Clamp the lag to the maximum slice that a task can set. A task A can
> > > accumulate up to its slice of negative lag while running to parity and
> > > the other runnable tasks can accumulate the same positive lag while
> > > waiting to run. This positive lag could be lost during dequeue when
> > > clamping it to twice task's slice if task A's slice is 100ms and others
> > > use a smaller value like the default 2.8ms.
> > >
> > > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > > ---
> > >  kernel/sched/fair.c | 16 +++++++++-------
> > >  1 file changed, 9 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > index a0c4cd26ee07..1c2c70decb20 100644
> > > --- a/kernel/sched/fair.c
> > > +++ b/kernel/sched/fair.c
> > > @@ -683,15 +683,17 @@ u64 avg_vruntime(struct cfs_rq *cfs_rq)
> > >   * is possible -- by addition/removal/reweight to the tree -- to move V around
> > >   * and end up with a larger lag than we started with.
> > >   *
> > > - * Limit this to either double the slice length with a minimum of TICK_NSEC
> > > - * since that is the timing granularity.
> > > - *
> > > - * EEVDF gives the following limit for a steady state system:
> > > + * Limit this to the max allowed custom slice length which is higher than the
> > > + * timing granularity (the tick) and EEVDF gives the following limit for
> > > + * a steady state system:
> > >   *
> > >   *   -r_max < lag < max(r_max, q)
> > >   *
> > >   * XXX could add max_slice to the augmented data to track this.
> > >   */
> >
> > Right, its that max_slice XXX there.
> >
> > I think I've actually done that patch at some point, but I'm not sure
> > where I've placed it :-)
>
> No matter, I've redone it by copy-paste from min_slice.
>
> How's something like this then?

Thanks, I will test it

>
> ---
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index f96ac1982893..9e90cd9023db 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -573,6 +573,7 @@ struct sched_entity {
>         u64                             deadline;
>         u64                             min_vruntime;
>         u64                             min_slice;
> +       u64                             max_slice;
>
>         struct list_head                group_node;
>         unsigned char                   on_rq;
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 84916c865377..7c3c95f5cabd 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -676,6 +676,8 @@ u64 avg_vruntime(struct cfs_rq *cfs_rq)
>         return cfs_rq->min_vruntime + avg;
>  }
>
> +static inline u64 cfs_rq_max_slice(struct cfs_rq *cfs_rq);
> +
>  /*
>   * lag_i = S - s_i = w_i * (V - v_i)
>   *
> @@ -689,17 +691,16 @@ u64 avg_vruntime(struct cfs_rq *cfs_rq)
>   * EEVDF gives the following limit for a steady state system:
>   *
>   *   -r_max < lag < max(r_max, q)
> - *
> - * XXX could add max_slice to the augmented data to track this.
>   */
>  static void update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  {
> +       u64 max_slice = cfs_rq_max_slice(cfs_rq) + TICK_NSEC;
>         s64 vlag, limit;
>
>         WARN_ON_ONCE(!se->on_rq);
>
>         vlag = avg_vruntime(cfs_rq) - se->vruntime;
> -       limit = calc_delta_fair(max_t(u64, 2*se->slice, TICK_NSEC), se);
> +       limit = calc_delta_fair(max_slice, se);
>
>         se->vlag = clamp(vlag, -limit, limit);
>  }
> @@ -795,6 +796,21 @@ static inline u64 cfs_rq_min_slice(struct cfs_rq *cfs_rq)
>         return min_slice;
>  }
>
> +static inline u64 cfs_rq_max_slice(struct cfs_rq *cfs_rq)
> +{
> +       struct sched_entity *root = __pick_root_entity(cfs_rq);
> +       struct sched_entity *curr = cfs_rq->curr;
> +       u64 max_slice = 0ULL;
> +
> +       if (curr && curr->on_rq)
> +               max_slice = curr->slice;
> +
> +       if (root)
> +               max_slice = min(max_slice, root->max_slice);
> +
> +       return max_slice;
> +}
> +
>  static inline bool __entity_less(struct rb_node *a, const struct rb_node *b)
>  {
>         return entity_before(__node_2_se(a), __node_2_se(b));
> @@ -820,6 +836,15 @@ static inline void __min_slice_update(struct sched_entity *se, struct rb_node *n
>         }
>  }
>
> +static inline void __max_slice_update(struct sched_entity *se, struct rb_node *node)
> +{
> +       if (node) {
> +               struct sched_entity *rse = __node_2_se(node);
> +               if (rse->max_slice < se->max_slice)
> +                       se->max_slice = rse->max_slice;
> +       }
> +}
> +
>  /*
>   * se->min_vruntime = min(se->vruntime, {left,right}->min_vruntime)
>   */
> @@ -827,6 +852,7 @@ static inline bool min_vruntime_update(struct sched_entity *se, bool exit)
>  {
>         u64 old_min_vruntime = se->min_vruntime;
>         u64 old_min_slice = se->min_slice;
> +       u64 old_max_slice = se->max_slice;
>         struct rb_node *node = &se->run_node;
>
>         se->min_vruntime = se->vruntime;
> @@ -837,8 +863,13 @@ static inline bool min_vruntime_update(struct sched_entity *se, bool exit)
>         __min_slice_update(se, node->rb_right);
>         __min_slice_update(se, node->rb_left);
>
> +       se->max_slice = se->slice;
> +       __max_slice_update(se, node->rb_right);
> +       __max_slice_update(se, node->rb_left);
> +
>         return se->min_vruntime == old_min_vruntime &&
> -              se->min_slice == old_min_slice;
> +              se->min_slice == old_min_slice &&
> +              se->max_slice == old_max_slice;
>  }
>
>  RB_DECLARE_CALLBACKS(static, min_vruntime_cb, struct sched_entity,
> @@ -852,6 +883,7 @@ static void __enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
>         avg_vruntime_add(cfs_rq, se);
>         se->min_vruntime = se->vruntime;
>         se->min_slice = se->slice;
> +       se->max_slice = se->slice;
>         rb_add_augmented_cached(&se->run_node, &cfs_rq->tasks_timeline,
>                                 __entity_less, &min_vruntime_cb);
>  }
