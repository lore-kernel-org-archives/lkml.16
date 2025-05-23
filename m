Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164B42957A2
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 14:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748012397; cv=none; b=dO5Vl9zwBVn3xix6189rDgZ1EvFKidpbOGcGHdnjoPebvMLR0OqJgDWCNzmchqZ/PJAbnBAIDnvELmaTtvFm7YXhoZCyxJhGdOjEYGxBRWTj5hbKmZaMNWDyonVgl4jgAQjuu/7mQf3dwVBBxf5yJk1/fwAuGbQXzeuFUctvnLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748012397; c=relaxed/simple;
	bh=+8Ajg9EfXpyP5RPVroAvxCL4iKT5Fy5qbsWRaTk1/3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ffpzhF0m+O0UkZ6H8Mmwtto/UhU6fmRSmSYlKz4rrahBf+6w0XJRiBi46Kvjotg1QoXmeKuNIxes+5yw4dMKkmS30SddY/wwSaIiZNI1txW0sVGDgG7O7KIS59qlrop27ndcELXNgRRf2Y0buB7vEjmCHEjzXEZwuJ9TUgAeN28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Ij7FFySu; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ij7FFySu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8SJ9MmECmt2OQ6NAfufRcgcN3xsh1YD+k0QVipqDdIw=; b=Ij7FFySu4LCIfjOR9s+gtsB7S2
	r2njHxqwa/zrpLh10tqcAowXq8PoQn6UpJGoVdp72rSOdVebeGeTiH4vJ+ak6Hog850ljQxFNxB0Z
	s38bb2zye2fffYk6P8+pzQdqIzZmwlH0rbPgv1spnrgZCfxxnxFCZ/hVCf/MMMpWmSmVy1TXIC4xW
	uTqqv60DRRVrix1ZoyABR5FrKQ+8yI7s8JHmgrh4uNWiVFRn12iPNPN/kzJwcgPeA3DGRovXS6wge
	T2JwRmc2UZqaJq6GHNKeHK5BYvbKmB63RuFmorLFspWPTyluIzptqokTaOMwoQRCiJvgCHzx0ehww
	mjTJzeYQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITs7-00000007haw-3psy;
	Fri, 23 May 2025 14:59:44 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1086E300472; Fri, 23 May 2025 16:59:43 +0200 (CEST)
Date: Fri, 23 May 2025 16:59:42 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Aaron Lu <ziqianlu@bytedance.com>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: Re: [PATCH 4/7] sched/fair: Take care of group/affinity/sched_class
 change for throttled task
Message-ID: <20250523145942.GL39944@noisy.programming.kicks-ass.net>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-5-ziqianlu@bytedance.com>
 <20250522120336.GI39944@noisy.programming.kicks-ass.net>
 <20250522124840.GC672414@bytedance>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522124840.GC672414@bytedance>

On Thu, May 22, 2025 at 08:49:43PM +0800, Aaron Lu wrote:
> On Thu, May 22, 2025 at 02:03:36PM +0200, Peter Zijlstra wrote:

> > This is asymmetric -- dequeue removes it from that throttle list, but
> > the corresponding enqueue will not add it back, what gives?
> > 
> > Because now we have:
> > 
> >  p->on_rq=1
> >  p->throttle_node on list
> > 
> > move_queued_task()
> >   deactivate_task()
> >     dequeue_task_fair()
> >       list_del_init(throttle_node)
> >     p->on_rq = 2
> > 
> >   activate_task()
> >     enqueue_task_fair()
> >       // nothing special, makes the thing runnable
> >     p->on_rq = 1;
> > 
> > and we exit with a task that is on-rq and not throttled ?!?
> >
> > Why is this? Are we relying on pick_task_fair() to dequeue it again and
> > fix up our inconsistencies? If so, that had better have a comment on.
> 
> Correct.

But would it not be better to have enqueue bail when we're trying to
enqueue an already throttled task into a throttled cfs_rq?

It seems a waste to do the actual enqueue, pick, dequeue when we
could've just avoided all that.

The immediate problem seems to be that you destroy the
task_is_throttled() state on dequeue, but surely that is trivially
fixable by not keeping that state in the list.
