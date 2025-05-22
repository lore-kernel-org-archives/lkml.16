Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71DE1F4CB6
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940266; cv=none; b=TGQ31edDwbbZuiKSVrtFcj2HhXjdRmPuNsA+N64s3gYx/BbHPIQGS1VBwnHcNTL0KOtEK7P4rQpzNspb8EQ2/gfb/BFC+dKi+BFjp2h+3AjtseJDtAXZhV2j0U3Or4Jt0PEJ7KqW40cUUxLxpeSJv2yBQrsXma8VZi6G81A9EJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940266; c=relaxed/simple;
	bh=mPlNrrCI141hViqbpNn117gV9qNMkImYPGI0pNIto0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z0cEEooYtRH67Q5GSpai2oss6BqBh+BRS/UmadM/zKc3n63jsAi/mXGyETKwhw/ueMuNnL6nc7mUD359oYAliWVwolqS4+5RLe65MoponFKnYd/rUXyUXRWDoMuaKbAgnFap9/GO4pI1qVK3mkY8iaE8cYt1GrlVrGd5Wtt+ZTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fRVjCTHR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fRVjCTHR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MHDbwW027524
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71LWWlp5SYfChnA55iTdDO5g05kpTKpC2r6RSF9U7JA=; b=fRVjCTHRmvLWpxzO
	GxgNgfIailcJT6v997Rzt+cf6KApN0CnkkaH62WHoRvEhrlYfROGKcsTLNgZvD/h
	+tVmmncATVwk82BWh24H18khkEKcoiO/mXwaSgkRWBxlqGhBTe6fKSkBYrg1s8Aw
	dosLO53XzHxkQS3drObfjbhrZD0T/kX5tgbbKWneGM9nafY3pDHSR4d117w4BTBt
	1WZUB8vcGSHCp/RARaMpBvZdFh6HxemmDDad2/8/iREwKQVY3TkRJnbOuT4wT9cO
	FTznE/cIvuv2zVXK4fVR2K8DnHSVLyNKX+berPyciXwpieFCm/OnXHuOgq0KXzL/
	mFZ4lA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c263x7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:57:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8ca9286d9so12858336d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940262; x=1748545062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=71LWWlp5SYfChnA55iTdDO5g05kpTKpC2r6RSF9U7JA=;
        b=CRdAqaF/6ENd+stB2ox6hB78grRn6cfYSfUUkUe3riWSIVwtEREkpdg1jqaVkGu26H
         XolycIzMJasg0jckQ5/vblyg5FBvO1MR82fKHzN++mYjozaMQDtwJN3aZ5iF1hfWl6R9
         jf6nBaCh4KFyw8vlAkz5m8Oa97eBPGylSVdcFpG8vvqMiq2Jczw+B0QgtLMqT9PmPXmQ
         iU/wxC0xV7umx4JzUnY52WqWbJr2WiLlUrlZXljhWxOR7C1eoYHaN314ChQfEjdwchIz
         I3SSNWFtKYs9tCKt9/MnOvJOwqFPAhLjrZTe8sRtCJ6NJYkU3/K4uwt6FvtnfEoaM1lZ
         v79g==
X-Forwarded-Encrypted: i=1; AJvYcCWldhYiRPLtfXggAs/Ib5VxRWcfr1E7KZDMPui+4zV1UrAgOvuKpOxgfA31cShZbMteXWTAwG13vDBI9aw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVj8mV8mH8CEUGUuhmokfrDkpc1D7N8JJTHVXQZNq8OF2ZCs5E
	kohDfS0X3qpWhnKwPGXxG0WaxMGcClvMGTJqI0q5+rFoN4nS25PwBwB6tNHGwvHu6ZgJ2hdO7/r
	gkKKPRCtLiL0ZZVkyQAjxMIpWnSC4trn8MJUeLiOPABq49umTnkULSNAreVneTX3mEUk=
X-Gm-Gg: ASbGncvjFF46UPaVE0cDF3OfMbIQZqRiS15R4abskRVQ2Z2craCTK/ekiaM9kgWZHPk
	XQFmTD/Jwlk3Ajl1wlyDKkswS9BK9T232sQV7dOiHp1BlNR2hRYMmWfOEzIauVn1ddp+V/kxzkF
	RS7OpqBJ1XX4cHlMoS5YJGcTpy6iWdB7ysY76diLTuqmBoCby8bO5d5z6A9tzI0O8fJVUyRa4fq
	COI6JgvnjGqHD/RtMfwxv3YiXL1qbFFXQTg/VK3BDECVn+zR1QueX5YJlWIC1ViAAvcJPrszG+K
	jPo17Y6bDMDzbQ/TuDShgs6IOvMRq4Yd6hS9xQULauf20iVhipQzzjHoaEiqfUyp3w==
X-Received: by 2002:ad4:5f8e:0:b0:6f5:3c5e:27fc with SMTP id 6a1803df08f44-6f8b089442dmr133321806d6.4.1747940262403;
        Thu, 22 May 2025 11:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5Tg78//GXVGyUOTwSdhWdbldHlKHurX2DdCfZUSaKQB4eMLZOcnriL6F1zLK9zyfr5P5G/Q==
X-Received: by 2002:ad4:5f8e:0:b0:6f5:3c5e:27fc with SMTP id 6a1803df08f44-6f8b089442dmr133321656d6.4.1747940262015;
        Thu, 22 May 2025 11:57:42 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d4f1c90sm10947316a12.12.2025.05.22.11.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 11:57:41 -0700 (PDT)
Message-ID: <23b2c6bf-1dc5-442d-b276-9f55ba00980f@oss.qualcomm.com>
Date: Thu, 22 May 2025 20:57:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcs615: Add support for camss
To: Wenmeng Liu <quic_wenmliu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, bryan.odonoghue@linaro.org,
        todor.too@gmail.com, rfoss@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
 <20250520-qcs615-adp-air-camss-v1-1-ac25ca137d34@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250520-qcs615-adp-air-camss-v1-1-ac25ca137d34@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MSBTYWx0ZWRfX8DDpj75BLt89
 v1gzHpyO6clTwvrjrKGDCZgBeHIOUU8OhlSMhl0wHjURcpwJLOHyR7ScGkCniJGH7jrbiK8O08Y
 Gd6pg0WRBNrnOVfzYt+vsIJbeS5e//4Aid83el4lKvyDid0eVtv/tc4T3hZ2Lg6k0KOpZAxOuh4
 CbSOk2vdY/E8/LEY8d2ogXXL/9KC7GWV/n2NjN8ZuazG5oLB/+dzaOWQhVpGSi7VuLuN9y557CC
 htCajeimlhWD9JGlXCdWQsa8P2+GfQgda1rfLfMLIqRj6Gvw54fOuEw4Fsr4ZH5c5vS2gpY3O6v
 t0VdyfNeknTAUBjWpeZi/qCLqEXr/kOBPcKscWlhOjFSSt6+nweTPKUmGdimqAZnP3FOHfkWbuB
 YL59VqRbCN2lL+M0WB08PUQyabKXdpJ8cOXJYTimjWDhz927gVnSvlalKQWouBA4WDxwaSg7
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682f73a7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=op7gvYc-dbaEY5YB2yQA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: SiOaF12PCoUqd_YW8eA9sWnJ-CoNKVS5
X-Proofpoint-GUID: SiOaF12PCoUqd_YW8eA9sWnJ-CoNKVS5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=934 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220191

On 5/20/25 10:56 AM, Wenmeng Liu wrote:
> Add support for the camera subsystem on the QCS615 Qualcomm SoC. This
> includes bringing up the CSIPHY, CSID, VFE/RDI interfaces.
> 
> QCS615 provides
> - 2 x VFE, 3 RDI per VFE
> - 1 x VFE Lite, 4 RDI per VFE
> - 2 x CSID
> - 1 x CSID Lite
> - 3 x CSI PHY
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---

[...]

> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
> +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +				 <&camcc CAM_CC_SOC_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CLK>,
> +				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CLK_SRC>,
> +				 <&camcc CAM_CC_IFE_1_CLK>,
> +				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CLK_SRC>,
> +				 <&camcc CAM_CC_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CLK_SRC>;

Drop all _src clocks, the common clock framework has been handling
turning these on when their children need it for 13 years now :D

[...]

> +			interconnects = <&gem_noc MASTER_APPSS_PROC 0
> +					 &config_noc SLAVE_CAMERA_CFG 0>,

QCOM_ICC_TAG_ACTIVE_ONLY

> +					<&mmss_noc MASTER_CAMNOC_HF0 0
> +					 &mc_virt SLAVE_EBI1 0>;

QCOM_ICC_TAG_ALWAYS

> +			interconnect-names = "ahb",
> +					     "hf_0_mnoc";
> +
> +			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "csid0",
> +					  "csid1",
> +					  "csid_lite",
> +					  "csiphy0",
> +					  "csiphy1",
> +					  "csiphy2",
> +					  "vfe0",
> +					  "vfe1",
> +					  "vfe_lite";
> +
> +			iommus = <&apps_smmu 0x820 0x40>,
> +				 <&apps_smmu 0x840 0x0>,
> +				 <&apps_smmu 0x860 0x40>;

x1e defines a bunch more streams than its phy/csid count

plus entries 1 and 3 are equal after the mask is applied

(0x860 &~ 0x40 == 0x820 ~& 0x40 == 0x820)


Konrad
