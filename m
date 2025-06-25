Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C500A2E0B6F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 19:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750878748; cv=none; b=EBEeJypyW8hpaL+71B5RI4xXKcZq98sfRqn0UNyh+5X12nNzTqhHiG05UaQl7HZZxmFuxhQZhA83yan8Wjm3g94uwaNpueO5AVF0FJQ9842XTt1BanP1vJve+DD0Q1OAiweKYJ8fygVAN0WOwJmOWqF+ovBwMwjUADYC5GweCcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750878748; c=relaxed/simple;
	bh=6ICt16FlRZ4JDL48MGhJc56KCIPgVIVwIpRZ+z0v6Fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ALZZ27lVR7ccBMlS1wqUwddSK7y+7efVRH6oacNbrrKTfgrkZNqz6J58BnjfOB0U2fgUNDM33pfvRdcnxlz9Vx1kHVDz6xMB1ZFfzRD3lwFDl7UNVV+52wfLU6xo46n1EqE3UkIgQfybJ/KEv1t2l6CQmICqRr4CyleCkzL04RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=QOYtRWux; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="QOYtRWux"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PJ1kmo025790;
	Wed, 25 Jun 2025 19:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=J0WdVmX9i2uAG/1q0
	lIem3oIKzOaNA7LPwmwzJXNHRA=; b=QOYtRWuxScNDEwM19uzjP2upw0mmgRcru
	dWWQkYZszG0FTS8MrLCvYsa+kwV67+qZHMgc2TydhuD2KTzDCxhN18yTGtEqpI8s
	1OdCbhv3NI7ePs3w2YaEM6XkugI9TG75RrXDAA/8NBOxYPNU5PVnmKMBfwZhs8E/
	fkaIQfhEVqcUzyeZcyTLfpDptMiqNLLcySNNqfPQk9qUw32x9oBL7b0c7d8yor57
	30V4RTmoFh4MEvNUNJiPngrI41L1jd6WUj1G1AN+DZSLV3edW9aD44ddar9mkfKL
	xM857TRUS2KkKQ37egTSL5pgYZIiTmOp9KSQtczc3+5nVbGnXuhWg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47gpwhr28e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:11:54 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55PJ2DlY026724;
	Wed, 25 Jun 2025 19:11:53 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47gpwhr286-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:11:53 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55PHc9Zd006408;
	Wed, 25 Jun 2025 19:11:52 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e82paxw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:11:52 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55PJBm1447448522
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 19:11:48 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 524F220043;
	Wed, 25 Jun 2025 19:11:48 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B51B120040;
	Wed, 25 Jun 2025 19:11:44 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.209.143])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jun 2025 19:11:44 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com
Cc: sshegde@linux.ibm.com, vschneid@redhat.com, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, kprateek.nayak@amd.com, huschle@linux.ibm.com,
        srikar@linux.ibm.com, linux-kernel@vger.kernel.org,
        christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org,
        gregkh@linuxfoundation.org
Subject: [RFC v2 5/9] sched/rt: Don't select CPU marked as avoid for wakeup and push/pull rt task
Date: Thu, 26 Jun 2025 00:41:04 +0530
Message-ID: <20250625191108.1646208-6-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: Ozz5Ed7du4ZfDs1eVWS1h-yQTAzNspda
X-Proofpoint-ORIG-GUID: qSKMqq6N81YKdhnVAAsFp4JXjrrY2Ypc
X-Authority-Analysis: v=2.4 cv=dd+A3WXe c=1 sm=1 tr=0 ts=685c49fa cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=mwiGFyDNcI-a1ZCKz0gA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MSBTYWx0ZWRfXwn3poP0W8j0x dVHkbqSyPHUN6ZXg1fTuI6snLGTzh2MGQQ1sANMuAmvM37cXWNOV/573vjiHevCKbtfO76WLBZ6 vtXZGJjqhuV4dP2joF5phNWb5oBQM5E8siuVoWPj7mHWAqkgsZwQ91HeURWyA+ekOdovn9/Qow7
 0D5w9TqlUfKB1U4/IqCypY3GRVuTvHWqbL5VB5oP1goDdc0Yk445Z4Ho6uh+HunK8lfvqALpoJy rY8OdmQiuSmeFTq8ABPvkms57DUXM3HfZnTu+HcG8tmq/8asi7SCibkWgUfdeYU6veRCNgUkwEb UFWlL3brOL/BaROHJmPBPLUIxrnh7FDmwMEHfo2/Zra1mqsimcw+Nofrggl2D5lCnXPJdlDIM7d
 Bpl131Gq7NiVuhsSz7omBQunRfJ9bJ9QCB1KMSXrCPba6CwnCTffuwLlmGfeV4N0bXfP4fQE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 clxscore=1015 adultscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250141

- While wakeup don't select the CPU if it marked as avoid. 
- Don't pull a task if CPU is marked as avoid. 
- Don't push a task to a CPU marked as Avoid. 

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 kernel/sched/rt.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 15d5855c542c..fd9df6f46135 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1549,6 +1549,8 @@ select_task_rq_rt(struct task_struct *p, int cpu, int flags)
 		if (!test && target != -1 && !rt_task_fits_capacity(p, target))
 			goto out_unlock;
 
+		if (cpu_avoid(target))
+			goto out_unlock;
 		/*
 		 * Don't bother moving it if the destination CPU is
 		 * not running a lower priority task.
@@ -1871,7 +1873,7 @@ static struct rq *find_lock_lowest_rq(struct task_struct *task, struct rq *rq)
 	for (tries = 0; tries < RT_MAX_TRIES; tries++) {
 		cpu = find_lowest_rq(task);
 
-		if ((cpu == -1) || (cpu == rq->cpu))
+		if ((cpu == -1) || (cpu == rq->cpu) || cpu_avoid(cpu))
 			break;
 
 		lowest_rq = cpu_rq(cpu);
@@ -1969,7 +1971,7 @@ static int push_rt_task(struct rq *rq, bool pull)
 			return 0;
 
 		cpu = find_lowest_rq(rq->curr);
-		if (cpu == -1 || cpu == rq->cpu)
+		if (cpu == -1 || cpu == rq->cpu || cpu_avoid(cpu))
 			return 0;
 
 		/*
@@ -2232,6 +2234,9 @@ static void pull_rt_task(struct rq *this_rq)
 	if (likely(!rt_overload_count))
 		return;
 
+	if (cpu_avoid(this_rq->cpu))
+		return;
+
 	/*
 	 * Match the barrier from rt_set_overloaded; this guarantees that if we
 	 * see overloaded we must also see the rto_mask bit.
-- 
2.43.0

