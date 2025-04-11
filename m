Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA3818052
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 02:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744337828; cv=none; b=MhG0NJ5dIbXia/x9KBcHjsQwtaOUUm/WaeK4rnVwQmzx54/9u+zuBUC8q74ewJkG/nZYGtOmQqHJigR/K37bZbAADN5FWt5h2DZDBAmlsa6jSFIZ+mOIm150CXmR3uvmQyyIh5bTvQDPhBk+tzJV/leyQtzOULi+G87uqfDFwB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744337828; c=relaxed/simple;
	bh=hYaBJIN7KL0pNti5XY4bYbN6SWifMw0J1ZtznYwvdwE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oGmLpJV+c+KALubhqcgOa8zvgbsj7Kd7lfc+5g5sJhE7wSZGFsuOtcU645b1LiCEx4+/0whubJWAlHLw97LRA+oqv7Ull1ytzSEavprGWk8y90ae/pIO2td5BwA3vLmELJask5rPjqIGjiNhaDbaaCMRX6Aj36+GPU43hKTg0Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=T/X0O9U+; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="T/X0O9U+"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744337815; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=cxljmE/yofVW+Uo++SXPrG3WA9fAaQSkQEVDTJyt6tQ=;
	b=T/X0O9U+sAMjBYe9VpBwtyUXOhZv6uKvIfLhCNuy6aoem3FP5B0ZQtexQStSdGLmKpWwv1y/zeye9pZAlrKyj3DVFbDr1EOUgS4zvfUE6cRIp3khycFZP47zYe0B0FpD/Yg0PKBoJobC637e+N8eVD7CDrv60u4c6RbjdRcQnAg=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WWRGYin_1744337814 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 11 Apr 2025 10:16:55 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Nikhil Dhama <nikhil.dhama@amd.com>
Cc: <akpm@linux-foundation.org>,  <bharata@amd.com>,
  <raghavendra.kodsarathimmappa@amd.com>,  <oe-lkp@lists.linux.dev>,
  <lkp@intel.com>,  Huang Ying <huang.ying.caritas@gmail.com>,
  <linux-mm@kvack.org>,  <linux-kernel@vger.kernel.org>,  Mel Gorman
 <mgorman@techsingularity.net>
Subject: Re: [PATCH v3] mm: pcp: increase pcp->free_count threshold to
 trigger free_high
In-Reply-To: <20250407105219.55351-1-nikhil.dhama@amd.com> (Nikhil Dhama's
	message of "Mon, 7 Apr 2025 16:22:19 +0530")
References: <20250407105219.55351-1-nikhil.dhama@amd.com>
Date: Fri, 11 Apr 2025 10:16:54 +0800
Message-ID: <87mscn8msp.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Hi, Nikhil,

Sorry for late reply.

Nikhil Dhama <nikhil.dhama@amd.com> writes:

> In old pcp design, pcp->free_factor gets incremented in nr_pcp_free()
> which is invoked by free_pcppages_bulk(). So, it used to increase
> free_factor by 1 only when we try to reduce the size of pcp list or
> flush for high order, and free_high used to trigger only 
> for order > 0 and order < costly_order and pcp->free_factor > 0.
>
> For iperf3 I noticed that with older design in kernel v6.6, pcp list was
> drained mostly when pcp->count > high (more often when count goes above
> 530). and most of the time pcp->free_factor was 0, triggering very few
> high order flushes.
>
> But this is changed in the current design, introduced in commit 6ccdcb6d3a74 
> ("mm, pcp: reduce detecting time of consecutive high order page freeing"), 
> where pcp->free_factor is changed to pcp->free_count to keep track of the 
> number of pages freed contiguously. In this design, pcp->free_count is 
> incremented on every deallocation, irrespective of whether pcp list was 
> reduced or not. And logic to trigger free_high is if pcp->free_count goes 
> above batch (which is 63) and there are two contiguous page free without 
> any allocation.

The design changes because pcp->high can become much higher than that
before it.  This makes it much harder to trigger free_high, which causes
some performance regressions too.

> With this design, for iperf3, pcp list is getting flushed more frequently 
> because free_high heuristics is triggered more often now. I observed that 
> high order pcp list is drained as soon as both count and free_count goes 
> above 63.
>
> Due to this more aggressive high order flushing, applications
> doing contiguous high order allocation will require to go to global list
> more frequently.
>
> On a 2-node AMD machine with 384 vCPUs on each node,
> connected via Mellonox connectX-7, I am seeing a ~30% performance
> reduction if we scale number of iperf3 client/server pairs from 32 to 64.
>
> Though this new design reduced the time to detect high order flushes,
> but for application which are allocating high order pages more
> frequently it may be flushing the high order list pre-maturely.
> This motivates towards tuning on how late or early we should flush
> high order lists. 
>
> So, in this patch, we increased the pcp->free_count threshold to 
> trigger free_high from "batch" to "batch + pcp->high_min / 2". 
> This new threshold keeps high order pages in pcp list for a 
> longer duration which can help the application doing high order
> allocations frequently.

IIUC, we restore the original behavior with "batch + pcp->high / 2" as
in my analysis in

https://lore.kernel.org/all/875xjmuiup.fsf@DESKTOP-5N7EMDA/

If you think my analysis is correct, can you add that in patch
description too?  This makes it easier for people to know why the code
looks this way.

> With this patch performace to Iperf3 is restored and 
> score for other benchmarks on the same machine are as follows:
>
> 		      iperf3    lmbench3        netperf         kbuild
>                                (AF_UNIX)   (SCTP_STREAM_MANY)
>                      -------   ---------   -----------------    ------
> v6.6  vanilla (base)    100          100              100          100
> v6.12 vanilla            69          113             98.5         98.8
> v6.12 + this patch      100        110.3            100.2         99.3
>
>
> netperf-tcp:
>
>                                   6.12                      6.12
>                                vanilla    	      this_patch
> Hmean     64         732.14 (   0.00%)         730.45 (  -0.23%)
> Hmean     128       1417.46 (   0.00%)        1419.44 (   0.14%)
> Hmean     256       2679.67 (   0.00%)        2676.45 (  -0.12%)
> Hmean     1024      8328.52 (   0.00%)        8339.34 (   0.13%)
> Hmean     2048     12716.98 (   0.00%)       12743.68 (   0.21%)
> Hmean     3312     15787.79 (   0.00%)       15887.25 (   0.63%)
> Hmean     4096     17311.91 (   0.00%)       17332.68 (   0.12%)
> Hmean     8192     20310.73 (   0.00%)       20465.09 (   0.76%)
>
> Fixes: 6ccdcb6d3a74 ("mm, pcp: reduce detecting time of consecutive high order page freeing")
>
> Signed-off-by: Nikhil Dhama <nikhil.dhama@amd.com>
> Suggested-by: Huang Ying <ying.huang@linux.alibaba.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Huang Ying <huang.ying.caritas@gmail.com>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Mel Gorman <mgorman@techsingularity.net>
>
> ---
>  v1: https://lore.kernel.org/linux-mm/20250107091724.35287-1-nikhil.dhama@amd.com/
>  v2: https://lore.kernel.org/linux-mm/20250325171915.14384-1-nikhil.dhama@amd.com/
>
>  mm/page_alloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index b6958333054d..569dcf1f731f 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -2617,7 +2617,7 @@ static void free_unref_page_commit(struct zone *zone, struct per_cpu_pages *pcp,
>  	 * stops will be drained from vmstat refresh context.
>  	 */
>  	if (order && order <= PAGE_ALLOC_COSTLY_ORDER) {
> -		free_high = (pcp->free_count >= batch &&
> +		free_high = (pcp->free_count >= (batch + pcp->high_min / 2) &&
>  			     (pcp->flags & PCPF_PREV_FREE_HIGH_ORDER) &&
>  			     (!(pcp->flags & PCPF_FREE_HIGH_BATCH) ||
>  			      pcp->count >= READ_ONCE(batch)));

---
Best Regards,
Huang, Ying
