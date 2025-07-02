Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08941A2622
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751476112; cv=none; b=Pdm8xNxVjd4MYwj8N5KU8PYuKUMCzFjVHUh95monpdqqF8eBIDh3R0W30hpEJQCoMbLmfB458cOzn4Jsnur0A7YCAJlde1bYzals/FkXnZHqhzPCk5bXn82e6OasKvwKiFrcpPIY0AQ18yQpI9SnW1fSwVNkKdrZcC76ijDXRyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751476112; c=relaxed/simple;
	bh=mLZWVN2FPVn3GHBN8shy4my4k8NfGPUO0qwkbcVp1a0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWtfIzB00HT/KjoLvR7Xnqex/FudJujLPZ1BXhtMem+/8+7v34CArwG6c/zOHt9TXZJ6PxMtl5wMkroo71NU6tridSg8toq3Bsq5PpX5HL+14JrawB5hJ37ZNLDUyW2yKVrgRsxmydudz72RAP2vdQwizUYxrTg/uNsxQ0xR6uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2668422C7;
	Wed,  2 Jul 2025 10:08:15 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89BD63F66E;
	Wed,  2 Jul 2025 10:08:29 -0700 (PDT)
Date: Wed, 2 Jul 2025 18:08:27 +0100
From: Leo Yan <leo.yan@arm.com>
To: Junhao He <hejunhao3@huawei.com>
Cc: suzuki.poulose@arm.com, james.clark@arm.com, anshuman.khandual@arm.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxarm@huawei.com,
	jonathan.cameron@huawei.com, yangyicong@huawei.com,
	prime.zeng@hisilicon.com
Subject: Re: [PATCH v2 3/3] coresight: tmc: Decouple the perf buffer
 allocation from sysfs mode
Message-ID: <20250702170827.GB1039028@e132581.arm.com>
References: <20250620075412.952934-1-hejunhao3@huawei.com>
 <20250620075412.952934-4-hejunhao3@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620075412.952934-4-hejunhao3@huawei.com>

On Fri, Jun 20, 2025 at 03:54:12PM +0800, Junhao He wrote:

[..]

> @@ -1341,33 +1339,24 @@ alloc_etr_buf(struct tmc_drvdata *drvdata, struct perf_event *event,
>  	unsigned long size;
>  
>  	node = (event->cpu == -1) ? NUMA_NO_NODE : cpu_to_node(event->cpu);
> -	/*
> -	 * Try to match the perf ring buffer size if it is larger
> -	 * than the size requested via sysfs.
> -	 */
> -	if ((nr_pages << PAGE_SHIFT) > drvdata->size) {
> -		etr_buf = tmc_alloc_etr_buf(drvdata, ((ssize_t)nr_pages << PAGE_SHIFT),
> -					    0, node, NULL);
> -		if (!IS_ERR(etr_buf))
> -			goto done;
> -	}
> +
> +	/* Use the minimum limit if the required size is smaller */
> +	size = (unsigned long)nr_pages << PAGE_SHIFT;

Please change the size's type to ssize_t, then:

        size = nr_pages << PAGE_SHIFT;

> +	if (size < TMC_ETR_PERF_MIN_BUF_SIZE)
> +		size = TMC_ETR_PERF_MIN_BUF_SIZE;

size = min_t(ssize_t, size, TMC_ETR_PERF_MIN_BUF_SIZE);
>  
>  	/*
> -	 * Else switch to configured size for this ETR
> -	 * and scale down until we hit the minimum limit.
> +	 * Try to allocate the required size for this ETR, if failed scale
> +	 * down until we hit the minimum limit.
>  	 */
> -	size = drvdata->size;
>  	do {
>  		etr_buf = tmc_alloc_etr_buf(drvdata, size, 0, node, NULL);
>  		if (!IS_ERR(etr_buf))
> -			goto done;
> +			return etr_buf;
>  		size /= 2;
>  	} while (size >= TMC_ETR_PERF_MIN_BUF_SIZE);

Do we really need to scale down buffer size for failure cases?

I would like a straightforward code:

        etr_buf = tmc_alloc_etr_buf(drvdata, size, 0, node, NULL);
        if (IS_ERR_OR_NULL(etr_buf))
                return etr_buf;

Just a side topic, we know tmc_alloc_etr_buf() should not return NULL
pointer. For a sanity check, the callers (alloc_etr_buf(),
tmc_etr_get_sysfs_buffer(), etc) should valid a buffer pointer with
IS_ERR_OR_NULL() rather than IS_ERR(). This can be a separate patch.

Thanks,
Leo

>  	return ERR_PTR(-ENOMEM);
> -
> -done:
> -	return etr_buf;
>  }
>  
>  static struct etr_buf *
> -- 
> 2.33.0
> 
