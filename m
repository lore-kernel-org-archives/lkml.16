Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F461B808
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750677398; cv=none; b=TrV1lTJHleomDK9dPOndaQCKw+GsbkOUP0uFc3xKF85QjC5ZPb7T+MbrwnGwNHp/gPL/hy/8VpTONyInCGZAIzknmreOXWnh4uJ8Ie8HSxBAyT6J130pyAe8EHLE3EGDlhyX2R3IKci0EVG4EyFFok5SP86kzFBirc8/eU/mLoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750677398; c=relaxed/simple;
	bh=UQwjt7347aONCY5rnhswMRSp+U6chmWKidTflR/+f3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I5T98k3cW31sRfKqCHT70GYOW8OW2qXbDefwu53+qH5z1gjkWrxXYGIdlLW9U5tL52YivoY0GIFSb37Vjz6VLn4fmMsLy03W+undlxgjAwF18vJC19VUdiyOaQP/BXHOltKiq9oowwGPhQq0v/n1hokvzCvryDTPzHNgPGTeG3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fcul20EF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fcul20EF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9jsIj007763
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yrDbtpWRMSm/kr1xs/mgSja/sLZX0KXtv6bDiZCQcvc=; b=fcul20EFry0/TD9d
	N4r9fF1lSDPL+PW9xOFzCHfRRYkdQ1KdNNkeH57B3+UI5O7r3Hn05F4KyEJxKSo3
	OAdoJsZy6ytsJbsjfegGix2XLZed4rKrLemdEJVtK6jav88Vobdr+H8pOgCf00h8
	hCHC7PnP7l0lgFt8BR6OVLUcGRrzf5kRR40Iosk2fDpKxMiRS3MrkMHv9DGusk8Z
	aC78oUERbFH8QAjED1FzZh6JfugMSABIPjX5ij9Tgq7if89Os3Zvx+4duzgLpMSR
	h1/h+gLb37Nv+pJ2SIiAAiRh25qioTN28qj6tQ+QM88mM9Bn1FVESEQnGalpmO7R
	tP2k3Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eccdjh78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:16:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb030f541bso8833586d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 04:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750677394; x=1751282194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yrDbtpWRMSm/kr1xs/mgSja/sLZX0KXtv6bDiZCQcvc=;
        b=aBWsXLqpc4Pf03iy4QDVsCalzhDYXqC7sb8xs30CLkTlAadcSMa8RUrWkBwuKWHItU
         1/BLWpnIZAXVKbceDM0rNBFNYoX1bhwP+Hz9RkjcLf5lCJS7d0ZUDl26JKrbh9BrzOUn
         RQ1HGz7usqCl5hRbFpHljF1SNfJtDyNGKTfTbBKEGxl2ke+CR1xVLC1jyjrRGUoXXmk7
         6VtlPjHB4iYrF9iwoJlFeYagCW2CjCkS10Za1VpcJKk75GkMCoqGM7ftqTc+8zrk6493
         2JdwwlKSUCyRTI7UWXnnO3xApWhc10QA/E7lvEr5GkSFOEUlfRYsHzkrk/FJS2qC9Fe6
         f8Dw==
X-Forwarded-Encrypted: i=1; AJvYcCV0osPEBd+iLx5ZAhoHb72avZzsCajAPyGW7EvoL4vihhaZ36c5sVRkQ+ogUS3OmNMOUDQ/2QpZwVSOqMA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy6x/0Q+riBR8bA8Wp+k5WvLXvTrGoN1Vn8/xw3ivV+UK4UNJ6
	v3TpAnWFMulNvOXoe1caVGYlfS1mF6/UOBG7IiTgkCduj8EnD51jqFAyJWSGoZREaa1UQ4eBFv3
	J9NU3LCobqJ5hxBk6J0Sbzmz2v39fWBiV9GErROcg9V19D68ob+Tg84F7/qgyloPKcfI=
X-Gm-Gg: ASbGncvjto5a31gzJjDf1REMS0MafiblyAUSkwZ2mOlwvFIejqj6rrA/j8vvd6sLb8Z
	mxCtuhOP7sGwSA3gWuFfwpcA3beD0UkZIp08Sl2I61xuPl5uGJLTfrnA8cjFKFvjVD9iGZPSQza
	oaFRcgzGze+MyKZ9smYDGyzHyj3Rn6pd4Gex/2vtGeq2xsMISYLE/kitmc3WMSZAcxaXkS/ZVKX
	ugcpA3csN8vdDKvWX8T83xy20GFwhWX2+Ll6qsignhTeByqPnzz93c4c2KE1WoeH3VAYSvkINNv
	n+x0EgeFyb29E3kkmkeYYgNZAoOapOcAJlyq26iHIZDfAGiY3rWEvG8EW3Fc3lG0nLVo2jpaJ7B
	8SVE=
X-Received: by 2002:a05:620a:2981:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7d3f98b41f2mr750042185a.3.1750677394015;
        Mon, 23 Jun 2025 04:16:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErRVlQUFFeGPmGZC/8eoEBmktimYrsxF0ZbBHv0b3VKQG26/vaCmd+0yLc9oLeTHm9CKRZsQ==
X-Received: by 2002:a05:620a:2981:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7d3f98b41f2mr750040085a.3.1750677393639;
        Mon, 23 Jun 2025 04:16:33 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053edc0c8sm702962866b.64.2025.06.23.04.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 04:16:33 -0700 (PDT)
Message-ID: <8997eb52-788b-4264-a302-0fd10008e4e6@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 13:16:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: qcm2290: Add venus video node
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
 <20250623105107.3461661-6-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250623105107.3461661-6-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LOVmQIW9 c=1 sm=1 tr=0 ts=68593792 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=uB77vd0A16Pi4IlZOKoA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: ngeQZnLbK7jJ211HqtPmuDWlO6V19BLR
X-Proofpoint-ORIG-GUID: ngeQZnLbK7jJ211HqtPmuDWlO6V19BLR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2NyBTYWx0ZWRfX3OlwwbO0Q6Mw
 Nc/58q8uIBcIBte0iG7Ip7T9VEvv3xDb+PpMSWXoOdJLYlDzrM40ZACUUsnfrsbguUcXjeefVyK
 +jqw6wmwDwnvJZAhG4VRkGBhjeUQc61BOwZwp5syJEdFx6F/jh0mlr5wOv4gnPpPPRGZFuclS39
 4gXckyngx1dS555r4y952CC+UFqZFM23UtEF95S42YMOKz8rvOcRmt+DhcVkUu0ZYjlP2IPB6le
 tOaXeSl/LKTQc7AxzQYdtOpL4ga5Dm/+iXuXtTAMd3NDV6Tkd6HoDsarEfJ69rVNPNGLmqku7jI
 1Os6lF1CPQsX//gl/zEHJ/bofigO6BTbTxdbsIHgAbgoX75xh/ODaDzmwLwjFQC9PHxK26BjN/3
 I+X2FkBmQnzpYA5dmBBcHwUQheQljNW9tH5WRrWFPSb0UF9GnHCrvZgtm9khTPdKYW0rz4pd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230067

On 6/23/25 12:51 PM, Jorge Ramirez-Ortiz wrote:
> Add DT entries for the qcm2290 venus encoder/decoder.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

[...]

> +		venus: video-codec@5a00000 {
> +			compatible = "qcom,qcm2290-venus";
> +			reg = <0 0x5a00000 0 0xff000>;

the size seems to be 0xf0000 instead

> +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			power-domains = <&gcc GCC_VENUS_GDSC>,
> +					<&gcc GCC_VCODEC0_GDSC>,
> +					<&rpmpd QCM2290_VDDCX>;
> +			power-domain-names = "venus", "vcodec0", "cx";

one per line, please, also below

> +			operating-points-v2 = <&venus_opp_table>;
> +
> +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> +				 <&gcc GCC_VIDEO_AHB_CLK>,

On other platforms, this clock is consumed by videocc

> +				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
> +				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
> +				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
> +				 <&gcc GCC_VCODEC0_AXI_CLK>;
> +			clock-names = "core", "iface", "bus", "throttle",
> +				      "vcodec0_core", "vcodec0_bus";
> +
> +			memory-region = <&pil_video_mem>;
> +			iommus = <&apps_smmu 0x860 0x0>,
> +				 <&apps_smmu 0x880 0x0>,
> +				 <&apps_smmu 0x861 0x04>,
> +				 <&apps_smmu 0x863 0x0>,
> +				 <&apps_smmu 0x804 0xE0>;

lowercase hex is preferred

> +
> +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 0 &bimc SLAVE_EBI1 0>,

for this path: RPM_ALWAYS_TAG> +					<&bimc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;

for this one: RPM_ACTIVE_TAG

> +			interconnect-names = "video-mem", "cpu-cfg";
> +
> +			venus_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +				opp-133000000 {

please add a newline before the subnode

Konrad
