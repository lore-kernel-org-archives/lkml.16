Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168B419DFA2
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 08:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749458973; cv=none; b=AcNIRhlNovpmZa2SvIWqak+qif7xg/sjnLFuY99Yd0SAJHHFxT3IMgTl4aK6x5tAew2utZmXC19NoxMiP/9Lc+wMwzmCkEcOQFoNdEFV3HBr5hQq1S+TY7pwnnV9w39nxMDDSZGVj4UN24GOd8LATteUKUJpeCTrs3GGNUwEb0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749458973; c=relaxed/simple;
	bh=QquhVEUPYxZYLS2Wb/Gjw9Sy4Y0OOjtcFGnZEhBuUbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=joMxl65iAx/txhTLkQF4xGN2/4QUYv9u53+HA58xBX5RfALXpPyp+bFr39I01uje7Rencd8zals8NVMKCH2I0FKH6HjPYzBXxG2cS1dXsm+JqidD5ArP4YbuIS9XR7vhDt5Hxdo9hrsW653UJyN1UJywcGnVxqo3U2GShvzZwT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=AiL+YaRO; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="AiL+YaRO"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1749458966; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=5bJmfGljLGyk00an7Cg65VH+uCqXVJGk/LoQfeiR5C8=;
	b=AiL+YaRODxz3NY5V8VbaHcxiXTpIp/W9aGtQsinDJIHQBAflC38d+uoi5dPd+VnJ4SwGfHq0ivsb9wN67TADHi15iRKPh06YuOavAaV52u1qHuM6sEZ4CZoRTXBhPdpoWWKKR9A8U5aLGmHBK9OKo70fFdEtGbUzqmQ+211YHvA=
Received: from 30.74.144.144(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WdO7Itq_1749458964 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Jun 2025 16:49:25 +0800
Message-ID: <1452d0c6-50ab-4680-9aa9-13290d51177d@linux.alibaba.com>
Date: Mon, 9 Jun 2025 16:49:24 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/shmem, swap: fix softlockup with mTHP swapin
To: Kairui Song <ryncsn@gmail.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Hugh Dickins <hughd@google.com>, Kemeng Shi <shikemeng@huaweicloud.com>,
 Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>,
 Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
 Usama Arif <usamaarif642@gmail.com>, linux-kernel@vger.kernel.org
References: <20250608192713.95875-1-ryncsn@gmail.com>
 <36f52466-071a-4efb-adc2-8514b11f120c@linux.alibaba.com>
 <CAMgjq7AawxHKX8TRnshZzzUznCZbdfncThyLmA5URKBGq3r4Hw@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAMgjq7AawxHKX8TRnshZzzUznCZbdfncThyLmA5URKBGq3r4Hw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/6/9 16:36, Kairui Song wrote:
> On Mon, Jun 9, 2025 at 4:27 PM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
>> On 2025/6/9 03:27, Kairui Song wrote:
>>> From: Kairui Song <kasong@tencent.com>
>>>
>>> Following softlockup can be easily reproduced on my test machine with:
>>>
>>> echo always > /sys/kernel/mm/transparent_hugepage/hugepages-64kB/enabled
>>> swapon /dev/zram0 # zram0 is a 48G swap device
>>> mkdir -p /sys/fs/cgroup/memory/test
>>> echo 1G > /sys/fs/cgroup/test/memory.max
>>> echo $BASHPID > /sys/fs/cgroup/test/cgroup.procs
>>> while true; do
>>>       dd if=/dev/zero of=/tmp/test.img bs=1M count=5120
>>>       cat /tmp/test.img > /dev/null
>>>       rm /tmp/test.img
>>> done
>>>
>>> Then after a while:
>>> watchdog: BUG: soft lockup - CPU#0 stuck for 763s! [cat:5787]
>>> Modules linked in: zram virtiofs
>>> CPU: 0 UID: 0 PID: 5787 Comm: cat Kdump: loaded Tainted: G             L      6.15.0.orig-gf3021d9246bc-dirty #118 PREEMPT(voluntary)·
>>> Tainted: [L]=SOFTLOCKUP
>>> Hardware name: Red Hat KVM/RHEL-AV, BIOS 0.0.0 02/06/2015
>>> RIP: 0010:mpol_shared_policy_lookup+0xd/0x70
>>> Code: e9 b8 b4 ff ff 31 c0 c3 cc cc cc cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 66 0f 1f 00 0f 1f 44 00 00 41 54 55 53 <48> 8b 1f 48 85 db 74 41 4c 8d 67 08 48 89 fb 48 89 f5 4c 89 e7 e8
>>> RSP: 0018:ffffc90002b1fc28 EFLAGS: 00000202
>>> RAX: 00000000001c20ca RBX: 0000000000724e1e RCX: 0000000000000001
>>> RDX: ffff888118e214c8 RSI: 0000000000057d42 RDI: ffff888118e21518
>>> RBP: 000000000002bec8 R08: 0000000000000001 R09: 0000000000000000
>>> R10: 0000000000000bf4 R11: 0000000000000000 R12: 0000000000000001
>>> R13: 00000000001c20ca R14: 00000000001c20ca R15: 0000000000000000
>>> FS:  00007f03f995c740(0000) GS:ffff88a07ad9a000(0000) knlGS:0000000000000000
>>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> CR2: 00007f03f98f1000 CR3: 0000000144626004 CR4: 0000000000770eb0
>>> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>>> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>>> PKRU: 55555554
>>> Call Trace:
>>>    <TASK>
>>>    shmem_alloc_folio+0x31/0xc0
>>>    shmem_swapin_folio+0x309/0xcf0
>>>    ? filemap_get_entry+0x117/0x1e0
>>>    ? xas_load+0xd/0xb0
>>>    ? filemap_get_entry+0x101/0x1e0
>>>    shmem_get_folio_gfp+0x2ed/0x5b0
>>>    shmem_file_read_iter+0x7f/0x2e0
>>>    vfs_read+0x252/0x330
>>>    ksys_read+0x68/0xf0
>>>    do_syscall_64+0x4c/0x1c0
>>>    entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>> RIP: 0033:0x7f03f9a46991
>>> Code: 00 48 8b 15 81 14 10 00 f7 d8 64 89 02 b8 ff ff ff ff eb bd e8 20 ad 01 00 f3 0f 1e fa 80 3d 35 97 10 00 00 74 13 31 c0 0f 05 <48> 3d 00 f0 ff ff 77 4f c3 66 0f 1f 44 00 00 55 48 89 e5 48 83 ec
>>> RSP: 002b:00007fff3c52bd28 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
>>> RAX: ffffffffffffffda RBX: 0000000000040000 RCX: 00007f03f9a46991
>>> RDX: 0000000000040000 RSI: 00007f03f98ba000 RDI: 0000000000000003
>>> RBP: 00007fff3c52bd50 R08: 0000000000000000 R09: 00007f03f9b9a380
>>> R10: 0000000000000022 R11: 0000000000000246 R12: 0000000000040000
>>> R13: 00007f03f98ba000 R14: 0000000000000003 R15: 0000000000000000
>>>    </TASK>
>>>
>>> The reason is simple, readahead brought some order 0 folio in swap
>>> cache, and the swapin mTHP folio being allocated is in confict with it,
>>> so swapcache_prepare fails and causes shmem_swap_alloc_folio to return
>>> -EEXIST, and shmem simply retries again and again causing this loop.
>>
>> If swapcache_prepare() fails and retries, the folio's order (order 0)
>> getting from swapcache will be different from the order stored in the
>> shmem mapping, so we will split the large swap entry by the following
>> logic in shmem_swapin_folio(). So I am not sure why causing a softlockup?
>>
>>          } else if (order != folio_order(folio)) {
>>                  /*
>>                   * Swap readahead may swap in order 0 folios into swapcache
>>                   * asynchronously, while the shmem mapping can still stores
>>                   * large swap entries. In such cases, we should split the
>>                   * large swap entry to prevent possible data corruption.
>>                   */
>>                  split_order = shmem_split_large_entry(inode, index, swap, gfp);
>>                  if (split_order < 0) {
>>                          error = split_order;
>>                          goto failed;
>>                  }
>>
>>                  /*
>>                   * If the large swap entry has already been split, it is
>>                   * necessary to recalculate the new swap entry based on
>>                   * the old order alignment.
>>                   */
>>                  if (split_order > 0) {
>>                          pgoff_t offset = index - round_down(index, 1 << split_order);
>>
>>                          swap = swp_entry(swp_type(swap), swp_offset(swap) + offset);
>>                  }
>>          }
> 
> For example if the swap entry is 0x0 in shmem with order 4 (so it
> corresponds to swap entries 0x0 - 0x10), and a order 0 folio is
> currently cached with swap entry 0xa, then shmem swapin will try to
> use a folio with order 4, that will always fails swapcache_prepare,
> but filemap/swapcache lookup use entry 0x0 will return NULL, causing a
> loop.

OK. Thanks for the explanation.

>>> Fix it by applying a similar fix for anon mTHP swapin.
>>>
>>> The performance change is very slight, time of swapin 10g zero folios
>>> (test for 12 times):
>>> Before:  2.49s
>>> After:   2.52s
>>>
>>> Fixes: 1dd44c0af4fa1 ("mm: shmem: skip swapcache for swapin of synchronous swap device")
>>> Signed-off-by: Kairui Song <kasong@tencent.com>
>>>
>>> ---
>>>
>>> I found this issue while doing a performance comparing of mm-new with
>>> swap table series [1] on top of mm-new. This issue no longer exists
>>> if the swap table series is applied, because it elimated both
>>> SWAP_HAS_CACHE and SWP_SYNCHRONOUS_IO swapin completely while improving
>>> the performance and simplify the code, and the race swapin is solved
>>> differently by then.
>>>
>>> (The zero map fix might still need to stay for a while, but could be
>>> optimized too later with swap table).
>>
>> I don't understand why adding zeromap changes, and should explain this
>> explicitly.
> 
> To stay in consistency with anon mTHP swapin, swap_zeromap_batch have
> it's own comments that a hybird folio with zero and non-zero pages
> can't be brought back as a whole. I can mention that in the commit
> message.

Yes. Thanks.
