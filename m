Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B9E2EF2BC
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175646; cv=none; b=Qc26ife19YpoOFysf0p3JcPNbdWukmKmoSkSBYOQPIVhfENDkAOemKn1VQqchgJxhJ/YzI0yjkvMr7w0LUIferXJEGwHPnELTyREJ7eDHFlokY/XbPoQ4TtjQFqGG6a//WHVUo7k9YAnB9WimrqP2o4YHuwdqP2U6Taz6eaSctw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175646; c=relaxed/simple;
	bh=GixHo7OCVTSD0sJSxwSZMCjsg1quwRg/ut0ejA/F6/k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JUvKf5suKa3NHe9zMVosCzBczPA8vKPi8EH8/ePuBa6dyZSTVAuaCamcCaHmHk31A5Enl1DG5jFUVZqtCWplD/ct5V/bwJezo8ye8UFtmddEesQyMHj8WojjlLz9uFnNI6AnnuBSodmyQmLVcKmPeMUtALSPfgIrGXdFEsTisj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Js1PFMfb; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Js1PFMfb"
X-UUID: 48305d404b9311f0b33aeb1e7f16c2b6-20250617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=DM70jmBk+8+pNXMrSmDw0F0d1r4Q4LzFUoMuNsxPcH4=;
	b=Js1PFMfbr+Kni92Htg/UjrRVzwKN0SJuv+R9I0eBGAeZTW5YUG0Hb9xJYsGSMVqLNxO39RVkVAxTTOsdDTwrrlSRJYnkYNlT7qZlX+W6IFjbaTGraw0itmnfbN455gI1oEY0I0+WDtOFHxPN/uTwFEhcC35k33+CaEh7WSGoIwY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:5b480e38-e146-42eb-84d7-2bc1e7194b3c,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:09905cf,CLOUDID:35561477-7521-4364-b0ef-cd7d9c0ecbde,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 48305d404b9311f0b33aeb1e7f16c2b6-20250617
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 773875663; Tue, 17 Jun 2025 23:53:59 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 17 Jun 2025 23:53:57 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 17 Jun 2025 23:53:57 +0800
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: John Stultz <jstultz@google.com>, kuyo chang <kuyo.chang@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 1/1] sched/deadline: Fix dl_server runtime calculation formula
Date: Tue, 17 Jun 2025 23:52:49 +0800
Message-ID: <20250617155355.1479777-1-kuyo.chang@mediatek.com>
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

[Symptom]
The calculation formula for dl_server runtime is based on
Frequency/capacity scale-invariance.
This will cause excessive RT latency (expect absolute time).

[Analysis]
Consider the following case under a Big.LITTLE architecture:

Assume the runtime is: 50,000,000 ns, and Frequency/capacity
scale-invariance defined as below:

Frequency scale-invariance: 100
Capacity scale-invariance: 50
First by Frequency scale-invariance,
the runtime is scaled to 50,000,000 * 100 >> 10 = 4,882,812
Then by capacity scale-invariance,
it is further scaled to 4,882,812 * 50 >> 10 = 238,418.

So it will scaled to 238,418 ns.

[Solution]
The runtime for dl_server should be fixed time
asis RT bandwidth control.
Fix the runtime calculation formula for the dl_server.

Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
Acked-by: Juri Lelli <juri.lelli@redhat.com>
Suggested-by: Peter Zijlstra <peterz@infradead.org>

v1: https://lore.kernel.org/all/20250614020524.631521-1-kuyo.chang@mediatek.com/

---
 kernel/sched/deadline.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index ad45a8fea245..f68a158d01e9 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1504,7 +1504,9 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
 	if (dl_entity_is_special(dl_se))
 		return;
 
-	scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);
+	scaled_delta_exec = delta_exec;
+	if (!dl_se->dl_server)
+		scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);
 
 	dl_se->runtime -= scaled_delta_exec;
 
@@ -1624,7 +1626,9 @@ void dl_server_update_idle_time(struct rq *rq, struct task_struct *p)
 	if (delta_exec < 0)
 		return;
 
-	scaled_delta_exec = dl_scaled_delta_exec(rq, &rq->fair_server, delta_exec);
+	scaled_delta_exec = delta_exec;
+	if (!rq->fair_server.dl_server)
+		scaled_delta_exec = dl_scaled_delta_exec(rq, &rq->fair_server, delta_exec);
 
 	rq->fair_server.runtime -= scaled_delta_exec;
 
-- 
2.45.2

