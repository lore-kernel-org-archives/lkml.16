Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38ED27FD45
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750237440; cv=none; b=jHcClchk8k4RMwK1r9t6Mq35hv/h0q5D83Hb5Ey/ndTWWr7kMsGWeqy288rVAafuFfriyv1uwMwVq5quv1Pihyzw+DtsFiXzwEy77V1GO9a3pQUszRvGZ7Q5IowJ0JgXMaPptVa/K/QMjiRk0fW2GJFrCFne6TCWrcqFsODBvpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750237440; c=relaxed/simple;
	bh=lLvx91jQqu5Q+YGU79KFYWfNCOcfYuHmo1ka1VCpl/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Glqmu+OVsvoSbOBE4L3Ni3jUk34Om240rXuD4H1CHkH9GUacam5y4rzD4827dY9x2hZuWBfZjKs0AIDiZRfp6cShcwMMMtBDjySg41miPR/KQnRX59euiNM2S0OKOd3Nx9eME7zm11ynyaUoHukpQfSZKnwW6v6wOyzHgDBsH40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=N9iSH3eA; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="N9iSH3eA"
Message-ID: <1221e872-c4db-4db4-b68f-8c395fc07119@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750237434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i66umhH0P3FSLRHLImHlcLT3eKJupzJEwtAv2cACxDI=;
	b=N9iSH3eAvQgtUrRPL6b08umvHPeRK7hlJCz45aQwQriFZyrFOxm78/oWz5oUF1+V4pdpnJ
	wuKYrjozFJLCpbDm4Ymc8wCay+ylECIhHzUVPh6ixuxfXRmfe7ryik/RhejhS3Y8JrNGih
	rijfDYGD7LEG9rDC0DK5B6UVevJt0Pw=
Date: Wed, 18 Jun 2025 17:03:41 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/5] sched/fair: Implement throttle task work and
 related helpers
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
References: <20250618081940.621-1-ziqianlu@bytedance.com>
 <20250618081940.621-3-ziqianlu@bytedance.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chengming Zhou <chengming.zhou@linux.dev>
In-Reply-To: <20250618081940.621-3-ziqianlu@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2025/6/18 16:19, Aaron Lu wrote:
> From: Valentin Schneider <vschneid@redhat.com>
> 
> Implement throttle_cfs_rq_work() task work which gets executed on task's
> ret2user path where the task is dequeued and marked as throttled.
> 
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>

LGTM,

Reviewed-by: Chengming Zhou <chengming.zhou@linux.dev>

Thanks!

> ---
>   kernel/sched/fair.c | 65 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 65 insertions(+)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index f7b8597bc95ac..8226120b8771a 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -5757,8 +5757,51 @@ static inline int throttled_lb_pair(struct task_group *tg,
>   	       throttled_hierarchy(dest_cfs_rq);
>   }
>   
> +static inline bool task_is_throttled(struct task_struct *p)
> +{
> +	return p->throttled;
> +}
> +
> +static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags);
>   static void throttle_cfs_rq_work(struct callback_head *work)
>   {
> +	struct task_struct *p = container_of(work, struct task_struct, sched_throttle_work);
> +	struct sched_entity *se;
> +	struct cfs_rq *cfs_rq;
> +	struct rq *rq;
> +
> +	WARN_ON_ONCE(p != current);
> +	p->sched_throttle_work.next = &p->sched_throttle_work;
> +
> +	/*
> +	 * If task is exiting, then there won't be a return to userspace, so we
> +	 * don't have to bother with any of this.
> +	 */
> +	if ((p->flags & PF_EXITING))
> +		return;
> +
> +	scoped_guard(task_rq_lock, p) {
> +		se = &p->se;
> +		cfs_rq = cfs_rq_of(se);
> +
> +		/* Raced, forget */
> +		if (p->sched_class != &fair_sched_class)
> +			return;
> +
> +		/*
> +		 * If not in limbo, then either replenish has happened or this
> +		 * task got migrated out of the throttled cfs_rq, move along.
> +		 */
> +		if (!cfs_rq->throttle_count)
> +			return;
> +		rq = scope.rq;
> +		update_rq_clock(rq);
> +		WARN_ON_ONCE(p->throttled || !list_empty(&p->throttle_node));
> +		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_SPECIAL);
> +		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
> +		p->throttled = true;
> +		resched_curr(rq);
> +	}
>   }
>   
>   void init_cfs_throttle_work(struct task_struct *p)
> @@ -5798,6 +5841,26 @@ static int tg_unthrottle_up(struct task_group *tg, void *data)
>   	return 0;
>   }
>   
> +static inline bool task_has_throttle_work(struct task_struct *p)
> +{
> +	return p->sched_throttle_work.next != &p->sched_throttle_work;
> +}
> +
> +static inline void task_throttle_setup_work(struct task_struct *p)
> +{
> +	if (task_has_throttle_work(p))
> +		return;
> +
> +	/*
> +	 * Kthreads and exiting tasks don't return to userspace, so adding the
> +	 * work is pointless
> +	 */
> +	if ((p->flags & (PF_EXITING | PF_KTHREAD)))
> +		return;
> +
> +	task_work_add(p, &p->sched_throttle_work, TWA_RESUME);
> +}
> +
>   static int tg_throttle_down(struct task_group *tg, void *data)
>   {
>   	struct rq *rq = data;
> @@ -6668,6 +6731,8 @@ static bool check_cfs_rq_runtime(struct cfs_rq *cfs_rq) { return false; }
>   static void check_enqueue_throttle(struct cfs_rq *cfs_rq) {}
>   static inline void sync_throttle(struct task_group *tg, int cpu) {}
>   static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
> +static void task_throttle_setup_work(struct task_struct *p) {}
> +static bool task_is_throttled(struct task_struct *p) { return false; }
>   
>   static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
>   {
