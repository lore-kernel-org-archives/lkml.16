Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D87F2D4B51
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751534095; cv=none; b=ogMq5BXMv7BbOXSBioDp4e6v/nXZLd88L/0QcM6iWUG2z6VtzZk+vk8ZkDsaKI6Rdh5ZP8FN0hxDxJoYM3pvYpsljAkJtlPFwQzxhWqzJ6YvIu8ayQRZJKsQyMjrLgMXQI28dGxuL829XGKuD6DKIzK5ZJEXuhCtMgYAnSjayHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751534095; c=relaxed/simple;
	bh=s3VUtHmPjct842E1v4IeUqWB0HGSRJlrlYaAQOOIcjs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VPiewrTo5YwPC33yoqVGZzQvez8/k2K58yNcufl4iDU2SKH9ahADiF8xhldg1sVyUVe+vjAvN/jh9JlKCkwxNTG/3zUsS+hK298igsnnF6j3nMQihd9ox7O3/3vkN07+GlkR28iA2K6YcYWZ6SLYYmT1+dWp6Q4OQ6CZsVYUM8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 291bb16857ee11f0b29709d653e92f7d-20250703
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:6be4beca-0aa8-4e8f-8a4c-134434d22d73,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:619065f3335f1fe002877f5bfface112,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 291bb16857ee11f0b29709d653e92f7d-20250703
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 265518452; Thu, 03 Jul 2025 17:14:45 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id E8964E008FA2;
	Thu,  3 Jul 2025 17:14:44 +0800 (CST)
X-ns-mid: postfix-68664A04-801599893
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 8F5BCE008FA1;
	Thu,  3 Jul 2025 17:14:40 +0800 (CST)
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
Subject: [PATCH v1] sched/uclamp: Exclude kernel threads from uclamp logic
Date: Thu,  3 Jul 2025 17:14:37 +0800
Message-Id: <20250703091437.79861-1-zhangzihuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Kernel threads (PF_KTHREAD) are not subject to user-defined utilization
clamping. They do not represent user workloads and should not participate
in any uclamp logic, including:

 - clamp initialization during fork/post-fork
 - effective clamp value computation
 - runtime aggregation (uclamp_rq_inc/dec)

Allowing kernel threads into these paths may pollute the rq->uclamp[]
statistics, mislead schedutil governor's frequency selection, and
complicate debugging or trace interpretation.

This patch ensures that:
 - uclamp_fork() and uclamp_post_fork() skip kernel threads
 - uclamp_eff_value() return default values
 - uclamp_rq_inc() and uclamp_rq_dec() skip kernel threads

This aligns the semantics of uclamp with its original intent:
user-space task-specific clamping.

dmesg in uclamp_rq_inc_id:
[   76.373903] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:0 value=
:0 kthread:1
[   76.375905] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:1 val=
ue:1024 kthread:1
[   76.379837] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:0 val=
ue:0 kthread:1
[   76.379839] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:1 val=
ue:1024 kthread:1
[   76.379839] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:0 value=
:0 kthread:1
[   76.379841] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:1 value=
:1024 kthread:1
[   76.383897] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:0 value=
:0 kthread:1
[   76.383897] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:0 val=
ue:0 kthread:1
[   76.383900] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:1 value=
:1024 kthread:1
[   76.383901] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:1 val=
ue:1024 kthread:1
[   76.387885] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:0 value=
:0 kthread:1
[   76.387885] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:0 val=
ue:0 kthread:1
[   76.387888] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:1 val=
ue:1024 kthread:1
[   76.387889] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:1 value=
:1024 kthread:1
[   76.388139] uclamp_rq_inc_id: task:jbd2/sda3-8 pid:316 clamp_id:0 valu=
e:0 kthread:1
[   76.388140] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:0 val=
ue:0 kthread:1
[   76.388142] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:1 val=
ue:1024 kthread:1
[   76.388143] uclamp_rq_inc_id: task:jbd2/sda3-8 pid:316 clamp_id:1 valu=
e:1024 kthread:1
[   76.388169] uclamp_rq_inc_id: task:kworker/u48:6 pid:93 clamp_id:0 val=
ue:0 kthread:1
[   76.388171] uclamp_rq_inc_id: task:kworker/u48:6 pid:93 clamp_id:1 val=
ue:1024 kthread:1
[   76.388891] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:0 value=
:0 kthread:1
[   76.388893] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:1 value=
:1024 kthread:1
[   76.392900] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:0 value=
:0 kthread:1
[   76.392902] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:1 value=
:1024 kthread:1
[   76.398850] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:0 val=
ue:0 kthread:1
[   76.398852] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:1 val=
ue:1024 kthread:1
[   76.401880] uclamp_rq_inc_id: task:ksoftirqd/8 pid:67 clamp_id:0 value=
:0 kthread:1
[   76.401883] uclamp_rq_inc_id: task:ksoftirqd/8 pid:67 clamp_id:1 value=
:1024 kthread:1
[   76.409053] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:0 val=
ue:0 kthread:1
[   76.409054] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:1 val=
ue:1024 kthread:1
[   76.410881] uclamp_rq_inc_id: task:kworker/u48:10 pid:97 clamp_id:0 va=
lue:0 kthread:1
[   76.410884] uclamp_rq_inc_id: task:kworker/u48:10 pid:97 clamp_id:1 va=
lue:1024 kthread:1
[   76.419947] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:0 val=
ue:0 kthread:1
[   76.419949] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:1 val=
ue:1024 kthread:1
[   76.419976] uclamp_rq_inc_id: task:kworker/u48:6 pid:93 clamp_id:0 val=
ue:0 kthread:1
[   76.419979] uclamp_rq_inc_id: task:kworker/u48:6 pid:93 clamp_id:1 val=
ue:1024 kthread:1
[   76.420119] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:0 val=
ue:0 kthread:1
[   76.420121] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:1 val=
ue:1024 kthread:1
[   76.420642] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:0 val=
ue:0 kthread:1
[   76.420644] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:1 val=
ue:1024 kthread:1
[   76.434914] uclamp_rq_inc_id: task:kcompactd0 pid:108 clamp_id:0 value=
:0 kthread:1
[   76.434916] uclamp_rq_inc_id: task:kcompactd0 pid:108 clamp_id:1 value=
:1024 kthread:1
[   76.447689] uclamp_rq_inc_id: task:kworker/3:2 pid:244 clamp_id:0 valu=
e:0 kthread:1
[   76.447691] uclamp_rq_inc_id: task:kworker/3:2 pid:244 clamp_id:1 valu=
e:1024 kthread:1
[   76.447705] uclamp_rq_inc_id: task:ksoftirqd/3 pid:37 clamp_id:0 value=
:0 kthread:1
[   76.447707] uclamp_rq_inc_id: task:ksoftirqd/3 pid:37 clamp_id:1 value=
:1024 kthread:1
[   76.448809] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:0 value=
:0 kthread:1
[   76.448811] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:1 value=
:1024 kthread:1
[   76.451260] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:0 val=
ue:0 kthread:1
[   76.451263] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:1 val=
ue:1024 kthread:1
[   76.452806] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:0 value=
:0 kthread:1
[   76.452808] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:1 value=
:1024 kthread:1
[   76.488052] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:0 val=
ue:0 kthread:1
[   76.488054] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:1 val=
ue:1024 kthread:1
[   76.488767] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:0 val=
ue:0 kthread:1
[   76.488770] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:1 val=
ue:1024 kthread:1
[   76.490847] uclamp_rq_inc_id: task:kworker/3:2 pid:244 clamp_id:0 valu=
e:0 kthread:1
[   76.490848] uclamp_rq_inc_id: task:kworker/2:1 pid:143 clamp_id:0 valu=
e:0 kthread:1
[   76.490849] uclamp_rq_inc_id: task:kworker/1:3 pid:462 clamp_id:0 valu=
e:0 kthread:1
[   76.490848] uclamp_rq_inc_id: task:kworker/7:2 pid:687 clamp_id:0 valu=
e:0 kthread:1
[   76.490849] uclamp_rq_inc_id: task:kworker/11:1 pid:146 clamp_id:0 val=
ue:0 kthread:1
[   76.490850] uclamp_rq_inc_id: task:kworker/2:1 pid:143 clamp_id:1 valu=
e:1024 kthread:1
[   76.490851] uclamp_rq_inc_id: task:kworker/3:2 pid:244 clamp_id:1 valu=
e:1024 kthread:1
[   76.490851] uclamp_rq_inc_id: task:kworker/11:1 pid:146 clamp_id:1 val=
ue:1024 kthread:1
[   76.490851] uclamp_rq_inc_id: task:kworker/7:2 pid:687 clamp_id:1 valu=
e:1024 kthread:1
[   76.490853] uclamp_rq_inc_id: task:kworker/1:3 pid:462 clamp_id:1 valu=
e:1024 kthread:1
[   76.490857] uclamp_rq_inc_id: task:kworker/5:1 pid:141 clamp_id:0 valu=
e:0 kthread:1
[   76.490859] uclamp_rq_inc_id: task:kworker/5:1 pid:141 clamp_id:1 valu=
e:1024 kthread:1
[   76.491850] uclamp_rq_inc_id: task:kworker/4:2 pid:534 clamp_id:0 valu=
e:0 kthread:1
[   76.491852] uclamp_rq_inc_id: task:kworker/4:2 pid:534 clamp_id:1 valu=
e:1024 kthread:1
[   76.504848] uclamp_rq_inc_id: task:kworker/10:2 pid:228 clamp_id:0 val=
ue:0 kthread:1
[   76.504852] uclamp_rq_inc_id: task:kworker/10:2 pid:228 clamp_id:1 val=
ue:1024 kthread:1
[   76.508785] uclamp_rq_inc_id: task:kworker/9:1 pid:142 clamp_id:0 valu=
e:0 kthread:1
[   76.508787] uclamp_rq_inc_id: task:kworker/9:1 pid:142 clamp_id:1 valu=
e:1024 kthread:1
[   76.514856] uclamp_rq_inc_id: task:kworker/u48:10 pid:97 clamp_id:0 va=
lue:0 kthread:1
[   76.514859] uclamp_rq_inc_id: task:kworker/u48:10 pid:97 clamp_id:1 va=
lue:1024 kthread:1
[   76.522742] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:0 val=
ue:0 kthread:1

Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
---
 kernel/sched/core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 8988d38d46a3..a1e6b4157682 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1630,6 +1630,9 @@ unsigned long uclamp_eff_value(struct task_struct *=
p, enum uclamp_id clamp_id)
 {
 	struct uclamp_se uc_eff;
=20
+	if (p->flags & PF_KTHREAD)
+		return uclamp_none(clamp_id);
+
 	/* Task currently refcounted: use back-annotated (effective) value */
 	if (p->uclamp[clamp_id].active)
 		return (unsigned long)p->uclamp[clamp_id].value;
@@ -1769,6 +1772,9 @@ static inline void uclamp_rq_inc(struct rq *rq, str=
uct task_struct *p, int flags
 	if (unlikely(!p->sched_class->uclamp_enabled))
 		return;
=20
+	if (p->flags & PF_KTHREAD)
+		return;
+
 	/* Only inc the delayed task which being woken up. */
 	if (p->se.sched_delayed && !(flags & ENQUEUE_DELAYED))
 		return;
@@ -1797,6 +1803,9 @@ static inline void uclamp_rq_dec(struct rq *rq, str=
uct task_struct *p)
 	if (unlikely(!p->sched_class->uclamp_enabled))
 		return;
=20
+	if (p->flags & PF_KTHREAD)
+		return;
+
 	if (p->se.sched_delayed)
 		return;
=20
@@ -1977,6 +1986,8 @@ static void uclamp_fork(struct task_struct *p)
 {
 	enum uclamp_id clamp_id;
=20
+	if (p->flags & PF_KTHREAD)
+		return;
 	/*
 	 * We don't need to hold task_rq_lock() when updating p->uclamp_* here
 	 * as the task is still at its early fork stages.
@@ -1995,6 +2006,8 @@ static void uclamp_fork(struct task_struct *p)
=20
 static void uclamp_post_fork(struct task_struct *p)
 {
+	if (p->flags & PF_KTHREAD)
+		return;
 	uclamp_update_util_min_rt_default(p);
 }
=20
--=20
2.25.1

