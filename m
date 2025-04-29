Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7C72C17AC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745926270; cv=none; b=VO+t4mDyrX5mrnDUjLE/jHMx08S++eo0RB37DT6anhpjHwkKMgCupQR/SJqsAB1987stQH6JYuI9/yzBmPd4gnGabPUoV7UsMW2LhY8J7IFqtulk/oxyokpjO6onBi3bJ9NQc4pUPB730fqd8yjs6V9NeQVWRVYGbAJeMWfH6jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745926270; c=relaxed/simple;
	bh=nGhibYMF6UglUu376aszBFb+sesiiOf6MpVWxfxwO8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FkX1TYlmwjZsLivGnEXNgdXejVEHmFDkyZB9rQ0IQlWXPSXYMoq2WGoeuukxV+qKi/KLyehnAqFvRbyIk0q4jowmntOd+3Iv/zOmfM0xhiuJvCro387EAt2JVdrbBF9sACFQAyVRYUvUnd8QL4E4oSt9r6b1703k4aY32a8Hw7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mm0qVUCY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mm0qVUCY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745926267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rGFSkL0z4QHTG2QpNf64SqnlUwXhFfw26Pfg2nP/yBs=;
	b=Mm0qVUCYm/XtFb0wLA/AlUS56YxTvw37rZ8KOtPlZLhhneCEglmC+tQmLO+pUosPa+Ler2
	tsYl7ZoAjrBdhYegVlLH3jnfZvQ8dM+83w57v4ZaN8B+esWbodRbG1qTPBUeMpyiaxaQzS
	3LpCoZoerQQhztTjGZAWZjqxiTj/c+4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-6ObNsVCmM_2kWxQGHxpBQQ-1; Tue, 29 Apr 2025 07:31:05 -0400
X-MC-Unique: 6ObNsVCmM_2kWxQGHxpBQQ-1
X-Mimecast-MFC-AGG-ID: 6ObNsVCmM_2kWxQGHxpBQQ_1745926264
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d5ca7c86aso34178775e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 04:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745926264; x=1746531064;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rGFSkL0z4QHTG2QpNf64SqnlUwXhFfw26Pfg2nP/yBs=;
        b=Y56nD3W53AbtjMl0htx+keHINolnxAVgIvr42VUNa3KCBtpdkToJZGUkD3cehbKkFb
         aPGHkQUmjWwnJ9mNbaNIzfP60eKcfLYZVjMLWYywSW0be02wKP7uvynLJND/NtYgJqVQ
         pyP+yLiQV1KHCXII27Ebi9wcjKwbzuVkPGfWAC2IbaTcetPg2mBx72c8DJ8kCxRs+y9O
         //l6aDOtze1EKp8VQ6Nsc/V1idYYKlwKSqwiuSdSQt2kUvYGdRYDDz5g8bm+GA22HOyW
         O280S+Ft/C8PDjwrcnR8Ld3eHjRckIld1u8fXwdGhIDLmChXd7CzmqOx8KJIZKzsqWGE
         nsBA==
X-Forwarded-Encrypted: i=1; AJvYcCVo03GzeGgiiEZCB9Dyfzi3QW0n7rk69ukyjuRisdUCqe9eQ0c3Pc6xvNw7unY5MRLQUjPHyVBcPoB+CAY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKY5tCCRz7+QpTu7nA8aPcOsIWyipaG/LTXl++rttEzNyHvNh+
	lKWT+Q7uwk+S/KjoXTrIIeGBHQS4irOQ5uDSVNnhCxEq4nLCy9JAZ2XhOikTT+0i+55y4yIR/lO
	fdG2bUkuw/xhfEGInppTSTewvbuDoW4xSydyCwgFqvc9TOwyWtzmT3jXlPzfBMQ==
X-Gm-Gg: ASbGncvMMjMeXshjLXgyOf1OU1RXb1rcSmTUpfLzTsB2WgTxI20xiex5G4uuCR+OosN
	MRxx1XZtJKpgOcWUkxMytg+MSehdUT1wzThvYlUV6wJU5+Q7S64cXgkGxSpLPtP/pJHDvM2DDZW
	lnzNccI0eO1tNrZlpK8OrSZk465bQE3nVlkPDeS75okadDJ2iSjJRwVlHWxcLOkU/+M2FwvTs52
	KLEeO/SgPUtP8wD6JRU8t0z1uN9tkmUccd/cAlRI2j6HIeYRRf2nae9RUCWJJUHXuMdoU1ZVboY
	i3FnBo0O4yD8tGWcDxXjw4lHHIiDb5kADyrlJ8wWt6YAqf/Sx2cMv6fZS5sdeCWYqQo/d72lHtp
	PbJFEh+PyDIrYI5KyG6gZW32YlHc8NkxJejUpZzI=
X-Received: by 2002:a05:600c:3503:b0:43c:e9f7:d6a3 with SMTP id 5b1f17b1804b1-441ac8e8f3cmr21842315e9.13.1745926264276;
        Tue, 29 Apr 2025 04:31:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7IRcI0k5ke/9DoI3DFzAY2GIsJqGIh9CA5L6DqZoGxllNH2gLwweFoubVznf4SdDYzGHmmA==
X-Received: by 2002:a05:600c:3503:b0:43c:e9f7:d6a3 with SMTP id 5b1f17b1804b1-441ac8e8f3cmr21841935e9.13.1745926263793;
        Tue, 29 Apr 2025 04:31:03 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73b:fa00:8909:2d07:8909:6a5a? (p200300cbc73bfa0089092d0789096a5a.dip0.t-ipconnect.de. [2003:cb:c73b:fa00:8909:2d07:8909:6a5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a538747esm152511205e9.35.2025.04.29.04.31.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 04:31:03 -0700 (PDT)
Message-ID: <45d43b69-23a2-4bb6-ac86-8587dcb67173@redhat.com>
Date: Tue, 29 Apr 2025 13:31:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/2] mm: add folio_migration_expected_refs() as inline
 function
To: Shivank Garg <shivankg@amd.com>, Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, shaggy@kernel.org,
 wangkefeng.wang@huawei.com, jane.chu@oracle.com, ziy@nvidia.com,
 donettom@linux.ibm.com, apopple@nvidia.com,
 jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com
References: <20250422114000.15003-1-shivankg@amd.com>
 <20250422114000.15003-2-shivankg@amd.com>
 <20250422164111.f5d3f0756ad94d012180ece5@linux-foundation.org>
 <aAg1-hZ0a-44WW6b@casper.infradead.org>
 <b84b6c31-578f-4abe-9b06-6e7cf4882eb3@redhat.com>
 <8f24de4d-5088-498a-968d-9e8bb85201ac@redhat.com>
 <aAmtzAv6ZbbRpKHM@casper.infradead.org>
 <7ff5b149-534d-4bb7-8c6d-3147279d3fae@amd.com>
 <604a1db2-bd64-455e-9cf7-968cacef0122@redhat.com>
 <57536c5a-23dd-4f14-af35-9c5523000e80@amd.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <57536c5a-23dd-4f14-af35-9c5523000e80@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29.04.25 12:57, Shivank Garg wrote:
> 
> 
> On 4/25/2025 1:17 PM, David Hildenbrand wrote:
>> On 24.04.25 13:57, Shivank Garg wrote:
>>> Hi All,
>>>
>>> Thank you for reviewing my patch and providing feedback.
>>>
>>> On 4/24/2025 8:49 AM, Matthew Wilcox wrote:
>>>> On Wed, Apr 23, 2025 at 09:25:05AM +0200, David Hildenbrand wrote:
>>>>> On 23.04.25 09:22, David Hildenbrand wrote:
>>>>>> On 23.04.25 02:36, Matthew Wilcox wrote:
>>>>>>> On Tue, Apr 22, 2025 at 04:41:11PM -0700, Andrew Morton wrote:
>>>>>>>>> +/**
>>>>>>>>> + * folio_migrate_expected_refs - Count expected references for an unmapped folio.
>>>>>>>>
>>>>>>>> "folio_migration_expected_refs"
>>>
>>> Thank you for catching this, I'll fix it.
>>>
>>> I wasn't previously aware of using make W=1 to build kernel-docs and
>>> check for warnings - this is very useful information for me.
>>>
>>> I'll add to changelog to better explain why this is needed for JFS.
>>>
>>>>>>>
>>>>>>> What I do wonder is whether we want to have such a specialised
>>>>>>> function existing.  We have can_split_folio() in huge_memory.c
>>>>>>> which is somewhat more comprehensive and doesn't require the folio to be
>>>>>>> unmapped first.
>>>>>>
>>>>>> I was debating with myself whether we should do the usual "refs from
>>>>>> ->private, refs from page table mappings" .. dance, and look up the
>>>>>> mapping from the folio instead of passing it in.
>>>>>>
>>>>>> I concluded that for this (migration) purpose the function is good
>>>>>> enough as it is: if abused in wrong context (e.g., still ->private,
>>>>>> still page table mappings), it would not fake that there are no
>>>>>> unexpected references.
>>>>>
>>>>> Sorry, I forgot that we still care about the reference from ->private here.
>>>>> We expect the folio to be unmapped.
>>>>
>>>> Right, so just adding in folio_mapcount() will be a no-op for migration,
>>>> but enable its reuse by can_split_folio().  Maybe.  Anyway, the way I
>>>> explain page refocunts to people (and I need to put this in a document
>>>> somewhere):
>>>>
>>>> There are three types of contribution to the refcount:
>>>>
>>>>    - Expected.  These are deducible from the folio itself, and they're all
>>>>      findable.  You need to figure out what the expected number of
>>>>      references are to a folio if you're going to try to freeze it.
>>>>      These can be references from the mapcount, the page cache, the swap
>>>>      cache, the private data, your call chain.
>>>>    - Temporary.  Someone else has found the folio somehow; perhaps through
>>>>      the page cache, or by calling GUP or something.  They mean you can't
>>>>      freeze the folio because you don't know who has the reference or how
>>>>      long they might hold it for.
>>>>    - Spurious.  This is like a temporary reference, but worse because if
>>>>      you read the code, there should be no way for there to be any temporary
>>>>      references to the folio.  Someone's found a stale pointer to this
>>>>      folio and has bumped the reference count while they check that the
>>>>      folio they have is the one they expected to find.  They're going
>>>>      to find out that the pointer they followed is stale and put their
>>>>      refcount soon, but in the meantime you still can't freeze the folio.
>>>>
>>>> So I don't love the idea of having a function with the word "expected"
>>>> in the name that returns a value which doesn't take into account all
>>>> the potential contributors to the expected value.  And sure we can keep
>>>> adding qualifiers to the function name to indicate how it is to be used,
>>>> but at some point I think we should say "It's OK for this to be a little
>>>> less efficient so we can understand what it means".
>>>
>>> Thank you, Willy, for the detailed explanation about page reference counting.
>>> This has helped me understand the concept much better.
>>>
>>> Based on your explanation and the discussion, I'm summarizing the 2 approaches:
>>>
>>> 1. Rename folio_migration_expected_refs to folio_migration_expected_base_refs, to
>>> to clarify it does not account for other potential contributors.
>>> or folio_unmapped_base_refs?
>>> 2. Accounting all possible contributors to expected refs:
>>> folio_expected_refs(mapping, folio)
>>> {
>>>      int refs = 1;
>>>
>>>      if (mapping) {
>>>          if (folio_test_anon(folio))
>>>              refs += folio_test_swapcache(folio) ?
>>>                  folio_nr_pages(folio) : 0;
>>>          else
>>>              refs += folio_nr_pages(folio);
>>>
>>>          if (folio_test_private(folio))
>>>              refs++;
>>>      }
>>>      refs += folio_mapcount(folio); // takes mapped folio into account and evaluate as no-op for unmapped folios during migration
>>>      return refs;
>>> }
>>>
>>> Please let me know if this approach is acceptable or if you have
>>> other suggestions for improvement.
>>
>> A couple of points:
>>
>> 1) Can we name it folio_expected_ref_count()
>>
>> 2) Can we avoid passing in the mapping? Might not be expensive to look it
>>     up again. Below I avoid calling folio_mapping().
>>
>> 3) Can we delegate adding the additional reference to the caller? Will make it
>>     easier to use elsewhere (e.g., not additional reference because we are holding
>>     the page table lock).
>>
>> 4) Can we add kerneldoc, and in particular document the semantics?
>>
>> Not sure if we should inline this function or put it into mm/utils.c
>>
> 
> Hi David,
> 
> Thank you for the detailed suggestions. They all make sense to me.
> 
> I did not understand a few changes in your patch below:
>>
>> I'm thinking of something like (completely untested):
>>
>>   
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index a205020e2a58b..a0ad4ed9a75ff 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -2112,6 +2112,61 @@ static inline bool folio_maybe_mapped_shared(struct folio *folio)
>>       return folio_test_large_maybe_mapped_shared(folio);
>>   }
>>   
>> +/**
>> + * folio_expected_ref_count - calculate the expected folio refcount
>> + * @folio: the folio
>> + *
>> + * Calculate the expected folio refcount, taking references from the pagecache,
>> + * swapcache, PG_private and page table mappings into account. Useful in
>> + * combination with folio_ref_count() to detect unexpected references (e.g.,
>> + * GUP or other temporary references).
>> + *
>> + * Does currently not consider references from the LRU cache. If the folio
>> + * was isolated from the LRU (which is the case during migration or split),
>> + * the folio was already isolated from the LRU and the LRU cache does not apply.
>> + *
>> + * Calling this function on an unmapped folio -- !folio_mapped() -- that is
>> + * locked will return a stable result.
>> + *
>> + * Calling this function on a mapped folio will not result in a stable result,
>> + * because nothing stops additional page table mappings from coming (e.g.,
>> + * fork()) or going (e.g., munmap()).
>> + *
>> + * Calling this function without the folio lock will also not result in a
>> + * stable result: for example, the folio might get dropped from the swapcache
>> + * concurrently.
>> + *
>> + * However, even when called without the folio lock or on a mapped folio,
>> + * this function can be used to detect unexpected references early (for example.
>> + * if it makes sense to even lock the folio and unmap it).
>> + *
>> + * The caller must add any reference (e.g., from folio_try_get()) it might be
>> + * holding itself to the result.
>> + *
>> + * Returns the expected folio refcount.
>> + */
>> +static inline int folio_expected_ref_count(const struct folio *folio)
>> +{
>> +    const int order = folio_order(folio);
>> +    int ref_count = 0;
> 
> Why are we not taking base ref_count as 1 like it's done in original folio_expected_refs
> implementation?

The idea is that this is the responsibility of the caller, which will 
make this function more versatile.

For example, when we're holding the page table lock and want to check 
for unexpected references, we wouldn't be holding any additional 
reference from a folio_try_get() like migration code would.

> 
>> +
>> +    if (WARN_ON_ONCE(folio_test_slab(folio)))
>> +        return 0;
>> +
>> +    if (folio_test_anon(folio)) {
>> +        /* One reference per page from the swapcache. */
>> +        ref_count += folio_test_swapcache(folio) << order;
> 
> why not use folio_nr_pages() here instead 1 << order?
> something like folio_test_swapcache(folio) * folio_nr_pages(folio).

A shift is typically cheaper than a multiplication, so it looked like a 
low hanging fruit to use a shift here.

> 
>> +    } else if (!((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS)) {
>> +        /* One reference per page from the pagecache. */
>> +        ref_count += !!folio->mapping << order;
>> +        /* One reference from PG_private. */
>> +        ref_count += folio_test_private(folio);
>> +    }
>> +
>> +    /* One reference per page table mapping. */
>> +    return ref_count + folio_mapcount(folio);;
> 
>> +}
>> +
>>   #ifndef HAVE_ARCH_MAKE_FOLIO_ACCESSIBLE
>>   static inline int arch_make_folio_accessible(struct folio *folio)
>>   {
> 
> I tested your patch with stress-ng and my move-pages test code. I did not see
> any bugs/errors.


Cool! It would be good to get some feedback from Willy on the kerneldoc, 
if he's aware of other constraints etc.


-- 
Cheers,

David / dhildenb

