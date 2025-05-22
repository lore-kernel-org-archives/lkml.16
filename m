Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC07333DB
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747910949; cv=none; b=BnU3Xa4pCxD510Ncb0ISh5FSpLMxqh+vzDWd6OeAH8NVlX/lp8eTFPBMOaQcnNW2wMiiqZ1CI5116TMDPQrkTEhxEStAUimARnKxWQ/Gojjcqn5pPBog57jvYcWWC498wVMYAR+7orcEK3Hqy+7/4z6j3eO7FpiGGS1ijrPGS6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747910949; c=relaxed/simple;
	bh=b1jA/JmPZfGSjyBQho4a1/wR7TWihgI9QJ4xrU3j21k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qRQnxdCqJVOlmiP3RnPYGcHiDreUTyrDEfRcaIQQJw9+JJ4+oUV9MLFh/VJW/P3FwRlhkQSXYtxh0wWBNZDVpsSmM8wV1g0jBD9yOiEwBHGERRIMxieGsnF+oLWqq9Jt4PEigEUjiFS9QKT0hGKP5SwKDjJGROuN4CTJwRegyfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BQrKXCij; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BQrKXCij"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RVuKIb6DBOmyqCHMM98pwZpdSdwUjm0UpHEs16rMVRo=; b=BQrKXCij4q0yH/WM1zqb4p8XUW
	OnbqYWEFKvvQqOHkmYjxc1IljuLP/86ia90Qv5ITH33FqzpIVvZsFD8izC92GUJ31Qtsv0JvDsRaR
	XtbfmVSekIZY4Nj4PUcEzXOdAA6qyKWvOCxoFYVqXhfakyqNqL2aedd+AP6Q2D4HIRUEOa2ydWrum
	fosrY2mo7ZtuA9AqJi6INl2uy4rEL+Wcpjtmt6XNkBQjxtJNYRkHQrOeGHymJr1f6MyuCMB4JHiM2
	zE/C6Ttd4Aj8SZ0bx8WtDX85qtUdzqfoLzSZnYzZMbtAUopb0WrXxeh9ZQQHlPhFelLIfuSCWavpd
	dIkeiBqQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uI3Ti-000000011R5-0PLA;
	Thu, 22 May 2025 10:48:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D8F50300472; Thu, 22 May 2025 12:48:43 +0200 (CEST)
Date: Thu, 22 May 2025 12:48:43 +0200
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
Subject: Re: [PATCH 2/7] sched/fair: prepare throttle path for task based
 throttle
Message-ID: <20250522104843.GG39944@noisy.programming.kicks-ass.net>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-3-ziqianlu@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520104110.3673059-3-ziqianlu@bytedance.com>

On Tue, May 20, 2025 at 06:41:05PM +0800, Aaron Lu wrote:

>  static void throttle_cfs_rq_work(struct callback_head *work)
>  {
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
> +		WARN_ON_ONCE(!list_empty(&p->throttle_node));
> +		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_SPECIAL);
> +		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
> +		resched_curr(rq);
> +	}
> +
> +	cond_resched_tasks_rcu_qs();
>  }

What's that cond_resched thing about? The general plan is to make
cond_resched go away.
