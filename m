Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108F22BD022
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751025333; cv=none; b=UiMhB5SxjMsH9/27cdIwhvBdJTvuIn1dfD3ND9TNcFINRvWUZuGt3+Cj5BVNY951uvIwVfrYjOUIv0Pfj8FXee+rsZ+QeS1euH85AzcPrnkxqIDh8LEqO+WseB5LZy0Pt59xMGR1N+rRKVigXTH8yB2ahVVEQX7s4Zq+xLp9u9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751025333; c=relaxed/simple;
	bh=EEP/GLG4BekWXC//EVgssb3St6+ihrIOm2vd/sgeleg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=qXfJQNK3aB7/VvDoKhi7UiQ6sboLSZ8hYQt2v5pBq8MOrIoc50OSJHLdW9Wuy1Ywya6/w9SXReNhWW5xKFaDq6Qm5W9MucTQaPEYw6xzRbOEV35ig5fHUqeKhF9OGPESEQjW6pEHyR4ot4LIEx4tmbVGkFb9+02K1NU0/Suw7i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3ddd03db21cso29602365ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751025331; x=1751630131;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X1zZgVQszv1UgP+eip3OXc7qhoJRPENcs8WElP/2BNU=;
        b=k3d5joAQyLeYW6JwXyEAoqkrW1V2E8Go5xkK+j55cQX9AZzfypJubtQtMyLLyrel3w
         efK7q2BsBh+feaxch0BWWnsbaIiFh7p6wzapt0Dz7AWvIGZcQP7YyC/bIgW7rbFbIND5
         +Cc792XgbFflyUcIcGiOfu8v8WHi83kCR54mpXxF2BzRnOcHZaANj1S71zYnvWFsSAOb
         Kshkbjluh+Jes/6pV+Ewmfqwn9v+vWHMbX2xtRK7gYQBxWLedCr3StH5ql0fua4z00Yh
         B00bVUtY/InCWsTW25lnvAsor6N6AmcZ1o9brqcujMA50TtFh0feXR7MYANJtN4MA2SE
         uiqA==
X-Forwarded-Encrypted: i=1; AJvYcCXZhJuOqEKIeYBE4Z6yphCWzpkbR+VYCd+3vcNQ2EQhoUm6yOwT+6CcUQNFdalxkk7yDASwY/cKsA1J+0k=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj1NXWDuevP6ljy922er/R1Y2PRa9QwFp/oke8zVUOZt1HwOQE
	upyo8CKp+559Nk8goDDC+z+nEDQM5mAiWbjKuY1563LBP7tw/JjmJIBPyt9jWB+kGUa1QsHlRVP
	/mszLdkfDKUxnSlyeDFYVgOZj1xFgUGg3UW7YiVG47JUnPHBYsr+L71czYH8=
X-Google-Smtp-Source: AGHT+IHPqVyp07Zu+EID12AGK/E9m4Yi1sBRIGrQLXZCZgqOqmLUWBGP/jvsHyHxPqgHNsHfo9SNMj49X7NQEwIF9aq4RXtbxtvI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2287:b0:3df:154d:aa5b with SMTP id
 e9e14a558f8ab-3df4ab4eac3mr31780455ab.5.1751025331299; Fri, 27 Jun 2025
 04:55:31 -0700 (PDT)
Date: Fri, 27 Jun 2025 04:55:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685e86b3.a00a0220.129264.0003.GAE@google.com>
Subject: [syzbot] [net?] WARNING in ip6_mr_output
From: syzbot <syzbot+0141c834e47059395621@syzkaller.appspotmail.com>
To: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5d4809e25903 Add linux-next specific files for 20250620
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=131c5b0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=58afc4b78b52b7e3
dashboard link: https://syzkaller.appspot.com/bug?extid=0141c834e47059395621
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=138a2dd4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=171c5b0c580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/16492bf6b788/disk-5d4809e2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7be284ded1de/vmlinux-5d4809e2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/467d717f0d9c/bzImage-5d4809e2.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0141c834e47059395621@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: net/ipv6/ip6mr.c:2376 at ip6_mr_output+0xe0b/0x1040 net/ipv6/ip6mr.c:2376, CPU#1: kworker/1:2/121
Modules linked in:
CPU: 1 UID: 0 PID: 121 Comm: kworker/1:2 Not tainted 6.16.0-rc2-next-20250620-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: wg-crypt-wg2 wg_packet_tx_worker
RIP: 0010:ip6_mr_output+0xe0b/0x1040 net/ipv6/ip6mr.c:2376
Code: f7 49 bd 00 00 00 00 00 fc ff df 48 8b 74 24 38 45 31 f6 31 ff ba 02 00 00 00 e8 c0 23 1b ff e9 a7 fd ff ff e8 b6 62 8e f7 90 <0f> 0b 90 e9 c7 f3 ff ff e8 a8 62 8e f7 90 0f 0b 90 43 80 3c 2e 00
RSP: 0018:ffffc90002dd74e0 EFLAGS: 00010293
RAX: ffffffff8a31f62a RBX: 0000000000000000 RCX: ffff88801db93c00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc90002dd7758 R08: ffffc90002dd76c7 R09: 0000000000000000
R10: ffffc90002dd7670 R11: fffff520005baed9 R12: 1ffff920005baeac
R13: dffffc0000000000 R14: ffffc90002dd7670 R15: ffff888027bea8c0
FS:  0000000000000000(0000) GS:ffff888125d26000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f04da8d0100 CR3: 000000007786c000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 ip6tunnel_xmit include/net/ip6_tunnel.h:162 [inline]
 udp_tunnel6_xmit_skb+0x640/0xad0 net/ipv6/ip6_udp_tunnel.c:112
 send6+0x5ac/0x8d0 drivers/net/wireguard/socket.c:152
 wg_socket_send_skb_to_peer+0x111/0x1d0 drivers/net/wireguard/socket.c:178
 wg_packet_create_data_done drivers/net/wireguard/send.c:251 [inline]
 wg_packet_tx_worker+0x1c8/0x7c0 drivers/net/wireguard/send.c:276
 process_one_work kernel/workqueue.c:3239 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3322
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3403
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
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
