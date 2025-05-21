Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E1778C9C
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747817364; cv=none; b=rLAbSZWXzMmi1k0UpGkLsYR8MSh/yZJ4Kj8QvC9hVOBXCgzp1bnfBX3EbXbEa9gNamBK6XPsRDH9Xv31OcUmG6jEazWR/Nvlf3ywKt4pj4++BraVv9i0mziPQi0FUH8pbYoWKwAv612A5/+P4iucWHICA62WiDrA0XheSo7ut+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747817364; c=relaxed/simple;
	bh=djYsEI8JRsXTX9qsb8/KZKWaE2mrKR6PoSxkoBoMKCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EZgajz729I6ti5/AVb2xgAO99WciUUikbwPh5gN/Uk6cXQ4i9wTNCbwuzz9R+ckyRwqI/xg0+psrJcvA+7FUfWV8eMPAByWdXud+fcKRDmNWwavcMoi9UU1tazNWXy6bzdvo6wWSwyWUrn8uWXgZv0KnVPbbpDuLER1Suamr9+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rVLO/KoG; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rVLO/KoG"
Message-ID: <90b2e62f-cacc-49b2-acf7-3a33348e2210@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747817359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lvM3TAtnOSwCpnCUaRauuHYgKEY/9dlWJw7rQvy5oeE=;
	b=rVLO/KoGHcoJwmvcvlU5hyra8mCT8X7Lkj+eZDzMADglAuAoNGBxt/l/z4v+g75omreJhq
	v/qINYh72YCX/+YTdC/ZZd3nPY9vd2naa7ZH0CbkjA4MdwukNEKuQJF0afHlTcUEbcikqo
	AuwJ93jx2qiTF8AvukpniUeVXNRjKtA=
Date: Wed, 21 May 2025 16:48:44 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] sched/fair: Add related data structure for task based
 throttle
To: Aaron Lu <ziqianlu@bytedance.com>,
 Valentin Schneider <vschneid@redhat.com>, Ben Segall <bsegall@google.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, Josh Don <joshdon@google.com>,
 Ingo Molnar <mingo@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Xi Wang <xii@google.com>
Cc: linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
 Chuyi Zhou <zhouchuyi@bytedance.com>, Jan Kiszka <jan.kiszka@siemens.com>,
 Florian Bezdeka <florian.bezdeka@siemens.com>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-2-ziqianlu@bytedance.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chengming Zhou <chengming.zhou@linux.dev>
In-Reply-To: <20250520104110.3673059-2-ziqianlu@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2025/5/20 18:41, Aaron Lu wrote:
> From: Valentin Schneider <vschneid@redhat.com>
> 
> Add related data structures for this new throttle functionality.
> 
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>

Looks good to me.

Reviewed-by: Chengming Zhou <chengming.zhou@linux.dev>

Thanks!

> ---
>   include/linux/sched.h |  4 ++++
>   kernel/sched/core.c   |  3 +++
>   kernel/sched/fair.c   | 12 ++++++++++++
>   kernel/sched/sched.h  |  2 ++
>   4 files changed, 21 insertions(+)
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index b98195991031c..055f3782eeaee 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -879,6 +879,10 @@ struct task_struct {
>   
>   #ifdef CONFIG_CGROUP_SCHED
>   	struct task_group		*sched_task_group;
> +#ifdef CONFIG_CFS_BANDWIDTH
> +	struct callback_head		sched_throttle_work;
> +	struct list_head		throttle_node;
> +#endif
>   #endif
>   
>   
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index bece0ba6f5b3a..b7ca7cefee54e 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -4499,6 +4499,9 @@ static void __sched_fork(unsigned long clone_flags, struct task_struct *p)
>   
>   #ifdef CONFIG_FAIR_GROUP_SCHED
>   	p->se.cfs_rq			= NULL;
> +#ifdef CONFIG_CFS_BANDWIDTH
> +	init_cfs_throttle_work(p);
> +#endif
>   #endif
>   
>   #ifdef CONFIG_SCHEDSTATS
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index eb5a2572b4f8b..75bf6186a5137 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -5825,6 +5825,18 @@ static inline int throttled_lb_pair(struct task_group *tg,
>   	       throttled_hierarchy(dest_cfs_rq);
>   }
>   
> +static void throttle_cfs_rq_work(struct callback_head *work)
> +{
> +}
> +
> +void init_cfs_throttle_work(struct task_struct *p)
> +{
> +	init_task_work(&p->sched_throttle_work, throttle_cfs_rq_work);
> +	/* Protect against double add, see throttle_cfs_rq() and throttle_cfs_rq_work() */
> +	p->sched_throttle_work.next = &p->sched_throttle_work;
> +	INIT_LIST_HEAD(&p->throttle_node);
> +}
> +
>   static int tg_unthrottle_up(struct task_group *tg, void *data)
>   {
>   	struct rq *rq = data;
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index c5a6a503eb6de..921527327f107 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -2703,6 +2703,8 @@ extern bool sched_rt_bandwidth_account(struct rt_rq *rt_rq);
>   
>   extern void init_dl_entity(struct sched_dl_entity *dl_se);
>   
> +extern void init_cfs_throttle_work(struct task_struct *p);
> +
>   #define BW_SHIFT		20
>   #define BW_UNIT			(1 << BW_SHIFT)
>   #define RATIO_SHIFT		8
