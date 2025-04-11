Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6348229B237
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744363060; cv=none; b=Z34/I5Qy7UXXpfkYLwu3T11J8/lBZgGwG4+X8EYs/LxSRVFTxpkkCVVPl6FVTTg3f/ytKFwiubG6fMobUeNKr4SW1nLz5wUJlvQJh9FHjg8GS0qNrbLZ3kxz5vwENUzxI5rWMwaQKvZl8rrgQNZ0Tpspt89boVIJsz0GiXKDHhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744363060; c=relaxed/simple;
	bh=5riflTBovuTknbfdTdQw7WeAT90h3KdXcdIxC6zePGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ev0adnRhfmsn9BpdjTYWH7ZXb5x+LtFNnAqItAT0v8uQz83UIHIPivCXlyclJkMRwircH+MZszzc0NLPItNbLwKijKhzFZFdxp6NvFY7Hn/dGErQ4oD/Cx21K1pitUaeEFqMlhpFuLUK2pEAYS7yN8rLNXroEbS/IOHWHksoaxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C14Hoh6b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C14Hoh6b"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5savu028838
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+zN/ZnflEHJ0aPPcnDV5LHKDgz80vZRrLIfbl8jUk1E=; b=C14Hoh6b8Akeoi0D
	hSJsRmdyH8b+LRjrso97YSnnMWm0/Yy433ceMwNiVL1DuvzDdwlmwg812FOHT0bi
	O3LgZU0ywlLSpfIAs7VuxO+UEJ1bC8Ws6Z3M33E0aAOiicLIvD4+c4bBBPHKM97S
	SydhqytyVBT5ATvdbpnVFmOI5fFHBmIt2I7ocU7PUoNs9+bdJNQSMwCUkKPx7gOV
	mn1j9+lcyiAScyV9gubLVvaV8KnlLCODdrGU4W7YIRDRoASJoPm3eTCji31EwaGx
	bMu0La4x3idLCVm2aTnVGg3Vy+Tt7q6ORWtufk1cB+1o8AHMdg14SvHGjVT6A1ov
	AybDlA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbuswge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:17:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-225505d1ca5so16647875ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 02:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744363057; x=1744967857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+zN/ZnflEHJ0aPPcnDV5LHKDgz80vZRrLIfbl8jUk1E=;
        b=UXj6gnKl7FRw8r5LE7kthDX24Ah53AAATHgAmd77N/6ROiknN/b4X1SzK7uC5zMo+k
         AVUPV0yMPelGYtbxugTdTLzPR4XefeT5J19irhqmTkESSwXuLH27U8BZJEZ+jNpz+xCB
         SxgLQln36K9rODExpvIrmxm1PGLNQaLNAlPv/LqHrczOm0Uu/VwNtfVSDvm6B+98v5mY
         +DjpcpJ1QZVP+oT927FUi/Z+ZabwHvazEwBhemi57m4cjWL1o04GOtE1utnv9G8jDKS3
         Y0rth04Uw/iuD36Qb989bu3/XUygqq4zTaXLUNy8DfhGsqblq34DmFdG7TNGIkeXnqM0
         eX+A==
X-Forwarded-Encrypted: i=1; AJvYcCW8r6+0EDsfBMEasSxRKaayKf1/1Dq9MOlaE7H6Q7vMuilOcgh4UbuVC3ebG+9ZHu0U7o1y9rlx6wtqb3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGDqrpcxrGhFnFD4I3qpCNEn0csKlhA166tP2BCFr+LQOtfWNU
	oAiunTUHXokqlmmeRZvFpORG3Q8P1fha0Ole1L0y7JkVu/J87U+5aPvsV3zUdWgXREPk2iH0Bgy
	yxdPwE9rjBDbszAvsADE3Fs0avrGLfOKmr8j7NjFPTcMh7sRP3jqz8ihs1S9pEUQ=
X-Gm-Gg: ASbGnctGCbjjrVC5gaJCejM19dRn9YtKPj9qJangGDXsOyGNOul2bdUjcr7rcUCXz9/
	tFEWXQHqjGe/96h/rOasaLV1JBibYmcrPvNVD/S6G2+kEQpLlQBBjD9l2dZdFpsG09zJrQqiPns
	YlnMm8dJGvMh+hVwLe1GybYrfmOFHiVbn/nXB3JPvPHCJ6248yTHfZn1eGTMrG/VnfEdWSLGeKG
	upKQjFl1YGoXG9slynFEj9nRFY5k9sodjsCtJN8ZKicwgcFdO8/SJWPrlrA/EwaEkta+wj0T0/r
	Vqkp01agJG3tGaBk2xuOwHrDgDZ39Qf9xwMXIzUR8eiFpj/+Ni1b
X-Received: by 2002:a17:902:fc4f:b0:229:1717:8826 with SMTP id d9443c01a7336-22bea4c0072mr37888465ad.28.1744363057691;
        Fri, 11 Apr 2025 02:17:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA42sJVVVoBoIcY0aPFDP0UouVaaHPmWcn9IkuJgBJMEbNtR87gKZ+rnnOY8MF5XWTZGKE4g==
X-Received: by 2002:a17:902:fc4f:b0:229:1717:8826 with SMTP id d9443c01a7336-22bea4c0072mr37888105ad.28.1744363057337;
        Fri, 11 Apr 2025 02:17:37 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f0f28sm1043940b3a.97.2025.04.11.02.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 02:17:36 -0700 (PDT)
Message-ID: <4a737b56-9d26-4f81-a7e3-8644ed787373@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 14:47:32 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/6] arm64: dts: qcom: ipq5424: Add the IMEM node
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <6298f149-caae-49d0-af68-c3d102d0ef7d@oss.qualcomm.com>
 <54efe237-01ea-4f98-8dbe-390d344aa6cf@oss.qualcomm.com>
 <0b71ee9a-f222-4254-bc12-4c98854f44c3@oss.qualcomm.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <0b71ee9a-f222-4254-bc12-4c98854f44c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CaRktbMnnVXb2kOavOy8CMeHTtZTQ4xe
X-Proofpoint-ORIG-GUID: CaRktbMnnVXb2kOavOy8CMeHTtZTQ4xe
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f8de32 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=NJF6hevOwqtteAhcjXIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=945 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504110057


On 4/11/2025 2:33 PM, Konrad Dybcio wrote:
> On 4/11/25 7:01 AM, Kathiravan Thirumoorthy wrote:
>> On 4/10/2025 12:11 AM, Konrad Dybcio wrote:
>>> On 4/8/25 10:49 AM, Kathiravan Thirumoorthy wrote:
>>>> Add the IMEM node to the device tree to extract debugging information
>>>> like system restart reason, which is populated via IMEM. Define the
>>>> IMEM region to enable this functionality. Corresponding DTS and driver
>>>> changes will be added incrementally.
>>>>
>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
>>>>    1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>>>> index 5d6ed2172b1bb0a57c593f121f387ec917f42419..a772736f314f46d11c473160c522af4edeb900b7 100644
>>>> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>>>> @@ -486,6 +486,15 @@ ssphy_0: phy@7d000 {
>>>>                status = "disabled";
>>>>            };
>>>>    +        sram@8600000 {
>>>> +            compatible = "qcom,ipq5424-imem", "syscon", "simple-mfd";
>>>> +            reg = <0 0x08600000 0 0x1000>;
>>>> +            ranges = <0 0 0x08600000 0x1000>;
>>> It looks like this should be a little longer
>>
>> Yes. It is 112KB. But only first 4KB is accessible by all masters in the system, remaining regions are access protected by TZ. I shall mention this in the commit message in the next version.
> I think we should describe the full length of it - it's only if we
> add a subnode that we actually access it


Sure got it.  I will describe the full length in next revision. In that 
case, it would be the driver's responsibility not to go beyond the 
initial 4K.


>
> Konrad
