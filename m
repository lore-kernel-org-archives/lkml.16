Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C652BEC3B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751030222; cv=none; b=BP/7rt9kyeYgM1cuj3oDiGDj1VIu5pDU8dizmx2vAeIjh3L/Sg6Df1LWNDRCCCCfrNjf32479EUntSPaNFXvnq/4FW9FeXuyLNrA8XEWHYTXmvJ8PoS9TtAkmnJNRkGn97khe9DAFgUSl0zkGYVcjq5Bw0SDGuLwpU8CxA6QkGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751030222; c=relaxed/simple;
	bh=yiyNdGeiM0/3rnsrP8u+xLmDAXJYg4VU9hp8H1v8Pvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rl8TWfF5o04qvu1cfXO1/mrc/OJv1duwSTPL0EgalTpmZs9Z36x/Onej+EWoFustDATqMmM0svYMV2Z/WHrp47WB87EfhEcdygdC+4Oabv7+LcPxwPrq2ztqCzAw1/XjcsL5lvtVZKkm/8bRJT7mJlK7I03bn1Z6NgZa2DwA5q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jSjtysg0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jSjtysg0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCYJP1008316
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:17:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	khTFytKeLrUqbhsKq7ecq567W1WVbzKKiaYL2pfTB64=; b=jSjtysg0jKrjOltv
	oj+YJd+0uPzYj3WvNGEFQxvn2lQcPSLfGIqtco4rZrWbaWrsNgJqJZVBYJgpdIOd
	BbBg7qatnGCFyztJqxfmlfWBSviachjBiC5tVwj8DlL+px5Ig1YQ2RnR5uswc3t5
	D3MZ7tAITbcPE+43Ic2ylo1X7eluYRMP23xeA9OFspdYqXUSlpuKuMC40yuKYnjq
	/u5EoltyjVBEb0ccqXEtXKppp2SxiJPwrxzOdaWkKL6gUUk/YxyPfAFWV3wIuWrQ
	XDYZqI6tSI577IHKy2HTu8kZpRz1GgwK+IhLuaqhNt3aAWCR9mCvAHzMVrI1CCWY
	9gELsA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc604an-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:17:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0979c176eso43760085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751030219; x=1751635019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=khTFytKeLrUqbhsKq7ecq567W1WVbzKKiaYL2pfTB64=;
        b=rZCWvuWwp+TucjNVHds4hCqE5ef1fifK6uagupw0MobazZgVxutxrnoStZ0yC20dBh
         3jO77LrQ5BvGR++jZy/rRJ1c2rL73GUd4uy7oDXK2SsrCZpiI0qf0t06i7+N7ZrN++nq
         VV/PpdszZDXyqgr+Hm8dMFEnufW4pHzvoXE5ltsGFp/np1kojda/xNdezENvkrsgp9Y8
         +rwGDbBlee605w0V0o4YH0rZBy0RfvjuX74hPx+xU1ykJoFAmgPmjS2zYgfJkDO3IcZs
         MBvJB4/IMtFYKYd31EmBkumYAwqaVMQRXKyOBP/CZ7uVU8CbWwqBTVDQIi2DQWS8rxt5
         TiyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJpD37Ix1RS7449MOTTNTOPTw0bsibN+27lkBL/hFLVivun/rZnsMof3mSo2mx4ETVe1F1sJu0TiNAJCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhSHXEBrk8D8glFLtK+RY4a6r3EfAnY9z9LecRFWptrKQHqZ4W
	XXru6uamkqSiEdGnYBSQpgXaZSZk47yw2/rI4nBA78+CmjX8ewV+iZGslAGa7fC78l8qdre82em
	+e/2zppU6ax1O1K4S+MkaGLJVIaDsAQKnJCxN8Zcj4Hlw/MaYM7EODynyKM3+15XgKoo=
X-Gm-Gg: ASbGncsM30lZWEYmdKa4z8H8SU6lR9AaEgS2H7GILusUWw6M9K7cvi+XXcAap44BNtw
	DK2Nn5fcK0kCH5KD/1U8ScPWEdjbLK5u9F09RK816Q+FYLCMJuWpgcINModRsLOJ7S1ZML39jD6
	ANtawq91IVo0SwwDgySGs6wtF3ygO6nJNZsVWoWy8GL8N2EZPH6IXD2FqUvXlAs9BzfoqJQvOd8
	aQuI+6lIzgoNF8uS3gQFkjDAcdbyKiiiYNL9rvTAHl/z6giMgCDvfj3OQxXHAkilw/gbsBSowHJ
	tlm050XvyRQz0S+Zq2eryaZHElEI/O+ZY4tSQcoL2Yov2fxZHPTXmfR3DtOKKs1ComqPJIPlEgl
	Ud2o=
X-Received: by 2002:a05:620a:4251:b0:7d0:9ded:31e0 with SMTP id af79cd13be357-7d44388a2c1mr157389485a.0.1751030218722;
        Fri, 27 Jun 2025 06:16:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC61VItBRS1DDwdCG91Ja2xlvgLnLdWcajuTrRe6ZwgKpNp8cadb7nGVjQm2wEb5XU/R1Y5Q==
X-Received: by 2002:a05:620a:4251:b0:7d0:9ded:31e0 with SMTP id af79cd13be357-7d44388a2c1mr157386985a.0.1751030218095;
        Fri, 27 Jun 2025 06:16:58 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca1d1asm120934766b.154.2025.06.27.06.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 06:16:57 -0700 (PDT)
Message-ID: <b37e3aaa-e340-464d-badf-2ca014a88e20@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 15:16:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add PMXR2230 PMIC
To: Luca Weiss <luca.weiss@fairphone.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
 <20250625-sm7635-pmxr2230-v1-3-25aa94305f31@fairphone.com>
 <bced42f0-bc9a-47e6-bbdf-c49657d2e18b@oss.qualcomm.com>
 <DAXBXDDJAXDE.2V71E3E8F3GIH@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DAXBXDDJAXDE.2V71E3E8F3GIH@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PLVZAGyaqsg2FZUkEK0lwBxuAq0oDV12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwOSBTYWx0ZWRfX0HZT5KwIC7F2
 DucAYNRftKgUbQLEeKaPVXxVFnvouCEc5dp7EntLU9qrYNlmgxLLNV6vjjbVEIh4CtGPUOJZPJV
 sdp/GnPx+bjy4Zzcqsjxxdi9VnIYMJLcMPV8mkt7iJbY84ah2IOYPafGm+UYEo36lLeuwjXZA1L
 0EPPMPRMDdl8z26U9nIGlOeuW1wIXp4bxVzvDHfBgAKsYuaBKiesuJtQtTZ/wn+SFIhQ3lQmvlW
 RzDEGm7Mqr8Ptsnj5FyzjScF98UfOERVFkD//6C0vkPWP/obbs1LEhoMp4dEFiShIWCc4R7hydw
 uWEGdAsoTIZQzFU0Oj6o50dnHkOK25oHnp8O2gck7Z6jm6+dulb/WSmACd7ejm+bfEdRUuHll4d
 MY+NnW8SMAlUrsmy7OQdfT4q9jYGD2oufNzLIzQcrg+xfnfCXrkIWBErfYW5oERV+DGhrjDV
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685e99cc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6H0WHjuAAAAA:8 a=h56Vx8HxoSJ7g-UfYxsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: PLVZAGyaqsg2FZUkEK0lwBxuAq0oDV12
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270109

On 6/27/25 2:54 PM, Luca Weiss wrote:
> On Wed Jun 25, 2025 at 3:20 PM CEST, Konrad Dybcio wrote:
>> On 6/25/25 11:18 AM, Luca Weiss wrote:
>>> Add a dts for the PMIC used e.g. with SM7635 devices.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/pmxr2230.dtsi | 63 ++++++++++++++++++++++++++++++++++
>>>  1 file changed, 63 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/pmxr2230.dtsi b/arch/arm64/boot/dts/qcom/pmxr2230.dtsi
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..a7650f3230c01422b76ef78e897e5e7ae2f20cc6
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/pmxr2230.dtsi
>>> @@ -0,0 +1,63 @@
>>> +// SPDX-License-Identifier: BSD-3-Clause
>>> +/*
>>> + * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
>>> + */
>>> +
>>> +#include <dt-bindings/interrupt-controller/irq.h>
>>> +#include <dt-bindings/spmi/spmi.h>
>>> +
>>> +/ {
>>> +	thermal-zones {
>>> +		pmxr2230_thermal: pmxr2230-thermal {
>>> +			polling-delay-passive = <100>;
>>> +
>>> +			thermal-sensors = <&pmxr2230_temp_alarm>;
>>> +
>>> +			trips {
>>> +				pmxr2230_trip0: trip0 {
>>> +					temperature = <95000>;
>>> +					hysteresis = <0>;
>>> +					type = "passive";
>>> +				};
>>> +
>>> +				pmxr2230_crit: pmxr2230-crit {
>>
>> This name is "meh", please change to tripN
>>
>>> +					temperature = <115000>;
>>
>> Unless there's some actual electrical/physical SKU differences,
>> downstream lists 145C as critical for a PMIC carrying the same
>> name
> 
> [    0.085990] spmi-temp-alarm c400000.spmi:pmic@1:temp-alarm@a00: No ADC is configured and critical temperature 145000 mC is above the maximum stage 2 threshold of 125000 mC! Configuring stage 2 shutdown at 125000 mC.
> 
> Same for the PMIV0104:
> 
> [    0.086556] spmi-temp-alarm c400000.spmi:pmic@7:temp-alarm@a00: No ADC is configured and critical temperature 145000 mC is above the maximum stage 2 threshold of 125000 mC! Configuring stage 2 shutdown at 125000 mC.
> 
> What shall I do?

IIUC you'll need this series to achieve the full range

https://lore.kernel.org/linux-arm-msm/20250620001918.4090853-5-anjelique.melendez@oss.qualcomm.com/

Which makes me think the driver today may not be doing the greatest
thing in the world for this gen of PMICs..

We can either set it to 125 and leave a comment (which I assume is
sorta 'meh' because that's Linux specifics interfering with DT)
or we can wait until that series gets in

Personally, I wouldn't mind option 1 since we ultimately don't want
the PMIC to run at either 125 or 145 degC most of the time..

Konrad
