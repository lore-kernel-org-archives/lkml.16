Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BAE256C7D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296145; cv=none; b=nTgd+lY856zFEjKNRil3TSZI23GL/ybK1R3Vbf7dKkJ8n5xVRH7guV9hy1A+5mVE5WTZYFKCMw/sjKCknVXZ87K69iFPzqDqAE1hFcP585AcwXNSBS2WvYUxk7M0lAgIdh8H1pK1yabRS+KP4fnBQ3ajH733eWrmaVh/S+B8IdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296145; c=relaxed/simple;
	bh=wuDswrfJsEWD6VPKYRQxjKp8OjxDMISLNJkaR0KDuCw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ARCRexuMUu67naImy4uWIytZt+U5N1tS28Yi2SeTpkr4pejCHD78isXaxs1HitVigUKgSbn1Ir9PZD5KkUXxDi48NpBHjpjirvBfbPzYwZ4/diytSO8ag1yAqLZsWGPY/ib13nfFQ+/+J+hl2TRwns/hoLWbRMqXJMUnKEWXJZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=nKpO7OS0; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nKpO7OS0"
X-UUID: fc3dd0ce161911f08eb9c36241bbb6fb-20250410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=qfLkVHqKOkq18YfrYBSiR6b9zZ++DxRi+Oa+0TkBEjM=;
	b=nKpO7OS0nDOpxxJQDxQcrO3vMu8k4kS2d/pDXJXcXlBGL/Iv7G3ZkUalaiFb0g0CnVP4nsBnDpqIy1ggw5qMrIP0t9bT/2P47dYRE2rzmQHc7pXI8fkR11EN/tFymE1X9yADx1NbCfZGMWm2WUXSypYhieXH5uQTe91nKz5X5Sw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:26f67fe8-e427-4d9f-929d-be0a50b70e19,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:ec39188b-0afe-4897-949e-8174746b1932,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: fc3dd0ce161911f08eb9c36241bbb6fb-20250410
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <tze-nan.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1437961012; Thu, 10 Apr 2025 22:42:11 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 10 Apr 2025 22:42:09 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 10 Apr 2025 22:42:09 +0800
From: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
To: Oleg Nesterov <oleg@redhat.com>, Christian Brauner <brauner@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>, <wsd_upstream@mediatek.com>,
	<bobule.chang@mediatek.com>, Tze-nan Wu <Tze-nan.Wu@mediatek.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, chenqiwu <chenqiwu@xiaomi.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [RFC PATCH] exit: Skip panic in do_exit() during poweroff
Date: Thu, 10 Apr 2025 22:39:37 +0800
Message-ID: <20250410143937.1829272-1-Tze-nan.Wu@mediatek.com>
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

When kernel_power_off() is invoked by a process other than the global
init (PID 1) on a specific core, other CPUs are still allowed to execute
processes, even though the userspace becomes unreliable.

If PID 1 exits due to the unreliable userspace after kernel_power_off()
invoked, the panic follow by the last thread of global init exited in
do_exit() will stop the kernel_power_off() procedure, turn a shutdown
behavior into panic flow(reboot).

Add a condition check to ensure that the panic triggered by the last
thread of the global init exiting, only occurs while:
( system_state != SYSTEM_POWER_OFF and system_state != SYSTEM_RESTART).
Otherwise, WARN() instead.

[On Android 16 with arm64 arch]
Here's a scenario where the global init exits during kernel_power_off:
If PID 1 encounters a page fault after kernel_power_off() has been
invoked, the kernel will fail to handle the page fault because the
disk(UFS) has already shut down.
Consequently, the kernel will send a SIGBUS to PID 1 to indicate the
page fault failure, and ultimately, the panic will occur after PID 1
exits due to receiving the SIGBUS.

            cpu1                           cpu2
          ----------                     ----------
    kernel_power_off() start
        UFS shutdown
            ...                	       PID 1 page fault
            ...                    page fault handle failure
            ...			             PID 1 received SIGBUS
            ...                             panic
   kernel_power_off() not done

Backtrace while PID 1 received signal 7:
   init-1 [007] d..1 41239.922385: \
      signal_generate: sig=7 errno=0 code=2 comm=init pid=1 grp=0 res=0
   init-1 [007] d..1 41239.922389: kernel_stack: <stack trace>
   => __send_signal_locked
   => send_signal_locked
   => force_sig_info_to_task
   => force_sig_fault
   => arm64_force_sig_fault
   => do_page_fault
   => do_translation_fault
   => do_mem_abort
   => el0_ia
   => el0t_64_sync_handler

Simplified kernel log:
kernel_power_off() invoked by pt_notify_thread.
[41239.526109] pt_notify_threa: reboot set flag, old value 0x********,
*.
[41239.526114] pt_notify_threa: reboot set flag new value 0x********.
UFS reject I/O after kerenl_power_off.
[41239.686411]  scsi +scsi******** apexd: sd* ******** rejecting I/O to
offline device.
Lots of I/O error & erofs error happened after kernel_power_off().
[41239.690312] apexd: I/O error, dev sdc, sector ******* op ***:(READ)
flags 0x**** phys_seg ** prio class 0.
[41239.690465] apexd: I/O error, dev sdc, sector ******* op ***:(READ)
flags 0x**** phys_seg ** prio class 0.
...
...
[41239.922265] init: erofs: (device ****): z_erofs_read_folio: read
error * @ *** of nid ********.
[41239.922341] init: erofs: (device ****): z_erofs_read_folio: read
error * @ *** of nid ********.
Finally device panic due to PID 1 received SIGBUS.
[41239.923789] init: Kernel panic - not syncing: Attempted to kill init!
exitcode=0x00000007

Fixes: 43cf75d96409 ("exit: panic before exit_mm() on global init exit")
Link: https://lore.kernel.org/all/20191219104223.xvk6ppfogoxrgmw6@wittgenstein/
Signed-off-by: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
---

I am also wondering if this patch is reasonable?

From my perspective, there are two reasons not to trigger such panic
during kernel_power_off() or kernel_restart():
  1. It is not worthwhile to interrupt kernel_power_off() by a panic
     resulted from userspace instability.
  2. The panic in do_exit() was originally designed to ensure a usable
     coredump if the last thread of the global init process exited.
	 However, capture a coredump triggered by userspace crash after
     kernel_power_off() seems not particularly useful, in my opinion.
	 
In certain scenarios, a kernel module may need to directly power off
from kernel space to protect hardware (e.g., thermal protection).
In my opinion, rather than causing a panic during kernel_power_off(),
it sounds better to allow the device to complete its power-off process.

Appreciate for any comment on this, if there's any better way to
handle this panic, please point me out.

---
 kernel/exit.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index 1dcddfe537ee..23cb6b42a1f1 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -901,11 +901,17 @@ void __noreturn do_exit(long code)
 	if (group_dead) {
 		/*
 		 * If the last thread of global init has exited, panic
-		 * immediately to get a useable coredump.
+		 * immediately to get a usable coredump, except when the
+		 * device is currently powering off or restarting.
 		 */
-		if (unlikely(is_global_init(tsk)))
-			panic("Attempted to kill init! exitcode=0x%08x\n",
-				tsk->signal->group_exit_code ?: (int)code);
+		if (unlikely(is_global_init(tsk))) {
+			if (system_state != SYSTEM_POWER_OFF &&
+			    system_state != SYSTEM_RESTART)
+				panic("Attempted to kill init! exitcode=0x%08x\n",
+				      tsk->signal->group_exit_code ?: (int)code);
+			WARN(1, "Attempted to kill init! exitcode=0x%08x\n",
+			     tsk->signal->group_exit_code ?: (int)code);
+		}
 
 #ifdef CONFIG_POSIX_TIMERS
 		hrtimer_cancel(&tsk->signal->real_timer);
-- 
2.45.2

