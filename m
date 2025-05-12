Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD4328D837
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747050827; cv=none; b=OrMzYGcnBALI1+x6RqQi5YJ8Ij2SdwdOG/+HQ6Zi04iAHHpXKdXGmR9KpdVcGSytBoz6WWje57kzP/ksABZxcp7LDBSH1dHa/vLdRzAjomUh1754MuvieEnmhAepPMQXY/vK1iZIvF9bCD1x2HLJMvs76OkOHVSmw3h5T/eQuuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747050827; c=relaxed/simple;
	bh=aHPFkCPoF4cazcjdMGjTAn1dG4a/FOsHoyVYi0bm0/c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f1MmtpsueMBs3UzD2f9BGvFgTmjFZFY5Z3aE9FAYnQTuruPIQkTIgJ+jS9bGflRTzrEDUW7deEsK9sPcZWp17kjLXkpdizacDkfzAMeQc8yGM/9+AHXtR3oYQOH3x8c+1bfdizIpqt2VRf44dxN6L/PMiN6s/GCWXlGENMRNeC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=SjnUQbdq; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="SjnUQbdq"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C9EsKq015539;
	Mon, 12 May 2025 11:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=hZiTzSPBwoQzUv24S
	q9NqZX1ZXgabYm/8LRxaC6Wzbg=; b=SjnUQbdqDq+bot8/nIV9JtEUQWfP9DNhM
	qjd5bVwu2/4ffZvJtdRMAMmQOj45r0s1FVEnTrQMZqCG0WnO47YypiCIaddSb7ag
	KM4DIkDQ7pxURS3HCqfZKfyRDtAGFiLzyE1OhPCi65IhHLd5tdRYwjFDSS/XYekd
	pvkx5o1Swz08OKGrSPRhfMYusHMGPqCWdrBgfTRMUMBMzy2OSzPyF5xk2kihp2DX
	qrAUlzFoFrbJ0OSMbPL80pZKDZ/A9ob95bb+QBJLV1YrUduR0BSFEvLwxZEF8ll7
	lrUE/y922uqeU/Tpiz3lK7dzyDomn1bweoxNsH2vdIRwzGWed0WVQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ke6j0mg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 11:53:34 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54CBrXUB027970;
	Mon, 12 May 2025 11:53:33 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ke6j0mg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 11:53:33 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54CADFXV003824;
	Mon, 12 May 2025 11:53:33 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46jkbkdj5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 11:53:32 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54CBrTT448693726
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 11:53:29 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 56E78200EA;
	Mon, 12 May 2025 11:53:29 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 930BA200E8;
	Mon, 12 May 2025 11:53:28 +0000 (GMT)
Received: from IBM-PW0CRK36.ibm.com (unknown [9.111.90.223])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 May 2025 11:53:28 +0000 (GMT)
From: Tobias Huschle <huschle@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, sshegde@linux.ibm.com
Subject: [RFC PATCH v3 3/4] sched/fair: adapt scheduler group weight and capacity for parked CPUs
Date: Mon, 12 May 2025 13:53:24 +0200
Message-Id: <20250512115325.30022-4-huschle@linux.ibm.com>
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
X-Proofpoint-GUID: 1HGC-4Ou1_YEc9FCwMZ3jWIRpSpdLSzw
X-Proofpoint-ORIG-GUID: n3hC7qRUPLd7Vkdm83KqnSsosXyicJLt
X-Authority-Analysis: v=2.4 cv=auyyCTZV c=1 sm=1 tr=0 ts=6821e13e cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=AytC5maEDuoeYDmhhs8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDEyMiBTYWx0ZWRfX8itseEZ+JdOV aUT+JOoESYO1Nj6ZF9ZbpTX80OrifqKqUUndSmN9bNRzsjceGDq2yhwunikQ2+X94SyHhlFA0E4 OMaECWxF8vYepVs6QxAu4DjG2htJ3a8tEHCOLyiL21PYJYGzwD9GhZmYqTR96Ep4/gy2TKFCkpa
 CapIgIhRF/vYW8tp8LI2VHP7LroPC1k2I5eHbFlm0NlMeltdY0nfxQRnA/RZbMNUlFCqILaUug/ WNfC5d5Y1+PWoU4KCCmP6ggFRlx64r65QuoUfWKv6LsZ2RtIUUIoj/+t3LhW6EiwOJ1KllZXRmR 8PkiLZUn2syUCMabnnNa/R6HzN22mTHvarpujL9bjLFp8Fz2zAZfFS3OdaBjJM0N98IyDvzZ4Wa
 ihpNq2G7vRCDsi06k6IjUs2Xozj/1ZAVEmEY6s+47sAoRF+HpDOsnsWfvjU5IVYSub9tygFh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_04,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0 mlxlogscore=642
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120122

Parked CPUs should not be considered to be available for computation.
This implies, that they should also not contribute to the overall weight
of scheduler groups, as a large group of parked CPUs should not attempt
to process any tasks, hence, a small group of non-parked CPUs should be
considered to have a larger weight.
The same consideration holds true for the CPU capacities of such groups.
A group of parked CPUs should not be considered to have any capacity.

Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
---
 kernel/sched/fair.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index ee8ccee69774..d3161e928746 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9934,6 +9934,8 @@ struct sg_lb_stats {
 	unsigned int sum_nr_running;		/* Nr of all tasks running in the group */
 	unsigned int sum_h_nr_running;		/* Nr of CFS tasks running in the group */
 	unsigned int sum_nr_parked;
+	unsigned int parked_cpus;
+	unsigned int parked_capacity;
 	unsigned int idle_cpus;                 /* Nr of idle CPUs         in the group */
 	unsigned int group_weight;
 	enum group_type group_type;
@@ -10390,6 +10392,8 @@ static inline void update_sg_lb_stats(struct lb_env *env,
 			*sg_overutilized = 1;
 
 		sgs->sum_nr_parked += arch_cpu_parked(i) * rq->cfs.h_nr_queued;
+		sgs->parked_capacity += arch_cpu_parked(i) * capacity_of(i);
+		sgs->parked_cpus += arch_cpu_parked(i);
 
 		/*
 		 * No need to call idle_cpu() if nr_running is not 0
@@ -10427,9 +10431,11 @@ static inline void update_sg_lb_stats(struct lb_env *env,
 		}
 	}
 
-	sgs->group_capacity = group->sgc->capacity;
+	sgs->group_capacity = group->sgc->capacity - sgs->parked_capacity;
+	if (!sgs->group_capacity)
+		sgs->group_capacity = 1;
 
-	sgs->group_weight = group->group_weight;
+	sgs->group_weight = group->group_weight - sgs->parked_cpus;
 
 	/* Check if dst CPU is idle and preferred to this group */
 	if (!local_group && env->idle && sgs->sum_h_nr_running &&
@@ -10713,6 +10719,8 @@ static inline void update_sg_wakeup_stats(struct sched_domain *sd,
 		sgs->sum_nr_running += nr_running;
 
 		sgs->sum_nr_parked += arch_cpu_parked(i) * rq->cfs.h_nr_queued;
+		sgs->parked_capacity += arch_cpu_parked(i) * capacity_of(i);
+		sgs->parked_cpus += arch_cpu_parked(i);
 
 		/*
 		 * No need to call idle_cpu_without() if nr_running is not 0
@@ -10728,9 +10736,11 @@ static inline void update_sg_wakeup_stats(struct sched_domain *sd,
 
 	}
 
-	sgs->group_capacity = group->sgc->capacity;
+	sgs->group_capacity = group->sgc->capacity - sgs->parked_capacity;
+	if (!sgs->group_capacity)
+		sgs->group_capacity = 1;
 
-	sgs->group_weight = group->group_weight;
+	sgs->group_weight = group->group_weight - sgs->parked_cpus;
 
 	sgs->group_type = group_classify(sd->imbalance_pct, group, sgs);
 
-- 
2.34.1

