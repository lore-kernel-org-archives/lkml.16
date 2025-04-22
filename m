Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50B82820C3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328997; cv=none; b=KN/xCjrCD5hzodkLz+SoOxoxoQu00fTlwD7oONJ/t6A61ZjGhtWoy6nuMykinmTV2Uad+5tNrKCyDW0mSei0EQl+4z35yL4R3RhF7CGGPy42joq5IND8llsu947vsn81XxF2Cc32YldBOQGWpfP2vmkfSxYKQTBxREbxh/yxY60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328997; c=relaxed/simple;
	bh=ijLy3AELgtacPOkVg6earhiVaOSKh9jlBBTvgOc8v6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BtwxAaEPprfTgRCIVshqeU4VDVjkdAuVDtgpkLa8pXhQo4AfDqL2HHciw3JQoFbgsdfYFlLfHr59OUK1gR0yuvMoh3NkjtHr5SQ561JXrN2zaJB/VgNzX++SzRpBVthrcn7KSNWR31n56VD+vLTMJIZUCfXW0RgOReOPfXI2OCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TLd+3a/V; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TLd+3a/V"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bJ9rkrxeYXyWHXUwOB3Qxt8cf5MRqQoWirYpdRdgjRM=; b=TLd+3a/V7kpvLUjKxkVw8+/41C
	urgByt9WndSmyNmjGfhqxSpjQt1JCAJRHbOqXgIgv9ct4yOD4S3f9AzmuHT9OX6qjPoHGC5/hKlc7
	us8FBpa7/3/QJ431DKE9mHh2nvy/j36GJXYmlKX7JU8adDF0admtoU8iICjBJyKpEE7Fk5TbxkZkJ
	9OLGJr9+cFsCME3ROSBoaPFKdnSkBdel+LHrfD19ofdGCXlmBu9E1DPeTNTD4oTFabC7VV1gEACic
	o2NKtmaYIdUYx2TfBkmbsabnJXCBQKjqYlfN81b5BWl535t6qgbcdYpCKbiPRbPVz1I5BccJoblOi
	4t4YepFw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7DnR-0000000BEgE-0NeM;
	Tue, 22 Apr 2025 13:36:21 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4AC143003C4; Tue, 22 Apr 2025 15:36:20 +0200 (CEST)
Date: Tue, 22 Apr 2025 15:36:20 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Omar Sandoval <osandov@osandov.com>
Cc: Rik van Riel <riel@surriel.com>, Chris Mason <clm@meta.com>,
	Pat Cody <pat@patcody.io>, mingo@redhat.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, linux-kernel@vger.kernel.org, patcody@meta.com,
	kernel-team@meta.com, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH] sched/fair: Add null pointer check to pick_next_entity()
Message-ID: <20250422133620.GF14170@noisy.programming.kicks-ass.net>
References: <20250320205310.779888-1-pat@patcody.io>
 <20250324115613.GD14944@noisy.programming.kicks-ass.net>
 <7B2CFC16-1ADE-4565-B555-7525A50494C2@surriel.com>
 <20250402082221.GT5880@noisy.programming.kicks-ass.net>
 <b378f48593ca7449257a1bb55e78b186d88cd9f1.camel@surriel.com>
 <20250415080235.GK5600@noisy.programming.kicks-ass.net>
 <20250416124442.GC6580@noisy.programming.kicks-ass.net>
 <abffc286b637060f631925f9b373fad114d667d6.camel@surriel.com>
 <20250418154438.GH17910@noisy.programming.kicks-ass.net>
 <aALk9DVfjTTHGdvA@telecaster>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aALk9DVfjTTHGdvA@telecaster>

On Fri, Apr 18, 2025 at 04:49:08PM -0700, Omar Sandoval wrote:
> On Fri, Apr 18, 2025 at 05:44:38PM +0200, Peter Zijlstra wrote:

> > @@ -850,6 +811,7 @@ RB_DECLARE_CALLBACKS(static, min_vruntim
> >  static void __enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
> >  {
> >  	avg_vruntime_add(cfs_rq, se);
> > +	update_zero_vruntime(cfs_rq);
> 
> Won't this double-count cfs_rq->curr in the avg_vruntime() calculation
> in update_zero_vruntime()? When cfs_rq->curr->on_rq, put_prev_entity()
> calls this with se == cfs_rq->curr _before_ setting cfs_rq->curr to
> NULL.

Yep, right you are. I note that set_next_entity() sets cfs_rq->curr
late, and does not have this issue. I'll look at making
put_prev_entity() clear cfs_rq->curr early.

(obviously I'll have to check all that it does after is not using curr)

> So the avg_vruntime_add() call will add entity_key(cfs_rq->curr)
> to cfs_rq->avg_vruntime and se_weight(cfs_rq->curr) to cfs_rq->avg_load.
> Then update_zero_vruntime() calls avg_vruntime(), which still sees
> curr->on_rq and will add curr's key and weight again. This throws
> zero_vruntime off, maybe by enough to bust zero_vruntime and/or
> avg_vruntime?
> 
> Should the call to update_zero_vruntime() go before avg_vruntime_add()?

The thing is that adding/removing from the tree makes avg_vruntime jump
around a bit, and I wanted to adjust for that jump (in the lazy way).

So it needs to be after enqueue/dequeue.



Meanwhile, I've done a custom module that does:

	preempt_disable();
	/* 'spin' for a minute */
	for (int i = 0; i < 60*1000; i++)
		__ndelay(1000000);
	preempt_enable();

just to emulate some ridiculous PREEMPT_NONE kernel section, and while
it trips RCU and Soft Lockup watchdogs, it does not seem to trip any of
the __builtin_overflow bits, even when ran at nice 19.

(this was with the zero_vruntime thing on, I've yet to try with the
upstream min_vruntime thing)

So unless you've disabled those watchdogs (or pushed their limits up),
I'm fairly confident that there's no overflow to be had, even with that
curr issue.

