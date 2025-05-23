Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7120829AAE7
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748024135; cv=none; b=cEPTryeL/dOJ/2bNQbA6uzxgFWSm2ntjAmcgYMnXyBR4oMs3ZgZDQ0cbvGp8VNTaY6Ppzj4UFWcxPg4Bg/s3vk4cx74Qmwe1Xl6DBaFDjoQ5I5YVm8nWSFa5pw4nDLCSKEYLj5eWbt186BOakepWbEcajWXsPyZqhcA8SDk91cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748024135; c=relaxed/simple;
	bh=5oX9Rmj3klh97hVy6nCpHS7vtK+pbqvHEGA1kWNSTeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XRI3iMjmsdMRaHYZuTJE/fssfr9cPeRmJcaSWRfm/mv4Fdhm7F2+/Dc71FnAiXYIUV3VaKCml0qegGg4erQPmxvXHjD8tcvpzkXCVGiC0I6ny0nOYDbaWQXXxMQTs2AI5lKnaUV9DOKa2khjScfi8Uz0U+DmvkxTV766yILck54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=f43sUQSL; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="f43sUQSL"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NGWMip020876;
	Fri, 23 May 2025 18:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=DKP2mXJ0kjW2nE9c6
	1Isby21HssLLGbAvp7HWzQSgLU=; b=f43sUQSL8/KHnPbKIa4e4xWuQkuf9fdjd
	2lN+hUYdRNdmBZHAsXrh2R8g+d/w/nmb4l51mEdTdKbUPrJAMoKgQQ4TnvvIw+qc
	QxpOZqPZNM+Xlrju9UrGisYEexeDuRz90ZvSS7JDMMJly/iQXqJ7KCYbXjvl+KeB
	efdYhTBGfjTtCByQRbP+ZTcPORVERc2qh6jaeWXw1526/lgflulR055Pf5WhxUEP
	d5pVbm/BCbbtDnk239szKTNz12DXv+5LRWAeTy5PkBGUViFdGGJxzH6OoRIcUrts
	ALo90yB8LutzVvCZ/f8Kb39Kuu4mqfPoEpqDI6Sf+xGKkTorVXJTg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46t9m7wsw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 18:15:23 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54NIFMsB011862;
	Fri, 23 May 2025 18:15:22 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46t9m7wsvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 18:15:22 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54NIBrHn032066;
	Fri, 23 May 2025 18:15:21 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46rwmqfvhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 18:15:21 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54NIFHrI48234990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 May 2025 18:15:17 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AAED02004F;
	Fri, 23 May 2025 18:15:17 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B3DF20040;
	Fri, 23 May 2025 18:15:14 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.221.90])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 May 2025 18:15:14 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com
Cc: sshegde@linux.ibm.com, vschneid@redhat.com, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, jstultz@google.com, kprateek.nayak@amd.com,
        huschle@linux.ibm.com, srikar@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk
Subject: [DEBUG PATCH 5/5] powerpc: Use manual hint for cpu parking
Date: Fri, 23 May 2025 23:44:48 +0530
Message-ID: <20250523181448.3777233-6-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=SMZCVPvH c=1 sm=1 tr=0 ts=6830bb3b cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=L5heHK9TWKRAitwTlzAA:9
X-Proofpoint-GUID: SGtagqzBv-s_MaMtM2G0TRB7ovplG56S
X-Proofpoint-ORIG-GUID: o399fyKNSRD8S9xXrHdE4z__l5-TD0wl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2NCBTYWx0ZWRfXxSLjDx4XMxtq irqfXuxp7lRQqN3myuUB4074N79DF7QRZ4P4k6KJYNaiqD4sI+Syoy8MryZ3ZDCBfXLnx8LZLgP jqbe/L5TM4c4aVNQGOutR25P8NkTuDV2CwQFlfqrLVBeut0SC/pidllz8A2eSxQ+1VtHoqzIJ67
 BeJLyLpMveKqF8Y4pwo26TQqPJP82IcZghHf8/KL6YUb4fapThAqY8TjMJkPcDGOScwUKNRKqh7 u9hJMX+vV7J29gtoIQ77xxOLdkhU24yAmJzJlKVvEF54rDu3CcKDBcSy1pkixwdUO5u3VfirkNo hQPidoXh/le5XkWtxDyozSed5g/7PpV0iIn7dOQy5CaBUHp10NMpzI1tn1CsqXmMmCyXAgQCqhv
 PvvjjO+i1B1xytJVwqx5smg7yModBtVmDi9R8ItNiZ06z74B/ATwlhq4wvksinMTdBLKdjPT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 bulkscore=0 clxscore=1011 adultscore=0
 phishscore=0 mlxscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230164

Use sysfs to provide hint. Depending on the system configuration one
needs to decide the number. vp - virtual processor or vCPU. 

For example, when 40 > vp_manual_hint means scheduler is supposed to use
only 0-39 vCPUs. By default, vp_manual_hint is set to all possible CPUs 
and it has be at least 1. 

This is for illustration only. Not meant to be merged. One can modify as
per their arch.  

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/kernel/smp.c | 45 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 5ac7084eebc0..37eb6aa71613 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -64,6 +64,7 @@
 #include <asm/systemcfg.h>
 
 #include <trace/events/ipi.h>
+#include <linux/debugfs.h>
 
 #ifdef DEBUG
 #include <asm/udbg.h>
@@ -82,6 +83,7 @@ bool has_big_cores __ro_after_init;
 bool coregroup_enabled __ro_after_init;
 bool thread_group_shares_l2 __ro_after_init;
 bool thread_group_shares_l3 __ro_after_init;
+static int vp_manual_hint = NR_CPUS;
 
 DEFINE_PER_CPU(cpumask_var_t, cpu_sibling_map);
 DEFINE_PER_CPU(cpumask_var_t, cpu_smallcore_map);
@@ -1727,6 +1729,7 @@ static void __init build_sched_topology(void)
 	BUG_ON(i >= ARRAY_SIZE(powerpc_topology) - 1);
 
 	set_sched_topology(powerpc_topology);
+	vp_manual_hint = num_present_cpus();
 }
 
 void __init smp_cpus_done(unsigned int max_cpus)
@@ -1807,4 +1810,46 @@ void __noreturn arch_cpu_idle_dead(void)
 	start_secondary_resume();
 }
 
+/*
+ * sysfs hint to mark CPUs as parked. This will help in restricting
+ * the workload to specified number of CPUs.
+ * For example 40 > vp_manual_hint means, workload will run on
+ * 0-39 CPUs.
+ */
+
+static int pv_vp_manual_hint_set(void *data, u64 val)
+{
+	int cpu;
+
+	if (val == 0 || vp_manual_hint > num_present_cpus())
+		vp_manual_hint = num_present_cpus();
+
+	if (val != vp_manual_hint)
+		vp_manual_hint = val;
+
+	for_each_present_cpu(cpu) {
+		if (cpu >= vp_manual_hint)
+			set_cpu_parked(cpu, true);
+		else
+			set_cpu_parked(cpu, false);
+	}
+	return 0;
+}
+
+static int pv_vp_manual_hint_get(void *data, u64 *val)
+{
+	*val = vp_manual_hint;
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_pv_vp_manual_hint, pv_vp_manual_hint_get, pv_vp_manual_hint_set, "%llu\n");
+
+static __init int paravirt_debugfs_init(void)
+{
+	if (is_shared_processor())
+		debugfs_create_file("vp_manual_hint", 0600, arch_debugfs_dir, NULL, &fops_pv_vp_manual_hint);
+	return 0;
+}
+
+device_initcall(paravirt_debugfs_init)
 #endif
-- 
2.39.3

