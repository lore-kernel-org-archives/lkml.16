Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB6E23645F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744888373; cv=none; b=G2xlQV+2j9aFI9r4wzq1oDy6YYFaS5mu7US0GbDkzn+JmerWwCewcWGyjbJNw6aL/wIHVck+Hi/m9HZWcIT51k6qlsc1s/RZdP9Ipzr7DYfc5TJ3krO6fx86iil68GGBLYV5nrj8JtmhisVZJC0RFMy3iuAQdG1CnJ3tG7t4rWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744888373; c=relaxed/simple;
	bh=rGrFUoXQoplPibJ78I99/Bog8ZqlUwebwpq52DCwoRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pFDTI+MdTsiSus2lrv/ds3mAXKpLP4XjBpNHknRDYRrabxkjRa3Cp9fd1de5/RnHuyVBGsVzEWcby0Kz/t3bcX2HjRztGalo9XIndJx8X5QbNx+EwHqWeOSBj/8dn/Bh+UkNuHHKG6h2L4HmFVDyRaGnNxpw6cMULdLWrjrJLbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QuVbiVgC; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QuVbiVgC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Z8l0bhIFoYlmtBrA9usXNwgbcvylvbX/S2GTeKjB0kQ=; b=QuVbiVgCrf6F9vQnPmN5JL1ETH
	FYHymfTy68EKhZiN/OKB/6WJvmqHUQ91SuAltSkqlHL6s16sbS7ENYYfUBB/+PNcVD/cPxsUA3Lrj
	3CvBmxV9iN55PPjZXdhpWG2rEdHtVMmJly79Lxdt471dtB2KeiC5tSA/LlN4XQH9kQtHdIbuPFeiE
	DTQHLZ70D50i5xp/wkgMNZuEBxt8CpTe4zmz+EAbZP+NLJ9XyrQFGnDVrF+O4Gfxdc8TnQ3FTM/FR
	q8L6y2dfx54fJMw+GL5VN1IJAtqVZ/k2VPlZV0eZ9JGejIeGB3OoWclcOlnIFfSjjwZMzK1vTRVwn
	0VtgPObQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5NAa-0000000AGF1-1QE3;
	Thu, 17 Apr 2025 11:12:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B0A44300619; Thu, 17 Apr 2025 13:12:35 +0200 (CEST)
Date: Thu, 17 Apr 2025 13:12:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: John Stultz <jstultz@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Metin Kaya <Metin.Kaya@arm.com>,
	Xuewen Yan <xuewen.yan94@gmail.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Suleiman Souhlal <suleiman@google.com>, kernel-team@android.com
Subject: Re: [PATCH v16 4/7] sched: Fix runtime accounting w/ split exec &
 sched contexts
Message-ID: <20250417111235.GK38216@noisy.programming.kicks-ass.net>
References: <20250412060258.3844594-1-jstultz@google.com>
 <20250412060258.3844594-5-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412060258.3844594-5-jstultz@google.com>

On Fri, Apr 11, 2025 at 11:02:38PM -0700, John Stultz wrote:

> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index e43993a4e5807..da8b0970c6655 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1143,22 +1143,33 @@ static void update_tg_load_avg(struct cfs_rq *cfs_rq)
>  }
>  #endif /* CONFIG_SMP */
>  
> -static s64 update_curr_se(struct rq *rq, struct sched_entity *curr)
> +static s64 update_se_times(struct rq *rq, struct sched_entity *se)

update_se() 

>  {
>  	u64 now = rq_clock_task(rq);
>  	s64 delta_exec;
>  
> -	delta_exec = now - curr->exec_start;
> +	delta_exec = now - se->exec_start;
>  	if (unlikely(delta_exec <= 0))
>  		return delta_exec;
>  
> -	curr->exec_start = now;
> -	curr->sum_exec_runtime += delta_exec;
> +	se->exec_start = now;
> +	if (entity_is_task(se)) {
> +		struct task_struct *running = rq->curr;
> +		/*
> +		 * If se is a task, we account the time against the running
> +		 * task, as w/ proxy-exec they may not be the same.
> +		 */
> +		running->se.exec_start = now;
> +		running->se.sum_exec_runtime += delta_exec;
> +	} else {
> +		/* If not task, account the time against se */
> +		se->sum_exec_runtime += delta_exec;
> +	}


So I am confused; you're accounting runtime to the actual running task,
but then accounting the same runtime to the cgroup of the donor.

This seems somewhat irregular.

Please consider all of update_curr_task(), and if they all want to be
against rq->curr, rather than rq->donor then more changes are needed.


> @@ -1213,7 +1224,7 @@ s64 update_curr_common(struct rq *rq)
>  	struct task_struct *donor = rq->donor;
>  	s64 delta_exec;
>  
> -	delta_exec = update_curr_se(rq, &donor->se);
> +	delta_exec = update_se_times(rq, &donor->se);
>  	if (likely(delta_exec > 0))
>  		update_curr_task(donor, delta_exec);
>  
> @@ -1233,7 +1244,7 @@ static void update_curr(struct cfs_rq *cfs_rq)
>  	if (unlikely(!curr))
>  		return;
>  
> -	delta_exec = update_curr_se(rq, curr);
> +	delta_exec = update_se_times(rq, curr);
>  	if (unlikely(delta_exec <= 0))
>  		return;

I think I've tripped over this before, on how update_curr_common() uses
donor and update_curr() curr. This definitely needs a comment. Because
at first glance they're not the same.
