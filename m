Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821971A9B24
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738915885; cv=none; b=HIg7MfnVqmnT5X0i8hIHPy+EMkzSlxb3n93n7strSIHKqxHw7nFuKHHBpJ5ylSUe6UY6NLtFjckx/K/xW91Rn1AkcgFz3P7t9XFRUcwz6JoUCpfvC/aSRGJUVB7vvqEeWDu71F6Ds+60sKdrr8jRBm3k7im/Tq0UCziphw/TYFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738915885; c=relaxed/simple;
	bh=RouE6emE/rjzrEAgIhsucJqSqBHtFMa2adnU0+jmGbQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K+gzyeMSNY94J+Bz/MsRxJx7MV6kF0UdtFIRBKF89PCUYjCf00ZlK/RUX4kEDtV9sqsiFJ3jZWWR5Nua63KNn9UkX26BQ0ckHCCfinHkJvMrDRIBOaQPM98Q0ThFaNpHp6AgzezkeRT9qB3UcBzdN9sCFXZ535j08+3zh2gLXtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=fEDTAXQJ; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="fEDTAXQJ"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1738915874; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=dVuULOgwJVVDB350O2198xhLn306zAjDe0As6X37muw=;
	b=fEDTAXQJJ9Nsn5ASx8wXw0oGcKc4z7WAzG4/ySqEMm1hjNJkotdigl1xWR/itjBRgpDd4sqcIbSUTqg9/z51Emp4PACF9GacGRd9CaaJhaaL1Hb4mvHZWBvLWssNGL/I8vnjjBnXVxFiOQOVWUDmpDAJx+qll8f/oXyB+Li+9vM=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WOyo3Fx_1738915844 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 07 Feb 2025 16:11:11 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: SeongJae Park <sj@kernel.org>, Bharata B Rao <bharata@amd.com>
Cc: Raghavendra K T <raghavendra.kt@amd.com>,  linux-mm@kvack.org,
  akpm@linux-foundation.org,  lsf-pc@lists.linux-foundation.org,
  gourry@gourry.net,  nehagholkar@meta.com,  abhishekd@meta.com,
  nphamcs@gmail.com,  hannes@cmpxchg.org,  feng.tang@intel.com,
  kbusch@meta.com,  Hasan.Maruf@amd.com,  david@redhat.com,
  willy@infradead.org,  k.shutemov@gmail.com,  mgorman@techsingularity.net,
  vbabka@suse.cz,  hughd@google.com,  rientjes@google.com,
  shy828301@gmail.com,  liam.howlett@oracle.com,  peterz@infradead.org,
  mingo@redhat.com,  nadav.amit@gmail.com,  shivankg@amd.com,
  ziy@nvidia.com,  jhubbard@nvidia.com,  AneeshKumar.KizhakeVeetil@arm.com,
  linux-kernel@vger.kernel.org,  jon.grimm@amd.com,
  santosh.shukla@amd.com,  Michael.Day@amd.com,  riel@surriel.com,
  weixugc@google.com,  leesuyeon0506@gmail.com,  honggyu.kim@sk.com,
  leillc@google.com,  kmanaouil.dev@gmail.com,  rppt@kernel.org,
  dave.hansen@intel.com
Subject: Re: [LSF/MM/BPF TOPIC] Overhauling hot page detection and promotion
 based on PTE A bit scanning
In-Reply-To: <20250127183403.67757-1-sj@kernel.org> (SeongJae Park's message
	of "Mon, 27 Jan 2025 10:34:03 -0800")
References: <20250127183403.67757-1-sj@kernel.org>
Date: Fri, 07 Feb 2025 16:10:47 +0800
Message-ID: <87ikpmgooo.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

SeongJae Park <sj@kernel.org> writes:

> On Mon, 27 Jan 2025 10:41:07 +0530 Bharata B Rao <bharata@amd.com> wrote:
>
>> On 26-Jan-25 7:57 AM, Huang, Ying wrote:
>> > Hi, Raghavendra,
>> > 
>> > Raghavendra K T <raghavendra.kt@amd.com> writes:
>> > 
>> >> Bharata and I would like to propose the following topic for LSFMM.
>> >>
>> >> Topic: Overhauling hot page detection and promotion based on PTE A bit scanning.
>> >>   
>> >> In the Linux kernel, hot page information can potentially be obtained from
>> >> multiple sources:
>> >>   
>> >> a. PROT_NONE faults (NUMA balancing)
>> >> b. PTE Access bit (LRU scanning)
>> >> c. Hardware provided page hotness info (like AMD IBS)
>> >>   
>> >> This information is further used to migrate (or promote) pages from slow memory
>> >> tier to top tier to increase performance.
>> >>
>> >> In the current hot page promotion mechanism, all the activities including the
>> >> process address space scanning, NUMA hint fault handling and page migration are
>> >> performed in the process context. i.e., scanning overhead is borne by the
>> >> applications.
>> >>   
>> >> I had recently posted a patch [1] to improve this in the context of slow-tier
>> >> page promotion. Here, Scanning is done by a global kernel thread which routinely
>> >> scans all the processes' address spaces and checks for accesses by reading the
>> >> PTE A bit. The hot pages thus identified are maintained in list and subsequently
>> >> are promoted to a default top-tier node. Thus, the approach pushes overhead of
>> >> scanning, NUMA hint faults and migrations off from process context.
>> > 
>> > This has been discussed before too.  For example, in the following thread
>> > 
>> > https://lore.kernel.org/all/20200417100633.GU20730@hirez.programming.kicks-ass.net/T/
>> 
>> Thanks for pointing to this discussion.
>> 
>> > 
>> > The drawbacks of asynchronous scanning including
>> > 
>> > - The CPU cycles used are not charged properly
>> > 
>> > - There may be no idle CPU cycles to use
>> > 
>> > - The scanning CPU may be not near the workload CPUs enough
>> > 
>> > It's better to involve Mel and Peter in the discussion for this.
>> 
>> They are CC'ed in this thread and hopefully have insights to share.
>> 
>> Charging CPU cycles to the right process has been brought up in other 
>> similar contexts. Recent one is from page migration batching and using 
>> multiple threads for migration - 
>> https://lore.kernel.org/all/CAHbLzkpoKP0fVZP5b10wdzAMDLWysDy7oH0qaUssiUXj80R6bw@mail.gmail.com/
>> 
>> Does it make sense to treat hot page promotion from slow tiers 
>> differently compared to locality based balancing? I mean couldn't the 
>> charging of this async thread be similar to the cycles spent by other 
>> system threads like kcompactd and khugepaged?
>
> I'm up to this idea.
>
> I agree the fairness is a thing that we need to aware of.  But IMHO, it is
> something that the async approach can further be advanced for, not a strict
> blocker for now.

Personally, I have no objection to async operations in general.
However, we may need to find some way to control these async operations
instead of adding more and more background kthreads blindly.  How to
charge and constrain the resources used by these async operations is
important too.  For example, some users may want to bind some async
operations on some CPUs.

IMHO, we should think about the requirements and possible solutions
instead of ignoring the issues.

>> 
>> > 
>> >> The topic was presented in the MM alignment session hosted by David Rientjes [2].
>> >> The topic also finds a mention in S J Park's LSFMM proposal [3].
>> >>   
>> >> Here is the list of potential discussion points:
>> >> 1. Other improvements and enhancements to PTE A bit scanning approach. Use of
>> >> multiple kernel threads, throttling improvements, promotion policies, per-process
>> >> opt-in via prctl, virtual vs physical address based scanning, tuning hot page
>> >> detection algorithm etc.
>> > 
>> > One drawback of physical address based scanning is that it's hard to
>> > apply some workload specific policy.  For example, if a low priority
>> > workload has many relatively hot pages, while a high priority workload
>> > has many relative warm (not so hot) pages.  We need to promote the warm
>> > pages in the high priority workload, while physcial address based
>> > scanning may report the hot pages in the low priority workload.  Right?
>> 
>> Correct. I wonder if DAMON has already devised a scheme to address this. SJ?
>
> Yes, I think DAMOS quotas and DAMOS filters can be used to address this issue.
>
> For this case, assuming each workload has its own cgroup, users can add a DAMOS
> scheme for promotion per workload.  The schemes will have different DAMOS
> quotas based on the workloads' priority.  The schemes will also be controlled
> to do the promotion for pages of the specific workloads using DAMOS filters.
>
> For example, below kdamond configuration can be used.
>
> # damo args damon \
> 	--damos_action migrate_hot 0 --damos_quotas 100ms 1G 1s 0% 100% 100% \
> 	--damos_filter reject none memcg /workloads/high-priority \
> 	\
> 	--damos_action migrate_hot 0 --damos_quotas 10ms 100M 1s 0% 100% 100% \
> 	--damos_filter reject none memcg /workloads/low-priority \
> 	--damos_nr_filters 1 1 --out kdamond.json
> # damo report damon --input_file ./kdamond.json --damon_params_omit_defaults
> kdamond 0
>     context 0
>         ops: paddr
>         target 0
>             region [4,294,967,296, 68,577,918,975) (59.868 GiB)
>         intervals: sample 5 ms, aggr 100 ms, update 1 s
>         nr_regions: [10, 1,000]
>         scheme 0
>             action: migrate_hot to node 0 per aggr interval
>             target access pattern
>                 sz: [0 B, max]
>                 nr_accesses: [0 %, 18,446,744,073,709,551,616 %]
>                 age: [0 ns, max]
>             quotas
>                 100 ms / 1024.000 MiB / 0 B per 1 s
>                 priority: sz 0 %, nr_accesses 100 %, age 100 %
>             filter 0
>                 reject none memcg /workloads/high-priority
>         scheme 1
>             action: migrate_hot to node 0 per aggr interval
>             target access pattern
>                 sz: [0 B, max]
>                 nr_accesses: [0 %, 18,446,744,073,709,551,616 %]
>                 age: [0 ns, max]
>             quotas
>                 10 ms / 100.000 MiB / 0 B per 1 s
>                 priority: sz 0 %, nr_accesses 100 %, age 100 %
>             filter 0
>                 reject none memcg /workloads/low-priority
>
> Please note that this is just one example based on existing DAMOS features.
> This may have drawbacks and future optimizations would be possible.

IIUC, this is something like,

physical address -> struct page -> cgroup -> per-cgroup hot threshold

this sounds good to me.  Thanks!

---
Best Regards,
Huang, Ying
