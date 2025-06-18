Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AB12FEE0F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750267791; cv=none; b=howICPHe2f6x/Wd9N2aB65G2R1nrAv+ExH8ZEMOrYZShlRMVcQn9wRkaxWTLIGasduLimAy8Y4b9TrU2f/PBJrTyZ4UHrLMXEarWL1Srfgv6dwvIAaZErCYhdjPa6EOFuM+TOWo0RDhQAC3CIdncazZVMao2nGFdDB8NOPBifjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750267791; c=relaxed/simple;
	bh=MVC9tsgtcuXQ9NsWEuIOkb0onzZk2y2rKPu2+u9XBuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mjlfz7fRBNxJWBOjQRhOy3UbsjtFindSzPH8R7gTPS8vnjL7DMg9n1/A3XpWcVC9LLi3RVnWprFAeKYnBz7Mlub6DV4vQamwKXhm2Lo1ZNpUj4eDfdHw3kgk7qL72f3CIABW5lpSoXr0vIXrqh+EevqikYuTP+VnUMqYALFiQNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lh7EKF5/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lh7EKF5/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750267788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=S/GYr7NMfg1i8frVNORQu7d9s0oJYK+hs0cOKw/5ZOA=;
	b=Lh7EKF5/b/Oc2LDu2CJV4bjVyP4JHorSwWiyOjHFMuYAWr8pbEtB+toLbF9ZvEXQ6zXAuC
	uC0/9QN8isc0M7Lau/d0vt330JHFw/RWrjo1dJgCfv1jL0iskzljMYq04ax6PI8YOZy9WM
	nXiGqsear9rtux1hpdFDJrBWiGjED4c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-9EawhhIbOa2uJU3BXQnoyg-1; Wed, 18 Jun 2025 13:29:45 -0400
X-MC-Unique: 9EawhhIbOa2uJU3BXQnoyg-1
X-Mimecast-MFC-AGG-ID: 9EawhhIbOa2uJU3BXQnoyg_1750267784
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451ac1b43c4so41376905e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750267784; x=1750872584;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S/GYr7NMfg1i8frVNORQu7d9s0oJYK+hs0cOKw/5ZOA=;
        b=BITzd2t40C6u9BvomwTkKIP+PbOFnPym4qcZdGuit0JEBGBgah3h4filKWwII17RKe
         BxScY6BsoE7XPqKquU33qoqxGyKm7N3L3jJXfcCGxQp6giOopJrkzxqA6usy5oZyDuvC
         9RVr+LM5IH8BfKS0lgfq4ZAiaiBpceEraBkLUEsNzJsrhlB5d2pLcjgSCI/91G75DTA0
         +BYAu6GtzqLXZBLkrOE5waI8+Oty1S+cIxsB4HaPw45vOCUpy05igPcknpdJ9wPfMBTd
         +/cP8EN1UKbUottGyFv3LeOtiB+wDZzKZWZtjsoZZ8LZu0U8gg3XaWtyUBson7c59v7x
         Q1cg==
X-Forwarded-Encrypted: i=1; AJvYcCWfR2Cgcm1RQ5LM2GbU+d0vgg+ex78ufA8YBKkcbPQ3vsG+168ktLllH1pJ5yDFxaCkdkHwqRPcimA6eE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhyE5Dk4LhPdlHZIOQ7vzQhmFuYwF4DchAg2lTXRr8hqJfDGgn
	5K3WiDUGwekZ8g647czKjyZYd9uV2/0do39tBFVDgnn59ImFBiBIxGwUdXExqi3G8JW8DXFciGS
	wrsGF5ROTKChZZEqi60EDzOZGnMp6UyKrXlsN/EhZwKYqkyy2z6Dq1755QYMrTXmTanakqfBBn2
	Ix
X-Gm-Gg: ASbGncsAc0xvLfbT6SeUJKlskQLQQ/w6QIRFYthHqWSyZLkpa2z+jy1M7ihSMcG0ZCI
	eL2aVoNrPCz1c/GZnskizYc1+sPLBraQfNwFKzfdoWecmhrjNROM7+JBzNZegfzRSEUg1GgXb9Q
	M/PjmybNN74oNKCInGvl6q8LCXjnOcJBaPySNiHYtJ4PtIO4/6Sj/oQJi6ww7+ZyNaZurGOs7v3
	LqiMjCCOUb38MycgRCzVPYALg8tnySJtbC3VY+S85kaU0Psx3OYONE4Z/HGzRbcagbIuQ3FNNYa
	zeEYb0CnwnYebaKbIehKwDS6D1UsmO23jicpSI4Ml/wvrl/bQXP/kzp0rmAoyDfUFhQP+t+kZZ6
	KEdfRSLRR5oHYBl/ZWFHL8OLnmRl3ANLZw37dTLC6SiCwb1I=
X-Received: by 2002:a05:600c:348c:b0:450:cfcb:5c9b with SMTP id 5b1f17b1804b1-4533ca7a16bmr154287655e9.1.1750267784107;
        Wed, 18 Jun 2025 10:29:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGu3HtnbaUne3Xy8fQLyiYvHAvSwoC5z6e8UqHUhelY/9nsK+tRcXobFmy4yPnRCs+Yjqgi7g==
X-Received: by 2002:a05:600c:348c:b0:450:cfcb:5c9b with SMTP id 5b1f17b1804b1-4533ca7a16bmr154287545e9.1.1750267783668;
        Wed, 18 Jun 2025 10:29:43 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:2400:4052:3b5:fff9:4ed0? (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453596df276sm20146465e9.0.2025.06.18.10.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:29:43 -0700 (PDT)
Message-ID: <970e6480-5ba0-4500-85a6-f7ec6db2f005@redhat.com>
Date: Wed, 18 Jun 2025 19:29:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] khugepaged: Optimize
 __collapse_huge_page_copy_succeeded() for large folios by PTE batching
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 baohua@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250618102607.10551-1-dev.jain@arm.com>
 <f4de7754-e60a-4a87-9319-24b78a0c6895@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <f4de7754-e60a-4a87-9319-24b78a0c6895@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.06.25 19:26, Lorenzo Stoakes wrote:
> On Wed, Jun 18, 2025 at 03:56:07PM +0530, Dev Jain wrote:
>> Use PTE batching to optimize __collapse_huge_page_copy_succeeded().
>>
>> On arm64, suppose khugepaged is scanning a pte-mapped 2MB THP for collapse.
>> Then, calling ptep_clear() for every pte will cause a TLB flush for every
>> contpte block. Instead, clear_full_ptes() does a
>> contpte_try_unfold_partial() which will flush the TLB only for the (if any)
>> starting and ending contpte block, if they partially overlap with the range
>> khugepaged is looking at.
>>
>> For all arches, there should be a benefit due to batching atomic operations
>> on mapcounts due to folio_remove_rmap_ptes().
>>
>> No issues were observed with mm-selftests.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   mm/khugepaged.c | 31 +++++++++++++++++++++++--------
>>   1 file changed, 23 insertions(+), 8 deletions(-)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index d45d08b521f6..649ccb2670f8 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -700,12 +700,14 @@ static void __collapse_huge_page_copy_succeeded(pte_t *pte,
>>   						spinlock_t *ptl,
>>   						struct list_head *compound_pagelist)
>>   {
>> +	unsigned long end = address + HPAGE_PMD_SIZE;
> 
> I assume we always enter here with aligned address...
> 
>>   	struct folio *src, *tmp;
>> -	pte_t *_pte;
>> +	pte_t *_pte = pte;
>>   	pte_t pteval;
>> +	int nr_ptes;
>>
>> -	for (_pte = pte; _pte < pte + HPAGE_PMD_NR;
>> -	     _pte++, address += PAGE_SIZE) {
>> +	do {
>> +		nr_ptes = 1;
>>   		pteval = ptep_get(_pte);
>>   		if (pte_none(pteval) || is_zero_pfn(pte_pfn(pteval))) {
>>   			add_mm_counter(vma->vm_mm, MM_ANONPAGES, 1);
>> @@ -719,23 +721,36 @@ static void __collapse_huge_page_copy_succeeded(pte_t *pte,
>>   				ksm_might_unmap_zero_page(vma->vm_mm, pteval);
>>   			}
>>   		} else {
> 
> Existing code but hate this level of indentation.
> 
> The code before was (barely) sort of ok-ish, but now it's realyl out of hand.
> 
> On the other hand, I look at __collapse_huge_page_isolate() and want to cry so I
> guess this maybe is something that needs addressing outside of this patch.
> 
> 
>> +			const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +			int max_nr_ptes;
>> +			bool is_large;
>> +
>>   			struct page *src_page = pte_page(pteval);
>>
>>   			src = page_folio(src_page);
>> -			if (!folio_test_large(src))
>> +			is_large = folio_test_large(src);
>> +			if (!is_large)
>>   				release_pte_folio(src);
> 
> Hm, in this case right, release_pte_folio() does a folio_unlock().
> 
> Where does a large folio get unlocked?

Through the "compound_pagelist" below. ... this code is so ugly.

"large_folio_list" ...

-- 
Cheers,

David / dhildenb

