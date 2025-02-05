Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD141FECB8
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 22:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738793937; cv=none; b=LMLMEUnhod8TjvOJYUtTbQSuDzPwLkYvYkG/f1f/mvhnzuyV4X5gu92tHE1cN6LU/EC4Hs0HVbYcPzqt/BCQKaawTl8s4JAdfdCF1HeNfaGR5XN0RCMy6gfeqfBYS1avgajdIUBvuWV3LFLWrQopiiYBKgRb9rM3Xw2/lwc0kWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738793937; c=relaxed/simple;
	bh=/10U5fOTWX0m01T0ElNnXLTtip80+4+Wor1o9ULVx6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqZsA+A4fTNHO3cwPV8dMZ6BvVyYdQv/eCRxUQf8rI1yqH7jG+nwUaPsOfBdCHa6W1yr3elQvMnZ8cPQZNCOuiezv+P/ssH3iBCAjSQ4RRwebWh3iAElaXSUm4OculwyDJmvE2RQDQRnLNboSwqt+r7hlrgJRZbH/JHjtjdjCcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CV7fiaXm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CV7fiaXm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1F0C4CED1;
	Wed,  5 Feb 2025 22:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738793935;
	bh=/10U5fOTWX0m01T0ElNnXLTtip80+4+Wor1o9ULVx6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CV7fiaXmOk5HYpukAuIdd/+6LiNzd5BFkzx9X8fgdd8/7gZvqrgHFWcJI85Q3SW9L
	 3TyxsE30GtYGItI/55V1RA2X0UEW6RpOGrIyueZ0x7jMJwR5J3ixc1j2TitlZUJCsK
	 ctDHUAPlzXG9aUwManeNzSxb+kyNuV11RuPmA6e9lwW8OQy0aHY+KXNBAoH7wm2WhZ
	 p3bwZ9Pb3M8lyI+SGT0cHMOAfNXlTzJdLKbtt68PIyV+z/GH85LRGXbVPACRYQVjtF
	 iuBKzxl80IWGhNvBO6km/APo515vcofSKglwCNxDO/QMZfyUXPb5UA7TuV/kSffqPO
	 sj/0L2BOXApLw==
Date: Wed, 5 Feb 2025 23:18:52 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mateusz Guzik <mjguzik@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] exit: change the release_task() paths to call
 flush_sigqueue() lockless
Message-ID: <Z6PjzA61v6s732JF@pavilion.home>
References: <20250205175136.GA8702@redhat.com>
 <20250205175159.GA8714@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250205175159.GA8714@redhat.com>

Le Wed, Feb 05, 2025 at 06:51:59PM +0100, Oleg Nesterov a écrit :
> A task can block a signal, accumulate up to RLIMIT_SIGPENDING sigqueues,
> and exit. In this case __exit_signal()->flush_sigqueue() called with irqs
> disabled can triger a hard lockup, see
> https://lore.kernel.org/all/20190322114917.GC28876@redhat.com/
> 
> Fortunately, after the recent posixtimer changes sys_timer_delete() paths
> no longer try to clear SIGQUEUE_PREALLOC and/or free tmr->sigq, and after
> the exiting task passes __exit_signal() lock_task_sighand() can't succeed
> and pid_task(tmr->it_pid) will return NULL.
> 
> This means that after __exit_signal(tsk) nobody can play with tsk->pending
> or (if group_dead) with tsk->signal->shared_pending, so release_task() can
> safely call flush_sigqueue() after write_unlock_irq(&tasklist_lock).
> 
> Also, kill clear_tsk_thread_flag(TIF_SIGPENDING), it was never needed.
> 
> TODO:
> 	- we can probably shift posix_cpu_timers_exit() as well
> 	- do_sigaction() can hit the similar problem
> 
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> ---
>  kernel/exit.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/kernel/exit.c b/kernel/exit.c
> index 3485e5fc499e..bc2c24ea4181 100644
> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@ -200,20 +200,12 @@ static void __exit_signal(struct task_struct *tsk)
>  	__unhash_process(tsk, group_dead);
>  	write_sequnlock(&sig->stats_lock);
>  
> -	/*
> -	 * Do this under ->siglock, we can race with another thread
> -	 * doing sigqueue_free() if we have SIGQUEUE_PREALLOC signals.
> -	 */
> -	flush_sigqueue(&tsk->pending);
>  	tsk->sighand = NULL;
>  	spin_unlock(&sighand->siglock);
>  
>  	__cleanup_sighand(sighand);
> -	clear_tsk_thread_flag(tsk, TIF_SIGPENDING);

Looks good to me, except for this TIF_SIGPENDING removal which I'm less
sure about, I see a lot of places where it is added/removed. Well it's
probably only checked locally on entry code. Would it make sense to move
this chunk to a separate preceding patch? Or keep it here but at least
explain on the changelog why it is safe to remove it?

Thanks!

> -	if (group_dead) {
> -		flush_sigqueue(&sig->shared_pending);
> +	if (group_dead)
>  		tty_kref_put(tty);
> -	}
>  }
>  
>  static void delayed_put_task_struct(struct rcu_head *rhp)
> @@ -279,6 +271,11 @@ void release_task(struct task_struct *p)
>  	proc_flush_pid(thread_pid);
>  	put_pid(thread_pid);
>  	release_thread(p);
> +
> +	flush_sigqueue(&p->pending);
> +	if (thread_group_leader(p))
> +		flush_sigqueue(&p->signal->shared_pending);
> +
>  	put_task_struct_rcu_user(p);
>  
>  	p = leader;
> -- 
> 2.25.1.362.g51ebf55
> 
> 
