Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DC1269B18
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 13:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749993107; cv=none; b=baQSfKbwcCsjLZSJ0E2pQtoarh2mB4JBMsEsAeeGv5XIfzDz+lkOLRoMTi9thzKqY8kd+Evsl7Z0TdTsCRzSqB/4sZHmoP2Hox45qorAGxDu7+dqLXcxhaqqfoEjhw9gbSLFHRnoh/5bBXCfZUWhtrsxgbiUFh3indrXNW4r/14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749993107; c=relaxed/simple;
	bh=sZkyGtyxcuB880FbyylEYqH2PXXzf7O3K9EWnD5B6rg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f+nxkB34IxjU3ah/9bnrHs5T07RYaZBcdtOaZWscE1AEPBJURK7Wlc7zwGVswmjz5boCiWxT5yyxyr8ab2XpC05sS+fO3VuJTPkC0Ll7uBTwY9/p9XUxN3aaNHlAiYxzk8v0y/PpoVgzb6sGE1VXA4ILsCmK7Rk8/wDrEGwpeTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=YbooSoYT; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YbooSoYT"
X-UUID: 4314669449ea11f0b910cdf5d4d8066a-20250615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=usl4/2l7U2zs+bKp5NBYGpcsEmlicfN2geH1QvXLaq4=;
	b=YbooSoYTj1aH4TEVM8T7MbfiKqmtJ9hHZUmSjSkF8PeYs3TYKNlQFhkRvAHDgAl77utqF6IBF5egSVcq3akAo9BAtGAdHUkY1iwdtqCVcqD9NVdkV4JxnU17f4Kes8kBKDa0BzuRUiRYEIZ4j5hiN2vNO9gO7pY/CnMm4lwKHuM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:e70d5f40-e007-40a3-9c67-9faabd2d9890,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:09905cf,CLOUDID:80de7828-fdd2-4021-9c0c-83548fdcf243,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4314669449ea11f0b910cdf5d4d8066a-20250615
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 529006175; Sun, 15 Jun 2025 21:11:34 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sun, 15 Jun 2025 21:11:13 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sun, 15 Jun 2025 21:11:31 +0800
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
	"Matthias Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: jstultz <jstultz@google.com>, kuyo chang <kuyo.chang@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [RFC PATCH 1/1] sched/deadline: Fix RT task potential starvation when expiry time passed
Date: Sun, 15 Jun 2025 21:10:56 +0800
Message-ID: <20250615131129.954975-1-kuyo.chang@mediatek.com>
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
The fair server mechanism, which is intended to prevent fair starvation
when higher-priority tasks monopolize the CPU.
Specifically, RT tasks on the runqueue may not be scheduled as expected.

[Analysis]
---------
The log "sched: DL replenish lagged too much" triggered.

By memory dump of dl_server:
--------------
    curr = 0xFFFFFF80D6A0AC00 (
      dl_server = 0xFFFFFF83CD5B1470(
        dl_runtime = 0x02FAF080,
        dl_deadline = 0x3B9ACA00,
        dl_period = 0x3B9ACA00,
        dl_bw = 0xCCCC,
        dl_density = 0xCCCC,
        runtime = 0x02FAF080,
        deadline = 0x0000082031EB0E80,
        flags = 0x0,
        dl_throttled = 0x0,
        dl_yielded = 0x0,
        dl_non_contending = 0x0,
        dl_overrun = 0x0,
        dl_server = 0x1,
        dl_server_active = 0x1,
        dl_defer = 0x1,
        dl_defer_armed = 0x0,
        dl_defer_running = 0x1,
        dl_timer = (
          node = (
            expires = 0x000008199756E700),
          _softexpires = 0x000008199756E700,
          function = 0xFFFFFFDB9AF44D30 = dl_task_timer,
          base = 0xFFFFFF83CD5A12C0,
          state = 0x0,
          is_rel = 0x0,
          is_soft = 0x0,
    clock_update_flags = 0x4,
    clock = 0x000008204A496900,

- The timer expiration time (rq->curr->dl_server->dl_timer->expires)
  is already in the past, indicating the timer has expired.
- The timer state (rq->curr->dl_server->dl_timer->state) is 0.

[Suspected Root Cause]
--------------------
The relevant code flow in the throttle path of
update_curr_dl_se() as follows:

dequeue_dl_entity(dl_se, 0);                // the DL entity is dequeued

if (unlikely(is_dl_boosted(dl_se) || !start_dl_timer(dl_se))) {
    if (dl_server(dl_se))                   // timer registration fails
        enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);//enqueue immediately
    ...
}

The failure of `start_dl_timer` is caused by attempting to register a
timer with an expiration time that is already in the past. When this
situation persists, the code repeatedly re-enqueues the DL entity
without properly replenishing or restarting the timer, resulting in RT
task may not be scheduled as expected.

[Proposed Solution]:
------------------
Instead of immediately re-enqueuing the DL entity on timer registration
failure, this change ensures the DL entity is properly replenished and
the timer is restarted, preventing RT potential starvation.

Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
---
 kernel/sched/deadline.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index ad45a8fea245..e50cb76c961b 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1556,10 +1556,12 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
 		}
 
 		if (unlikely(is_dl_boosted(dl_se) || !start_dl_timer(dl_se))) {
-			if (dl_server(dl_se))
-				enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);
-			else
+			if (dl_server(dl_se)) {
+				replenish_dl_new_period(dl_se, rq);
+				start_dl_timer(dl_se);
+			} else {
 				enqueue_task_dl(rq, dl_task_of(dl_se), ENQUEUE_REPLENISH);
+			}
 		}
 
 		if (!is_leftmost(dl_se, &rq->dl))
-- 
2.45.2

