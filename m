Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7DE433CB
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 18:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747851998; cv=none; b=LmuXoIjr6aLCTqOlMlW7N4KETH4Que2YF5xrRLE/f2MrMJIsGlaB6k6eYt/NFuCW/9yuZ+eOEmPi0ZruR9ABF4b438X4BiXerHs1QiAR05SZYe1MFXaVAB3u62ywF9vRRFD1U9DWiS3Fzidu2cIR8hMCefs/yl6/mUCgoxWLRSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747851998; c=relaxed/simple;
	bh=iNUlgTR+B7+iykrrOAsDNFdgh65VuVY3fwYOLsXbDlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=siFV8PWhy/0SnVOu6WA+Htwv50fa0FMQ9UeHs4BbTf3LILza6goUJihsNH6x8De7JBg3OiUcczF2IhIahqTFA6/zvbqLG9a7pWyAsYieeJQaA4gJ711SlL0v++S0M0F6Epy0OMFGbN8uFKh2yiR21COtXKDxKuhwV5eVwQ7DLlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=dC78zyjC; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="dC78zyjC"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LHcLAH012639;
	Wed, 21 May 2025 18:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=w9t9Rn
	4DGcidvMDJ4rffV2hrUAH81ICDd+AmJRZaZm4=; b=dC78zyjCh+deJheOqw4kpF
	CvWB5faRZDpKj/O4P0+x+7jbx6VbMbnYcCy/PPdF6eVGtvkpW8CRtACEbswL8i6x
	3s13c6NBXFlbWPzZq1YsoBEJUYAir/1PNmxWY/deVCFa4GC7XrwTm0nhwrCSmgkM
	z/HOe9eOq24HDr+Cty3o67ufWH+T/TAjtBQZK7368dvCvSKxHZVkhHqwebuT9HcB
	0ZOv5DUQI8NM4MBb9tlbeyq8MRGl3ihy0Ag54oWgJgR+eqHlsZoMXGZd81buuAHR
	wKuMWxsaZqsj5e0DEm7koExPGgY3bZxwneY9wtN2hnQQE7JhIIlMH5ZQI/sAD3Kg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46rye6nrnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 18:25:53 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54LIMtTn026485;
	Wed, 21 May 2025 18:25:52 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46rye6nrnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 18:25:52 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54LHRZ34032076;
	Wed, 21 May 2025 18:25:52 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46rwnmdh9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 18:25:52 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54LIPpAk24707824
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 18:25:51 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4179A58045;
	Wed, 21 May 2025 18:25:51 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1287658050;
	Wed, 21 May 2025 18:25:41 +0000 (GMT)
Received: from [9.39.28.244] (unknown [9.39.28.244])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 May 2025 18:25:40 +0000 (GMT)
Message-ID: <a6c42783-baf6-4463-a2f5-9a6d3e380865@linux.ibm.com>
Date: Wed, 21 May 2025 23:55:38 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v0 2/2] mm: sched: Batch-migrate misplaced pages
To: Bharata B Rao <bharata@amd.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Cc: Jonathan.Cameron@huawei.com, dave.hansen@intel.com, gourry@gourry.net,
        hannes@cmpxchg.org, mgorman@techsingularity.net, mingo@redhat.com,
        peterz@infradead.org, raghavendra.kt@amd.com, riel@surriel.com,
        rientjes@google.com, sj@kernel.org, weixugc@google.com,
        willy@infradead.org, ying.huang@linux.alibaba.com, ziy@nvidia.com,
        dave@stgolabs.net, nifan.cxl@gmail.com, joshua.hahnjy@gmail.com,
        xuezhengchu@huawei.com, yiannis@zptcorp.com, akpm@linux-foundation.org,
        david@redhat.com
References: <20250521080238.209678-1-bharata@amd.com>
 <20250521080238.209678-3-bharata@amd.com>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <20250521080238.209678-3-bharata@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE3OSBTYWx0ZWRfX40LSkhdjPGB/ oyFwCkxzbHsg0SRqHDNJcgwMP6O5Cnt56V9OyqVB5di+t8FjBqFrshrVguJnpq+wbzc1Kg3w3yH UQw/GrYLSlnX0IFrvPyiFxK75dcT160SD5pZu9kNSy6sKwwsVdOwQJe/N0eLJOLhwPBynSvCCsT
 vqmsoRmeE05+TbvYH0gOd7OZhKXG1iANOvSt3JGACMivRyAo5jMNSWsmdhrZrQXjUM3qzASV96N XqOaeTz2cOsQBKt/iE9e56K1bv6nElJ6ZjeRQEE7W9LtVRaHv3cpZad3QAXnhX1pMsKeg6nNkvo 2LeCLSbRIUsJj/KxxQ16Z9RNK8LTGVwwanSvNcQpkI+gHEwOcM+1GJ6TMGYR6Fa67GbkytfYINA
 BwSjQ8AXsE7OuZlhdbJf0zy/i29VRu9aXr1yoeyX/+reVAuqDIlvwkGhOFEDGHM7zgYApj/C
X-Authority-Analysis: v=2.4 cv=esrfzppX c=1 sm=1 tr=0 ts=682e1ab1 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=zd2uoN0lAAAA:8 a=UIes2Syb66bktxczoFcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 0Fp3TyKVBjDwo7G3XFE8q0zYy1e-nHvy
X-Proofpoint-GUID: tjC8RDuARrjvmdzRlxNhj9v7P_oRoI-_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 clxscore=1011 bulkscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210179


On 5/21/25 1:32 PM, Bharata B Rao wrote:
> Currently the folios identified as misplaced by the NUMA
> balancing sub-system are migrated one by one from the NUMA
> hint fault handler as and when they are identified as
> misplaced.
>
> Instead of such singe folio migrations, batch them and
> migrate them at once.
>
> Identified misplaced folios are isolated and stored in
> a per-task list. A new task_work is queued from task tick
> handler to migrate them in batches. Migration is done
> periodically or if pending number of isolated foios exceeds
> a threshold.
>
> The PTEs for the isolated folios are restored to PRESENT
> state right after isolation.
>
> The last_cpupid field of isolated folios is used to store
> the target_nid to which the folios need to be migrated to.
> This needs changes to (at least) a couple of places where
> last_cpupid field is updated/reset which now should happen
> conditionally. The updation in folio_migrate_flags() isn't
> handled yet but the reset in write page fault case is
> handled.
>
> The failed migration count isn't fed back to the scan period
> update heuristics currently.
>
> Signed-off-by: Bharata B Rao <bharata@amd.com>
> ---
>   include/linux/sched.h |  4 +++
>   init/init_task.c      |  2 ++
>   kernel/sched/fair.c   | 64 +++++++++++++++++++++++++++++++++++++++++++
>   mm/memory.c           | 44 +++++++++++++++--------------
>   4 files changed, 93 insertions(+), 21 deletions(-)
>
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index f96ac1982893..4177ecf53633 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1360,6 +1360,8 @@ struct task_struct {
>   	u64				last_task_numa_placement;
>   	u64				last_sum_exec_runtime;
>   	struct callback_head		numa_work;
> +	struct callback_head		numa_mig_work;
> +	unsigned long			numa_mig_interval;
>   
>   	/*
>   	 * This pointer is only modified for current in syscall and
> @@ -1397,6 +1399,8 @@ struct task_struct {
>   	unsigned long			numa_faults_locality[3];
>   
>   	unsigned long			numa_pages_migrated;
> +	struct list_head		migrate_list;
> +	unsigned long			migrate_count;
>   #endif /* CONFIG_NUMA_BALANCING */
>   
>   #ifdef CONFIG_RSEQ
> diff --git a/init/init_task.c b/init/init_task.c
> index e557f622bd90..997af6ab67a7 100644
> --- a/init/init_task.c
> +++ b/init/init_task.c
> @@ -187,6 +187,8 @@ struct task_struct init_task __aligned(L1_CACHE_BYTES) = {
>   	.numa_preferred_nid = NUMA_NO_NODE,
>   	.numa_group	= NULL,
>   	.numa_faults	= NULL,
> +	.migrate_count	= 0,
> +	.migrate_list	= LIST_HEAD_INIT(init_task.migrate_list),
>   #endif
>   #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
>   	.kasan_depth	= 1,
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 0fb9bf995a47..d6cbf8be76e1 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -49,6 +49,7 @@
>   #include <linux/ratelimit.h>
>   #include <linux/task_work.h>
>   #include <linux/rbtree_augmented.h>
> +#include <linux/migrate.h>
>   
>   #include <asm/switch_to.h>
>   
> @@ -1463,6 +1464,8 @@ unsigned int sysctl_numa_balancing_scan_delay = 1000;
>   /* The page with hint page fault latency < threshold in ms is considered hot */
>   unsigned int sysctl_numa_balancing_hot_threshold = MSEC_PER_SEC;
>   
> +#define NUMAB_BATCH_MIGRATION_THRESHOLD	512
> +
>   struct numa_group {
>   	refcount_t refcount;
>   
> @@ -3297,6 +3300,46 @@ static bool vma_is_accessed(struct mm_struct *mm, struct vm_area_struct *vma)
>   
>   #define VMA_PID_RESET_PERIOD (4 * sysctl_numa_balancing_scan_delay)
>   
> +/*
> + * TODO: Feed failed migration count back to scan period update
> + * mechanism.
> + */
> +static void migrate_queued_pages(struct list_head *migrate_list)
> +{
> +	int cur_nid, nid;
> +	struct folio *folio, *tmp;
> +	LIST_HEAD(nid_list);
> +
> +	folio = list_entry(migrate_list, struct folio, lru);
> +	cur_nid = folio_last_cpupid(folio);

Hi Bharatha,

This is target node ID right?


> +
> +	list_for_each_entry_safe(folio, tmp, migrate_list, lru) {
> +		nid = folio_xchg_last_cpupid(folio, -1);

Just one doubt: to get the last CPU ID (target node ID) here, folio_xchg_last_cpupid()

is used, whereas earlier folio_last_cpupid() was used. Is there a specific reason for

using different functions?


Thanks
Donet

> +
> +		if (cur_nid != nid) {
> +			migrate_misplaced_folio_batch(&nid_list, cur_nid);
> +			cur_nid = nid;
> +		}
> +		list_move(&folio->lru, &nid_list);
> +	}
> +	migrate_misplaced_folio_batch(&nid_list, cur_nid);
> +}
> +
> +static void task_migration_work(struct callback_head *work)
> +{
> +	struct task_struct *p = current;
> +
> +	WARN_ON_ONCE(p != container_of(work, struct task_struct, numa_mig_work));
> +
> +	work->next = work;
> +
> +	if (list_empty(&p->migrate_list))
> +		return;
> +
> +	migrate_queued_pages(&p->migrate_list);
> +	p->migrate_count = 0;
> +}
> +
>   /*
>    * The expensive part of numa migration is done from task_work context.
>    * Triggered from task_tick_numa().
> @@ -3567,14 +3610,19 @@ void init_numa_balancing(unsigned long clone_flags, struct task_struct *p)
>   	p->numa_migrate_retry		= 0;
>   	/* Protect against double add, see task_tick_numa and task_numa_work */
>   	p->numa_work.next		= &p->numa_work;
> +	p->numa_mig_work.next		= &p->numa_mig_work;
> +	p->numa_mig_interval			= 0;
>   	p->numa_faults			= NULL;
>   	p->numa_pages_migrated		= 0;
>   	p->total_numa_faults		= 0;
>   	RCU_INIT_POINTER(p->numa_group, NULL);
>   	p->last_task_numa_placement	= 0;
>   	p->last_sum_exec_runtime	= 0;
> +	p->migrate_count		= 0;
> +	INIT_LIST_HEAD(&p->migrate_list);
>   
>   	init_task_work(&p->numa_work, task_numa_work);
> +	init_task_work(&p->numa_mig_work, task_migration_work);
>   
>   	/* New address space, reset the preferred nid */
>   	if (!(clone_flags & CLONE_VM)) {
> @@ -3596,6 +3644,20 @@ void init_numa_balancing(unsigned long clone_flags, struct task_struct *p)
>   	}
>   }
>   
> +static void task_check_pending_migrations(struct task_struct *curr)
> +{
> +	struct callback_head *work = &curr->numa_mig_work;
> +
> +	if (work->next != work)
> +		return;
> +
> +	if (time_after(jiffies, curr->numa_mig_interval) ||
> +	    (curr->migrate_count > NUMAB_BATCH_MIGRATION_THRESHOLD)) {
> +		curr->numa_mig_interval = jiffies + HZ;
> +		task_work_add(curr, work, TWA_RESUME);
> +	}
> +}
> +
>   /*
>    * Drive the periodic memory faults..
>    */
> @@ -3610,6 +3672,8 @@ static void task_tick_numa(struct rq *rq, struct task_struct *curr)
>   	if (!curr->mm || (curr->flags & (PF_EXITING | PF_KTHREAD)) || work->next != work)
>   		return;
>   
> +	task_check_pending_migrations(curr);
> +
>   	/*
>   	 * Using runtime rather than walltime has the dual advantage that
>   	 * we (mostly) drive the selection from busy threads and that the
> diff --git a/mm/memory.c b/mm/memory.c
> index 49199410805c..11d07004cb04 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3375,8 +3375,13 @@ static inline void wp_page_reuse(struct vm_fault *vmf, struct folio *folio)
>   		 * Clear the folio's cpupid information as the existing
>   		 * information potentially belongs to a now completely
>   		 * unrelated process.
> +		 *
> +		 * If the page is found to be isolated pending migration,
> +		 * then don't reset as last_cpupid will be holding the
> +		 * target_nid information.
>   		 */
> -		folio_xchg_last_cpupid(folio, (1 << LAST_CPUPID_SHIFT) - 1);
> +		if (folio_test_lru(folio))
> +			folio_xchg_last_cpupid(folio, (1 << LAST_CPUPID_SHIFT) - 1);
>   	}
>   
>   	flush_cache_page(vma, vmf->address, pte_pfn(vmf->orig_pte));
> @@ -5766,12 +5771,13 @@ static void numa_rebuild_large_mapping(struct vm_fault *vmf, struct vm_area_stru
>   
>   static vm_fault_t do_numa_page(struct vm_fault *vmf)
>   {
> +	struct task_struct *task = current;
>   	struct vm_area_struct *vma = vmf->vma;
>   	struct folio *folio = NULL;
>   	int nid = NUMA_NO_NODE;
>   	bool writable = false, ignore_writable = false;
>   	bool pte_write_upgrade = vma_wants_manual_pte_write_upgrade(vma);
> -	int last_cpupid;
> +	int last_cpupid = (-1 & LAST_CPUPID_MASK);
>   	int target_nid;
>   	pte_t pte, old_pte;
>   	int flags = 0, nr_pages;
> @@ -5807,6 +5813,13 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
>   	nid = folio_nid(folio);
>   	nr_pages = folio_nr_pages(folio);
>   
> +	/*
> +	 * If it is a non-LRU folio, it has been already
> +	 * isolated and is in migration list.
> +	 */
> +	if (!folio_test_lru(folio))
> +		goto out_map;
> +
>   	target_nid = numa_migrate_check(folio, vmf, vmf->address, &flags,
>   					writable, &last_cpupid);
>   	if (target_nid == NUMA_NO_NODE)
> @@ -5815,28 +5828,17 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
>   		flags |= TNF_MIGRATE_FAIL;
>   		goto out_map;
>   	}
> -	/* The folio is isolated and isolation code holds a folio reference. */
> -	pte_unmap_unlock(vmf->pte, vmf->ptl);
>   	writable = false;
>   	ignore_writable = true;
> +	nid = target_nid;
>   
> -	/* Migrate to the requested node */
> -	if (!migrate_misplaced_folio(folio, target_nid)) {
> -		nid = target_nid;
> -		flags |= TNF_MIGRATED;
> -		task_numa_fault(last_cpupid, nid, nr_pages, flags);
> -		return 0;
> -	}
> -
> -	flags |= TNF_MIGRATE_FAIL;
> -	vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
> -				       vmf->address, &vmf->ptl);
> -	if (unlikely(!vmf->pte))
> -		return 0;
> -	if (unlikely(!pte_same(ptep_get(vmf->pte), vmf->orig_pte))) {
> -		pte_unmap_unlock(vmf->pte, vmf->ptl);
> -		return 0;
> -	}
> +	/*
> +	 * Store target_nid in last_cpupid field for the isolated
> +	 * folios.
> +	 */
> +	folio_xchg_last_cpupid(folio, target_nid);
> +	list_add_tail(&folio->lru, &task->migrate_list);
> +	task->migrate_count += nr_pages;
>   out_map:
>   	/*
>   	 * Make it present again, depending on how arch implements
