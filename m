Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15866248F7B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750683102; cv=none; b=P41Krapxnk4SIpRsCh0ANP/HyIKjPzRr3jca94PF5teYsVfE0l4ONb0Fjc85oKK0suh03QkBnv/uVsBPj7Z3LK/hyAOpLNjw9oj84zT00ABv9OvjVZJYf40/T2Q2BYLPP/uJuIkLbrGDBytAOUWTk46Hg3TuxGEretBM8X//sFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750683102; c=relaxed/simple;
	bh=jAym0aaCR6I9cdM/a/ixYKr1VItaxh5rUZJsRaXAuus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IYPQg6+CMgwDzcKzn8NNADI1Dt3Pylf/fJ4Vqw+xSPSh6bxHWqzq4oBUh5P8CfI1TIlrbdx1jhA7B3rIYwv/4M9r31ck54/V1pjT8PFSzzwo5uAxKEf35LjTPT5BGZ34pJNH5LNeY0pdAP/TNlMZGw5yiubOCx8uTbkZZY7RnNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2ADAF113E;
	Mon, 23 Jun 2025 05:51:22 -0700 (PDT)
Received: from [10.1.29.169] (XHFQ2J9959.cambridge.arm.com [10.1.29.169])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 231723F58B;
	Mon, 23 Jun 2025 05:51:39 -0700 (PDT)
Message-ID: <40f3d567-e3f1-4beb-b05f-db76b144fd69@arm.com>
Date: Mon, 23 Jun 2025 13:51:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] KASAN: slab-use-after-free Read in
 do_sync_mmap_readahead
Content-Language: en-GB
To: Hillf Danton <hdanton@sina.com>, Jan Kara <jack@suse.cz>
Cc: david@redhat.com, jhubbard@nvidia.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, syzkaller-bugs@googlegroups.com
References: <6852b77e.a70a0220.79d0a.0214.GAE@google.com>
 <20250621012029.1386-1-hdanton@sina.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250621012029.1386-1-hdanton@sina.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/06/2025 02:20, Hillf Danton wrote:
> On Thu, 19 Jun 2025 11:52:43 +0200 Jan Kara wrote
>> On Wed 18-06-25 05:56:30, syzbot wrote:
>>> Hello,
>>>
>>> syzbot found the following issue on:
>>>
>>> HEAD commit:    bc6e0ba6c9ba Add linux-next specific files for 20250613
>>> git tree:       linux-next
>>> console+strace: https://syzkaller.appspot.com/x/log.txt?x=108c710c580000
>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=2f7a2e4d17ed458f
>>> dashboard link: https://syzkaller.appspot.com/bug?extid=8e4be574cb8c40140a2a
>>> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
>>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=148c710c580000
>>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=179025d4580000
>>>
>>> Downloadable assets:
>>> disk image: https://storage.googleapis.com/syzbot-assets/2430bb0465cc/disk-bc6e0ba6.raw.xz
>>> vmlinux: https://storage.googleapis.com/syzbot-assets/436a39deef0a/vmlinux-bc6e0ba6.xz
>>> kernel image: https://storage.googleapis.com/syzbot-assets/e314ca5b1eb3/bzImage-bc6e0ba6.xz
>>>
>>> The issue was bisected to:
>>>
>>> commit 3b61a3f08949297815b2c77ae2696f54cd339419
>>> Author: Ryan Roberts <ryan.roberts@arm.com>
>>> Date:   Mon Jun 9 09:27:27 2025 +0000
>>>
>>>     mm/filemap: allow arch to request folio size for exec memory
>>
>> Indeed. The crash is in:
>>
>> 	fpin = maybe_unlock_mmap_for_io(vmf, fpin);
>> 	if (vm_flags & VM_EXEC) {
>> 		/*
>> 		 * Allow arch to request a preferred minimum folio order for
>> 		 * executable memory. This can often be beneficial to
>> 		 * performance if (e.g.) arm64 can contpte-map the folio.
>> 		 * Executable memory rarely benefits from readahead, due to its
>> 		 * random access nature, so set async_size to 0.
>> 		 *
>> 		 * Limit to the boundaries of the VMA to avoid reading in any
>> 		 * pad that might exist between sections, which would be a waste
>> 		 * of memory.
>> 		 */
>> 		struct vm_area_struct *vma = vmf->vma;
>> 		unsigned long start = vma->vm_pgoff;
>> 				^^^^ here
>> which is not surprising because we've unlocked mmap_sem (or vma lock) just
>> above this if and thus vma could have been released before we got here. The
>> easiest fix is to move maybe_unlock_mmap_for_io() below this if. There's
>> nothing in there that would be problematic with the locks still held.
>>
> In the fault path (arch/arm64/mm/fault.c), vma is locked for read.
> 
> 	do_page_fault()
> 	vma = lock_vma_under_rcu(mm, addr)
> 	handle_mm_fault()
> 
> While in the mmap path [1], mm is locked for write but vma is removed without
> locking vma for write.
> 
> 	vm_mmap_pgoff()
> 	mmap_write_lock_killable(mm)
> 	do_mmap()
>  	mmap_regionC()
> 	__mmap_region()
> 	__mmap_complete()
> 	vms_complete_munmap_vmas()
> 	remove_vma()
> 
> Thus the correct fix looks like locking vma in both mmap and gup pathes [2].

Hi Hillf,

do_sync_mmap_readahead() was already accessing the vma prior to my change, but
it was doing so before calling maybe_unlock_mmap_for_io(). I think that you are
saying that there exists a separate race whereby it's possible for a vma to be
removed even when the vma is locked?

In which case, I think we need both fixes? FWIW, Andrew has already updated
mm-unstable to include the fix to ensure we don't access the vma after calling
maybe_unlock_mmap_for_io().

Thanks,
Ryan

> 
> [1] https://lore.kernel.org/lkml/685535d2.a00a0220.137b3.0045.GAE@google.com/
> [2] https://lore.kernel.org/lkml/68555d6e.a00a0220.137b3.004c.GAE@google.com/

