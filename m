Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0C1EC5
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 11:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746098136; cv=none; b=Jl2a3JHctlgEyXchbRZR27fXfhQnuZCqMbmoetMxil7XicjpeqYwxeCESCbfUE20K4M5XatJSRpYn04/BcV33XfmBTeIvgt20lg/of3l+qhGzjGqWrXHFlZ1ru803feN0NWy3EZlNNhSb+LzJYOXSH1600Y0t3MpgWC+lSriHts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746098136; c=relaxed/simple;
	bh=HfYmV26FgnTt04PVF4jjki/yie5n1YWzt+JcQ2Pae7U=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ciNT0rGwThKBx97p5DrmLoDWQ+0QrF4B4kPb4OmbHQ8VdvIIFeJkfZ+Zi5KCngrvJfVaM6NYXRDm0BW9OAqYRVqyutLaGt2zJKDcCt5YdK+SUg4MdyS2t1B82Aw3ML5c9RitfebgE1Slz8eMM+BXgfH5WQTVjaDGRr3mSr11pu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3d8dd0c9143so13446705ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 04:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746098134; x=1746702934;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2V0s1pgtJHSE9wqQW/OwlUPcwO/vYFoDmb+3YSftYxg=;
        b=xQBdyyu5mHiGdU+wJYpfPztveRRwQE/5yF5uYN+B53WEAIONUqumgjootL5fdRwTRj
         EaZ98nLREzyrnGGXkPlMv7hTx3w3Ij6f2PHMu6ELY9FsciLydoCE+z4hZqDDkfmK+FiL
         46PlnzN2qai8yEFADZ8wjeaDGEXdygzg02XUpLKRZxjtdR9pquseZPneK1797GBid9ax
         4i5N9WpazgrqwjYU9MVlzkBbJX4b9UBjpC0Miw4mPGuIbThjCLaqjZ/3Tw5dCPUENdtq
         7Jk7MmML6/n5TGjsV6laIvtpsWogYmOTra/mtfUhYSKXJMYaIJOsBIeZcgpcJ9r4FZa5
         lofw==
X-Forwarded-Encrypted: i=1; AJvYcCVjqTezz2jxNUE2r6s9ez7b3cBnrT1Uzi2s3M5jtnS1ZxMVeLnTMD0T6WzwSCeWP0n8a3dxnNpg6FUHsZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhNG0OVkowqUV7RYToZms0Oekp8tMKv/3JHhP2/Nk0lahaq8cw
	FssL6TgKXruwr7HO9cHvqRkHEXV1KKxcv86GZdrcquERDxRvYC35myobjIJTxCtiGrUqaQvNYzz
	CxWPiWyJ1WHMAcemviJYwnEZfArzC0tBF4mKj36nK22tPJHML7aoEsm8=
X-Google-Smtp-Source: AGHT+IHonOfHpP5MZOdlqgVcIeE9FlZO4d6JZ3BDdp5KDONBJLJOF/2fNqWptp6KT9+D+KJRwpCgnNsmohPvx8dpVolIwtg1osug
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d91:b0:3d9:666f:486d with SMTP id
 e9e14a558f8ab-3d9702672eemr25892835ab.15.1746098134220; Thu, 01 May 2025
 04:15:34 -0700 (PDT)
Date: Thu, 01 May 2025 04:15:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681357d6.050a0220.14dd7d.000b.GAE@google.com>
Subject: [syzbot] [net?] WARNING in ipv6_addr_prefix
From: syzbot <syzbot+9596c1b9df18e0ae7261@syzkaller.appspotmail.com>
To: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5565acd1e6c4 Merge git://git.kernel.org/pub/scm/linux/kern..
git tree:       net-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1178cecc580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2e3745cb659ef5d9
dashboard link: https://syzkaller.appspot.com/bug?extid=9596c1b9df18e0ae7261
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=122efd9b980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15e99574580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/80798769614c/disk-5565acd1.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/435ecb0f1371/vmlinux-5565acd1.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7790d5f923b6/bzImage-5565acd1.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9596c1b9df18e0ae7261@syzkaller.appspotmail.com

UDPLite6: UDP-Lite is deprecated and scheduled to be removed in 2025, please contact the netdev mailing list
------------[ cut here ]------------
memcpy: detected field-spanning write (size 898) of single field "pfx->in6_u.u6_addr8" at ./include/net/ipv6.h:614 (size 16)
WARNING: CPU: 0 PID: 5838 at ./include/net/ipv6.h:614 ipv6_addr_prefix+0x124/0x1d0 include/net/ipv6.h:614
Modules linked in:
CPU: 0 UID: 0 PID: 5838 Comm: syz-executor414 Not tainted 6.15.0-rc3-syzkaller-00557-g5565acd1e6c4 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:ipv6_addr_prefix+0x124/0x1d0 include/net/ipv6.h:614
Code: cc e8 70 eb af f7 c6 05 b8 a8 59 05 01 90 b9 10 00 00 00 48 c7 c7 a0 86 7d 8c 4c 89 fe 48 c7 c2 c0 8d 7d 8c e8 4d 4a 74 f7 90 <0f> 0b 90 90 e9 33 ff ff ff e8 3e eb af f7 44 89 e6 48 c7 c7 c0 53
RSP: 0018:ffffc90003eb7920 EFLAGS: 00010246
RAX: 8f8f704687b6a900 RBX: ffff8880337f5c50 RCX: ffff88803326da00
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000002
RBP: 0000000000000000 R08: ffffc90003eb7607 R09: 1ffff920007d6ec0
R10: dffffc0000000000 R11: fffff520007d6ec1 R12: 0000000000000382
R13: 1ffff920007d6f4e R14: ffffc90003eb7a84 R15: 0000000000000382
FS:  0000555594768380(0000) GS:ffff8881260b2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055d1681c9000 CR3: 0000000078e3e000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 ip6_route_info_create+0x5cc/0xa70 net/ipv6/route.c:3810
 ip6_route_add+0x29/0x2f0 net/ipv6/route.c:3902
 ipv6_route_ioctl+0x35c/0x480 net/ipv6/route.c:4539
 inet6_ioctl+0x219/0x280 net/ipv6/af_inet6.c:577
 sock_do_ioctl+0xd9/0x300 net/socket.c:1190
 sock_ioctl+0x576/0x790 net/socket.c:1311
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa5ecea7369
Code: 48 83 c4 28 c3 e8 37 17 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff70ec1b18 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fff70ec1ce8 RCX: 00007fa5ecea7369
RDX: 0000200000000340 RSI: 000000000000890b RDI: 0000000000000003
RBP: 00007fa5ecf1a610 R08: 0000000000000000 R09: 00007fff70ec1ce8
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 00007fff70ec1cd8 R14: 0000000000000001 R15: 0000000000000001
 </TASK>


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
