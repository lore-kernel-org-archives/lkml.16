Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D975D1A2645
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 11:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738926729; cv=none; b=hyNqtD6A4a8feSgnPoBQZvlP+MLdCoKw6OF1kC4ChVz4QZQyr2dggpfRWPdxE88HB2kT77K7GG5c0T91eND7yJBoR6/tzBftyqpdm/DKHqHi7kqIVCIbR8+wfaRmadALX/smBhkWi0hh91Sz2KlU+y0SprCh0y7rR30vOidQTWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738926729; c=relaxed/simple;
	bh=BsZc/c6EJDHu5URf6udcKgY7eCPA3572i3mzFbsOE+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdtI70KS9O0WirS8XoAMFLFqyMyhXQIiIIrIdEZAcMVkZ/fxMANdPoO7NCZsFkzRDoWDimoi3niB1y74lZOxHvuLpQpXKRuozyewwS4Y1lcaxlH1QJS1A3W5xwG2d4MePaDPcuCiY0imMuETK0CodRdEH2CfTPnkd+bU6WTiTb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=C8zlZG0E; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="C8zlZG0E"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ehAl1wIEoz862E45WAoCM/mt+oEm7djSIifiRZ0ugYY=; b=C8zlZG0ESG7PYBrDYMb/gfVv7M
	ocridJQfAc9VIeh7xzf+yKP3OWvdP140UgPlj+dZc+C+QC18npYxPyCS3eE1xhqbkKOXW87YEz7hA
	EmaZXSb0kGc+9lv86sWkUs+GMduzlti+OCYWKq/sgvTSNQvdWl9ZJmnT9I/S1TFpmdw/zuMFfDMZY
	ZJogBsq3OhMnDCNgv4nYAT/QGec1Mx50tLF1KZkt3sZ698OT+RlDG4tk+eyU8sH5HqvZe6V34aswp
	hnH6GNaLZsMoADoOWWkEIK9vZGM+GDjvH/3NPR4FSS88gSJH57V93XDrtbrqAfBsy69ZYXLAwBblo
	REK0UrIQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tgMGr-0000000HA9x-2m0v;
	Fri, 07 Feb 2025 11:11:42 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 36B69300310; Fri,  7 Feb 2025 12:11:41 +0100 (CET)
Date: Fri, 7 Feb 2025 12:11:41 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Breno Leitao <leitao@debian.org>
Cc: mingo@kernel.org, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, corbet@lwn.net,
	qyousef@layalina.io, chris.hyser@oracle.com,
	patrick.bellasi@matbug.net, pjt@google.com, pavel@ucw.cz,
	qperret@google.com, tim.c.chen@linux.intel.com, joshdon@google.com,
	timj@gnu.org, kprateek.nayak@amd.com, yu.c.chen@intel.com,
	youssefesmat@chromium.org, joel@joelfernandes.org, efault@gmx.de,
	tglx@linutronix.de
Subject: Re: [PATCH 03/15] sched/fair: Add lag based placement
Message-ID: <20250207111141.GD7145@noisy.programming.kicks-ass.net>
References: <20230531115839.089944915@infradead.org>
 <20230531124603.794929315@infradead.org>
 <20250207-petite-eminent-husky-7d1704@leitao>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207-petite-eminent-husky-7d1704@leitao>

On Fri, Feb 07, 2025 at 02:07:18AM -0800, Breno Leitao wrote:
> Hello Peter,
> 
> On Wed, May 31, 2023 at 01:58:42PM +0200, Peter Zijlstra wrote:
> >
> >  place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int initial)
> >  {
> <snip>
> > -		vruntime -= thresh;
> > +		lag *= load + se->load.weight;
> > +		if (WARN_ON_ONCE(!load))
> 
> I have 6.13 running on some hosts, and in some cases, where the system
> is getting some OOMs, I see the following stack:
> 
>           WARNING: CPU: 29 PID: 593474 at kernel/sched/fair.c:5250 place_entity+0x199/0x1b0
> 
>            Call Trace:
>             <TASK>
>             ? place_entity+0x199/0x1b0
>             reweight_entity+0x188/0x200
>             enqueue_task_fair.llvm.15448040313737105663+0x28c/0x560
>             enqueue_task+0x30/0x120
>             ttwu_do_activate+0x99/0x230
>             try_to_wake_up+0x25a/0x4a0
>             ? hrtimer_dummy_timeout+0x10/0x10
>             hrtimer_wakeup+0x25/0x30
>             __hrtimer_run_queues+0xf1/0x250
>             hrtimer_interrupt+0xfb/0x220
>             __sysvec_apic_timer_interrupt+0x47/0x140
>             sysvec_apic_timer_interrupt+0x35/0x80
>             asm_sysvec_apic_timer_interrupt+0x16/0x20
> 
> I am sorry for not decoding the stack, but I am having a hard time
> decoding the stack properly. The values I got was misleading, and I am
> working to understand what is happening.
> 
> Anyway, I don't have a reproducer and this problem doesn't happen
> frequent enough. I have 1K hosts with 6.13 and I saw it 5 times in the
> last week.

Weird. Would you mind trying with the below patch on top?

---
Subject: sched/fair: Adhere to place_entity() constraints
From: Peter Zijlstra <peterz@infradead.org>
Date: Tue, 28 Jan 2025 15:39:49 +0100

Mike reports that commit 6d71a9c61604 ("sched/fair: Fix EEVDF entity
placement bug causing scheduling lag") relies on commit 4423af84b297
("sched/fair: optimize the PLACE_LAG when se->vlag is zero") to not
trip a WARN in place_entity().

What happens is that the lag of the very last entity is 0 per
definition -- the average of one element matches the value of that
element. Therefore place_entity() will match the condition skipping
the lag adjustment:

  if (sched_feat(PLACE_LAG) && cfs_rq->nr_queued && se->vlag) {

Without the 'se->vlag' condition -- it will attempt to adjust the zero
lag even though we're inserting into an empty tree.

Notably, we should have failed the 'cfs_rq->nr_queued' condition, but
don't because they didn't get updated.

Additionally, move update_load_add() after placement() as is
consistent with other place_entity() users -- this change is
non-functional, place_entity() does not use cfs_rq->load.

Fixes: 6d71a9c61604 ("sched/fair: Fix EEVDF entity placement bug causing scheduling lag")
Reported-by: Mike Galbraith <efault@gmx.de>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: stable@vger.kernel.org
Link: https://lkml.kernel.org/r/20250128143949.GD7145@noisy.programming.kicks-ass.net
---
 kernel/sched/fair.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -3781,6 +3781,7 @@ static void reweight_entity(struct cfs_r
 		update_entity_lag(cfs_rq, se);
 		se->deadline -= se->vruntime;
 		se->rel_deadline = 1;
+		cfs_rq->nr_queued--;
 		if (!curr)
 			__dequeue_entity(cfs_rq, se);
 		update_load_sub(&cfs_rq->load, se->load.weight);
@@ -3807,10 +3808,11 @@ static void reweight_entity(struct cfs_r
 
 	enqueue_load_avg(cfs_rq, se);
 	if (se->on_rq) {
-		update_load_add(&cfs_rq->load, se->load.weight);
 		place_entity(cfs_rq, se, 0);
+		update_load_add(&cfs_rq->load, se->load.weight);
 		if (!curr)
 			__enqueue_entity(cfs_rq, se);
+		cfs_rq->nr_queued++;
 
 		/*
 		 * The entity's vruntime has been adjusted, so let's check
