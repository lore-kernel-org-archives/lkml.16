Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5D62E3AEC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 09:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751622493; cv=none; b=KDJ3CtzBVqqAfBC20srKOea7jBCgOgL8aFNL8jRhAj6mtmqaIOWcoflgQLbeXfQgh76ojxuaNX8TCIyM5vkH0oYtwb7zrm0u5TlIEskEMZUCnvy8+V3CPtAzOaAt1TbPMS16u4F4MrHbcE6ALG8nn3gUlT7q1d4ry718EDyS+Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751622493; c=relaxed/simple;
	bh=/tzfyDXt+5ilZkHINu1zLNJ5EhAmmilg6YaeUpuO80A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o0Cv10TuWd3/luFd6z2s13/9/UsTlYLsNY82rvJCgwCx1DJrcwURO+/NAkDarKL8x2bk24eWE7AbSkm0I3x4mr4idahuRHzfnxQ7gKKBVf0peMLKu4zCNN9QHY0TAFrX233KZSDxi1bmcWaGaxtnnRPjiGsG6EoSX6MXyLYYImY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=eHVJBMxX; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="eHVJBMxX"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23c8a505177so1549545ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 02:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751622491; x=1752227291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kqzFSWVT0CEMlX4YaSd4jCSFf7mKERmjShUwDZ++GeE=;
        b=eHVJBMxXfpFxImLMPK5MDPa/IrOXpoivTKSWOr4l/TJT1/+E35kkSNJwvtbye95AQq
         SqEIQ8qn2l/DLnHBalA+Yt/XKTbuij9yLO0wAIl9LACT6inzWmgag+S0LqytYs/yO/RL
         7aF/qI/VtIBqJEf4o/Ba6PUrcjSZSq8eZD/XCAL/qjrQBr5eX7P3f4RIyQXg3MZRr0DQ
         QL5TNRuXqZpAUgsBoejGeHDasxz/q3CIb8Hf9JGEXsgviNIPTltFn+bV/LVRSy8EuBEy
         /BJNJLGBwW+paigvkV1ZpE3XSgw97vhtuD6maSPnqnLQ9Er1Sai9iUn5lW/d4xbYRfxX
         yUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751622491; x=1752227291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqzFSWVT0CEMlX4YaSd4jCSFf7mKERmjShUwDZ++GeE=;
        b=vfA6iKMlNohNO9ZiVfTGeKK51O/NhP6z+7ph79XbLn6Rjgxte1URFYO9/Fbc7xYknM
         RSbDNQ+Gvz88JFxV8jwMMw5gB94yxLneG8m+RdIjs2OA9tCsVzuT+wRPJSwOG+vJtAam
         7MHML0ndeN0RoxdPxmc2h07rq6jjIGIfe0GJ83ioP7smn38sA987tHlBv/VPzx4mAHOJ
         6ySvV10MvDBaW7s043Zo8RUEdiUOJblAlZlQhJ7+INK7pfFBIE7cJ9Fm1DFDg0lNGIVA
         mf25ixpaPxxF5AM23DCF7+wGd6Hs2Xh3fR1uvOGlWgZiRvRcAYNVES8jnWo6K2mgnwoV
         Y5hg==
X-Forwarded-Encrypted: i=1; AJvYcCXaJTRZ0hGSP9p+StNVs2zeU6zsymzt7nb3d28lk4OuPg06mg8U3tvu6jKCyr07KZnd/DF9JHRO1N+irD4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCGbCSKJBBQ9qh8QZQnkq5UKxFMtphV8tTZ/R881nEQFARIYFL
	WYXtIa88GgF14rDMSgUq0Nvm0HADMfROK+gZqizUXNdhxb8d4mW+2Ib3Am6HFOms4g==
X-Gm-Gg: ASbGncsF+Bd5bZHavKS9jh+agfKf2ue8IhrxNf3Xw/Gq0DDVVGksXWtVhQ823kD/3FR
	JDdHLFUGrPoKgcEWmMmTxn6lpj1M0b7m7ZfhkQxNRbPgJpnzC9pIe0vzqXtai10xWT49FTWu7RM
	dX4A4I3hV0/NEs0s3VKDe6SKyYqLz33bYYQFKhjk10/UmY7NNTlmG3qSM5AECqV5Op6GiAHevan
	kIciFRX0+jmZQADve5f0L4TdTno7wVcpnxzNZ+wz05dnjx94taSvFQxZGL3hH6lF5VtX1IfzAET
	hFAKsXW+swPbbslxTqPppsYSN4mOa+g/HK7TUpPcpyKkqQlgUbaY3thUdxSDyxf4K8BWvYJ+AQF
	Zu22I8g4=
X-Google-Smtp-Source: AGHT+IGPL1iB8wcuES3AKv491OrMgf2cni17T7HuKDEal5mdHa+p491dn93eMACg8jv6kw0s6ZHAbg==
X-Received: by 2002:a17:90b:5845:b0:313:2adc:b4c4 with SMTP id 98e67ed59e1d1-31aac4f0636mr3173205a91.24.1751622490884;
        Fri, 04 Jul 2025 02:48:10 -0700 (PDT)
Received: from bytedance ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a9cc4c800sm4318798a91.5.2025.07.04.02.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 02:48:09 -0700 (PDT)
Date: Fri, 4 Jul 2025 17:47:50 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Benjamin Segall <bsegall@google.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Valentin Schneider <vschneid@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: Re: [PATCH v2 0/5] Defer throttle when task exits to user
Message-ID: <20250704094750.GA1654@bytedance>
References: <20250618081940.621-1-ziqianlu@bytedance.com>
 <xm26qzyyb6cn.fsf@google.com>
 <dc54a6ab-2529-4def-ae7d-6a217e3bc1bc@amd.com>
 <20250704075430.GA1641@bytedance>
 <b4461e54-ab3c-4596-8da2-ffbd4c7d87b6@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4461e54-ab3c-4596-8da2-ffbd4c7d87b6@amd.com>

Hi Prateek,

On Fri, Jul 04, 2025 at 02:18:49PM +0530, K Prateek Nayak wrote:
> Hello Aaron,
> 
> On 7/4/2025 1:24 PM, Aaron Lu wrote:
> > On Fri, Jul 04, 2025 at 10:04:13AM +0530, K Prateek Nayak wrote:
> > > Hello Ben,
> > > 
> > > On 7/3/2025 3:30 AM, Benjamin Segall wrote:
> > > > Aaron Lu <ziqianlu@bytedance.com> writes:
> > > > 
> > > > > For pelt clock, I chose to keep the current behavior to freeze it on
> > > > > cfs_rq's throttle time. The assumption is that tasks running in kernel
> > > > > mode should not last too long, freezing the cfs_rq's pelt clock can keep
> > > > > its load and its corresponding sched_entity's weight. Hopefully, this can
> > > > > result in a stable situation for the remaining running tasks to quickly
> > > > > finish their jobs in kernel mode.
> > > > 
> > > > I suppose the way that this would go wrong would be CPU 1 using up all
> > > > of the quota, and then a task waking up on CPU 2 and trying to run in
> > > > the kernel for a while. I suspect pelt time needs to also keep running
> > > > until all the tasks are asleep (and that's what we have been running at
> > > > google with the version based on separate accounting, so we haven't
> > > > accidentally done a large scale test of letting it pause).
> > > 
> > > Thinking out loud ...
> > > 
> > > One thing this can possibly do is create a lot of:
> > > 
> > >    throttled -> partially unthrottled -> throttled
> > > 
> > > transitions when tasks wakeup on throttled hierarchy, run for a while,
> > > and then go back to sleep. If the PELT clocks aren't frozen, this
> > > either means:
> > > 
> > > 1. Do a full walk_tg_tree_from() placing all the leaf cfs_rq that have
> > >     any load associated back onto the list and allow PELT to progress only
> > >     to then remove them again once tasks go back to sleep. A great many of
> > >     these transitions are possible theoretically which is not ideal.
> > > 
> > 
> > I'm going this route, becasue it is kind of already the case now :)
> > 
> > I mean throttled cfs_rqs are already added back to the leaf cfs_rq
> > list during enqueue time, to make the assert_list_leaf_cfs_rq(rq); at
> > the bottom of enqueue_task_fair() happy when a task is enqueued to a
> > throttled cfs_rq.
> > 
> > I'm sorry if this is not obvious in this series, I guess I put too many
> > things in patch3.
> > 
> > Below is the diff I cooked on top of this series to keep pelt clock
> > running as long as there is task running in a throttled cfs_rq, does it
> > look sane?
> > 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index d869c8b51c5a6..410b850df2a12 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -5290,8 +5290,15 @@ enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
> >   	se->on_rq = 1;
> >   	if (cfs_rq->nr_queued == 1) {
> > +		struct rq *rq = rq_of(cfs_rq);
> > +
> >   		check_enqueue_throttle(cfs_rq);
> >   		list_add_leaf_cfs_rq(cfs_rq);
> > +		if (cfs_rq->pelt_clock_throttled) {
> > +			cfs_rq->throttled_clock_pelt_time += rq_clock_pelt(rq) -
> > +				cfs_rq->throttled_clock_pelt;
> > +			cfs_rq->pelt_clock_throttled = 0;
> > +		}
> 
> At this point we've already done a update_load_avg() above in
> enqueue_entity() without unfreezing the PELT clock. Does it make
> sense to do it at the beginning?
>

My thinking is, when the first entity is enqueued, the cfs_rq should
have been throttled so the update_load_avg() done above should do nothing
since its pelt clock is frozen(so no decay should happen). Then after the
entity is added, this throttled cfs_rq's pelt clock is unfrozen and load
can be updated accordingly.

Thinking it another way, when we move the unfreezing earlier, the delta
calculated in __update_load_sum() should be zero because
cfs_rq->throttled_clock_pelt_time is adjusted and the "now" value
derived from cfs_rq_clock_pelt() should be the same as last update time.

Does this make sense or do I mis-understand it?

> Overall idea seems sane to me. I was thinking if anything can go
> wrong by only unfreezing the PELT for one part of the hierarchy but
> I suppose the other cfs_rq can be considered individually throttled
> and it should turn out fine.
> 

Unfreezing the PELT for only one part seems problematic, I suppose we
will have to propagate the load upwards all the way up to let the root
level sched entity have a correct load setting so that when it needs to
compete for cpu resources, it gets the correct share. I assume this is
why Ben think it is better to keep the pelt clock running as long as
there is task running.

Note that the pelt clock is only frozen when the cfs_rq has no tasks
running, and gets unfrozen when the first entity is enqueued or at
unthrottle time. So when a new task is enqueued, at each level's
enqueue_entity():
- if it's the first entity of a throttled cfs_rq, then its PELT clock
  will be unfrozen;
- if it's not the first entity, that means the cfs_rq's pelt clock is
  not frozen yet.
So in the end, we should not have a partial unfrozen hiearchy. At least,
that's my intention, please let me know if I messed up :)

Thanks for the quick review!

Best regards,
Aaron
