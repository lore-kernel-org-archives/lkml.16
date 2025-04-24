Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E64733DF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745486756; cv=none; b=TODbBXjJr3dufRJLcHVsmedyo7qK2OhBgpoOaTNahDbkQzXs/jLOE4MyOnWEijHV6xQMMn3JVhoQ87TmA/Y7x52O2zCqHTgza9VbHDiZIuI02rkan23OEJQhkxt2L/n/3ssEqs6FbenMp+t4qMy4s7oJ1lINaVXyaAA8NQoFI4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745486756; c=relaxed/simple;
	bh=6jZCz2w0VQxxoz5O79hQB7M5/zbIGmGvaYbGVrSnxBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ip6dnohIrrc3FmAvSLb1EwGRipPVlTkZOMm8PQA/2BztGFGVrjtfrlwMu1utV+tyUS6QgLFX3OPNXy5cxnxszUdyMRFOjVp10COQQwJJzZR3geOwxFJIUqEXd1CyuRYUPblPZSTw0msg7oUWDPVmb5l0INzbE3iVt3WCDGihPtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B56D41063;
	Thu, 24 Apr 2025 02:25:48 -0700 (PDT)
Received: from [10.1.196.43] (eglon.cambridge.arm.com [10.1.196.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 830CA3F66E;
	Thu, 24 Apr 2025 02:25:50 -0700 (PDT)
Message-ID: <250f8ff8-8576-4280-a9aa-9939090b4d31@arm.com>
Date: Thu, 24 Apr 2025 10:25:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/21] x86/resctrl: Move the filesystem bits to headers
 visible to fs/resctrl
To: Reinette Chatre <reinette.chatre@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>, shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, Tony Luck <tony.luck@intel.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-13-james.morse@arm.com>
 <b87f4c98-ef7b-44e7-ad25-8b2003bea5c3@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <b87f4c98-ef7b-44e7-ad25-8b2003bea5c3@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 17/04/2025 23:46, Reinette Chatre wrote:
>> diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
>> index 7a39728b0743..6eb7d5c94c7a 100644
>> --- a/arch/x86/include/asm/resctrl.h
>> +++ b/arch/x86/include/asm/resctrl.h
>> @@ -210,6 +210,9 @@ int resctrl_arch_measure_l2_residency(void *_plr);
>>  int resctrl_arch_measure_l3_residency(void *_plr);
>>  void resctrl_cpu_detect(struct cpuinfo_x86 *c);
>>  
>> +bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level l);
>> +int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable);

> I noticed this while reading through the telemetry work ... the custom
> appears to be for all arch helpers to be declared in include/linux/resctrl.h
> making these two stand out. What motivated their inclusion into
> arch/x86/include/asm/resctrl.h?

Doing some archaeology ... it looks like this dates from the era when MPAM had stub
versions of these because it didn't support/emulate CDP. Having these in the arch code's
header meant the static-inline stubs could be inlined into resctrl. x86 has an inline
version before this patch, but I moved it out of line to avoid exposing the array of all
resources. (which in turn would suggest changing the name, which isn't worth the churn)

I was assuming only x86 would ever support CDP, but since then, emulating CDP using the
separate I/D PARTID values MPAM has proved feasible.

I'll move them.


> If they move to include/linux/resctrl.h it looks like enum resctrl_res_level is
> no longer required to be in include/linux/resctrl_types.h.

Yes. I'll add a patch move it, but it feels like churn.


> Looking further, from commit f16adbaf9272 ("x86/resctrl: Move resctrl types to a separate header")
> the motivation for including enum resctrl_event_id is to support 
> resctrl_arch_mon_ctx_alloc() and resctrl_arch_mon_ctx_free(), but looking
> at their definitions in arch/x86/include/asm/resctrl.h they are using "int evtid"
> instead of enum resctrl_event_id. Looks like their definitions need to
> change?

Bother. The MPAM definition of those has the enum type, I'd missed that the x86 stub
swallowed the type. I'll fix that.


> I assume the pseudo-locking arch helpers are placed in arch/x86/include/asm/resctrl.h
> with the implicit knowledge that only x86 will set CONFIG_RESCTRL_FS_PSEUDO_LOCK so
> avoiding that extra handling in include/linux/resctrl.h?

Given how specific that is to x86, I think it will only ever be enabled there.
For arm, things like the prefetcher can't be disabled by linux. I would assume risc-v is
structurally the same.

Those definitions went into the arch header so that some architectures could inline the
stubs to let the compiler remove code that will never run.

I guess these could be defined both ways round in linux/resctrl.h depending on the Kconfig
symbol. At this point its churn, but this saves a third architecture having to define the
same list of stubs. (I reckon that is likely for risc-v).


Thanks,

James
