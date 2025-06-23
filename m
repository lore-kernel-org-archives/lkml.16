Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91173C30
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750659574; cv=none; b=fRkcDcBdN6VumASVQrw+GOwchzb8y7iKgVPX4sTiNcRK/g/M4mhpt+IGb5vM1IZ+rJwW4OU1lAIEXKXaWdT38DhXP7xGHndFx5I12A+fdUBZgURN/z2o52L4MIf59lKwf8unhbys73zdE5MdCp/AuE88sOx0n0Pse11W8wie278=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750659574; c=relaxed/simple;
	bh=JmtKboUCJPrUl/MAIGRYWyqgMoDt1FAmAczpIPnweVk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CIoyALs7JBAuMNenn1+PTOEF/HdWL4aiPwcCf3gZf9QcT5C8zezlQ4OmIhslmT3aZCHaI+LHX9Islz7ppAdvlH4s6VnpUmp98dse+D66lc0QjZuFOK/RcHsvWFUP7/pNGIocgr3/VbsfPtqUhX9SkyWPGZKVVvD5TI7SnkIwUOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: fcfceee04ff911f0b29709d653e92f7d-20250623
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:479bc7f2-c752-410d-b5be-e14aa41624cd,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:6493067,CLOUDID:a565dd60d528a490771805e7873eaaa7,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:1,IP:nil,URL
	:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: fcfceee04ff911f0b29709d653e92f7d-20250623
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1920610025; Mon, 23 Jun 2025 14:19:15 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 9B17AE008FA2;
	Mon, 23 Jun 2025 14:19:15 +0800 (CST)
X-ns-mid: postfix-6858F1E3-359691196
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id BAEACE008FA1;
	Mon, 23 Jun 2025 14:19:12 +0800 (CST)
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com
Cc: linux-kernel@vger.kernel.org,
	Zihuan Zhang <zhangzihuan@kylinos.cn>
Subject: [PATCH v1] sched/fair: Fix memory leak in alloc_fair_sched_group()
Date: Mon, 23 Jun 2025 14:19:09 +0800
Message-Id: <20250623061909.13480-1-zhangzihuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

alloc_fair_sched_group() allocates per-CPU cfs_rq[] and se[] arrays
for a task group. However, if either allocation fails, or a per-CPU
allocation fails during the loop, the function may leak memory.
This patch fixes the memory leak by:
- Using sizeof(*ptr) instead of sizeof(ptr) for correctness.
- Using the existing free_fair_sched_group() function to clean up
Note: Calling free_fair_sched_group() unconditionally in the failure
path is safe, as kfree(NULL) is a no-op in the kernel. This avoids
duplicating cleanup logic and improves robustness.

Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
---
 kernel/sched/fair.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7a14da5396fb..920174245517 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13372,12 +13372,12 @@ int alloc_fair_sched_group(struct task_group *t=
g, struct task_group *parent)
 	struct cfs_rq *cfs_rq;
 	int i;
=20
-	tg->cfs_rq =3D kcalloc(nr_cpu_ids, sizeof(cfs_rq), GFP_KERNEL);
+	tg->cfs_rq =3D kcalloc(nr_cpu_ids, sizeof(*tg->cfs_rq), GFP_KERNEL);
 	if (!tg->cfs_rq)
 		goto err;
-	tg->se =3D kcalloc(nr_cpu_ids, sizeof(se), GFP_KERNEL);
+	tg->se =3D kcalloc(nr_cpu_ids, sizeof(*tg->se), GFP_KERNEL);
 	if (!tg->se)
-		goto err;
+		goto err_free_rq;
=20
 	tg->shares =3D NICE_0_LOAD;
=20
@@ -13387,7 +13387,7 @@ int alloc_fair_sched_group(struct task_group *tg,=
 struct task_group *parent)
 		cfs_rq =3D kzalloc_node(sizeof(struct cfs_rq),
 				      GFP_KERNEL, cpu_to_node(i));
 		if (!cfs_rq)
-			goto err;
+			goto err_free_rq;
=20
 		se =3D kzalloc_node(sizeof(struct sched_entity_stats),
 				  GFP_KERNEL, cpu_to_node(i));
@@ -13402,7 +13402,7 @@ int alloc_fair_sched_group(struct task_group *tg,=
 struct task_group *parent)
 	return 1;
=20
 err_free_rq:
-	kfree(cfs_rq);
+	free_fair_sched_group(tg);
 err:
 	return 0;
 }
--=20
2.25.1

