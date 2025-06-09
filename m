Received: from mta20.hihonor.com (mta20.hihonor.com [81.70.206.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E5A4A3C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 11:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.206.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749468981; cv=none; b=qp2bfbj3bpTT9Ya7e2njbixefM+DkCDTkSFBdlSEIFc0NUzATNZmIBEtOY4c0g6JD98iLMdM+TJACZdTpleDtguwAotbks67RMtAAxkmQzGps4NSlDcbs8qLtMgibLzLt0AnF6Heq0YL/TRvGGv5EglfZCppSLCiwCLmZLhXfBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749468981; c=relaxed/simple;
	bh=NrAKI/4suSfAnhSdQ1X09fmgTtlAwlGqtGIoHc/hc/s=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NHwGdO2X4bnIwPFJ4iSmLl+o/cg1lskhKdGfoRHp9lll2+jL0r3m4wNFmlkrVAZalI0Q6f0TGdgLLjevu2XH3Oi1xW+OKwKgtLriZbKj6qVdHzZI7eV6UaWF1StY7qmV3Q/f0VnNJm1TaxfQVQvSAMY65N5topkeGjnuRdu8tzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.206.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w002.hihonor.com (unknown [10.68.28.120])
	by mta20.hihonor.com (SkyGuard) with ESMTPS id 4bG8vQ6PzvzYmKJm;
	Mon,  9 Jun 2025 19:33:54 +0800 (CST)
Received: from a004.hihonor.com (10.68.27.131) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 9 Jun
 2025 19:36:16 +0800
Received: from a007.hihonor.com (10.68.22.31) by a004.hihonor.com
 (10.68.27.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 9 Jun
 2025 19:36:15 +0800
Received: from a007.hihonor.com ([fe80::e866:83ac:f23b:c25c]) by
 a007.hihonor.com ([fe80::e866:83ac:f23b:c25c%10]) with mapi id
 15.02.1544.011; Mon, 9 Jun 2025 19:36:15 +0800
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
Subject: [PATCH] sched_ext: Fix NULL pointer dereferences in put_prev_task_scx
Thread-Topic: [PATCH] sched_ext: Fix NULL pointer dereferences in
 put_prev_task_scx
Thread-Index: AdvZMqezZvkPdfZnQpOR7atL8hfbkg==
Date: Mon, 9 Jun 2025 11:36:15 +0000
Message-ID: <dc2d908cd429473a9d46255272231f38@honor.com>
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

As put_prev_task can be used in other kernel modules which can lead
to a NULL pointer. Fix this by checking for a valid next.

Signed-off-by: l00013971 <l00013971@hihonor.com>
---
 kernel/sched/ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index f5133249f..6a579babd 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -3262,7 +3262,7 @@ static void put_prev_task_scx(struct rq *rq, struct t=
ask_struct *p,
 		 * ops.enqueue() that @p is the only one available for this cpu,
 		 * which should trigger an explicit follow-up scheduling event.
 		 */
-		if (sched_class_above(&ext_sched_class, next->sched_class)) {
+		if (next && sched_class_above(&ext_sched_class, next->sched_class)) {
 			WARN_ON_ONCE(!static_branch_unlikely(&scx_ops_enq_last));
 			do_enqueue_task(rq, p, SCX_ENQ_LAST, -1);
 		} else {
--=20
2.17.1
