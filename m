Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E4E78F59
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750943793; cv=none; b=K4EWEcgEGpGvfob7cP71R5WNDWJVWzfPwWSDV1hrLoJhqZih6fgdKSY76f33Mid01AXEWz1yXLO0BL6pjwkmkByWtcDuYJTE8C8fk+HhwmK/2Xv4VWuI+jfEM0KuXMlH3GWF5C9pU1GbTCI67ZwYhimEuV5sQwohD/BpBcjc3Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750943793; c=relaxed/simple;
	bh=57xRGw1RitrO35h0ikz2Zd4I5IKZDNL6GTAY1qunid4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VcnI9PTvX5Cak1nkpwxWWaTDZyH5Vgl+2/sW9Uw29vWBjTjZCKXmLNTlbdiKjh0LZqp662oHVzM7eAbBTDwJdaPvuAdM8tChBnQPz7vWPYrxVAjM5nspvCwXJVwOfoLkW7vkHHO457c+c/sbI//X8OgASqdX32iglbpA41fhkOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KOk2k/Zz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KOk2k/Zz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750943790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5kjvDf5aAqvtOZDqG4fPq/JsCa063DTsIxW032jfbEA=;
	b=KOk2k/ZzTMerJRZRLmSclfWqaOtrC1XS1hfrT9tbNiyqSMiJ1K1JouK8nH70Y6/ye+lDWv
	uID29wX0rfTd8PrZDd7Fg71oIc/PgVMIsjsA+V3NHMxJC/xMNiQd9lYOeTX8vL9j3JG24k
	NuHLpXg2A9Y1AEPUJjA5CpEoAN1PJiw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-oowmOyneMXqpF3F-zEqezA-1; Thu, 26 Jun 2025 09:16:28 -0400
X-MC-Unique: oowmOyneMXqpF3F-zEqezA-1
X-Mimecast-MFC-AGG-ID: oowmOyneMXqpF3F-zEqezA_1750943787
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f8192e2cso579462f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750943787; x=1751548587;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5kjvDf5aAqvtOZDqG4fPq/JsCa063DTsIxW032jfbEA=;
        b=UmvN3SrLuB/jHHhwzPeYXqYEJ5z3y7yDk3K+Cmijox4meAuaCfUDpJ4M8h9hEkqhJV
         wrFZ2kNMyNt5BdpTPUm1smTqJWMqjJzlcjHxhVGtyoYBt6tfHNfTJZZa8QYIqwuINNao
         PxFwz8p72qWABMXV6O4vKyTxIMVYaxSNRC1ZNREpXYCDb+z0qaWel0oPNYGvyQo8u+2N
         TwoSHry54p+8nXsYHtMCEanV2F+4ChY5MyI9kx8MYNXlj3OBYjSVrFRIuCRXRKsuTr+G
         ZRyz/muUjjqga8NTmFPjc1C7ZdW89n8/LQkHQKvmmzRJyLdqDMbL0jUwRMzUlthLd7QY
         hg4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWNSpjUQr3q/iIUFvdvYArEkWjL9jzEgMEzpZATsiQ0UMXIj9ea8qB5IP+NkowYwDfaR3rI+s7nX8GCbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU4Emh7x7GOaw+B/DuEpj7mzHcsBhyU6t4d/N6kst/rO+eCTw1
	n6/qm2VaBdioU1gdbpQyxye8lPxs8ckfbq2FqZCoRmu9a4vzavaXdmMkNwZEm4cEtST/BaN+fWP
	LcEx5eVS5rX7Jjc3t1V7rtYsN++aYTQQfTYowKEbuSXhseQAuc6vyVeV+c7ZHZU5VTLuNXpkEfc
	rb
X-Gm-Gg: ASbGnctvKnkdpGTjret0Q/4ZaJWFhmCtydCzCaWpsF30fWSSaqT0/1Dd6b63AsUMmdo
	2nJEfM/33QSaavtkQ95ezZuCsivVkjumlnrbA3lQ0Dwr7PE1pSE9/pSXgN69eUULUinyhdCzdkj
	nwEWLJAEOrOVlVgdXWoTb3QZqLPkBVsX9Li68cNLnyOJJeBcU2+8DOyaTDPAVl9HgG9WuMVy4mt
	xcIWNAfNMFjTzz5D2fwitkAmSJMyb5goadzatbGA29/4gXy1GmVzACmo5xzPbjJfVHH2IoOtlPy
	y+hM3KXcaTK5XcwPJjidaMTFAdgWfH5Ov0atojKItRiFvHWbT57rxg==
X-Received: by 2002:a5d:588e:0:b0:3a6:da76:38b0 with SMTP id ffacd0b85a97d-3a6ed60d1a6mr6701448f8f.25.1750943787100;
        Thu, 26 Jun 2025 06:16:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFHAlgxWUmXemwlxp5O4hqDpp8xYzthkusYlul1qIoy7dQaRUijfVPXNzepkcnqcCtg4BtsA==
X-Received: by 2002:a5d:588e:0:b0:3a6:da76:38b0 with SMTP id ffacd0b85a97d-3a6ed60d1a6mr6701390f8f.25.1750943786556;
        Thu, 26 Jun 2025 06:16:26 -0700 (PDT)
Received: from [192.168.3.141] (p4fe0f3bf.dip0.t-ipconnect.de. [79.224.243.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a831051c49sm234050f8f.30.2025.06.26.06.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 06:16:26 -0700 (PDT)
Message-ID: <1a55f9f3-f5b1-4761-97ba-423756c707fe@redhat.com>
Date: Thu, 26 Jun 2025 15:16:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Lance Yang <ioworker0@gmail.com>
Cc: 21cnbao@gmail.com, akpm@linux-foundation.org,
 baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 lance.yang@linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
 ying.huang@intel.com, zhengtangquan@oppo.com
References: <20250626092905.31305-1-ioworker0@gmail.com>
 <20250626124445.77865-1-ioworker0@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250626124445.77865-1-ioworker0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.06.25 14:44, Lance Yang wrote:
> 
> On 2025/6/26 17:29, Lance Yang wrote:
>> Before I send out the real patch, I'd like to get some quick feedback to
>> ensure I've understood the discussion correctly ;)
>>
>> Does this look like the right direction?
>>
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index fb63d9256f09..5ebffe2137e4 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -1845,23 +1845,37 @@ void folio_remove_rmap_pud(struct folio *folio, struct page *page,
>>    #endif
>>    }
>>    
>> -/* We support batch unmapping of PTEs for lazyfree large folios */
>> -static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>> -			struct folio *folio, pte_t *ptep)
>> +static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
>> +			struct page_vma_mapped_walk *pvmw,
>> +			enum ttu_flags flags, pte_t pte)
>>    {
>>    	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> -	int max_nr = folio_nr_pages(folio);
>> -	pte_t pte = ptep_get(ptep);
>> +	unsigned long end_addr, addr = pvmw->address;
>> +	struct vm_area_struct *vma = pvmw->vma;
>> +	unsigned int max_nr;
>> +
>> +	if (flags & TTU_HWPOISON)
>> +		return 1;
>> +	if (!folio_test_large(folio))
>> +		return 1;
>>    
>> +	/* We may only batch within a single VMA and a single page table. */
>> +	end_addr = pmd_addr_end(addr, vma->vm_end);
>> +	max_nr = (end_addr - addr) >> PAGE_SHIFT;
>> +
>> +	/* We only support lazyfree batching for now ... */
>>    	if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
>> -		return false;
>> +		return 1;
>>    	if (pte_unused(pte))
>> -		return false;
>> -	if (pte_pfn(pte) != folio_pfn(folio))
>> -		return false;
>> +		return 1;
>> +
>> +	/* ... where we must be able to batch the whole folio. */
>> +	if (pte_pfn(pte) != folio_pfn(folio) || max_nr != folio_nr_pages(folio))
>> +		return 1;
>> +	max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, fpb_flags,
>> +				 NULL, NULL, NULL);
>>    
>> -	return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags, NULL,
>> -			       NULL, NULL) == max_nr;
>> +	return (max_nr != folio_nr_pages(folio)) ? 1 : max_nr;
>>    }
>>    
>>    /*
>> @@ -2024,9 +2038,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>>    			if (pte_dirty(pteval))
>>    				folio_mark_dirty(folio);
>>    		} else if (likely(pte_present(pteval))) {
>> -			if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
>> -			    can_batch_unmap_folio_ptes(address, folio, pvmw.pte))
>> -				nr_pages = folio_nr_pages(folio);
>> +			nr_pages = folio_unmap_pte_batch(folio, &pvmw, flags, pteval);
>>    			end_addr = address + nr_pages * PAGE_SIZE;
>>    			flush_cache_range(vma, address, end_addr);
>>    
>> @@ -2206,13 +2218,16 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>>    			hugetlb_remove_rmap(folio);
>>    		} else {
>>    			folio_remove_rmap_ptes(folio, subpage, nr_pages, vma);
>> -			folio_ref_sub(folio, nr_pages - 1);
>>    		}
>>    		if (vma->vm_flags & VM_LOCKED)
>>    			mlock_drain_local();
>> -		folio_put(folio);
>> -		/* We have already batched the entire folio */
>> -		if (nr_pages > 1)
>> +		folio_put_refs(folio, nr_pages);
>> +
>> +		/*
>> +		 * If we are sure that we batched the entire folio and cleared
>> +		 * all PTEs, we can just optimize and stop right here.
>> +		 */
>> +		if (nr_pages == folio_nr_pages(folio))
>>    			goto walk_done;
>>    		continue;
>>    walk_abort:
>> --
> 
> Oops ... Through testing on my machine, I found that the logic doesn't
> behave as expected because I messed up the meaning of max_nr (the available
> scan room in the page table) with folio_nr_pages(folio) :(
> 
> With the following change:
> 
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 5ebffe2137e4..b1407348e14e 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1850,9 +1850,9 @@ static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
>   			enum ttu_flags flags, pte_t pte)
>   {
>   	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +	unsigned int max_nr, nr_pages = folio_nr_pages(folio);
>   	unsigned long end_addr, addr = pvmw->address;
>   	struct vm_area_struct *vma = pvmw->vma;
> -	unsigned int max_nr;
>   
>   	if (flags & TTU_HWPOISON)
>   		return 1;
> @@ -1870,12 +1870,13 @@ static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
>   		return 1;
>   
>   	/* ... where we must be able to batch the whole folio. */

Why is that still required? :)

> -	if (pte_pfn(pte) != folio_pfn(folio) || max_nr != folio_nr_pages(folio))
> +	if (pte_pfn(pte) != folio_pfn(folio) || max_nr < nr_pages)
>   		return 1;
> -	max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, fpb_flags,
> -				 NULL, NULL, NULL);
>   
> -	return (max_nr != folio_nr_pages(folio)) ? 1 : max_nr;
> +	max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, nr_pages,
> +				 fpb_flags, NULL, NULL, NULL);
> +
> +	return (max_nr != nr_pages) ? 1 : max_nr;

Why is that still required? :)

-- 
Cheers,

David / dhildenb

