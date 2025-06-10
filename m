Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70B6265298
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561036; cv=none; b=gP1gETqQjlvmB4nQ/AXI7GLsCqHYmsLXwHyHyzCmTfD1xBDjTIwBfg5tt7n4LxMlEPIT9a11sIweHVX/LVVIafd8R4Eswvd3v7AwPA2j/tJ4/aE+GMlxetxT75u40piQMiPywS6mTgjAA2MlfjtjLgkOfesqWXZRsQEO/+2hSwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561036; c=relaxed/simple;
	bh=Ts0Iw3Ahis8cTAYQdc2ZByvjVGvAPl9GgjB4tH7AWbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YSh6t/stLaCArsYe0ZVVWnfrPCnANtcijWmJvahwgb4Egup/bPLOxnBX9VAaJKMlnrEotjL6CakR/0pbsBqZ/GYH50zB0q0ZjoFXmy5SHt/GS+zjXl6vedxfwBYf4QTHDj9AVjbQ6AJ92AenFp+Xc6JEXwaWbCYA+s7a/8e8Jy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=drLTEoAg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="drLTEoAg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8pKOB017182
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0fnG7LDpMxmNetZCySRTc6QnPh9ME2bTSyY151Npfy8=; b=drLTEoAgkWYtxu6q
	hEBfxrVQfeodxY+ZKHE84mxQAmMmwt9H0cpUOe3guT2WmAUOFE/PXsXOvGzhxEGq
	n1goPiQ2fmlaujKSI5udVE0+BMpna+WnXSHmQ5ynrzijO5eDzRBTIOUl8/oZRrLd
	50tc0QVlYp/nhgMn1ck88kyjH0EmIrbOHpMk/Sr9+nk1XjmtN7IdhmLLfxc1r7bQ
	YQdaMHhIiIErf9nBdNS/95Bhidg7sTXk5HruXlaC/FSu4yNGgMmg5dp0qcV512Bl
	4VyRTHJEC59mfBvcNED2JIsu9fGyCdYRuLa9mh6xUz8WyUEg2ckLfZW+wF3/uP18
	KTkZqg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4766mcj8wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:10:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0a9d20c2eso108817985a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561033; x=1750165833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0fnG7LDpMxmNetZCySRTc6QnPh9ME2bTSyY151Npfy8=;
        b=qxiZA8jOdg//WRNlVAxOcarf/Cn+cVpkH3qRQrqBo+cwiO44qA/djSBVK8BXJXjou2
         53Sn25BA8/UExgAyYagizj+/Ku0MB0jWTOS0GYYG958CcwRJXxIeVvk9zUNpoxjVl1v7
         h2liK8/O6d3jY70RyOipWTyq0Kzch4i9U35NIJcni4D9M2gALbuvUpMDaLlxz2pk4PRo
         X2Dq4+o6JrtqUH/mLimI9dj5PWWwfKjy0MYZJu14x/QYVW4WqS3NabHjTQPkjMd8pC/9
         VbOCW+1L9hPl+3+OqPrh8m+ro2qAUtxbAi09GF1Nkp4zNVO/tbhb6dindLVqEcUMDOcZ
         p1GA==
X-Forwarded-Encrypted: i=1; AJvYcCUEPUwIayTSImjsXKdRAUxCKfT54ml+S82o33UcCZXBZ8DvuTTjiKrC5NWhnlbduZEOZwrtDYYDTLMNMRU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp12yRIPtOTaB2P1q+mSSZLhZoo0o9S0ln11S7uxA8swNt9amX
	I1M+sQrj5Nqufpsv7NBBjI6qj3Na2+ufytCJXt8I+VkwKvmK9mRznY10Q2NWZhOKInatx/G3S3j
	OqFdCafBk7Eh7VCKGrcSvQV19WQ1a765R3dtZ/NzEI0F4DPwk22oLVOnP+FWxmep2M28=
X-Gm-Gg: ASbGncvUvXfVym8KphFUJWRInfPOmgNzeVDuQE5Oh4KFClSLrg0mOssHnJr9gPrzn3o
	bfMnz66FGjWH29IEEI2oHDcFvbD2zpfKukosO6jBvQHxZy8Mv5icoyS2yUELddQ/ahBnbzzRZQL
	211zSUe45BELbQLymM9Prf8MQ7XsbLUuLSmgJr0B0XVaKPv25p2XRPPV06W1Ayt4xfRWbqXJKbK
	Wr9PKQaILQuf4WDyP0oBYWWb1PVnK9MZBpJKz8Rahl4s9l0sOVVf0TxevV9It0rt9j3EjMiYRCo
	Zo80Z4ij6S3FwCpDDAOipGwZyCfAuQtnU/aliHXkoFzl9qNJ96SGHdV3Ops9GxJLe2MxXdecfhr
	y
X-Received: by 2002:a05:620a:f07:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d33de1d9b3mr786601685a.11.1749561032649;
        Tue, 10 Jun 2025 06:10:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp/WxiFPl2Uz+B0dTc3m6HRocZqolxA8939CdsdLCwBpvayFGBjAVHPZ8s8uQ5zvefRraTMg==
X-Received: by 2002:a05:620a:f07:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d33de1d9b3mr786598985a.11.1749561031741;
        Tue, 10 Jun 2025 06:10:31 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc38a11sm715239266b.116.2025.06.10.06.10.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 06:10:31 -0700 (PDT)
Message-ID: <74b7aec6-b76f-4296-b212-0e417fbc89f1@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 15:10:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] ASoC: dt-bindings: qcom: Manage clock settings for
 ADSP solution
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
 <20250527111227.2318021-3-quic_pkumpatl@quicinc.com>
 <171b980d-9c50-4891-86dc-e30d712f5384@kernel.org>
 <13b9cbec-3d7a-4deb-b356-685e73fdf2f1@quicinc.com>
 <a126ee43-3e2e-4cbf-9c36-c41415df78af@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a126ee43-3e2e-4cbf-9c36-c41415df78af@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T8KMT+KQ c=1 sm=1 tr=0 ts=68482ec9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=q4Xfe6m8orEoT7kQ_3MA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: DwbbStyJXVGhrQbW5hffr-eMLysmazey
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwMSBTYWx0ZWRfXykpFC1FgZvdp
 3TaB82dRmJZeJrWd1tyhdFaRmaqq1AwPBcw8lGti/aAzhOedXUAR9Gu9hQTzxSlN9CUNXkSa/Fs
 2gjudBo4dUNoiAr0C+W2AATDvnedZG3sy0K55pOcyi7kehRf6Wy5VVzs5mz7W05Cz+46sXPTNxP
 fwCcnfDJmBaaYXcXbkLT8Z7R0ro2xXweLOALOxJkakCnddIgqvbfrFlYCt4tpwxmXNE2knWsHBg
 KQ0fT4307e8me9dQ/Zt4QH57gCsAFIlFlxwfip/rccgx35q8Pft9QLvO8eT7k22PRTuKtnxY366
 oQ7ciuS0nT6Yeu6NRq8IB57chZVbn9NqPX0DANjkrPEuYa1ed2Aa/cKlN06FICFpudsjFtd2b1V
 PI/8/IsFf9XCPWgWbpYOrTHPcvsD1XmXY92F8iTsGze4YhxG2lpyJj3pYfgrV/xHmuw4d2Sw
X-Proofpoint-GUID: DwbbStyJXVGhrQbW5hffr-eMLysmazey
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100101

On 6/1/25 4:50 PM, Krzysztof Kozlowski wrote:
> On 01/06/2025 14:45, Prasad Kumpatla wrote:
>>>>         properties:
>>>>           clocks:
>>>> -          maxItems: 1
>>>> +          minItems: 1
>>>> +          maxItems: 3
>>>>           clock-names:
>>>> -          items:
>>>> -            - const: mclk
>>>> +          oneOf:
>>>> +            - items:   # for ADSP based platforms
>>>> +                - const: mclk
>>>> +                - const: macro
>>>> +                - const: dcodec
>>>> +            - items:   # for ADSP bypass based platforms
>>>> +                - const: mclk
>>>
>>> This device always receives same amount of clocks. Hardware is not
>>> different if you decide to not use ADSP.
>> for sc7280 clock handling only supports non-DSP based solution, macro
> 
> ONLY?
> 
>> and dcodec votes are placed using CPU-Powerdomains. Which are not under
>> clocking properties. In ADSP based platforms macro and dcodec votes 
>> should be placed from ADSP.>
> 
> I don't understand this, that's barely a sentence. Anyway if that's
> ONLY, then seems pretty fixed and I don't get why you make it flexible.
> 
> Expressing clocks as CPU powerdomains is not really correct.

I think that's some jargon for "power domains controlled by the OS
running on the CPU".. I really hope PSCI has nothing to do with it..

Konrad
