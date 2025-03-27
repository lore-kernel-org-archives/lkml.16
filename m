Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4251A8F60
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 07:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743060425; cv=none; b=bRxeFJNQbm2+Hb90SXgLhqvyHENQV00IEZ2mOfPxoV55sDdGJxT2ruGQ39zFdSFC5DVDhMP7Vw3dTdKobzs7yGU3SE24poLOMgDEdPxcMuoyF+qYDE7h9focz1Z/utG6fTp5MrUY542RT/MYcswblcvdQAUyFWajGUZXugWlV0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743060425; c=relaxed/simple;
	bh=SlSr7LL+S0brwxbGfN02TQCW0xMSGMKoJXz+VSuYhI8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=qK87GmH+2NCCR5vqaUCOsIxfuA2Mz6RynklQbux6hUMKlo40166KnhfxuRllMUJARpDBLLegHos8meh0wl952bvjm8RYnwkzi54hAVnm0O6RgI0hjRJbn9Oa7pkKxAZ6ruUbIyaQ/sOX6zwQs78E5VidezqUS0ALP1vzkqtpyZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d2b3a2f2d4so11449755ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 00:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743060423; x=1743665223;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/WoHedPeMHaA6VoihoOnnHUrJi8os8wVa7ir3zsn+cg=;
        b=N2AVdxU1y+SWG91yUh0Ln7UWKsSCbxu910Qo+r62aW0upXRJb6585CkBLfrvGQLdRl
         yVA0cCHX3rZQal32bEyD+n0EOXkKnOYAD73t/bZFAsWDpRQ1McYgqy5oV46QUM3vB4Dl
         Jm9G9wJdEpkCsN5rO/9Xz5y0lg5VsPQUNHYg+5+GIejWBnXknkzgVxZxnUibiw2iQraX
         q8WiOUED57NAVoPXJ3C659k9bb5cCcs12uc+cRHMoWZYvVDcfbNOvklyaXPwAjd0q91h
         qtdNLgJODSMIPoSZVgLSVmvzArj37sMVPfoE28HkwsTTg3j5L26cvSSxfZQZYKoPVNTh
         HCsw==
X-Gm-Message-State: AOJu0YyZar4SK20CTfGXPM/L2O0dmMufbh1BlbcacT98KpFSLjb9WwQy
	so7qlxvwKOfDKJQ60V7TR3n2LXKUhrohCr0HqAzDdIIQGKP7tald27t/fNY59gzH5YZGlTFHykF
	lFOy8VSvuOgEJKOKJaZQSfsIDF739J+Woq53FEhfDdhpiLF4ZMzXiyiw=
X-Google-Smtp-Source: AGHT+IGpNfx6kIH/XLP2/JTD3hFLigVJIvt9L2/XfdFiJJ9EFjE54Nq3EbVowShsW8VQOJdlkBSz74ilqQhGWaz3qoTnZJ7DrmC4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:320e:b0:3d4:3d5d:cf7e with SMTP id
 e9e14a558f8ab-3d5cce28260mr29423645ab.16.1743060422970; Thu, 27 Mar 2025
 00:27:02 -0700 (PDT)
Date: Thu, 27 Mar 2025 00:27:02 -0700
In-Reply-To: <20250326175222.135974-1-richard120310@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e4fdc6.050a0220.2f068f.0023.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] KMSAN: uninit-value in bch2_extent_crc_append
 (2)
From: syzbot <syzbot+79e4e34c2a37d5a9c1f7@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, richard120310@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KMSAN: uninit-value in bch2_extent_crc_append

bcachefs (loop0): stripes_read... done
bcachefs (loop0): snapshots_read... done
bcachefs (loop0): check_allocations... done
bcachefs (loop0): going read-write
bcachefs (loop0): done starting filesystem
=====================================================
BUG: KMSAN: uninit-value in variable__ffs arch/x86/include/asm/bitops.h:251 [inline]
BUG: KMSAN: uninit-value in extent_entry_type fs/bcachefs/extents.h:59 [inline]
BUG: KMSAN: uninit-value in extent_entry_bytes fs/bcachefs/extents.h:68 [inline]
BUG: KMSAN: uninit-value in extent_entry_u64s fs/bcachefs/extents.h:81 [inline]
BUG: KMSAN: uninit-value in bch2_extent_crc_append+0x7c2/0x830 fs/bcachefs/extents.c:593
 variable__ffs arch/x86/include/asm/bitops.h:251 [inline]
 extent_entry_type fs/bcachefs/extents.h:59 [inline]
 extent_entry_bytes fs/bcachefs/extents.h:68 [inline]
 extent_entry_u64s fs/bcachefs/extents.h:81 [inline]
 bch2_extent_crc_append+0x7c2/0x830 fs/bcachefs/extents.c:593
 init_append_extent+0x466/0x1050 fs/bcachefs/io_write.c:729
 bch2_write_extent fs/bcachefs/io_write.c:1073 [inline]
 __bch2_write+0x54a9/0x8490 fs/bcachefs/io_write.c:1487
 bch2_write+0xc98/0x1af0 fs/bcachefs/io_write.c:1659
 closure_queue include/linux/closure.h:270 [inline]
 closure_call include/linux/closure.h:432 [inline]
 bch2_writepage_do_io fs/bcachefs/fs-io-buffered.c:469 [inline]
 bch2_writepages+0x24a/0x3c0 fs/bcachefs/fs-io-buffered.c:652
 do_writepages+0x427/0xc30 mm/page-writeback.c:2687
 filemap_fdatawrite_wbc mm/filemap.c:389 [inline]
 __filemap_fdatawrite_range mm/filemap.c:422 [inline]
 file_write_and_wait_range+0x6f2/0x7b0 mm/filemap.c:797
 bch2_fsync+0xb6/0x510 fs/bcachefs/fs-io.c:228
 vfs_fsync_range+0x1f9/0x260 fs/sync.c:187
 generic_write_sync include/linux/fs.h:2970 [inline]
 bch2_write_iter+0x4dce/0x50f0 fs/bcachefs/fs-io-buffered.c:1072
 new_sync_write fs/read_write.c:586 [inline]
 vfs_write+0xb34/0x1540 fs/read_write.c:679
 ksys_write+0x240/0x4b0 fs/read_write.c:731
 __do_sys_write fs/read_write.c:742 [inline]
 __se_sys_write fs/read_write.c:739 [inline]
 __x64_sys_write+0x93/0xe0 fs/read_write.c:739
 x64_sys_call+0x3161/0x3c30 arch/x86/include/generated/asm/syscalls_64.h:2
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 bch2_extent_crc_pack+0x686/0x6b0 fs/bcachefs/extents.c:549
 bch2_extent_crc_append+0x645/0x830 fs/bcachefs/extents.c:591
 init_append_extent+0x466/0x1050 fs/bcachefs/io_write.c:729
 bch2_write_extent fs/bcachefs/io_write.c:1073 [inline]
 __bch2_write+0x54a9/0x8490 fs/bcachefs/io_write.c:1487
 bch2_write+0xc98/0x1af0 fs/bcachefs/io_write.c:1659
 closure_queue include/linux/closure.h:270 [inline]
 closure_call include/linux/closure.h:432 [inline]
 bch2_writepage_do_io fs/bcachefs/fs-io-buffered.c:469 [inline]
 bch2_writepages+0x24a/0x3c0 fs/bcachefs/fs-io-buffered.c:652
 do_writepages+0x427/0xc30 mm/page-writeback.c:2687
 filemap_fdatawrite_wbc mm/filemap.c:389 [inline]
 __filemap_fdatawrite_range mm/filemap.c:422 [inline]
 file_write_and_wait_range+0x6f2/0x7b0 mm/filemap.c:797
 bch2_fsync+0xb6/0x510 fs/bcachefs/fs-io.c:228
 vfs_fsync_range+0x1f9/0x260 fs/sync.c:187
 generic_write_sync include/linux/fs.h:2970 [inline]
 bch2_write_iter+0x4dce/0x50f0 fs/bcachefs/fs-io-buffered.c:1072
 new_sync_write fs/read_write.c:586 [inline]
 vfs_write+0xb34/0x1540 fs/read_write.c:679
 ksys_write+0x240/0x4b0 fs/read_write.c:731
 __do_sys_write fs/read_write.c:742 [inline]
 __se_sys_write fs/read_write.c:739 [inline]
 __x64_sys_write+0x93/0xe0 fs/read_write.c:739
 x64_sys_call+0x3161/0x3c30 arch/x86/include/generated/asm/syscalls_64.h:2
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was created at:
 __alloc_frozen_pages_noprof+0x9a7/0xe00 mm/page_alloc.c:4762
 alloc_pages_mpol+0x4cd/0x890 mm/mempolicy.c:2270
 alloc_frozen_pages_noprof+0x1bf/0x1e0 mm/mempolicy.c:2341
 alloc_slab_page mm/slub.c:2423 [inline]
 allocate_slab+0x23a/0x1110 mm/slub.c:2587
 new_slab mm/slub.c:2640 [inline]
 ___slab_alloc+0x1287/0x3540 mm/slub.c:3826
 __slab_alloc mm/slub.c:3916 [inline]
 __slab_alloc_node mm/slub.c:3991 [inline]
 slab_alloc_node mm/slub.c:4152 [inline]
 kmem_cache_alloc_noprof+0x84e/0xe10 mm/slub.c:4171
 mempool_alloc_slab+0x36/0x50 mm/mempool.c:559
 mempool_init_node+0x202/0x4d0 mm/mempool.c:217
 mempool_init_noprof+0x57/0x70 mm/mempool.c:246
 bioset_init+0x279/0xb30 block/bio.c:1707
 bch2_fs_fs_io_buffered_init+0x4a/0xc0 fs/bcachefs/fs-io-buffered.c:1084
 bch2_fs_alloc fs/bcachefs/super.c:934 [inline]
 bch2_fs_open+0x5654/0x5ba0 fs/bcachefs/super.c:2064
 bch2_fs_get_tree+0x98a/0x24e0 fs/bcachefs/fs.c:2190
 vfs_get_tree+0xb1/0x5a0 fs/super.c:1814
 do_new_mount+0x71f/0x15e0 fs/namespace.c:3560
 path_mount+0x742/0x1f10 fs/namespace.c:3887
 do_mount fs/namespace.c:3900 [inline]
 __do_sys_mount fs/namespace.c:4111 [inline]
 __se_sys_mount+0x71f/0x800 fs/namespace.c:4088
 __x64_sys_mount+0xe4/0x150 fs/namespace.c:4088
 x64_sys_call+0x39bf/0x3c30 arch/x86/include/generated/asm/syscalls_64.h:166
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

CPU: 0 UID: 0 PID: 6792 Comm: syz.0.16 Not tainted 6.14.0-rc5-syzkaller-00016-g48a5eed9ad58 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
=====================================================


Tested on:

commit:         48a5eed9 Merge tag 'devicetree-fixes-for-6.14-2' of gi..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=17864a4c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d47ea4b9912d894
dashboard link: https://syzkaller.appspot.com/bug?extid=79e4e34c2a37d5a9c1f7
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
