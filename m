Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F7C2CCA9
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751010377; cv=none; b=ZaxIoNMeOjlRAhOJAHewwKbyoJfFcDgFI99Q13AaDWyqcy9brYDfbHDSIeyEP12HPlwNS46rHXxAZ8aQuAnnLdoenp0alblcm9Zm92S9d7XkD82uBmXBGjaXLf+Q17Zd7AsghXAlwoDpcureiMMOOctRZln+Pd1DmUI2pXkYXrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751010377; c=relaxed/simple;
	bh=dfGDnPRiwN7EuOkD03nB8CSrfVnT+NSKNmSD92S8fXo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dwEOs0NYeplr2G71lGlPwJwwqpq8J4v+XR4hbbbVAooRFgRHKTsdCXiOJFoMjTJjVJRVTrVXJcQk01xXCafcBLSSayFYhHgmz7CMdqttuEo1TnfE/YTRW7O3K3PV5Qqq1O5YIy1X9g9iSnPOlBRaKaXBdbo7HZNjZe3V1pMw8PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c42ddc80532a11f0b29709d653e92f7d-20250627
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:475b7cd6-ffa6-4ce2-b4ce-fac83fe3678c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:6493067,CLOUDID:270913f7217740048e4aa9b8e5e63ecf,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:1,IP:nil,URL
	:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c42ddc80532a11f0b29709d653e92f7d-20250627
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 369483624; Fri, 27 Jun 2025 15:45:59 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 23F43E008FA1;
	Fri, 27 Jun 2025 15:45:59 +0800 (CST)
X-ns-mid: postfix-685E4C37-40371140
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 55A64E008FA5;
	Fri, 27 Jun 2025 15:45:55 +0800 (CST)
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	patrick.bellasi@arm.com,
	qyousef@layalina.io,
	xuewen.yan@unisoc.com
Cc: linux-kernel@vger.kernel.org,
	Zihuan Zhang <zhangzihuan@kylinos.cn>
Subject: [PATCH v1] sched/uclamp: Initialize uclamp_rq alongside rq setup in sched_init()
Date: Fri, 27 Jun 2025 15:45:35 +0800
Message-Id: <20250627074535.14064-1-zhangzihuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

uclamp_rq is currently initialized for all possible CPUs in a separate
loop within init_uclamp(). This creates a dependency on the ordering of
sched_init() and init_uclamp(), and duplicates the per-CPU iteration.

This patch simplifies the logic by moving uclamp_rq initialization into
sched_init(), immediately after each cpu_rq is initialized. This ensures
uclamprq setup is tightly coupled with rq setup and removes the need for
a redundant loop.

Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
---
 kernel/sched/core.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 8988d38d46a3..a160ec8645b2 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1998,7 +1998,7 @@ static void uclamp_post_fork(struct task_struct *p)
 	uclamp_update_util_min_rt_default(p);
 }
=20
-static void __init init_uclamp_rq(struct rq *rq)
+static void init_uclamp_rq(struct rq *rq)
 {
 	enum uclamp_id clamp_id;
 	struct uclamp_rq *uc_rq =3D rq->uclamp;
@@ -2016,10 +2016,6 @@ static void __init init_uclamp(void)
 {
 	struct uclamp_se uc_max =3D {};
 	enum uclamp_id clamp_id;
-	int cpu;
-
-	for_each_possible_cpu(cpu)
-		init_uclamp_rq(cpu_rq(cpu));
=20
 	for_each_clamp_id(clamp_id) {
 		uclamp_se_set(&init_task.uclamp_req[clamp_id],
@@ -2043,6 +2039,7 @@ static inline void uclamp_rq_dec(struct rq *rq, str=
uct task_struct *p) { }
 static inline void uclamp_fork(struct task_struct *p) { }
 static inline void uclamp_post_fork(struct task_struct *p) { }
 static inline void init_uclamp(void) { }
+static inline void init_uclamp_rq(struct rq *rq) {}
 #endif /* CONFIG_UCLAMP_TASK */
=20
 bool sched_task_on_rq(struct task_struct *p)
@@ -8586,6 +8583,7 @@ void __init sched_init(void)
 		init_cfs_rq(&rq->cfs);
 		init_rt_rq(&rq->rt);
 		init_dl_rq(&rq->dl);
+		init_uclamp_rq(rq);
 #ifdef CONFIG_FAIR_GROUP_SCHED
 		INIT_LIST_HEAD(&rq->leaf_cfs_rq_list);
 		rq->tmp_alone_branch =3D &rq->leaf_cfs_rq_list;
--=20
2.25.1

