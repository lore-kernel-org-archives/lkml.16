Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76502F41
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747918193; cv=none; b=Op9ktjN7tExAQwBmNJRhSVgkcniA16DqwMsnmJ5zmAqd8IRObd6eR7KHuN7qLfpyRxCg0qhoNlV9T0CMQX/M3dXZR6o63MXRYa6x6HxHhOE/sc2ExWurhMPCfkuqJiOV5Pk40uZ/caM/YEUvwO10PpsTU2XI0R1EMH9EqPd/z2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747918193; c=relaxed/simple;
	bh=PYX+dVJcWZx+zQj1QHCPErd0fdRHN69TrPRza5KIvJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dhi/WZ9W55tf0EeDVp0aHeHjTYzGHTvC3ZExR+FlrQVA8gm5NtJcgDSzgE+NjyctmYb563/es61Km//ONwByfl5KfiP4dyvgmPDme/eVma9kur31TEJRRQwmkWNNKbTw3IpG/1Pin6ARL1f7BjwB3KgBu7iiL2HnN6mJ2t91xPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=hmAoEcqe; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="hmAoEcqe"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-30e57a373c9so7857273a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747918191; x=1748522991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QEDH++8Bg2qV5SBpixsiMotVHmG//CzEmqGTuEGtq5o=;
        b=hmAoEcqeVrJxzF8uQwG8j8dO32BCqqSehLhcrwENFKRbSv1r+l4UVKhgLcglc9U03P
         g7abQ0+0OUyh3KmYmx7uNgyDQ2JJ7X/NZTXhka9isHpG/+NeJNXOKHAh2ENddlMKWME7
         QiZxhTut49cb032FdQ9iv33TuujwKaFWWc3KDLjRD0dHH1Dqm4GOZJL43PUCCyyZWa5I
         cFX9BWUQKMDaSg5jgo0HL1Y7E87YaVHBVh3UpwCWj6kK3wZnLnuEPHkZ2c4l5jcBH9b5
         YIjXtqaEMaUU8Lnyko6gELdaS44VydN6OvPVVDDcAnW1glftI1exIBsD23UYPZXnroxO
         Ho6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747918191; x=1748522991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEDH++8Bg2qV5SBpixsiMotVHmG//CzEmqGTuEGtq5o=;
        b=loEa3Sano46Nk2gVlNHu/1ITkc219F4wTs4gRRytdo5bRQOec1Prbn9SC/hdq1xg53
         StcGVoj/PNO9S/4rHLt/Ps2vZ0z12jJszdCUmK77PZK0g/B2mB/Zph6PdIVqS/zXnzp2
         MPv9Qn26ECaHLQE8THzJi274tbZ7VE3HuC0lTKf18dHNn6FHUmDi2/S/5XjOvTCKEX6P
         0iH36NRAlYCI5cp88kZrktCT1+k87SmG1qiwDKSa+LyxWeVvoi0Q6LUmA4xhne0Mv5VK
         Gg7Tr/TrP6f59Kzg2tsyOTjbHuU5VYPbUFuHunrw5hDQMcsJZnkWpTw2zMCxIflAQCdr
         5FJA==
X-Forwarded-Encrypted: i=1; AJvYcCUsnbzFDVDmqPuZdRkQDinf7d6I6g8/GlVSwmtTmvCOOj6t0F5WMtEX1F8n+GCpR7wn7p02tnG21hOxK/4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9SQbLxAC9Z20FG9lE/AG3HbhzbCsT0u1mAtcdB4RNAA2p+rme
	aIuKTsRPTh1is5Uz/1dYW9k9ZmX3cn6VHEYDKhv8iOno5RYVXZFZF1zGTIW3/faTqYNBv7+07bT
	doRE=
X-Gm-Gg: ASbGncvcIY2ZoAz5IhzpSLQdVvBaC/pCw29E6Ztz0nEQlGO8nL2u7liJBWff+xis9/O
	zCJXAp8yYZkv0HfDpSaXQXvXSgqNGTH9o+ZfgF4U9r5+o37Y37t4Ur1wOT2K2qEp0r/MIkCvjUJ
	U34y4yK/e9R8w+8OT+lTpuQHfX4bWqDTUKY5E0+xFRpoRiRLS0unV4ayVamTBQmN2wcMQpO0dOQ
	2Wikbm5AyMMgdqe+aGEwMFAq6LsxbXB3Ep0FETXdKYgStLU7+rm64xsd41u9wk1mg1EaaCjbbje
	eTTk5WRbjL7MjKYne/RdIkJg1L3f2iTM67E4dfwKgDyH1l8AJK8=
X-Google-Smtp-Source: AGHT+IFjmFKcHEpZiCZ5G7FxDzrLrOnL7yzQPC0M0dW3WNoGWhBZLad2wM/Ot9Ry6oG3kgiEuIJo8w==
X-Received: by 2002:a17:90b:1f8c:b0:2fc:3264:3666 with SMTP id 98e67ed59e1d1-30e7d5be34bmr37779578a91.30.1747918190755;
        Thu, 22 May 2025 05:49:50 -0700 (PDT)
Received: from bytedance ([115.190.40.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365c4e77sm5470998a91.12.2025.05.22.05.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 05:49:50 -0700 (PDT)
Date: Thu, 22 May 2025 20:49:43 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: Re: [PATCH 4/7] sched/fair: Take care of group/affinity/sched_class
 change for throttled task
Message-ID: <20250522124840.GC672414@bytedance>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-5-ziqianlu@bytedance.com>
 <20250522120336.GI39944@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522120336.GI39944@noisy.programming.kicks-ass.net>

On Thu, May 22, 2025 at 02:03:36PM +0200, Peter Zijlstra wrote:
> On Tue, May 20, 2025 at 06:41:07PM +0800, Aaron Lu wrote:
> > On task group change, for tasks whose on_rq equals to TASK_ON_RQ_QUEUED,
> > core will dequeue it and then requeued it.
> > 
> > The throttled task is still considered as queued by core because p->on_rq
> > is still set so core will dequeue it, but since the task is already
> > dequeued on throttle in fair, handle this case properly.
> > 
> > Affinity and sched class change is similar.
> > 
> > Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
> > ---
> >  kernel/sched/fair.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> > 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 74bc320cbc238..4c66fd8d24389 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -5866,6 +5866,10 @@ static void throttle_cfs_rq_work(struct callback_head *work)
> >  		update_rq_clock(rq);
> >  		WARN_ON_ONCE(!list_empty(&p->throttle_node));
> >  		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_SPECIAL);
> > +		/*
> > +		 * Must not add it to limbo list before dequeue or dequeue will
> > +		 * mistakenly regard this task as an already throttled one.
> > +		 */
> >  		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
> >  		resched_curr(rq);
> >  	}
> > @@ -5881,6 +5885,20 @@ void init_cfs_throttle_work(struct task_struct *p)
> >  	INIT_LIST_HEAD(&p->throttle_node);
> >  }
> >  
> > +static void dequeue_throttled_task(struct task_struct *p, int flags)
> > +{
> > +	/*
> > +	 * Task is throttled and someone wants to dequeue it again:
> > +	 * it must be sched/core when core needs to do things like
> > +	 * task affinity change, task group change, task sched class
> > +	 * change etc.
> > +	 */
> > +	WARN_ON_ONCE(p->se.on_rq);
> > +	WARN_ON_ONCE(flags & DEQUEUE_SLEEP);
> > +
> > +	list_del_init(&p->throttle_node);
> > +}
> > +
> >  static void enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags);
> >  static int tg_unthrottle_up(struct task_group *tg, void *data)
> >  {
> > @@ -6834,6 +6852,7 @@ static inline void sync_throttle(struct task_group *tg, int cpu) {}
> >  static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
> >  static void task_throttle_setup_work(struct task_struct *p) {}
> >  static bool task_is_throttled(struct task_struct *p) { return false; }
> > +static void dequeue_throttled_task(struct task_struct *p, int flags) {}
> >  
> >  static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
> >  {
> > @@ -7281,6 +7300,11 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
> >   */
> >  static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags)
> >  {
> > +	if (unlikely(task_is_throttled(p))) {
> > +		dequeue_throttled_task(p, flags);
> > +		return true;
> > +	}
> > +
> >  	if (!(p->se.sched_delayed && (task_on_rq_migrating(p) || (flags & DEQUEUE_SAVE))))
> >  		util_est_dequeue(&rq->cfs, p);
> 
> This is asymmetric -- dequeue removes it from that throttle list, but
> the corresponding enqueue will not add it back, what gives?
> 
> Because now we have:
> 
>  p->on_rq=1
>  p->throttle_node on list
> 
> move_queued_task()
>   deactivate_task()
>     dequeue_task_fair()
>       list_del_init(throttle_node)
>     p->on_rq = 2
> 
>   activate_task()
>     enqueue_task_fair()
>       // nothing special, makes the thing runnable
>     p->on_rq = 1;
> 
> and we exit with a task that is on-rq and not throttled ?!?
>
> Why is this? Are we relying on pick_task_fair() to dequeue it again and
> fix up our inconsistencies? If so, that had better have a comment on.

Correct.

Does the following comment look OK?

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 89afa472299b7..4f4d64cf31fb1 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7147,6 +7147,10 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
 static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 {
 	if (unlikely(task_is_throttled(p))) {
+		/*
+		 * Task migrated to new rq will have its throttle work
+		 * added if necessary in pick time.
+		 */
 		dequeue_throttled_task(p, flags);
 		return true;
 	}
