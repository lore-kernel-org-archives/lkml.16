Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64CF64D
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 15:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748102195; cv=none; b=FIgHsRt1u9AkwkNWWVLOwwR3DUM9PFz3preEOHjvYBGmug6oiRmfrobatu+idHAg6ay51v7rNkMi3cJdgU+NkUmMQfDE2WqOHE0WtchLkd9cDSiLlgr3xTchFwIxSqBI5pJYaDscKg3AJVN8RXE2p8RB+GTjXt59fTY7Ag7BJr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748102195; c=relaxed/simple;
	bh=eYcdjpQjZvZwPEiqyIZu2YBZpDX5HbR3oTzHfCvlAtQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iBC1Rdt9PFsa7dCWa4VoA5VGNK/f4ZDSh9hkksW0OVmGKcoBHBaGlDQnJgKf3EAA5CR2auLHQ//QwDFvlBTH2kbxzEmPk/qb/fH0Kyx+61+hKeIVdAP9vP+IdEAYeItphHExtfJx2Pq8FXIHTrbeHbKn7Qwdkosx/kLL0moWRRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ii/rsp/Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7nhNc9O2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ii/rsp/Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7nhNc9O2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ii/rsp/Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7nhNc9O2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ii/rsp/Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7nhNc9O2"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C7FDA21A68;
	Sat, 24 May 2025 15:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748102184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Md7LilBukiXgKK/hq2lvUDoxKYej9i2gxt7lGIaJfvE=;
	b=Ii/rsp/Zuq1wl9zl5H7QZL2xE/GHE6EAS1WqZb6RCvJ4Sg0xN4Klga/94THaUVwo4EQSXz
	AQiEkpaTFJJ/SDuinLSmcbGL6vLa0xYs6Xh7JgN3FnXlARM8vXnNmDjB2tmF7z977UkAdq
	/3tR48gf6+Lc+6TiMvCMh+daNF+uWug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748102184;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Md7LilBukiXgKK/hq2lvUDoxKYej9i2gxt7lGIaJfvE=;
	b=7nhNc9O2pI6Pbc2qexinLtDquSgLrBEq6Hym6l4e6tkuLi6EC1/HZQHug8HJ5gMkS7YH82
	xsKh9wrXHQiEbRDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748102184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Md7LilBukiXgKK/hq2lvUDoxKYej9i2gxt7lGIaJfvE=;
	b=Ii/rsp/Zuq1wl9zl5H7QZL2xE/GHE6EAS1WqZb6RCvJ4Sg0xN4Klga/94THaUVwo4EQSXz
	AQiEkpaTFJJ/SDuinLSmcbGL6vLa0xYs6Xh7JgN3FnXlARM8vXnNmDjB2tmF7z977UkAdq
	/3tR48gf6+Lc+6TiMvCMh+daNF+uWug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748102184;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Md7LilBukiXgKK/hq2lvUDoxKYej9i2gxt7lGIaJfvE=;
	b=7nhNc9O2pI6Pbc2qexinLtDquSgLrBEq6Hym6l4e6tkuLi6EC1/HZQHug8HJ5gMkS7YH82
	xsKh9wrXHQiEbRDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0BED213894;
	Sat, 24 May 2025 15:56:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DxG1OifsMWjsFwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Sat, 24 May 2025 15:56:23 +0000
Date: Sat, 24 May 2025 16:56:22 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Ricardo =?utf-8?Q?Ca=C3=B1uelo?= Navarro <rcn@igalia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	revest@google.com, kernel-dev@igalia.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v2] mm: fix copy_vma() error handling for hugetlb mappings
Message-ID: <abcchquqkxhkxu6ydwbbqdkdl6rkpocqrycnftdcc65l3km3xa@bh76j4es2o4s>
References: <20250523-warning_in_page_counter_cancel-v2-1-b6df1a8cfefd@igalia.com>
 <fs2zd6syrdpyrsqkfmzjjz3y3rricscyr3bnx5trnr6p5nbhmy@l6zyiaccoknt>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fs2zd6syrdpyrsqkfmzjjz3y3rricscyr3bnx5trnr6p5nbhmy@l6zyiaccoknt>
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.80
X-Spamd-Result: default: False [-0.80 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]

On Fri, May 23, 2025 at 01:45:47PM -0400, Liam R. Howlett wrote:
> * Ricardo Cañuelo Navarro <rcn@igalia.com> [250523 08:19]:
> > If, during a mremap() operation for a hugetlb-backed memory mapping,
> > copy_vma() fails after the source vma has been duplicated and
> > opened (ie. vma_link() fails), the error is handled by closing the new
> > vma. This updates the hugetlbfs reservation counter of the reservation
> > map which at this point is referenced by both the source vma and the new
> > copy. As a result, once the new vma has been freed and copy_vma()
> > returns, the reservation counter for the source vma will be incorrect.
> > 
> > This patch addresses this corner case by clearing the hugetlb private
> > page reservation reference for the new vma and decrementing the
> > reference before closing the vma, so that vma_close() won't update the
> > reservation counter. This is also what copy_vma_and_data() does with the
> > source vma if copy_vma() succeeds, so a helper function has been added
> > to do the fixup in both functions.
> > 
> > The issue was reported by a private syzbot instance and can be
> > reproduced using the C reproducer in [1]. It's also a possible duplicate
> > of public syzbot report [2]. The WARNING report is:
> > 
> > ============================================================
> > page_counter underflow: -1024 nr_pages=1024
> > WARNING: CPU: 0 PID: 3287 at mm/page_counter.c:61 page_counter_cancel+0xf6/0x120
> > Modules linked in:
> > CPU: 0 UID: 0 PID: 3287 Comm: repro__WARNING_ Not tainted 6.15.0-rc7+ #54 NONE
> > Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.3-2-gc13ff2cd-prebuilt.qemu.org 04/01/2014
> > RIP: 0010:page_counter_cancel+0xf6/0x120
> > Code: ff 5b 41 5e 41 5f 5d c3 cc cc cc cc e8 f3 4f 8f ff c6 05 64 01 27 06 01 48 c7 c7 60 15 f8 85 48 89 de 4c 89 fa e8 2a a7 51 ff <0f> 0b e9 66 ff ff ff 44 89 f9 80 e1 07 38 c1 7c 9d 4c 81
> > RSP: 0018:ffffc900025df6a0 EFLAGS: 00010246
> > RAX: 2edfc409ebb44e00 RBX: fffffffffffffc00 RCX: ffff8880155f0000
> > RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
> > RBP: dffffc0000000000 R08: ffffffff81c4a23c R09: 1ffff1100330482a
> > R10: dffffc0000000000 R11: ffffed100330482b R12: 0000000000000000
> > R13: ffff888058a882c0 R14: ffff888058a882c0 R15: 0000000000000400
> > FS:  0000000000000000(0000) GS:ffff88808fc53000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 00000000004b33e0 CR3: 00000000076d6000 CR4: 00000000000006f0
> > Call Trace:
> >  <TASK>
> >  page_counter_uncharge+0x33/0x80
> >  hugetlb_cgroup_uncharge_counter+0xcb/0x120
> >  hugetlb_vm_op_close+0x579/0x960
> >  ? __pfx_hugetlb_vm_op_close+0x10/0x10
> >  remove_vma+0x88/0x130
> >  exit_mmap+0x71e/0xe00
> >  ? __pfx_exit_mmap+0x10/0x10
> >  ? __mutex_unlock_slowpath+0x22e/0x7f0
> >  ? __pfx_exit_aio+0x10/0x10
> >  ? __up_read+0x256/0x690
> >  ? uprobe_clear_state+0x274/0x290
> >  ? mm_update_next_owner+0xa9/0x810
> >  __mmput+0xc9/0x370
> >  exit_mm+0x203/0x2f0
> >  ? __pfx_exit_mm+0x10/0x10
> >  ? taskstats_exit+0x32b/0xa60
> >  do_exit+0x921/0x2740
> >  ? do_raw_spin_lock+0x155/0x3b0
> >  ? __pfx_do_exit+0x10/0x10
> >  ? __pfx_do_raw_spin_lock+0x10/0x10
> >  ? _raw_spin_lock_irq+0xc5/0x100
> >  do_group_exit+0x20c/0x2c0
> >  get_signal+0x168c/0x1720
> >  ? __pfx_get_signal+0x10/0x10
> >  ? schedule+0x165/0x360
> >  arch_do_signal_or_restart+0x8e/0x7d0
> >  ? __pfx_arch_do_signal_or_restart+0x10/0x10
> >  ? __pfx___se_sys_futex+0x10/0x10
> >  syscall_exit_to_user_mode+0xb8/0x2c0
> >  do_syscall_64+0x75/0x120
> >  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > RIP: 0033:0x422dcd
> > Code: Unable to access opcode bytes at 0x422da3.
> > RSP: 002b:00007ff266cdb208 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
> > RAX: 0000000000000001 RBX: 00007ff266cdbcdc RCX: 0000000000422dcd
> > RDX: 00000000000f4240 RSI: 0000000000000081 RDI: 00000000004c7bec
> > RBP: 00007ff266cdb220 R08: 203a6362696c6720 R09: 203a6362696c6720
> > R10: 0000200000c00000 R11: 0000000000000246 R12: ffffffffffffffd0
> > R13: 0000000000000002 R14: 00007ffe1cb5f520 R15: 00007ff266cbb000
> >  </TASK>
> > ============================================================
> > 
> > Signed-off-by: Ricardo Cañuelo Navarro <rcn@igalia.com>
> > Suggested-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Link: https://people.igalia.com/rcn/kernel_logs/20250422__WARNING_in_page_counter_cancel__repro.c [1]
> > Link: https://lore.kernel.org/all/67000a50.050a0220.49194.048d.GAE@google.com/ [2]
> 
> I don't like the fixup_ names, but not enough to hold this up (or look
> at it again..). I also don't love the idea of moving a hugetlb..
>

Maybe undo_ is better?

Anyway yeah, I agree it's not worth bikeshedding over. Though if there's a v3
for any reason (or widespread agreement), this could be fixed up (haha).

> This isn't the only call path for vma_link() that doesn't unwind the
> hugetlb case correctly, but probably the only one that may need it.. I
> would hope special mappings or __bprm_mm_init() wouldn't result in
> hugetlbs.
> 
> This seems sufficient until syzbot figures a way into those insane
> ideas.
> 
> One small nit below, but thanks for this.
> 
> Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

-- 
Pedro
