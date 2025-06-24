Received: from mail3-163.sinamail.sina.com.cn (mail3-163.sinamail.sina.com.cn [202.108.3.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328A017C77
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750725057; cv=none; b=geSzvJfkR+iF6FL9evW5bf+G9j4dtw4ZbfMhmeGz61GMvt+T7Gtkv2FokrM4RzRREiYS468R+HE9gasSW6OeX0k9nn822uddVjWOuxxOchYvj7uQF6tshzGY2KsfpbVMjBRV3iS8umVwui+o2c1kLekF/J1pcyXgXrPbyk8H3J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750725057; c=relaxed/simple;
	bh=ED3bv6O/0H0x8FICwWQDEv/l7kddeL8oRrKCzifVYJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ExulLPJaZHiAmotZGTD0AtaGUsqJHg+s9Jm+9nVoM9hPi7Vswgy9MeHmwQB7EWporqrLGMkvgXDd3BSO8JQrVm8f7hE9aHWoICVrDMWrHpKI6+g5GHdCcy5Cwwlaz10OqcOgc4ceuSSiqoL8o3bzyNA6mRmBpI/m4Q48waX6iOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=202.108.3.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.34) with ESMTP
	id 6859F1B100005CCA; Tue, 24 Jun 2025 08:30:43 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 4856036292278
X-SMAIL-UIID: E466220FD8724675BAADC35A1BAF583C-20250624-083043-1
From: Hillf Danton <hdanton@sina.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: david@redhat.com,
	jhubbard@nvidia.com,
	linux-kernel@vger.kernel.org,
	Jan Kara <jack@suse.cz>,
	linux-mm@kvack.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [mm?] KASAN: slab-use-after-free Read in do_sync_mmap_readahead
Date: Tue, 24 Jun 2025 08:30:30 +0800
Message-ID: <20250624003032.1564-1-hdanton@sina.com>
In-Reply-To: <40f3d567-e3f1-4beb-b05f-db76b144fd69@arm.com>
References: <6852b77e.a70a0220.79d0a.0214.GAE@google.com> <20250621012029.1386-1-hdanton@sina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 23 Jun 2025 13:51:37 +0100 Ryan Roberts wrote:
> On 21/06/2025 02:20, Hillf Danton wrote:
> > On Thu, 19 Jun 2025 11:52:43 +0200 Jan Kara wrote
> >> On Wed 18-06-25 05:56:30, syzbot wrote:
> >>> Hello,
> >>>
> >>> syzbot found the following issue on:
> >>>
> >>> HEAD commit:    bc6e0ba6c9ba Add linux-next specific files for 20250613
> >>> git tree:       linux-next
> >>> console+strace: https://syzkaller.appspot.com/x/log.txt?x=108c710c580000
> >>> kernel config:  https://syzkaller.appspot.com/x/.config?x=2f7a2e4d17ed458f
> >>> dashboard link: https://syzkaller.appspot.com/bug?extid=8e4be574cb8c40140a2a
> >>> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> >>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=148c710c580000
> >>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=179025d4580000
> >>>
> >>> Downloadable assets:
> >>> disk image: https://storage.googleapis.com/syzbot-assets/2430bb0465cc/disk-bc6e0ba6.raw.xz
> >>> vmlinux: https://storage.googleapis.com/syzbot-assets/436a39deef0a/vmlinux-bc6e0ba6.xz
> >>> kernel image: https://storage.googleapis.com/syzbot-assets/e314ca5b1eb3/bzImage-bc6e0ba6.xz
> >>>
> >>> The issue was bisected to:
> >>>
> >>> commit 3b61a3f08949297815b2c77ae2696f54cd339419
> >>> Author: Ryan Roberts <ryan.roberts@arm.com>
> >>> Date:   Mon Jun 9 09:27:27 2025 +0000
> >>>
> >>>     mm/filemap: allow arch to request folio size for exec memory
> >>
> >> Indeed. The crash is in:
> >>
> >> 	fpin = maybe_unlock_mmap_for_io(vmf, fpin);
> >> 	if (vm_flags & VM_EXEC) {
> >> 		/*
> >> 		 * Allow arch to request a preferred minimum folio order for
> >> 		 * executable memory. This can often be beneficial to
> >> 		 * performance if (e.g.) arm64 can contpte-map the folio.
> >> 		 * Executable memory rarely benefits from readahead, due to its
> >> 		 * random access nature, so set async_size to 0.
> >> 		 *
> >> 		 * Limit to the boundaries of the VMA to avoid reading in any
> >> 		 * pad that might exist between sections, which would be a waste
> >> 		 * of memory.
> >> 		 */
> >> 		struct vm_area_struct *vma = vmf->vma;
> >> 		unsigned long start = vma->vm_pgoff;
> >> 				^^^^ here
> >> which is not surprising because we've unlocked mmap_sem (or vma lock) just
> >> above this if and thus vma could have been released before we got here. The
> >> easiest fix is to move maybe_unlock_mmap_for_io() below this if. There's
> >> nothing in there that would be problematic with the locks still held.
> >>
> > In the fault path (arch/arm64/mm/fault.c), vma is locked for read.
> > 
> > 	do_page_fault()
> > 	vma = lock_vma_under_rcu(mm, addr)
> > 	handle_mm_fault()
> > 
> > While in the mmap path [1], mm is locked for write but vma is removed without
> > locking vma for write.
> > 
> > 	vm_mmap_pgoff()
> > 	mmap_write_lock_killable(mm)
> > 	do_mmap()
> >  	mmap_regionC()
> > 	__mmap_region()
> > 	__mmap_complete()
> > 	vms_complete_munmap_vmas()
> > 	remove_vma()
> > 
> > Thus the correct fix looks like locking vma in both mmap and gup pathes [2].
> 
> Hi Hillf,
> 
> do_sync_mmap_readahead() was already accessing the vma prior to my change, but
> it was doing so before calling maybe_unlock_mmap_for_io(). I think that you are
> saying that there exists a separate race whereby it's possible for a vma to be
> removed even when the vma is locked?
> 
The comment above faultin_page() [3] shows that mmap_lock plays its role.
/*
 * mmap_lock must be held on entry.  If @flags has FOLL_UNLOCKABLE but not
 * FOLL_NOWAIT, the mmap_lock may be released.  If it is, *@locked will be set
 * to 0 and -EBUSY returned.
 */

> In which case, I think we need both fixes? FWIW, Andrew has already updated

We can revisit this once syzbot reports again.

> mm-unstable to include the fix to ensure we don't access the vma after calling
> maybe_unlock_mmap_for_io().
> 
> Thanks,
> Ryan
> 
> > 
> > [1] https://lore.kernel.org/lkml/685535d2.a00a0220.137b3.0045.GAE@google.com/
> > [2] https://lore.kernel.org/lkml/68555d6e.a00a0220.137b3.004c.GAE@google.com/
[3] https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/mm/gup.c#n1143
