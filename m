Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1998E298C35
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748024131; cv=none; b=B4w5hF/uTvbrp08v30rXZKVH70sYrwpIfHgRTv2BPJGPc+4/i4Ox4kX42OLw4JHXmqG7G+mJ21F/sIiCSaQmThgdf106kQzMsScJul0/coGRaCsIZWEYyPSUYPbjAtlUYxltEU/Xwm33Q9Mog0pKTpu32RH+2hzlOeer9y64++c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748024131; c=relaxed/simple;
	bh=uEEALTgv5lzy7LE8QU7g4Lc8ltq4KwyZdv5BPG/HTTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IoS7k+T2u0gCYmgu6JjaLWRWLGWiKvxBjvhWu/O5UUsPl1nROIE3p5Iq0x4HzF8iz3dlMrhBBC9b7LQUgkSmQy1geZiAxdDvJxUs21Sm6rodPNMGMBkIVAQhTVXTLTR6ToLnJe05Ys5dTQNbIsDxSW730MEeZsoCpfwiE3OUAUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=lEv/JUp5; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="lEv/JUp5"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NGWCjp019438;
	Fri, 23 May 2025 18:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=5gfYDFqufAz2exnVp
	0F5z7SK3SvetXUnFifkGj7Ui4Q=; b=lEv/JUp5Rr7Iiz7vgD9LKQcuAHHRnFy+E
	f4xq8N0/5gKGdB/1M+5uHx2e0y1Kp2xTj3dDnQrNJ+Dx4U/1+IyetS/dmIPmf3aU
	xCmzW1Br6qJ3OveEwbl5Cvx0M1oxhR22eT49qZa4m0/iI40HLaaWcsI6R2qM/oSP
	q53+B65+C2KxqxX7wpiD274CddMtWGG5ymQU5rxO2LTcr0WpITHsv29t1Xq2gyeB
	4Y7/tXof+I1tKHH/wljCFyNQGZKzqV+Zd0l+zAOpiAKMAvw4R36daEKbijK//1c8
	JbBTKmdE6DdkABxvkg56of3oNflio+nk3mNp7faWgnEZ+nHSPsGtQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46t669q2c9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 18:15:08 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54NI15Y0016502;
	Fri, 23 May 2025 18:15:07 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46t669q2c6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 18:15:07 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54NHva0i031973;
	Fri, 23 May 2025 18:15:06 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46rwmqfvgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 18:15:06 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54NIF2d950397544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 May 2025 18:15:02 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5342D2004D;
	Fri, 23 May 2025 18:15:02 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D197020040;
	Fri, 23 May 2025 18:14:58 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.221.90])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 May 2025 18:14:58 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com
Cc: sshegde@linux.ibm.com, vschneid@redhat.com, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, jstultz@google.com, kprateek.nayak@amd.com,
        huschle@linux.ibm.com, srikar@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk
Subject: [RFC PATCH 1/5] cpumask: Introduce cpu parked mask
Date: Fri, 23 May 2025 23:44:44 +0530
Message-ID: <20250523181448.3777233-2-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=RrPFLDmK c=1 sm=1 tr=0 ts=6830bb2c cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=yoKQFJCjtn0IRW-TtgoA:9
X-Proofpoint-ORIG-GUID: pUONPhN9KHOsk5Q3d8nIq_trzcGGgKqW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2NCBTYWx0ZWRfXworABcV5JF6p VB+MOYYXAuLyCl1ZSbN+jj/JlfDWi3dvfwrnX6/ozV4QgGMsCsLM7giuYeWaigMbWW7pPQwVFWF p+9ghOuW5pj8fA8NfemmabfguBPjrY6gyWdstwVaN158NFKydr9D2yDIJLtnHxLWYxhSDDh8ami
 ulrfaWxNOTbefYFe5to8CUtTJjYwMrSIJLBp0re6tuXXL7xw6k49/6ico961s6fAvbh3CRx0DdA Bub4mJqRabFo/TqBQFHfIYgJBdiRiewY1C0yUrHs3O+tHiwDYc4RFO8NNVpt1mT8uEmKTboUGLJ rAJmXfgYhzyT7ad2hn7ExsE6RFraOBD/2WqBJxv2HGGGRb+k12kuUK5arsVUFdDVDCi8kezYBiQ
 qyhUoRny1L07MQQjD1knChfJfS92pQ/7f7Rq5cVJUthwkCtclQUhTfYiKHsW5GsJDEFyeZVr
X-Proofpoint-GUID: VZ_NEmXUshB2UHwK9Wi_Gs2rwAhtX7Ql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230164

CPU is said to be parked, when underlying physical CPU is not 
available. This happens when there is contention for CPU resource in
para-virtualized case. One should avoid using these CPUs. 

Build and maintain this state of parked CPUs. Scheduler will use this
information and push the tasks out as soon as it can. 

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
- Not sure if __read_mostly attribute suits for cpu_parked 
since it can change often. Since often means a few mins, it is long time
from scheduler perspective, hence kept it. 

 include/linux/cpumask.h | 14 ++++++++++++++
 kernel/cpu.c            |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index 6a569c7534db..501848303800 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -84,6 +84,7 @@ static __always_inline void set_nr_cpu_ids(unsigned int nr)
  *     cpu_enabled_mask - has bit 'cpu' set iff cpu can be brought online
  *     cpu_online_mask  - has bit 'cpu' set iff cpu available to scheduler
  *     cpu_active_mask  - has bit 'cpu' set iff cpu available to migration
+ *     cpu_parked_mask  - has bit 'cpu' set iff cpu is parked
  *
  *  If !CONFIG_HOTPLUG_CPU, present == possible, and active == online.
  *
@@ -93,6 +94,11 @@ static __always_inline void set_nr_cpu_ids(unsigned int nr)
  *  representing which CPUs are currently plugged in.  And
  *  cpu_online_mask is the dynamic subset of cpu_present_mask,
  *  indicating those CPUs available for scheduling.
+ *
+ *  A CPU is said to be parked when underlying physical CPU(pCPU) is not
+ *  available at the moment. It is recommended not to run any workload on
+ *  that CPU.
+
  *
  *  If HOTPLUG is enabled, then cpu_present_mask varies dynamically,
  *  depending on what ACPI reports as currently plugged in, otherwise
@@ -118,12 +124,14 @@ extern struct cpumask __cpu_enabled_mask;
 extern struct cpumask __cpu_present_mask;
 extern struct cpumask __cpu_active_mask;
 extern struct cpumask __cpu_dying_mask;
+extern struct cpumask __cpu_parked_mask;
 #define cpu_possible_mask ((const struct cpumask *)&__cpu_possible_mask)
 #define cpu_online_mask   ((const struct cpumask *)&__cpu_online_mask)
 #define cpu_enabled_mask   ((const struct cpumask *)&__cpu_enabled_mask)
 #define cpu_present_mask  ((const struct cpumask *)&__cpu_present_mask)
 #define cpu_active_mask   ((const struct cpumask *)&__cpu_active_mask)
 #define cpu_dying_mask    ((const struct cpumask *)&__cpu_dying_mask)
+#define cpu_parked_mask    ((const struct cpumask *)&__cpu_parked_mask)
 
 extern atomic_t __num_online_cpus;
 
@@ -1146,6 +1154,7 @@ void init_cpu_possible(const struct cpumask *src);
 #define set_cpu_present(cpu, present)	assign_cpu((cpu), &__cpu_present_mask, (present))
 #define set_cpu_active(cpu, active)	assign_cpu((cpu), &__cpu_active_mask, (active))
 #define set_cpu_dying(cpu, dying)	assign_cpu((cpu), &__cpu_dying_mask, (dying))
+#define set_cpu_parked(cpu, parked)    assign_cpu((cpu), &__cpu_parked_mask, (parked))
 
 void set_cpu_online(unsigned int cpu, bool online);
 
@@ -1235,6 +1244,11 @@ static __always_inline bool cpu_dying(unsigned int cpu)
 	return cpumask_test_cpu(cpu, cpu_dying_mask);
 }
 
+static __always_inline bool cpu_parked(unsigned int cpu)
+{
+	return cpumask_test_cpu(cpu, cpu_parked_mask);
+}
+
 #else
 
 #define num_online_cpus()	1U
diff --git a/kernel/cpu.c b/kernel/cpu.c
index a59e009e0be4..532fbfbe3226 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -3110,6 +3110,9 @@ EXPORT_SYMBOL(__cpu_dying_mask);
 atomic_t __num_online_cpus __read_mostly;
 EXPORT_SYMBOL(__num_online_cpus);
 
+struct cpumask __cpu_parked_mask __read_mostly;
+EXPORT_SYMBOL(__cpu_parked_mask);
+
 void init_cpu_present(const struct cpumask *src)
 {
 	cpumask_copy(&__cpu_present_mask, src);
-- 
2.39.3

