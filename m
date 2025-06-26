Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8EA28FFEE
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946587; cv=none; b=ruf7s1aePNnxWh21+LcUgMP429aFe24Qc1yF8poNJJqkSc/O/93kyLbAGjcEC5h2vs9nqcFqXDP8TfTJkme9j2Ha5fBOCXEHEZ1swGCEWUFq7c46T8cIVnku04V3Qmwa4DIKCkO4EPreKahHdHjUZBK1/DzvzMN0dDZM+kLghWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946587; c=relaxed/simple;
	bh=RXGAqFvutlePj0O4AUmmk7iuXwOUTnL3CNnslHpR5hA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Att97d/YQ2rctPYwsiYlw5RVdbKWxikayxzu1Ja+IJYe7GVAmP2d/jNory+0Rr1trN4jJYXy3giBffY4RKx05EczWk2RbX7vOXxDBDR0pTz3QoChvVU6aZd8SjMxtBHFXx2lQsQWZ5LeU3ROvcmZauHAM//NWRGtL9hb/Y7mjAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nebYpjp7; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nebYpjp7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RawXGJ4jllKNzdMM3/psOGmdykKZeSx5tN3WfXCfU1w=; b=nebYpjp7PXERY5fVOq9x8cJF01
	Fn+FIJUS77edZdgLmUA5E+Q32C7nj5VNE+U1PdtNvHwP7nMbA76td/ElaMQ3tiweypXu4xpKam8Ff
	AwnSSqXJkKuljFclyVR42W6Uv7bPt5YiSL6OUGl0htpsJAtC3fMyLdLyheG8m0/3kzSkI9Il2q19S
	yuJz4F1QJ/dIK43wVsHnYzRgo3YnzWrh5tz3/kVz3sowBvUAjJkJ38sAOhjYr9Ti27QVP6AY3cTwX
	HCRSN5nnB1RBnI3FYAt8XBZkgR33LudiM+SMWgA89uUAdMKLgX50m6CvCXvhdybAZtZ0whq6VkFNx
	zp/4vqvg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnBs-000000066ZJ-3676;
	Thu, 26 Jun 2025 14:03:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C195930BDA9; Thu, 26 Jun 2025 16:02:59 +0200 (CEST)
Date: Thu, 26 Jun 2025 16:02:59 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Chris Mason <clm@meta.com>
Cc: Jianyong Wu <jianyong.wu@outlook.com>, Chris Mason <clm@fb.com>,
	vincent.guittot@linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] sched/fair: bump sd->max_newidle_lb_cost when
 newidle balance fails
Message-ID: <20250626140259.GL1613200@noisy.programming.kicks-ass.net>
References: <20250624204942.715206-1-clm@fb.com>
 <20250626070057.GE1613200@noisy.programming.kicks-ass.net>
 <SI2PR04MB49312C83A5E6B68086954B41E37AA@SI2PR04MB4931.apcprd04.prod.outlook.com>
 <2fbf24bc-e895-40de-9ff6-5c18b74b4300@meta.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fbf24bc-e895-40de-9ff6-5c18b74b4300@meta.com>

On Thu, Jun 26, 2025 at 09:48:29AM -0400, Chris Mason wrote:

> FWIW, the main reason I parked this in sched_balance_rq() was because I
> wasn't sure if there were other reasons we might fail to pull a task
> where I didn't want to bump the cost.  You've got a good point though.
> 
> This v2 performs the same.  It takes about 60 seconds to warm up to the
> point where schbench performance is fast.  Below I've also got
> the drgn script I'm using the dump the avg_idle and sd info along with
> output while schbench is running.
> 
> Peter if this is what you're looking for I'll send a new version,
> without whatever whitespace mangling exchange does to this email.
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 7a14da5396fb2..6a3345168870a 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -12173,9 +12173,11 @@ static inline bool update_newidle_cost(struct sched_domain *sd, u64 cost)
>         if (cost > sd->max_newidle_lb_cost) {
>                 /*
>                  * Track max cost of a domain to make sure to not delay the
> -                * next wakeup on the CPU.
> +                * next wakeup on the CPU.  Also, cap this cost at the sched_migration
> +                * sysctl, plus a little extra so we don't have to worry about off by 1s

It explains we cap (as can be read from the code); perhaps explain why
the cap is important though.

>                  */
> -               sd->max_newidle_lb_cost = cost;
> +               sd->max_newidle_lb_cost =
> +                       min(cost, sysctl_sched_migration_cost + 200);
>                 sd->last_decay_max_lb_cost = jiffies;
>         } else if (time_after(jiffies, sd->last_decay_max_lb_cost + HZ)) {
>                 /*
> @@ -12867,7 +12869,13 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
> 
>                         t1 = sched_clock_cpu(this_cpu);
>                         domain_cost = t1 - t0;
> -                       update_newidle_cost(sd, domain_cost);
> +
> +                       /* bump the newidle cost if balances aren't productive */
> +                       if (!pulled_task)
> +                               update_newidle_cost(sd,
> +                               sd->max_newidle_lb_cost + sd->max_newidle_lb_cost / 2);
> +                       else
> +                               update_newidle_cost(sd, domain_cost);
> 
>                         curr_cost += domain_cost;
>                         t0 = t1;

I think I prefer the form:

			domain_cost = t1 - t0;
			curr_cost += domain_cost;
			t0 = t1;

			/*
			 * Failing newidle means it is not effective;
			 * bump the cost so we end up doing less of it.
			 */
			if (!pulled_task)
				domain_cost = (3 * sd->max_newidle_lb_cost) / 2;

			update_newidle_cost(sd, domain_cost);

But yes. Thanks!
