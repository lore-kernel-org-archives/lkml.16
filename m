Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3979438384
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749047391; cv=none; b=CWzyy5A/yfXrFsbNmHr4qa8+NwRs6K0GWw2TMtIj1cVQ2yVBnNWFDP6J1/oL2rWQ0bFz3FxB5qyafc4jQj5KUXxkYtfxL4CK6Hq/WttedcQteY3BopZ9Czf3ujKHO92972muLVgns3yBUGg7spNjyyLLJuPqZDwdcmzPn2D/XAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749047391; c=relaxed/simple;
	bh=B6OpX1d9C5FQH9QBXEjnvZ/p0W1fYsSZa9lHLO12kKU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=At2isJLUHuJ5lnEXk1zUoxMrOtsLJcVN7EjnP0kZemZ7CxF3kz9xabpdfu/Lr3i6KEAIYYyboW/xyTQTpqQR4eQNGDmTPKZ8+GV5ZEfSiBXU7ZvT2Cv19UxfEFofx5y5dOi7Zy9x9ckEE1XpexMZrkdwhb8UfWSiMg13LPh+5f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E42C4CEE4;
	Wed,  4 Jun 2025 14:29:49 +0000 (UTC)
Date: Wed, 4 Jun 2025 10:31:06 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Prakash Sangappa <prakash.sangappa@oracle.com>
Cc: linux-kernel@vger.kernel.org, peterz@infradead.org,
 mathieu.desnoyers@efficios.com, tglx@linutronix.de, bigeasy@linutronix.de,
 kprateek.nayak@amd.com, vineethr@linux.ibm.com
Subject: Re: [PATCH V5 1/6] Sched: Scheduler time slice extension
Message-ID: <20250604103106.1465f847@gandalf.local.home>
In-Reply-To: <20250603233654.1838967-2-prakash.sangappa@oracle.com>
References: <20250603233654.1838967-1-prakash.sangappa@oracle.com>
	<20250603233654.1838967-2-prakash.sangappa@oracle.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  3 Jun 2025 23:36:49 +0000
Prakash Sangappa <prakash.sangappa@oracle.com> wrote:

> @@ -2249,6 +2251,20 @@ static inline bool owner_on_cpu(struct task_struct *owner)
>  unsigned long sched_cpu_util(int cpu);
>  #endif /* CONFIG_SMP */
>  
> +#ifdef CONFIG_RSEQ
> +
> +extern bool rseq_delay_resched(void);
> +extern void rseq_delay_resched_fini(void);
> +extern void rseq_delay_resched_tick(void);
> +
> +#else
> +
> +static inline bool rseq_delay_resched(void) { return false; }
> +static inline void rseq_delay_resched_fini(void) { }
> +static inline void rseq_delay_resched_tick(void) { }
> +
> +#endif
> +

Can we add a config to make this optional. I don't want to allow any task
to have an extended timeslice over RT tasks regardless of how small the
delay is.

-- Steve
