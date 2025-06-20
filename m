Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCDD30E837
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750400957; cv=none; b=WiGuJYZk+vC6wSHu3Fln6e1N+qN+0c2Nvkn0KzrZykdyMXIIx3HEkF6UBBeHJMRjEKRWpnXU1o2QgxtX6+YMBnTuUBHip5nsmlBBnYbNHTDiXTi5fDFaUZNiXgrMt79hWEInQ4eufVut7iO4sYxEw7ytK/vtC8Pc0Q3cn/gwmgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750400957; c=relaxed/simple;
	bh=NeWTm7PCrdmVVP+amZpDYiQRtF29U5JNNzt5h9G/uXs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RcWyaN2s3ymIlSKIQ8Z5iqtG5ynvEuPd1sm3Ex/mUNVV0yN4TvsJRJ3NvfSHoWhiLrKJNkZKlwnh40bBhIn7hfH1Le5N5tJmXjiL++UkiGZ4XvIm5308ZU0z5R9evc1Qqdms7W5yX1+iUiAvZkUBykiaUaZMhe4lTnSr1Qb63ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Wngawbcb; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Wngawbcb"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750400945; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=ObrpFPq4/eth+coXbnoMx94uYFGAmPwTnmHT3WznBzw=;
	b=WngawbcbjTqKjDDMwO/kjRyf87jxd2p1YivLFPUeecDLniF+KiJlxbwkOOI/8VKdS8krOywP4UVRYo3IxdurbtLEqb+9GLrUrwncOGfJDWBAzmJYjyX/aKobUkud0HT/NOaab7JGWxg6GOIPR4kVH+MEO/gDxYrI2raxMoZunao=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WeJm7u6_1750400932 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 20 Jun 2025 14:29:03 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Li Zhijian <lizhijian@fujitsu.com>
Cc: linux-mm@kvack.org,  akpm@linux-foundation.org,
  linux-kernel@vger.kernel.org,  y-goto@fujitsu.com,  Ingo Molnar
 <mingo@redhat.com>,  Peter Zijlstra <peterz@infradead.org>,  Juri Lelli
 <juri.lelli@redhat.com>,  Vincent Guittot <vincent.guittot@linaro.org>,
  Dietmar Eggemann <dietmar.eggemann@arm.com>,  Steven Rostedt
 <rostedt@goodmis.org>,  Ben Segall <bsegall@google.com>,  Mel Gorman
 <mgorman@suse.de>,  Valentin Schneider <vschneid@redhat.com>
Subject: Re: [PATCH RFC] mm: memory-tiering: Fix PGPROMOTE_CANDIDATE accounting
In-Reply-To: <20250619075245.3272384-1-lizhijian@fujitsu.com> (Li Zhijian's
	message of "Thu, 19 Jun 2025 15:52:45 +0800")
References: <20250619075245.3272384-1-lizhijian@fujitsu.com>
Date: Fri, 20 Jun 2025 14:28:51 +0800
Message-ID: <87ldpn2afw.fsf@DESKTOP-5N7EMDA>
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
> The issue manifests under specific memory pressure conditions:
> when top-tier memory (DRAM) is exhausted by memhog and allocation begins
> in lower-tier memory (CXL). After terminating memhog, the stats show:

The above description is confusing.  The page promotion occurs when the
size of the top-tier free space is large enough (after killing the
memhog above).  The accessed lower-tier memory will be promoted upon
accessing to take full advantage of the more expensive top-tier memory.

> $ grep -e pgpromote /proc/vmstat
> pgpromote_success 2579
> pgpromote_candidate 1
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

Yes.  The rate limit will be influenced by the change.  So, more tests
may be needed to verify it will not incurs regressions.

>
> Reported-by: Yasunori Gotou (Fujitsu) <y-goto@fujitsu.com>
> Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
> ---
>
> This is markes as RFC because I am uncertain whether we originally
> intended for this or if it was overlooked.
>
> However, the current situation where pgpromote_candidate < pgpromote_success
> is indeed confusing when interpreted literally.
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
> ---
>  kernel/sched/fair.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 7a14da5396fb..4715cd4fa248 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1940,11 +1940,13 @@ bool should_numa_migrate_memory(struct task_struct *p, struct folio *folio,
>  		struct pglist_data *pgdat;
>  		unsigned long rate_limit;
>  		unsigned int latency, th, def_th;
> +		long nr = folio_nr_pages(folio)
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
