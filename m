Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A192AF0A
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 03:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744515688; cv=none; b=KMWEj5o85s6v5xuT1UegM8GOmTTNl32FsDkN4xHRbTHaVxQaNnYLXe0rTuYymkI5RttKGVIGe5YysfHrwYo0ccu6bCeBPTUn2Wv46M6uERmzDfcjO8gQznvvBYN9irS3m3c4vpf/nKJ61GS21x8wvypnNim2el6UqATWPmzrRXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744515688; c=relaxed/simple;
	bh=HcDGY79STyTj64bFDzATXVJp5YPz5hSDBJcu+3unNVk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=b3wYRhRrYKDs7a+7LVCwk/mEpx14tDw00AsU4rIX0Bdq+k4lkh9e1ceNWpk5YERALXxl2Us2ad2VmQLMeZ6gfqXnhiSRfq8PwJOgvcR4vQ4qHQKBHUmByH3a0/bat7F4lHEd6eGY/SSFoBzEICPBxuNSguZFhmqwpKd1MP7sHsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-85dcaf42b61so711637639f.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 20:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744515686; x=1745120486;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uUfK+wgMqVs/BJpvK0cKAWUv0FLQu6T+iRlQBVH/WQg=;
        b=M+loeSmN2tQNcqWBWF8xh00no5rOehsjUs4GVVzmcMBx0tyGROC1jfdketUXUGph8O
         5GgnEPAqbjQH2LrVRUpjAtxv7+kCsM+ab9lkpPk74QRqO8rs79Py8KUshZ1CRr5n2bXS
         7hiwk4T18E/uY0GU6yIbwT+m+bjK9vmcadbvE3sTb9AALl63NtkHI1apJofKtMp5AzrG
         RGuYD7EIF9q5m+2OOdCv8/HgzV73uhXMLmBJdpEqSlReIGVFWUwkn3TozRK14Pa2J2CM
         nNdZhWqAu7hLAUf2f7hNd0HKnTZ+6XKnEBA2V+C1Bjga+OI+MMufILAlnw6W8msK7PM+
         fA3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbJHWEwQZ3Vmz4YtFkmvKe+MAZbpipQEFBCDVkK5ZXQN75sdk9XIUuYkkQafdDVnwPEI/gJlMDG7oyLBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUM9yTsCpJhxQFX2wsoxcw5EmtS+j7pHCLu0Q7vKBX/i1DfiBT
	8ISFevIe7a0l5ibRkKd+JyEO77zLvVGpsffbx/g9S+yAbpx895djMcxMWVrImTLW3ubVztIfvnT
	SJh3dgH54Be+d19mxlQoiozXdWT3iEKCDKGsYefaPAbo29syAYNUU6u0=
X-Google-Smtp-Source: AGHT+IGwelPeCeZOsle2UWt2rUnFDqN4vsLSoqBF8N91DWB6cGB5Fn68ptvGeBfzVunoVI0PjU6C+CFYayOvGrEC1hyqGEEJ5WwN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1b08:b0:3d3:dfc2:912f with SMTP id
 e9e14a558f8ab-3d7ec1f3f42mr85250585ab.7.1744515685903; Sat, 12 Apr 2025
 20:41:25 -0700 (PDT)
Date: Sat, 12 Apr 2025 20:41:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fb3265.050a0220.2c5fcf.001a.GAE@google.com>
Subject: [syzbot] [afs?] BUG: unable to handle kernel paging request in afs_put_vlserverlist
From: syzbot <syzbot+5c042fbab0b292c98fc6@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-afs@lists.infradead.org, 
	linux-kernel@vger.kernel.org, marc.dionne@auristor.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    bec7dcbc242c Merge tag 'probes-fixes-v6.14' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13067a74580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7a4e108575159039
dashboard link: https://syzkaller.appspot.com/bug?extid=5c042fbab0b292c98fc6
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=179b323f980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17fe17cf980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/36d8f571e9a9/disk-bec7dcbc.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3fc027e5e923/vmlinux-bec7dcbc.xz
kernel image: https://storage.googleapis.com/syzbot-assets/964a62b47535/bzImage-bec7dcbc.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5c042fbab0b292c98fc6@syzkaller.appspotmail.com

kAFS: bad VL server IP address
BUG: unable to handle page fault for address: fffffffffffffffa
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
PGD e186067 P4D e186067 PUD e188067 PMD 0 
Oops: Oops: 0002 [#1] SMP KASAN PTI
CPU: 1 UID: 0 PID: 5834 Comm: syz-executor362 Not tainted 6.15.0-rc1-syzkaller-00025-gbec7dcbc242c #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:arch_atomic_fetch_add arch/x86/include/asm/atomic.h:93 [inline]
RIP: 0010:raw_atomic_fetch_sub_release include/linux/atomic/atomic-arch-fallback.h:949 [inline]
RIP: 0010:atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:401 [inline]
RIP: 0010:__refcount_sub_and_test include/linux/refcount.h:389 [inline]
RIP: 0010:__refcount_dec_and_test include/linux/refcount.h:432 [inline]
RIP: 0010:refcount_dec_and_test include/linux/refcount.h:450 [inline]
RIP: 0010:afs_put_vlserverlist+0x3a/0x220 fs/afs/vl_list.c:67
Code: 53 48 83 ec 18 e8 e6 35 2f fe 48 85 ed 74 43 e8 dc 35 2f fe 4c 8d 65 10 be 04 00 00 00 bb ff ff ff ff 4c 89 e7 e8 76 ad 93 fe <f0> 0f c1 5d 10 31 ff 89 de e8 f8 30 2f fe 85 db 7e 29 e8 af 35 2f
RSP: 0018:ffffc90003e5fae0 EFLAGS: 00010246
RAX: 0000000000000001 RBX: 00000000ffffffff RCX: ffffffff838c071a
RDX: fffffc0000000000 RSI: 0000000000000004 RDI: fffffffffffffffa
RBP: ffffffffffffffea R08: 0000000000000001 R09: fffffbffffffffff
R10: fffffffffffffffd R11: 0000000000000001 R12: fffffffffffffffa
R13: ffffffffffffffea R14: ffff8880216ad700 R15: ffff888034ec2000
FS:  0000555561d3e380(0000) GS:ffff888124ab9000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: fffffffffffffffa CR3: 000000007a922000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 afs_alloc_cell fs/afs/cell.c:218 [inline]
 afs_lookup_cell+0x12a5/0x1680 fs/afs/cell.c:264
 afs_cell_init+0x17a/0x380 fs/afs/cell.c:386
 afs_proc_rootcell_write+0x21f/0x290 fs/afs/proc.c:247
 proc_simple_write+0x114/0x1b0 fs/proc/generic.c:825
 pde_write fs/proc/inode.c:330 [inline]
 proc_reg_write+0x23d/0x330 fs/proc/inode.c:342
 vfs_write+0x25c/0x1180 fs/read_write.c:682
 ksys_write+0x12a/0x240 fs/read_write.c:736
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fab4ed8ba79
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 c1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff0c666448 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000200000000000 RCX: 00007fab4ed8ba79
RDX: 000000000000009e RSI: 0000200000000200 RDI: 0000000000000003
RBP: 00007fab4edfe5f0 R08: 0000000000000006 R09: 0000000000000006
R10: 0000000000000006 R11: 0000000000000246 R12: 0000000000000001
R13: 431bde82d7b634db R14: 0000000000000001 R15: 0000000000000001
 </TASK>
Modules linked in:
CR2: fffffffffffffffa
---[ end trace 0000000000000000 ]---
RIP: 0010:arch_atomic_fetch_add arch/x86/include/asm/atomic.h:93 [inline]
RIP: 0010:raw_atomic_fetch_sub_release include/linux/atomic/atomic-arch-fallback.h:949 [inline]
RIP: 0010:atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:401 [inline]
RIP: 0010:__refcount_sub_and_test include/linux/refcount.h:389 [inline]
RIP: 0010:__refcount_dec_and_test include/linux/refcount.h:432 [inline]
RIP: 0010:refcount_dec_and_test include/linux/refcount.h:450 [inline]
RIP: 0010:afs_put_vlserverlist+0x3a/0x220 fs/afs/vl_list.c:67
Code: 53 48 83 ec 18 e8 e6 35 2f fe 48 85 ed 74 43 e8 dc 35 2f fe 4c 8d 65 10 be 04 00 00 00 bb ff ff ff ff 4c 89 e7 e8 76 ad 93 fe <f0> 0f c1 5d 10 31 ff 89 de e8 f8 30 2f fe 85 db 7e 29 e8 af 35 2f
RSP: 0018:ffffc90003e5fae0 EFLAGS: 00010246
RAX: 0000000000000001 RBX: 00000000ffffffff RCX: ffffffff838c071a
RDX: fffffc0000000000 RSI: 0000000000000004 RDI: fffffffffffffffa
RBP: ffffffffffffffea R08: 0000000000000001 R09: fffffbffffffffff
R10: fffffffffffffffd R11: 0000000000000001 R12: fffffffffffffffa
R13: ffffffffffffffea R14: ffff8880216ad700 R15: ffff888034ec2000
FS:  0000555561d3e380(0000) GS:ffff888124ab9000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: fffffffffffffffa CR3: 000000007a922000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	53                   	push   %rbx
   1:	48 83 ec 18          	sub    $0x18,%rsp
   5:	e8 e6 35 2f fe       	call   0xfe2f35f0
   a:	48 85 ed             	test   %rbp,%rbp
   d:	74 43                	je     0x52
   f:	e8 dc 35 2f fe       	call   0xfe2f35f0
  14:	4c 8d 65 10          	lea    0x10(%rbp),%r12
  18:	be 04 00 00 00       	mov    $0x4,%esi
  1d:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  22:	4c 89 e7             	mov    %r12,%rdi
  25:	e8 76 ad 93 fe       	call   0xfe93ada0
* 2a:	f0 0f c1 5d 10       	lock xadd %ebx,0x10(%rbp) <-- trapping instruction
  2f:	31 ff                	xor    %edi,%edi
  31:	89 de                	mov    %ebx,%esi
  33:	e8 f8 30 2f fe       	call   0xfe2f3130
  38:	85 db                	test   %ebx,%ebx
  3a:	7e 29                	jle    0x65
  3c:	e8                   	.byte 0xe8
  3d:	af                   	scas   %es:(%rdi),%eax
  3e:	35                   	.byte 0x35
  3f:	2f                   	(bad)


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

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
