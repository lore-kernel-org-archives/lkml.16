Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B673C2F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749107928; cv=none; b=GGhF6ig+K2uMw9kjOfSvlRbYjp7R+fJ2f2Urnw/33bYfwUzctNYM6U8aZEOaOUPFnXKD6/kxuDKNmYUfCUAD18efSc9U7pL9BSOVovkrJTfcRO/y/zv/+AZUwsPSGwuhU3UGCtmmKTx8hnc7QBl0hm6tbHDwQBpnb52fWRVOMYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749107928; c=relaxed/simple;
	bh=IL/Hd3yIqTvIVLzMgkriI+WGtf8SJIpzTT8RklcLaB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CqZXJ7nH+cMiMEcDpCFK3DN7YAKu/99Un6IIej5BrAC2oJ2m3mo1SFInj/RK/rpKyLHF78KHKGIVGcT8XYWd3aKTrQQCNCzEa0XvHhm8yPP8nmp5nckACSPbnoAPoeNK52LfVszqVzcbyGByEUNX8rOc9JWOOC6ZoqQQ1QzMaEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4bCbLH4l0hzGpwn;
	Thu,  5 Jun 2025 15:14:47 +0800 (CST)
Received: from kwepemo200002.china.huawei.com (unknown [7.202.195.209])
	by mail.maildlp.com (Postfix) with ESMTPS id 67BF1180080;
	Thu,  5 Jun 2025 15:18:36 +0800 (CST)
Received: from [10.174.179.13] (10.174.179.13) by
 kwepemo200002.china.huawei.com (7.202.195.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 5 Jun 2025 15:18:35 +0800
Message-ID: <d1e1896b-8685-fd7c-d17d-f4328939b96f@huawei.com>
Date: Thu, 5 Jun 2025 15:18:34 +0800
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
	<axboe@kernel.dk>, Catalin Marinas <catalin.marinas@arm.com>
References: <68412d57.050a0220.2461cf.000e.GAE@google.com>
 <4fc2c008-2384-4d94-b1bf-f0a076585a4a@redhat.com>
 <fda7a3e3-1711-4f1b-a0bb-6a4369aa80ab@redhat.com>
 <b9a43f6d-1865-4074-b91c-a5bd7e10f2a9@redhat.com>
From: Jinjiang Tu <tujinjiang@huawei.com>
In-Reply-To: <b9a43f6d-1865-4074-b91c-a5bd7e10f2a9@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemo200002.china.huawei.com (7.202.195.209)


在 2025/6/5 14:37, David Hildenbrand 写道:
> On 05.06.25 08:27, David Hildenbrand wrote:
>> On 05.06.25 08:11, David Hildenbrand wrote:
>>> On 05.06.25 07:38, syzbot wrote:
>>>> Hello,
>>>>
>>>> syzbot found the following issue on:
>>>>
>>>> HEAD commit:    d7fa1af5b33e Merge branch 'for-next/core' into 
>>>> for-kernelci
>>>
>>> Hmmm, another very odd page-table mapping related problem on that tree
>>> found on arm64 only:
>>
>> In this particular reproducer we seem to be having MADV_HUGEPAGE and
>> io_uring_setup() be racing with MADV_HWPOISON, MADV_PAGEOUT and
>> io_uring_register(IORING_REGISTER_BUFFERS).
>>
>> I assume the issue is related to MADV_HWPOISON, MADV_PAGEOUT and
>> io_uring_register racing, only. I suspect MADV_HWPOISON is trying to
>> split a THP, while MADV_PAGEOUT tries paging it out.
>>
>> IORING_REGISTER_BUFFERS ends up in
>> io_sqe_buffers_register->io_sqe_buffer_register where we GUP-fast and
>> try coalescing buffers.
>>
>> And something about THPs is not particularly happy :)
>>
>
> Not sure if realted to io_uring.
>
> unmap_poisoned_folio() calls try_to_unmap() without TTU_SPLIT_HUGE_PMD.
>
> When called from memory_failure(), we make sure to never call it on a 
> large folio: WARN_ON(folio_test_large(folio));
>
> However, from shrink_folio_list() we might call unmap_poisoned_folio() 
> on a large folio, which doesn't work if it is still PMD-mapped. Maybe 
> passing TTU_SPLIT_HUGE_PMD would fix it.
>
TTU_SPLIT_HUGE_PMD only converts the PMD-mapped THP to PTE-mapped THP, and may trigger the below WARN_ON_ONCE in try_to_unmap_one.

	if (PageHWPoison(subpage) && (flags & TTU_HWPOISON)) {
		...
	} else if (likely(pte_present(pteval)) && pte_unused(pteval) &&
		!userfaultfd_armed(vma)) {
		 ....
	} else if (folio_test_anon(folio)) {
		swp_entry_t entry = page_swap_entry(subpage);
		pte_t swp_pte;
		/*
		 * Store the swap location in the pte.
		 * See handle_pte_fault() ...
		*/
		if (unlikely(folio_test_swapbacked(folio) !=
			folio_test_swapcache(folio))) {
			WARN_ON_ONCE(1);          // here. if the subpage isn't hwposioned, and we hasn't call add_to_swap() for the THP
			goto walk_abort;
		 }

If we want to unmap in shrink_folio_list, we have to try_to_split_thp_page() like memory_failure(). But it't too complicated, maybe just skip the
hwpoisoned folio is enough? If the folio is accessed again, memory_failure will be trigerred again and kill the accessing process since the folio
has be hwpoisoned.

>
> Likely the relevant commit is:
>
> commit 1b0449544c6482179ac84530b61fc192a6527bfd
> Author: Jinjiang Tu <tujinjiang@huawei.com>
> Date:   Tue Mar 18 16:39:39 2025 +0800

Yes, It is caused by this commit.

>
>     mm/vmscan: don't try to reclaim hwpoison folio
>         Syzkaller reports a bug as follows:
>         Injecting memory failure for pfn 0x18b00e at process virtual 
> address 0x20ffd000
>     Memory failure: 0x18b00e: dirty swapcache page still referenced by 
> 2 users
>     Memory failure: 0x18b00e: recovery action for dirty swapcache 
> page: Failed
>     page: refcount:2 mapcount:0 mapping:0000000000000000 index:0x20ffd 
> pfn:0x18b00e
>     memcg:ffff0000dd6d9000
>     anon flags: 
> 0x5ffffe00482011(locked|dirty|arch_1|swapbacked|hwpoison|node=0|zone=2|lastcpupid=0xfffff)
>     raw: 005ffffe00482011 dead000000000100 dead000000000122 
> ffff0000e232a7c9
>     raw: 0000000000020ffd 0000000000000000 00000002ffffffff 
> ffff0000dd6d9000
>     page dumped because: VM_BUG_ON_FOLIO(!folio_test_uptodate(folio))
>
> CCing Jinjiang Tu
>
