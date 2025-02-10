Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF9F2580E9
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204663; cv=none; b=Mkh95CqzaCFKVkDwg2cf3jrRFUzw8pVk9PIvAA9A6OMJybYsxR4lSd6ZjTP3LV3tt0SQlHswqb+zH48emLtBY/0NtqFO/NeQyVoED55kdEU84ws1Fx74Qyu/HdQLmgSgOliaC1BaRViQxQ6bjPTjJZgC21Wzty7f5dcIoPc+wbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204663; c=relaxed/simple;
	bh=p9GU2HZFYQRC26x82m2zYIxg+L6koIe5ealUvvav5+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SgpuDljejRC+we2+P0VsNUFFT9uA/S9H62hYWgtkiFrcwvJan6UmtrgcCwn/oQljzapzNQeoBOEfOp5D7ACFgj3cMj/UJ7cVDiHmjZa6RlrnkToMZX6GNhXdxgZ4k6lOqe22pb1RJIZa39Gw8uSIoO8fctqN/zdpVoe9uS/hP/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AaSGZWVQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AaSGZWVQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9lFVW030071
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yzK+XafR1dLKkE9l58nuGRPb/TFcp6XZmfgiKBEVSbU=; b=AaSGZWVQ1FXIKoGr
	yTN8HYK5MwMx/nhz0ienVcZ/5YdZBkFKP1XeAEmvjKwzNC30miquduvOc/AG9fDI
	XoXDAl6liD9x+oUOuYn5ZJ+kZhX16Z3hfFv0N55MNS7jIGMLxt3QIKw8d1XIKQCU
	JpnqfSTlam3QUDTkrh3dd3UuXdIYSMDlmky5z9odztqQTaxLhioSq0zl/jlI/jlG
	dQa0CO0PUhtFbv3eMx3ZZGiv0tcen60n5s3vC0xZBhOxutZ/pIax+OYvD/HWO89u
	wGv2SITZRh/z6350q/Ud4M9lxQifpVr5PdW080qZdmK1+voiJ/0xsmrmz4uZjfrp
	N4V9rA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dqcybj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:24:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-46e4842dbd0so13436631cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:24:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739204659; x=1739809459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yzK+XafR1dLKkE9l58nuGRPb/TFcp6XZmfgiKBEVSbU=;
        b=Vu8vxOSJccM/rEtnlKW0lVmIlj4ADzcB8gbMnOkesnEhZmFXL8ulrHeUJVfVvlJMWp
         CaoeIQnEBHrz+gHo2sMiLENEYfbiyGYGKNBoyBcYPAbTakDdKWhtjthoRSnkcLQf26ip
         6oruQOTq7jQgXuJDZYVoXRMhlgMPaotPR70a6tlsXUYHiO/N/xysCS7skQT82bxNacqg
         byFstV7QreYCQsgeKrMWw3x94LcKBJWzPtLnts3qTC/1jB0yWAMGAnGaFPfdVUTQQAdk
         PFD7kclkWZTimE0VOj7XtxEYAreNeKpauERty2Kf8hMTDvxCrXDNa6S68pqVQ+iO3dZ3
         21Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVbaretDuaIUaJdWz96N6SRzXVNQ2MftKJg/8n/hc1mhBRG9YYviaPIBYOhscyJ31KTq54HzhZIXrdZqeo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPxrpGcH0TyVk7zbev+L7L6TQ6lprltWw4aGFvW0uS0kxDOG50
	XHodRqjwSBFt8sCTqzGC/tNQGepiZLcd6LoG6rpeCmUz/vHNdOC/Z+Flj50ToaawbIMouSPlnDV
	Ea/wdo37OnR9An7qUVh5s+obaZ/EN3lPWYRzQxAzpy5daZ7KzCF6h0D1WUoS5raU=
X-Gm-Gg: ASbGncuBe4nNSwzsQdMlLQb2T9RXXeq+gv4XZ9KzqUNOv7CCmq8Bqot1viAeIcfnt8V
	9gTE58LXF+0oIgckwut23cjzxVkmu4y49dpK0gliWiNKo2G5h0Qn5Zdu40DD7qMSxKgEVhVJ4eY
	3s1BJatdvn+vGP5O6bxpmagf78qruCeQfgcbevMBumbrp0WurkqOpH/iKDKAm9hI8qzvCq3NZOt
	jHQDOS4B1vDI6yyfcqV81JJLtnz51T6qo/q4VQwBGtgVkq3ady4Os+yj1MbEWU2OTQci5QOJ2Yt
	REUPJ8yRofXR03ScKCMd7IrHS3jlw0c66kzLedPMNOwlDDX06dNYXGTn6Jk=
X-Received: by 2002:a05:622a:4d4a:b0:471:89e5:5154 with SMTP id d75a77b69052e-47189e55396mr34786501cf.12.1739204659299;
        Mon, 10 Feb 2025 08:24:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkgtHBUXIyvQdHCarC2oJoyIonRZjZKrb1nkE9BmMXrJqor6thbYPPKTvG7KOFoDedrCs9Nw==
X-Received: by 2002:a05:622a:4d4a:b0:471:89e5:5154 with SMTP id d75a77b69052e-47189e55396mr34786361cf.12.1739204658973;
        Mon, 10 Feb 2025 08:24:18 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f491c6sm906879866b.15.2025.02.10.08.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 08:24:18 -0800 (PST)
Message-ID: <0e061750-7640-496f-9cd1-1ff044192fd7@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 17:24:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs8300-ride: enable WLAN on
 qcs8300-ride
To: Stone Zhang <quic_stonez@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_miaoqing@quicinc.com,
        quic_zhichen@quicinc.com, quic_yuzha@quicinc.com
References: <20250210062910.3618336-1-quic_stonez@quicinc.com>
 <20250210062910.3618336-3-quic_stonez@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250210062910.3618336-3-quic_stonez@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6VslA4mS3wiqVewtWJzajTmfTdGtL2uS
X-Proofpoint-ORIG-GUID: 6VslA4mS3wiqVewtWJzajTmfTdGtL2uS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502100134

On 10.02.2025 7:29 AM, Stone Zhang wrote:
> Enable WLAN on qcs8300-ride by adding a node for the PMU module
> of the WCN6855 and assigning its LDO power outputs to the existing
> WiFi module.
> 
> Signed-off-by: Stone Zhang <quic_stonez@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 96 +++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> index c4c0db6f8b31..84c9e74ea4c9 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -22,6 +22,76 @@ aliases {
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	vreg_conn_1p8: vreg_conn_1p8 {

DTS coding style forbids underscores in node names, use hyphens instead.

Please see similar changes for e.g. sm8650 boards.
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_conn_1p8";
> +		startup-delay-us = <4000>;
> +		enable-active-high;
> +		gpio = <&pmm8650au_1_gpios 4 GPIO_ACTIVE_HIGH>;

It would be good to provide the voltage numbers here via
regulator-min/max-microvolt

> +	};
> +
> +	vreg_conn_pa: vreg_conn_pa {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_conn_pa";
> +		startup-delay-us = <4000>;
> +		enable-active-high;
> +		gpio = <&pmm8650au_1_gpios 6 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	wcn6855-pmu {
> +		compatible = "qcom,wcn6855-pmu";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wlan_en_state>;

property-n
property-names

please

> +	wlan_en_state: wlan-en-state {
> +		pins = "gpio54";
> +		function = "normal";
> +		output-low;
> +		bias-pull-up;
> +	};
>  };
>  
>  &uart7 {
