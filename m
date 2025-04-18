Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482E7213E71
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744991482; cv=none; b=BeAF3oyRKL4H612Uu/Uo19h2PHnR/jC51piuzcCuFbjqdilDk7VbF5ZFgfM6gL7Vnyr8E6xTQFxi0MqfX1y6iftpazRk2lrhjPA1+f4gvml41ieIkoyqWckXFwZ0VT21lUPg4m9MK/X4OI24+9gAbHqB18EnDUhj3AoZ/6B2UyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744991482; c=relaxed/simple;
	bh=EVzb8jB9TteCOIlCmiFjHJGeYZP+zYiJPSulg5XujJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AnexXhZMYdQigt+65+LHHREn0xc8fPdpEJIOhKxTBWs0z1B2apOeW2HGi/nCUdxvh5yjLCtfBwpvx3TE7mEwvND83FauunwlvMC+FEQtPuAyGpJJMmePmenlfHyKxLRNVCwbA+tVXTb9PrhfmGehx0BmFvyBfVW4a/KFdzuir0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XVF/ILbG; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XVF/ILbG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=B0phUcaqtNF5MHgtYap7bmkzuH8Odt4HteEl9tfUtL4=; b=XVF/ILbGaTlkKW3pTh2K5st/DI
	pTZ+sNiagKd90fl3SCPjZycldpery1+Fr4JCFdn9KVvCSl8FLlfEAKiHpPJqyp0IAFyDWubTHGbrF
	FFRuD2lFuhzgXDUyRB4UhTsDZ0Sc+WZMLpr3s6F+BK3I+WBtIh2bgNvlk1q+zJwb3vb3VM6JPwr76
	9I8JmnnrunIMRIP35mIXDVztVkSqymLaEFK7o9/9YCmB8Jw+RYzUfrAHPjjnB0qlIpPQG9drC6h0K
	0Qx01VeKQX01gUkRCbiYAN8Zia/Oho9IcLJWJvyPVcnM1JsX6iUNeLx1dRZWZ4Rd2i+Ecb/XEcZBO
	hER9qJbw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5nzn-0000000AXGv-34nC;
	Fri, 18 Apr 2025 15:51:15 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 533B1300619; Fri, 18 Apr 2025 17:51:15 +0200 (CEST)
Date: Fri, 18 Apr 2025 17:51:15 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/fair: Increase max lag clamping
Message-ID: <20250418155115.GI17910@noisy.programming.kicks-ass.net>
References: <20250418151225.3006867-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418151225.3006867-1-vincent.guittot@linaro.org>

On Fri, Apr 18, 2025 at 05:12:25PM +0200, Vincent Guittot wrote:
> sched_entity lag is currently limited to the maximum between the tick and
> twice the slice. This is too short compared to the maximum custom slice
> that can be set and accumulated by other tasks.
> Clamp the lag to the maximum slice that a task can set. A task A can
> accumulate up to its slice of negative lag while running to parity and
> the other runnable tasks can accumulate the same positive lag while
> waiting to run. This positive lag could be lost during dequeue when
> clamping it to twice task's slice if task A's slice is 100ms and others
> use a smaller value like the default 2.8ms.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  kernel/sched/fair.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index a0c4cd26ee07..1c2c70decb20 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -683,15 +683,17 @@ u64 avg_vruntime(struct cfs_rq *cfs_rq)
>   * is possible -- by addition/removal/reweight to the tree -- to move V around
>   * and end up with a larger lag than we started with.
>   *
> - * Limit this to either double the slice length with a minimum of TICK_NSEC
> - * since that is the timing granularity.
> - *
> - * EEVDF gives the following limit for a steady state system:
> + * Limit this to the max allowed custom slice length which is higher than the
> + * timing granularity (the tick) and EEVDF gives the following limit for
> + * a steady state system:
>   *
>   *   -r_max < lag < max(r_max, q)
>   *
>   * XXX could add max_slice to the augmented data to track this.
>   */

Right, its that max_slice XXX there.

I think I've actually done that patch at some point, but I'm not sure
where I've placed it :-)

Anyway, I did poke at that other issue you mentioned at OSPM, where
PREEMPT_SHORT wasn't working quite right.

I've pushed out the patches to queue/sched/exp -- I meant to go post all
that, except I keep getting side-tracked and 0-day people are having
trouble with the hrtick bits in there :-/
