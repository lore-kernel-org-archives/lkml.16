Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB501FE478
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999197; cv=none; b=orrJ5p+wjerz0+eA7LoMzGPgy0eOYoJ36RYiW9kpbuk60koM73tqkKQ+xqC9tHmxjyYh2uSZCyM2K3vLSieRiCiLBXuZNOagCjj6SJurAjVosLVXBRXJ+GgzMbQB0OsFI9TiUotgPfgxLXvtASbfdRn7lrmJf4txGdMrBBBbgos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999197; c=relaxed/simple;
	bh=CTEjPujSZAqf3P+j1NI3hRXUfVHwxDengmLbAq8TEXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VLvLj+twh/ra1oy0N8hkhB+FfhlrhjeyCFoLrvBJ1ud1S9t6qgTK2qDdKbjEFQWVjwzt9KoccFBAl0qygO23WzNN8/i3uHd25bwbnHt4fIEsNX6EBSy29UZn0L2L3oVDh4E5LTlfptkOVxtx52Dj66nY/NA7U7K0W4gxCwMxFhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EPnBdTbt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EPnBdTbt"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLadww002524
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XcCLzzMlB7ZxM/ezJ4VGPTAmUkXjhMccCtENn84um/A=; b=EPnBdTbt9S8eSEoU
	1mt/l+svodQUGTAy7ITtLDuvP7/1rRy/i1nBHU5AhHgtkqN2kLfCKzPj00AQKv40
	ZM3FjwGOOsb9IrnzETKnLLrOIFjW+y12Uq2liUme9nl1Y8isI7r1Y6m2lJNnlh+I
	iKSLfShghwg4zSG1ks6oeP/mgH9GyG4tLSRsmTJyvmApfWksQS/urUk6gIqQIwUE
	IUbABca6OocyBGPh0AEesl5vwm4lfTpcQ5nnId42e+YmrNt6n9WXRf+mB/AQeV5V
	BcqRTQvcw3Y3njk7Dr6VbbY4V4He0nP7JNQpVIlUOtY65yw2x99pgWivxbZ8LzID
	26NLjw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u897u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:46:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4792d998b21so10570121cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 00:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745999188; x=1746603988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XcCLzzMlB7ZxM/ezJ4VGPTAmUkXjhMccCtENn84um/A=;
        b=F52VfI8s5ZMH6QzAVnywoneO20HvIjrJVaQPsEQgOQH1tU/9oYb3AW2XaGZKLcBpUo
         Wb045muDS9Qrhgqs/ZUBQJofiuJ2xq8wf+uUDdX7Bk1iy13tYOjICFhxvR7gdsNF2/zu
         oUF8CbjLv2sUkMVhDJAFioWkkc9Oo5Ludt9nG8wXotKIbi2ioipvXgUAkafuCsg2DLUY
         sMn1ZQiHHNdrozsTpAGx7aWWCnTojQ3RGwF+0Ip7jxPieuw7JgCGzjqbmAepcfp1xROP
         PLqkuK/xo6+hPdpXEyomtlR9DRTfbV3s5vEFNpkpwBKU7rZLZY49c52FWR3rPecHf4Fk
         24eA==
X-Forwarded-Encrypted: i=1; AJvYcCUX9Uhw9LMfUWTAqfgCKNUyfBsEM2Ts/HWqQd3ly1cTClgefYkXeAoHkGVV88w4H6R3yk4fSkfp56K6UTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDg3PafOxpaOPgKBmEqtQsQePpg3/18JhgAf3a4cAHiO0LuB7r
	yGyiaPGXP9p7i4+cT1D+tWowZQb1Lvi05pdXxYuqe1c9qtk/8hdDHI0mHNbwEoAKubXsQjkcx7M
	8ZSH2php/312JD5IB19Ay+9C8cEH26kUm8bYpQK57cSR9esXeAfBpiuaeCnf8oF8=
X-Gm-Gg: ASbGncuPZH60+O+AZoZ201twPRp0gMUrqbugtnXl0hY01bCD4F0qbe8Xk4RSgGHxsuD
	lZ9dztwuf0XjMIyeOYk5LnJt65j9tuYCsFuNNzri/ahOLArPC/77buGJbc22C+JNqjTuSR51TSY
	PVzwZpVUlPX7l1EwsFL48jXjlqV9t82Ko1vKEdBLqOm1jVMDpFEx5TqHHNyogEb8C6XgSFMfhg+
	/8mA2JNIIZBn1ZiRNKC3SrQVimjnSkwawn7TC8b6VUBB5GesgmGb4sON9f01Wd5vhedKew6nJiR
	Q5ROUZzkZ05Q4cyMyqzQN/7I/PQnJuEGt8ujFWtjZ75FI4t1KwmWMQ/ktWYmGwqAhh8=
X-Received: by 2002:ac8:7e89:0:b0:474:e213:7480 with SMTP id d75a77b69052e-489e64ceed0mr9350851cf.15.1745999188228;
        Wed, 30 Apr 2025 00:46:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmeOMwpptckVk+jetsDOiR+1e4jS5dFJwxeM7DhbyeRAzyOqqNSOpz4xjt7gtRJg3L8eOXmQ==
X-Received: by 2002:ac8:7e89:0:b0:474:e213:7480 with SMTP id d75a77b69052e-489e64ceed0mr9350621cf.15.1745999187615;
        Wed, 30 Apr 2025 00:46:27 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8ca6sm881270266b.118.2025.04.30.00.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 00:46:27 -0700 (PDT)
Message-ID: <59e3e34d-83b6-4f83-be4c-eeaaba9a353e@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 09:46:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/WIP 1/4] arm64: dts: qcom: sm8750: Add display (MDSS)
 with Display CC
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan@quicinc.com>,
        Abhinav Kumar
 <abhinavk@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
 <20250424-sm8750-display-dts-v1-1-6fb22ca95f38@linaro.org>
 <81205948-ae43-44ee-aa07-e490ea3bba23@oss.qualcomm.com>
 <97ae84c6-0807-4b19-a474-ba76cc049da9@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <97ae84c6-0807-4b19-a474-ba76cc049da9@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B7i50PtM c=1 sm=1 tr=0 ts=6811d555 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=bmsyZSe9DYnGDotP4YEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jCrWfkyE0m_PB-5fsqm8O_97zlxtgCq9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA1MyBTYWx0ZWRfX37ZFQ26kSy3K q4JKDCF5iT4tPgcxUwRh09X0ha1vT9CFUZafPzuOURJPqvkQ+Cm/EWuZOHWX1TwYkcogKeKVsBM e2cv/oAsocbK5Wo0PMt8ZaHYK1Ki5BGXHhIGQbRkelTxdHFAfgeBWdJMe6MnOQSj1lJG90S5BO2
 UhTwsx2a86e7j9OUX53iqvQXZpmRQ+39ibatBeOdtR55z2W2h/pCF1EO6OYVRcZXkUu1ysWdXJ4 kEAkCqH1PJ4UGOzzpEXWR+lXprExEqaqxtTQJtDGFwkwUUdQHVfE6cdrRx1e5yyRGG32jDGNGC5 /3uroWF9hrRZ0I6viS4lfXnLLv8qC/AcUtWfMhdEsAWnSTF+sHUlNVJg2ZzzOITP6MH520Fo/HD
 Biz5tZWeinpC1N/3l2FM6JT4Qg23mEVqSF73qarkUfhAOB57x/lZ7Fo60zw8qX9Zh3WW7VKK
X-Proofpoint-ORIG-GUID: jCrWfkyE0m_PB-5fsqm8O_97zlxtgCq9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300053

On 4/30/25 1:07 AM, Abhinav Kumar wrote:
> 
> 
> On 4/28/2025 2:31 PM, Konrad Dybcio wrote:
>> On 4/24/25 3:04 PM, Krzysztof Kozlowski wrote:
>>> Add device nodes for entire display: MDSS, DPU, DSI, DSI PHYs,
>>> DisplayPort and Display Clock Controller.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> ---
>>
>> [...]
>>
>>> +                mdp_opp_table: opp-table {
>>> +                    compatible = "operating-points-v2";
>>> +
>>
>> The computer tells me there's also a 156 MHz rate @ SVS_D1
>>
>> Maybe Abhinav could chime in whether we should add it or not
>>
> 
> Yes I also see a 156Mhz for LOW_SVS_D1 but we had a similar entry even for sm8650 and did not publish it in the dt.
> 
> It was present till sm8450.dtsi but dropped in sm8550/sm8650 even though LOW_SVS_D1 is present even on those.
> 
> I think the reason could be that the displays being used on the reference boards will need a pixel clock of atleast >= low_svs and the MDP clock usually depends on the value of the DSI pixel clock (which has a fixed relationship to the byte clock) to maintain the data rate. So as a result perhaps even if we add it, for most displays this level will be unused.
> 
> If we end up using displays which are so small that the pixel clock requirement will be even lower than low_svs, we can add those.
> 
> OR as an alternative, we can leave this patch as it is and add the low_svs_d1 for all chipsets which support it together in another series that way it will have the full context of why we are adding it otherwise it will look odd again of why sm8550/sm8650 was left out but added in sm8750.

I would assume that with VRR even fancy panels at low refresh rate (in
the 1-5 Hz range) may make use of this, so I would be happy to go with
option 2

> 
>> [...]
>>
>>> +                mdss_dsi_opp_table: opp-table {
>>> +                    compatible = "operating-points-v2";
>>> +
>>
>> Similarly there's a 140.63 MHz rate at SVS_D1, but it seems odd
>> with the decimals
> 
> For this one, yes its true that LOW_SVS_D1 is 140.63Mhz for sm8750 but this voltage corner was somehow never used for DSI byte clock again I am thinking this is because for the display resolutions we use, we will always be >= low_svs so the low_svs_d1 will never hit even if we add it.

Alright

Konrad
