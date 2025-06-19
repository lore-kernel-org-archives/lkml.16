Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095EA134BD
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750312265; cv=none; b=nBwKJCX9tYqOIMDqKai7whUo2q10dzIxdPEUxnmrJbQfz9Hk41mGdzsJ7+yTnjWtoeygL4qFOtvHMIuFo6kRpivC1szW68NGX+guHzo722XIHnkCIetdsZRD/CqxbOo6g0Zsaf6uINCCmEHBSZ5oEmRREdz1R66CmtXMFyPNuB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750312265; c=relaxed/simple;
	bh=uxdxmKmFiRLDUQkpob0fnGVWM+czNPEirGRCKLADjXY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gMXgQsz5g8QqFaW8rhrAg+wOSItIMgAtmyD35kSlZkr4ouxfXWUXkks3bYgrCUHzcQSDsyzyP7lUK974ecjUeGiigL044NKohxWQqPUf+tLEj8S9wLsQBbCFS7LOlevb3cAu5kckrVyY9nW+Jaz2ZYDdc36vAn676GjSMcwIsXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86cfe68a8bbso28032439f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 22:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750312263; x=1750917063;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/8VvibRQHlnXrHv4yLB6o3aRlHsYt05yVk9VjRVpdo0=;
        b=Pk7Lv4QJNccTaeT2TCD6fXlrqrR8w8QWp5mf2bBLU+h972NkDqspuJ96tdjfe8HaMb
         lIKjg7xeP+PW5jbgQTR6o+m3XOclSzAe7JrC5dte+RRKTv8iwVBsN0laNtP2xoiSWhlW
         RF8cPM+qZYBIyF9qxmcUjn0aF8ZQOjrda8zKA3VcwrtZP6JqKsDdxy7owAm86g3/7qfV
         M40m0Mt7yzW6cad/DNBc9GYmq0n12O3FtJZ/H01XPEWklWWtUrqmtwveIVPsjo3FaFHz
         K3mAtrSgeMPiINtDHXvkt5wR5/iHN7QeJlTd95d/TGaf8WuOzsmli15LC5wqRuHuSaWm
         49Xg==
X-Gm-Message-State: AOJu0YyM8JCKlDy89I5Jz6912JGS3kWIg3lVO5oJ16t2EL6coWoCGykC
	jbUl6sFU7oh2xR8i1Rz44BZFj16ufDtMyQZzv2sMzOMpPM3bt2O/0BtvIuMWArvZ3vZJX9MKnVC
	mw5DVEpupdvDlfAbexcFL9C21G7jeIgTb3dloEyQBbLs9KSNB4qG66wCLQMA=
X-Google-Smtp-Source: AGHT+IH6qzL4431yjtvDPBb3p+ub/lZ/GaCSzlARkFZx4w9mqz2EyQboNN38Gk+aJyZ0hnqVos8w/9g2x34dsBqefy/4rl5NsUt+
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1682:b0:864:48ec:c312 with SMTP id
 ca18e2360f4ac-875decf616dmr2373640639f.3.1750312263154; Wed, 18 Jun 2025
 22:51:03 -0700 (PDT)
Date: Wed, 18 Jun 2025 22:51:03 -0700
In-Reply-To: <20250619025207.461444-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6853a547.050a0220.216029.0188.GAE@google.com>
Subject: Re: [syzbot] [wireless?] WARNING in cfg80211_scan_done
From: syzbot <syzbot+189dcafc06865d38178d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in cfg80211_scan_done

local: 00000000ce6d1311, sr: 000000002b737337, wip: 000000003108bf1a, __ieee80211_scan_completed
r: 000000002b737337, wiphy: 000000003108bf1a, scan_req: 0000000000000000, int_scan_req: 0000000000000000, cfg80211_scan_done
------------[ cut here ]------------
WARNING: CPU: 0 PID: 226 at net/wireless/scan.c:1187 cfg80211_scan_done+0x340/0x530 net/wireless/scan.c:1186
Modules linked in:
CPU: 0 UID: 0 PID: 226 Comm: kworker/u8:5 Not tainted 6.16.0-rc1-syzkaller-00004-g39dfc971e42d-dirty #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: events_unbound cfg80211_wiphy_work
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : cfg80211_scan_done+0x340/0x530 net/wireless/scan.c:1186
lr : cfg80211_scan_done+0x340/0x530 net/wireless/scan.c:1186
sp : ffff80009b7077a0
x29: ffff80009b707820 x28: 1ffff000136e0ef8 x27: dfff800000000000
x26: ffff0000d7c281b8 x25: ffff0000d7c28700 x24: ffff0000d7c281b8
x23: ffff0000cc5a5060 x22: ffff0000d7c2a9f0 x21: ffff0000cc5a5070
x20: 1fffe000198b4a0c x19: ffff0000cc5a5000 x18: 1fffe00033802c76
x17: 3030303030303030 x16: ffff80008ae56384 x15: 0000000000000001
x14: 1fffe00033802ce2 x13: 0000000000000000 x12: 0000000000000000
x11: ffff600033802ce3 x10: 0000000000ff0100 x9 : 0000000000000000
x8 : ffff0000c5b21e80 x7 : 0000000000000001 x6 : 0000000000000001
x5 : ffff80009b707138 x4 : ffff80008f657060 x3 : ffff8000807bb518
x2 : 0000000000000001 x1 : 0000000100000000 x0 : 000000000000007c
Call trace:
 cfg80211_scan_done+0x340/0x530 net/wireless/scan.c:1186 (P)
 __ieee80211_scan_completed+0x84c/0xb00 net/mac80211/scan.c:503
 ieee80211_scan_work+0x15b8/0x1a04 net/mac80211/scan.c:1187
 cfg80211_wiphy_work+0x2a8/0x48c net/wireless/core.c:435
 process_one_work+0x7e8/0x155c kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3321 [inline]
 worker_thread+0x958/0xed8 kernel/workqueue.c:3402
 kthread+0x5fc/0x75c kernel/kthread.c:464
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847
irq event stamp: 1298636
hardirqs last  enabled at (1298635): [<ffff800080550034>] __up_console_sem kernel/printk/printk.c:344 [inline]
hardirqs last  enabled at (1298635): [<ffff800080550034>] __console_unlock+0x70/0xc4 kernel/printk/printk.c:2885
hardirqs last disabled at (1298636): [<ffff80008ae51814>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:511
softirqs last  enabled at (1298570): [<ffff80008644576c>] spin_unlock_bh include/linux/spinlock.h:396 [inline]
softirqs last  enabled at (1298570): [<ffff80008644576c>] nsim_dev_trap_report drivers/net/netdevsim/dev.c:820 [inline]
softirqs last  enabled at (1298570): [<ffff80008644576c>] nsim_dev_trap_report_work+0x67c/0x9fc drivers/net/netdevsim/dev.c:851
softirqs last disabled at (1298568): [<ffff8000864456e4>] spin_lock_bh include/linux/spinlock.h:356 [inline]
softirqs last disabled at (1298568): [<ffff8000864456e4>] nsim_dev_trap_report drivers/net/netdevsim/dev.c:816 [inline]
softirqs last disabled at (1298568): [<ffff8000864456e4>] nsim_dev_trap_report_work+0x5f4/0x9fc drivers/net/netdevsim/dev.c:851
---[ end trace 0000000000000000 ]---
3local: 00000000ce6d1311, sr: 00000000b53c744c, wip: 000000003108bf1a, ieee80211_scan_work
local: 00000000ce6d1311, sr: 00000000b53c744c, wip: 000000003108bf1a, __ieee80211_scan_completed
r: 00000000b53c744c, wiphy: 000000003108bf1a, scan_req: 00000000b53c744c, int_scan_req: 0000000000000000, cfg80211_scan_done


Tested on:

commit:         39dfc971 arm64/ptrace: Fix stack-out-of-bounds read in..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=11b6b5d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8409c4d4e51ac27
dashboard link: https://syzkaller.appspot.com/bug?extid=189dcafc06865d38178d
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15dc6370580000

