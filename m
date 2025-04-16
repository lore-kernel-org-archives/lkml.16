Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFDC2222C0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744802791; cv=none; b=cVc/rjkO4osFKlxXmX/DG2qXxovb8e5UYJMZWiJxi8ca6CPczML7u7/a4T3yiY379IJmnFgqI1MpBrOhO7DlQn7tJr8Z6xos7uYWe8qxfgB7T4Otd/SgbQYWPRwLHisCGjBKQDTdmd76qNeM8YXzXtc5wPrEHmxDvzPRAJDNvvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744802791; c=relaxed/simple;
	bh=RW+Mb1eJdxcJ/AlzsBlGVolmGwaH/qEdv08dieAtp9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a8dQqjuHV6HTcYIkMIIs4UF3pn4V7ofMcWDF+sEvN72tgY3jp6T8T5+5cfdi2K57D/FrEDAOQpwwOWRw43JIOr6X+Vqm1wVaWJE4C6bT7rdNU98a/xFuxoCz6987cb7pK/Nsi7JKU6Z3YogfdAOSS0WQzoks8N/Punba0uKG8+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnWNCoDc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnWNCoDc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mh5k025492
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FqTH2FmMp+zgfaiUJyffxmO7+0JUHiAh63pGoR0ZBzI=; b=KnWNCoDcrQ6/MQRv
	0j93hcM7iFRb3ckw9qz4xB777VvGv72/CASUSVhm4YmvloHftV049uEUYmgniitA
	gkSv9jqCHpOF/nnE53a7GfErs5NOUqeLwr37Jui366IcL0GHfau2Edhp8GoxOvSQ
	uzagArSASeRGap0Xd/CFcz2WxH55w+Sgo+UE296TDQaEHmxDvI0/DabG5XjPjtN/
	Ez3NgW5BVp43quyzGbXSg9fNvCwnUR16dXagvSbOktk9OzxEKnMiOdSV+tEp985a
	NJC1tQH8rbryujHhozITfObPKgJfd6sCV1PQPDOyRYoXAANKYSGHz+zssi+na21Q
	nZaRAg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvjbg41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:26:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e906c7cd2bso14367986d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 04:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744802787; x=1745407587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FqTH2FmMp+zgfaiUJyffxmO7+0JUHiAh63pGoR0ZBzI=;
        b=vwaQjz1TIoIMi8TdAMUTIfnRzNb8g++K4pCiwkVHEiwHXEHsqheAnOis3z1qjEIl74
         2cd3h3oCgeb2HdiHPg58keQnhR5R+LimewnsUSo2PmcbsZmBxmkz9blLA/0EtMzBc1+p
         YkwzEnUS8lfgsHhtDyEWVvbzfP6PDUy0kfJpA3mLPwKr1APaBwlAFe4JpaneZpBaXU9B
         nUSh9ngRjb6qeZjvWOQZ8j+NUFw4sUSswS9gMUIrz1yZX/+995R7NYym5fTA6LPiWy0m
         5AAYDsxP/lZhWjC867spFS0fnn2ezOQGUllwv4y7XY6kU2YhqceWPCDCwmNq3loUkT8d
         rfNg==
X-Forwarded-Encrypted: i=1; AJvYcCVDTQ9ACOmrX9X4WPyKRGjUjQwOvdp/OeJ05Cd5Fmnx0lRHLpth1dRfaYAXZrLPonyrzvK6G8dK4eFj52Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMsu5NVCUkkjTyV8HUxunZMQd+YelQxQbHwMTUjsddTStrD45t
	WOFLVezbZsb95xEjEHc30VM4u75aa8+SLSDDuzI+LioYmwjTzBGrwmAaAX+FUsHam8v7QkU59t3
	xmpZFAyisnhuMJzMQlqS6NuiTQg38u1TVvJ3MytvlvP3kbB1QU1x+mDUWGUzd4Pk=
X-Gm-Gg: ASbGncsmqFzy9cMY7C3nL1+0Wj5yokGI4gpT7I8bXBjXdKk4H2Bv6OvbUUbdmF0wlIt
	WQ/DZnfktuqebFi1O3gk9yOkbQjfBg0cFtTonpTk/7ZvWQN7g8BUOzY+J/O+Tam7dIKCJiZ9UXc
	HW9en54ZtWu+3eRKyXHrZl+HZE5EcggpImI2fgdtLnrTj+3TEiT2bOMxRviRIB/X8yyZLLYe7kG
	l9isMin0OqRYbwOSTTdmazGlE+NwvmoS3MA8GwUEOdUC5vNz+vPwCdol4kI0Rj0drpT4E+1LDz7
	8tE03SOyJ3ji0PFGHnoilfvbqk7hbLbyPofGapRxoL1oI0cgen9jMamle65guFLO8NM=
X-Received: by 2002:a05:6214:29e7:b0:6e6:60f6:56db with SMTP id 6a1803df08f44-6f2b3029573mr6577346d6.6.1744802787481;
        Wed, 16 Apr 2025 04:26:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcrmSm0usm0wco2TpWbMcvSJ5K5tNtnZEKjdDwDdoLwijVwSIullMrchHTd7gxBedW6lEDpQ==
X-Received: by 2002:a05:6214:29e7:b0:6e6:60f6:56db with SMTP id 6a1803df08f44-6f2b3029573mr6577236d6.6.1744802787153;
        Wed, 16 Apr 2025 04:26:27 -0700 (PDT)
Received: from [192.168.65.178] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cde06f8sm111502066b.61.2025.04.16.04.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 04:26:26 -0700 (PDT)
Message-ID: <d2a60897-c35f-4ad5-ae68-cec245b28e0f@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 13:26:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-hp-omnibook-x14: Remove
 invalid bt-en-sleep node
To: juerg.haefliger@canonical.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250416-fix-omnibook-dts-v1-1-2409220a7c6f@canonical.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250416-fix-omnibook-dts-v1-1-2409220a7c6f@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67ff93e4 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=DfNHnWVPAAAA:8 a=EUspDBNiAAAA:8 a=PzLb5ZeHJKIu3IZmtdEA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=sptkURWiP4Gy88Gu7hUp:22 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-GUID: SxVpebZlc2MrGKn0LZL_MHUveL8FzmKY
X-Proofpoint-ORIG-GUID: SxVpebZlc2MrGKn0LZL_MHUveL8FzmKY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=809
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160094

On 4/16/25 11:13 AM, Juerg Haefliger via B4 Relay wrote:
> From: Juerg Haefliger <juerg.haefliger@canonical.com>
> 
> Remove the invalid bt-en-sleep node. Not sure how it came into existence
> but it seems the functionality is covered by the wcn-wlan-bt-en-state node:
> 
> 	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
> 		pins = "gpio116", "gpio117";
> 		function = "gpio";
> 		drive-strength = <2>;
> 		bias-disable;
> 	};
> 
> This fixes the following warning:
> 
> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: pinctrl@f100000: Unevaluated properties are not allowed ('bt-en-sleep' was unexpected)
>         from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#
> 
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
