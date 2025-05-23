Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4240E298CC0
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748024131; cv=none; b=AZRkZ7oBkVq6Vc0OqgiF5vc+i6tmyFqvnZiXrSBdCB7b/PbHb9JFinfBaC+uxYuHZvZP2qAsWGXT55a08YkUX0lZVdCDRMU8mrzxPm8xSYJlC4NlzFqM4nXu2KeBXGZ4Xa9ajwkZaN6BPxmPkhuI2d6aA9ayeSkRJQGqW/MQVL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748024131; c=relaxed/simple;
	bh=BGfqZTuP7Vt9lOg14mcWWOIpVPUWN4w5uRBVNbskkMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oy0NQjLlqKXuJv0AMe5+kQg9HPbgfYh4cpOrpl1JDoKCs/FPu/mx/F3FTBid/NY4XN8xjCT+nlD71Pam3Ou0Jkd6fknSsEueYsfFxqQ/gBIM+bDTb7yv9OF0KBveRIc7E8TPBQdtNFmEaJfN1VKOwAO+BLMs/X52n+41/5coi/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=DKg+WyIW; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="DKg+WyIW"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NGWJJe016985;
	Fri, 23 May 2025 18:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=ahgyIAPZYQH6AgIzs
	h4KBNjDs9nMRhTXach6oWE73cA=; b=DKg+WyIWpAPHkI8drbDNdOzNutN9AtdmP
	NpSS9YaJzqpXVEm0xaf7ZCQ/Kc+aIOdrEQ/aDvAPgiBy5pdB+eUGaue54c/vecbF
	wc22tQlpW6VrGeSrA8NKF22hsxBg+KuvrZ4lbghN5054ZHUE4oVgHHfaKEfvsSdx
	U4iyCdIBT2mhDTFmFGJ55Awc6Nzr/eGhGrdalzgIp1Nyf1CvXpNtJuFcttBXmbh7
	cTzKq8XQOk8Y8Xp92k2Sgmbo8odUcL4RJV4uR02K4XeGqjTi1l6EwbPx5aOSwcw6
	SCeSn6jBHqPFxsuPamg9zN/bNlIg++EoWMnS4/G2OhK5ASIPf8MRg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46t5537756-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 18:15:11 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54NIC03C000493;
	Fri, 23 May 2025 18:15:10 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46t5537752-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 18:15:10 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54NID0EX010595;
	Fri, 23 May 2025 18:15:10 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46rwnmqvec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 18:15:09 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54NIF6Yu35783076
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 May 2025 18:15:06 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 30F0A20043;
	Fri, 23 May 2025 18:15:06 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A985C20040;
	Fri, 23 May 2025 18:15:02 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.221.90])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 May 2025 18:15:02 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com
Cc: sshegde@linux.ibm.com, vschneid@redhat.com, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, jstultz@google.com, kprateek.nayak@amd.com,
        huschle@linux.ibm.com, srikar@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk
Subject: [RFC PATCH 2/5] sched/core: Don't use parked cpu for selection
Date: Fri, 23 May 2025 23:44:45 +0530
Message-ID: <20250523181448.3777233-3-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: YLwwGwA9IWnT4Je-WvNgMHY5Ib8e_CzM
X-Proofpoint-ORIG-GUID: yswSzh8SjNuDaW-I9Mryv0bRxQywTAq7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2NCBTYWx0ZWRfX441L4+sE5tc0 1HtZZyzepEPev5kvqV/lNXakghMKM32G1z0TixhfdPHb9lrNo3bBjBU1wfkrxcm1aAfrvBISZBy ufo11FbNqHeMBertPebn/UXv4Q2urprJXAWxESYL3IjoPksWCAOezI7B81RGt84S+sgKMd9cJqS
 edF1wjNxiBKvI88UCT/deWlLtmF/aSlQGJYE40JVQPrMfquDF+hPoY6A6AvdVCySHee5j3GBRSV bVD7xdnbz7q3yPinHVNk9dPjl6VDy4Vg1gwLjA3DWmXLRu+FV5XyU1DPQlDYGg7+/VT6GtJRgwC VayseCWnMQma9NI9qE+e/JclKajGLDGY7n+Ibqq6z/Rr/usAQnaKNyL+WH0X4lQSKoW5/uC+w3r
 qGwq59K/BY9JQBC5hVEemqNxN0MFAPk33k8WxPa6BPOndGWtPh0GqdW8ofKGX+g97i4Ksm2t
X-Authority-Analysis: v=2.4 cv=BOmzrEQG c=1 sm=1 tr=0 ts=6830bb2f cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=SeSF_3wNJrZcFQq4b1oA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=622
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230164

When the current running task is pushed using stop class mechanism, the
new CPU that going to be chosen shouldn't be a parked CPU. 

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 kernel/sched/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 62b3416f5e43..9ec12f9b3b08 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3526,7 +3526,7 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
 		nodemask = cpumask_of_node(nid);
 
 		/* Look for allowed, online CPU in same node. */
-		for_each_cpu(dest_cpu, nodemask) {
+		for_each_cpu_andnot(dest_cpu, nodemask, cpu_parked_mask) {
 			if (is_cpu_allowed(p, dest_cpu))
 				return dest_cpu;
 		}
@@ -3534,7 +3534,7 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
 
 	for (;;) {
 		/* Any allowed, online CPU? */
-		for_each_cpu(dest_cpu, p->cpus_ptr) {
+		for_each_cpu_andnot(dest_cpu, p->cpus_ptr, cpu_parked_mask) {
 			if (!is_cpu_allowed(p, dest_cpu))
 				continue;
 
-- 
2.39.3

