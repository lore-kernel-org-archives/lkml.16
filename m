Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EBF239581
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 19:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751571965; cv=none; b=BKdS7pDYfU2e0lP33Fdwfiz+jKd6QrFhwwtP09KxsNSEXwsm0VrqSCw/PwFTDwfilAvaWicukmksP1hD16s1GRmUawhXgWEFWJN35RV2u7GHxqxuwoNn9OVnf0WiLevz+GFfGcaZMUNsfN/M9HxOu3kw1pPeIWR4c1jzjmtZ5sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751571965; c=relaxed/simple;
	bh=KlyYqZCAxKhqqeoY2Y2+0nagws72LsHIuWBNs7CRavM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pg+ugssmj8tpi+KQO8JmK4QgzNX4OgsqXGG01dF5vXFUXHCWMKmQq9sV0WgPt3bhiHxSLd4w08bbGAdDBCLYpyUNaaGN5krw5qjenuW4D8UiiYernu53eMXHvSp9HGQ/5rNmJZQa17IZiX/pFL/QPDGt5TbVKi+S+rin/eP9fDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=MYSTCoiA; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="MYSTCoiA"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563EKr76015228;
	Thu, 3 Jul 2025 19:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=NlUyNs
	kBq8Nw4P8PRlVpue1qQpHaIoPLnPuO5+bpSL4=; b=MYSTCoiAaX0t7lJy6B1PyT
	sh30JSmvwplFft3jET9munzzCC46wMAz0xugEsprAJ9CnwvBsvkag+ewp+LgDpTN
	CKsPHTPAh9Ij16hdSb8hBuiBNpdfZfsPwNbTdahC3gWkzxWzVfkxj3qL4MwHxqrj
	ZhzA7GgpYIbnFIp+rSTujQFO7kGCmXRjPmBTjxR2lp68Sxnxbi593IJWyg98gk88
	YOkMTZ79+vckRF17Zu5j7cYYaJG3Pzvo3+AUTQ/0k45Eoug+WrOuv0JHIPmPchuy
	5U6IPmTbG33aE0sZo7Lz/sQwVUbCQ1BtFoAPThn1sSF8l+rHoEvb7GmbPufku2HA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j82g5d71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 19:45:43 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 563JhU05031333;
	Thu, 3 Jul 2025 19:45:42 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j82g5d6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 19:45:42 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 563I4Bwo011823;
	Thu, 3 Jul 2025 19:45:41 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47jv7n6eq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 19:45:41 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 563JjdPW32572032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Jul 2025 19:45:39 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B733720043;
	Thu,  3 Jul 2025 19:45:39 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB0562004E;
	Thu,  3 Jul 2025 19:45:35 +0000 (GMT)
Received: from [9.39.27.83] (unknown [9.39.27.83])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  3 Jul 2025 19:45:35 +0000 (GMT)
Message-ID: <b5e454a8-6533-446b-9546-37fc63e9089e@linux.ibm.com>
Date: Fri, 4 Jul 2025 01:15:35 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch v3 10/20] sched: Calculate the number of tasks that
 have LLC preference on a runqueue
To: Tim Chen <tim.c.chen@linux.intel.com>, Chen Yu <yu.c.chen@intel.com>
Cc: Juri Lelli <juri.lelli@redhat.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        Tim Chen <tim.c.chen@intel.com>,
        Vincent Guittot
 <vincent.guittot@linaro.org>,
        Libo Chen <libo.chen@oracle.com>, Abel Wu <wuyun.abel@bytedance.com>,
        Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
        Hillf Danton <hdanton@sina.com>, Len Brown <len.brown@intel.com>,
        linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        "Gautham R . Shenoy" <gautham.shenoy@amd.com>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
 <0664be8a3e805ed93eb930131951b1a84cebed66.1750268218.git.tim.c.chen@linux.intel.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <0664be8a3e805ed93eb930131951b1a84cebed66.1750268218.git.tim.c.chen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2HcFZvKoMkHp9_eXx-DeuPdfvB4_2lLr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE2MCBTYWx0ZWRfXw6xiKNTT7F1G oezLRP4BRyghdQqnQlyhrXcW31idU8g78AP04wF8XLaiyI2BMP1S2OpkHRVvZoDnGNLPpAx4jwU mtdxMyNYs48gFjyrcFCALr7ef7wpE/RCaJuBquhnJITJV/G1bbkeT8HyDtDebN6d90nQg7Gw2N3
 kArsfSJapA0v20egTsTk1Gn9cysESchj96yvLQ5jjtHEkBidbKqSZHBZi05zvdIAamBQxRz2gsj IcwhrKXAVpZyS0jmdYyrnGlZ/9tuWgy1piQw9YT/BUCT1Bp88bQn8lcpAIufpYi0RA3fktlvlU3 eh4GHRPU5ycx4uFVi/oUizSeHVm++jcLyuXgRWBs/g3MNpVRTXgEBF5dkHt2LJdqMN5boacgyPG
 1y33A05VUnui/J4ojd5KIwKWhTdmev/hzRs+J/mKw/ZcEGkFmgnYvDz9zpQESdGYTT+IMCCy
X-Authority-Analysis: v=2.4 cv=LpeSymdc c=1 sm=1 tr=0 ts=6866dde7 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=AynvelB-xCFbiBmI:21 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QyXUC8HyAAAA:8 a=5GvQ3MoFtB6bETeWhTMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: RgmI-_NB8avJwRTlIqeycByMNIiQvxER
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030160



On 6/18/25 23:57, Tim Chen wrote:
> Track for each run queue, the number of tasks that have a LLC preference
> and how many of those tasks are running in its preferred LLC.  This is
> similar to nr_numa_running and nr_preferred_running for NUMA balance,
> and will be used by the cache-aware load balancing in subsequent patches.
> 
> Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
> ---
>   kernel/sched/core.c  | 12 ++++++++++++
>   kernel/sched/fair.c  | 42 +++++++++++++++++++++++++++++++++++++++++-
>   kernel/sched/sched.h |  7 +++++++
>   3 files changed, 60 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index d9c3e75f79d1..34056eb79ef2 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -498,6 +498,18 @@ void __trace_set_current_state(int state_value)
>   }
>   EXPORT_SYMBOL(__trace_set_current_state);
>   
> +#ifdef CONFIG_SMP


CONFIG_SMP is true unconditionally now. Else may need to go.

> +int task_llc(const struct task_struct *p)
> +{
> +	return per_cpu(sd_llc_id, task_cpu(p));
> +}
> +#else
> +int task_llc(const struct task_struct *p)
> +{
> +	return 0;
> +}
> +#endif
> +
>   /*
>    * Serialization rules:
>    *
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index cc804a8c7061..88ff47194faa 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1195,6 +1195,18 @@ static inline int llc_idx(int cpu)
>   	return per_cpu(sd_llc_idx, cpu);
>   }
>   
> +static void account_llc_enqueue(struct rq *rq, struct task_struct *p)
> +{
> +	rq->nr_llc_running += (p->preferred_llc != -1);
> +	rq->nr_pref_llc_running += (p->preferred_llc == task_llc(p));
> +}
> +
> +static void account_llc_dequeue(struct rq *rq, struct task_struct *p)
> +{
> +	rq->nr_llc_running -= (p->preferred_llc != -1);
> +	rq->nr_pref_llc_running -= (p->preferred_llc == task_llc(p));
> +}
> +
>   void mm_init_sched(struct mm_struct *mm, struct mm_sched __percpu *_pcpu_sched)
>   {
>   	unsigned long epoch;
> @@ -1298,8 +1310,11 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
>   	if (mm->mm_sched_cpu != -1)
>   		mm_sched_llc = per_cpu(sd_llc_id, mm->mm_sched_cpu);
>   
> -	if (p->preferred_llc != mm_sched_llc)
> +	if (p->preferred_llc != mm_sched_llc) {
> +		account_llc_dequeue(rq, p);
>   		p->preferred_llc = mm_sched_llc;
> +		account_llc_enqueue(rq, p);
> +	}
>   }
>   
>   static void task_tick_cache(struct rq *rq, struct task_struct *p)
> @@ -1400,6 +1415,14 @@ void init_sched_mm(struct task_struct *p)
>   	work->next = work;
>   }
>   
> +void reset_llc_stats(struct rq *rq)
> +{
> +	if (rq->nr_llc_running)
> +		rq->nr_llc_running = 0;
> +
> +	rq->nr_pref_llc_running = 0;
> +}
> +
>   #else
>   
>   static inline void account_mm_sched(struct rq *rq, struct task_struct *p,
> @@ -1410,6 +1433,17 @@ void init_sched_mm(struct task_struct *p) { }
>   
>   static void task_tick_cache(struct rq *rq, struct task_struct *p) { }
>   
> +static void account_llc_enqueue(struct rq *rq, struct task_struct *p)
> +{
> +}
> +
> +static void account_llc_dequeue(struct rq *rq, struct task_struct *p)
> +{
> +}
> +
> +void reset_llc_stats(struct rq *rq)
> +{
> +}
>   #endif
>   
>   static inline
> @@ -3939,6 +3973,7 @@ account_entity_enqueue(struct cfs_rq *cfs_rq, struct sched_entity *se)
>   		struct rq *rq = rq_of(cfs_rq);
>   
>   		account_numa_enqueue(rq, task_of(se));
> +		account_llc_enqueue(rq, task_of(se));
>   		list_add(&se->group_node, &rq->cfs_tasks);
>   	}
>   #endif
> @@ -3952,10 +3987,15 @@ account_entity_dequeue(struct cfs_rq *cfs_rq, struct sched_entity *se)
>   #ifdef CONFIG_SMP
>   	if (entity_is_task(se)) {
>   		account_numa_dequeue(rq_of(cfs_rq), task_of(se));
> +		account_llc_dequeue(rq_of(cfs_rq), task_of(se));
>   		list_del_init(&se->group_node);
>   	}
>   #endif
>   	cfs_rq->nr_queued--;
> +
> +	/* safeguard? */
> +	if (!parent_entity(se) && !cfs_rq->nr_queued)
> +		reset_llc_stats(rq_of(cfs_rq));
>   }
>   
>   /*
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 74eb2f3615aa..6c83a71ac8ca 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -1104,6 +1104,10 @@ struct rq {
>   	unsigned int		nr_preferred_running;
>   	unsigned int		numa_migrate_on;
>   #endif
> +#ifdef CONFIG_SCHED_CACHE
> +	unsigned int		nr_pref_llc_running;
> +	unsigned int		nr_llc_running;
> +#endif
>   #ifdef CONFIG_NO_HZ_COMMON
>   #ifdef CONFIG_SMP
>   	unsigned long		last_blocked_load_update_tick;
> @@ -1948,6 +1952,9 @@ init_numa_balancing(unsigned long clone_flags, struct task_struct *p)
>   
>   #endif /* !CONFIG_NUMA_BALANCING */
>   
> +extern void reset_llc_stats(struct rq *rq);
> +extern int task_llc(const struct task_struct *p);
> +
>   #ifdef CONFIG_SMP
>   
>   static inline void

