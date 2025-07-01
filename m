Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60802272E72
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370021; cv=none; b=Rw+J9rbkDwgKRMRbxAyuZR1IFOOljKqfbG+WS9/kRxVieKCHhDeLMK5nWEXBNqHQFCRXrcQ3rc/LEKGYCwDVeEpUnW+c1ztMcpJ+vJmn39cycp3ZG/IoiuiIIMJrieyPowdfT4qGizepIT++jv/UGJICZXXJ9ZlVTsQkSI3dul0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370021; c=relaxed/simple;
	bh=HQPwv+SP31wl6xpFSXy3aqogQXVMr+08f8HTHj811aA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6kYRbm4X4AbsMghFUfac/6a04sGm1bvNT9eTs/SBLW7rMH3w0AgquZob2hDYcQ0Uzm/8Ix4hSg570gdmuigtJhWKu1TG7z3S3OwQ7zGanC3fIFMfQSP87Db5pz9WSxefHiBjItzKqUXv6IoeXdsewME9K6zpZ+5WnuNHlLvFCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=drMkqzHa; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="drMkqzHa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=N5pMuijdxQ5pavWYy4u6FlQuP1SvJsDKv6i9SCb7BX8=; b=drMkqzHaEU/qSkQ3v9EVpJmEWL
	dExZMJ+Qvjwb777P8MBcuOvEZRXu+mXLx/aqPvtWGJ6LspqpkYX2yRBmKqqs26HtQeO3yOYN1ojbt
	w1n5tx34rNdj9Ijht98hvzj5v7uloGYGyk2x0yPFDov6y1qJT41FA6CGBGetvOhWE1/fNmanxlGeU
	exp9HoCFxkB/03Z8P5PPL5mxNhTGsTSg3MwShXovX/1ooqyTSXvmOqM8KISJykCktYfctIcDN1JSb
	nfWU1r15z0u8oIFBSQv5p53TPR55TSfq/KfYMZ62TJCxm0FriETDSOdGmzYvkKS1BThygXvfSe+pt
	glA9126g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZLP-000000074pu-3Ry3;
	Tue, 01 Jul 2025 11:40:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id ED23B30012D; Tue, 01 Jul 2025 13:40:10 +0200 (CEST)
Date: Tue, 1 Jul 2025 13:40:10 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Prakash Sangappa <prakash.sangappa@oracle.com>,
	linux-kernel@vger.kernel.org, rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com, bigeasy@linutronix.de,
	vineethr@linux.ibm.com
Subject: Re: [PATCH V6 1/7] Sched: Scheduler time slice extension
Message-ID: <20250701114010.GP1613376@noisy.programming.kicks-ass.net>
References: <20250701003749.50525-1-prakash.sangappa@oracle.com>
 <20250701003749.50525-2-prakash.sangappa@oracle.com>
 <87cyakmhdv.ffs@tglx>
 <20250701105653.GO1613376@noisy.programming.kicks-ass.net>
 <1170c037-15c0-4f22-8e2d-456ad17396cf@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1170c037-15c0-4f22-8e2d-456ad17396cf@amd.com>

On Tue, Jul 01, 2025 at 04:58:26PM +0530, K Prateek Nayak wrote:
> Hello Peter,
> 
> On 7/1/2025 4:26 PM, Peter Zijlstra wrote:
> > On Tue, Jul 01, 2025 at 10:42:36AM +0200, Thomas Gleixner wrote:
> > 
> > > What's worse is that it breaks the LAZY semantics. I explained this to
> > > you before and this thing needs to be tied on the LAZY bit otherwise a
> > > SCHED_OTHER task can prevent a real-time task from running, which is
> > > fundamentally wrong.
> > 
> > So here we disagree, I don't want this tied to LAZY.
> > 
> > SCHED_OTHER can already inhibit a RT task from getting ran by doing a
> > syscall, this syscall will have non-preemptible sections and the RT task
> > will get delayed.
> > 
> > I very much want this thing to be limited to a time frame where a
> > userspace critical section (this thing) is smaller than such a kernel
> > critical section.
> > 
> > That is, there should be no observable difference between the effects of
> > this new thing and a syscall doing preempt_disable().
> > 
> > 
> > That said; the reason I don't want this tied to LAZY is that RT itself
> > is not subject to LAZY and this then means that RT threads cannot make
> > use of this new facility, whereas I think it makes perfect sense for
> > them to use this.
> 
> Thinking out loud: I know we are trying to keep the overhead to a
> minimum but is it acceptable to go through with schedule() and decide
> on extending the time slice in pick_next_task_fair() / pick_task_rt()?
> 
> Then, a higher priority task can always preempt us when preemption is
> enabled and between the tasks of same class, it is just a redundant
> schedule() loop.
> 
> It'll require some additional care to start accounting for delay from
> the time when NEED_RESCHED was set and not when schedule() is actually
> called but would the overhead be that bad?

Probably not -- if care was taken to make sure all callers have an
up-to-date rq->clock (many will have today, some might need updating).
Then its just a matter of saving a copy.

Basically stick assert_clock_updated() in __resched_curr() and make all
the splats go away.

> Or would we like to prevent preemption from RT tasks too on
> !PREMMPT_RT since whatever the task asking for the extended slice is
> doing is considered important enough?

I'm not sure I see the need for this complication -- under the premise
that the duration is strictly limited to less than what syscalls can
already inflict upon us, there should be no observable difference in
worst case timing.

But yes, if this makes some people feel better, then I suppose can look
at this.
