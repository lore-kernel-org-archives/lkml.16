Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1A3224AFB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744011492; cv=none; b=qKH6U7T204peqYY+PbCoiBkg6UUkvJYfDgylPo/ye5I53zp4yjSiFsy9Ck9Ubz8ynnd3wLa+r0Ahhrb5/v3VU8jMTQm88eumYXGQ3lExNPhOz/bBxfeMOYgCEslr0FoluO5XjBdR7Z9AtBaQRDlYfRZapuVHjz8i+Mtk21VueA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744011492; c=relaxed/simple;
	bh=ilz5/Is23/2Et0wJx3nSR2tMPcZiNpLCnMfguSiZ1Ik=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LFTdY5XWAR5O3F2RylQd0g4YUKJSzUcUYudhcyD1rhnKlQohVvCsTM41iUKGXaXYXmZF03TXGRZNovaGf1fI+wuzDgG5mpQlDjcXZ/lDRgWZXa4U3UIFPNB0GnO9w6rhs4X6VgTq+Gq+MNZnw3dMSMb2wdHSr6K+TeotaeHdrCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=QjlaFhHI; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="QjlaFhHI"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744011485; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=gYYSg5YwDogLH+IRS2vLAy217JvW0dvLBFZE5xtZqxk=;
	b=QjlaFhHIGPJ53A5zMFH2o6imbKbi0BcxkuDAgKIA1oyVf+YMsC0G4M7YPuTAKfqq5imedPy771ELrcOX0v4Xwv8mTRXNEjRoHULan7rRfa+7qn62IkCR2yWWOuRdKmYtPZ9ut9pZwxSyTKh3lQIi7C+HIEA3NMaPJi8J7Am9jEg=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WVqMIo9_1744011483 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Apr 2025 15:38:04 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Nikhil Dhama <nikhil.dhama@amd.com>
Cc: <akpm@linux-foundation.org>,  <bharata@amd.com>,
  <huang.ying.caritas@gmail.com>,  <linux-kernel@vger.kernel.org>,
  <linux-mm@kvack.org>,  <mgorman@techsingularity.net>,
  <raghavendra.kodsarathimmappa@amd.com>,  <oe-lkp@lists.linux.dev>,
  <lkp@intel.com>
Subject: Re: [PATCH] mm: pcp: scale batch to reduce number of high order pcp
 flushes on deallocation
In-Reply-To: <20250407063259.49271-1-nikhil.dhama@amd.com> (Nikhil Dhama's
	message of "Mon, 7 Apr 2025 12:02:59 +0530")
References: <875xjmuiup.fsf@DESKTOP-5N7EMDA>
	<20250407063259.49271-1-nikhil.dhama@amd.com>
Date: Mon, 07 Apr 2025 15:38:14 +0800
Message-ID: <87r024o1zt.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Nikhil Dhama <nikhil.dhama@amd.com> writes:

> On 4/3/2025 7:06 AM, Huang, Ying wrote:
>
>>
>> Nikhil Dhama <nikhil.dhama@amd.com> writes:
>>
>>> On 3/30/2025 12:22 PM, Huang, Ying wrote:
>>>
>>>>
>>>> Hi, Nikhil,
>>>>
>>>> Nikhil Dhama <nikhil.dhama@amd.com> writes:
>>>>
>>>>> In old pcp design, pcp->free_factor gets incremented in nr_pcp_free()
>>>>> which is invoked by free_pcppages_bulk(). So, it used to increase
>>>>> free_factor by 1 only when we try to reduce the size of pcp list or
>>>>> flush for high order.
>>>>> and free_high used to trigger only for order > 0 and order <
>>>>> costly_order and free_factor > 0.
>>>>>
>>>>> and free_factor used to scale down by a factor of 2 on every successful
>>>>> allocation.
>>>>>
>>>>> for iperf3 I noticed that with older design in kernel v6.6, pcp list was
>>>>> drained mostly when pcp->count > high (more often when count goes above
>>>>> 530). and most of the time free_factor was 0, triggering very few
>>>>> high order flushes.
>>>>>
>>>>> Whereas in the current design, free_factor is changed to free_count to keep
>>>>> track of the number of pages freed contiguously,
>>>>> and with this design for iperf3, pcp list is getting flushed more
>>>>> frequently because free_high heuristics is triggered more often now.
>>>>>
>>>>> In current design, free_count is incremented on every deallocation,
>>>>> irrespective of whether pcp list was reduced or not. And logic to
>>>>> trigger free_high is if free_count goes above batch (which is 63) and
>>>>> there are two contiguous page free without any allocation.
>>>>> (and with cache slice optimisation).
>>>>>
>>>>> With this design, I observed that high order pcp list is drained as soon
>>>>> as both count and free_count goes about 63.
>>>>>
>>>>> and due to this more aggressive high order flushing, applications
>>>>> doing contiguous high order allocation will require to go to global list
>>>>> more frequently.
>>>>>
>>>>> On a 2-node AMD machine with 384 vCPUs on each node,
>>>>> connected via Mellonox connectX-7, I am seeing a ~30% performance
>>>>> reduction if we scale number of iperf3 client/server pairs from 32 to 64.
>>>>>
>>>>> So, though this new design reduced the time to detect high order flushes,
>>>>> but for application which are allocating high order pages more
>>>>> frequently it may be flushing the high order list pre-maturely.
>>>>> This motivates towards tuning on how late or early we should flush
>>>>> high order lists.
>>>>>
>>>>> for free_high heuristics. I tried to scale batch and tune it,
>>>>> which will delay the free_high flushes.
>>>>>
>>>>>
>>>>>                       score   # free_high
>>>>> -----------           -----   -----------
>>>>> v6.6 (base)           100             4
>>>>> v6.12 (batch*1)        69           170
>>>>> batch*2                69           150
>>>>> batch*4                74           101
>>>>> batch*5               100            53
>>>>> batch*6               100            36
>>>>> batch*8               100             3
>>>>>
>>>>> scaling batch for free_high heuristics with a factor of 5 or above restores
>>>>> the performance, as it is reducing the number of high order flushes.
>>>>>
>>>>> On 2-node AMD server with 384 vCPUs each,score for other benchmarks with
>>>>> patch v2 along with iperf3 are as follows:
>>>>
>>>> Em..., IIUC, this may disable the free_high optimizations.  free_high
>>>> optimization is introduced by Mel Gorman in commit f26b3fa04611
>>>> ("mm/page_alloc: limit number of high-order pages on PCP during bulk
>>>> free").  So, this may trigger regression for the workloads in the
>>>> commit.  Can you try it too?
>>>>
>>>
>>> Hi, I ran netperf-tcp as in commit f26b3fa04611 ("mm/page_alloc: limit
>>> number of high-order pages on PCP during bulk free"),
>>>
>>> On a 2-node AMD server with 384 vCPUs, results I observed are as follows:
>>>
>>>                                   6.12                     6.12
>>>                                vanilla   freehigh-heuristicsopt
>>> Hmean     64         732.14 (   0.00%)        736.90 (   0.65%)
>>> Hmean     128       1417.46 (   0.00%)       1421.54 (   0.29%)
>>> Hmean     256       2679.67 (   0.00%)       2689.68 (   0.37%)
>>> Hmean     1024      8328.52 (   0.00%)       8413.94 (   1.03%)
>>> Hmean     2048     12716.98 (   0.00%)      12838.94 (   0.96%)
>>> Hmean     3312     15787.79 (   0.00%)      15822.40 (   0.22%)
>>> Hmean     4096     17311.91 (   0.00%)      17328.74 (   0.10%)
>>> Hmean     8192     20310.73 (   0.00%)      20447.12 (   0.67%)
>>>
>>> It is not regressing for netperf-tcp.
>>
>> Thanks a lot for your data!
>>
>> Think about this again.  Compared with the pcp->free_factor solution,
>> the pcp->free_count solution will trigger free_high heuristics more
>> early, this causes performance regression in your workloads.  So, it's
>> reasonable to raise the bar to trigger free_high.  And, it's also
>> reasonable to use a stricter threshold, as you have done in this patch.
>> However, "5 * batch" appears too magic and adapt to one type of machine.
>>
>> Let's step back to do some analysis.  In the original pcp->free_factor
>> solution, free_high is triggered for contiguous freeing with size
>> ranging from "batch" to "pcp->high + batch".  So, the average value is
>> about "batch + pcp->high / 2".  While in the pcp->free_count solution,
>> free_high will be triggered for contiguous freeing with size "batch".
>> So, to restore the original behavior, it seems that we can use the
>> threshold "batch + pcp->high_min / 2".  Do you think that this is
>> reasonable?  If so, can you give it a try?
>
> Hi, 
>
> I have tried your suggestion as setting threshold to "batch + pcp->high_min / 2",
> scores for different benchmarks on the same machine 
> (2-Node AMD server with 384 vCPUs each) are as follows:
>
>                       iperf3    lmbench3            netperf         kbuild
>                                (AF_UNIX)      (SCTP_STREAM_MANY)
>                      -------   ---------      -----------------     ------
> v6.6  vanilla (base)    100          100                  100          100
> v6.12 vanilla            69          113                 98.5         98.8
> v6.12 avg_threshold     100        110.3                100.2         99.3
>
> and for netperf-tcp, it is as follows:
>
>                                   6.12                     6.12
>                                vanilla   avg_free_high_threshold
> Hmean     64         732.14 (   0.00%)        730.45 (  -0.23%)
> Hmean     128       1417.46 (   0.00%)       1419.44 (   0.14%)
> Hmean     256       2679.67 (   0.00%)       2676.45 (  -0.12%)
> Hmean     1024      8328.52 (   0.00%)       8339.34 (   0.13%)
> Hmean     2048     12716.98 (   0.00%)      12743.68 (   0.21%)
> Hmean     3312     15787.79 (   0.00%)      15887.25 (   0.63%)
> Hmean     4096     17311.91 (   0.00%)      17332.68 (   0.12%)
> Hmean     8192     20310.73 (   0.00%)      20465.09 (   0.76%)

Thanks a lot for test and results!

It looks good to me.  Can you submit a formal patch?

---
Best Regards,
Huang, Ying
