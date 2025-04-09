Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77007277801
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224085; cv=none; b=M5v1WwSuurJge6L2EBi4TAD3KxgRr1LxYKrWqL66ygexmWhGl5ArxehN0UroxBLlooAcspwoZE7XpzShZktTMytGUYbnhJwq3TmQ3Ew/fcZ5O2C+p0Z5k/z+wiFY5g7AdKAB7R9nZTMNWMveCWuuEMgHVcupmhs1/X0nZiqYDVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224085; c=relaxed/simple;
	bh=A76G8XO3zeb5iD/DYgQmAiHYDX+OwlRFq71ay9w4RiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cTV807ipLYneutXqwNI6Lix1AcnD+lBW0hliTESV+nD2Tqwzy7oNMZ8V1FxXip2v7ORVApLRAZep0/Mgoxpzn47GG14ItjXpVoD9t9uaadEsbvbnDL0Cwyxc+0ixKvfM4x/TkWbQYYgSdwNB0lI78xgr8PVWLlPF2LHup1/i5P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+HdTpgL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J+HdTpgL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HDOGw004582
	for <linux-kernel@vger.kernel.org>; Wed, 9 Apr 2025 18:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GV+cfJ7GNGGjHR/3RZM3RCjysFsTfWhGkXK6dcXL924=; b=J+HdTpgLzJR9RJc6
	mCenU2yWAm7L89LiUW0y/J660IyjKd6LaoehduFSW1fNLXzxcHv3Mc5UPRRCWSJY
	NGKvLYnnFLWrkYBdEOrc7vAhgaoqNq4PAn6TL0bIxbXAqPwALoEE/zbRj8zLrtOU
	lW0NMH43rtqCgjJwV5E254VWskBrw6JwPuaFTLTOJs0jQlTVhJighlNrn+ZApnig
	3rRqGWciKj1Gw4wRXsdFWtWfQprGAuF6LsYPiuoUjxQI9LSZjLTfK14z86b/YEQk
	ga1AvdB23XAixhazqHS6xbpVTwisv6fCpaqZYv/fXrJbCtVuuoeR71ZjfXFyxSmQ
	NOiDug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb4hfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 18:41:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5530c2e01so325985a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744224082; x=1744828882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GV+cfJ7GNGGjHR/3RZM3RCjysFsTfWhGkXK6dcXL924=;
        b=MYZz4/aFEcLWDmN8bLGLVw+/icfLTTtlhtFcD9L9CMe+cAUmnn4YBlUk+uVbu56VQf
         3z3eKn7KWPt/7lV8d6q1ZpBy+VfevjgPUXz0cMzhZmBDJrL1yJAERFQbNNvQrASouoLD
         j+tfI12LmIpFqTrnharJJLIx8XyLWMQdDfxtP1wmXPvsSGeaWQtt2SYduoCiZQGHPK0W
         p1HaLlMGmIu3ToLzw7oWHRCyJHK7Djpb4KHRXZsXzn+b5OqJWbT09j9c8WyJn/Ezi+OU
         9d2ZzO40uvnm8gZ5RV5WJ1M2bvkifOHmXjdB8LICtC3pp/zm+VFIawj6+pmWTvOY+AHo
         OC1g==
X-Forwarded-Encrypted: i=1; AJvYcCU39S0RkkrGq0sRc0T0w7B030AdzDc/t6TyiOJi9IQ6OdE3Wi2aNFReOlijhzFciI22kyhnJqzM9+T5BfM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwwidENKS5Z2jFMCVeaoPRU/S9qZ/In1AL+3ojzA1o1VOIERyd
	9XlZkLn882YCXqExzIIC3f/PvsOXGwCw5vNz3q94CbTRqK2coaK7K/EuMoC1y5sWSFIrq1Znf6y
	OlZ+ntSJLWKX/115OYIKAQtTn2FvTcOjHsw58+jnXJnORHsBndInVKzk1qz1QLc0=
X-Gm-Gg: ASbGncuGQuwjOH5tHYJxhbeqkULDks7x/X70EeWTesovbAcztpySyKvQmVwed3QZpx5
	7ETDKJhApK/6sd5av/KQAIc5EZIExvSUEwnJoC1k0xINk3JbN4d9W61sgEWGmXNB56o4pZvGLFp
	NBMjj4sg4bOWZlPesKrDVA8T3HNw5Cm68F6LQgMVQtHsGHwE8FE+92JixZGPQxVrhOGjxkMjpDc
	pzRnsvDfz+hcshfhoeFrGuTWPsdnmPs32VanlFMEMfTZxCEQSvJJI7j88oGTrlPImL0lhKyuBV/
	MEqgmt84YtLQiMPAn2/gCavyM1PwuaoV64YYvCRFAwz6n9eeV4XLip9I2mYjODukGQ==
X-Received: by 2002:a05:620a:280e:b0:7c0:af16:b4b3 with SMTP id af79cd13be357-7c79cb2956emr240300385a.0.1744224082386;
        Wed, 09 Apr 2025 11:41:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfdsHLhjTbUmUhDsUafcwjWCN06cz8NCJ2SisE7fVfjCUv/0AdQTlhlx5gH2u/I84DmW937Q==
X-Received: by 2002:a05:620a:280e:b0:7c0:af16:b4b3 with SMTP id af79cd13be357-7c79cb2956emr240298885a.0.1744224082014;
        Wed, 09 Apr 2025 11:41:22 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc2dcsm135479366b.132.2025.04.09.11.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 11:41:21 -0700 (PDT)
Message-ID: <6298f149-caae-49d0-af68-c3d102d0ef7d@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 20:41:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/6] arm64: dts: qcom: ipq5424: Add the IMEM node
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
 <20250408-wdt_reset_reason-v1-2-e6ec30c2c926@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250408-wdt_reset_reason-v1-2-e6ec30c2c926@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VifDEpyhozrBkUmwwZEw3_jE_z3C1bn4
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f6bf53 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=o4o9nyK-Q1O9M6IKefoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: VifDEpyhozrBkUmwwZEw3_jE_z3C1bn4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=787 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090123

On 4/8/25 10:49 AM, Kathiravan Thirumoorthy wrote:
> Add the IMEM node to the device tree to extract debugging information
> like system restart reason, which is populated via IMEM. Define the
> IMEM region to enable this functionality. Corresponding DTS and driver
> changes will be added incrementally.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> index 5d6ed2172b1bb0a57c593f121f387ec917f42419..a772736f314f46d11c473160c522af4edeb900b7 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -486,6 +486,15 @@ ssphy_0: phy@7d000 {
>  			status = "disabled";
>  		};
>  
> +		sram@8600000 {
> +			compatible = "qcom,ipq5424-imem", "syscon", "simple-mfd";
> +			reg = <0 0x08600000 0 0x1000>;
> +			ranges = <0 0 0x08600000 0x1000>;

It looks like this should be a little longer

Konrad
