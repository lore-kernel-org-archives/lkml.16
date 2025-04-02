Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3641E1022
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 09:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743585323; cv=none; b=dWct8XS3eR5Uyv5eJ5H87AIqZRXA3BJ5jLNHDF5IXU3ZuedaeiBvo4vkyjJzhT35aftKvy3XcThcB2DzCTwkgvxCCdFsO17ZFP7r0FdQrYjedto727k72/LjgxuU14Isg2mtVu22QoHKCQNuNgl1mM0S+BJlxehNQ2G3HM1wrXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743585323; c=relaxed/simple;
	bh=n/RxIaaccgNHBVClISeM0VdhOGZQNwC9h1yNM6a7Qkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oj2RXOD/C9lagNnjgqscjCqb0FcZwxLNenvC/3/xLzoY8b9dGgw+6mPaUtGXyncgRaO3isOBLD7FDVgCucOe6qrmbC4bHYWO+e6Y/EozwQBKfSHH4+kmYkQwPtwvqOIv8MX9z75oTcvkbgaWKUJiOAMw0h8KgBOV+Jf93aLeWhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EigNL30l; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EigNL30l"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vq7+ZxmIAUqYCHH83Qzf9D4wDj/DFpbKgAvaJzR7RZI=; b=EigNL30lw4h+Mv8YDvLQ8Iknkb
	gSrnjpUE22e3kFHGSOg7AMAcn49pCyDx4Y3fXZurpyel2OVWmIiBGwPLC1MKTYQ7nDGj21h5/Qwat
	q+jOWr2/0s0LC4KQGNV0balJChOouv30V9x+b1Ipn57l4GmW/TwzcsdEl5ptc3MxFAO6uRBn2Nt7j
	r27z95vxcchg1HQmPBPKE4YyzQbaayhiC6fM5pdw98G6mX7z4NGb9ERtHH8XcKyjOfSQvtrOaaIc4
	8xaaBm5spb+Ppr/kcOvooV3g6ayhlCNyYOuc+jpVZpgr35XP8qVGQw1BfaEjjnL/qDIkckAQdqOEp
	fZVj6iQQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzuBl-000000099oB-22jQ;
	Wed, 02 Apr 2025 09:15:13 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D81E730049D; Wed,  2 Apr 2025 11:15:12 +0200 (CEST)
Date: Wed, 2 Apr 2025 11:15:12 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ravi Bangoria <ravi.bangoria@amd.com>
Cc: mingo@kernel.org, lucas.demarchi@intel.com,
	linux-kernel@vger.kernel.org, acme@kernel.org, namhyung@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com
Subject: Re: [PATCH v3 3/7] perf: Simplify perf_event_free_task() wait
Message-ID: <20250402091512.GV5880@noisy.programming.kicks-ass.net>
References: <20250307193305.486326750@infradead.org>
 <20250307193723.044499344@infradead.org>
 <1d9d8520-bb4d-4af3-a395-4a4e594e67e8@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d9d8520-bb4d-4af3-a395-4a4e594e67e8@amd.com>

On Mon, Mar 17, 2025 at 12:19:07PM +0530, Ravi Bangoria wrote:
> Hi Peter,
> 
> > @@ -1223,8 +1223,14 @@ static void put_ctx(struct perf_event_co
> >  	if (refcount_dec_and_test(&ctx->refcount)) {
> >  		if (ctx->parent_ctx)
> >  			put_ctx(ctx->parent_ctx);
> > -		if (ctx->task && ctx->task != TASK_TOMBSTONE)
> > -			put_task_struct(ctx->task);
> > +		if (ctx->task) {
> > +			if (ctx->task == TASK_TOMBSTONE) {
> > +				smp_mb(); /* pairs with wait_var_event() */
> > +				wake_up_var(&ctx->refcount);
> 
> perf_event_free_task() waits on "ctx->refcount == 1". But moving
> wake_up_var() under refcount_dec_and_test() will cause
> perf_event_free_task() to wait indefinitely. Right? So, shouldn't
> wake_up_var() be outside? something like:
> 
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -1281,15 +1281,14 @@ static void put_ctx(struct perf_event_context *ctx)
>  	if (refcount_dec_and_test(&ctx->refcount)) {
>  		if (ctx->parent_ctx)
>  			put_ctx(ctx->parent_ctx);
> -		if (ctx->task) {
> -			if (ctx->task == TASK_TOMBSTONE) {
> -				smp_mb(); /* pairs with wait_var_event() */
> -				wake_up_var(&ctx->refcount);
> -			} else {
> -				put_task_struct(ctx->task);
> -			}
> -		}
> +		if (ctx->task && ctx->task != TASK_TOMBSTONE)
> +			put_task_struct(ctx->task);
>  		call_rcu(&ctx->rcu_head, free_ctx);
> +	} else {
> +		if (ctx->task == TASK_TOMBSTONE) {
> +			smp_mb(); /* pairs with wait_var_event() */
> +			wake_up_var(&ctx->refcount);
> +		}
>  	}
>  }

Yes, you're quite right indeed. Thanks!
