Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17CC1E5702
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 04:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747715944; cv=none; b=TqqcaPW7qBSTioTUOTMvhmAI6RHd3Kz/h2utHswq8NvabLQVF4sg7q4tmLzeTKP+2HDDRgBUlNMe3cXgIpNraTcyS06JT13/eJYHUfTIvAgJie3a6yuHBgaPyT3LaeXfnfn8H1Dw9t0lC5LMr68m1ViwF5yZ7dZ5tTwt/APSLm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747715944; c=relaxed/simple;
	bh=UIF1grcf8IULtVJLlStXNZk9oAFBg2K6h+TyjYU2MRo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BMYJQDr58KqpdicAijPy6ao7KpoleA4JqWIa6KotJ5lOFtLmPeBlECde9lnszw0jqOdDRddGxmWm+wdZvN0gwBcH0LGU3fkJV4hGVe/LDf4Pf/+YuWfKZJTF8WFaNbh4O+Rlrza3DY6HBXl1/ZCqjtuTp/ONH5YAFousm+V3/NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85b41b906b3so462863539f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 21:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747715942; x=1748320742;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RdtmkfnZ2JMj0C7OqH1FutMtf/3tuL9wLni8AUX6TL0=;
        b=DPzVWy+x5CbnrJDUPlT+nGRU5UG+d9kmftkpiQMYFwWXyHOf8LaKwJ6601z2jbtrhs
         pKHhYMTmKP4ivkkjcdp1nT9jA0jZCDnbaAFwPtYGc0OgIEDibhmz2/3HFuIx9CgfuJ8D
         8YT3m10XFWsJSbfek9VfrmJ6t8LX76hg5OdJhED4jDnEE7VEFGi9Wmk+gQC3yDDEnCwj
         ci6MUBoDmI462GQe1T57UmeBmxd1F4Ik6LmDhFbzhepjK8LJ+B6DlK2+/bFxMdZElbRE
         FJ2AG5xzdIzR9rxU0BQ0VTYjMo0Br1gp3R9aXOvIU3jbSNVCoSZkykJtF+zDNUrEKdP5
         TpjA==
X-Gm-Message-State: AOJu0YxO8cMhrZWzI4XgTJpYiIxI0qEUcNqoMVxILSUc4eSsJR3p6Nve
	w2z6JlZ9oyJCw9n+A3y0wd5p8M+Wk9iU5be7pSDwPXpMmhDSGs93PRAuNGih/MM7+8CaAsKwZCx
	fqADSgkJF0rplZBPKTCOqD1CYfHG38Y5va7q87hp6Wwt4uvRb9xlaT2kf8+w=
X-Google-Smtp-Source: AGHT+IHnfoKl/bDT2poNddsyIcUQpSxj1fbiOAkHSUplAtS+ZGNfHxP0I0FfKW6t4DxDGQ3dZgdnDZsHtHTuf1YtQXOSZTTlq/Xu
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:6a8c:b0:867:40d9:bf7e with SMTP id
 ca18e2360f4ac-86a24c8b6admr1810043439f.9.1747715941842; Mon, 19 May 2025
 21:39:01 -0700 (PDT)
Date: Mon, 19 May 2025 21:39:01 -0700
In-Reply-To: <381968B8-D95A-4925-AFB1-8B947683AFD0@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682c0765.a00a0220.7a43a.0083.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] possible deadlock in __bch2_fsck_err (2)
From: syzbot <syzbot+2c3ef91c9523c3d1a25c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, mmpgouride@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in __init_work

ODEBUG: object 000000002b138723 is on stack 00000000dac59cbe, but NOT annotated.
------------[ cut here ]------------
WARNING: CPU: 0 PID: 7170 at lib/debugobjects.c:655 debug_object_is_on_stack lib/debugobjects.c:-1 [inline]
WARNING: CPU: 0 PID: 7170 at lib/debugobjects.c:655 lookup_object_or_alloc lib/debugobjects.c:688 [inline]
WARNING: CPU: 0 PID: 7170 at lib/debugobjects.c:655 __debug_object_init+0x364/0x40c lib/debugobjects.c:743
Modules linked in:
CPU: 0 UID: 0 PID: 7170 Comm: bch-copygc/loop Not tainted 6.15.0-rc4-syzkaller-00229-gd27565abe66b #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : debug_object_is_on_stack lib/debugobjects.c:-1 [inline]
pc : lookup_object_or_alloc lib/debugobjects.c:688 [inline]
pc : __debug_object_init+0x364/0x40c lib/debugobjects.c:743
lr : debug_object_is_on_stack lib/debugobjects.c:-1 [inline]
lr : lookup_object_or_alloc lib/debugobjects.c:688 [inline]
lr : __debug_object_init+0x364/0x40c lib/debugobjects.c:743
sp : ffff80009bef7700
x29: ffff80009bef7700 x28: 0000000000000000 x27: dfff800000000000
x26: ffff80009729c000 x25: ffff0000e8709ea0 x24: 0000000000000000
x23: ffff0000dd671460 x22: 0000000000000000 x21: ffff80009715dcc0
x20: ffff80008ae5d7c0 x19: ffff80009bef7bb0 x18: 00000000ffffffff
x17: ffff800092f28000 x16: ffff80008adb72d4 x15: 0000000000000001
x14: 1ffff000137dee4c x13: 0000000000000000 x12: 0000000000000000
x11: ffff7000137dee4d x10: 0000000000ff0100 x9 : 47869bb3fecc8f00
x8 : 47869bb3fecc8f00 x7 : 0000000000000001 x6 : 0000000000000001
x5 : ffff80009bef7098 x4 : ffff80008f404fc0 x3 : ffff800082fbada4
x2 : 0000000000000001 x1 : 0000000100000001 x0 : 0000000000000050
Call trace:
 debug_object_is_on_stack lib/debugobjects.c:-1 [inline] (P)
 lookup_object_or_alloc lib/debugobjects.c:688 [inline] (P)
 __debug_object_init+0x364/0x40c lib/debugobjects.c:743 (P)
 debug_object_init+0x20/0x2c lib/debugobjects.c:779
 __init_work+0x58/0x68 kernel/workqueue.c:677
 rhashtable_init_noprof+0x734/0xa10 lib/rhashtable.c:1085
 bch2_copygc_thread+0xec/0xd40 fs/bcachefs/movinggc.c:355
 kthread+0x5fc/0x75c kernel/kthread.c:464
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847
irq event stamp: 22
hardirqs last  enabled at (21): [<ffff800083df1134>] get_random_u32+0x2d4/0x540 drivers/char/random.c:553
hardirqs last disabled at (22): [<ffff80008add7b2c>] __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:108 [inline]
hardirqs last disabled at (22): [<ffff80008add7b2c>] _raw_spin_lock_irqsave+0x2c/0x7c kernel/locking/spinlock.c:162
softirqs last  enabled at (0): [<ffff8000803a4fb0>] copy_process+0x112c/0x318c kernel/fork.c:2374
softirqs last disabled at (0): [<0000000000000000>] 0x0
---[ end trace 0000000000000000 ]---


Tested on:

commit:         d27565ab bcachefs: Fix possible console lock involved ..
git tree:       https://github.com/alanskind/bcachefs
console output: https://syzkaller.appspot.com/x/log.txt?x=162861f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1358066360ea77fb
dashboard link: https://syzkaller.appspot.com/bug?extid=2c3ef91c9523c3d1a25c
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
userspace arch: arm64

Note: no patches were applied.
