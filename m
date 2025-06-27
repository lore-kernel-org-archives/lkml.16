Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D282E8888
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751037263; cv=none; b=sMk+bO2qzPxU+fS4gxHZWy+rRoio19z+pi6O6YZGk6sf9PxnGgTbU7GcaNvVwuOGfvOBGRx6mmrY/bDjJp34NwXmV0f+jzBYcxoWMR+K8MNZbo2IL3gtFRbsYnSMYn3FhipB8myHnGbmp87hU7W3VTW27g5Ik6R7kvkYz7EuOFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751037263; c=relaxed/simple;
	bh=55A/Hin7oai8/MceYjyk8/dYJTGhYwWWg5y51ljPaLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AvOUeL55ttHvgC9xjKDjYR7AfZm8Cj2/kAjCwceXFzDdyy0u6RpVKkhUiqKbCtPL4L14pCkQ+SL6uOK2g5xM9Qi8r5ck0F0NHZ1F3RMCOlMV26SQ6AnMwECUo06IxFEHjz2laDvfBAYwvR3STBWEP1s1j4X9RKlv7ju0IYtrwi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LFhFY5Ug; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LFhFY5Ug"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBlmAx027653
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x6M5X4q5fSdw7OQCIrFZRNAHF8rjXm5Y3tv67PHp4y4=; b=LFhFY5UgnOfTIWl2
	wdlKdNkX+nxcGE9NLmss0yVp8+DLHZyKRknijmBZilSS6xbH2mbAQnDYBk2xMdZ5
	5O1TdWCZ9c8FQmSKLDU4PpUIvOGjDG5IaA7kz0MNAiNJkrkp3yqNNpxu/m3kTlXq
	ZWb0j1soWqBfiIiynWJlYyA4a9Rtw5sSW1980kRzh1Zsw5GCpYEjDls/YBW6WDDQ
	jCzP9d3RBVr07wzMBZWYa3kh24aELIgwOMuAZTTjNR5XqHiLVUxgZVahwKb/8wj3
	7ZiIcVL59RzpTqbtsrD04YHcIJUWl5Os5XIRF4oC0V9rqeRSSif7LAXTRsemIC7f
	CBsIIQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26hnv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:14:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d097083cc3so48470085a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751037260; x=1751642060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x6M5X4q5fSdw7OQCIrFZRNAHF8rjXm5Y3tv67PHp4y4=;
        b=G5QpUTwITpfY48Z8ZwaMPoazevhfC0pGKLwy3uiKBwrpfDZ0q204Hk52MPB6x/qo0z
         /WlNg5PRd7Tb2GCFvLQQ8bVx8J2vBw9/zn3Jx6N+0OssAjF5rhL/e6JjbXKroSF2QqO2
         w6S+7H2eKfaWSpXtouFI0/NAZ0m+oWdcLtr88uDVN5mf1dM1R9dWtjZvjOGl1orI24O+
         0QF/UKr9MkMUT87ipEx9Vby/Rf1yHgczWwhzV8bN3SJs6Pb2goCHsi6MpulPiWIu4uco
         WXEHhRxVFi0bWWANgb/WRK1j5dLOjpN2uK+tjmY4qPpLuSVJmvkXR+ckmycQzkn9HeB8
         76xg==
X-Forwarded-Encrypted: i=1; AJvYcCUUww5SvyMi7M/egl2XcqG8E2h85mbPZ70aDbZR4QpIejtZGXTfm0q63kSPSEHoe40/En5Kc2iK6U7sPyo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi4jZAKhKIfaBdZAeYm/XAeMzb70bXOCDPCZ5a67nvfQdX5T+w
	Muym5+9bO2xQTrRZVm1c4hMapS/ZylqqFwuRCmM4Z6djjjvC0l+teM5GN182d7kZeZTxRVn78Jh
	oqjiIDbpvR+ArnUnVAM/QvF3gMG08qLMXodIU0+OxfxQ5aD/4raI2nnPGhB6brDM9e5o=
X-Gm-Gg: ASbGncu5C+mUR4pJ5WdylZuBEoSh5g97iE3TrF3WB22JexwHIKBsKBDgfnKP0NK3FFS
	xnpDHl/4cDUKD+R6CRCpcNlNPDsJpK7v49weAnjkDKMORJbkIyaVKJn+IBNTmkstPZ78IrWxMol
	Zgg4hY6ZyMmpYVgzEe28t8iY4+nSIOwLSyiDq++cP95D9W6aSlUz3Tp62bmVUUGqHnrsW+7M37T
	ok7mcmYnEMuKhfA8Gv7IBNctaI8iLB1QJDkA9IAqWgRzTCJ/CRexbL2czLPp6kp/Jh1CK7m0BZd
	C11DRGBz2OrS9VH9WJzFLtzfBuMlq4/8KUnIIZvfdPRL9epnvjUYukMM9csH2CPd1py0GpM/xT6
	mdGI=
X-Received: by 2002:a05:620a:2887:b0:7d4:4353:880 with SMTP id af79cd13be357-7d44396f846mr211883385a.6.1751037260215;
        Fri, 27 Jun 2025 08:14:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6WBdJrvigCf2nGDYvaDd8CpQNSHPmJZBKggbxVz8mgd8mo0k8HFU87PzhkUBjRaat2QHU0g==
X-Received: by 2002:a05:620a:2887:b0:7d4:4353:880 with SMTP id af79cd13be357-7d44396f846mr211881785a.6.1751037259826;
        Fri, 27 Jun 2025 08:14:19 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca2095sm138790866b.162.2025.06.27.08.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:14:19 -0700 (PDT)
Message-ID: <29eced87-08c6-471c-971a-7a7882388dde@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 17:14:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: qcs615: Enable TSENS support for
 QCS615 SoC
To: Gaurav Kohli <quic_gkohli@quicinc.com>, amitk@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com
References: <20250625043626.2743155-1-quic_gkohli@quicinc.com>
 <20250625043626.2743155-3-quic_gkohli@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625043626.2743155-3-quic_gkohli@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyNCBTYWx0ZWRfX9Tpp5ERtk9Ti
 aW2k6UYcW4IN7kzgQ4i5QlTpBh7kE1pjjhGAEfdE+EOoFYBETDSUw0ztD70Tq6S1Ayz99iX+RFh
 t4oQl2nljIZYClzy6PQySEP7aiJ8Th0P0J3JWStNsOu6tW5Wnpk2HOogDvrW2v0Lu19F8+CLPBF
 2f8h7V6UbR+TxEOT15vFPINnJejkqdYQrsK5jWWevVeGzALo5blhJjbAC0LCPrF6f/hay4f4f4f
 ZQ8Y2y5oEd67VLSvxE8pPhr5uEAN9UmFOOGCTq/DUgej4yVOnZDglwoDzH4kWwy4OV2J77udeA7
 fzguhW4GM9/PmrNiTL4NJ18h7ew3DyUWBB2A3TgZWgncD+B6B17+Genvnf01f9Lz4922zHiewOt
 qvHwq/SqARodOcXxSEdabnjU/k5BGfTY+PqgvEWj3sRaws5hI3CtzyZpvPbVr7AzxK6gObPR
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685eb54d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=GSS0VzHe2Y3C4L18hMQA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2-wYIPP68zH_hGpKW3tKW4YzZjWvYLes
X-Proofpoint-ORIG-GUID: 2-wYIPP68zH_hGpKW3tKW4YzZjWvYLes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=877 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270124

On 6/25/25 6:36 AM, Gaurav Kohli wrote:
> Add TSENS and thermal devicetree node for QCS615 SoC.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 205 +++++++++++++++++++++++++++
>  1 file changed, 205 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index bb8b6c3ebd03..c20e98f8399f 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -3692,6 +3692,17 @@ usb_2_dwc3: usb@a800000 {
>  				maximum-speed = "high-speed";
>  			};
>  		};
> +
> +		tsens0: thermal-sensor@c222000 {

@c263000 (first reg entry)


> +			compatible = "qcom,qcs615-tsens", "qcom,tsens-v2";
> +			reg = <0x0 0x0c263000 0x0 0x1ff>,

size = 0x1000

> +				<0x0 0x0c222000 0x0 0x8>;

size = 0x1000 as well

Konrad
