Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED2D184E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909271; cv=none; b=juKArjgAOW0L7PH98m+Dzf1ahQlrnd4r+jq7BP1/zR4V/tMo8FPCWj+0D8JFpangoYLqNg4Nt1q5YcD7qQbgvkdqCqjdH7IQ4Ww1cnhfQOyN+edJnN3YY/ebx7NJ61VVaK15cY0EgY+RLxtpxOjls3IQq/0Oz36m5DytRplW4N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909271; c=relaxed/simple;
	bh=zU66N6f4F9aXPoAaKPu+AZ3HzgLnJqL06cTiChM6jTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ex6JhsKcmO9csYpmP6XDxCZ48ZTMURuRrp5edRxPUV6zxm34f3AV41dqIIEv+1J/VCcipkWi/TKkTStew96CubfjfDoV3OQUm6Z7vZAxoHsg+xmeNi6POE4cvQb51RFPEqrnKwSUx2c7oDbvOdvxREqi9Ff5W3EDqRRsEbfxQK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iukw5QAL; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iukw5QAL"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ace3b03c043so864101366b.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745909268; x=1746514068; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lrl60vz+rZ8vtzjAChIb/BFMt+QrcIIajFlCpafu4jE=;
        b=iukw5QALDSw//rHFNBR5xmw7Ib65mrRzEPyyTRwO7WJNNWRkX2TlDsPcyhafEy0UDM
         2FbNbg0QTYOtRwVa6PTIFQPmYCTZGOFojVi9a+GLAaiZk8yUmFdoDohyy/9FO47ewZk0
         zKmaqNYNTmxVVyNfpP4qiTXVP6yUt3kzoi8tqJNWy/vqQisPckgdmOipMuDgZDThzlxw
         L+oRor63G0V8r815lBHyQfU83MUgJC5bWA4c+HH1oDiKMP8Dk2YlL8grjpQEBEdUbiTa
         tfKFrkoFpLka7zMchbVl1zruMio0UGvECCV5VkfN96nsVncfuKDt+4x7F9vrz02VVS6X
         gA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745909268; x=1746514068;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrl60vz+rZ8vtzjAChIb/BFMt+QrcIIajFlCpafu4jE=;
        b=hhTaQFeeOVHq4dDzf4jlTSp0mYrYYAh/0ycN2Ab0sK+d5xxoA7OQX6w0RoJjnPsavf
         orQHJTGbI2YXmwvYhqsybh7Y4HXppHUEV3tmHW2mb/QlhRBQjHOc6G2mOYptU8O30am2
         JR16d5ArW1vPI2FS2ku4bIDnnDObZ54K7Xr6ukZ8941P+D1TvwuSy8KQK1CeRaZWGCMZ
         zbjDKs9bhWcXU+KJpV+2Ps8rIp8pl7UgcGVwwC8VbSrDJ8Sh8K9IJ1U5S/Qw6vXHpbdi
         Wz6nQEDb7ZzHQYZy1Emx4TDQF0560yfnYEojslokwjp9CnWwKzIxdKeBfEQzQXXADgMD
         IDbA==
X-Forwarded-Encrypted: i=1; AJvYcCUEOTG1iK49nKgL9mNRlg4f/IzDSn2kh7DDknVd0ttRoJ/UQnU/Mb/nBCxYQqC8o/HgWrM6wzlfh5c0cho=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaeYsOqDmNXtmPU/XV4jjdIjG/jNxYYAJmrazjW0VY7My5BLVR
	HOlAQzcT0tbS0tp2I0SQpEPGqf+qFPCfPPCEmoPn4lM/4Zdo4aaUWumnjwsldLsrDRQzwiQ+sFL
	/aVV8DQhpvcklOSZMv+LTW8z2xPefE4efOrSw5g==
X-Gm-Gg: ASbGncv2papesjHWujANJxLrx/Q0M6/Veh6c3kkLYWhH/3VM5jGZ6E+1mwHdylIZ1jM
	9TQwvpiXUhCBXvsXQy+xIVgJ3uJS2f3j0FF1KnWMRVkPUipR3sdDxOlAtyuwpvTOGxa6BIi8aMG
	igZ2OPtt+l1BJVZfwMFVVicNtpxWUrksHEAGVzrRhfrES31e/vTkA=
X-Google-Smtp-Source: AGHT+IH68bqVge8LS3fhLaj43yel0Pa5trL5bBlgIPEeJRLNsTrlAfEWSu2BmTFAO5qoRlaA/ab61Yh0OZDR5aUaxNA=
X-Received: by 2002:a17:907:7f8d:b0:ace:c3b7:de7b with SMTP id
 a640c23a62f3a-acec84b7f88mr143641966b.11.1745909267881; Mon, 28 Apr 2025
 23:47:47 -0700 (PDT)
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
Date: Tue, 29 Apr 2025 08:47:36 +0200
X-Gm-Features: ATxdqUFxGmGgJUXBbZ93WrlZWr1uURPO05V5jCyPZuBN6vplMvjqQoIyxETnE3k
Message-ID: <CAKfTPtBmQrGvxOQ6czeiEG+_vq=AKumL=osU+EN9xLkuFBvEFg@mail.gmail.com>
Subject: Re: [PATCH] sched/fair: Increase max lag clamping
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	linux-kernel@vger.kernel.org, dhaval@gianis.ca
Content-Type: text/plain; charset="UTF-8"

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

I tested the patch and the1st tests look ok with the changes below
which fix the copy-paste :-)

I will run few more tests

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

max(max_slice, root->max_slice);

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

              if (rse->max_slice > se->max_slice)

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
