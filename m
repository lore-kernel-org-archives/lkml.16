Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57B62EA720
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751042325; cv=none; b=brgP33CWKUZ/OZzJt6nDkDCdKrBFWVsGWOUTRHf5CAO8eIM1mIdqI9FNw5t6yTteNwZLYdAxxKrz3cOsCKSdthL/6XEyA51wG6ZoDVJ86Dls7VTjlkLbIHOoDocKxOMB32lASpOfbzmXoSStB/DXjgrTzHfc5irAjUexdaQBc/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751042325; c=relaxed/simple;
	bh=awHP0mquVWLkkBRrsYxhttdmP/uavrq00OXo3PH644s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bFHudWdlIWE3DnCbs//tvv9PfcacpKjFyHYAMi6XsPkrBoIrDnxaiSu1FMfFSDD/hYaa3EfpG3gjJbc5+65fznK0Ee4x6D8Ptx2wgNjyhh8CHOENSbLx3agdUImLKfAXXHoIv/M7bYzIX0jXxvqdbnIxq2STfZq6q/107KRZtM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C74072910;
	Fri, 27 Jun 2025 09:38:25 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FCBD3F58B;
	Fri, 27 Jun 2025 09:38:41 -0700 (PDT)
Message-ID: <88e4005e-64d3-4019-939f-5c0c656666ca@arm.com>
Date: Fri, 27 Jun 2025 17:38:39 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] cacheinfo: Add helper to find the cache size from
 cpu+level
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, sudeep.holla@arm.com,
 Rob Herring <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>
References: <20250613130356.8080-1-james.morse@arm.com>
 <20250613130356.8080-6-james.morse@arm.com>
 <20250617172808.00005c14@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250617172808.00005c14@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jonathan,

On 17/06/2025 17:28, Jonathan Cameron wrote:
> On Fri, 13 Jun 2025 13:03:56 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> The MPAM driver needs to know the size of a cache associated with a
>> particular CPU. The DT/ACPI agnostic way of doing this is to ask cacheinfo.
>>
>> Add a helper to do this.

>> diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
>> index 9c959caf8af8..3f1b6b2e25b5 100644
>> --- a/include/linux/cacheinfo.h
>> +++ b/include/linux/cacheinfo.h
>> @@ -148,6 +148,26 @@ static inline int get_cpu_cacheinfo_id(int cpu, int level)
>>  	return ci ? ci->id : -1;
>>  }
>>  
>> +/*
>> + * Get the size of the cache associated with @cpu at level @level.
>> + * cpuhp lock must be held.

> To me kernel-doc would be appropriate.  Particularly the return 0 thing.
> However there isn't any for existing cacheinfo interfaces so maybe
> fair enough to 'follow local style' on that.

Documentation should be the direction of travel right? I'll change this.


>> + */
>> +static inline unsigned int get_cpu_cacheinfo_size(int cpu, int level)
>> +{
>> +	struct cpu_cacheinfo *ci = get_cpu_cacheinfo(cpu);
>> +	int i;
>> +
>> +	if (!ci->info_list)
>> +		return 0;
>> +
>> +	for (i = 0; i < ci->num_leaves; i++) {
>> +		if (ci->info_list[i].level == level)
>> +			return ci->info_list[i].size;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
> Why not
> 
> static inline unsigned int get_cpu_cacheinfo_size(int cpu, int level)
> {
> 	struct cpu_cachinfo *ci = get_cpu_cacheinfo_level(cpu, lev);
> 
> 	return ci ? ci->size; 0;
> }
> 
> Like existing get_cpu_cacheinfo_id()?

I've been dragging this around for years. Fixed.


Thanks!

James
