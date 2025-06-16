Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D62C1C54AF
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 21:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750109571; cv=none; b=l3kWUZmX8knlUBEo1DI2sonyWxWstUz7Ng9noY1C45vp7A/Q60QrB4yzaczfr0ugdUhioU1fwyItfmrlEwrHLH+/UaJvUDPcp2cFcmH+sCO1S4WV+O0fK6qy2O/eoa2zOdAjgt6n5FFGnppReZICkmquAPwplhi6OcM8f9FHVUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750109571; c=relaxed/simple;
	bh=1daXkcpedeVMkdfibmjOiKjSGHv5H5jAWkH3U7rNLWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4p3OexLOFvy23ZoG/JhIKpYk91JK62h7jpcT/KxMpjDxCA5FIFlLiNrTqLKaTALU3S/UVyWdthygEmhakUOVySzpb+FGE2RGVfkk+iUxFjGXLtwE0ibjs01qWnmPMrp7XqkrfHd5Yex4Iz2paiYg6XD9JvG42D4FWB5JcCvwjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h30leDPJ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h30leDPJ"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-235e389599fso67605ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750109569; x=1750714369; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=diaMMomGVSeMyl9b0SDQ+0jS5CqmoXFRYMyDr82RfPg=;
        b=h30leDPJKwfat85XPkRXpJLknslyBZB1MxEVPBFu5/677ECoPMwlaFA4qkv6FXoHje
         nAVhrPCuhlvL4Md56oo3xGPjbf4RA7mQC3khlai7WBQB6jYOQIF7rrsWV8qDnH0AYe1l
         TCd/qQfUKUYlcGEePQ+T+YwjkBExpcLR4sERQsRm+FQn5Xnh8d/dNpdk/hsZfUdotQeL
         9V9uVmecMSqFC6jnVflqsVDxC6Zfri4WSNDMQeEBhGo3sktbV+uOXWqrzNjT8Z3bMVjL
         vf+O0O3wf1eyCtQYHrf7gd2C11wbXhWknuhaO3eUsmtyYu7Ml+v4bM9W/oq6cqqSQ7G/
         1RVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750109569; x=1750714369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=diaMMomGVSeMyl9b0SDQ+0jS5CqmoXFRYMyDr82RfPg=;
        b=i4wh1WOI/luqZlLyU4qIDiBrMdb97+z8NGUjYqGyysGn9VOoueETtAkNCvSwaKMmBq
         yOCAXseBUE33JD7rnX3GER492rgPBMS4tfn7iw4TjPmUFiB4Vzjq/GYdsXZqgZWevrPm
         O+ZoPkcfXPb+ZECmVnPg5ixI2jSnhpFJb4lyJMaY7DXFepuVsv90CLy5GWHzyneJph4u
         +++vdlAFnWv1H2F3OI/t00sgwbg0H7+OmDiphoyfii+HQ3cxWmPwvO4+OFg1coV9tFv1
         AXtY/sp79vSvFlKyukOVeTWwZLW9M52E81+0jVfKEQ1MyhjNZAkidBMMZx9iyD0LiS14
         uvFA==
X-Forwarded-Encrypted: i=1; AJvYcCWdh1uViZO1E13XZoTQXY6DP9ERzHlZGHwTSzAQu9VwifV0asTdZYLMrNUp0hLKW2EywOnNH/4iXMRNNTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdXAviQRASQ9gRLkaZHCihYks2ApQFzeFCutU5gDlhyd6gUPzg
	S+9Us4lSGFnIyde/KanHaEAGqwqNxSW6G2YX/0nCCG1d7Qe0WI9lB8JlOf7dJ32AfA==
X-Gm-Gg: ASbGncss32sL8S/Gdhj4vDJyRawEvWaSpRjzG0z0/bq2R5qNXgU7RT90nmairxWqoKk
	qfjZA+ahiHXzDns0i+Ls22G1KDuBAiDTut+RL0n7GV6GTcmNEWaEducdBjXBvS8cWkliccX4I7j
	DhZm33PmNissKPaXQl9HmQKQ8Mxl9EZ/uCDFUCPxHxgKkqqpafDdptuO9yMVgLBp/pFiKUNPK0O
	30koOI2S6+NBbK3EClinqUR+DJR7RNe5vfcqGhp+mNb3X/2ZmlBoEcD/yAct7i76ODJgzhiYgv7
	PWslL1+1epRb4Nwq/mddrt/fieb0Uot4CPB49AvVhuxaq2XT1EgSW0g8nXUhyjB1nMpxGkwIfjC
	7X4rYwTAWEp+vr6ZjRdKD
X-Google-Smtp-Source: AGHT+IFWcQvoP+9fcVVp+c/nzrucrkTOoV642VxsR9D43oNtEPpmRjh6B8M7BM1aG3k8myNk+wmbkw==
X-Received: by 2002:a17:902:e74f:b0:21f:631c:7fc9 with SMTP id d9443c01a7336-2366c4f491bmr6716645ad.0.1750109569076;
        Mon, 16 Jun 2025 14:32:49 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31886377a6sm5271665a12.71.2025.06.16.14.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 14:32:48 -0700 (PDT)
Date: Mon, 16 Jun 2025 21:32:40 +0000
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
Subject: Re: [RFC PATCH 5/8] iommu/arm-smmu-v3: Add IRQ handle for smmu impl
Message-ID: <aFCNeOP7oRv7NRjQ@google.com>
References: <20250616025628.25454-1-xueqi.zhang@mediatek.com>
 <20250616025628.25454-6-xueqi.zhang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616025628.25454-6-xueqi.zhang@mediatek.com>

On Mon, Jun 16, 2025 at 10:56:11AM +0800, Xueqi Zhang wrote:
> Add IRQ handle for smmu impl
> 
> Signed-off-by: Xueqi Zhang <xueqi.zhang@mediatek.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 9 ++++++++-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 8 ++++++++
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index d36124a6bb54..154417b380fa 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -1954,7 +1954,8 @@ static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
>  			arm_smmu_decode_event(smmu, evt, &event);
>  			if (arm_smmu_handle_event(smmu, evt, &event))
>  				arm_smmu_dump_event(smmu, evt, &event, &rs);
> -
> +			if (smmu->impl && smmu->impl->smmu_evt_handler)
> +				smmu->impl->smmu_evt_handler(irq, smmu, evt, &rs);
>  			put_device(event.dev);
>  			cond_resched();
>  		}
> @@ -2091,7 +2092,13 @@ static irqreturn_t arm_smmu_combined_irq_thread(int irq, void *dev)
>  
>  static irqreturn_t arm_smmu_combined_irq_handler(int irq, void *dev)
>  {
> +	struct arm_smmu_device *smmu = dev;
> +
>  	arm_smmu_gerror_handler(irq, dev);
> +
> +	if (smmu->impl && smmu->impl->combined_irq_handle)
> +		smmu->impl->combined_irq_handle(irq, smmu);
> +
>  	return IRQ_WAKE_THREAD;
>  }
>  
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 99eeb6143c49..f45c4bf84bc1 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -792,6 +792,7 @@ struct arm_smmu_device {
>  
>  	struct rb_root			streams;
>  	struct mutex			streams_mutex;
> +	const struct arm_smmu_v3_impl	*impl;
>  };
>  
>  struct arm_smmu_stream {
> @@ -998,6 +999,13 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
>  				struct arm_smmu_cmdq *cmdq, u64 *cmds, int n,
>  				bool sync);
>  
> +/* Implementation details */
> +struct arm_smmu_v3_impl {
> +	int (*combined_irq_handle)(int irq, struct arm_smmu_device *smmu_dev);
> +	int (*smmu_evt_handler)(int irq, struct arm_smmu_device *smmu_dev,
> +				u64 *evt, struct ratelimit_state *rs);
> +};

Let's add these to the exisiting struct arm_smmu_impl_ops and invoke
them like:

	if (smmu->impl && smmu->impl_ops->combined_irq_handle)
		smmu->impl_ops->combined_irq_handle(irq, smmu);

Or maybe we could merge the existing impl_dev and impl_ops into a single
structure.

> +
>  struct arm_smmu_device *arm_smmu_v3_impl_init(struct arm_smmu_device *smmu);
>  #if IS_ENABLED(CONFIG_ARM_SMMU_V3_MEDIATEK)
>  struct arm_smmu_device *arm_smmu_v3_impl_mtk_init(struct arm_smmu_device *smmu);
> -- 
> 2.46.0
> 
> 
