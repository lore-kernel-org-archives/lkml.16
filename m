Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2D523D282
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750674980; cv=none; b=WPUOnOAWV5BrJFbHTbAsjy00U+CArO+9CLIYhdP0otP2vE+zYLeQDWagouSZdii2qTkb5oNNhCqQvSkOTDyRjsC3j0OQuzyXPp3KNapfMHs2wabM9nOFOV+fXE11m/rGF3iV26TPIKNS/a2+cd+1fvjDFsDh66/DfYV5H9cMwdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750674980; c=relaxed/simple;
	bh=jqB5RXeiCy2yxvpHqTiyoT+mAboYbVQIXqhgiMQcyzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qg+7bzEpepv2QtB+rLFVgtbK5NR/tG83eGQaIut3T1qkbpInuR/1SMYWJpDQilUkzPk2zHCbvPr8oiCnKzBrsE2zCORDh5ykYvBo1xJiR9sMFpxohPg9sKUv5rnSz7Bx2KbW5JeltY762okOP/0s+I+DFCwCG8SqD6bfQlmDkmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HVuRj2zA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVuRj2zA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N8jj6f024219
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	78ZQ1vr+4TJZ9LcD4aXxyiueI6fILqj2qthFui2TXx0=; b=HVuRj2zAB6h+roFK
	tJswB5HZNAJ8dTFpUQsOEHwiZdQn/rkiiR3AuPjG1D2NF6d5agIwSNDsFS+Ntnee
	Nvu31Ct9lL4qcicnT5KzbxcUxwRXy0lGzzDA3MKdhJU6G/nfNGH9Vh0rths5ZiwC
	EQw6cLZd1T7oLI/7I/HfK7/jAE351TED7ZR8o0lM8xpwve35suVqYJYYn27xE74A
	bKQfRv6inRg/zF02UqeXIVu2LR1K14yRQgdXvxVG3WpgamPcTTWFxGwdX9irI2qQ
	EdkB/Bj5/p5Tn3zCCV1a1TuaE9PC3+NPzOraVvsJ/fNQLU/Nt6IFOVFBZPCW8now
	CiFFIA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmhx0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:36:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d21080c26fso106682885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:36:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750674977; x=1751279777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=78ZQ1vr+4TJZ9LcD4aXxyiueI6fILqj2qthFui2TXx0=;
        b=E9p3EVthpfKt163bV21bQhosOOUvscKstMW5tg6mlDsebSpzom/Bjx0xWiJKuUGdAM
         lzVTH5cLWLQhLMUGLHCi9X5bUCBDr7G672P1OVHv4bORPLCoOA1oeG/fVZpOh9MgTJf2
         b39ruRb0rIRhiwhiXkUwl1+P3sfuMiLoX8rXptrq2pGYVVcjLcBTPqJRWheP224u8/jy
         LSCEv9IvZDbhoGSY30b42+XsOX9sHBbLD60QN31n7jYh8mqbyM8t697t0tdELrJywpeH
         KkzQA0B/pOJ3DP4V4z2NApGws9CwiLhjs5PtvvojAfALWjP3wkXyDTM76OR6cdE41+kL
         uqaA==
X-Forwarded-Encrypted: i=1; AJvYcCXdI0feH4Pbs90n0dP9hsbZrbXgQRQt+4XtO2V2kdAndgpe5DQNbjecesavUvNcz08hMUiY8hISudXGZvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu6EZxQfXB7M3GLEIxZFqt/meVFgZl5Hf90sSEzF/ed1TxnN+r
	Z0gCR8pgS044tlpa9lXoDNEGZ0oksgflfs8g73QjLZ8xGubOEX3tCCmCHlmcgbYQ17G5Vf5XStk
	holhebdlWoDaluHNNc45qCt+T/tzI/hBWJYNGLS2FLuz+suSM7I6p16oBD9+g3IqFU9Q=
X-Gm-Gg: ASbGncuaCQJaMuWFtlxR9WEMpvME4kLiX6F5fz1CSHxpF6dWExm2Pud/yzAy1vdW9Ri
	N7BpeDcqDua+vWLGj/UWR1O4cgUuEJmWgFGtkrZHEuIpciCtGGajdwqG9rGGW8bKDkJf6vWzEB5
	nI4WV3md4CKpjSrewXvz2HMeaefxx9FNG3daN3d1cxL16FAK3RrnDqNWgNhUSH+r4MmbCOjolbh
	pMzvCMSMG4h8vmrA44TFiJ8ejVWp53ouU+VmKF+b+onqrAZJJuMQYl4hlInw8OWSu4G9RRLScFT
	g1lcJdnGe9elQwAj87mJtyRQ7HOU6UA/r0dfwyih/3Yzt6kPUzvHXiVl2L3CnlM5lpqnmynv/Fu
	jRFY=
X-Received: by 2002:a05:622a:9:b0:4a6:fb4d:b4e with SMTP id d75a77b69052e-4a77a27a4bcmr70701901cf.13.1750674976998;
        Mon, 23 Jun 2025 03:36:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERfb+THWbpuzGEe8wq5BdPRAx8kEqGpZc5Z1zw42lxTetsNLxPB2ZpXeQscW936xCLuoVGqw==
X-Received: by 2002:a05:622a:9:b0:4a6:fb4d:b4e with SMTP id d75a77b69052e-4a77a27a4bcmr70701671cf.13.1750674976523;
        Mon, 23 Jun 2025 03:36:16 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cc09b5sm5840626a12.61.2025.06.23.03.36.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 03:36:16 -0700 (PDT)
Message-ID: <1dcf0478-49d2-425e-9fc2-137ab3f89eb4@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 12:36:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sdm850-lenovo-yoga-c630: fix RTC
 offset info
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
 <20250621-more-qseecom-v2-4-6e8f635640c5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250621-more-qseecom-v2-4-6e8f635640c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Cg6ptLJEebGrUDm-_TxR-wEQCdh1wUP5
X-Proofpoint-ORIG-GUID: Cg6ptLJEebGrUDm-_TxR-wEQCdh1wUP5
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=68592e22 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=VbgocMZr7HyCK-CFy7MA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2MiBTYWx0ZWRfX4eo5iftczuQk
 gmSo59AVBR+Kjrszf9zD24a9XAxLC9c39LlTsVhjLz5DItmzfspVQUgN/25BN8tH28c4OZ7vJO7
 eieR7JYkT4FLs5zlWexODqlu9HbvrqHOjNZQCdNzeup0hCHekdAnGB40b3s4sSkwPc85RR3Q6OB
 wEblEUP782QVbpb2cCwQ6XBgLJonE6g0jSlJbtcqVDaJYhbYLrGQ2l34SyokOZPZIntvs19088j
 PPBDNfyuuiaHvIhDiGxiTL0E1x+/PoHIhSVlc75gdFK0X/DCCorRsanyfDM0nwEVO8O/Vk4aZgp
 ncXgcL2VksVWi8RDbObCcotqb5pWTg46n5hdQM0wksI+KqHGEz55GgdWX0C+D69X/ccdX0U9u+O
 IYFtN/hv62dVC6bn6AhRXDQku75FHDZy3VuGY4QsQir1EYjOXUBa9E7PEOAA7y+beaYDrE48
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=700 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230062

On 6/21/25 9:56 PM, Dmitry Baryshkov wrote:
> Lenovo Yoga C630 as most of the other WoA devices stores RTC offset in
> the UEFI variable. Add corresponding property to the RTC device in order
> to make RTC driver wait for UEFI variables to become available and then
> read offset value from the corresponding variable.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
