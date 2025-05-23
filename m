Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD702DCBE7
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 02:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747968250; cv=none; b=a9hqWSK6CJ3A273s524Y1897HiCDF/TFO4qJa72b0rHNA067PDJjpsJzh41enb6VZ9Km18JYuLdg9ViNuG5RcRMzWllTuSQnNW2YLNfnceEG9anA2IAURP0Gd7QBfcXIMbjR4h9ZWI9/o1idYiZWRrDqznhplE9GoXEbmQWElsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747968250; c=relaxed/simple;
	bh=pouU501kHvpahr97lsZlPtLEro1NJIHDxG81yNKE250=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndOs3K/D/c2zC76WFCd1uhSERZcoOkWqPAApwO03y6ssaLCJVhBs1Q3QszuZHyadUJszfxsPjYeVlpsC7Tmh2Kh3b3Nc6nqf3v/M3BLwgOY8AIpPcbLML6T6rPzutyCshmjAY3ARommJQrVQeWvGSswsNoRCT73S15L4H47G4Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BIfRqsWi; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BIfRqsWi"
Message-ID: <63237b23-ae10-45f9-abdd-8ea4adb4d15e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747968244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hv/tjh7l4P0EOqRs5walua65leLEpaVzh6pI7mbZFig=;
	b=BIfRqsWirp310zW/lvG5k6NJ0aJLi+YdxKPpAlxxShgX1MaMdzNl1yDxhqoNLlnTgrCl5P
	MojCyHiwJyhzm0wmtx/Q0kfI1UcLm/MSdGKI1f6ED+PTvhpOuoDrtiUGEw12/S6MYs0WGb
	GGHoqXVgYdPEkdnD7lKmgYiOxu6t+pM=
Date: Fri, 23 May 2025 10:43:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 4/7] sched/fair: Take care of group/affinity/sched_class
 change for throttled task
To: Aaron Lu <ziqianlu@bytedance.com>,
 Valentin Schneider <vschneid@redhat.com>, Ben Segall <bsegall@google.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, Josh Don <joshdon@google.com>,
 Ingo Molnar <mingo@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Xi Wang <xii@google.com>
Cc: linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
 Chuyi Zhou <zhouchuyi@bytedance.com>, Jan Kiszka <jan.kiszka@siemens.com>,
 Florian Bezdeka <florian.bezdeka@siemens.com>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-5-ziqianlu@bytedance.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chengming Zhou <chengming.zhou@linux.dev>
In-Reply-To: <20250520104110.3673059-5-ziqianlu@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2025/5/20 18:41, Aaron Lu wrote:
> On task group change, for tasks whose on_rq equals to TASK_ON_RQ_QUEUED,
> core will dequeue it and then requeued it.
> 
> The throttled task is still considered as queued by core because p->on_rq
> is still set so core will dequeue it, but since the task is already
> dequeued on throttle in fair, handle this case properly.
> 
> Affinity and sched class change is similar.

How about setting p->on_rq to 0 when throttled? which is the fact that
the task is not on cfs queue anymore, does this method cause any problem?

Thanks!

> 
> Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
> ---
>   kernel/sched/fair.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 74bc320cbc238..4c66fd8d24389 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -5866,6 +5866,10 @@ static void throttle_cfs_rq_work(struct callback_head *work)
>   		update_rq_clock(rq);
>   		WARN_ON_ONCE(!list_empty(&p->throttle_node));
>   		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_SPECIAL);
> +		/*
> +		 * Must not add it to limbo list before dequeue or dequeue will
> +		 * mistakenly regard this task as an already throttled one.
> +		 */
>   		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
>   		resched_curr(rq);
>   	}
> @@ -5881,6 +5885,20 @@ void init_cfs_throttle_work(struct task_struct *p)
>   	INIT_LIST_HEAD(&p->throttle_node);
>   }
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
>   static void enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags);
>   static int tg_unthrottle_up(struct task_group *tg, void *data)
>   {
> @@ -6834,6 +6852,7 @@ static inline void sync_throttle(struct task_group *tg, int cpu) {}
>   static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
>   static void task_throttle_setup_work(struct task_struct *p) {}
>   static bool task_is_throttled(struct task_struct *p) { return false; }
> +static void dequeue_throttled_task(struct task_struct *p, int flags) {}
>   
>   static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
>   {
> @@ -7281,6 +7300,11 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
>    */
>   static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>   {
> +	if (unlikely(task_is_throttled(p))) {
> +		dequeue_throttled_task(p, flags);
> +		return true;
> +	}
> +
>   	if (!(p->se.sched_delayed && (task_on_rq_migrating(p) || (flags & DEQUEUE_SAVE))))
>   		util_est_dequeue(&rq->cfs, p);
>   
