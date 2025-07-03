Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963802F32
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 19:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751571027; cv=none; b=AC6aPHbefN3Lb2euv4RTfLt2p14HtJ7cOpLkG9x0HHtgJDBe0Jpcn1tFVxNP6HsUnuG2R/szGWy/u+u4fWyWSqvFrPyHTc/bBHJI9D/I7FfItxCPu4fMDqTxsRKTbWVQ/TmNCN/tHpzmRDFsxoS2SY0upNoKtklcb1U0LfOkyMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751571027; c=relaxed/simple;
	bh=lY6eu0CzRAFWUDIG1rOcCOICbu6K9S/d0Mh02T9xe2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pio/iSLJJ8OeT0xmVoO3fk24klI62viE6RCNkvPabhCb/nLTW//oy/LYg156OgkoF29lUpOWmt2NfzNlL6qBtpZa+jzIxVqJbJtXONiaieweP8/Hb9BEZ6ki8bdGc6CD5rH6P1uKjSqPtXr0wg1csClZUpy6gQPRu/Iq1q0+UoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=KU4r6w3m; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="KU4r6w3m"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563GAElI000758;
	Thu, 3 Jul 2025 19:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=4TO0MI
	6TO/UIsOAbMzG/IXiIFl0wjNRVUpryD4HUD9k=; b=KU4r6w3moip1MrLyGNo15j
	yxFzJJrtTciEHIStQZ2BFVh9TNMHR/RQ2IPs3Bt8hXeyJdKtDRbP6GgOLJ5cygGU
	W0kfSijZW+hIC0sNIz7nc7rv6f37qFlnvIH5VlgX+WzDCs4ZpXYFNSvrlYguYwfm
	+fpeoTPs53RtYXJoPs0U7qGnuNOwdSWtABWQ1rmH3kb3NcWwCbz63iDU6rAIcWEI
	V4tw4XziZbHbHRN6AVjvKKIP5KUOMYLXoqud4O5dsXgUqyxIqwNGXOXzvk98HHz0
	7V3POrdB3vgB1rEnoAG7leowCp8JWzt8YdZE+OfMQ7bH8nznGI+HJDIrY/mA8E+g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j5ttnqj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 19:30:02 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 563JU1WF012465;
	Thu, 3 Jul 2025 19:30:01 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j5ttnqhq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 19:30:01 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 563JA7qx021361;
	Thu, 3 Jul 2025 19:30:00 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 47jwe3p5fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 19:30:00 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 563JTwcP58327390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Jul 2025 19:29:58 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C470620043;
	Thu,  3 Jul 2025 19:29:58 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC3AE20040;
	Thu,  3 Jul 2025 19:29:54 +0000 (GMT)
Received: from [9.39.27.83] (unknown [9.39.27.83])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  3 Jul 2025 19:29:54 +0000 (GMT)
Message-ID: <b4cce11c-5ed6-4366-92c6-9a6b34998295@linux.ibm.com>
Date: Fri, 4 Jul 2025 00:59:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch v3 01/20] sched: Cache aware load-balancing
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
 <cbe56cb89cca4c3ddcbc9956a82bda23f5b81c57.1750268218.git.tim.c.chen@linux.intel.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <cbe56cb89cca4c3ddcbc9956a82bda23f5b81c57.1750268218.git.tim.c.chen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WDcaTcWGZBVeZ3JYigORZ5Z6stsPP7O-
X-Authority-Analysis: v=2.4 cv=UtNjN/wB c=1 sm=1 tr=0 ts=6866da3a cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=JfrnYn6hAAAA:8 a=8nD5lfHda5CJGBFOISUA:9 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: 0rT-iZ6zAH-kIt2s5-h15B2Adx2fUo5p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE2MCBTYWx0ZWRfXx531LZUiMh3I FTXMJJCGvi35sO+FefGS9+VROH6lQ3wrdp38Cf0Q0U2y3n5sytI1hyefg+o+AcvIvY/tp0iaHHh n0vsDnJKbfpxSYZ1cMDIDdTYL4slef0QRQ8vtJ4MUgu+2M9e0t8s6GajqxVM46JThA9BP7BC5OP
 GDrySb0pgUiXYN73PVTKglCWJ7M82k0CRaaFH6oMOsyj6rxvzAjHyLOYBjwxjb4AwFa1gUZDY70 T4r0Tsb0ZyzVUpN/iaWDVs7kZm5TLo0XUiC8TEr1yRwCISHMC1qECm6isOHalZ5ps8f6qFXhGLS S08IhJ+8YRlqqyEjVoqZilasaFzRVGrW+ehddZbfBPsIMEmbWRekLd///2ufQrf/Qe32weQtVg5
 p+NuTvQ/Xl02/T5RuQ6CiRyXV54cgucZUajnY8eylMAWt/XVMcIV48PnNRTY29SBNt8A5c4M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030160



Hi Tim, Chen,
skimming through the series and will try to go through in coming days.

> 
> One of the many things on the eternal todo list has been finishing the
> below hackery.
> 
> It is an attempt at modelling cache affinity -- and while the patch
> really only targets LLC, it could very well be extended to also apply to
> clusters (L2). Specifically any case of multiple cache domains inside a
> node.
> 
> Anyway, I wrote this about a year ago, and I mentioned this at the
> recent OSPM conf where Gautham and Prateek expressed interest in playing
> with this code.
> 
> So here goes, very rough and largely unproven code ahead :-)
> 
> It applies to current tip/master, but I know it will fail the __percpu
> validation that sits in -next, although that shouldn't be terribly hard
> to fix up.
> 
> As is, it only computes a CPU inside the LLC that has the highest recent
> runtime, this CPU is then used in the wake-up path to steer towards this
> LLC and in task_hot() to limit migrations away from it.
> 
> More elaborate things could be done, notably there is an XXX in there
> somewhere about finding the best LLC inside a NODE (interaction with
> NUMA_BALANCING).
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>   include/linux/mm_types.h |  44 ++++++
>   include/linux/sched.h    |   4 +
>   init/Kconfig             |   4 +
>   kernel/fork.c            |   5 +
>   kernel/sched/core.c      |  13 +-
>   kernel/sched/fair.c      | 330 +++++++++++++++++++++++++++++++++++++--
>   kernel/sched/sched.h     |   8 +
>   7 files changed, 388 insertions(+), 20 deletions(-)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 56d07edd01f9..013291c6aaa2 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -893,6 +893,12 @@ struct mm_cid {
>   };
>   #endif
>   
> +struct mm_sched {
> +	u64 runtime;
> +	unsigned long epoch;
> +	unsigned long occ;
> +};
> +
>   struct kioctx_table;
>   struct iommu_mm_data;
>   struct mm_struct {
> @@ -983,6 +989,17 @@ struct mm_struct {
>   		 */
>   		raw_spinlock_t cpus_allowed_lock;
>   #endif
> +#ifdef CONFIG_SCHED_CACHE
> +		/*
> +		 * Track per-cpu-per-process occupancy as a proxy for cache residency.
> +		 * See account_mm_sched() and ...
> +		 */
> +		struct mm_sched __percpu *pcpu_sched;
> +		raw_spinlock_t mm_sched_lock;
> +		unsigned long mm_sched_epoch;
> +		int mm_sched_cpu;
> +#endif
> +
>   #ifdef CONFIG_MMU
>   		atomic_long_t pgtables_bytes;	/* size of all page tables */
>   #endif
> @@ -1393,6 +1410,33 @@ static inline unsigned int mm_cid_size(void)
>   static inline void mm_set_cpus_allowed(struct mm_struct *mm, const struct cpumask *cpumask) { }
>   #endif /* CONFIG_SCHED_MM_CID */
>   
> +#ifdef CONFIG_SCHED_CACHE
> +extern void mm_init_sched(struct mm_struct *mm, struct mm_sched *pcpu_sched);
> +
> +static inline int mm_alloc_sched_noprof(struct mm_struct *mm)
> +{
> +	struct mm_sched *pcpu_sched = alloc_percpu_noprof(struct mm_sched);
> +	if (!pcpu_sched)
> +		return -ENOMEM;
> +
> +	mm_init_sched(mm, pcpu_sched);
> +	return 0;
> +}
> +
> +#define mm_alloc_sched(...)	alloc_hooks(mm_alloc_sched_noprof(__VA_ARGS__))
> +
> +static inline void mm_destroy_sched(struct mm_struct *mm)
> +{
> +	free_percpu(mm->pcpu_sched);
> +	mm->pcpu_sched = NULL;
> +}
> +#else /* !CONFIG_SCHED_CACHE */
> +
> +static inline int mm_alloc_sched(struct mm_struct *mm) { return 0; }
> +static inline void mm_destroy_sched(struct mm_struct *mm) { }
> +
> +#endif /* CONFIG_SCHED_CACHE */
> +
>   struct mmu_gather;
>   extern void tlb_gather_mmu(struct mmu_gather *tlb, struct mm_struct *mm);
>   extern void tlb_gather_mmu_fullmm(struct mmu_gather *tlb, struct mm_struct *mm);
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index f96ac1982893..d0e4cda2b3cd 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1399,6 +1399,10 @@ struct task_struct {
>   	unsigned long			numa_pages_migrated;
>   #endif /* CONFIG_NUMA_BALANCING */
>   
> +#ifdef CONFIG_SCHED_CACHE
> +	struct callback_head		cache_work;
> +#endif
> +
>   #ifdef CONFIG_RSEQ
>   	struct rseq __user *rseq;
>   	u32 rseq_len;
> diff --git a/init/Kconfig b/init/Kconfig
> index bf3a920064be..e2509127b6f9 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -953,6 +953,10 @@ config NUMA_BALANCING
>   
>   	  This system will be inactive on UMA systems.
>   
> +config SCHED_CACHE
> +	bool "Cache aware scheduler"
> +	default y
> +

Should it depend on EXPERT?
IMO this could add quite a bit of overhead and maybe n by default?

>   config NUMA_BALANCING_DEFAULT_ENABLED
>   	bool "Automatically enable NUMA aware memory/task placement"
>   	default y
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 168681fc4b25..da1387823b9e 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -1332,6 +1332,9 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
>   	if (mm_alloc_cid(mm, p))
>   		goto fail_cid;
>   
> +	if (mm_alloc_sched(mm))
> +		goto fail_sched;
> +
>   	if (percpu_counter_init_many(mm->rss_stat, 0, GFP_KERNEL_ACCOUNT,
>   				     NR_MM_COUNTERS))
>   		goto fail_pcpu;
> @@ -1341,6 +1344,8 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
>   	return mm;
>   
>   fail_pcpu:
> +	mm_destroy_sched(mm);
> +fail_sched:
>   	mm_destroy_cid(mm);
>   fail_cid:
>   	destroy_context(mm);
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index c81cf642dba0..d9c3e75f79d1 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -4524,6 +4524,7 @@ static void __sched_fork(unsigned long clone_flags, struct task_struct *p)
>   	p->migration_pending = NULL;
>   #endif
>   	init_sched_mm_cid(p);
> +	init_sched_mm(p);
>   }
>   
>   DEFINE_STATIC_KEY_FALSE(sched_numa_balancing);
> @@ -8526,6 +8527,7 @@ static struct kmem_cache *task_group_cache __ro_after_init;
>   
>   void __init sched_init(void)
>   {
> +	unsigned long now = jiffies;
>   	unsigned long ptr = 0;
>   	int i;
>   
> @@ -8600,7 +8602,7 @@ void __init sched_init(void)
>   		raw_spin_lock_init(&rq->__lock);
>   		rq->nr_running = 0;
>   		rq->calc_load_active = 0;
> -		rq->calc_load_update = jiffies + LOAD_FREQ;
> +		rq->calc_load_update = now + LOAD_FREQ;
>   		init_cfs_rq(&rq->cfs);
>   		init_rt_rq(&rq->rt);
>   		init_dl_rq(&rq->dl);
> @@ -8644,7 +8646,7 @@ void __init sched_init(void)
>   		rq->cpu_capacity = SCHED_CAPACITY_SCALE;
>   		rq->balance_callback = &balance_push_callback;
>   		rq->active_balance = 0;
> -		rq->next_balance = jiffies;
> +		rq->next_balance = now;
>   		rq->push_cpu = 0;
>   		rq->cpu = i;
>   		rq->online = 0;
> @@ -8656,7 +8658,7 @@ void __init sched_init(void)
>   
>   		rq_attach_root(rq, &def_root_domain);
>   #ifdef CONFIG_NO_HZ_COMMON
> -		rq->last_blocked_load_update_tick = jiffies;
> +		rq->last_blocked_load_update_tick = now;
>   		atomic_set(&rq->nohz_flags, 0);
>   
>   		INIT_CSD(&rq->nohz_csd, nohz_csd_func, rq);
> @@ -8681,6 +8683,11 @@ void __init sched_init(void)
>   
>   		rq->core_cookie = 0UL;
>   #endif
> +#ifdef CONFIG_SCHED_CACHE
> +		raw_spin_lock_init(&rq->cpu_epoch_lock);
> +		rq->cpu_epoch_next = now;
> +#endif
> +
>   		zalloc_cpumask_var_node(&rq->scratch_mask, GFP_KERNEL, cpu_to_node(i));
>   	}
>   
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 0fb9bf995a47..df7d4a324fbe 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1166,10 +1166,229 @@ static s64 update_curr_se(struct rq *rq, struct sched_entity *curr)
>   	return delta_exec;
>   }
>   
> -static inline void update_curr_task(struct task_struct *p, s64 delta_exec)
> +#ifdef CONFIG_SCHED_CACHE
> +
> +/*
> + * XXX numbers come from a place the sun don't shine -- probably wants to be SD
> + * tunable or so.
> + */
> +#define EPOCH_PERIOD	(HZ/100)	/* 10 ms */
> +#define EPOCH_OLD	5		/* 50 ms */

Have these been converted into tunables? I didn't spot that in the series.

> +
> +void mm_init_sched(struct mm_struct *mm, struct mm_sched *_pcpu_sched)
> +{
> +	unsigned long epoch;
> +	int i;
> +
> +	for_each_possible_cpu(i) {
> +		struct mm_sched *pcpu_sched = per_cpu_ptr(_pcpu_sched, i);
> +		struct rq *rq = cpu_rq(i);
> +
> +		pcpu_sched->runtime = 0;
> +		pcpu_sched->epoch = epoch = rq->cpu_epoch;
> +		pcpu_sched->occ = -1;
> +	}
> +
> +	raw_spin_lock_init(&mm->mm_sched_lock);
> +	mm->mm_sched_epoch = epoch;
> +	mm->mm_sched_cpu = -1;
> +
> +	smp_store_release(&mm->pcpu_sched, _pcpu_sched);
> +}
> +
> +/* because why would C be fully specified */
> +static __always_inline void __shr_u64(u64 *val, unsigned int n)
> +{
> +	if (n >= 64) {
> +		*val = 0;
> +		return;
> +	}
> +	*val >>= n;
> +}
> +
> +static inline void __update_mm_sched(struct rq *rq, struct mm_sched *pcpu_sched)
> +{
> +	lockdep_assert_held(&rq->cpu_epoch_lock);
> +
> +	unsigned long n, now = jiffies;
> +	long delta = now - rq->cpu_epoch_next;
> +
> +	if (delta > 0) {
> +		n = (delta + EPOCH_PERIOD - 1) / EPOCH_PERIOD;
> +		rq->cpu_epoch += n;
> +		rq->cpu_epoch_next += n * EPOCH_PERIOD;
> +		__shr_u64(&rq->cpu_runtime, n);

Another doubt i had, does this occupancy works when there is CPU bandwidth controller running?
A 50% occupancy may have different meaning when CPU bandwidth is set to 50%?

> +	}
> +
> +	n = rq->cpu_epoch - pcpu_sched->epoch;
> +	if (n) {
> +		pcpu_sched->epoch += n;
> +		__shr_u64(&pcpu_sched->runtime, n);
> +	}
> +}
> +
> +static unsigned long fraction_mm_sched(struct rq *rq, struct mm_sched *pcpu_sched)
> +{
> +	guard(raw_spinlock_irqsave)(&rq->cpu_epoch_lock);
> +
> +	__update_mm_sched(rq, pcpu_sched);
> +
> +	/*
> +	 * Runtime is a geometric series (r=0.5) and as such will sum to twice
> +	 * the accumulation period, this means the multiplcation here should
> +	 * not overflow.
> +	 */
> +	return div64_u64(NICE_0_LOAD * pcpu_sched->runtime, rq->cpu_runtime + 1);
> +}
> +
> +static inline
> +void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
> +{
> +	struct mm_struct *mm = p->mm;
> +	struct mm_sched *pcpu_sched;
> +	unsigned long epoch;
> +
> +	/*
> +	 * init_task and kthreads don't be having no mm
> +	 */
> +	if (!mm || !mm->pcpu_sched)
> +		return;
> +
> +	pcpu_sched = this_cpu_ptr(p->mm->pcpu_sched);
> +
> +	scoped_guard (raw_spinlock, &rq->cpu_epoch_lock) {
> +		__update_mm_sched(rq, pcpu_sched);
> +		pcpu_sched->runtime += delta_exec;
> +		rq->cpu_runtime += delta_exec;
> +		epoch = rq->cpu_epoch;
> +	}
> +
> +	/*
> +	 * If this task hasn't hit task_cache_work() for a while, invalidate
> +	 * it's preferred state.
> +	 */
> +	if (epoch - READ_ONCE(mm->mm_sched_epoch) > EPOCH_OLD) {
> +		mm->mm_sched_cpu = -1;
> +		pcpu_sched->occ = -1;
> +	}
> +}
> +
> +static void task_tick_cache(struct rq *rq, struct task_struct *p)
> +{
> +	struct callback_head *work = &p->cache_work;
> +	struct mm_struct *mm = p->mm;
> +
> +	if (!mm || !mm->pcpu_sched)
> +		return;
> +
> +	if (mm->mm_sched_epoch == rq->cpu_epoch)
> +		return;
> +
> +	guard(raw_spinlock)(&mm->mm_sched_lock);
> +
> +	if (mm->mm_sched_epoch == rq->cpu_epoch)
> +		return;
> +
> +	if (work->next == work) {
> +		task_work_add(p, work, TWA_RESUME);
> +		WRITE_ONCE(mm->mm_sched_epoch, rq->cpu_epoch);
> +	}
> +}
> +
> +static void task_cache_work(struct callback_head *work)
> +{
> +	struct task_struct *p = current;
> +	struct mm_struct *mm = p->mm;
> +	unsigned long m_a_occ = 0;
> +	int cpu, m_a_cpu = -1;
> +	cpumask_var_t cpus;
> +
> +	WARN_ON_ONCE(work != &p->cache_work);
> +
> +	work->next = work;
> +
> +	if (p->flags & PF_EXITING)
> +		return;
> +
> +	if (!alloc_cpumask_var(&cpus, GFP_KERNEL))
> +		return;
> +
> +	scoped_guard (cpus_read_lock) {
> +		cpumask_copy(cpus, cpu_online_mask);
> +

As pointed out already, this is going to be costly in multi NUMA systems. Any cross NUMA access of
CPUs data is going to add overhead to system bus bandwidth and this happening at tick could be costly.

Also, taking cpu_read_lock does preempt_disable, this could add to large preemptoff?
We need to measure the time it takes on large system. Will try and get back with that number
> +		for_each_cpu(cpu, cpus) {
> +			/* XXX sched_cluster_active */
> +			struct sched_domain *sd = per_cpu(sd_llc, cpu);
> +			unsigned long occ, m_occ = 0, a_occ = 0;
> +			int m_cpu = -1, nr = 0, i;
> +
> +			for_each_cpu(i, sched_domain_span(sd)) {
> +				occ = fraction_mm_sched(cpu_rq(i),
> +							per_cpu_ptr(mm->pcpu_sched, i));
> +				a_occ += occ;
> +				if (occ > m_occ) {
> +					m_occ = occ;
> +					m_cpu = i;
> +				}
> +				nr++;
> +				trace_printk("(%d) occ: %ld m_occ: %ld m_cpu: %d nr: %d\n",
> +					     per_cpu(sd_llc_id, i), occ, m_occ, m_cpu, nr);
> +			}
> +
> +			a_occ /= nr;
> +			if (a_occ > m_a_occ) {
> +				m_a_occ = a_occ;
> +				m_a_cpu = m_cpu;
> +			}
> +
> +			trace_printk("(%d) a_occ: %ld m_a_occ: %ld\n",
> +				     per_cpu(sd_llc_id, cpu), a_occ, m_a_occ);
> +
> +			for_each_cpu(i, sched_domain_span(sd)) {
> +				/* XXX threshold ? */
> +				per_cpu_ptr(mm->pcpu_sched, i)->occ = a_occ;
> +			}
> +
> +			cpumask_andnot(cpus, cpus, sched_domain_span(sd));
> +		}
> +	}
> +
> +	/*
> +	 * If the max average cache occupancy is 'small' we don't care.
> +	 */
> +	if (m_a_occ < (NICE_0_LOAD >> EPOCH_OLD))
> +		m_a_cpu = -1;
> +
> +	mm->mm_sched_cpu = m_a_cpu;
> +
> +	free_cpumask_var(cpus);
> +}
> +
> +void init_sched_mm(struct task_struct *p)
> +{
> +	struct callback_head *work = &p->cache_work;
> +	init_task_work(work, task_cache_work);
> +	work->next = work;
> +}
> +
> +#else
> +
> +static inline void account_mm_sched(struct rq *rq, struct task_struct *p,
> +				    s64 delta_exec) { }
> +
> +
> +void init_sched_mm(struct task_struct *p) { }
> +
> +static void task_tick_cache(struct rq *rq, struct task_struct *p) { }
> +
> +#endif
> +
> +static inline
> +void update_curr_task(struct rq *rq, struct task_struct *p, s64 delta_exec)
>   {
>   	trace_sched_stat_runtime(p, delta_exec);
>   	account_group_exec_runtime(p, delta_exec);
> +	account_mm_sched(rq, p, delta_exec);
>   	cgroup_account_cputime(p, delta_exec);
>   }
>   

AFAIU, this works and cares only about SCHED_NORMAL.
update_curr_task called by common for RT/DL too. Maybe avoid for those?

> @@ -1215,7 +1434,7 @@ s64 update_curr_common(struct rq *rq)
>   
>   	delta_exec = update_curr_se(rq, &donor->se);
>   	if (likely(delta_exec > 0))
> -		update_curr_task(donor, delta_exec);
> +		update_curr_task(rq, donor, delta_exec);
>   
>   	return delta_exec;
>   }
> @@ -1244,7 +1463,7 @@ static void update_curr(struct cfs_rq *cfs_rq)
>   	if (entity_is_task(curr)) {
>   		struct task_struct *p = task_of(curr);
>   
> -		update_curr_task(p, delta_exec);
> +		update_curr_task(rq, p, delta_exec);
>   
>   		/*
>   		 * If the fair_server is active, we need to account for the
> @@ -7848,7 +8067,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>   	 * per-cpu select_rq_mask usage
>   	 */
>   	lockdep_assert_irqs_disabled();
> -
> +again:
>   	if ((available_idle_cpu(target) || sched_idle_cpu(target)) &&
>   	    asym_fits_cpu(task_util, util_min, util_max, target))
>   		return target;
> @@ -7886,7 +8105,8 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>   	/* Check a recently used CPU as a potential idle candidate: */
>   	recent_used_cpu = p->recent_used_cpu;
>   	p->recent_used_cpu = prev;
> -	if (recent_used_cpu != prev &&
> +	if (prev == p->wake_cpu &&
> +	    recent_used_cpu != prev &&
>   	    recent_used_cpu != target &&
>   	    cpus_share_cache(recent_used_cpu, target) &&
>   	    (available_idle_cpu(recent_used_cpu) || sched_idle_cpu(recent_used_cpu)) &&
> @@ -7939,6 +8159,18 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>   	if ((unsigned)i < nr_cpumask_bits)
>   		return i;
>   
> +	if (prev != p->wake_cpu && !cpus_share_cache(prev, p->wake_cpu)) {
> +		/*
> +		 * Most likely select_cache_cpu() will have re-directed
> +		 * the wakeup, but getting here means the preferred cache is
> +		 * too busy, so re-try with the actual previous.
> +		 *
> +		 * XXX wake_affine is lost for this pass.
> +		 */
> +		prev = target = p->wake_cpu;
> +		goto again;
> +	}
> +
>   	/*
>   	 * For cluster machines which have lower sharing cache like L2 or
>   	 * LLC Tag, we tend to find an idle CPU in the target's cluster
> @@ -8561,6 +8793,40 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
>   	return target;
>   }
>   
> +#ifdef CONFIG_SCHED_CACHE
> +static long __migrate_degrades_locality(struct task_struct *p, int src_cpu, int dst_cpu, bool idle);
> +
> +static int select_cache_cpu(struct task_struct *p, int prev_cpu)
> +{
> +	struct mm_struct *mm = p->mm;
> +	int cpu;
> +
> +	if (!mm || p->nr_cpus_allowed == 1)
> +		return prev_cpu;
> +
> +	cpu = mm->mm_sched_cpu;
> +	if (cpu < 0)
> +		return prev_cpu;
> +
> +
> +	if (static_branch_likely(&sched_numa_balancing) &&
> +	    __migrate_degrades_locality(p, prev_cpu, cpu, false) > 0) {
> +		/*
> +		 * XXX look for max occupancy inside prev_cpu's node
> +		 */
> +		return prev_cpu;
> +	}
> +
> +	return cpu;
> +}
> +#else
> +static int select_cache_cpu(struct task_struct *p, int prev_cpu)
> +{
> +	return prev_cpu;
> +}
> +#endif
> +
> +
>   /*
>    * select_task_rq_fair: Select target runqueue for the waking task in domains
>    * that have the relevant SD flag set. In practice, this is SD_BALANCE_WAKE,
> @@ -8586,6 +8852,8 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>   	 * required for stable ->cpus_allowed
>   	 */
>   	lockdep_assert_held(&p->pi_lock);
> +	guard(rcu)();
> +
>   	if (wake_flags & WF_TTWU) {
>   		record_wakee(p);
>   
> @@ -8593,6 +8861,8 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>   		    cpumask_test_cpu(cpu, p->cpus_ptr))
>   			return cpu;
>   
> +		new_cpu = prev_cpu = select_cache_cpu(p, prev_cpu);
> +
>   		if (!is_rd_overutilized(this_rq()->rd)) {
>   			new_cpu = find_energy_efficient_cpu(p, prev_cpu);
>   			if (new_cpu >= 0)
> @@ -8603,7 +8873,6 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>   		want_affine = !wake_wide(p) && cpumask_test_cpu(cpu, p->cpus_ptr);
>   	}
>   
> -	rcu_read_lock();
>   	for_each_domain(cpu, tmp) {
>   		/*
>   		 * If both 'cpu' and 'prev_cpu' are part of this domain,
> @@ -8636,7 +8905,6 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>   		/* Fast path */
>   		new_cpu = select_idle_sibling(p, prev_cpu, new_cpu);
>   	}
> -	rcu_read_unlock();
>   
>   	return new_cpu;
>   }
> @@ -9286,6 +9554,17 @@ static int task_hot(struct task_struct *p, struct lb_env *env)
>   	if (sysctl_sched_migration_cost == 0)
>   		return 0;
>   
> +#ifdef CONFIG_SCHED_CACHE
> +	if (p->mm && p->mm->pcpu_sched) {
> +		/*
> +		 * XXX things like Skylake have non-inclusive L3 and might not
> +		 * like this L3 centric view. What to do about L2 stickyness ?
> +		 */
> +		return per_cpu_ptr(p->mm->pcpu_sched, env->src_cpu)->occ >
> +		       per_cpu_ptr(p->mm->pcpu_sched, env->dst_cpu)->occ;
> +	}
> +#endif
> +
>   	delta = rq_clock_task(env->src_rq) - p->se.exec_start;
>   
>   	return delta < (s64)sysctl_sched_migration_cost;
> @@ -9297,27 +9576,25 @@ static int task_hot(struct task_struct *p, struct lb_env *env)
>    * Returns 0, if task migration is not affected by locality.
>    * Returns a negative value, if task migration improves locality i.e migration preferred.
>    */
> -static long migrate_degrades_locality(struct task_struct *p, struct lb_env *env)
> +static long __migrate_degrades_locality(struct task_struct *p, int src_cpu, int dst_cpu, bool idle)
>   {
>   	struct numa_group *numa_group = rcu_dereference(p->numa_group);
>   	unsigned long src_weight, dst_weight;
>   	int src_nid, dst_nid, dist;
>   
> -	if (!static_branch_likely(&sched_numa_balancing))
> -		return 0;
> -
> -	if (!p->numa_faults || !(env->sd->flags & SD_NUMA))
> +	if (!p->numa_faults)
>   		return 0;
>   
> -	src_nid = cpu_to_node(env->src_cpu);
> -	dst_nid = cpu_to_node(env->dst_cpu);
> +	src_nid = cpu_to_node(src_cpu);
> +	dst_nid = cpu_to_node(dst_cpu);
>   
>   	if (src_nid == dst_nid)
>   		return 0;
>   
>   	/* Migrating away from the preferred node is always bad. */
>   	if (src_nid == p->numa_preferred_nid) {
> -		if (env->src_rq->nr_running > env->src_rq->nr_preferred_running)
> +		struct rq *src_rq = cpu_rq(src_cpu);
> +		if (src_rq->nr_running > src_rq->nr_preferred_running)
>   			return 1;
>   		else
>   			return 0;
> @@ -9328,7 +9605,7 @@ static long migrate_degrades_locality(struct task_struct *p, struct lb_env *env)
>   		return -1;
>   
>   	/* Leaving a core idle is often worse than degrading locality. */
> -	if (env->idle == CPU_IDLE)
> +	if (idle)
>   		return 0;
>   
>   	dist = node_distance(src_nid, dst_nid);
> @@ -9343,7 +9620,24 @@ static long migrate_degrades_locality(struct task_struct *p, struct lb_env *env)
>   	return src_weight - dst_weight;
>   }
>   
> +static long migrate_degrades_locality(struct task_struct *p, struct lb_env *env)
> +{
> +	if (!static_branch_likely(&sched_numa_balancing))
> +		return 0;
> +
> +	if (!(env->sd->flags & SD_NUMA))
> +		return 0;
> +
> +	return __migrate_degrades_locality(p, env->src_cpu, env->dst_cpu,
> +					   env->idle == CPU_IDLE);
> +}
> +
>   #else
> +static long __migrate_degrades_locality(struct task_struct *p, int src_cpu, int dst_cpu, bool idle)
> +{
> +	return 0;
> +}
> +
>   static inline long migrate_degrades_locality(struct task_struct *p,
>   					     struct lb_env *env)
>   {
> @@ -13102,8 +13396,8 @@ static inline void task_tick_core(struct rq *rq, struct task_struct *curr) {}
>    */
>   static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
>   {
> -	struct cfs_rq *cfs_rq;
>   	struct sched_entity *se = &curr->se;
> +	struct cfs_rq *cfs_rq;
>   
>   	for_each_sched_entity(se) {
>   		cfs_rq = cfs_rq_of(se);
> @@ -13113,6 +13407,8 @@ static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
>   	if (static_branch_unlikely(&sched_numa_balancing))
>   		task_tick_numa(rq, curr);
>   
> +	task_tick_cache(rq, curr);
> +
>   	update_misfit_status(curr, rq);
>   	check_update_overutilized_status(task_rq(curr));
>   
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 47972f34ea70..d16ccd66ca07 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -1171,6 +1171,12 @@ struct rq {
>   	u64			clock_pelt_idle_copy;
>   	u64			clock_idle_copy;
>   #endif
> +#ifdef CONFIG_SCHED_CACHE
> +	raw_spinlock_t		cpu_epoch_lock;
> +	u64			cpu_runtime;
> +	unsigned long		cpu_epoch;
> +	unsigned long		cpu_epoch_next;
> +#endif
>   

Maybe these can go to their own cacheline?

>   	atomic_t		nr_iowait;
>   
> @@ -3861,6 +3867,8 @@ static inline void task_tick_mm_cid(struct rq *rq, struct task_struct *curr) { }
>   static inline void init_sched_mm_cid(struct task_struct *t) { }
>   #endif /* !CONFIG_SCHED_MM_CID */
>   
> +extern void init_sched_mm(struct task_struct *p);
> +
>   extern u64 avg_vruntime(struct cfs_rq *cfs_rq);
>   extern int entity_eligible(struct cfs_rq *cfs_rq, struct sched_entity *se);
>   #ifdef CONFIG_SMP

