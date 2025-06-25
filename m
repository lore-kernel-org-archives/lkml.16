Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1A92638BF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750859941; cv=none; b=EThD9jxV8QE0rMAbBea04Lm9wGBvRzjVDtexwVgDzkrvT6HUfoeAGQp3Yx05K3gh7750SaPhTP47egPAA9M5XdoB4yO2oHslnU6v9i+1mPuCEn+ZmP3+lFBvWpzbnTmGFS3VgjXr3RhQ0XRiwHYw7XD1lgLCOI9XC6AvBLKrYzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750859941; c=relaxed/simple;
	bh=130S9bxiaGr18X+StU/GtbUfHDTUA08FpPwhzz2AgdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LVGfpZAVsTWVd1vUFIVGXJnwflL8LqR6eikSOKHAxgNixR2otusEfDZAFa2xsac58EPP6r1+y0zMylVECQrIAaGpgsh7ENIhrzkOSysBOQ4rmk/9EZKM3oruwzi92Y7aCLPlCBFK4TocV3GM57qBhxchgc0a1O0cvSc63W9QEFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g9SVWrSA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g9SVWrSA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBVuEx025855
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0epQL52sRFpo5wPl7F8s9Uz+/mQ9UItS9grZIjzDZU8=; b=g9SVWrSAabmrhvDK
	kqGnDydOKm7qmUHNbOV5dT313ZaJ3RVg9v0u5y/id1sjYLoJYA/rly0WhEzmz/ZP
	JuqlV3pXxbEITT57AHbzF8Za+w5VfAKpvQElDGpjYWutczbVaJKKJQEHNVrCoD9L
	b5kzRcQ7nnX/Zxa8ArpCZnkpPGDKRqAgZ8J2QbJLuYzzCmM3UWyKEq23dPnuNylY
	QvxGpnGwJl+xPXBMn9p6EZbWAoqBWp48hgX+MQLX2s+ELtL6l17/HIyov1YD7jcz
	vlVFMLjeqLv2GiihAkXQISP1rbgu9hlBGDgpGio1AE2M7z9bpZCIra3XAV3PVD7b
	47XT9w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmsr20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:58:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fabbaa1937so13199996d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750859937; x=1751464737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0epQL52sRFpo5wPl7F8s9Uz+/mQ9UItS9grZIjzDZU8=;
        b=UZmnTvPuuE/C3Q0cGGrqZyCk9rcJplX9qSTHCT9Kr1Ib5E6C/cDBTH+EdUQ3a2FrCG
         2txTRTI8MdmRsQPYD9u+yOk2YYPjmYMXctAejPPpJ2eF+pa163qqL5fVeZgjkqa5qMW6
         n/FaFrYCfm8gK1+vRrzbEoJ3XZfJnUrrlmWB9MjtSaNVoTtKZ5FM/caNS7tlMxvsY2yX
         gIMd4A7dqpkGvwV6xjp8IouQsfS6FFzLbMrWFMiEJ78chmhkCOWevwp67OJuO1VIZp5T
         HTZ6c0m1xnZsIF4e1Uy/fiaoPp9j6OXUBQ61utotfSY/xkQnmBCYDUNSLlV1s8/ndH/6
         1YVA==
X-Forwarded-Encrypted: i=1; AJvYcCVbIzroCmncxHzQYFUerF6DkOSqgdN6uuMLSevklUR2Vq7dRo1L64fqyuQ8gsGjIcj9EpsRHyFqx50GxGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzqE5+h2j88vdKrV3nqvOVlVXPxNujHHOaFEy2zT4uTb8eiSTC
	e0jdtGEQ96yzGBsubBfCsklHAAThrMGMOqP29g/g8YsJi+VEb3Nr6oEsjdfQo8kKEa7/aOcpSQ5
	1KgDrzDqOp2BYMSahP7lu3p8mgZ/s3+Hc1+kJL0P7jJ2hM2FqukbSXEtOwOfh6bKCx+A=
X-Gm-Gg: ASbGnctG8/rfoFbYuoxnSIEn/tEZcyX62sy475zGucCIQN81Mkaxz+8Nd1rTMj9FObd
	BJEYSMSALcHiji1rj4rCV2gi3Fxpl9y3fh6N8x4Rxfg3f9kSvmvTvEUeXGP8JUaJHKUfSwaz9+8
	l5L+7fU8KJ9sStyGmQDPW8y5/fvvG3rmLRCBAm3EMki74+7QZ4FNLfwDK3uvuKmSoQazk0aNYVp
	+x7yMh0JkCp9ISC6m/Ok+7Au8vtDGNW+OxP3Zi5B7aih4XL1q3btv2TRKxBR40M3wD3MqEcN7Cv
	qd2LVN5enHZTz6yRTuccewzZOkmg2AvpisRjvCctNuoxwUqtlP7LKyj4REhw1aVEA5SIfVcLVgn
	/Ovs=
X-Received: by 2002:a05:620a:2850:b0:7d3:c688:a590 with SMTP id af79cd13be357-7d4296e98bbmr129502785a.4.1750859937540;
        Wed, 25 Jun 2025 06:58:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOBuskppWHr06INko5Hfc6FbHRQ7o7cAxpx1dWgr12t5+vbJwAvaZ8bDq6md5caYgmp7hBkA==
X-Received: by 2002:a05:620a:2850:b0:7d3:c688:a590 with SMTP id af79cd13be357-7d4296e98bbmr129501085a.4.1750859937027;
        Wed, 25 Jun 2025 06:58:57 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b887ab4csm193727766b.129.2025.06.25.06.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 06:58:51 -0700 (PDT)
Message-ID: <dad809f1-9fed-47f5-9aea-34369a9b3608@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 15:58:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom: phy-qcom-m31: Update IPQ5332 M31 USB phy
 initialization sequence
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@kernel.org
References: <20250625-ipq5332_hsphy_complaince-v1-1-06b4b8e66bc6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-ipq5332_hsphy_complaince-v1-1-06b4b8e66bc6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wwOBw83G5dgziw9ak2RA5vZY8fFdf74G
X-Proofpoint-ORIG-GUID: wwOBw83G5dgziw9ak2RA5vZY8fFdf74G
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685c00a2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=piobYN4nb8Jc23nr414A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwMSBTYWx0ZWRfX1STntxPJIxsK
 YBX2S1qk2OH/PwegwHzEeamjlPRVucjHRwKmz7nBochN6AKW6AQ31m9/eg8lWyb1GDfcdZtX6by
 WaWoXj85kaXzhCZbJDHQ/1ZC9pKaeSk58kEcwS/CTfuk2mUaC3EqJQm/nLUgR8wsfAO7Tty7o8Z
 604g+KSqdAbuX9dt5aWjwug855f+BHp5wuZuMsbvGfhb0EhaVJvBOUD2848QNgrbjaFJf0CUQyn
 rZ4MHSmdRjhYfSG6qohIW5w+WNrEvGMoDFcSCpqP1Gl1K9hXlv+NbG37balZWntcKCFiBicO0k6
 YaOViuD5Wtd004Ylg0BHpt5BK2bUPR2ka95IqKwMlnCIHle6PjhV8yelGbJZp1D28PTPIyQFt1u
 +nobxYA/OwLVli2+EUvQzz36oIRqYtmvnIb4/iWZP2an6cDlNAaNQ4+k21M8T7tBVRh1Nst0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250101

On 6/25/25 9:00 AM, Kathiravan Thirumoorthy wrote:
> The current configuration used for the IPQ5332 M31 USB PHY fails the
> Near End High Speed Signal Quality compliance test. To resolve this,
> update the initialization sequence as specified in the Hardware Design
> Document.
> 
> Fixes: 08e49af50701 ("phy: qcom: Introduce M31 USB PHY driver")
> Cc: stable@kernel.org
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-m31.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-m31.c b/drivers/phy/qualcomm/phy-qcom-m31.c
> index 7caeea1b109e922c0cd12e985bc8868d5bce8b4f..1a8a0f1262cd95bc00dfbf7397a1c48d88d52327 100644
> --- a/drivers/phy/qualcomm/phy-qcom-m31.c
> +++ b/drivers/phy/qualcomm/phy-qcom-m31.c
> @@ -58,12 +58,14 @@
>   #define USB2_0_TX_ENABLE		BIT(2)
>  
>  #define USB2PHY_USB_PHY_M31_XCFGI_4	0xc8
> - #define HSTX_SLEW_RATE_565PS		GENMASK(1, 0)
> + #define HSTX_SLEW_RATE_400PS		GENMASK(2, 0)
>   #define PLL_CHARGING_PUMP_CURRENT_35UA	GENMASK(4, 3)
>   #define ODT_VALUE_38_02_OHM		GENMASK(7, 6)
>  
> +#define USB2PHY_USB_PHY_M31_XCFGI_9	0xDC

lowercase hex, please

also, please add it below XCFGI_5, so that it's sorted
both by name and by address

FWIW I can't find anything that would back up these changes, but
I trust what you're saying is true

Konrad
