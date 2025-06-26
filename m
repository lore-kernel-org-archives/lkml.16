Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D3D213E66
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 04:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750911235; cv=none; b=ZKC2RldU3U70/G774H/LgJSzXyGOsdoeGrlfeahrp4P2EQWk5WAhrmgiDhp9MwXO4xxtYWICLfobQuhGk2tdIgBPaUr+qUMX81GRC6hKOCicrO1vmo5pVCdQ954+7Lh8hs+ZChg3bYaYe8xqcx71+oCxWGpDjvZ+hAWqnogCnPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750911235; c=relaxed/simple;
	bh=b6lVQfJ0vHuT8NK2TkY0gGK7zVYAP+7JYX187Y436PI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g1U8mJHcqs2A0zGXeCtFRcL8By5B3oolHK6qdzriLyX1Xb2K5abm8Jk932hOvyDFLUCK6T/EMUl41X+5msnciv7yLNMnltYvozEwHO12YC0s6pdXzBc0Q4kC359kzEnRzvYyT8AIjhYxpvmnjGoVRO+gT4gME1jpFQvDyAAWRSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mooySDSQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mooySDSQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q0DnlE026632
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 04:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WKpaUH3ipuBOWo6fi6C40F5MzgfHqDpT6bHI2/67zCs=; b=mooySDSQemqTTQSX
	OHqw4k6q4ncS3vGS9VS+KyIvwPj5zPkoH2/eK6NZrZWUTqnE6UKqxC28lciQwMVI
	dJADaOJfhkvIRO8IDa1LLIR0iFqLG9Ds7NHH/zvma8D+9IeATUmnw5dIVV2oNeRF
	6wKOTTHkIB6+bPWWRxwfJKPfMc7ScfvO+KwPYnVcv+QxWKxRq0uW0yg7T1i0xenp
	StAg27dSCOpSdQHFOo/9RT5B6YzMA4WUrLt+CTKgyJU6mIl4CrN2f41qG8xeLJMA
	noVN2PiC7yi27fE1PR6n0aBhtLobes27hXV/9mcEsqB8PeWzSB7tqx0xDI+OqWbL
	ipRAuw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5u266-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 04:13:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-234f1acc707so5268145ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 21:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750911232; x=1751516032;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WKpaUH3ipuBOWo6fi6C40F5MzgfHqDpT6bHI2/67zCs=;
        b=qIRlPXeS96Rcg2g60l0Oos31+ziLBZ0/vJEcQoMj8E+QeLewY84S5Fi5EZUP9PbyyS
         SZ/cphTVKXJDKzsHTimuVPdoF5vNzZATpv7fCDn/mn6HZW3ALZpEVVDOr/v1RLef+fHG
         eDiRvVU3tufNMkuKqK14u38XZVMCpVI1Z3qH79kYTlgk09X7vmR9L58ZN3KUjPo8NrS2
         ApYLdC7GVmYKHYreoIaQIGaNHBcYKRd0IsLwcMzBbEsWLVTKUSJkHFlsnC889JKu4VKO
         G+vPBqIiEvLN+dvf1Xxj2s/WR6p88qh0ce9BV4mKPjJs8ejVbwUyfHmCye3/CPWlyqu4
         0lwg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ/7G7vIY1ici3+Qn+YHba7SolMnRKd1Q9Fahk7Gk9CdMRfnQ2nNO4IBWwKp0dNGmG1RXab2h8gDtiJ8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCrFtcqlq69inbqyXx/M8q4BHGmathzX6Y44BfWIQhcEwiOToZ
	pij5v6xMMDpvsYbV14ByExsw8XhkDAN2dlavlDgARxqOZ1UXTvTB2/or2mlsTHGw8kY80FbTsku
	gpw2G6zhyDZd1pio4yVoyi0KcMiavGPt5+NKmV3h1ZYCBjS3IeSLm1Dt46oCAcDAqOw4=
X-Gm-Gg: ASbGncvwnULidEQNslO2l3TSMUzPJqiXqg1cdIrJmfNtIL6iM29CujpcvMuFhzkgXoE
	MG5jfGOIagG2Ydb5vREI4ctRl0ablmKf6z3sCuwLS8bgQZB5fhR1ednGKX/DiMoJLIlsdnst0x6
	2zkyMplUoGgjiobv+MF6hWqxowr57M30kf4uV6LArcOUzuD5UVR2pV3rs4RTV6RyCKKOLH4tBPp
	Vexo2yqyv3E78lRSvHew4qnGe5mOE7vRoayYdGK8g2nIQ53vnEvVJUhlqv2MPat1dipRMIjezom
	VCL6GkilPRWfS9OHUhPM/xHSUa6nphSejOMfjs3Z8l8Va7HcocS9jfQlU+TIY0w=
X-Received: by 2002:a17:902:e80c:b0:234:cc7c:d2e8 with SMTP id d9443c01a7336-23824062835mr82016905ad.37.1750911232008;
        Wed, 25 Jun 2025 21:13:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXPk6FeEEtqsAdoxjcE2zNg/rqvl84KjzqDPyy3NBWA71HBoKOuG1wxIQkEElpXh0w3mnQlQ==
X-Received: by 2002:a17:902:e80c:b0:234:cc7c:d2e8 with SMTP id d9443c01a7336-23824062835mr82016515ad.37.1750911231447;
        Wed, 25 Jun 2025 21:13:51 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d866b000sm146530625ad.162.2025.06.25.21.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 21:13:50 -0700 (PDT)
Message-ID: <eb1a43a4-bc10-410c-a747-e2efd1c46aa7@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 09:43:46 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom: phy-qcom-m31: Update IPQ5332 M31 USB phy
 initialization sequence
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@kernel.org
References: <20250625-ipq5332_hsphy_complaince-v1-1-06b4b8e66bc6@oss.qualcomm.com>
 <dad809f1-9fed-47f5-9aea-34369a9b3608@oss.qualcomm.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <dad809f1-9fed-47f5-9aea-34369a9b3608@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JLQJpB4BeDlPD6j-MGntX0v2ZVBG4olF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDAzMCBTYWx0ZWRfX2UCS/s8yoThe
 KKh7WxwlER7GHy5gUiXKWQxE0wYfcv7alKtCJgkqGtejjElTEiLgYm2pH/kxGnWHlb6qs6XB35y
 ljTKytyfjtHyOCMWl+hPKiPWwAHMCdjMmhBl3mZbKwKeNrvb6rHC1sK1EDhfBqBdgBHZrb5Abxt
 in1GobuZ45HTHjMwifh0JcaP2iEtDIk9hLYZYKDoYzXfewYVSRMSEq1xH2evzudHZPZElnJYRdW
 pU3G4dBK8MVjFJkJQlPM9UMziampA1odvSDbzoaFEVZSbHCUbKBSFy3DhQy4u/AnElOIc9KfH6j
 4ccImdlo9OuLwpzKjlLz7XrxRQa7Qtx90dCocu0CqJj3/vU4aMv1AmJZNcKkaSdUeNPmkobzw7t
 vmKIff0U3FuI6fND+VM6C+W72ydT5KmtWbqW9aayj7I3jB2njGajqtwVXPum8+8RC6I5m0tD
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685cc901 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=G7AlkcFLQFj19gR95hsA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: JLQJpB4BeDlPD6j-MGntX0v2ZVBG4olF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_02,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260030


On 6/25/2025 7:28 PM, Konrad Dybcio wrote:
> On 6/25/25 9:00 AM, Kathiravan Thirumoorthy wrote:
>> The current configuration used for the IPQ5332 M31 USB PHY fails the
>> Near End High Speed Signal Quality compliance test. To resolve this,
>> update the initialization sequence as specified in the Hardware Design
>> Document.
>>
>> Fixes: 08e49af50701 ("phy: qcom: Introduce M31 USB PHY driver")
>> Cc: stable@kernel.org
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-m31.c | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-m31.c b/drivers/phy/qualcomm/phy-qcom-m31.c
>> index 7caeea1b109e922c0cd12e985bc8868d5bce8b4f..1a8a0f1262cd95bc00dfbf7397a1c48d88d52327 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-m31.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-m31.c
>> @@ -58,12 +58,14 @@
>>    #define USB2_0_TX_ENABLE		BIT(2)
>>   
>>   #define USB2PHY_USB_PHY_M31_XCFGI_4	0xc8
>> - #define HSTX_SLEW_RATE_565PS		GENMASK(1, 0)
>> + #define HSTX_SLEW_RATE_400PS		GENMASK(2, 0)
>>    #define PLL_CHARGING_PUMP_CURRENT_35UA	GENMASK(4, 3)
>>    #define ODT_VALUE_38_02_OHM		GENMASK(7, 6)
>>   
>> +#define USB2PHY_USB_PHY_M31_XCFGI_9	0xDC
> lowercase hex, please
>
> also, please add it below XCFGI_5, so that it's sorted
> both by name and by address

Ack. Will address this in V2.

>
> FWIW I can't find anything that would back up these changes, but
> I trust what you're saying is true

Thank You!. These changes are tested and confirmed by the relevant 
folks. I will try to find the doc and share it offline for reference.

>
> Konrad
