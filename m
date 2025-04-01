Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF3AEACE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743512693; cv=none; b=M0Mc03rQT0yNE0hJSDgFaaF2c6sMCm6pjnQnVkLAn+zeMNFrhmnfCzQRy97YWuBpiG4kzzKJAyxoJbHsY0L/mKiKh4/vyA/PatMaDSYI4V40iQMGcw+P65RDh0Lpk/86hD9Q3ufsoALFSu5VkxU2XirnwHjM6cUjwjb1NZyIwK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743512693; c=relaxed/simple;
	bh=pr6yC+2D3bR5Hx7mD7Sb7hZ/pU4NSSY9mHzyZB/BRaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s9HVLCVAEPK8tPhyMUzEn9YlZWacJBDStxaFbD2QuLTkCYBUuCjeABfGnCvkIZ5u0vm6uO5JO9ihVBLUar1xmMs48yUqQnbjKyvp4P5IL6w714lzij589yJiexipgopYhblkwuihuGlM4F12AuilrAhnob9UCgHe8wrA2d1Fw7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gmV+IsMB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gmV+IsMB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743512690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=n8BB7EKV5gpEEv3CHipCZZYz4tX32SscN93L52bCYsw=;
	b=gmV+IsMBl767CRc/BvsB3HywyzQSIwmPvPVZPquWwyXDMlO/zC3RNTGPdvS5rpOxl0zfhl
	D+gru1AMNUsdKSnfsWEpxvefKxW8Q8PyX7+UEAL+19r/YmBtWHew/vuXUwXeqguegdKlDN
	GbpIn98UKf1OMPOx6Sq5+KM0USXG0Io=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-jgdgvR0xNuq16nd_XEXruA-1; Tue, 01 Apr 2025 09:04:49 -0400
X-MC-Unique: jgdgvR0xNuq16nd_XEXruA-1
X-Mimecast-MFC-AGG-ID: jgdgvR0xNuq16nd_XEXruA_1743512688
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4394c489babso26575845e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 06:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743512687; x=1744117487;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n8BB7EKV5gpEEv3CHipCZZYz4tX32SscN93L52bCYsw=;
        b=xSglgZMqwBI4cWqxK0zic4Xn3xR54ZvoCGjU9JvZgkzedCLzrgAUGSto+OcVnDXQL6
         A4zerOEN+FO7vKhvleyZqW46Jj9RG1ZWt7cDC0DchrvFrwJowl9OzSikAp13KG6PgZYy
         7J/mGCys2ybegUE7CGksV5rpxplZwYMek5VLKfQ2JlYOT8OvRVA/aOSqDinKn+vT/J+T
         j087WJBY+BPaCWYsh6kutQG1PmrGgAgL1NLyWPV1cMRjDYyMFxPiiBoG89oxlCja3kZ9
         KxfELL1JZcTw+e7pS07xXmkcqmO8KketU1+/7+A5VMjmfS0Z7wmWEW3+9s5grnPK1Jna
         BfDg==
X-Forwarded-Encrypted: i=1; AJvYcCXv/KIap6IJS3sBP9MjEZBdX6x5b/HPwBewPU0BYwpu6/vG8k673LnJA1v2r5UdR+1zi385AA+DeXamhVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC1wxz7GTh09CFvVNYCJiiMNPcQFqU0eKfyYKQhRGLgkZTmTuD
	x4fWoB5wlM+NxGCaogbA+FdqEREevwvILZe36+r7Wmbt+XdeRr/ZdQCKiMvhrPRSxmLy1PQAhOP
	OYpzArnEwYbjTH1NgHbJdah2PN02rGj/zdjSWNSLHZUhkc1uqGz0Ughe8TVtKRA==
X-Gm-Gg: ASbGnct2RQrKYsW3fF5hOJcqLgQnDnBGbyWJjXzpsgRAYKsx8jpIuMgqmNKLintcDTn
	SCWVsN1fyw02hx4aGpaEat5gp51xWRDpjYe68QUe/8N6tvjMgYeoy0ErMeUHPSugaCuenBbNCaa
	lkkMJF/s0zbPvTUj7EdTqhvqlMHDum9F0hk5R7fNdZwUyjKHoG3FP8y5faznd4T3VPCB97KwjUM
	+cIN6JXBF4wvluoOkcnbqxYElxMXgC/cdiM3uob0ohZKYOfTtDKfX/6AFZEtDyL4HLDUmH12rhc
	yC4SWrfBAUe7ZHHqCp1kFjEo33X/+F2P23aeSABuA2EruOkjvFiUorSIhrhq7C991xqXUpLUHQL
	qmQbI+HmJ6mBI1h/ruMQ53FKIr/Jz1leN1HsMlX8V
X-Received: by 2002:a05:600c:5108:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-43db6247df8mr102708145e9.15.1743512687505;
        Tue, 01 Apr 2025 06:04:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZaFH9YOPFAqZw4+1x6b8N1NX30tP4RYt0TD+wiea0oH4ReSECVh5UL+GHJJHvZ3eIdETk9w==
X-Received: by 2002:a05:600c:5108:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-43db6247df8mr102705235e9.15.1743512685318;
        Tue, 01 Apr 2025 06:04:45 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:4d00:6ac5:30d:1611:918f? (p200300cbc7074d006ac5030d1611918f.dip0.t-ipconnect.de. [2003:cb:c707:4d00:6ac5:30d:1611:918f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d830f5b41sm204350705e9.27.2025.04.01.06.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 06:04:44 -0700 (PDT)
Message-ID: <d17b69a1-2f22-4a8d-8260-ddea38ebc7b0@redhat.com>
Date: Tue, 1 Apr 2025 15:04:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm: mincore: use folio_pte_batch() to batch process
 large folios
To: Ryan Roberts <ryan.roberts@arm.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hughd@google.com
Cc: willy@infradead.org, 21cnbao@gmail.com, ziy@nvidia.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1742960003.git.baolin.wang@linux.alibaba.com>
 <7ad05bc9299de5d954fb21a2da57f46dd6ec59d0.1742960003.git.baolin.wang@linux.alibaba.com>
 <54886038-3707-4ea0-bd84-00a8f4a19a6a@arm.com>
 <f6f4f4ff-0074-4ba7-b2a5-02727661843c@linux.alibaba.com>
 <145ec273-7223-45b8-a7f6-4e593a3cc8ee@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <145ec273-7223-45b8-a7f6-4e593a3cc8ee@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01.04.25 12:45, Ryan Roberts wrote:
> On 30/03/2025 15:57, Baolin Wang wrote:
>>
>>
>> On 2025/3/27 22:08, Ryan Roberts wrote:
>>> On 25/03/2025 23:38, Baolin Wang wrote:
>>>> When I tested the mincore() syscall, I observed that it takes longer with
>>>> 64K mTHP enabled on my Arm64 server. The reason is the mincore_pte_range()
>>>> still checks each PTE individually, even when the PTEs are contiguous,
>>>> which is not efficient.
>>>>
>>>> Thus we can use folio_pte_batch() to get the batch number of the present
>>>> contiguous PTEs, which can improve the performance. I tested the mincore()
>>>> syscall with 1G anonymous memory populated with 64K mTHP, and observed an
>>>> obvious performance improvement:
>>>>
>>>> w/o patch        w/ patch        changes
>>>> 6022us            1115us            +81%
>>>>
>>>> Moreover, I also tested mincore() with disabling mTHP/THP, and did not
>>>> see any obvious regression.
>>>>
>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>> ---
>>>>    mm/mincore.c | 27 ++++++++++++++++++++++-----
>>>>    1 file changed, 22 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/mm/mincore.c b/mm/mincore.c
>>>> index 832f29f46767..88be180b5550 100644
>>>> --- a/mm/mincore.c
>>>> +++ b/mm/mincore.c
>>>> @@ -21,6 +21,7 @@
>>>>      #include <linux/uaccess.h>
>>>>    #include "swap.h"
>>>> +#include "internal.h"
>>>>      static int mincore_hugetlb(pte_t *pte, unsigned long hmask, unsigned long
>>>> addr,
>>>>                unsigned long end, struct mm_walk *walk)
>>>> @@ -105,6 +106,7 @@ static int mincore_pte_range(pmd_t *pmd, unsigned long
>>>> addr, unsigned long end,
>>>>        pte_t *ptep;
>>>>        unsigned char *vec = walk->private;
>>>>        int nr = (end - addr) >> PAGE_SHIFT;
>>>> +    int step, i;
>>>>          ptl = pmd_trans_huge_lock(pmd, vma);
>>>>        if (ptl) {
>>>> @@ -118,16 +120,31 @@ static int mincore_pte_range(pmd_t *pmd, unsigned long
>>>> addr, unsigned long end,
>>>>            walk->action = ACTION_AGAIN;
>>>>            return 0;
>>>>        }
>>>> -    for (; addr != end; ptep++, addr += PAGE_SIZE) {
>>>> +    for (; addr != end; ptep += step, addr += step * PAGE_SIZE) {
>>>>            pte_t pte = ptep_get(ptep);
>>>>    +        step = 1;
>>>>            /* We need to do cache lookup too for pte markers */
>>>>            if (pte_none_mostly(pte))
>>>>                __mincore_unmapped_range(addr, addr + PAGE_SIZE,
>>>>                             vma, vec);
>>>> -        else if (pte_present(pte))
>>>> -            *vec = 1;
>>>> -        else { /* pte is a swap entry */
>>>> +        else if (pte_present(pte)) {
>>>> +            if (pte_batch_hint(ptep, pte) > 1) {
>>>> +                struct folio *folio = vm_normal_folio(vma, addr, pte);
>>>> +
>>>> +                if (folio && folio_test_large(folio)) {
>>>> +                    const fpb_t fpb_flags = FPB_IGNORE_DIRTY |
>>>> +                                FPB_IGNORE_SOFT_DIRTY;
>>>> +                    int max_nr = (end - addr) / PAGE_SIZE;
>>>> +
>>>> +                    step = folio_pte_batch(folio, addr, ptep, pte,
>>>> +                            max_nr, fpb_flags, NULL, NULL, NULL);
>>>> +                }
>>>> +            }
>>>
>>> You could simplify to the following, I think, to avoid needing to grab the folio
>>> and call folio_pte_batch():
>>>
>>>              else if (pte_present(pte)) {
>>>                  int max_nr = (end - addr) / PAGE_SIZE;
>>>                  step = min(pte_batch_hint(ptep, pte), max_nr);
>>>              } ...
>>>
>>> I expect the regression you are seeing here is all due to calling ptep_get() for
>>> every pte in the contpte batch, which will cause 16 memory reads per pte (to
>>> gather the access/dirty bits). For small folios its just 1 read per pte.
>>
>> Right.
>>
>>> pte_batch_hint() will skip forward in blocks of 16 so you now end up with the
>>> same number as for the small folio case. You don't need all the fancy extras
>>> that folio_pte_batch() gives you here.
>>
>> Sounds reasonable. Your suggestion looks simple, but my method can batch the
>> whole large folio (such as large folios containing more than 16 contiguous PTEs)
>> at once.
> 
> Sure but folio_pte_batch() just implements that with another loop that calls
> pte_batch_hint(), so it all amounts to the same thing. In fact there are some
> extra checks in folio_pte_batch() that you don't need so it might be a bit slower.

I don't enjoy open-coding the batching, especially if only cont-pte 
users will benefit from it. But I also don't enjoy the open-coded 
pte_batch_hint() :)

But we really don't need the folio here, so I assume the short variant 
you (Ryan) suggest is alright to just avoid the ptep_get().

As Oscar says, these details might soon be hidden inside a new page 
table walker API (even though it will likely end up using 
folio_pte_batch() internally, TBD).

-- 
Cheers,

David / dhildenb

