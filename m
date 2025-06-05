Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFA7207A18
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 09:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749114828; cv=none; b=uJFeRAQ/3/5uyHoOYrNwp1NO54hd/ivu5N0i/X9Gbz+M0yFNz6QTo14a2kX+wh/XnkXAXPAGE78QnuMzl5W6IGtn67GPRYDR1bvei9Pb8qCe8XwTISahBgVRIJM3Q54UB2ib+wA77W9td1YeHF/lRGPk3eX285WfLGVbDHB2Ln0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749114828; c=relaxed/simple;
	bh=VMlUbIdXQk7p5zPiV8x5KgGrvaVU12x/wrH52EfnuwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=r2rpQum3imqG2JG5/R6bUt0AsbNY13c7hITcG7GGMlNx4g7XDgRXCizRCMqP0EnW++3Kim0buViz7vkId+RHq/eW0KP9Ok0sgpwgTsM5EPE6KSyngyxfqyDSZYpdPHnaZpDHl1pbiLgtXC1Ci5Nv/DKqRtIKW2DnwwXupHDPqjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U//OloKg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U//OloKg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749114825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PU3FQpR1h3Dt+zEvCBTcAsStL66OO0crER4962yFxj4=;
	b=U//OloKgj73So1kCtEIru0fsObDIULQvrys9rrbYan+f7nm6rmnZIxCOcSzN3fUOpMYJZZ
	s/kmKB9tMqwXO/lz/5FvVEcJxLQEwyiJbhugXcPGAiLXELloP2xDZSdcuEkANmtkOATKfn
	bU7OqhyXdVvBqLnKSnLidYXLrXHXHUc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-77_bSxEqMgalXkgpepC0vw-1; Thu, 05 Jun 2025 05:13:43 -0400
X-MC-Unique: 77_bSxEqMgalXkgpepC0vw-1
X-Mimecast-MFC-AGG-ID: 77_bSxEqMgalXkgpepC0vw_1749114822
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso4378355e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 02:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749114822; x=1749719622;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PU3FQpR1h3Dt+zEvCBTcAsStL66OO0crER4962yFxj4=;
        b=rDgoLY26odhrqm2SZpbirC2hgRodXqQRW5BhUiDcyn1dQzZkqxCOA3b2kueapx9dBM
         DWoSTN1vDnnpnZeysrGTNV2MJiFxf08zfMUx+uyrIDMpVk/+/0talec/HyEHnKQG0KLG
         dpsW4KloaVhhpAILG8VmCUiX51m9fk0Bs1aINCnuUPFxC7bXsglbVmVSKoK5y/btxebp
         qGwCDbFldzgy2k2LTnlKy6mULGj74JOR7njlDFJqCG9v/MB9R0lc/hMzJay5fSEzU7Ir
         dhUWdPG0vv5fqd6LiTxHTz+kmduHJqJptDmY/xeRjNBM2uw5xqYZVY26DzxC301gBcOb
         3ZxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuufrVojcR5NXEhDDu84K/lXIt6s223luVq4hr15VrohkEynddfUe2GfJ9mVpPjbUBUnIrqKWj2GujB7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEAW3x6a1eSTKN4LVM88w/QaHkrHREyB1WLzf7xLlXPpS/kjf5
	SfJkGtQE0CT/xSz4GNYNfavK/em6w+/S/Pcq4ByPuGTuOiosIOrnlzla6DSf2OA2U6tcSOMk2VU
	uV6Hd/eJEYVBp6LyxnDiZj52M7y2ejRynjav1Pa47lcaZTwQUAzgK5NKaKIsBH1bmnQ==
X-Gm-Gg: ASbGncshm4Loe17s4LU2IYN+EGjGKXabQOzzunuPfqBElDIxMnMLtSpees5ltDv6zKz
	PD+8R7TDGuEoXmNc96LaDnfpiSlvHEeVughRhmsWQLDG80hrxjPRenXQwl9FHcTBR+2Ex9TLDPI
	74lyOmaMtYffsfK15iudw3Bty+Ot/Z6+AluWHxbnFm3z0gbRHmFnRBxtYdrhf5gkzcKe2Ip8jlQ
	5n7jGZoCpiaxXyjHrhjqhM2TzrfHY7FFUR18vzbTaJsEGCAsCdCkmKXxGvBxj26tzQUMENS2OB0
	trOz4iGyORbdKLLjyt8p2iF4pXem5tucz849wDE0fCo7hMBJKD9exQcuT7roJSpVofwd3b06UNh
	fEdC3ThxCUQvt+vGkoBK+lZT/+tM9xkALztnM
X-Received: by 2002:a05:6000:310e:b0:3a3:64fb:304d with SMTP id ffacd0b85a97d-3a51d8f68c3mr4694416f8f.12.1749114822451;
        Thu, 05 Jun 2025 02:13:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYYWe9vV/todZ3+L6zve+3foocyt6f44lhpViRHk3WWV3k3ABwlYE9sP3wgBSKO8EuPWW/xA==
X-Received: by 2002:a05:6000:310e:b0:3a3:64fb:304d with SMTP id ffacd0b85a97d-3a51d8f68c3mr4694396f8f.12.1749114822046;
        Thu, 05 Jun 2025 02:13:42 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2? (p200300d82f27ec004f4d0d38ba979aa2.dip0.t-ipconnect.de. [2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f9813e5dsm17901785e9.12.2025.06.05.02.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 02:13:41 -0700 (PDT)
Message-ID: <9eac8a3f-08c2-41f5-a468-1fe5c00a046c@redhat.com>
Date: Thu, 5 Jun 2025 11:13:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] mm: gup: avoid CMA page pinning by retrying
 migration if no migratable page
To: Hyesoo Yu <hyesoo.yu@samsung.com>, janghyuck.kim@samsung.com,
 zhaoyang.huang@unisoc.com, jaewon31.kim@gmail.com,
 Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250605080436.3764686-1-hyesoo.yu@samsung.com>
 <CGME20250605080628epcas2p24220eeceef2ae38feeee9d2c18515800@epcas2p2.samsung.com>
 <20250605080436.3764686-2-hyesoo.yu@samsung.com>
 <20250605083916.GA3770753@tiffany>
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
In-Reply-To: <20250605083916.GA3770753@tiffany>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.06.25 10:39, Hyesoo Yu wrote:
> On Thu, Jun 05, 2025 at 05:04:31PM +0900, Hyesoo Yu wrote:
>> Commit 1aaf8c122918 ("mm: gup: fix infinite loop within __get_longterm_locked")
>> introduced an issue where CMA pages could be pinned by longterm GUP requests.
>> This occurs when unpinnable pages are detected but the movable_page_list is empty;
>> the commit would return success without retrying, allowing unpinnable
>> pages (such as CMA) to become pinned.
>>
>> CMA pages may be temporarily off the LRU due to concurrent isolation,
>> for example when multiple longterm GUP requests are racing and therefore
>> not appear in movable_page_list. Before commit 1aaf8c, the kernel would
>> retry migration in such cases, which helped avoid accidental CMA pinning.
>>
>> The original intent of the commit was to support longterm GUP on non-LRU
>> CMA pages in out-of-tree use cases such as pKVM. However, allowing this
>> can lead to broader CMA pinning issues.
>>
>> To avoid this, the logic is restored to return -EAGAIN instead of success
>> when no folios could be collected but unpinnable pages were found.
>> This ensures that migration is retried until success, and avoids
>> inadvertently pinning unpinnable pages.
>>
>> Fixes: 1aaf8c122918 ("mm: gup: fix infinite loop within __get_longterm_locked")
>> Acked-by: David Hildenbrand <david@redhat.com>
>> Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
>>
>> ---
>> We have confirmed that this regression causes CMA pages to be pinned
>> in our kernel 6.12-based environment.
>>
>> In addition to CMA allocation failures, we also observed longterm GUP failures
>> when repeatedly accessing the same VMA. Specifically, the first longterm GUP
>> call would pin a CMA page, and a second call on the same region
>> would fail the migration because the cma page was already pinned.
>>
>> After reverting commit 1aaf8c122918, the issue no longer reproduced.
>>
>> Therefore, this fix is important to ensure reliable behavior of longterm GUP
>> and CMA-backed memory, and should be backported to stable.
>> ---
>>   mm/gup.c | 28 ++++++++++++++++++++++------
>>   1 file changed, 22 insertions(+), 6 deletions(-)
>>
>> diff --git a/mm/gup.c b/mm/gup.c
>> index e065a49842a8..66193421c1d4 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -2300,14 +2300,12 @@ static void pofs_unpin(struct pages_or_folios *pofs)
>>   		unpin_user_pages(pofs->pages, pofs->nr_entries);
>>   }
>>   
>> -/*
>> - * Returns the number of collected folios. Return value is always >= 0.
>> - */
>> -static void collect_longterm_unpinnable_folios(
>> +static bool collect_longterm_unpinnable_folios(
>>   		struct list_head *movable_folio_list,
>>   		struct pages_or_folios *pofs)
>>   {
>>   	struct folio *prev_folio = NULL;
>> +	bool any_unpinnable = false;
>>   	bool drain_allow = true;
>>   	unsigned long i;
>>   
>> @@ -2321,6 +2319,8 @@ static void collect_longterm_unpinnable_folios(
>>   		if (folio_is_longterm_pinnable(folio))
>>   			continue;
>>   
>> +		any_unpinnable = true;
>> +
>>   		if (folio_is_device_coherent(folio))
>>   			continue;
>>
>> @@ -2342,6 +2342,8 @@ static void collect_longterm_unpinnable_folios(
>>   				    NR_ISOLATED_ANON + folio_is_file_lru(folio),
>>   				    folio_nr_pages(folio));
>>   	}
>> +
>> +	return any_unpinnable;
>>   }
>>   
>>   /*
>> @@ -2417,11 +2419,25 @@ migrate_longterm_unpinnable_folios(struct list_head *movable_folio_list,
>>   static long
>>   check_and_migrate_movable_pages_or_folios(struct pages_or_folios *pofs)
>>   {
>> +	bool any_unpinnable;
>> +
>>   	LIST_HEAD(movable_folio_list);
>>   
>> -	collect_longterm_unpinnable_folios(&movable_folio_list, pofs);
>> -	if (list_empty(&movable_folio_list))
>> +	any_unpinnable = collect_longterm_unpinnable_folios(&movable_folio_list, pofs);
>> +
> 
> Hi David,
> 
> While re-reviewing the v3 patch, I realized that migrate_longterm_unpinnable_folios()
> should always be called whenever unpinnable folios are present, regardless of whether
> the movable_folio_list is empty.
 > > In collect_longterm_unpinnable_folios(), if 
folio_is_device_coherent() is true,
> the folio is not added to movable_folio_list. However, such device-coherent folios
> still need to be migrated later in migrate_longterm_unpinnable_folios().

Ohh, because we cannot isolate them ... and they are always 
longterm-unpinnable.

> 
> I think the condition `list_empty(&movable_folio_list)` should be removed,
> and it might be better to revert commit 1aaf8c122918 rather than adding a new patch.
> 
> What do you think?

Yeah, with that in mind, a revert might indeed be the better option.

-- 
Cheers,

David / dhildenb

