Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6317A1F94D
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738571467; cv=none; b=aKzi8zTKmkIt8KeZ6k0KnvFsCxugVMBmTqq0EbQkCfRx7cayEsJG2GgNyPS+82YgGUzsM5WqcgPBtrvSNV22J/LhoqxtDv8jIEGdEQ1XmmKNlEVLOsUZmYZqY831h9NFg/Xglesjnz/u+s9ucR+xOKr9g3hGqN+6u1BkLL6AnCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738571467; c=relaxed/simple;
	bh=ZMEZssbSRxYyiNQmI8fY3mVdZizQXr/9pFOem9fRWvU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=A+/u2yeMBwR3xFhGc9gUSrCTknesRQH/AtmUijXXkKsSjeZGCVC/F68GOTtn2GEvtySQpdmygSW9XfBqh5cyNLogGMMApTTUwJabZDdAJC0ZDOBAM0dpuRVaarfJ6n6gE11oHOzvLv7JzyDslSacoD3uKmnHec67ZPogviuIQu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3cfba354f79so96784105ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 00:31:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738571464; x=1739176264;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aJi/4D3kncdnmHdMy5b9QFb5vCyijtWKZEKOQbh/JP8=;
        b=vdkA/ASXwI1mnWMtPdxW9vp7uQd4LMPLwtkzqV2YJMsvRaqbZ7Z83CWIxxWP3KjGAd
         8Wtnn1uO9vEdUqYHBAdJh1bySQYBGXsYg2lKZl0v8nv7TsDzyuNOjxeYV4Z9VPEbmEpm
         NHaPbw7pcklysCVRbxuHndbu3asE9iVPFkL5B1dyqrae5q2GCeAYOrO2zVIrOPkhnD8n
         TsskeLc/cfmnZss4dEXf2Do4plIaCbE8IuHXPcq4Blt8b+NDkqDiLJifja7LIkIHczOH
         2QigGMjY+BDbo3BhkqQFuZYi3NsKJ8LuknB7goXT/NzVoqUkTKjKqsKC2IK7rnoTrqlg
         XcDg==
X-Forwarded-Encrypted: i=1; AJvYcCUVHhYhhaijjR3vvdt1WKZWw4oVDD7nqs+DeEBJy4X1523ArpuBPGkmk47y5JkDAQrgRX2yD103vv/ydkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCFDRmKGJy/pOBdVP5zzFWIzCRPDsPlf9Fmf4I1ymqkz/QEZkx
	lryIbrmqG/DkfgfkwQ2Xu5Uimh2IehZ7fDbv9zzDBei6CrxUop17X3aSFIU6DZOQBTEAaB3b542
	zHz1sioOxlobDMR1mNZsYPRIfUoq3slQjRvATFoaT8lrpH4DM3oBL+mg=
X-Google-Smtp-Source: AGHT+IEVnQm7i657aBNthABxVrEFNpUGJkk8IqQ1mmRPdFKXccaXZ/RtbnEawC8tG1m5hrm/Lc4HKl0lfuYPKWU0dzwtt0745sm6
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b4c:b0:3cf:ce7c:b8b1 with SMTP id
 e9e14a558f8ab-3cffe447945mr229359905ab.18.1738571464567; Mon, 03 Feb 2025
 00:31:04 -0800 (PST)
Date: Mon, 03 Feb 2025 00:31:04 -0800
In-Reply-To: <20250203080449.1988-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a07ec8.050a0220.d7c5a.0084.GAE@google.com>
Subject: Re: [syzbot] [net?] possible deadlock in do_ipv6_setsockopt (4)
From: syzbot <syzbot+3433b5cb8b2b70933f8d@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
possible deadlock in smc_pnet_find_ism_resource

============================================
WARNING: possible recursive locking detected
6.13.0-syzkaller-09685-gc2933b2befe2-dirty #0 Not tainted
--------------------------------------------
syz.0.16/6653 is trying to acquire lock:
ffffffff8fcbf088 (rtnl_mutex){+.+.}-{4:4}, at: pnet_find_base_ndev net/smc/smc_pnet.c:945 [inline]
ffffffff8fcbf088 (rtnl_mutex){+.+.}-{4:4}, at: smc_pnet_find_ism_by_pnetid net/smc/smc_pnet.c:1101 [inline]
ffffffff8fcbf088 (rtnl_mutex){+.+.}-{4:4}, at: smc_pnet_find_ism_resource+0xe1/0x510 net/smc/smc_pnet.c:1152

but task is already holding lock:
ffffffff8fcbf088 (rtnl_mutex){+.+.}-{4:4}, at: smc_connect+0xb2/0xde0 net/smc/af_smc.c:1646

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(rtnl_mutex);
  lock(rtnl_mutex);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

2 locks held by syz.0.16/6653:
 #0: ffffffff8fcbf088 (rtnl_mutex){+.+.}-{4:4}, at: smc_connect+0xb2/0xde0 net/smc/af_smc.c:1646
 #1: ffff88806d868258 (sk_lock-AF_INET6){+.+.}-{0:0}, at: lock_sock include/net/sock.h:1624 [inline]
 #1: ffff88806d868258 (sk_lock-AF_INET6){+.+.}-{0:0}, at: smc_connect+0xbc/0xde0 net/smc/af_smc.c:1647

stack backtrace:
CPU: 0 UID: 0 PID: 6653 Comm: syz.0.16 Not tainted 6.13.0-syzkaller-09685-gc2933b2befe2-dirty #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_deadlock_bug+0x483/0x620 kernel/locking/lockdep.c:3039
 check_deadlock kernel/locking/lockdep.c:3091 [inline]
 validate_chain+0x15e2/0x5920 kernel/locking/lockdep.c:3893
 __lock_acquire+0x1397/0x2100 kernel/locking/lockdep.c:5228
 lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5851
 __mutex_lock_common kernel/locking/mutex.c:585 [inline]
 __mutex_lock+0x19c/0x1010 kernel/locking/mutex.c:730
 pnet_find_base_ndev net/smc/smc_pnet.c:945 [inline]
 smc_pnet_find_ism_by_pnetid net/smc/smc_pnet.c:1101 [inline]
 smc_pnet_find_ism_resource+0xe1/0x510 net/smc/smc_pnet.c:1152
 smc_find_ism_device net/smc/af_smc.c:1011 [inline]
 smc_find_proposal_devices net/smc/af_smc.c:1096 [inline]
 __smc_connect+0x391/0x1910 net/smc/af_smc.c:1526
 smc_connect+0x872/0xde0 net/smc/af_smc.c:1699
 __sys_connect_file net/socket.c:2040 [inline]
 __sys_connect+0x288/0x2d0 net/socket.c:2059
 __do_sys_connect net/socket.c:2065 [inline]
 __se_sys_connect net/socket.c:2062 [inline]
 __x64_sys_connect+0x7a/0x90 net/socket.c:2062
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fbdb618cda9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fbdb7056038 EFLAGS: 00000246 ORIG_RAX: 000000000000002a
RAX: ffffffffffffffda RBX: 00007fbdb63a5fa0 RCX: 00007fbdb618cda9
RDX: 000000000000001c RSI: 0000000020000000 RDI: 0000000000000003
RBP: 00007fbdb620e2a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fbdb63a5fa0 R15: 00007fff45686908
 </TASK>


Tested on:

commit:         c2933b2b Merge tag 'net-6.14-rc1' of git://git.kernel...
git tree:       net-next
console output: https://syzkaller.appspot.com/x/log.txt?x=17c65724580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d033b14aeef39158
dashboard link: https://syzkaller.appspot.com/bug?extid=3433b5cb8b2b70933f8d
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13691764580000

