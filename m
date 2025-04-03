Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F62A13632B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 01:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743644179; cv=none; b=ZF0pXR1C3SxGTfZCvxTwCZUTHGz/768rdLZyLVvC+cCvEcfvDT4LCFYvaQNjdSfGSZeDBCBk+AS4/ql934Xhd5rXYA7Z+85R4oeZrAVobAgaB4RqqzSPq8ofYEUoSh5qh0Lpox4SXWx9e4PlkXi0uTq/oBfcRbzA0HjUnSmLwi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743644179; c=relaxed/simple;
	bh=9Z4dTyXsIEctgnvkm2Bsq46/YUdU6HnzVZmX1dguXSA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pMPdgeHFVLE22NrzAjRECP5ZnhIQoGCwo7Uuv3N/wmdXIbDzFBNJz2p5Tz+tuH3Oa6Karta440m6sIB55XrlEILKSNyg2RzdRbB48btSWM18DWZVfsAYj84KqzuMJ2y4nGxgXLb0HQI9WH1D3t2sFkhMGJ1gXPjvvC8Bz5+Nh6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=a8wiqEfr; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="a8wiqEfr"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1743644168; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=4zuhH53JmwK3MjZjhc7ETdHqf8vx/j+8xmJK3JZE744=;
	b=a8wiqEfrAlv71wFb97c8PXAC15yUbNSTQS74lVYRQtIgKYXLd1/4QgZPSMeaxSwmr7t7vuBrO0cpbiPUpf+0EY1fffUlV+BEuK/hcbpuUjEFMZqfFSUJkX435qNfrocJ74JhMkdD8GnhEbdn1udoSLsx8jFaDvAqC04f5eonv6c=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WUXH76._1743644166 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 03 Apr 2025 09:36:07 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Nikhil Dhama <nikhil.dhama@amd.com>
Cc: <akpm@linux-foundation.org>,  <bharata@amd.com>,
  <huang.ying.caritas@gmail.com>,  <linux-kernel@vger.kernel.org>,
  <linux-mm@kvack.org>,  <mgorman@techsingularity.net>,
  <raghavendra.kodsarathimmappa@amd.com>,  <oe-lkp@lists.linux.dev>,
  <lkp@intel.com>
Subject: Re: [PATCH] mm: pcp: scale batch to reduce number of high order pcp
 flushes on deallocation
In-Reply-To: <20250401135638.25436-1-nikhil.dhama@amd.com> (Nikhil Dhama's
	message of "Tue, 1 Apr 2025 19:26:38 +0530")
References: <202503312148.c74b0351-lkp@intel.com>
	<20250401135638.25436-1-nikhil.dhama@amd.com>
Date: Thu, 03 Apr 2025 09:36:14 +0800
Message-ID: <875xjmuiup.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Nikhil Dhama <nikhil.dhama@amd.com> writes:

> On 3/30/2025 12:22 PM, Huang, Ying wrote:
>
>>
>> Hi, Nikhil,
>>
>> Nikhil Dhama <nikhil.dhama@amd.com> writes:
>>
>>> In old pcp design, pcp->free_factor gets incremented in nr_pcp_free()
>>> which is invoked by free_pcppages_bulk(). So, it used to increase
>>> free_factor by 1 only when we try to reduce the size of pcp list or
>>> flush for high order.
>>> and free_high used to trigger only for order > 0 and order <
>>> costly_order and free_factor > 0.
>>>
>>> and free_factor used to scale down by a factor of 2 on every successful
>>> allocation.
>>>
>>> for iperf3 I noticed that with older design in kernel v6.6, pcp list was
>>> drained mostly when pcp->count > high (more often when count goes above
>>> 530). and most of the time free_factor was 0, triggering very few
>>> high order flushes.
>>>
>>> Whereas in the current design, free_factor is changed to free_count to keep
>>> track of the number of pages freed contiguously,
>>> and with this design for iperf3, pcp list is getting flushed more
>>> frequently because free_high heuristics is triggered more often now.
>>>
>>> In current design, free_count is incremented on every deallocation,
>>> irrespective of whether pcp list was reduced or not. And logic to
>>> trigger free_high is if free_count goes above batch (which is 63) and
>>> there are two contiguous page free without any allocation.
>>> (and with cache slice optimisation).
>>>
>>> With this design, I observed that high order pcp list is drained as soon
>>> as both count and free_count goes about 63.
>>>
>>> and due to this more aggressive high order flushing, applications
>>> doing contiguous high order allocation will require to go to global list
>>> more frequently.
>>>
>>> On a 2-node AMD machine with 384 vCPUs on each node,
>>> connected via Mellonox connectX-7, I am seeing a ~30% performance
>>> reduction if we scale number of iperf3 client/server pairs from 32 to 64.
>>>
>>> So, though this new design reduced the time to detect high order flushes,
>>> but for application which are allocating high order pages more
>>> frequently it may be flushing the high order list pre-maturely.
>>> This motivates towards tuning on how late or early we should flush
>>> high order lists.
>>>
>>> for free_high heuristics. I tried to scale batch and tune it,
>>> which will delay the free_high flushes.
>>>
>>>
>>>                       score   # free_high
>>> -----------           -----   -----------
>>> v6.6 (base)           100             4
>>> v6.12 (batch*1)        69           170
>>> batch*2                69           150
>>> batch*4                74           101
>>> batch*5               100            53
>>> batch*6               100            36
>>> batch*8               100             3
>>>
>>> scaling batch for free_high heuristics with a factor of 5 or above restores
>>> the performance, as it is reducing the number of high order flushes.
>>>
>>> On 2-node AMD server with 384 vCPUs each,score for other benchmarks with
>>> patch v2 along with iperf3 are as follows:
>>
>> Em..., IIUC, this may disable the free_high optimizations.  free_high
>> optimization is introduced by Mel Gorman in commit f26b3fa04611
>> ("mm/page_alloc: limit number of high-order pages on PCP during bulk
>> free").  So, this may trigger regression for the workloads in the
>> commit.  Can you try it too?
>>
>
> Hi, I ran netperf-tcp as in commit f26b3fa04611 ("mm/page_alloc: limit 
> number of high-order pages on PCP during bulk free"),
>
> On a 2-node AMD server with 384 vCPUs, results I observed are as follows:
>
>                                   6.12                     6.12
>                                vanilla   freehigh-heuristicsopt
> Hmean     64         732.14 (   0.00%)        736.90 (   0.65%)
> Hmean     128       1417.46 (   0.00%)       1421.54 (   0.29%)
> Hmean     256       2679.67 (   0.00%)       2689.68 (   0.37%)
> Hmean     1024      8328.52 (   0.00%)       8413.94 (   1.03%)
> Hmean     2048     12716.98 (   0.00%)      12838.94 (   0.96%)
> Hmean     3312     15787.79 (   0.00%)      15822.40 (   0.22%)
> Hmean     4096     17311.91 (   0.00%)      17328.74 (   0.10%)
> Hmean     8192     20310.73 (   0.00%)      20447.12 (   0.67%)
>
> It is not regressing for netperf-tcp. 

Thanks a lot for your data!

Think about this again.  Compared with the pcp->free_factor solution,
the pcp->free_count solution will trigger free_high heuristics more
early, this causes performance regression in your workloads.  So, it's
reasonable to raise the bar to trigger free_high.  And, it's also
reasonable to use a stricter threshold, as you have done in this patch.
However, "5 * batch" appears too magic and adapt to one type of machine.

Let's step back to do some analysis.  In the original pcp->free_factor
solution, free_high is triggered for contiguous freeing with size
ranging from "batch" to "pcp->high + batch".  So, the average value is
about "batch + pcp->high / 2".  While in the pcp->free_count solution,
free_high will be triggered for contiguous freeing with size "batch".
So, to restore the original behavior, it seems that we can use the
threshold "batch + pcp->high_min / 2".  Do you think that this is
reasonable?  If so, can you give it a try?

---
Best Regards,
Huang, Ying
