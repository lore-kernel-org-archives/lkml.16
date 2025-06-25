Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDE42DECD0
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 19:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750878748; cv=none; b=T0/4c5dB9DmcuGb05Et2GeLZNm/iLEwUAC0RFMcl3rpDskpq7kpLVHpozlPTueHDv5hvH2MpkmQWBVRMb5RlOVem01i+8b8Ec2DCpCHN0+vpk9q7r16Qd46j3y8VIHqBPFkOrZTDGqVjD9GfhlyZTywdjo1KMJ5uukSDWe9k93Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750878748; c=relaxed/simple;
	bh=vcqhrkWXnP1mwU/Y+jo+u+sRq3kvrjS5i6HKPIbGABY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EkzaOrf/mvL/fJcbORX4GFSLUe0EhyyB6VxlVf8xT3AC/GXMSq3MFWlFMAL/aiPzb5bTWmzOT2vmmxsBSq1g/PYqoXHU1l+/IeYFgqbdzno8pOs1j5n7FO6fAmL4zoHu3+rqMPcLj2XCSxa1GD+eU23k5VDOsVoGv/W42jojtas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=oXk0YosM; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="oXk0YosM"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PIMOIv027991;
	Wed, 25 Jun 2025 19:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=vaTKvaw0EsjGRWkOV
	nsWptMm4bJfQ509JCNCEZixgtQ=; b=oXk0YosMHwey4Q7vVwDm/ywFDwwLgcaM2
	ducAd7zh/3MEl+B58BZoy4CWA7jHaTFB8tegFFfU0PyZUL3ENPzTke1lnGMJxCWA
	SOPZIa0wz0D7QDRzeMFXIyYHeEewnRY2RJujEnEfbWW3jVlMWehYdZ8Z9dYpIuEh
	SpcxD5wF7of00Uiv9uFCaTH3OBtJoS9cqLXr31Qw2DIjlreWyxRSheeMm5B3XZze
	AyDjEVSREz2T+7/wOP2/cV2Pfcg5pO9Knn97tkb7wVD81bx6tw4ACc6nGA3LiHpv
	mtuna7EUB7uhnzIQhFkm77lSXqvNcg/0c7kGcMIysUh691/CXGKig==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dm8jhhf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:12:01 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55PJC1xs023400;
	Wed, 25 Jun 2025 19:12:01 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dm8jhhey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:12:01 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55PJ6Xxf014748;
	Wed, 25 Jun 2025 19:12:00 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 47e9s2jjy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:12:00 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55PJBu9O59375874
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 19:11:56 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A20E20043;
	Wed, 25 Jun 2025 19:11:56 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F09020040;
	Wed, 25 Jun 2025 19:11:52 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.209.143])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jun 2025 19:11:52 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com
Cc: sshegde@linux.ibm.com, vschneid@redhat.com, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, kprateek.nayak@amd.com, huschle@linux.ibm.com,
        srikar@linux.ibm.com, linux-kernel@vger.kernel.org,
        christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org,
        gregkh@linuxfoundation.org
Subject: [RFC v2 7/9] sched: Add static key check for cpu_avoid
Date: Thu, 26 Jun 2025 00:41:06 +0530
Message-ID: <20250625191108.1646208-8-sshegde@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MSBTYWx0ZWRfX19uC+xWfQaZ+ Cr7oOUbSprf6nfWvvDOnpMIJjDKjkStAY+orEf7e9QeU5WXCEJr0AleNlQ6bakna6QqkaNEiv1s WvDLTVo0GkcI1sIIsyRLwWOT1JI9r74IAgYhS0vuktKDvYd1X5cd4zLXoZmrCs8a7SBwzOUHVQ3
 rJaCZerlT1X9S60VwEKklkRU/J/tH2SXK2+WbLVRKhuPQuIIexcA5hwmdQAPaYieFbWHYebZjGX hJUevIQNSi00v8TME/EnsuorzSyZL4N3APJIWjHuIlLGuxaFdyXIIyDhtB0YPWquCIgueUNyEh8 bJEiktOUPvJGPM8qKNgw3BwCZqMrQ2Jii7Pgvo0RwDGw2QAiNHcg5JSj110FKlPQt3+QUQibXKz
 Ou4s+6iruLO2DoRI4TxDSUJiN/Cqj6UWQs0wzRwv2jp30l0ByozNU2Po9zEZHlNlDz3Jn4Bp
X-Proofpoint-GUID: 8mD_nYPjJGtKhLq4Swoqsyh9Xbkf2bkG
X-Proofpoint-ORIG-GUID: M5HFX4d2Aeu9Niu3f8a8kmAcboEwiS88
X-Authority-Analysis: v=2.4 cv=combk04i c=1 sm=1 tr=0 ts=685c4a01 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=ha0spXy-qW39NgmqIngA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250141

Checking if a CPU is avoid can add a slight overhead and should be 
done only when necessary. 

Add a static key check which makes it almost nop when key is false. 
Arch needs to set the key when it decides to. Refer to debug patch
for example. 

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
This method avoids additional ifdefs. So kept it that way instead of 
CONFIG_PARAVIRT. 

Added a helper function for cpu_avoid, since including sched.h fails in 
cpumask.h

 kernel/sched/core.c  | 8 ++++----
 kernel/sched/fair.c  | 5 +++--
 kernel/sched/rt.c    | 8 ++++----
 kernel/sched/sched.h | 9 +++++++++
 4 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index aea4232e3ec4..51426b17ef55 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -148,9 +148,9 @@ __read_mostly int sysctl_resched_latency_warn_once = 1;
  * Limited because this is done with IRQs disabled.
  */
 __read_mostly unsigned int sysctl_sched_nr_migrate = SCHED_NR_MIGRATE_BREAK;
-
 __read_mostly int scheduler_running;
 
+DEFINE_STATIC_KEY_FALSE(paravirt_cpu_avoid_enabled);
 #ifdef CONFIG_SCHED_CORE
 
 DEFINE_STATIC_KEY_FALSE(__sched_core_enabled);
@@ -2438,7 +2438,7 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
 		return false;
 
 	/* CPU marked as avoid, shouldn't chosen to run any task*/
-	if (cpu_avoid(cpu))
+	if (cpu_avoid_check(cpu))
 		return false;
 
 	/* But are allowed during online. */
@@ -5578,7 +5578,7 @@ void sched_tick(void)
 	sched_clock_tick();
 
 	/* push the current task out if cpu is marked as avoid */
-	if (cpu_avoid(cpu))
+	if (cpu_avoid_check(cpu))
 		push_current_task(rq);
 
 	rq_lock(rq, &rf);
@@ -8048,7 +8048,7 @@ void push_current_task(struct rq *rq)
 	unsigned long flags;
 
 	/* idle task can't be pused out */
-	if (rq->curr == rq->idle || !cpu_avoid(rq->cpu))
+	if (rq->curr == rq->idle || !cpu_avoid_check(rq->cpu))
 		return;
 
 	/* Do for only SCHED_NORMAL AND RT for now */
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 406288aef535..21370f76d61b 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8547,7 +8547,7 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 	rcu_read_unlock();
 
 	/* Don't select a CPU marked as avoid for wakeup */
-	if (cpu_avoid(new_cpu))
+	if (cpu_avoid_check(new_cpu))
 		return cpu;
 	else
 		return new_cpu;
@@ -11668,7 +11668,8 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 	cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
 
 	/* Don't spread load into CPUs marked as avoid */
-	cpumask_andnot(cpus, cpus, cpu_avoid_mask);
+	if (static_branch_unlikely(&paravirt_cpu_avoid_enabled))
+		cpumask_andnot(cpus, cpus, cpu_avoid_mask);
 
 	schedstat_inc(sd->lb_count[idle]);
 
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index fd9df6f46135..0ab3fdf7a637 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1549,7 +1549,7 @@ select_task_rq_rt(struct task_struct *p, int cpu, int flags)
 		if (!test && target != -1 && !rt_task_fits_capacity(p, target))
 			goto out_unlock;
 
-		if (cpu_avoid(target))
+		if (cpu_avoid_check(target))
 			goto out_unlock;
 		/*
 		 * Don't bother moving it if the destination CPU is
@@ -1873,7 +1873,7 @@ static struct rq *find_lock_lowest_rq(struct task_struct *task, struct rq *rq)
 	for (tries = 0; tries < RT_MAX_TRIES; tries++) {
 		cpu = find_lowest_rq(task);
 
-		if ((cpu == -1) || (cpu == rq->cpu) || cpu_avoid(cpu))
+		if ((cpu == -1) || (cpu == rq->cpu) || cpu_avoid_check(cpu))
 			break;
 
 		lowest_rq = cpu_rq(cpu);
@@ -1971,7 +1971,7 @@ static int push_rt_task(struct rq *rq, bool pull)
 			return 0;
 
 		cpu = find_lowest_rq(rq->curr);
-		if (cpu == -1 || cpu == rq->cpu || cpu_avoid(cpu))
+		if (cpu == -1 || cpu == rq->cpu || cpu_avoid_check(cpu))
 			return 0;
 
 		/*
@@ -2234,7 +2234,7 @@ static void pull_rt_task(struct rq *this_rq)
 	if (likely(!rt_overload_count))
 		return;
 
-	if (cpu_avoid(this_rq->cpu))
+	if (cpu_avoid_check(this_rq->cpu))
 		return;
 
 	/*
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index b9614873762e..707fdfa46772 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1710,6 +1710,15 @@ struct rq_flags {
 
 extern struct balance_callback balance_push_callback;
 void push_current_task(struct rq *rq);
+DECLARE_STATIC_KEY_FALSE(paravirt_cpu_avoid_enabled);
+
+static inline bool cpu_avoid_check(int cpu)
+{
+	if (static_branch_unlikely(&paravirt_cpu_avoid_enabled))
+		return cpu_avoid(cpu);
+
+	return false;
+}
 
 #ifdef CONFIG_SCHED_CLASS_EXT
 extern const struct sched_class ext_sched_class;
-- 
2.43.0

