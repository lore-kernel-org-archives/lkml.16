Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63DF12EAB7E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751042327; cv=none; b=Jv3vSgwtuDmEuzAWQ2RBOe10RGGH4SplQ8/6dH8MH51tNZe8FVEgMvci8AUmULDP+DNz32lETmn5Nne5JEzljGcCPt58hosi5Kqx2US1q7erX7qDTYmyVqBWH+Qx89taYqtRn0yilQgKfOnOwCBGFI76hPN0Ib+0l4a8gdFKnUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751042327; c=relaxed/simple;
	bh=MVjnJtOV6iEylwJPXPD+jcU1NfhGiK0XaSZs6PCeP5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JjM1CBeZpgr/VXVoVKy/Lr1WskOHcEMm8Vo49/FRDiKbEsdsQuCcG2GVRUv4Jy24cvEVOrG9MHzDZABVxosVFuuYWU8I5s3ujN3K8YxSOfz26rEuTgcC0UJcw3I0RSVDnRBRbL+J0ET3BkYZpRKRZ4w4juwE43oW2TEJu3Vg984=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AE0028C7;
	Fri, 27 Jun 2025 09:38:28 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F4E23F58B;
	Fri, 27 Jun 2025 09:38:44 -0700 (PDT)
Message-ID: <d1756a25-97e2-4a3b-a3be-cb2d95cfb7c1@arm.com>
Date: Fri, 27 Jun 2025 17:38:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] cacheinfo: Expose the code to generate a cache-id
 from a device_node
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, sudeep.holla@arm.com,
 Rob Herring <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>
References: <20250613130356.8080-1-james.morse@arm.com>
 <20250613130356.8080-5-james.morse@arm.com>
 <20250617172132.00002844@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250617172132.00002844@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jonathan,

On 17/06/2025 17:21, Jonathan Cameron wrote:
> On Fri, 13 Jun 2025 13:03:55 +0000
> James Morse <james.morse@arm.com> wrote:

>> The MPAM driver identifies caches by id for use with resctrl. It
>> needs to know the cache-id when probe-ing, but the value isn't set
>> in cacheinfo until the corresponding CPU comes online.
>>
>> Expose the code that generates the cache-id. This allows the MPAM
>> driver to determine the properties of the caches without waiting
>> for all CPUs to come online.

> Feels to me like this needs to come with the user.
> The earlier patches at least expose it via existing infrastructure
> this isn't used at all yet...

Yeah, I'm damned whatever I do here. I can move this (and patch 5) to the series with the
MPAM driver - this was me trying to reduce the number of people that get copied on that,
and the number of trees that it touches...


>> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
>> index d8e5b4c7156c..6316d80abab8 100644
>> --- a/drivers/base/cacheinfo.c
>> +++ b/drivers/base/cacheinfo.c
>> @@ -188,7 +188,7 @@ static bool cache_node_is_unified(struct cacheinfo *this_leaf,
>>  #define arch_compact_of_hwid(_x)	(_x)
>>  #endif
>>  
>> -static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
>> +unsigned long cache_of_get_id(struct device_node *np)

> Bit confusing to have cache_of_set_id() call cache_of_get_id() like this because
> they are in no way mirrors of each other.   Rename?
> (and naturally I'm providing no suggestions :)

I'll try cache_of_calculate_id() ...


>>  {
>>  	struct device_node *cpu;
>>  	u32 min_id = ~0;


Thanks,

James
