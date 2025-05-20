Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB6E1BD9F0
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 18:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747764147; cv=none; b=aDr8nbKp6KT1eLwXFCMAHRfN8OmQV4n1Bg6xHPzhzVx1/PW4rZZZsNiYiuN/lVZLy1yJtt1HWR6JLdCVnzJI6PRUGS7+HKaMPyf9UBVNXaT1tUBmpA6Q4Bc56GPm/eN7PwOfcHAt/oZvy71PeU9FyrZwTo7+E9B9DQ7Ry0GS9GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747764147; c=relaxed/simple;
	bh=Au1RLsrcICSRk7TklPURQxKHDmZgV4OzX0iHv+Mznv4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=F8zUucR8pXxjncpB2iVveiPUMLv0DCclWwKNoIlvMoI7Odbg4ZQSOzRTde3CiTi6OhjmTOTS/SSe+CA6wUDh8IxQJBS73cYGgijcpyfqtVNFkBQ2maezMLILCBb6QXym8mOZDKmVU8zyPJnlo8UeeQLOVSSD5rvNzGNYIQK7AUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-85e4f920dacso502219439f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747764145; x=1748368945;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BdtErvVnPkaTJ5W3EweEKFDiJG1wwCqJ41yNPsWj1j4=;
        b=jFV/RMvWZk5MAGpCTXy2bcMAxYcGXT7xICnNWv8ZZZMNyhw/m3RaifgpUama2WVqSu
         xxzug3DVYDWl9i80MSV8+uJ2DwHPX+6O1tob34ze/60boaCncI/UTSfnZ3FfAXJVT8w4
         iS2XgiD+l3NW2s+iZPBYllvTFm1duZvXXx2H3wSjAjAZ0l/cEc/59GKqg1h3J496JF8K
         /sJDyaZohVKZSXwpbHM8agtT2R07YiMsVmIL65GT+4S5LYxkfCgP+oq4S6cOJaTF92TS
         EcfW0JNVhJ9qz1KyZGA38JEgu3rZYgPbQr+seexbWp4LDtX7raIn/R/ZAFyN1rNukdqf
         qGjw==
X-Forwarded-Encrypted: i=1; AJvYcCXCfZGH0mY1AVaTmslJ7btkNC/sz01qHXRkiPAj7Ves1Oyg12wy7CzkH2nyF2Rv5QSZ7P/edapQAaO7KWE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0PdGUZNJyobgtsY0gi600VtVOG5c/F8iUfQxXxUR1SXxbDiia
	xt5Qh4JlNdZG1awFY91+zQ3iI8X0ShcJGI4bPHnIdOPY+xWlpa5XWmUpR8cuDkAtGI+h0Sg9g9i
	K3a+Bw0CNz8zAOvXXYwBgbP5qCqWv3KL25RbNbUiIdeW4kjO06QoMarLRUn4=
X-Google-Smtp-Source: AGHT+IGn7GF7KZgALUbRjqqVXLDDgunsWJwXNGwozBuTBbpUW8+wd3K8T119IudB9ejmXQI231qrFzxOnEt6GqBVafmZVmJU2u4o
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4c0a:b0:86a:246:ee96 with SMTP id
 ca18e2360f4ac-86a232298b6mr2377593439f.11.1747764144714; Tue, 20 May 2025
 11:02:24 -0700 (PDT)
Date: Tue, 20 May 2025 11:02:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682cc3b0.050a0220.ade60.09c0.GAE@google.com>
Subject: [syzbot] [kernfs?] general protection fault in kernfs_rename_ns
From: syzbot <syzbot+587821cc0410bd1e73f4@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    bc3372351d0c Merge tag 'for-6.15-rc3-tag' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1604dccc580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=efa83f9a6dd67d67
dashboard link: https://syzkaller.appspot.com/bug?extid=587821cc0410bd1e73f4
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d1e89d70587d/disk-bc337235.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/423033b00699/vmlinux-bc337235.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6a1ce597dad9/bzImage-bc337235.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+587821cc0410bd1e73f4@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000006: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000030-0x0000000000000037]
CPU: 0 UID: 0 PID: 11644 Comm: syz-executor Not tainted 6.15.0-rc3-syzkaller-00019-gbc3372351d0c #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:kernfs_rename_ns+0x3b/0xa50 fs/kernfs/dir.c:1744
Code: 48 89 fb 4c 8d 7b 30 48 83 ec 20 48 89 14 24 48 89 4c 24 08 e8 56 e0 5b ff 4c 89 fa 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <80> 3c 02 00 0f 85 f7 08 00 00 48 8b 43 30 48 85 c0 0f 84 a6 08 00
RSP: 0018:ffffc90003edf9a8 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000006 RSI: ffffffff825f6f9a RDI: 0000000000000000
RBP: ffff88814368d1e0 R08: 0000000000000007 R09: 0000000000000000
R10: 000000007fffffff R11: 0000000000000000 R12: ffff88802ff137a0
R13: ffff888031e68040 R14: ffff888143681480 R15: 0000000000000030
FS:  0000000000000000(0000) GS:ffff8881249b2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f6a9f26533a CR3: 0000000059c9e000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 000000000000000e DR6: 00000000ffff0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 kobject_move+0x127/0x260 lib/kobject.c:569
 device_move+0xa9/0x10d0 drivers/base/core.c:4583
 hci_conn_del_sysfs+0x81/0x180 net/bluetooth/hci_sysfs.c:75
 hci_conn_cleanup net/bluetooth/hci_conn.c:175 [inline]
 hci_conn_del+0x55f/0xdc0 net/bluetooth/hci_conn.c:1167
 hci_conn_hash_flush+0x186/0x260 net/bluetooth/hci_conn.c:2702
 hci_dev_close_sync+0x602/0x11d0 net/bluetooth/hci_sync.c:5225
 hci_dev_do_close+0x2e/0x90 net/bluetooth/hci_core.c:483
 hci_unregister_dev+0x213/0x620 net/bluetooth/hci_core.c:2678
 vhci_release+0x79/0xf0 drivers/bluetooth/hci_vhci.c:665
 __fput+0x3ff/0xb70 fs/file_table.c:465
 task_work_run+0x14d/0x240 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0xafb/0x2c30 kernel/exit.c:953
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1102
 __do_sys_exit_group kernel/exit.c:1113 [inline]
 __se_sys_exit_group kernel/exit.c:1111 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1111
 x64_sys_call+0x1530/0x1730 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f2d69f8e169
Code: Unable to access opcode bytes at 0x7f2d69f8e13f.
RSP: 002b:00007ffd2f718e68 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f2d69f8e169
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000043
RBP: 00007f2d69fee8d0 R08: 00007ffd2f716c07 R09: 0000000000000003
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 0000000000000003 R14: 00000000ffffffff R15: 00007ffd2f719020
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:kernfs_rename_ns+0x3b/0xa50 fs/kernfs/dir.c:1744
Code: 48 89 fb 4c 8d 7b 30 48 83 ec 20 48 89 14 24 48 89 4c 24 08 e8 56 e0 5b ff 4c 89 fa 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <80> 3c 02 00 0f 85 f7 08 00 00 48 8b 43 30 48 85 c0 0f 84 a6 08 00
RSP: 0018:ffffc90003edf9a8 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000006 RSI: ffffffff825f6f9a RDI: 0000000000000000
RBP: ffff88814368d1e0 R08: 0000000000000007 R09: 0000000000000000
R10: 000000007fffffff R11: 0000000000000000 R12: ffff88802ff137a0
R13: ffff888031e68040 R14: ffff888143681480 R15: 0000000000000030
FS:  0000000000000000(0000) GS:ffff8881249b2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b2f6f0ff8 CR3: 000000001293a000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 000000000000000e DR6: 00000000ffff0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	48 89 fb             	mov    %rdi,%rbx
   3:	4c 8d 7b 30          	lea    0x30(%rbx),%r15
   7:	48 83 ec 20          	sub    $0x20,%rsp
   b:	48 89 14 24          	mov    %rdx,(%rsp)
   f:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  14:	e8 56 e0 5b ff       	call   0xff5be06f
  19:	4c 89 fa             	mov    %r15,%rdx
  1c:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  23:	fc ff df
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	0f 85 f7 08 00 00    	jne    0x92b
  34:	48 8b 43 30          	mov    0x30(%rbx),%rax
  38:	48 85 c0             	test   %rax,%rax
  3b:	0f                   	.byte 0xf
  3c:	84                   	.byte 0x84
  3d:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
  3e:	08 00                	or     %al,(%rax)


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
