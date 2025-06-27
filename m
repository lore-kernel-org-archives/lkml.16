Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DB81C5496
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 19:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751052934; cv=none; b=ayJDHyA2cdg2nYKzeaFJIdqptnecZ96H/ZfRQgS1CL/EI0gR7da53Xtjlwv9gROfDaZbHYTFqV9fCfiv5q8VHz2Wz7jizTWSYdSZrpyQrLyZIbotKo1a5IKwlb4FERXv9PKgttkukinB1YfdNob3/Zv46pjNPRXCfkBRPD6L0ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751052934; c=relaxed/simple;
	bh=XWZ71At9j/2WUklkuV9lJezJrH/q69yearprkBRuJlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SDYAVvDd3xQojlLnkhZ3wFZ3z+51lbo/ODY7clBHAD3bebvozUog4sRoLjZ4nhIOgCceMND3LJNJwIMqj0OyH+bbttlUOIA7vTu7erveCwDIkmtgzlKirqWL1DhKNfevtcvicoc8plO0PkIbqNkrW1tzGvXI6cHmD/lPJF++Inw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rAA1VlR6; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rAA1VlR6"
Message-ID: <c15f999a-7fe1-463a-b9e2-ef145c3afe81@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751052929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HF+ONiVMogwkAz8tCndVDZxx3w213Qc74jG/JFzLuoI=;
	b=rAA1VlR6zeJWcBBvg9B/lvKsOn1HZANnkCnPjPB23rNAt/RbF9vlYI0wLHjHrqwR7KgS1n
	3GOdmHErELj44i6SFMjc1hVMb+svr5E/zl4fqoElJEVYTMDiEB0ajZZXRTyyiGUEL2MW3U
	4CJ1nf33vdjk7AJ0+Avf09gSbhzRL4g=
Date: Fri, 27 Jun 2025 12:35:23 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [syzbot] [rdma?] WARNING in rxe_skb_tx_dtor
To: syzbot <syzbot+8425ccfb599521edb153@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <685ee637.a00a0220.3efde.0000.GAE@google.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Yanjun.Zhu" <yanjun.zhu@linux.dev>
In-Reply-To: <685ee637.a00a0220.3efde.0000.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

#syz test: https://github.com/zhuyj/linux.git v6.16_fix_rxe_skb_tx_dtor

On 6/27/25 11:43 AM, syzbot wrote:
> Hello,
>
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> KASAN: wild-memory-access Read in __rxe_get
>
> ==================================================================
> BUG: KASAN: wild-memory-access in instrument_atomic_read include/linux/instrumented.h:68 [inline]
> BUG: KASAN: wild-memory-access in atomic_read include/linux/atomic/atomic-instrumented.h:32 [inline]
> BUG: KASAN: wild-memory-access in refcount_read include/linux/refcount.h:170 [inline]
> BUG: KASAN: wild-memory-access in __refcount_add_not_zero include/linux/refcount.h:176 [inline]
> BUG: KASAN: wild-memory-access in __refcount_inc_not_zero include/linux/refcount.h:317 [inline]
> BUG: KASAN: wild-memory-access in refcount_inc_not_zero include/linux/refcount.h:335 [inline]
> BUG: KASAN: wild-memory-access in kref_get_unless_zero include/linux/kref.h:131 [inline]
> BUG: KASAN: wild-memory-access in __rxe_get+0x79/0x1c0 drivers/infiniband/sw/rxe/rxe_pool.c:241
> Read of size 4 at addr 0006000000000210 by task kworker/u4:6/1038
>
> CPU: 0 UID: 0 PID: 1038 Comm: kworker/u4:6 Not tainted 6.16.0-rc3-syzkaller-gfa5598b27d21 #0 PREEMPT(full)
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
> Workqueue: rxe_wq do_work
> Call Trace:
>   <IRQ>
>   dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
>   kasan_report+0x118/0x150 mm/kasan/report.c:634
>   check_region_inline mm/kasan/generic.c:-1 [inline]
>   kasan_check_range+0x2b0/0x2c0 mm/kasan/generic.c:189
>   instrument_atomic_read include/linux/instrumented.h:68 [inline]
>   atomic_read include/linux/atomic/atomic-instrumented.h:32 [inline]
>   refcount_read include/linux/refcount.h:170 [inline]
>   __refcount_add_not_zero include/linux/refcount.h:176 [inline]
>   __refcount_inc_not_zero include/linux/refcount.h:317 [inline]
>   refcount_inc_not_zero include/linux/refcount.h:335 [inline]
>   kref_get_unless_zero include/linux/kref.h:131 [inline]
>   __rxe_get+0x79/0x1c0 drivers/infiniband/sw/rxe/rxe_pool.c:241
>   rxe_skb_tx_dtor+0x79/0x1e0 drivers/infiniband/sw/rxe/rxe_net.c:363
>   skb_release_head_state+0xfe/0x250 net/core/skbuff.c:1139
>   napi_consume_skb+0xd2/0x1e0 net/core/skbuff.c:-1
>   e1000_unmap_and_free_tx_resource drivers/net/ethernet/intel/e1000/e1000_main.c:1972 [inline]
>   e1000_clean_tx_irq drivers/net/ethernet/intel/e1000/e1000_main.c:3864 [inline]
>   e1000_clean+0x49d/0x2b00 drivers/net/ethernet/intel/e1000/e1000_main.c:3805
>   __napi_poll+0xc4/0x480 net/core/dev.c:7414
>   napi_poll net/core/dev.c:7478 [inline]
>   net_rx_action+0x707/0xe30 net/core/dev.c:7605
>   handle_softirqs+0x286/0x870 kernel/softirq.c:579
>   do_softirq+0xec/0x180 kernel/softirq.c:480
>   </IRQ>
>   <TASK>
>   __local_bh_enable_ip+0x17d/0x1c0 kernel/softirq.c:407
>   local_bh_enable include/linux/bottom_half.h:33 [inline]
>   rcu_read_unlock_bh include/linux/rcupdate.h:910 [inline]
>   __dev_queue_xmit+0x1cd7/0x3a70 net/core/dev.c:4740
>   neigh_output include/net/neighbour.h:539 [inline]
>   ip6_finish_output2+0x11fe/0x16a0 net/ipv6/ip6_output.c:141
>   __ip6_finish_output net/ipv6/ip6_output.c:-1 [inline]
>   ip6_finish_output+0x234/0x7d0 net/ipv6/ip6_output.c:226
>   rxe_send drivers/infiniband/sw/rxe/rxe_net.c:385 [inline]
>   rxe_xmit_packet+0x79e/0xa30 drivers/infiniband/sw/rxe/rxe_net.c:444
>   rxe_requester+0x1fea/0x3d20 drivers/infiniband/sw/rxe/rxe_req.c:805
>   rxe_sender+0x16/0x50 drivers/infiniband/sw/rxe/rxe_req.c:839
>   do_task drivers/infiniband/sw/rxe/rxe_task.c:127 [inline]
>   do_work+0x1b1/0x6c0 drivers/infiniband/sw/rxe/rxe_task.c:187
>   process_one_work kernel/workqueue.c:3238 [inline]
>   process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3321
>   worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
>   kthread+0x70e/0x8a0 kernel/kthread.c:464
>   ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>   </TASK>
> ==================================================================
>
>
> Tested on:
>
> commit:         fa5598b2 RDNA/rxe: Fix rxe_skb_tx_dtor problem
> git tree:       https://github.com/zhuyj/linux.git v6.16_fix_rxe_skb_tx_dtor
> console output: https://syzkaller.appspot.com/x/log.txt?x=16b943d4580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=79da270cec5ffd65
> dashboard link: https://syzkaller.appspot.com/bug?extid=8425ccfb599521edb153
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
>
> Note: no patches were applied.
