Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EE9232368
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793771; cv=none; b=gmTdUfoMpap+8fC2CQZfQFusnbsuauOhC8+9fALohcfjMN6b+XlYr5zQG9ImJ6XFSEoJ01cZ/v3e+H7DvPRkwOc2SiXkFNVS4Rw0kxtYXMTIuWDE78ob7hLDvlYLXGRiNZJVhWVai7/VT/SrwiLFUIIb/mzJjnOwGDZ9z3p7Wj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793771; c=relaxed/simple;
	bh=s3CELIGPzR0WRsM2PP4vAE3IzK4WYMFbVZ0zNQp6l0Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=C6mecTqqO8YijJ16VMwjHh9CLe40OHDb7Lxq97miLPq+icbtwkDnoNh32gfFUeJjIooio77aB+Fg3835/bOTLnHAw32nsmxu2tmEBYO/qj8lJf+Zzc0EQ+K1wTfx12bMYA723MLSCYv8R1ASWrkHAq9Gncfj0xHcf6Vip05dRR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HO/Z/8Ta; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HO/Z/8Ta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744793767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/b4ncp271t0ndQIqnuTGHF/WTgbEd3GAjh59v8EuXU4=;
	b=HO/Z/8TaeiYym8tXmrmqGqpGheHw36h3BdZ/NgbgqHQRshTlpKiK2O1+yPVn2kzjng9xwi
	UTJA49HybYsr3bBLcs0C+J5CAr5rxDNQb3O7vLbe5qcYeSBbWQI9LnTMlI8XvovkHFbomN
	Tk5HRUchoDTZii5v6SPWMbJXztU8iLw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-agpG3pjIMy6W7gwBk5DnwQ-1; Wed, 16 Apr 2025 04:56:06 -0400
X-MC-Unique: agpG3pjIMy6W7gwBk5DnwQ-1
X-Mimecast-MFC-AGG-ID: agpG3pjIMy6W7gwBk5DnwQ_1744793765
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-391492acb59so3631851f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744793765; x=1745398565;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/b4ncp271t0ndQIqnuTGHF/WTgbEd3GAjh59v8EuXU4=;
        b=mHHHdNV10nPY0lJlWrFTHMn9VV7hURxq4eyIlQl1i6InhjfcNh0v3Mj1UwmBB1WIps
         x1+tEWf04SWYOKNR5TZZuNm+KSbjFFY8JdHCnTMJlfd2J8/bXOdNper/43MmsGmaJfGf
         SiOfe3s2+yLqCAx+F6bPXJ36A+lp1zBoJJMkmSokz1YpZAQk3cJYWRsqmDED6dO6y5mu
         zezxGtZC2MwJIzXAXKs14G/EjD/ulKaKis98QcfN2Yz+MuJWWiGl3Utv1dDq43ItpeO2
         ymicJqDnHp00TVh33EUWevJPWHiTHV82ivw+0NxmsR0cmqdMde4ZfWFkeZnt8Id4NSFC
         noFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb3oM7Zsa/LniwKDblqNeDyexnx8MYpeqREBkfYDTjJK9fkLbjt/iVBHgww7XFoaHijJltjh5PSwmtVaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVQrJL5jUDWMIi06jJpcZE72oUUxSIsNy4d2364LLt0p0k2DNT
	PzFpBvbCEHaiewx3qhIq2FYCW0TxmTrfOtL/+9P6BkYrJhvy7tL6wL/gUwr5KLLsnrpPnsoKK6U
	aZJSNjj5/FzmcriNUYSWFwIQeInGGTYeo5eou2uccRfsPr4OhVAJyAy3tNmA5Wg==
X-Gm-Gg: ASbGncsdRj0rQXCqQD2L7vDQ7zWYKxXbkgGEFP5W4sGcqcQ4PIzfASroTLA3VdD7+hJ
	y65X0yuI5953yn+LabNiKEd/c3zL6VF4tQPxr2jlR654F1Upn7I8TO/nv/3/SDfageCV4UNNKX3
	FzUQ+7yWbCXvZVJ8sr9wsGqK6I7cLQWuCnxHX2otKxj9ygIZsXVpmWJwmp2uDyQLCNHLwCPy7GZ
	LqwnsQF6qrAM7vVlCkxSFIV7TNCtNKleOgGNTdYdHeBFToFn03Lu7wBgzpvHj6PnQjpNc/7lkJj
	eSJ4Idf5/6B0lLMbtRpUCoDOFBTw0AYj2Q7ggKinWe90FzdSsHE0gKjza+zqdxHKtzzMFXo6dBl
	oU5LGIIwMYW5KOL+JGZkpo2z5FH1q7JrbKG6aWw==
X-Received: by 2002:a5d:648c:0:b0:391:122c:8b2 with SMTP id ffacd0b85a97d-39ee5b1cb1amr1033792f8f.31.1744793765236;
        Wed, 16 Apr 2025 01:56:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1wo1+dvDVuD9rPW2MQ+hSjAIwnfub6e/NjUxGKnKiKVp+OBbxuI/0l2iHcOTeX2v3wkwOaA==
X-Received: by 2002:a5d:648c:0:b0:391:122c:8b2 with SMTP id ffacd0b85a97d-39ee5b1cb1amr1033762f8f.31.1744793764750;
        Wed, 16 Apr 2025 01:56:04 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c02esm16284750f8f.23.2025.04.16.01.56.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 01:56:04 -0700 (PDT)
Message-ID: <be88bfc7-ea89-4cef-bbce-3572d3902481@redhat.com>
Date: Wed, 16 Apr 2025 10:56:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mempolicy: Optimize queue_folios_pte_range by PTE
 batching
From: David Hildenbrand <david@redhat.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>, Dev Jain <dev.jain@arm.com>,
 akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, hughd@google.com, vishal.moola@gmail.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250416053048.96479-1-dev.jain@arm.com>
 <7f96283b-11b3-49ee-9d2d-5ad977325cb0@linux.alibaba.com>
 <019d1c4a-ffd0-4602-b2ba-cf07379dab17@redhat.com>
 <7392a21b-10bf-4ce9-a6fd-807ed954c138@linux.alibaba.com>
 <8b387a53-40e0-40d1-8bfa-b7524657a7dd@redhat.com>
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
In-Reply-To: <8b387a53-40e0-40d1-8bfa-b7524657a7dd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16.04.25 10:51, David Hildenbrand wrote:
> On 16.04.25 10:41, Baolin Wang wrote:
>>
>>
>> On 2025/4/16 16:22, David Hildenbrand wrote:
>>> On 16.04.25 08:32, Baolin Wang wrote:
>>>>
>>>>
>>>> On 2025/4/16 13:30, Dev Jain wrote:
>>>>> After the check for queue_folio_required(), the code only cares about
>>>>> the
>>>>> folio in the for loop, i.e the PTEs are redundant. Therefore, optimize
>>>>> this loop by skipping over a PTE batch mapping the same folio.
>>>>>
>>>>> With a test program migrating pages of the calling process, which
>>>>> includes
>>>>> a mapped VMA of size 4GB with pte-mapped large folios of order-9, and
>>>>> migrating once back and forth node-0 and node-1, the average execution
>>>>> time reduces from 7.5 to 4 seconds, giving an approx 47% speedup.
>>>>>
>>>>> v2->v3:
>>>>>      - Don't use assignment in if condition
>>>>>
>>>>> v1->v2:
>>>>>      - Follow reverse xmas tree declarations
>>>>>      - Don't initialize nr
>>>>>      - Move folio_pte_batch() immediately after retrieving a normal folio
>>>>>      - increment nr_failed in one shot
>>>>>
>>>>> Acked-by: David Hildenbrand <david@redhat.com>
>>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>>> ---
>>>>>      mm/mempolicy.c | 12 ++++++++++--
>>>>>      1 file changed, 10 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
>>>>> index b28a1e6ae096..4d2dc8b63965 100644
>>>>> --- a/mm/mempolicy.c
>>>>> +++ b/mm/mempolicy.c
>>>>> @@ -566,6 +566,7 @@ static void queue_folios_pmd(pmd_t *pmd, struct
>>>>> mm_walk *walk)
>>>>>      static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>>>>>                  unsigned long end, struct mm_walk *walk)
>>>>>      {
>>>>> +    const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>>>>          struct vm_area_struct *vma = walk->vma;
>>>>>          struct folio *folio;
>>>>>          struct queue_pages *qp = walk->private;
>>>>> @@ -573,6 +574,7 @@ static int queue_folios_pte_range(pmd_t *pmd,
>>>>> unsigned long addr,
>>>>>          pte_t *pte, *mapped_pte;
>>>>>          pte_t ptent;
>>>>>          spinlock_t *ptl;
>>>>> +    int max_nr, nr;
>>>>>          ptl = pmd_trans_huge_lock(pmd, vma);
>>>>>          if (ptl) {
>>>>> @@ -586,7 +588,9 @@ static int queue_folios_pte_range(pmd_t *pmd,
>>>>> unsigned long addr,
>>>>>              walk->action = ACTION_AGAIN;
>>>>>              return 0;
>>>>>          }
>>>>> -    for (; addr != end; pte++, addr += PAGE_SIZE) {
>>>>> +    for (; addr != end; pte += nr, addr += nr * PAGE_SIZE) {
>>>>> +        max_nr = (end - addr) >> PAGE_SHIFT;
>>>>> +        nr = 1;
>>>>>              ptent = ptep_get(pte);
>>>>>              if (pte_none(ptent))
>>>>>                  continue;
>>>>> @@ -598,6 +602,10 @@ static int queue_folios_pte_range(pmd_t *pmd,
>>>>> unsigned long addr,
>>>>>              folio = vm_normal_folio(vma, addr, ptent);
>>>>>              if (!folio || folio_is_zone_device(folio))
>>>>>                  continue;
>>>>> +        if (folio_test_large(folio) && max_nr != 1)
>>>>> +            nr = folio_pte_batch(folio, addr, pte, ptent,
>>>>> +                         max_nr, fpb_flags,
>>>>> +                         NULL, NULL, NULL);
>>>>>              /*
>>>>>               * vm_normal_folio() filters out zero pages, but there might
>>>>>               * still be reserved folios to skip, perhaps in a VDSO.
>>>>> @@ -630,7 +638,7 @@ static int queue_folios_pte_range(pmd_t *pmd,
>>>>> unsigned long addr,
>>>>>              if (!(flags & (MPOL_MF_MOVE | MPOL_MF_MOVE_ALL)) ||
>>>>>                  !vma_migratable(vma) ||
>>>>>                  !migrate_folio_add(folio, qp->pagelist, flags)) {
>>>>> -            qp->nr_failed++;
>>>>> +            qp->nr_failed += nr;
>>>>
>>>> Sorry for chiming in late, but I am not convinced that 'qp->nr_failed'
>>>> should add 'nr' when isolation fails.
>>>
>>> This patch does not change the existing behavior. But I stumbled over
>>> that as well ... and scratched my head.
>>>
>>>>
>>>>     From the comments of queue_pages_range():
>>>> "
>>>> * >0 - this number of misplaced folios could not be queued for moving
>>>>      *      (a hugetlbfs page or a transparent huge page being counted
>>>> as 1).
>>>> "
>>>>
>>>> That means if a large folio is failed to isolate, we should only add '1'
>>>> for qp->nr_failed instead of the number of pages in this large folio.
>>>> Right?
>>>
>>> I think what the doc really meant is "PMD-mapped THP". PTE-mapped THPs
>>> always had the same behavior: per PTE of the THP we would increment
>>> nr_failed by 1.
>>
>> No? For pte-mapped THPs, it only adds 1 for the large folio, since we
>> have below check in queue_folios_pte_range().
>>
>> if (folio == qp->large)
>> 	continue;
>>
>> Or I missed anything else?
> 
> Ah, I got confused by that and thought it would only be for LRU
> isolation purposes.
> 
> Yeah, it will kind-of work for now and I think you are correct that we
> would only increment nr_failed by 1.
> 
> I still think that counting nr_failed that way is dubious. We should be
> counting pages, which is something that user space from migrate_pages()
> could understand. Having it count arbitrary THPs/large folio sizes is
> really questionable.
> 
> But that is indeed a separate issue to resolve.

Digging into it:

commit 1cb5d11a370f661c5d0d888bb0cfc2cdc5791382
Author: Hugh Dickins <hughd@google.com>
Date:   Tue Oct 3 02:17:43 2023 -0700

     mempolicy: fix migrate_pages(2) syscall return nr_failed
     
     "man 2 migrate_pages" says "On success migrate_pages() returns the number
     of pages that could not be moved".  Although 5.3 and 5.4 commits fixed
     mbind(MPOL_MF_STRICT|MPOL_MF_MOVE*) to fail with EIO when not all pages
     could be moved (because some could not be isolated for migration),
     migrate_pages(2) was left still reporting only those pages failing at the
     migration stage, forgetting those failing at the earlier isolation stage.
     
     Fix that by accumulating a long nr_failed count in struct queue_pages,
     returned by queue_pages_range() when it's not returning an error, for
     adding on to the nr_failed count from migrate_pages() in mm/migrate.c.  A
     count of pages?  It's more a count of folios, but changing it to pages
     would entail more work (also in mm/migrate.c): does not seem justified.

Yeah, we should be counting pages, but likely nobody really cares, because we
only care if everything was migrated or something was not migrated.

-- 
Cheers,

David / dhildenb

