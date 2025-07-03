Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A5C299A8A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 07:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751527584; cv=none; b=Ap3eNIyOGtZWwvD0HQhC4E30SvvIjLTYZhtvdMEBfnJNaEPRDLlpQQlIef3aBmYdIJ1FmTaPHWMzS73qdvAbKZIKHy3WF1oH47ddltqFOicU3NPTdv6WnVl0ah1FkZUqJNrJsEpfOSjwWfr/vrfkuw7dIC8DjO5y5zhZnvlx9ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751527584; c=relaxed/simple;
	bh=aZrQj1zi7sRaCxKaskG4fv/HM4jemIXDoUAASh3ewpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TJE5l/Yr/ix/SNpn614nnVoqOcg9MiHnnaAmikIfEN+XfDaAmFXwDLaim5i6QZAoDNNyAG9MKl8scKwhtLIXhJhvLPTdMJKmS5XwZP1Rw9gLhPOQJ+dIzqiTGGaT7rUo+izOvoiPufv71+v0SJSi+Wl0l95YC3AMyRMlq4qIUBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jA9jhBSE; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jA9jhBSE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mO0u1JJhHr6e+vb3wOvor5wq8Jwna6+MzxSiR0enmxM=; b=jA9jhBSESNFY+sMB3BIw3uWr24
	ukjZlN1BiunQJ0iWpg582oJgYYUCQ9yiLL0hL8YaeZh9MQAiqd7hbGiYczzpKN3yHY+GOu+pqRyvh
	40gcbk1kSYjXMyzP+wcyhmsNKzJ0u+GDDLE1CpVLdSqDei58iog/BP0pzaCAi4fTJqQx15SG7fB3h
	SRXB7X4/s3M3XT7XrI5QyrmlWAGJeWg8JJ87/jTsPcLQAnYXRCTZTwUUtXTaPidMkBbJtsFddHP3O
	WerPJwMteWNE02AY3Dz0FWThARpTkbAELB7XQ+ggYWO6GERQayxy5hMVOaUvxyU+tbLs6NG/sUU/Q
	saYaewSA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEKg-00000007dbE-0Wev;
	Thu, 03 Jul 2025 07:26:10 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C5D6F30017D; Thu, 03 Jul 2025 09:26:08 +0200 (CEST)
Date: Thu, 3 Jul 2025 09:26:08 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Chen Yu <yu.c.chen@intel.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tim Chen <tim.c.chen@intel.com>, linux-kernel@vger.kernel.org,
	Jirka Hladky <jhladky@redhat.com>,
	Srikanth Aithal <Srikanth.Aithal@amd.com>,
	Suneeth D <Suneeth.D@amd.com>, Libo Chen <libo.chen@oracle.com>
Subject: Re: [PATCH] sched/numa: Fix NULL pointer access to mm_struct durng
 task swap
Message-ID: <20250703072608.GS1613200@noisy.programming.kicks-ass.net>
References: <20250702163247.324439-1-yu.c.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702163247.324439-1-yu.c.chen@intel.com>

On Thu, Jul 03, 2025 at 12:32:47AM +0800, Chen Yu wrote:

> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 8988d38d46a3..4e06bb955dad 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3364,7 +3364,14 @@ static void __migrate_swap_task(struct task_struct *p, int cpu)
>  {
>  	__schedstat_inc(p->stats.numa_task_swapped);
>  	count_vm_numa_event(NUMA_TASK_SWAP);
> -	count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> +	/* exiting task has NULL mm */
> +	if (!(p->flags & PF_EXITING)) {
> +		WARN_ONCE(!p->mm, "swap task %d %s %x has no mm\n",
> +			  p->pid, p->comm, p->flags);
> +
> +		if (p->mm)
> +			count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> +	}

Aside from the things already mentioned by Andrew and Michal; why not
simply do something like:

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 87b6688f124a..8396ebfab0d5 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -969,7 +969,7 @@ static inline void count_memcg_events_mm(struct mm_struct *mm,
 {
 	struct mem_cgroup *memcg;
 
-	if (mem_cgroup_disabled())
+	if (mem_cgroup_disabled() || !mm)
 		return;
 
 	rcu_read_lock();
