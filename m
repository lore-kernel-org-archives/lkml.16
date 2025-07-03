Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0D21A2622
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 19:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751571225; cv=none; b=DP9/1c21mKBskGFAk4D8GC+/dRVUw7WaBrSsVMK2uszUVGl+NOJsaPEpk+6f+b1x+vW6Jp9qR6LDkzytZvd2ENlR3sE79svrxpSwY4dW4PfK5PECyNlpjL23KnryxaPx1sGh5lh45fjDWZtU5xWcYQXd6zWQvATjKXRG+jVgfY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751571225; c=relaxed/simple;
	bh=9jSOn1U+5YSfFAvr4P3FSh5vj6Kl6fC5L7TMwsC2qk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cBL3ieWtff/qrBTvBBLjBNZQO1cOnIHzowtnYCRUpYnalDsNe7wQAlmaVWTzhkOj6zvja4cZuPjcLHvpveiFri7z8eS2AWKQ9WJrI5T22ZB5rZVLJq9rs8oQECxrHcaRhyXYoWoIv4w5ZlMIxX227Xe7Cb42QrbiB5gK453pnwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=mIht5ugY; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="mIht5ugY"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563BnN3r014460;
	Thu, 3 Jul 2025 19:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Ltj5Jp
	3Em+ch7JLehO/KiqELaI+n46HQbId9wRM+J3g=; b=mIht5ugY9asKrTkH7Mzb3X
	WYDvebFCLnMYMxjTSwfJHehHLg50UXKvNfyR2Pg+Bf8Vq6Wpcq7bGtj20PR87rZf
	D2IJ1XlMJXbYuek977v6n+KyjezImK1571IB4g1msxqLRS4D5Kf/wyx6M9V10Cn1
	dsCvaT10qhiJkyjb2HFZNcnKuFTBpktgSjgJ/XaNuR9n534L3GDItDDiKePrZGZY
	KsT3YEtjbaRZ7h5kso0sbvlA1v633b1JiQS6o9uhK7CnpP5UdS4TFFoKsulMx9Bx
	WiMwVJiOjQOa6VtubnzXzUwlgl+XKm1ui6zDHglIfXiSNHUlldcBVGJoSRiPQ2aw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j82g5bu3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 19:33:21 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 563JNkpD026490;
	Thu, 3 Jul 2025 19:33:21 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j82g5bu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 19:33:21 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 563HIm1e021914;
	Thu, 3 Jul 2025 19:33:20 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47juqpxgd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 19:33:20 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 563JXIRJ52887888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Jul 2025 19:33:18 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7ED572004B;
	Thu,  3 Jul 2025 19:33:18 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B276B20040;
	Thu,  3 Jul 2025 19:33:14 +0000 (GMT)
Received: from [9.39.27.83] (unknown [9.39.27.83])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  3 Jul 2025 19:33:14 +0000 (GMT)
Message-ID: <398a83d7-0a8c-42cb-af66-5974582cc2ae@linux.ibm.com>
Date: Fri, 4 Jul 2025 01:03:13 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch v3 02/20] sched: Several fixes for cache aware
 scheduling
To: Tim Chen <tim.c.chen@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        "Gautham R . Shenoy" <gautham.shenoy@amd.com>
Cc: Chen Yu <yu.c.chen@intel.com>, Juri Lelli <juri.lelli@redhat.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        Tim Chen <tim.c.chen@intel.com>,
        Vincent Guittot
 <vincent.guittot@linaro.org>,
        Libo Chen <libo.chen@oracle.com>, Abel Wu <wuyun.abel@bytedance.com>,
        Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
        Hillf Danton <hdanton@sina.com>, Len Brown <len.brown@intel.com>,
        linux-kernel@vger.kernel.org
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
 <d73418022de76dab9f60c0c5432d783b3b2833dc.1750268218.git.tim.c.chen@linux.intel.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <d73418022de76dab9f60c0c5432d783b3b2833dc.1750268218.git.tim.c.chen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rPQf2zUSksgfqcwwexAUaPYfuDD8k85b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE2MCBTYWx0ZWRfX5qJg3V4rASG1 6WSWt7hVVpf707ru4Vuv0J4nEaOF1Wc5tQEN/JYEEIFyslO3qoiTgtWtThcOgGLfYVkPwCQXjgm qudIvopGpDdoBLq2nvWudAytKJITN8zHLwohPA9oCWGGRZ3LwC3ahAiFSRlpNmGDKmPyLOURG43
 Kg9sCRe6a9m8G6n7yLlvPfIrawcVwPr51SLhRNHQaWFqK/1WepuOyAs01iAr8GobHxic5xOC1d+ js2S0bzv+7L0VFjBTFfSPGtjBXcKolDeLKiRinLSycVfzSMVElDyX8FI5oIZ1GlCY7Lr+I5BhYi xzf4jtH0viwjUI7lAgza6hQV89W/POXb3nqfGbU/q/4WDDADgaFIul3/6nuRLFuz00MTtyG1xjo
 xb3Uw9ejEEe8ervRyr2cD+lTPYcyjo96cp3o9TeEW7CqN/17wtw7zJylTGQ2m8iBaGCb4ehO
X-Authority-Analysis: v=2.4 cv=LpeSymdc c=1 sm=1 tr=0 ts=6866db01 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QyXUC8HyAAAA:8 a=QBC6ypOX7t1BjyNiuOcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: LnQFe_glSD1D_JsCZIrNCh9DeX43h-Wy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011
 impostorscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030160



On 6/18/25 23:57, Tim Chen wrote:
> From: Chen Yu <yu.c.chen@intel.com>
> 
> 1. Fix compile error on percpu allocation.
> 2. Enqueue to the target CPU rather than the current CPU.
> 3. NULL LLC sched domain check(Libo Chen).
> 4. Introduce sched feature SCHED_CACHE to control cache aware scheduling
> 5. Fix unsigned occupancy initialization to -1.
> 6. If there is only 1 thread in the process, no need to enable cache
>     awareness
> 7. Add __maybe_unused to __migrate_degrades_locality() to
>     avoid compile warnings.
> 
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> ---
>   include/linux/mm_types.h |  4 ++--
>   kernel/sched/fair.c      | 27 ++++++++++++++++-----------
>   kernel/sched/features.h  |  1 +
>   3 files changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 013291c6aaa2..9de4a0a13c4d 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -1411,11 +1411,11 @@ static inline void mm_set_cpus_allowed(struct mm_struct *mm, const struct cpumas
>   #endif /* CONFIG_SCHED_MM_CID */
>   
>   #ifdef CONFIG_SCHED_CACHE
> -extern void mm_init_sched(struct mm_struct *mm, struct mm_sched *pcpu_sched);
> +extern void mm_init_sched(struct mm_struct *mm, struct mm_sched __percpu *pcpu_sched);
>   
>   static inline int mm_alloc_sched_noprof(struct mm_struct *mm)
>   {
> -	struct mm_sched *pcpu_sched = alloc_percpu_noprof(struct mm_sched);
> +	struct mm_sched __percpu *pcpu_sched = alloc_percpu_noprof(struct mm_sched);
>   	if (!pcpu_sched)
>   		return -ENOMEM;
>   
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index df7d4a324fbe..89db97f8ef02 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1175,7 +1175,7 @@ static s64 update_curr_se(struct rq *rq, struct sched_entity *curr)
>   #define EPOCH_PERIOD	(HZ/100)	/* 10 ms */
>   #define EPOCH_OLD	5		/* 50 ms */
>   
> -void mm_init_sched(struct mm_struct *mm, struct mm_sched *_pcpu_sched)
> +void mm_init_sched(struct mm_struct *mm, struct mm_sched __percpu *_pcpu_sched)
>   {
>   	unsigned long epoch;
>   	int i;
> @@ -1186,7 +1186,7 @@ void mm_init_sched(struct mm_struct *mm, struct mm_sched *_pcpu_sched)
>   
>   		pcpu_sched->runtime = 0;
>   		pcpu_sched->epoch = epoch = rq->cpu_epoch;
> -		pcpu_sched->occ = -1;
> +		pcpu_sched->occ = 0;
>   	}
>   
>   	raw_spin_lock_init(&mm->mm_sched_lock);
> @@ -1254,7 +1254,7 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
>   	if (!mm || !mm->pcpu_sched)
>   		return;
>   
> -	pcpu_sched = this_cpu_ptr(p->mm->pcpu_sched);
> +	pcpu_sched = per_cpu_ptr(p->mm->pcpu_sched, cpu_of(rq));
>   
>   	scoped_guard (raw_spinlock, &rq->cpu_epoch_lock) {
>   		__update_mm_sched(rq, pcpu_sched);
> @@ -1264,12 +1264,14 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
>   	}
>   
>   	/*
> -	 * If this task hasn't hit task_cache_work() for a while, invalidate
> +	 * If this task hasn't hit task_cache_work() for a while, or it
> +	 * has only 1 thread, invalidate
>   	 * it's preferred state.
>   	 */
> -	if (epoch - READ_ONCE(mm->mm_sched_epoch) > EPOCH_OLD) {
> +	if (epoch - READ_ONCE(mm->mm_sched_epoch) > EPOCH_OLD ||
> +	    get_nr_threads(p) <= 1) {
>   		mm->mm_sched_cpu = -1;
> -		pcpu_sched->occ = -1;
> +		pcpu_sched->occ = 0;
>   	}
>   }
>   
> @@ -1286,9 +1288,6 @@ static void task_tick_cache(struct rq *rq, struct task_struct *p)
>   
>   	guard(raw_spinlock)(&mm->mm_sched_lock);
>   
> -	if (mm->mm_sched_epoch == rq->cpu_epoch)
> -		return;
> -
>   	if (work->next == work) {
>   		task_work_add(p, work, TWA_RESUME);
>   		WRITE_ONCE(mm->mm_sched_epoch, rq->cpu_epoch);
> @@ -1322,6 +1321,9 @@ static void task_cache_work(struct callback_head *work)
>   			unsigned long occ, m_occ = 0, a_occ = 0;
>   			int m_cpu = -1, nr = 0, i;
>   
> +			if (!sd)
> +				continue;
> +
>   			for_each_cpu(i, sched_domain_span(sd)) {
>   				occ = fraction_mm_sched(cpu_rq(i),
>   							per_cpu_ptr(mm->pcpu_sched, i));
> @@ -8801,6 +8803,9 @@ static int select_cache_cpu(struct task_struct *p, int prev_cpu)
>   	struct mm_struct *mm = p->mm;
>   	int cpu;
>   
> +	if (!sched_feat(SCHED_CACHE))
> +		return prev_cpu;
> +
>   	if (!mm || p->nr_cpus_allowed == 1)
>   		return prev_cpu;
>   
> @@ -9555,7 +9560,7 @@ static int task_hot(struct task_struct *p, struct lb_env *env)
>   		return 0;
>   
>   #ifdef CONFIG_SCHED_CACHE
> -	if (p->mm && p->mm->pcpu_sched) {
> +	if (sched_feat(SCHED_CACHE) && p->mm && p->mm->pcpu_sched) {
>   		/*
>   		 * XXX things like Skylake have non-inclusive L3 and might not
>   		 * like this L3 centric view. What to do about L2 stickyness ?
> @@ -9633,7 +9638,7 @@ static long migrate_degrades_locality(struct task_struct *p, struct lb_env *env)
>   }
>   
>   #else
> -static long __migrate_degrades_locality(struct task_struct *p, int src_cpu, int dst_cpu, bool idle)
> +static __maybe_unused long __migrate_degrades_locality(struct task_struct *p, int src_cpu, int dst_cpu, bool idle)
>   {
>   	return 0;
>   }
> diff --git a/kernel/sched/features.h b/kernel/sched/features.h
> index 3c12d9f93331..d2af7bfd36bf 100644
> --- a/kernel/sched/features.h
> +++ b/kernel/sched/features.h
> @@ -87,6 +87,7 @@ SCHED_FEAT(TTWU_QUEUE, true)
>    */
>   SCHED_FEAT(SIS_UTIL, true)
>   
> +SCHED_FEAT(SCHED_CACHE, true)

Having both SCHED_FEAT and CONFIG_SCHED_CACHE seems like overkill.
Is it really necessary to have both?

Also, given the complexity it brings and only a workloads which spawns threads
which have data sharing among them benefit, it could be false by default.

>   /*
>    * Issue a WARN when we do multiple update_rq_clock() calls
>    * in a single rq->lock section. Default disabled because the

