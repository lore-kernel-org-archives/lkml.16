Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC71323371B
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747915429; cv=none; b=XSwB/Lv8jSRwLC1t2ln4xZrFgJ7dd7C8XwNPyZzRvHPdlvM15oNW3ALJKYLbZNFQDD0WSHDoWh/xtCKLcsMCeV/FJxClKM1a5MtZS/wg15ErXhPXk55mSbfz0dgPCkDlsYegPilZmFOPB8Vg8JSFbWS6A62G5zls9J+x/Bfe9NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747915429; c=relaxed/simple;
	bh=YlIdXE+cJPEmJedyy48Hi1mFUG5wnxkldNpJmyCsljg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekL4kzs6HpGr43MRxE0XeA9DAANmbAccRC2CWfCdz8LLwY47TNK6uvG0aYDzvX9w/PRUOWihm51in/Sp7ByHew63op4ylOJWTtQN6XAHHYygp8HatdI0JfAjM/kFvi4x1v1q9CjFdT9KsFdnVLWBSfHYissO4Y9jjLI+uTQijFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UWxVev89; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UWxVev89"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=un//2bnJRdpx8IjyRQKuHD2l1EewbSIXc625KMcFxxA=; b=UWxVev89r6+X05qFWyTMxScrS8
	2GcAk5g79QDcCz4cse1QxLPWJa0JtPWoEddR8SuRyDxPS5kT3uGOe+d/7UmxOWy/QfEE4dlFDY0T0
	7NsYXrxdJReenhT6sMHPi2ug6Bu7Fhi3eXNZWmlyZAn/UKQCN8xNuE6O34LFN0JkdjYtGgSXtF2vv
	lJHpXyOJpECpYMe4zcKMUV2xDCVVmU2cKavP+6dz+nd3dW/CHo5+re5RasNNwS0+KWILUYbiZ5hoP
	2LiBc+erX9C7tgMr99ga+ngUVtQNdu4kej0WHFU5Wi65ZEZ9BQClAMgpgRBCaMB93SSazemWrQsHj
	bCHCw6Gg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uI4e9-000000011lA-0ETu;
	Thu, 22 May 2025 12:03:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9BD263002E5; Thu, 22 May 2025 14:03:36 +0200 (CEST)
Date: Thu, 22 May 2025 14:03:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Aaron Lu <ziqianlu@bytedance.com>
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
Message-ID: <20250522120336.GI39944@noisy.programming.kicks-ass.net>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-5-ziqianlu@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520104110.3673059-5-ziqianlu@bytedance.com>

On Tue, May 20, 2025 at 06:41:07PM +0800, Aaron Lu wrote:
> On task group change, for tasks whose on_rq equals to TASK_ON_RQ_QUEUED,
> core will dequeue it and then requeued it.
> 
> The throttled task is still considered as queued by core because p->on_rq
> is still set so core will dequeue it, but since the task is already
> dequeued on throttle in fair, handle this case properly.
> 
> Affinity and sched class change is similar.
> 
> Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
> ---
>  kernel/sched/fair.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 74bc320cbc238..4c66fd8d24389 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -5866,6 +5866,10 @@ static void throttle_cfs_rq_work(struct callback_head *work)
>  		update_rq_clock(rq);
>  		WARN_ON_ONCE(!list_empty(&p->throttle_node));
>  		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_SPECIAL);
> +		/*
> +		 * Must not add it to limbo list before dequeue or dequeue will
> +		 * mistakenly regard this task as an already throttled one.
> +		 */
>  		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
>  		resched_curr(rq);
>  	}
> @@ -5881,6 +5885,20 @@ void init_cfs_throttle_work(struct task_struct *p)
>  	INIT_LIST_HEAD(&p->throttle_node);
>  }
>  
> +static void dequeue_throttled_task(struct task_struct *p, int flags)
> +{
> +	/*
> +	 * Task is throttled and someone wants to dequeue it again:
> +	 * it must be sched/core when core needs to do things like
> +	 * task affinity change, task group change, task sched class
> +	 * change etc.
> +	 */
> +	WARN_ON_ONCE(p->se.on_rq);
> +	WARN_ON_ONCE(flags & DEQUEUE_SLEEP);
> +
> +	list_del_init(&p->throttle_node);
> +}
> +
>  static void enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags);
>  static int tg_unthrottle_up(struct task_group *tg, void *data)
>  {
> @@ -6834,6 +6852,7 @@ static inline void sync_throttle(struct task_group *tg, int cpu) {}
>  static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
>  static void task_throttle_setup_work(struct task_struct *p) {}
>  static bool task_is_throttled(struct task_struct *p) { return false; }
> +static void dequeue_throttled_task(struct task_struct *p, int flags) {}
>  
>  static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
>  {
> @@ -7281,6 +7300,11 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
>   */
>  static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>  {
> +	if (unlikely(task_is_throttled(p))) {
> +		dequeue_throttled_task(p, flags);
> +		return true;
> +	}
> +
>  	if (!(p->se.sched_delayed && (task_on_rq_migrating(p) || (flags & DEQUEUE_SAVE))))
>  		util_est_dequeue(&rq->cfs, p);

This is asymmetric -- dequeue removes it from that throttle list, but
the corresponding enqueue will not add it back, what gives?

Because now we have:

 p->on_rq=1
 p->throttle_node on list

move_queued_task()
  deactivate_task()
    dequeue_task_fair()
      list_del_init(throttle_node)
    p->on_rq = 2

  activate_task()
    enqueue_task_fair()
      // nothing special, makes the thing runnable
    p->on_rq = 1;

and we exit with a task that is on-rq and not throttled ?!?

Why is this? Are we relying on pick_task_fair() to dequeue it again and
fix up our inconsistencies? If so, that had better have a comment on.
