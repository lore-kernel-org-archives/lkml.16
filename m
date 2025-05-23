Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BED216E23
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748024135; cv=none; b=cbpjLVtwai0hU9hHJH7gDd7KW//MX2im6IEfTwZcUrF3vvrV3D9DZ6jQW9PLDnNVKgmIKkVPMs50bZVlto1MHd9dKHibpO5WT0wxV4bnoN50CcKT0iqmlxS8pBSCGLx2y8/m5MuUOngT/wBBH5P8dcFNNbLhZUO8t8UreVri+NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748024135; c=relaxed/simple;
	bh=IIsLa1Gg5jSN4+6L9GGrZzQCaQ87vJoIQedlME/3x/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RPWVz2R5AaOYFhF/bZAcqUxJutpYpXUbHpNiG40cMsVq6yyB+5IcfKIkhQzcRT0wIWj0dOpKhv/4oHCOi0YAylZo/mCWWccYZhJXPJenvHf8HGa4BFxoRwLLgbocUCXqTmxkDsAsBfgaPbxeO8Xh48zZwhbd2rZxJrt/Nh17st0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=EG2jtmvk; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="EG2jtmvk"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NGWDOj008590;
	Fri, 23 May 2025 18:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=gqehOyeB5e+CQSzXz
	etpQXDaQKD3ArJmDEuvcL0lX6o=; b=EG2jtmvke59gButpl3lYbW3GzQD54fkZY
	VghzWL3D0JV0Y/EEinWMcPYJyED3tUFWD4e2OvnIqxaByU483y4p3g3giUcY2NZj
	LK45kpaHX4AJpK1McEUF6u+sz5s5nTuly+RjOUizHMLd51QpL7q6At5mIErYr9QX
	n3kFoQmOVgGE/Njr7AgssRkmbw4/PhJ9dDn26vTFhDTif+2m9G2zMRc/wgNH2SbH
	WZJQaWCT6QahFVBXwxND+nfpQe+TufHUQL0beNpzTQX4lRB2oXjUz64OVA0LpcRO
	XvcWe5/F7/XHGQsYt5D0d6dtY1aOGLMSoAqf+bRqffJYb7aXrmGKg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46sxhwhet3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 18:15:19 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54NIFJOm000349;
	Fri, 23 May 2025 18:15:19 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46sxhwhesy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 18:15:19 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54NEtxhs010640;
	Fri, 23 May 2025 18:15:17 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46rwnmqvf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 18:15:17 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54NIFD3334079206
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 May 2025 18:15:14 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D72C12004B;
	Fri, 23 May 2025 18:15:13 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 66F0420040;
	Fri, 23 May 2025 18:15:10 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.221.90])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 May 2025 18:15:10 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com
Cc: sshegde@linux.ibm.com, vschneid@redhat.com, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, jstultz@google.com, kprateek.nayak@amd.com,
        huschle@linux.ibm.com, srikar@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk
Subject: [RFC PATCH 4/5] sched/core: Push current task when cpu is parked
Date: Fri, 23 May 2025 23:44:47 +0530
Message-ID: <20250523181448.3777233-5-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250523181448.3777233-1-sshegde@linux.ibm.com>
References: <20250523181448.3777233-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2MCBTYWx0ZWRfX6PLl1Q6F0j/N TNnl5NG362/L75G87cO4cxrvLHhTjxofMh6BpH6TgghzvNLNCJf693UjG+KUN4MsMjMV3jBtINo /La2YgoNPh2N9wfD7+uS0ahrF/6PnYAcCT3waeRJ2LggIkRX+VMQtnxURJdDHwfsAtgVCj3HIjJ
 oVe2+v22Gn035UzVO7xIq16lPhYh45umuEB/XTOek8+eLqpNEpqcg8wgGk5Sv6Ro2iXfn/oyOkY YrvKH5Rglrrrc/htg4WaCIDuwFyCLz18S9zDWoKXSGnVA4eU3F7W/mw7tHcECmMPe+TgHQMcpmd F2ndHqAlS2fNByRIZ6a+p/bGIzpVr2/fDv6YCvy3hymy9I2OUqMtMhIPsstHK9ig7B5EJOpxy9M
 hVoXLePz3YW916xTcaDu6twrZFByTXBJf4EeVC8Mi97pZ42HzxkFcQcKRLnmwICN2HIOYxM6
X-Proofpoint-GUID: EnoBjhOu6EEQfhM5cAt1HK1_26oUbDRR
X-Authority-Analysis: v=2.4 cv=O685vA9W c=1 sm=1 tr=0 ts=6830bb37 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=DrkLi_EIzDYcL8ylMrQA:9
X-Proofpoint-ORIG-GUID: Hv1-KohCJnmpbnNnIHpSRgCTekBVe3tw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230160

When a CPU becomes parked, all tasks present on that CPU should vacate
it. Use existing __balance_push_cpu_stop mechanism to move out current
running task. 

Which CPUs need to be parked is to be decided by architecture. 

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
Note: Maybe this could be done only for CFS, EXT tasks if it is not
recommended for RT,DL etc. 

 kernel/sched/core.c  | 39 +++++++++++++++++++++++++++++++++++++++
 kernel/sched/sched.h |  1 +
 2 files changed, 40 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 9ec12f9b3b08..dd8e824bc030 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5656,6 +5656,10 @@ void sched_tick(void)
 
 	sched_clock_tick();
 
+	/* push the current task out if cpu is parked */
+	if (cpu_parked(cpu))
+		push_current_task(rq);
+
 	rq_lock(rq, &rf);
 	donor = rq->donor;
 
@@ -8482,6 +8486,41 @@ void __init sched_init_smp(void)
 }
 #endif /* CONFIG_SMP */
 
+#if defined(CONFIG_SMP) && defined(CONFIG_HOTPLUG_CPU)
+static DEFINE_PER_CPU(struct cpu_stop_work, push_task_work);
+
+/* A parked CPU is when underlying physical CPU is not available.
+ * Scheduling on such CPU is going to cause OS preemption.
+ * In case any task is scheduled on such CPU, move it out. In
+ * select_fallback_rq a non parked CPU will be chosen and henceforth
+ * task shouldn't come back to this CPU
+ */
+void push_current_task(struct rq *rq)
+{
+	struct task_struct *push_task = rq->curr;
+	unsigned long flags;
+
+	/* idle task can't be pused out */
+	if (rq->curr == rq->idle || !cpu_parked(rq->cpu))
+		return;
+
+	if (kthread_is_per_cpu(push_task) ||
+	    is_migration_disabled(push_task))
+		return;
+
+	local_irq_save(flags);
+	get_task_struct(push_task);
+	preempt_disable();
+
+	stop_one_cpu_nowait(rq->cpu, __balance_push_cpu_stop, push_task,
+			    this_cpu_ptr(&push_task_work));
+	preempt_enable();
+	local_irq_restore(flags);
+}
+#else
+void push_current_task(struct rq *rq) { };
+#endif
+
 int in_sched_functions(unsigned long addr)
 {
 	return in_lock_functions(addr) ||
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index c5a6a503eb6d..86bcd9401d41 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -104,6 +104,7 @@ extern void calc_global_load_tick(struct rq *this_rq);
 extern long calc_load_fold_active(struct rq *this_rq, long adjust);
 
 extern void call_trace_sched_update_nr_running(struct rq *rq, int count);
+void push_current_task(struct rq *rq);
 
 extern int sysctl_sched_rt_period;
 extern int sysctl_sched_rt_runtime;
-- 
2.39.3

