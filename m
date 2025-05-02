Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480CC171A1
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 13:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191205; cv=none; b=kxbvE0hBvMebPRXuYJXpXc3csUPYD6dON8Rp2QhOR3C9rqjRd2mHeKJYnP5lBiJWgUwqGaXfh6/Pb9D0I0Wb1AyOKiY0mFSjX7WrsJp83cCRPvjPUWrv6+UKuJ57mn5bjChnk9FLn+4pi19g5Akv/eOOfyWfHL3K7gyHZwDuVog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191205; c=relaxed/simple;
	bh=CZwot3kV+ZLQ9mdEpZRwUh83dW0oHZrQUebAyKgwH6U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fqveh+qrkM4/YF3MjBy8x/5/eVCooYAk4vhJixmXe67ezl7aDnD7cyvsq1hD9P4nylVOu3TyA7hDaMoJ8lBD2B5Q/LPwwfclwVe1kN7f07lczYP6DHIqunutrEvJMyJtN0PiMtqSyAwQhW10rEwCEoJKDQWS7bCtdrcHChzrCf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98A5C4CEE4;
	Fri,  2 May 2025 13:06:43 +0000 (UTC)
Date: Fri, 2 May 2025 09:06:43 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Prakash Sangappa <prakash.sangappa@oracle.com>,
 linux-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
 tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com
Subject: Re: [PATCH V3 1/4] Sched: Scheduler time slice extension
Message-ID: <20250502090643.3809b6f5@batman.local.home>
In-Reply-To: <20250502090529.GU4198@noisy.programming.kicks-ass.net>
References: <20250502015955.3146733-1-prakash.sangappa@oracle.com>
	<20250502015955.3146733-2-prakash.sangappa@oracle.com>
	<20250502090529.GU4198@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 2 May 2025 11:05:29 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> > diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
> > index cd38f4e9899d..1b2b64fe0fb1 100644
> > --- a/kernel/sched/syscalls.c
> > +++ b/kernel/sched/syscalls.c
> > @@ -1378,6 +1378,11 @@ static void do_sched_yield(void)
> >   */
> >  SYSCALL_DEFINE0(sched_yield)
> >  {
> > +	if (IS_ENABLED(CONFIG_RSEQ) && current->sched_time_delay) {
> > +		schedule();
> > +		return 0;
> > +	}
> > +
> >  	do_sched_yield();
> >  	return 0;
> >  }  
> 
> Multiple people, very much including Linus, have already said this
> 'cute' hack isn't going to fly. Why is it still here?

Who was against this?

Linus objected to "optimizing yield" because it has *semantics* that
people depend on because it has historical meaning. Things like "move
the process to the end of the scheduling queue of that priority".

  https://lore.kernel.org/linux-trace-kernel/CAHk-=wgTWVF6+dKPff-mhVwngFwBu_G9+fwOTF2Ds+YPj3xkeQ@mail.gmail.com/

I countered that this "optimization" would only affect those that use
the extended time slice and would not cause any issues with current
applications that depend on its current semantics.

Linus never replied to that.

Or did Linus reply to this someplace else too that I missed?

If we don't do this, what would be the system call to use to tell the
kernel that the task no longer needs extra time?

-- Steve
