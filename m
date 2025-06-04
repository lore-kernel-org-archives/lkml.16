Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827992248A0
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 07:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749023550; cv=none; b=D0rmKYwvXFD97Dpio2MJDDDt+6gvD7ZHY6ayaEF6gJ031nX3u1+gpR3RN7s5isyHhTPdcmD4VNgKa+Tsi+Na+5o4j5QZNWsKTu2gyYpJvu/tPcYpJ/THp9Xr9vHLVXCEytaca2+Ou3Zf+AznfMYx+Ke1gO+7KnPkI9AdGADXqig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749023550; c=relaxed/simple;
	bh=IdIlOl+pfS35CPKqZk2eBeMZ3n8nF4C7oSvaUq8ippo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=Jp61ynLXXURmu/y3G+VDDgaDdDZ92XUnJDudrC03oEcJI5Mp9w5ugeaBNXosD0CANkxCUpnJ+txm2n7lqOmruD0skdRH66Dp0VGYm46tOuosy5Qe2z/SkNn5nHSAQKfWERqRmj4s5xy9LpS8/qwD5b4cxiIdfCEOt5FL3pCj0no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=PEjkrjvH; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=/ZilaEg0; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=PEjkrjvH; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=/ZilaEg0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="PEjkrjvH";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="/ZilaEg0";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="PEjkrjvH";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="/ZilaEg0"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8390A5C032;
	Wed,  4 Jun 2025 07:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749023545; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wxOIcE6fMByOMYpSTiz2tisDxFgTeY0L0x4GmGRCOfE=;
	b=PEjkrjvHJxZOcjpgxObYLPkvjpOLF0a2i+3zdRN9B/rC9FjCbX4ObROBuY/Lqwh8af/yk/
	QsLH5bE25wcrlDzFK3k4gbfw123vNeM5l2Xfx+KuFfxrtfCi1TA3gUbetE/iVqAW837iOU
	qpvVHX4TRFKbrL52g+0PhEx0dEwv/ms=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749023545;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wxOIcE6fMByOMYpSTiz2tisDxFgTeY0L0x4GmGRCOfE=;
	b=/ZilaEg0UiDgaZT9CnVs/nMLsKoZkUkCgDvJ38ADcawFjMysqL5iP9ZIFNucDGXeW0AzXR
	ke/XQrW3dBLdq/CQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749023545; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wxOIcE6fMByOMYpSTiz2tisDxFgTeY0L0x4GmGRCOfE=;
	b=PEjkrjvHJxZOcjpgxObYLPkvjpOLF0a2i+3zdRN9B/rC9FjCbX4ObROBuY/Lqwh8af/yk/
	QsLH5bE25wcrlDzFK3k4gbfw123vNeM5l2Xfx+KuFfxrtfCi1TA3gUbetE/iVqAW837iOU
	qpvVHX4TRFKbrL52g+0PhEx0dEwv/ms=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749023545;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wxOIcE6fMByOMYpSTiz2tisDxFgTeY0L0x4GmGRCOfE=;
	b=/ZilaEg0UiDgaZT9CnVs/nMLsKoZkUkCgDvJ38ADcawFjMysqL5iP9ZIFNucDGXeW0AzXR
	ke/XQrW3dBLdq/CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 63BCF13A63;
	Wed,  4 Jun 2025 07:52:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id r+LqFzn7P2h6bwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 04 Jun 2025 07:52:25 +0000
Message-ID: <f03916ab-19fc-4832-b564-58d3c885011d@suse.cz>
Date: Wed, 4 Jun 2025 09:52:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] possible deadlock in __vma_start_write
To: syzbot <syzbot+23de6daeb71241d36a18@syzkaller.appspotmail.com>,
 Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, pfalcato@suse.de, syzkaller-bugs@googlegroups.com
References: <68387feb.a70a0220.29d4a0.0830.GAE@google.com>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
Cc: Suren Baghdasaryan <surenb@google.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>,
 John Ogness <john.ogness@linutronix.de>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <68387feb.a70a0220.29d4a0.0830.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=89c13de706fbf07a];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	REDIRECTOR_URL(0.00)[goo.gl];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[23de6daeb71241d36a18];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Spam-Level: 

On 5/29/25 17:40, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    d7fa1af5b33e Merge branch 'for-next/core' into for-kernelci
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=12bbdad4580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=89c13de706fbf07a
> dashboard link: https://syzkaller.appspot.com/bug?extid=23de6daeb71241d36a18
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> userspace arch: arm64
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/da97ad659b2c/disk-d7fa1af5.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/659e123552a8/vmlinux-d7fa1af5.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/6ec5dbf4643e/Image-d7fa1af5.gz.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+23de6daeb71241d36a18@syzkaller.appspotmail.com
> 
> SQUASHFS error: zstd decompression failed, data probably corrupt
> SQUASHFS error: Failed to read block 0x60: -5
> ======================================================
> WARNING: possible circular locking dependency detected
> 6.15.0-rc7-syzkaller-gd7fa1af5b33e #0 Not tainted
> ------------------------------------------------------
> syz.1.261/8150 is trying to acquire lock:
> ffff0000d7ffcbc8 (vm_lock){++++}-{0:0}, at: __vma_start_write+0x34/0x158 mm/memory.c:6497
> 
> but task is already holding lock:
> ffff0000d572df50 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock include/linux/mmap_lock.h:128 [inline]
> ffff0000d572df50 (&mm->mmap_lock){++++}-{4:4}, at: exit_mmap+0x200/0xbec mm/mmap.c:1292
> 
> which lock already depends on the new lock.
> 
> 
> the existing dependency chain (in reverse order) is:
> 
> -> #6 (&mm->mmap_lock){++++}-{4:4}:
>        __might_fault+0xc4/0x124 mm/memory.c:7151
>        drm_mode_get_lease_ioctl+0x2bc/0x53c drivers/gpu/drm/drm_lease.c:673
>        drm_ioctl_kernel+0x238/0x310 drivers/gpu/drm/drm_ioctl.c:796
>        drm_ioctl+0x65c/0xa5c drivers/gpu/drm/drm_ioctl.c:893
>        vfs_ioctl fs/ioctl.c:51 [inline]
>        __do_sys_ioctl fs/ioctl.c:906 [inline]
>        __se_sys_ioctl fs/ioctl.c:892 [inline]
>        __arm64_sys_ioctl+0x14c/0x1c4 fs/ioctl.c:892
>        __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>        invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>        el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>        do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>        el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
>        el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
>        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> 
> -> #5 (&dev->mode_config.idr_mutex){+.+.}-{4:4}:
>        __mutex_lock_common+0x1d0/0x2190 kernel/locking/mutex.c:601
>        __mutex_lock kernel/locking/mutex.c:746 [inline]
>        mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:798
>        __drm_mode_object_add+0xa8/0x1f0 drivers/gpu/drm/drm_mode_object.c:47
>        drm_framebuffer_init+0x14c/0x2bc drivers/gpu/drm/drm_framebuffer.c:875
>        drm_gem_fb_init drivers/gpu/drm/drm_gem_framebuffer_helper.c:82 [inline]
>        drm_gem_fb_init_with_funcs+0xa60/0xda4 drivers/gpu/drm/drm_gem_framebuffer_helper.c:202
>        drm_gem_fb_create_with_funcs drivers/gpu/drm/drm_gem_framebuffer_helper.c:245 [inline]
>        drm_gem_fb_create+0x84/0xd4 drivers/gpu/drm/drm_gem_framebuffer_helper.c:286
>        drm_internal_framebuffer_create+0xfcc/0x19dc drivers/gpu/drm/drm_framebuffer.c:304
>        drm_mode_addfb2+0xac/0x2a0 drivers/gpu/drm/drm_framebuffer.c:338
>        drm_client_buffer_addfb drivers/gpu/drm/drm_client.c:386 [inline]
>        drm_client_framebuffer_create+0x2d0/0x55c drivers/gpu/drm/drm_client.c:428
>        drm_fbdev_shmem_driver_fbdev_probe+0x180/0x70c drivers/gpu/drm/drm_fbdev_shmem.c:151
>        drm_fb_helper_single_fb_probe drivers/gpu/drm/drm_fb_helper.c:1649 [inline]
>        __drm_fb_helper_initial_config_and_unlock+0xf94/0x159c drivers/gpu/drm/drm_fb_helper.c:1829
>        drm_fb_helper_initial_config+0x3c/0x58 drivers/gpu/drm/drm_fb_helper.c:1916
>        drm_fbdev_client_hotplug+0x154/0x22c drivers/gpu/drm/clients/drm_fbdev_client.c:52
>        drm_client_register+0x13c/0x1d4 drivers/gpu/drm/drm_client.c:140
>        drm_fbdev_client_setup+0x194/0x3d0 drivers/gpu/drm/clients/drm_fbdev_client.c:159
>        drm_client_setup+0x78/0x140 drivers/gpu/drm/clients/drm_client_setup.c:39
>        vkms_create drivers/gpu/drm/vkms/vkms_drv.c:218 [inline]
>        vkms_init+0x4b8/0x5ac drivers/gpu/drm/vkms/vkms_drv.c:242
>        do_one_initcall+0x250/0x990 init/main.c:1257
>        do_initcall_level+0x154/0x214 init/main.c:1319
>        do_initcalls+0x84/0xf4 init/main.c:1335
>        do_basic_setup+0x8c/0xa0 init/main.c:1354
>        kernel_init_freeable+0x2dc/0x444 init/main.c:1567
>        kernel_init+0x24/0x1dc init/main.c:1457
>        ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847
> 
> -> #4 (&helper->lock){+.+.}-{4:4}:
>        __mutex_lock_common+0x1d0/0x2190 kernel/locking/mutex.c:601
>        __mutex_lock kernel/locking/mutex.c:746 [inline]
>        mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:798
>        __drm_fb_helper_restore_fbdev_mode_unlocked+0x74/0x198 drivers/gpu/drm/drm_fb_helper.c:228
>        drm_fb_helper_set_par+0xa4/0x108 drivers/gpu/drm/drm_fb_helper.c:1359
>        fbcon_init+0xe4c/0x1d18 drivers/video/fbdev/core/fbcon.c:1112
>        visual_init+0x27c/0x540 drivers/tty/vt/vt.c:1011
>        do_bind_con_driver+0x7b8/0xdd8 drivers/tty/vt/vt.c:3831
>        do_take_over_console+0x824/0x97c drivers/tty/vt/vt.c:4397
>        do_fbcon_takeover+0x158/0x25c drivers/video/fbdev/core/fbcon.c:548
>        do_fb_registered drivers/video/fbdev/core/fbcon.c:2989 [inline]
>        fbcon_fb_registered+0x354/0x4c8 drivers/video/fbdev/core/fbcon.c:3009
>        do_register_framebuffer drivers/video/fbdev/core/fbmem.c:449 [inline]
>        register_framebuffer+0x44c/0x5ec drivers/video/fbdev/core/fbmem.c:515
>        __drm_fb_helper_initial_config_and_unlock+0x103c/0x159c drivers/gpu/drm/drm_fb_helper.c:1851
>        drm_fb_helper_initial_config+0x3c/0x58 drivers/gpu/drm/drm_fb_helper.c:1916
>        drm_fbdev_client_hotplug+0x154/0x22c drivers/gpu/drm/clients/drm_fbdev_client.c:52
>        drm_client_register+0x13c/0x1d4 drivers/gpu/drm/drm_client.c:140
>        drm_fbdev_client_setup+0x194/0x3d0 drivers/gpu/drm/clients/drm_fbdev_client.c:159
>        drm_client_setup+0x78/0x140 drivers/gpu/drm/clients/drm_client_setup.c:39
>        vkms_create drivers/gpu/drm/vkms/vkms_drv.c:218 [inline]
>        vkms_init+0x4b8/0x5ac drivers/gpu/drm/vkms/vkms_drv.c:242
>        do_one_initcall+0x250/0x990 init/main.c:1257
>        do_initcall_level+0x154/0x214 init/main.c:1319
>        do_initcalls+0x84/0xf4 init/main.c:1335
>        do_basic_setup+0x8c/0xa0 init/main.c:1354
>        kernel_init_freeable+0x2dc/0x444 init/main.c:1567
>        kernel_init+0x24/0x1dc init/main.c:1457
>        ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847
> 
> -> #3 (console_lock){+.+.}-{0:0}:
>        console_lock+0x194/0x1ec kernel/printk/printk.c:2849
>        __bch2_print_string_as_lines fs/bcachefs/util.c:267 [inline]
>        bch2_print_string_as_lines+0x34/0x150 fs/bcachefs/util.c:286
>        bucket_ref_update_err+0x1c8/0x21c fs/bcachefs/buckets.c:417
>        bch2_bucket_ref_update+0x3d8/0x888 fs/bcachefs/buckets.c:-1
>        __mark_pointer fs/bcachefs/buckets.c:572 [inline]
>        bch2_trigger_pointer fs/bcachefs/buckets.c:618 [inline]
>        __trigger_extent+0xd90/0x35fc fs/bcachefs/buckets.c:763
>        bch2_trigger_extent+0x3e4/0x78c fs/bcachefs/buckets.c:881
>        run_one_trans_trigger fs/bcachefs/btree_trans_commit.c:-1 [inline]
>        bch2_trans_commit_run_triggers fs/bcachefs/btree_trans_commit.c:550 [inline]
>        __bch2_trans_commit+0x7e8/0x62d0 fs/bcachefs/btree_trans_commit.c:990
>        bch2_trans_commit fs/bcachefs/btree_update.h:195 [inline]
>        bch2_extent_update+0x2d8/0x7e8 fs/bcachefs/io_write.c:353
>        bch2_write_index_default fs/bcachefs/io_write.c:401 [inline]
>        __bch2_write_index+0x570/0xfec fs/bcachefs/io_write.c:591
>        bch2_write_data_inline fs/bcachefs/io_write.c:1630 [inline]
>        bch2_write+0xacc/0x112c fs/bcachefs/io_write.c:1698
>        closure_queue include/linux/closure.h:270 [inline]
>        closure_call include/linux/closure.h:432 [inline]
>        bch2_writepage_do_io fs/bcachefs/fs-io-buffered.c:494 [inline]
>        bch2_writepages+0x1fc/0x2cc fs/bcachefs/fs-io-buffered.c:677
>        do_writepages+0x2c0/0x6a8 mm/page-writeback.c:2656
>        filemap_fdatawrite_wbc mm/filemap.c:386 [inline]
>        __filemap_fdatawrite_range mm/filemap.c:419 [inline]
>        filemap_write_and_wait_range+0x1ac/0x29c mm/filemap.c:691
>        bchfs_truncate+0x574/0xa70 fs/bcachefs/fs-io.c:-1
>        bch2_setattr+0x198/0x20c fs/bcachefs/fs.c:1245
>        notify_change+0x9a4/0xc50 fs/attr.c:552
>        do_truncate+0x178/0x1f0 fs/open.c:65
>        vfs_truncate+0x398/0x444 fs/open.c:115
>        do_sys_truncate+0xe4/0x1a8 fs/open.c:138
>        __do_sys_truncate fs/open.c:150 [inline]
>        __se_sys_truncate fs/open.c:148 [inline]
>        __arm64_sys_truncate+0x5c/0x74 fs/open.c:148
>        __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>        invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>        el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>        do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>        el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
>        el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
>        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> 
> -> #2 (bcachefs_btree){+.+.}-{0:0}:
>        trans_set_locked+0x94/0x200 fs/bcachefs/btree_locking.h:198
>        bch2_trans_begin+0x6f8/0xa40 fs/bcachefs/btree_iter.c:3288
>        bch2_read_err_msg_trans+0x64/0x298 fs/bcachefs/io_read.c:346
>        __bch2_read_extent+0x21fc/0x3694 fs/bcachefs/io_read.c:975
>        bch2_read_extent fs/bcachefs/io_read.h:140 [inline]
>        bchfs_read+0x1178/0x17dc fs/bcachefs/fs-io-buffered.c:226
>        bch2_readahead+0xa18/0xd88 fs/bcachefs/fs-io-buffered.c:316
>        read_pages+0x13c/0x4c8 mm/readahead.c:160
>        page_cache_ra_order+0x7b8/0xb34 mm/readahead.c:515
>        do_sync_mmap_readahead+0x2f0/0x660 mm/filemap.c:-1
>        filemap_fault+0x600/0x1278 mm/filemap.c:3403
>        bch2_page_fault+0x2cc/0x700 fs/bcachefs/fs-io-pagecache.c:594
>        __do_fault+0xf8/0x498 mm/memory.c:5098
>        do_read_fault mm/memory.c:5518 [inline]
>        do_fault mm/memory.c:5652 [inline]
>        do_pte_missing mm/memory.c:4160 [inline]
>        handle_pte_fault mm/memory.c:5997 [inline]
>        __handle_mm_fault mm/memory.c:6140 [inline]
>        handle_mm_fault+0x2cb0/0x4d18 mm/memory.c:6309
>        faultin_page mm/gup.c:1193 [inline]
>        __get_user_pages+0x1dd4/0x30d8 mm/gup.c:1491
>        populate_vma_page_range+0x218/0x2e8 mm/gup.c:1929
>        __mm_populate+0x208/0x330 mm/gup.c:2032
>        mm_populate include/linux/mm.h:3487 [inline]
>        vm_mmap_pgoff+0x378/0x43c mm/util.c:584
>        ksys_mmap_pgoff+0x394/0x5b8 mm/mmap.c:607
>        __do_sys_mmap arch/arm64/kernel/sys.c:28 [inline]
>        __se_sys_mmap arch/arm64/kernel/sys.c:21 [inline]
>        __arm64_sys_mmap+0xf8/0x110 arch/arm64/kernel/sys.c:21
>        __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>        invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>        el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>        do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>        el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
>        el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
>        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> 
> -> #1 (mapping.invalidate_lock#4){.+.+}-{4:4}:
>        down_read+0x58/0x2f8 kernel/locking/rwsem.c:1524
>        filemap_invalidate_lock_shared include/linux/fs.h:922 [inline]
>        filemap_fault+0x564/0x1278 mm/filemap.c:3391
>        bch2_page_fault+0x2cc/0x700 fs/bcachefs/fs-io-pagecache.c:594
>        __do_fault+0xf8/0x498 mm/memory.c:5098
>        do_shared_fault mm/memory.c:5582 [inline]
>        do_fault mm/memory.c:5656 [inline]
>        do_pte_missing mm/memory.c:4160 [inline]
>        handle_pte_fault mm/memory.c:5997 [inline]
>        __handle_mm_fault mm/memory.c:6140 [inline]
>        handle_mm_fault+0x1a08/0x4d18 mm/memory.c:6309
>        do_page_fault+0x428/0x1554 arch/arm64/mm/fault.c:647
>        do_translation_fault+0xc4/0x114 arch/arm64/mm/fault.c:783
>        do_mem_abort+0x70/0x194 arch/arm64/mm/fault.c:919
>        el0_da+0x64/0x160 arch/arm64/kernel/entry-common.c:627
>        el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:789
>        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> 
> -> #0 (vm_lock){++++}-{0:0}:
>        check_prev_add kernel/locking/lockdep.c:3166 [inline]
>        check_prevs_add kernel/locking/lockdep.c:3285 [inline]
>        validate_chain kernel/locking/lockdep.c:3909 [inline]
>        __lock_acquire+0x1728/0x3058 kernel/locking/lockdep.c:5235
>        lock_acquire+0x14c/0x2e0 kernel/locking/lockdep.c:5866
>        __vma_enter_locked+0x184/0x354 mm/memory.c:6473
>        __vma_start_write+0x34/0x158 mm/memory.c:6497
>        vma_start_write include/linux/mm.h:829 [inline]
>        free_pgtables+0x1e0/0x63c mm/memory.c:369
>        exit_mmap+0x394/0xbec mm/mmap.c:1295
>        __mmput+0xec/0x3dc kernel/fork.c:1380
>        mmput+0x70/0xac kernel/fork.c:1402
>        free_bprm+0x11c/0x398 fs/exec.c:1493
>        do_execveat_common+0x6b8/0x834 fs/exec.c:1970
>        do_execveat fs/exec.c:2053 [inline]
>        __do_sys_execveat fs/exec.c:2127 [inline]
>        __se_sys_execveat fs/exec.c:2121 [inline]
>        __arm64_sys_execveat+0xd0/0xec fs/exec.c:2121
>        __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>        invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>        el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>        do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>        el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
>        el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
>        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

After consulting PeterZ on IRC, he said:

> so the thing complains about: vmlock <- mapping.invalidate_lock <- bcachefs_btree <- console_lock <- &helper->lock <- dev->mode_config.idr_mutex <- mm->mmap_lock <- vmlock

so bcachefs is doing printk which wants console_lock, and in
drm console a possible lock chain exists that can lead to mmap lock

> 
> other info that might help us debug this:
> 
> Chain exists of:
>   vm_lock --> &dev->mode_config.idr_mutex --> &mm->mmap_lock
> 
>  Possible unsafe locking scenario:
> 
>        CPU0                    CPU1
>        ----                    ----
>   lock(&mm->mmap_lock);
>                                lock(&dev->mode_config.idr_mutex);
>                                lock(&mm->mmap_lock);
>   lock(vm_lock);

Again from Peterz:

> as always, completely ignore the "possible unsafe locking scenario"
> that's utter rubbish
> I should really get around to removing that for anything involving more than 2 locks

To me it seems all rather theoretical, but not sure where and how we could safely
break this chain.
Hopefully one day console_lock goes away? :)

>  *** DEADLOCK ***
> 
> 2 locks held by syz.1.261/8150:
>  #0: ffff0000d0fee3d0 (&sig->cred_guard_mutex){+.+.}-{4:4}, at: prepare_bprm_creds fs/exec.c:1469 [inline]
>  #0: ffff0000d0fee3d0 (&sig->cred_guard_mutex){+.+.}-{4:4}, at: bprm_execve+0xa8/0x10dc fs/exec.c:1842
>  #1: ffff0000d572df50 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock include/linux/mmap_lock.h:128 [inline]
>  #1: ffff0000d572df50 (&mm->mmap_lock){++++}-{4:4}, at: exit_mmap+0x200/0xbec mm/mmap.c:1292
> 
> stack backtrace:
> CPU: 1 UID: 0 PID: 8150 Comm: syz.1.261 Not tainted 6.15.0-rc7-syzkaller-gd7fa1af5b33e #0 PREEMPT 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
> Call trace:
>  show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:466 (C)
>  __dump_stack+0x30/0x40 lib/dump_stack.c:94
>  dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
>  dump_stack+0x1c/0x28 lib/dump_stack.c:129
>  print_circular_bug+0x324/0x32c kernel/locking/lockdep.c:2079
>  check_noncircular+0x154/0x174 kernel/locking/lockdep.c:2211
>  check_prev_add kernel/locking/lockdep.c:3166 [inline]
>  check_prevs_add kernel/locking/lockdep.c:3285 [inline]
>  validate_chain kernel/locking/lockdep.c:3909 [inline]
>  __lock_acquire+0x1728/0x3058 kernel/locking/lockdep.c:5235
>  lock_acquire+0x14c/0x2e0 kernel/locking/lockdep.c:5866
>  __vma_enter_locked+0x184/0x354 mm/memory.c:6473
>  __vma_start_write+0x34/0x158 mm/memory.c:6497
>  vma_start_write include/linux/mm.h:829 [inline]
>  free_pgtables+0x1e0/0x63c mm/memory.c:369
>  exit_mmap+0x394/0xbec mm/mmap.c:1295
>  __mmput+0xec/0x3dc kernel/fork.c:1380
>  mmput+0x70/0xac kernel/fork.c:1402
>  free_bprm+0x11c/0x398 fs/exec.c:1493
>  do_execveat_common+0x6b8/0x834 fs/exec.c:1970
>  do_execveat fs/exec.c:2053 [inline]
>  __do_sys_execveat fs/exec.c:2127 [inline]
>  __se_sys_execveat fs/exec.c:2121 [inline]
>  __arm64_sys_execveat+0xd0/0xec fs/exec.c:2121
>  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>  invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>  el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>  do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>  el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
>  el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
>  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
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

