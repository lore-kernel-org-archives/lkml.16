Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711972E11D0
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 17:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750007914; cv=none; b=ZmdGO1q6H5hjuJiTJOB4lscumM9N7RHNjgwLi1wCvSqsuj3ZDerTbf6XtimMXbFGmshq9+LIu8VFTZfY1kRxSS2sMt+RMWpKXAvmWTdY/+3x6hbu5nRbyxiAYAJkrWz6CU1ZULFZy+LeZcEkrLUQtHenXRPwgMNRX6ghEMAYlQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750007914; c=relaxed/simple;
	bh=vGdAWj1InB75TmFPMH57ugc5kwYroJtL1fg1SrsSzxY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=WNjvsQ66BbgBn7zqMCtWXZrtR60rsR2DwRFXB3Vj5KcuT710oDaYhjhdtR718BJQfHl7U+DS1rtu3nhxQj/jK3XP58a0duXPhls3eOOlYaxVtV8dJXjVGRDUB1wk07VZ30qioB+eRPYBv1dxjD0ntFJ6lFODFZ2uC3/DvpYUxs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3ddcc14b794so23877485ab.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 10:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750007911; x=1750612711;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VuCSlNwA8hi3z2x3tYBz4a1Vh7FWGbmkfpk7dDSKrI4=;
        b=iP9L5veQOtImdmCrQXMBJPsE9sLtTCiReBXakqvhT8Pdp3AxNfU4E4Bv3K9fYYIHPA
         TN6H6KtvlYlAaNRdzpw3R8bPEF5qbrWMWI739hHsv0Rgzgo0vL7QxQ70cP7ZjoIOVmMr
         Z4TMSucP9Hq2PinYXLPHKaiBjAwoYtb/6cG1OoWLfjEQAg7M3JYnwjzcIQ/+0VjsadrU
         ZZP9BEvX8CAfrL0GEfXRcAyHZJ8EpkpBrlT5tTeo5dT3mrr9zjwUws+rw6f6Q35JypkB
         JBp8qBkD5+qQyumWeQ2RksbrEQjHmoCD1tm6Zo4hVM4YUjugmRVOdwH+NS54rMfgH7Zq
         MJsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMDBlTVlWe8wgJSt7UPkaXJlsz40iYZdkWUZRVmbs/Sq2mtDeC1R14+pscCJGCZ71f1DzKdSZvQFAr/8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlDp+akMhd579jZp1RfmFerb8ZoFYd+1cFBn9SaD0Ty7GFniU0
	onEGdpUaS2Is/a7rn0c0vWzpYRIN217BynqZwfa7tTvHiE8/CXx9GdTPWowShR6KlLThhuFq4tM
	A/l8kZhHdFzTetrWvwIfeXkUM8rWgfuO6yQKihLxDGdIFNi/L+o6ttcsjMmc=
X-Google-Smtp-Source: AGHT+IGHxQKgVqRdMJHuLfXdBKnqO46FfRbfoDqeplS9MxpWF0xv3u1IcVRohENBd1yLrBxPT4e7ojqdfIZS77oT30ZLGmubTZDu
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:258e:b0:3dd:babf:9b00 with SMTP id
 e9e14a558f8ab-3de07d01d8amr64397045ab.1.1750007911553; Sun, 15 Jun 2025
 10:18:31 -0700 (PDT)
Date: Sun, 15 Jun 2025 10:18:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684f0067.050a0220.be214.02c2.GAE@google.com>
Subject: [syzbot] [f2fs?] kernel BUG in f2fs_sync_node_pages
From: syzbot <syzbot+bcdfadd9bda9988fa52a@syzkaller.appspotmail.com>
To: chao@kernel.org, hch@lst.de, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    488ef3560196 KEYS: Invert FINAL_PUT bit
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=10e06d70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=162faeb2d1eaefb4
dashboard link: https://syzkaller.appspot.com/bug?extid=bcdfadd9bda9988fa52a
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13423682580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17423682580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9bcad4b7e6e0/disk-488ef356.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9ed0e62aacc9/vmlinux-488ef356.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2e5e305c130c/bzImage-488ef356.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/ed472c7ffb63/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=16b74e0c580000)

The issue was bisected to:

commit 80f31d2a7e5f4efa7150c951268236c670bcb068
Author: Christoph Hellwig <hch@lst.de>
Date:   Thu May 8 05:14:32 2025 +0000

    f2fs: return bool from __write_node_folio

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=149f3682580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=169f3682580000
console output: https://syzkaller.appspot.com/x/log.txt?x=129f3682580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+bcdfadd9bda9988fa52a@syzkaller.appspotmail.com
Fixes: 80f31d2a7e5f ("f2fs: return bool from __write_node_folio")

 f2fs_get_new_data_folio+0x138/0x870 fs/f2fs/data.c:1363
 f2fs_add_regular_entry+0x5a3/0xc10 fs/f2fs/dir.c:702
 f2fs_add_dentry+0xda/0x1d0 fs/f2fs/dir.c:771
 f2fs_do_add_link+0x20f/0x3b0 fs/f2fs/dir.c:810
 f2fs_add_link fs/f2fs/f2fs.h:3717 [inline]
 f2fs_create+0x337/0x5c0 fs/f2fs/namei.c:380
page last free pid 5818 tgid 5818 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1248 [inline]
 __free_frozen_pages+0xc65/0xe60 mm/page_alloc.c:2706
 __folio_put+0x21b/0x2c0 mm/swap.c:112
 pipe_buf_release include/linux/pipe_fs_i.h:282 [inline]
 pipe_update_tail fs/pipe.c:242 [inline]
 anon_pipe_read+0x643/0x1040 fs/pipe.c:361
 new_sync_read fs/read_write.c:491 [inline]
 vfs_read+0x4d0/0x980 fs/read_write.c:572
 ksys_read+0x145/0x250 fs/read_write.c:715
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
------------[ cut here ]------------
kernel BUG at mm/filemap.c:1498!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 12 Comm: kworker/u8:0 Not tainted 6.16.0-rc1-syzkaller-00005-g488ef3560196 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: writeback wb_workfn (flush-7:0)
RIP: 0010:folio_unlock+0x13d/0x160 mm/filemap.c:1498
Code: de c8 ff 48 89 df 48 c7 c6 a0 36 94 8b e8 cb 6d 0e 00 90 0f 0b e8 13 de c8 ff 48 89 df 48 c7 c6 c0 2c 94 8b e8 b4 6d 0e 00 90 <0f> 0b e8 fc dd c8 ff 48 89 df 48 c7 c6 a0 36 94 8b e8 9d 6d 0e 00
RSP: 0018:ffffc90000116e28 EFLAGS: 00010246
RAX: ee13dd9e63919500 RBX: ffffea0001d33080 RCX: 0000000000000000
RDX: 0000000000000006 RSI: ffffffff8d96d7f4 RDI: 00000000ffffffff
RBP: ffffc90000117110 R08: ffffffff8f9fdef7 R09: 1ffffffff1f3fbde
R10: dffffc0000000000 R11: fffffbfff1f3fbdf R12: 1ffffd40003a6611
R13: 00fff00000004018 R14: ffffea0001d33088 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888125c86000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fa0ebcd1130 CR3: 0000000031646000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 f2fs_sync_node_pages+0x180a/0x1a10 fs/f2fs/node.c:2081
 f2fs_write_node_pages+0x303/0x6e0 fs/f2fs/node.c:2183
 do_writepages+0x32b/0x550 mm/page-writeback.c:2636
 __writeback_single_inode+0x145/0xff0 fs/fs-writeback.c:1680
 writeback_sb_inodes+0x6b5/0x1000 fs/fs-writeback.c:1976
 wb_writeback+0x43b/0xaf0 fs/fs-writeback.c:2156
 wb_do_writeback fs/fs-writeback.c:2303 [inline]
 wb_workfn+0x409/0xef0 fs/fs-writeback.c:2343
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xade/0x17b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:folio_unlock+0x13d/0x160 mm/filemap.c:1498
Code: de c8 ff 48 89 df 48 c7 c6 a0 36 94 8b e8 cb 6d 0e 00 90 0f 0b e8 13 de c8 ff 48 89 df 48 c7 c6 c0 2c 94 8b e8 b4 6d 0e 00 90 <0f> 0b e8 fc dd c8 ff 48 89 df 48 c7 c6 a0 36 94 8b e8 9d 6d 0e 00
RSP: 0018:ffffc90000116e28 EFLAGS: 00010246
RAX: ee13dd9e63919500 RBX: ffffea0001d33080 RCX: 0000000000000000
RDX: 0000000000000006 RSI: ffffffff8d96d7f4 RDI: 00000000ffffffff
RBP: ffffc90000117110 R08: ffffffff8f9fdef7 R09: 1ffffffff1f3fbde
R10: dffffc0000000000 R11: fffffbfff1f3fbdf R12: 1ffffd40003a6611
R13: 00fff00000004018 R14: ffffea0001d33088 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888125d86000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005555844206f8 CR3: 0000000028e76000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
