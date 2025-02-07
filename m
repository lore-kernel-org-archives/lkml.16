Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDDA023C8B6
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943693; cv=none; b=pBFGqbykfF8uXXYDMhJmlz0cuEIeI3wTRhzEdXEGdrGwmWRbjVo69SJBZCWn0nbvjaPKsMdMW892ahxFdOPW56Cp26PlX8F3JIR/kgh07vjpYUf/69HDlDLnjtU093igm5bOERx6w0fwDMIYgA0UyOKt9xfHtFicjT7FiqjsL+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943693; c=relaxed/simple;
	bh=eUVDbaP3j/lKTHZEXesfkZxjA0dDHUU1jYO8Rq2Glhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UkbFIKoMnF3vZ9BY9UF4P3hn9LG2EHcFjiNgxevthKCSXTmWOlO59ZpaefpaWsIHFY3EjLVdnZwcVScuQFtJgWYQi3lYvQq4iRepiF4aKC069iVNJZArX3gWuKWim5neYngaUCUdvuuAHw6MZAmCttA7VWndDeDAGnnUj4MvQUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08C49113E;
	Fri,  7 Feb 2025 07:55:14 -0800 (PST)
Received: from [10.1.196.57] (eglon.cambridge.arm.com [10.1.196.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FC2D3F58B;
	Fri,  7 Feb 2025 07:54:44 -0800 (PST)
Message-ID: <72934529-d6a3-4231-8ed7-6e7dc4325e9c@arm.com>
Date: Fri, 7 Feb 2025 15:54:42 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 33/40] x86/resctrl: Drop __init/__exit on assorted
 symbols
To: Reinette Chatre <reinette.chatre@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Fenghua Yu <fenghua.yu@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 H Peter Anvin <hpa@zytor.com>, Babu Moger <Babu.Moger@amd.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20241004180347.19985-1-james.morse@arm.com>
 <20241004180347.19985-34-james.morse@arm.com>
 <2897562e-fc97-4cc4-b4ad-316e84c87c9d@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <2897562e-fc97-4cc4-b4ad-316e84c87c9d@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 24/10/2024 00:56, Reinette Chatre wrote:
> On 10/4/24 11:03 AM, James Morse wrote:
>> Because ARM's MPAM controls are probed using MMIO, resctrl can't be
>> initialised until enough CPUs are online to have determined the
>> system-wide supported num_closid. Arm64 also supports 'late onlined
>> secondaries', where only a subset of CPUs are online during boot.
>>
>> These two combine to mean the MPAM driver may not be able to initialise
>> resctrl until user-space has brought 'enough' CPUs online.
>>
>> To allow MPAM to initialise resctrl after __init text has been free'd,
>> remove all the __init markings from resctrl.
>>
>> The existing __exit markings cause these functions to be removed by the
>> linker as it has never been possible to build resctrl as a module. MPAM
>> has an error interrupt which causes the driver to reset and disable
>> itself. Remove the __exit markings to allow the MPAM driver to tear down
>> resctrl when an error occurs.

>> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
>> index f484726a2588..f713ac628444 100644
>> --- a/arch/x86/kernel/cpu/resctrl/core.c
>> +++ b/arch/x86/kernel/cpu/resctrl/core.c
>> @@ -775,7 +775,7 @@ struct rdt_options {
>>  	bool	force_off, force_on;
>>  };
>>  
>> -static struct rdt_options rdt_options[]  __initdata = {
>> +static struct rdt_options rdt_options[]  __ro_after_init = {
>>  	RDT_OPT(RDT_FLAG_CMT,	    "cmt",	X86_FEATURE_CQM_OCCUP_LLC),
>>  	RDT_OPT(RDT_FLAG_MBM_TOTAL, "mbmtotal", X86_FEATURE_CQM_MBM_TOTAL),
>>  	RDT_OPT(RDT_FLAG_MBM_LOCAL, "mbmlocal", X86_FEATURE_CQM_MBM_LOCAL),
>> @@ -815,7 +815,7 @@ static int __init set_rdt_options(char *str)
>>  }
>>  __setup("rdt", set_rdt_options);
>>  
>> -bool __init rdt_cpu_has(int flag)
>> +bool rdt_cpu_has(int flag)

> I assume this can be dropped when resctrl_arch_is_evt_configurable() uses
> a helper instead?

resctrl_arch_is_evt_configurable() is that helper! If we wanted to decouple this in the
x86 arch code, it could do the rdt_cpu_has() stuff at boot, then test flags in
rdt_mon_features - but that isn't how it works today, and I don't think its worth the churn.

This __init marker causes a mismatched-sections warning because its called via
resctrl_arch_is_evt_configurable() from non __init marked code.


Thanks,

James
