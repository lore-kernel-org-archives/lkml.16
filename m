Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0360327194
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615969; cv=none; b=ukHjantsJMo9Y2F3l4/uAZz45V6ahnfpNHjfhTJ9owaxiL1xMfNDcESGl/5jASTI2a9jj6rY6KRSVT83lyT8h0uGJo9E38NDmMTyFmj/yb6xTofR8K9F/67LVCxsBra0i7TIRFOA4v+w7RlAWUiVIMflkNSYaY5x3+MYF/Tz9mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615969; c=relaxed/simple;
	bh=3YUFGBKz3nnt1I4W9YIC+Q4E0f+f0UuxuGXfbcSs3f4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=krLyq95xAbkynQUZfmimv41gf6Uev6MIscVcfMUU9Ym8fTrpISl34Uy8IyFgkFeO4dbfLiR5FrGNgwsofi7koAab1chadDenIhFpsKMPBd6hvi4Ais0kNYIKUYzggUvgMTtiSq0IAWYQT53yY78xV8wbaC4AY59mpAaxhkXCCcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=b1JioV2B; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="b1JioV2B"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AdzRiQjvYzMSGoHza7Sl9rDFTuZauWmMS94NHkdAXnM=; b=b1JioV2BSWu3eazMvXx1W08EPf
	2TUzg+cp4QXYe3lb20AY4wu6jP1IcmgFbrpDhp5+bx4xJ0fDSAi0EYeohAS/9V1Jl04CT+YLLXfEq
	pqp96oLqkGkGpMvqrti78YYWZjseDfP5UfE5Q7oFFXJW8WMziyXtQntLAouPJ3K2xDqskS/aiPDCL
	U+G1DQddslpErIEdYbIE5uPHGyXtWCDnTlvwIy2dUtWNbZpHUNzIXtbL8yN41Roj7QG6GmxrgmulA
	XCCnGHOOporWXTrZ36lHcFH6IM7+q4MnEXwqaZzFjE5NGM5hRbI0K89RnCb9CxV8Le9+L3VOmF4r8
	mZYy1now==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbKG-0000000G6tT-4Bki;
	Fri, 04 Jul 2025 07:59:17 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 139C3300220; Fri, 04 Jul 2025 09:59:16 +0200 (CEST)
Date: Fri, 4 Jul 2025 09:59:15 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Phil Auld <pauld@redhat.com>, mingo@redhat.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, clm@meta.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/12] sched: Add ttwu_queue support for delayed tasks
Message-ID: <20250704075915.GB2001818@noisy.programming.kicks-ass.net>
References: <20250702114924.091581796@infradead.org>
 <20250702121159.652969404@infradead.org>
 <20250703160027.GC245663@pauld.westford.csb>
 <20250703164708.GZ1613200@noisy.programming.kicks-ass.net>
 <0672c7df-543c-4f3e-829a-46969fad6b34@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0672c7df-543c-4f3e-829a-46969fad6b34@amd.com>

On Fri, Jul 04, 2025 at 11:43:43AM +0530, K Prateek Nayak wrote:
> Hello Peter,
> 
> On 7/3/2025 10:17 PM, Peter Zijlstra wrote:
> > Also, I updated the git tree today, fixing a silly mistake. But I don't
> > remember build failures here.
> 
> Running HammerDB + MySQL on baremetal results in a splats from
> assert_clock_updated() ~10min into the run on peterz:sched/core at
> commit 098ac7dd8a57 ("sched: Add ttwu_queue support for delayed
> tasks") which I hope is the updated one.
> 
> I'm running with the following diff and haven't seen a splat yet
> (slightly longer than 10min into HammerDB; still testing):
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 9855121c2440..71ac0e7effeb 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3871,7 +3871,7 @@ static int ttwu_delayed(struct rq *rq, struct task_struct *p, int wake_flags,
>  	if (unlikely(rq != p_rq)) {
>  		__task_rq_unlock(p_rq, rf);
>  		rq_lock(rq, rf);
> -		update_rq_clock(p_rq);
> +		update_rq_clock(rq);
>  	}
>  	p->sched_remote_wakeup = !!(wake_flags & WF_MIGRATED);

Damn,... I did the edit right on the test box and then messed it up when
editing the patch :-(

I'll go fix.
