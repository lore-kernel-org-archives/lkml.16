Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A0270830
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 09:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746177321; cv=none; b=kSEj5cUXZOWjV/FVSIt9zF/E7FjfFJMBuv2ETjSeyhr2+7s+knlKcVtdGVKhNbD3cFdn7MmF4NgqyMEwjr6q6LEyKPUU6lgqGll2KjpLEcIBkXg1+grvRN7lxajAF6DlnrTH61pnKcM57GMUaw9iVAzI0wi4J+bp5TQV849e4/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746177321; c=relaxed/simple;
	bh=85p4b5FPUsuRZuP7us6XQazfSMZdRXd/H3gI977/p2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R0cHatksFXFNiZ1EKHWfG8MHRLp+XTi+KnwK9mvNQ8slHGFpIPM8G3YstAy765y1KAMRd16cL2VcOHMA4xhcjOLF9mibyriwgHEakp5h4arBCDstSBy5a9pEHjZZw8430shIg4T6nC6KLpBV7Hbgnpt49LE4yqjk0R+2Rc9orJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=m0SzW56o; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="m0SzW56o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ewl5g+5xMGYluTlaE4hSvLM+DJ8x6DL8JY+KF1QhOL4=; b=m0SzW56oqYIR/W6Y1sUN9i/Nkl
	F91zA2PRidt3uJ4AXudaCDqMFxjWd2ifauoRkEIljptx2zwE4LaROlN74C+1yL9inotfiUryUzUDh
	e22xvKZSdi+3Ne305va2WziqceooABZHyrdcvdAkG3XGS6c3wVNeNkSklNWLn8PjbbMPDCnZyZSZ0
	Oge/o1W1rAJW3QtFkUKHAQpMmBrAC/z5B8cwkZWaQmWKwUJoIkAq99nPMt2NCam+bSQpl5pLt4HrD
	d8OQ2NEsIcgTC+sRr63GfRkIH9mqgxjZDVh71eGo5eQs6O9cffHbcgZeqiXTX8TPs7obWd67peyIJ
	hgVCYLzw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAmTo-0000000BqD2-1KL6;
	Fri, 02 May 2025 09:14:49 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id DEF593001D4; Fri,  2 May 2025 11:14:34 +0200 (CEST)
Date: Fri, 2 May 2025 11:14:34 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Prakash Sangappa <prakash.sangappa@oracle.com>
Cc: linux-kernel@vger.kernel.org, rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com, tglx@linutronix.de,
	bigeasy@linutronix.de, kprateek.nayak@amd.com
Subject: Re: [PATCH V3 4/4] Sched: Add tracepoint for sched time slice
 extension
Message-ID: <20250502091434.GV4198@noisy.programming.kicks-ass.net>
References: <20250502015955.3146733-1-prakash.sangappa@oracle.com>
 <20250502015955.3146733-5-prakash.sangappa@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502015955.3146733-5-prakash.sangappa@oracle.com>

On Fri, May 02, 2025 at 01:59:55AM +0000, Prakash Sangappa wrote:
> Trace task's preemption due to a wakeups, getting delayed. Which
> can occurs when the running task requested extra time on cpu.
> Also, indicate the NEED_RESCHED flag set on the task getting
> cleared.
> 
> Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
> ---
>  include/trace/events/sched.h | 28 ++++++++++++++++++++++++++++
>  kernel/entry/common.c        |  8 ++++++--
>  2 files changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/include/trace/events/sched.h b/include/trace/events/sched.h
> index 8994e97d86c1..4aa04044b14a 100644
> --- a/include/trace/events/sched.h
> +++ b/include/trace/events/sched.h
> @@ -296,6 +296,34 @@ TRACE_EVENT(sched_migrate_task,
>  		  __entry->orig_cpu, __entry->dest_cpu)
>  );
>  
> +/*
> + * Tracepoint for delayed resched requested by task:
> + */
> +TRACE_EVENT(sched_delay_resched,
> +
> +	TP_PROTO(struct task_struct *p, unsigned int resched_flg),
> +
> +	TP_ARGS(p, resched_flg),
> +
> +	TP_STRUCT__entry(
> +		__array( char, comm, TASK_COMM_LEN	)
> +		__field( pid_t, pid			)
> +		__field( int, cpu			)
> +		__field( int, flg			)
> +	),
> +
> +	TP_fast_assign(
> +		memcpy(__entry->comm, p->comm, TASK_COMM_LEN);
> +		__entry->pid		= p->pid;
> +		__entry->cpu 		= task_cpu(p);
> +		__entry->flg		= resched_flg;
> +	),
> +
> +	TP_printk("comm=%s pid=%d cpu=%d resched_flg_cleared=0x%x",
> +		__entry->comm, __entry->pid, __entry->cpu, __entry->flg)
> +
> +);
> +
>  DECLARE_EVENT_CLASS(sched_process_template,
>  
>  	TP_PROTO(struct task_struct *p),
> diff --git a/kernel/entry/common.c b/kernel/entry/common.c
> index b26adccb32df..1951e6a4e9bc 100644
> --- a/kernel/entry/common.c
> +++ b/kernel/entry/common.c
> @@ -12,6 +12,7 @@
>  
>  #include "common.h"
>  
> +#include <trace/events/sched.h>
>  #define CREATE_TRACE_POINTS
>  #include <trace/events/syscalls.h>
>  
> @@ -100,9 +101,12 @@ __always_inline unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
>  		local_irq_enable_exit_to_user(ti_work);
>  
>  		if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY)) {
> -		       if (irq && rseq_delay_resched())
> +		       if (irq && rseq_delay_resched()) {
>  			       clear_tsk_need_resched(current);
> -		       else
> +			       trace_sched_delay_resched(current,
> +					       ti_work & (_TIF_NEED_RESCHED |
> +						       _TIF_NEED_RESCHED_LAZY));
> +		       } else
>  			       schedule();
>  		}

This is horrific coding style. But really why do we need this? I'm not,
in general, a fan of tracepoints.
