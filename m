Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A4F1DE4E5
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751000046; cv=none; b=hyfUUYMeuKkHUt1ieq+PKOjN7jVVSMVrCzjlqT4ybMUyGlqxpEnjEFzOzaLTcTTcwGx0kHDNc7tpnvWaxmYlqzMUbiVRfmlZMqCZDLW6xwvlkpDCqyQgOvXywgLxtJsXx2Opou4w4eOinn2JG2SfJSKoAOLu+ievOcA6biBg4k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751000046; c=relaxed/simple;
	bh=vnd2EJcfPh0FKmD/4EacItn7nOzl2cHJ4a1gckne2oc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=upBJRyQDx97y5TfdBnV2y4XDMiiNjUzrYe7AiTl/9+xgE7/8F0PXIl7+a3rt1yC/UU33qslaJ3KcxpEI0NqEPcF+hnaqlo/swjeSjGP8QOOMdgT5SLHARYJt4D11MZlrgokMS+44YPhZAh1Xfh1YqRn6hLC4Fko3WvRzo+/WpF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddafe52d04so43402925ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 21:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751000044; x=1751604844;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BoSG+kEhTdB9dyfvsXn9C4p+CYrh+2w75i9A8qe1xhg=;
        b=Ty09uWuhpRJ3NTspxxYJ/pg+PMuBZ6ZQXGrq4znbqrDqUIKGSEXtBRMAjIBmWIb6lu
         ZwCeNCui/2q/R5tfrVggn0Wmtsg0LynDQ5vf3MAbQKsL7m93wyNUvK84sUnh/pCDLDR9
         AUpX/I3ZKh+Fisz0HoOTBTET33+om/zVzMOzKUNldCwDWHfh84mK8SHzM10l/bNlNqff
         qt2Y2iwt7hjnGgWKKM3E5EIvcSn+oT4H3V8wsob2YHXVPF8uLV9xH10o5/D3r3hSuAFN
         G9cLR8Oq4Q3Y2wZhiiGE2tEpjNGZFGVMu0VnIbveYDM4BBFDEYyVSfQfk5fGcqQ7YqjN
         0RSw==
X-Gm-Message-State: AOJu0Yzg4zy7G81CJlcIF1TXxR6tqY22J20Jf/RH5tUQ24CqaJ7IeTFB
	h+cmkopmXEKI77e+GPShD9dJOMvXFj4SJIpNyOrTzcHdhEwzR/O1Egh7fTZFlCHwMmosdA/ykVw
	UtH2CWYrHlAQE3H82N+I/JHGf0KVghpbs8FvqGNAp6UKIr4Kds5ON+Y1ixzI=
X-Google-Smtp-Source: AGHT+IEGL+le4krX34hUd1Egm373T9cWzt0Jjb3W59sC5WqVTqVuYBMutH3KJtWhLgu3w2MfG22a05RsxvCaxtqFYdb0gChfsk+E
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3309:b0:3d6:cbad:235c with SMTP id
 e9e14a558f8ab-3df4ab6244amr27928485ab.6.1751000044268; Thu, 26 Jun 2025
 21:54:04 -0700 (PDT)
Date: Thu, 26 Jun 2025 21:54:04 -0700
In-Reply-To: <20250627032632.2470249-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685e23ec.a00a0220.34b642.014d.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KMSAN: kernel-infoleak in vmci_host_unlocked_ioctl
 (3)
From: syzbot <syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
BUG: unable to handle kernel NULL pointer dereference in ioctl

BUG: kernel NULL pointer dereference, address: 0000000000000320
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 8000000047e19067 P4D 8000000047e19067 PUD 0 
Oops: Oops: 0000 [#1] SMP PTI
CPU: 1 UID: 0 PID: 6745 Comm: syz.0.16 Not tainted 6.16.0-rc3-syzkaller-g6f2a71a99ebd-dirty #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:vfs_ioctl fs/ioctl.c:51 [inline]
RIP: 0010:__do_sys_ioctl fs/ioctl.c:907 [inline]
RIP: 0010:__se_sys_ioctl+0x23f/0x400 fs/ioctl.c:893
Code: 83 20 03 00 00 00 00 00 00 49 83 fd 04 0f 83 b9 01 00 00 48 8b 7d c8 44 89 e6 48 8b 55 b0 4d 89 f3 2e e8 e0 4a 44 1d 49 89 c6 <44> 8b a3 20 03 00 00 8b 83 a8 0f 00 00 89 45 d4 c7 03 00 00 00 00
RSP: 0018:ffff88804a3dbe30 EFLAGS: 00010282
RAX: fffffffffffffff2 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 00000000219e67d0 RSI: 0000000000000001 RDI: ffff8880219e67d0
RBP: ffff88804a3dbe80 R08: ffffea000000000f R09: 0000000000000000
R10: ffff8880211e67d0 R11: ffffffff82831f32 R12: 00000000000007a0
R13: 0000000000000000 R14: fffffffffffffff2 R15: ffff888038101c01
FS:  00007f0f9a3e76c0(0000) GS:ffff8881aa97d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000320 CR3: 0000000047176000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __x64_sys_ioctl+0x97/0xe0 fs/ioctl.c:893
 x64_sys_call+0x1ebe/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:17
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0f9958e929
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f0f9a3e7038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f0f997b5fa0 RCX: 00007f0f9958e929
RDX: 0000200000000140 RSI: 00000000000007a0 RDI: 0000000000000004
RBP: 00007f0f99610b39 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f0f997b5fa0 R15: 00007ffe024bc598
 </TASK>
Modules linked in:
CR2: 0000000000000320
---[ end trace 0000000000000000 ]---
RIP: 0010:vfs_ioctl fs/ioctl.c:51 [inline]
RIP: 0010:__do_sys_ioctl fs/ioctl.c:907 [inline]
RIP: 0010:__se_sys_ioctl+0x23f/0x400 fs/ioctl.c:893
Code: 83 20 03 00 00 00 00 00 00 49 83 fd 04 0f 83 b9 01 00 00 48 8b 7d c8 44 89 e6 48 8b 55 b0 4d 89 f3 2e e8 e0 4a 44 1d 49 89 c6 <44> 8b a3 20 03 00 00 8b 83 a8 0f 00 00 89 45 d4 c7 03 00 00 00 00
RSP: 0018:ffff88804a3dbe30 EFLAGS: 00010282
RAX: fffffffffffffff2 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 00000000219e67d0 RSI: 0000000000000001 RDI: ffff8880219e67d0
RBP: ffff88804a3dbe80 R08: ffffea000000000f R09: 0000000000000000
R10: ffff8880211e67d0 R11: ffffffff82831f32 R12: 00000000000007a0
R13: 0000000000000000 R14: fffffffffffffff2 R15: ffff888038101c01
FS:  00007f0f9a3e76c0(0000) GS:ffff8881aa97d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000320 CR3: 0000000047176000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	83 20 03             	andl   $0x3,(%rax)
   3:	00 00                	add    %al,(%rax)
   5:	00 00                	add    %al,(%rax)
   7:	00 00                	add    %al,(%rax)
   9:	49 83 fd 04          	cmp    $0x4,%r13
   d:	0f 83 b9 01 00 00    	jae    0x1cc
  13:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
  17:	44 89 e6             	mov    %r12d,%esi
  1a:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  1e:	4d 89 f3             	mov    %r14,%r11
  21:	2e e8 e0 4a 44 1d    	cs call 0x1d444b07
  27:	49 89 c6             	mov    %rax,%r14
* 2a:	44 8b a3 20 03 00 00 	mov    0x320(%rbx),%r12d <-- trapping instruction
  31:	8b 83 a8 0f 00 00    	mov    0xfa8(%rbx),%eax
  37:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  3a:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)


Tested on:

commit:         6f2a71a9 Merge tag 'bcachefs-2025-06-26' of git://evil..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1720608c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=595d344ff0b23ac5
dashboard link: https://syzkaller.appspot.com/bug?extid=9b9124ae9b12d5af5d95
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=103ba08c580000

