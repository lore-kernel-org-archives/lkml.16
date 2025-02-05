Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAC3215048
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 06:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738737530; cv=none; b=SSwtJyIHtWmxgT/c4ZsLYrpyJhJlgVDkcd30SJNXB9dAzyc88LbepE9S2dmbV1KGh1h5fEEiGi7cpbTucqcoAIeSTYle1qnzfrXy1wKxYY1sU05xdfW8ZaI/AIqEZsuKFUmcTgXTaF70TQPQj4eic0ASxJlQku2vWP/ChkeD06A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738737530; c=relaxed/simple;
	bh=3yIbEsVYQNywm9gxQa65JZ62puxncPOerZQqY4hA50s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=YIitqHskRT+cNhwLp3sMy6RKe3Z8H/cxkJs+QoDTwmpYPe//XBHZ/NrdWgi8WpzYD1gRkvUDu69ZKiSosSpGJR4XDGjSqBksIiSNQzYQefhxNTqZ7KsB9XjiX5BZ2IUzY4XWq/0PGMnlTeJLyarzq2WaZh7cIF20ImZlXZbJ+y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=FTOE8h2t; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="FTOE8h2t"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1738737519; h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type;
	bh=rXJPx/6YVFVcgvdCjt0biSyMkWzlix+vmTcNZ6Qc0pc=;
	b=FTOE8h2tI0UP4WgNOYyIUU9043rbtoVFWdsnjiPSIEyf1Sv/pNcIUX9uLySfhvTP0LasuUS0cSWLhtRB2528ZzogCeUm4R8sCjxQf5j1lfgIf7jhy+n/TJQp9VCj6U6Bciyaw43+RNJpWNiFwpzy2FfcTZ0ropYZZheubrZGXVI=
Received: from 30.74.144.115(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WOoNxun_1738737517 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 05 Feb 2025 14:38:37 +0800
Message-ID: <5dd39b03-c40e-4f34-bf89-b3e5a12753dc@linux.alibaba.com>
Date: Wed, 5 Feb 2025 14:38:36 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hang when swapping huge=within_size tmpfs from zram
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>, linux-mm@kvack.org,
 Daniel Gomez <da.gomez@samsung.com>
Cc: Barry Song <baohua@kernel.org>, David Hildenbrand <david@redhat.com>,
 Hugh Dickins <hughd@google.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Lance Yang <ioworker0@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
References: <1738717785.im3r5g2vxc.none.ref@localhost>
 <1738717785.im3r5g2vxc.none@localhost>
 <25e2d5e4-8214-40de-99d3-2b657181a9fd@linux.alibaba.com>
In-Reply-To: <25e2d5e4-8214-40de-99d3-2b657181a9fd@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/2/5 09:55, Baolin Wang wrote:
> Hi Alex,
> 
> On 2025/2/5 09:23, Alex Xu (Hello71) wrote:
>> Hi all,
>>
>> On 6.14-rc1, I found that creating a lot of files in tmpfs then deleting
>> them reliably hangs when tmpfs is mounted with huge=within_size, and it
>> is swapped out to zram (zstd/zsmalloc/no backing dev). I bisected this
>> to acd7ccb284b "mm: shmem: add large folio support for tmpfs".
>>
>> When the issue occurs, rm uses 100% CPU, cannot be killed, and has no
>> output in /proc/pid/stack or wchan. Eventually, an RCU stall is
>> detected:
> 
> Thanks for your report. Let me try to reproduce the issue locally and 
> see what happens.
> 
>> rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
>> rcu:     Tasks blocked on level-0 rcu_node (CPUs 0-11): P25160
>> rcu:     (detected by 10, t=2102 jiffies, g=532677, q=4997 ncpus=12)
>> task:rm              state:R  running task     stack:0     pid:25160 
>> tgid:25160 ppid:24309  task_flags:0x400000 flags:0x00004004
>> Call Trace:
>>   <TASK>
>>   ? __schedule+0x388/0x1000
>>   ? kmem_cache_free.part.0+0x23d/0x280
>>   ? sysvec_apic_timer_interrupt+0xa/0x80
>>   ? asm_sysvec_apic_timer_interrupt+0x16/0x20
>>   ? xas_load+0x12/0xc0
>>   ? xas_load+0x8/0xc0
>>   ? xas_find+0x144/0x190
>>   ? find_lock_entries+0x75/0x260
>>   ? shmem_undo_range+0xe6/0x5f0
>>   ? shmem_evict_inode+0xe4/0x230
>>   ? mtree_erase+0x7e/0xe0
>>   ? inode_set_ctime_current+0x2e/0x1f0
>>   ? evict+0xe9/0x260
>>   ? _atomic_dec_and_lock+0x31/0x50
>>   ? do_unlinkat+0x270/0x2b0
>>   ? __x64_sys_unlinkat+0x30/0x50
>>   ? do_syscall_64+0x37/0xe0
>>   ? entry_SYSCALL_64_after_hwframe+0x50/0x58
>>   </TASK>
>>
>> Let me know what information is needed to further troubleshoot this
>> issue.

Sorry, I can't reproduce this issue, and my testing process is as follows:
1. Mount tmpfs with huge=within_size
2. Create and write a tmpfs file
3. Swap out the large folios of the tmpfs file to zram
4. Execute 'rm' command to remove the tmpfs file

Do you have any reproduction scripts or reproduction steps guide? Thanks.
