Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AAD62405EE
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943126; cv=none; b=UQZZnQlWBYg5ygGGPSK6q33Lvna/ukf77MLsc1p4f6H//19N287pBt2WH5iEXMML8U8K7ETKkYaHkYHDcJriRULZxZe7DHjyVPKd+9HczOZz7eWHzcqRKKkDFhEx4KQUUNt/HuB5Ufz4untn9EI1s91gy3IPHGq/6frkqghAhj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943126; c=relaxed/simple;
	bh=Vy1Sk59oXfB37yoXgb/SPCcylPviwNA/0R1/9xV2Cek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mqpvsQBojjChkSbfWGNtUp+2+RN8q0mGqmWYD6D5d8+rkvWxtZKmZ1JZvJFY2x4O1DhveY5kn8UeaZSSW8cd/qb7Hw++dl9ea8P8AzUvwswaoDCUWLfmiWTZT6N79y3+oStCNlyLvBunUiy+jdUa5tiCAthQ0fxB0Eh1nS4BJuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 806D01E7D;
	Fri,  7 Feb 2025 07:45:47 -0800 (PST)
Received: from [10.1.196.57] (eglon.cambridge.arm.com [10.1.196.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4EB4B3F58B;
	Fri,  7 Feb 2025 07:45:21 -0800 (PST)
Message-ID: <cb82676d-807b-42b9-b692-62adba91a063@arm.com>
Date: Fri, 7 Feb 2025 15:45:19 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/40] x86/resctrl: Change
 mon_event_config_{read,write}() to be arch helpers
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
 <20241004180347.19985-22-james.morse@arm.com>
 <a0936b56-4a60-4fb3-be65-91e65d360aca@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <a0936b56-4a60-4fb3-be65-91e65d360aca@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 23/10/2024 23:19, Reinette Chatre wrote:
> On 10/4/24 11:03 AM, James Morse wrote:
>> @@ -315,6 +322,24 @@ int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid);
>>  
>>  bool __init resctrl_arch_is_evt_configurable(enum resctrl_event_id evt);
>>  
>> +/**
>> + * resctrl_arch_mon_event_config_write() - Write the config for a counter.
> 
> Please avoid the term "counter" for events ... the upcoming AMD work adds support
> for counters*. 

Fixed.


>> + * @info:	struct resctrl_mon_config_info describing the resource, domain
>> + *		and event.
> 
> Expected "config" to appear as part of information about function
> that claims to writes config?

I'll rename the variable.


>> + *
>> + * Must be called on a CPU that is a member of the specified domain.

> I am not sure about this. Is this documentation intended to support authors of
> arch code? In that case it may be instead useful to know that this function will be
> called on a CPU that is a member of the specified domain to avoid confusion from arch
> side whether it needs to take some action to ensure function is called on right CPU.
> 
> 	Called on a CPU that is a member of the specified domain.

I don't think we have clear idea who this documentation is for - I'm assuming its for the
caller...

I'll change this to "Called via IPI to reach a CPU that is a member of the specified
domain", as that covers both views, and adds that its called in irq context.


>> + */
>> +void resctrl_arch_mon_event_config_write(void *info);
>> +
>> +/**
>> + * resctrl_arch_mon_event_config_read() - Read the config for a counter.
> 
> counter -> event
> 
>> + * @info:	struct resctrl_mon_config_info describing the resource, domain
>> + *		and event.
> 
> Copy&paste? No information on how config is returned.

Laziness - there is only one possible place it could be! I've added:
| * Reads resource, domain and eventid from @config_info and reads the
|  * hardware config value into config_info->mon_config.

and similar on the other function.


Thanks,

James
