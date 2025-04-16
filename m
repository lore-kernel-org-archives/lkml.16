Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5C222FE06
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744791729; cv=none; b=uh9zAaY5A/LTyQqYusVZtrjgHrvzjM+/ORReaYxobpGiZwJ/q34nS1ly1XcLWteg6EY0yxoHsnyTYdL6s+YCwj9o7zxZFuUjvUKgCbFpinOTNxz9jLgOYhLNi3NtgOG+KFnpOyTtphV5ZUuz7AGL9Nj+zvh/irQ1pqkKaXslL6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744791729; c=relaxed/simple;
	bh=XKAkFuzBJeeHp5QV1xX9F1kczu/Gm1lIr2ml2pa9NSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lwoDLin+iIcFpt25mm1QEBDgasV9oBtfpeAY3W5fsgmruQ/BRoeV2/nfwkAcCfj6+AVyODgvZvCz0+bAqHYlCGUnaYykTLv9vFOEqzE1yewlkLiBES7Kk7M26lQS+CSwKvd/ve+l1De/GGRnJrnlye4jYYFn0lGhWTIQf4voi4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M2BAdjQh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M2BAdjQh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744791726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vvyL9QEbAWCIfE4WOtTlgl7z3JtYo/Z+xwt/Xc2hkOw=;
	b=M2BAdjQh35+JMwEPMkAz/gd2dVXNIyS62rp+Y8na35vnVoNhfI3roaLiD8Un5GQ4Ze8WxX
	cRpNyui/TB8tBi1kt3IXDY74cyXTYIeYqv2yMB+UYrUN25Y7oFNZWR3op1NENK5lI2uHiS
	4nrv43/bxhY+aboeFnS3NjzGAR27xIM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-Eyw1BQxwPQ-49pmxcxR8Fg-1; Wed, 16 Apr 2025 04:22:05 -0400
X-MC-Unique: Eyw1BQxwPQ-49pmxcxR8Fg-1
X-Mimecast-MFC-AGG-ID: Eyw1BQxwPQ-49pmxcxR8Fg_1744791724
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3912e4e2033so2888738f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791724; x=1745396524;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vvyL9QEbAWCIfE4WOtTlgl7z3JtYo/Z+xwt/Xc2hkOw=;
        b=pZOSagvMEVgITrQMXv59rLj3JNa5i1PQlQu6PIdDysm9aupcElhuSLMSHvGghXVqUI
         By1wwk4q8/OTa3jXJJuxZLif6T6Ft5xgAC+HkI8jTHj0/6oOswbX03sisSm/qKpHEsAO
         xxBCEFSAHZnPzPnCG944ajYwNH/XAgff0e0l5VXc0lrbBOFI95od+CM1xqBBONKTt1gk
         5BFdA5J4gT0swPH5Vv7fF53L43Ef9SKkxYC8XxyUL5/JUggZnVMfxdm89/LbU9znAr4A
         hpoyuSvtHlbr7czjDOq7h0Z4CeX36u+UuUSjvDqSCRj3I/U+iUPCqUdDST5IleamH5Ym
         Oyhw==
X-Forwarded-Encrypted: i=1; AJvYcCXVZyHMOAyMIVxq6Ok33DZLNJy8QBYIVK/bXKsZPA1YOSi9UPOATd5V5inRIzdNxjAx7bWmS3YqrlHblwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJTvuDNyQa6UaHFG64UXpHpd6zYqu2xFzEikoJnxBXISoHkeWv
	5bDfEuS3TdwMuwjDWQdckcBo1ZTJpS8Uxk4LrqAaP1hhcsVAdKdqcsPe5bxp1YYN/4B/TLWlLHm
	7PmcYw+QctPlnmW7+sUQ7SslnhkXv7tDtt1fLIPt8qbqvyVvfxTBo1qxFmcabmA==
X-Gm-Gg: ASbGncvR6FzWjG1QqHuV0ZyMatApQSI8P4U8uzOn9whz+UrsoJE/age0i4D81K4duBH
	mp+5Wxdz1BgkmVJubmw7BDwy94SsjnHIlsjOk0Uc0E5F5VEQWGgc8AI6MPj7B7OeFxoIrzEdegM
	xezNYmlGHGiJ3bINI+GPwEF2W4GMMUU6H6bSAbJZUmdhrmSQR0ioL//wyU6Lzg3mhb4HPo995X6
	uj6LhcEl2km+Barm5JxDSzjzwlh0/bforqBLDuu5H1cI619NoDbzHCGb9H1FjilDTQVtCkZ3Zdu
	VaX+WIWDAH32n+v1/IcHVCfBussGqRA05mxnr5+3swVQbyL9ClnqJT63HOfeddcwZ/SQVIF/bcy
	UEnbdvCYKhfCa5OQCB3XRpFw5PhUMapueFLA7dA==
X-Received: by 2002:a5d:5985:0:b0:391:2df9:772d with SMTP id ffacd0b85a97d-39ee5b16e16mr726240f8f.13.1744791723936;
        Wed, 16 Apr 2025 01:22:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgzQDtE+12iKbE4/DCmivduwNYqxbp+evRvagl2uSM8ACsKrJnhuymuDi4xOI62HWy8DfzWA==
X-Received: by 2002:a5d:5985:0:b0:391:2df9:772d with SMTP id ffacd0b85a97d-39ee5b16e16mr726222f8f.13.1744791723453;
        Wed, 16 Apr 2025 01:22:03 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963f2bsm16809290f8f.18.2025.04.16.01.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 01:22:02 -0700 (PDT)
Message-ID: <019d1c4a-ffd0-4602-b2ba-cf07379dab17@redhat.com>
Date: Wed, 16 Apr 2025 10:22:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mempolicy: Optimize queue_folios_pte_range by PTE
 batching
To: Baolin Wang <baolin.wang@linux.alibaba.com>, Dev Jain <dev.jain@arm.com>,
 akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, hughd@google.com, vishal.moola@gmail.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250416053048.96479-1-dev.jain@arm.com>
 <7f96283b-11b3-49ee-9d2d-5ad977325cb0@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <7f96283b-11b3-49ee-9d2d-5ad977325cb0@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.04.25 08:32, Baolin Wang wrote:
> 
> 
> On 2025/4/16 13:30, Dev Jain wrote:
>> After the check for queue_folio_required(), the code only cares about the
>> folio in the for loop, i.e the PTEs are redundant. Therefore, optimize
>> this loop by skipping over a PTE batch mapping the same folio.
>>
>> With a test program migrating pages of the calling process, which includes
>> a mapped VMA of size 4GB with pte-mapped large folios of order-9, and
>> migrating once back and forth node-0 and node-1, the average execution
>> time reduces from 7.5 to 4 seconds, giving an approx 47% speedup.
>>
>> v2->v3:
>>    - Don't use assignment in if condition
>>
>> v1->v2:
>>    - Follow reverse xmas tree declarations
>>    - Don't initialize nr
>>    - Move folio_pte_batch() immediately after retrieving a normal folio
>>    - increment nr_failed in one shot
>>
>> Acked-by: David Hildenbrand <david@redhat.com>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>    mm/mempolicy.c | 12 ++++++++++--
>>    1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
>> index b28a1e6ae096..4d2dc8b63965 100644
>> --- a/mm/mempolicy.c
>> +++ b/mm/mempolicy.c
>> @@ -566,6 +566,7 @@ static void queue_folios_pmd(pmd_t *pmd, struct mm_walk *walk)
>>    static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>>    			unsigned long end, struct mm_walk *walk)
>>    {
>> +	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>    	struct vm_area_struct *vma = walk->vma;
>>    	struct folio *folio;
>>    	struct queue_pages *qp = walk->private;
>> @@ -573,6 +574,7 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>>    	pte_t *pte, *mapped_pte;
>>    	pte_t ptent;
>>    	spinlock_t *ptl;
>> +	int max_nr, nr;
>>    
>>    	ptl = pmd_trans_huge_lock(pmd, vma);
>>    	if (ptl) {
>> @@ -586,7 +588,9 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>>    		walk->action = ACTION_AGAIN;
>>    		return 0;
>>    	}
>> -	for (; addr != end; pte++, addr += PAGE_SIZE) {
>> +	for (; addr != end; pte += nr, addr += nr * PAGE_SIZE) {
>> +		max_nr = (end - addr) >> PAGE_SHIFT;
>> +		nr = 1;
>>    		ptent = ptep_get(pte);
>>    		if (pte_none(ptent))
>>    			continue;
>> @@ -598,6 +602,10 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>>    		folio = vm_normal_folio(vma, addr, ptent);
>>    		if (!folio || folio_is_zone_device(folio))
>>    			continue;
>> +		if (folio_test_large(folio) && max_nr != 1)
>> +			nr = folio_pte_batch(folio, addr, pte, ptent,
>> +					     max_nr, fpb_flags,
>> +					     NULL, NULL, NULL);
>>    		/*
>>    		 * vm_normal_folio() filters out zero pages, but there might
>>    		 * still be reserved folios to skip, perhaps in a VDSO.
>> @@ -630,7 +638,7 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>>    		if (!(flags & (MPOL_MF_MOVE | MPOL_MF_MOVE_ALL)) ||
>>    		    !vma_migratable(vma) ||
>>    		    !migrate_folio_add(folio, qp->pagelist, flags)) {
>> -			qp->nr_failed++;
>> +			qp->nr_failed += nr;
> 
> Sorry for chiming in late, but I am not convinced that 'qp->nr_failed'
> should add 'nr' when isolation fails.

This patch does not change the existing behavior. But I stumbled over 
that as well ... and scratched my head.

> 
>   From the comments of queue_pages_range():
> "
> * >0 - this number of misplaced folios could not be queued for moving
>    *      (a hugetlbfs page or a transparent huge page being counted as 1).
> "
> 
> That means if a large folio is failed to isolate, we should only add '1'
> for qp->nr_failed instead of the number of pages in this large folio. Right?

I think what the doc really meant is "PMD-mapped THP". PTE-mapped THPs 
always had the same behavior: per PTE of the THP we would increment 
nr_failed by 1.

I assume returning "1" for PMD-mapped THPs was wrong from the beginning; 
it might only have been right for hugetlb pages.

With COW and similar things (VMA splits), achieving "count each folio 
only once" reliably is a very hard thing to achieve.


Let's explore how "nr_failed" will get used.

1) do_mbind()

Only cares if "any failed", not the exact number.


2) migrate_pages()

Will return the number to user space, where documentation says:

"On success migrate_pages() returns the number of pages that could not 
be moved (i.e., a return of zero means that all pages were successfully 
moved)."

man-page does not document THP specifics AFAIKs. I would assume most 
users care about "all migrated vs. any not migrated".


I would even feel confident to change the THP PMD-handling to return the 
actual *pages*.

-- 
Cheers,

David / dhildenb

