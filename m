Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2D63FD4
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 02:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749866737; cv=none; b=Lnup0v5diDYq0fxRaWZxlQ70Ty1DNFYOyeUDf9JH5UBH62By3obTmR5GedPYdudW+ichTNldue6jEefx4Ntg+lyetez/CuJ8kJgjgJtEvuQr28hNEIBhRLYoe4eyS2NiR0j7WVKU9mwBO52AEkmkkrWNGKMkY+Orh/fpi9FH/OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749866737; c=relaxed/simple;
	bh=0x5H4LU0a5Taw10cJMJIaOjOW0AjqTmQJgjDEt1m17k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MC8jP4a5KDc/GelkKoNUuMV/Hsm6N1FuPcvTAI1N/jDkFIQ+E4BMx7sy/DPtnn+WJlyF8Bi/zNcjXaaGUdUMkKrCcOv/o71FyM5Uju9qalb/cA/bGhX1Vimkzjfs0grUgYimkUuCl867g6PGipBARDWa6Tt0fVa3W76ETi2yQNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=rm4iv6JX; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rm4iv6JX"
X-UUID: 0bd42e4848c411f0b33aeb1e7f16c2b6-20250614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=3d8Zhx9ObiwNzJOCXqpj07GKelYT8v9Bbdj5NmJup8A=;
	b=rm4iv6JXqailfLDuFOVVmxKG7qC21pB7C6rypGQE78KqWP7+qPANaJs3AGB/Fkc1gW+N3rSal3bbMdEaUUy2eVBmIzciBNIaRKvlZUjKCmPdkG/D80gBf+qoaBUHtSlJYd3vvt7hE75Uh9ahcQ47bhU02GTscPzo4lsbsjAIOYQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:551d217c-5c9c-4707-8f05-bb08d7231846,IP:0,UR
	L:0,TC:0,Content:-5,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-35
X-CID-META: VersionHash:09905cf,CLOUDID:44cef676-7521-4364-b0ef-cd7d9c0ecbde,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:2,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0bd42e4848c411f0b33aeb1e7f16c2b6-20250614
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1071341168; Sat, 14 Jun 2025 10:05:29 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 14 Jun 2025 10:05:28 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 14 Jun 2025 10:05:28 +0800
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: jstultz <jstultz@google.com>, kuyo chang <kuyo.chang@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/1] sched/deadline: Fix fair_server runtime calculation formula
Date: Sat, 14 Jun 2025 10:04:55 +0800
Message-ID: <20250614020524.631521-1-kuyo.chang@mediatek.com>
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
The calculation formula for fair_server runtime is based on
Frequency/CPU scale-invariance.
This will cause excessive RT latency (expect absolute time).

[Analysis]
Consider the following case under a Big.LITTLE architecture:

Assume the runtime is : 50,000,000 ns, and FIE/CIE as below
FIE: 100
CIE:50
First by FIE, the runtime is scaled to 50,000,000 * 100 >> 10 = 4,882,812
Then by CIE, it is further scaled to 4,882,812 * 50 >> 10 = 238,418.

So it will scaled to 238,418 ns.

[Solution]
The runtime for fair_server should be absolute time
asis RT bandwidth control.
Fix the runtime calculation formula for the fair_server.

Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
---
 kernel/sched/deadline.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index ad45a8fea245..8bfa846cf0dc 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1504,7 +1504,10 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
 	if (dl_entity_is_special(dl_se))
 		return;
 
-	scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);
+	if (dl_se == &rq->fair_server)
+		scaled_delta_exec = delta_exec;
+	else
+		scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);
 
 	dl_se->runtime -= scaled_delta_exec;
 
@@ -1611,7 +1614,7 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
  */
 void dl_server_update_idle_time(struct rq *rq, struct task_struct *p)
 {
-	s64 delta_exec, scaled_delta_exec;
+	s64 delta_exec;
 
 	if (!rq->fair_server.dl_defer)
 		return;
@@ -1624,9 +1627,7 @@ void dl_server_update_idle_time(struct rq *rq, struct task_struct *p)
 	if (delta_exec < 0)
 		return;
 
-	scaled_delta_exec = dl_scaled_delta_exec(rq, &rq->fair_server, delta_exec);
-
-	rq->fair_server.runtime -= scaled_delta_exec;
+	rq->fair_server.runtime -= delta_exec;
 
 	if (rq->fair_server.runtime < 0) {
 		rq->fair_server.dl_defer_running = 0;
-- 
2.45.2

