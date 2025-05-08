Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED46286D61
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 18:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746727284; cv=none; b=Ns5/18ev4VoOyd0CJaWxTH56p2zBPFup0vw0BDG3gn/iNG76D4j+NM9EBEMkJo1K8LrpJVJf5H7JkSpdt5oTENuay4WxZqwI3qYxXKZKmR+aE5Y9t1oeBmehxFrs7ssdaZWQvh3MdjhEPhtrFR2yO0aUhkdAvFnpgtHHeSHglXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746727284; c=relaxed/simple;
	bh=reIatV0vE1J8p4j3HYn17rnHr13tadmdfPP6rZy6970=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TtUuigbKpzwnnBMiK/ZZAJYqw87o403bAj7Kz8iN8LI81U3EHEaSIymh7zCZb+3PjM5Q1FbH0UZIwWMl9pgwluJ7RfjlGK5jX+TWdRZBNpJc8CLpF/1xGjGFJaq4ZnXK/6pjr4NpQuqZyOKrOm/qQ4YR5b/QbTN3SDSW6GZeB8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LXLsRL1r; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LXLsRL1r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746727280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Mv6V+y8dxFhOn1Ek70seqfoIRcbxeUVVPvZF8xc2LeQ=;
	b=LXLsRL1rOarj7yIQqTgSDiqeU+1Em0Ddh2OJQltc9Wo3b4yK4KLt1y2VERRCxV6LxGarq9
	wjJfDmntPHtoOhwB2Z1Sm052tML5qN/7P6Y3z8b1whCm6O2CDpxVpG4dK2mjZBqH4xs/lo
	dYf7588WKQGOeHq2jePSKVJRebdQAm0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-lkqMXnBhOMaL1W8YBfMTIg-1; Thu, 08 May 2025 14:01:19 -0400
X-MC-Unique: lkqMXnBhOMaL1W8YBfMTIg-1
X-Mimecast-MFC-AGG-ID: lkqMXnBhOMaL1W8YBfMTIg_1746727278
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a0adce033bso484008f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 11:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746727278; x=1747332078;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Mv6V+y8dxFhOn1Ek70seqfoIRcbxeUVVPvZF8xc2LeQ=;
        b=hr3mmu/jHjQTj/wAqSVghepj7iaylvJa1orp3KjVSXQmxefhmD6BYSpW1RiVo4N6CB
         UUQHt9LKNSxdJ/1EQx7fhx0AFdAgeOVE31pTY8KPhkQbJv5NKDN5g3/B8qbEMjd1bOFU
         gB2rd+CGTMMZrkxHN8i2V8eGve0gb+8rOuQ2w/hzlqyrCyMlh2VfovW2bueWyoA0aHPb
         cUNav7ZGjNDcGghacO1NkjMbHYWN8ivEp0+rZmmzKDtgvzkxSqFqYGM8N+6A1stLkec+
         r1/6hMqzjJVrJjtM4QeTE+mKUoIC0XlDL0HDGqXjcmglqYmG9TaTeU2vo35EKXcTsMVE
         EvoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDN5h1oabqaqdRVf1QiaFoveZ9rZdzD+lSYwQf6/kwrXG6QbuoXo4llz+7Dba2+g515h+aTgA9Jfqs7Ns=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2lpnQDwAO6TRQ8WkWL4dEZF0wpcvEZxs1t8/jXo1c0WyRDQMo
	eQPh7l3SRi6wdHm+Jn/QOag6jUQDYFIRXrCCg9wCdzI5AnRRwNTCABkzJaUkUP28l4MyBwUkul/
	9vKXIaasNH5rM9mJg/jR2SDAGjJ2ikPkYIUQ/zeJ6a14pnyNZIrTrl82ChT9F1Q==
X-Gm-Gg: ASbGncvkxZfu6YoU4FLrnDB2+rFdknN+A7ssjM5+Az8SCdJSi2Xw4GY4mlGSraTGGU+
	HqAeyJwMO3sw5fh1CTRmIC0AfZMStSlBBGtqY37QL7T0qjG3BNCtK9VN7he+PX+JyFomGdNMvdf
	Sf/AjatIjjE/ENGJ7TEluwHP3SDeM549ob8eFqOaopZKXJW7bFRt50NqHX9lRDDdiQH+zMXNSdb
	Ku4NzhpvKoSZOhkE2DuNhmEWFavkM4ziLvIgQdWAzwW2Z803qpi4v2BejGddDvVcxpa/5tEXSB5
	Jiy2Sghj6sgISRtqtyqs1Nvqsj34nrpPX5lPd7pitt+A1Ps2USvU3baaWMaYdiJfLUq3yMG1YsP
	21tiokqYDvvvhULwTrnuv2Tq9luIVB4JxWIsmaq0=
X-Received: by 2002:a05:6000:18ae:b0:3a0:8834:214c with SMTP id ffacd0b85a97d-3a1f6431b6bmr457942f8f.20.1746727277883;
        Thu, 08 May 2025 11:01:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0/p3oOi1YSfPqdJ/O1omnFiTp7zN4CuR5++ifZBk0u0ti7Rij2NOjYmNb9jWfoFrxYGofuA==
X-Received: by 2002:a05:6000:18ae:b0:3a0:8834:214c with SMTP id ffacd0b85a97d-3a1f6431b6bmr457875f8f.20.1746727277261;
        Thu, 08 May 2025 11:01:17 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c? (p200300d82f3e590027aa5f4ab65c3d3c.dip0.t-ipconnect.de. [2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2cee4sm627209f8f.67.2025.05.08.11.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 11:01:16 -0700 (PDT)
Message-ID: <7f4fd3fc-f76b-4174-9aca-e4160f058c4a@redhat.com>
Date: Thu, 8 May 2025 20:01:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mm: Optimize mremap() by PTE batching
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, peterx@redhat.com, ryan.roberts@arm.com,
 mingo@kernel.org, libang.li@antgroup.com, maobibo@loongson.cn,
 zhengqi.arch@bytedance.com, baohua@kernel.org, anshuman.khandual@arm.com,
 willy@infradead.org, ioworker0@gmail.com, yang@os.amperecomputing.com,
 baolin.wang@linux.alibaba.com, ziy@nvidia.com, hughd@google.com
References: <20250507060256.78278-1-dev.jain@arm.com>
 <20250507060256.78278-3-dev.jain@arm.com>
 <fdb76016-396a-4ee4-9c9d-beb18c86cfdb@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <fdb76016-396a-4ee4-9c9d-beb18c86cfdb@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.05.25 12:04, Lorenzo Stoakes wrote:
> Before getting into the review, just to say thanks for refactoring as per
> my (and of course other's) comments, much appreciated and big improvement!
> :)
> 
> We're getting there...
> 
> On Wed, May 07, 2025 at 11:32:56AM +0530, Dev Jain wrote:
>> To use PTE batching, we want to determine whether the folio mapped by
>> the PTE is large, thus requiring the use of vm_normal_folio(). We want
>> to avoid the cost of vm_normal_folio() if the code path doesn't already
>> require the folio. For arm64, pte_batch_hint() does the job. To generalize
>> this hint, add a helper which will determine whether two consecutive PTEs
>> point to consecutive PFNs, in which case there is a high probability that
>> the underlying folio is large.
>> Next, use folio_pte_batch() to optimize move_ptes(). On arm64, if the ptes
>> are painted with the contig bit, then ptep_get() will iterate through all 16
>> entries to collect a/d bits. Hence this optimization will result in a 16x
>> reduction in the number of ptep_get() calls. Next, ptep_get_and_clear()
>> will eventually call contpte_try_unfold() on every contig block, thus
>> flushing the TLB for the complete large folio range. Instead, use
>> get_and_clear_full_ptes() so as to elide TLBIs on each contig block, and only
>> do them on the starting and ending contig block.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
>>   mm/mremap.c             | 37 ++++++++++++++++++++++++++++++-------
>>   2 files changed, 59 insertions(+), 7 deletions(-)
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index b50447ef1c92..38dab1f562ed 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -369,6 +369,35 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
>>   }
>>   #endif
>>
>> +/**
>> + * maybe_contiguous_pte_pfns - Hint whether the page mapped by the pte belongs
>> + * to a large folio.
>> + * @ptep: Pointer to the page table entry.
>> + * @pte: The page table entry.
>> + *
>> + * This helper is invoked when the caller wants to batch over a set of ptes
>> + * mapping a large folio, but the concerned code path does not already have
>> + * the folio. We want to avoid the cost of vm_normal_folio() only to find that
>> + * the underlying folio was small; i.e keep the small folio case as fast as
>> + * possible.
>> + *
>> + * The caller must ensure that ptep + 1 exists.
>> + */
>> +static inline bool maybe_contiguous_pte_pfns(pte_t *ptep, pte_t pte)
>> +{
>> +	pte_t *next_ptep, next_pte;
>> +
>> +	if (pte_batch_hint(ptep, pte) != 1)
>> +		return true;
>> +
>> +	next_ptep = ptep + 1;
>> +	next_pte = ptep_get(next_ptep);
>> +	if (!pte_present(next_pte))
>> +		return false;
>> +
>> +	return unlikely(pte_pfn(next_pte) - pte_pfn(pte) == 1);
> 
> Let's not do unlikely()'s unless we have data for them... it shouldn't mean
> 'what the programmer believes' :)
> 
>> +}
> 
> Yeah I'm with Andrew and Anshuman, I mean this is kind of a nasty interface
> (I mean _perhaps_ unavoidably) and we've done the relevant check in
> mremap_folio_pte_batch(), so let's just move it there with comments, as this
> 
>> +
>>   #ifndef __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
>>   static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
>>   					    unsigned long address,
>> diff --git a/mm/mremap.c b/mm/mremap.c
>> index 0163e02e5aa8..9c88a276bec4 100644
>> --- a/mm/mremap.c
>> +++ b/mm/mremap.c
>> @@ -170,6 +170,23 @@ static pte_t move_soft_dirty_pte(pte_t pte)
>>   	return pte;
>>   }
>>
>> +/* mremap a batch of PTEs mapping the same large folio */
>> +static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
>> +		pte_t *ptep, pte_t pte, int max_nr)
>> +{
>> +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +	struct folio *folio;
>> +	int nr = 1;
>> +
>> +	if ((max_nr != 1) && maybe_contiguous_pte_pfns(ptep, pte)) {
>> +		folio = vm_normal_folio(vma, addr, pte);
>> +		if (folio && folio_test_large(folio))
>> +			nr = folio_pte_batch(folio, addr, ptep, pte, max_nr,
>> +					     flags, NULL, NULL, NULL);
>> +	}
> 
> This needs some refactoring, avoid nesting at all costs :)
> 
> We'll want to move the maybe_contiguous_pte_pfns() function over here, so
> that'll change things, but in general let's use a guard clause.
> 
> So an if block like:
> 
> if (foo) {
> 	... bunch of logic ...
> }
> 
> Is better replaced with a guard clause so you have:
> 
> if (!foo)
> 	return ...;
> 
> ... bunch of logic ...
> 
> Here we could really expand things out to make things SUPER clear like:
> 
> static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
> 		pte_t *ptep, pte_t pte, int max_nr)
> {
> 	const fpb_t flags;
> 	struct folio *folio;
> 
> 	if (max_nr == 1)
> 		return 1;
> 	if (!maybe_contiguous_pte_pfns(ptep, pte)) // obviously replace with open code...
> 		return 1;
> 
> 	folio = vm_normal_folio(vma, addr, pte);
> 	if (!folio)
> 		return 1;
> 	if (!folio_test_large(folio))
> 		return 1;
> 
> 	flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> 	return folio_pte_batch(folio, addr, ptep, pte, max_nr,
> 		flags, NULL, NULL, NULL);
> }
> 
> I mean you could argue assign nr would be neater here, but you get the point!
> 
> David mentioned a point about this code over in v1 discussion (see
> [0]). Trying to bring converastion here to avoid it being split across
> old/new series. There he said:
> 
> David H:
>> (2) Do we really need "must be part of the same folio", or could be just batch over present
>> ptes that map consecutive PFNs? In that case, a helper that avoids folio_pte_batch() completely
>> might be better.
> 
> Hm, if we didn't do the batch test, can we batch a split large folio here ok?
> I'm guessing we can in which case this check is actually limiting...
> 
> Are we _explicitly_ only considering the cont pte case and ignoring the
> split THP case?
> 
> [0]: https://lore.kernel.org/all/887fb371-409e-4dad-b4ff-38b85bfddf95@redhat.com/
> 
> And in what circumstances will the hint be set, with a present subsequent
> PTE but !folio_test_large()?
> 
> I guess the hint might not be taken? But then isn't the valid check just
> folio_test_large() and we don't need this batched check at all?
> 
> Is it only to avoid the split THP case?
> 
> We definitely need some clarity here, and a comment in the code explaining
> what's going on as this is subtle stuff.


The whole maybe_contiguous_pte_pfns() is really far from nice. Let's add 
something like that *only if absolutely required* for performance 
reasons and on top of this patch.

But let's clarify if we have to limit ourselves to a single folio at all.

Staring at it, I think the tricky bit is:

	pte = get_and_clear_full_ptes();


That means that

a) if any PTE is dirty, the resulting PTE will be dirty.
b) if any PTE is young, the resulting PTE will be young.

So we could be marking PTEs as dirty/young from unrelated folios.

That's problematic.

-- 
Cheers,

David / dhildenb

