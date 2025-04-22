Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BAEF50F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745312203; cv=none; b=jN8Hvm97Qe9QcNGNLpcllxreZ8RYm3Bc2xGk9OMjTouEw6G00hWGtzzjjaocoC/r1K9ZmaMeqpLoN/7NpadO4+otdQi7Ed3FCWgp+lKShOoDrjHoITyzsW/TtIr7Wmc+zxlaH7VqF9TezyE8LgUsNI3IPEArSLo1O5RlpKnIFWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745312203; c=relaxed/simple;
	bh=ZM2QHmCHxjpjTF8fgV9Zq/GT5c/lcTIpTXWzGN/JTQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBXr5PKR40G/ibaAB0bTz3tlkMuapTtB4dRdeZlRAYridYcWg3wfhXXwG4AzZb42yMWWcGnpeFWDvr6rYBhKFgcMrIYEc9r7kkMi2JonveKT2Z0v6mBIAOIavv4LlqGM/lRbI8JchktPEd58XgO+wgkAmLH4EUTf4KORYAUbMfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kmK7solx; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kmK7solx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=B4tX8bJgVVMOicTlu3lXeGMvc2dsrzX97ajUJmxABAI=; b=kmK7solx9Qwfz/zrsQguIyKUqU
	f1c8nJAeoKpiVB9T9cAR26DrlehKFcm5OxkG61LnKnfhNY50ge/CNBK7mQA28ym0lcB+PSaoHgjVO
	bFW5ws1FHGQc9zgbesq/WpHLQlFSg1sjyNrXMvdbo5rxk8yJRjKqlbEh2UDendbRdyXcIE80fpsB1
	rl5JIUwam5U9n7Xkj3a70xqYo86uPjALtiZy7U5uUMfmRT59wP+qXjqvfVLzk7Ql/b9N4oSjPLREF
	jTFXUlwvLL9yuRNVK8hLJbbuzUUFm4/rX5FnZR0NbGZnBZ+jYn5PJUXkP7lGvvOkAF7Y4YWI+X3kZ
	lqiYPTzw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79Qb-00000004G4h-0CFW;
	Tue, 22 Apr 2025 08:56:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 670BC3003C4; Tue, 22 Apr 2025 10:56:28 +0200 (CEST)
Date: Tue, 22 Apr 2025 10:56:28 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: John Stultz <jstultz@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>, kernel-team@android.com,
	Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [RFC][PATCH] sched/core: Tweak wait_task_inactive() to force
 dequeue sched_delayed tasks
Message-ID: <20250422085628.GA14170@noisy.programming.kicks-ass.net>
References: <20250422044355.390780-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422044355.390780-1-jstultz@google.com>

On Mon, Apr 21, 2025 at 09:43:45PM -0700, John Stultz wrote:
> It was reported that in 6.12, smpboot_create_threads() was
> taking much longer then in 6.6.
> 
> I narrowed down the call path to:
>  smpboot_create_threads()
>  -> kthread_create_on_cpu()
>     -> kthread_bind()
>        -> __kthread_bind_mask()
>           ->wait_task_inactive()
> 
> Where in wait_task_inactive() we were regularly hitting the
> queued case, which sets a 1 tick timeout, which when called
> multiple times in a row, accumulates quickly into a long
> delay.

Argh, this is all stupid :-(

The whole __kthread_bind_*() thing is a bit weird, but fundamentally it
tries to avoid a race vs current. Notably task_state::flags is only ever
modified by current, except here.

delayed_dequeue is fine, except wait_task_inactive() hasn't been
told about it (I hate that function, murder death kill etc.).

But more fundamentally, we've put so much crap into struct kthread and
kthread() itself by now, why not also pass down the whole per-cpu-ness
thing and simply do it there. Heck, Frederic already made it do affinity
crud.

On that, Frederic, *why* do you do that after started=1, that seems like
a weird place, should this not be done before complete() ?, like next to
sched_setscheduler_nocheck() or so?
