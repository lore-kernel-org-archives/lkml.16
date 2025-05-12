Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A088A8834
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 02:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747016260; cv=none; b=k5nJob7zjQRWBP/WDdftMDkchEu8pIQquprzEfTlZasqVTKWarqQvQVjtG1jiWFvdXz+9Tz/X6iI/4w366oiZqwQYWEaTztB7Z7WPxwW6vcxrh40TANQtYvBNsr7fJZYL0SXa4ELo9pHw1B1kTJ2hx9okbzr4+osAQl4e3XsW9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747016260; c=relaxed/simple;
	bh=nhiqAHWNoHcWi91hl1QmeMxXJp3IBKal+Kpy/9ix78Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y66s0KD2Rjlr8rR694IPET7PJ9xIg0J8c1QpZJc93vEf5fC5JaWKSqSiB26woL+0z2kfbUHegKEh/jtPCOkUAaWBZX+5lXx2u8OUDAGTpXiZRBxzDOFy0A5xWETJmhaxllQGxqOYB4ZU4E229Y0tjd69e/aCJSFB0ZscxSvTvUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=wLHkxy8r; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="wLHkxy8r"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747016249; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Q3V6PINikXfSMOOKNu6WoMw90+2FG7fdPuCXdZsG9iA=;
	b=wLHkxy8rK9plBewX1TYMkf569xHZ1+iX2VVGVPh6UjR3flCeZqvp9gkYkN0vcg/T3Y+FbnD0axZuk/ORsR0Q34vgRM0rQJM5MN8fKW0ItBNEkjk011DPShA0+fCeIaoxr/BZ4fW/S7goiD0yQWgXEzUe8A/vm0d9EIEf7H8+qI4=
Received: from 30.74.144.145(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WaCYvyQ_1747016247 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 12 May 2025 10:17:27 +0800
Message-ID: <4decbf69-23cd-4717-ad9b-3315a9df7b37@linux.alibaba.com>
Date: Mon, 12 May 2025 10:17:26 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: khugepaged: convert set_huge_pmd() to take a
 folio
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
 willy@infradead.org
Cc: hannes@cmpxchg.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, ziy@nvidia.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <bc3d4638747e8141133676069336d868c2b2d360.1746795452.git.baolin.wang@linux.alibaba.com>
 <239471b5-12fe-4bad-a6e1-e9f0ad195ab5@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <239471b5-12fe-4bad-a6e1-e9f0ad195ab5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/5/9 22:58, David Hildenbrand wrote:
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index b04b6a770afe..aca66e7f4fd9 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -1467,7 +1467,7 @@ static void collect_mm_slot(struct 
>> khugepaged_mm_slot *mm_slot)
>>   #ifdef CONFIG_SHMEM
>>   /* hpage must be locked, and mmap_lock must be held */
> 
> ^ that comment probably needs some love.

Ah, missed that. Will update the comments in next version.

> 
>>   static int set_huge_pmd(struct vm_area_struct *vma, unsigned long addr,
>> -            pmd_t *pmdp, struct page *hpage)
>> +            pmd_t *pmdp, struct folio *folio)
>>   {
>>       struct vm_fault vmf = {
>>           .vma = vma,
>> @@ -1476,13 +1476,12 @@ static int set_huge_pmd(struct vm_area_struct 
>> *vma, unsigned long addr,
>>           .pmd = pmdp,
>>       };
>> -    VM_BUG_ON(!PageTransHuge(hpage));
>>       mmap_assert_locked(vma->vm_mm);
>> -    if (do_set_pmd(&vmf, hpage))
>> +    if (do_set_pmd(&vmf, &folio->page))
>>           return SCAN_FAIL;
>> -    get_page(hpage);
>> +    folio_get(folio);
>>       return SCAN_SUCCEED;
>>   }
>> @@ -1689,7 +1688,7 @@ int collapse_pte_mapped_thp(struct mm_struct 
>> *mm, unsigned long addr,
>>   maybe_install_pmd:
>>       /* step 5: install pmd entry */
>>       result = install_pmd
>> -            ? set_huge_pmd(vma, haddr, pmd, &folio->page)
>> +            ? set_huge_pmd(vma, haddr, pmd, folio)
> 
> Wondering why we are not passing in the folio+page pair in here as well. 
> I assume in the foreseeable future this code will not be able to work 
> with folios large than PMDs?

OK. Will do in next version.

> Apart from that LGTM.
> 
> Acked-by: David Hildenbrand <david@redhat.com>

Thanks.
