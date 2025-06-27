Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6D6215783
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 18:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751049785; cv=none; b=GEJUt5BIZUbWxPw5o5HqTOyW454CV8a4bRI2d0LOBKiiDaJu8gnUnCYJ6M+hpIEYh5cJpakV2l+F7LRy2F29qfq9CocTJhEUtyDQTF4/wHrhRJ/tfw7xvxqtDgEeDgZ/c8cSvXRaaJOj7FQA5BUBV1nzLQVhDVcIdX22QJt8/z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751049785; c=relaxed/simple;
	bh=rnZF8L3Q5EZ19XSt7J/GSfcc3N0PJHE2K3Q35Vmq6Pg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ItaAk2Yyphsouf2fJyGuEtG6MrZMt80WEVT+gunN62mHkmabFpWdC98plAhmGGkqsF+7dX2lR0FRZTRR/sASVMUgmNT3E8gKkXoQrRCZvwf4saXZ6L1icC+rTptsD1ThNncSkvMTAHbUQjLQdKoGjvAq0M5ICkRXqudPGvHPzJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddd90ca184so19256115ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751049783; x=1751654583;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O1qQb9akbNTEDJX75WZwiooNPq0rpaHgg3Xk3vYwsWk=;
        b=HmTno3Rc4wQs9+KCArHg435TNN1OTSk4qupT/QnsQFFP5zFgvgI+QapRnnFV4l4BUh
         fgNcs9rNpucJYzYYQMYIj/ngrjjVJLCQaYYqog+3ixfXEDorioa/gFTguU3xP0xZUGgB
         Go+3iHg28VtViFS9KJetz0U3hagon3RlJGQMlhg/y/79M0UZ0q7gV2sau5DZB7xXR9vG
         gOIryvcYXOB7q26cnlBeu97jq66H/KpxITG0F/iKFwoMm5it9Mfgii5ftyJeQaxB5ujb
         e0V12XDaOjSDolvkWJO1F2ewsHWQqQbAR8NRZOaLHYM2CZByCsC1CagYd4Sg8SGo9USZ
         ge9w==
X-Gm-Message-State: AOJu0YwqJPzdaAqb/Sm2ROyaq2GVrYuSDc7F/qJTGVoB3SypVPlIL801
	84XL5c3vXWelZ92U5BE0YXQcFc3Y5JMn25+lhKyN680td7MraP6BBDof4Yrh53IgoUvL+ESWQbg
	LHKiOLxj6LqDDaEBZ1hIVVNDfLNAhyWIfvPOAF+PfekszcmUjQEUCR3+YAVA=
X-Google-Smtp-Source: AGHT+IGdOz+cNghG49r4DgnJitiJCm0oc6stRnAukLr5SOx99lr5FusVguFeDp10wBws2lA+/K0SekzolDnncdNT8WNl7ZYcKkjF
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2287:b0:3df:3bc5:bac1 with SMTP id
 e9e14a558f8ab-3df4ab5e330mr53974025ab.5.1751049783445; Fri, 27 Jun 2025
 11:43:03 -0700 (PDT)
Date: Fri, 27 Jun 2025 11:43:03 -0700
In-Reply-To: <f63acb1b-083f-4a48-8352-d07d48827330@linux.dev>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685ee637.a00a0220.3efde.0000.GAE@google.com>
Subject: Re: [syzbot] [rdma?] WARNING in rxe_skb_tx_dtor
From: syzbot <syzbot+8425ccfb599521edb153@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	yanjun.zhu@linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: wild-memory-access Read in __rxe_get

==================================================================
BUG: KASAN: wild-memory-access in instrument_atomic_read include/linux/instrumented.h:68 [inline]
BUG: KASAN: wild-memory-access in atomic_read include/linux/atomic/atomic-instrumented.h:32 [inline]
BUG: KASAN: wild-memory-access in refcount_read include/linux/refcount.h:170 [inline]
BUG: KASAN: wild-memory-access in __refcount_add_not_zero include/linux/refcount.h:176 [inline]
BUG: KASAN: wild-memory-access in __refcount_inc_not_zero include/linux/refcount.h:317 [inline]
BUG: KASAN: wild-memory-access in refcount_inc_not_zero include/linux/refcount.h:335 [inline]
BUG: KASAN: wild-memory-access in kref_get_unless_zero include/linux/kref.h:131 [inline]
BUG: KASAN: wild-memory-access in __rxe_get+0x79/0x1c0 drivers/infiniband/sw/rxe/rxe_pool.c:241
Read of size 4 at addr 0006000000000210 by task kworker/u4:6/1038

CPU: 0 UID: 0 PID: 1038 Comm: kworker/u4:6 Not tainted 6.16.0-rc3-syzkaller-gfa5598b27d21 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: rxe_wq do_work
Call Trace:
 <IRQ>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x2b0/0x2c0 mm/kasan/generic.c:189
 instrument_atomic_read include/linux/instrumented.h:68 [inline]
 atomic_read include/linux/atomic/atomic-instrumented.h:32 [inline]
 refcount_read include/linux/refcount.h:170 [inline]
 __refcount_add_not_zero include/linux/refcount.h:176 [inline]
 __refcount_inc_not_zero include/linux/refcount.h:317 [inline]
 refcount_inc_not_zero include/linux/refcount.h:335 [inline]
 kref_get_unless_zero include/linux/kref.h:131 [inline]
 __rxe_get+0x79/0x1c0 drivers/infiniband/sw/rxe/rxe_pool.c:241
 rxe_skb_tx_dtor+0x79/0x1e0 drivers/infiniband/sw/rxe/rxe_net.c:363
 skb_release_head_state+0xfe/0x250 net/core/skbuff.c:1139
 napi_consume_skb+0xd2/0x1e0 net/core/skbuff.c:-1
 e1000_unmap_and_free_tx_resource drivers/net/ethernet/intel/e1000/e1000_main.c:1972 [inline]
 e1000_clean_tx_irq drivers/net/ethernet/intel/e1000/e1000_main.c:3864 [inline]
 e1000_clean+0x49d/0x2b00 drivers/net/ethernet/intel/e1000/e1000_main.c:3805
 __napi_poll+0xc4/0x480 net/core/dev.c:7414
 napi_poll net/core/dev.c:7478 [inline]
 net_rx_action+0x707/0xe30 net/core/dev.c:7605
 handle_softirqs+0x286/0x870 kernel/softirq.c:579
 do_softirq+0xec/0x180 kernel/softirq.c:480
 </IRQ>
 <TASK>
 __local_bh_enable_ip+0x17d/0x1c0 kernel/softirq.c:407
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 rcu_read_unlock_bh include/linux/rcupdate.h:910 [inline]
 __dev_queue_xmit+0x1cd7/0x3a70 net/core/dev.c:4740
 neigh_output include/net/neighbour.h:539 [inline]
 ip6_finish_output2+0x11fe/0x16a0 net/ipv6/ip6_output.c:141
 __ip6_finish_output net/ipv6/ip6_output.c:-1 [inline]
 ip6_finish_output+0x234/0x7d0 net/ipv6/ip6_output.c:226
 rxe_send drivers/infiniband/sw/rxe/rxe_net.c:385 [inline]
 rxe_xmit_packet+0x79e/0xa30 drivers/infiniband/sw/rxe/rxe_net.c:444
 rxe_requester+0x1fea/0x3d20 drivers/infiniband/sw/rxe/rxe_req.c:805
 rxe_sender+0x16/0x50 drivers/infiniband/sw/rxe/rxe_req.c:839
 do_task drivers/infiniband/sw/rxe/rxe_task.c:127 [inline]
 do_work+0x1b1/0x6c0 drivers/infiniband/sw/rxe/rxe_task.c:187
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
==================================================================


Tested on:

commit:         fa5598b2 RDNA/rxe: Fix rxe_skb_tx_dtor problem
git tree:       https://github.com/zhuyj/linux.git v6.16_fix_rxe_skb_tx_dtor
console output: https://syzkaller.appspot.com/x/log.txt?x=16b943d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=79da270cec5ffd65
dashboard link: https://syzkaller.appspot.com/bug?extid=8425ccfb599521edb153
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Note: no patches were applied.
