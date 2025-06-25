Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3CC2BEFEF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750850081; cv=none; b=qS5Gs0V878gWCjAfrORD2Owoo6Zu2ZD3ydLSVONAzZILQJw8CbCE/DO0lQTFtxns1g396XSxJgwho8Ek+UY58+Zd54QZtyTL9dR6ViWv7LoybKzHpWh4poeTYODB2VQ6HESKPXV+jqlvtdgPDbBYXYLp8oyN/L/s0CczPbjsaao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750850081; c=relaxed/simple;
	bh=8KwH2fGlVfCInKBSi7Yfi6MO93V3PerKMgUEef4KUI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dpZuxXMFjMyMtE3mF9kxQh3tcwGi9586LcAjec45nK3FjV0X97/1oifk7jvOqLiyZFNgSK9UGEu8krBUhHslIdyEjU1B99wqBrAIBYjbHEIC6TVGwcSt64u7tMloZkqEy4fhRvhX4e6Idev8/egz7TfICtsEq3QJ/OijqAA1KsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D2Uo/iOu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D2Uo/iOu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750850077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=RCf+nVpyRYAq5RAQBEH0GN2PMBcaPwHZF9/C9w3w5W0=;
	b=D2Uo/iOuxvIfy+DXVPRL4EHQuudfhmSza3boIssloyRuv9nCZ65T2icohWs4cRSxBuc4uP
	nvnkv5vluD8XJwlqLK9dw7dp7DJxnypJVpa5U+Xq3Wj1mVDxgqo3bOTNp08IgR/yfLyASr
	A2JGDAuupmSYZWs2jAcaHTbBHznKFDk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-4IovO-r-MY-yHfQe4NoHpA-1; Wed, 25 Jun 2025 07:14:35 -0400
X-MC-Unique: 4IovO-r-MY-yHfQe4NoHpA-1
X-Mimecast-MFC-AGG-ID: 4IovO-r-MY-yHfQe4NoHpA_1750850075
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d244bfabso51144025e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750850074; x=1751454874;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RCf+nVpyRYAq5RAQBEH0GN2PMBcaPwHZF9/C9w3w5W0=;
        b=lK/uWq7oeEZi+Ll85diCkzQAtbbXqBjlHnFiIaTeF1jp8CFlKuO9mtzq5Rbu8g6NK+
         oEeB8hBsPRO7sZK1OFz+fjg2FYR8FJUXyP+avmaK/eNkEKmZvcRcLyMBwK1J8AtV8Tcp
         sit5AjMj2B+ZDPsq76tbTUPGI/+gzTHusTXS/1kU9eVRxFEt32Nrbmm1RVShYYYW59me
         JyE5crniOiaiaYb3CLH1xpdK40o6WctFhI6HJQ9CMQsKaDbmEoTlBVVBA+KYcIbca/Y1
         a1BuZKZDHomJXza0VPRwtKkO3x5IHcJuULFReCz2h1ZtJVqlGw1Kdm/0Jbd2hwT0hkiR
         iZeA==
X-Forwarded-Encrypted: i=1; AJvYcCX5tJIrFSoz02Twv+uy4ziYtkteUV9zKABpL5BtseG+HleBiveLW8ahUefepa0KK539W/OMIuPRclY8pbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOPBqDiUO5GxkTEnFlZzb/+OQ6zwA5YXiA2V1CoxkEV8E7pael
	N1wn8FdPX0pC9OnjR+NnSA03hCuIycKfeQzjtc7ISiOVMja9GFNG1w9tQFuwyRDUz/tDu8I7ZTY
	7fu1Pq43Ldp2d9EYtzTbj83zurjSNJy0gDD7pSbMTIpwJpxCKN1uDiBOvrdwWTLvZzA==
X-Gm-Gg: ASbGnctgaq8EbxZH6TNfGVJLgmPiztjKr9IS25tVC39Uu729MVFIUZlKY1P5l+5CwoH
	C3I/pk0pGPI08Y6fiAkOe1iZ45c8IPK2ZOf8eZShAdvjKIl4CfB9LILFEVQIUlLiDLBqrWAEkHL
	oXH2biXCyw3m4L88fzXOIkXdRcejClfo3wQH4pwy99e/aHjnzCf9Fdv6yP4j/rmatczxZZKgn2n
	N7pOAr2PvGEf9mhfA6upH7HlkX3x3kOo7D5WM7YE4rx0qifrZWz8dLuASC0UfXHkW5IGgShZ07s
	n6ok4aIeVXlTlUdoJ9FJkyUhrG65zJm2dH0kzzDw7HWBZawyOs3z8DHP7eNh+VQ6v1Z6lacNcdp
	DbfX9pEuFr0ItcG+1ZaQ5fNCysfRdRexA+1HINvv3EOyn
X-Received: by 2002:a05:600c:8b26:b0:453:483b:626c with SMTP id 5b1f17b1804b1-45381aeafefmr23417305e9.23.1750850074595;
        Wed, 25 Jun 2025 04:14:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUA9aUi7Vo7GK7y1iiPH7c3ZFQC4riTpobXg8mqdxWJi2Jqd3cNly4ZWxwJi5HRjVu1LDJPA==
X-Received: by 2002:a05:600c:8b26:b0:453:483b:626c with SMTP id 5b1f17b1804b1-45381aeafefmr23416845e9.23.1750850074112;
        Wed, 25 Jun 2025 04:14:34 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382349758sm16925445e9.9.2025.06.25.04.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 04:14:33 -0700 (PDT)
Message-ID: <426ec9bd-3109-4927-a96e-367e882c7067@redhat.com>
Date: Wed, 25 Jun 2025 13:14:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] khugepaged: Optimize
 __collapse_huge_page_copy_succeeded() by PTE batching
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250625055806.82645-1-dev.jain@arm.com>
 <20250625055806.82645-2-dev.jain@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250625055806.82645-2-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.06.25 07:58, Dev Jain wrote:
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
>   mm/khugepaged.c | 27 +++++++++++++++++++++------
>   1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index d45d08b521f6..3944b112d452 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -700,12 +700,15 @@ static void __collapse_huge_page_copy_succeeded(pte_t *pte,
>   						spinlock_t *ptl,
>   						struct list_head *compound_pagelist)
>   {
> +	unsigned long end = address + HPAGE_PMD_SIZE;
>   	struct folio *src, *tmp;
> -	pte_t *_pte;
>   	pte_t pteval;
> +	pte_t *_pte;
> +	int nr_ptes;
>   
> -	for (_pte = pte; _pte < pte + HPAGE_PMD_NR;
> -	     _pte++, address += PAGE_SIZE) {
> +	for (_pte = pte; _pte < pte + HPAGE_PMD_NR; _pte += nr_ptes,
> +	     address += nr_ptes * PAGE_SIZE) {
> +		nr_ptes = 1;
>   		pteval = ptep_get(_pte);
>   		if (pte_none(pteval) || is_zero_pfn(pte_pfn(pteval))) {
>   			add_mm_counter(vma->vm_mm, MM_ANONPAGES, 1);
> @@ -719,21 +722,33 @@ static void __collapse_huge_page_copy_succeeded(pte_t *pte,
>   				ksm_might_unmap_zero_page(vma->vm_mm, pteval);
>   			}
>   		} else {
> +			const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +			int max_nr_ptes;
> +
>   			struct page *src_page = pte_page(pteval);
>   
>   			src = page_folio(src_page);
>   			if (!folio_test_large(src))
>   				release_pte_folio(src);
> +
> +			max_nr_ptes = (end - address) >> PAGE_SHIFT;
> +			if (folio_test_large(src))
> +				nr_ptes = folio_pte_batch(src, address, _pte,
> +							  pteval, max_nr_ptes,
> +							  flags, NULL, NULL, NULL);
> +
>   			/*
>   			 * ptl mostly unnecessary, but preempt has to
>   			 * be disabled to update the per-cpu stats
>   			 * inside folio_remove_rmap_pte().
>   			 */
>   			spin_lock(ptl);
> -			ptep_clear(vma->vm_mm, address, _pte);
> -			folio_remove_rmap_pte(src, src_page, vma);
> +			clear_full_ptes(vma->vm_mm, address, _pte, nr_ptes,
> +					/* full = */ false);

Can you add this patch to your series if nobody objects and use clear_ptes()
instead?

 From 95e20ab0ff62bbbdcd89898c9d76fdc1ea961257 Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Wed, 25 Jun 2025 12:55:20 +0200
Subject: [PATCH] mm: add get_and_clear_ptes() and clear_ptes()

Let's add variants to be used where "full" does not apply -- which will
be the majority of cases in the future. "full" really only applies if
we are about to tear down a full MM.

Use get_and_clear_ptes() in existing code, clear_ptes() users will
be added next.

Should we make these inline functions instead and add separate docs?
Probably not worth it for now.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
  include/linux/pgtable.h | 6 ++++++
  mm/mremap.c             | 2 +-
  mm/rmap.c               | 2 +-
  3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index cf1515c163e26..28679254b4f65 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -736,6 +736,9 @@ static inline pte_t get_and_clear_full_ptes(struct mm_struct *mm,
  }
  #endif
  
+#define get_and_clear_ptes(_mm, _addr, _ptep, _nr) \
+	get_and_clear_full_ptes(_mm, _addr, _ptep, _nr, 0)
+
  #ifndef clear_full_ptes
  /**
   * clear_full_ptes - Clear present PTEs that map consecutive pages of the same
@@ -768,6 +771,9 @@ static inline void clear_full_ptes(struct mm_struct *mm, unsigned long addr,
  }
  #endif
  
+#define clear_ptes(_mm, _addr, _ptep, _nr) \
+	clear_full_ptes(_mm, _addr, _ptep, _nr, 0)
+
  /*
   * If two threads concurrently fault at the same page, the thread that
   * won the race updates the PTE and its local TLB/Cache. The other thread
diff --git a/mm/mremap.c b/mm/mremap.c
index b31740f77b840..92890f8367574 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -322,7 +322,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
  							 old_pte, max_nr_ptes);
  			force_flush = true;
  		}
-		pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr_ptes, 0);
+		pte = get_and_clear_ptes(mm, old_addr, old_ptep, nr_ptes);
  		pte = move_pte(pte, old_addr, new_addr);
  		pte = move_soft_dirty_pte(pte);
  
diff --git a/mm/rmap.c b/mm/rmap.c
index 3b74bb19c11dd..8200d705fe4ac 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2031,7 +2031,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
  			flush_cache_range(vma, address, end_addr);
  
  			/* Nuke the page table entry. */
-			pteval = get_and_clear_full_ptes(mm, address, pvmw.pte, nr_pages, 0);
+			pteval = get_and_clear_ptes(mm, address, pvmw.pte, nr_pages);
  			/*
  			 * We clear the PTE but do not flush so potentially
  			 * a remote CPU could still be writing to the folio.
-- 
2.49.0


-- 
Cheers,

David / dhildenb

