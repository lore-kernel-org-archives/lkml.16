Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE70253934
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750409722; cv=none; b=CDB6qHJiGvHTwGA18DKn/WthRfbwR82mHAjy26lbOdPngQljwvMI1+zipyC7daBsbDnmDTpFVnnn8dhW53DQLMDk99S0ddtUjaHUg4vN9mFK3GE4FNfGDtDGrYnEChd5UwHL4AMldzPfLpkJyPhFU8Nw5owccYVSN6ewVzKMLdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750409722; c=relaxed/simple;
	bh=ibo1+MfGvspIJ5xwNrivqYLuEwvCp00xsR0JOLDxMDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OZLj0ZlJbMv7LTufKqoGllPxpNSueBKkC90udpSPxyZcu2GC3ilhAeImaLlDglrCI4iLD6y6eK2U2pm4cHBXOeYtby13yhPtKd60oXCBfb78un5a6A06jvbiiYTAQ35rb+xsXo9FRqee50yACITmzHQsEXVnDtbcOUwPfcw0DOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MvOCnn0O; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MvOCnn0O"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LgYk/Vkshdk6e/c7GIX/rl6+rxy7x6k+Gm8Yudz/dEc=; b=MvOCnn0O4Qix7BMeYLhVJymppJ
	fTLcuKJys28g8agGvRL7K8lBaiXotc6YTvzh38875m3aXcM5IW0zSk/E2VkseXwDStuLtmq0iGHNU
	us6cdy4a0IladSlrASDFjl23sLCEvsGqm6qocGCA34Je9DXz8yFiBr/mqrGu9K1ZFSgKNVnTpbEXD
	+nncuwl1QmI1UcveEFKi5avuQxfqcrgTIliIMQKRsYY7UPHSVHm4KRFCvBIRKgNZGaUg8n86rpkuP
	pH5LUyKzVdGJHBl5ie2j5LHcmEbndKf4FkwidNNQqb2vbBvmGgdUOB1/2vxKCRMQktcqEdf2kWoY0
	Wu9/RmwA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSXWi-00000004g8x-14YH;
	Fri, 20 Jun 2025 08:55:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4376B308989; Fri, 20 Jun 2025 10:55:11 +0200 (CEST)
Date: Fri, 20 Jun 2025 10:55:11 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Olice Zou <zoucaox@gmail.com>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, linux-kernel@vger.kernel.org,
	Olice Zou <olicezou@tencent.com>
Subject: Re: [PATCH] sched/stats: TASK_IDLE task bypass the block_starts time
Message-ID: <20250620085511.GQ1613376@noisy.programming.kicks-ass.net>
References: <20250620031450.581290-1-olicezou@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620031450.581290-1-olicezou@tencent.com>

On Fri, Jun 20, 2025 at 11:14:50AM +0800, Olice Zou wrote:
> For TASK_IDLE task, we not should record the block_starts, it is
> not real TASK_UNINTERRUPTIBLE task.

Why, I mean it is still blocked, right?

> It is easy to find this problem in a idle machine as followe:
> 
> bpftrace -e 'tracepoint:sched:sched_stat_blocked {  \
>     if (args->delay > 1000000)  \
>     {  \
> 	printf("%s %d\n", args->comm, args->delay);  \
> 	print(kstack());  \
>     }  \
> }
> 
> rcu_preempt 3881764
>         __update_stats_enqueue_sleeper+604
>         __update_stats_enqueue_sleeper+604
>         enqueue_entity+1014
>         enqueue_task_fair+156
>         activate_task+109
>         ttwu_do_activate+111
>         try_to_wake_up+615
>         wake_up_process+25
>         process_timeout+22
>         call_timer_fn+44
>         run_timer_softirq+1100
>         handle_softirqs+178
>         irq_exit_rcu+113
>         sysvec_apic_timer_interrupt+132
>         asm_sysvec_apic_timer_interrupt+31
>         pv_native_safe_halt+15
>         arch_cpu_idle+13
>         default_idle_call+48
>         do_idle+516
>         cpu_startup_entry+49
>         start_secondary+280
>         secondary_startup_64_no_verify+404

Not sure what I'm looking at there. What is the problem?

> Signed-off-by: Olice Zou <olicezou@tencent.com>
> ---
>  kernel/sched/fair.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index a85539df75a5..e473e3244dda 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1285,7 +1285,7 @@ update_stats_dequeue_fair(struct cfs_rq *cfs_rq, struct sched_entity *se, int fl
>  		if (state & TASK_INTERRUPTIBLE)
>  			__schedstat_set(tsk->stats.sleep_start,
>  				      rq_clock(rq_of(cfs_rq)));
> -		if (state & TASK_UNINTERRUPTIBLE)
> +		if (state != TASK_IDLE && (state & TASK_UNINTERRUPTIBLE))
>  			__schedstat_set(tsk->stats.block_start,
>  				      rq_clock(rq_of(cfs_rq)));
>  	}
> -- 
> 2.25.1
> 
