Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4B21A0BFA
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747838038; cv=none; b=ANG1MBtD0KnKNMlvmJsswReA4s2iknglVruOyn6cp8RuCP9B3fkSePBtR/te76MYg6UA4QXYojRleA3ZDgelO5Qv/r5ipWe/9RdLuRPwsZ2NuBA18ZzWdeJgk0MXh1EnaXbrO2nd2GvuLzYjCTgkTGJ0Nq8WgyH15MJWxXjHB0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747838038; c=relaxed/simple;
	bh=QXOptH9UISrpzVy4cekX7Ltl76t6VFh+ehjc5O5k7cE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dwEAjf+B2spCiB/S/kSLBHDlcdLtsxlFwXxaY103WfHEO2xrEAijI3SQXWXhATR9dNjEm4SDvZGmnCyINk38JdCDZjBQiUxLuYjJeW6eC2ealT3NmIj0T+Y/mv/Q+3vCTTG97pBJ3FP4gQfUCbLztr505WIozj8/j++yZNwj3j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fRnr9oWe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fRnr9oWe"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XJ6R020927
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wUiFy+nLG1ZM48+pPyGzOV6fpUXlY63P3XaohGVWgNo=; b=fRnr9oWeIsRBMM+m
	X5nP7aPpXwcMHjSTl3AH0qN47YCywocDnRH/wejw7pTc5xVy8QV7m8yED9QrbDbq
	hleTJHTnI9dHt7bqsncKtyfHJSLsssAegnCkxIpsJ+Si60Bb6OaMnixxLQblvqrM
	tgMZLHH9DpH/y/JNCdeqS/TpTvrx8eN0+hspvHtLWfSZGSLbbLvjSBnQ/rsNybU+
	nVGskHQiHogiD2PQ4rOfBYEiKqx3GrkAN266DrlWdp3+9tijAs5iORq4FYoN3dme
	HRezCJeB5YyrPPikGe9L+p0s2QpwjGARaRXZnlGo5kCRAx10wDiWUf3tGDUQIRz0
	0K8zSw==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf03as3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:33:55 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3db9a090c15so54600855ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747838035; x=1748442835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wUiFy+nLG1ZM48+pPyGzOV6fpUXlY63P3XaohGVWgNo=;
        b=YZbYjdgwIMvClTsNCGiEz8ysCrsKAjgisEGqwKJo0JV3jMWj7HWEGEcmyVK6ah7bI1
         Pws0w5zopx/hqLgOg0DkMmeg2Jl8xfjh6VD4GL2xaLW+YjK8e9OjYlIidkSKG+AouFJg
         A18pAPy9Z9TQWIYjx5ggL/BcHYAGupjDJZRk7hBA5vI0mjSYl6v3FlBnLHzMIAGtLiMY
         ZOrdILpDA9snT8Xg0BhsZt8h61HEg/rlai+R7ZoBTcee712dLar+CTedE4BcTxsulrCF
         MXDYY0G8zizLl6PRtqvAd6yaZcCEaeRWJpoaANpQds5Ti+pxeyDL/XfybuK+BEHU1dfd
         pEcg==
X-Forwarded-Encrypted: i=1; AJvYcCWVQXLydS/bEU13Z4u+BaG6YWtDflAvMTI58u3li/6JQZq8hUT/zY5yPIuRaHASq6bNKZPkJNQ8ADp7ksY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxitECE7GRJ5WriRlg9MtfXAwdQplImk8+3cVyweDmo/ERFR050
	0hgelSfZPISeBJYOILqj4U3O3AUqmYfapocIaopiK7M4nu3ETtpVG1rbnwAXokUQGeuynUYknS2
	OyymScDDvZdlg3iAMai3UYBmw/14SxqhGnMYrX51sGczQOP4QqpIBBh3HsSsTmG7Z4SA=
X-Gm-Gg: ASbGncvvQvIe/t3MQ4aBvIyCuKqoO65onvHUEf5rvCA+jlPdYiLd9V/3MbAuvi/9Fvf
	GVL/5iaCcmGukde+/2gxdQTKH0h75aIsWGsrFTg161HHN32KiicSRody6mIeoxyL+7xyjvTjAng
	V+OaGhr9QJV/ankvpWRGGi7Sqg/kyXGwQMCvDA+w+8Po4v6MsRBRA010xtLXZ9M+LLyXIUimIET
	Giltz2pbwoUDdLTkKF/mPwp9m06paBM1xgybdtpfUDqg42XVVas42ndSRRaKb6bC0z6Lvw6QpoW
	g/UnGzqC+pRiwf4YsRj3dKqwvgM3oNbbzHVyKEtWKDCCeeGpkStJsY7iau81KrMUGfHoJvE3Muy
	BVR67Qrvf/+hp0xCpUL53/WwUhLpHAYiqC18LLhCZyjMyYU+xobGCVuCRIbvcr6+r
X-Received: by 2002:a05:6e02:160b:b0:3dc:79fa:ed5b with SMTP id e9e14a558f8ab-3dc79faf12fmr72495775ab.11.1747838035062;
        Wed, 21 May 2025 07:33:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENjzKcO/YaBHBvHOlpxJ9X3Vbs4m/bWka9bn8wMR7PBaN5TG3kpnsx5SHud0+v5nhdvewHBw==
X-Received: by 2002:a05:6e02:160b:b0:3dc:79fa:ed5b with SMTP id e9e14a558f8ab-3dc79faf12fmr72495475ab.11.1747838034711;
        Wed, 21 May 2025 07:33:54 -0700 (PDT)
Received: from ?IPV6:2001:14bb:c7:69ba:b852:d3f4:8957:5a1e? (2001-14bb-c7-69ba-b852-d3f4-8957-5a1e.rev.dnainternet.fi. [2001:14bb:c7:69ba:b852:d3f4:8957:5a1e])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fb37e9b9sm997757e87.135.2025.05.21.07.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 07:33:53 -0700 (PDT)
Message-ID: <e34a9a27-de57-4cd8-892f-6a3fcd447b9f@oss.qualcomm.com>
Date: Wed, 21 May 2025 17:33:52 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] arm64: dts: qcom: Add UFS support for qcs9075
 IQ-9075-EVK
To: Wasim Nazir <quic_wasimn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        kernel@oss.qualcomm.com, Sayali Lokhande <quic_sayalil@quicinc.com>
References: <20250521140807.3837019-1-quic_wasimn@quicinc.com>
 <20250521140807.3837019-7-quic_wasimn@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250521140807.3837019-7-quic_wasimn@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ba962gGvnDnDEpQx9VKM4V3if0VmSgpy
X-Proofpoint-ORIG-GUID: ba962gGvnDnDEpQx9VKM4V3if0VmSgpy
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682de454 cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=oWHj3RyY54zUyjr8eeQA:9 a=QEXdDO2ut3YA:10
 a=HaQ4K6lYObfyUnnIi04v:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE0MiBTYWx0ZWRfX0x2kcWhOIduK
 2dCbASxisv4mEVHH4B1PaixPk4WqojdsZrPPmeLkIGt3Ad3tkup1X3flYiElYfkCwzOhDZJAYzW
 2NAmPYONSFvsxxzxKle4ZfIYZVIDlo3V73uFiVAei7U0UN7tyyVnYbPeaAEbFnEZUU0PctBq1na
 XmyNiHha/VqJV6ogD6EyrynCBJtw3aOZhUHNIwQ56yG0fY4KTY/m7vdnY2UYoqLYmshqejIFRDW
 nQhd5tB+n3vreerZEVylwOsId7qlsh4xUNky+acyHk8qHMOdaj+jeYgtRRBXJmF88do5plsmghe
 cIwTcG6GXanidvPvs/NqegomCQwPTRujMZKbilku2oSe4/myD/9xBFsYRfy1vcYc0udjOJFaMqZ
 SG6+oNHkIBMH3nXbUHJff7WEYMwTi3fuo6mRNAmXgjXAyrMXXsbhPSiMvVyqHFL8MGM0/DX2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=894 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210142

On 21/05/2025 17:08, Wasim Nazir wrote:
> From: Sayali Lokhande <quic_sayalil@quicinc.com>
> 
> Add UFS support for qcs9075 IQ-9075-EVK board.
> 
> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>

Squash two last patches into the previous one. Use Co-developed-by+SoB 
to denote all contributors.

-- 
With best wishes
Dmitry
