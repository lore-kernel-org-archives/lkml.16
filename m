Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99E61D79A5
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 20:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749761366; cv=none; b=llXFj8oD3fuMuRzSVrsiOc0W84vYODaq7vYCd7cxcgGFaH8G2v+LGCMGda9kG0ACml09K94SCcoq52DAODLcvdL2r9P8iSAtLnOP7/VNdS9fEeHdXMqKZ9W+fanF2LtbI2XC1+vvOmgQ9ANE7loIK2bHRL+hrAbpHkzkBhf8YZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749761366; c=relaxed/simple;
	bh=rKR1E6Lcyyud785ve9rSwgT0vGLvbeDkgIqfSguNV2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q9ic9R0KJkOZKS89nsWZPkgsoKW2ZfWpmVkfPPIVSB9CeXVpX3c7TfB+BfGRPc/427cEBootnD/wJpQEvSBsqQgT9a7MD7LCu+I4g5oGiVYaqOUkC6seHloJEbJo01C58sIcDtipIZvgo+7sUsRrFjGq/diNjJ6kL9eECV+GiH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AE59152B;
	Thu, 12 Jun 2025 13:49:02 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D2543F673;
	Thu, 12 Jun 2025 13:49:19 -0700 (PDT)
Date: Thu, 12 Jun 2025 22:49:09 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Lifeng Zheng <zhenglifeng1@huawei.com>, Will Deacon <will@kernel.org>
Cc: sudeep.holla@arm.com, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxarm@huawei.com, jonathan.cameron@huawei.com,
	viresh.kumar@linaro.org, yangyicong@hisilicon.com,
	zhanjie9@hisilicon.com, lihuisong@huawei.com, yubowen8@huawei.com,
	vincent.guittot@linaro.org
Subject: Re: [PATCH] arm64: topology: Setup amu fie when cpu hotplugging
Message-ID: <aEs9RRs95IrHBBX6@arm.com>
References: <20250607094533.416368-1-zhenglifeng1@huawei.com>
 <20250612151736.GC12912@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612151736.GC12912@willie-the-truck>

On Thu, Jun 12, 2025 at 04:17:36PM +0100, Will Deacon wrote:
> [+arm topology folks]
> 
> On Sat, Jun 07, 2025 at 05:45:33PM +0800, Lifeng Zheng wrote:
> > Amu fie was set up by a cpufreq policy notifier after the policy was
> > created. This caused some problems:
> > 
> > 1. The cpus related to the same policy would all fail to set up amu fie if
> > one of them couldn't pass the freq_counters_valid() check.
> >
I believe that was actually deliberate - it's all or nothing.
On the other hand, that validation is pretty straightforward.
Would you mind sharing some more details on the setup that triggers it?
> > 2. The cpus fail to set up amu fie would never have a chance to set up
> > again.
> 
I'd say that's the consequence of 1.
> I don't fully understand this (we don't tend to use the past tense in commit
> messages), but it sounds like you're saying that the singleton nature of
> the AMU driver is causing you problems with late CPU hotplug. Is that
> correct? Can you perhaps be a bit more specific about what goes wrong and
> how to reproduce the issue, please?
> 
> > When boot with maxcpu=1 restrict, the support amu flags of the offline cpus
> > would never be setup. After that, when cpufreq policy was being created,
> > the online cpu might set up amu fie fail because the other cpus related to
> > the same policy couldn't pass the freq_counters_valid() check. Hotplug the
> > offline cpus, since the policy was already created, amu_fie_setup() would
> > never be called again. All cpus couldn't setup amu fie in this situation.
> > 
> > After commit 1f023007f5e7 ("arm64/amu: Use capacity_ref_freq() to set AMU
> > ratio"), the max_freq stores in policy data is never needed when setting up
> > amu fie.  This indicates that the setting up of amu fie does not depend on
> > the policy any more. So each cpu can set up amu fie separately during
> > hotplug and the problems above will be solved.
I do not think this is the conclusion I would draw from that change.
It aligns the AMU FIE code to use the right ratio based on the reference freq
instead of cpuinfo.max_freq
> > 
> > Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
> > ---
> >  arch/arm64/kernel/topology.c | 56 ++++++++++++++----------------------
> >  1 file changed, 21 insertions(+), 35 deletions(-)
> > 
> > diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> > index 5d07ee85bdae..207eab4fa31f 100644
> > --- a/arch/arm64/kernel/topology.c
> > +++ b/arch/arm64/kernel/topology.c
> > @@ -351,63 +351,49 @@ int arch_freq_get_on_cpu(int cpu)
> >  	return freq;
> >  }
> >  
> > -static void amu_fie_setup(const struct cpumask *cpus)
> > +static void amu_fie_setup(unsigned int cpu)
> >  {
> > -	int cpu;
> > -
> > -	/* We are already set since the last insmod of cpufreq driver */
> >  	if (cpumask_available(amu_fie_cpus) &&
> > -	    unlikely(cpumask_subset(cpus, amu_fie_cpus)))
> > +	    cpumask_test_cpu(cpu, amu_fie_cpus))
> >  		return;
> >  
> > -	for_each_cpu(cpu, cpus)
> > -		if (!freq_counters_valid(cpu))
> > -			return;
> > +	if (!freq_counters_valid(cpu))
> > +		return;
> >  
> >  	if (!cpumask_available(amu_fie_cpus) &&
> >  	    !zalloc_cpumask_var(&amu_fie_cpus, GFP_KERNEL)) {
> > -		WARN_ONCE(1, "Failed to allocate FIE cpumask for CPUs[%*pbl]\n",
> > -			  cpumask_pr_args(cpus));
> > +		WARN_ONCE(1, "Failed to allocate FIE cpumask for CPUs[%u]\n",
> > +			  cpu);
> >  		return;
> >  	}
> >  
> > -	cpumask_or(amu_fie_cpus, amu_fie_cpus, cpus);
> > +	cpumask_set_cpu(cpu, amu_fie_cpus);
> >  
> >  	topology_set_scale_freq_source(&amu_sfd, amu_fie_cpus);
> 
> Isn't it going to be potentially expensive to call this every time a CPU
> comes online?
> 
It does seem *bit excessive - I guess this should use single-CPU mask, to start
with.
> Will
> 
> [left the rest of the patch below for the folks I added]

I think I kinda get the idea, but having more details would help to clarify
things.

---
BR
Beata
> 
> >  
> > -	pr_debug("CPUs[%*pbl]: counters will be used for FIE.",
> > -		 cpumask_pr_args(cpus));
> > +	pr_debug("CPUs[%u]: counters will be used for FIE.", cpu);
> >  }
> >  
> > -static int init_amu_fie_callback(struct notifier_block *nb, unsigned long val,
> > -				 void *data)
> > +static int cpuhp_topology_online(unsigned int cpu)
> >  {
> > -	struct cpufreq_policy *policy = data;
> > -
> > -	if (val == CPUFREQ_CREATE_POLICY)
> > -		amu_fie_setup(policy->related_cpus);
> > -
> > -	/*
> > -	 * We don't need to handle CPUFREQ_REMOVE_POLICY event as the AMU
> > -	 * counters don't have any dependency on cpufreq driver once we have
> > -	 * initialized AMU support and enabled invariance. The AMU counters will
> > -	 * keep on working just fine in the absence of the cpufreq driver, and
> > -	 * for the CPUs for which there are no counters available, the last set
> > -	 * value of arch_freq_scale will remain valid as that is the frequency
> > -	 * those CPUs are running at.
> > -	 */
> > +	amu_fie_setup(cpu);
> >  
> >  	return 0;
> >  }
> >  
> > -static struct notifier_block init_amu_fie_notifier = {
> > -	.notifier_call = init_amu_fie_callback,
> > -};
> > -
> >  static int __init init_amu_fie(void)
> >  {
> > -	return cpufreq_register_notifier(&init_amu_fie_notifier,
> > -					CPUFREQ_POLICY_NOTIFIER);
> > +	int ret;
> > +
> > +	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> > +				"arm64/topology:online",
> > +				cpuhp_topology_online,
> > +				NULL);
> > +
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return 0;
> >  }
> >  core_initcall(init_amu_fie);
> >  
> > -- 
> > 2.33.0
> > 
