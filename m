Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A73136358
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 21:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750108672; cv=none; b=mQ67p2D2g2pyj3fp6fNnx5w+r5ZObIfWnGuxy3DsTprwBt3USea1czvNYzifYt+jRhsO4tbzzhPZlDjVeeeftELDdDQok+iVBb/7cK1ZyMumOplg1XUY05TZS+H3wZ5FOZs+HXuYkdNj7fVhYMclImoNDR622AhJXKi0sXkKB8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750108672; c=relaxed/simple;
	bh=SQ4FnpsNh6VpTd7gKdL4dppDBM28FgxPAn0I0bxAUa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rcRS4sqohUFg5IOkk/SodBBrTPM9nynJ2EKjKywwMbrnL8I71/beT6JoPiVPOGlT9J+D4JS7OERZcQVz5h5mb1B17hb8Qtf/XH2HFuYfnwWYmH4HJPOsGEGdkTvAKhKE0ARaLql1DBwKiNo++EYKO4yxwc9xrBy9UoV6BWnSYEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fKa93aoH; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fKa93aoH"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2348ac8e0b4so21255ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750108670; x=1750713470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Dte9S5IWAzLh8eHyVjwryVoXkQBlEWABWLNFJpRbeA=;
        b=fKa93aoHdFT/NxcjjI5QQWQ4ldfK/d0no5Ble6LxWcDxRdknMriDPx5A+SejPJI4Gd
         mnM3CpIjnGtjvEi4YtKss6THyRE1zkeVCEnV0MQsXy6c1ouP7BkiVplbjg13BEbNxKB6
         a+Ie1jCjsAz6DcUOk/DUb2ZzClgKsILLuFVW0jWMQZWm8y05IYM0XmKcaoCnkY+/E1uR
         aXz14LsrhJRm0EzlvLKGjVRinEzb8/X3kj/CjZi27WtxrCxkRSKp53FmCBbGJCkKh0F/
         58wM+s4b41k++8U3i1hltnDKfn9seSeCliHtQaaWRdjroVnGBfKVxQpjXqoGLngoDOB1
         3E5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750108670; x=1750713470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Dte9S5IWAzLh8eHyVjwryVoXkQBlEWABWLNFJpRbeA=;
        b=jXd28XxmnyeycKFFwxwY+XFLd1M7/93QO/K24wp2oXmA3BdhnGmMQvD6rsCFgo5XSc
         er3CvZ/UAZow2V08Qw/oBFeES77AKRTQtjJwVZvbWHyu2CsHtvs60S4u7c3b58zGVEsM
         9Kt95RhsDqvbINvF/xz2xlvEChA4KQBOAz/YlkYrOIGhhtXljNFUFCdBR7Z0hqTpWzWl
         NDAiNJL8xO589R24byMt3hwxGtmODNAIcqM6tyANBf8P7/3Ntg7fgRkUW/FHLMIUBuNb
         flhDgEzvFHVKnaexvyNMcAhKl159s74PWgQm6tzJMOCVLRKixG0tce2ueU/7QTFRHum/
         Yt9w==
X-Forwarded-Encrypted: i=1; AJvYcCWn89cys9yCVLBrZBt7VFDx/04K+0+jc93hq7/+9h6ukeVU4kFRG8I8HPXwYhIBDHFu89+Hf+UUgtUtJb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpdvX4JK59lGy4MyGztp7kcb147ZtfGQXE5Vr5tUzalBtKJevY
	RaQDk9PyzMZbVfmzsInfPTuuIZk+/RwAP4PdVGR8P/fABU+M8ajHkppg7tQ8MRRNBQ==
X-Gm-Gg: ASbGncuTOP/XKvE6dJiD2YvN6tycK51uO9vTkoL6K6TGg1W/3RH/vYhk1WJtw47Hrzc
	N4iWFFM/jFgwkV91E6JF/9WWG9SiSimTu8n2R9eaPp+qMKciS4iPzXoJ0SKxijzHp2DboakqjpW
	blq05TfnFRJArA7RmDard3B4jn0kjaurGSCoiqxuhgMnBCjzd2lRae/za2dhfG8SOLJX9EAk4nB
	m+wK2i7lirfgf81VU5x+XdvdDVX4ZfXmHAzEaJgAzYGjT33o/KIjV7LTPA60hrKiVHZVOIvlAAt
	JmTU18S5tBIT1AOS6o+qUSMOuDea3W8wUQkmN8OIgKBAT9VVCc9aq1eP8G2IxIzwzkoW0CqcQNY
	ltk+vGRuGrTw2mLR/1iab
X-Google-Smtp-Source: AGHT+IGAzwl1QJPvA++EDqwFMKyBsCjjEWjJhBE98c+aEAA11TrriZ5qleZr0s+YLMW9x0aRwxpKcQ==
X-Received: by 2002:a17:902:f54c:b0:234:48b2:fd63 with SMTP id d9443c01a7336-2366f0099e0mr5348025ad.21.1750108670083;
        Mon, 16 Jun 2025 14:17:50 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900cc047sm7614113b3a.147.2025.06.16.14.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 14:17:49 -0700 (PDT)
Date: Mon, 16 Jun 2025 21:17:40 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Xueqi Zhang <xueqi.zhang@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Ning li <ning.li@mediatek.com>, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [RFC PATCH 2/8] iommu/arm-smmu-v3: Add SMMU implementation
Message-ID: <aFCJ9IuzC1Rx2atk@google.com>
References: <20250616025628.25454-1-xueqi.zhang@mediatek.com>
 <20250616025628.25454-3-xueqi.zhang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616025628.25454-3-xueqi.zhang@mediatek.com>

On Mon, Jun 16, 2025 at 10:56:08AM +0800, Xueqi Zhang wrote:
> Mediatek has its own implementation for wrapper interrupts and
> power management.So add SMMU implementation when smmu device probe.
> 
> Signed-off-by: Xueqi Zhang <xueqi.zhang@mediatek.com>
> ---
>  drivers/iommu/arm/Kconfig                        |  7 +++++++
>  drivers/iommu/arm/arm-smmu-v3/Makefile           |  3 ++-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-impl.c | 16 ++++++++++++++++
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-mediatek.c | 13 +++++++++++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c      |  3 +++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h      |  4 ++++
>  6 files changed, 45 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-impl.c
>  create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-mediatek.c
> 
> diff --git a/drivers/iommu/arm/Kconfig b/drivers/iommu/arm/Kconfig
> index ef42bbe07dbe..a7f98fd0f2bf 100644
> --- a/drivers/iommu/arm/Kconfig
> +++ b/drivers/iommu/arm/Kconfig
> @@ -88,6 +88,13 @@ config ARM_SMMU_V3
>  	  the ARM SMMUv3 architecture.
>  
>  if ARM_SMMU_V3
> +config ARM_SMMU_V3_MEDIATEK
> +	bool "ARM Ltd. System MMU Version 3 (SMMUv3) MediaTek Support"
> +	depends on ARM_SMMU_V3 && ARCH_MEDIATEK
> +	help
> +	  When running on a MediaTek platform that has the custom variant
> +	  of the ARM SMMUv3, this needs to be built into the SMMU driver.
> +
>  config ARM_SMMU_V3_SVA
>  	bool "Shared Virtual Addressing support for the ARM SMMUv3"
>  	select IOMMU_SVA
> diff --git a/drivers/iommu/arm/arm-smmu-v3/Makefile b/drivers/iommu/arm/arm-smmu-v3/Makefile
> index 493a659cc66b..0670065d6e9a 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/Makefile
> +++ b/drivers/iommu/arm/arm-smmu-v3/Makefile
> @@ -1,7 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_ARM_SMMU_V3) += arm_smmu_v3.o
> -arm_smmu_v3-y := arm-smmu-v3.o
> +arm_smmu_v3-y := arm-smmu-v3.o arm-smmu-v3-impl.o
>  arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_IOMMUFD) += arm-smmu-v3-iommufd.o
> +arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_MEDIATEK) += arm-smmu-v3-mediatek.o
>  arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_SVA) += arm-smmu-v3-sva.o
>  arm_smmu_v3-$(CONFIG_TEGRA241_CMDQV) += tegra241-cmdqv.o
>  
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-impl.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-impl.c
> new file mode 100644
> index 000000000000..d39587b965ef
> --- /dev/null
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-impl.c
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + * Author: Ning li <ning.li@mediatek.com>
> + * Author: Xueqi Zhang <xueqi.zhang@mediatek.com>
> + */
> +
> +#include "arm-smmu-v3.h"
> +
> +struct arm_smmu_device *arm_smmu_v3_impl_init(struct arm_smmu_device *smmu)
> +{
> +#if IS_ENABLED(CONFIG_ARM_SMMU_V3_MEDIATEK)
> +	smmu = arm_smmu_v3_impl_mtk_init(smmu);
> +#endif
> +	return smmu;
> +}
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-mediatek.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-mediatek.c
> new file mode 100644
> index 000000000000..381268968185
> --- /dev/null
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-mediatek.c
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + * Author: Ning li <ning.li@mediatek.com>
> + * Author: Xueqi Zhang <xueqi.zhang@mediatek.com>
> + */
> +
> +#include "arm-smmu-v3.h"
> +
> +struct arm_smmu_device *arm_smmu_v3_impl_mtk_init(struct arm_smmu_device *smmu)
> +{
> +	return NULL;
> +}
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 10cc6dc26b7b..d36124a6bb54 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4754,6 +4754,9 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>  	}
>  	ioaddr = res->start;
>  
> +	smmu = arm_smmu_v3_impl_init(smmu);
> +	if (IS_ERR(smmu))
> +		return PTR_ERR(smmu);

I'd suggest adding ops to struct arm_smmu_impl_ops and use them. Please
see how Nvidia's implementation makes use of `arm_smmu_impl_probe`,
maybe we could improve that function to handle mtk smmu as well.

>  	/*
>  	 * Don't map the IMPLEMENTATION DEFINED regions, since they may contain
>  	 * the PMCG registers which are reserved by the PMU driver.
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index ea41d790463e..99eeb6143c49 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -998,6 +998,10 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
>  				struct arm_smmu_cmdq *cmdq, u64 *cmds, int n,
>  				bool sync);
>  
> +struct arm_smmu_device *arm_smmu_v3_impl_init(struct arm_smmu_device *smmu);
> +#if IS_ENABLED(CONFIG_ARM_SMMU_V3_MEDIATEK)
> +struct arm_smmu_device *arm_smmu_v3_impl_mtk_init(struct arm_smmu_device *smmu);
> +#endif

We'd prefer to avoid implementation-specific #if CONFIG_* across the
driver as much as possible.

>  #ifdef CONFIG_ARM_SMMU_V3_SVA
>  bool arm_smmu_sva_supported(struct arm_smmu_device *smmu);
>  void arm_smmu_sva_notifier_synchronize(void);
> -- 
> 2.46.0

Thanks,
Praan
