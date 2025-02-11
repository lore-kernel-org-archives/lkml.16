Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9DC250C0F
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739286694; cv=none; b=jDLZdQrU+iSNPPH8rPajDA9d4s2uNMQE0QNKcsdvz37RBGG2xqjtlh5GOScjLtRcFUVbwD3Ujoz3W1YFkli2RWUNRM8pXInVKd1ozXv+OGpnMFgJXFhUVjz20WMxsF5Eiox6PwwNW+WQ00yPrHplunIhPaUoUeULlWBf5sJs07s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739286694; c=relaxed/simple;
	bh=Dwv8AXypjyV15mEqTw7+Z2TU6waZ45Sm9b1S6bFR/Fc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UC/JGjMFr5MWQd1uSV3hnLTIO/7nb/YPsKbAc7Dxqs4W1ARUqO1yT4LqQAgMq7Ek4gxMXEGyiRUC6lgFwU8h83dJezVAfaUWTC4qYNyyPe6l7dQ3hn+Bt7dj8fXzK1fyoK1cItExmoh3WBkz7mNeR3EXgI/LU9OFf2WQqMSWypg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2786BC4CEE5;
	Tue, 11 Feb 2025 15:11:32 +0000 (UTC)
Date: Tue, 11 Feb 2025 10:11:37 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Harshit Agarwal <harshit@nutanix.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin
 Schneider <vschneid@redhat.com>, linux-kernel@vger.kernel.org, Jon Kohler
 <jon@nutanix.com>, Gauri Patwardhan <gauri.patwardhan@nutanix.com>, Rahul
 Chunduru <rahul.chunduru@nutanix.com>, Will Ton <william.ton@nutanix.com>
Subject: Re: [PATCH] sched/rt: Fix race in push_rt_task
Message-ID: <20250211101137.5824285d@gandalf.local.home>
In-Reply-To: <20250211054646.23987-1-harshit@nutanix.com>
References: <20250211054646.23987-1-harshit@nutanix.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 11 Feb 2025 05:46:45 +0000
Harshit Agarwal <harshit@nutanix.com> wrote:

> Overview
> ========
> When a CPU chooses to call push_rt_task and picks a task to push to
> another CPU's runqueue then it will call find_lock_lowest_rq method
> which would take a double lock on both CPUs' runqueues. If one of the
> locks aren't readily available, it may lead to dropping the current
> runqueue lock and reacquiring both the locks at once. During this window
> it is possible that the task is already migrated and is running on some
> other CPU. These cases are already handled. However, if the task is
> migrated and has already been executed and another CPU is now trying to
> wake it up (ttwu) such that it is queued again on the runqeue
> (on_rq is 1) and also if the task was run by the same CPU, then the
> current checks will pass even though the task was migrated out and is no
> longer in the pushable tasks list.

Nice catch! And nice analysis.

> diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> index 4b8e33c615b1..d48a9cb9ac92 100644
> --- a/kernel/sched/rt.c
> +++ b/kernel/sched/rt.c
> @@ -1885,6 +1885,27 @@ static int find_lowest_rq(struct task_struct *task)
>  	return -1;
>  }
>  
> +static struct task_struct *pick_next_pushable_task(struct rq *rq)
> +{
> +	struct task_struct *p;
> +
> +	if (!has_pushable_tasks(rq))
> +		return NULL;
> +
> +	p = plist_first_entry(&rq->rt.pushable_tasks,
> +			      struct task_struct, pushable_tasks);
> +
> +	BUG_ON(rq->cpu != task_cpu(p));
> +	BUG_ON(task_current(rq, p));
> +	BUG_ON(task_current_donor(rq, p));
> +	BUG_ON(p->nr_cpus_allowed <= 1);
> +
> +	BUG_ON(!task_on_rq_queued(p));
> +	BUG_ON(!rt_task(p));
> +
> +	return p;
> +}
> +
>  /* Will lock the rq it finds */
>  static struct rq *find_lock_lowest_rq(struct task_struct *task, struct rq *rq)
>  {
> @@ -1920,13 +1941,18 @@ static struct rq *find_lock_lowest_rq(struct task_struct *task, struct rq *rq)
>  			 * It is possible the task was scheduled, set
>  			 * "migrate_disabled" and then got preempted, so we must
>  			 * check the task migration disable flag here too.
> +			 * Also, the task may have been dequeued and completed
> +			 * execution on the same CPU during this time, therefore
> +			 * check if the task is still at the head of the
> +			 * pushable tasks list.
>  			 */
>  			if (unlikely(task_rq(task) != rq ||
>  				     !cpumask_test_cpu(lowest_rq->cpu, &task->cpus_mask) ||
>  				     task_on_cpu(rq, task) ||
>  				     !rt_task(task) ||
>  				     is_migration_disabled(task) ||
> -				     !task_on_rq_queued(task))) {
> +				     !task_on_rq_queued(task) ||
> +				     task != pick_next_pushable_task(rq))) {

I'm wondering? Could we replace all of these checks with just:

				task != pick_next_pushable_task(rq)
?

I mean, what check above would fail and not cause that one to fail?

Maybe the is_migration_disabled(), but I'd like to remove any of those
checks that would be covered with the "pick_next_pushable_task()".

-- Steve



>  
>  				double_unlock_balance(rq, lowest_rq);
>  				lowest_rq = NULL;
> @@ -1946,27 +1972,6 @@ static struct rq *find_lock_lowest_rq(struct task_struct *task, struct rq *rq)
>  	return lowest_rq;
>  }
>  
> -static struct task_struct *pick_next_pushable_task(struct rq *rq)
> -{
> -	struct task_struct *p;
> -
> -	if (!has_pushable_tasks(rq))
> -		return NULL;
> -
> -	p = plist_first_entry(&rq->rt.pushable_tasks,
> -			      struct task_struct, pushable_tasks);
> -
> -	BUG_ON(rq->cpu != task_cpu(p));
> -	BUG_ON(task_current(rq, p));
> -	BUG_ON(task_current_donor(rq, p));
> -	BUG_ON(p->nr_cpus_allowed <= 1);
> -
> -	BUG_ON(!task_on_rq_queued(p));
> -	BUG_ON(!rt_task(p));
> -
> -	return p;
> -}
> -
>  /*
>   * If the current CPU has more than one RT task, see if the non
>   * running task can migrate over to a CPU that is running a task

