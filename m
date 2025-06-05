Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168B98488
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 14:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749133740; cv=none; b=u2XYSXcsdAx6Z7L6YyufTy3HeTf4rHUTa4uhZIzTsZ1wEBzPcHKFrA9eAGHzQhbKE+yvFnWy0zWiZrHJ5tdM2sphnWzMfPGo4h0vUfMmZQ5O5thDACxVtLhwSh0qXlduU+JPhwRN5SDZOjSZSo+Db+/q1FRVmOmeID9zDIoPaDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749133740; c=relaxed/simple;
	bh=48EYsY4ls1iWO/3rL9mhxJYE8wjpVQO56bO14A0GiXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ATOSP0nx4V1cnF2/Tp6ikE3f4R2zSMTO6RFXmvWVi1WDq7quahL2h8x8YRZVuVn+dfDdNUDDnOLwE9zoC/RNxaVjAW/f5uw70WogRiqgHKPYtOeHvz/hrNLUrdSQJUI4LJOt6RDA/8mA4lS8aOP54cjnOIopoZyHmefxGMFBS94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=opJLJZvV; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="opJLJZvV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ag+al2sonYVU0KVcUd9i14JJToHCYR33Hx/hh+FMpt8=; b=opJLJZvVJc4N0SbUnihbFauyD6
	QahoPr2YfswiAfwmLEdvODHPnV54Z8Txs637aNzdW7OQFw55gd2LjsuFMI7+d3VBENxb/c6UTJbec
	nm0IiMCQUH/6wdB8SZigahd6tiwI0lvRS6aRxi/cdcAye4BjNpEqw1FxvoWO7aOJXIUAInPdr4dBc
	rzAXTODRkML8ZW5yMIPH1cooT/ntxVGxv9XmjSAGMshoTvMtjnHdZmeYnVrVlFd65kLCGjs/jOnNe
	QE6er6I3kU8awVDkwmyhOTyUGmIy6+Vu8kegr+vQf3GPqkcejf4VndVaoamFSy9M6u5cGNCIau6Kg
	gjXYSLwA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNBaO-00000001Aqj-1g2y;
	Thu, 05 Jun 2025 14:28:52 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A4F1330057C; Thu,  5 Jun 2025 16:28:51 +0200 (CEST)
Date: Thu, 5 Jun 2025 16:28:51 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Zecheng Li <zecheng@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Xu Liu <xliuprof@google.com>, Blake Jones <blakejones@google.com>,
	Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] sched/fair: Embed sched_entity into cfs_rq
Message-ID: <20250605142851.GU39944@noisy.programming.kicks-ass.net>
References: <20250604195846.193159-1-zecheng@google.com>
 <20250604195846.193159-2-zecheng@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604195846.193159-2-zecheng@google.com>

On Wed, Jun 04, 2025 at 07:58:41PM +0000, Zecheng Li wrote:
> To improve data locality and avoid pointer chasing, embed struct
> sched_entity within struct cfs_rq. This co-locates the runqueue state
> (cfs_rq) and the entity's scheduling state (se).
> 
> This patch implements the following:
> 
> - Adds a struct sched_entity field to struct cfs_rq.
> 
> - Modifies alloc_fair_sched_group() and free_fair_sched_group() to
> remove the separate allocation and freeing logic for sched_entity
> objects themselves.
> 
> - The task_group->se pointer array (struct sched_entity **se) is
> retained. The pointers in this array are updated to point to the
> corresponding embedded &cfs_rq->se for each CPU.
> 
> Signed-off-by: Zecheng Li <zecheng@google.com>
> ---
>  kernel/sched/fair.c  | 10 +---------
>  kernel/sched/sched.h |  4 ++++
>  2 files changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 0fb9bf995a47..c2af9896eef4 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -13343,8 +13343,6 @@ void free_fair_sched_group(struct task_group *tg)
>  	for_each_possible_cpu(i) {
>  		if (tg->cfs_rq)
>  			kfree(tg->cfs_rq[i]);
> -		if (tg->se)
> -			kfree(tg->se[i]);
>  	}
>  
>  	kfree(tg->cfs_rq);
> @@ -13374,11 +13372,7 @@ int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
>  		if (!cfs_rq)
>  			goto err;
>  
> -		se = kzalloc_node(sizeof(struct sched_entity_stats),
> -				  GFP_KERNEL, cpu_to_node(i));
> -		if (!se)
> -			goto err_free_rq;
> -
> +		se = &cfs_rq->se;
>  		init_cfs_rq(cfs_rq);
>  		init_tg_cfs_entry(tg, cfs_rq, se, i, parent->se[i]);
>  		init_entity_runnable_average(se);
> @@ -13386,8 +13380,6 @@ int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
>  
>  	return 1;
>  
> -err_free_rq:
> -	kfree(cfs_rq);
>  err:
>  	return 0;
>  }
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 47972f34ea70..6e26b7d59c13 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -738,6 +738,10 @@ struct cfs_rq {
>  	struct list_head	throttled_csd_list;
>  #endif /* CONFIG_CFS_BANDWIDTH */
>  #endif /* CONFIG_FAIR_GROUP_SCHED */
> +#ifdef CONFIG_FAIR_GROUP_SCHED
> +	/* sched_entity on parent runqueue */
> +	struct sched_entity	se ____cacheline_aligned;
> +#endif
>  };

This also blows up struct rq for no reason.

I would much rather you all investigate if you can make the flattened
cgroup stuff from Rik work.
