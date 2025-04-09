Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC605EEB3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 09:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744189414; cv=none; b=PtU9uwtFd08Y0qhHln0wxVTZ6f1bDl1l5+XJ1ErVjH8XkalxBbS5FEejAWnZ0YWGMYmdPGvTIqxC4/w8GK2YSt6ez9RCtr+Ea/6Q036Bqhfs9AACVfNSRMAl/o2JEka2VbMjOJLAbhtT7Q+KG+M/rY/nBewzrRUA4XXjKmQuy5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744189414; c=relaxed/simple;
	bh=QA3nJaPyAJH5uYiUpZPkoDzGVFQ2noXtWNi0K/toFis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b1tQxkOsFE8xtQCESTPJarsQXSpxejgsNM0f4g19JVpsSkqi0gSlrkQLm3cXsse9lBQBXs87tCKSneG5jSYNvwOi6Q41vSvy5sSpDuN1SJXjkRxSfSBhGpDT9r7wG/6pn6v77Z9v9BdVnv7aLF3BCbCnW+eiv8MxmlGWRKM47jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hJJmLdMc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hJJmLdMc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744189411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zgbxmuYrSy8JOaWo/nuTKwkjtdKwgu/XlEfM6sVsJfQ=;
	b=hJJmLdMcwTugA+ONBU+Z0z+3uJpyY01ifq294XY3rwwx9f26loRbQubH9s+020gjqDcz67
	HYeg/gF1ly5J8af25BKmc/+LZhX/+bsfKfCTi9Vl0kZgR/CCiKYsfdoaDbhiaDfR3gVsu8
	QOnem0v01fBqRp8HCraoRrBVWZZMOuQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-3T8zUvn6Py28Zv-Z8IZawQ-1; Wed, 09 Apr 2025 05:03:30 -0400
X-MC-Unique: 3T8zUvn6Py28Zv-Z8IZawQ-1
X-Mimecast-MFC-AGG-ID: 3T8zUvn6Py28Zv-Z8IZawQ_1744189409
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d51bd9b45so43918585e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 02:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744189409; x=1744794209;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zgbxmuYrSy8JOaWo/nuTKwkjtdKwgu/XlEfM6sVsJfQ=;
        b=rqMjQPMutYRCru8LNazFrne/BcUOSBQXK/aMiUdOL0oy/Kwgp3G3LtR4/PBWrsYg+K
         Nx0x5wr7Iwhj3l8d3UD1KVs7G7I7GKWaRPEjudt7BMOXfZd4HhfxMXUNxfS60MCpzCgK
         Bsh8P+WLUlkavtvJzscA7LwaksKDTaf9lS9qodghCiL5Doi94Kz3ooFKlHa9A8Yh+S42
         m+PxuRW9pGyehP6w6CQxxte5WIAJEXR8+j0KGpgNTgvgTyO6eRBa/JNJa5eC6g1vFIRV
         46XVGUfNnux1BpjTSbEyZQOrSxTr1HK3clFFomDPDvHfty4aT3wnJjgzEYxe/Bw2niEW
         tcog==
X-Forwarded-Encrypted: i=1; AJvYcCVdF/OBvBLNmwemaWuglMtaSijkEVx+vR2jX3sQvGJDNAr7U3pFB5P+WWZEgWEOXjzFpfubyX79Xst9BC4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUD3/jZtaqsZKNN1sKAiCmvSRsxK6lpVPA9Ust4tmlSlvqQfUX
	FDwwmYS1i4TZgq6+HKbL3uxGwj7yRjvamyfCol1t9jJn7UkWVmLu7YmmwYfIZ67eo6eTILMS0BW
	UjxL5rxqoqBWL/ssbnDpEmbY4u21yeXLO0aLadTvDD+lZPRp1EE8pQGKh5aca0w==
X-Gm-Gg: ASbGncv4Rjh1LcxiinJgp0WS9zP4+P4Yg2udFyOr+MGFpoVzptkXDP/ICrJb/dDsjGL
	vU8xTXtvd3RDXuuSk+Azf+fuAcQLnp1rgU0o/J0iUB9mW3YUuqngGDJPMbtoE6RI6agwt+pj/XW
	GimnsS2LSlVnX9hVWZM1ijor7Sx4qx5wl8ZB2Ml5CRK1R7yRkWikzrS1l8snr/Zow/YqtTYy4hd
	OScfc/0xTJhdWjCjQS1KreId94VCZVvntJEOj50tH6C0PdiJkNaA2vrhMJANLSmbp/1tjWjdh3N
	DWZ7Pgn+lZlIQYshWVM8YdI5Ja1TdBeSOOPQUcKyet3QPdJZ2mGUkMOar7TlSLn0r1pU91Q0gYS
	8zmeyB/LuOyILCyZTW/VyICsPHCvJp3gM5A==
X-Received: by 2002:a05:600c:1f89:b0:43b:cc3c:60bc with SMTP id 5b1f17b1804b1-43f1ecd6b3amr21009415e9.15.1744189408757;
        Wed, 09 Apr 2025 02:03:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPOcpb7BVdvTaw0JCDlorc3Z/WoVMrXHrWdfC29nWG8SR9DR4kxaToeMAS20R5DXtlP5DETA==
X-Received: by 2002:a05:600c:1f89:b0:43b:cc3c:60bc with SMTP id 5b1f17b1804b1-43f1ecd6b3amr21009105e9.15.1744189408266;
        Wed, 09 Apr 2025 02:03:28 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70d:8400:ed9b:a3a:88e5:c6a? (p200300cbc70d8400ed9b0a3a88e50c6a.dip0.t-ipconnect.de. [2003:cb:c70d:8400:ed9b:a3a:88e5:c6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d89361165sm1041910f8f.19.2025.04.09.02.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 02:03:27 -0700 (PDT)
Message-ID: <5f0fe985-7512-4a94-aa5b-ddae176838a1@redhat.com>
Date: Wed, 9 Apr 2025 11:03:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hugetlb: Convert &folio->page to folio_page(folio, 0)
To: Matthew Wilcox <willy@infradead.org>, nifan.cxl@gmail.com
Cc: muchun.song@linux.dev, mcgrof@kernel.org, a.manzanares@samsung.com,
 dave@stgolabs.net, akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Fan Ni <fan.ni@samsung.com>
References: <20250409004937.634713-1-nifan.cxl@gmail.com>
 <Z_XmUrbxKtYmzmJ6@casper.infradead.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z_XmUrbxKtYmzmJ6@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.04.25 05:15, Matthew Wilcox wrote:
> On Tue, Apr 08, 2025 at 05:49:10PM -0700, nifan.cxl@gmail.com wrote:
>> From: Fan Ni <fan.ni@samsung.com>
>>
>> Convert the use of &folio->page to folio_page(folio, 0) where struct
>> filio fits in. This is part of the efforts to move some fields out of
>> struct page to reduce its size.
> 
> Thanks for sending the patch.  You've mixed together quite a few things;
> I'd suggest focusing on one API at a time.

Agreed.

> 
>>   		folio_get(folio);
>> -		folio_add_file_rmap_pmd(folio, &folio->page, vma);
>> +		folio_add_file_rmap_pmd(folio, folio_page(folio, 0), vma);
>>   		add_mm_counter(mm, mm_counter_file(folio), HPAGE_PMD_NR);
> 
> I think this is fine, but would defer to David Hildenbrand.

For now this should be fine. We want a pointer at the actual first page. 
In some future (with folios spanning multiple PMDs), this will not be 
correct.

But the THP changes should *absolutely* not be included in this hugetlb 
patch. I was severly confused staring at the usage of 
folio_add_file_rmap_pmd() in hugetlb context/

Actually, having to go  back to my comments below to fix them up now 
that I see that this is

  mm/huge_memory.c     | 30 +++++++++++++++++-------------
  mm/hugetlb.c         | 20 +++++++++++---------
  mm/hugetlb_vmemmap.c | 12 ++++++------

Makes me angry.

> 
>>   		folio_get(folio);
>> -		folio_add_file_rmap_pud(folio, &folio->page, vma);
>> +		folio_add_file_rmap_pud(folio, folio_page(folio, 0), vma);
>>   		add_mm_counter(mm, mm_counter_file(folio), HPAGE_PUD_NR);
> 
> If that is fine, then so is this (put them in the same patchset).
> 
>>   		spin_unlock(ptl);
>> -		if (flush_needed)
>> -			tlb_remove_page_size(tlb, &folio->page, HPAGE_PMD_SIZE);
>> +		if (flush_needed) {
>> +			tlb_remove_page_size(tlb, folio_page(folio, 0),
>> +					     HPAGE_PMD_SIZE);
>> +		}
> 
> You don't need to add the extra braces here.  I haven't looked into this
> family of APIs; not sure if we should be passing the folio here or
> if it should be taking a folio argument.
> 
>>   		if (folio_maybe_dma_pinned(src_folio) ||
>> -		    !PageAnonExclusive(&src_folio->page)) {
>> +		    !PageAnonExclusive(folio_page(src_folio, 0))) {
>>   			err = -EBUSY;
> 
> mmm.  Another David question.

For now this should be correct. (first page mapped by the PMD stores the 
flag)

> 
>>   	for (i = new_nr_pages; i < nr_pages; i += new_nr_pages) {
>> -		struct page *new_head = &folio->page + i;
>> +		struct page *new_head = folio_page(folio, i);
>>   
> 
> This is definitely the right thing to do.
> 
>> @@ -3403,7 +3405,7 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
>>   	if (new_order)
>>   		folio_set_order(folio, new_order);
>>   	else
>> -		ClearPageCompound(&folio->page);
>> +		ClearPageCompound(folio_page(folio, 0));
>>   }
> 
> I might be inclined to leave this one alone; this whole function needs
> to be rewritten as part of the folio split.
> 
>>   		folio_split_memcg_refs(folio, old_order, split_order);
>> -		split_page_owner(&folio->page, old_order, split_order);
>> +		split_page_owner(folio_page(folio, 0), old_order, split_order);
>>   		pgalloc_tag_split(folio, old_order, split_order);
> 
> Not sure if split_folio_owner is something that should exist.  Haven't
> looked into it.
> 
>>   		 */
>> -		free_page_and_swap_cache(&new_folio->page);
>> +		free_page_and_swap_cache(folio_page(new_folio, 0));
>>   	}
> 
> free_page_and_swap_cache() should be converted to be
> free_folio_and_swap_cache().
> 
>>   
>> -	return __folio_split(folio, new_order, &folio->page, page, list, true);
>> +	return __folio_split(folio, new_order, folio_page(folio, 0), page,
>> +			     list, true);
>>   }
> 
> Probably right.
> 
>>   {
>> -	return __folio_split(folio, new_order, split_at, &folio->page, list,
>> -			false);
>> +	return __folio_split(folio, new_order, split_at, folio_page(folio, 0),
>> +			     list, false);
>>   }
> 
> Ditto.
> 
>>   
>> -	return split_huge_page_to_list_to_order(&folio->page, list, ret);
>> +	return split_huge_page_to_list_to_order(folio_page(folio, 0), list,
>> +						ret);
>>   }
> 
> Ditto.
> 
>>   
>> -		if (is_migrate_isolate_page(&folio->page))
>> +		if (is_migrate_isolate_page(folio_page(folio, 0)))
>>   			continue;
> 
> I think we need an is_migrate_isolate_folio() instead of this.
> 
>>   	if (folio_test_anon(folio))
>> -		__ClearPageAnonExclusive(&folio->page);
>> +		__ClearPageAnonExclusive(folio_page(folio, 0));
>>   	folio->mapping = NULL;
> 
> ... David.

See above.

> 
>>   
>> -		split_page_owner(&folio->page, huge_page_order(src), huge_page_order(dst));
>> +		split_page_owner(folio_page(folio, 0), huge_page_order(src),
>> +				 huge_page_order(dst));
> 
> See earlier.
> 
>>   	if (folio_mapcount(old_folio) == 1 && folio_test_anon(old_folio)) {
>> -		if (!PageAnonExclusive(&old_folio->page)) {
>> +		if (!PageAnonExclusive(folio_page(old_folio, 0))) {
>>   			folio_move_anon_rmap(old_folio, vma);
>> -			SetPageAnonExclusive(&old_folio->page);
>> +			SetPageAnonExclusive(folio_page(old_folio, 0));
>>   		}
> 
> David.

See above.

> 
>>   	}
>>   	VM_BUG_ON_PAGE(folio_test_anon(old_folio) &&
>> -		       PageAnonExclusive(&old_folio->page), &old_folio->page);
>> +		       PageAnonExclusive(folio_page(old_folio, 0)),
>> +		       folio_page(old_folio, 0));
> 
> The PageAnonExclusive() part of this change is for David to comment on,
> but this should be a VM_BUG_ON_FOLIO() instead of calling folio_page()
> to keep this a VM_BUG_ON_PAGE().

Agreed.



-- 
Cheers,

David / dhildenb

