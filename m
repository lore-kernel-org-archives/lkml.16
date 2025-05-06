Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71497280CEA
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538268; cv=none; b=pXj69Wkl6SqxIGJSh9D0d24ZTgiW8/+kKI60RvFs+fLD+pfNeTZrehH6aeHcitCnb7z8VFUu2W83mKOJTZPDvQXOLfTqYJjLYBZ7RPSOmu+PT20GakrXVimS51RTFPONTMegevbocj7hcyeDHYPjIP+k7VkEUVV7Xh3tQP+7iGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538268; c=relaxed/simple;
	bh=9ujoV9LZvJmWbxlMeXVeLJdMYwB4qtzv3S7swubAUgI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=aWn62YyYK7hhDzCkVqOhGvKd0vpW5cCiTJ997wskZDBM0zIyTx3PmIASdkc1edZ1jRwwHNXHRfGEqTyFnak4NQq8yT8E2ur25RWCXV3kUL4eCmXNorWyjv5MOIetoC7V890pdHYO9lURg1AgXQKyLOkdeAK0AepLN1VdqJfkhD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d6c613bd79so62846465ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 06:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538265; x=1747143065;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uixjB5h2USy6fSSWuu6C8VPE/xfzt9YOqe3bWvDb1VY=;
        b=Vkm7lulEfH4tygU2Bqzx2YSxFz90gI0d+64U2ZsMl81elGurseHxYhq0sDFbWTX5QW
         3BQZlQWWvJ80NHQKhktcGqqxOVBeEg40M8GXJYUH/cu5mti7h4vGWTj5KvI0vw4500hG
         oj5SaMjzIGw0LPLj5vrfS3Lwf4+mu9MeA04fMvCARR+iAaaQmarUofs/GkwWH1DaZjXG
         0fzc14PApCN54iSyBG+2kIRPApcx06a53PcLUMRP3rSWWtn/cgkWy+rH6pvOgnSEParu
         /XWckYqBt1ZDrQdqdUSm0DJXUcdeGAJgNbIsg8US1ODTAA8DgEzWY9hKgy7HFabyBV0R
         R5cQ==
X-Gm-Message-State: AOJu0YypjIeGhIBX2I0AdlnYQXmBVk9i1Ou6ax4JkntSG21S1luupAG5
	SQBvkHvgm9DPOkvOjGRafWu/65SM8JMVPA/WhR4153mWYV9N99LgLgJNQxWJPmIZeQYT9JgIJkE
	uxYbznkjAHeFdW4eLRHUExe97lEFNpt5BkSobiNBCpLRveUJ6eY1NxGI=
X-Google-Smtp-Source: AGHT+IG6yvrngeQIHLARjmXjenAZTw8rp8izQbvYeBDxgfyv4K4DGJaQTz9u+7aQ5HePdlKvXc1jPZexhRzGIkLVL7FOExpYd0BI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12e9:b0:3d8:2178:5c79 with SMTP id
 e9e14a558f8ab-3da5b26f334mr126791475ab.7.1746538265448; Tue, 06 May 2025
 06:31:05 -0700 (PDT)
Date: Tue, 06 May 2025 06:31:05 -0700
In-Reply-To: <20250506130020.798216-1-richard120310@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681a0f19.050a0220.a19a9.000b.GAE@google.com>
Subject: Re: [syzbot] [jfs?] KMSAN: uninit-value in BT_STACK_DUMP
From: syzbot <syzbot+ba5f49027aace342d24d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, richard120310@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KMSAN: uninit-value in dtSearch

loop0: detected capacity change from 0 to 32768
=====================================================
BUG: KMSAN: uninit-value in UniStrncmp_le fs/jfs/jfs_unicode.h:55 [inline]
BUG: KMSAN: uninit-value in dtCompare fs/jfs/jfs_dtree.c:3340 [inline]
BUG: KMSAN: uninit-value in dtSearch+0x1261/0x3d30 fs/jfs/jfs_dtree.c:650
 UniStrncmp_le fs/jfs/jfs_unicode.h:55 [inline]
 dtCompare fs/jfs/jfs_dtree.c:3340 [inline]
 dtSearch+0x1261/0x3d30 fs/jfs/jfs_dtree.c:650
 jfs_lookup+0x18b/0x5a0 fs/jfs/namei.c:1461
 lookup_one_qstr_excl_raw+0x204/0x5b0 fs/namei.c:1689
 lookup_one_qstr_excl fs/namei.c:1711 [inline]
 do_unlinkat+0x2e3/0xe50 fs/namei.c:4631
 __do_sys_unlink fs/namei.c:4689 [inline]
 __se_sys_unlink fs/namei.c:4687 [inline]
 __x64_sys_unlink+0x71/0xb0 fs/namei.c:4687
 x64_sys_call+0x29de/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:88
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x1b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was created at:
 __alloc_frozen_pages_noprof+0x689/0xf00 mm/page_alloc.c:4993
 alloc_pages_mpol+0x328/0x860 mm/mempolicy.c:2301
 alloc_frozen_pages_noprof+0xf7/0x200 mm/mempolicy.c:2372
 alloc_slab_page mm/slub.c:2468 [inline]
 allocate_slab+0x24d/0x1210 mm/slub.c:2632
 new_slab mm/slub.c:2686 [inline]
 ___slab_alloc+0xfec/0x3480 mm/slub.c:3872
 __slab_alloc mm/slub.c:3962 [inline]
 __slab_alloc_node mm/slub.c:4037 [inline]
 slab_alloc_node mm/slub.c:4198 [inline]
 kmem_cache_alloc_lru_noprof+0x922/0xed0 mm/slub.c:4229
 jfs_alloc_inode+0x60/0xf0 fs/jfs/super.c:105
 alloc_inode+0x87/0x4a0 fs/inode.c:346
 new_inode+0x39/0x460 fs/inode.c:1145
 diReadSpecial+0x62/0xb00 fs/jfs/jfs_imap.c:426
 jfs_mount+0x760/0x1310 fs/jfs/jfs_mount.c:138
 jfs_fill_super+0x8fa/0x1900 fs/jfs/super.c:523
 get_tree_bdev_flags+0x6e3/0x920 fs/super.c:1636
 get_tree_bdev+0x38/0x50 fs/super.c:1659
 jfs_get_tree+0x35/0x40 fs/jfs/super.c:635
 vfs_get_tree+0xb0/0x5c0 fs/super.c:1759
 do_new_mount+0x73c/0x1620 fs/namespace.c:3881
 path_mount+0x6db/0x1e90 fs/namespace.c:4208
 do_mount fs/namespace.c:4221 [inline]
 __do_sys_mount fs/namespace.c:4432 [inline]
 __se_sys_mount+0x6eb/0x7d0 fs/namespace.c:4409
 __x64_sys_mount+0xe4/0x150 fs/namespace.c:4409
 x64_sys_call+0xfa7/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:166
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x1b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

CPU: 0 UID: 0 PID: 7043 Comm: syz.0.33 Not tainted 6.15.0-rc3-syzkaller-00094-g02ddfb981de8-dirty #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/29/2025
=====================================================


Tested on:

commit:         02ddfb98 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1439c8f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9dc42c34a3f5c357
dashboard link: https://syzkaller.appspot.com/bug?extid=ba5f49027aace342d24d
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=100ae8f4580000

