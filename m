Received: from mta22.hihonor.com (mta22.hihonor.com [81.70.192.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD95220F4F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 07:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.192.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751095265; cv=none; b=UqJxX5OEt5RkUykN1vQUiFmsSh8eUg260FDzWEoYwYDgvJoPXhCWO9tcGg34QdeaFx3xqDZ4Qah5I0PzMX7BHJeWstCQxP1GqPNAWR97YUbFbQTZdLHByo1+YLn4wLRlPk0xX2eaVveBNYIGIJGYkKM7FT3BHdT1n9YpQ+BhP0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751095265; c=relaxed/simple;
	bh=avJ6HVO0tu8vTEJ74CHj/RJdeoy6Mqf4OeAXMrNK4vo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GjAt742ZLVis2vMiHgN1VUnNYNkXIsWqLdSmK8yy9JzmoDd4Aw84H784je/jJFu+0kQ9npZ9rsE16qqHA9ZfxWhyKy7xNLDnc3ubvvfN0JOZQDuGMDHrNMqr6axccRjrxOFD8JDdZ5XABkBS+YRkpohh3qIl8wuVXmdkEgnvvwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; dkim=pass (1024-bit key) header.d=honor.com header.i=@honor.com header.b=grUi18Uq; arc=none smtp.client-ip=81.70.192.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=honor.com header.i=@honor.com header.b="grUi18Uq"
dkim-signature: v=1; a=rsa-sha256; d=honor.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=To:From;
	bh=NLGgHtl8XrfpCdAGua9Q+BZRyEZJbbN0vo3VvtJ4KhE=;
	b=grUi18Uq12h3iR+S2+wkzovzbj+iXfhP4/TQMyb52H1MNXmTgifeBxVqybmSZQg2rZXNNl49l
	BS/C49edC0EhQxZtWIpSXnEc8jQ1y+6PZf5oGoDVf9AzVOWTbzaiqOAMRZstgCjDhecgRjRaSaZ
	CFuK4g3g2kxmK3qRtstz+fg=
Received: from w013.hihonor.com (unknown [10.68.26.19])
	by mta22.hihonor.com (SkyGuard) with ESMTPS id 4bTkLQ2cTLzYlXVs;
	Sat, 28 Jun 2025 15:18:54 +0800 (CST)
Received: from a009.hihonor.com (10.68.30.244) by w013.hihonor.com
 (10.68.26.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 28 Jun
 2025 15:20:59 +0800
Received: from a007.hihonor.com (10.68.22.31) by a009.hihonor.com
 (10.68.30.244) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 28 Jun
 2025 15:20:59 +0800
Received: from a007.hihonor.com ([fe80::e866:83ac:f23b:c25c]) by
 a007.hihonor.com ([fe80::e866:83ac:f23b:c25c%10]) with mapi id
 15.02.1544.011; Sat, 28 Jun 2025 15:20:59 +0800
From: liuwenfang <liuwenfang@honor.com>
To: 'Tejun Heo' <tj@kernel.org>
CC: 'David Vernet' <void@manifault.com>, 'Andrea Righi' <arighi@nvidia.com>,
	'Changwoo Min' <changwoo@igalia.com>, 'Ingo Molnar' <mingo@redhat.com>,
	'Peter Zijlstra' <peterz@infradead.org>, 'Juri Lelli'
	<juri.lelli@redhat.com>, 'Vincent Guittot' <vincent.guittot@linaro.org>,
	'Dietmar Eggemann' <dietmar.eggemann@arm.com>, 'Steven Rostedt'
	<rostedt@goodmis.org>, 'Ben Segall' <bsegall@google.com>, 'Mel Gorman'
	<mgorman@suse.de>, 'Valentin Schneider' <vschneid@redhat.com>,
	"'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] sched_ext: Fix cpu_released while changing sched
 policy of the running task
Thread-Topic: [PATCH v2 2/2] sched_ext: Fix cpu_released while changing sched
 policy of the running task
Thread-Index: AQHb5/0yo2t7F5m+gkK5HK/j+nTL0w==
Date: Sat, 28 Jun 2025 07:20:59 +0000
Message-ID: <7ae16e02aba64a318d8e67be9e3b7f8e@honor.com>
References: <fca528bb34394de3a7e87a873fadd9df@honor.com>
 <aFmwHzO2AKFXO_YS@slm.duckdns.org>
In-Reply-To: <aFmwHzO2AKFXO_YS@slm.duckdns.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Priority inheritance policy should be cared, eg., one SCX task can be
boosted to REAL-TIME while holding a mutex lock, and then restored while
releasing the lock. The value cpu_released is fixed when changing the
sched class of the running task.

Signed-off-by: liuwenfang liuwenfang@honor.com
---
 kernel/sched/ext.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index f161156be..7fab0a657 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -3903,11 +3903,29 @@ static void switching_to_scx(struct rq *rq, struct =
task_struct *p)
=20
 static void switched_from_scx(struct rq *rq, struct task_struct *p)
 {
+	switch_class(rq, p, true);
+
 	scx_ops_disable_task(p);
 }
=20
 static void wakeup_preempt_scx(struct rq *rq, struct task_struct *p,int wa=
ke_flags) {}
-static void switched_to_scx(struct rq *rq, struct task_struct *p) {}
+static void switched_to_scx(struct rq *rq, struct task_struct *p)
+{
+	lockdep_assert_rq_held(rq);
+
+	if (static_branch_unlikely(&scx_ops_cpu_preempt) &&
+	    unlikely(rq->scx.cpu_released)) {
+		/*
+		 * If the previous sched_class for the current CPU was not SCX,
+		 * notify the BPF scheduler that it again has control of the
+		 * core. This callback complements ->cpu_release(), which is
+		 * emitted in switch_class().
+		 */
+		if (SCX_HAS_OP(cpu_acquire))
+			SCX_CALL_OP(SCX_KF_REST, cpu_acquire, rq, cpu_of(rq), NULL);
+		rq->scx.cpu_released =3D false;
+	}
+}
=20
 int scx_check_setscheduler(struct task_struct *p, int policy)
 {
--=20
2.17.1
