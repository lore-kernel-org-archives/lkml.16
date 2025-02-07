Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BBB184E
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 12:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738931787; cv=none; b=rdYWSwBIwuErZbs2937aFJnX16bqIVszc187LBkYyBpkhz2pDiYm6PQG5h/m9AS/BDUcoot6XW37T664HElAi3aLCN1q+n0AtHJHhi+5Eze+CVO3xV4LadVs10XR3HPwHqqvmJjM450jfi0AAr0/bYApf07HuBeBrzv/KdVgin0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738931787; c=relaxed/simple;
	bh=5P7RkzOc/3WZiML4LzACxc3KNo3hazioPLHDmVShYx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uHQx9p3ihcCxCUvgXVweK3kWnHx3AIFoqf+1rDgq8e1xg7nEGvuToZTM2340vx1df+FLHFqaaArHX0AqZH0OfFbAGv9dPfnq2fnIZ7Q3u99SOPlse+xCDDpmRvc+WnZCwE5YCoYLar3EBzesg7y+qzF3i4nATkjhJgLx6ISQbx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RxcqDhNg; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RxcqDhNg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vfuQoWD9QTH0pA9BiG5tl1rwta+YR9EYbDQUHEfE0mc=; b=RxcqDhNghXjEHZCaYtrgzimoh6
	nLgt1ErIhvjCjdHeKQxt75sGXUZpc6lFTwDden4HRS/VvGbPW0p9vUwTBUlp/D4EQoetaGbLkkxr4
	AHxf0jshVvQBGvvuCdk1mbNZqLGaPv3QgiZrtun2hXj1ugTVRrYmi7tjAkyeJvpvlfCwoeLp3abfL
	8XYds0EEZkHVcMjFcU27iGifbl/MGrF1uqGSRazjAW0QhdbVfibzNxcmiZQWN1/G+GCTWZ9EI9lwB
	XUQwiqUsZNyxP7ecY8H0iIhXSwIUmdqJCDPtfEUi25x9JyQ3lqxdqmMlqyDPBSRMdtD8A1pYKHh24
	fsb5X4Jw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNan-0000000HAkJ-0ql4;
	Fri, 07 Feb 2025 12:36:21 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CBED3300310; Fri,  7 Feb 2025 13:36:20 +0100 (CET)
Date: Fri, 7 Feb 2025 13:36:20 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: zihan zhou <15645113830zzh@gmail.com>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V1] sched: Cancel the slice protection of the idle entity
Message-ID: <20250207123620.GA10324@noisy.programming.kicks-ass.net>
References: <20250121030628.113497-1-15645113830zzh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121030628.113497-1-15645113830zzh@gmail.com>

On Tue, Jan 21, 2025 at 11:06:29AM +0800, zihan zhou wrote:
> A wakeup non-idle entity should preempt idle entity at any time,
> but because of the slice protection of the idle entity, the non-idle
> entity has to wait, so just cancel it.
> 
> Signed-off-by: zihan zhou <15645113830zzh@gmail.com>
> ---
>  kernel/sched/fair.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 3e9ca38512de..7777d110d053 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8851,8 +8851,19 @@ static void check_preempt_wakeup_fair(struct rq *rq, struct task_struct *p, int
>  	 * Preempt an idle entity in favor of a non-idle entity (and don't preempt
>  	 * in the inverse case).
>  	 */
> -	if (cse_is_idle && !pse_is_idle)
> +	if (cse_is_idle && !pse_is_idle) {
> +
> +		/*
> +		 * When non-idle entity preempt an idle entity,
> +		 * don't give idle entity slice protection.
> +		 */
> +		if (se->vlag == se->deadline)
> +			se->vlag = se->deadline + 1;
> +
>  		goto preempt;
> +
> +	}

Yes, I suppose we can do this.
