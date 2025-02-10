Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A0F1C5D74
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739185293; cv=none; b=PjhjafHKAcJybove+2hsBGhXsb/hdoDe6obnNsJ3SzRLSLi74Hmw22afAumWIqWxPqsoU/3Lkqa4dHbXLGFddAtMVHOThZ88G/aRBXvfy9+WubyOzsfhrkB5J9D/NgfbmfIr7yqT1CzEX2i/2OMotJL48pMnx0NuLj9msND/rnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739185293; c=relaxed/simple;
	bh=WgW6ZEWyu81z7BrqyHmBRuGMtk2zuQXDhJEjREDVx6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eA+hyo+7k7PadJo5oy0iGNUE5zfytQc1XHJFKpVMuCCTm19Q//14q8wQmAxSUFnPjp19bwqG43Mo0xajfK9Cig/HLfqeqvBVC5M7EbcLAh24sFsEttbubgi11nweo8xA3aBz9nHG9EBGcdBkTmBmn4gpQeI8jggXkY6ELdjo17E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YGqm8akA; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YGqm8akA"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-545097ff67cso1121951e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 03:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739185289; x=1739790089; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GtTBVwp4J9apExhc56rvDYwcShHHaMo1N7lDCxauzzY=;
        b=YGqm8akAE8gSZd1S7vpanZvGYy1GVJ+v6hmPJkO+E2m72RZYbt7eZZwHva2orJ5w58
         4EovFDkM1tJwKmTA95tLhs5Ua+hVJUv3jazgqT9mecFlUI7TEhhcIBTd6YzIqQyTdIXf
         t5H9wZFSIMi0l8wN98n3/F4ZNU8TtXMEG2pAjzhL0QK1oxiY+cegCvEdRrHOhSOEAL0H
         yQTGXF6WUPtszeZFs9wqbJzoZSXqXav/im/Y9U83Hcrmn3af0p/j9Zz0nPDBbzVKGnhB
         07zG+9YyVNtm8t5AVYm3+XqsfWjTPhAdyzrsJXgQYREiG4W6MVzmqHgZZrIOO53zcCqh
         7jvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739185289; x=1739790089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtTBVwp4J9apExhc56rvDYwcShHHaMo1N7lDCxauzzY=;
        b=Cv1jbIXVJf+ube78DPdn2f8XhQuQ5njFh0bH34bm/qNNstTqerkP1Wgjkw8+W67NbS
         U/fzk8GWx+ErEbtgAKbhokLGPl/EhWvAUHuOd6q9T5ZQSqJv6/x1Sqnh+f1i8hLN6eIH
         zIUeQExQ6JG2ZFMIrQay+ggF6LqxxJ9Ozo4CaGbY6/Cut6OD5buOg4XVqX325hF5RT2o
         6Y3nya6GR918iyc6Gk8z25/Zd0hZ22AGrfQoJD4nUGdNcGR9QRFm13ry88g3CshOJyd6
         FMWniRARb8jQaiRq972qbVR99nCcQZ9k+GhOx1+CsezMagwggSDMjUO1JbGdlmCydg1V
         ZiVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKs29vHIt9ESp/WeEfcsW0PeC/vTczjOMISejrJDcNXEy5fsNDVm4YwVq/q39rl+eEbLotys+qv3HlsgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgWfrDtLQlw+uVrf1PjJ/SYAe5suQW6Cfksc6BnNNUlaCZ4goE
	+J0jaACDJFGHlhWzGMlXFIaf/8H6TNRjN7Z6y8j8uvgIv5MXzU6UveglmyPVnWs=
X-Gm-Gg: ASbGncu5R/EDX+hkjrl3PTvBrzTI2xE9/YfT2JfB8LG6XCHgIQ9J4nMyZjiI49fslIc
	HNWL0VEATPlOsvry9uMvpwzDGeZLVKUwS+ehXqVl/F+DMQNE8WacNMk1GfaVxXSHkYFuKlWsenL
	LssSE2i8kKH5mV/eq3qY2FEWEa4tmk1vQxNTpKDGGUSHM7P67qsS6kg0ZlzJ8ewf1MhmprcTbmo
	aRVkZ7pM2e86lAmyO16Pscs2cNqVrPJwpSNkqVoEeEttnnBrWa6i9IyqwhWopnWDYRczQfoNS0z
	3KxefRcWrpbQKNnFvM5T+XTGNGBHcpLje0OH0Q7hrnwLAX1uWu3f5HHlV2HpMm7a1WJ5V5o=
X-Google-Smtp-Source: AGHT+IESGWlTJg2cuv8Kgo6v/dDQZjg10SE7StQf8S4vcvj1tAiGKln4CJ/xT6Y54Ae/tQTmSnk31g==
X-Received: by 2002:a05:6512:4022:b0:545:ae6:d740 with SMTP id 2adb3069b0e04-5450ae6d79amr1090753e87.41.1739185289056;
        Mon, 10 Feb 2025 03:01:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450c0823acsm321386e87.118.2025.02.10.03.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:01:28 -0800 (PST)
Date: Mon, 10 Feb 2025 13:01:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Pratyush Brahma <quic_pbrahma@quicinc.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300: Add device node for
 gfx_smmu
Message-ID: <464vbzwgv44fn4iw5vj5yzpstzhcsb7rzuedf4fwl23hmdhews@d4q33ro6hxq3>
References: <20250203-b4-branch-gfx-smmu-v4-0-eaa7aa762f48@quicinc.com>
 <20250203-b4-branch-gfx-smmu-v4-2-eaa7aa762f48@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-b4-branch-gfx-smmu-v4-2-eaa7aa762f48@quicinc.com>

On Mon, Feb 03, 2025 at 11:17:02AM +0530, Pratyush Brahma wrote:
> Add the device node for gfx smmu that is required for gpu
> specific address translations.
> 
> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 39 +++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 4a057f7c0d9fae0ebd1b3cf3468746b382bc886b..7a8211bec139375b5aab939f123d88fca7aceff2 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -2674,6 +2674,45 @@ gpucc: clock-controller@3d90000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		adreno_smmu: iommu@3da0000 {
> +			compatible = "qcom,qcs8300-smmu-500", "qcom,adreno-smmu",
> +				     "qcom,smmu-500", "arm,mmu-500";
> +			reg = <0x0 0x3da0000 0x0 0x20000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <2>;
> +
> +			interrupts = <GIC_SPI 672 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
> +				 <&gpucc GPU_CC_AHB_CLK>,
> +				 <&gpucc GPU_CC_HUB_AON_CLK>;
> +
> +			 clock-names = "gcc_gpu_memnoc_gfx_clk",

Stray whitespace after the Tab symbol

> +				       "gcc_gpu_snoc_dvm_gfx_clk",
> +				       "gpu_cc_ahb_clk",
> +				       "gpu_cc_hlos1_vote_gpu_smmu_clk",
> +				       "gpu_cc_cx_gmu_clk",
> +				       "gpu_cc_hub_cx_int_clk",
> +				       "gpu_cc_hub_aon_clk";

clocks and clock-names do not match.

> +			power-domains = <&gpucc GPU_CC_CX_GDSC>;
> +			dma-coherent;
> +		};
> +
>  		pmu@9091000 {
>  			compatible = "qcom,qcs8300-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
>  			reg = <0x0 0x9091000 0x0 0x1000>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
