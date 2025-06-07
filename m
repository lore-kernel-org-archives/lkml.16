Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D313517BA5
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 01:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749259786; cv=none; b=oJGDXm5hmKfQWLdrR8PiFzOsKZoSfWSVkRqASFKH5jy1xUeMJBiDWtN53/SqSB6PyzCCWNq74xaw9uFIowxLJNvOqbSDWPkN6pHEm7TXiHFaRe/Wka8RvFaFXvtlQtvVd3CT6TQtdTPtZu/xAqh/FValymnbs1cOki47pIkjiY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749259786; c=relaxed/simple;
	bh=P6dPF0lif6+mdau5er/7SNd3JJGxGCbqj5YFW7yBEyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XsFrttmZyQefHGbGa5B7tqrGYp91aS2oskDYN0TeQKaB65tNiwjhlw/341PFRRdUi/R/gkiBsCSWp7kQF2h4iFaGytJX+btDsliGn4yTC+0BlGv5wH8MPxfXnTns+EWiOlRrLES2hPqBXoG1zjEUU9ojrGPAFniMHrmWYVuNfvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bDgYl2mhkztRTG;
	Sat,  7 Jun 2025 09:28:27 +0800 (CST)
Received: from kwepemo200002.china.huawei.com (unknown [7.202.195.209])
	by mail.maildlp.com (Postfix) with ESMTPS id D1A521402C4;
	Sat,  7 Jun 2025 09:29:39 +0800 (CST)
Received: from [10.174.179.13] (10.174.179.13) by
 kwepemo200002.china.huawei.com (7.202.195.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 7 Jun 2025 09:29:38 +0800
Message-ID: <3c56a8ba-235b-3fe9-d988-dd750bc0feaa@huawei.com>
Date: Sat, 7 Jun 2025 09:29:38 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [syzbot] [mm?] kernel BUG in try_to_unmap_one (2)
To: David Hildenbrand <david@redhat.com>, syzbot
	<syzbot+3b220254df55d8ca8a61@syzkaller.appspotmail.com>,
	<Liam.Howlett@oracle.com>, <akpm@linux-foundation.org>,
	<harry.yoo@oracle.com>, <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
	<lorenzo.stoakes@oracle.com>, <riel@surriel.com>,
	<syzkaller-bugs@googlegroups.com>, <vbabka@suse.cz>, Jens Axboe
	<axboe@kernel.dk>, Catalin Marinas <catalin.marinas@arm.com>, Miaohe Lin
	<linmiaohe@huawei.com>
References: <68412d57.050a0220.2461cf.000e.GAE@google.com>
 <4fc2c008-2384-4d94-b1bf-f0a076585a4a@redhat.com>
 <fda7a3e3-1711-4f1b-a0bb-6a4369aa80ab@redhat.com>
 <b9a43f6d-1865-4074-b91c-a5bd7e10f2a9@redhat.com>
 <d1e1896b-8685-fd7c-d17d-f4328939b96f@huawei.com>
 <02fd89c3-d0f9-412c-8f31-d343803c0982@redhat.com>
From: Jinjiang Tu <tujinjiang@huawei.com>
In-Reply-To: <02fd89c3-d0f9-412c-8f31-d343803c0982@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemo200002.china.huawei.com (7.202.195.209)


在 2025/6/6 15:56, David Hildenbrand 写道:
> On 05.06.25 09:18, Jinjiang Tu wrote:
>>
>> 在 2025/6/5 14:37, David Hildenbrand 写道:
>>> On 05.06.25 08:27, David Hildenbrand wrote:
>>>> On 05.06.25 08:11, David Hildenbrand wrote:
>>>>> On 05.06.25 07:38, syzbot wrote:
>>>>>> Hello,
>>>>>>
>>>>>> syzbot found the following issue on:
>>>>>>
>>>>>> HEAD commit:    d7fa1af5b33e Merge branch 'for-next/core' into
>>>>>> for-kernelci
>>>>>
>>>>> Hmmm, another very odd page-table mapping related problem on that 
>>>>> tree
>>>>> found on arm64 only:
>>>>
>>>> In this particular reproducer we seem to be having MADV_HUGEPAGE and
>>>> io_uring_setup() be racing with MADV_HWPOISON, MADV_PAGEOUT and
>>>> io_uring_register(IORING_REGISTER_BUFFERS).
>>>>
>>>> I assume the issue is related to MADV_HWPOISON, MADV_PAGEOUT and
>>>> io_uring_register racing, only. I suspect MADV_HWPOISON is trying to
>>>> split a THP, while MADV_PAGEOUT tries paging it out.
>>>>
>>>> IORING_REGISTER_BUFFERS ends up in
>>>> io_sqe_buffers_register->io_sqe_buffer_register where we GUP-fast and
>>>> try coalescing buffers.
>>>>
>>>> And something about THPs is not particularly happy :)
>>>>
>>>
>>> Not sure if realted to io_uring.
>>>
>>> unmap_poisoned_folio() calls try_to_unmap() without TTU_SPLIT_HUGE_PMD.
>>>
>>> When called from memory_failure(), we make sure to never call it on a
>>> large folio: WARN_ON(folio_test_large(folio));
>>>
>>> However, from shrink_folio_list() we might call unmap_poisoned_folio()
>>> on a large folio, which doesn't work if it is still PMD-mapped. Maybe
>>> passing TTU_SPLIT_HUGE_PMD would fix it.
>>>
>> TTU_SPLIT_HUGE_PMD only converts the PMD-mapped THP to PTE-mapped 
>> THP, and may trigger the below WARN_ON_ONCE in try_to_unmap_one.
>>
>>     if (PageHWPoison(subpage) && (flags & TTU_HWPOISON)) {
>>         ...
>>     } else if (likely(pte_present(pteval)) && pte_unused(pteval) &&
>>         !userfaultfd_armed(vma)) {
>>          ....
>>     } else if (folio_test_anon(folio)) {
>>         swp_entry_t entry = page_swap_entry(subpage);
>>         pte_t swp_pte;
>>         /*
>>          * Store the swap location in the pte.
>>          * See handle_pte_fault() ...
>>         */
>>         if (unlikely(folio_test_swapbacked(folio) !=
>>             folio_test_swapcache(folio))) {
>>             WARN_ON_ONCE(1);          // here. if the subpage isn't 
>> hwposioned, and we hasn't call add_to_swap() for the THP
>>             goto walk_abort;
>>          }
>
> This makes me wonder if we should start splitting up try_to_unmap(), 
> to handle the individual cases more cleanly at some point ...
>
> Maybe for now something like:
>
> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> index b91a33fb6c694..995486a3ff4d2 100644
> --- a/mm/memory-failure.c
> +++ b/mm/memory-failure.c
> @@ -1566,6 +1566,14 @@ int unmap_poisoned_folio(struct folio *folio, 
> unsigned long pfn, bool must_kill)
>         enum ttu_flags ttu = TTU_IGNORE_MLOCK | TTU_SYNC | TTU_HWPOISON;
>         struct address_space *mapping;
>
> +       /*
> +        * try_to_unmap() cannot deal with some subpages of an anon folio
> +        * not being hwpoisoned: we cannot unmap them without swap.
> +        */
> +       if (folio_test_large(folio) && !folio_test_hugetlb(folio) &&
> +           folio_test_anon(folio) && !folio_test_swapcache(folio))
> +               return -EBUSY;
> +

If the THP is in swapcache, we also have to split PMD-mapped to PTE-mapped first.

> if (folio_test_swapcache(folio)) {
>                 pr_err("%#lx: keeping poisoned page in swap cache\n", 
> pfn);
>                 ttu &= ~TTU_HWPOISON;
>
>
>
>>
>> If we want to unmap in shrink_folio_list, we have to 
>> try_to_split_thp_page() like memory_failure(). But it't too 
>> complicated, maybe just skip the
>> hwpoisoned folio is enough? If the folio is accessed again, 
>> memory_failure will be trigerred again and kill the accessing process 
>> since the folio
>> has be hwpoisoned.
>
>
> Maybe we should try splitting in there? But staring at 
> shrink_folio_list(), not that easy.
>
> We could return -E2BIG and let the caller try splitting, to then retry.

Since UCE is rare in real world, and could race with any subsystem, which is more race. Taking too much time to handle UCE in other subsystem is
meaningless and complicated. Just skipping is enough. memory_failure() will handle it if the UCE is trigerred again.

CC Miaohe Lin

