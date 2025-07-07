Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA12228937F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 12:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751891534; cv=none; b=rBk9aQxrS2VCTOQBS6Afpwon8vRxVUDZr4fPvRrnj4GWp9oBN5c8+8ytjUiIOR5Abkk2/hl5W4nNgvXM7pJ2+XR/DcSAlkoKfww2+TBy/cWIaHtx0XqRLyVjcOTDcsWYqb/AHEK9x+FGuOJXw5ApVnIRKzOt0y+DdqUNyu4fUTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751891534; c=relaxed/simple;
	bh=Xs3aIWRVPOmUJxZYSF0bSCsU7L3fH2o3QpvMU9WeOQU=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bBpNzUAG80f9UeEwpJYmWvjKiSgEbA9lMnD4Y4j3N+zM4g1lplVM4KLazLbF1F7OeGVLYoN2IRgkjDGas4dgU3gqdCXZYC+ukAvT0IkU0lBdarIoB1MDlT18FSIE+93oBZ+0MB2d52bEioLb4sDq/3P8qzY7cJHHwOiIf9jwYH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bbNrV45T2z6M56Q;
	Mon,  7 Jul 2025 20:31:06 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 0DB1B1402F8;
	Mon,  7 Jul 2025 20:32:09 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 7 Jul
 2025 14:32:08 +0200
Date: Mon, 7 Jul 2025 13:32:07 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: James Morse <james.morse@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
	<sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, <WillDeaconwill@kernel.org>
Subject: Re: [PATCH v2 1/3] cacheinfo: Set cache 'id' based on DT data
Message-ID: <20250707133207.00001b88@huawei.com>
In-Reply-To: <9495df36-053e-49a3-8046-1e6aed63b4af@arm.com>
References: <20250704173826.13025-1-james.morse@arm.com>
	<20250704173826.13025-2-james.morse@arm.com>
	<9495df36-053e-49a3-8046-1e6aed63b4af@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Mon, 7 Jul 2025 11:27:06 +0100
Ben Horgan <ben.horgan@arm.com> wrote:

> Hi James,
> 
> On 7/4/25 18:38, James Morse wrote:
> > From: Rob Herring <robh@kernel.org>
> > 
> > Use the minimum CPU h/w id of the CPUs associated with the cache for the
> > cache 'id'. This will provide a stable id value for a given system. As
> > we need to check all possible CPUs, we can't use the shared_cpu_map
> > which is just online CPUs. As there's not a cache to CPUs mapping in DT,
> > we have to walk all CPU nodes and then walk cache levels.
> > 
> > The cache_id exposed to user-space has historically been 32 bits, and
> > is too late to change. This value is parsed into a u32 by user-space
> > libraries such as libvirt:
> > https://github.com/libvirt/libvirt/blob/master/src/util/virresctrl.c#L1588
> > 
> > Give up on assigning cache-id's if a CPU h/w id greater than 32 bits
> > is found.
> > 
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > [ ben: converted to use the __free cleanup idiom ]
> > Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> > [ morse: Add checks to give up if a value larger than 32 bits is seen. ]
> > Signed-off-by: James Morse <james.morse@arm.com>
> > ---
> > Use as a 32bit value has also been seen in DPDK patches here:
> > http://inbox.dpdk.org/dev/20241021015246.304431-2-wathsala.vithanage@arm.com/
> > 
> > Changes since v1:
> >   * Remove the second loop in favour of a helper.
> >   
> > An open question from v1 is whether it would be preferable to use an
> > index into the DT of the CPU nodes instead of the hardware id. This would
> > save an arch specific swizzle - but the numbers would change if the DT
> > were changed. This scheme isn't sensitive to the order of DT nodes.
> > 
> > ---
> >   drivers/base/cacheinfo.c | 38 ++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 38 insertions(+)
> > 
> > diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> > index cf0d455209d7..df593da0d5f7 100644
> > --- a/drivers/base/cacheinfo.c
> > +++ b/drivers/base/cacheinfo.c
> > @@ -8,6 +8,7 @@
> >   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> >   
> >   #include <linux/acpi.h>
> > +#include <linux/bitfield.h>
> >   #include <linux/bitops.h>
> >   #include <linux/cacheinfo.h>
> >   #include <linux/compiler.h>
> > @@ -183,6 +184,42 @@ static bool cache_node_is_unified(struct cacheinfo *this_leaf,
> >   	return of_property_read_bool(np, "cache-unified");
> >   }
> >   
> > +static bool match_cache_node(struct device_node *cpu,
> > +			     const struct device_node *cache_node)
> > +{
> > +	for (struct device_node *cache __free(device_node) = of_find_next_cache_node(cpu);  
> Looks like the creation of this helper function has upset the 
> device_node reference counting. This first __free(device_node) will only 
> cause of_node_put() to be called in the case of the early return from 
> the loop. You've dropped the second __free(device_node) which accounts 
> for 'cache' changing on each iteration.

Good catch - this behaves differently from many of the of_get_next* type
helpers in that it doesn't drop the reference to the previous iteration
within the call.

Maybe it should?

I checked a few of the call sites and some would be simplified if it did
others would need some more complex restructuring but might benefit as
well.

> > +	     cache != NULL; cache = of_find_next_cache_node(cache)) {
> > +		if (cache == cache_node)
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> > +static void cache_of_set_id(struct cacheinfo *this_leaf,
> > +			    struct device_node *cache_node)
> > +{
> > +	struct device_node *cpu;
> > +	u32 min_id = ~0;
> > +
> > +	for_each_of_cpu_node(cpu) {
> > +		u64 id = of_get_cpu_hwid(cpu, 0);
> > +
> > +		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
> > +			of_node_put(cpu);
> > +			return;
> > +		}
> > +
> > +		if (match_cache_node(cpu, cache_node))
> > +			min_id = min(min_id, id);
> > +	}
> > +
> > +	if (min_id != ~0) {
> > +		this_leaf->id = min_id;
> > +		this_leaf->attributes |= CACHE_ID;
> > +	}
> > +}
> > +
> >   static void cache_of_set_props(struct cacheinfo *this_leaf,
> >   			       struct device_node *np)
> >   {
> > @@ -198,6 +235,7 @@ static void cache_of_set_props(struct cacheinfo *this_leaf,
> >   	cache_get_line_size(this_leaf, np);
> >   	cache_nr_sets(this_leaf, np);
> >   	cache_associativity(this_leaf);
> > +	cache_of_set_id(this_leaf, np);
> >   }
> >   
> >   static int cache_setup_of_node(unsigned int cpu)  
> 
> 
> Thanks,
> 
> Ben
> 
> 

