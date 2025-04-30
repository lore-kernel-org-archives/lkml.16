Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C542512D9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017077; cv=none; b=av6MwF/KvwcNi1Wa91K0en1MyZ9+Z327SBAv1yYqnRd5lmVyfZSr/FTDHEgZVMkGu//TtSyYxxpcai51FnewxDzaHl/POR0WdGxAEIPrHzrsCGM4uDZeha80k2axDtatzb1zA67BtI97N64QfFQitR1z8q/QguVadVqGo/Qj4H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017077; c=relaxed/simple;
	bh=pFBPBKVeh3ECn3LZe0QEjxLBb0Hxgu2pZEAUbK3e/ZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Za/wMgWrDIxj2//ilE29Nri0H9i3TmDE46cNYbpAfQA7VHwuPvGWUiTzbxj2cXKNn/GlNlyG0OYIAZHMZNcQXWZvSZM45sZQnRN85fwnN8s4s/AtsTwUwePSMTDnoPlDOHfwP9bTky5wEZsNJq3uvATuSYmmWU5oKzdInbZ1Fdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lh5OshG0; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lh5OshG0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZDV2ImwHah1jRIyOwBhpwDfe5XOpCc4jcOz1U69rE9w=; b=lh5OshG0cnqluiCiON/Dp6ESmT
	wXcAU3z2uJFliyIp2L6L4BXWru6+i9X6IRCqJE826fGNV77YG/d1sWIyv1uMqo5nB3VbbIEEFV9LM
	MUQE26c9qfOYx7QbPY/mDCD5VBT6n31XQ5Xd7hCdz7ZbtaiArIpjdtqKiBnmNcx1n7qhAulAMJbcO
	PWsNsnLVfm9fSeztTMtXjeqmzwrXJP3mbfHZ6YId+Oy6g4CbCmEi3ypI+rhsZDrgWTvM7G8V1bUVd
	iqfK9MzuBkt6XhWvY+N6bUDmU8h+yA6mb8ega2PJBJAcuuRjwfjhqqZ6fev6B5ErMrz+oaDC/vy0N
	s2iLsing==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6na-0000000CKwV-2Vp3;
	Wed, 30 Apr 2025 12:44:26 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E3E07300642; Wed, 30 Apr 2025 14:44:25 +0200 (CEST)
Date: Wed, 30 Apr 2025 14:44:25 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Phil Auld <pauld@redhat.com>
Cc: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>, kernel-team@android.com,
	peter-yc.chang@mediatek.com
Subject: Re: [PATCH v3] sched/core: Tweak wait_task_inactive() to force
 dequeue sched_delayed tasks
Message-ID: <20250430124425.GN4439@noisy.programming.kicks-ass.net>
References: <20250429150736.3778580-1-jstultz@google.com>
 <20250429153605.GA69823@pauld.westford.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429153605.GA69823@pauld.westford.csb>

On Tue, Apr 29, 2025 at 11:36:05AM -0400, Phil Auld wrote:
> Hi John,
> 
> On Tue, Apr 29, 2025 at 08:07:26AM -0700 John Stultz wrote:
> > It was reported that in 6.12, smpboot_create_threads() was
> > taking much longer then in 6.6.
> > 
> > I narrowed down the call path to:
> >  smpboot_create_threads()
> >  -> kthread_create_on_cpu()
> >     -> kthread_bind()
> >        -> __kthread_bind_mask()
> >           ->wait_task_inactive()
> > 
> > Where in wait_task_inactive() we were regularly hitting the
> > queued case, which sets a 1 tick timeout, which when called
> > multiple times in a row, accumulates quickly into a long
> > delay.
> > 
> > I noticed disabling the DELAY_DEQUEUE sched feature recovered
> > the performance, and it seems the newly create tasks are usually
> > sched_delayed and left on the runqueue.
> 
> This seems odd to me. Maybe I'm just misunderstanding something but
> I don't see how newly created tasks should have accumulated enough
> runtime to have negative lag that needs to be decayed. 
> 
> That said, I think it does make sense to dequeue in this case. 

Well, they start at 0, any runtime will likely push them negative.
