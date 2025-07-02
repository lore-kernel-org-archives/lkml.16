Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2F823D29C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447389; cv=none; b=sRSnAup6IZm1fMrWM38InYGNHDnMNrnP9w5qp1AWkGxvaiV4fiQVPTOqeCzN4qp0yEwmRKd9tMTP6HOHE+8M0e/ISmMhbrPQv6mhhd3t4pAYjKXMrITcziL8iuVftRpTb69SjEqnkKjR9bbFYy2RlD8dMa/syzD+7/yp9nrFW8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447389; c=relaxed/simple;
	bh=3sPFh8xPFYGKd6nqOTBEeSZrpFErB6SMoUD+gKokuos=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=g5BgiHSiy4UNKu9Mh5M9GweZBkYH3waNgTEoGNUDRfYC0yr48Umvr6UFDvPwiEHEEbpphnzx5NnWudSHeXksZLoIKul9U/oEENDSJ60BlDJ0h0gnCaaNTlSu0dBUTk5NXBUD+IuNydqV3+QoYMrvnZvYXDBQSqD/tcA79Rfd5NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sz+fAJIU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sz+fAJIU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751447387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+jxBo8ZZCZj22gq3lgwf0X+eMEo540lEmhGQ8RZF0JI=;
	b=Sz+fAJIUsiYkpKusazY9s0Ul4agHOQRihAVlmsnsPEjQ+Qk2ve1ThhXVAbUO9EbQssN3Gs
	3AeLhH3espQYsUL6nwaZ9CfWs362UbXvK+8WfqnJAgE4nklWC1Ah75h/T+zm+p0Kt7Ng68
	Z5BOqa+5FleXxpS3ETOQGIWu9lRrPkQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-cnWnw7xMMYC7fewU5EBnmA-1; Wed, 02 Jul 2025 05:09:45 -0400
X-MC-Unique: cnWnw7xMMYC7fewU5EBnmA-1
X-Mimecast-MFC-AGG-ID: cnWnw7xMMYC7fewU5EBnmA_1751447384
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d244bfabso37108055e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 02:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447384; x=1752052184;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+jxBo8ZZCZj22gq3lgwf0X+eMEo540lEmhGQ8RZF0JI=;
        b=uEa8CMvG2heG6xO/J3tVyCKyZZh18NVm2c+0AYG7DIOFPCj0kXpPBBSxy6T1+FHx0b
         vlTK6Nlnbdd3iZll8VK6AbyqJSz4W+YGyHjdLsLPFvnvLNUbO8OXzov7NQo8tKP7LECb
         SXljGC9ck8V18ndvFT+5D9C2wJn9Y5mnO8DygIc+JpTJbqKZs6/fQC+3vD23JLOk625N
         qiNqW4Uqh/7dYjHesYVZNfDEK7lb1voUfxDbltexk2UoixBGJNRfFwLc8xzhGJGmrT67
         xN1j42hmeQ5YSpAePUOkRG+mH99q4yjzJX1GSKoudEHqe63ab8+HapRswnGLvZ0u3D/a
         Sb/Q==
X-Gm-Message-State: AOJu0YxczPCvCtTmUp8lRKsBMSav1ZWeuh15vTX+JCgHnJ0e8UxTm9jD
	lNJ0GPQ/2OLeikge26IaA4UaXFbt4WVxgOmkq1GCoduxh4b4CSfzZQR9Q+pbOkuey9WpAz4KquJ
	MXz+TFNTP/3IE4z0JAsig1Nji+BJkfd6z1fbWCMWJDDqFuK+29ANk9WD0o+SWYoji/g==
X-Gm-Gg: ASbGncuLcTiispuX/rYq3fykkVpF8RkbxpMaPnftuUEkOHjxHyKY0gH8L0CNAOTFlZ8
	yL9BURqZ0xBgG+B8CPISVqdCgMV3UDMBinQsQgRyyB6vkiruWsfClgQL0Jg6oTiMwfyiiQL9Y9N
	04aHi/WNln2G3N1CrqzENyxv+kkC4xugNfMTVAkFyDU0YBbItQU4IE09Mmw4VnEoP0sDpeGRcKj
	1HzmDvQ5alRdXlksEmzEG1hx8Hjd6We/UXE5dDSc/o1XK0HRfQ33dcLa45+RWz97D9bwhcITTf9
	VN9fQA1cUgbNnktGEbthyy9XPH/lktTOXQbtl0Lhi0du1wkw86Fkkfc=
X-Received: by 2002:a05:600c:1d0e:b0:442:f97b:87e with SMTP id 5b1f17b1804b1-454a36dc39cmr23942975e9.6.1751447384169;
        Wed, 02 Jul 2025 02:09:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnBTJX66ACX9RSropYPwC4yalO0bjZ4ru86564fYNjJxYULaru0dgUcfQ+kzYwd+4NWfOHfw==
X-Received: by 2002:a05:600c:1d0e:b0:442:f97b:87e with SMTP id 5b1f17b1804b1-454a36dc39cmr23942495e9.6.1751447383633;
        Wed, 02 Jul 2025 02:09:43 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e598d2sm15404861f8f.76.2025.07.02.02.09.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 02:09:43 -0700 (PDT)
Message-ID: <09c356c3-5874-43ac-93e5-4374a386df98@redhat.com>
Date: Wed, 2 Jul 2025 11:09:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] mm: remove boolean output parameters from
 folio_pte_batch_ext()
From: David Hildenbrand <david@redhat.com>
To: Zi Yan <ziy@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-5-david@redhat.com>
 <EB391EDC-4CDC-4B18-BE95-7DEFE43109DF@nvidia.com>
 <d58f8ab8-55da-447a-9fd6-93bebe27f23e@redhat.com>
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
In-Reply-To: <d58f8ab8-55da-447a-9fd6-93bebe27f23e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.07.25 11:08, David Hildenbrand wrote:
> On 30.06.25 19:59, Zi Yan wrote:
>> On 27 Jun 2025, at 7:55, David Hildenbrand wrote:
>>
>>> Instead, let's just allow for specifying through flags whether we want
>>> to have bits merged into the original PTE.
>>>
>>> For the madvise() case, simplify by having only a single parameter for
>>> merging young+dirty. For madvise_cold_or_pageout_pte_range() merging the
>>> dirty bit is not required, but also not harmful. This code is not that
>>> performance critical after all to really force all micro-optimizations.
>>>
>>> As we now have two pte_t * parameters, use PageTable() to make sure we
>>> are actually given a pointer at a copy of the PTE, not a pointer into
>>> an actual page table.
>>>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>> ---
>>>    mm/internal.h | 58 +++++++++++++++++++++++++++++++--------------------
>>>    mm/madvise.c  | 26 +++++------------------
>>>    mm/memory.c   |  8 ++-----
>>>    mm/util.c     |  2 +-
>>>    4 files changed, 43 insertions(+), 51 deletions(-)
>>>
>>> diff --git a/mm/internal.h b/mm/internal.h
>>> index 6000b683f68ee..fe69e21b34a24 100644
>>> --- a/mm/internal.h
>>> +++ b/mm/internal.h
>>> @@ -208,6 +208,18 @@ typedef int __bitwise fpb_t;
>>>    /* Compare PTEs honoring the soft-dirty bit. */
>>>    #define FPB_HONOR_SOFT_DIRTY		((__force fpb_t)BIT(1))
>>>
>>> +/*
>>> + * Merge PTE write bits: if any PTE in the batch is writable, modify the
>>> + * PTE at @ptentp to be writable.
>>> + */
>>> +#define FPB_MERGE_WRITE			((__force fpb_t)BIT(2))
>>> +
>>> +/*
>>> + * Merge PTE young and dirty bits: if any PTE in the batch is young or dirty,
>>> + * modify the PTE at @ptentp to be young or dirty, respectively.
>>> + */
>>> +#define FPB_MERGE_YOUNG_DIRTY		((__force fpb_t)BIT(3))
>>> +
>>>    static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>>>    {
>>>    	if (!(flags & FPB_HONOR_DIRTY))
>>> @@ -220,16 +232,11 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>>>    /**
>>>     * folio_pte_batch_ext - detect a PTE batch for a large folio
>>>     * @folio: The large folio to detect a PTE batch for.
>>> + * @vma: The VMA. Only relevant with FPB_MERGE_WRITE, otherwise can be NULL.
>>>     * @ptep: Page table pointer for the first entry.
>>> - * @pte: Page table entry for the first page.
>>> + * @ptentp: Pointer at a copy of the first page table entry.
>>>     * @max_nr: The maximum number of table entries to consider.
>>>     * @flags: Flags to modify the PTE batch semantics.
>>> - * @any_writable: Optional pointer to indicate whether any entry except the
>>> - *		  first one is writable.
>>> - * @any_young: Optional pointer to indicate whether any entry except the
>>> - *		  first one is young.
>>> - * @any_dirty: Optional pointer to indicate whether any entry except the
>>> - *		  first one is dirty.
>>>     *
>>>     * Detect a PTE batch: consecutive (present) PTEs that map consecutive
>>>     * pages of the same large folio in a single VMA and a single page table.
>>> @@ -242,28 +249,26 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>>>     * must be limited by the caller so scanning cannot exceed a single VMA and
>>>     * a single page table.
>>>     *
>>> + * Depending on the FPB_MERGE_* flags, the pte stored at @ptentp will
>>> + * be modified.
>>> + *
>>>     * This function will be inlined to optimize based on the input parameters;
>>>     * consider using folio_pte_batch() instead if applicable.
>>>     *
>>>     * Return: the number of table entries in the batch.
>>>     */
>>>    static inline unsigned int folio_pte_batch_ext(struct folio *folio,
>>> -		pte_t *ptep, pte_t pte, unsigned int max_nr, fpb_t flags,
>>> -		bool *any_writable, bool *any_young, bool *any_dirty)
>>> +		struct vm_area_struct *vma, pte_t *ptep, pte_t *ptentp,
>>> +		unsigned int max_nr, fpb_t flags)
>>>    {
>>> +	bool any_writable = false, any_young = false, any_dirty = false;
>>> +	pte_t expected_pte, pte = *ptentp;
>>>    	unsigned int nr, cur_nr;
>>> -	pte_t expected_pte;
>>> -
>>> -	if (any_writable)
>>> -		*any_writable = false;
>>> -	if (any_young)
>>> -		*any_young = false;
>>> -	if (any_dirty)
>>> -		*any_dirty = false;
>>>
>>>    	VM_WARN_ON_FOLIO(!pte_present(pte), folio);
>>>    	VM_WARN_ON_FOLIO(!folio_test_large(folio) || max_nr < 1, folio);
>>>    	VM_WARN_ON_FOLIO(page_folio(pfn_to_page(pte_pfn(pte))) != folio, folio);
>>> +	VM_WARN_ON(virt_addr_valid(ptentp) && PageTable(virt_to_page(ptentp)));
>>
>> Why not just VM_WARN_ON(!pte_same(*ptep, *ptentp)) ?
>>
>> ptep points to the first page table entry and ptentp points to the copy of it.
>> I assume ptep should point to a valid page table entry to begin with.
> 
> That would also work, only miss the case where someone would by accident
> flip both pointers :)

... or pass the same pointer twice.

-- 
Cheers,

David / dhildenb

