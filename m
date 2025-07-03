Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297242DE6EE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 19:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751571880; cv=none; b=bTZl+/nvzFIkDq+YHSOfhA7yzLQjNGtl/VE5FNGQk2i/+kTG1XQoUnrOd7AIBR+6Ag5D+oa++RTLf9+J7rGQbgA2J8ZhYLny1u1FjnJ2xurLO7aTB6LfE4qUU2C5KaEOL9GU9bjK++inGW0lLW0OSC0cceqTKl6eaNnx9h0unpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751571880; c=relaxed/simple;
	bh=IWDH8le4xe8elu8fdquREBAqu+n3E67DPnao8fXqSJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rLqinL2Uq+kqLS3b611uc/tAfST6ScoKlOqMDQdFkvoIS+iCA6D0/6BN/MDKpfUyF7Cwbu3qsAZfYbkLy72GHGGfH2Fuf3324yTA1NPNJiPPEcHB1By7L4gzioharSfUARPpDgLuizIUa6E18D0hABiCg5ylrLQByeXtoW8T/Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=pni/CG3i; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="pni/CG3i"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563IfZTX025403;
	Thu, 3 Jul 2025 19:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=3fEtm8
	prYM/0ADHyT6vh9eudBl4SUqlt4FZjzeMHU+Y=; b=pni/CG3iclLkub6+nhZx6W
	5CFqC6fPQ0jgbibgkvPvLULmf0Nc+E0ChQhphR8l4dojlZQWIYF+OtwEmCmjKZAN
	LgXMUYr6mVxFGvwzXA/n1FoYk/9UB7fjd+gdFzY/+qU3WkgiB2nvZKHXaeBaN/GL
	dsg9SrLgQdLB0qgG2ZEQwZJqmvWUQCMllXpzYspn8GnWD/Mh/tDeQtRgRtcA5PUg
	GRvNd0FcBMATAuiusU/06smqQUTF5LPRB3EIf5xh0Jl5V98YI6Iq+fCXizWS48j8
	2zLWsHNKO8jWKs6YcXLrNVFoTTUT+zz1kkvrFoEmkbIOIGayykXU7C64iMqpxh2Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j8315v6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 19:44:17 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 563JTavR000646;
	Thu, 3 Jul 2025 19:44:17 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j8315v66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 19:44:17 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 563IZb8Y021398;
	Thu, 3 Jul 2025 19:44:16 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 47jwe3p6u8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 19:44:16 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 563JiENq44368332
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Jul 2025 19:44:14 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5788A2004B;
	Thu,  3 Jul 2025 19:44:14 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8944620043;
	Thu,  3 Jul 2025 19:44:10 +0000 (GMT)
Received: from [9.39.27.83] (unknown [9.39.27.83])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  3 Jul 2025 19:44:10 +0000 (GMT)
Message-ID: <1f7e5b4f-a3c3-4505-ae83-bf7dea918571@linux.ibm.com>
Date: Fri, 4 Jul 2025 01:14:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch v3 08/20] sched: Set up LLC indexing
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
 <71e251a086be786fb2a0480bbab69142d14bd22d.1750268218.git.tim.c.chen@linux.intel.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <71e251a086be786fb2a0480bbab69142d14bd22d.1750268218.git.tim.c.chen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: igyJ08uLjKQ7fLow-AECogtj_YJ7o_sk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE2MCBTYWx0ZWRfXwb0miFHfIGXM Evhm0WRH1U7cqHCkSNCRAoRJ6r71gNF0mDhDYCgXid0deCdc5Ksgyfu0XwwH+nIL1La0jT1Z746 iMeT9vzVA5WtTPSE4olVpOTCz+SEy9oi2D/quH/QYvaPLZ8diNag3DVm5KrqmsttdIqllzru3yj
 arjSB5mZSgqwVXHKEiNxLewteKLgu8GHe0Nc4H3X4hDrFuG7/eVP0XTL+gPIpyUdk11w1Qf7O3t 0O3kx+2+pYHJPfwuZ2y1WZDSLNNY5bHC/0SMKrC3z5olztF27qwiYIagg1kPWJoGK3J64HkQWdA EeDgEFAj6MTR90oLtE4kz/dyVcJxwkAWuMHaFLq+OfE7sBKlwnAc1RoAgLBMiadEOIgnag1ItCd
 InhI7PYj6HlVPrdaV4eGQp1uc0UqLoOoEHgu/J4NFvx+NXNCUsfP0STwiRcG7OL2IyjIyUT/
X-Authority-Analysis: v=2.4 cv=MOlgmNZl c=1 sm=1 tr=0 ts=6866dd91 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QyXUC8HyAAAA:8 a=rbtcADaCff8QXbXjuFAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: MD_rfHPRlo_smykyynTMIb6D1qxkVEUm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030160



On 6/18/25 23:57, Tim Chen wrote:
> Prepare for indexing arrays that track in each run queue: the number
> of tasks preferring current LLC and each of the other LLC.
> 
> The reason to introduce LLC index is because the per LLC-scope data
> is needed to do cache aware load balancing. However, the native lld_id
> is usually the first CPU of that LLC domain, which is not continuous,
> which might waste the space if the per LLC-scope data is stored
> in an array (in current implementation).
> 
> In the future, this LLC index could be removed after
> the native llc_id is used as the key to search into xarray based
> array.
> 
> Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
> ---
>   include/linux/sched.h   |  3 +++
>   kernel/sched/fair.c     | 12 ++++++++++++
>   kernel/sched/sched.h    |  2 ++
>   kernel/sched/topology.c | 29 +++++++++++++++++++++++++++++
>   4 files changed, 46 insertions(+)
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index d0e4cda2b3cd..7ce95a32e9ff 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -810,6 +810,9 @@ struct kmap_ctrl {
>   #endif
>   };
>   
> +/* XXX need fix to not use magic number */
> +#define MAX_LLC 64

This number needs to be much higher. maybe keeping NR_CPUS wont hurt.

> +
>   struct task_struct {
>   #ifdef CONFIG_THREAD_INFO_IN_TASK
>   	/*
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 10ea408d0e40..5549710d95cf 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1183,6 +1183,18 @@ static int llc_id(int cpu)
>   	return per_cpu(sd_llc_id, cpu);
>   }
>   
> +/*
> + * continous index.
> + * TBD: replace by xarray with key llc_id()
> + */
> +static inline int llc_idx(int cpu)
> +{
> +	if (cpu < 0)
> +		return -1;
> +
> +	return per_cpu(sd_llc_idx, cpu);
> +}
> +
>   void mm_init_sched(struct mm_struct *mm, struct mm_sched __percpu *_pcpu_sched)
>   {
>   	unsigned long epoch;
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 1c6fd45c7f62..74eb2f3615aa 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -2037,6 +2037,7 @@ static inline struct sched_domain *lowest_flag_domain(int cpu, int flag)
>   DECLARE_PER_CPU(struct sched_domain __rcu *, sd_llc);
>   DECLARE_PER_CPU(int, sd_llc_size);
>   DECLARE_PER_CPU(int, sd_llc_id);
> +DECLARE_PER_CPU(int, sd_llc_idx);
>   DECLARE_PER_CPU(int, sd_share_id);
>   DECLARE_PER_CPU(struct sched_domain_shared __rcu *, sd_llc_shared);
>   DECLARE_PER_CPU(struct sched_domain __rcu *, sd_numa);
> @@ -2045,6 +2046,7 @@ DECLARE_PER_CPU(struct sched_domain __rcu *, sd_asym_cpucapacity);
>   
>   extern struct static_key_false sched_asym_cpucapacity;
>   extern struct static_key_false sched_cluster_active;
> +extern int max_llcs;
>   
>   static __always_inline bool sched_asym_cpucap_active(void)
>   {
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index f1ebc60d967f..b7bb13045dd8 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -672,6 +672,7 @@ static void destroy_sched_domains(struct sched_domain *sd)
>   DEFINE_PER_CPU(struct sched_domain __rcu *, sd_llc);
>   DEFINE_PER_CPU(int, sd_llc_size);
>   DEFINE_PER_CPU(int, sd_llc_id);
> +DEFINE_PER_CPU(int, sd_llc_idx);
>   DEFINE_PER_CPU(int, sd_share_id);
>   DEFINE_PER_CPU(struct sched_domain_shared __rcu *, sd_llc_shared);
>   DEFINE_PER_CPU(struct sched_domain __rcu *, sd_numa);
> @@ -681,6 +682,25 @@ DEFINE_PER_CPU(struct sched_domain __rcu *, sd_asym_cpucapacity);
>   DEFINE_STATIC_KEY_FALSE(sched_asym_cpucapacity);
>   DEFINE_STATIC_KEY_FALSE(sched_cluster_active);
>   
> +int max_llcs = -1;
> +
> +static void update_llc_idx(int cpu)
> +{
> +#ifdef CONFIG_SCHED_CACHE
> +	int idx = -1, llc_id = -1;
> +
> +	llc_id = per_cpu(sd_llc_id, cpu);
> +	idx = per_cpu(sd_llc_idx, llc_id);
> +
> +	if (idx < 0) {
> +		idx = max_llcs++;
> +		BUG_ON(idx > MAX_LLC); 

maybe a warning instead here?

> +		per_cpu(sd_llc_idx, llc_id) = idx;
> +	}
> +	per_cpu(sd_llc_idx, cpu) = idx;
> +#endif
> +}
> +
>   static void update_top_cache_domain(int cpu)
>   {
>   	struct sched_domain_shared *sds = NULL;
> @@ -699,6 +719,7 @@ static void update_top_cache_domain(int cpu)
>   	per_cpu(sd_llc_size, cpu) = size;
>   	per_cpu(sd_llc_id, cpu) = id;
>   	rcu_assign_pointer(per_cpu(sd_llc_shared, cpu), sds);
> +	update_llc_idx(cpu);
>   
>   	sd = lowest_flag_domain(cpu, SD_CLUSTER);
>   	if (sd)
> @@ -2394,6 +2415,14 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
>   	bool has_asym = false;
>   	bool has_cluster = false;
>   
> +#ifdef CONFIG_SCHED_CACHE
> +	if (max_llcs < 0) {
> +		for_each_possible_cpu(i)
> +			per_cpu(sd_llc_idx, i) = -1;
> +		max_llcs = 0;
> +	}
> +#endif
> +
>   	if (WARN_ON(cpumask_empty(cpu_map)))
>   		goto error;
>   

