Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EA32749E3
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 19:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750188192; cv=none; b=CeGUQT1iW+EDXZvfxTg0ULu31Tr1xbh7eWbMh746NjTXTXfQNdh9wr5dIxZfeRA0XEZdQ+mBd1odNoeG7/o5y1+GJp4P/l5ogVgVhVHfmLNgvpBL/I21G3/MbKVLCK6aTu3dLxXlQyg9CJhU5L1nxkwiDCPEhnZWcx1yAuqLZCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750188192; c=relaxed/simple;
	bh=MognockFkcOcnIkzl6aBSdw4zvGQ2TZZ9c6TgXrj9X0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TTfikbfuCPLsO+Ffwn1lia9QLxaMfJ2meStl1nYSv4gyJsv6Dsh1rCjvAIlJWSfYGStqBtGVcLve7+v5ALxAS6SSwg+c6+IE1nvjf/NWb+RdtlTJei0WrmrtM2zBmrRTCT78lmpcZfo7bzkGDTEON3ekPU8aOpdFys3BtDehyWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E5rz0Dk7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E5rz0Dk7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HJDTN6002291
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 19:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LdzPHGOIKz6OedKEjfrT+dQssvLIdj/9tY0eYX+UX7A=; b=E5rz0Dk7OSeCVzLx
	h5/deRqpIuEEeowUpsWk9y+bYSYSnmr5N4AWBVRLez8WLzBe4g1T/sG8xo4F2v+6
	uSQxI8t8Dl1bD6Tsw+tBhZokQmYdgu04WUavzNUAJIBrdXQsCMJ4To7TlW9/nrSR
	tllmnvY//GLJIjcGB1IJtdTcqLqPbzsk8zOqjSQ3Xv5azlk9mPP6FzEsDJ9tPbig
	eJBVCiJTY24SX2f569sxTXA2iR4oYT1eroSsoWmTFl2HcM3ZR+0xlhD0FvG/nh1w
	fbIy1C0gdztrLOVrrGDfWQt3/dRvxq7woVaPa0G7eeCiJfIA4F0jUX8iHxuhXVrX
	040Bvw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47akuwcyrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 19:23:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d21080c26fso166388285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750188189; x=1750792989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LdzPHGOIKz6OedKEjfrT+dQssvLIdj/9tY0eYX+UX7A=;
        b=JbP6Tn+lgfcqiT8H+AwvSc2HK8GV+qcmh3O3P/XKjhemissNs2PEqeKhGsTmsd+oRW
         vENlTx/XT9H2wIpu/xZbe82fd76uUlglv0AKW3HFTiEas19ZcKEAYCl/lazi9dqwJNhX
         /cnQagMud8l9y95N4Klk9Py+XSC//OXDjoXUtRDHsaIVecY70vu7x3HZqbjutUEKGEA4
         HioTjU8jFMNQHN7KS1RPd+H5zHPvBKYE4hyWnL1pbqBB8pUZTYs9np1uyTHAQb8Ah66U
         DYUju/ZQglL8CuUCQx/R3ts9ynVSWCqr5HoZF1PG4UpZLpn6Cvu+bTcBkZnQpqitZbKK
         9Ftg==
X-Forwarded-Encrypted: i=1; AJvYcCXDWa9FWZ9v+r5ioJr1zt8Viwplhp9juK9JTuSdAv7YwyUDPJnU5l5K6Kwhctw5tWN14bGUbEGKXOw2eo8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5M4adqOTiU9yVzHHw+HqR4UR+6agx9BHEzcW2qHkdy/l8sudU
	dbjdmgDfIx/rgGwQIWwjCpEMz8cobMmwuLuD96eRcLTwduNG1BnmKftBKAV8nU2Rz9Aqj2+XZZ5
	yo2VAZ9MF6kkiIBqjEQ6SCcLdgfcAS5REVGXiqhh2q18ViU8PTA7ebS4yDkAVT4CF2cE=
X-Gm-Gg: ASbGncuVmYKm1GALTG8yDxcazpCUxh0mc9Y8nHdRhJPSJFqveI60vgZ0h3JeJy2YjHu
	NPwl5Gazbdgg+E8gasW5wdY2ptoyvDnnsebuX12jU3T1viAPfrj9oEXwFdZrRSdGK4VPbNmS/7L
	uGE/oXB3kWSl35+yLoN1vyzVr4OBLTRjYmPxLnn+qI/EG6SumoDKFMA5DaUDo3/cdx36n3tgjA5
	FiYjBQKXOA6Bdu+uxpVQccy4TUe0rUSCJLzhtm8AjGQNV+tzKmTHFfWPze/l+UvQDGaHES0Iz8J
	hjUVPVDcX+gYlV0h4qV47L+fntOSg+0mVy0dys7eXoq6FiFHiRMHWdKLrCFSohcZp9fbJV0RJiX
	IxyU=
X-Received: by 2002:a05:620a:1727:b0:7c7:9d87:9e2 with SMTP id af79cd13be357-7d3ddfc335fmr269471085a.12.1750188188666;
        Tue, 17 Jun 2025 12:23:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0yvPjKPU38lsTFY4yNQOSMkrjfXE9YWA0WVDxHRlxx4vA+NZcrpEX0zx8IWsyvawWlt53nQ==
X-Received: by 2002:a05:620a:1727:b0:7c7:9d87:9e2 with SMTP id af79cd13be357-7d3ddfc335fmr269468285a.12.1750188188108;
        Tue, 17 Jun 2025 12:23:08 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88feb23sm914603466b.96.2025.06.17.12.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 12:23:07 -0700 (PDT)
Message-ID: <d23b8cf0-1ba0-45f6-b06b-f7a862bae457@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 21:23:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcs8300: Add EPSS l3 interconnect
 provider node
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Mike Tiption <mdtipton@quicinc.com>, Sibi Sankar
 <quic_sibis@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250617090651.55-1-raviteja.laggyshetty@oss.qualcomm.com>
 <20250617090651.55-4-raviteja.laggyshetty@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250617090651.55-4-raviteja.laggyshetty@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bfujdCc_pmWQncFV8toRno9e_TxbuptO
X-Authority-Analysis: v=2.4 cv=He0UTjE8 c=1 sm=1 tr=0 ts=6851c09e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=LJL_6YULmAKA-UV3y8AA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: bfujdCc_pmWQncFV8toRno9e_TxbuptO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE1NSBTYWx0ZWRfX4pesE0iupym7
 llMz2T32CFkS1gHk/Qx3z+K9hdEj93sQbqcpgqcbXJeaPQw9P+FUsiY1/gNgYjby9RBIPQPwcIM
 +t/Fp4gQN711qiUQDwQHnbhUjxnzk6LJ40g9lcsE+TbKt6EayrJGuQ2OF8lN4fp+O8vKGDRrpT8
 QOK+wOnnqhOisAGWfv7D3LrnJOV5moW14OdJuvC55W/ZCi5c8MqaPVKF025u4EOyuZ9YlrWbM8R
 uBEkqSRBqwT/phZ1FmPDPRl/tZ7Hqeq+Os9TWgwf5WxSk6SuMtrfkdt5vl1A35KiJBTvJXOy+3n
 ufpydQdXgvjmW14VojHoPd1gyioedpWepyzy09zcD3dtFlm3QvidW2D/QNyjwHRiZwAiQmNRbaM
 ynb5PG0eXTf9XiyNx8usULoJAP1JDwEL6ihZeq94hrGWnJgtnjE0sifdJc1HkKXU6Q/RDAAZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170155

On 6/17/25 11:06 AM, Raviteja Laggyshetty wrote:
> Add Epoch Subsystem (EPSS) L3 interconnect provider node for QCS8300 SoC.
> 
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 7ada029c32c1..e056b3af21d5 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -12,6 +12,7 @@
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
> +#include <dt-bindings/interconnect/qcom,osm-l3.h>
>  #include <dt-bindings/interconnect/qcom,qcs8300-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> @@ -5433,6 +5434,14 @@ rpmhpd_opp_turbo_l1: opp-9 {
>  			};
>  		};
>  
> +		epss_l3_cl0: interconnect@18590000 {
> +			compatible = "qcom,qcs8300-epss-l3", "qcom,epss-l3";
> +				reg = <0x0 0x18590000 0x0 0x1000>;
> +				clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
> +				clock-names = "xo", "alternate";

Very odd indentation

You should also immediately bind these providers to something,
otherwise sync_state will happily take them to whatever minimum
rate the hardware allows, making things worse

Konrad

