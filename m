Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7032EA488
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 17:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751043745; cv=none; b=E13WaxvmEMCF7e0swOEgoMRPHWefpNAovMTqUF05Jp7tFtE7pDFh7iIjGCvExD3/F1UtCgtk5/4UNweMxJk2kPIUP0AQn9MIuGJjWqv0UGoLYw9Sty0Tik3Ma8qMpeLnqUeLuP//XeauQK1jpjmB0MeOprWXF352+DiiuDH2C+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751043745; c=relaxed/simple;
	bh=kR/C3wZW0BNyYdZC6+oD7TBZtWBgobm33FRKW2hAi6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BRg9ynqUcxVL3CKS23IZ5nk0VfuB6b7oD6Xz6pfb/0iFff+aI4SB3M6VYtxUGGByiYjXS9U3rXctED9RDf9qy5EDGyCbuhEXhq+SxHfMHXyifr+s7X1cCGOV+lU7NbCf6rxZKDKy3ugA+8/YenqBXI1BwtYlKu5FXythq2aH9UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CoSCOI3T; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CoSCOI3T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751043742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yM8oGo/sRIAkQbYwNjZDfq181a07h8iikS4bBvZ+0zM=;
	b=CoSCOI3TQ3DSMPZ0Z4d1jQ4O0pPRKvg9gEVNkx0hTtbfSKkjHc/oppksN0dKlWMCCdjYEy
	o/Nd83ShjsMuCo2LfnBOpzTw/xdJumUnfrpaxCXys9Vz9+y51qsESx82iND9r5wVbubzQU
	BeN+lA9+9EJz/7F6l9LLyVrw83JFed0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-0rfnr-AOObuDd5bYgoXDkQ-1; Fri, 27 Jun 2025 13:02:20 -0400
X-MC-Unique: 0rfnr-AOObuDd5bYgoXDkQ-1
X-Mimecast-MFC-AGG-ID: 0rfnr-AOObuDd5bYgoXDkQ_1751043739
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a5780e8137so1707220f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751043739; x=1751648539;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yM8oGo/sRIAkQbYwNjZDfq181a07h8iikS4bBvZ+0zM=;
        b=LvD8SP7ChjDx6T2NxtGx79UPowLrUuAgVCJZKPDTdWk3Vb62coIzu7uGckh/UnFHfv
         bJDkIJqHZaohzT677zSxK0M5bhlzg0y4cWmYZ3TtYL82mDSJU4wyE7pEax2n4ikHJXJv
         CLQXsg7UjEkL5TW6zB2ZbVUB/1EoYzAv9tVU/dYu19QPGcUR+hF09OKtB8ErHZ8j+SgO
         0L+N6C7lcSe+7pHv0Tk+dWR4okludj0rPA+hMd2Z1VmgTjc9NtoqTxR2M6YUOk7eALRD
         Y2eMLsHVpNEk4jrEaqKLbSB/op97ioWju7hIEBZYPh81uqZQuBCntRNs3/RZL3ezhqfK
         oG0w==
X-Gm-Message-State: AOJu0Yw49erOgExTZkJj7e8O5s7X/Lo0HP7ZNha6+YFMOV6aTbdyE05L
	vf5o61eqkTj0m8kaG+37bL/vu67xJPthQtbotD/g8xnDrJbG1Q4Yx8EJaeg6XrTFOx44lll1qH+
	st0yIeLTKMShLpJgqG5NUa/4OC+efTOiAm+/gGpcYwHQfgECRJ5o9tCmW200H9OJU7g==
X-Gm-Gg: ASbGncveRurby5NV6kWtZSrQ3QBP6uI6DB7h8xjFgOJMnKZu7pdISnKrIcZvzxKllMK
	1I5KCen7QibYhMtnkBSn3z6cVrJZJ0WObJgo48P1eb7Fhhhq2XM4cfpYrguloZKgLNs2zlhsjHC
	kZaUKAGBny7beW3YmS73tENswZc270+CC2jIAqLyfH2/GbHVO4WGyqGA0lYxjy2+b4w8CQ8MfD7
	FgB0mKgK0uc4cL5SHMJLeHD3p2i3ET1GtM5o0iIYg/rHlum2NsK8c7+HeDUkhHWTtBN9jhvdrTH
	BEbNfr8zdm/PV8qRWfcEUSYml9OZjn/JDiIcDFUEUzv6c/0gOmnh8jJFbncC+QmQLm62KV1NE2r
	y1K4XzWag/kP9EjOeyWQiLIwMFmJ+GfK9Loq8ZeE6fTigIShY7w==
X-Received: by 2002:a05:6000:471c:b0:3a4:c71a:8119 with SMTP id ffacd0b85a97d-3a98ca6f2eamr3293193f8f.25.1751043739108;
        Fri, 27 Jun 2025 10:02:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUh+46/62L5ifzgFny78yPkLNLTbuLd9IGr7XXUTqEbVWo6vB3r+4Pz+nSLizP4t84CFpQCg==
X-Received: by 2002:a05:6000:471c:b0:3a4:c71a:8119 with SMTP id ffacd0b85a97d-3a98ca6f2eamr3293137f8f.25.1751043738456;
        Fri, 27 Jun 2025 10:02:18 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:5d00:f1a3:2f30:6575:9425? (p200300d82f2d5d00f1a32f3065759425.dip0.t-ipconnect.de. [2003:d8:2f2d:5d00:f1a3:2f30:6575:9425])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f923sm3092606f8f.89.2025.06.27.10.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 10:02:17 -0700 (PDT)
Message-ID: <72f26f80-38ff-4686-a9c4-26071d6fd4df@redhat.com>
Date: Fri, 27 Jun 2025 19:02:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] mm: smaller folio_pte_batch() improvements
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-3-david@redhat.com>
 <ea03a9a8-6e2d-4576-b15b-cf8fca1ebcfe@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ea03a9a8-6e2d-4576-b15b-cf8fca1ebcfe@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.06.25 18:51, Lorenzo Stoakes wrote:
> On Fri, Jun 27, 2025 at 01:55:08PM +0200, David Hildenbrand wrote:
>> Let's clean up a bit:
>>
>> (1) No need for start_ptep vs. ptep anymore, we can simply use ptep
>>
>> (2) Let's switch to "unsigned int" for everything
>>
>> (3) We can simplify the code by leaving the pte unchanged after the
>>      pte_same() check.
>>
>> (4) Clarify that we should never exceed a single VMA; it indicates a
>>      problem in the caller.
>>
>> No functional change intended.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   mm/internal.h | 37 +++++++++++++++----------------------
>>   1 file changed, 15 insertions(+), 22 deletions(-)
>>
>> diff --git a/mm/internal.h b/mm/internal.h
>> index 9690c75063881..ca6590c6d9eab 100644
>> --- a/mm/internal.h
>> +++ b/mm/internal.h
>> @@ -221,7 +221,7 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>>    * folio_pte_batch - detect a PTE batch for a large folio
>>    * @folio: The large folio to detect a PTE batch for.
>>    * @addr: The user virtual address the first page is mapped at.
>> - * @start_ptep: Page table pointer for the first entry.
>> + * @ptep: Page table pointer for the first entry.
>>    * @pte: Page table entry for the first page.
>>    * @max_nr: The maximum number of table entries to consider.
>>    * @flags: Flags to modify the PTE batch semantics.
>> @@ -233,24 +233,24 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>>    *		  first one is dirty.
>>    *
>>    * Detect a PTE batch: consecutive (present) PTEs that map consecutive
>> - * pages of the same large folio.
>> + * pages of the same large folio in a single VMA and a single page table.
>>    *
>>    * All PTEs inside a PTE batch have the same PTE bits set, excluding the PFN,
>>    * the accessed bit, writable bit, dirty bit (unless FPB_HONOR_DIRTY is set) and
>>    * soft-dirty bit (unless FPB_HONOR_SOFT_DIRTY is set).
>>    *
>> - * start_ptep must map any page of the folio. max_nr must be at least one and
>> - * must be limited by the caller so scanning cannot exceed a single page table.
>> + * @ptep must map any page of the folio. max_nr must be at least one and
>> + * must be limited by the caller so scanning cannot exceed a single VMA and
>> + * a single page table.
>>    *
>>    * Return: the number of table entries in the batch.
>>    */
>> -static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
>> -		pte_t *start_ptep, pte_t pte, int max_nr, fpb_t flags,
>> +static inline unsigned int folio_pte_batch(struct folio *folio, unsigned long addr,
> 
> Do we need to worry about propagating this type change?
> 
> mremap_folio_pte_batch() and zap_present_ptes() return the value as an int for example.
> 
> I mean I doubt we're going to be seeing an overflow here :) but maybe worth
> propagating this everywhere.

Yeah, I'm planning on cleaning some of that stuff separately. As you 
say, this shouldn't cause harm.

Really, it could only cause harm if someone would be doing

"- folio_pte_batch()" and then assigning it to a "long".

> 
>> +		pte_t *ptep, pte_t pte, unsigned int max_nr, fpb_t flags,
>>   		bool *any_writable, bool *any_young, bool *any_dirty)
>>   {
>> -	pte_t expected_pte, *ptep;
>> -	bool writable, young, dirty;
>> -	int nr, cur_nr;
>> +	unsigned int nr, cur_nr;
>> +	pte_t expected_pte;
>>
>>   	if (any_writable)
>>   		*any_writable = false;
>> @@ -267,29 +267,22 @@ static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
>>   	max_nr = min_t(unsigned long, max_nr,
>>   		       folio_pfn(folio) + folio_nr_pages(folio) - pte_pfn(pte));
>>
>> -	nr = pte_batch_hint(start_ptep, pte);
>> +	nr = pte_batch_hint(ptep, pte);
>>   	expected_pte = __pte_batch_clear_ignored(pte_advance_pfn(pte, nr), flags);
>> -	ptep = start_ptep + nr;
>> +	ptep = ptep + nr;
>>
>>   	while (nr < max_nr) {
>>   		pte = ptep_get(ptep);
>> -		if (any_writable)
>> -			writable = !!pte_write(pte);
>> -		if (any_young)
>> -			young = !!pte_young(pte);
>> -		if (any_dirty)
>> -			dirty = !!pte_dirty(pte);
>> -		pte = __pte_batch_clear_ignored(pte, flags);
>>
>> -		if (!pte_same(pte, expected_pte))
>> +		if (!pte_same(__pte_batch_clear_ignored(pte, flags), expected_pte))
> 
> Doing this here will change the output of any_writable, any_young:
> 
> static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
> {
> 	...
> 	return pte_wrprotect(pte_mkold(pte));
> }
> 
> So we probably need to get these values earlier?


Note that __pte_batch_clear_ignored() leaves the pte unchanged, and only 
returns the modified pte. (like pte_mkold() and friends).

So what we read through ptep_get() is still what we have after the 
pte_same() check.


-- 
Cheers,

David / dhildenb

