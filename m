Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192FE1A2632
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 16:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750177695; cv=none; b=fz0OBzlk/joLB2T1uo4DI/U5JX/zxht8EKEMsyoNRANfZSvopnnbHCXqeDx1Q3u+rMgmYv68d8wyKcruOHTe4Nwk9MonQb8KAlH2xul0PuTAmKoDujS0GHd/9/RMGUm+4g0k36ZxrSElDwnjAuwxfRqsF3kGAfurOX0ZM8u1/e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750177695; c=relaxed/simple;
	bh=Y3mY6JxTrLq7oCWQ27VxeUjNdJNLBZQ2maBG9kQMvyM=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oZn0MNqO3zhJDhfae5qoyKKQsu1i7RcHxYbDEf7kh4xLKJSjOQZAfQeTa/v7boILaNeFadRRXset+6tm4+u84Kk3QoaPgCwW9cVYqLu2xNXxEx/jxObtAvepdJY6FotgNWxf0zJJc7pLl1URWZlvSCUvvhbWXVhhVVKFFP+KgL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bMC2c52jwz6M4HK;
	Wed, 18 Jun 2025 00:27:36 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 8A246140136;
	Wed, 18 Jun 2025 00:28:10 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 17 Jun
 2025 18:28:09 +0200
Date: Tue, 17 Jun 2025 17:28:08 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
	<rafael@kernel.org>, <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH 5/5] cacheinfo: Add helper to find the cache size from
 cpu+level
Message-ID: <20250617172808.00005c14@huawei.com>
In-Reply-To: <20250613130356.8080-6-james.morse@arm.com>
References: <20250613130356.8080-1-james.morse@arm.com>
	<20250613130356.8080-6-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Fri, 13 Jun 2025 13:03:56 +0000
James Morse <james.morse@arm.com> wrote:

> The MPAM driver needs to know the size of a cache associated with a
> particular CPU. The DT/ACPI agnostic way of doing this is to ask cacheinfo.
> 
> Add a helper to do this.
> 
> Signed-off-by: James Morse <james.morse@arm.com>



> ---
>  include/linux/cacheinfo.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
> index 9c959caf8af8..3f1b6b2e25b5 100644
> --- a/include/linux/cacheinfo.h
> +++ b/include/linux/cacheinfo.h
> @@ -148,6 +148,26 @@ static inline int get_cpu_cacheinfo_id(int cpu, int level)
>  	return ci ? ci->id : -1;
>  }
>  
> +/*
> + * Get the size of the cache associated with @cpu at level @level.
> + * cpuhp lock must be held.
To me kernel-doc would be appropriate.  Particularly the return 0 thing.
However there isn't any for existing cacheinfo interfaces so maybe
fair enough to 'follow local style' on that.

> + */
> +static inline unsigned int get_cpu_cacheinfo_size(int cpu, int level)
> +{
> +	struct cpu_cacheinfo *ci = get_cpu_cacheinfo(cpu);
> +	int i;
> +
> +	if (!ci->info_list)
> +		return 0;
> +
> +	for (i = 0; i < ci->num_leaves; i++) {
> +		if (ci->info_list[i].level == level)
> +			return ci->info_list[i].size;
> +	}
> +
> +	return 0;
> +}
> +
Why not

static inline unsigned int get_cpu_cacheinfo_size(int cpu, int level)
{
	struct cpu_cachinfo *ci = get_cpu_cacheinfo_level(cpu, lev);

	return ci ? ci->size; 0;
}

Like existing get_cpu_cacheinfo_id()?

>  #if defined(CONFIG_ARM64) || defined(CONFIG_ARM)
>  #define use_arch_cache_info()	(true)
>  #else

