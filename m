Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965C418E3F
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746196554; cv=none; b=V6+l0SnXNiexqPbAfgnVlN36C2Sj9nsTXKSWCX+Gt6lNufNC3LpuiL01/6BvDbvRU23/mLBDqTNXrPvCRqMEdK2SG6VGgSD+uSDXLFBukFCPmuRiBX5sPSl8BZjDW70G83eigx0P1nWckKlQ8CgWvp0AQ5jljheRIG3b4DGbUiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746196554; c=relaxed/simple;
	bh=ARWyjDur8yjCBSeTQOV6z1pA+12Zrb+wPZ5kWTaPM7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I553hM6R6i28E9lOZra7KvhV+rEUzChAU7TU/6r1y9IL/xRUuTCjTVN5tnbRGPiXHFC7fyZUVZLiQ5+pDz+ob/7dVEhkOP5xeNvad1N+8jFN1yVr+Golbb5TaIV3XECJli7C3eoKEPyDX7JxV3TXRecUvyYUkY+qK9dUYVi3MMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=C6JciLWf; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="C6JciLWf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UbAG8iInp9ePuVcNeFLqHQPxcdJSZ1IQ2sJpc0Vp0h0=; b=C6JciLWf3x/ELUskxzsb2MTsmL
	Ksb2suhhaF2ZSeKe+l8q6pBYe0Yc9gMqqIOMZ/WasmfviyzTvwAxW+xIrL0HtLkKQUmcrEBYgfnEb
	V7WNHjiA1IumPvvE9RWjSqQ2Vl81aj99VmEGUGPAPhr88ZUrvs3/ve2ADuFV9eonLTcnGVC3qCsrq
	yms1Bm/y1+Wm1N/zpXGOzbM2Mi6f52+ahnkdqKzwjtH/TjuRNBOff/GC/oSkeiY2ojtjEDy5sf5rY
	5ONAZ7nuWryi5BA5BZLB6hhMBP+B1OuLaR2NCOGrM1BtBeuA0zXshlwHg2UQHV0pYXpkO8kVaUfzo
	xROEjAEQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uArUP-0000000Ezmp-09yi;
	Fri, 02 May 2025 14:35:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 97AE230057C; Fri,  2 May 2025 16:35:44 +0200 (CEST)
Date: Fri, 2 May 2025 16:35:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Prakash Sangappa <prakash.sangappa@oracle.com>,
	linux-kernel@vger.kernel.org, rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com, tglx@linutronix.de,
	kprateek.nayak@amd.com
Subject: Re: [PATCH V3 1/4] Sched: Scheduler time slice extension
Message-ID: <20250502143544.GW4439@noisy.programming.kicks-ass.net>
References: <20250502015955.3146733-1-prakash.sangappa@oracle.com>
 <20250502015955.3146733-2-prakash.sangappa@oracle.com>
 <20250502123433.AHDVLZdY@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502123433.AHDVLZdY@linutronix.de>

On Fri, May 02, 2025 at 02:34:33PM +0200, Sebastian Andrzej Siewior wrote:
> On 2025-05-02 01:59:52 [+0000], Prakash Sangappa wrote:
> > diff --git a/kernel/entry/common.c b/kernel/entry/common.c
> > index 20154572ede9..b26adccb32df 100644
> > --- a/kernel/entry/common.c
> > +++ b/kernel/entry/common.c
> > @@ -98,8 +99,12 @@ __always_inline unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
> >  
> >  		local_irq_enable_exit_to_user(ti_work);
> >  
> > -		if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))
> > -			schedule();
> > +		if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY)) {
> 
> I asked to limit this to LAZY only.

No -- this should work irrespective of the preemption model chosen.

It should also have a default time that is shorter than the scheduling
delay normally observed.

It should probably also have a PR_WARN on raising the sysctl value.

I know you worry about RT, but show me a trace where it is a problem.
