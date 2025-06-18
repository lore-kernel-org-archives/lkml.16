Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4C91A5BAF
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240527; cv=none; b=tUX9Qd+lHi1Bod2tuDzwQoKVnEMKMs88y89q9bDnW3EeYz6U7vTqpu+Fqj7zPb0fA0NaW1jib0AYZAshNpyJD0rj9X9ZCDMYuFp0X7KdrOS1nuEQcla6i48v6g0kEVbiDh8btoo4SZhkrJxdBHiMvntgQaY/APQNLONfqLwdlpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240527; c=relaxed/simple;
	bh=Qr/rdcnDdXUpKfHy9roPEUA0NLxF3k/ZOlSKOjJAPUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E2tA1SLt9fAvTvjrWPn7iAyj20lL2+AaPpZOLA6/HoMIfdjiNIstc/egr5YM8ud9rUBAPSHA7pFipBmRotAHCNSW+69d50gVeW82l0j1WvIM9qrNhrdVLiDKczxbFAycUIjNrwlCU0/YCaPNY9+DDPvd+mhZ3uWba1YjiwckdKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YLbAgD3A; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YLbAgD3A"
Message-ID: <ddca03a3-14d2-4d71-8070-8f9b8de9b7eb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750240523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yhDjUEBerZ2eYPFzOsgL0vTLWRrgTXPMI2JjkBVVMwc=;
	b=YLbAgD3AncKcCyswxBXX0x9nlgke7U0wVq4MFb4CRAD5lRe5zrz6zTPJ9u2YO2UXCItZv+
	bXVEUv80h6H34KwoX9oARXPKXn4WbFfK+TYqWRRpcduBXuEPMFjFkUJ1GmcPrLnDb5fYUj
	hcpDzI8LcyWO2+p4InurxOOpGPejiow=
Date: Wed, 18 Jun 2025 17:55:08 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/5] sched/fair: Switch to task based throttle model
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
 <20250618081940.621-4-ziqianlu@bytedance.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chengming Zhou <chengming.zhou@linux.dev>
In-Reply-To: <20250618081940.621-4-ziqianlu@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2025/6/18 16:19, Aaron Lu wrote:
> From: Valentin Schneider <vschneid@redhat.com>
> 
> In current throttle model, when a cfs_rq is throttled, its entity will
> be dequeued from cpu's rq, making tasks attached to it not able to run,
> thus achiveing the throttle target.
> 
> This has a drawback though: assume a task is a reader of percpu_rwsem
> and is waiting. When it gets woken, it can not run till its task group's
> next period comes, which can be a relatively long time. Waiting writer
> will have to wait longer due to this and it also makes further reader
> build up and eventually trigger task hung.
> 
> To improve this situation, change the throttle model to task based, i.e.
> when a cfs_rq is throttled, record its throttled status but do not remove
> it from cpu's rq. Instead, for tasks that belong to this cfs_rq, when
> they get picked, add a task work to them so that when they return
> to user, they can be dequeued there. In this way, tasks throttled will
> not hold any kernel resources. And on unthrottle, enqueue back those
> tasks so they can continue to run.
> 
> Throttled cfs_rq's leaf_cfs_rq_list is handled differently now: since a
> task can be enqueued to a throttled cfs_rq and gets to run, to not break
> the assert_list_leaf_cfs_rq() in enqueue_task_fair(), always add it to
> leaf cfs_rq list when it has its first entity enqueued and delete it
> from leaf cfs_rq list when it has no tasks enqueued.
> 
> Suggested-by: Chengming Zhou <chengming.zhou@linux.dev> # tag on pick
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
> ---
>   kernel/sched/fair.c | 325 +++++++++++++++++++++-----------------------
>   1 file changed, 153 insertions(+), 172 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 8226120b8771a..59b372ffae18c 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -5291,18 +5291,17 @@ enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>   
>   	if (cfs_rq->nr_queued == 1) {
>   		check_enqueue_throttle(cfs_rq);
> -		if (!throttled_hierarchy(cfs_rq)) {
> -			list_add_leaf_cfs_rq(cfs_rq);
> -		} else {
> +		list_add_leaf_cfs_rq(cfs_rq);
>   #ifdef CONFIG_CFS_BANDWIDTH
> +		if (throttled_hierarchy(cfs_rq)) {
>   			struct rq *rq = rq_of(cfs_rq);
>   
>   			if (cfs_rq_throttled(cfs_rq) && !cfs_rq->throttled_clock)
>   				cfs_rq->throttled_clock = rq_clock(rq);
>   			if (!cfs_rq->throttled_clock_self)
>   				cfs_rq->throttled_clock_self = rq_clock(rq);
> -#endif
>   		}
> +#endif
>   	}
>   }
>   
> @@ -5341,8 +5340,6 @@ static void set_delayed(struct sched_entity *se)
>   		struct cfs_rq *cfs_rq = cfs_rq_of(se);
>   
>   		cfs_rq->h_nr_runnable--;
> -		if (cfs_rq_throttled(cfs_rq))
> -			break;
>   	}
>   }
>   
> @@ -5363,8 +5360,6 @@ static void clear_delayed(struct sched_entity *se)
>   		struct cfs_rq *cfs_rq = cfs_rq_of(se);
>   
>   		cfs_rq->h_nr_runnable++;
> -		if (cfs_rq_throttled(cfs_rq))
> -			break;
>   	}
>   }
>   
> @@ -5450,8 +5445,11 @@ dequeue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>   	if (flags & DEQUEUE_DELAYED)
>   		finish_delayed_dequeue_entity(se);
>   
> -	if (cfs_rq->nr_queued == 0)
> +	if (cfs_rq->nr_queued == 0) {
>   		update_idle_cfs_rq_clock_pelt(cfs_rq);
> +		if (throttled_hierarchy(cfs_rq))
> +			list_del_leaf_cfs_rq(cfs_rq);

The cfs_rq should be removed from leaf list only after
it has been fully decayed, not here.

Thanks.
