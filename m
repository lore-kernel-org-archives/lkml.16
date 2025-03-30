Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AF9EEC8
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 06:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743317591; cv=none; b=eZhFd0FUWyMEofHrpXdd5Y1ReSw1/AwXuuBP6Uy40TFVPkltXJyQjHNmF29bN2JfjNusSoe9WwIxiygiweiFPvIi34lffYX/QDSPGF4YOBJQMOxKqXSqDbj7NOvoz+gmz+s9jnDkxH1VFfK1gZORHWIvFoJhzO+4hHeSfnuOUEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743317591; c=relaxed/simple;
	bh=Hzc8o3qzar0J8QvYkUe+xXnuNHPnaiJkn3uWv7tUhOo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XCVkSkuRR5l5+7OqAHrTOvb/NBBFYM5cWDGoK5acf1Ap0GdPQQgM7H/jA0CpLIA9pTawKNFB0qVdOHLONnz1gnL99qsZWghrfhludsg8IzzSxkRJ7G36MKfiPyE9FZfvStpl1vtoiRv0ta869IegTMDYnPczqQgZ7qFy/nV5M2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=nyVBaHU9; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="nyVBaHU9"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1743317578; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=kNdfZoUpFKB6YFxeh+rDzkVIdDXkzGcNrgN7Sp6e5qo=;
	b=nyVBaHU9hmtYewOV269qEvq1GXcG0P9zILNLdXSV8WebdILPwSMyuzsHRhULB/UZ3vOuHJSC72RkCiaPN2L+r4ovyzoa4iMY1a5Fsn2IW6yjpYVozlgztin5c1POWNOOoHBvv9VxKlG4jiKap/y2swv4/fP2RagCZa8ru98uZJ0=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WTLiftQ_1743317566 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 30 Mar 2025 14:52:58 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Nikhil Dhama <nikhil.dhama@amd.com>
Cc: <akpm@linux-foundation.org>,  Ying Huang <huang.ying.caritas@gmail.com>,
  <linux-mm@kvack.org>,  <linux-kernel@vger.kernel.org>,  Bharata B Rao
 <bharata@amd.com>,  Raghavendra <raghavendra.kodsarathimmappa@amd.com>,
 Mel Gorman <mgorman@techsingularity.net>
Subject: Re: [PATCH] mm: pcp: scale batch to reduce number of high order pcp
 flushes on deallocation
In-Reply-To: <20250325171915.14384-1-nikhil.dhama@amd.com> (Nikhil Dhama's
	message of "Tue, 25 Mar 2025 22:49:15 +0530")
References: <20250325171915.14384-1-nikhil.dhama@amd.com>
Date: Sun, 30 Mar 2025 14:52:46 +0800
Message-ID: <8734evf1s1.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Hi, Nikhil,

Nikhil Dhama <nikhil.dhama@amd.com> writes:

> In old pcp design, pcp->free_factor gets incremented in nr_pcp_free()
> which is invoked by free_pcppages_bulk(). So, it used to increase 
> free_factor by 1 only when we try to reduce the size of pcp list or
> flush for high order.
> and free_high used to trigger only for order > 0 and order <
> costly_order and free_factor > 0.
>   
> and free_factor used to scale down by a factor of 2 on every successful
> allocation. 
>
> for iperf3 I noticed that with older design in kernel v6.6, pcp list was
> drained mostly when pcp->count > high (more often when count goes above
> 530). and most of the time free_factor was 0, triggering very few 
> high order flushes.
>
> Whereas in the current design, free_factor is changed to free_count to keep
> track of the number of pages freed contiguously, 
> and with this design for iperf3, pcp list is getting flushed more 
> frequently because free_high heuristics is triggered more often now.
>
> In current design, free_count is incremented on every deallocation,
> irrespective of whether pcp list was reduced or not. And logic to
> trigger free_high is if free_count goes above batch (which is 63) and
> there are two contiguous page free without any allocation. 
> (and with cache slice optimisation).
>
> With this design, I observed that high order pcp list is drained as soon 
> as both count and free_count goes about 63.
>  
> and due to this more aggressive high order flushing, applications 
> doing contiguous high order allocation will require to go to global list
> more frequently.
>
> On a 2-node AMD machine with 384 vCPUs on each node, 
> connected via Mellonox connectX-7, I am seeing a ~30% performance 
> reduction if we scale number of iperf3 client/server pairs from 32 to 64. 
>
> So, though this new design reduced the time to detect high order flushes, 
> but for application which are allocating high order pages more
> frequently it may be flushing the high order list pre-maturely.
> This motivates towards tuning on how late or early we should flush
> high order lists.
>
> for free_high heuristics. I tried to scale batch and tune it, 
> which will delay the free_high flushes.
>
>
> 			score	# free_high
> -----------		-----	-----------
> v6.6 (base)		100	 	4
> v6.12 (batch*1)		 69	      170
> batch*2			 69	      150
> batch*4			 74	      101
> batch*5			100	       53
> batch*6			100	       36
> batch*8			100		3
>   
> scaling batch for free_high heuristics with a factor of 5 or above restores
> the performance, as it is reducing the number of high order flushes.
>
> On 2-node AMD server with 384 vCPUs each,score for other benchmarks with 
> patch v2 along with iperf3 are as follows:

Em..., IIUC, this may disable the free_high optimizations.  free_high
optimization is introduced by Mel Gorman in commit f26b3fa04611
("mm/page_alloc: limit number of high-order pages on PCP during bulk
free").  So, this may trigger regression for the workloads in the
commit.  Can you try it too?

>                      iperf3    lmbench3            netperf         kbuild
>                               (AF_UNIX)      (SCTP_STREAM_MANY)
>                     -------   ---------      -----------------     ------
> v6.6 (base)            100          100                  100          100
> v6.12                   69          113                 98.5         98.8
> v6.12 with patch       100        112.5                100.1         99.6 
>
> for network workloads, clients and server are running on different
> machines conneted via Mellanox Connect-7 NIC. 
>
> number of free_high:
> 		     iperf3    lmbench3            netperf         kbuild
>                               (AF_UNIX)      (SCTP_STREAM_MANY)
>                     -------   ---------      -----------------     ------
> v6.6 (base)              5          12                   6           2
> v6.12                  170          11                  92           2
> v6.12 with patch    	58          11                	34           2
>
>
> Signed-off-by: Nikhil Dhama <nikhil.dhama@amd.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Ying Huang <huang.ying.caritas@gmail.com>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Bharata B Rao <bharata@amd.com>
> Cc: Raghavendra <raghavendra.kodsarathimmappa@amd.com>
>
> ---
>  mm/page_alloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index b6958333054d..326d5fbae353 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -2617,7 +2617,7 @@ static void free_unref_page_commit(struct zone *zone, struct per_cpu_pages *pcp,
>  	 * stops will be drained from vmstat refresh context.
>  	 */
>  	if (order && order <= PAGE_ALLOC_COSTLY_ORDER) {
> -		free_high = (pcp->free_count >= batch &&
> +		free_high = (pcp->free_count >= (batch*5) &&
>  			     (pcp->flags & PCPF_PREV_FREE_HIGH_ORDER) &&
>  			     (!(pcp->flags & PCPF_FREE_HIGH_BATCH) ||
>  			      pcp->count >= READ_ONCE(batch)));

---
Best Regards,
Huang, Ying
