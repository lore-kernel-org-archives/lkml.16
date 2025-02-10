Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 710FD221DA9
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 13:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739193753; cv=none; b=X9RItJg6weWxtBsM6YSGUULFFuW6+wJvpQG+WXM8vGEdVrKvXvOHctEFN9vO0cF2DKHXdHA1acR60oDLvI1YfptLFD7bCgVwbvxeVpO8xscCGVitkideCaMJAx/mq8Gxq7J3G+vKtZk8ha/G9+aoIagYNzyyNBtFf6A6j45bvvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739193753; c=relaxed/simple;
	bh=/maDo5bWD+jijserh85sAAmI+TFHqLooi38X/dy4bko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n4DiQS0JVLb0A5NHdQDYeF/RQHtkHGwe7W8FmlQzWNMGkD/Nxh0oHfKPdJLlK4RgZCKqCv2S8hr7oohyB+/fIqjFfDXF96It5JiVHA6vtnA2QQc3NfZC4N7m9UKiIeCnshWFcYlELgZlUvUAKT8fAdv7rDQmu51cAtr/000aaIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C6761BA8;
	Mon, 10 Feb 2025 05:22:52 -0800 (PST)
Received: from [10.1.196.57] (eglon.cambridge.arm.com [10.1.196.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 976AB3F58B;
	Mon, 10 Feb 2025 05:22:27 -0800 (PST)
Message-ID: <ea62c5fc-0022-40fd-a565-de6d6e8d72da@arm.com>
Date: Mon, 10 Feb 2025 13:22:26 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 27/40] x86/resctrl: Move thread_throttle_mode_init() to
 be managed by resctrl
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
 <20241004180347.19985-28-james.morse@arm.com>
 <9ef7e709-7bc8-4bf5-b5b6-960e2eed5cfc@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <9ef7e709-7bc8-4bf5-b5b6-960e2eed5cfc@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 23/10/2024 23:59, Reinette Chatre wrote:
> On 10/4/24 11:03 AM, James Morse wrote:
>> thread_throttle_mode_init() is called from the architecture specific code
>> to make the 'thread_throttle_mode' file visible. The architecture specific
>> code has already set the membw.throttle_mode in the rdt_resource.
>>
>> This doesn't need to be specific to the architecture, the throttle_mode
>> can be used by resctrl to determine if the 'thread_throttle_mode' file
>> should be visible.
>>
>> Call thread_throttle_mode_init() from resctrl_setup(), check the
>> membw.throttle_mode on the MBA resource. This avoids publishing an
>> extra function between the architecture and filesystem code.


>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index 3f10e6897daa..596f5f087834 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -2048,10 +2048,15 @@ static struct rftype *rdtgroup_get_rftype_by_name(const char *name)
>>  	return NULL;
>>  }
>>  
>> -void __init thread_throttle_mode_init(void)
>> +static void __init thread_throttle_mode_init(void)
>>  {
>> +	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_MBA);
>>  	struct rftype *rft;
>>  
>> +	if (!r->alloc_capable ||
>> +	    r->membw.throttle_mode == THREAD_THROTTLE_UNDEFINED)
>> +		return;
>> +
> 
> The goal from the changelog is to make "thread_throttle_mode_init()" not be specific
> to an architecture. It does so by checking the value of rdt_resource->resctrl_membw->membw_throttle_mode.
> I thus expect that as part of being non-architectural it should check this for all
> resources that initialize resctrl_membw, this includes RDT_RESOURCE_SMBA.

Sure.

Adding this creates the new corner-case where MBA has a throttle_mode but SMBA does not.
I'll add the corresponding logic to rdt_thread_throttle_mode_show() to print 'undefined'
to user-space if that ever happens.


Thanks,

James
