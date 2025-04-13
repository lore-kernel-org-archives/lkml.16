Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892247BAEC
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 16:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744562423; cv=none; b=sGU3tkTfgA1lzgflOJSnqvrbduIA6E+uX0kkV0VgTE9WU3CpcMUHtCaz8K4+g+n57h8d69IA+71w0LgF4em9DLdHYJNzJ4VWhTHS3Q5g2wqRnl2h1HTtFIrlL/1XNCaYVsDB+gEjYXT7HUjKikRAcaTngdp0ZbwxVgALylMGMUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744562423; c=relaxed/simple;
	bh=E7+DTveDnwAaLf2gMuESECstezhnaC5SJfhIEooe1s4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JZK2IivZEmDDOaUwZ9uFomHv40JYUvMAO7jIHNg0xD9T/ZaResuvMqY4UsB9JYs8xu4yu1g+s73jRFtQcUBpfxEWbtYoo3yFt28F8UZDyBzEDJn7muUFXsOs0GaFXPYlRK6ek1Yliw29OX844SulfdVrm7d7Cc2teORFDFsP4OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3d5b38276deso66457455ab.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 09:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744562420; x=1745167220;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/x8W6uyCjr609dIyAeTe5EUoui/tDcs3rPqO/qsDFk=;
        b=SHQgW5nntU0Cz8mXUbxMhLUOfywuSXZg/5BbUZr7iLa64yzgTMGFfZPuk6P1//wEE2
         VP2K+usOMEWbA7hUTJEhoIWlsR+qC8WUuRJuq7aWf/UclmKV5od/ZxXiSMkq9WgpM5bk
         o8VZ47KdTtvKy2tSDlEJvb6i1h5uTgR6BKOHBrqCYkQhW+r5MMUwo6QruFjadTnplHyn
         qgSSvg7I52jhdKzrbJaIZBdWiXdg58lXT1JBoDuA9bLZGUZaFVrdWZJkqWz+c+WNx75o
         7hk3gZqjUxxY7h9a0M2/qH1Cp+HhR96lbwsMipi4f1kWD/dIblsF8C24HYt8FAU5T7u2
         0e0w==
X-Forwarded-Encrypted: i=1; AJvYcCVYc5xQqUb5a29ONdLZn0V7FpQdA24DLkM9YJ8w98q4FhBgZQsCqFL0Uu4tZYOcOkuhoPIQahG/BD5KQ2I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrJwWHjEqksnR1AtvjErfyHEPkt2m8uJtYRL8w840Sqpsx0XjO
	Stl+hnoZhMoAun9h7Xc32aOpPO2rlkeMUl/EB4zidr43V3VekAs+Z95DecLjll89RmX8go7BA0v
	JcPxMmfgZuA23DfY10YHRO8Hli+291inLH6u4gKt8hv7UAJQrQy8i5lg=
X-Google-Smtp-Source: AGHT+IHjWf+vfXIjtErqDPCa9AVcoflzGfe0KyicvqD/F9Jqv9kF/smRdEwjcCNL+ZjK8fG2+Rf4+kQ2lMhLEyCXApJYm3DMeNS5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:148d:b0:3d4:700f:67e7 with SMTP id
 e9e14a558f8ab-3d7ec26b6f6mr85313255ab.17.1744562420552; Sun, 13 Apr 2025
 09:40:20 -0700 (PDT)
Date: Sun, 13 Apr 2025 09:40:20 -0700
In-Reply-To: <67c1652c.050a0220.1baf.000d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fbe8f4.050a0220.378c5e.000a.GAE@google.com>
Subject: Re: [syzbot] [sound?] [mm?] kernel BUG in filemap_fault
From: syzbot <syzbot+f37372d86207b3bb2941@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    7cdabafc0012 Merge tag 'trace-v6.15-rc1' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16632a3f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fb8650d88e9fb80f
dashboard link: https://syzkaller.appspot.com/bug?extid=f37372d86207b3bb2941
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17eddc04580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11632a3f980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ddfdb666520c/disk-7cdabafc.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/496b316616fe/vmlinux-7cdabafc.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6865907c6452/bzImage-7cdabafc.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f37372d86207b3bb2941@syzkaller.appspotmail.com

 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1262 [inline]
 free_unref_folios+0xdfd/0x17e0 mm/page_alloc.c:2737
 folios_put_refs+0x70a/0x800 mm/swap.c:992
 folio_batch_release include/linux/pagevec.h:101 [inline]
 truncate_inode_pages_range+0x462/0x10e0 mm/truncate.c:379
 truncate_bdev_range+0xcb/0x100 block/bdev.c:125
 blkdev_fallocate+0x264/0x490 block/fops.c:857
 vfs_fallocate+0x627/0x7a0 fs/open.c:338
 madvise_remove mm/madvise.c:1034 [inline]
 madvise_vma_behavior mm/madvise.c:1263 [inline]
 madvise_walk_vmas mm/madvise.c:1530 [inline]
 madvise_do_behavior+0x1eda/0x4640 mm/madvise.c:1695
 do_madvise mm/madvise.c:1782 [inline]
 __do_sys_madvise mm/madvise.c:1790 [inline]
 __se_sys_madvise mm/madvise.c:1788 [inline]
 __x64_sys_madvise+0x185/0x220 mm/madvise.c:1788
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
------------[ cut here ]------------
kernel BUG at mm/filemap.c:3432!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 5843 Comm: syz-executor394 Not tainted 6.15.0-rc1-syzkaller-00325-g7cdabafc0012 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:filemap_fault+0x1360/0x13d0 mm/filemap.c:3432
Code: c4 ff 48 8b 3c 24 48 c7 c6 80 11 54 8c e8 e8 f9 0e 00 90 0f 0b e8 50 e9 c4 ff 48 89 df 48 c7 c6 00 0b 54 8c e8 d1 f9 0e 00 90 <0f> 0b e8 39 e9 c4 ff 48 8b 3c 24 48 c7 c6 80 11 54 8c e8 b9 f9 0e
RSP: 0018:ffffc90003fbf120 EFLAGS: 00010246
RAX: 63245e9776778400 RBX: ffffea0000d4b380 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8e4eaa0b RDI: ffffffff8ca0e120
RBP: ffffc90003fbf258 R08: ffffffff8236b186 R09: fffffbfff1d7a970
R10: dffffc0000000000 R11: fffffbfff1d7a970 R12: ffff888023ab1f78
R13: 1ffffd40001a9671 R14: dffffc0000000000 R15: ffffea0000d4b388
FS:  00007f116eb456c0(0000) GS:ffff888124fc9000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000001ea5 CR3: 000000003361e000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __do_fault+0x135/0x390 mm/memory.c:5098
 do_read_fault mm/memory.c:5518 [inline]
 do_fault mm/memory.c:5652 [inline]
 do_pte_missing mm/memory.c:4160 [inline]
 handle_pte_fault+0x3f0c/0x61c0 mm/memory.c:5997
 __handle_mm_fault mm/memory.c:6140 [inline]
 handle_mm_fault+0x1030/0x1aa0 mm/memory.c:6309
 do_user_addr_fault arch/x86/mm/fault.c:1388 [inline]
 handle_page_fault arch/x86/mm/fault.c:1480 [inline]
 exc_page_fault+0x2bb/0x920 arch/x86/mm/fault.c:1538
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623
RIP: 0010:rep_movs_alternative+0xf/0x90 arch/x86/lib/copy_user_64.S:46
Code: c4 10 c3 cc cc cc cc 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 48 83 f9 40 73 44 83 f9 08 73 25 85 c9 74 0f <8a> 06 88 07 48 ff c7 48 ff c6 48 ff c9 75 f1 c3 cc cc cc cc 66 2e
RSP: 0018:ffffc90003fbf930 EFLAGS: 00050202
RAX: 00007ffffffff001 RBX: 0000200000001ea5 RCX: 0000000000000001
RDX: 0000000000000001 RSI: 0000200000001ea5 RDI: ffff88807f7eebe5
RBP: 0000000000000001 R08: ffff88807f7eebe5 R09: 1ffff1100fefdd7c
R10: dffffc0000000000 R11: ffffed100fefdd7d R12: ffff88807f7eebe5
R13: 1ffff11004c93307 R14: ffff88807f7eebe5 R15: 0000000000000001
 copy_user_generic arch/x86/include/asm/uaccess_64.h:126 [inline]
 raw_copy_from_user arch/x86/include/asm/uaccess_64.h:141 [inline]
 _inline_copy_from_user include/linux/uaccess.h:178 [inline]
 _copy_from_user+0x7b/0xb0 lib/usercopy.c:18
 copy_from_user include/linux/uaccess.h:212 [inline]
 snd_rawmidi_kernel_write1+0x390/0x620 sound/core/rawmidi.c:1560
 snd_rawmidi_write+0x5f2/0xc00 sound/core/rawmidi.c:1629
 do_loop_readv_writev fs/read_write.c:848 [inline]
 vfs_writev+0x5ba/0xbc0 fs/read_write.c:1057
 do_writev+0x1b8/0x360 fs/read_write.c:1101
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f116eb8f9b9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 e1 18 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f116eb45218 EFLAGS: 00000246 ORIG_RAX: 0000000000000014
RAX: ffffffffffffffda RBX: 00007f116ec17328 RCX: 00007f116eb8f9b9
RDX: 0000000000000002 RSI: 0000200000000840 RDI: 0000000000000005
RBP: 00007f116ec17320 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f116ebe435c
R13: 0000200000000080 R14: 0000200000000000 R15: 6c756e2f7665642f
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:filemap_fault+0x1360/0x13d0 mm/filemap.c:3432
Code: c4 ff 48 8b 3c 24 48 c7 c6 80 11 54 8c e8 e8 f9 0e 00 90 0f 0b e8 50 e9 c4 ff 48 89 df 48 c7 c6 00 0b 54 8c e8 d1 f9 0e 00 90 <0f> 0b e8 39 e9 c4 ff 48 8b 3c 24 48 c7 c6 80 11 54 8c e8 b9 f9 0e
RSP: 0018:ffffc90003fbf120 EFLAGS: 00010246
RAX: 63245e9776778400 RBX: ffffea0000d4b380 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8e4eaa0b RDI: ffffffff8ca0e120
RBP: ffffc90003fbf258 R08: ffffffff8236b186 R09: fffffbfff1d7a970
R10: dffffc0000000000 R11: fffffbfff1d7a970 R12: ffff888023ab1f78
R13: 1ffffd40001a9671 R14: dffffc0000000000 R15: ffffea0000d4b388
FS:  00007f116eb456c0(0000) GS:ffff888124fc9000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000001ea5 CR3: 000000003361e000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess), 1 bytes skipped:
   0:	10 c3                	adc    %al,%bl
   2:	cc                   	int3
   3:	cc                   	int3
   4:	cc                   	int3
   5:	cc                   	int3
   6:	0f 1f 40 00          	nopl   0x0(%rax)
   a:	90                   	nop
   b:	90                   	nop
   c:	90                   	nop
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop
  10:	90                   	nop
  11:	90                   	nop
  12:	90                   	nop
  13:	90                   	nop
  14:	90                   	nop
  15:	90                   	nop
  16:	90                   	nop
  17:	90                   	nop
  18:	90                   	nop
  19:	90                   	nop
  1a:	48 83 f9 40          	cmp    $0x40,%rcx
  1e:	73 44                	jae    0x64
  20:	83 f9 08             	cmp    $0x8,%ecx
  23:	73 25                	jae    0x4a
  25:	85 c9                	test   %ecx,%ecx
  27:	74 0f                	je     0x38
* 29:	8a 06                	mov    (%rsi),%al <-- trapping instruction
  2b:	88 07                	mov    %al,(%rdi)
  2d:	48 ff c7             	inc    %rdi
  30:	48 ff c6             	inc    %rsi
  33:	48 ff c9             	dec    %rcx
  36:	75 f1                	jne    0x29
  38:	c3                   	ret
  39:	cc                   	int3
  3a:	cc                   	int3
  3b:	cc                   	int3
  3c:	cc                   	int3
  3d:	66                   	data16
  3e:	2e                   	cs


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
