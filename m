Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257121C860C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 20:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750107261; cv=none; b=kWgnf5xiLiSkAqWDwAs24xACONR1cahmQYfF4OV0+BmuSQSZJc6cSuRvHGJaX/HlCPjT0No5L9B+rMAnOBeq2x/Stb5FlbOsDUt7nJwT4GWnfVF1Zr2Gp7yOG/C46uQ98QmZO+Z/Hdc+WG5EVhhxZbJKr+1BpGD1bSGeschZ1YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750107261; c=relaxed/simple;
	bh=d/MoWHZ5e+lhoKDdKuybDi6aTjfFIDhV5u0kgLlN9P8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dl0NFM2+fTTT3Zksjw+VeXVEKc1D7AbKuv93B5jk4svKR3VxJ5Sf65hLMeXmQySYeOMuxHuK6ZRAJ1yDrxeaO+15HPSmygdHwem+zgN2aO2wcVQ3vpCLueUSMN1T1toqFTfZtIlnI3Nke7pkIv1OlDSsflwRhO23MfaIY+3CJqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JK4qjfA0; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JK4qjfA0"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-235ca5eba8cso49755ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750107259; x=1750712059; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bylXQEyRsEC9se7T35uUhgi7mwDCmJDoSYBlOu6gy74=;
        b=JK4qjfA0nXcKe3PPPsbBphrpLj5W9yCNSWpgRWPDVygo4Pf+NZeJw9uh/sUW7A6v+f
         B1B3007Vj/20KhYl49PUgJHgq4ujYxITt829vNBfYozOREDrK0zg9gnWoHxAo9bld/Ux
         4Q7cB4rf0QbneM9I1eB7SkKFAnBMyyuJBhhXE8cFMjBrNI/diBJGQJYNUUWfAy581PRZ
         tVJhuaCRmgQMEWv4MGmLWr8tYKRCr7jgrW6iFdjq/gI2UxjUD1db/TYQKOS2deJr5wA+
         ekNxm395zejSx9n7Ec5CL0IhGqQC5x4R32Nmmrt434HmEcrZGWdcQrroMmnUZ0Alrhb2
         9AAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750107259; x=1750712059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bylXQEyRsEC9se7T35uUhgi7mwDCmJDoSYBlOu6gy74=;
        b=Di3RmvRWPPluyd0iAYAQiZD++V2N5WMaHMT8HS/vraDnDLp810k3DCt/nxRqwob0kU
         SmdMWje7mm6Ck5JYdg65/eTSh+IQw/J+FHcTeWbCOAm87KBLnCVUv1h/jb58LHlXhkkd
         TnTyGYeaUs1npLG5B+PTfJct1g8oN1T3H+qiaejd+xpFXmbUfYpaaAW7qsIrPryrPI/G
         aglZDG8CcUr29j643ajTDNBmUyYQOTbkf8Ojci0TnmRcBRf0MVAugs3Q45a79AK3oKWl
         DDr7dnfat/53gS4HQPO7Br5J9ISTUIU8j2l36wwnuLZyZ1UbgTaLABSYT/5zwBPlNMrz
         LVrA==
X-Forwarded-Encrypted: i=1; AJvYcCV7y/wN08J4PZnqAHySenL+PVd4bTzOVo0e7QbqZK6QiY0Xazwc8Oqkc/8g4MMwFssuMv5dZ3yqewjQGh8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWTDnvmwOCYPY20rX+TvXdqVKuVCamicmsGMKUbq7625T2kEUu
	fnfCscetHkZmpviQh8z3O/aty3WTtyOs3OoxnBhA4EZGuoL6ew4RaskVQFnjdmRqJQ==
X-Gm-Gg: ASbGncsNjpg2Gz4wwmngNn5wgF6ZRWWZGPuKYznRbSLr0qB+IW2p0PT2//xdjjOa2+Y
	y58YyEFiteb76nLN+YulOdyJQAaLnFSZ7hR1WM9hnZ+kDdnuzDXAhV3UytMHu6U65OiCUCiMiJz
	kbL21lfqdRdc/bS3BjICGulMWRSpoXuIZD2831nTGPlqpZ8CMuJ9cYwigTzZ0wqWTeOFLmNI+iQ
	qNUYtjRiLx1DzoW0CD9UxHw9O/zQi+KijR/qNaKbfndPVaclegoTOKEuW0TjcyT5SrWG+ZTFxHv
	AqfMmF+jfS69elfBQ0BEFXBvCUY0XjORub+qoMITgbEGBipA8VTaJw2PzarJKhW0jQMTvUlpkdN
	yBgJBTcnL7hMAFzsV4hDE
X-Google-Smtp-Source: AGHT+IF85pxVw9iF4idB17Pc9J6nncgf4wJ2a0JAQZ7KU8U2NL+V9q0BdH+v8rwfWv0L8lWMxivrUQ==
X-Received: by 2002:a17:902:e54f:b0:22c:3cda:df11 with SMTP id d9443c01a7336-2366c5bfaaamr6196145ad.10.1750107259136;
        Mon, 16 Jun 2025 13:54:19 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890083bb2sm7561368b3a.94.2025.06.16.13.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 13:54:16 -0700 (PDT)
Date: Mon, 16 Jun 2025 20:54:07 +0000
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
Subject: Re: [RFC PATCH 7/8] iommu/arm-smmu-v3: Invoke rpm operation before
 accessing the hw
Message-ID: <aFCEb744WpRpcDxM@google.com>
References: <20250616025628.25454-1-xueqi.zhang@mediatek.com>
 <20250616025628.25454-8-xueqi.zhang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616025628.25454-8-xueqi.zhang@mediatek.com>

On Mon, Jun 16, 2025 at 10:56:13AM +0800, Xueqi Zhang wrote:

Hi Xueqi,

> Invoke rpm operation before accessing the SMMU hw.
> 
> Signed-off-by: Xueqi Zhang <xueqi.zhang@mediatek.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 84 ++++++++++++++++++++-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  3 +
>  2 files changed, 85 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 154417b380fa..88912b0f8132 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -122,6 +122,22 @@ static void parse_driver_options(struct arm_smmu_device *smmu)
>  	} while (arm_smmu_options[++i].opt);
>  }
>  
> +static int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
> +{
> +	if (smmu && smmu->impl && smmu->impl->smmu_power_get)
> +		return smmu->impl->smmu_power_get(smmu);
> +
> +	return 0;
> +}
> +
> +static int arm_smmu_rpm_put(struct arm_smmu_device *smmu)
> +{
> +	if (smmu && smmu->impl && smmu->impl->smmu_power_put)
> +		return smmu->impl->smmu_power_put(smmu);
> +
> +	return 0;
> +}
> +

I've been working on enabling PM runtime for arm-smmu-v3 for a while, 
I just posted the RFCv3 for that series [1]. I see that you need some
implementation specific rpm calls too, I think it would be nice if we
could align on this?

Perhaps, you could rebase this on top of my series OR we can collaborate
for the runtime PM series where you can contribute only the rpm patches
from this series to handle your implmentation? 
Let me know what you think! 

>  /* Low-level queue manipulation functions */
>  static bool queue_has_space(struct arm_smmu_ll_queue *q, u32 n)
>  {
> @@ -2082,23 +2098,35 @@ static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
>  static irqreturn_t arm_smmu_combined_irq_thread(int irq, void *dev)
>  {
>  	struct arm_smmu_device *smmu = dev;
> +	int ret;
> +
> +	ret = arm_smmu_rpm_get(smmu);
> +	if (ret)
> +		return IRQ_NONE;
>  
>  	arm_smmu_evtq_thread(irq, dev);
>  	if (smmu->features & ARM_SMMU_FEAT_PRI)
>  		arm_smmu_priq_thread(irq, dev);
>  
> +	arm_smmu_rpm_put(smmu);
>  	return IRQ_HANDLED;
>  }
>  
>  static irqreturn_t arm_smmu_combined_irq_handler(int irq, void *dev)
>  {
> +
> +	ret = arm_smmu_rpm_get(smmu);
> +	if (ret)
> +		return IRQ_WAKE_THREAD;
>  
>  	arm_smmu_gerror_handler(irq, dev);
>  
>  	if (smmu->impl && smmu->impl->combined_irq_handle)
>  		smmu->impl->combined_irq_handle(irq, smmu);
>  
> +	arm_smmu_rpm_put(smmu);
>  	return IRQ_WAKE_THREAD;
>  }
>  
> @@ -2255,6 +2283,11 @@ static void arm_smmu_tlb_inv_context(void *cookie)
>  	struct arm_smmu_domain *smmu_domain = cookie;
>  	struct arm_smmu_device *smmu = smmu_domain->smmu;
>  	struct arm_smmu_cmdq_ent cmd;
> +	int ret;
> +
> +	ret = arm_smmu_rpm_get(smmu);
> +	if (ret)
> +		return;
>  
>  	/*
>  	 * NOTE: when io-pgtable is in non-strict mode, we may get here with
> @@ -2271,6 +2304,8 @@ static void arm_smmu_tlb_inv_context(void *cookie)
>  		arm_smmu_cmdq_issue_cmd_with_sync(smmu, &cmd);
>  	}
>  	arm_smmu_atc_inv_domain(smmu_domain, 0, 0);
> +
> +	arm_smmu_rpm_put(smmu);
>  }
>  
>  static void __arm_smmu_tlb_inv_range(struct arm_smmu_cmdq_ent *cmd,
> @@ -2353,6 +2388,11 @@ static void arm_smmu_tlb_inv_range_domain(unsigned long iova, size_t size,
>  			.leaf	= leaf,
>  		},
>  	};
> +	int ret;
> +
> +	ret = arm_smmu_rpm_get(smmu_domain->smmu);
> +	if (ret)
> +		return;

I'm afraid we aren't going for a hard rpm_get in such functions in our
design as per the the discussions in the rpm series[1]. It would be 
great if you could review that too and drop some comments there, I'd be
happy to understand and collaborate to meet your requirements as well :)

[...]

>  static const struct of_device_id arm_smmu_of_match[] = {
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index f45c4bf84bc1..cd96ff9cbc54 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -792,6 +792,7 @@ struct arm_smmu_device {
>  
>  	struct rb_root			streams;
>  	struct mutex			streams_mutex;
> +
>  	const struct arm_smmu_v3_impl	*impl;
>  };
>  
> @@ -1004,6 +1005,8 @@ struct arm_smmu_v3_impl {
>  	int (*combined_irq_handle)(int irq, struct arm_smmu_device *smmu_dev);
>  	int (*smmu_evt_handler)(int irq, struct arm_smmu_device *smmu_dev,
>  				u64 *evt, struct ratelimit_state *rs);
> +	int (*smmu_power_get)(struct arm_smmu_device *smmu);
> +	int (*smmu_power_put)(struct arm_smmu_device *smmu);
>  };
>  
>  struct arm_smmu_device *arm_smmu_v3_impl_init(struct arm_smmu_device *smmu);
> -- 
> 2.46.0
> 

Thanks,
Praan

[1] https://lore.kernel.org/all/20250616203149.2649118-1-praan@google.com/
