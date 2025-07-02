Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D499A13B590
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 02:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751422499; cv=none; b=OGN9legx2KfeyjrNmHodKjXLmnTqqSiRfXwmNKBv7rnKi9MW9M8bJ4HEDao+NvYT6RFWb0oTxQE0WBZiktwHPorDJk/xzfqQ/xqra6OK3t1ckTpHtDrPY8higYVJsUM0uuDFpKtd4wRdHL9voeFKGp2+TFEsEffsrVqHW7kmlJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751422499; c=relaxed/simple;
	bh=TBkS42HeMb0lSLyyyL7FBnW7ACEZpGFDmUk6LiSWVL8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tczZ7v79vBaETivfVKuczfzSU57HRjE7ebqfM8Imaiuk+1FOHXGI/WRhnonI5ucyWoFxPkZOex/dOwOHUjjp/SnHWG8Drjt6EsE+CXD97QnSExXptQM/vuOkJa6l4rQFoWIw6NhVt1CXG8CM1i/DV62bKasIUcIlJkh2QDsxj9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=O/QON/zR; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="O/QON/zR"
X-UUID: 516180f856ea11f0b1510d84776b8c0b-20250702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=deNJWsOBY3RBK23bhwBdD1QEB5poAvITxTzNa/F4P1I=;
	b=O/QON/zRTEINtErVRVM5UEfWnf3RcFM0zRhSXVfH8P1qe+20PttTGvbczihwArj5IhD+JdJtk+corhYlTvGGCD1G8q/M1xTBJbynC7iObMgo6DlvNO4dOemYrrREgYBav8ACiXpaN7CXhwjdmbNIKcq4IvMkvRPAwFp5wvwRPig=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:e21da3dc-fdff-4ce6-b68f-7822b3facba2,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:9eb4ff7,CLOUDID:d5f8c773-15a7-4ae6-ad4b-94c27b45c266,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 516180f856ea11f0b1510d84776b8c0b-20250702
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1384517026; Wed, 02 Jul 2025 10:14:43 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 2 Jul 2025 10:14:42 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 2 Jul 2025 10:14:42 +0800
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
Subject: [PATCH v5 1/1] sched/deadline: Fix dl_server runtime calculation formula
Date: Wed, 2 Jul 2025 10:12:25 +0800
Message-ID: <20250702021440.2594736-1-kuyo.chang@mediatek.com>
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

In our testing with 6.12 based kernel on a big.LITTLE system, we were
seeing instances of RT tasks being blocked from running on the LITTLE
cpus for multiple seconds of time, apparently by the dl_server. This
far exceeds the default configured 50ms per second runtime.

This is due to the fair dl_server runtime calculation being scaled
for frequency & capacity of the cpu.

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

This smaller "accounted runtime" value is what ends up being
subtracted against the fair-server's runtime for the current period.
Thus after 50ms of real time, we've only accounted ~238us against the
fair servers runtime. This 209:1 ratio in this example means that on
the smaller cpu the fair server is allowed to continue running,
blocking RT tasks, for over 10 seconds before it exhausts its supposed
50ms of runtime.  And on other hardware configurations it can be even
worse.

For the fair deadline_server, to prevent realtime tasks from being
unexpectedly delayed, we really do want to use fixed time, and not
scaled time for smaller capacity/frequency cpus. So remove the scaling
from the fair server's accounting to fix this.

Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
Acked-by: Juri Lelli <juri.lelli@redhat.com>
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Suggested-by: John Stultz <jstultz@google.com>
Tested-by: John Stultz <jstultz@google.com>

---
v1: https://lore.kernel.org/all/20250614020524.631521-1-kuyo.chang@mediatek.com/
v2: https://lore.kernel.org/all/20250617155355.1479777-1-kuyo.chang@mediatek.com/
v3: https://lore.kernel.org/all/20250626030746.2245365-1-kuyo.chang@mediatek.com/
v4: https://lore.kernel.org/all/20250627022837.3331827-1-kuyo.chang@mediatek.com/

v1->v2
Use the dl_server flag to identify scaled or non-scaled suggested by Peter.
v2->v3
Use the dl_server(dl_se) helper function for the code refactor suggested by John.
v3->v4
Commit log cleaned up/simplified suggested by John.
v4->v5
Drop the conditional for fair_server of time_scale.
The original version of this patch(v1) is much cleaner,
suggested by John & acked by Juri.

---
 kernel/sched/deadline.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index ad45a8fea245..89019a140826 100644
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
 
@@ -1611,7 +1613,7 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
  */
 void dl_server_update_idle_time(struct rq *rq, struct task_struct *p)
 {
-	s64 delta_exec, scaled_delta_exec;
+	s64 delta_exec;
 
 	if (!rq->fair_server.dl_defer)
 		return;
@@ -1624,9 +1626,7 @@ void dl_server_update_idle_time(struct rq *rq, struct task_struct *p)
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

