Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF147FD
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 07:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749196584; cv=none; b=fSf52nXKLHNtdQ4rn8HedYMuDRMaB4rpTUYyDxmtFb6ghM8LFKwL5EYcMZ1y2NUaYAM1I1u4aqSsdCYnk/5bEGBYpgBu+k+K/1GZZ7ETEV74u1JC6hrcEK2QFrytlpvCEY3Ysfqs4f/2RXelr1F35uNSxHS6lUaLypWKmkaOcug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749196584; c=relaxed/simple;
	bh=aK4eUY6IjgFc6bpIMm3SFFlCN9InJQVFzobNwHzwbDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KRlKkzRk6ZXYmAZH4ASO/73iNB/Cg05x+hB+eZh4mJXKmr8UfCrjk5iQi9gY/oVgwNFjoaWjUGfw7AQFpInUPYcvCYKczzyYzaetSUHATYK3gnusVqvOLHZZzYLzgsv7ghLGAvHdwzJ56rfoW14jioMwYTG4CkPVH16VDkyU6Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TM5qELlp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TM5qELlp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749196581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DHTEvwPHN4tR3d4e3BX0ymgMjtm1i84F6Rax2a+2GJM=;
	b=TM5qELlpeWogA6i9eUfPCWtNe11b163D5+2Ihdlkr+uHtgwgz/ospKkACcTOy6+e1ezi6k
	T13a99yWqKCQsIwIOcteUEVWxEEHlBHAaOajq3Zp6HD5gy+T50g3GPjtHMHmvUhcJSFpWp
	CuSZkIdJPEeCEXDuOHCLNR747KoPFBM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-oy_5UscLPP-pr4VJwWkGnw-1; Fri, 06 Jun 2025 03:56:20 -0400
X-MC-Unique: oy_5UscLPP-pr4VJwWkGnw-1
X-Mimecast-MFC-AGG-ID: oy_5UscLPP-pr4VJwWkGnw_1749196579
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4517abcba41so10338245e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 00:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749196579; x=1749801379;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHTEvwPHN4tR3d4e3BX0ymgMjtm1i84F6Rax2a+2GJM=;
        b=W+LmzOh7JNDNBT9ZM8wjV86MpTuM5JLZ820GPHD+s5xJh55jKm+2TMFYz7czGeTnam
         Purxm33weGbsuvMtJocfWCCFwFi/eZxq5mhNjD1CPTvdyNA9YUDHItOEhVW2fzb2LZld
         7mRyBxaMouOyOrrAPGvuZX82peg5s/LsrKDKkEkO8jhdBAgUM4RN9r40bh//pM9G8tKc
         yZc3eIuXpl/YxJhnu+pL58oYJviSWB6ark+HXlR5avmuoAk2j3x1O9Hbx6yXNFQJn//M
         O5FIbzC5vkf5r3uj+1d9HPYZuuCVhqSfKC6ZnJr0N45D0qOgkpXD5dHBmA4HNUAh+mSp
         kq5A==
X-Forwarded-Encrypted: i=1; AJvYcCVYE5Wo1KjuPU8RFmrxkbv89DcyAzea/LwQLR6lauAltpKIyfu+Jg23PU915mxP0UtP7sUvjJCPU2XUNf0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDwwxI4WLYfUOkUIFI6OQHOkeuxkfJ7if5g5uZJMzkKucKsQSe
	pmIgrbj9+5Toq/1fdaCoyZqXtkPKzmmzIUGMNmAg598EUoziAvNb7sJkCyt4uUhyaCaG3bVJWU3
	eAPUHjttZtYkMQhcGT3P2Y16M980owkYM2kI9wnkLA3wcZni71StxyUMRf+XbOTRNHQ==
X-Gm-Gg: ASbGncvE/UPB47HcIRtdsfGBzGZRzTigG4uNxmXcQiocoslSbUomsDl3askwyowvUrS
	NQdBq7vOwqyFvNK+VimtjOjfRAJd+KYBvJ7vrNS1V5OsIvbtrrRY2AdmBDa64KVnKxHvnSi46sE
	IV8YMadCQ6CH1WsJMNA/tNhaKRP8fsOI/jPhjVdNeS67PUxiKwHbt6/AjCKTUJg5YoXMs9bx2NS
	wc0xi3sf1Mv0Uah6iq3gGkVueo0OuhVsEWf00y8JOX+8UhnyX4qIvOat7EyDS8KNo6R21eFCl6j
	DIjrB9YtHWykRJzEWNKc2Mp+ODtYPFZ7+5552a4jAV8=
X-Received: by 2002:a05:600c:464a:b0:441:d438:4ea5 with SMTP id 5b1f17b1804b1-4520151f224mr13917265e9.20.1749196579019;
        Fri, 06 Jun 2025 00:56:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoAWl6xmzQlKUbzmkpwMzxJ3AWGgLpfQumR6MVXDrU3ee0bRuuHVTE9M0lhPvQ+btiD5LvMA==
X-Received: by 2002:a05:600c:464a:b0:441:d438:4ea5 with SMTP id 5b1f17b1804b1-4520151f224mr13917105e9.20.1749196578524;
        Fri, 06 Jun 2025 00:56:18 -0700 (PDT)
Received: from [192.168.3.141] (p57a1a6a5.dip0.t-ipconnect.de. [87.161.166.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b9b27sm12529925e9.23.2025.06.06.00.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 00:56:18 -0700 (PDT)
Message-ID: <02fd89c3-d0f9-412c-8f31-d343803c0982@redhat.com>
Date: Fri, 6 Jun 2025 09:56:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] kernel BUG in try_to_unmap_one (2)
To: Jinjiang Tu <tujinjiang@huawei.com>,
 syzbot <syzbot+3b220254df55d8ca8a61@syzkaller.appspotmail.com>,
 Liam.Howlett@oracle.com, akpm@linux-foundation.org, harry.yoo@oracle.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, riel@surriel.com,
 syzkaller-bugs@googlegroups.com, vbabka@suse.cz, Jens Axboe
 <axboe@kernel.dk>, Catalin Marinas <catalin.marinas@arm.com>
References: <68412d57.050a0220.2461cf.000e.GAE@google.com>
 <4fc2c008-2384-4d94-b1bf-f0a076585a4a@redhat.com>
 <fda7a3e3-1711-4f1b-a0bb-6a4369aa80ab@redhat.com>
 <b9a43f6d-1865-4074-b91c-a5bd7e10f2a9@redhat.com>
 <d1e1896b-8685-fd7c-d17d-f4328939b96f@huawei.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <d1e1896b-8685-fd7c-d17d-f4328939b96f@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05.06.25 09:18, Jinjiang Tu wrote:
> 
> 在 2025/6/5 14:37, David Hildenbrand 写道:
>> On 05.06.25 08:27, David Hildenbrand wrote:
>>> On 05.06.25 08:11, David Hildenbrand wrote:
>>>> On 05.06.25 07:38, syzbot wrote:
>>>>> Hello,
>>>>>
>>>>> syzbot found the following issue on:
>>>>>
>>>>> HEAD commit:    d7fa1af5b33e Merge branch 'for-next/core' into
>>>>> for-kernelci
>>>>
>>>> Hmmm, another very odd page-table mapping related problem on that tree
>>>> found on arm64 only:
>>>
>>> In this particular reproducer we seem to be having MADV_HUGEPAGE and
>>> io_uring_setup() be racing with MADV_HWPOISON, MADV_PAGEOUT and
>>> io_uring_register(IORING_REGISTER_BUFFERS).
>>>
>>> I assume the issue is related to MADV_HWPOISON, MADV_PAGEOUT and
>>> io_uring_register racing, only. I suspect MADV_HWPOISON is trying to
>>> split a THP, while MADV_PAGEOUT tries paging it out.
>>>
>>> IORING_REGISTER_BUFFERS ends up in
>>> io_sqe_buffers_register->io_sqe_buffer_register where we GUP-fast and
>>> try coalescing buffers.
>>>
>>> And something about THPs is not particularly happy :)
>>>
>>
>> Not sure if realted to io_uring.
>>
>> unmap_poisoned_folio() calls try_to_unmap() without TTU_SPLIT_HUGE_PMD.
>>
>> When called from memory_failure(), we make sure to never call it on a
>> large folio: WARN_ON(folio_test_large(folio));
>>
>> However, from shrink_folio_list() we might call unmap_poisoned_folio()
>> on a large folio, which doesn't work if it is still PMD-mapped. Maybe
>> passing TTU_SPLIT_HUGE_PMD would fix it.
>>
> TTU_SPLIT_HUGE_PMD only converts the PMD-mapped THP to PTE-mapped THP, and may trigger the below WARN_ON_ONCE in try_to_unmap_one.
> 
> 	if (PageHWPoison(subpage) && (flags & TTU_HWPOISON)) {
> 		...
> 	} else if (likely(pte_present(pteval)) && pte_unused(pteval) &&
> 		!userfaultfd_armed(vma)) {
> 		 ....
> 	} else if (folio_test_anon(folio)) {
> 		swp_entry_t entry = page_swap_entry(subpage);
> 		pte_t swp_pte;
> 		/*
> 		 * Store the swap location in the pte.
> 		 * See handle_pte_fault() ...
> 		*/
> 		if (unlikely(folio_test_swapbacked(folio) !=
> 			folio_test_swapcache(folio))) {
> 			WARN_ON_ONCE(1);          // here. if the subpage isn't hwposioned, and we hasn't call add_to_swap() for the THP
> 			goto walk_abort;
> 		 }

This makes me wonder if we should start splitting up try_to_unmap(), to handle the individual cases more cleanly at some point ...

Maybe for now something like:

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index b91a33fb6c694..995486a3ff4d2 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -1566,6 +1566,14 @@ int unmap_poisoned_folio(struct folio *folio, unsigned long pfn, bool must_kill)
         enum ttu_flags ttu = TTU_IGNORE_MLOCK | TTU_SYNC | TTU_HWPOISON;
         struct address_space *mapping;
  
+       /*
+        * try_to_unmap() cannot deal with some subpages of an anon folio
+        * not being hwpoisoned: we cannot unmap them without swap.
+        */
+       if (folio_test_large(folio) && !folio_test_hugetlb(folio) &&
+           folio_test_anon(folio) && !folio_test_swapcache(folio))
+               return -EBUSY;
+
         if (folio_test_swapcache(folio)) {
                 pr_err("%#lx: keeping poisoned page in swap cache\n", pfn);
                 ttu &= ~TTU_HWPOISON;



> 
> If we want to unmap in shrink_folio_list, we have to try_to_split_thp_page() like memory_failure(). But it't too complicated, maybe just skip the
> hwpoisoned folio is enough? If the folio is accessed again, memory_failure will be trigerred again and kill the accessing process since the folio
> has be hwpoisoned.


Maybe we should try splitting in there? But staring at shrink_folio_list(), not that easy.

We could return -E2BIG and let the caller try splitting, to then retry.

-- 
Cheers,

David / dhildenb

