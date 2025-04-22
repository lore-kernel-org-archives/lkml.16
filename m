Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652251E0DEB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317179; cv=none; b=GpRaiUbvCNtN9eWK4RftWy636cn8uiWIodzyojIcyQQ3Ffm/iWMZmpQ4wd5D1d4oGUpVdkOoGaApZBMV2J0Yu+5RTakY7f0QahSNCsUN3CJ6UCtJY+B+ThghgIySB6JBFWPHWVOro0O+tpR0D1h1Y/Ogsh8adw1P7XKps7LOYV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317179; c=relaxed/simple;
	bh=q186CXpJpZK5KCcEIenwV8pvsmgwT9Uqtsnxb5OhuSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MX1+ihO16Ltmj7qJdHjPb3j0Gk3uEl3L4KJDelc58H1RA/xA2yrRsVVB5Hc/cEdHZmwCJl72NyE6+Owj41lRyoYeD3dBTzviv9eRt3k7bQ2jY8ff8VcoOjK9qR5ppazbOdYiYIwjG9ikaJ3kP1o6/Kk9OqOodV0BcBZ1m/nXobc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XH1Laups; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XH1Laups"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ijPf3w1S5wyMcW9ooODsE9PZ4X2jRX4aZ41tS2xylkw=; b=XH1Laupso4BZG2r5qyvQPkjau3
	Of5Y4iafM+goBWMiNSb07g+k888TI5qUDYhbZgSTsgRVWeTfSN8aM3+kDR++I64CWqi/uOkxJQTb8
	ttSSak6cSh2LN1dBwQy+XgVQH6GyYqGdDesBdR4b3Nop1FlMjqI71ngP1iepWga8p/Nc9kkumaidW
	OUGxzy3igbtBom4WoH+eZ8oQwNVnSIEu3sN3Q5Z2D0QDe4x3aABI3MdvvDlaP/rwHrjLb4U/3mrG9
	2T7tBBQL392fuBxySSJgzFzMBIi4zAC4UB3LwIi4Uj7xWd5FGDIIk44w12auBA9fUwh+oLLScOOFU
	kDIkhZjQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Aix-00000004NIx-0V5N;
	Tue, 22 Apr 2025 10:19:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B2E573003C4; Tue, 22 Apr 2025 12:19:30 +0200 (CEST)
Date: Tue, 22 Apr 2025 12:19:30 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>, kernel-team@android.com,
	Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [RFC][PATCH] sched/core: Tweak wait_task_inactive() to force
 dequeue sched_delayed tasks
Message-ID: <20250422101930.GD14170@noisy.programming.kicks-ass.net>
References: <20250422044355.390780-1-jstultz@google.com>
 <20250422085628.GA14170@noisy.programming.kicks-ass.net>
 <aAdnk0PH6H5q7nGz@pavilion.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aAdnk0PH6H5q7nGz@pavilion.home>

On Tue, Apr 22, 2025 at 11:55:31AM +0200, Frederic Weisbecker wrote:
> Le Tue, Apr 22, 2025 at 10:56:28AM +0200, Peter Zijlstra a écrit :
> > On Mon, Apr 21, 2025 at 09:43:45PM -0700, John Stultz wrote:
> > > It was reported that in 6.12, smpboot_create_threads() was
> > > taking much longer then in 6.6.
> > > 
> > > I narrowed down the call path to:
> > >  smpboot_create_threads()
> > >  -> kthread_create_on_cpu()
> > >     -> kthread_bind()
> > >        -> __kthread_bind_mask()
> > >           ->wait_task_inactive()
> > > 
> > > Where in wait_task_inactive() we were regularly hitting the
> > > queued case, which sets a 1 tick timeout, which when called
> > > multiple times in a row, accumulates quickly into a long
> > > delay.
> > 
> > Argh, this is all stupid :-(
> > 
> > The whole __kthread_bind_*() thing is a bit weird, but fundamentally it
> > tries to avoid a race vs current. Notably task_state::flags is only ever
> > modified by current, except here.
> > 
> > delayed_dequeue is fine, except wait_task_inactive() hasn't been
> > told about it (I hate that function, murder death kill etc.).
> > 
> > But more fundamentally, we've put so much crap into struct kthread and
> > kthread() itself by now, why not also pass down the whole per-cpu-ness
> > thing and simply do it there. Heck, Frederic already made it do affinity
> > crud.
> > 
> > On that, Frederic, *why* do you do that after started=1, that seems like
> > a weird place, should this not be done before complete() ?, like next to
> > sched_setscheduler_nocheck() or so?
> 
> You mean the call to kthread_affine_node() ? Because it is a default behaviour
> that only happens if no call to kthread_bind() or kthread_affine_preferred()
> has been issued before the first wake up to the kthread.
> 
> If kthread_affine_node() was called before everything by default instead
> then we would get its unconditional overhead for all started kthreads. Plus
> kthread_bind() and kthread_affine_preferred() would need to undo
> kthread_affine_node().

Urgh, I see. Perhaps we should put a comment on, because I'm sure I'll
have this same question again next time (probably in another few years)
when I look at this code.
