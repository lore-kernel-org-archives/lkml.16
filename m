Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC98A2288C3
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744881579; cv=none; b=OAObK1xxI3lZx6KfHTZerFpzB+sLeKImCBmaQgIOGo65UCi92KLjjFw7Wb5YhpCcdoWD3CecY/1AVwO7t7Xm02rxuwpc/P+nALeoTPB0j8W02DX+8YQGwitGmQV3PQKpbfxXDgxfgx2B115kXPRKGpQJGWR/m8PR8yVSJedmD4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744881579; c=relaxed/simple;
	bh=Ylf0Ip+j+wp+NQRSGRA5HQfnG83N9uNyl5OVFc/4JbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZUgHpCQW5VFzNjtO0NUgkYDkzAWLFrxiVgfV8eWXOzr7UXfwL5HTnkKM+jNm/BCa4uAubZ7Pu66jX6UK/01A0B3ePilOOFmZDWT48c9nOp7mh+VTUo/Vil8vghaCs5+SJ+xXE8ObCqoZZWBy0m4TwlSOt74ghoudAcdHxih5N4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Gi9qwnLt; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Gi9qwnLt"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLdEHw016618;
	Thu, 17 Apr 2025 09:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=c8WnN0
	y0wFJKqb7B3e+6L+n496yH9B+pysfyySy9kJc=; b=Gi9qwnLtm1FL3FemqBl1gp
	BiBQstU5PEj6uriKWajZO7PAufz5xvcKurJTtfjRAuxrSJgbrlM0EoNK/Np/Ms53
	Ve+mVWLzWipUmM3mN2+scTNkoc9SqgRA1+ys1KetAlJndeE6pAg+YAR6lToooEU8
	cnSh0jb91z69/eWgAtWtbI1iF1vzq1RQMz7eGoZYpsE5CV3mIR2jPdCw4xWVM8lM
	SecN2FbOYFkDIkQxStIqzzoBkDZLZ4qDRpifnizys5FjkwqMW8jKA0aqTJQJtn0u
	3Ccvpum8yJJ67oLGoYH4asUMDercd5Gzoox0CVXuWTchrrdguwOHLmw3QjyzRFNQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 462mn7tkvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 09:19:28 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53H8e8RH024874;
	Thu, 17 Apr 2025 09:19:27 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4602gtn8ja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 09:19:27 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53H9JQXl33817338
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 09:19:26 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0121A20043;
	Thu, 17 Apr 2025 09:19:26 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A68120040;
	Thu, 17 Apr 2025 09:19:24 +0000 (GMT)
Received: from [9.39.24.204] (unknown [9.39.24.204])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 17 Apr 2025 09:19:24 +0000 (GMT)
Message-ID: <82baaf6c-f3d9-4c3e-be69-24389eadb18c@linux.ibm.com>
Date: Thu, 17 Apr 2025 14:49:23 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched: Skip useless sched_balance_running acquisition if
 load balance is not due
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
        Doug Nelson <doug.nelson@intel.com>,
        Mohini Narkhede <mohini.narkhede@intel.com>,
        linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>, "Chen, Yu C" <yu.c.chen@intel.com>
References: <20250416035823.1846307-1-tim.c.chen@linux.intel.com>
 <fbe29b49-92af-4b8c-b7c8-3c15405e5f15@linux.ibm.com>
 <667f2076-fbcd-4da7-8e4b-a8190a673355@intel.com>
 <5e191de4-f580-462d-8f93-707addafb9a2@linux.ibm.com>
 <23e05939e7a19151d9b17d011e48a85d650b4e8a.camel@linux.intel.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <23e05939e7a19151d9b17d011e48a85d650b4e8a.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=ANnAolku c=1 sm=1 tr=0 ts=6800c7a0 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=j9ACozpduBSlqxEhICoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: daWXHAUEoCY0nVC9eRDj_emvx_je2tLs
X-Proofpoint-ORIG-GUID: daWXHAUEoCY0nVC9eRDj_emvx_je2tLs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_02,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170070



On 4/16/25 21:49, Tim Chen wrote:
> On Wed, 2025-04-16 at 14:46 +0530, Shrikanth Hegde wrote:
>>

>>
> You mean doing a should_we_balance() check?  I think we should not
> even consider that if balance time is not due and this balance due check should
> come first.
> 
Hi Tim.

This is the code I was suggesting.

---

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0c19459c8042..e712934973e7 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -11723,6 +11723,21 @@ static void update_lb_imbalance_stat(struct lb_env *env, struct sched_domain *sd
                 break;
         }
  }
+/*
+ * This flag serializes load-balancing passes over large domains
+ * (above the NODE topology level) - only one load-balancing instance
+ * may run at a time, to reduce overhead on very large systems with
+ * lots of CPUs and large NUMA distances.
+ *
+ * - Note that load-balancing passes triggered while another one
+ *   is executing are skipped and not re-tried.
+ *
+ * - Also note that this does not serialize rebalance_domains()
+ *   execution, as non-SD_SERIALIZE domains will still be
+ *   load-balanced in parallel.
+ */
+static atomic_t sched_balance_running = ATOMIC_INIT(0);
+
  
  /*
   * Check this_cpu to ensure it is balanced within domain. Attempt to move
@@ -11738,6 +11753,7 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
         struct rq *busiest;
         struct rq_flags rf;
         struct cpumask *cpus = this_cpu_cpumask_var_ptr(load_balance_mask);
+       int need_serialize = 0;
         struct lb_env env = {
                 .sd             = sd,
                 .dst_cpu        = this_cpu,
@@ -11760,6 +11776,12 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
                 goto out_balanced;
         }
  
+       need_serialize = (idle!=CPU_NEWLY_IDLE) && sd->flags & SD_SERIALIZE;
+       if (need_serialize) {
+               if (atomic_cmpxchg_acquire(&sched_balance_running, 0, 1))
+                       return ld_moved;
+       }
+
         group = sched_balance_find_src_group(&env);
         if (!group) {
                 schedstat_inc(sd->lb_nobusyg[idle]);
@@ -11884,6 +11906,8 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
                         if (!cpumask_subset(cpus, env.dst_grpmask)) {
                                 env.loop = 0;
                                 env.loop_break = SCHED_NR_MIGRATE_BREAK;
+                               if (need_serialize)
+                                       atomic_set_release(&sched_balance_running, 0);
                                 goto redo;
                         }
                         goto out_all_pinned;
@@ -12000,6 +12024,9 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
             sd->balance_interval < sd->max_interval)
                 sd->balance_interval *= 2;
  out:
+       if (need_serialize)
+               atomic_set_release(&sched_balance_running, 0);
+
         return ld_moved;
  }
  
@@ -12124,21 +12151,6 @@ static int active_load_balance_cpu_stop(void *data)
         return 0;
  }
  
-/*
- * This flag serializes load-balancing passes over large domains
- * (above the NODE topology level) - only one load-balancing instance
- * may run at a time, to reduce overhead on very large systems with
- * lots of CPUs and large NUMA distances.
- *
- * - Note that load-balancing passes triggered while another one
- *   is executing are skipped and not re-tried.
- *
- * - Also note that this does not serialize rebalance_domains()
- *   execution, as non-SD_SERIALIZE domains will still be
- *   load-balanced in parallel.
- */
-static atomic_t sched_balance_running = ATOMIC_INIT(0);
-
  /*
   * Scale the max sched_balance_rq interval with the number of CPUs in the system.
   * This trades load-balance latency on larger machines for less cross talk.
@@ -12188,7 +12200,7 @@ static void sched_balance_domains(struct rq *rq, enum cpu_idle_type idle)
         /* Earliest time when we have to do rebalance again */
         unsigned long next_balance = jiffies + 60*HZ;
         int update_next_balance = 0;
-       int need_serialize, need_decay = 0;
+       int need_decay = 0;
         u64 max_cost = 0;
  
         rcu_read_lock();
@@ -12213,12 +12225,6 @@ static void sched_balance_domains(struct rq *rq, enum cpu_idle_type idle)
  
                 interval = get_sd_balance_interval(sd, busy);
  
-               need_serialize = sd->flags & SD_SERIALIZE;
-               if (need_serialize) {
-                       if (atomic_cmpxchg_acquire(&sched_balance_running, 0, 1))
-                               goto out;
-               }
-
                 if (time_after_eq(jiffies, sd->last_balance + interval)) {
                         if (sched_balance_rq(cpu, rq, sd, idle, &continue_balancing)) {
                                 /*
@@ -12232,9 +12238,7 @@ static void sched_balance_domains(struct rq *rq, enum cpu_idle_type idle)
                         sd->last_balance = jiffies;
                         interval = get_sd_balance_interval(sd, busy);
                 }
-               if (need_serialize)
-                       atomic_set_release(&sched_balance_running, 0);
-out:
+
                 if (time_after(next_balance, sd->last_balance + interval)) {
                         next_balance = sd->last_balance + interval;
                         update_next_balance = 1;
