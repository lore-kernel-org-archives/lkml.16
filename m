Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D38422FE0A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447337; cv=none; b=Z70/aEKbTmzjo/u9LLseFSTTxtsPERNUsLsgcn/JnuHxb4yoG8PpmUZgneXR8d1Arfi0oF8BKdmA5dUa4W5mxtuoo5ilWbatCxvy8F7yjVBJsNEncMIIpzVf2r40K8LwYJ8a7sID6JVGTUIMlNYlttyfK3ta0fRDjeSHSs/nLtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447337; c=relaxed/simple;
	bh=x1h5IvZpbI7HN7T7kFdYvZV+t5RAheQdxU7Gyu6s42k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jyE0xI8wl+aG4jLjGPjwfajIYy4kdCXh92/g85T+lDCtX8AMDjLrSETdktEXEkfUbX21gquNvKmCMTFi89r2VWvsBBTEokKeOzIfKVi6aYO/JE09cFp/9n/Qr4V3ESksRQlmzRmpioQyXm2efTuw6ZH+a6P3tTM9DYeUjfCbq2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ENi9y3ea; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ENi9y3ea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751447334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3FWUUWWvQmpLIQL4fpxsltF3bjwMUK3ZFkqiJPM4x5M=;
	b=ENi9y3eaXDPlxqtkP0Vs12IHGwtvHAiBHtM7kfhQBibsB7Rnwjxxo15zMPY6SH8WjqhUmK
	P2Tgenver4rVLj8bBVZZhu8ks46WlXAAm2sjNPqs5we/0b1i9dd72xhLfJq8tJsk421Hw1
	qpZw2Osb0/A7SVIj7SbWM4/HI6Fs5D4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-_OXiOUWXNEa8S6IkSXWSPQ-1; Wed, 02 Jul 2025 05:08:53 -0400
X-MC-Unique: _OXiOUWXNEa8S6IkSXWSPQ-1
X-Mimecast-MFC-AGG-ID: _OXiOUWXNEa8S6IkSXWSPQ_1751447332
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a503f28b09so3382589f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 02:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447332; x=1752052132;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3FWUUWWvQmpLIQL4fpxsltF3bjwMUK3ZFkqiJPM4x5M=;
        b=L+V0DOEMXDQ9yj8zWK5sBCvmkgrf0lXtLURVjmho7Qs4+16xpS3+hxNMycfAqUmmFq
         jqcCNdNt/udcww9H7yhmQVTf/DMu2hwVkE5olyD9+J1ClS8TzJeoxNtj62QtmU+VjvjM
         QtxT41RqSPOsFEfVC5aU42f/MOSyg235qS/Ji5UB8sumWee7ByjlbfzRPk4PFDp68mrS
         uw7IczF/KT4nzIH7UOXtqkmvHkbSpW6kBRD3Jnl9v19xtUPOOMl9cHGtrmdnY5bBD82I
         y0rBWzTR+RD5pTWfPJPC9oYPzBQAVCbFPgEOChG+Quk72jivk93VgEuNyxfKXeaJ/rpO
         /5gQ==
X-Gm-Message-State: AOJu0YyIrdKsNrH3W4tgchj8BxFWnPExxtKb2U0JqsZvvz1aWwqqsiaP
	b+EaRmzGcOaYMX0/qJEEQhq3DPVwr9+sqRBPt/QzJCUztW+gxADqCykvffxlfTHbj7UGQ8Iw8i6
	nVY+XUXeLNRpoC6P8wz0zlssmvLhw5z85cJWVY3TTP7dbnqUHl+vQIWBI5H1mNReLrA==
X-Gm-Gg: ASbGncum/Ue9HO+YMo5bvwUBNzIj9+reSYCOBq95+UxpeCCezpVMJ+UExL9fT+2wdcz
	K+jVZvUvzhgh1oHuJXFYDLIRnQhTtBA3gE2T0dcqHVTvk2/fy22K3jy20NSHEDsi74g+zjp+h5G
	tY+u4AUR76EPqlmtvYIlqtAQ+nuRpiOfdlV6eaEuh9ye2Fr+EoC8bY0l+ScVJPBT9u7P78T5+Iq
	m09BOC4TYaiirTJ6IUvHTZIVBVFNzuJ4xDCdArUz5XY6BC1U0ggI2Ecilss8lSc3tgm6O5j2uQt
	DLZM+sHhho/lRy5gNrO+CWjMqhHW4riwnNh7HWOdWR+nuc2vwbykDBY=
X-Received: by 2002:a05:6000:1786:b0:3a5:1241:afde with SMTP id ffacd0b85a97d-3b1f698b0b6mr1637103f8f.9.1751447331918;
        Wed, 02 Jul 2025 02:08:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5zMSUwuwLNiQMhcY3yK9VsCPjJJhKQGCXG6QyAkUnBukUgUn8o5MjzLIrKifqceTyYKmK0A==
X-Received: by 2002:a05:6000:1786:b0:3a5:1241:afde with SMTP id ffacd0b85a97d-3b1f698b0b6mr1637015f8f.9.1751447330856;
        Wed, 02 Jul 2025 02:08:50 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52c99sm15323898f8f.49.2025.07.02.02.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 02:08:50 -0700 (PDT)
Message-ID: <d58f8ab8-55da-447a-9fd6-93bebe27f23e@redhat.com>
Date: Wed, 2 Jul 2025 11:08:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] mm: remove boolean output parameters from
 folio_pte_batch_ext()
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
In-Reply-To: <EB391EDC-4CDC-4B18-BE95-7DEFE43109DF@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.06.25 19:59, Zi Yan wrote:
> On 27 Jun 2025, at 7:55, David Hildenbrand wrote:
> 
>> Instead, let's just allow for specifying through flags whether we want
>> to have bits merged into the original PTE.
>>
>> For the madvise() case, simplify by having only a single parameter for
>> merging young+dirty. For madvise_cold_or_pageout_pte_range() merging the
>> dirty bit is not required, but also not harmful. This code is not that
>> performance critical after all to really force all micro-optimizations.
>>
>> As we now have two pte_t * parameters, use PageTable() to make sure we
>> are actually given a pointer at a copy of the PTE, not a pointer into
>> an actual page table.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   mm/internal.h | 58 +++++++++++++++++++++++++++++++--------------------
>>   mm/madvise.c  | 26 +++++------------------
>>   mm/memory.c   |  8 ++-----
>>   mm/util.c     |  2 +-
>>   4 files changed, 43 insertions(+), 51 deletions(-)
>>
>> diff --git a/mm/internal.h b/mm/internal.h
>> index 6000b683f68ee..fe69e21b34a24 100644
>> --- a/mm/internal.h
>> +++ b/mm/internal.h
>> @@ -208,6 +208,18 @@ typedef int __bitwise fpb_t;
>>   /* Compare PTEs honoring the soft-dirty bit. */
>>   #define FPB_HONOR_SOFT_DIRTY		((__force fpb_t)BIT(1))
>>
>> +/*
>> + * Merge PTE write bits: if any PTE in the batch is writable, modify the
>> + * PTE at @ptentp to be writable.
>> + */
>> +#define FPB_MERGE_WRITE			((__force fpb_t)BIT(2))
>> +
>> +/*
>> + * Merge PTE young and dirty bits: if any PTE in the batch is young or dirty,
>> + * modify the PTE at @ptentp to be young or dirty, respectively.
>> + */
>> +#define FPB_MERGE_YOUNG_DIRTY		((__force fpb_t)BIT(3))
>> +
>>   static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>>   {
>>   	if (!(flags & FPB_HONOR_DIRTY))
>> @@ -220,16 +232,11 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>>   /**
>>    * folio_pte_batch_ext - detect a PTE batch for a large folio
>>    * @folio: The large folio to detect a PTE batch for.
>> + * @vma: The VMA. Only relevant with FPB_MERGE_WRITE, otherwise can be NULL.
>>    * @ptep: Page table pointer for the first entry.
>> - * @pte: Page table entry for the first page.
>> + * @ptentp: Pointer at a copy of the first page table entry.
>>    * @max_nr: The maximum number of table entries to consider.
>>    * @flags: Flags to modify the PTE batch semantics.
>> - * @any_writable: Optional pointer to indicate whether any entry except the
>> - *		  first one is writable.
>> - * @any_young: Optional pointer to indicate whether any entry except the
>> - *		  first one is young.
>> - * @any_dirty: Optional pointer to indicate whether any entry except the
>> - *		  first one is dirty.
>>    *
>>    * Detect a PTE batch: consecutive (present) PTEs that map consecutive
>>    * pages of the same large folio in a single VMA and a single page table.
>> @@ -242,28 +249,26 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>>    * must be limited by the caller so scanning cannot exceed a single VMA and
>>    * a single page table.
>>    *
>> + * Depending on the FPB_MERGE_* flags, the pte stored at @ptentp will
>> + * be modified.
>> + *
>>    * This function will be inlined to optimize based on the input parameters;
>>    * consider using folio_pte_batch() instead if applicable.
>>    *
>>    * Return: the number of table entries in the batch.
>>    */
>>   static inline unsigned int folio_pte_batch_ext(struct folio *folio,
>> -		pte_t *ptep, pte_t pte, unsigned int max_nr, fpb_t flags,
>> -		bool *any_writable, bool *any_young, bool *any_dirty)
>> +		struct vm_area_struct *vma, pte_t *ptep, pte_t *ptentp,
>> +		unsigned int max_nr, fpb_t flags)
>>   {
>> +	bool any_writable = false, any_young = false, any_dirty = false;
>> +	pte_t expected_pte, pte = *ptentp;
>>   	unsigned int nr, cur_nr;
>> -	pte_t expected_pte;
>> -
>> -	if (any_writable)
>> -		*any_writable = false;
>> -	if (any_young)
>> -		*any_young = false;
>> -	if (any_dirty)
>> -		*any_dirty = false;
>>
>>   	VM_WARN_ON_FOLIO(!pte_present(pte), folio);
>>   	VM_WARN_ON_FOLIO(!folio_test_large(folio) || max_nr < 1, folio);
>>   	VM_WARN_ON_FOLIO(page_folio(pfn_to_page(pte_pfn(pte))) != folio, folio);
>> +	VM_WARN_ON(virt_addr_valid(ptentp) && PageTable(virt_to_page(ptentp)));
> 
> Why not just VM_WARN_ON(!pte_same(*ptep, *ptentp)) ?
> 
> ptep points to the first page table entry and ptentp points to the copy of it.
> I assume ptep should point to a valid page table entry to begin with.

That would also work, only miss the case where someone would by accident 
flip both pointers :)

-- 
Cheers,

David / dhildenb

