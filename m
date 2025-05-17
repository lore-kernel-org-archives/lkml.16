Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99041E008B
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 12:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747483683; cv=none; b=p8yt8+JpjR8S8RN+WTFUjPJQwcFLRVIa3tPQsz8UJ9i/88/PFSsL8+N8YvICMdW6cVnU5cKNb+PeHwFeEqT8u72bHZW59ouSM7Fj8ONI0Mos1+8Kq4VvuHKzPaNVIvQV0tUzw7Hm1v2XwOcRqIEyIgrVGDxriGbzKAGhlUd06gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747483683; c=relaxed/simple;
	bh=JsF1iBHZi4da+dGdJBApQ+ANHIWaEa9GyeMyw95bDIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ummq5F4HqFX2ObszqyD5zJabUng2S2TosynMJ16srbVrw+tFuUaV/tl55N4oWQjAy/nvy6bRzOroIQ3WejdHObZRSmAbL6OLkLOjWJ7EkGcxCbFDf1adtmYHdhY0B3847JhWECuIRs6SMKDoTpmbrKiZPaBujBdMKJu9QmiXSxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=swYkF++7; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="swYkF++7"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a1d8c09683so2006517f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 05:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747483680; x=1748088480; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=veInJ+3Cm2zC309Rkzqj0B0YpJYKgFeQ/l0vTzL3Jr0=;
        b=swYkF++73sk45J4MmAtDnGPpX8geQ1fxDDQ76OnKSLnEUZwoG31AXVeYsgQJprz5WE
         hpjdI3otxDNJXugCNVRTMhKMQRoj9rbD49RWkYubGG/SiP5A52lJy+xWNZCkRxVGcRL+
         21mRzNScaz70vrgOjhA1OnWVdrquEmegb+SOup1cUPavPyRhS6eu/UO8N1hhLGKf6jRr
         /50mZ41/JCqN9r1z/Cv332JAoNcM8QgESNK+1pYJkpDSqzirr89XVMuvQW3W0xxK2qsX
         MJOuQtx5/lN5GfOgio8y8ZDECy84dD6nVf/utU7+wJIBNTsSTkojlxUYWYBWUaAX3SNq
         gE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747483680; x=1748088480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=veInJ+3Cm2zC309Rkzqj0B0YpJYKgFeQ/l0vTzL3Jr0=;
        b=NmT55mn+gmXs6AoOLVMUBJnRE3X7lStK0ULnFZwrHY0GRylS5swdDd5+IDQsj45wpD
         Lmk1t+gdrE5InNlmGKcfAA1VIkBnk4MZiByLIv+HH4jI3St1pbCIbxfR2ZbLpU9BpOmK
         qrbIWuBf8CHn+FGDOjdiVKy4Y/djLnYE/zCQcW+fspTUo0OlKRPz30zYu2O9uv1Slj8g
         Y8bVJC+ZJ6I3wsvkt360bwJ3L12/XAxeg+/PSF42qJAwEE29hSnhOvgNAIsEuvxokeQU
         O0SMWTiAudJ/A4zJVDQuYTQRKRpSWV142QkOH7DQZnNzcU+k4YBPAoiWVQDeJ8aeIaCS
         jMMw==
X-Forwarded-Encrypted: i=1; AJvYcCVZs4QZvq7dgtmY8VQir5igrz7yo99PQLm22zREttfh1UG6zN/Lgr05lr9m28zeClfJK+OI7YeRGK9f0Fk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQrTfm/mYV/ywOTxAuIw6f/y6HmGBY2iS/LapN7c+3JOviBSiH
	XPCJFLQwvDYiPVuoqr56AQ5jXJcrClV2mRR/ATkX2E6/2P+WUaiB1v2pTjapRsuMgvA=
X-Gm-Gg: ASbGncuOC5HV5uXvEwvOEJmtPNWpuWFXhwoFh0dlBh1J9/OoGGQFMc8mNe0ePnEiMAV
	NdigkQnjBwFaS8VLNeDMpRzbHIBKgKMjYtqcTng4f7rnfuXsFr6yDccL/7kNpEVaEguAnDHfPOX
	UKPn/pmTLrWvjVexlqvLmu0AxiuRIMOXDXAiKtYrQr7q6VltSuYH3w92mB2a9Hm29/hLga+uc33
	kbPJB9MedMD1yUe2PO1fMF1vk2XE3PamWtURZegkSdZc4+JHTTLNwWm4WT+zp9C0xPhc6DH8ZST
	uQ8IypXBZ6guZ9aQqWDkPI8k0ak/I98SP/HKLvAdPOD9XJ3TXfkKLYy/lN7/BJ39INVCGwtihPk
	0Ecdz+Q3xEoLsDNNqwOpTsahysRI=
X-Google-Smtp-Source: AGHT+IHtgb89glM3b1ppT46CRec8sDvse8V+4WmzF+ky/Gq8aRQjexFs43+xNoLkOYYZUYf6dP2H+A==
X-Received: by 2002:a5d:584d:0:b0:3a3:6756:2ccd with SMTP id ffacd0b85a97d-3a367562d25mr1729543f8f.40.1747483679955;
        Sat, 17 May 2025 05:07:59 -0700 (PDT)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8cf66sm5919482f8f.87.2025.05.17.05.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 05:07:59 -0700 (PDT)
Message-ID: <a18f1992-97de-4f29-8178-939e39cf43df@linaro.org>
Date: Sat, 17 May 2025 13:07:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: qcom: sm8550: Add support for camss
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 quic_depengs@quicinc.com
References: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/05/2025 08:27, Wenmeng Liu wrote:
> Add support for the camera subsystem on the SM8550 Qualcomm SoC. This
> includes bringing up the CSIPHY, CSID, VFE/RDI interfaces.
> 
> SM8550 provides
> - 3 x VFE, 3 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE
> - 3 x CSID
> - 2 x CSID Lite
> - 8 x CSI PHY
> 
> Co-developed-by: Depeng Shao <quic_depengs@quicinc.com>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 210 +++++++++++++++++++++++++++
>   1 file changed, 210 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index e9bb077aa9f0..722521496a2d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3326,6 +3326,216 @@ cci2_i2c1: i2c-bus@1 {
>   			};
>   		};
>   
> +		isp: isp@acb7000 {
> +			compatible = "qcom,sm8550-camss";
> +
> +			reg = <0x0 0x0acb7000 0x0 0x0d00>,
> +			      <0x0 0x0acb9000 0x0 0x0d00>,
> +			      <0x0 0x0acbb000 0x0 0x0d00>,
> +			      <0x0 0x0acca000 0x0 0x0a00>,
> +			      <0x0 0x0acce000 0x0 0x0a00>,
> +			      <0x0 0x0acb6000 0x0 0x1000>,
> +			      <0x0 0x0ace4000 0x0 0x2000>,
> +			      <0x0 0x0ace6000 0x0 0x2000>,
> +			      <0x0 0x0ace8000 0x0 0x2000>,
> +			      <0x0 0x0acea000 0x0 0x2000>,
> +			      <0x0 0x0acec000 0x0 0x2000>,
> +			      <0x0 0x0acee000 0x0 0x2000>,
> +			      <0x0 0x0acf0000 0x0 0x2000>,
> +			      <0x0 0x0acf2000 0x0 0x2000>,
> +			      <0x0 0x0ac62000 0x0 0xf000>,
> +			      <0x0 0x0ac71000 0x0 0xf000>,
> +			      <0x0 0x0ac80000 0x0 0xf000>,
> +			      <0x0 0x0accb000 0x0 0x1800>,
> +			      <0x0 0x0accf000 0x0 0x1800>;
> +			reg-names = "csid0",
> +				    "csid1",
> +				    "csid2",
> +				    "csid_lite0",
> +				    "csid_lite1",
> +				    "csid_wrapper",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "csiphy3",
> +				    "csiphy4",
> +				    "csiphy5",
> +				    "csiphy6",
> +				    "csiphy7",
> +				    "vfe0",
> +				    "vfe1",
> +				    "vfe2",
> +				    "vfe_lite0",
> +				    "vfe_lite1";
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_2_CLK>,
> +				 <&camcc CAM_CC_CSID_CLK>,
> +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY3_CLK>,
> +				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY4_CLK>,
> +				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY5_CLK>,
> +				 <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY6_CLK>,
> +				 <&camcc CAM_CC_CSI6PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY7_CLK>,
> +				 <&camcc CAM_CC_CSI7PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CLK>,
> +				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CLK>,
> +				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_2_CLK>,
> +				 <&camcc CAM_CC_IFE_2_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +			clock-names = "camnoc_axi",
> +				      "cpas_ahb",
> +				      "cpas_fast_ahb_clk",
> +				      "cpas_ife_lite",
> +				      "cpas_vfe0",
> +				      "cpas_vfe1",
> +				      "cpas_vfe2",
> +				      "csid",
> +				      "csiphy0",
> +				      "csiphy0_timer",
> +				      "csiphy1",
> +				      "csiphy1_timer",
> +				      "csiphy2",
> +				      "csiphy2_timer",
> +				      "csiphy3",
> +				      "csiphy3_timer",
> +				      "csiphy4",
> +				      "csiphy4_timer",
> +				      "csiphy5",
> +				      "csiphy5_timer",
> +				      "csiphy6",
> +				      "csiphy6_timer",
> +				      "csiphy7",
> +				      "csiphy7_timer",
> +				      "csiphy_rx",
> +				      "gcc_axi_hf",
> +				      "vfe0",
> +				      "vfe0_fast_ahb",
> +				      "vfe1",
> +				      "vfe1_fast_ahb",
> +				      "vfe2",
> +				      "vfe2_fast_ahb",
> +				      "vfe_lite",
> +				      "vfe_lite_ahb",
> +				      "vfe_lite_cphy_rx",
> +				      "vfe_lite_csid";
> +
> +			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 278 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 602 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 688 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "csid0",
> +					  "csid1",
> +					  "csid2",
> +					  "csid_lite0",
> +					  "csid_lite1",
> +					  "csiphy0",
> +					  "csiphy1",
> +					  "csiphy2",
> +					  "csiphy3",
> +					  "csiphy4",
> +					  "csiphy5",
> +					  "csiphy6",
> +					  "csiphy7",
> +					  "vfe0",
> +					  "vfe1",
> +					  "vfe2",
> +					  "vfe_lite0",
> +					  "vfe_lite1";
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "ahb",
> +					     "hf_0_mnoc";
> +
> +			iommus = <&apps_smmu 0x800 0x20>;
> +
> +			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
> +					<&camcc CAM_CC_IFE_1_GDSC>,
> +					<&camcc CAM_CC_IFE_2_GDSC>,
> +					<&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			power-domain-names = "ife0",
> +					     "ife1",
> +					     "ife2",
> +					     "top";
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +				};
> +
> +				port@5 {
> +					reg = <5>;
> +				};
> +
> +				port@6 {
> +					reg = <6>;
> +				};
> +
> +				port@7 {
> +					reg = <7>;
> +				};
> +			};
> +		};
> +
>   		camcc: clock-controller@ade0000 {
>   			compatible = "qcom,sm8550-camcc";
>   			reg = <0 0x0ade0000 0 0x20000>;

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
