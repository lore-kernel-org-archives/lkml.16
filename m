Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1117E18E20
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750441153; cv=none; b=cJP+OsDxvR7XzWpM2EKW3bNVaPx7a4+Sk1xZ+nFECeVKCZUgpGulz9lMWl5GQPLm38nPEOnmkyxyT86rMH3RQNDtrCPKYgf8YFl7+lJxZpgZMsKG3oud7+TjpCLALigscLExgUvnmPcniiC1aV4sQ3/78vuZtX6fW3JW7vhLux0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750441153; c=relaxed/simple;
	bh=oZD1xNj16wBtMPl2KYpBMl1KQEJsUgQ9ZavXtFYw6i0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DSZR6z59JyqstCygm22gd/SpmS4sCmjrU0haaa7cSVqN8oBCiCz4EqAzCzyusTwf1iXOgrVZcXTpMuLO0vtxdjabDj67wKRrobij9KF3Edvys5B2oTqMSQmdggzvRgeX8FNsq2mI6Yrn6IQDQymvY6SMDoOhL54QUHRUEHJS3m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fuufy6ry; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fuufy6ry"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KFRUBf024291
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MIzQyroerxtQLieSpZxpk3xlFK40waICuo303fVMmi0=; b=Fuufy6ry8qgXPJPt
	JJEosJEMbmSyKSA0kmjxQrwb8SGypixrZS7uneGJL5ogRsBI9VMW58JdGyY9YgXB
	mbNRZqPwTNv+H8Xw2CNCOmhXSzo3f+dew0Y6XNzEDe+kha7wAUQcl5oFu7Tc1eyn
	wVLOiImOuhhWfOTgip69DjB1FkJLksmxDzd2RaWIMXcyU06lC2+PjFSpuxupNETH
	YWT7rT1yflnGE+4mb1PHjFBL+lZa7sN5TsEcR3m0wxTL49ih26bZwe/ifc7khWao
	92oxTadDoYJbc5WXv3rWLuBbxwGxmd47upAu6EPqnjImsW7m0B5P+k3S8cx9GiEp
	EYHCxQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47daa4rc6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:39:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fadeceb4c9so4265136d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750441150; x=1751045950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MIzQyroerxtQLieSpZxpk3xlFK40waICuo303fVMmi0=;
        b=J7SAfWbVbwwVmvx1Rh+ZGnpv8+7i9C4oxcrAhSFnyWGbFDRq9PHTYQ7l0ftQKEaevA
         LzZpVZ3pTzhdbpdUJl6avneQHP8fng56HVHEsxcxMhlpLkYVNkfFFGteWEeZRJG9dgXn
         k+hlrfZdeoCrgTlaCCpXFfjGJcR7VHBRDHnKZsD+jkqkQKOazGivTgnK/Ozv2vLm0jZ2
         L+YS2oNTR218X91kt8hIoghFVwQayftKJAXgluK0vxpokljW6K6SX3TQ1JSp31rXaFPX
         4PT2A7jiQ64w0F18Wu0kGW7PIJePUrfCQxIwrJCU1iotcB+RAI2ZiPpfmmEHgd2Yjcew
         NLWw==
X-Forwarded-Encrypted: i=1; AJvYcCX0JF1BVjHd6SPl06x90aFoysXFJ1Yfw+tB3c6OMrBZ98A0eJNzKDwSBozXSYKksvoWwd20xSkji8kOS1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOCnlQt6VtxVR2du6AuhdY9DVQixUratCh2tVbB69xVB8jr8HZ
	9qdA2UmS4XWVwoE6AhB/rg8C2UfmM6tlXbo0kAIXGekGHYimgMvrm7dUOB7uCs+ygHirpRZnwqo
	0ubtlFsgHitJ1zE/WPd5uk+kg0b2Wm26D0MoxISPUwoAk3UdswbXWAA2SxUfhShxpSaA=
X-Gm-Gg: ASbGncvguSUlv4RqKJwLay2u0+F0oHQ9QctBm3a0sH5lUzYV5GT30K5JCg1EMKal7Wx
	02rzu4Dvg3sFR+IkRtP2dtCWn5ibcEq2bj1CL7bFgK7pTcMFGBYGVnQ12OstjHb2FiuJi/4Rh3m
	dC0jmrHZRobgBHgYGdrLsLy50bKq+JhOIiPA6L6p6lr3pvG1cF4/YXoffSp2EswWy/CrGhQLJA4
	RoIPa+HzVu6/yr+3xwU2F+WPfXQ7rSU9Z4ftbA6e+sBnUmXZRFhU/HyxHupZuDLKOnbNhAKBvw9
	gVqlhoI6yU3F7bpVf/lAKXm3ZQFc9A/1rw0RoC7tPiX61I6D3zGBRi3ThyRIKrCWsop+kc71IH8
	obUs=
X-Received: by 2002:a05:620a:608a:b0:7d0:aafe:dd6 with SMTP id af79cd13be357-7d3f98b45efmr205530285a.1.1750441149940;
        Fri, 20 Jun 2025 10:39:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEldEd/5u4LjK+ngUSwInt4G+HtJbJuyQ7dN6nn2mCwiZYCVBKZAsFgmxDZfrnlwznHevAmEw==
X-Received: by 2002:a05:620a:608a:b0:7d0:aafe:dd6 with SMTP id af79cd13be357-7d3f98b45efmr205527585a.1.1750441149405;
        Fri, 20 Jun 2025 10:39:09 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0542035ddsm193586066b.147.2025.06.20.10.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 10:39:08 -0700 (PDT)
Message-ID: <ffe32102-cc55-4f86-b945-ae77a4e163bd@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 19:39:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom,sm8450-videocc: Add minItems
 property
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20250618-sm8450-videocc-camcc-bindings-single-pd-fix-v1-0-02e83aeba280@quicinc.com>
 <20250618-sm8450-videocc-camcc-bindings-single-pd-fix-v1-1-02e83aeba280@quicinc.com>
 <4657c6d8-8454-478a-aac3-114c6194b72e@linaro.org>
 <5ed72663-da54-46a4-8f44-1ceda4a7d0d9@quicinc.com>
 <6068badd-8d33-4660-aef8-81de15d9b566@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6068badd-8d33-4660-aef8-81de15d9b566@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0csQ8Q9RX-86Mj59Bcc5mUCx8JtavVxk
X-Proofpoint-ORIG-GUID: 0csQ8Q9RX-86Mj59Bcc5mUCx8JtavVxk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyNCBTYWx0ZWRfX3pItPaUroKni
 72UbxJAvTfgAIG034J5UjiwEScm0RGsuBwYld3c6Leg9S3fi9kmAhcGSsJvfIoNvJILyFGktWO2
 5+nOyIII4HzgKdjScUhjbJKbs73BXxoSTA7lfaB14BUH9UooG1wf14eFxY6qauBaZdXrZ80xFfJ
 cI2fZQ6KGyZX1c+nGdkHhQeDDsgn5JqH6eq5ZoExduuXBYniXst280YMYqe/ZRhLHnxGm6daCiW
 0D47iR00P5dc32y/Rt/U/KhkpT7Bx/DW02od8ZH7NMmwZXjpEg2ls0YmPAgVNHFUCQOXwklBLMi
 Dzjph+PwdgMPwlZJ9ZsuUSQPd7X1QGIAeQeu5dZaVCF0lf9u8Ip9D58hqyILoKeMTKM5VGEXpcM
 ASDivk3hXxaWgiAYTUsuiwhNlugamOWyygYYtteCUzyaZ+yYTXnvx5V8KNIGr8ssvNCCGGKw
X-Authority-Analysis: v=2.4 cv=KphN2XWN c=1 sm=1 tr=0 ts=68559cbe cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=-bYYbqjr0qm3h48m4OUA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200124

On 6/20/25 7:56 AM, Krzysztof Kozlowski wrote:
> On 19/06/2025 12:20, Jagadeesh Kona wrote:
>>
>>
>> On 6/18/2025 11:56 AM, Krzysztof Kozlowski wrote:
>>> On 17/06/2025 21:07, Jagadeesh Kona wrote:
>>>> Add minItems as 1 for power-domains and required-opps properties
>>>> to allow this binding to be compatible with both single and multiple
>>>> power domains.
>>>
>>> This is your hardware, so you know how it works thus I expect here
>>> arguments why this is correct from the hardware point of view. Without
>>> this, it is impossible to judge whether this is a correct change.
>>>
>>> If I overlook this now, it will be used in discussions by other qcom
>>> engineers, so unfortunately you see, you need to prepare perfect commits
>>> now...
>>>
>>
>> These clk controllers mainly require MMCX power domain to be enabled to access
>> the clock registers. But to configure the cam & video PLLs in probe, an additional
>> MXC power domain also needs to be enabled.
> 
> 
> Then your patch is not correct. Anyway, you should explain the hardware
> in commit msg, why this domain is optional in the hardware.
> 
>>
>> Since the initial DTS changes only added MMCX power domain, this change is required
>> to be backward compatible with older DTS and avoid ABI breakage as discussed in below
>> thread.
> 
> 
> So you send incorrect hardware description allowing something which will
> not work? Or how exactly?

So I think there's a mistake in understanding the backwards compatibility
paradigm here.

There exists a single, objectively correct and represented in hardware,
list of required power-domains and the commit that caused the schema
validation errors was essentially "align YAML with reality" which should
be coupled with an immediate DT update to match and we forget about the
incomplete past

Konrad 
