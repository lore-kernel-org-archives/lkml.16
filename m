Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB41F1D7E5B
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747050827; cv=none; b=Jz6u/+21rOGVsT9dWagh1gbU/552t/g192sPtEd5GGMr13i2Mc1mYsR+cMpAb3q5nrOShkB9j7b4kvE+DDuiauVMAeNbXHfIMqntUGPeL9OFROS7c4k7XruQD+mRuSfingpdX7iEoqxjKk7PJRoGYvVzynfg3HkbXRnutnY+IIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747050827; c=relaxed/simple;
	bh=2NJ16dCcp73RdpieYOtjDGiCHYIF7vEN/pHpM1Awfhg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g0A420Jzecv7Ok7hFLS7xZBpkvlXk8+fgX1MMLFhsbP12s+CG4k6vBhtPYX2Lw8AU208no56HgEOjSJdfoAEDrsjWVokcD+KxRfM+/TZrBAAaDb9F4WZW7j9xwW0hEuksPe7mGvMJv8fo3ZHc9yJf7YMSYvK3lVlBiwkhKgV7bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=jTkbqjy2; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="jTkbqjy2"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C9FAvG015889;
	Mon, 12 May 2025 11:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=5wFIR5gyRg2ECtomM
	xwyuNgGFE7Y/SXkDgRUfBo3XVU=; b=jTkbqjy2Dnh0mn8LJaqr6Umplob0gXR1r
	NwO9Exd6f2HnmstkIa6ZU4hY60s009DuL43zRF4uM7Lw77DOvCnivl0FZrkUKrUc
	ENqKa9c8EOcNxGbk0RQ3Mt7inHehcnsnhOPL04kY/Lv28aQJD8vBR6nUN+uJtBZp
	Xq9+f8jUVnIAMYR/e75G2kuIHOXGBqvEsKtNYa7e6O9u2rFkTpGwpBFipZBk4ZK0
	mqSQS8RdhCrociXLwXSYp2g8zKh6MVZXSo5ClVcRBIa4vqwVF18OOCef+oEOCcfd
	1Mzb/+86arOAspeMOf0zIi+cz4b8AQBUN2aisIAFs+8Xo2gHVMbxw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ke6j0mg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 11:53:33 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54CBrXo2027962;
	Mon, 12 May 2025 11:53:33 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ke6j0mfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 11:53:32 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54CB4vmr011544;
	Mon, 12 May 2025 11:53:32 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46jku25etn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 11:53:32 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54CBrS5p58130738
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 11:53:28 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A4DB200E4;
	Mon, 12 May 2025 11:53:28 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B38F9200E8;
	Mon, 12 May 2025 11:53:27 +0000 (GMT)
Received: from IBM-PW0CRK36.ibm.com (unknown [9.111.90.223])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 May 2025 11:53:27 +0000 (GMT)
From: Tobias Huschle <huschle@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, sshegde@linux.ibm.com
Subject: [RFC PATCH v3 2/4] sched/rt: add support for parked CPUs
Date: Mon, 12 May 2025 13:53:23 +0200
Message-Id: <20250512115325.30022-3-huschle@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512115325.30022-1-huschle@linux.ibm.com>
References: <20250512115325.30022-1-huschle@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DA6iYAGlwSyCh9Dsvq3DsDGiKc91zCxT
X-Proofpoint-ORIG-GUID: ANI7Qxp7wfaZDDPyYkQ422LC0etqW_J_
X-Authority-Analysis: v=2.4 cv=auyyCTZV c=1 sm=1 tr=0 ts=6821e13d cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=l-v1mVCvDpcWLIwNwUUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDEyMiBTYWx0ZWRfX51x2jZbBapCM 1p9RbYH2UHOHmqctBRDbI1JVsrOb1odCGRaOuf9Y32TdqC+Q+ERWR+55AL0YDCuV9HnEuhN5PXB DS8VggH+iPom1Xz9cACxsLHz7mkIp7f9Mvk+AvAeTJXA4ZkgrJZQkOoYCe++QkWOPL3ks64BfXY
 Owb96OGIvgJLJEHwPiCaKUu2xUcfyrfowAyfYX+IP5Y5rGK7V+iD5wtPCdrRxIHhKbqnSCXq1Ak tPZndDZjNomPo0iyU3y6HIFplees5lAV16ThRcieY3JGCSKLIUKRHmiwIfKYLsHq1Ond95GE8Gx nPnv/fnR/7d7Rg7faE/KCB/Y8Gbn0NtY7JaQcXVOf5hNg9rebJ2RUKCfsx9WGdQFyRK/EeWefoF
 1xj3EC7FnOyjN8OydUhhPgQRI4eenx59U12CBqegwjvqcv7qlhxvm6z1jsJ6nG0T8BU6hIs/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_04,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0 mlxlogscore=907
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120122

Realtime tasks must also react to the parked states of CPUs. Tasks will
be treated as if the parked CPUs have no free capacity to work on them.

A dynamic change in the parked state of CPUs is handled correctly if
realtime tasks do not consume 100% CPU time, without any interruption.
If a realtime tasks runs without interruption, it will never enter the
load balancing code and will therefore remain on a CPU, even if the CPU
becomes classified as parked. Any value below 100% causes the task to
be migrated off a CPU which has just been classified as parked.

Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
---
 kernel/sched/rt.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index fa03ec3ed56a..595d760304fb 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -460,6 +460,9 @@ static inline bool rt_task_fits_capacity(struct task_struct *p, int cpu)
 	unsigned int max_cap;
 	unsigned int cpu_cap;
 
+	if (arch_cpu_parked(cpu))
+		return false;
+
 	/* Only heterogeneous systems can benefit from this check */
 	if (!sched_asym_cpucap_active())
 		return true;
@@ -474,6 +477,9 @@ static inline bool rt_task_fits_capacity(struct task_struct *p, int cpu)
 #else
 static inline bool rt_task_fits_capacity(struct task_struct *p, int cpu)
 {
+	if (arch_cpu_parked(cpu))
+		return false;
+
 	return true;
 }
 #endif
@@ -1799,6 +1805,8 @@ static int find_lowest_rq(struct task_struct *task)
 	int this_cpu = smp_processor_id();
 	int cpu      = task_cpu(task);
 	int ret;
+	int parked_cpu = 0;
+	int tmp_cpu;
 
 	/* Make sure the mask is initialized first */
 	if (unlikely(!lowest_mask))
@@ -1807,11 +1815,18 @@ static int find_lowest_rq(struct task_struct *task)
 	if (task->nr_cpus_allowed == 1)
 		return -1; /* No other targets possible */
 
+	for_each_cpu(tmp_cpu, cpu_online_mask) {
+		if (arch_cpu_parked(tmp_cpu)) {
+			parked_cpu = tmp_cpu;
+			break;
+		}
+	}
+
 	/*
 	 * If we're on asym system ensure we consider the different capacities
 	 * of the CPUs when searching for the lowest_mask.
 	 */
-	if (sched_asym_cpucap_active()) {
+	if (sched_asym_cpucap_active() || parked_cpu > -1) {
 
 		ret = cpupri_find_fitness(&task_rq(task)->rd->cpupri,
 					  task, lowest_mask,
@@ -1833,14 +1848,14 @@ static int find_lowest_rq(struct task_struct *task)
 	 * We prioritize the last CPU that the task executed on since
 	 * it is most likely cache-hot in that location.
 	 */
-	if (cpumask_test_cpu(cpu, lowest_mask))
+	if (cpumask_test_cpu(cpu, lowest_mask) && !arch_cpu_parked(cpu))
 		return cpu;
 
 	/*
 	 * Otherwise, we consult the sched_domains span maps to figure
 	 * out which CPU is logically closest to our hot cache data.
 	 */
-	if (!cpumask_test_cpu(this_cpu, lowest_mask))
+	if (!cpumask_test_cpu(this_cpu, lowest_mask) || arch_cpu_parked(this_cpu))
 		this_cpu = -1; /* Skip this_cpu opt if not among lowest */
 
 	rcu_read_lock();
@@ -1860,7 +1875,7 @@ static int find_lowest_rq(struct task_struct *task)
 
 			best_cpu = cpumask_any_and_distribute(lowest_mask,
 							      sched_domain_span(sd));
-			if (best_cpu < nr_cpu_ids) {
+			if (best_cpu < nr_cpu_ids && !arch_cpu_parked(best_cpu)) {
 				rcu_read_unlock();
 				return best_cpu;
 			}
@@ -1877,7 +1892,7 @@ static int find_lowest_rq(struct task_struct *task)
 		return this_cpu;
 
 	cpu = cpumask_any_distribute(lowest_mask);
-	if (cpu < nr_cpu_ids)
+	if (cpu < nr_cpu_ids && !arch_cpu_parked(cpu))
 		return cpu;
 
 	return -1;
-- 
2.34.1

