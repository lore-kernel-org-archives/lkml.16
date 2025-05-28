Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3133398A
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 02:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748399442; cv=none; b=btCa/eyQf2OKs6VhlUTHKxYokN6W1UPCKOWItH0HkyRDLbujWid1nOisvDGZHbIH0HUJGpv6RlAWZNpEjht8gIFfORIacASDySNYJwbvcjUoZxXVkqAi/ekYXKdP5cRPdXlZKiCEzjCoBP/l5RcSyUjP/0c5l9JOMBV3rFXCrQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748399442; c=relaxed/simple;
	bh=cgw3zgYmKScxl2sklQoE1AMEPFW6AHwB7KJ/wN1ji34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SqIIOxkidQLZHLm+3BVneGB+3yI7lvq+xG7gMkVx5bsGVRUQrmLgBd6OYTvyiXHF6Fi9Rjl3h0WC5ZpDFJcGrtJaE8HSLWQbwMXwQg/ieqf6skc+JL+hyOS2mv+AmabKGLLpmEGIyCY56/AGuGoPtfJuoPfKhlu8fCNyBppJXcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=iqtP18d/; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="iqtP18d/"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1748399431; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=4GKIzVM2Fg2/j7DiLGJIHTMBZLOUdWqEOifY6fxsKhY=;
	b=iqtP18d/R6PNMA26caDr9g2j6Yh0XXjtYjLdOHVFFj4zY5776DntxJgpW7mqVd+M5706Nraz4npyod/qtrdQ4cyacu34JxWgyy4Uv3paWtZFq52sQh9QUXQsyVhi5DCpU6pVufvyelAPuW8+ewjqtGLBt9UC3gm8bQcbJKEPRIU=
Received: from 30.178.82.30(mailfrom:qinyuntan@linux.alibaba.com fp:SMTPD_---0WcBXhv3_1748399422 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 28 May 2025 10:30:30 +0800
Message-ID: <c0c4a374-d24e-4896-8adc-4df43249ecd2@linux.alibaba.com>
Date: Wed, 28 May 2025 10:30:21 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: =?UTF-8?B?TW96aWxsYSBUaHVuZGVyYmlyZCDmtYvor5XniYg=?=
Subject: Re: [PATCH] x86/resctrl: Remove unnecessary references to cacheinfo
 in the resctrl subsystem.
To: "Luck, Tony" <tony.luck@intel.com>
Cc: "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, Reinette Chatre <reinette.chatre@intel.com>
References: <20250526073744.62520-1-qinyuntan@linux.alibaba.com>
 <aDYt0eXB4nSawkJr@agluck-desk3>
From: qinyuntan <qinyuntan@linux.alibaba.com>
In-Reply-To: <aDYt0eXB4nSawkJr@agluck-desk3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/28/25 5:25 AM, Luck, Tony wrote:
> On Mon, May 26, 2025 at 03:37:44PM +0800, Qinyun Tan wrote:
> 
> Hi Qinyun Tan,
> 
>> In the resctrl subsystem's Sub-NUMA Cluster (SNC) mode, the rdt_mon_domain
>> structure previously relied on the cacheinfo interface to store L3 cache
>> information (e.g., shared_cpu_map) for monitoring. However, this approach
>> introduces risks when CPUs go offline:
>>
>> 1. Inconsistency: The ci field in rdt_mon_domain was initialized using the
>> first online CPU of a NUMA node. If this CPU later goes offline, the
>> shared_cpu_map (managed by the cache subsystem) is cleared, leading to
>> incorrect or undefined behavior when accessed via rdt_mon_domain.
>>
>> 2. Lifecycle dependency: The cacheinfo structure's lifecycle is managed
>> by the cache subsystem, making it unsafe for resctrl to hold
>> long-term references.
> 
> You are correct. Saving a pointer to the per-cpu cacheinfo leads to
> the problems that you describe.
> 
>> To resolve these issues and align with design principles:
>>
>> 1. Replace direct cacheinfo references in struct rdt_mon_domain and struct
>> rmid_read with the cacheinfo ID (a unique identifier for the L3 cache).
>>
>> 2. Use hdr.cpu_mask (already maintained by resctrl) to replace
>> shared_cpu_map logic for determining valid CPUs for RMID counter reads
>> via the MSR interface.
>>
>> Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>
>> ---
>>   arch/x86/kernel/cpu/resctrl/core.c        | 6 ++++--
>>   arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 6 +++---
>>   arch/x86/kernel/cpu/resctrl/internal.h    | 4 ++--
>>   arch/x86/kernel/cpu/resctrl/monitor.c     | 6 +-----
>>   arch/x86/kernel/cpu/resctrl/rdtgroup.c    | 6 +++---
>>   include/linux/resctrl.h                   | 4 ++--
>>   6 files changed, 15 insertions(+), 17 deletions(-)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
>> index cf29681d01e04..a0dff742e9e93 100644
>> --- a/arch/x86/kernel/cpu/resctrl/core.c
>> +++ b/arch/x86/kernel/cpu/resctrl/core.c
>> @@ -516,6 +516,7 @@ static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
>>   	struct rdt_hw_mon_domain *hw_dom;
>>   	struct rdt_domain_hdr *hdr;
>>   	struct rdt_mon_domain *d;
>> +	struct cacheinfo *ci;
>>   	int err;
>>   
>>   	lockdep_assert_held(&domain_list_lock);
>> @@ -543,12 +544,13 @@ static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
>>   	d = &hw_dom->d_resctrl;
>>   	d->hdr.id = id;
>>   	d->hdr.type = RESCTRL_MON_DOMAIN;
>> -	d->ci = get_cpu_cacheinfo_level(cpu, RESCTRL_L3_CACHE);
>> -	if (!d->ci) {
>> +	ci = get_cpu_cacheinfo_level(cpu, RESCTRL_L3_CACHE);
>> +	if (!ci) {
>>   		pr_warn_once("Can't find L3 cache for CPU:%d resource %s\n", cpu, r->name);
>>   		mon_domain_free(hw_dom);
>>   		return;
>>   	}
>> +	d->ci_id = ci->id;
>>   	cpumask_set_cpu(cpu, &d->hdr.cpu_mask);
>>   
>>   	arch_mon_domain_online(r, d);
>> diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> index 0a0ac5f6112ec..f9768669ce806 100644
>> --- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> +++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> @@ -690,10 +690,10 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
>>   		 * one that matches this cache id.
>>   		 */
>>   		list_for_each_entry(d, &r->mon_domains, hdr.list) {
>> -			if (d->ci->id == domid) {
>> -				rr.ci = d->ci;
>> +			if (d->ci_id == domid) {
>> +				rr.ci_id = d->ci_id;
>>   				mon_event_read(&rr, r, NULL, rdtgrp,
>> -					       &d->ci->shared_cpu_map, evtid, false);
>> +					       &d->hdr.cpu_mask, evtid, false);
> 
> This change restricts choice of CPUs to execute the read to one of the
> CPUs in the SNC domain, instead of any that share the L3 cache.
hdr.cpu_mask is a subset of ci->shared_cpu_map, and using it should have 
no side effects？>
>>   				goto checkresult;
>>   			}
>>   		}
>> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
>> index eaae99602b617..91e71db554a9c 100644
>> --- a/arch/x86/kernel/cpu/resctrl/internal.h
>> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
>> @@ -136,7 +136,7 @@ union mon_data_bits {
>>    *	   domains in @r sharing L3 @ci.id
>>    * @evtid: Which monitor event to read.
>>    * @first: Initialize MBM counter when true.
>> - * @ci:    Cacheinfo for L3. Only set when @d is NULL. Used when summing domains.
>> + * @ci_id:    Cacheinfo id for L3. Only set when @d is NULL. Used when summing domains.
>>    * @err:   Error encountered when reading counter.
>>    * @val:   Returned value of event counter. If @rgrp is a parent resource group,
>>    *	   @val includes the sum of event counts from its child resource groups.
>> @@ -150,7 +150,7 @@ struct rmid_read {
>>   	struct rdt_mon_domain	*d;
>>   	enum resctrl_event_id	evtid;
>>   	bool			first;
>> -	struct cacheinfo	*ci;
>> +	unsigned int	ci_id;
>>   	int			err;
>>   	u64			val;
>>   	void			*arch_mon_ctx;
>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>> index a93ed7d2a1602..bedccd62158c3 100644
>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>> @@ -620,10 +620,6 @@ static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
>>   		return 0;
>>   	}
>>   
>> -	/* Summing domains that share a cache, must be on a CPU for that cache. */
>> -	if (!cpumask_test_cpu(cpu, &rr->ci->shared_cpu_map))
>> -		return -EINVAL;
>> -
> 
> This sanity check that code is executing on a CPU that shares the L3
> cache has gone. But I don't see any code to replace it based on checking
> your new "ci_id" field.
You are right，I will add this check in the next patch.>
> Should it be something like:
> 
> 	struct cacheinfo *ci;
> 
> 	ci = get_cpu_cacheinfo_level(cpu, RESCTRL_L3_CACHE);
> 	if (!ci || ci->id != rr->ci_id)
> 		return -EINVAL;
> 
>>   	/*
>>   	 * Legacy files must report the sum of an event across all
>>   	 * domains that share the same L3 cache instance.
>> @@ -633,7 +629,7 @@ static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
>>   	 */
>>   	ret = -EINVAL;
>>   	list_for_each_entry(d, &rr->r->mon_domains, hdr.list) {
>> -		if (d->ci->id != rr->ci->id)
>> +		if (d->ci_id != rr->ci_id)
>>   			continue;
>>   		err = resctrl_arch_rmid_read(rr->r, d, closid, rmid,
>>   					     rr->evtid, &tval, rr->arch_mon_ctx);
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index cc4a54145c83d..075fdca2080d8 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -3146,7 +3146,7 @@ static void rmdir_mondata_subdir_allrdtgrp(struct rdt_resource *r,
>>   	char name[32];
>>   
>>   	snc_mode = r->mon_scope == RESCTRL_L3_NODE;
>> -	sprintf(name, "mon_%s_%02d", r->name, snc_mode ? d->ci->id : d->hdr.id);
>> +	sprintf(name, "mon_%s_%02d", r->name, snc_mode ? d->ci_id : d->hdr.id);
>>   	if (snc_mode)
>>   		sprintf(subname, "mon_sub_%s_%02d", r->name, d->hdr.id);
>>   
>> @@ -3171,7 +3171,7 @@ static int mon_add_all_files(struct kernfs_node *kn, struct rdt_mon_domain *d,
>>   		return -EPERM;
>>   
>>   	priv.u.rid = r->rid;
>> -	priv.u.domid = do_sum ? d->ci->id : d->hdr.id;
>> +	priv.u.domid = do_sum ? d->ci_id : d->hdr.id;
>>   	priv.u.sum = do_sum;
>>   	list_for_each_entry(mevt, &r->evt_list, list) {
>>   		priv.u.evtid = mevt->evtid;
>> @@ -3198,7 +3198,7 @@ static int mkdir_mondata_subdir(struct kernfs_node *parent_kn,
>>   	lockdep_assert_held(&rdtgroup_mutex);
>>   
>>   	snc_mode = r->mon_scope == RESCTRL_L3_NODE;
>> -	sprintf(name, "mon_%s_%02d", r->name, snc_mode ? d->ci->id : d->hdr.id);
>> +	sprintf(name, "mon_%s_%02d", r->name, snc_mode ? d->ci_id : d->hdr.id);
>>   	kn = kernfs_find_and_get(parent_kn, name);
>>   	if (kn) {
>>   		/*
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index 880351ca3dfcb..c990670d18c02 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -145,7 +145,7 @@ struct rdt_ctrl_domain {
>>   /**
>>    * struct rdt_mon_domain - group of CPUs sharing a resctrl monitor resource
>>    * @hdr:		common header for different domain types
>> - * @ci:			cache info for this domain
>> + * @ci_id:			cache info id for this domain
>>    * @rmid_busy_llc:	bitmap of which limbo RMIDs are above threshold
>>    * @mbm_total:		saved state for MBM total bandwidth
>>    * @mbm_local:		saved state for MBM local bandwidth
>> @@ -156,7 +156,7 @@ struct rdt_ctrl_domain {
>>    */
>>   struct rdt_mon_domain {
>>   	struct rdt_domain_hdr		hdr;
>> -	struct cacheinfo		*ci;
>> +	unsigned int			ci_id;
>>   	unsigned long			*rmid_busy_llc;
>>   	struct mbm_state		*mbm_total;
>>   	struct mbm_state		*mbm_local;
>> -- 
>> 2.43.5
>>
> 
> One other note. Linus just[1] merged the patches that split the
> architecture independent portions of resctrl into "fs/resctrl"
> (moving just over 7000 lines out of arch/x86/kernel/cpu/resctrl).
> 
> Some parts of this patch touch code that moved. But it should be
> fairly easy to track the new location as the function names did
> not change in the move. Please base new version of the patch on
> upstream.
> 
> -Tony
> 
> [1] After you wrote this patch, and about 4 hours before I'm writing
> this reply!Ok. Soon I will rebase the master and then resend thispatch.

--
Thanks
Qinyun Tan


