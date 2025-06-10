Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFB828C027
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547097; cv=none; b=pFFUh9DwcbFiDe6e+xh6g8Jb4T5qpGacil9YLAnT4W8ed6fHmTvsmmYN3sUPZwirrD6KXVMeyTktwbeX89nFRPu20/Q3ZpweNcGQIyOr5RTVZZh1YHCZrANqeiFYp//x7imKmKok4K+YIIf14TmA1n5jkryn+UZx3ufHPduJXJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547097; c=relaxed/simple;
	bh=xVvYGj/4aRvnLmmrs85lDGnfcqRrB3pQlH8CWU0aPSg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=O9OIpxJ096fxjbT1/TO/2YaUdWXoZZ+1MX3jYqIEXSVwri+6euR3h8yEIh3E3+kCwoUDO9TKkuD6Ax2WL8TTmWFQXD1m3HpX2pvRD4HpiGEG2CDtDYh7PMrtFt9nfL0TQPIwa7iB2/U57BhALiPmHoGdzrHTA+0+zxPlqxWuiSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bGjlW1z1DzRk7K;
	Tue, 10 Jun 2025 17:13:59 +0800 (CST)
Received: from kwepemg100017.china.huawei.com (unknown [7.202.181.58])
	by mail.maildlp.com (Postfix) with ESMTPS id 08D72180087;
	Tue, 10 Jun 2025 17:18:12 +0800 (CST)
Received: from [10.174.178.114] (10.174.178.114) by
 kwepemg100017.china.huawei.com (7.202.181.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 10 Jun 2025 17:18:11 +0800
Message-ID: <7691fac7-f569-4fc2-9d0e-f7dad4139261@huawei.com>
Date: Tue, 10 Jun 2025 17:18:10 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: mawupeng <mawupeng1@huawei.com>
Subject: Re: [RFC PATCH] mm: Drain PCP during direct reclaim
To: <hannes@cmpxchg.org>
CC: <mawupeng1@huawei.com>, <akpm@linux-foundation.org>, <vbabka@suse.cz>,
	<surenb@google.com>, <jackmanb@google.com>, <ziy@nvidia.com>,
	<wangkefeng.wang@huawei.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>
References: <20250606065930.3535912-1-mawupeng1@huawei.com>
 <20250606111953.GB1118@cmpxchg.org>
In-Reply-To: <20250606111953.GB1118@cmpxchg.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemg100017.china.huawei.com (7.202.181.58)



On 2025/6/6 19:19, Johannes Weiner wrote:
> On Fri, Jun 06, 2025 at 02:59:30PM +0800, Wupeng Ma wrote:
>> Memory retained in Per-CPU Pages (PCP) caches can prevent hugepage
>> allocations from succeeding despite sufficient free system memory. This
>> occurs because:
>> 1. Hugepage allocations don't actively trigger PCP draining
>> 2. Direct reclaim path fails to trigger drain_all_pages() when:
>>    a) All zone pages are free/hugetlb (!did_some_progress)
>>    b) Compaction skips due to costly order watermarks (COMPACT_SKIPPED)
> 
> This doesn't sound quite right. Direct reclaim skips when compaction
> is suitable. Compaction says COMPACT_SKIPPED when it *isn't* suitable.
> 
> So if direct reclaim didn't drain, presumably compaction ran but
> returned COMPLETE or PARTIAL_SKIPPED because the freelist checks in
> __compact_finished() never succeed due to the pcp?

Yes, compaction do run, however since all pages in this movable node
are free or in pcp. there is no way for compaction to reclaim a page.

> 
>> @@ -4137,28 +4137,22 @@ __alloc_pages_direct_reclaim(gfp_t gfp_mask, unsigned int order,
>>  {
>>  	struct page *page = NULL;
>>  	unsigned long pflags;
>> -	bool drained = false;
>>  
>>  	psi_memstall_enter(&pflags);
>>  	*did_some_progress = __perform_reclaim(gfp_mask, order, ac);
>> -	if (unlikely(!(*did_some_progress)))
>> -		goto out;
>> -
>> -retry:
>> -	page = get_page_from_freelist(gfp_mask, order, alloc_flags, ac);
>> +	if (likely(*did_some_progress))
>> +		page = get_page_from_freelist(gfp_mask, order, alloc_flags, ac);
>>  
>>  	/*
>>  	 * If an allocation failed after direct reclaim, it could be because
>>  	 * pages are pinned on the per-cpu lists or in high alloc reserves.
>>  	 * Shrink them and try again
>>  	 */
>> -	if (!page && !drained) {
>> +	if (!page) {
>>  		unreserve_highatomic_pageblock(ac, false);
>>  		drain_all_pages(NULL);
>> -		drained = true;
>> -		goto retry;
>> +		page = get_page_from_freelist(gfp_mask, order, alloc_flags, ac);
> 
> This seems like the wrong place to fix the issue.
> 
> Kcompactd has a drain_all_pages() call. Move that to compact_zone(),
> so that it also applies to the try_to_compact_pages() path?

Since there is no pages isolated during isolate_migratepages(), it is
strange to drain_pcp here?






