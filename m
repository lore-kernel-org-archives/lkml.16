Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530D226AA9C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279232; cv=none; b=oOjgbU4V9wVFx8STq/TM2bNXAaR04alysT2KzlmtbyUcrXPFiHg88fcMdDczLmUWmHLuFu9bZEwaqtLe4RXMKePILNA7JTPHFlTma5qKNJD5SbVK9irbBFIQ3FTEYMxB2BfjLQvsrIkmhoikzfGCIaKWl+ZtEHWHTKnmlfQaR5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279232; c=relaxed/simple;
	bh=RLj279jJJT9HZsucpSNecZkvR1nrExHomeDx+UCVREA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ah86K2NRHelpO+Ti2xr1VfaUA5rPymCNiQYD/cKmw4rNgYVvkUEHqIjR/rjM0F5hsJFGyyjecq99OoxOL5MNnLYNK3zdkRhU8a9XOisMgqPM1fSHw0+JY2FGW8m/QUu+p/y2DjlNpyGgloM+wDIaG38rqqCUeO//Sg7zDvPOyD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=e1vNa4Qw; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="e1vNa4Qw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EvFhqf/mhVMaP+Q9S4A45KX8OaxnFjIub6xLUUqOdAI=; b=e1vNa4QwCPg8nSc1exhDSrw6/1
	3rPv8TIucIXVqhCKB+GOJR+WYTgrJvVAHqhRvTeH489Y9x+pVzSodwWmNbpKnG3k0t7rql16J5mBV
	0DZVlbpEftbpef9U11zIZHzamBUD5ubku9tmPUtkaXRa4aLlfjKaG8q7VCpn5ngU06kUPGwlk901g
	OhpVUvXIfGwD3k0MTX8+xml+PvimnXTY5CFqHNHday44u2CMJ0TuZwuqbQfGUvEY/qJb3ktpmmp0w
	JJeY2YBKC8U6KSyqn065xu5rckUkudBt3EhRV5jbK5p4u4II9hqaq9MmStieAmU9yvGzLbMnZF9QK
	nEdM3EWg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2ohr-00000008nCK-0pGs;
	Thu, 10 Apr 2025 10:00:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C239A3003C4; Thu, 10 Apr 2025 12:00:22 +0200 (CEST)
Date: Thu, 10 Apr 2025 12:00:22 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>
Subject: Re: [RFC PATCH 1/5] sched/fair: Add push task framework
Message-ID: <20250410100022.GA30687@noisy.programming.kicks-ass.net>
References: <20250409111539.23791-1-kprateek.nayak@amd.com>
 <20250409111539.23791-2-kprateek.nayak@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409111539.23791-2-kprateek.nayak@amd.com>

On Wed, Apr 09, 2025 at 11:15:35AM +0000, K Prateek Nayak wrote:

> +static void fair_add_pushable_task(struct rq *rq, struct task_struct *p)
> +{
> +	if (fair_push_task(p)) {
> +		plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
> +		plist_node_init(&p->pushable_tasks, p->prio);

I gotta aks, why do we care about ordering the push list on p->prio for
fair?

> +		plist_add(&p->pushable_tasks, &rq->cfs.pushable_tasks);
> +	}
> +}
> +
>  /*
>   * select_task_rq_fair: Select target runqueue for the waking task in domains
>   * that have the relevant SD flag set. In practice, this is SD_BALANCE_WAKE,

> @@ -8914,6 +8978,12 @@ pick_next_task_fair(struct rq *rq, struct task_struct *prev, struct rq_flags *rf
>  		put_prev_entity(cfs_rq, pse);
>  		set_next_entity(cfs_rq, se);
>  
> +		/*
> +		 * The previous task might be eligible for being pushed on
> +		 * another cpu if it is still active.
> +		 */
> +		fair_add_pushable_task(rq, prev);
> +
>  		__set_next_task_fair(rq, p, true);
>  	}
>  
> @@ -8986,6 +9056,13 @@ static void put_prev_task_fair(struct rq *rq, struct task_struct *prev, struct t
>  		cfs_rq = cfs_rq_of(se);
>  		put_prev_entity(cfs_rq, se);
>  	}
> +
> +	/*
> +	 * The previous task might be eligible for being pushed on another cpu
> +	 * if it is still active.
> +	 */
> +	fair_add_pushable_task(rq, prev);
> +
>  }

These two are tricky; while they will work with a push balance callback,
they will cause some pain with pulling from the push lists; a-la
newidle.

Notably, we must be sure to check ->on_cpu.

Perhaps later patches add this, let me continue reading...
