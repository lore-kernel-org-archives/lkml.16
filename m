Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD10D78F39
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 20:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746820829; cv=none; b=EPbun8Vi8279YLZ2ytku9y6nk3JGnWlc4MCWGULG0m/LVluIllVwZZbqGiuEjpsx3txdCn+2A13PGBNnNnbqVPyR7KsR+k1cBXJToAiNtbiR+wbfh6uHM/LTouKSz3EhMD2Xz+elnajDx13HB37UFaXOI08DbDF6SqA2RM9o704=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746820829; c=relaxed/simple;
	bh=2aZJi90JXyrvmkIK5CBaOEyHjcCKQqsSifXJYutTtDA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Bmrlba1xvN1lpm81aUCv0sw9hp1lhlMRBH4o34O2Svrljzr5IS0Yjyi/eNuD6XlYEv4K8Q7DxeV/8giyF/UDQwK9P1KaOtOjbsMmq3wS6IwtR0UcfGpvfMCxSJdXSihCMtFOaytPCisZEwf6fMaQW63mkK/JqXWnWoiVOic6bMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-85db3356bafso434667339f.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 13:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746820827; x=1747425627;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bCQtphB0FemzCy19IwV6cQERYXbXPlbaTZmPEyFJTGI=;
        b=jfpFC7q65CfN35Poe1dy0ApI5flXa7/y9fM9hMWNXzY7Tp1odWRT9U3tIrxt2ftxTj
         7hwe14S0bbZkEpUgqm5O4yuSiXDOvLQih079C7xnzOH2CGVK9VPNxCDh8jVaNLigXxub
         l4ynGr5o9uft3lzQuZ8i0Hf5yjA4m5PBan8IT+pOwSjt9u0h9WuDlMD01oktZAE4pvzE
         5O5cXTLqkPIlQDU0D3l3o4In0ynoOTm6Re0+z81cBlbsFbPIdLszR79nS358aCmDiSAH
         Ty4e3fGMFs4i1uaaVZoQ+xNXxybpOT+QNmj78hRoA4ZdaqaYAUO+XtqsdgTPSGznSN25
         WbEg==
X-Forwarded-Encrypted: i=1; AJvYcCVv0qxlqcdDNM0VSeio9bXeEFfhIWV8MAr7nLsi4nk8b4GGvqL4jpSnBSOMN8sTRpXBN6NX3HikjugCk7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiCGzRfeYQFXJ/Fp4NiaisLwCLa0gGx9C66XhxUCkJy+VW0xfd
	dRRP1sEIlUfSmn0zG2ubjt0T0ZasQJNAo+COztjGr/KY70rjQ7gc45c8rEOkILn31QOaNeBSFkw
	qJqD3cZgeLwynaoTn2ZqUOlaWoh/jNhdHtp25KYGIZYyq0LHNKImZDow=
X-Google-Smtp-Source: AGHT+IFS1QqSUbqR7M7CBn7/jSPir9EcUhhf7mriUS+G5//b7VHIh2HGn9UpRPzgIvf03d2pRHHD+iUCvyv3SGjcENr4tG5dY9JM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3425:b0:867:d48:342b with SMTP id
 ca18e2360f4ac-867636223a2mr517642539f.11.1746820827029; Fri, 09 May 2025
 13:00:27 -0700 (PDT)
Date: Fri, 09 May 2025 13:00:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681e5edb.050a0220.a19a9.013e.GAE@google.com>
Subject: [syzbot] [net?] KMSAN: uninit-value in __ipv6_dev_mc_inc (2)
From: syzbot <syzbot+3735d5f00e991698985a@syzkaller.appspotmail.com>
To: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    02ddfb981de8 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=149d2cf4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9dc42c34a3f5c357
dashboard link: https://syzkaller.appspot.com/bug?extid=3735d5f00e991698985a
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5ca57f5a3f77/disk-02ddfb98.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3f23cbc11e68/vmlinux-02ddfb98.xz
kernel image: https://storage.googleapis.com/syzbot-assets/73e63afac354/bzImage-02ddfb98.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3735d5f00e991698985a@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in __ipv6_dev_mc_inc+0x4f0/0x1640 net/ipv6/mcast.c:966
 __ipv6_dev_mc_inc+0x4f0/0x1640 net/ipv6/mcast.c:966
 ipv6_dev_mc_inc+0x38/0x50 net/ipv6/mcast.c:997
 addrconf_join_solict net/ipv6/addrconf.c:2242 [inline]
 addrconf_dad_begin net/ipv6/addrconf.c:4100 [inline]
 addrconf_dad_work+0x401/0x1d10 net/ipv6/addrconf.c:4228
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xb97/0x1d90 kernel/workqueue.c:3319
 worker_thread+0xedf/0x1590 kernel/workqueue.c:3400
 kthread+0xd59/0xf00 kernel/kthread.c:464
 ret_from_fork+0x6e/0x90 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Local variable maddr.i.i created at:
 addrconf_join_solict net/ipv6/addrconf.c:2236 [inline]
 addrconf_dad_begin net/ipv6/addrconf.c:4100 [inline]
 addrconf_dad_work+0x244/0x1d10 net/ipv6/addrconf.c:4228
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xb97/0x1d90 kernel/workqueue.c:3319

CPU: 1 UID: 0 PID: 3845 Comm: kworker/u8:19 Not tainted 6.15.0-rc3-syzkaller-00094-g02ddfb981de8 #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/29/2025
Workqueue: ipv6_addrconf addrconf_dad_work
=====================================================


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
