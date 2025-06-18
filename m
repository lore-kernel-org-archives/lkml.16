Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E3328DB62
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 16:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750263270; cv=none; b=engQIogw9TJGdKt3R5o7jMSJ8NL9a7sronPv4iXyy+Omeal9JHiUF+nmNBSS9vs0hIRbnF6O6cxYCu/hyPCDC1GpeAYDQ4dl7pszdxoNG6NHM0H3V41bTCp5IFf0DJFTYxQEDNxcFiw0bHBH6itSKpLH+/HUU33tWSTfM6iJZ3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750263270; c=relaxed/simple;
	bh=SqqhJ8mOIg55dmbqfeFWD5nnZuIaSJAzk6LWwq97lSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZoV8QR39KCuJ2WU3Yvok1/O/MIzMm+Lhbb6ro3zbxXuCkkvi0DHGyMrR0coUBAUoRrNQZjLl4sh1F9XBm5kAjoG+CCs+7XEsVWVl4Hr7DN4IxUN3DUnGPnDDd7KM9UK1IjMeDoP35KhURxGS5HQ96r3fZGnKqBsU2PfP8POEeOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XXL2Zy4A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XXL2Zy4A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750263267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qv6rWz3G7zQ3HwLveL9JzkEtus+WQoTHanBk5L+liRk=;
	b=XXL2Zy4AHVH4qFDXFHhKEMJV3NEDMog8o1H81HPE939lL/7AT5iDz9gmXBOcWo7zkmFKQI
	L+LXYgUF/2mS9Rau1IgnoYtIhtWClhgCQkOKDxsflDbzBMJYDM+treyEWdmCwlVpAj778C
	W6koVWqV42XU51PWTBYH0NK6eyRqkjo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-UUJ4GFUQOuGVTp0nxH150A-1; Wed, 18 Jun 2025 12:14:26 -0400
X-MC-Unique: UUJ4GFUQOuGVTp0nxH150A-1
X-Mimecast-MFC-AGG-ID: UUJ4GFUQOuGVTp0nxH150A_1750263265
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso46585275e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750263265; x=1750868065;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qv6rWz3G7zQ3HwLveL9JzkEtus+WQoTHanBk5L+liRk=;
        b=ssOfXlovhtQESRtfgaF0jhQDPZZFpB7PJFDRRauQFHfLX0SG8pjpvJhCZFnG6zSj/E
         z+aT81WniniC5WxdR+U1JgPydYuolyHXafmiYHaP0BUeFJWNpL99gsuscgMEu/Htea39
         VrLl+7etose/q6RBbPz0G6EHW/m4pc9CuleYxtJJiZtMKLRlnS9lQqgrv05CMB5dtB3s
         9Mt4A2SUY+uKP/AcSs8eScUDjFolfSnF0UtnYmPaM/5/wyXztK+YokXqLuP0K+87i/GZ
         9bDGfcl4eCIGZfqih9uJReGjGl3/E7Qi/mKhlD3g64vuNJE552XoIPAae2uiIDZq2eAi
         So4w==
X-Forwarded-Encrypted: i=1; AJvYcCVVlmCcIlqGe2e1gpzgzuLhTRXpglH/8LFsygnLCx+Edbzkd0ObBKKiYWEB8ZNDqAw/fxwAEU4WC1T3LWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeM2CEtdJRB90YPw5kyrWp9IC+trruDNYu+f28P1fe9vcjgx6q
	KXF35unvfanQsx0UncZOWJg5EC3oOOJQNvJiM0J5PjY1Mu6Qvmr7Xdd3JcSFEtUVoeCSTaFFVBP
	T8jIDMs5ifMuf8AVE7VCDR6yFigIO0MEv04eWX1qYO+wbOukEOM2UkOjR0rJB0PB5lQ==
X-Gm-Gg: ASbGncvBEufDaPsEzDXKEMTLB2D3KPHk31K4xtS/RC2qxs05uYfknpEO1dIRhrfT0Gx
	qADwL82GLAULJtWX5ZHEeCmCp3PjAY6V2ZVbeGSTpdvXbyxIRZoCU2mJYom0X6wxdry8Z/G4YWp
	pit/Sxg/ipZ6Sf+9zaZXkfNINttlD636XJCGykbcDo5hKESjwq4dWpkg75QQrPcD+ODw2I36RHj
	IFBsImjnmi2wu5uK0hjds1ht+N0x3e5FuLvFQyzsupRua7dBVfvsm6erlIvw3RowJ91dWL2FE3F
	evw6PlHv9JkjKWYr63nXaso/ALu2gx8BmnsbD+mChyx2UiXieiBd13fXFg2wUZumHYSUImU9Vrj
	HOlEdgh+7AtN6a/gv07QIyZmTmYAkKtIYizB8YrLwn6x+KDM=
X-Received: by 2002:a05:600c:a089:b0:441:d4e8:76cd with SMTP id 5b1f17b1804b1-4533cb55c28mr171957925e9.29.1750263264608;
        Wed, 18 Jun 2025 09:14:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9DGEuzgpP2c+6KXNCStjPN6PpIwlpQzQ+R7yaqZtF8tW81pjSe7ZCl5P8XepH5ib4ANXh/A==
X-Received: by 2002:a05:600c:a089:b0:441:d4e8:76cd with SMTP id 5b1f17b1804b1-4533cb55c28mr171957635e9.29.1750263264182;
        Wed, 18 Jun 2025 09:14:24 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:2400:4052:3b5:fff9:4ed0? (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e97abf6sm1813025e9.6.2025.06.18.09.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 09:14:23 -0700 (PDT)
Message-ID: <738669ec-a9e5-4ba1-85a7-605cb4132d05@redhat.com>
Date: Wed, 18 Jun 2025 18:14:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] khugepaged: Optimize
 __collapse_huge_page_copy_succeeded() for large folios by PTE batching
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250618102607.10551-1-dev.jain@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250618102607.10551-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.06.25 12:26, Dev Jain wrote:
> Use PTE batching to optimize __collapse_huge_page_copy_succeeded().
> 
> On arm64, suppose khugepaged is scanning a pte-mapped 2MB THP for collapse.
> Then, calling ptep_clear() for every pte will cause a TLB flush for every
> contpte block. Instead, clear_full_ptes() does a
> contpte_try_unfold_partial() which will flush the TLB only for the (if any)
> starting and ending contpte block, if they partially overlap with the range
> khugepaged is looking at.
> 
> For all arches, there should be a benefit due to batching atomic operations
> on mapcounts due to folio_remove_rmap_ptes().
> 
> No issues were observed with mm-selftests.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>   mm/khugepaged.c | 31 +++++++++++++++++++++++--------
>   1 file changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index d45d08b521f6..649ccb2670f8 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -700,12 +700,14 @@ static void __collapse_huge_page_copy_succeeded(pte_t *pte,
>   						spinlock_t *ptl,
>   						struct list_head *compound_pagelist)
>   {
> +	unsigned long end = address + HPAGE_PMD_SIZE;
>   	struct folio *src, *tmp;
> -	pte_t *_pte;
> +	pte_t *_pte = pte;
>   	pte_t pteval;
> +	int nr_ptes;
>   
> -	for (_pte = pte; _pte < pte + HPAGE_PMD_NR;
> -	     _pte++, address += PAGE_SIZE) {
> +	do {
> +		nr_ptes = 1;
>   		pteval = ptep_get(_pte);
>   		if (pte_none(pteval) || is_zero_pfn(pte_pfn(pteval))) {
>   			add_mm_counter(vma->vm_mm, MM_ANONPAGES, 1);
> @@ -719,23 +721,36 @@ static void __collapse_huge_page_copy_succeeded(pte_t *pte,
>   				ksm_might_unmap_zero_page(vma->vm_mm, pteval);
>   			}
>   		} else {
> +			const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +			int max_nr_ptes;
> +			bool is_large;

folio_test_large() should be cheap, no need for the temporary variable 
(the compiler will likely optimize this either way).

> +
>   			struct page *src_page = pte_page(pteval);
>   
>   			src = page_folio(src_page);
> -			if (!folio_test_large(src))
> +			is_large = folio_test_large(src);
> +			if (!is_large)
>   				release_pte_folio(src);
> +
> +			max_nr_ptes = (end - address) >> PAGE_SHIFT;
> +			if (is_large && max_nr_ptes != 1)
> +				nr_ptes = folio_pte_batch(src, address, _pte,
> +							  pteval, max_nr_ptes,
> +							  flags, NULL, NULL, NULL);

Starting to wonder if we want a simplified, non-inlined version of 
folio_pte_batch() in mm/util.c (e.g., without the 3 NULL parameters), 
renaming existing folio_pte_batch to __folio_pte_batch() and only using 
it where required (performance like in fork/zap, or because the other 
parameters are relevant).

Let me see if I find time for a quick patch later. Have to look at what 
other similar code needs.

> +
>   			/*
>   			 * ptl mostly unnecessary, but preempt has to
>   			 * be disabled to update the per-cpu stats
>   			 * inside folio_remove_rmap_pte().
>   			 */
>   			spin_lock(ptl);

Existing code: The PTL locking should just be moved outside of the loop.

> -			ptep_clear(vma->vm_mm, address, _pte);
> -			folio_remove_rmap_pte(src, src_page, vma);
> +			clear_full_ptes(vma->vm_mm, address, _pte, nr_ptes, false);

Starting to wonder if we want a shortcut

#define clear_ptes(__mm, __addr, __pte, __nr_ptes) \
	clear_full_ptes(__mm, __addr, __pte, __nr_ptes, false)

> +			folio_remove_rmap_ptes(src, src_page, nr_ptes, vma);
>   			spin_unlock(ptl);
> -			free_folio_and_swap_cache(src);
> +			free_swap_cache(src);
> +			folio_put_refs(src, nr_ptes);
>   		}
> -	}
> +	} while (_pte += nr_ptes, address += nr_ptes * PAGE_SIZE, address != end);
>   
>   	list_for_each_entry_safe(src, tmp, compound_pagelist, lru) {
>   		list_del(&src->lru);

I think this should just work.

-- 
Cheers,

David / dhildenb

