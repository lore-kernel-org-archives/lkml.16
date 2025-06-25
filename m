Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CF21F4CB2
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 19:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750878735; cv=none; b=rgQzsKhB23kitngGD5VyoLvqKyZx7w7V1qMvGABDbFhWxZbyps3iacMSeowKhOJQE9YmVgDKx1x1lXrkz7qGLhqd9k+0Ld3cg4looetGXOw2JvQc1olLE23fpqdVyIq0ktqmZte782Gb27La39KYhS3z7GzIkkbDAPwEV/Vdb9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750878735; c=relaxed/simple;
	bh=Btfe1JJoT1bBJQ1LlBy13zZSXC2J40co3/VJFf0Ji5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nvu+6wcbHxVV/DcfUqin8ONHKUSTYn1VYRWwPGYGQ70ZJxRgsqP4kZTeyd2oL4Ppa2nyoJXskjt5XMq8KshKYpwF9fPEAvNvWC6YZ+Hgt09WucIWbGd5v2cr/7DMb6x58iJPZ8sxybVniWOMjvmyLOdcHhEemE0SP2oL0QWqATU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=dv3e16K4; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="dv3e16K4"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PEu5h4010225;
	Wed, 25 Jun 2025 19:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=HqW8nqT9xu/zbT7zA
	lKagL9RxvS7Ysx5eO2iZlQyEhg=; b=dv3e16K4gyPcIGcVAEg0jy0QQ22eSMt7M
	FCvOebd8SVQ8A+3ryh2ZOsDl3hyFsMISeGR68mtLgE9cu8NXYOq+46uq0iOqNcCX
	XkByN5tBFGj1jKuP+jFjZGTN0ZbKBzIXTEzZJ1E1EWbSgQ9nRQeXP+CLB1Fswm5h
	ZoyDSNp4ScPJK1jS3pKMqz117/ZafaIvEM7i5AuxjSzq6IUbkRYFuUfKp0fzesKf
	05G/OnkRaXHRT+usnm/h7umytuaBe9L1TkT2b7Ni/Pjo99er0zpF2bAdK9ZgZVej
	eeNNPUXwaZZI+LgktbAVAD8n8nlwdt8coCN7JDVVO8ZuDgGGeZ/MQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dmf394jy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:11:57 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55PJBuZu023746;
	Wed, 25 Jun 2025 19:11:56 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dmf394js-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:11:56 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55PHioES002471;
	Wed, 25 Jun 2025 19:11:56 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e8jmasdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:11:56 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55PJBqd234341558
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 19:11:52 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 480882004B;
	Wed, 25 Jun 2025 19:11:52 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ABFBE20040;
	Wed, 25 Jun 2025 19:11:48 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.209.143])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jun 2025 19:11:48 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com
Cc: sshegde@linux.ibm.com, vschneid@redhat.com, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, kprateek.nayak@amd.com, huschle@linux.ibm.com,
        srikar@linux.ibm.com, linux-kernel@vger.kernel.org,
        christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org,
        gregkh@linuxfoundation.org
Subject: [RFC v2 6/9] sched/core: Push current task out if CPU is marked as avoid
Date: Thu, 26 Jun 2025 00:41:05 +0530
Message-ID: <20250625191108.1646208-7-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250625191108.1646208-1-sshegde@linux.ibm.com>
References: <20250625191108.1646208-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=M5FNKzws c=1 sm=1 tr=0 ts=685c49fd cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=Dot9ObxFTPmaUP2n-pkA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MSBTYWx0ZWRfX+CuQ7G4MP4RS 0BCK6pMAExM4hCUec36PEznclWOD/wJGxt77Alg7NG66bfJbExACF9w6m0ODCOlMVUmSrHWCXT2 CsgDQtKhYufgFvb54qhatEs1gWjTIWq6hdV9EtTqKW/53LnXSXczfmYhFFYYgag9RyPLlewx2Cc
 UVX1T1NkUvJvdwqZ1Xn0tjZqwBMUng1qN+dvEQTTikPakt/wz5qAVOFqvS/9oMVEvMcG1ysbagw cZl0uzUCXD6Ed2WhGu+u60V6dypIgbVt8ZMC/DkBJVh6ycqeQJmj0KW6Om7PNj83bFoYGUUzV8Z 8T9nokAUpjccyNanJYQiqROLf6qGiZFeYj8y2g1+ZZpwfmG+o+2N0X9bhff9RVGt7S9w2cprKRF
 mxijQIJfVYlOBc7rEDN08UeF/cHrwU4SncP0Q+MYsyJ34fpzjFzGtAzeZ0vAud/EUbUVXiaZ
X-Proofpoint-GUID: V_KS9G9PtvUsA8fgxKxwlLHmIXl9DBl_
X-Proofpoint-ORIG-GUID: zNTvoP9J2-vGjp_xxArM_75tWYqFc7R0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1011 adultscore=0
 mlxscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250141

Actively push out any task running on a CPU marked as avoid. 
If a task is sleeping it is pushed out if it wakes up on that CPU. 

Since the task is running, need to use the stopper class to push the 
task out. Use __balance_push_cpu_stop to achieve that. 

This currently works only CFS and RT. 

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 kernel/sched/core.c  | 44 ++++++++++++++++++++++++++++++++++++++++++++
 kernel/sched/sched.h |  1 +
 2 files changed, 45 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 13e44d7a0b90..aea4232e3ec4 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5577,6 +5577,10 @@ void sched_tick(void)
 
 	sched_clock_tick();
 
+	/* push the current task out if cpu is marked as avoid */
+	if (cpu_avoid(cpu))
+		push_current_task(rq);
+
 	rq_lock(rq, &rf);
 	donor = rq->donor;
 
@@ -8028,6 +8032,43 @@ static void balance_hotplug_wait(void)
 			   TASK_UNINTERRUPTIBLE);
 }
 
+static DEFINE_PER_CPU(struct cpu_stop_work, push_task_work);
+
+/* A CPU is marked as Avoid when there is contention for underlying
+ * physical CPU and using this CPU will lead to hypervisor preemptions.
+ * It is better not to use this CPU.
+ *
+ * In case any task is scheduled on such CPU, move it out. In
+ * select_fallback_rq a non_avoid CPU will be chosen and henceforth
+ * task shouldn't come back to this CPU
+ */
+void push_current_task(struct rq *rq)
+{
+	struct task_struct *push_task = rq->curr;
+	unsigned long flags;
+
+	/* idle task can't be pused out */
+	if (rq->curr == rq->idle || !cpu_avoid(rq->cpu))
+		return;
+
+	/* Do for only SCHED_NORMAL AND RT for now */
+	if (push_task->sched_class != &fair_sched_class &&
+	    push_task->sched_class != &rt_sched_class)
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
 #else /* !CONFIG_HOTPLUG_CPU: */
 
 static inline void balance_push(struct rq *rq)
@@ -8042,6 +8083,9 @@ static inline void balance_hotplug_wait(void)
 {
 }
 
+void push_current_task(struct rq *rq)
+{
+}
 #endif /* !CONFIG_HOTPLUG_CPU */
 
 void set_rq_online(struct rq *rq)
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 105190b18020..b9614873762e 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1709,6 +1709,7 @@ struct rq_flags {
 };
 
 extern struct balance_callback balance_push_callback;
+void push_current_task(struct rq *rq);
 
 #ifdef CONFIG_SCHED_CLASS_EXT
 extern const struct sched_class ext_sched_class;
-- 
2.43.0

