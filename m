Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEB41DE8BB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 10:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751884032; cv=none; b=iOdWZZtl5OtUiFt119bdKUDqDwmi+eP9S8ZBflcwiY0sdydqfEXRU2xl4vQkgtINp7ewTtEuktXoY+BcYxeQVEK79DiHtB+sSBm5UDtKx1n/HxIkRAV1+YXwHt78x3hEAojrUaKr0UIGLO8sIVxvhPoqpRCrdHE09G5jTOibqDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751884032; c=relaxed/simple;
	bh=Un/oE7qjSvi7G3I3N4C9KQ48YyzxUBuP7bKnrw3pmXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kWPiQIL3DUrNdZIk9ZlzOMjnI5x2gFzWhZHecNqRgHwtKgMCvRjURGJy2zGaLBBr5CyZ1y6/0XcLhH7I8ah10PHt8Y2A8zPAQdOtyW4QpPjdvdd4vyIOoFHR/Cbf6s73Yc3fja2KVLtdhJ9U1k3+lqDCVWsTjt7PblWY9RJRA6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CF201595;
	Mon,  7 Jul 2025 03:26:57 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 447733F6A8;
	Mon,  7 Jul 2025 03:27:08 -0700 (PDT)
Message-ID: <9495df36-053e-49a3-8046-1e6aed63b4af@arm.com>
Date: Mon, 7 Jul 2025 11:27:06 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] cacheinfo: Set cache 'id' based on DT data
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, sudeep.holla@arm.com,
 Rob Herring <robh@kernel.org>, Jonathan Cameron
 <jonathan.cameron@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 WillDeaconwill@kernel.org
References: <20250704173826.13025-1-james.morse@arm.com>
 <20250704173826.13025-2-james.morse@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20250704173826.13025-2-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi James,

On 7/4/25 18:38, James Morse wrote:
> From: Rob Herring <robh@kernel.org>
> 
> Use the minimum CPU h/w id of the CPUs associated with the cache for the
> cache 'id'. This will provide a stable id value for a given system. As
> we need to check all possible CPUs, we can't use the shared_cpu_map
> which is just online CPUs. As there's not a cache to CPUs mapping in DT,
> we have to walk all CPU nodes and then walk cache levels.
> 
> The cache_id exposed to user-space has historically been 32 bits, and
> is too late to change. This value is parsed into a u32 by user-space
> libraries such as libvirt:
> https://github.com/libvirt/libvirt/blob/master/src/util/virresctrl.c#L1588
> 
> Give up on assigning cache-id's if a CPU h/w id greater than 32 bits
> is found.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> [ ben: converted to use the __free cleanup idiom ]
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> [ morse: Add checks to give up if a value larger than 32 bits is seen. ]
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Use as a 32bit value has also been seen in DPDK patches here:
> http://inbox.dpdk.org/dev/20241021015246.304431-2-wathsala.vithanage@arm.com/
> 
> Changes since v1:
>   * Remove the second loop in favour of a helper.
>   
> An open question from v1 is whether it would be preferable to use an
> index into the DT of the CPU nodes instead of the hardware id. This would
> save an arch specific swizzle - but the numbers would change if the DT
> were changed. This scheme isn't sensitive to the order of DT nodes.
> 
> ---
>   drivers/base/cacheinfo.c | 38 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> index cf0d455209d7..df593da0d5f7 100644
> --- a/drivers/base/cacheinfo.c
> +++ b/drivers/base/cacheinfo.c
> @@ -8,6 +8,7 @@
>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>   
>   #include <linux/acpi.h>
> +#include <linux/bitfield.h>
>   #include <linux/bitops.h>
>   #include <linux/cacheinfo.h>
>   #include <linux/compiler.h>
> @@ -183,6 +184,42 @@ static bool cache_node_is_unified(struct cacheinfo *this_leaf,
>   	return of_property_read_bool(np, "cache-unified");
>   }
>   
> +static bool match_cache_node(struct device_node *cpu,
> +			     const struct device_node *cache_node)
> +{
> +	for (struct device_node *cache __free(device_node) = of_find_next_cache_node(cpu);
Looks like the creation of this helper function has upset the 
device_node reference counting. This first __free(device_node) will only 
cause of_node_put() to be called in the case of the early return from 
the loop. You've dropped the second __free(device_node) which accounts 
for 'cache' changing on each iteration.
> +	     cache != NULL; cache = of_find_next_cache_node(cache)) {
> +		if (cache == cache_node)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static void cache_of_set_id(struct cacheinfo *this_leaf,
> +			    struct device_node *cache_node)
> +{
> +	struct device_node *cpu;
> +	u32 min_id = ~0;
> +
> +	for_each_of_cpu_node(cpu) {
> +		u64 id = of_get_cpu_hwid(cpu, 0);
> +
> +		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
> +			of_node_put(cpu);
> +			return;
> +		}
> +
> +		if (match_cache_node(cpu, cache_node))
> +			min_id = min(min_id, id);
> +	}
> +
> +	if (min_id != ~0) {
> +		this_leaf->id = min_id;
> +		this_leaf->attributes |= CACHE_ID;
> +	}
> +}
> +
>   static void cache_of_set_props(struct cacheinfo *this_leaf,
>   			       struct device_node *np)
>   {
> @@ -198,6 +235,7 @@ static void cache_of_set_props(struct cacheinfo *this_leaf,
>   	cache_get_line_size(this_leaf, np);
>   	cache_nr_sets(this_leaf, np);
>   	cache_associativity(this_leaf);
> +	cache_of_set_id(this_leaf, np);
>   }
>   
>   static int cache_setup_of_node(unsigned int cpu)


Thanks,

Ben

