Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADCC2DFF02
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 16:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750177299; cv=none; b=MfVHUbEz7D2c6eM2sOpxPBNnJ5yMfz9FjlnuF//OYj3lwSpi3ABKwugfvBVJDduPczwFRgPiqm2YRphoD8linz5f+OkM3b5M22cf4LQ/8j02darfmKXM0EX6p7LG9JPhJAg7aGzRfSFpNauzmtYLcovtpZf9pf5NsKOQPFImLIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750177299; c=relaxed/simple;
	bh=jo2vquKKceSel2RP+1YQD3H1nFoRTttsM34gR8sNwvU=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tNjkA2tK507kfAl5K5PAG/m2DDOCT6zwKftgJOlpJOMDt04GPB3UUAMZB2DnFTk9xKNZ3uBVGg0TpaK3rTID6b+pqOO227+KUpV96n367hk5ZazSnNbOAw4AZ4cc9x+Hg9BEsnDZ9yd8yzzymT8FDv2IXng/HzKCzavl+sPdde8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bMBs74qxvz6L5Sh;
	Wed, 18 Jun 2025 00:19:23 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 31098140119;
	Wed, 18 Jun 2025 00:21:34 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 17 Jun
 2025 18:21:33 +0200
Date: Tue, 17 Jun 2025 17:21:32 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
	<rafael@kernel.org>, <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH 4/5] cacheinfo: Expose the code to generate a cache-id
 from a device_node
Message-ID: <20250617172132.00002844@huawei.com>
In-Reply-To: <20250613130356.8080-5-james.morse@arm.com>
References: <20250613130356.8080-1-james.morse@arm.com>
	<20250613130356.8080-5-james.morse@arm.com>
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

On Fri, 13 Jun 2025 13:03:55 +0000
James Morse <james.morse@arm.com> wrote:

> The MPAM driver identifies caches by id for use with resctrl. It
> needs to know the cache-id when probe-ing, but the value isn't set
> in cacheinfo until the corresponding CPU comes online.
> 
> Expose the code that generates the cache-id. This allows the MPAM
> driver to determine the properties of the caches without waiting
> for all CPUs to come online.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
Feels to me like this needs to come with the user.
The earlier patches at least expose it via existing infrastructure
this isn't used at all yet...

> ---
>  drivers/base/cacheinfo.c  | 15 +++++++++++----
>  include/linux/cacheinfo.h |  1 +
>  2 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> index d8e5b4c7156c..6316d80abab8 100644
> --- a/drivers/base/cacheinfo.c
> +++ b/drivers/base/cacheinfo.c
> @@ -188,7 +188,7 @@ static bool cache_node_is_unified(struct cacheinfo *this_leaf,
>  #define arch_compact_of_hwid(_x)	(_x)
>  #endif
>  
> -static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
> +unsigned long cache_of_get_id(struct device_node *np)
Bit confusing to have cache_of_set_id() call cache_of_get_id() like this because
they are in no way mirrors of each other.   Rename?
(and naturally I'm providing no suggestions :)

>  {
>  	struct device_node *cpu;
>  	u32 min_id = ~0;
> @@ -200,7 +200,7 @@ static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
>  		id = arch_compact_of_hwid(id);
>  		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
>  			of_node_put(cpu);
> -			return;
> +			return ~0UL;
>  		}
>  		while (1) {
>  			if (!cache_node)
> @@ -214,8 +214,15 @@ static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
>  		}
>  	}
>  
> -	if (min_id != ~0) {
> -		this_leaf->id = min_id;
> +	return min_id;
> +}
> +
> +static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
> +{
> +	unsigned long id = cache_of_get_id(np);
> +
> +	if (id != ~0UL) {
> +		this_leaf->id = id;
>  		this_leaf->attributes |= CACHE_ID;
>  	}
>  }
> diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
> index c8f4f0a0b874..9c959caf8af8 100644
> --- a/include/linux/cacheinfo.h
> +++ b/include/linux/cacheinfo.h
> @@ -112,6 +112,7 @@ int acpi_get_cache_info(unsigned int cpu,
>  #endif
>  
>  const struct attribute_group *cache_get_priv_group(struct cacheinfo *this_leaf);
> +unsigned long cache_of_get_id(struct device_node *np);
>  
>  /*
>   * Get the cacheinfo structure for the cache associated with @cpu at

