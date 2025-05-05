Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C87318BB8E
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 10:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746441271; cv=none; b=W3jrDDC5XGpRyCaammxH0Fl8ol+Y1dC8VDCxFi5deRmoXgnBVMa+vkMCAD80n0VgjTmLlGAiuWqwgfClK7BH3KtFUiqRxozvNhAGVpx+xPTk8YvSF20WQz73zMlgxv4E9oi7FN+QwXgtl1o5dHwpTIurBmPi36tnMAmmwf/iYB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746441271; c=relaxed/simple;
	bh=WeW++sc7Ir6ObedDUnvc8sAUg2ZFARvxBvx/qAnkaR0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=iRGPE5bOwwGRidqp10QyMUC5PbeIIoDbY9ELGd+2ysvxP5gCEE9sSk8KUiJgUZmuNn1Uo0/Tlz9AsOqYMGS0eFrLrTBEmDdQt9JdGM5ZsEeLuYLKpKcpnfWslOym3CM9ekRjD6Cs5wVKQ/cRmu8sSPApbw+qhITTETeDZFN/3ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-86463467dddso401315039f.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 03:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746441268; x=1747046068;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sYdlBI8ssJwo4ScSwECC/spZIPg9qF5fMqFOEhOjZIQ=;
        b=h6D50TP9IhNRC2ZaKC2uFEcorgoO0OHWK+vfD7TQ8piSOeI0FhYqDhp3vSnkXnXlqb
         SQE74eaXVHyRBLC5RCnOfdR/0nKd4RlFhX6HGibEMgNKl9wAThcte0y9DL46I0Rib1nc
         3uHZg9IlBRn6xuf1egUlxmF7IMpM7T8gk1L3XyoFPIrGhCphu5udeW5VVm8v+Qgylly2
         Xoh7gdYJMrE0PP5WJtFxbl18z4k6wmhtn8Yj1DlkqStF/YUZDRjZv4PemOxwNPlF/Eh+
         E1LMG82Ksnfo2ETw+mPHACNmUBytm59O9UUmXxpImzavsd6gkrN87KNfgxYE9GifzY7l
         aZtw==
X-Forwarded-Encrypted: i=1; AJvYcCXiU6EqJWZb9Qee9oBwIO4hv22ZGjLf/ZeygcCAEza89b/vBAUUIkXvcKpFq+oiYxIaXZ6j2+xoMFtjvcY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZFjcc23bZrienlZX+tcFU/25h//JwsTQBYh6bPA59+kCBdSLm
	QvKP3+omolgVEtSMxVAXdVu0sAPCv6DZIzE7geLutTziFybgiMMZ91loUzjV1LoijbU5QM7j0cT
	YBNYuGkCxSpfbjHtz+XbobsFdkQ1wixkT+o+2zwoeWUjjTr/aa9wsWPA=
X-Google-Smtp-Source: AGHT+IG2KGkmLe00nyLdhVaNaPbJYigMSoAylaAZi/awdsJuXK9Y47izTsSWsm2cDZWx0AR+T+jykcCF7RzhaanRg27AMEsxCZwj
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3982:b0:3d8:2032:ca67 with SMTP id
 e9e14a558f8ab-3da5b2733cemr60017915ab.9.1746441268631; Mon, 05 May 2025
 03:34:28 -0700 (PDT)
Date: Mon, 05 May 2025 03:34:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68189434.a70a0220.254cdc.004c.GAE@google.com>
Subject: [syzbot] [kernel?] upstream test error: KASAN: slab-use-after-free
 Write in binder_add_device (4)
From: syzbot <syzbot+a805d0cdcff99bbd3e34@syzkaller.appspotmail.com>
To: arve@android.com, brauner@kernel.org, cmllamas@google.com, 
	gregkh@linuxfoundation.org, joel@joelfernandes.org, 
	linux-kernel@vger.kernel.org, maco@android.com, surenb@google.com, 
	syzkaller-bugs@googlegroups.com, tkjos@android.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    29281a76709c Merge tag 'kvmarm-fixes-6.14-2' into kvmarm-m..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git fuzzme
console output: https://syzkaller.appspot.com/x/log.txt?x=10ce5a70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=22c3bbf92fcca116
dashboard link: https://syzkaller.appspot.com/bug?extid=a805d0cdcff99bbd3e34
compiler:       Debian clang version 20.1.3 (++20250415083350+2131242240f7-1~exp1~20250415203523.103), Debian LLD 20.1.3
userspace arch: arm64

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/384ffdcca292/non_bootable_disk-29281a76.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1ad34e8daa75/vmlinux-29281a76.xz
kernel image: https://storage.googleapis.com/syzbot-assets/196ddebb5870/Image-29281a76.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a805d0cdcff99bbd3e34@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in hlist_add_head include/linux/list.h:1026 [inline]
BUG: KASAN: slab-use-after-free in binder_add_device+0xf4/0xf8 drivers/android/binder.c:6932
Write of size 8 at addr 0af0000013140208 by task syz-executor/3298
Pointer tag: [0a], memory tag: [31]

CPU: 0 UID: 0 PID: 3298 Comm: syz-executor Not tainted 6.14.0-rc2-syzkaller-g29281a76709c #0
Hardware name: linux,dummy-virt (DT)
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:466 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 print_address_description+0xac/0x290 mm/kasan/report.c:378
 print_report+0x84/0xa0 mm/kasan/report.c:489
 kasan_report+0xb0/0x110 mm/kasan/report.c:602
 kasan_tag_mismatch+0x28/0x3c mm/kasan/sw_tags.c:175
 __hwasan_tag_mismatch+0x30/0x60 arch/arm64/lib/kasan_sw_tags.S:55
 hlist_add_head include/linux/list.h:1026 [inline]
 binder_add_device+0xf4/0xf8 drivers/android/binder.c:6932
 binderfs_binder_device_create+0xbfc/0xc28 drivers/android/binderfs.c:210
 binderfs_fill_super+0xb30/0xe20 drivers/android/binderfs.c:729
 vfs_get_super fs/super.c:1280 [inline]
 get_tree_nodev+0xdc/0x1cc fs/super.c:1299
 binderfs_fs_context_get_tree+0x28/0x38 drivers/android/binderfs.c:749
 vfs_get_tree+0xc4/0x3cc fs/super.c:1814
 do_new_mount+0x2a0/0x988 fs/namespace.c:3560
 path_mount+0x650/0x101c fs/namespace.c:3887
 do_mount fs/namespace.c:3900 [inline]
 __do_sys_mount fs/namespace.c:4111 [inline]
 __se_sys_mount fs/namespace.c:4088 [inline]
 __arm64_sys_mount+0x36c/0x468 fs/namespace.c:4088
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x90/0x2b4 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x180/0x2f4 arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x58/0x74 arch/arm64/kernel/syscall.c:151
 el0_svc+0x58/0x134 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

Allocated by task 3290:
 kasan_save_stack+0x40/0x6c mm/kasan/common.c:47
 save_stack_info+0x30/0x138 mm/kasan/tags.c:106
 kasan_save_alloc_info+0x14/0x20 mm/kasan/tags.c:142
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x8c/0x90 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __kmalloc_cache_noprof+0x2a0/0x404 mm/slub.c:4325
 kmalloc_noprof include/linux/slab.h:901 [inline]
 kzalloc_noprof include/linux/slab.h:1037 [inline]
 binderfs_binder_device_create+0x1ac/0xc28 drivers/android/binderfs.c:147
 binderfs_fill_super+0xb30/0xe20 drivers/android/binderfs.c:729
 vfs_get_super fs/super.c:1280 [inline]
 get_tree_nodev+0xdc/0x1cc fs/super.c:1299
 binderfs_fs_context_get_tree+0x28/0x38 drivers/android/binderfs.c:749
 vfs_get_tree+0xc4/0x3cc fs/super.c:1814
 do_new_mount+0x2a0/0x988 fs/namespace.c:3560
 path_mount+0x650/0x101c fs/namespace.c:3887
 do_mount fs/namespace.c:3900 [inline]
 __do_sys_mount fs/namespace.c:4111 [inline]
 __se_sys_mount fs/namespace.c:4088 [inline]
 __arm64_sys_mount+0x36c/0x468 fs/namespace.c:4088
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x90/0x2b4 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x180/0x2f4 arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x58/0x74 arch/arm64/kernel/syscall.c:151
 el0_svc+0x58/0x134 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

Freed by task 3290:
 kasan_save_stack+0x40/0x6c mm/kasan/common.c:47
 save_stack_info+0x30/0x138 mm/kasan/tags.c:106
 kasan_save_free_info+0x18/0x24 mm/kasan/tags.c:147
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x64/0x68 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2353 [inline]
 slab_free mm/slub.c:4609 [inline]
 kfree+0x148/0x44c mm/slub.c:4757
 binderfs_evict_inode+0x1e8/0x2b8 drivers/android/binderfs.c:278
 evict+0x4d4/0xbe8 fs/inode.c:796
 iput_final fs/inode.c:1946 [inline]
 iput+0x928/0x9e0 fs/inode.c:1972
 dentry_unlink_inode+0x624/0x660 fs/dcache.c:440
 __dentry_kill+0x224/0x808 fs/dcache.c:643
 shrink_kill+0xd4/0x2cc fs/dcache.c:1088
 shrink_dentry_list+0x420/0x970 fs/dcache.c:1115
 shrink_dcache_parent+0x80/0x200 fs/dcache.c:-1
 do_one_tree+0x2c/0x148 fs/dcache.c:1578
 shrink_dcache_for_umount+0xb0/0x198 fs/dcache.c:1595
 generic_shutdown_super+0x84/0x424 fs/super.c:620
 kill_anon_super fs/super.c:1237 [inline]
 kill_litter_super+0xa4/0xdc fs/super.c:1247
 binderfs_kill_super+0x50/0xcc drivers/android/binderfs.c:791
 deactivate_locked_super+0xf0/0x17c fs/super.c:473
 deactivate_super+0xf4/0x104 fs/super.c:506
 cleanup_mnt+0x3fc/0x484 fs/namespace.c:1413
 __cleanup_mnt+0x20/0x30 fs/namespace.c:1420
 task_work_run+0x1bc/0x254 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x740/0x23b0 kernel/exit.c:938
 do_group_exit+0x1d4/0x2ac kernel/exit.c:1087
 get_signal+0x1440/0x1554 kernel/signal.c:3036
 do_signal+0x23c/0x3ecc arch/arm64/kernel/signal.c:1658
 do_notify_resume+0x78/0x27c arch/arm64/kernel/entry-common.c:148
 exit_to_user_mode_prepare arch/arm64/kernel/entry-common.c:169 [inline]
 exit_to_user_mode arch/arm64/kernel/entry-common.c:178 [inline]
 el0_svc+0xb0/0x134 arch/arm64/kernel/entry-common.c:745
 el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

The buggy address belongs to the object at fff0000013140200
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 8 bytes inside of
 512-byte region [fff0000013140200, fff0000013140400)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x53140
flags: 0x1ffc00000000000(node=0|zone=0|lastcpupid=0x7ff|kasantag=0x0)
page_type: f5(slab)
raw: 01ffc00000000000 d7f000000c801900 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 fff0000013140000: 92 92 92 92 92 92 92 92 92 92 92 92 92 92 92 92
 fff0000013140100: 92 92 fe fe fe fe fe fe fe fe fe fe fe fe fe fe
>fff0000013140200: 31 31 31 31 31 31 31 31 31 31 31 31 31 31 31 31
                   ^
 fff0000013140300: 31 31 31 31 31 31 31 31 31 31 31 31 31 31 31 31
 fff0000013140400: 6e 6e 6e 6e 6e 6e 6e 6e 6e 6e 6e 6e 6e 6e 6e 6e
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
