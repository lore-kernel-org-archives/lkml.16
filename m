Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE971917FB
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 03:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750907323; cv=none; b=PkMp0ymt9is/KoUUQiRM7hdDF44BitfQrRFSQcvLu/waRkLFY2ZYiuq04L/9V7hCEaPCFv4h3F85W3PBGzFCR19T013eR5H6aCSwItoxFjjixitoFpFKKIJBDRY7mYvfq6I+f8NF8wcM/dbZyUuXWYPNmFz33I0ZfRUNWotRqBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750907323; c=relaxed/simple;
	bh=3mwJAZrUJbuN6AFLWqoTj0MvqBch68VPPxW3p8fwg8I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WK/mBzmeIrPCpi2j9ePC3ESzzveN8wcACM9P7KnG9B70SuNUrWFr/u1MqdkJzo/gmBfpM+711OQK6eD8XAEdhtcuoZdYlzdB48ltZ8JMVPq/Z8504vqvvi1OwEEPMYZH1UBDWcHlFEB88AQt/WEShYrsloVOhLnB8cXh01w9Xgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=JQ14nGus; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JQ14nGus"
X-UUID: d6742c46523a11f0b910cdf5d4d8066a-20250626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=wXFYblXOa8sAjKJvpfnO+lgSgX7PZc4bUh7Zp2/KkE8=;
	b=JQ14nGusReL5OTZz9bAg21lyPikedxotCuc6yhHN66DFHE9uf1yv56ITcMKiquV4neNGwG7HIIg1QbbXcR5tAM3qQbdS26ACgtSMLamOrTnXhCcfupvW1xiFYCSHrO7UhRBYo+PNrcSfwiSJeX7uCT5aIZ0O3dKUQsM/EtDn73Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:e1c8bcc4-1156-42ef-b120-c0356c18983e,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:9eb4ff7,CLOUDID:5ab0a55f-2aa0-4c76-8faa-804d844c7164,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d6742c46523a11f0b910cdf5d4d8066a-20250626
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 832171581; Thu, 26 Jun 2025 11:08:30 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 26 Jun 2025 11:08:28 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 26 Jun 2025 11:08:28 +0800
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
	"Matthias Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: John Stultz <jstultz@google.com>, kuyo chang <kuyo.chang@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v3 1/1] sched/deadline: Fix dl_server runtime calculation formula
Date: Thu, 26 Jun 2025 11:07:17 +0800
Message-ID: <20250626030746.2245365-1-kuyo.chang@mediatek.com>
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
Suggested-by: John Stultz <jstultz@google.com>
Tested-by: John Stultz <jstultz@google.com>

v1: https://lore.kernel.org/all/20250614020524.631521-1-kuyo.chang@mediatek.com/
v2: https://lore.kernel.org/all/20250617155355.1479777-1-kuyo.chang@mediatek.com/

Change-Id: Iaaa1ec78f405586c22ba56230ef1143206daa2d0
---
 kernel/sched/deadline.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index ad45a8fea245..96a21f38fcc3 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1504,7 +1504,9 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
 	if (dl_entity_is_special(dl_se))
 		return;
 
-	scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);
+	scaled_delta_exec = delta_exec;
+	if (!dl_server(dl_se))
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

