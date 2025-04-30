Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF3D1EA7C8
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745998970; cv=none; b=UuShtR55JNfvyGmPLL7jMaKG8ckYKnb7vzO+VwukOanyaE5mexJIvoenk3iiAiK54npXbHO0WinR5O0r1oAafIQSlAYAOmhsCQ0GltJOKybQb09e/zO00yaIJ8NwfWpXXacBuBFKLkeCqGFdEpu5SFfLfSAtN9jwlYvNOYoMtNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745998970; c=relaxed/simple;
	bh=kBCa1T5PcSrLrAN7dxbaZ2FQY6mQg/7bIWGUREStzeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ulZG8EuJA4b3kQwh3X5mNu9b2dlfyxu+Kkqlyo0V/D9OcaxdZT89W9KQLaJxkI+75B/imeQYTh2e74OeZUovcOstl3eN6qD26aTEmnQGF3mTgKwdOhrz5d6gnRTAzxC5CAT+eVVh+w0TN5VV0XZgUkahsji0vlygPgSdrHu1Hl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KwhuTM0g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KwhuTM0g"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLb6AF011110
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XUaVf9VHjTFcpUGhpbhMQ3Ge/NGsAqULXFPt+N3iG1g=; b=KwhuTM0g5TRdRuxp
	p1yF6augN97oLuwZxtZH2sKDfY7ZtdFM693woo4X7Yv4loY3aePEnAlr33y58sUK
	Vo9SxrAATy7sSqqKWHu4n+2qNIi8wfa27i911CZJf51wYs+QRdhjkipbiXSHUPU1
	yhZTLXodLC/XzKZPQIVETYljejBUArTrAlEaXOP0bsq9Q743PohUecKop0d3Bkyy
	J4cfDTNRsSh5Kq0kWhveAIGuBYyVAnEcMD+XRb+i2kiqgDNyh6VGwgO5vN6d1np7
	JFjwCIj7trqGR/baTEZlk44GH9CZzvqnInmtCUrpH3BKCXhHaj7aFLYUg9PrODnD
	i2hfzA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uas7rc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:42:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476695e930bso13167591cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 00:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745998967; x=1746603767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XUaVf9VHjTFcpUGhpbhMQ3Ge/NGsAqULXFPt+N3iG1g=;
        b=d09ivxwxmyHU/nVH9j4Dz709oD4AvjNv1uKaL/OVN0FZVfcxsRmdt3Tvkx4lErqqdf
         Lf0SrAiepVUv2TM9KMpPkTJwTzLqIOEgbZfcUt8mMxoEpdWOBWAHTB4fdyDAEm7RQr4h
         oPOUOmNUAjLR7C34U0OBfHB2CuXabg+kbPtWTazclJdPj4Vw1swJkzGn1YAzyCSv0GC2
         /9BpJAhTQVKMIn2vRtZTbZkUDARCQdIKLdbF2UpM0R7twj4wC8Szue76xfGZzYrhMuLH
         huxhVS7wZj7aWUNH+J0qH25fyfLVrct5qBEvAyzPDWElzwPFnQg/qxkCueqduV47iKa2
         GYEA==
X-Forwarded-Encrypted: i=1; AJvYcCWMw5EEXCJWyrS4PKCrCXG9TXvshrzvTEd6UQcDRRY6IMzJTg3sCYWV3xD+vt6bF3CMT+peOkPpwOrHv+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLGtaDdibxAVe0ZocoJ9h9bM3ki3xtZuh4ilTx1svIw0OsCEnb
	95ork6itSNPkEegKigRGwuFTzsZdkTwpl2atSbUa6ptoGukqv0Y8Cvz0HlVq8mdT5wUANMUFW6u
	BPWpenHbSDwOB2fT9inyqx0HLqoWaY+RWEDlnTv8g9rgzsBKdDbBunXAKBYmhcm4=
X-Gm-Gg: ASbGnctmHIrCMb+pVEUD/eHw9OXBJg/lY4oMXFK//0zPjstjt/AS3+FhAONQjaJk187
	n1mlU24QuD0JdAd7JNlHo5hn7ht6FDr43I/BQGo+1BzKNjQhBLPm0VaoBkrGM6V13GcXR9i6xfz
	ZcNq9xC2+HCqstRukgaQPrAh8GoXle4bV3o8StX+prEu3+ZssaWxGhnEatisV0WT+Je+AuLFwR3
	MUyLNiGHeRdqvyKdUYnQ18+KwCjinMrn0e7vAH/zHpDRae3M9flyKamgZvTdCddC1VYAxw7rkQC
	kt6pWTIUYnglB7sPHpAr9uSoq2a3+rKy20Tey6DTUR8iBIGv8uRcQdxBkw0MQRmmwAw=
X-Received: by 2002:a05:620a:198f:b0:7c5:ba85:357e with SMTP id af79cd13be357-7cac857731emr77705685a.3.1745998967034;
        Wed, 30 Apr 2025 00:42:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJFIi0dncAmVoeKyLj4QkQJlHUjRZmoK4qLIjwW+UX7y0o88dA8BCn6koU1U4nahlVTE6QMg==
X-Received: by 2002:a05:620a:198f:b0:7c5:ba85:357e with SMTP id af79cd13be357-7cac857731emr77704285a.3.1745998966696;
        Wed, 30 Apr 2025 00:42:46 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acec28db2fcsm278111366b.17.2025.04.30.00.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 00:42:46 -0700 (PDT)
Message-ID: <8d18adf7-c1a6-410e-b3a5-496288825afd@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 09:42:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-qcp: Add qref supply
 for PCIe PHYs
To: Qiang Yu <quic_qianyu@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan@kernel.org>
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-5-quic_wenbyao@quicinc.com>
 <aAtbFQIQMJO-BYe_@hovoldconsulting.com>
 <e82eda3b-b27f-4584-ad23-562ca4b22847@oss.qualcomm.com>
 <aAt54vikoREWZyGY@hovoldconsulting.com>
 <17a1a4d9-fdc5-477a-bf4e-91cae5a62479@oss.qualcomm.com>
 <c4115bbc-e120-4a20-b6ad-a0d5266319d3@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c4115bbc-e120-4a20-b6ad-a0d5266319d3@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ctrFw-KsPkfZ_EI4hfzSmegOuhlHp6De
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=6811d477 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=U8xqaHzKl31ljCD5roAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ctrFw-KsPkfZ_EI4hfzSmegOuhlHp6De
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA1MyBTYWx0ZWRfX7QXzydMqL4iD 1Hd+Szu7solw+dms1iKrAIQsm1L0w+Zol04vJt/eZHSkndv3++DwfP+LxF7lUbt5uKII8Fsn/v6 qdu9NQUbJmllqz/vJveUrkHK2lE5yA/FhyIU/1XCj7RgvE/JT5giV10ZUJS9PE8iXqKGNiG5L7N
 UvtTd28uJQku+o7/ZPekxu9Tq9JTmVPflousZTn4qKUT8pKCSsXMy7iZQvA+J1lbn6av/jc4kxq nDT7cERzunw1kaUFbd5uAXnsjmbO+CTDv78n6g8jaaUYlOFLvoURXgeHQKuyMETWdt02VxVuK5H phJMUidKTCp6ZWKG/l5A1bXNOwelEc4XmBFKHWckmR6/ZnTx3boNhvVBbjY3DSwMNwg9WD8wrCf
 6iwS5bvOLGNrmZX6SSDbFxpLhGzGuzmk4kJo01w5jR4Mik3R0HbX7nxERLD2Lfaps/UNeySj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300053

On 4/30/25 6:15 AM, Qiang Yu wrote:
> 
> On 4/26/2025 6:48 PM, Konrad Dybcio wrote:
>> On 4/25/25 2:02 PM, Johan Hovold wrote:
>>> On Fri, Apr 25, 2025 at 12:03:06PM +0200, Konrad Dybcio wrote:
>>>> On 4/25/25 11:51 AM, Johan Hovold wrote:
>>>>> On Fri, Apr 25, 2025 at 05:29:55PM +0800, Wenbin Yao wrote:
>>>>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>>>>
>>>>>> All PCIe PHYs on X1E80100 require vdda-qref power supplies, but this is
>>>>>> missing in the current PHY device tree node. The PCIe port can still
>>>>>> function because the regulator L3J, which vdda-qref consumes, is voted by
>>>>>> other components.
>>>>>>
>>>>>> Since the device tree should accurately describe the hardware, add the
>>>>>> vdda-qref power supply explicitly in all PCIe PHY device nodes.
>>>>> AFAIU the PHYs do not use this qref supply directly so it does not
>>>>> belong in the PHY node (but possibly in the tcsr node that provides the
>>>>> refclk).
>>>>>
>>>>> Since commit 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100
>>>>> qref supplies") it also won't have any effect for pcie4 and pcie6.
>>>> QREF is a separate hw block distributing the reference clocks across
>>>> certain on-SoC peripherals
>>>>
>>>> If its power goes out, I don't think much of the platform would be
>>>> functional anyway, so it's redundant here..
>>>>
>>>> It doesn't have its own single register region and it's frankly
>>>> one-shot-configured way before Linux starts up, so there should be
>>>> no need of describing it at all.
>>> Then it sounds like the qref supplies should be marked as always-on. Can
>>> they be disabled at all?
>> The best answer I can say is "maybe". I would (without knowing any better)
>> assume RPMh wouldn't let you turn them off. QREF predictably takes VDD_CX/MX
>> and some additional lines
>>
>> Konrad
> The vdda-qref power supply feeds the QREF clocks, which are consumed by PCIe, UFS, USB and display on X1e80100.
> For PCIe, QREF clks are provided by the TCSR device with the following bindings on X1E80100:
> #define TCSR_PCIE_2L_4_CLKREF_EN
> #define TCSR_PCIE_2L_5_CLKREF_EN
> #define TCSR_PCIE_8L_CLKREF_EN
> #define TCSR_PCIE_4L_CLKREF_EN
> 
> These QREF clocks are not enabled all the time and are disabled during PHY deinit. Hence, vdda-qref should not be an always-on power supply. It should be turned off when the QREF clocks are disabled.
> 
> Describing vdda-qref in the PHY device tree node is reasonable, as it allows the vdda-qref power supply to be enabled or disabled along with the QREF clocks during PHY init/deinit.

We were advised to repeat this for all QREF consumers as what I said
before may not hold true for all platforms and nobody's gonna play
whack-a-mole with this

Konrad
