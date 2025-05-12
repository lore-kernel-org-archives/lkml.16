Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACD427511F
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747050828; cv=none; b=qoiOaGKsAVTs2oSaoqgFGbX15rpYPfD6EJyNT6EeiE1/Jq9L3zJs+KY8ZAj2wUVbwkMtVxnELYQcs9tTwGjFW0mTv/met7HEHdwzRlwxePpFV/NwdHxQ8kEm9eECXzthzjHEiDpyc4z3qdpx6cdYHSfU3hXwWpj50xGK0t5dSa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747050828; c=relaxed/simple;
	bh=FSil9k36AUgGeOGdJ1CqAyVzBiybUDfYnUkpWfS85mM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G+7L9Huh1SwOP7u4h6/UZuYO0Zzxy3H3N7AUArawIl0A4pTEJih/p24bbv4ItRf6Ic2z3MLRPIr2BZc/dDxW9nL46BEe0cR71dsreTnlpJm2Z33QAWVU+TDLyEICembiIyHtAw9FYc03pzFm1QmcNCI1Gwk1/FZuqX3+4Rknat4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=hI820fn6; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="hI820fn6"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C0hYn5017585;
	Mon, 12 May 2025 11:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=7XbRVulreCYu5DjKd
	RO0kmuT14ISqJyFSs5qeJXwyzc=; b=hI820fn6ZTeKbLSzIk7nK6d2Fsi70zge7
	DLJqxvebjElIWR2FdZvynqyScydXoO/J7Rm8wlcxcGOz5jO8uPNzwowsoy2ArDR3
	GVdES9vxU2zm9AsaPqEuZQXA/gBWI+r23+eaiT7Hn5YmAKVwO1hZVpwyVwFBVwOu
	I1pCDQ0VwypJrn/9bFxy9nveQXi6FQVqAF8CLpSgIpPQhTv5grWy7kYXFRtGQmaY
	qOKBf3Zl3xzA+25LGF2610XK5HLvMHenzOQIS28xS/Frv87QrbRHQRyNnwhWU1/m
	noAB1BWtBx4EhtvrX3I1nXl6NYwxWOA3KSdDjpadXzV+T4zA+g1UA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46jw42unmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 11:53:35 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54CBqmnc031932;
	Mon, 12 May 2025 11:53:34 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46jw42unmg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 11:53:34 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54CApOps012021;
	Mon, 12 May 2025 11:53:33 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46jku25etv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 11:53:33 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54CBrUfh47317318
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 11:53:30 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4224D200E8;
	Mon, 12 May 2025 11:53:30 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 70E06200EB;
	Mon, 12 May 2025 11:53:29 +0000 (GMT)
Received: from IBM-PW0CRK36.ibm.com (unknown [9.111.90.223])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 May 2025 11:53:29 +0000 (GMT)
From: Tobias Huschle <huschle@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, sshegde@linux.ibm.com
Subject: [RFC PATCH v3 4/4] s390/topology: Add initial implementation for selection of parked CPUs
Date: Mon, 12 May 2025 13:53:25 +0200
Message-Id: <20250512115325.30022-5-huschle@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDEyMiBTYWx0ZWRfX4Wq5IUtUF1jP yE5z/CrLnAbW/V0rgo3zKl5Z0yxW39TGaSYjcFfQjhLVdtZMGkAaIRQy94Qn6cQRoitkxKFgQW4 3qoZjYJCo/VvSOsWAi7t7QEBjS1Nb/KsokKt4hdV2xpkzyftMUE1oQTQOFJCDCtRg4FOY+ion/s
 K5P+MCEw61Z9qq2QdtWdnSfk+cGKmmp7jiQV0o+yfekn/9vVP4TgryliPN/5cZcXszqKD9ghOFw DFf5AuVw7X5rOdosuq69VGuITl/XYGlQbdm5e34d21hyaj9tcunnOYVIdIX5knSXto8ecRAgGbq 1uT5GNRsxq3FmuafRhp20g1iW5Y+JXZKF9o9AOMiQxYGU+VWLzE6/dvGiQ3PMeSSDonO0BQm+hV
 eEzmvXPFOd4WI28VQVHzuQ+cUn08UeXZA1496uMkaZo5ma5zpWn7jOI6q9VxBh4A3NNOM47i
X-Proofpoint-ORIG-GUID: GyxktJOoiId2Yp-YRs9e2IgzFNA_y3Oq
X-Authority-Analysis: v=2.4 cv=UqJjN/wB c=1 sm=1 tr=0 ts=6821e13f cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=eEyMWbnfSktHb8uulP0A:9
X-Proofpoint-GUID: GIyJV8wDoRwWowEmjcWJffDh9vVtrmhb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_04,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0
 clxscore=1015 mlxlogscore=828 lowpriorityscore=0 spamscore=0
 suspectscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120122

At first, vertical low CPUs will be parked generally. This will later
be adjusted by making the parked state dependent on the overall
utilization on the underlying hypervisor.

Vertical lows are always bound to the highest CPU IDs. This implies that
the three types of vertically polarized CPUs are always clustered by ID.
This has the following implications:
- There might be scheduler domains consisting of only vertical highs
- There might be scheduler domains consisting of only vertical lows

Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
---
 arch/s390/include/asm/smp.h | 2 ++
 arch/s390/kernel/smp.c      | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/arch/s390/include/asm/smp.h b/arch/s390/include/asm/smp.h
index 03f4d01664f8..93754c354803 100644
--- a/arch/s390/include/asm/smp.h
+++ b/arch/s390/include/asm/smp.h
@@ -31,6 +31,7 @@ static __always_inline unsigned int raw_smp_processor_id(void)
 }
 
 #define arch_scale_cpu_capacity smp_cpu_get_capacity
+#define arch_cpu_parked smp_cpu_parked
 
 extern struct mutex smp_cpu_state_mutex;
 extern unsigned int smp_cpu_mt_shift;
@@ -56,6 +57,7 @@ extern int smp_cpu_get_polarization(int cpu);
 extern void smp_cpu_set_capacity(int cpu, unsigned long val);
 extern void smp_set_core_capacity(int cpu, unsigned long val);
 extern unsigned long smp_cpu_get_capacity(int cpu);
+extern bool smp_cpu_parked(int cpu);
 extern int smp_cpu_get_cpu_address(int cpu);
 extern void smp_fill_possible_mask(void);
 extern void smp_detect_cpus(void);
diff --git a/arch/s390/kernel/smp.c b/arch/s390/kernel/smp.c
index 63f41dfaba85..6f6b2e90366d 100644
--- a/arch/s390/kernel/smp.c
+++ b/arch/s390/kernel/smp.c
@@ -680,6 +680,11 @@ void smp_set_core_capacity(int cpu, unsigned long val)
 		smp_cpu_set_capacity(i, val);
 }
 
+bool smp_cpu_parked(int cpu)
+{
+	return smp_cpu_get_polarization(cpu) == POLARIZATION_VL;
+}
+
 int smp_cpu_get_cpu_address(int cpu)
 {
 	return per_cpu(pcpu_devices, cpu).address;
-- 
2.34.1

