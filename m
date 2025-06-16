Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0F12857FA
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750090025; cv=none; b=f4BfNfbJL81ny8A7xID+R99gqgF4wUb6UzVjQCij5JjysiYmtgtZ6q1hwnon4c59T+D9+FCG+YIlIsF1ibxXyckpYv8PkrRKJekjM+9gKFaq702xJRFWUZLh6ICCY1wJgK5hp1YZv/lmNdxfibI/dTLPrrXPig/etbnX9GJdxx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750090025; c=relaxed/simple;
	bh=ods/arTWG7zZ2uno2X+VmD8n9DuNm4lm7lNPDCPVQEM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=sX70ny/bf19ZWs6t+0OmcHsybEPpReyUF6xmvNlVoxMyDFwWPe2B6M/QwQPCJ2doyQEZgoCW7vggrrZBZjLm3SF7UWW4/mTjemPdElxfTSIvx1NRUNrGRGCAuHLNSDYu1Np2IrqAHta+xxoIfltBP317sBEQeoTyEddLglVe7VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddcb80387dso42344455ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750090022; x=1750694822;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oyrMjgYCMoTHaFVZEjrnp+WPauvIoz+a+6ANv4xt5JQ=;
        b=e9T9TD54Xhogqrg2GMpW0mAiZH3T3nCuEnqlu+V4l/2n+E+j56c1tnGlCyPAw3jJgh
         D94yJSLM0Pcnt5V+LmZ/S+eXzyNGY0bZyHFea+llAj0M34OxnoPzs7M3AqkKrYg5NGN0
         K58BWSulJx5/dEGfDFHuNXiosh6P5mR4D7jIePOTl8SKK+vNfv5bFwx4liSL6pi9pyWV
         6/UEJBP+6YKFqFqWAhH7xyTbEI4WcIDQ3VPUkKGbvOKeyUrYecPIdfHLAIdxUYyMycDz
         Fk/UNdHwmbg7XLl44bh3Gle1AllDfznI/jWRfoRzW5JhAO7wmZ+OrtATAhodaZilNwLe
         vFyg==
X-Forwarded-Encrypted: i=1; AJvYcCXOsZjWtqRidtYPsXnIx5XduiOtgZGNVgAbbIdaYAFAOkdKB660fnBQqd00+sNXUcCpCu2dQwDc9TiKVB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRKO9/ok5u4ymcKlxxHkMRdns1pkrRnj5N4iLltVYaLI7JKjJQ
	jaAkTncsvi+Yx2YZh4oOienH+diQs2fNUDQcz2xxXslqg/ZzyMEq1f8rf97QKvRbnb8vLW4HDl3
	2gFC740aMzMAqeOlcDw4VqDVnwlbh/vs3lIChvy7ZDwI3AkY3ODbCo7DFBcI=
X-Google-Smtp-Source: AGHT+IGmzmhbQ10jKNMeBAYJc+boB0tO/bcvbxwh5R9+sXakm1D6YTGCMbDL0izvDKBz7Z1D9WlTUL0k4yqTud7rdk241oGDatiK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2787:b0:3dc:7b3d:6a45 with SMTP id
 e9e14a558f8ab-3de07a9c6a0mr103005305ab.0.1750090022305; Mon, 16 Jun 2025
 09:07:02 -0700 (PDT)
Date: Mon, 16 Jun 2025 09:07:02 -0700
In-Reply-To: <aFA-NpGpVF77Fyer@mini-arch>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68504126.a70a0220.395abc.01e4.GAE@google.com>
Subject: Re: [syzbot] [net?] WARNING in __linkwatch_sync_dev (2)
From: syzbot <syzbot+b8c48ea38ca27d150063@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, stfomichev@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING: suspicious RCU usage in bond_mii_monitor

=============================
WARNING: suspicious RCU usage
6.16.0-rc2-syzkaller-ge04c78d86a96-dirty #0 Not tainted
-----------------------------
drivers/net/bonding/bond_main.c:2736 suspicious rcu_dereference_check() usage!

other info that might help us debug this:


rcu_scheduler_active = 2, debug_locks = 1
3 locks held by kworker/u32:0/12:
 #0: ffff888044cc7948 ((wq_completion)bond0#2){+.+.}-{0:0}, at: process_one_work+0x12a2/0x1b70 kernel/workqueue.c:3213
 #1: ffffc900000f7d10 ((work_completion)(&(&bond->mii_work)->work)){+.+.}-{0:0}, at: process_one_work+0x929/0x1b70 kernel/workqueue.c:3214
 #2: ffffffff9034d128 (rtnl_mutex){+.+.}-{4:4}, at: bond_mii_monitor+0x122/0x2a20 drivers/net/bonding/bond_main.c:2966

stack backtrace:
CPU: 2 UID: 0 PID: 12 Comm: kworker/u32:0 Not tainted 6.16.0-rc2-syzkaller-ge04c78d86a96-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: bond0 bond_mii_monitor
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x16c/0x1f0 lib/dump_stack.c:120
 lockdep_rcu_suspicious+0x166/0x260 kernel/locking/lockdep.c:6871
 bond_miimon_inspect drivers/net/bonding/bond_main.c:2736 [inline]
 bond_mii_monitor+0xab6/0x2a20 drivers/net/bonding/bond_main.c:2973
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3321 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3402
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x5d7/0x6f0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: now running without any active interface!
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): link status definitely up, 10000 Mbps full duplex
bond0: (slave bond_slave_1): link status definitely up, 10000 Mbps full duplex
bond0: active interface up!
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): link status definitely up, 10000 Mbps full duplex
bond0: (slave bond_slave_1): link status definitely up, 10000 Mbps full duplex
bond0: active interface up!
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): link status definitely up, 10000 Mbps full duplex
bond0: (slave bond_slave_1): link status definitely up, 10000 Mbps full duplex
bond0: active interface up!
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: now running without any active interface!
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: now running without any active interface!
bond0: (slave bond_slave_0): link status definitely up, 10000 Mbps full duplex
bond0: (slave bond_slave_1): link status definitely up, 10000 Mbps full duplex
bond0: active interface up!
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: now running without any active interface!
bond0: (slave bond_slave_0): link status definitely up, 10000 Mbps full duplex
bond0: (slave bond_slave_1): link status definitely up, 10000 Mbps full duplex
bond0: active interface up!
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: now running without any active interface!
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down
bond0: (slave bond_slave_0): link status definitely up, 10000 Mbps full duplex
bond0: (slave bond_slave_1): link status definitely up, 10000 Mbps full duplex
bond0: active interface up!
bond0: (slave bond_slave_0): interface is now down
bond0: (slave bond_slave_1): interface is now down


Tested on:

commit:         e04c78d8 Linux 6.16-rc2
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1321e90c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4130f4d8a06c3e71
dashboard link: https://syzkaller.appspot.com/bug?extid=b8c48ea38ca27d150063
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1423490c580000

