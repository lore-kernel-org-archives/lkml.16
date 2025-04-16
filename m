Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4F3230BD6
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793536; cv=none; b=Hr1mdiv55pOUY435nmmGhfC6/Fh8M6dNKfNp4JOJwXM8bj6MeeuuZjM0FNz+A7zKzkWVxSt2NxZRIAYeqg9lPRUU8FlOHyglI809pB3x+eOnsVzX3kapYfnfAKVsIsDJ2RwIyePbvJvkk3/qeDvo4dUTY7FwNscGVAxjJ60vGSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793536; c=relaxed/simple;
	bh=gUvFjg8XYwfRODENCsL7tCpFOhu1dyxzsoC4CjAL1Ls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BmsPi5Uk+Xgp2n9hHIuFEcw+S6aNI5Rk66vdRZr4Z1AE3OnDugqlH7y1kwxnpW2NwMJKlQXYUCGGFFDb7qFBkw5T9e++NdZ47shkz1ffFqFmxglLtO2xyoigrl4zGWSbVu/3sa/kc73c/1gzLfHCQKtkKutJOtpsYzCHMinx5y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CAaxYhg6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CAaxYhg6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744793529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NhVqw4Ar1jXZxr2wztDNhgWh0er+EtWycdOEp3EQ4gM=;
	b=CAaxYhg6giWamBY1swlIL9wrEqeDp1KrUjEpkJPKl5SAyYKVPkqOzJf+I3KJ7xO7LLjLnE
	HAkBpwYbW6keEq5huC0aJGmVtc2dHoIi59+/u3laitt/rMdL1CMY4RJkqCrPUBJ08fE/lc
	ecaZ/5mXSOz+QSMY58aIUqVx5qYjN4g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-6IlgH9N3MR2KjroMBZS4YQ-1; Wed, 16 Apr 2025 04:52:02 -0400
X-MC-Unique: 6IlgH9N3MR2KjroMBZS4YQ-1
X-Mimecast-MFC-AGG-ID: 6IlgH9N3MR2KjroMBZS4YQ_1744793521
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39135d31ca4so276338f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744793521; x=1745398321;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NhVqw4Ar1jXZxr2wztDNhgWh0er+EtWycdOEp3EQ4gM=;
        b=VDPtfiFVQG7jat2Yov2GP+j83u/fkKoPadOzUxJT1fKgGBF7aU2zKeuuMjzSkVuSv6
         NGKqmdKTIlWH3eHuBhmTibFl+9+QRvcQBXIqfZLMj8vO4qi/SUdRcrK8LNqDA6a1Evss
         cTACVvY8M+1nG0Mq33frtISRs6Ft1zwzUyJpW9jxOCerpRj5QmWFzacIpHSeIaVVojKI
         GhymCgkLO8JGzTn95k+BQg+JTrJxKzwNwAJVaSB95uWDLCFLEeIIF1riXx5IVAQ831jO
         TVFPfr74YUusYxzmT6nG3crm2WM6XO7FFQQVVaAzjVTn4HB2zsddnaQoB/3pdo+N66Ew
         iunA==
X-Forwarded-Encrypted: i=1; AJvYcCW73gDeWCISu7n95CeTivJTXKeqrscaKlTuHAiVD7jTDPRh9fmw9LFOvjb7rd7lxKTuwTPhhnXfW3sQ4Tk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxynaZpwSopHRxDkQREJqxO6p3DF5Qd2PLHfI2t1miCS5hLWjzv
	w8oAso+OtgpKHQgi4o3uVJG+72WYdMU3CtTUB8Oaw+bDt+s7P10qTNNZy7Eo87w/6k5R5yVY047
	dwqFA5JWQreLPrhP+jicWLXz2Fk9XaYhe2zjTXbUuJKQXPEhaizzbABSCYB7doOhwb1bjwhOz9v
	0=
X-Gm-Gg: ASbGnctsfUEjlGkBXOZuD54g3LzeHog0YTRW5OsXsLhx04JEDzgEufN9DAP5NAOtkPF
	n+jHQ0pYBA1ZbPS+3ViyxH4/0DnHLWxi4Qlj63HVlKfwd1mtpmcOqEvuRtiYKSQH9An4YjF+1+Y
	jSpmfg1I8p1nLk5Ah0up24AltEbvQuru31VdftKhfMP9YyOYeoSRkoY43ZAlmlnvsSExkeTDZo3
	kyg0kHhELgg5bf5z6jIYSLi7oyU0SynDvh1JYCybhreRcTJzocabmMesxYEwp5SbKy5mMPohd6H
	RRl20LrkjyNYRg+27T9ugypaotOlUsyikn3w5dBrIBykcZq1oe3sdTGYJVSh4I2nEfJjddYZNzA
	pm/jKHODWBb2UnnHMFt+uY6uSsPKUgM3qjq/90A==
X-Received: by 2002:a05:6000:184c:b0:391:3207:2e68 with SMTP id ffacd0b85a97d-39ee5e9b09amr962415f8f.9.1744793520730;
        Wed, 16 Apr 2025 01:52:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5qajaPEsTgVC5aViq9Iz00BX9NTLaVHSwJmqi5hZECXRe/JgmtMk48u1duqUBA1TBUwBPOQ==
X-Received: by 2002:a05:6000:184c:b0:391:3207:2e68 with SMTP id ffacd0b85a97d-39ee5e9b09amr962397f8f.9.1744793520320;
        Wed, 16 Apr 2025 01:52:00 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4f39b1sm14556675e9.22.2025.04.16.01.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 01:51:59 -0700 (PDT)
Message-ID: <8b387a53-40e0-40d1-8bfa-b7524657a7dd@redhat.com>
Date: Wed, 16 Apr 2025 10:51:58 +0200
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
 <019d1c4a-ffd0-4602-b2ba-cf07379dab17@redhat.com>
 <7392a21b-10bf-4ce9-a6fd-807ed954c138@linux.alibaba.com>
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
In-Reply-To: <7392a21b-10bf-4ce9-a6fd-807ed954c138@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16.04.25 10:41, Baolin Wang wrote:
> 
> 
> On 2025/4/16 16:22, David Hildenbrand wrote:
>> On 16.04.25 08:32, Baolin Wang wrote:
>>>
>>>
>>> On 2025/4/16 13:30, Dev Jain wrote:
>>>> After the check for queue_folio_required(), the code only cares about
>>>> the
>>>> folio in the for loop, i.e the PTEs are redundant. Therefore, optimize
>>>> this loop by skipping over a PTE batch mapping the same folio.
>>>>
>>>> With a test program migrating pages of the calling process, which
>>>> includes
>>>> a mapped VMA of size 4GB with pte-mapped large folios of order-9, and
>>>> migrating once back and forth node-0 and node-1, the average execution
>>>> time reduces from 7.5 to 4 seconds, giving an approx 47% speedup.
>>>>
>>>> v2->v3:
>>>>     - Don't use assignment in if condition
>>>>
>>>> v1->v2:
>>>>     - Follow reverse xmas tree declarations
>>>>     - Don't initialize nr
>>>>     - Move folio_pte_batch() immediately after retrieving a normal folio
>>>>     - increment nr_failed in one shot
>>>>
>>>> Acked-by: David Hildenbrand <david@redhat.com>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>>     mm/mempolicy.c | 12 ++++++++++--
>>>>     1 file changed, 10 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
>>>> index b28a1e6ae096..4d2dc8b63965 100644
>>>> --- a/mm/mempolicy.c
>>>> +++ b/mm/mempolicy.c
>>>> @@ -566,6 +566,7 @@ static void queue_folios_pmd(pmd_t *pmd, struct
>>>> mm_walk *walk)
>>>>     static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>>>>                 unsigned long end, struct mm_walk *walk)
>>>>     {
>>>> +    const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>>>         struct vm_area_struct *vma = walk->vma;
>>>>         struct folio *folio;
>>>>         struct queue_pages *qp = walk->private;
>>>> @@ -573,6 +574,7 @@ static int queue_folios_pte_range(pmd_t *pmd,
>>>> unsigned long addr,
>>>>         pte_t *pte, *mapped_pte;
>>>>         pte_t ptent;
>>>>         spinlock_t *ptl;
>>>> +    int max_nr, nr;
>>>>         ptl = pmd_trans_huge_lock(pmd, vma);
>>>>         if (ptl) {
>>>> @@ -586,7 +588,9 @@ static int queue_folios_pte_range(pmd_t *pmd,
>>>> unsigned long addr,
>>>>             walk->action = ACTION_AGAIN;
>>>>             return 0;
>>>>         }
>>>> -    for (; addr != end; pte++, addr += PAGE_SIZE) {
>>>> +    for (; addr != end; pte += nr, addr += nr * PAGE_SIZE) {
>>>> +        max_nr = (end - addr) >> PAGE_SHIFT;
>>>> +        nr = 1;
>>>>             ptent = ptep_get(pte);
>>>>             if (pte_none(ptent))
>>>>                 continue;
>>>> @@ -598,6 +602,10 @@ static int queue_folios_pte_range(pmd_t *pmd,
>>>> unsigned long addr,
>>>>             folio = vm_normal_folio(vma, addr, ptent);
>>>>             if (!folio || folio_is_zone_device(folio))
>>>>                 continue;
>>>> +        if (folio_test_large(folio) && max_nr != 1)
>>>> +            nr = folio_pte_batch(folio, addr, pte, ptent,
>>>> +                         max_nr, fpb_flags,
>>>> +                         NULL, NULL, NULL);
>>>>             /*
>>>>              * vm_normal_folio() filters out zero pages, but there might
>>>>              * still be reserved folios to skip, perhaps in a VDSO.
>>>> @@ -630,7 +638,7 @@ static int queue_folios_pte_range(pmd_t *pmd,
>>>> unsigned long addr,
>>>>             if (!(flags & (MPOL_MF_MOVE | MPOL_MF_MOVE_ALL)) ||
>>>>                 !vma_migratable(vma) ||
>>>>                 !migrate_folio_add(folio, qp->pagelist, flags)) {
>>>> -            qp->nr_failed++;
>>>> +            qp->nr_failed += nr;
>>>
>>> Sorry for chiming in late, but I am not convinced that 'qp->nr_failed'
>>> should add 'nr' when isolation fails.
>>
>> This patch does not change the existing behavior. But I stumbled over
>> that as well ... and scratched my head.
>>
>>>
>>>    From the comments of queue_pages_range():
>>> "
>>> * >0 - this number of misplaced folios could not be queued for moving
>>>     *      (a hugetlbfs page or a transparent huge page being counted
>>> as 1).
>>> "
>>>
>>> That means if a large folio is failed to isolate, we should only add '1'
>>> for qp->nr_failed instead of the number of pages in this large folio.
>>> Right?
>>
>> I think what the doc really meant is "PMD-mapped THP". PTE-mapped THPs
>> always had the same behavior: per PTE of the THP we would increment
>> nr_failed by 1.
> 
> No? For pte-mapped THPs, it only adds 1 for the large folio, since we
> have below check in queue_folios_pte_range().
> 
> if (folio == qp->large)
> 	continue;
> 
> Or I missed anything else?

Ah, I got confused by that and thought it would only be for LRU 
isolation purposes.

Yeah, it will kind-of work for now and I think you are correct that we 
would only increment nr_failed by 1.

I still think that counting nr_failed that way is dubious. We should be 
counting pages, which is something that user space from migrate_pages() 
could understand. Having it count arbitrary THPs/large folio sizes is 
really questionable.

But that is indeed a separate issue to resolve.

-- 
Cheers,

David / dhildenb

