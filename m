Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66F925E44D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857554; cv=none; b=azHuiSVnzoVpPeINwHX73Fwps0maTszJ2teEdMm3lqgyBWNSHtm3UjIyt76BXKfovFuA4tH66gXXMpnGbjA8ZMaQHB6SOf0U2xmSmLHQUbVll83twJ/speyHNEwhLLn6Z7N1HAP1A+A4OcEQnWr8cDa/wWo7vq/ZXgH70UAyO+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857554; c=relaxed/simple;
	bh=OLbZLCeEIh/QhsKvBR05z93Lz887to7p39N5x/NgpCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HK8jOqpw1S/I5ulYBjPHSh4tVFNbP0iEFClw0YKMLrxhH3ljIJm/cVCaNKWwNmr/mbZH36LiVpCEULTwshewAkVO0c4RCh1SlYHDfbJ3sJJSzKxczCMLtNhikdNRLXGdb3je2SKkfmlL9FI0pUD81m5Sn7KGFve+STiBJYOUBwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=leSlgYCU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="leSlgYCU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAL9lN001286
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6eQaxjKeabn3poKnIk9ut7d7cX6un1MCActTxh/vj5s=; b=leSlgYCU4S2q3GBB
	1lbhTVp292Jsbnzfu0mSgY8HM9o8ujQDXR2hA0Lr4FXdf1xNMALD5mzetNA+vDkc
	ymcLd2JH60xEunoIq19CPr02YjJgwkxcCdMy6HUtmBXUv2GEr5JFDwR8XG0iaiiB
	XWrw2I0lN3ZJHcg8MLfqhdk+QpWN3gk/vxZhYvrfv+7u+0HCK2NOZPNx0RS9vt8T
	5o7CFjYS4psQ1pzk01QmWvB38mo8lNG651C612lyekzXDTNq8wD3d+OLQEKcXObU
	FB5qcVE3hteNuy6OfEL3hG2RgLEpZP3/sVjJ3bk58UwNwvqKL4LdBEqEddJntp7k
	pl3bKw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7td9uny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:19:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a6f59d5ac6so15031481cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750857550; x=1751462350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6eQaxjKeabn3poKnIk9ut7d7cX6un1MCActTxh/vj5s=;
        b=h1dwteXh1HwPj9SsUwbfeIWHIRHsijV7XOGbWbO7zA8XJGRZ98Vc3nCVT9ubNoURl2
         7oh4cj4z4Y/IFw68bSl2tWHjd+HZC2TzJ+1TDcydCQg1zRSmxxbhYzUJTc2f08r7Jj9/
         QihZ9S2loRnsz1CgYBsD8UMxLUv6HzNKhXU4sz+9ih7YND04fr5T3b6hytwzcldm/UVH
         RCrxfudhBITyI3xzMkiZX9GrqN8/sUDC0uh8QGJmVNnbn3ScPp9qinLiZW7v/t/O6QtC
         XQ1/MJSWguEQBPUbTCL9t2C0ZtgBt+yOZIYKLiJ4SWf9FMV1f4qlassGkVQxQg97GQHa
         r4AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT3AKnfuJUjtxGA0ZURAYMoVY/Lc4VETVnFDIfpxjB7XI2y+3t6/VMkXAnyamg6ZPmryZmW6YYxDFOy7g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4438WXr8oHzPO5uvDaAk11Ci163e2I9ICpL4P9amXsAErupI4
	8aGXmv94WwxZUJerrMEf6rqDeGCEeG3vmBJW+APl54hCL3HvB88txPfGBIAdbG/T0bYsqQrJ5Ht
	N9JPrx1u0OdWG/AuzmDZMbPb1n5bLMZzmot9xInlXDEvyZvr67aHjMCZ33sHsrck30g8=
X-Gm-Gg: ASbGnctRGrsUL/OBurrzQAJRpyKftPDPCuUeEIhA8JZsdnxwiB+0ORdMLnZjUEWERcz
	lKprdkiXNgqmxomGa5jyfw//KFedTRzAPFajoddfQPiAgxat5XiHBWEIDnMS7wCop5hmGBIhAw5
	u0OCSHLBtnZYn4KR9sT9C947jOdbAS3kw0uU1TUG94cFhGCyoK3kIXa9nawSq3zZMNSCihdq0DS
	Dlf90pKK3Dy4VPDdeBavZyhS6OfdZmdHvcj569AtPdYjpDyuRhp1IyOQh36EjfoM/ItfPdVdtQA
	/mkdjrKJCmxunBUnDhhUch91z9ELVtNRBRY39mq1us4IfRgGMHP+Bb8rjy/f7nk+5o5RTZ2ecbh
	Nx4U=
X-Received: by 2002:a05:620a:8801:b0:7d3:cf9b:511f with SMTP id af79cd13be357-7d4296eabdemr154347485a.5.1750857550484;
        Wed, 25 Jun 2025 06:19:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqGtKUmkLUVvMQx5KRJ0CRLAplizpPsb2y5iNrRAnX06UrCQE5yCFeuIbo7mZ8pru90VrR1g==
X-Received: by 2002:a05:620a:8801:b0:7d3:cf9b:511f with SMTP id af79cd13be357-7d4296eabdemr154344985a.5.1750857550072;
        Wed, 25 Jun 2025 06:19:10 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c3ca7b8cbsm1919553a12.5.2025.06.25.06.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 06:19:09 -0700 (PDT)
Message-ID: <50fd7271-5311-475d-91ff-03c3c593866f@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 15:19:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add PMIV0104 PMIC
To: Luca Weiss <luca.weiss@fairphone.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
 <20250625-sm7635-pmiv0104-v1-4-68d287c4b630@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-pmiv0104-v1-4-68d287c4b630@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685bf74f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=gG0EGFSrpznu9jIhvzsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA5NyBTYWx0ZWRfX662tuPWgRRpe
 hc/oR3FpcSz90oSnL7o0euXV07ZB/y7CgTmXSAiHczkCmNVXzNqdnbSAUvBAUbaIaKyKA25zFO9
 qklfuoUK2PTN66gZnF01B8WkP3cbqvDJAQBTDp5UuRYqeBdUCsQ5QC3WKfG8Y4HHeFHULIY+Kvi
 V+00a0tOy73q6ixNmpTRjBp/9GYAlJIPCKhEnisx8uj7PO0VRLkwKgaAnx7vh6GbQ2uMeSjktBp
 XZS6nA1J0OdbYgv+dHIhyisMexyiZKCN+8XkBki6UCOVmQWfKQpFDyfuRHanWlObsF3phO8ZBGG
 CLBhAyDLqW5XJpdaSYdbaJmJUy7JP1y/GBhuEpym5PJhJDt0lXFzgP2VbsiU3/ZGzoYwBTgiQp5
 YjhqNTE6E/stGN8yHwTt78AFUqU203GF7yEjSSTw5+UpZC0zMOJqfIc+2FQhK5wKiT8nZwj9
X-Proofpoint-GUID: ootEA46B2e5C04YyBGEShpQCy_EuFd3R
X-Proofpoint-ORIG-GUID: ootEA46B2e5C04YyBGEShpQCy_EuFd3R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250097

On 6/25/25 11:18 AM, Luca Weiss wrote:
> Add a dts for the PMIC used e.g. with SM7635 devices.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/pmiv0104.dtsi | 63 ++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmiv0104.dtsi b/arch/arm64/boot/dts/qcom/pmiv0104.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..04d929db76f409c49c47ef0147a3de568006973a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pmiv0104.dtsi
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +/ {
> +	thermal-zones {
> +		pmiv0104-thermal {
> +			polling-delay-passive = <100>;
> +
> +			thermal-sensors = <&pmiv0104_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};

Please also include a 145C critical trip, which is probably the
most important one

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
