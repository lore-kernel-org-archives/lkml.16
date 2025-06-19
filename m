Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6606220F55
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 09:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750326782; cv=none; b=CWYdGyLPOo+SQbvm2v3w/5CKfn9hXJ4HSai6uhCZABGIqYn8mpHKHjXsr46HdkE4Lu6lrB2nlYQiLtazIcBZHfRSC06AHDahEtANT6JAHQ1e1AkHkdjrjWnIQTm3d+1RpPQz+YsBgoC6909YM7Lf0PVEuHGavpLM3mKYn1jZQ9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750326782; c=relaxed/simple;
	bh=42KKUpZFl9XVBtMzn2Skx9iLCdeUqbk1q6tYTk+RDrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BCXtwrLMblxX9bYE1QVTZiueVnHWhozYLpmEJFCzEg2MP3EH9bQ7GpTqwdhGqYyZB8UeZ6YrP8ZZaXzG//MziBRyBOoI4QC+SifWg+0wRfUJQa0qYvQmqLPxVWw9Ric3H7FPLFQsGEy74RECfPpjhDj6vH3NSz6wi8UJNHXPaRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=sA4jqXtZ; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=zdsc3nK4; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=sA4jqXtZ; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=zdsc3nK4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="sA4jqXtZ";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="zdsc3nK4";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="sA4jqXtZ";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="zdsc3nK4"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B249621238;
	Thu, 19 Jun 2025 09:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750326771; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TvHiMUuP60pcYVkNP551cvCaTG+wwK26BGpbPLwl0sw=;
	b=sA4jqXtZziNQIDaiqUmCKoaMy9yvOzx4PX9MHGI8JhUHnefOt/Z1fOLJSKX6YD+wC5E2AF
	+NL0gwOo7Qwvdhrmgq1nA7IqWrHXKP0rAmg2zNFxaF5nttOIfVffF/m9Vp68x0GBONOEqF
	FcvVhBWIbdcR6B1W6EO+M63J188Fyx8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750326771;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TvHiMUuP60pcYVkNP551cvCaTG+wwK26BGpbPLwl0sw=;
	b=zdsc3nK4GB7WjwHpnM6NwxPs2tALSm2KMa6opfuLuKYraVon/pkwmlapw+wAk21/4Zoved
	0PtOtelXZ/H4WlBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750326771; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TvHiMUuP60pcYVkNP551cvCaTG+wwK26BGpbPLwl0sw=;
	b=sA4jqXtZziNQIDaiqUmCKoaMy9yvOzx4PX9MHGI8JhUHnefOt/Z1fOLJSKX6YD+wC5E2AF
	+NL0gwOo7Qwvdhrmgq1nA7IqWrHXKP0rAmg2zNFxaF5nttOIfVffF/m9Vp68x0GBONOEqF
	FcvVhBWIbdcR6B1W6EO+M63J188Fyx8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750326771;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TvHiMUuP60pcYVkNP551cvCaTG+wwK26BGpbPLwl0sw=;
	b=zdsc3nK4GB7WjwHpnM6NwxPs2tALSm2KMa6opfuLuKYraVon/pkwmlapw+wAk21/4Zoved
	0PtOtelXZ/H4WlBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A3FAC136CC;
	Thu, 19 Jun 2025 09:52:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wA4EKPPdU2hpTwAAD6G6ig
	(envelope-from <jack@suse.cz>); Thu, 19 Jun 2025 09:52:51 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 49F1FA29F1; Thu, 19 Jun 2025 11:52:43 +0200 (CEST)
Date: Thu, 19 Jun 2025 11:52:43 +0200
From: Jan Kara <jack@suse.cz>
To: ryan.roberts@arm.com
Cc: akpm@linux-foundation.org, david@redhat.com, jack@suse.cz, 
	jgg@ziepe.ca, jhubbard@nvidia.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, peterx@redhat.com, syzkaller-bugs@googlegroups.com, 
	will@kernel.org
Subject: Re: [syzbot] [mm?] KASAN: slab-use-after-free Read in
 do_sync_mmap_readahead
Message-ID: <hi6tsbuplmf6jcr44tqu6mdhtyebyqgsfif7okhnrzkcowpo4d@agoyrl4ozyth>
References: <6852b77e.a70a0220.79d0a.0214.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6852b77e.a70a0220.79d0a.0214.GAE@google.com>
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=2f7a2e4d17ed458f];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,syzkaller.appspot.com:url];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80

Hi,

On Wed 18-06-25 05:56:30, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    bc6e0ba6c9ba Add linux-next specific files for 20250613
> git tree:       linux-next
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=108c710c580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=2f7a2e4d17ed458f
> dashboard link: https://syzkaller.appspot.com/bug?extid=8e4be574cb8c40140a2a
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=148c710c580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=179025d4580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/2430bb0465cc/disk-bc6e0ba6.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/436a39deef0a/vmlinux-bc6e0ba6.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/e314ca5b1eb3/bzImage-bc6e0ba6.xz
> 
> The issue was bisected to:
> 
> commit 3b61a3f08949297815b2c77ae2696f54cd339419
> Author: Ryan Roberts <ryan.roberts@arm.com>
> Date:   Mon Jun 9 09:27:27 2025 +0000
> 
>     mm/filemap: allow arch to request folio size for exec memory

Indeed. The crash is in:

	fpin = maybe_unlock_mmap_for_io(vmf, fpin);
	if (vm_flags & VM_EXEC) {
		/*
		 * Allow arch to request a preferred minimum folio order for
		 * executable memory. This can often be beneficial to
		 * performance if (e.g.) arm64 can contpte-map the folio.
		 * Executable memory rarely benefits from readahead, due to its
		 * random access nature, so set async_size to 0.
		 *
		 * Limit to the boundaries of the VMA to avoid reading in any
		 * pad that might exist between sections, which would be a waste
		 * of memory.
		 */
		struct vm_area_struct *vma = vmf->vma;
		unsigned long start = vma->vm_pgoff;
				^^^^ here
which is not surprising because we've unlocked mmap_sem (or vma lock) just
above this if and thus vma could have been released before we got here. The
easiest fix is to move maybe_unlock_mmap_for_io() below this if. There's
nothing in there that would be problematic with the locks still held.

		unsigned long end = start + ((vma->vm_end - vma->vm_start) >> PAGE_SHIFT);
		unsigned long ra_end;

		ra->order = exec_folio_order();
		ra->start = round_down(vmf->pgoff, 1UL << ra->order);
		ra->start = max(ra->start, start);
		ra_end = round_up(ra->start + ra->ra_pages, 1UL << ra->order);
		ra_end = min(ra_end, end);
		ra->size = ra_end - ra->start;
		ra->async_size = 0;
	} else {

								Honza

> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11b0a5d4580000
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=13b0a5d4580000
> console output: https://syzkaller.appspot.com/x/log.txt?x=15b0a5d4580000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+8e4be574cb8c40140a2a@syzkaller.appspotmail.com
> Fixes: 3b61a3f08949 ("mm/filemap: allow arch to request folio size for exec memory")
> 
> ==================================================================
> BUG: KASAN: slab-use-after-free in do_sync_mmap_readahead+0x4bf/0x830 mm/filemap.c:3282
> Read of size 8 at addr ffff88806bda3410 by task syz-executor164/6247
> 
> CPU: 0 UID: 0 PID: 6247 Comm: syz-executor164 Not tainted 6.16.0-rc1-next-20250613-syzkaller #0 PREEMPT(full) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
>  print_address_description mm/kasan/report.c:408 [inline]
>  print_report+0xd2/0x2b0 mm/kasan/report.c:521
>  kasan_report+0x118/0x150 mm/kasan/report.c:634
>  do_sync_mmap_readahead+0x4bf/0x830 mm/filemap.c:3282
>  filemap_fault+0x62c/0x1200 mm/filemap.c:3444
>  __do_fault+0x135/0x390 mm/memory.c:5187
>  do_read_fault mm/memory.c:5608 [inline]
>  do_fault mm/memory.c:5742 [inline]
>  do_pte_missing mm/memory.c:4269 [inline]
>  handle_pte_fault mm/memory.c:6087 [inline]
>  __handle_mm_fault+0x37ed/0x5620 mm/memory.c:6230
>  handle_mm_fault+0x40a/0x8e0 mm/memory.c:6399
>  faultin_page mm/gup.c:1186 [inline]
>  __get_user_pages+0x1aef/0x30b0 mm/gup.c:1488
>  populate_vma_page_range+0x29f/0x3a0 mm/gup.c:1922
>  __mm_populate+0x24c/0x380 mm/gup.c:2025
>  mm_populate include/linux/mm.h:3354 [inline]
>  vm_mmap_pgoff+0x3f0/0x4c0 mm/util.c:584
>  ksys_mmap_pgoff+0x51f/0x760 mm/mmap.c:607
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f580d0c3919
> Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 51 18 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007f580d07c208 EFLAGS: 00000246 ORIG_RAX: 0000000000000009
> RAX: ffffffffffffffda RBX: 00007f580d14d348 RCX: 00007f580d0c3919
> RDX: 0000000001000006 RSI: 0000000000b36000 RDI: 0000200000000000
> RBP: 00007f580d14d340 R08: 0000000000000005 R09: 0000000000000000
> R10: 0000000000028011 R11: 0000000000000246 R12: 00007f580d11a270
> R13: 00002000000001d8 R14: 00002000000005c0 R15: 00002000000001c0
>  </TASK>
> 
> Allocated by task 6247:
>  kasan_save_stack mm/kasan/common.c:47 [inline]
>  kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
>  unpoison_slab_object mm/kasan/common.c:319 [inline]
>  __kasan_slab_alloc+0x6c/0x80 mm/kasan/common.c:345
>  kasan_slab_alloc include/linux/kasan.h:250 [inline]
>  slab_post_alloc_hook mm/slub.c:4148 [inline]
>  slab_alloc_node mm/slub.c:4197 [inline]
>  kmem_cache_alloc_noprof+0x1c1/0x3c0 mm/slub.c:4204
>  vm_area_alloc+0x24/0x140 mm/vma_init.c:31
>  __mmap_new_vma mm/vma.c:2452 [inline]
>  __mmap_region mm/vma.c:2662 [inline]
>  mmap_region+0xe0d/0x2080 mm/vma.c:2732
>  do_mmap+0xc45/0x10d0 mm/mmap.c:561
>  vm_mmap_pgoff+0x31b/0x4c0 mm/util.c:579
>  ksys_mmap_pgoff+0x51f/0x760 mm/mmap.c:607
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> Freed by task 6249:
>  kasan_save_stack mm/kasan/common.c:47 [inline]
>  kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
>  kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:576
>  poison_slab_object mm/kasan/common.c:247 [inline]
>  __kasan_slab_free+0x62/0x70 mm/kasan/common.c:264
>  kasan_slab_free include/linux/kasan.h:233 [inline]
>  slab_free_hook mm/slub.c:2381 [inline]
>  slab_free_after_rcu_debug+0x129/0x2a0 mm/slub.c:4693
>  rcu_do_batch kernel/rcu/tree.c:2582 [inline]
>  rcu_core+0xca8/0x1710 kernel/rcu/tree.c:2838
>  handle_softirqs+0x283/0x870 kernel/softirq.c:579
>  __do_softirq kernel/softirq.c:613 [inline]
>  invoke_softirq kernel/softirq.c:453 [inline]
>  __irq_exit_rcu+0xca/0x1f0 kernel/softirq.c:680
>  irq_exit_rcu+0x9/0x30 kernel/softirq.c:696
>  instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1050 [inline]
>  sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1050
>  asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
> 
> Last potentially related work creation:
>  kasan_save_stack+0x3e/0x60 mm/kasan/common.c:47
>  kasan_record_aux_stack+0xbd/0xd0 mm/kasan/generic.c:548
>  slab_free_hook mm/slub.c:2342 [inline]
>  slab_free mm/slub.c:4643 [inline]
>  kmem_cache_free+0x2f6/0x400 mm/slub.c:4745
>  remove_vma mm/vma.c:465 [inline]
>  vms_complete_munmap_vmas+0x626/0x8a0 mm/vma.c:1288
>  __mmap_complete mm/vma.c:2518 [inline]
>  __mmap_region mm/vma.c:2670 [inline]
>  mmap_region+0x1221/0x2080 mm/vma.c:2732
>  do_mmap+0xc45/0x10d0 mm/mmap.c:561
>  vm_mmap_pgoff+0x31b/0x4c0 mm/util.c:579
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> The buggy address belongs to the object at ffff88806bda33c0
>  which belongs to the cache vm_area_struct of size 256
> The buggy address is located 80 bytes inside of
>  freed 256-byte region [ffff88806bda33c0, ffff88806bda34c0)
> 
> The buggy address belongs to the physical page:
> page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x6bda3
> ksm flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
> page_type: f5(slab)
> raw: 00fff00000000000 ffff88814040ab40 ffffea0001b656c0 0000000000000003
> raw: 0000000000000000 00000000000c000c 00000000f5000000 0000000000000000
> page dumped because: kasan: bad access detected
> page_owner tracks the page as allocated
> page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 5532, tgid 5532 (rm), ts 56329480650, free_ts 52472185128
>  set_page_owner include/linux/page_owner.h:32 [inline]
>  post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1704
>  prep_new_page mm/page_alloc.c:1712 [inline]
>  get_page_from_freelist+0x21e4/0x22c0 mm/page_alloc.c:3669
>  __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:4959
>  alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2419
>  alloc_slab_page mm/slub.c:2451 [inline]
>  allocate_slab+0x8a/0x3b0 mm/slub.c:2619
>  new_slab mm/slub.c:2673 [inline]
>  ___slab_alloc+0xbfc/0x1480 mm/slub.c:3859
>  __slab_alloc mm/slub.c:3949 [inline]
>  __slab_alloc_node mm/slub.c:4024 [inline]
>  slab_alloc_node mm/slub.c:4185 [inline]
>  kmem_cache_alloc_noprof+0x283/0x3c0 mm/slub.c:4204
>  vm_area_dup+0x2b/0x680 mm/vma_init.c:122
>  __split_vma+0x1a9/0xa00 mm/vma.c:512
>  vms_gather_munmap_vmas+0x2de/0x12b0 mm/vma.c:1354
>  __mmap_prepare mm/vma.c:2351 [inline]
>  __mmap_region mm/vma.c:2641 [inline]
>  mmap_region+0x71a/0x2080 mm/vma.c:2732
>  do_mmap+0xc45/0x10d0 mm/mmap.c:561
>  vm_mmap_pgoff+0x31b/0x4c0 mm/util.c:579
>  ksys_mmap_pgoff+0x51f/0x760 mm/mmap.c:607
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> page last free pid 5212 tgid 5212 stack trace:
>  reset_page_owner include/linux/page_owner.h:25 [inline]
>  free_pages_prepare mm/page_alloc.c:1248 [inline]
>  __free_frozen_pages+0xc71/0xe70 mm/page_alloc.c:2706
>  __slab_free+0x326/0x400 mm/slub.c:4554
>  qlink_free mm/kasan/quarantine.c:163 [inline]
>  qlist_free_all+0x97/0x140 mm/kasan/quarantine.c:179
>  kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
>  __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:329
>  kasan_slab_alloc include/linux/kasan.h:250 [inline]
>  slab_post_alloc_hook mm/slub.c:4148 [inline]
>  slab_alloc_node mm/slub.c:4197 [inline]
>  __do_kmalloc_node mm/slub.c:4327 [inline]
>  __kmalloc_noprof+0x224/0x4f0 mm/slub.c:4340
>  kmalloc_noprof include/linux/slab.h:909 [inline]
>  tomoyo_realpath_from_path+0xe3/0x5d0 security/tomoyo/realpath.c:251
>  tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
>  tomoyo_path_perm+0x213/0x4b0 security/tomoyo/file.c:822
>  security_inode_getattr+0x12f/0x330 security/security.c:2377
>  vfs_getattr fs/stat.c:259 [inline]
>  vfs_statx_path fs/stat.c:299 [inline]
>  vfs_statx+0x18e/0x550 fs/stat.c:356
>  vfs_fstatat+0x118/0x170 fs/stat.c:375
>  __do_sys_newfstatat fs/stat.c:542 [inline]
>  __se_sys_newfstatat fs/stat.c:536 [inline]
>  __x64_sys_newfstatat+0x116/0x190 fs/stat.c:536
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> Memory state around the buggy address:
>  ffff88806bda3300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>  ffff88806bda3380: fc fc fc fc fc fc fc fc fa fb fb fb fb fb fb fb
> >ffff88806bda3400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                          ^
>  ffff88806bda3480: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>  ffff88806bda3500: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ==================================================================
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
