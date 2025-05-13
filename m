Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7301DF982
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154574; cv=none; b=gq84cpY21l1IQhgBKm0IOIMjP6+sp0MUJg/iwabM//E5O/V5IGk3swmzrKlD6MWwZZAyP+Mp74T6ubv+4o4UMV5kKhoFtGb3dUHKlQSpvH3WDyVUs3o+estmCH9T4Y1CB8EBi85onu66fAskrZt/wgbPY46NpyPFQGbL9RTuUx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154574; c=relaxed/simple;
	bh=ow4LxM+JNdxbsH3nI5NTgOpMe7c7FIASGfgSs2Gn0V0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WL4PM8Q7iDmSv4GcCmco+BxqyKbgtmTlGcKiUGWgsViP0jf7uygJ1AJg2ajk7D/+idaNXC45Jh3WzDeqJCSckCqq+NxTuOBUoTO0iBOuDpFo6H8zzsFeLFEopLs5XQQJ3JJFI2Y/Rc6x4ScWmi0SJJs9+ebiYwtLdCQR/xwMKHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C70901688;
	Tue, 13 May 2025 09:42:39 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6744C3F673;
	Tue, 13 May 2025 09:42:47 -0700 (PDT)
Message-ID: <25dcc566-08db-466a-853c-4c5f3ddad531@arm.com>
Date: Tue, 13 May 2025 17:42:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 07/30] x86/resctrl: Check all domains are offline in
 resctrl_exit()
To: Reinette Chatre <reinette.chatre@intel.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
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
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20250508171858.9197-1-james.morse@arm.com>
 <20250508171858.9197-8-james.morse@arm.com>
 <dafc0ab3-aaf7-4055-bf56-ffd5414f8895@intel.com> <aB3lS8K7I0wEkGw_@arm.com>
 <524a79fa-5066-44fb-b9ad-7182dd28fb39@intel.com>
 <abdd65a7-1f8e-4c3f-8e08-94787a054430@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <abdd65a7-1f8e-4c3f-8e08-94787a054430@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 09/05/2025 17:28, Reinette Chatre wrote:
> On 5/9/25 9:17 AM, Reinette Chatre wrote:
>> On 5/9/25 4:21 AM, Catalin Marinas wrote:
>>> On Thu, May 08, 2025 at 10:51:23AM -0700, Reinette Chatre wrote:
>>>> On 5/8/25 10:18 AM, James Morse wrote:
>>>>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>>>> index 88197afbbb8a..f617ac97758b 100644
>>>>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>>>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>>>> @@ -4420,8 +4420,32 @@ int __init resctrl_init(void)
>>>>>  	return ret;
>>>>>  }
>>>>>  
>>>>> +static bool __exit resctrl_online_domains_exist(void)
>>>>> +{
>>>>> +	struct rdt_resource *r;
>>>>> +
>>>>> +	for_each_rdt_resource(r) {
>>>>> +		if (!list_empty(&r->ctrl_domains) || !list_empty(&r->mon_domains))
>>>>> +			return true;
>>>>> +	}
>>>>> +
>>>>> +	return false;
>>>>> +}
>>>>
>>>> This looks the same as before. Did you notice my comment in [1] about this list_empty() usage?
>>>
>>> James may have missed that comment (and he's off today). Copying your
>>> comment here:
>>>
>>>> A list needs to be initialized for list_empty() to behave as intended. A list within
>>>> an uninitialized or "kzalloc()'ed" struct will not be considered empty.
>>>> resctrl_arch_get_resource() as used by for_each_rdt_resource() already establishes
>>>> that if an architecture does not support a particular resource then it can (should?)
>>>> return a "dummy/not-capable" resource. I do not think resctrl should require
>>>> anything additionally like initializing the lists of a dummy/not-capable resource
>>>> to support things like this loop.
>>>
>>> I agree the description of the resctrl_arch_get_resource() semantics
>>> doesn't specifically mention that the list_heads should be initialised
>>> in dummy resources. IIUC, x86 should be safe for now since the
>>> rdt_resources_all[] array elements have the ctrl_domains and mon_domains
>>> list_heads initialised.

I had missed this. The logic makes sense - I'll spin this as a v11.


>> Not all x86 resources support both control and monitoring. For these resources x86
>> only initializes the arrays it uses. For example, the L2 resource only supports control
>> and thus only the ctrl_domains list is initialized. When the above loop runs on a resource
>> like this it will return "true" because it believes there are monitoring domains
>> online.
>>
>> Your conclusion that x86 is safe for now may (reason for use of "may" follows) still
>> be valid since resctrl_online_domains_exist() is only called by x86 from its
>> resctrl_arch_exit() that is within the "exit.text" section. Here is where I am not
>> entirely certain of the impact (hence the earlier use of "may") since from what I can
>> tell the linker does not actually discard "exit.text" on x86 because it defines
>> RUNTIME_DISCARD_EXIT.

Aha - I'd not spotted that one before.


> If you are not familiar with the details then I should add for completeness that resctrl
> is not currently capable of being compiled as a module.


Thanks,

James
