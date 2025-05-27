Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE43A139E
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748352542; cv=none; b=QuDq+gER0aN5DdmcvpyOS+i8jxVxXJkicaYgGMAQKCGF6Y3qraGBtVslTUsvLrFsGbE9ktx19cP2SkLhzRYT2GfrrvO86dCugaqYT6IdwbqGunp+1a8Kg8nouGkpAodHi+4Vb65gzehanj0o0DRCF0I8dJ7AWGS26kHmiGrSx0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748352542; c=relaxed/simple;
	bh=3khYD8/zBqFq/sQrnyUXf1pB3G+HW6cVj4xlQhf6Y04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kVmpaTu8A7HAskukPv5pgf/Afct4Fybh65D/ETqHIMzpioFHaHL2z/JBkPF5UVNeZUF3cC02lLQmHmMNKUnHjmJwabzMifG17LLc8FAc2MSEcowzKEKYxDltZMFi4Fm8PInw4HXJxomCY0ybjLuHPM/lTa/Cph6wcxTqjRZ94kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NExP91jZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NExP91jZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R5FTYd003981
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cgsUUCfT9fW6BhZpiKOs3CtiiVh2raWuBuMflrGhC6k=; b=NExP91jZlbHeoIdM
	SkYlV8KtSUr9Fjy5dRuDiRIfKv2kB3SIUaKXq92dCGMnH6erv4k1fUXXiV/hr87A
	QHbmdR3+jEjAZzbHfMjU6xdJh0KA67ivtwJLOK7iqIeBJeH1GjTbd8Z9qAOb7Ua6
	lAB4zOqvXvTVThzmz4W+wthAsYpO+SWJiznznYbJVwy4/pXKee04v1KTH4RbyK6n
	IBBpA/KeHf4SpCBI2Fkg4xpVekaRV6aU3uNfoxOSH4OUnTG4gx4+9V+2W8T9445+
	4GBimdYxqakJ7KE7IGMMNNEnprVTuNk8xAk4BvFWGBKm0/MCBLv7ajMidM6KgpX0
	sCyf5A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ejxy40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:28:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476a4a83106so4024351cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748352538; x=1748957338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cgsUUCfT9fW6BhZpiKOs3CtiiVh2raWuBuMflrGhC6k=;
        b=gzCsAmc43NE0pa+OkGO4acByJuts0sdJy80mpAveNryeWk9VIa4BmAI8CIJQ/5jaiK
         14ppls0h+37+OSFxwjhvKaB6FOP7tgo5Z2VOyMrpY+nPuBWorq6rM5d6tonpc3GySQ6e
         I0A0qDXHA5/ICKT2o+MZLxPKZcBfT+cV9tdpXWOHWjoxJRpXvDfEMbPEGzJvphQxdAaY
         1L2qQfmgGCqymBr3A2tVxFOhNz3C6UtFUCCrJh4i09hSmwMPHv+PYBowVFm1ao8J0cdw
         JKDwVBLrLvlLB5R0Ze798GhFIYchemZH2TtL/ZiXf0S9s/tAre+Mxep92BBcY5b/Nmjc
         2wdg==
X-Forwarded-Encrypted: i=1; AJvYcCWjiB5hpAYI53w3+MkabjpOtfh3/ScLAhnkbAzpzLdtm6iLgEDnwgLYpsIwOLRGc3UZH5BXyfjrVkPa+bk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcwdscCgJ5r51G4KoiD7YKNZRE3YC3eVIq5a2JkU8vZsGgxU1E
	Ce0DLEUYkbPMakgyQIS69MqEQL8zN8Frdan/7qOptHFpDSuHx63eXJ9tNDLL+M4tIK1+SJomc/L
	iu91TwMMVg11+b5qm3yZELojWYpFuU4Ml+2sHO4d/RiuNWV1uYo5QRKsW1JJig1xGTzY=
X-Gm-Gg: ASbGnctu09BqFZao4s9YDFRJH28vIAzEoTgjtZSBULm9sgNIrXsV2egIEhwlPHtTOzg
	MEisXHcZzEVlPooPs76OwimvhAdoDGPnA54w1hvBLLRkllLPZS2+h6uH8BIG/zTl+vSZfK3JxH3
	sqManPLbF7wTgtUOydrfrWbKGz6VP/hMjAH/OwLMgMJ3lY+uljphgxKnRoNgWmtVbYrDG3mCn67
	cEAL778sb2u6e1SZifRapsutXZRokalC63viB2hr4m7M0tt6heXHWo6Mse/KkJGl8X2sLLUfYU+
	c3JgZoJtmB/y8uK1jU4lfLdP6CpHfKjs12ZDQ5RcONGfGrB1caMeMGUG02hvY3qJJA==
X-Received: by 2002:ac8:5803:0:b0:474:e213:7482 with SMTP id d75a77b69052e-49f47fd1738mr71549621cf.11.1748352538539;
        Tue, 27 May 2025 06:28:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMJ3R4Af/j4fl+ul5t+vzSQyZol1IzH3ckYdxMSY4nI1xsxiTn9yK+8AiDLdXNE2Izn4X2UA==
X-Received: by 2002:ac8:5803:0:b0:474:e213:7482 with SMTP id d75a77b69052e-49f47fd1738mr71549411cf.11.1748352538036;
        Tue, 27 May 2025 06:28:58 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06cc3asm1854732666b.39.2025.05.27.06.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 06:28:57 -0700 (PDT)
Message-ID: <ea0c075d-85dc-469f-87b4-66834e3ff89e@oss.qualcomm.com>
Date: Tue, 27 May 2025 15:28:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] arm64: dts: qcom: sa8775p: Add gpr node
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250525155356.2081362-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250525155356.2081362-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250525155356.2081362-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=6835be1b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=AD0RaYQsuEhH26DN5A0A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: EztgWm0yTNp-2QiAwW7gqeOMR_3X5iCc
X-Proofpoint-GUID: EztgWm0yTNp-2QiAwW7gqeOMR_3X5iCc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDExMCBTYWx0ZWRfX+xbaZAlufMjC
 1Rd6fYpeaatJ8ANaSpKmZ/8CsUe542RB6b+VEBGdwXT6KGFYoxmCw5e1cb00ln/ND3IwPNd034v
 9jsIMAlH4zDtHoZ+FVpRoY2dYY+f57sMhuYNHm8voiPdzuHTxXJhLk8Nxmg6OAKegjKTdfrZYZM
 fil40hPQeB1N9WhL3lEvUuthEt8w1NYuhdhQSuzLiAD+8YONx03kdQFwD8jzone9Clxkt/wTSpg
 +TdgiLoirrSBWDNMW92+ckTNrWNJQNtOK5x1Gz0dPYSH5iSu/DUoeNzdnVAmmCNeKeJcYSXIm67
 fKwcVp8q3v8FRDW7fiPtT4whzKW1o5b+7Lk184hhFNgUDIJIxyrXE0klvvlB1KrCJLf8Bf0HGfv
 CJz0/kvc7FBWJbypVACdXv68H2ISI5opU8u+pyXrSokUy7GTTzEe1Lzn2zU3YmYdFBXmxIh3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270110

On 5/25/25 5:53 PM, Mohammad Rafi Shaik wrote:
> Add GPR(Generic Pack router) node along with
> APM(Audio Process Manager) and PRM(Proxy resource
> Manager) audio services.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 40 +++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 45f536633f64..187a59e29f59 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/soc/qcom,gpr.h>
>  #include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
> @@ -6109,6 +6110,45 @@ compute-cb@5 {
>  						dma-coherent;
>  					};
>  				};
> +
> +				gpr {
> +					compatible = "qcom,gpr";
> +					qcom,glink-channels = "adsp_apps";
> +					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
> +					qcom,intents = <512 20>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					q6apm: service@1 {
> +						compatible = "qcom,q6apm";
> +						reg = <GPR_APM_MODULE_IID>;
> +						#sound-dai-cells = <0>;
> +						qcom,protection-domain = "avs/audio",
> +									 "msm/adsp/audio_pd";
> +
> +						q6apmdai: dais {
> +							compatible = "qcom,q6apm-dais";
> +							iommus = <&apps_smmu 0x3001 0x0>;
> +						};
> +
> +						q6apmbedai: bedais {
> +							compatible = "qcom,q6apm-lpass-dais";
> +							#sound-dai-cells = <1>;
> +						};

'bedais' < 'dais'

othewrise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
