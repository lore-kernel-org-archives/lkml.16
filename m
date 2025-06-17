Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732D72DFF09
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 16:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750176213; cv=none; b=Jpmns7/qXNwxTjsf5TJjON3zoE0RtM+iCB44bgZLHYeQBknDvq2Hib4Bg9enuyHjKjdWzDfLGG66pcIMqE9AYnsr1nj2iHGv8SmTURKT3QiUY9JsMbqJ6P46568zW9hm/umM/IAvSpiZZdwJtv8vAJN0nSKL73LzU70GilWI39o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750176213; c=relaxed/simple;
	bh=8eBmijKMB2tNWI164PERTRxLkOMOAbfIaL2kWL4tvBA=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MjJZNvqUxd+/fwskFTcS3ne+jKVcLOA9xQtxWA4XxkQRmjd26nSgLMT452V6p7z6FMYCxmLMuozKp9guGizNnZjnPT3cqZSgIzKKtn/y7oBGtJRka6MYKUKnbHgB9RxHC5bVQ+pTvtJYi5G2VkaS5nF+CpmrV1xlo1H8xqf4iDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bMBPQ3GPWz6H6mN;
	Tue, 17 Jun 2025 23:58:50 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id CD451140447;
	Wed, 18 Jun 2025 00:03:27 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 17 Jun
 2025 18:03:27 +0200
Date: Tue, 17 Jun 2025 17:03:23 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
	<rafael@kernel.org>, <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH 1/5] cacheinfo: Set cache 'id' based on DT data
Message-ID: <20250617170323.00006688@huawei.com>
In-Reply-To: <20250613130356.8080-2-james.morse@arm.com>
References: <20250613130356.8080-1-james.morse@arm.com>
	<20250613130356.8080-2-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Fri, 13 Jun 2025 13:03:52 +0000
James Morse <james.morse@arm.com> wrote:

> From: Rob Herring <robh@kernel.org>
> 
> Use the minimum CPU h/w id of the CPUs associated with the cache for the
> cache 'id'. This will provide a stable id value for a given system. As
> we need to check all possible CPUs, we can't use the shared_cpu_map
> which is just online CPUs. As there's not a cache to CPUs mapping in DT,
> we have to walk all CPU nodes and then walk cache levels.

Is it ok for these to match for different levels?  I've no idea for
these use cases.

> 
> The cache_id exposed to user-space has historically been 32 bits, and
> is too late to change. Give up on assigning cache-id's if a CPU h/w
> id greater than 32 bits is found.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> [ ben: converted to use the __free cleanup idiom ]
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> [ morse: Add checks to give up if a value larger than 32 bits is seen. ]
> Signed-off-by: James Morse <james.morse@arm.com>

Hi James, Rob,

Mainly a couple of questions for Rob on the fun of scoped cleanup being
used for some of the iterators in a similar fashion to already
done for looping over child nodes etc.

> ---
> Use as a 32bit value has been seen in DPDK patches here:
> http://inbox.dpdk.org/dev/20241021015246.304431-2-wathsala.vithanage@arm.com/
> ---
>  drivers/base/cacheinfo.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> index cf0d455209d7..9888d87840a2 100644
> --- a/drivers/base/cacheinfo.c
> +++ b/drivers/base/cacheinfo.c
> @@ -8,6 +8,7 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
>  #include <linux/acpi.h>
> +#include <linux/bitfield.h>
>  #include <linux/bitops.h>
>  #include <linux/cacheinfo.h>
>  #include <linux/compiler.h>
> @@ -183,6 +184,37 @@ static bool cache_node_is_unified(struct cacheinfo *this_leaf,
>  	return of_property_read_bool(np, "cache-unified");
>  }
>  
> +static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
> +{
> +	struct device_node *cpu;
> +	u32 min_id = ~0;
> +
> +	for_each_of_cpu_node(cpu) {

Rob is it worth a scoped variant of this one?  I've come across
this a few times recently and it irritates me but I didn't feel
there were necessarily enough cases to bother.  With one more
maybe it is time to do it (maybe 10+ from a quick look)_.



> +		struct device_node *cache_node __free(device_node) = of_find_next_cache_node(cpu);
> +		u64 id = of_get_cpu_hwid(cpu, 0);
> +
> +		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
> +			of_node_put(cpu);
> +			return;
> +		}
> +		while (1) {

for_each_of_cache_node_scoped() perhaps?  With the find already defined this would end
up something like the following.  Modeled on for_each_child_of_node_scoped.

	#define for_each_of_cache_node_scoped(cpu, cache) \
		for (struct device_node *cache __free(device_node) = \
		     of_find_next_cache_node(cpu); cache != NULL; \
		     cache = of_find_next_cache_node(cache))

	for_each_of_cpu_node_scoped(cpu) {
		u64 id = of_get_cpu_hwid(cpu, 0);

		if (FIELD_GET(GENMASK_ULL(63, 32), id))
			return;
		for_each_of_cache_node_scoped(cpu, cache_node) {
			if (cache_node == np) {
				min_id = min(min_id, id);
				break;
			}
		} 
	}

> +			if (!cache_node)
> +				break;
> +			if (cache_node == np && id < min_id) {

Why do you carry on if id >= min_id?  Id isn't changing.  For that
matter why not do this check before iterating the caches at all?

Maybe a comment if that does make sense but I'd not expect cache_node
to match again.

> +				min_id = id;
> +				break;
> +			}
> +			struct device_node *prev __free(device_node) = cache_node;
> +			cache_node = of_find_next_cache_node(cache_node);
> +		}
> +	}
> +
> +	if (min_id != ~0) {
> +		this_leaf->id = min_id;
> +		this_leaf->attributes |= CACHE_ID;
> +	}
> +}
> +
>  static void cache_of_set_props(struct cacheinfo *this_leaf,
>  			       struct device_node *np)
>  {
> @@ -198,6 +230,7 @@ static void cache_of_set_props(struct cacheinfo *this_leaf,
>  	cache_get_line_size(this_leaf, np);
>  	cache_nr_sets(this_leaf, np);
>  	cache_associativity(this_leaf);
> +	cache_of_set_id(this_leaf, np);
>  }
>  
>  static int cache_setup_of_node(unsigned int cpu)

