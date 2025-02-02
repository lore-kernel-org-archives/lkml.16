Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D02846C
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 22:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738533681; cv=none; b=SDpLUaUIPSmYZaxVYm6Eew7HPg2jGQCKuPbtHm32GoN0xDybouGWTzGAGzDOHF7zaW6hJmAs3O8iVfzPb993CIFfmndC7L2JuUrjgzS2Id/lF3rASqcA64n4wJlHrjLM1QjNQHxHmHUP6tFGp2MpN7V6eZSjRntn1j/pu/CaUic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738533681; c=relaxed/simple;
	bh=IHnLUzUv1zgNYpcLHg+bZ3TFUi2twayN+LYiNlfxtcA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gksJrRTFBGN5jCbWXVtIvzRWDh/vXsKaTtbfRSdBGdGsV8Fl2tTPbCCA/krAJ8haT7VuYY4STMvTispO4JhHAjQto/dNlL82twrNzXritBdwoPKbWSxpNHt7IcU0rAbX+kmSafyEtPmFiVww3eHFbHudA60vMdibfshS9TCuRqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3cf64584097so28884675ab.2
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 14:01:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738533678; x=1739138478;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dP5Jft/fqxG5jD9tDv8QIPa+gKfnQisgnv1+nawUju8=;
        b=NPqeayQ+6GKaoEasUaUcRnQiVak9brB2d6GB1Jcar4wuq9MRB2AqfC27MT0hhUM1Fq
         e9sWPJp3b1MRbjD6LDFZUkV7yUXWJkGeN78NwXUSftEqZhMiAD1lEjsv4Q+d1fosHOpX
         ffIUMMKUC27zj+Re2JfkWpc+WsZrQ32k4uiP6KopFr02+Ve9zCSt+VdzZeVsbkxCSlxk
         NWhLCgcMxBrlruTJBtiOtOBw2MwkJXZmtVofGEMZcJ80IugahIIsvDIEOQ1Vs0eFlacD
         /0+Gs612YWwGX5B/yPirLFDnpa1zLFcC7noEdre6KYDN9kKEzolKLZlnDfidOBiFx5t/
         qluA==
X-Forwarded-Encrypted: i=1; AJvYcCX2qABYKZCeMselJAf0aiOwLQEnefuxEkMBPkmEtrC7cGbi4bV012/hadHfWaj8CQBRV16ax2cfC8DNo3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw7xqgLpjZK0lXA0qQD+tW3AoR017iHCujzDFiHRN2oQlQDCc7
	U/u2tplWdaDN7TDr8KZiwIShTD92oRkcaon6x7afiMvEeNZ0x6TN/4+P4L+9eo1tmMq7h4deQfD
	mb4wFQTOqVOB+XIObunWX6E7JYLqOxfo6o/FFjHJWKYV855J2yLJCXh8=
X-Google-Smtp-Source: AGHT+IE/31vwbeN8/st/bA6EdwxIedVRyFYVoRTUS4oPAEtJSt+EjwddvATfW7/KCH2jCSP+q4pEa21n+YN0U2/NcPq+Taso1onA
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:98:b0:3ce:7fc3:9f76 with SMTP id
 e9e14a558f8ab-3cffe3e527cmr168094655ab.6.1738533678463; Sun, 02 Feb 2025
 14:01:18 -0800 (PST)
Date: Sun, 02 Feb 2025 14:01:18 -0800
In-Reply-To: <000000000000a7fb55061ce6cc5a@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <679feb2e.050a0220.d7c5a.0078.GAE@google.com>
Subject: Re: [syzbot] [net?] possible deadlock in do_ipv6_setsockopt (4)
From: syzbot <syzbot+3433b5cb8b2b70933f8d@syzkaller.appspotmail.com>
To: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    c2933b2befe2 Merge tag 'net-6.14-rc1' of git://git.kernel...
git tree:       net-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=12a22eb0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d033b14aeef39158
dashboard link: https://syzkaller.appspot.com/bug?extid=3433b5cb8b2b70933f8d
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12896d18580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12c69724580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c7667ae12603/disk-c2933b2b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/944ca63002c1/vmlinux-c2933b2b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/30748115bf0b/bzImage-c2933b2b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3433b5cb8b2b70933f8d@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.13.0-syzkaller-09685-gc2933b2befe2 #0 Not tainted
------------------------------------------------------
syz-executor323/5834 is trying to acquire lock:
ffff8880352e2cd8 (sk_lock-AF_INET6){+.+.}-{0:0}, at: do_ipv6_setsockopt+0xbf7/0x3640 net/ipv6/ipv6_sockglue.c:567

but task is already holding lock:
ffffffff8fcbf088 (rtnl_mutex){+.+.}-{4:4}, at: do_ipv6_setsockopt+0x9e8/0x3640 net/ipv6/ipv6_sockglue.c:566

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (rtnl_mutex){+.+.}-{4:4}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5851
       __mutex_lock_common kernel/locking/mutex.c:585 [inline]
       __mutex_lock+0x19c/0x1010 kernel/locking/mutex.c:730
       smc_vlan_by_tcpsk+0x399/0x4e0 net/smc/smc_core.c:1908
       __smc_connect+0x296/0x1910 net/smc/af_smc.c:1520
       smc_connect+0x868/0xde0 net/smc/af_smc.c:1696
       __sys_connect_file net/socket.c:2040 [inline]
       __sys_connect+0x288/0x2d0 net/socket.c:2059
       __do_sys_connect net/socket.c:2065 [inline]
       __se_sys_connect net/socket.c:2062 [inline]
       __x64_sys_connect+0x7a/0x90 net/socket.c:2062
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (sk_lock-AF_INET6){+.+.}-{0:0}:
       check_prev_add kernel/locking/lockdep.c:3163 [inline]
       check_prevs_add kernel/locking/lockdep.c:3282 [inline]
       validate_chain+0x18ef/0x5920 kernel/locking/lockdep.c:3906
       __lock_acquire+0x1397/0x2100 kernel/locking/lockdep.c:5228
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5851
       lock_sock_nested+0x48/0x100 net/core/sock.c:3645
       do_ipv6_setsockopt+0xbf7/0x3640 net/ipv6/ipv6_sockglue.c:567
       ipv6_setsockopt+0x5d/0x170 net/ipv6/ipv6_sockglue.c:993
       do_sock_setsockopt+0x3af/0x720 net/socket.c:2298
       __sys_setsockopt net/socket.c:2323 [inline]
       __do_sys_setsockopt net/socket.c:2329 [inline]
       __se_sys_setsockopt net/socket.c:2326 [inline]
       __x64_sys_setsockopt+0x1ee/0x280 net/socket.c:2326
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(rtnl_mutex);
                               lock(sk_lock-AF_INET6);
                               lock(rtnl_mutex);
  lock(sk_lock-AF_INET6);

 *** DEADLOCK ***

1 lock held by syz-executor323/5834:
 #0: ffffffff8fcbf088 (rtnl_mutex){+.+.}-{4:4}, at: do_ipv6_setsockopt+0x9e8/0x3640 net/ipv6/ipv6_sockglue.c:566

stack backtrace:
CPU: 0 UID: 0 PID: 5834 Comm: syz-executor323 Not tainted 6.13.0-syzkaller-09685-gc2933b2befe2 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_circular_bug+0x13a/0x1b0 kernel/locking/lockdep.c:2076
 check_noncircular+0x36a/0x4a0 kernel/locking/lockdep.c:2208
 check_prev_add kernel/locking/lockdep.c:3163 [inline]
 check_prevs_add kernel/locking/lockdep.c:3282 [inline]
 validate_chain+0x18ef/0x5920 kernel/locking/lockdep.c:3906
 __lock_acquire+0x1397/0x2100 kernel/locking/lockdep.c:5228
 lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5851
 lock_sock_nested+0x48/0x100 net/core/sock.c:3645
 do_ipv6_setsockopt+0xbf7/0x3640 net/ipv6/ipv6_sockglue.c:567
 ipv6_setsockopt+0x5d/0x170 net/ipv6/ipv6_sockglue.c:993
 do_sock_setsockopt+0x3af/0x720 net/socket.c:2298
 __sys_setsockopt net/socket.c:2323 [inline]
 __do_sys_setsockopt net/socket.c:2329 [inline]
 __se_sys_setsockopt net/socket.c:2326 [inline]
 __x64_sys_setsockopt+0x1ee/0x280 net/socket.c:2326
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5f02247369
Code: 48 83 c4 28 c3 e8 37 17 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe9a248bd8 EFLAGS: 00000246 ORIG_RAX: 0000000000000036
RAX: ffffffffffffffda RBX: 00007ffe9a248da8 RCX: 00007f5f02247369
RDX: 000000000000001b RSI: 0000000000000029 RDI: 0000000000000004
RBP: 00007f5f022ba610 R08: 0000000000000000 R09: 00007ffe9a248da8
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 00007ffe9a248d98 


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
