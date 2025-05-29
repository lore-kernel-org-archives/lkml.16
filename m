Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3F22F2F
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 08:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748508390; cv=none; b=mcTjF2RLG/mmOkM4bXOhkI7DyBe3r8ShuBjQZJZYp6Jnoqd/+5SCiIcWnWnexWze0hIm9kiV5vViK1m7qpj7S7G9wsmA82nfnb7lACB+B3rLpOz3HUzgJnmmjmjs3uhpIEGv4o9ZvirmodLuS1Q1lES9GgI9KkwS9kXhYTeFHgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748508390; c=relaxed/simple;
	bh=2jDkw5oG8xAqINCZ3MIulPvpGnvIBB5NdGyoCXPHoRA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BbtBtmj8YbL+l9LV9mF2UowvWS5D9eDjANDMT8XhcTP03sivcTRy3BAtICsddDcx24u7CsLAemkbJwWavz9K7hdxWo7p4iB60TWv7mrgrZPgddeNgq9aPGJ060rR54Y3uPyxFNeyH4wteku5q50hmIyDrECIJU+OBXbubJsghUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=QVon60aX; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QVon60aX"
X-UUID: 656755b43c6911f0813e4fe1310efc19-20250529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Qrg6t/3pDIIo/J14HuIjlYHkLPkRQL268S0ybavfqxc=;
	b=QVon60aX8hWZUIEu60EMIMCb/hH0jtbLxwSxh7kacMHXnlrB8FA743CWf8WOLECJkwIwL2Dp55yFZlun9P1Jl+PfcBVkYWJ8GGbr9v5h16R4HGRgDxyypdMB9EPnuj2dsodQdzy7zqwlvsUA2Lr9QMiB7aoSRW0eaZEyXa5zZSE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:4bdc2127-7fe2-454f-9dab-4ef66bae1f98,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:b3991b58-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 656755b43c6911f0813e4fe1310efc19-20250529
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 260664174; Thu, 29 May 2025 16:46:21 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 29 May 2025 16:46:05 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 29 May 2025 16:46:18 +0800
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: kuyo chang <kuyo.chang@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/1] stop_machine: Fix migrate_swap() vs. balance_push() racing
Date: Thu, 29 May 2025 16:43:35 +0800
Message-ID: <20250529084614.885184-1-kuyo.chang@mediatek.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

From: kuyo chang <kuyo.chang@mediatek.com>

Hi guys,

It encounters sporadic failures during CPU hotplug stress test.

[Syndrome]
The kernel log shows list add fail as below.

kmemleak: list_add corruption.
prev->next should be next (ffffff82812c7a00),
but was 0000000000000000. (prev=ffffff82812c3208).

kmemleak: kernel BUG at lib/list_debug.c:34!
kmemleak: Call trace:
kmemleak:  __list_add_valid_or_report+0x11c/0x144
kmemleak:  cpu_stop_queue_work+0x440/0x474
kmemleak:  stop_one_cpu_nowait+0xe4/0x138
kmemleak:  balance_push+0x1f4/0x3e4
kmemleak:  __schedule+0x1adc/0x23bc
kmemleak:  preempt_schedule_common+0x68/0xd0
kmemleak:  preempt_schedule+0x60/0x80
kmemleak:  _raw_spin_unlock_irqrestore+0x9c/0xa0
kmemleak:  scan_gray_list+0x220/0x3e4
kmemleak:  kmemleak_scan+0x410/0x740
kmemleak:  kmemleak_scan_thread+0xb0/0xdc
kmemleak:  kthread+0x2bc/0x494
kmemleak:  ret_from_fork+0x10/0x20

[Analysis]
In the failure case, by memory dump, we find
cpu_stopper.enabled = TRUE
but the wakeq is empty(the migrate/1 is at another wakeq)
static bool cpu_stop_queue_work(unsigned int cpu, struct cpu_stop_work *work)
{
...
..
	enabled = stopper->enabled;
	if (enabled)
		__cpu_stop_queue_work(stopper, work, &wakeq);
...
...
	wake_up_q(&wakeq);  -> wakeq is empty !!
	preempt_enable();
	return enabled;
}

Through analysis of the CPU0 call trace and memory dump

   CPU0: migration/0, pid: 43, priority: 99
   Native callstack:
	vmlinux  __kern_my_cpu_offset()           <arch/arm64/include/asm/percpu.h:40>
	vmlinux  ct_state_inc(incby=8)            <include/linux/context_tracking.h:137>
	vmlinux  rcu_momentary_eqs() + 72         <kernel/rcu/tree.c:375>
	vmlinux  multi_cpu_stop() + 316           <kernel/stop_machine.c:278>
	vmlinux  cpu_stopper_thread() + 676       <kernel/stop_machine.c:563>
	vmlinux  smpboot_thread_fn(data=0) + 1188 <kernel/smpboot.c:164>
	vmlinux  kthread() + 696                  <kernel/kthread.c:389>
	vmlinux  0xFFFFFFC08005941C()             <arch/arm64/kernel/entry.S:845>

  (struct migration_swap_arg *)0xFFFFFFC08FF87A40 (
    src_task = 0xFFFFFF80FF519740 ,
    dst_task = 0xFFFFFF802A579740 ,
    src_cpu = 0x0,
    dst_cpu = 0x1)

  (struct multi_stop_data)*    0xFFFFFFC08FF87930 = (
    fn = 0xFFFFFFC0802657F4 = migrate_swap_stop,
    data = 0xFFFFFFC08FF87A40
    num_threads = 0x2,
    active_cpus = cpu_bit_bitmap[1] -> (
      bits = (0x2)),
    state = MULTI_STOP_PREPARE = 0x1,
    thread_ack = (
      counter = 0x1))

By cpu mask memory dump:
  ((const struct cpumask *)&__cpu_online_mask) (
    bits = (0xFF))
  ((const struct cpumask *)&__cpu_dying_mask)  (
    bits = (0x2))
  ((const struct cpumask *)&__cpu_active_mask)(
    bits = (0xFD))
  ((const struct cpumask *)&__cpu_possible_mask) (
    bits = (0xFF))
->Imply cpu1 is dying & non-active

So, the potential race scenario is:

	CPU0							CPU1
	// doing migrate_swap(cpu0/cpu1)
	stop_two_cpus()
							  ...
							 // doing _cpu_down()
							      sched_cpu_deactivate()
								set_cpu_active(cpu, false);
								balance_push_set(cpu, true);
	cpu_stop_queue_two_works
	    __cpu_stop_queue_work(stopper1,...);
	    __cpu_stop_queue_work(stopper2,..);
	stop_cpus_in_progress -> true
		preempt_enable();
								...
							1st balance_push
							stop_one_cpu_nowait
							cpu_stop_queue_work
							__cpu_stop_queue_work
							list_add_tail  -> 1st add push_work
							wake_up_q(&wakeq);  -> "wakeq is empty. This implies that the stopper is at wakeq@migrate_swap."
	preempt_disable
	wake_up_q(&wakeq);
	        wake_up_process // wakeup migrate/0
		    try_to_wake_up
		        ttwu_queue
		            ttwu_queue_cond ->meet below case
		                if (cpu == smp_processor_id())
			         return false;
			ttwu_do_activate
			//migrate/0 wakeup done
		wake_up_process // wakeup migrate/1
	           try_to_wake_up
		    ttwu_queue
			ttwu_queue_cond
		        ttwu_queue_wakelist
			__ttwu_queue_wakelist
			__smp_call_single_queue
	preempt_enable();

							2nd balance_push
							stop_one_cpu_nowait
							cpu_stop_queue_work
							__cpu_stop_queue_work
							list_add_tail  -> 2nd add push_work, so the double list add is detected
							...
							...
							cpu1 get ipi, do sched_ttwu_pending, wakeup migrate/1

[Solution]
Maybe add queue status tracking in __cpu_stop_queue_work to avoid the corner case?
Or don't use ttwu_queu_wakelist while wakeup migrate?

Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
---
 include/linux/stop_machine.h |  7 +++++++
 kernel/stop_machine.c        | 12 +++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/linux/stop_machine.h b/include/linux/stop_machine.h
index 3132262a404d..a0748416dd69 100644
--- a/include/linux/stop_machine.h
+++ b/include/linux/stop_machine.h
@@ -21,11 +21,18 @@ typedef int (*cpu_stop_fn_t)(void *arg);
 
 #ifdef CONFIG_SMP
 
+enum work_state {
+	WORK_INIT = 0,
+	WORK_QUEUE,
+	WORK_EXEC,
+};
+
 struct cpu_stop_work {
 	struct list_head	list;		/* cpu_stopper->works */
 	cpu_stop_fn_t		fn;
 	unsigned long		caller;
 	void			*arg;
+	enum work_state		state;
 	struct cpu_stop_done	*done;
 };
 
diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
index 5d2d0562115b..9ab6b07708e3 100644
--- a/kernel/stop_machine.c
+++ b/kernel/stop_machine.c
@@ -87,6 +87,7 @@ static void __cpu_stop_queue_work(struct cpu_stopper *stopper,
 {
 	list_add_tail(&work->list, &stopper->works);
 	wake_q_add(wakeq, stopper->thread);
+	work->state = WORK_QUEUE;
 }
 
 /* queue @work to @stopper.  if offline, @work is completed immediately */
@@ -385,7 +386,15 @@ int stop_two_cpus(unsigned int cpu1, unsigned int cpu2, cpu_stop_fn_t fn, void *
 bool stop_one_cpu_nowait(unsigned int cpu, cpu_stop_fn_t fn, void *arg,
 			struct cpu_stop_work *work_buf)
 {
-	*work_buf = (struct cpu_stop_work){ .fn = fn, .arg = arg, .caller = _RET_IP_, };
+	if (unlikely(work_buf->state == WORK_QUEUE))
+		return true;
+
+	*work_buf = (struct cpu_stop_work){
+	    .fn = fn,
+	    .arg = arg,
+	    .caller = _RET_IP_,
+	    .state = WORK_INIT
+	};
 	return cpu_stop_queue_work(cpu, work_buf);
 }
 
@@ -496,6 +505,7 @@ static void cpu_stopper_thread(unsigned int cpu)
 		work = list_first_entry(&stopper->works,
 					struct cpu_stop_work, list);
 		list_del_init(&work->list);
+		work->state = WORK_EXEC;
 	}
 	raw_spin_unlock_irq(&stopper->lock);
 
-- 
2.45.2

