Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C280C1B87D5
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746637061; cv=none; b=VOOANsQstrKG6u2qqXtVxG7NMhYAXH/uRn6OOHgaa1WFkuwdwm2TyP+m8UUkBFJTAsL5kSuHnwrWK8Slt2G9aF2J9g7+r2UallTh+rz7fNxzwahvcwP+xHVvg77YAx2qCbo/aeQ/buWL5CTQcT1vIGXnR33j2W05bCWyx5pk0UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746637061; c=relaxed/simple;
	bh=czj8zK3iUyV8d5pg2hXGm9XDWCOqd+CVj2BjA34Jx3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLpgbPQcFTGRXRFDerzGIX9GdXaTMz3bVFBFFjtgJtzmwSHAXkIlX/6Mec29HWFlrbZvj4TyI5pIBSu2fVbXWtU51KJ/6jgpMXJpBz//oEV4iPti7hxNc8JERAnlvSexCTabd4Yqx1/FfLkboxJnvtgAC8xZRs5UtWmCBZqG4Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YrLTtI1r; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YrLTtI1r"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-30a9cd61159so149923a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 09:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746637059; x=1747241859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tmbroDZ+juh6uiII9hBcIBA74Uu8yPFGlkERS+BA/nE=;
        b=YrLTtI1rZmUin/OiTk4Gsv8iYM3Up2sVQ10G0y80gnqpryX94AMnpW0/CZb0ecLVnv
         88Cs9Fh0y5UCfMu2w13JpczDOrID9DweD1ypPWoPphXK8Zywv6T4uKc36tDyEwXihHaA
         e8y64fKV09Bc4P93jc33KVfRvaykL1YZqhvfRCNkXFd+aO7LC2VlY5W+y2mTf411Q5jx
         c8/iQuWGIVPv3JSevz08sKOt7XVdiTGWRHrGFG4+LIIckXIm0B2GYHrq4ljS5pr0LJcD
         h5ZJsZlVwTj9bH9ZpNjwu2iOO0IAgmW9PX6YfpYDMm4v3N1vtiJyYzM3Ab5wSQBmtSaD
         VQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746637059; x=1747241859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmbroDZ+juh6uiII9hBcIBA74Uu8yPFGlkERS+BA/nE=;
        b=ZyLRn/1YlZhYLRitizBkaDmXZdDtpp4pXxgQFqkL1eINZg+lESELbnau/T3n2h1rmi
         T83bpBHmo2qtmlWIDO0NwWnbxOfwtzg7iq8jFUJNG0Tcgr+hO6zXiCozJi5KvXuDP58h
         RatJnC5Icz/uS1QyJ4XYGrSQblgLQoG6n1SgKK11XR3jRrReEehAzXqlnbF/dhpY1T/w
         RJvvb+4RMaHxNnXaJGUctcaarKc9KuJjm7ODZhwkWHqKY5+A5opriHpPmuQq/6kR42XY
         hi45wQLLImAcIELkTXRFqWSYiPNBHBIveMB4U/RwqJd55b5HIy8zNmxLfVdS7JssRNs7
         6fkw==
X-Forwarded-Encrypted: i=1; AJvYcCUXwJGoIpCcSf+Sd147jQSCTzaDjJdimmEFs49nzQPbxj+5oE3C2kkj96/9K1X7Ed0wFX3b3C9uY9A2cDE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL67X7e0JjBLtFPdJO3PNrGlHVKQ/f62ECO4+hcYIW55IJWEuZ
	No8Skj+f/dMxl+YfFz80rRLKF2vPp7XPN/4FuAvAPUa182rJ0lyK3D7c5b1+n1M=
X-Gm-Gg: ASbGncsoTZjWgS3ndgx1oVB/yOXQKZPXe6KPTWzjkG998j7AL4sw+0Ps97fMSwXleqj
	crVYy0MaLTe3WeCAQgdBPrD2NJ+E1lhSblimIXkME32OjQeYbq702j2CAe115g/BAVfGSi7qBRO
	iO+Me64tmivnJHEm4bZNsXUjLxKnG8VWbD1roCz1F/yk5fbXgKse/bToN/kSWAZlfhBbEkCZTM9
	03HfwzIUF/+1VWgqyh0F2aiACIeJRrHZ0RIfBg1xKtKQvB0Vei51KUAZDz1xSDjNNylXRfwq3g5
	Gy4/iEm8T5f/q7YAgVXG4jCmQjbOWfdMIS+P61W8CMOO
X-Google-Smtp-Source: AGHT+IGxXUaGxfyyE3GygRPHDO80N6o85rgikZ9Ncx5TB24ADQ0xq3YG8V+CK95O1+HnuuoJgKZlZg==
X-Received: by 2002:a17:90b:2b4d:b0:2fa:2268:1af4 with SMTP id 98e67ed59e1d1-30adbf1163emr326433a91.7.1746637058949;
        Wed, 07 May 2025 09:57:38 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d6b9:fb9b:e26b:ab43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4b40e4asm445248a91.13.2025.05.07.09.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 09:57:38 -0700 (PDT)
Date: Wed, 7 May 2025 10:57:36 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, afd@ti.com, hnagalla@ti.com, u-kumar1@ti.com,
	jm@ti.com, jan.kiszka@siemens.com, christophe.jaillet@wanadoo.fr,
	jkangas@redhat.com, eballetbo@redhat.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 10/35] remoteproc: k3-m4: Use k3_rproc_mem_data
 structure for memory info
Message-ID: <aBuRAOlEvvAuBgOy@p14s>
References: <20250425104135.830255-1-b-padhi@ti.com>
 <20250425104135.830255-11-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425104135.830255-11-b-padhi@ti.com>

On Fri, Apr 25, 2025 at 04:11:10PM +0530, Beleswar Padhi wrote:
> The ti_k3_m4_remoteproc.c driver previously hardcoded device memory
> region addresses and names. Change this to use the k3_rproc_mem_data
> structure to store memory information. This aligns with DSP and R5
> drivers, and can be refactored out later.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> Tested-by: Judith Mendez <jm@ti.com>
> ---
> v11: Changelog:
> 1. Carried T/B tag.
> 
> Link to v10:
> https://lore.kernel.org/all/20250417182001.3903905-11-b-padhi@ti.com/
> 
> v10: Changelog:
> None
> 
> Link to v9:
> https://lore.kernel.org/all/20250317120622.1746415-6-b-padhi@ti.com/
> 
>  drivers/remoteproc/ti_k3_m4_remoteproc.c | 60 ++++++++++++++++++------
>  1 file changed, 45 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> index d0ee7a8d460d4..e83bef7cfddfd 100644
> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> @@ -20,9 +20,6 @@
>  #include "remoteproc_internal.h"
>  #include "ti_sci_proc.h"
>  
> -#define K3_M4_IRAM_DEV_ADDR 0x00000
> -#define K3_M4_DRAM_DEV_ADDR 0x30000
> -
>  /**
>   * struct k3_m4_rproc_mem - internal memory structure
>   * @cpu_addr: MPU virtual address of the memory region
> @@ -38,15 +35,29 @@ struct k3_m4_rproc_mem {
>  };
>  
>  /**
> - * struct k3_m4_rproc_mem_data - memory definitions for a remote processor
> + * struct k3_m4_mem_data - memory definitions for a remote processor
>   * @name: name for this memory entry
>   * @dev_addr: device address for the memory entry
>   */
> -struct k3_m4_rproc_mem_data {
> +struct k3_m4_mem_data {
>  	const char *name;
>  	const u32 dev_addr;
>  };
>  
> +/**
> + * struct k3_m4_dev_data - device data structure for a M4 core
> + * @mems: pointer to memory definitions for a M4 core
> + * @num_mems: number of memory regions in @mems
> + * @boot_align_addr: boot vector address alignment granularity
> + * @uses_lreset: flag to denote the need for local reset management
> + */
> +struct k3_m4_dev_data {
> +	const struct k3_m4_mem_data *mems;
> +	u32 num_mems;
> +	u32 boot_align_addr;
> +	bool uses_lreset;
> +};
> +
>  /**
>   * struct k3_m4_rproc - k3 remote processor driver structure
>   * @dev: cached device pointer
> @@ -56,6 +67,7 @@ struct k3_m4_rproc_mem_data {
>   * @rmem: reserved memory regions data
>   * @num_rmems: number of reserved memory regions
>   * @reset: reset control handle
> + * @data: pointer to M4-specific device data
>   * @tsp: TI-SCI processor control handle
>   * @ti_sci: TI-SCI handle
>   * @ti_sci_id: TI-SCI device identifier
> @@ -71,6 +83,7 @@ struct k3_m4_rproc {
>  	struct k3_m4_rproc_mem *rmem;
>  	int num_rmems;
>  	struct reset_control *reset;
> +	const struct k3_m4_dev_data *data;
>  	struct ti_sci_proc *tsp;
>  	const struct ti_sci_handle *ti_sci;
>  	u32 ti_sci_id;
> @@ -336,14 +349,13 @@ static void *k3_m4_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool
>  static int k3_m4_rproc_of_get_memories(struct platform_device *pdev,
>  				       struct k3_m4_rproc *kproc)
>  {
> -	static const char * const mem_names[] = { "iram", "dram" };
> -	static const u32 mem_addrs[] = { K3_M4_IRAM_DEV_ADDR, K3_M4_DRAM_DEV_ADDR };
> +	const struct k3_m4_dev_data *data = kproc->data;
>  	struct device *dev = &pdev->dev;
>  	struct resource *res;
>  	int num_mems;
>  	int i;
>  
> -	num_mems = ARRAY_SIZE(mem_names);
> +	num_mems = kproc->data->num_mems;
>  	kproc->mem = devm_kcalloc(kproc->dev, num_mems,
>  				  sizeof(*kproc->mem), GFP_KERNEL);
>  	if (!kproc->mem)
> @@ -351,17 +363,17 @@ static int k3_m4_rproc_of_get_memories(struct platform_device *pdev,
>  
>  	for (i = 0; i < num_mems; i++) {
>  		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -						   mem_names[i]);
> +						   data->mems[i].name);
>  		if (!res) {
>  			dev_err(dev, "found no memory resource for %s\n",
> -				mem_names[i]);
> +				data->mems[i].name);
>  			return -EINVAL;
>  		}
>  		if (!devm_request_mem_region(dev, res->start,
>  					     resource_size(res),
>  					     dev_name(dev))) {
>  			dev_err(dev, "could not request %s region for resource\n",
> -				mem_names[i]);
> +				data->mems[i].name);
>  			return -EBUSY;
>  		}
>  
> @@ -369,15 +381,15 @@ static int k3_m4_rproc_of_get_memories(struct platform_device *pdev,
>  							 resource_size(res));
>  		if (!kproc->mem[i].cpu_addr) {
>  			dev_err(dev, "failed to map %s memory\n",
> -				mem_names[i]);
> +				data->mems[i].name);
>  			return -ENOMEM;
>  		}
>  		kproc->mem[i].bus_addr = res->start;
> -		kproc->mem[i].dev_addr = mem_addrs[i];
> +		kproc->mem[i].dev_addr = data->mems[i].dev_addr;
>  		kproc->mem[i].size = resource_size(res);
>  
>  		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
> -			mem_names[i], &kproc->mem[i].bus_addr,
> +			data->mems[i].name, &kproc->mem[i].bus_addr,
>  			kproc->mem[i].size, kproc->mem[i].cpu_addr,
>  			kproc->mem[i].dev_addr);
>  	}
> @@ -563,12 +575,17 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct k3_m4_rproc *kproc;
> +	const struct k3_m4_dev_data *data;

Please move to the top of the variable declarations, i.e before struct device.

>  	struct rproc *rproc;
>  	const char *fw_name;
>  	bool r_state = false;
>  	bool p_state = false;
>  	int ret;
>  
> +	data = of_device_get_match_data(dev);
> +	if (!data)
> +		return -ENODEV;
> +
>  	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to parse firmware-name property\n");
> @@ -583,6 +600,7 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>  	kproc = rproc->priv;
>  	kproc->dev = dev;
>  	kproc->rproc = rproc;
> +	kproc->data = data;
>  	platform_set_drvdata(pdev, rproc);
>  
>  	kproc->ti_sci = devm_ti_sci_get_by_phandle(dev, "ti,sci");
> @@ -650,8 +668,20 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct k3_m4_mem_data am64_m4_mems[] = {
> +	{ .name = "iram", .dev_addr = 0x0 },
> +	{ .name = "dram", .dev_addr = 0x30000 },
> +};
> +
> +static const struct k3_m4_dev_data am64_m4_data = {
> +	.mems = am64_m4_mems,
> +	.num_mems = ARRAY_SIZE(am64_m4_mems),
> +	.boot_align_addr = SZ_1K,
> +	.uses_lreset = true,
> +};
> +
>  static const struct of_device_id k3_m4_of_match[] = {
> -	{ .compatible = "ti,am64-m4fss", },
> +	{ .compatible = "ti,am64-m4fss", .data = &am64_m4_data, },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, k3_m4_of_match);
> -- 
> 2.34.1
> 
