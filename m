Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363712AE99
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 00:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743552022; cv=none; b=H5aHXIrtQCRbY2SMKkEoe96BigzV2FDCHUgZMHJhaJUmdtdA8VMSEsZ2Bc14aZzFIbVBji6rY1iEuNHqme1C7uO7qswSix5zFHSDhQEWaBF7r9SvJH2v7M7ggc59qCiH+439U9zBW1b6chg9ZI5Ldu4mMmf5t11A5s7kpRSRK0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743552022; c=relaxed/simple;
	bh=3rkgxyqLOHChSRJv0W0kIyjKBNMP+kyP/Jh+71vHql8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=IvZ/1MwyL5KEehjRcBT34VNZVnOuWrAxavgyRHPy8ws5POnrVZJsYL1usmS37EfziCfwoadACUldfZnRP6bH0JgoH8YebCVvADp8Uv8CucmN3r4q9yEAXFIEd878X2AH9V1Xt2R8vnnL9DuwrfwlkVwbNEeb6c6mrWcTlsmWoDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3d458e61faaso4492245ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 17:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743552020; x=1744156820;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yMAfIYcFj1qjq2nRYNfobHVPBwq21ej/2TORAiiD/+s=;
        b=eJb18EMfsPUtX70U+yCK06D+tQeU3jJRz12W+SIdqrVM9wwKNkyXP1WlKtzMIdRZe5
         7BC/RS/VZXenuXXmvwzkIkULdefnFYopI2Ti69lTSx+czPL9BYgaCv/q1C0LwoEhLwGR
         QL3aeCE7gpYFSUH2xFUrLVpUEoSvZkHRr6tvCED/d4q6E94ZudDNmoKA7bTpRFpi2zpa
         e4XU1+WSmFJgez3UlDt74vtC/ArLvsnfrrQDVG8Tq0WG8IulzRJ1ME9ny8E0xtAEzFHY
         HNwpzXrBLVdvbsoE+pg7IpFdiyEQ+gnByXzrit6NDrYSmxKcsF6z6aRnc4utrnKY5Ag8
         pA3g==
X-Forwarded-Encrypted: i=1; AJvYcCVY95/R58S4B0YCauNj7AXorMOKulMA8OX76nI8u+K3BWZCQUFUeZd06ZcRIPPqk6Pa/FBSAJshkSiZNLk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyB0g5v0H7q3Lqh4Bz6e6ldV3vhzqDCR9AoAZNaREkYk6doQr/
	RxGorE2oI6zGnXk88qcr8B5ZZy+c4XAZuvp/zRh1GVBB5OrGqBM/hsW9dlEKGCOj3NRvQIcuWRs
	pD8rf51DM9lt7gO18lMjlpEMkZjk4PoAh1/xey3delbN9Ftm7Kv2Vtlk=
X-Google-Smtp-Source: AGHT+IF+QsByIZQoylrcRV90u6uZIfirICTRvZm4Iz5qF99s6r7+2pxjlr1qAsH+QT0M3ZuZlyRjbUWUej2MmMfjNh8MMSzP89N/
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3498:b0:3d3:f15e:8e23 with SMTP id
 e9e14a558f8ab-3d6d6884cc7mr108795ab.10.1743552020298; Tue, 01 Apr 2025
 17:00:20 -0700 (PDT)
Date: Tue, 01 Apr 2025 17:00:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ec7e14.050a0220.31979b.0030.GAE@google.com>
Subject: [syzbot] [mm?] general protection fault in sys_mremap
From: syzbot <syzbot+e3385f43b2897a19be24@syzkaller.appspotmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    405e2241def8 Add linux-next specific files for 20250331
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=164c9bcf980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f2054704dd53fb80
dashboard link: https://syzkaller.appspot.com/bug?extid=e3385f43b2897a19be24
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7f800beaa14a/disk-405e2241.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a573ae9a8887/vmlinux-405e2241.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f4f732eedbc9/bzImage-405e2241.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e3385f43b2897a19be24@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000004: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027]
CPU: 0 UID: 0 PID: 6953 Comm: syz.1.290 Not tainted 6.14.0-next-20250331-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:vrm_uncharge mm/mremap.c:964 [inline]
RIP: 0010:expand_vma_in_place mm/mremap.c:1566 [inline]
RIP: 0010:expand_vma mm/mremap.c:1621 [inline]
RIP: 0010:mremap_at mm/mremap.c:1682 [inline]
RIP: 0010:do_mremap mm/mremap.c:1727 [inline]
RIP: 0010:__do_sys_mremap mm/mremap.c:1784 [inline]
RIP: 0010:__se_sys_mremap+0x25fa/0x2c00 mm/mremap.c:1752
Code: c0 0f 85 0e 05 00 00 0f b6 9c 24 20 03 00 00 31 ff 89 de e8 c8 16 ab ff 85 db 0f 84 7b 01 00 00 e8 bb 13 ab ff e9 9e 00 00 00 <80> 78 04 00 74 0a bf 20 00 00 00 e8 c6 2d 15 00 4c 8b 34 25 20 00
RSP: 0018:ffffc9001c347b40 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 1ffff92003868fca
RDX: ffffc9000d093000 RSI: 00000000000000e0 RDI: 00000000000000e1
RBP: ffffc9001c347f00 R08: ffffffff821d1414 R09: ffffffff8c2734a7
R10: 0000000000000004 R11: ffff888026f55a00 R12: 0000200000ff8000
R13: ffff888034282000 R14: 0000000018000098 R15: ffffc9001c347cd0
FS:  00007f975bfad6c0(0000) GS:ffff888124f95000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f975bf8bf98 CR3: 000000005c0a6000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f975b18d169
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f975bfad038 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
RAX: ffffffffffffffda RBX: 00007f975b3a6080 RCX: 00007f975b18d169
RDX: 0000000000002000 RSI: 0000000000001000 RDI: 0000200000ff8000
RBP: 00007f975b20e2a0 R08: 0000200000ff8000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f975b3a6080 R15: 00007ffe4ecc7008
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:vrm_uncharge mm/mremap.c:964 [inline]
RIP: 0010:expand_vma_in_place mm/mremap.c:1566 [inline]
RIP: 0010:expand_vma mm/mremap.c:1621 [inline]
RIP: 0010:mremap_at mm/mremap.c:1682 [inline]
RIP: 0010:do_mremap mm/mremap.c:1727 [inline]
RIP: 0010:__do_sys_mremap mm/mremap.c:1784 [inline]
RIP: 0010:__se_sys_mremap+0x25fa/0x2c00 mm/mremap.c:1752
Code: c0 0f 85 0e 05 00 00 0f b6 9c 24 20 03 00 00 31 ff 89 de e8 c8 16 ab ff 85 db 0f 84 7b 01 00 00 e8 bb 13 ab ff e9 9e 00 00 00 <80> 78 04 00 74 0a bf 20 00 00 00 e8 c6 2d 15 00 4c 8b 34 25 20 00
RSP: 0018:ffffc9001c347b40 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 1ffff92003868fca
RDX: ffffc9000d093000 RSI: 00000000000000e0 RDI: 00000000000000e1
RBP: ffffc9001c347f00 R08: ffffffff821d1414 R09: ffffffff8c2734a7
R10: 0000000000000004 R11: ffff888026f55a00 R12: 0000200000ff8000
R13: ffff888034282000 R14: 0000000018000098 R15: ffffc9001c347cd0
FS:  00007f975bfad6c0(0000) GS:ffff888124f95000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f74d4f78ab8 CR3: 000000005c0a6000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess), 1 bytes skipped:
   0:	0f 85 0e 05 00 00    	jne    0x514
   6:	0f b6 9c 24 20 03 00 	movzbl 0x320(%rsp),%ebx
   d:	00
   e:	31 ff                	xor    %edi,%edi
  10:	89 de                	mov    %ebx,%esi
  12:	e8 c8 16 ab ff       	call   0xffab16df
  17:	85 db                	test   %ebx,%ebx
  19:	0f 84 7b 01 00 00    	je     0x19a
  1f:	e8 bb 13 ab ff       	call   0xffab13df
  24:	e9 9e 00 00 00       	jmp    0xc7
* 29:	80 78 04 00          	cmpb   $0x0,0x4(%rax) <-- trapping instruction
  2d:	74 0a                	je     0x39
  2f:	bf 20 00 00 00       	mov    $0x20,%edi
  34:	e8 c6 2d 15 00       	call   0x152dff
  39:	4c                   	rex.WR
  3a:	8b                   	.byte 0x8b
  3b:	34 25                	xor    $0x25,%al
  3d:	20 00                	and    %al,(%rax)


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
