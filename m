Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDDF1E89C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749109087; cv=none; b=oHpor1+0zPvybcrH8S9mzozLEEaRlC/FFZVsgIIK7e/tkEfV+9SAr1Vx/8oxNA9mlKDkntKl4XAo/fEx3KhAePgj44CCHhwynd28qfiGusF7jXsFPtJXeANlL79n8QQk2QoJed3L0UYlXOxxy1zUuskefxHjiWyhNDF2n4XVqZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749109087; c=relaxed/simple;
	bh=XFR9qSLsgpiVGLHMtV0j0oJFOT5OGIgZO99fioHszcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RzKDPVzQlLkLOyy6Y4c8BjCHjNlNJc4gaA9Ia0GPqm4Ea2zRiVzQONbu78t2W71h4+fcIfWnSvabH2cRCI3khfRsVTk86yz2fFiXFXzTcVqdmx+fdpzzi/vcK/nEGekONvQVWYwBcoFHF8EFX5RdDotHCO21FK5qQisPGOuS+fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4bCbpm4G2Nz1d1DZ;
	Thu,  5 Jun 2025 15:36:00 +0800 (CST)
Received: from kwepemo200002.china.huawei.com (unknown [7.202.195.209])
	by mail.maildlp.com (Postfix) with ESMTPS id 0E939180236;
	Thu,  5 Jun 2025 15:37:55 +0800 (CST)
Received: from [10.174.179.13] (10.174.179.13) by
 kwepemo200002.china.huawei.com (7.202.195.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 5 Jun 2025 15:37:54 +0800
Message-ID: <37e77dc4-bc73-2710-088f-f7ec0c787caf@huawei.com>
Date: Thu, 5 Jun 2025 15:37:53 +0800
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
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
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
>
> Likely the relevant commit is:
>
> commit 1b0449544c6482179ac84530b61fc192a6527bfd
> Author: Jinjiang Tu <tujinjiang@huawei.com>
> Date:   Tue Mar 18 16:39:39 2025 +0800
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

By the way, unmap_poisoned_folio() is called in do_migrate_range() too. the folio may be in lru and is a large folio.

