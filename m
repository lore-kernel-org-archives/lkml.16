Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFB528E609
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749047729; cv=none; b=VUKD/8hpzaFO7fnfrQYPb/Cdq1pwc/DnbTOUpdFkHTw7w8Fj/asm1LZakFo2PZG9/4QpH7DvL+bCmnpm871Waa/JMDtQuRA1Y9sLxuHBNnidaRc4bD93iv+ihZpNPg4R31p1jBwNBs4olftWpono0M9DUeQjVRViK9Ei9ogvjx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749047729; c=relaxed/simple;
	bh=9VdxedsOYm0r0hMXgOM1bra4XGrjU1bsrGDncgfayZU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rGrW25d5Fl3wPPSImOSc0/bGVL2cScP1xjZy9iL7F2X9/6+9xnr57vtbmpJDxTNoRqQa18js7f/WJ6PdhS6I0qIWVJv799+bNatyNMGE7Qt4EqJxT1L1gsWgApDQRdYS8DnHp3sphYux5M+0/N0YGicdW2Zcbo10if4tpSpnnQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A43DC4CEE4;
	Wed,  4 Jun 2025 14:35:27 +0000 (UTC)
Date: Wed, 4 Jun 2025 10:36:44 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Prakash Sangappa <prakash.sangappa@oracle.com>
Cc: linux-kernel@vger.kernel.org, peterz@infradead.org,
 mathieu.desnoyers@efficios.com, tglx@linutronix.de, bigeasy@linutronix.de,
 kprateek.nayak@amd.com, vineethr@linux.ibm.com
Subject: Re: [PATCH V5 5/6] Sched: Add tracepoint for sched time slice
 extension
Message-ID: <20250604103644.4b41b9a3@gandalf.local.home>
In-Reply-To: <20250603233654.1838967-6-prakash.sangappa@oracle.com>
References: <20250603233654.1838967-1-prakash.sangappa@oracle.com>
	<20250603233654.1838967-6-prakash.sangappa@oracle.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  3 Jun 2025 23:36:53 +0000
Prakash Sangappa <prakash.sangappa@oracle.com> wrote:

> @@ -134,6 +138,10 @@ __always_inline unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
>  		ti_work = read_thread_flags();
>  	}
>  
> +	if (ti_work_cleared)
> +		trace_sched_delay_resched(current, ti_work_cleared &
> +			(_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY));
> +

Please make the above into a conditional tracepoint and you can also just
pass in ti_work_cleared. No reason to do that outside the tracepoint. As
the above is always checked regardless if tracing is enabled or not.

TRACE_EVENT_CONDITION(sched_delay_resched,

	TP_PROTO(struct task_struct *p, unsigned int ti_work_cleared),

	TP_ARGS(p, ti_work_cleared),

	TP_CONDITION(ti_work_cleared),

	TP_STRUCT__entry(
		__array( char, comm, TASK_COMM_LEN	)
		__field( pid_t, pid			)
		__field( int, cpu			)
		__field( int, flg			)
	),

	TP_fast_assign(
		memcpy(__entry->comm, p->comm, TASK_COMM_LEN);
		__entry->pid		= p->pid;
		__entry->cpu 		= task_cpu(p);
		__entry->flg		= ti_work_cleared & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY);
	),


-- Steve
