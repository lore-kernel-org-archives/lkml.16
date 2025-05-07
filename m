Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AF6142E77
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746611707; cv=none; b=dihvhJzU/Lsd5EX0xuAEDTyLFyQQVd+YXAPnpN6CnazKZoCISz9wA2u7szBP2KLn4Z4pvCAX0ho5Q5rhlrp++5l0tpRNEWGAiTe55LCeNPxU/7qUCT1/j8k+c3XWfHlTyw9xDOsC3libuDeMGQdjNdLbOttvlsDgFECS7+1lJKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746611707; c=relaxed/simple;
	bh=n6XGoUK8uUf2L0LfNWr2ouLEWWBBRt2tZBaV2HWs100=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=av/ovSjBNSzYDoEddLneV9Oi/rXDDPLyjyirR5VBM83OA3xKJUFN2pL8ShdgUN7GB3wnP+mzNNiK8o4HBAUE+rkV4+XvcmuSrTfAwxsf54Zp8TQLbO93qnyu8/zx5KxUNtNGXumq4UUpEaj+Py97V9xkBPVFnkEaiL8ggzdIR2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UJqXVjMl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UJqXVjMl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746611704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zSfDWkBsK8oZu+WL4cNbDwVvy7S2QgA9Nl9XOOAqIZU=;
	b=UJqXVjMlh5MF1jfnRikLEZMnqM5U+gY+G/cUyXmac6bXTfdVjyqsd7aKOqlEQTSzZkYnR9
	azmAL+cFcoBkfhlbtRXa0oxtbX/XqYdGfFqhZtghHAXgGU3d6s8M/IEY+0saxoofCgZloi
	JYjJUnCkAmuV4DQVqVKhdW5ozpLJa8g=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-iTB1ZwuFNIaX7Kd_HCsSVQ-1; Wed, 07 May 2025 05:55:03 -0400
X-MC-Unique: iTB1ZwuFNIaX7Kd_HCsSVQ-1
X-Mimecast-MFC-AGG-ID: iTB1ZwuFNIaX7Kd_HCsSVQ_1746611702
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22e6c82716dso2591665ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 02:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746611702; x=1747216502;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zSfDWkBsK8oZu+WL4cNbDwVvy7S2QgA9Nl9XOOAqIZU=;
        b=Q/90Tt/G0g3yp5ocVXDLs+gP1EIngACp0FAXw5IiIaquF4OqRNLIqSlHmxe154x4+f
         Wx+fLkzlnBggTK2s4DJTO0gHZuIzmQalAx1uiQZYNBEWtcxd/ACHt3E8nKgDEY5uIwgc
         A9Lu7cfXubRAWFlUYb0052FFgEEg2ZazwYcFnCgEovYr723Sll7w7rRIh6BYFE7dJEjb
         BKf4dBq7IXiYqSXeErhlCirKgKWJUA0yonednFuI2Vpd4TSNWegm9/aD5dGzzQvi0OLH
         Lw8FaNgbCBJo0XGM1EaK4Ap8Lt86Tg1nuK0o0iH4UrNNosI+hsNi55Uox/xNJQ80W/9V
         uhsA==
X-Forwarded-Encrypted: i=1; AJvYcCV8tjqoende7sQP6tDHO4ue7jot9UdvguAulxAeGCrwAjbB2QgFgQ8C/nsGcMT+Wt7kfe311zBQ47W+fYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcATR26h97x30h5Y6XdFJqsMsC5Sxhey/0O0gTAiebx9aSQBfQ
	e0TPmsSNRhOL4xPR4PerlsPqor/05VGKK8DBZlS61rIm6IinOjzIvvGFpkck079DcaNApl/U8d8
	RqORZgwimL3un6VfBQbWSRU5pr/8Q3dbLrVBP7Zs/o9P+Etsia1Z1AvTwf0ErGA==
X-Gm-Gg: ASbGncuBi5fvCPxh+KQIB39cfMiKesU89inWc5K0EwI4tjCi3OYxcRRW4YFKvvxBOxd
	XNsfmC5tj1WnrxBHniNkRp6hTYhlr9yzlIAJ8r47p1iofiCZgtIVKbN1LWB67/dBjq7MaIjGlAH
	opX7LV+ODte8KRu3hiHi7oVQQiai1cUj5531ps4p04sQ6j0ZIDHnzSFpvjCoMlbQ/Q993HQtZHo
	hbL3XB0xN3rdKmNvIehRydGJsaw7b4DWnPlwsoxTfGWXHbLvM7rIZ7sb7s9fGNkWUHquHJiQ8rG
	iWj034JfKmdI2nAzgdY9P0EXsEyWGeHVpAGGBFWb1pr2cr9rLZG4D6B7c7VHm1gSukLf0gJiw8i
	s67+3NtfvoBSbBBguKjlwe3zMPMu3FynJFZ/ZtIQ=
X-Received: by 2002:a17:903:2a84:b0:220:fe36:650c with SMTP id d9443c01a7336-22e619e2226mr45789325ad.23.1746611701892;
        Wed, 07 May 2025 02:55:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/r4dsF4GCF1c/smLA19mxLwkzxTgauy8/CvcoJA20MacvEUTz1fmtODdQ54QDtLIQvsyOuw==
X-Received: by 2002:a17:903:2a84:b0:220:fe36:650c with SMTP id d9443c01a7336-22e619e2226mr45788875ad.23.1746611701502;
        Wed, 07 May 2025 02:55:01 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:d400:ed3c:fb0c:1ec0:c628? (p200300d82f12d400ed3cfb0c1ec0c628.dip0.t-ipconnect.de. [2003:d8:2f12:d400:ed3c:fb0c:1ec0:c628])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228f9csm90036545ad.178.2025.05.07.02.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 02:55:01 -0700 (PDT)
Message-ID: <fc883e4c-41cb-4f05-a5ef-3b756c689da3@redhat.com>
Date: Wed, 7 May 2025 11:54:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm: mincore: use folio_pte_batch() to batch process
 large folios
To: Baolin Wang <baolin.wang@linux.alibaba.com>, Dev Jain <dev.jain@arm.com>,
 akpm@linux-foundation.org, hughd@google.com
Cc: willy@infradead.org, 21cnbao@gmail.com, ryan.roberts@arm.com,
 ziy@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1742960003.git.baolin.wang@linux.alibaba.com>
 <7ad05bc9299de5d954fb21a2da57f46dd6ec59d0.1742960003.git.baolin.wang@linux.alibaba.com>
 <17289428-894a-4397-9d61-c8500d032b28@arm.com>
 <6a8418ba-dbd1-489f-929b-e31831bea0cf@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <6a8418ba-dbd1-489f-929b-e31831bea0cf@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07.05.25 11:48, Baolin Wang wrote:
> 
> 
> On 2025/5/7 13:12, Dev Jain wrote:
>>
>>
>> On 26/03/25 9:08 am, Baolin Wang wrote:
>>> When I tested the mincore() syscall, I observed that it takes longer with
>>> 64K mTHP enabled on my Arm64 server. The reason is the
>>> mincore_pte_range()
>>> still checks each PTE individually, even when the PTEs are contiguous,
>>> which is not efficient.
>>>
>>> Thus we can use folio_pte_batch() to get the batch number of the present
>>> contiguous PTEs, which can improve the performance. I tested the
>>> mincore()
>>> syscall with 1G anonymous memory populated with 64K mTHP, and observed an
>>> obvious performance improvement:
>>>
>>> w/o patch        w/ patch        changes
>>> 6022us            1115us            +81%
>>>
>>> Moreover, I also tested mincore() with disabling mTHP/THP, and did not
>>> see any obvious regression.
>>>
>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>> ---
>>>    mm/mincore.c | 27 ++++++++++++++++++++++-----
>>>    1 file changed, 22 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/mm/mincore.c b/mm/mincore.c
>>> index 832f29f46767..88be180b5550 100644
>>> --- a/mm/mincore.c
>>> +++ b/mm/mincore.c
>>> @@ -21,6 +21,7 @@
>>>    #include <linux/uaccess.h>
>>>    #include "swap.h"
>>> +#include "internal.h"
>>>    static int mincore_hugetlb(pte_t *pte, unsigned long hmask, unsigned
>>> long addr,
>>>                unsigned long end, struct mm_walk *walk)
>>> @@ -105,6 +106,7 @@ static int mincore_pte_range(pmd_t *pmd, unsigned
>>> long addr, unsigned long end,
>>>        pte_t *ptep;
>>>        unsigned char *vec = walk->private;
>>>        int nr = (end - addr) >> PAGE_SHIFT;
>>> +    int step, i;
>>>        ptl = pmd_trans_huge_lock(pmd, vma);
>>>        if (ptl) {
>>> @@ -118,16 +120,31 @@ static int mincore_pte_range(pmd_t *pmd,
>>> unsigned long addr, unsigned long end,
>>>            walk->action = ACTION_AGAIN;
>>>            return 0;
>>>        }
>>> -    for (; addr != end; ptep++, addr += PAGE_SIZE) {
>>> +    for (; addr != end; ptep += step, addr += step * PAGE_SIZE) {
>>>            pte_t pte = ptep_get(ptep);
>>> +        step = 1;
>>>            /* We need to do cache lookup too for pte markers */
>>>            if (pte_none_mostly(pte))
>>>                __mincore_unmapped_range(addr, addr + PAGE_SIZE,
>>>                             vma, vec);
>>> -        else if (pte_present(pte))
>>> -            *vec = 1;
>>> -        else { /* pte is a swap entry */
>>> +        else if (pte_present(pte)) {
>>> +            if (pte_batch_hint(ptep, pte) > 1) {
>>> +                struct folio *folio = vm_normal_folio(vma, addr, pte);
>>> +
>>> +                if (folio && folio_test_large(folio)) {
>>> +                    const fpb_t fpb_flags = FPB_IGNORE_DIRTY |
>>> +                                FPB_IGNORE_SOFT_DIRTY;
>>> +                    int max_nr = (end - addr) / PAGE_SIZE;
>>> +
>>> +                    step = folio_pte_batch(folio, addr, ptep, pte,
>>> +                            max_nr, fpb_flags, NULL, NULL, NULL);
>>> +                }
>>> +            }
>>
>> Can we go ahead with this along with [1], that will help us generalize
>> for all arches.
>>
>> [1] https://lore.kernel.org/all/20250506050056.59250-3-dev.jain@arm.com/
>> (Please replace PAGE_SIZE with 1)
> 
> As discussed with Ryan, we don’t need to call folio_pte_batch()
> (something like the code below), so your patch seems unnecessarily
> complicated. However, David is unhappy about the open-coded
> pte_batch_hint().

I can live with the below :)

Having something more universal does maybe not make sense here. Any form 
of patching contiguous PTEs (contiguous PFNs) -- whether with folios or 
not -- is not required here as we really only want to

(a) Identify pte_present() PTEs
(b) Avoid the cost of repeated ptep_get() with cont-pte.

> 
>    static int mincore_hugetlb(pte_t *pte, unsigned long hmask, unsigned
> long addr,
>                           unsigned long end, struct mm_walk *walk)
> @@ -105,6 +106,7 @@ static int mincore_pte_range(pmd_t *pmd, unsigned
> long addr, unsigned long end,
>           pte_t *ptep;
>           unsigned char *vec = walk->private;
>           int nr = (end - addr) >> PAGE_SHIFT;
> +       int step, i;
> 
>           ptl = pmd_trans_huge_lock(pmd, vma);
>           if (ptl) {
> @@ -118,16 +120,21 @@ static int mincore_pte_range(pmd_t *pmd, unsigned
> long addr, unsigned long end,
>                   walk->action = ACTION_AGAIN;
>                   return 0;
>           }
> -       for (; addr != end; ptep++, addr += PAGE_SIZE) {
> +       for (; addr != end; ptep += step, addr += step * PAGE_SIZE) {
>                   pte_t pte = ptep_get(ptep);
> 
> +               step = 1;
>                   /* We need to do cache lookup too for pte markers */
>                   if (pte_none_mostly(pte))
>                           __mincore_unmapped_range(addr, addr + PAGE_SIZE,
>                                                    vma, vec);
> -               else if (pte_present(pte))
> -                       *vec = 1;
> -               else { /* pte is a swap entry */
> +               else if (pte_present(pte)) {
> +                       unsigned int max_nr = (end - addr) / PAGE_SIZE;
> +
> +                       step = min(pte_batch_hint(ptep, pte), max_nr);
> +                       for (i = 0; i < step; i++)
> +                               vec[i] = 1;
> +               } else { /* pte is a swap entry */
>                           swp_entry_t entry = pte_to_swp_entry(pte);
> 
>                           if (non_swap_entry(entry)) {
> @@ -146,7 +153,7 @@ static int mincore_pte_range(pmd_t *pmd, unsigned
> long addr, unsigned long end,
>    #endif
>                           }
>                   }
> -               vec++;
> +               vec += step;
>           }
>           pte_unmap_unlock(ptep - 1, ptl);
>    out:
> 


-- 
Cheers,

David / dhildenb

