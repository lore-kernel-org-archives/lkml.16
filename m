Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBA92367D9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 20:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749846626; cv=none; b=E/AqVc2wqMDjH6dkyN7dwd9DQxkQWKjK0/EADQKD2z5vT+yhtnytIaQLyROXy9GZ1MWxEii9z2YrG5xPeiAJQ0WxRjJyTPPfwW5QgY0A6zokC9tcvAicAYf9GoEyPsLVwUeEmazgU35wGvBXibcbQVJ1K+xEY9GIit6dm5bGbxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749846626; c=relaxed/simple;
	bh=Wx/w9AjdgBdua0CCLxzqzAIuSi/xSMUXyBDVY4umg5k=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=T9hL+nZOhhxRVymrKG+h5R8GKqRtrQwnPLf54e1jHgXU6k6dSq+DDHLxTuXmfmV78ph8VDUjS8ILqWn6wjs6dP7pKG5IlGGbVe2igSHxobODiybf6tK3UC7b+a7mXajZfdo1UFEl7E/LQzICTYvGWbdx3LAyIRnSRNbSamsCvyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3ddc5137992so29103125ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749846624; x=1750451424;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lAT0xlzsFKpAKX7I55g+k6KWgGcGGE+bWGUyodsvEb4=;
        b=KovmEgrUIGrjPwn2V0yruTgJRZXLyu85qdriIGmpyw/pj/K5OkHze9w+lTRTRDB1TP
         N1rlyzCdoJ//V5nP0/Q0kDnvt7hDM+tBiZuor01uR1roQi4nfkPTBqVlD1pLUtgGIAyL
         WPO+pe7lBduIUbHUVRlwzERrisRNU72q4BHOE5jTw7XNabFIT9sHrktig9ANWKTo3UpP
         yjBNlBbquBIVcc5dOk3RtAQFq15HrvjMl3So/IIxTHHCN56HCGp+OZu5UiwN/Q82RkmK
         Wd4DImzRwDJbCP13vao41kqBSbTjpQPqptJCzTJv+rRDfrOMX736GH1hdCniv04U/hGd
         XXkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7PhvgYL6pZWPpWd1OrKT7Vpmc8OKbGMM/e2vCAjK4C8rKMcQLv5GapXGv+wgW4LtKNDMHSgS1uU2o/hk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ+sFKZpvySUByGn1gaNIOlPIZ3picvh6hcwQW8Da3nlr6y403
	heqpGr9MsIya3AqIjZbJJFZrQhy7TEbFpp4gE34ZbLrXtaGZtZQwPi6R2/QEGRkIFPKAARRYhod
	sGRKz5ZJFGDDLHjmENucDyEYVCnWQVw2DK3wIgKS1wQzHvRM2M8bdHptHipQ=
X-Google-Smtp-Source: AGHT+IEEp/FkkUlE3BJWKdHjmhqu+GIVyYccKy1r1UGJ5mapdlfUpC9Npsm7E4bKOHXqi+3bXnHv+Y85/Y9SbdNtDlyuHyaZ3aUs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3a03:b0:3dc:76ad:7990 with SMTP id
 e9e14a558f8ab-3de07cd0417mr14484135ab.15.1749846624287; Fri, 13 Jun 2025
 13:30:24 -0700 (PDT)
Date: Fri, 13 Jun 2025 13:30:24 -0700
In-Reply-To: <684a39aa.a00a0220.1eb5f5.00fa.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684c8a60.050a0220.be214.02a6.GAE@google.com>
Subject: Re: [syzbot] [net?] WARNING in __linkwatch_sync_dev (2)
From: syzbot <syzbot+b8c48ea38ca27d150063@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, stfomichev@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    27605c8c0f69 Merge tag 'net-6.16-rc2' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17bb9d70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8e5a54165d499a9
dashboard link: https://syzkaller.appspot.com/bug?extid=b8c48ea38ca27d150063
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11a7b9d4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1421310c580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-27605c8c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ab939a8a93b4/vmlinux-27605c8c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e90d45016aac/bzImage-27605c8c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b8c48ea38ca27d150063@syzkaller.appspotmail.com

------------[ cut here ]------------
RTNL: assertion failed at ./include/net/netdev_lock.h (72)
WARNING: CPU: 2 PID: 60 at ./include/net/netdev_lock.h:72 netdev_ops_assert_locked include/net/netdev_lock.h:72 [inline]
WARNING: CPU: 2 PID: 60 at ./include/net/netdev_lock.h:72 __linkwatch_sync_dev+0x1ed/0x230 net/core/link_watch.c:279
Modules linked in:
CPU: 2 UID: 0 PID: 60 Comm: kworker/u32:3 Not tainted 6.16.0-rc1-syzkaller-00101-g27605c8c0f69 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: bond0 bond_mii_monitor
RIP: 0010:netdev_ops_assert_locked include/net/netdev_lock.h:72 [inline]
RIP: 0010:__linkwatch_sync_dev+0x1ed/0x230 net/core/link_watch.c:279
Code: 05 ff ff ff e8 94 b6 59 f8 c6 05 e9 0f 2e 07 01 90 ba 48 00 00 00 48 c7 c6 c0 8c e3 8c 48 c7 c7 60 8c e3 8c e8 94 7b 18 f8 90 <0f> 0b 90 90 e9 d6 fe ff ff 48 c7 c7 44 3b a8 90 e8 ae 86 c0 f8 e9
RSP: 0018:ffffc90000ce79f0 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffff8880363a2000 RCX: ffffffff817ae368
RDX: ffff888022148000 RSI: ffffffff817ae375 RDI: 0000000000000001
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: 1ffff9200019cf48
R13: ffff8880363a2cc5 R14: ffffffff8c5909c0 R15: ffffffff899ba310
FS:  0000000000000000(0000) GS:ffff8880d6954000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffd4122af9c CR3: 000000000e382000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 ethtool_op_get_link+0x1d/0x70 net/ethtool/ioctl.c:63
 bond_check_dev_link+0x3f9/0x710 drivers/net/bonding/bond_main.c:863
 bond_miimon_inspect drivers/net/bonding/bond_main.c:2745 [inline]
 bond_mii_monitor+0x3c0/0x2dc0 drivers/net/bonding/bond_main.c:2967
 process_one_work+0x9cf/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3321 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3402
 kthread+0x3c5/0x780 kernel/kthread.c:464
 ret_from_fork+0x5d4/0x6f0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
