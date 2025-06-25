Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30802307498
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750831902; cv=none; b=FRUFjpcldfj78zpzB2QV80LQN4Ya8uKYRBix9sCIQ2TQSnA1FqXusk93YC4KGqpdJQSoLlE7NJA0YRKY8JW1o7xw1gfNFXfvmXLMgCZ8eZwSFD2EWgnm0t8QK/zw5jOX5PYfP3WUIvTd3zP7DKCC/8J9FNZINCEtyy9p+6fRvZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750831902; c=relaxed/simple;
	bh=66IhicLmquIrT8WLtYhnwtaZzHKT0a9JlXmR82CzU6g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OkxYp6K4pLe4ZuKa5RRpkLYVCr/8rRO4r2f+jYCdBIeTCaztbg9WzL2OpIsPpLTfmmDhUYs4LC+RngcebRS4YxruRwjjo0QdRTA8W1C8G5Uqh6StO692uX2Ysfp8bzoiGfP+daO282Tkue0WEKxIcyVgDgrBicD4mOUdMwInqwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=V0NAbayk; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="V0NAbayk"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750831895; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=76DnGSmj2vkYfuP0EwAnTPcRa1vP+wuz/cSNTM/iBy8=;
	b=V0NAbayk2W5GH7/2EIFZf+Li+JrQnbDn2CqAiT4ymuQB6BL1dRngKWz00KgvEEsJ7/fgnYcBYqWtU2kr5Nihf5yUgufP56TD4hJdM8kKdzY5oNVVgM8zz8cvdv4RIrEyIx7M9k1IfdGJ2bu2pIob6McbdoY3C3nYM8x7QE4bJ6A=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WetkeAe_1750831892 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 25 Jun 2025 14:11:33 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Li Zhijian <lizhijian@fujitsu.com>
Cc: linux-mm@kvack.org,  akpm@linux-foundation.org,
  linux-kernel@vger.kernel.org,  y-goto@fujitsu.com,  Ingo Molnar
 <mingo@redhat.com>,  Peter Zijlstra <peterz@infradead.org>,  Juri Lelli
 <juri.lelli@redhat.com>,  Vincent Guittot <vincent.guittot@linaro.org>,
  Dietmar Eggemann <dietmar.eggemann@arm.com>,  Steven Rostedt
 <rostedt@goodmis.org>,  Ben Segall <bsegall@google.com>,  Mel Gorman
 <mgorman@suse.de>,  Valentin Schneider <vschneid@redhat.com>,
  lkp@intel.com
Subject: Re: [PATCH RFC v2] mm: memory-tiering: Fix PGPROMOTE_CANDIDATE
 accounting
In-Reply-To: <20250625021352.2291544-1-lizhijian@fujitsu.com> (Li Zhijian's
	message of "Wed, 25 Jun 2025 10:13:52 +0800")
References: <20250625021352.2291544-1-lizhijian@fujitsu.com>
Date: Wed, 25 Jun 2025 14:11:32 +0800
Message-ID: <877c10mju3.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Li Zhijian <lizhijian@fujitsu.com> writes:

> Goto-san reported confusing pgpromote statistics where
> the pgpromote_success count significantly exceeded pgpromote_candidate.
>
> On a system with three nodes (nodes 0-1: DRAM 4GB, node 2: NVDIMM 4GB):
>  # Enable demotion only
>  echo 1 > /sys/kernel/mm/numa/demotion_enabled
>  numactl -m 0-1 memhog -r200 3500M >/dev/null &
>  pid=$!
>  sleep 2
>  numactl memhog -r100 2500M >/dev/null &
>  sleep 10
>  kill -9 $pid # terminate the 1st memhog
>  # Enable promotion
>  echo 2 > /proc/sys/kernel/numa_balancing
>
> After a few seconds, we observeed `pgpromote_candidate < pgpromote_success`
> $ grep -e pgpromote /proc/vmstat
> pgpromote_success 2579
> pgpromote_candidate 0
>
> In this scenario, after terminating the first memhog, the conditions for
> pgdat_free_space_enough() are quickly met, triggering promotion.
> However, these migrated pages are only accounted for in PGPROMOTE_SUCCESS,
> not in PGPROMOTE_CANDIDATE.
>
> This update increments PGPROMOTE_CANDIDATE within the free space branch
> when a promotion decision is made, which may alter the mechanism of the
> rate limit. Consequently, it becomes easier to reach the rate limit than
> it was previously.
>
> For example:
> Rate Limit = 100 pages/sec
> Scenario:
>   T0: 90 free-space migrations
>   T0+100ms: 20-page migration request
>
> Before:
>   Rate limit is *not* reached: 0 + 20 = 20 < 100
>   PGPROMOTE_CANDIDATE: 20
> After:
>   Rate limit is reached: 90 + 20 = 110 > 100
>   PGPROMOTE_CANDIDATE: 110
>
> Due to the fact that the rate limit mechanism recalculates every second,
> theoretically, only within that one second can the transition from
> pgdat_free_space_enough() to !pgdat_free_space_enough() in top-tier
> remaining memory be affected.
>
> Moreover, previously, within this one-second span, promotions caused by
> pgdat_free_space_enough() are not restricted by rate limits.
> This theoretically makes it easier to cause application latency.
>
> The current modification can better control the rate limit in cases of
> transition from pgdat_free_space_enough() to !pgdat_free_space_enough()
> within one second.
>
> Cc: Huang Ying <ying.huang@linux.alibaba.com>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Vincent Guittot <vincent.guittot@linaro.org>
> Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Ben Segall <bsegall@google.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: Valentin Schneider <vschneid@redhat.com>
> Reported-by: Yasunori Gotou (Fujitsu) <y-goto@fujitsu.com>
> Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
> ---
> V2:
> Fix compiling error # Reported by LKP
>
> As Ying suggested, we need to assess whether this change causes regression.
> However, considering the stringent conditions this patch involves,
> properly evaluating it may be challenging, as the outcomes depend on your
> perspective. Much like in a zero-sum game, if someone benefits, another
> might lose.
>
> If there are subsequent results, I will update them here.

I understand that it's hard to identify all possible regressions.
However, at least done some test to check some common use cases?

> Cc: lkp@intel.com
> Here, I hope to leverage the existing LKP benchmark to evaluate the
> potential impacts. The ideal evaluation conditions are:
> 1. Installed with DRAM + NVDIMM (which can be simulated).
> 2. NVDIMM is used as system RAM (configurable via daxctl).
> 3. Promotion is enabled (`echo 2 > /proc/sys/kernel/numa_balancing`).
>
> Alternative:
> We can indeed eliminate the potential impact within
> pgdat_free_space_enough(), so that the rate limit behavior remains as
> before.
>
> For instance, consider the following change:
>                 if (pgdat_free_space_enough(pgdat)) {
>                         /* workload changed, reset hot threshold */
>                         pgdat->nbp_threshold = 0;
> +                        pgdat->nbp_rl_nr_cand += nr;
>                         mod_node_page_state(pgdat, PGPROMOTE_CANDIDATE, nr);
>                         return true;
>                 }
>
> RFC:
> I am uncertain whether we originally intended for this discrepancy or if
> it was overlooked.
>
> However, the current situation where pgpromote_candidate < pgpromote_success
> is indeed confusing when interpreted literally.
> ---
>  kernel/sched/fair.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 7a14da5396fb..505b40f8897a 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1940,11 +1940,13 @@ bool should_numa_migrate_memory(struct task_struct *p, struct folio *folio,
>  		struct pglist_data *pgdat;
>  		unsigned long rate_limit;
>  		unsigned int latency, th, def_th;
> +		long nr = folio_nr_pages(folio);
>  
>  		pgdat = NODE_DATA(dst_nid);
>  		if (pgdat_free_space_enough(pgdat)) {
>  			/* workload changed, reset hot threshold */
>  			pgdat->nbp_threshold = 0;
> +			mod_node_page_state(pgdat, PGPROMOTE_CANDIDATE, nr);
>  			return true;
>  		}
>  
> @@ -1958,8 +1960,7 @@ bool should_numa_migrate_memory(struct task_struct *p, struct folio *folio,
>  		if (latency >= th)
>  			return false;
>  
> -		return !numa_promotion_rate_limit(pgdat, rate_limit,
> -						  folio_nr_pages(folio));
> +		return !numa_promotion_rate_limit(pgdat, rate_limit, nr);
>  	}
>  
>  	this_cpupid = cpu_pid_to_cpupid(dst_cpu, current->pid);

---
Best Regards,
Huang, Ying
