Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0748199943
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 09:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746957229; cv=none; b=FyEzQ5I2Mo02W63DIjCyqCJR03l5kh/x74zKTOiWH7DqawZDCswLZl44TpO4XRtJM1nPfGUO3XCyCYKkiDMrxy+EeAtI2C+t1UPpwulx+mz4SoiVVQn1TX8dZ3xXcIWJYuCvzMQzPWHaV0NImTKB8TlbbNlAXFbb6PfDt3bWdg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746957229; c=relaxed/simple;
	bh=LZUKTqSRIzcTe3Oi+qurbGORduHQ3aDEWoEgQumaS/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lQql8tkcjWcdGlk4br0HE3PgXmlXiqkFFvaFRO1o9zd8SgKTRQa0Y7oYKmaHAYKgrWPh+RjSuKP2UZ83blspaFBpLu6Qt+xD7en44V0oiHkikT7BkB4UAQnrl0rfjXCcNZ7qrwSXEbKbkh2C/OhkOY/TPynTYCH6Qc90O2526vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FnGTEvYB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FnGTEvYB"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso21500175e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 02:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746957226; x=1747562026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=svOIBgOqEfJz5rl1KUebw1DSPQLmx16oiBp9+Pj6aYI=;
        b=FnGTEvYBuQPrh6lZoo+7yjOEfmZXAOnlTG6rsaoRM4P5pLlpA5ojiAd8CCJeBQPGcU
         HmIBdOyBijm8yXQyE6vQGRL1eK/rK36zM7QvA2mmplueo62QbKex1OAtnE6sCTmKDmic
         Vb+k8Bi5MMYVpdWJJQTZlPg1N6KpwWTbFE1yKkTTDb5ooM0RkIJGbQGT2jbO0Pvgk+GW
         RyMflzzzzJ6WOLNwp/SWWyI7OcWVLmDxElYAO087eE18aUjJSc//ERu4sjndnwlY7Tc5
         cHVjAKcjyLovstlcFgJYU9ElhEkZ3sGXRjtYWsiYoMd5WB7YT5nEAUqm05HUrp/k+Oh6
         IS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746957226; x=1747562026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=svOIBgOqEfJz5rl1KUebw1DSPQLmx16oiBp9+Pj6aYI=;
        b=jX5r9NZMBPYC8/C6HXYeD8Tj3HiAdNjzwRM7N1KSZSHAAUJpIXg1AGLJUrwr3sWKNq
         tOXtt03iW6hdr5nCzPPGkTzfXx93l9qx6FBR4Ct6nmHrMpkjc4F2Q+Z9mKO/TSJ+4Zu1
         G+r01AkdBWSYOTQI+2tp4qMxyYNe2a0UXS5JS6ujvQzxK6SVSGwttT9dah0SnyY8PFEt
         2pxKyI1wBiRViI91WMGVeymxEtCE580iQAcz8zEQPPICgc5c02yv/8CXEE812GU0BylR
         OCpGQH+klorb6e8VsMRsyRw1e816F9JeXVAu8ZQ472OSA4HcZDhqq009XdZxAgTTFKea
         7iJg==
X-Forwarded-Encrypted: i=1; AJvYcCXa8/lyLFvHgB/bbNpM3a+J68hyDF+ksC67MdqljNCKt45KiYD4kfqyqlHkQ4V2EbGF13woGjQYft2WjVg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx65JYj8n0TMzLFX4dhTAkxDNF78wB6MoyKxba1tV2ZoZsw6nC4
	ZsNNiMGdyR8v5R1ZdvExPGpch4355JOAI3FisHlBvXlmHgMLBytLubIqvp78i6U=
X-Gm-Gg: ASbGnctdp5xeO14X6CAx71iBFgc/EXSzK6lv5P/YmHc74jUFaPgvbLHOSSRwHyZnHkm
	eYd3evs3Z6rahzmukOheGrPV2z6nYG6RQqAi9NQ8g7VCqJnHGEzv1EzkmQ2C40kG8Y5/ieDkYLD
	xz4A+VzJwGiLY+lKv6U9E4rVQhdnmyZH+I0DJGsH0cUkBaehYPKMci3z9l3O7k3BsJZgKOjxymO
	k2OI2WFXF0tS9GUJ3OZjLb6LGDS1Kk3qZV9CK90BWsetxByzZVLIpc3D2OLbHonTNmDuhzc9fAi
	/JnGDZtuphHxtBxA0aE6YyfIBO5LZf4g4XvqcJSaoV2tJKiLNzBwOXxZ/QtYU67rchZKEL02pdE
	YrLB9komVmyHu9wmA
X-Google-Smtp-Source: AGHT+IEaXwLtr3ulVMHDoKRGiNLV/K4UKtErrKqyimNqORo5mIpZHz11BKqYDHNoxO5NUXC77uulTA==
X-Received: by 2002:a05:600c:4e45:b0:43d:46de:b0eb with SMTP id 5b1f17b1804b1-442d6d44814mr82270705e9.12.1746957225872;
        Sun, 11 May 2025 02:53:45 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ae10sm87083295e9.37.2025.05.11.02.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 May 2025 02:53:44 -0700 (PDT)
Message-ID: <cfe66826-fe23-47c6-8292-74066f021330@linaro.org>
Date: Sun, 11 May 2025 10:53:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/WIP v2 4/9] arm64: dts: qcom: sa8775p: Add support for
 camss
To: Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
 <20250427070135.884623-5-quic_vikramsa@quicinc.com>
 <cfc85bc0-1808-42ac-b0b0-41e4935ec74d@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <cfc85bc0-1808-42ac-b0b0-41e4935ec74d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/05/2025 08:14, Suresh Vankadara wrote:
> 
> 
> On 4/27/2025 12:31 PM, Vikram Sharma wrote:
>> Add changes to support the camera subsystem on the SA8775P.
>>
>> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
>> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 187 ++++++++++++++++++++++++++
>>   1 file changed, 187 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/ 
>> dts/qcom/sa8775p.dtsi
>> index 5bd0c03476b1..81eadb2bb663 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> @@ -7,6 +7,7 @@
>>   #include <dt-bindings/interconnect/qcom,icc.h>
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>   #include <dt-bindings/clock/qcom,rpmh.h>
>> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
>>   #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>>   #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>>   #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
>> @@ -3940,6 +3941,192 @@ videocc: clock-controller@abf0000 {
>>               #power-domain-cells = <1>;
>>           };
>> +        camss: isp@ac7a000 {
>> +            compatible = "qcom,sa8775p-camss";
> If more number of nodes are added for CAMSS, adding isp in compatible 
> string helps to differentiate.

We need to keep a consistent upstream schema.

If we were adding other hardware blocks - say the BPS it would just be 
appended to the end here, declared as another v4l2 device and then 
wired-together from user-space via likely a qcom specific libcamera 
pipeline.

> 
>> +            reg-names = "csid0",
>> +                    "csid1",
>> +                    "csid_lite0",
>> +                    "csid_lite1",
>> +                    "csid_lite2",
>> +                    "csid_lite3",
>> +                    "csid_lite4",
>> +                    "csid_wrapper",
> csid wrapper is top register set, which is applicable for both csid 0 
> and csid 1. It is logical to keep along with csid0 and csid1, instead of 
> alpha numerical order.

We've had it feels like an eternity of debates about this and 
compromised on alphanum sort of of node-names as the most consistent 
with prior art.

> 
>> +
>> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
>> +                 <&camcc CAM_CC_CORE_AHB_CLK>,
>> +                 <&camcc CAM_CC_CPAS_AHB_CLK>,
>> +                 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
>> +                 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
>> +                 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
>> +                 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
>> +                 <&camcc CAM_CC_CSID_CLK>,
>> +                 <&camcc CAM_CC_CSIPHY0_CLK>,
>> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
>> +                 <&camcc CAM_CC_CSIPHY1_CLK>,
>> +                 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
>> +                 <&camcc CAM_CC_CSIPHY2_CLK>,
>> +                 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
>> +                 <&camcc CAM_CC_CSIPHY3_CLK>,
>> +                 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
>> +                 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
>> +                 <&gcc GCC_CAMERA_HF_AXI_CLK>,
>> +                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
>> +                 <&camcc CAM_CC_ICP_AHB_CLK>,
>> +                 <&camcc CAM_CC_IFE_0_CLK>,
>> +                 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
>> +                 <&camcc CAM_CC_IFE_1_CLK>,
>> +                 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
>> +                 <&camcc CAM_CC_IFE_LITE_CLK>,
>> +                 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
>> +                 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
>> +                 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
>> +            clock-names = "camnoc_axi",
>> +                      "core_ahb",
>> +                      "cpas_ahb",
>> +                      "cpas_fast_ahb_clk",
>> +                      "cpas_ife_lite",
>> +                      "cpas_vfe0",
>> +                      "cpas_vfe1",
> Maintain consistency on vfe/ife in complete camss node. In reg section, 
> vfe is used for full and lite version. in clock-names section ife lite 
> and vfe are used. As clock IDs upstream and ife is used for full and 
> lite, this convention will be followed in camss node as well.
> 
>> +                      "csid",
>> +                      "csiphy0",
>> +                      "csiphy0_timer",
>> +                      "csiphy1",
>> +                      "csiphy1_timer",
>> +                      "csiphy2",
>> +                      "csiphy2_timer",
>> +                      "csiphy3",
>> +                      "csiphy3_timer",
>> +                      "csiphy_rx",
>> +                      "gcc_axi_hf",
>> +                      "gcc_axi_sf",
>> +                      "icp_ahb",
> sf and icp_ahb clocks needed?
> 
>> +
>> +            interconnects = <&gem_noc MASTER_APPSS_PROC 
>> QCOM_ICC_TAG_ACTIVE_ONLY
>> +                     &config_noc SLAVE_CAMERA_CFG 
>> QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +                    <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
>> +                     &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> +                    <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ACTIVE_ONLY
>> +                     &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +            interconnect-names = "ahb",
>> +                         "hf_0",
>> +                         "sf_0";
> sf_0 needed?
> 
>> +
>> +            iommus = <&apps_smmu 0x3400 0x20>;
> 
> 
> Regards,
> Suresh Vankadara.
