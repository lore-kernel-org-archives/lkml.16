Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01755680
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750733222; cv=none; b=H7OZqfYqDQPJzaLbiCM75hTPNtnC0/+SZv8bAAn43PEo4lUNoygXl5XkBwudd1ONIkKHWBiXTkPZIrqjg0AGqpkQQCl7xczl5clArlQHyb42+iep8qXbeakoAZnpBL7HU9gBBC0l4iuphjlaqSXmTE6AzcDfsYe30bcjjAlDRaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750733222; c=relaxed/simple;
	bh=SuAlKzQOoC3dlHb/6U/fUV+iL2+x+I1elPAkeQyvqPI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XoscF/1DBFBnQkmggtTMh39Vks8xxAFLWC/BFbGayhCWiXMmC4jItrcPS6xh42h8xi9ragWSG62DbRNwYXZ9j/tqgn0b5S5XX+FE9tnw4/YGAIV/VnJ6rCo2mO1iFqZxyFGgDa9qGoV3O/pazBPIrUNhQqa94FxG3S/8dVwLNYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=RJgCFtU5; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="RJgCFtU5"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750733216; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=EuFm/S2kcfuA/k9NxIggqP6DKi+9r/AflvcKbobw8vk=;
	b=RJgCFtU5yV4c1Zxg46KCRTUzl4o//H8mEiBK6L0+xmCGJxq+wnxpl5EiTCdrIUx8bC7nhXodKZwA+g5jicCDis0N7QEBrXIIe4wQpWvSsyCjSgREBh4iSX4wuJkzHcRQJ0f4uGHE/TKfamizEdmmYDEnihpGzR9XOsoZ0q/tUWU=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0Weefnzt_1750733205 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Jun 2025 10:46:55 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: "Zhijian Li (Fujitsu)" <lizhijian@fujitsu.com>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,  "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>,  "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,  "Yasunori Gotou (Fujitsu)"
 <y-goto@fujitsu.com>,  Ingo Molnar <mingo@redhat.com>,  Peter Zijlstra
 <peterz@infradead.org>,  Juri Lelli <juri.lelli@redhat.com>,  Vincent
 Guittot <vincent.guittot@linaro.org>,  Dietmar Eggemann
 <dietmar.eggemann@arm.com>,  Steven Rostedt <rostedt@goodmis.org>,  Ben
 Segall <bsegall@google.com>,  Mel Gorman <mgorman@suse.de>,  Valentin
 Schneider <vschneid@redhat.com>,  kernel test robot <lkp@intel.com>
Subject: Re: [PATCH RFC] mm: memory-tiering: Fix PGPROMOTE_CANDIDATE accounting
In-Reply-To: <47f42c60-9752-4bc6-9079-627b6e0b9cfc@fujitsu.com> (Zhijian Li's
	message of "Mon, 23 Jun 2025 08:54:28 +0000")
References: <20250619075245.3272384-1-lizhijian@fujitsu.com>
	<87ldpn2afw.fsf@DESKTOP-5N7EMDA>
	<47f42c60-9752-4bc6-9079-627b6e0b9cfc@fujitsu.com>
Date: Tue, 24 Jun 2025 10:46:44 +0800
Message-ID: <87ms9xonzf.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

"Zhijian Li (Fujitsu)" <lizhijian@fujitsu.com> writes:

> On 20/06/2025 14:28, Huang, Ying wrote:
>> Li Zhijian <lizhijian@fujitsu.com> writes:
>> 
>>> Goto-san reported confusing pgpromote statistics where
>>> the pgpromote_success count significantly exceeded pgpromote_candidate.
>>> The issue manifests under specific memory pressure conditions:
>>> when top-tier memory (DRAM) is exhausted by memhog and allocation begins
>>> in lower-tier memory (CXL). After terminating memhog, the stats show:
>> 
>> The above description is confusing.  The page promotion occurs when the
>> size of the top-tier free space is large enough (after killing the
>> memhog above).  The accessed lower-tier memory will be promoted upon
>> accessing to take full advantage of the more expensive top-tier memory.
>
> Yeah, that's what the promotion does.
>
> Let's clarify the reproducer steps specifically(thanks Goto-san for the reproducer):
> On a system with three nodes (nodes 0-1: DRAM 4GB, node 2: NVDIMM 4GB):
>
> # Enable demotion only
> echo 1 > /sys/kernel/mm/numa/demotion_enabled
> numactl -m 0-1 memhog -r200 3500M >/dev/null &
> pid=$!
> sleep 2
> numactl memhog -r100 2500M >/dev/null &
> sleep 10
> kill -9 $pid
> # Enable promotion
> echo 2 > /proc/sys/kernel/numa_balancing
>
> # After a few seconds, we observe `pgpromote_candidate < pgpromote_success`
>
> In this scenario, after terminating the first memhog, the conditions
> for pgdat_free_space_enough() are quickly met, triggering promotion.
> However, these migrated pages are only accounted for in PGPROMOTE_SUCCESS, not in PGPROMOTE_CANDIDATE.

Yes.  This is the expected behavior of current implementation.

>
>> 
>>> $ grep -e pgpromote /proc/vmstat
>>> pgpromote_success 2579
>>> pgpromote_candidate 1
>>>
>>> This update increments PGPROMOTE_CANDIDATE within the free space branch
>>> when a promotion decision is made, which may alter the mechanism of the
>>> rate limit. Consequently, it becomes easier to reach the rate limit than
>>> it was previously.
>>>
>>> For example:
>>> Rate Limit = 100 pages/sec
>>> Scenario:
>>>    T0: 90 free-space migrations
>>>    T0+100ms: 20-page migration request
>>>
>>> Before:
>>>    Rate limit is *not* reached: 0 + 20 = 20 < 100
>>>    PGPROMOTE_CANDIDATE: 20
>>> After:
>>>    Rate limit is reached: 90 + 20 = 110 > 100
>>>    PGPROMOTE_CANDIDATE: 110
>> 
>> Yes.  The rate limit will be influenced by the change.  So, more tests
>> may be needed to verify it will not incurs regressions.
>
>
> Testing this might be challenging due to workload dependencies. Do you
> have any recommended workloads for evaluation?

Some in-memory database should be good workloads, for example, redis, etc.

> Alternatively, could we could rely on the LKP project for impact assessment(Current patch has not really tested
> by LKP due to a compiling error, I will post a V2 soon).

LKP has some basic workload to test this, for example, pmbench with
Gauss-ih access pattern.

> However, regarding the rate limit change itself, I consider this patch
> logically correct. As stated in the numa_promotion_rate_limit()
> comment:
>> "For memory tiering mode, too high promotion/demotion throughput may hurt application latency."
> It seems there is no justification for excluding
> pgdat_free_space_enough() triggered promotions from the rate limiting
> mechanism.

In fact, we don't rate limit promotion if there are enough free space on
fast memory to fill the fast memory quickly.  I think that it's
necessary to prevent the fast memory from under-utilized ASAP.

>
>
>> 
>>>
>>> Reported-by: Yasunori Gotou (Fujitsu) <y-goto@fujitsu.com>
>>> Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>

[snip]

---
Best Regards,
Huang, Ying
