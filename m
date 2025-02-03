Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FAC202C36
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 11:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738581287; cv=none; b=ET+D+4haBqI+D2UNdxwcxAx/QKil95kh2/Th4HqKjODEuaNf7BgfCLBiE3QXTYRie07GjnRXYeTHYeWPMH5lKxLLt6ACGCvIVXg8Rn86Oj0WuRE/yE7fESXBHZkic25ROqnmN78twJG27LDvf6zVAyVtOv32uly4vyTdHgomCFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738581287; c=relaxed/simple;
	bh=40h9ZKG8xx/uZvjUWudY1pgnChpTSd6YAeMdklY7ktI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mH6AcJDQH1CMFcX2oOjXjvNp5i7UUCWKKWyl+4bTTJsvNtmb4fC88RxgGOVjFQS4rohv2NzdbUPkADVGeKLeTWFwLh9z1YDSv7c6YP3ZptVjiIE2nDgITGViVmKfbrwDB9NnvyJ2DigT4TEg/fwbXgrCeNINKTnMrTYSnTK2OXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RhtcAdlM; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RhtcAdlM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=l9ILaPwu7RiiOYjQxZbNAiKFXJzg+dyu7tMLD6/0Bcw=; b=RhtcAdlMOchuJu89/S65OJGR/n
	hg9UiKwC8Fe8G6emG7yZei79YFmA8GMyLWWGa2N/mIc2wIOHV6iUk8kXzi6MFeLuuOjQj0wTKJlLc
	OdV6m3WtuXBEG5C8WZ7d2gpCs2ZyMoLD8EOQ/LWtuOf7T7V6LjZlhYy2aUBq/DRlBlJNZkmPzRUsF
	w+y9yiJaWEOOatZrz+F0nbzGNyF/7YLfE1NAVoogt1E3bxsfalJgTRScLawmMzDnO4bHDl9FaDqIN
	Do5JhfjUpBbaWId8lnrbxz70QS0v8t6+bTuoDkGPCdRGiHNdxMBbtGmIxt57ZnW2v0enquK3oaGfj
	xiQgoJqw==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1teuPS-00000000waH-2MT3;
	Mon, 03 Feb 2025 11:14:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 81BC530035F; Mon,  3 Feb 2025 12:14:33 +0100 (CET)
Date: Mon, 3 Feb 2025 12:14:33 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Stephen Boyd <sboyd@kernel.org>, Yury Norov <yury.norov@gmail.com>,
	Bitao Hu <yaoma@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>, kernel-team@android.com
Subject: Re: [RFC][PATCH 0/3] DynamicHZ: Configuring the timer tick rate at
 boot time
Message-ID: <20250203111433.GF7145@noisy.programming.kicks-ass.net>
References: <20250128063301.3879317-1-jstultz@google.com>
 <87cyg67up9.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cyg67up9.ffs@tglx>

On Tue, Jan 28, 2025 at 05:46:10PM +0100, Thomas Gleixner wrote:

>   4) Scheduler
> 
>      I leave that part to Peter as he definitely has a better overview
>      of what needs to be done than me.

Ponies, scheduler wants ponies :-)

So scheduler tick does waaay too much:

 - time keeping / accounting:
   . internally
   . psi
   . cgroup.cpuacct
   . posix timers
   . a million other things

 - periodic update/aging of things like:
   . global load avg
   . hw pressure
   . freq scale

 - tied into perf
   (which I've briefly touched upon earlier)

 - drives load balance

 - drives mm scanning for NUMA crud

 - drives tick based preemption
  

The whole load-balance and global-load-avg are basically interal tick
based timers. Not sure replacing them with timer wheel timers makes
sense due to the buckets, but it might also not be the worst.

The whole preemption thing could probably be replaced with HRTICK (which
might be suffering from bitrot), but the problem has always been with
hrtimers being too expensive (on x86). But ideally we'd move away from
tick based preemption.

That said, driving preemption with dynamic HZ should work just fine.

Most of the time accounting is TSC (or sched_clock()) based, and derives
the measure of time from that. But things like perf use TICK_NSEC to
tell us how much time is between ticks -- so if you go and make that
dynamic you really do have to fix that.


Anyway, I would really like to understand what exactly is driving the
cost in your case. It should be possible to move things out of the tick,
or run them at a lower rate without running all of it lower.
