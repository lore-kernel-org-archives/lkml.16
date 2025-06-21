Received: from r3-22.sinamail.sina.com.cn (r3-22.sinamail.sina.com.cn [202.108.3.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DB18F5C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 01:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750468855; cv=none; b=pKSKCDEH6ew+wN76te6tiNYpNXgV3Xh+Sgs/RKCA09PD/nN/rHiQlVVxsRnNYiJ5fD4rZ387Bt1TVq+TGTun6Agq9WFA1/Zsf76X2BxVhCxOuqEUtwoil5cFaMDA1Q+P448hbc8aycLGj5goalSYZ2IYbCwYtxJwEl6M+uCCB4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750468855; c=relaxed/simple;
	bh=q9XkPFWvjdpWMAIGsAwBygMrtzTJgdDQ+W+T/vUwbTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SVcp7WPHTfF+VelI2E+QM6Lxdyhm7Qo8/v5HWYeef6MxqUp+7asZSPFBdagy8xtHctkTNuUrOuuhDscTLChVLifNO2BmBU+cYo+vpotry0+l3Nxvr5aI51e2Y/BGewsOQjg7QkGn37dvYSSrJazu3RSDu7j72PWNXAdgz3C+rUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=202.108.3.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.33) with ESMTP
	id 685608E700001CE9; Sat, 21 Jun 2025 09:20:40 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 8887656685139
X-SMAIL-UIID: 119A40A8172442E58DB5B97CADE942F9-20250621-092040-1
From: Hillf Danton <hdanton@sina.com>
To: Jan Kara <jack@suse.cz>
Cc: ryan.roberts@arm.com,
	david@redhat.com,
	jhubbard@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [mm?] KASAN: slab-use-after-free Read in do_sync_mmap_readahead
Date: Sat, 21 Jun 2025 09:20:28 +0800
Message-ID: <20250621012029.1386-1-hdanton@sina.com>
In-Reply-To: <hi6tsbuplmf6jcr44tqu6mdhtyebyqgsfif7okhnrzkcowpo4d@agoyrl4ozyth>
References: <6852b77e.a70a0220.79d0a.0214.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 19 Jun 2025 11:52:43 +0200 Jan Kara wrote
> On Wed 18-06-25 05:56:30, syzbot wrote:
> > Hello,
> > 
> > syzbot found the following issue on:
> > 
> > HEAD commit:    bc6e0ba6c9ba Add linux-next specific files for 20250613
> > git tree:       linux-next
> > console+strace: https://syzkaller.appspot.com/x/log.txt?x=108c710c580000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=2f7a2e4d17ed458f
> > dashboard link: https://syzkaller.appspot.com/bug?extid=8e4be574cb8c40140a2a
> > compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=148c710c580000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=179025d4580000
> > 
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/2430bb0465cc/disk-bc6e0ba6.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/436a39deef0a/vmlinux-bc6e0ba6.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/e314ca5b1eb3/bzImage-bc6e0ba6.xz
> > 
> > The issue was bisected to:
> > 
> > commit 3b61a3f08949297815b2c77ae2696f54cd339419
> > Author: Ryan Roberts <ryan.roberts@arm.com>
> > Date:   Mon Jun 9 09:27:27 2025 +0000
> > 
> >     mm/filemap: allow arch to request folio size for exec memory
> 
> Indeed. The crash is in:
> 
> 	fpin = maybe_unlock_mmap_for_io(vmf, fpin);
> 	if (vm_flags & VM_EXEC) {
> 		/*
> 		 * Allow arch to request a preferred minimum folio order for
> 		 * executable memory. This can often be beneficial to
> 		 * performance if (e.g.) arm64 can contpte-map the folio.
> 		 * Executable memory rarely benefits from readahead, due to its
> 		 * random access nature, so set async_size to 0.
> 		 *
> 		 * Limit to the boundaries of the VMA to avoid reading in any
> 		 * pad that might exist between sections, which would be a waste
> 		 * of memory.
> 		 */
> 		struct vm_area_struct *vma = vmf->vma;
> 		unsigned long start = vma->vm_pgoff;
> 				^^^^ here
> which is not surprising because we've unlocked mmap_sem (or vma lock) just
> above this if and thus vma could have been released before we got here. The
> easiest fix is to move maybe_unlock_mmap_for_io() below this if. There's
> nothing in there that would be problematic with the locks still held.
> 
In the fault path (arch/arm64/mm/fault.c), vma is locked for read.

	do_page_fault()
	vma = lock_vma_under_rcu(mm, addr)
	handle_mm_fault()

While in the mmap path [1], mm is locked for write but vma is removed without
locking vma for write.

	vm_mmap_pgoff()
	mmap_write_lock_killable(mm)
	do_mmap()
 	mmap_regionC()
	__mmap_region()
	__mmap_complete()
	vms_complete_munmap_vmas()
	remove_vma()

Thus the correct fix looks like locking vma in both mmap and gup pathes [2].

[1] https://lore.kernel.org/lkml/685535d2.a00a0220.137b3.0045.GAE@google.com/
[2] https://lore.kernel.org/lkml/68555d6e.a00a0220.137b3.004c.GAE@google.com/
