Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB3833DB
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747912069; cv=none; b=qfgqp5e8VubjVxCfgVKDLw2rX7nWSTYiw40sca7Nxhvu8x6nosfDjtLz/WONRZGGcdX/RfrKlkP2Wxf4v1WlSbybAGbqcDSBx4nmfLtLRUnVuMMKc+OAz1N5L7mXpboisoQOK23FwztZ4rPO+psxXuqXZ8LzWEYpqmiEvcGRSXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747912069; c=relaxed/simple;
	bh=ci4ILSiNyMRIgwdYSHeexXSO0FKhrsA8he3QkRzcD1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AP33j6XmCSPcQOnomOnaBjuJrrjNr8jHBjSr7vkiJL74LUeugfBpWTU3eI1GOLEWtbm/EDtzHds5/iy5wukQdvl+ejNRGFIeWBoDOF851HSMugs1MAThPeqcPvNhUezAhnWE+tHA2AFJLvUIcT2n/5MFvXKZO5W+7SMr8zR8nSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BsZHzhFc; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BsZHzhFc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FxrZa5E32CwO81j8y+19dEYxyCuSYLhZ7KzZ5XaBR1o=; b=BsZHzhFcOXwunvdo2OatsaMcc4
	gEkK+8YruMNxf1wu/04LsXT1dWa0k+jpDt5EJv/6AlEem/tKYYl6sTP8odXIIi7rBe9VJfBgJxIml
	cUqxocUydsHHmcwhLbjUr4OMgMSHUi1YVRZ/2LUAEdECDOBdASX8MD7gRSfseWGjpd1Kysy5H1gVs
	uogt22p6f80T5p5ufIGiQx2lVnKr2KML/IYA7YbBrE+/+wT+LtN70KFjafP04VbgS/kuV6+wADbnj
	cewBuMuW1P3PaEZKrnLqsKzwLolE3dR7GHVlVTKIicUXF1OdfuBAsGZVX2RrGPzuYIHABnZOq3+eX
	cFsw7NfA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI3lp-0000000602A-2hXk;
	Thu, 22 May 2025 11:07:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 18A25300472; Thu, 22 May 2025 13:07:29 +0200 (CEST)
Date: Thu, 22 May 2025 13:07:28 +0200
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
Message-ID: <20250522110728.GH39944@noisy.programming.kicks-ass.net>
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
> @@ -8851,6 +8913,7 @@ static struct task_struct *pick_task_fair(struct rq *rq)
>  {
>  	struct sched_entity *se;
>  	struct cfs_rq *cfs_rq;
> +	struct task_struct *p;
>  
>  again:
>  	cfs_rq = &rq->cfs;
> @@ -8871,7 +8934,14 @@ static struct task_struct *pick_task_fair(struct rq *rq)
>  		cfs_rq = group_cfs_rq(se);
>  	} while (cfs_rq);
>  
> -	return task_of(se);
> +	p = task_of(se);
> +	if (throttled_hierarchy(cfs_rq_of(se))) {
> +		/* Shuold not happen for now */
> +		WARN_ON_ONCE(1);
> +		task_throttle_setup_work(p);
> +	}
> +
> +	return p;
>  }

So the final code is a little different, because you're removing the
return value from check_cfs_rq_runtime().

But would not that exact return value be the thing you're now checking
for again?

That is; at the end of the series, would not something like:

static struct task_struct *pick_task_fair(struct rq *rq)
{
	struct sched_entity *se;
	struct cfs_rq *cfs_rq;
	struct task_struct *p;
	bool throttled;

again:
	cfs_rq = &rq->cfs;
	if (!cfs_rq->nr_queued)
		return NULL;

	throttled = false;

	do {
		if (cfs_rq->curr && cfs_rq->curr->on_rq)
			update_curr(cfs_rq);

		throttled |= check_cfs_rq_runtime(cfs_rq);

		se = pick_next_entity(rq, cfs_rq);
		if (!se)
			goto again;

		cfs_rq = group_cfs_rq(se);
	} while (cfs_rq);

	p = task_of(se);
	if (unlikely(throttled))
		task_throttle_setup_work(p);
	return p;
}

make it more obvious / be simpler?
