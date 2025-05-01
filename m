Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78E91EE7B9
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 14:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746110318; cv=none; b=usgbBKRsyP+SBiK+QdOuGa3M3gvz+XFAA7+EQsKY6EyFiz7QGAdAVEobD7/d+PYc/oEX+vi3vz0Yf7hRKcj4kyFJdu5V9Od6g8/++gUpu7H2er9jy3oQCZu03+2r5C0OCxi1s1CrSZtvNAfMcC0uRDidPNSmTidd5DTzCE8bGwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746110318; c=relaxed/simple;
	bh=9Xop3OOEqn07lUALgdYq1N7wpGhSRjkm2oOuducBT0k=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=QkEt+3pzXxZq3tUnFIPk8ujj9CKtJSPrexQUDsGdcRiSF+RGaiae8NKESPWeGAmycPWmwmlQEwsNB1NThWtjBnG2EA4fCQ1ucfO7JWTUYdIaCufj6HQMzS7mUrRBdd4fnY6shqz8OC98BdcNQGFsdr2S3K62U6dv5YTPfAvZe/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3d90a7e86f7so24647465ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 07:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746110316; x=1746715116;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l4tLeaJcTbDDpifUVvc/lCec/DWbTk+5lfds6F//EO0=;
        b=EkHt5NQcMxI++uxieyKM5WNE77UWKOyv5Neg8r9avDdBt7mPzi9ZMcpfcAVpZJp1z0
         y844Iw1kOCYGdhKuOPTMkX/oW8hsuzByvJDBS9U+QnvtX0ZqGZ1Wr6LEQMRgOuqQ4Io7
         OKV3FQMcN2bvxlvKNpLbB10CJZSXex1+Txw6IJHKtPwhOcW/xFkFab/nJerhVJMYGu8T
         DG3IbSnXbdw/favtjOItK1rx2M0MMtuKT52yrCtZVmqJxDTj4hSFScd3+5RrVLHkDzQv
         3AelkZx62/UZdWvRsoUkZaptEc0lAI9ubooSJSzp65TnSonZkJLqyZb6PgOGEbKPMKLJ
         i6Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVXr/5SC0Ba3yrrqiDZ1KOdRAeXXhrlnYmjmiofu3QOmlNr6SofJh6mA/9dGlaGCjpgtXLjbEHzSqlo4e8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjW4+CsRQQKPNR5vZekvr0+JDgKY+/io/enHRLcXEO7bmCXtBk
	8QrZUqSLcXWiyTecJSw6RbQuvkiMsWgiWDDtUEwg7G7cwk9v2SUZ9lwCV211PpH2LBeki8d9Q6a
	XDiytoJeoO9+hW/kizZwmeBQcTgXEPGfSF7Rx4i34TkTw9gxD8AZcUuk=
X-Google-Smtp-Source: AGHT+IHPREG7FBR1mQbprtj+QsKBjG78C1WKVomPkdWQ5FYosBBoI0Mi8MBZFWWoh5fqUjq8CkFcqBQp+7xdG54/Ko+/F/gWKuoy
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:7f09:0:b0:3d9:6cb6:fa58 with SMTP id
 e9e14a558f8ab-3d970267211mr28771935ab.17.1746110316021; Thu, 01 May 2025
 07:38:36 -0700 (PDT)
Date: Thu, 01 May 2025 07:38:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6813876c.050a0220.14dd7d.0012.GAE@google.com>
Subject: [syzbot] [net?] general protection fault in ip6_create_rt_rcu
From: syzbot <syzbot+3182876310f7cd8e31ec@syzkaller.appspotmail.com>
To: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    8bac8898fe39 Merge tag 'mmc-v6.15-rc1' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15e80a70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ca17f2d2ba38f7a0
dashboard link: https://syzkaller.appspot.com/bug?extid=3182876310f7cd8e31ec
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/77f12ee7bbba/disk-8bac8898.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/fdbf21a52748/vmlinux-8bac8898.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ab772c5e7344/bzImage-8bac8898.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3182876310f7cd8e31ec@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000021: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000108-0x000000000000010f]
CPU: 0 UID: 0 PID: 12024 Comm: syz.1.1798 Not tainted 6.15.0-rc4-syzkaller-00040-g8bac8898fe39 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/19/2025
RIP: 0010:read_pnet include/net/net_namespace.h:409 [inline]
RIP: 0010:dev_net include/linux/netdevice.h:2708 [inline]
RIP: 0010:ip6_create_rt_rcu+0x272/0x590 net/ipv6/route.c:1236
Code: c4 21 9f f7 45 0f b7 e4 e8 4b 27 50 01 49 8d 87 08 01 00 00 48 89 c2 48 89 44 24 08 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <80> 3c 02 00 0f 85 d6 02 00 00 49 8b 87 08 01 00 00 44 89 e1 ba ff
RSP: 0018:ffffc90004c8f580 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffff888146bcdb2c RCX: ffffc90004dc2000
RDX: 0000000000000021 RSI: ffffffff8a1c0f3c RDI: 0000000000000001
RBP: ffffc90004c8f6e0 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 1ffff92000991eb2 R14: ffff888146bcdb00 R15: 0000000000000000
FS:  00007f0a0a2226c0(0000) GS:ffff8881249e4000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000110c343bf4 CR3: 000000005c49f000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 ip6_pol_route_lookup+0xbfb/0x1e10 net/ipv6/route.c:1293
 pol_lookup_func include/net/ip6_fib.h:616 [inline]
 fib6_rule_lookup+0x5e8/0x720 net/ipv6/fib6_rules.c:125
 rt6_lookup+0x16b/0x220 net/ipv6/route.c:1327
 ipv6_sock_ac_join+0x643/0x800 net/ipv6/anycast.c:96
 do_ipv6_setsockopt+0x3684/0x4420 net/ipv6/ipv6_sockglue.c:919
 ipv6_setsockopt+0xcb/0x170 net/ipv6/ipv6_sockglue.c:993
 tcp_setsockopt+0xa4/0x100 net/ipv4/tcp.c:4077
 do_sock_setsockopt+0x221/0x470 net/socket.c:2296
 __sys_setsockopt+0x1a0/0x230 net/socket.c:2321
 __do_sys_setsockopt net/socket.c:2327 [inline]
 __se_sys_setsockopt net/socket.c:2324 [inline]
 __x64_sys_setsockopt+0xbd/0x160 net/socket.c:2324
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0a0938e969
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f0a0a222038 EFLAGS: 00000246 ORIG_RAX: 0000000000000036
RAX: ffffffffffffffda RBX: 00007f0a095b5fa0 RCX: 00007f0a0938e969
RDX: 000000000000001b RSI: 0000000000000029 RDI: 0000000000000005
RBP: 00007f0a09410ab1 R08: 0000000000000014 R09: 0000000000000000
R10: 00002000000000c0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f0a095b5fa0 R15: 00007ffd77acd2b8
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:read_pnet include/net/net_namespace.h:409 [inline]
RIP: 0010:dev_net include/linux/netdevice.h:2708 [inline]
RIP: 0010:ip6_create_rt_rcu+0x272/0x590 net/ipv6/route.c:1236
Code: c4 21 9f f7 45 0f b7 e4 e8 4b 27 50 01 49 8d 87 08 01 00 00 48 89 c2 48 89 44 24 08 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <80> 3c 02 00 0f 85 d6 02 00 00 49 8b 87 08 01 00 00 44 89 e1 ba ff
RSP: 0018:ffffc90004c8f580 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffff888146bcdb2c RCX: ffffc90004dc2000
RDX: 0000000000000021 RSI: ffffffff8a1c0f3c RDI: 0000000000000001
RBP: ffffc90004c8f6e0 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 1ffff92000991eb2 R14: ffff888146bcdb00 R15: 0000000000000000
FS:  00007f0a0a2226c0(0000) GS:ffff888124ae4000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055eca2d38d40 CR3: 000000005c49f000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 000000000000000c DR6: 00000000ffff0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess), 1 bytes skipped:
   0:	21 9f f7 45 0f b7    	and    %ebx,-0x48f0ba09(%rdi)
   6:	e4 e8                	in     $0xe8,%al
   8:	4b 27                	rex.WXB (bad)
   a:	50                   	push   %rax
   b:	01 49 8d             	add    %ecx,-0x73(%rcx)
   e:	87 08                	xchg   %ecx,(%rax)
  10:	01 00                	add    %eax,(%rax)
  12:	00 48 89             	add    %cl,-0x77(%rax)
  15:	c2 48 89             	ret    $0x8948
  18:	44 24 08             	rex.R and $0x8,%al
  1b:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  22:	fc ff df
  25:	48 c1 ea 03          	shr    $0x3,%rdx
* 29:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2d:	0f 85 d6 02 00 00    	jne    0x309
  33:	49 8b 87 08 01 00 00 	mov    0x108(%r15),%rax
  3a:	44 89 e1             	mov    %r12d,%ecx
  3d:	ba                   	.byte 0xba
  3e:	ff                   	.byte 0xff


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
