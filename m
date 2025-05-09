Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418DC2749CA
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746777114; cv=none; b=DzYJvg5e95waDbr/8vECak+kjTBWObNM8XSqNYLkp4FRJ3rPy2xOzmf+w1y1nMP6jsKoQFsrTKXU0K0kpsE2kCLtLugybTfNmRe0RCIamW9tUCG+fnkhkI3MDJZiq5kOJ+kZwt56raQt2kunMo43ep/PFKpGpg0inv1BkmeF2fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746777114; c=relaxed/simple;
	bh=rVyAKCBHb6bxdGv1abU/rl2o+rNQUZJYhjoxXesdI5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jVb4XjxZMOwAlIJxiZt21cKrLYHbias8vqqFOevMKGJuOzF4c2T6gZns4tl9jtgk7hSmtkScjhwYtJg2uPH0MKNYbnAzoqLcYwSw0JpoYAge9NW9V4Og0cNIlIpNkyP+k3yOP+/rbd/ba4/u0UVO4MZCIsoQZwJrwV7rizxvpFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g8Rftooe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g8Rftooe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746777111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WXHWZ8Pmf2u3YIREi7O99vNZAqrUK3nbxORTNJOIr+E=;
	b=g8RftooeXSB4ZinYyrt1mXASCXXkQ+AHcS9Lq29C/sMFVFCjph+lIbXGSa3PMGioVs9qHY
	T9/1lm7SJqwsz8BjFF6TeuGDUpjL5MzNMe/tjin63VtupQaiQkE6NHFWwDQiPImIcPK2af
	k8rO4uqSL91BRqKfaYX9gItF6AElG/c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-EM7RXaP8O72V2b732gDQSg-1; Fri, 09 May 2025 03:51:49 -0400
X-MC-Unique: EM7RXaP8O72V2b732gDQSg-1
X-Mimecast-MFC-AGG-ID: EM7RXaP8O72V2b732gDQSg_1746777109
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a0b662be0cso1016347f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 00:51:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746777108; x=1747381908;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WXHWZ8Pmf2u3YIREi7O99vNZAqrUK3nbxORTNJOIr+E=;
        b=RpLavlsgkS7NXfzywwmv2KOtz6nGWwcPbkzvDmisljiOg+sHBJ3izHKqFyFKubJYxl
         P5/xLDs95VdtSgujt6K3oKdYMGMC0u6OpKfzrTz8OmbjrDTDzM1BZ2RJlwZRt8JGOSS/
         s79i7VEthnb6kLIWdYIrTbbti1irG5+OKx7YormCzyfNn7QBog8AXR0BzF7y4bdfLLAL
         vISFhebDPP63ICsXdglKMN/9L5au1NU+Dy5K9KhXhF9rK1q7Z2O/YjksKBlT8iatOMEn
         7Boc85z7qWKMKVtSBVWpOgd526BTkzxvjX7/qkZr7yWfzy9C/o2DzOaV7EKA72uSz7Sf
         c6Qw==
X-Forwarded-Encrypted: i=1; AJvYcCV+DOeOlQd0IcCRyIYGowJmLyA/g0T/Ez8pjJMovmFXW0qn+fRN0ExNHBpTuVjaAL+h+MRAmRKAiuNqeAU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1pf843XGrxpj2a/7pcPZnqYJU+UZLmziOY9SGCmWIggbjMfjR
	lD9OMyYLCM9CC4tWPBLAMRCSkWU0+wiByGxqJH/w/s7w3lJNiBYiO34Fbi5+w2apnbIdVvk5uL/
	B+jy3hfDDiDiHG2cA3ADCUr4MEq+gciB89xQ32dZEyciu2kpxZ3Rs/SsGeESaMA==
X-Gm-Gg: ASbGnctoWDqi3qENJfrRDFc31zLYLNk64KgApOeLV4CJ34AotCATiDT6KdFbXcFcsSK
	qeco8NlmgZCJkGpyaEvIbiJUKG2jcawpMN3ev5TnZpXVk6k61VEZIEaGWmJY8P/k2N/sLMzIMNa
	GvSwULVb13eyardtS/lzgrw239b683gOXC728B4oQYvB2F8LoPyR+LkShXj+SNC8zDVnxGqEUjk
	VAkMO8BQ87RgRi0HD1CZuT7qvCQbcysQDUjy1rj235LDT4TN5DzQNTlU2n0AOOPCQNq5XyVZxcu
	iQpbYWGDbM9DvwAhQRI04IiOBCv4VVFoMl9VV5xaCnLMi5cGVw5sUKsKcoGA3trt98AU7ArUzCZ
	7NrIVHfL4M+9DCe5a04xuOGwwC8LgggGzmmtD8uU=
X-Received: by 2002:a05:6000:220c:b0:3a0:a198:83cb with SMTP id ffacd0b85a97d-3a1f6384896mr2076645f8f.0.1746777108566;
        Fri, 09 May 2025 00:51:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2fcy6GVKcEo8xIgtO1Yhr5EIdYdb8yZrr2sEedLC3vto+fqdmenV1LHbVYGciud1haXo6cg==
X-Received: by 2002:a05:6000:220c:b0:3a0:a198:83cb with SMTP id ffacd0b85a97d-3a1f6384896mr2076626f8f.0.1746777108100;
        Fri, 09 May 2025 00:51:48 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f45:5500:8267:647f:4209:dedd? (p200300d82f4555008267647f4209dedd.dip0.t-ipconnect.de. [2003:d8:2f45:5500:8267:647f:4209:dedd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ec0e4sm2389969f8f.40.2025.05.09.00.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 00:51:46 -0700 (PDT)
Message-ID: <c83ddc32-565b-40e3-b43f-12fe6e70586c@redhat.com>
Date: Fri, 9 May 2025 09:51:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm: mincore: use pte_batch_bint() to batch process
 large folios
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org
Cc: 21cnbao@gmail.com, ryan.roberts@arm.com, dev.jain@arm.com,
 ziy@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <99cb00ee626ceb6e788102ca36821815cd832237.1746697240.git.baolin.wang@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <99cb00ee626ceb6e788102ca36821815cd832237.1746697240.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.05.25 02:45, Baolin Wang wrote:
> When I tested the mincore() syscall, I observed that it takes longer with
> 64K mTHP enabled on my Arm64 server. The reason is the mincore_pte_range()
> still checks each PTE individually, even when the PTEs are contiguous,
> which is not efficient.
> 
> Thus we can use pte_batch_hint() to get the batch number of the present
> contiguous PTEs, which can improve the performance. I tested the mincore()
> syscall with 1G anonymous memory populated with 64K mTHP, and observed an
> obvious performance improvement:
> 
> w/o patch		w/ patch		changes
> 6022us			549us			+91%
> 
> Moreover, I also tested mincore() with disabling mTHP/THP, and did not
> see any obvious regression for base pages.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
> Changes from v2:
> - Re-calculate the max_nr, per Barry.
> Changes from v1:
> - Change to use pte_batch_hint() to get the batch number, per Ryan.
> 
> Note: I observed the min_t() can introduce a slight performance regression
> for base pages, so I change to add a batch size check for base pages,
> which can resolve the performance regression issue.
> ---
>   mm/mincore.c | 22 +++++++++++++++++-----
>   1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/mincore.c b/mm/mincore.c
> index 832f29f46767..42d6c9c8da86 100644
> --- a/mm/mincore.c
> +++ b/mm/mincore.c
> @@ -21,6 +21,7 @@
>   
>   #include <linux/uaccess.h>
>   #include "swap.h"
> +#include "internal.h"
>   
>   static int mincore_hugetlb(pte_t *pte, unsigned long hmask, unsigned long addr,
>   			unsigned long end, struct mm_walk *walk)
> @@ -105,6 +106,7 @@ static int mincore_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>   	pte_t *ptep;
>   	unsigned char *vec = walk->private;
>   	int nr = (end - addr) >> PAGE_SHIFT;
> +	int step, i;
>   
>   	ptl = pmd_trans_huge_lock(pmd, vma);
>   	if (ptl) {
> @@ -118,16 +120,26 @@ static int mincore_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>   		walk->action = ACTION_AGAIN;
>   		return 0;
>   	}
> -	for (; addr != end; ptep++, addr += PAGE_SIZE) {
> +	for (; addr != end; ptep += step, addr += step * PAGE_SIZE) {
>   		pte_t pte = ptep_get(ptep);
>   
> +		step = 1;
>   		/* We need to do cache lookup too for pte markers */
>   		if (pte_none_mostly(pte))
>   			__mincore_unmapped_range(addr, addr + PAGE_SIZE,
>   						 vma, vec);
> -		else if (pte_present(pte))
> -			*vec = 1;
> -		else { /* pte is a swap entry */
> +		else if (pte_present(pte)) {
> +			unsigned int batch = pte_batch_hint(ptep, pte);
> +
> +			if (batch > 1) {
> +				unsigned int max_nr = (end - addr) >> PAGE_SHIFT;

Nit: probably would have called this max_step to match step.

> +
> +				step = min_t(unsigned int, batch, max_nr);
> +			}
> +
> +			for (i = 0; i < step; i++)
> +				vec[i] = 1;

I'm surprised this micro-optimization matters that much. Probably the compiler
defers the calculation of max_nr. I am not convinced we need that level of
micro-optimization in this code ...


But if we're already micro-optimizing, you could have optimized out the loop as
well for order-0:

	unsigned int batch = pte_batch_hint(ptep, pte);
	
	if (batch > 1) {
		unsigned int max_nr = (end - addr) >> PAGE_SHIFT;

		step = min_t(unsigned int, batch, max_nr);
		for (i = 0; i < step; i++)
			vec[i] = 1;
	} else {
		*vec = 1;
	}


In any case

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

