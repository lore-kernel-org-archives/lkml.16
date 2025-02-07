Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103CA23F27E
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738942987; cv=none; b=n/xcvlfj8OIavNEyQiUy2lDvr0aNjs6823F6yWgJGUNdJqD0T+PWQd8OR25Wv3pKHF4XorA6NgnHIRnv3M2ukWVY6ppgaO/Pr+4QMU0TLNvruWrnCn4yjEWfBcPjcXOpmdDI0b3Myhb+5uDlQ3RBUr56GE4CeoZZUnqIT/o79BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738942987; c=relaxed/simple;
	bh=paKbXNPY0UurDJzhyQI/k3jGL4FCTyCG8HcA/p8yTtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P63He4wQAB3/sZJrM/giI2d1urce3Oc6JEXEXFh+R6LzfXsrN3P5sCC63Zo1DEVBkGCffW2XjzssZ7fyANifmtdUsWgOzfa8XkBfxVq/0FFw7Vyrd6uCppvNnoYzXCYRzgslnwmI2ZdFdhJ+W0QCVVAWE42xdpmlcYgggnF9Wnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AB811E8D;
	Fri,  7 Feb 2025 07:43:28 -0800 (PST)
Received: from [10.1.196.57] (eglon.cambridge.arm.com [10.1.196.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C8E93F58B;
	Fri,  7 Feb 2025 07:43:02 -0800 (PST)
Message-ID: <55dc287f-1277-40fa-9d68-baf6393beb3c@arm.com>
Date: Fri, 7 Feb 2025 15:43:01 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/40] x86/resctrl: Add a resctrl helper to reset all
 the resources
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
 <20241004180347.19985-15-james.morse@arm.com>
 <a0ed3b9b-c035-440b-8244-7e6a5c4009c9@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <a0ed3b9b-c035-440b-8244-7e6a5c4009c9@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 23/10/2024 22:32, Reinette Chatre wrote:
> On 10/4/24 11:03 AM, James Morse wrote:
>> On umount(), resctrl resets each resource back to its default
>> configuration. It only ever does this for all resources in one go.
>>
>> reset_all_ctrls() is architecture specific as it works with struct
>> rdt_hw_resource.
>>
>> Add an architecture helper to reset all resources.

>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index 61c8add103fe..a15198f90b29 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -2883,6 +2883,14 @@ static int reset_all_ctrls(struct rdt_resource *r)
>>  	return 0;
>>  }
>>  
>> +void resctrl_arch_reset_resources(void)
>> +{
>> +	struct rdt_resource *r;
>> +
>> +	for_each_alloc_capable_rdt_resource(r)
>> +		reset_all_ctrls(r);
>> +}

> Wouldn't this require all archs to have a duplicate helper as above with
> only the resctrl_all_ctrls() actually being arch specific? 

I was hoping to be able to save a few IPI by doing the per-core work once, instead of
per-resource-per-core ... but its only done on umount, so I doubt anyone will complain!


> What if it is instead:
> 	resctrl_reset_alloc_resources() or reset_alloc_resources() or ...
> 	{
> 		struct rdt_resource *r;
> 	
> 		for_each_alloc_capable_rdt_resource(r)
> 			resctrl_arch_reset_all_ctrls(r);
> 	}
> 
> With above archs only need to implement the actual reset code.

I opted for one helper that does everything as that is the only example today.
This has the advantage that the filesystem code can now reset a specific resource.

Sure, lets do that.


Thanks,

James

[0] https://lore.kernel.org/all/20230419111111.477118-8-dfustini@baylibre.com/
