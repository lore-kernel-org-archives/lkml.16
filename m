Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4FC130A73
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751362506; cv=none; b=Meefh7DMbOMVYtSGJ97HnCXvgT24n7c/6MQKiOvbi19/iMFWm2ooN38jQwVDKL+0y1xaICo14ns1W7nFz+JplDue2GD9eUjSIDQ8gK1UQwbCM3mH6Nf+rYINOVSUb3zQRYB5PsfcXSq0ZgY/ZmgJyjYrCLUZ6VqNeR/FeDv0Jss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751362506; c=relaxed/simple;
	bh=Iz7TndBO+sTa5OfyTf6Cc5utFDcx+HTwube/qfPfbtQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kTKg1+8mQyKzJDzF0IZqlXSveJyoM8xm3I2rs1IiR60MpwLLXSG+hhGanDU+DfjegcFYCz2o3o0UnHZgHUfuwAQXSoNV6pnfi04ALCyi0gA68Q4gKjECbt+o2iEfCxkpYhIFJPoa1Zn/9DS7izyyf2H1W4+BBuW6V7iVsKKRPLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8f78db2a565e11f0b29709d653e92f7d-20250701
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:bda8d99c-c8c0-4cf5-bf18-ce47b1485f9d,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:6493067,CLOUDID:5d3c4b2b9fd8c50812528642bfb70764,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:2,IP:nil,URL
	:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8f78db2a565e11f0b29709d653e92f7d-20250701
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 273673689; Tue, 01 Jul 2025 17:34:18 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 43B7EE008FA2;
	Tue,  1 Jul 2025 17:34:17 +0800 (CST)
X-ns-mid: postfix-6863AB98-679317848
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id E2086E008FA1;
	Tue,  1 Jul 2025 17:34:11 +0800 (CST)
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
To: xuewen.yan@unisoc.com,
	vincent.guittot@linaro.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com
Cc: rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	hongyan.xia2@arm.com,
	linux-kernel@vger.kernel.org,
	ke.wang@unisoc.com,
	di.shen@unisoc.com,
	xuewen.yan94@gmail.com,
	kprateek.nayak@amd.com,
	kuyo.chang@mediatek.com,
	juju.sung@mediatek.com,
	qyousef@layalina.io,
	Zihuan Zhang <zhangzihuan@kylinos.cn>
Subject: [PATCH v1] sched/uclamp: Skip uclamp_rq_dec() for non-final dequeue of delayed tasks
Date: Tue,  1 Jul 2025 17:34:07 +0800
Message-Id: <20250701093407.211500-1-zhangzihuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Currently, uclamp_rq_inc() skips updating the clamp aggregation for
delayed tasks unless ENQUEUE_DELAYED is set, to ensure we only track the
real enqueue of a task that was previously marked as sched_delayed.

However, the corresponding uclamp_rq_dec() path only checks
sched_delayed, and misses the DEQUEUE_DELAYED flag. As a result, we may
skip dec for a delayed task that is now being truly dequeued, leading to
uclamp aggregation mismatch.

This patch makes uclamp_rq_dec() consistent with uclamp_rq_inc() by
checking both sched_delayed and DEQUEUE_DELAYED, ensuring correct
accounting symmetry.

Fixes: 90ca9410dab2 ("sched/uclamp: Align uclamp and util_est and call be=
fore freq update")
Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
---
 kernel/sched/core.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 8988d38d46a3..99f1542cff7d 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1781,7 +1781,7 @@ static inline void uclamp_rq_inc(struct rq *rq, str=
uct task_struct *p, int flags
 		rq->uclamp_flags &=3D ~UCLAMP_FLAG_IDLE;
 }
=20
-static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
+static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p, i=
nt flags)
 {
 	enum uclamp_id clamp_id;
=20
@@ -1797,7 +1797,8 @@ static inline void uclamp_rq_dec(struct rq *rq, str=
uct task_struct *p)
 	if (unlikely(!p->sched_class->uclamp_enabled))
 		return;
=20
-	if (p->se.sched_delayed)
+	/* Skip dec if this is a delayed task not being truly dequeued */
+	if (p->se.sched_delayed && !(flags & DEQUEUE_DELAYED))
 		return;
=20
 	for_each_clamp_id(clamp_id)
@@ -2039,7 +2040,7 @@ static void __init init_uclamp(void)
=20
 #else /* !CONFIG_UCLAMP_TASK */
 static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, i=
nt flags) { }
-static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p) {=
 }
+static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p, i=
nt flags) { }
 static inline void uclamp_fork(struct task_struct *p) { }
 static inline void uclamp_post_fork(struct task_struct *p) { }
 static inline void init_uclamp(void) { }
@@ -2112,7 +2113,7 @@ inline bool dequeue_task(struct rq *rq, struct task=
_struct *p, int flags)
 	 * Must be before ->dequeue_task() because ->dequeue_task() can 'fail'
 	 * and mark the task ->sched_delayed.
 	 */
-	uclamp_rq_dec(rq, p);
+	uclamp_rq_dec(rq, p, flags);
 	return p->sched_class->dequeue_task(rq, p, flags);
 }
=20
--=20
2.25.1

