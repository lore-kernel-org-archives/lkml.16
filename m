Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9210D27F016
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750075299; cv=none; b=eSBzNMC8PpSXOCWx48MLPInolgJ02MZsxoonNQwIwH2Y2Os95Z8eMVMwT86CWeBuyxMPOp8iyFeQqfub7iI+eC4oeiZGRMZgTJcN7A1gVpMjq9VslzZDa8d/0pOaSXy/ZgH0IBgEIbkoWvtCPQDjF34IIb6Iq99IF1kL5HgO/B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750075299; c=relaxed/simple;
	bh=TmsFqMOHOiv+UJaO/10NqHKo/dK2Hx/1lVWoKx6mX1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rq1DW8MgbJDWuvjh3rNYkO4VieR5tjJCScC6qsYCiaUIT2f/7M1cK4drdSkHrMDsdbc5SeOGb/kgzOIhdHyZxJ7dlTIYqd9RsCCY0zqLU7gOrKiHVy51J/vGei1mSmLv8ZKRyKJSQMQU1VjkHipZ74ycCH8QZoxkPbVh5QCYZQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Dy/dYPEI; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Dy/dYPEI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jg2wefG8UuebG8p1mWNX8nDttqSmgyHNmlNNJsm7n4Q=; b=Dy/dYPEIMmTTrMQOeb18WKqPgO
	yBq8dSDTrpmz7XuBUGTljpkz3c1+FHWcpVpYC/aI2SW+Fz1hhWk8xE4Qu1IF+KZ+ZnACTVnNnuWd2
	7Txfr5+5pjz41dTw0dhC5Q7a/NohD+QKWk0hVbYt2AFJrITQgHB4ajFUWnX74gDV5uymSLuxOb/gg
	dxWQPul3wc/gLf7dcJ16sWYQ41RtboJnvXmCwKrP9yt6P/lqksygjCTxCuVdXnREExXa5p+/Bgs/B
	1FKIv23km4cBNoILJy9hYIBPLwqnnhvvEZVlUIkhzmoXD2p8zEK3zWrV6YlEQuYSUR/j/m1sAli3i
	7gIn9tgQ==;
Received: from 2001-1c00-8d82-d000-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d82:d000:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8Wl-00000003ZMW-1Exd;
	Mon, 16 Jun 2025 12:01:27 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2EDBA307FCB; Mon, 16 Jun 2025 14:01:25 +0200 (CEST)
Date: Mon, 16 Jun 2025 14:01:25 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, clm@meta.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH 5/5] sched: Add ttwu_queue support for delayed tasks
Message-ID: <20250616120125.GB1613200@noisy.programming.kicks-ass.net>
References: <20250520094538.086709102@infradead.org>
 <20250520101727.984171377@infradead.org>
 <CAKfTPtDOQVEMRWaK9xEVqSDKcvUfai4CUck6G=oOdaeRBhZQUw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtDOQVEMRWaK9xEVqSDKcvUfai4CUck6G=oOdaeRBhZQUw@mail.gmail.com>

On Fri, Jun 06, 2025 at 05:03:36PM +0200, Vincent Guittot wrote:
> On Tue, 20 May 2025 at 12:18, Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > One of the things lost with introduction of DELAY_DEQUEUE is the
> > ability of TTWU to move those tasks around on wakeup, since they're
> > on_rq, and as such, need to be woken in-place.
> 
> I was thinking that you would call select_task_rq() somewhere in the
> wake up path of delayed entity to get a chance to migrate it which was
> one reason for the perf regression (and which would have also been
> useful for EAS case) but IIUC, 

FWIW, the trivial form of all this is something like the below. The
problem is that performance sucks :/ For me it is worse than not doing
it. But perhaps it is the right thing for the more complicated cases ?

On my SPR:

schbench-6.9.0-1.txt:average rps: 2975450.75
schbench-6.9.0-2.txt:average rps: 2975464.38
schbench-6.9.0-3.txt:average rps: 2974881.02

(these patches)
schbench-6.15.0-dirty-1.txt:average rps: 3029984.58
schbench-6.15.0-dirty-2.txt:average rps: 3034723.10
schbench-6.15.0-dirty-3.txt:average rps: 3033893.33

TTWU_QUEUE_DELAYED
schbench-6.15.0-dirty-delayed-1.txt:average rps: 3048778.58
schbench-6.15.0-dirty-delayed-2.txt:average rps: 3049587.90
schbench-6.15.0-dirty-delayed-3.txt:average rps: 3045826.95

NO_DELAY_DEQUEUE
schbench-6.15.0-dirty-no_delay-1.txt:average rps: 3043629.03
schbench-6.15.0-dirty-no_delay-2.txt:average rps: 3046054.47
schbench-6.15.0-dirty-no_delay-3.txt:average rps: 3044736.37

TTWU_DEQUEUE
schbench-6.15.0-dirty-dequeue-1.txt:average rps: 3008790.80
schbench-6.15.0-dirty-dequeue-2.txt:average rps: 3017497.33
schbench-6.15.0-dirty-dequeue-3.txt:average rps: 3005858.57



Index: linux-2.6/kernel/sched/core.c
===================================================================
--- linux-2.6.orig/kernel/sched/core.c
+++ linux-2.6/kernel/sched/core.c
@@ -3770,8 +3770,13 @@ static int __ttwu_runnable(struct rq *rq
 		return 0;
 
 	update_rq_clock(rq);
-	if (p->se.sched_delayed)
+	if (p->se.sched_delayed) {
+		if (sched_feat(TTWU_DEQUEUE)) {
+			dequeue_task(rq, p, DEQUEUE_NOCLOCK | DEQUEUE_DELAYED | DEQUEUE_SLEEP);
+			return 0;
+		}
 		enqueue_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_DELAYED);
+	}
 	if (!task_on_cpu(rq, p)) {
 		/*
 		 * When on_rq && !on_cpu the task is preempted, see if
Index: linux-2.6/kernel/sched/features.h
===================================================================
--- linux-2.6.orig/kernel/sched/features.h
+++ linux-2.6/kernel/sched/features.h
@@ -84,6 +84,7 @@ SCHED_FEAT(TTWU_QUEUE, true)
 SCHED_FEAT(TTWU_QUEUE_ON_CPU, true)
 SCHED_FEAT(TTWU_QUEUE_DELAYED, false)
 SCHED_FEAT(TTWU_QUEUE_DEFAULT, false)
+SCHED_FEAT(TTWU_DEQUEUE, false)
 
 /*
  * When doing wakeups, attempt to limit superfluous scans of the LLC domain.
