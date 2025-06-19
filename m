Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624803085D7
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750321757; cv=none; b=ArIUuIaaMgEnWUP23GizROr31mCbmeot0yWFlLu2+z0qbHeINE9VaaTQ59uFBtWv/s4FVQd03auDz1n6mSLL2GVrHDt/kMsYl3Mk8jASch0HRBsOfusbMtCu0hVoWWJo7YnoxDlbOF0XF3510/bs1quvJAfdFghlPgBriRmOOD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750321757; c=relaxed/simple;
	bh=8kp8MhtBooyZ24xJw3HE3NBv31unIexU5R/0rv70u4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sCUkj44zh+S+ARxtIveBShWXjfwtBzwslqJUnJauJx3QYYIQ44CbZJNWI1XH+ybMGabHiEElhOpQyO1FgpyYNOfcjjmnR9mjPbCnt6b/AtKdZHf5HNGCpmlASWrmv+Z7QIryomZzI/2obyPx08wXZW8CI3roIkRDPHQcNqCEjfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=K3VXHu30; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="K3VXHu30"
Message-ID: <fa3c7352-f089-4a7b-8d4b-f6d371c236ce@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750321752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LwqkJWv+ifVhzjp8MQr7Ddsa5ddsAXMB/QGydZH0ApY=;
	b=K3VXHu30ZHT9FCDaKQNMGBS0HsUIyVXQ3ojsfC/llhBDDhO5YmRJilmvtbxDn7tI2YHgza
	7NXVqzwdr5RZ5caKtFhe6dTZ131c57faBudgVlm5QaZXU1O7fDuW7zDudr70AQbr0i3P4+
	GgwbfK/SEsof8nJbFMT2aExpuKLKjVI=
Date: Thu, 19 Jun 2025 16:28:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] mm/rmap: Add NULL checks for rmap_walk_control callbacks
To: Dev Jain <dev.jain@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Ye Liu <liuye@kylinos.cn>, Xu Xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, Rik van Riel <riel@surriel.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250619075040.796047-1-ye.liu@linux.dev>
 <9454603f-c187-4386-8244-69f304197954@arm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ye Liu <ye.liu@linux.dev>
In-Reply-To: <9454603f-c187-4386-8244-69f304197954@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


Hi Lorenzo and Dev,

Thanks for your feedback. I understand all your points and will drop this patch.

Best regards,
Ye Liu

On 2025/6/19 16:17, Dev Jain wrote:
> 
> On 19/06/25 1:20 pm, Ye Liu wrote:
>> From: Ye Liu <liuye@kylinos.cn>
>>
>> Add NULL pointer checks for rmap_one callback in rmap_walk operations
>> to prevent potential NULL pointer dereferences. Also clean up some
>> code by removing redundant comments and caching folio_nr_pages().
>>
>> Signed-off-by: Ye Liu <liuye@kylinos.cn>
>> ---
> 
> Don't really see the point of this patch. The rmap_one call back will
> always be there as we need a way to define how to unmap/do the reverse
> map walk for one VMA at a time. And the folio_nr_pages() will probably
> get cached by the compiler anyways.
> 
>>   mm/ksm.c  |  2 +-
>>   mm/rmap.c | 14 +++++++-------
>>   2 files changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/mm/ksm.c b/mm/ksm.c
>> index 18b3690bb69a..22ad069d1860 100644
>> --- a/mm/ksm.c
>> +++ b/mm/ksm.c
>> @@ -3068,7 +3068,7 @@ void rmap_walk_ksm(struct folio *folio, struct rmap_walk_control *rwc)
>>               if (rwc->invalid_vma && rwc->invalid_vma(vma, rwc->arg))
>>                   continue;
>>   -            if (!rwc->rmap_one(folio, vma, addr, rwc->arg)) {
>> +            if (rwc->rmap_one && !rwc->rmap_one(folio, vma, addr, rwc->arg)) {
>>                   anon_vma_unlock_read(anon_vma);
>>                   return;
>>               }
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index fb63d9256f09..17d43d104a0d 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -1202,8 +1202,7 @@ int mapping_wrprotect_range(struct address_space *mapping, pgoff_t pgoff,
>>       if (!mapping)
>>           return 0;
>>   -    __rmap_walk_file(/* folio = */NULL, mapping, pgoff, nr_pages, &rwc,
>> -             /* locked = */false);
>> +    __rmap_walk_file(NULL, mapping, pgoff, nr_pages, &rwc, false);
>>         return state.cleaned;
>>   }
>> @@ -2806,6 +2805,7 @@ static void rmap_walk_anon(struct folio *folio,
>>       struct anon_vma *anon_vma;
>>       pgoff_t pgoff_start, pgoff_end;
>>       struct anon_vma_chain *avc;
>> +    unsigned long nr_pages;
>>         if (locked) {
>>           anon_vma = folio_anon_vma(folio);
>> @@ -2817,13 +2817,13 @@ static void rmap_walk_anon(struct folio *folio,
>>       if (!anon_vma)
>>           return;
>>   +    nr_pages = folio_nr_pages(folio);
>>       pgoff_start = folio_pgoff(folio);
>> -    pgoff_end = pgoff_start + folio_nr_pages(folio) - 1;
>> +    pgoff_end = pgoff_start + nr_pages - 1;
>>       anon_vma_interval_tree_foreach(avc, &anon_vma->rb_root,
>>               pgoff_start, pgoff_end) {
>>           struct vm_area_struct *vma = avc->vma;
>> -        unsigned long address = vma_address(vma, pgoff_start,
>> -                folio_nr_pages(folio));
>> +        unsigned long address = vma_address(vma, pgoff_start, nr_pages);
>>             VM_BUG_ON_VMA(address == -EFAULT, vma);
>>           cond_resched();
>> @@ -2831,7 +2831,7 @@ static void rmap_walk_anon(struct folio *folio,
>>           if (rwc->invalid_vma && rwc->invalid_vma(vma, rwc->arg))
>>               continue;
>>   -        if (!rwc->rmap_one(folio, vma, address, rwc->arg))
>> +        if (rwc->rmap_one && !rwc->rmap_one(folio, vma, address, rwc->arg))
>>               break;
>>           if (rwc->done && rwc->done(folio))
>>               break;
>> @@ -2894,7 +2894,7 @@ static void __rmap_walk_file(struct folio *folio, struct address_space *mapping,
>>           if (rwc->invalid_vma && rwc->invalid_vma(vma, rwc->arg))
>>               continue;
>>   -        if (!rwc->rmap_one(folio, vma, address, rwc->arg))
>> +        if (rwc->rmap_one && !rwc->rmap_one(folio, vma, address, rwc->arg))
>>               goto done;
>>           if (rwc->done && rwc->done(folio))
>>               goto done;
