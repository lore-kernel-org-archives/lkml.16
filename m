Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F972ECE87
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 16:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750176358; cv=none; b=cGDNISCMc39FAW870F7OqBXTJSJ+3XpolaZ2oGcRQi5m8wWbROUJl442Wjqc+6WOyVh0NMsl/S5f6EI8J+NzQjNNtY8XrJScfTZjR+1+ChxbWAXAkmBMXl+VznLJRiJojRSF7VIAUKCPHCH8an3zxOXb9PcIA8rqTxiMbaaVygs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750176358; c=relaxed/simple;
	bh=bsFV27v3wF542P8dao4+wXDIqwpBSwTUmPKD0hthgfM=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ORYzw8ZOllvFnK9V6mbkM/xnbVvobWjt6ZubGOwX0lQReZFg50LnvMcq3vGfgtyAq4S3n3OCiL+f/y2x/ARrjrtEP9w6G6WJgCeXSefDy3bjTZGMm0Mq7tTpoFCLmTvQTMSvWAE/FGNj0GY00h4xdXVXOlyZjaFTIsB9qp8rzcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bMBXv69shz6M4SN;
	Wed, 18 Jun 2025 00:05:19 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id B53611402F5;
	Wed, 18 Jun 2025 00:05:53 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 17 Jun
 2025 18:05:53 +0200
Date: Tue, 17 Jun 2025 17:05:50 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
	<rafael@kernel.org>, <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH 2/5] cacheinfo: Add arch hook to compress CPU h/w id
 into 32 bits for cache-id
Message-ID: <20250617170550.0000621b@huawei.com>
In-Reply-To: <20250613130356.8080-3-james.morse@arm.com>
References: <20250613130356.8080-1-james.morse@arm.com>
	<20250613130356.8080-3-james.morse@arm.com>
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

On Fri, 13 Jun 2025 13:03:53 +0000
James Morse <james.morse@arm.com> wrote:

> Filesystems like resctrl use the cache-id exposed via sysfs to identify
> groups of CPUs. The value is also used for PCIe cache steering tags. On
> DT platforms cache-id is not something that is described in the
> device-tree, but instead generated from the smallest CPU h/w id of the
> CPUs associated with that cache.
> 
> CPU h/w ids may be larger than 32 bits.
> 
> Add a hook to allow architectures to compress the value from the devicetree
> into 32 bits. Returning the same value is always safe as cache_of_set_id()
> will stop if a value larger than 32 bits is seen.
> 
> For example, on arm64 the value is the MPIDR affinity register, which only
> has 32 bits of affinity data, but spread across the 64 bit field. An
> arch-specific bit swizzle gives a 32 bit value.
> 
> Signed-off-by: James Morse <james.morse@arm.com>

Looks fine to me
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  drivers/base/cacheinfo.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> index 9888d87840a2..d8e5b4c7156c 100644
> --- a/drivers/base/cacheinfo.c
> +++ b/drivers/base/cacheinfo.c
> @@ -184,6 +184,10 @@ static bool cache_node_is_unified(struct cacheinfo *this_leaf,
>  	return of_property_read_bool(np, "cache-unified");
>  }
>  
> +#ifndef arch_compact_of_hwid
> +#define arch_compact_of_hwid(_x)	(_x)
> +#endif
> +
>  static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
>  {
>  	struct device_node *cpu;
> @@ -193,6 +197,7 @@ static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
>  		struct device_node *cache_node __free(device_node) = of_find_next_cache_node(cpu);
>  		u64 id = of_get_cpu_hwid(cpu, 0);
>  
> +		id = arch_compact_of_hwid(id);
>  		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
>  			of_node_put(cpu);
>  			return;

