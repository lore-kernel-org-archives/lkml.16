Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FF827CCFC
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 06:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744352156; cv=none; b=RYkKwOAj0eK+dzkCVifcOkwqTUjf0dTvActdn/Kf6JsSuTJcHTN2wZNi7PCeo8RY3H1FsQrwgaFVe04V83wLbvBR3REUCcI/mPPxDl/+o6SwCw1W7C05LHSoGwSfZlswoD3k+tn61TfbgP737VMR/MZmXSmrnHwJcz8W0T9whgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744352156; c=relaxed/simple;
	bh=WEpiHiznWpAqCg0Q4zJ7VdWdknAkd3kpvJJ/H9iP7MM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Q4IVyjWfExGiScHtoHU+MA1Rw0aL9GzgDF0WL9+wV7KcJP91mFnTaX4DXPQNG8dIMcESUIx1SBeMNIoIIuORClrRRzQiv3ex4HfldTo2NNe8VdUQ2n9G3Mo7q+h00tTjwiO6NiGnJCU+UxulDeBAEts7kjQwvMJ2LYK1MUdtlcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=JRWukqIf; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="JRWukqIf"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744352144; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=S0VfXWGHPH5LSwgQh/k4+cmjq4OOTI5xXI/EGgIhxWw=;
	b=JRWukqIfPp2EPiUgQaPgx1elazUqHDNJIsVpS2VvAZrpqAawmHZntzUNAmKRiwWE4LIS8eM/r14JvTlgCSY7HxER7kv4ihbxDgYawNdiid3OrN/VdaxFuKRQJ9gRpBTctKDf8dNp7JR9Fy+NKZ8WHQ1xef3HQplL3wRmwC4IT38=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WWSVhJv_1744352142 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 11 Apr 2025 14:15:43 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Raghavendra K T <raghavendra.kt@amd.com>, Nikhil Dhama
 <nikhil.dhama@amd.com>
Cc: akpm@linux-foundation.org,  bharata@amd.com,
  raghavendra.kodsarathimmappa@amd.com,  oe-lkp@lists.linux.dev,
  lkp@intel.com,  Huang Ying <huang.ying.caritas@gmail.com>,
  linux-mm@kvack.org,  linux-kernel@vger.kernel.org,  Mel Gorman
 <mgorman@techsingularity.net>
Subject: Re: [PATCH v3] mm: pcp: increase pcp->free_count threshold to
 trigger free_high
In-Reply-To: <c8b2a3c9-2252-4c0a-85a9-26fa6b519757@amd.com> (Raghavendra
	K. T.'s message of "Fri, 11 Apr 2025 11:32:08 +0530")
References: <20250407105219.55351-1-nikhil.dhama@amd.com>
	<87mscn8msp.fsf@DESKTOP-5N7EMDA>
	<c8b2a3c9-2252-4c0a-85a9-26fa6b519757@amd.com>
Date: Fri, 11 Apr 2025 14:15:42 +0800
Message-ID: <87mscn5ilt.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Raghavendra K T <raghavendra.kt@amd.com> writes:

> On 4/11/2025 7:46 AM, Huang, Ying wrote:
>> Hi, Nikhil,
>> Sorry for late reply.
>> Nikhil Dhama <nikhil.dhama@amd.com> writes:
>> 
>>> In old pcp design, pcp->free_factor gets incremented in nr_pcp_free()
>>> which is invoked by free_pcppages_bulk(). So, it used to increase
>>> free_factor by 1 only when we try to reduce the size of pcp list or
>>> flush for high order, and free_high used to trigger only
>>> for order > 0 and order < costly_order and pcp->free_factor > 0.
>>>
>>> For iperf3 I noticed that with older design in kernel v6.6, pcp list was
>>> drained mostly when pcp->count > high (more often when count goes above
>>> 530). and most of the time pcp->free_factor was 0, triggering very few
>>> high order flushes.
>>>
>>> But this is changed in the current design, introduced in commit 6ccdcb6d3a74
>>> ("mm, pcp: reduce detecting time of consecutive high order page freeing"),
>>> where pcp->free_factor is changed to pcp->free_count to keep track of the
>>> number of pages freed contiguously. In this design, pcp->free_count is
>>> incremented on every deallocation, irrespective of whether pcp list was
>>> reduced or not. And logic to trigger free_high is if pcp->free_count goes
>>> above batch (which is 63) and there are two contiguous page free without
>>> any allocation.
>> The design changes because pcp->high can become much higher than
>> that
>> before it.  This makes it much harder to trigger free_high, which causes
>> some performance regressions too.
>> 
>>> With this design, for iperf3, pcp list is getting flushed more frequently
>>> because free_high heuristics is triggered more often now. I observed that
>>> high order pcp list is drained as soon as both count and free_count goes
>>> above 63.
>>>
>>> Due to this more aggressive high order flushing, applications
>>> doing contiguous high order allocation will require to go to global list
>>> more frequently.
>>>
>>> On a 2-node AMD machine with 384 vCPUs on each node,
>>> connected via Mellonox connectX-7, I am seeing a ~30% performance
>>> reduction if we scale number of iperf3 client/server pairs from 32 to 64.
>>>
>>> Though this new design reduced the time to detect high order flushes,
>>> but for application which are allocating high order pages more
>>> frequently it may be flushing the high order list pre-maturely.
>>> This motivates towards tuning on how late or early we should flush
>>> high order lists.
>>>
>>> So, in this patch, we increased the pcp->free_count threshold to
>>> trigger free_high from "batch" to "batch + pcp->high_min / 2".
>>> This new threshold keeps high order pages in pcp list for a
>>> longer duration which can help the application doing high order
>>> allocations frequently.
>> IIUC, we restore the original behavior with "batch + pcp->high / 2"
>> as
>> in my analysis in
>> https://lore.kernel.org/all/875xjmuiup.fsf@DESKTOP-5N7EMDA/
>> If you think my analysis is correct, can you add that in patch
>> description too?  This makes it easier for people to know why the code
>> looks this way.
>> 
>
> Yes. This makes sense. Andrew has already included the patch in mm tree.
>
> Nikhil,
>
> Could you please help with the updated write up based on Ying's
> suggestion assuming it works for Andrew?

Thanks!

Just send a updated version, Andrew will update the patch in mm tree
unless it has been merged by mm-stable.

---
Best Regards,
Huang, Ying
