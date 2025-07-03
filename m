Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA7323BF8F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 23:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585489; cv=none; b=MOyHAwgeC0EoRhAhv9As0MLlQBL8B7wBLNJCvMRR5FFQGBauMX0NuSV74qXGuRQvFqW8OEF/SFEym8bJBJ8qA5G5hBcEhW9N9LGwHaMNEbuBf2RcOXrlRUf6aIOd6D6bDOzym53pFT923Fw82hC9llaxsAI7/1e5LGk5fGa17Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585489; c=relaxed/simple;
	bh=6O/wQ1opQEQHwA+xCMBHBBnRfJNdXnjXgJC5lbZuGTg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=u/EgryC46G7uNbvMAPOnMd0VdmNIQIy+WkVhVZZ66w/hn/6yYElRcPWFLPDgu4ucAvS+O5RoXvlEJaZIRB6G1k9ZvuAW2GIpShH7ugORjPeWRDJ4t8Dt52jla9S+j1jcGE8w91U0PNuH5kjTxtEgimH19hFmw4Yy7u4Hec7joDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3e0548d7e86so2537445ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 16:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751585487; x=1752190287;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Z/CJkJUYjTnTdBUOq9ChnZywsxtgtdjYy47oYmtlEA=;
        b=NpgKczU9mPrwNKJaeZ1mFdrOJbmKE7loBTDHB8vJGYBWqCdNFX+xd6MNNmX4XnCKz1
         8gQfbqAhSoWBq6E2n7g8+hyUI3t3c3P2b66cxdMhkToc0R1+wvtBhJNQavrK/mlDa/9Y
         9pTK+g1miA8i1sxJHK8c3sTEVc6rfUV3oypw5yOryi/7hJY3QHShJtjhm9/Akdmp1AYI
         nYBMwavSsEgS8Kq8dQi/mUnA5Q4Cf9nvNgD5wsrPTyE/oOENu1Dxlwq+tttnpIG3Peui
         PIMIet6mnGiagn4HUJnZnpskGdXmm/sinIMBAiEoTx2gR9vvdt1G5vOqRpCOfj1EtD9O
         7ZTw==
X-Forwarded-Encrypted: i=1; AJvYcCUKcRO7f5Ie0nBS+DWE7GB4B2x9VKgNUrr7aMqHrvOt8aN4n6elPKANnI8E4HvM0JpIv/eKW4vS/aLM5nw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMO4jZqT7ZOW+Wass1amZMBoOF+pWIUtrprlZQd9ApgjVElTPO
	ulcKI6XU+QRN39PTT8M5rUuxA/JqdgfZVYvNwB+ngWgx3EYzQWbqf3E0S0qY8c7qtBJmUc50uC5
	Zf3RQ3nTrO9u0e/sgH+Q2ATT9idDVKboQllwNYIQb2+1Sp8N+/DvRi6q9rNE=
X-Google-Smtp-Source: AGHT+IFN4ZyTVDc+VoB3Gu4sRBGy4ktivVSXEhiGF3HnPlpS6ZKjjVFGfN/UC7+dUD/S8bdw81M9mgksERx9OCe0APqM/7Y+gxTG
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:330a:b0:3df:2f47:dc21 with SMTP id
 e9e14a558f8ab-3e13562a090mr3896135ab.22.1751585486906; Thu, 03 Jul 2025
 16:31:26 -0700 (PDT)
Date: Thu, 03 Jul 2025 16:31:26 -0700
In-Reply-To: <68663c94.a70a0220.5d25f.0858.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686712ce.a70a0220.29cf51.0009.GAE@google.com>
Subject: Re: [syzbot] [net?] general protection fault in hfsc_qlen_notify
From: syzbot <syzbot+5eccb463fa89309d8bdc@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	jhs@mojatatu.com, jiri@resnulli.us, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com, xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    17bbde2e1716 Merge tag 'net-6.16-rc5' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11478c8c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e3bca8ec7d38c1ef
dashboard link: https://syzkaller.appspot.com/bug?extid=5eccb463fa89309d8bdc
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1633f48c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=115d948c580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-17bbde2e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3e731bc6ea60/vmlinux-17bbde2e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9aa1c1fb114f/bzImage-17bbde2e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5eccb463fa89309d8bdc@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc000000005d: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x00000000000002e8-0x00000000000002ef]
CPU: 2 UID: 0 PID: 6086 Comm: syz.0.16 Not tainted 6.16.0-rc4-syzkaller-00108-g17bbde2e1716 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:hfsc_qlen_notify+0x28/0x180 net/sched/sch_hfsc.c:1238
Code: 90 90 f3 0f 1e fa 41 54 55 53 48 89 f3 e8 90 82 34 f8 48 8d bb ec 02 00 00 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <0f> b6 14 02 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 08
RSP: 0018:ffffc900047672e0 EFLAGS: 00010203
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 1ffff110053accb8
RDX: 000000000000005d RSI: ffffffff89879e10 RDI: 00000000000002ec
RBP: 00000000000afff2 R08: 0000000000000005 R09: 0000000000000000
R10: 00000000000afff2 R11: 0000000000000001 R12: ffffffff8ce7c3e0
R13: 0000000000000000 R14: ffffffff8ce7c3c0 R15: ffff888029d66000
FS:  00005555783cf500(0000) GS:ffff8880d6952000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00002000000002c0 CR3: 00000000322e2000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 qdisc_tree_reduce_backlog+0x221/0x500 net/sched/sch_api.c:811
 fq_codel_change+0xb1a/0x11b0 net/sched/sch_fq_codel.c:450
 fq_codel_init+0x4ce/0xa60 net/sched/sch_fq_codel.c:487
 qdisc_create+0x454/0xfc0 net/sched/sch_api.c:1324
 __tc_modify_qdisc net/sched/sch_api.c:1749 [inline]
 tc_modify_qdisc+0x12bb/0x2130 net/sched/sch_api.c:1813
 rtnetlink_rcv_msg+0x3c6/0xe90 net/core/rtnetlink.c:6953
 netlink_rcv_skb+0x155/0x420 net/netlink/af_netlink.c:2534
 netlink_unicast_kernel net/netlink/af_netlink.c:1313 [inline]
 netlink_unicast+0x53d/0x7f0 net/netlink/af_netlink.c:1339
 netlink_sendmsg+0x8d1/0xdd0 net/netlink/af_netlink.c:1883
 sock_sendmsg_nosec net/socket.c:712 [inline]
 __sock_sendmsg net/socket.c:727 [inline]
 ____sys_sendmsg+0xa98/0xc70 net/socket.c:2566
 ___sys_sendmsg+0x134/0x1d0 net/socket.c:2620
 __sys_sendmsg+0x16d/0x220 net/socket.c:2652
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff88858e929
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffce57d9328 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
RAX: ffffffffffffffda RBX: 00007ff8887b5fa0 RCX: 00007ff88858e929
RDX: 0000000000004000 RSI: 0000200000000040 RDI: 0000000000000006
RBP: 00007ff888610b39 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ff8887b5fa0 R14: 00007ff8887b5fa0 R15: 0000000000000003
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:hfsc_qlen_notify+0x28/0x180 net/sched/sch_hfsc.c:1238
Code: 90 90 f3 0f 1e fa 41 54 55 53 48 89 f3 e8 90 82 34 f8 48 8d bb ec 02 00 00 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <0f> b6 14 02 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 08
RSP: 0018:ffffc900047672e0 EFLAGS: 00010203
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 1ffff110053accb8
RDX: 000000000000005d RSI: ffffffff89879e10 RDI: 00000000000002ec
RBP: 00000000000afff2 R08: 0000000000000005 R09: 0000000000000000
R10: 00000000000afff2 R11: 0000000000000001 R12: ffffffff8ce7c3e0
R13: 0000000000000000 R14: ffffffff8ce7c3c0 R15: ffff888029d66000
FS:  00005555783cf500(0000) GS:ffff8880d6952000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00002000000002c0 CR3: 00000000322e2000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	90                   	nop
   1:	90                   	nop
   2:	f3 0f 1e fa          	endbr64
   6:	41 54                	push   %r12
   8:	55                   	push   %rbp
   9:	53                   	push   %rbx
   a:	48 89 f3             	mov    %rsi,%rbx
   d:	e8 90 82 34 f8       	call   0xf83482a2
  12:	48 8d bb ec 02 00 00 	lea    0x2ec(%rbx),%rdi
  19:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  20:	fc ff df
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx <-- trapping instruction
  2e:	48 89 f8             	mov    %rdi,%rax
  31:	83 e0 07             	and    $0x7,%eax
  34:	83 c0 03             	add    $0x3,%eax
  37:	38 d0                	cmp    %dl,%al
  39:	7c 08                	jl     0x43
  3b:	84 d2                	test   %dl,%dl
  3d:	0f                   	.byte 0xf
  3e:	85 08                	test   %ecx,(%rax)


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
