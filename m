Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D213A23FC49
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577185; cv=none; b=bGQPtIYbcNETed+eR31q1lIcp3fFUhimvbqov9oXq0a42TGt+i2rdCPp2LoZ7nZwCG8zpAlYCnyJI2ABnMSSmcivqq9F7EH0ANbcQ/Au3/BcGz6yQGWEb0nTddgD/ip9gHP4vhf7oNb5HIUMBP2Ck4vDNMXpGUP+iEw7BgozaEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577185; c=relaxed/simple;
	bh=4ogyO65NDDOKYxPw0qWErSoWisBQjY4i5SvggrLAHpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPSK2S4VcPs1pWK5hEF05fX5pC8JK52yhDHwftGO6Fhu+EuKZDrMW/vyPb407qXGj8bJjzAez7AzVj9KgGVc2Du6P3iyNhSJiCBCI1swiV2miVZWQL+qOp2CB5fTWysNCLXE368a4CgghP6D0iQeB/ig2YX/vut0ftVD3odh1No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=O/rXbs37; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="O/rXbs37"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fGEU9PAuGp9COvPD7gL/ztib6WJJR0BXtqa9pKI45fI=; b=O/rXbs375jq+q0F6QSZtGA+JsU
	EAuRKMgPhnAzm2XjY3OPaCJtoD70cQ8z7Ilm4x1noBWMLkkL9z9T4qdIc47Uzm7EdllaUU7xrBSeH
	FnMnHFWhg06QsocPCD3/xQuPiG4oE2hgs8qEm3Q/msC24tc/u3TlYNdHzqRccdBOYWCSLKNcHss/K
	V18hU9vjrf9LdeP8Q73viI/COR8JlNhXI/5pnJBk2zXv+/CulIPogmTnEnrooc29LknSeBcr2m3Hh
	O40xxJOZJeP/V8ZAq8pRm06fv68PlU2wZqQyRMmw4QqmPjaNr1gNhhDbDxsRPRqTIisTjgi7MvPdn
	XCXs7Zaw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8GMU-0000000EJqJ-2CDS;
	Fri, 25 Apr 2025 10:32:50 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 14C4C3003C4; Fri, 25 Apr 2025 12:32:50 +0200 (CEST)
Date: Fri, 25 Apr 2025 12:32:49 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Omar Sandoval <osandov@osandov.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	Rik van Riel <riel@surriel.com>, Chris Mason <clm@meta.com>,
	kernel-team@fb.com, Pat Cody <pat@patcody.io>,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH] sched/eevdf: Fix se->slice being set to U64_MAX and
 resulting crash
Message-ID: <20250425103249.GO18306@noisy.programming.kicks-ass.net>
References: <f0c2d1072be229e1bdddc73c0703919a8b00c652.1745570998.git.osandov@fb.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0c2d1072be229e1bdddc73c0703919a8b00c652.1745570998.git.osandov@fb.com>

On Fri, Apr 25, 2025 at 01:51:24AM -0700, Omar Sandoval wrote:
> From: Omar Sandoval <osandov@fb.com>
> 
> There is a code path in dequeue_entities() that can set the slice of a
> sched_entity to U64_MAX, which sometimes results in a crash.
> 
> The offending case is when dequeue_entities() is called to dequeue a
> delayed group entity, and then the entity's parent's dequeue is delayed.
> In that case:
> 
> 1. In the if (entity_is_task(se)) else block at the beginning of
>    dequeue_entities(), slice is set to
>    cfs_rq_min_slice(group_cfs_rq(se)). If the entity was delayed, then
>    it has no queued tasks, so cfs_rq_min_slice() returns U64_MAX.

Whoopsy..

> 2. The first for_each_sched_entity() loop dequeues the entity.
> 3. If the entity was its parent's only child, then the next iteration
>    tries to dequeue the parent.
> 4. If the parent's dequeue needs to be delayed, then it breaks from the
>    first for_each_sched_entity() loop _without updating slice_.
> 5. The second for_each_sched_entity() loop sets the parent's ->slice to
>    the saved slice, which is still U64_MAX.
> 
> This throws off subsequent calculations with potentially catastrophic
> results. A manifestation we saw in production was:
> 
> 6. In update_entity_lag(), se->slice is used to calculate limit, which
>    ends up as a huge negative number.
> 7. limit is used in se->vlag = clamp(vlag, -limit, limit). Because limit
>    is negative, vlag > limit, so se->vlag is set to the same huge
>    negative number.
> 8. In place_entity(), se->vlag is scaled, which overflows and results in
>    another huge (positive or negative) number.
> 9. The adjusted lag is subtracted from se->vruntime, which increases or
>    decreases se->vruntime by a huge number.
> 10. pick_eevdf() calls entity_eligible()/vruntime_eligible(), which
>     incorrectly returns false because the vruntime is so far from the
>     other vruntimes on the queue, causing the
>     (vruntime - cfs_rq->min_vruntime) * load calulation to overflow.
> 11. Nothing appears to be eligible, so pick_eevdf() returns NULL.
> 12. pick_next_entity() tries to dereference the return value of
>     pick_eevdf() and crashes.

Impressive fail chain that.

> Dumping the cfs_rq states from the core dumps with drgn showed tell-tale
> huge vruntime ranges and bogus vlag values, and I also traced se->slice
> being set to U64_MAX on live systems (which was usually "benign" since
> the rest of the runqueue needed to be in a particular state to crash).
> 
> Fix it in dequeue_entities() by always setting slice from the first
> non-empty cfs_rq.
> 
> Fixes: aef6987d8954 ("sched/eevdf: Propagate min_slice up the cgroup hierarchy")
> Signed-off-by: Omar Sandoval <osandov@fb.com>

Thanks!
