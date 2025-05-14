Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3A9136E37
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 03:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747193612; cv=none; b=s550AOCpxD04UpRT4yKw0jkc2KK2VAtEoKLBKMWS2vTnu6mmkNkVnbioFsbOssfJaaZnAwRW3Osj0zwbM95BSNL5Qyf7pIjLJVTfn32Txt8F6nQwaZ2+KpH7jFIkEecN6LK/3q719IuEikIfmk9hxUohJq/ReqzwQUVoQjHSHgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747193612; c=relaxed/simple;
	bh=yf3AlhbO0bLsFA7v+JY9LWazseKqgwyTs6HK4DqhkqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwVzMm554ncSGPq2GYEwiCWFMPoeTVv8G7ZJpjXBwpqQO1Ny6cCeAwFAI1AQ5XkTDsoZ1cPKCGKnkR0tkPO0XTZ5kC1AhAGI2UsMyJwAus2R3j5bwgOBxEGWW23DLU6LicmUFmCAyzRM+G6oNUzV0syZBx2nDQV8kJu7kYW34sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=vznztiWX; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="vznztiWX"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747193606; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=23CdifqxnEjfICbuiz+YXYs+PAk17b4TqCbspuxL8m4=;
	b=vznztiWXi7XXwBug6jKgXpWGqAulBN043fekyTMW4KGpXJtXI+PZqk1n3wRacBXPlmfiAyLkp5i2rV33uSTVJyNJyCUZAb7YSvnfwl1GZp5OfOTgC3RyWtnJ+hHhko6ze05j3h0nf0l2yoighfI2YVql/7upWGCh6QHjb0Xe5nA=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WajwE-G_1747193604 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 14 May 2025 11:33:25 +0800
Date: Wed, 14 May 2025 11:33:23 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Lance Yang <lance.yang@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	mhiramat@kernel.org, llong@redhat.com,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Michal Hocko <mhocko@suse.com>, Tejun Heo <tj@kernel.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v1 0/3] generalize panic_print's dump function to be used
 by other kernel parts
Message-ID: <aCQPA7-5uSSlPAV-@U-2FWC9VHC-2323.local>
References: <20250511085254.61446-1-feng.tang@linux.alibaba.com>
 <20250511184617.85d5fe22fde831c1edb8321c@linux-foundation.org>
 <aCFnjmRWwBjgV2Hv@U-2FWC9VHC-2323.local>
 <1a5bc420-c716-4d0b-b767-32adf32f4958@linux.dev>
 <aCNIxWaPVHywfek2@pathway.suse.cz>
 <c33acfb8-0078-46e2-b3a3-f753909749c9@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c33acfb8-0078-46e2-b3a3-f753909749c9@paulmck-laptop>

On Tue, May 13, 2025 at 10:09:51AM -0700, Paul E. McKenney wrote:
> On Tue, May 13, 2025 at 03:27:33PM +0200, Petr Mladek wrote:
> > On Mon 2025-05-12 16:23:30, Lance Yang wrote:
> > > 
> > > 
> > > On 2025/5/12 11:14, Feng Tang wrote:
> > > > Hi Andrew,
> > > > 
> > > > Thanks for the review!
> > > > 
> > > > On Sun, May 11, 2025 at 06:46:17PM -0700, Andrew Morton wrote:
> > > > > On Sun, 11 May 2025 16:52:51 +0800 Feng Tang <feng.tang@linux.alibaba.com> wrote:
> > > > > 
> > > > > > When working on kernel stability issues, panic, task-hung and
> > > > > > software/hardware lockup are frequently met. And to debug them, user
> > > > > > may need lots of system information at that time, like task call stacks,
> > > > > > lock info, memory info etc.
> > > > > > 
> > > > > > panic case already has panic_print_sys_info() for this purpose, and has
> > > > > > a 'panic_print' bitmask to control what kinds of information is needed,
> > > > > > which is also helpful to debug other task-hung and lockup cases.
> > > > > > 
> > > > > > So this patchset extract the function out, and make it usable for other
> > > > > > cases which also need system info for debugging.
> > > > > > 
> > > > > > Locally these have been used in our bug chasing for stablility issues
> > > > > > and was helpful.
> > > > > 
> > > > > Truth.  Our responses to panics, oopses, WARNs, BUGs, OOMs etc seem
> > > > > quite poorly organized.  Some effort to clean up (and document!) all of
> > > > > this sounds good.
> > > > > 
> > > > > My vote is to permit the display of every scrap of information we can
> > > > > think of in all situations.  And then to permit users to select which of
> > > > > that information is to be displayed under each situation.
> > > 
> > > Completely agreed. The tricky part is making a global knob that works for
> > > all situations without breaking userspace, but it's a better system-wide
> > > approach ;)
> > > 
> > > > 
> > > > Good point! Maybe one future todo is to add a gloabl system info dump
> > > > function with ONE global knob for selecting different kinds of information,
> > > > which could be embedded into some cases you mentioned above.
> > > 
> > > IMHO, for features with their own knobs, we need:
> > > a) The global knob (if enabled) turns on all related feature-level knobs,
> > > b) while still allowing users to manually override individual knobs.
> > > 
> > > Something like:
> > > 
> > > If SYS_PRINT_ALL_CPU_BT (global knob) is on, it enables
> > > hung_task_all_cpu_backtrace
> > > for hung-task situation automatically. But users can still disable it via
> > > hung_task_all_cpu_backtrace.
> > 
> > I am all for unifying the options for printing debug information
> > in various emergency situations. I am just not sure whether we really
> > want to do the same in all situations.
> > 
> > Some lockup detectors tries to be more clever, for example:
> > 
> >   + RCU stall detector prints backtraces only from CPUs which are
> >     involved in the stall, see print_other_cpu_stall().
> > 
> >   + Workqueues watchdog shows backtraces from tasks which are
> >     preventing forward progress, see show_cpu_pool_hog().
> > 
> > And stalls are about scheduling (disabled preemption, disabled IRQ,
> > deadlocks, too long uninterruptible sleep). OOM is about memory
> > usage. Oops is about an invalid memory access. WARNs() are
> > completely random stuff.
> > 
> > Also I am afraid of printing too much information when the system
> > is supposed to continue running. It would make sense to print it in
> > nbcon_cpu_emergency_enter()/exit() context which disables
> > preemption. And it might cause softlockups on its own.
> 
> And we did do some of the cleverness that Petr points out because of
> problems caused by flooding the console log.  We first ran into this
> sort of thing on embedded systems with slow serial consoles (where 115K
> baud is now way slow), but it also shows up in other environments, for
> example, those committing large numbers of console logs to stable storage,
> multiplexing large numbers of logs across networks that sometimes get
> congested, and so on.
> 
> So I second the call for individual knobs, either in addition to or
> instead of the global knob.

Thanks for the detail elaboration! RCU stall case is also a main target
in the stability issues I have worked on, besides panic/taskhung/lockup.
I noticed it has its own mature handling, and dare not to touch it in
this patchset :)

Thanks,
Feng

> 
> > Finally, I wonder whether ftrace_dump() might cause a livelock when ftrace
> > is adding new messages in parallel.
> 
> It definitely can cause problems, and me learning this the hard way is
> why rcutorture calls tracing_off() before calling ftrace_dump().
> 
> > The situation is much easier during panic() because the system is
> > going to die() anyway, non-panic CPUs are stopped, ...
> > 
> > That said, I could understand that people might want to see as much
> > information as possible when the console is fast and the range of
> > possible problems is big.
> 
> No argument here.
> 
> 							Thanx, Paul
> 
> > Anyway, I have added few more people into Cc who are interested into
> > the various watchdogs.
> > 
> > And there is parallel initiative which tries to unify the loglevel or
> > somehow make the filtering easier, see
> > https://lore.kernel.org/r/20250424070436.2380215-1-senozhatsky@chromium.org
> > 
> > Best Regards,
> > Petr
