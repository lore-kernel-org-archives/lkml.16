Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FBC26BD94
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739241053; cv=none; b=oPMtchk7dsZcTtBSlN4KntcMFwcH/cJxGhmykEO0DIkxgJRFlgjppb0vL47R35InrwaiK9TZtwRqZQ3szVmcLio7vHZSNsAH3OpGSNUk5blrfgiLrTi/cf3ZRDPvSu17q2WPubqyLRNCl/10oz0NtziKtWBV0zQJz2B+VaRUYWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739241053; c=relaxed/simple;
	bh=z44Spgm3p/sgfcKiRbp7z2cHfhP9cHb4EAoXc8i5nNM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Z4ZHtzsX8co3N4ongh+HCSCBKjTI7yzNN22mBe2ZZp/bQbsUkMjkHwf6Lvo/BLPkLTpno9twGXzR/DBuk2dILbl4njpL2bdeanjd9SeLtyPoIgGwvq1hWeudUifCNK3GuFTA1/azih2/T15hEso7p02N4NK3ZHpFua4NOLh+v9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=FNLzOXu0; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FNLzOXu0"
X-UUID: 3365825ee82011efb8f9918b5fc74e19-20250211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Osz1/jocrFEzgFhLEIhFRrb4kDNRJq8rHtYsDHvteoI=;
	b=FNLzOXu0WbQTQjobIbyftOeYx/uzzERhGi1LNLmDYnZqEx0eeDKTsxmkeFe0nWljHrREa9x27uup4RBJUQemwTO33cuG/63webiu6PQIF7sNY1IxmMgutdeenTUG9DKcHxACiWsUsmLjiqhdi7ZCIKx/d3QXHC0mDXWf2tNsoF8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:fbd155f0-d9af-4c80-b6fb-b0472d8d8942,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:ef786b92-d651-4ec6-81e1-a3deb10c9ff8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 3365825ee82011efb8f9918b5fc74e19-20250211
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <bo.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1040286511; Tue, 11 Feb 2025 10:30:47 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 11 Feb 2025 10:30:45 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 11 Feb 2025 10:30:45 +0800
From: Bo Ye <bo.ye@mediatek.com>
To: Thomas Gleixner <tglx@linutronix.de>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <dicken.ding@mediatek.com>, <hanks.chen@mediatek.com>,
	<xiujuan.tan@mediatek.co>, Bosser Ye <bo.ye@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] genirq: clear IRQS_PENDING in irq descriptor
Date: Tue, 11 Feb 2025 10:30:39 +0800
Message-ID: <20250211023040.180330-1-bo.ye@mediatek.com>
X-Mailer: git-send-email 2.17.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

From: Bosser Ye <bo.ye@mediatek.com>

In the kernel-6.6 IRQ subsystem, there is a case of IRQ retrigger:
Due to the possibility of electrical signal glitches causing false interrupts for edge-triggered type IRQs,
it is necessary to clear any potential false interrupts or re-triggered interrupt signals from the interrupt
source between disabling and enabling the edge-triggered IRQ.

When the module using this IRQ may disable the IRQ as needed and then If the disabled IRQ is triggered, the IRQ
subsystem will set the istate of the corresponding IRQ descriptor to pending. After the module using this
IRQ completes other tasks, it clears the pending state on the GIC using irq_set_irqchip_state(). However,
the pending state in the IRQ descriptor's istate is not cleared, which leads to the module receiving the IRQ
again after enabling it, even though the interrupt source has not triggered, because the IRQ subsystem
retriggers the interrupt based on the pending state in the IRQ descriptor.

[ 1015.093550] [T300432] ccci_fsm: CPU: 3 PID: 432 Comm: ccci_fsm Tainted: P        W  OE      6.6.30-android15-8-o-g3d1adaff8937-4k #1 4e6ae6c76d81ac612e982b5e84c39c55b332fb77
...
[ 1015.093609] [T300432] ccci_fsm: Call trace:
[ 1015.093628] [T300432] ccci_fsm:  dump_backtrace+0xec/0x138
[ 1015.093668] [T300432] ccci_fsm:  show_stack+0x18/0x28
[ 1015.093697] [T300432] ccci_fsm:  dump_stack_lvl+0x50/0x6c
[ 1015.093728] [T300432] ccci_fsm:  dump_stack+0x18/0x24
[ 1015.093747] [T300432] ccci_fsm:  gic_retrigger+0x74/0x7c
[ 1015.093764] [T300432] ccci_fsm:  check_irq_resend+0x8c/0x16c
[ 1015.093777] [T300432] ccci_fsm:  irq_startup+0x2ec/0x360
[ 1015.093788] [T300432] ccci_fsm:  enable_irq+0x84/0xf4
[ 1015.093798] [T300432] ccci_fsm:  wdt_enable_irq+0x2c/0xec [ccci_md_all 029335d5c64293385f41211c1eb232e631274782]
[ 1015.094263] [T300432] ccci_fsm:  md_cd_start+0x34c/0x510 [ccci_md_all 029335d5c64293385f41211c1eb232e631274782]
[ 1015.094707] [T300432] ccci_fsm:  ccci_md_start+0x38/0x48 [ccci_md_all 029335d5c64293385f41211c1eb232e631274782]
[ 1015.095150] [T300432] ccci_fsm:  fsm_routine_start+0x448/0x1ed8 [ccci_md_all 029335d5c64293385f41211c1eb232e631274782]
[ 1015.095593] [T300432] ccci_fsm:  fsm_main_thread+0x20c/0xa78 [ccci_md_all 029335d5c64293385f41211c1eb232e631274782]
[ 1015.096035] [T300432] ccci_fsm:  kthread+0x110/0x1b8
[ 1015.096049] [T300432] ccci_fsm:  ret_from_fork+0x10/0x20
...
[ 1015.096067] [    C0] swapper/0: HWIRQ 107 handle_fasteoi_irq[714] set desc->istates to IRQS_PENDING // CPU execute IRQ's ISR

Solution: the corresponding upstream patch modifies the irq_set_irqchip_state(...) in the IRQ subsystem.
The purpose is to clear the pending state in the IRQ descriptor's istate when successfully clearing the
corresponding IRQ on the GIC.

Test: Stress tests have verified that the patch is effective and does not cause any side effects.

Signed-off-by: Bosser Ye <bo.ye@mediatek.com>
---
 kernel/irq/manage.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 8a936c1ffad3..ad1cefb2e5aa 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -2893,8 +2893,11 @@ int irq_set_irqchip_state(unsigned int irq, enum irqchip_irq_state which,
 #endif
 	} while (data);
 
-	if (data)
+	if (data) {
 		err = chip->irq_set_irqchip_state(data, which, val);
+		if (!err && which == IRQCHIP_STATE_PENDING && !val)
+			desc->istate &= ~IRQS_PENDING;
+	}
 
 out_unlock:
 	irq_put_desc_busunlock(desc, flags);
-- 
2.17.0

