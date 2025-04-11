Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E035020C02E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 22:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744408808; cv=none; b=LcZBgdRMFiE4QNF6kwHhCROyGQ6X0qIicfZ14p5Qgm2zPwaIq/wm+tp6NGwvECab1xpRAMxifnn/Ym6prrf/jyr4LVVmdnOiU24jefVm2YoGcwiR/UXfsV4P5Yc/nUfGrDqTSNmvjY1rSX6B/EPg+5KZvoPKgNr5LfzArPk4GpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744408808; c=relaxed/simple;
	bh=jEwqV3W5uRWcUoIIEquLRQUW+/fnUt/6JfEcd8QbIL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hY14iqHOiFKAPLbt8fxxpAoZYAVNzmCt4woawEh1/E4EiG5BjzLmycevM9gdZkQmJXs1poFoEGJ/p+lW0scGwWgEI6e3/y10NBIZESl0xyhbELDulN34fXm7ZTLan7K4VB7sHeBzhbyEeKosRfKfbgoPfq4RWL+hQFmTLncw70Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VrbhhsTd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VrbhhsTd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02CA1C4CEE5;
	Fri, 11 Apr 2025 22:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744408806;
	bh=jEwqV3W5uRWcUoIIEquLRQUW+/fnUt/6JfEcd8QbIL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VrbhhsTdLKdbOwEKULirDK4Nw7Gzj6RISy0LqKnBxKaSjYkZigZs6+UrOwzV5Z/cC
	 FmNTF7biBmZDCliUf9HuuCWn2sgT7hLuO9L1/t0pPMmP7/458parRN0QUAoeawflCM
	 uCQGhIe/ZPJYDOI9gqcdsUyih6ijuDvLyFnY3Qdocl3g71HCQNOddccnr0Q64SEM7F
	 aKyItkPy2gy7TjXp0YU99f80Ureu79e+nucezFSjH6vlWZA/TvZRgP4ZYezHIKUL2m
	 VX+d/qMDZnZEBKsmQ5mzwxrFHC8gC3GRhMFPKA/GwYnVik27VdTgaeM/sXyya2t7UM
	 Rup5ZNdNiiv9A==
Date: Sat, 12 Apr 2025 00:00:03 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Michal Hocko <mhocko@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org
Subject: Re: [PATCH 5/6] sched/isolation: Introduce isolated task work
Message-ID: <Z_mQ4-7BeCCJGSIN@pavilion.home>
References: <20250410152327.24504-1-frederic@kernel.org>
 <20250410152327.24504-6-frederic@kernel.org>
 <20250411102555.GA5322@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250411102555.GA5322@redhat.com>

Le Fri, Apr 11, 2025 at 12:25:56PM +0200, Oleg Nesterov a écrit :
> I know nothing about this code so I can't review, but let me
> ask anyway...
> 
> On 04/10, Frederic Weisbecker wrote:
> >
> > +int __isolated_task_work_queue(void)
> > +{
> > +	unsigned long flags;
> > +	int ret;
> > +
> > +	if (current->flags & PF_KTHREAD)
> > +		return -EINVAL;
> 
> What about PF_USER_WORKER's ? IIUC, these (in fact kernel) threads
> never return to userspace and never call task_work_run().

Ah good catch! (though I'm having a hard time finding out what this is
about)...

> 
> Or PF_IO_WORKER's, they too run only in kernel mode... But iirc they
> do call task_work_run().

At least I see a lot of task_work usage in io_uring, and there are some
explicit calls to task_work_run() there...

> 
> > +	local_irq_save(flags);
> > +	if (task_work_queued(&current->nohz_full_work)) {
> > +		ret = 0;
> > +		goto out;
> > +	}
> > +
> > +	ret = task_work_add(current, &current->nohz_full_work, TWA_RESUME);
> > +out:
> > +	local_irq_restore(flags);
> > +	return ret;
> 
> Hmm, why not
> 
> 	local_irq_save(flags);
> 	if (task_work_queued(...))
> 		ret = 0;
> 	else
> 		ret = task_work_add(...);

Hehe, yes indeed!

Thanks!

-- 
Frederic Weisbecker
SUSE Labs
