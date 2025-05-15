Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31252218AD2
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323317; cv=none; b=s0LFIThXZD5sAKQ59Hf2Vy6CyO/MxZ/pSxGMdMVQaea2WM4svL76HjggSdDNoYNC5ByEQyjNTYgWfUXSqMrSuDW7oYLDt1QY/ipSSNOw7+KN4arp+oIKi4ywOC6R4b+4KN3d/Qcp0W3ySqY0n/8Yfycqpw//S/x7fk3HicoLM1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323317; c=relaxed/simple;
	bh=kfGaaBcF/LpH0NxWWC3HOK/nOecylao8k87Fg+vGGyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A8cQaC20MFsB3fmpe08Dv9bm3DdYg8h+7pcr71gb9VPQfgUWDJLLTtvYMGHdorgw5AWh+rN+PmQLJV4CmlZ1Jm+vdBAKP/JBF9pM7ZrqZcGog7SRYOOGrimTp3aRU+tWIUgPvtlyCyeptcK7O++YVJHvO9MzGPSy/gScEIeH/do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iKyYfYrA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iKyYfYrA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFDKu020897
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rkzw4ciboicJeZhZaEWOlIlR5gsZ0yhn2FRwPUQB6/Q=; b=iKyYfYrAhhVKhXlH
	0ie2Jwxsfttl0cU9duToLuEyfa4fsQ5utrlIZoOY7O6D7SSpd/rAT6tHip/pVmE1
	1/w4a9C/3ySPrRb/ylT9A8t+CjY92JJAxlxKYGkSNn7IcBadH32lVNr6q0csilhi
	SAPhGUBEgdA6pzyQFz27CdyAlNcZa7Epa6i+U6NR7Q8ukKKtWuil4YuKrei97AM2
	9Plu95Ab+1XJ6TOjuQVcKjHaHGu0yRyYm3kBQqotFiQUtoXVdeRVL/xmzFIGBXQM
	JpAdcy8vvq8Jr8Egc9Hx2+01w2q6dttz/DKrr99C9QxnTp5OiYQbkBYaDC4L4nML
	TA8dTw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew6jr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:35:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f899c646afso3503066d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323313; x=1747928113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rkzw4ciboicJeZhZaEWOlIlR5gsZ0yhn2FRwPUQB6/Q=;
        b=uK3lc8sY+kXsmq40bDSNS6ZdGN9Xxts+jymStmnkrBVPiIbguwmKZDY9jIPpM9pJB/
         nwLyJMCAi9W9rc0AtGaxHx/6WDS1rKwUFQaaX4X+ZUDxSaBkchoH+gGTnSZjxgiQ/sl3
         pML3oLYswnyDLqJ6NFqKidauLS4sB4R0X4QJxuvX/lMeYfcqk7v5VPc4D/VwRYfkWdqN
         tsALJieabLrN63jwrePzhOzQi6su4UTsweKprB3cqmpkUo/UPoC6ulODOp1SrQ3vEK3Z
         sOnsKyEMim0oGxSiuEaJlP2imzHBdY8zzFD0a5RCX2QLR3FnWpnZEtKqKXWjyAao9msj
         y4ww==
X-Forwarded-Encrypted: i=1; AJvYcCVDa7VohIO95JZ0bBQ3KpFKQg82xKIDrhVTfP/LWUwTA6CufISAdhk76tTSiaRMfjuDzMfV3hFLbsAt2PI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXjgjnNa6BD/GqqaaZZdmuNy8QWyDNily9TBXa+rGK3RMHoh/V
	4z9ah/MzlDbI2DKvS0Y+2SttEfOVbIByUg8oNREQROi++fnBQWF0MuKVLpWUJzQ26KuWnRZx/AT
	ihgKNDp6iIJxvRltyC7EiGI1KjlersVjIUGorZOPNztLP2o5rgeOpzuB9wyhprOc=
X-Gm-Gg: ASbGncvabaPG7oqZH2q8+8OSm+A3/ZFiBI0P4Rno3PXQpPTC/tvSEGWrg7VFldMtvIO
	zlL3NDf/wiXni5geNaZ5Oon0gcvWAaNm+lVtiQsblcXHXN5sAL75PIQJRIITyfNhJjSOu/euiIF
	XLEFvNRPcdGYTDUEX7xxyiVXNMfoNart6RgDkC8lge+F1IXF3xPBpyTHFX1Pnr6r6VQX6obDmxh
	MN6KXQH7XmW4KiKLp1+yBByfyOw8UpUFV9sHsdZj6gBE85oBYcrFlEq2ifP+td6e55yrskkaOIk
	kqbIY/Zgx/8z4f/zodS/tMbzdWY9x3Y4FKwtUzNxU9U75ETw/u5MewhzkV38NZaxKQ==
X-Received: by 2002:a05:620a:260c:b0:7c7:5384:fa53 with SMTP id af79cd13be357-7cd287e57c4mr484443485a.6.1747323312982;
        Thu, 15 May 2025 08:35:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO0nTwZv8sYoSfNAmuJqERfG93omVD06XD7BfB9gDj2RWpLvTBvCuoS4cTPigbW+p4ywQfCA==
X-Received: by 2002:a05:620a:260c:b0:7c7:5384:fa53 with SMTP id af79cd13be357-7cd287e57c4mr484439985a.6.1747323312255;
        Thu, 15 May 2025 08:35:12 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e637dsm6880a12.43.2025.05.15.08.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:35:11 -0700 (PDT)
Message-ID: <d98231be-3805-41ab-bcbc-5f6b6cfdac5b@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:35:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/18] arm64: dts: qcom: sm8450: Additionally manage
 MXC power domain in camcc
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-16-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-16-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ytWC3oa-fOB_LTaODukH5_mkyYvGsHDk
X-Proofpoint-ORIG-GUID: ytWC3oa-fOB_LTaODukH5_mkyYvGsHDk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NCBTYWx0ZWRfX9uaXggp5i97/
 ILl30+IP6inhivYlz3527ayTWlqAZgZW/5FFgzuAd4vzftqrnMQLl+KIibnQO7naQ8B/gezgqYA
 UYQqPgbCe1lR2qvBV38p8DUSoW0kDotuPbr1+tB4E6mZkqTKseU2lT2Wt0lKZy2iq1XNYCkQ5t3
 5L2gJY6tQCbo48dTu+I5r5jo2tAZjZICv1zRsdYRyw/NM7kmPOYzWv7yFj0FrbJaIxgU8GX71Oy
 CpG5swwtdvj3lQ3ypDBKugQjNuya1jJXpEMjVD0qRDUrmHDrJQuDazktAFArM481wkqe7QnkMt9
 Geaqxf1ZhG7WUOihSvyTKJaOkrh63lOo4FNWsv6Hto5Z/B3rAWCQ4MSMlGm57KoBYJsuSKYtzc3
 ue0Mkxg82VVDyRLR7F81iAxN/67xMf1TwreBF2Xk/tVxkuFxJ51Y423CYkp0FvdVVPkN6kjx
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=682609b1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=9_CkSsT5FSWxdIVEpLUA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=660 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150154

On 5/14/25 9:09 PM, Jagadeesh Kona wrote:
> Camcc requires both MMCX and MXC rails to be powered ON to configure
> the camera PLLs on SM8450 platform. Hence add MXC power domain to
> camcc node on SM8450.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
