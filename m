Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE43A3074B5
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 21:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750799046; cv=none; b=kWPgngLs1EVa3DThNmvU+4L9TSsyj/t5EE5JVsJJwtWyfDuMuHQwlu3fB0UBdAihx/oXbhH6JdshHQS//4TnYBbwbZTJkFoBz1xaYnB8ZUPsXoLIMyNgAs2WqjPTj2X2FWqnNBlTVx0K7XOFdqzqLLQTOwrkWiOeSJGeXPaEwfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750799046; c=relaxed/simple;
	bh=d6em6oXXNVshPYM0AGz9Br7xoVqUF9xb+X32wTgb/nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A82zboEBY4f82DevRwjaNNf0101dqmgEwO5+GYkcmsxaIQcsYT+Po01ICBgJ5IDyVp9BhU0fvkUFjUKsKKI4RPl2laegr/LirLp8SBLo77EaEEhKf6uYb6Qnvg2cY33iYTCeCH8JMBQWTiawfqFHynkW82XlzhIBceRi4hT/PHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E896A113E;
	Tue, 24 Jun 2025 14:03:44 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 310853F58B;
	Tue, 24 Jun 2025 14:03:57 -0700 (PDT)
Date: Tue, 24 Jun 2025 23:03:48 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: "zhenglifeng (A)" <zhenglifeng1@huawei.com>
Cc: Will Deacon <will@kernel.org>, sudeep.holla@arm.com,
	catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxarm@huawei.com,
	jonathan.cameron@huawei.com, viresh.kumar@linaro.org,
	yangyicong@hisilicon.com, zhanjie9@hisilicon.com,
	lihuisong@huawei.com, yubowen8@huawei.com,
	vincent.guittot@linaro.org
Subject: Re: [PATCH] arm64: topology: Setup amu fie when cpu hotplugging
Message-ID: <aFsStNd_c6bHC6Bo@arm.com>
References: <20250607094533.416368-1-zhenglifeng1@huawei.com>
 <20250612151736.GC12912@willie-the-truck>
 <aEs9RRs95IrHBBX6@arm.com>
 <3c7ac433-480b-4cb3-9645-4d2cc495f1a3@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c7ac433-480b-4cb3-9645-4d2cc495f1a3@huawei.com>

Hi Lifeng,

First of all, apologies for late reply.

On Mon, Jun 16, 2025 at 09:22:27PM +0800, zhenglifeng (A) wrote:
> On 2025/6/13 4:49, Beata Michalska wrote:
> > On Thu, Jun 12, 2025 at 04:17:36PM +0100, Will Deacon wrote:
> >> [+arm topology folks]
> >>
> >> On Sat, Jun 07, 2025 at 05:45:33PM +0800, Lifeng Zheng wrote:
> >>> Amu fie was set up by a cpufreq policy notifier after the policy was
> >>> created. This caused some problems:
> >>>
> >>> 1. The cpus related to the same policy would all fail to set up amu fie if
> >>> one of them couldn't pass the freq_counters_valid() check.
> >>>
> > I believe that was actually deliberate - it's all or nothing.
> > On the other hand, that validation is pretty straightforward.
> > Would you mind sharing some more details on the setup that triggers it?
> >>> 2. The cpus fail to set up amu fie would never have a chance to set up
> >>> again.
> >>
> > I'd say that's the consequence of 1.
> >> I don't fully understand this (we don't tend to use the past tense in commit
> >> messages), but it sounds like you're saying that the singleton nature of
> >> the AMU driver is causing you problems with late CPU hotplug. Is that
> >> correct? Can you perhaps be a bit more specific about what goes wrong and
> >> how to reproduce the issue, please?
> 
> Here's the problem I met:
> 
> Assuming cpu0 and cpu1 share the same cpufreq policy and LPI(Low Power Idle
> States) is on. When boot with a parameter maxcpus=1, Only cpu0 will go
> online. The support amu flag of cpu0 will be set but the flag of cpu1 will
> not. This will cause amu fie set up fail for cpu0 when cpufreq policy0 is
> creating. After that, when hotplug cpu1 on, the support amu flag of it will
> finally be set. But for cpu0 and cpu1, they'll never have the chance to set
> up amu fie, even though they're eligible.
Right, so currently we are using the related_cpus mask of a given policy.
For offlined CPUs, the cpu_has_amu_feat might not have a chance to check
the AMU support (as it is in your case) so indeed the setup for AMU FIE
support might fail.
> 
> So I think the best time to set up amu fie is when the cpu is going online,
> not when cpufreq policy is being created. This is what this patch does.
> 
I am not entirely sure this is the right way to go about this.
Getting back to the case described above: let's assume that CPU1 for some
(weird) reason cannot use AMU counters for frequency scale factor.
CPU0 will register for arch_scale_freq_tick and will use AMU counters to setup
the arch_freq_scale, whereas CPU1 won't. That can lead to inconsistencies
as the two will use different source of the freq scale.
Furthermore, the scale factor will be mixed between counter-based and
CPUFREQ-based even for CPU0 (topology_set_freq_scale).
I think we gonna need the mixture of the two.
We could try to use cpufreq_cpu_get on onlining CPU, but that will still not
solve all the issues.
> >>
> >>> When boot with maxcpu=1 restrict, the support amu flags of the offline cpus
> >>> would never be setup. After that, when cpufreq policy was being created,
> >>> the online cpu might set up amu fie fail because the other cpus related to
> >>> the same policy couldn't pass the freq_counters_valid() check. Hotplug the
> >>> offline cpus, since the policy was already created, amu_fie_setup() would
> >>> never be called again. All cpus couldn't setup amu fie in this situation.
> >>>
> >>> After commit 1f023007f5e7 ("arm64/amu: Use capacity_ref_freq() to set AMU
> >>> ratio"), the max_freq stores in policy data is never needed when setting up
> >>> amu fie.  This indicates that the setting up of amu fie does not depend on
> >>> the policy any more. So each cpu can set up amu fie separately during
> >>> hotplug and the problems above will be solved.
> > I do not think this is the conclusion I would draw from that change.
> > It aligns the AMU FIE code to use the right ratio based on the reference freq
> > instead of cpuinfo.max_freq
> 
> Yes, it's the purpose of this commit. What I'm trying to say is that thanks
> for this commit, cpuinfo.max_freq or even the whole policy is not needed
> anymore for setting up amu fie. And this is the precondition to this patch.
It is not needed for setting up AMU support for FIE, but it is needed to
provide consistent and reliable frequency scaling information I think.
> 
> >>>
> >>> Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
> >>> ---
> >>>  arch/arm64/kernel/topology.c | 56 ++++++++++++++----------------------
> >>>  1 file changed, 21 insertions(+), 35 deletions(-)
> >>>
> >>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> >>> index 5d07ee85bdae..207eab4fa31f 100644
> >>> --- a/arch/arm64/kernel/topology.c
> >>> +++ b/arch/arm64/kernel/topology.c
> >>> @@ -351,63 +351,49 @@ int arch_freq_get_on_cpu(int cpu)
> >>>  	return freq;
> >>>  }
> >>>  
> >>> -static void amu_fie_setup(const struct cpumask *cpus)
> >>> +static void amu_fie_setup(unsigned int cpu)
> >>>  {
> >>> -	int cpu;
> >>> -
> >>> -	/* We are already set since the last insmod of cpufreq driver */
> >>>  	if (cpumask_available(amu_fie_cpus) &&
> >>> -	    unlikely(cpumask_subset(cpus, amu_fie_cpus)))
> >>> +	    cpumask_test_cpu(cpu, amu_fie_cpus))
> >>>  		return;
> >>>  
> >>> -	for_each_cpu(cpu, cpus)
> >>> -		if (!freq_counters_valid(cpu))
> >>> -			return;
> >>> +	if (!freq_counters_valid(cpu))
> >>> +		return;
> >>>  
> >>>  	if (!cpumask_available(amu_fie_cpus) &&
> >>>  	    !zalloc_cpumask_var(&amu_fie_cpus, GFP_KERNEL)) {
> >>> -		WARN_ONCE(1, "Failed to allocate FIE cpumask for CPUs[%*pbl]\n",
> >>> -			  cpumask_pr_args(cpus));
> >>> +		WARN_ONCE(1, "Failed to allocate FIE cpumask for CPUs[%u]\n",
> >>> +			  cpu);
> >>>  		return;
> >>>  	}
> >>>  
> >>> -	cpumask_or(amu_fie_cpus, amu_fie_cpus, cpus);
> >>> +	cpumask_set_cpu(cpu, amu_fie_cpus);
> >>>  
> >>>  	topology_set_scale_freq_source(&amu_sfd, amu_fie_cpus);
> >>
> >> Isn't it going to be potentially expensive to call this every time a CPU
> >> comes online?
> >>
> > It does seem *bit excessive - I guess this should use single-CPU mask, to start
> > with.
> 
> For the cpus which already setup amu fie, they won't pass the first "if" in
> this function, so it's not so expensive I think. For the other cpus, I
> believe it's worth a try to set.
I believe the deal here is that topology_set_scale_freq_source will be called
with amu_fie_cpus mask that might contain other CPUs that already have been
registered as freq scale source. But that is not horribly expensive, and
calling rebuild_sched_domains_energy is already optimised.

---
BR
Beata
> 
> >> Will
> >>
> >> [left the rest of the patch below for the folks I added]
> > 
> > I think I kinda get the idea, but having more details would help to clarify
> > things.
> > 
> > ---
> > BR
> > Beata
> >>
> >>>  
> >>> -	pr_debug("CPUs[%*pbl]: counters will be used for FIE.",
> >>> -		 cpumask_pr_args(cpus));
> >>> +	pr_debug("CPUs[%u]: counters will be used for FIE.", cpu);
> >>>  }
> >>>  
> >>> -static int init_amu_fie_callback(struct notifier_block *nb, unsigned long val,
> >>> -				 void *data)
> >>> +static int cpuhp_topology_online(unsigned int cpu)
> >>>  {
> >>> -	struct cpufreq_policy *policy = data;
> >>> -
> >>> -	if (val == CPUFREQ_CREATE_POLICY)
> >>> -		amu_fie_setup(policy->related_cpus);
> >>> -
> >>> -	/*
> >>> -	 * We don't need to handle CPUFREQ_REMOVE_POLICY event as the AMU
> >>> -	 * counters don't have any dependency on cpufreq driver once we have
> >>> -	 * initialized AMU support and enabled invariance. The AMU counters will
> >>> -	 * keep on working just fine in the absence of the cpufreq driver, and
> >>> -	 * for the CPUs for which there are no counters available, the last set
> >>> -	 * value of arch_freq_scale will remain valid as that is the frequency
> >>> -	 * those CPUs are running at.
> >>> -	 */
> >>> +	amu_fie_setup(cpu);
> >>>  
> >>>  	return 0;
> >>>  }
> >>>  
> >>> -static struct notifier_block init_amu_fie_notifier = {
> >>> -	.notifier_call = init_amu_fie_callback,
> >>> -};
> >>> -
> >>>  static int __init init_amu_fie(void)
> >>>  {
> >>> -	return cpufreq_register_notifier(&init_amu_fie_notifier,
> >>> -					CPUFREQ_POLICY_NOTIFIER);
> >>> +	int ret;
> >>> +
> >>> +	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> >>> +				"arm64/topology:online",
> >>> +				cpuhp_topology_online,
> >>> +				NULL);
> >>> +
> >>> +	if (ret < 0)
> >>> +		return ret;
> >>> +
> >>> +	return 0;
> >>>  }
> >>>  core_initcall(init_amu_fie);
> >>>  
> >>> -- 
> >>> 2.33.0
> >>>
> > 
> 
