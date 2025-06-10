Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 972BF23909F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 19:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749584805; cv=none; b=CKeYwKyXUDLS8Ha8R2ULY0Tw46bMUVT14DJDVPAb/nDPbY6u5r5NodnPn4+9BLE5HheRjnCsJ+BO7VikKPqSQPLB3fejV7Mun6G9p5fj6pDCrf4WMNx9wjfQYxAIgmhzrg97/1fCpLRwSWoL9A/uJda/ESR0Mosw6ojQMr9tiJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749584805; c=relaxed/simple;
	bh=AQGZA8qFt3uQNSy7UGsqVMMIjuM+2UD4SPDnuRxd1U0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AVE9pVfXiA9sqFg2Yo0AguiBqv/ITaRE20EJesOvBapno7d4Cezp0zfACBbN/cF+ASSSPE++s9CloAxkRN97UtDkcyi/SK6rG/dipMlKQbNrnfmVNwL/fBMABpFLo2zxuO51J7VXVZQUEELR4+wB7sid/fqV/LJrhQBdDnvLZt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 657DE14BF;
	Tue, 10 Jun 2025 12:46:22 -0700 (PDT)
Received: from [10.57.79.109] (unknown [10.57.79.109])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 731383F66E;
	Tue, 10 Jun 2025 12:46:40 -0700 (PDT)
Message-ID: <98c0b70a-0cbd-46fd-b481-7663905bb8dc@arm.com>
Date: Tue, 10 Jun 2025 20:46:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] arm64/mm: Lift the cma address limit when
 CONFIG_DMA_NUMA_CMA=y
To: Catalin Marinas <catalin.marinas@arm.com>,
 Feng Tang <feng.tang@linux.alibaba.com>
Cc: Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Yang Shi <yang@os.amperecomputing.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Baruch Siach <baruch@tkos.co.il>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250521014701.73046-1-feng.tang@linux.alibaba.com>
 <aEhnELJQLw8S8Bho@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <aEhnELJQLw8S8Bho@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-10 6:10 pm, Catalin Marinas wrote:
> On Wed, May 21, 2025 at 09:47:01AM +0800, Feng Tang wrote:
>> When porting an cma related usage from x86_64 server to arm64 server,
>> the "cma=4G" setup failed on arm64, and the reason is arm64 has 4G (32bit)
>> address limit for cma reservation.
>>
>> The limit is reasonable due to device DMA requirement, but for NUMA
>> servers which have CONFIG_DMA_NUMA_CMA enabled, the limit is not required
>> as that config already allows cma area to be reserved on different NUMA
>> nodes whose memory very likely goes beyond 4G limit.
>>
>> Lift the cma limit for platform with such configuration.
> 
> I don't think that's the right fix. Those devices that have a NUMA node
> associated may be ok to address memory beyond 4GB. The default for
> NUMA_NO_NODE devices is still dma_contiguous_default_area. I also don't
> like to make such run-time decisions on the config option.

Indeed, the fact that the kernel was built with the option enabled says 
nothing at all about the needs of whatever system we're actually running 
on, so that's definitely wrong. This one is also the kind of option 
which may well be enabled in a multi-platform distro kernel, since it 
only adds a tiny amount of code with no functional impact on systems 
which don't explicitly opt in, but offers a useful benefit to those 
which can and do.

Furthermore, the justification doesn't add up at all - if the relevant 
devices could use the per-NUMA-node CMA areas, then... why not just have 
them use the per-NUMA-node CMA areas, no kernel change needed (and maybe 
a slight performance bonus too)? On the other hand, where those areas 
may or may not be allocated is entirely meaningless to NUMA_NO_NODE 
devices which wouldn't use them anyway.

> That said, maybe we should make the under-4G CMA allocation a best
> effort. In the arch code, if that failed, attempt the allocation again
> with a limit of 0 and maybe do a pr_notice() that CMA allocation in the
> DMA zone failed.

TBH given that the command-line parameter can specify placement as well 
as size, I think it would make a lot of sense to allow that to override 
the default limit provided by the arch code. That would give users the 
most flexibility, at the minor cost of having to accept the consequences 
if they do specify something which ends up not working for some devices. 
Otherwise I fear that any attempt to make the code itself cleverer will 
just lead down a rabbit-hole of trying to second-guess the user's intent 
- if the size doesn't fit the limit, who says it's right to increase the 
limit rather than reduce the size? And so on...

Thanks,
Robin.

> 
> Adding Robin in case he has a different view.
> 
>> Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
>> ---
>>   arch/arm64/mm/init.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
>> index b99bf3980fc6..661758678cc4 100644
>> --- a/arch/arm64/mm/init.c
>> +++ b/arch/arm64/mm/init.c
>> @@ -312,6 +312,7 @@ void __init arm64_memblock_init(void)
>>   void __init bootmem_init(void)
>>   {
>>   	unsigned long min, max;
>> +	phys_addr_t cma_limit;
>>   
>>   	min = PFN_UP(memblock_start_of_DRAM());
>>   	max = PFN_DOWN(memblock_end_of_DRAM());
>> @@ -343,8 +344,14 @@ void __init bootmem_init(void)
>>   
>>   	/*
>>   	 * Reserve the CMA area after arm64_dma_phys_limit was initialised.
>> +	 *
>> +	 * When CONFIG_DMA_NUMA_CMA is enabled, system may have CMA reserved
>> +	 * area in different NUMA nodes, which likely goes beyond the 32bit
>> +	 * limit, thus use (PHYS_MASK+1) as cma limit.
>>   	 */
>> -	dma_contiguous_reserve(arm64_dma_phys_limit);
>> +	cma_limit = IS_ENABLED(CONFIG_DMA_NUMA_CMA) ?
>> +			(PHYS_MASK + 1) : arm64_dma_phys_limit;
>> +	dma_contiguous_reserve(cma_limit);
>>   
>>   	/*
>>   	 * request_standard_resources() depends on crashkernel's memory being
>> -- 
>> 2.39.5 (Apple Git-154)

