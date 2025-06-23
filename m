Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47A9248F46
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680550; cv=none; b=I5k6UZLXMpO7d/99+tbbUqBYkxNjxpfM85/9j4irfzLtbQCoYH0iz+eCdombDsvQj75pCNTI5x77BWYXeph7pFGVG+ScLxA3wzO0ZHZpsA8Vf4ejd/XRu8BE4UA62x1qajvqgJa8w1sOf8kgwSOMZQkxq/oVndvf3mjtSo6u4zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680550; c=relaxed/simple;
	bh=qKSIqsV+KvAGtkioviVhsHDdAWmTF+w9b1unNcPVVFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+aN5KMB7E+dWaGyvztcXckmfCoGVuQJYa3d17rlYuK9H/E1A4jmpJDmsbGlhAGJzgfa9HnMZD0zVfD1LOEqiYVpAGqI/LvIKlSQJyaPm1QlF2/0OE9c8BIwt30CDbq4aXZrmGqNOmTgem476GyF+xdefe56iAFjuKp+sAiQc14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KE4S5EZA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KE4S5EZA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N7fROg021627
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iUA4Ux34VVf9K7rAvlG3QrP3wRtZ4mYRuLZS2Rcg8zw=; b=KE4S5EZA8lx6Tzg4
	Jhpkb/rkGWCT4L4d9fBzMn9RWg0iaweCu/RZMMqP2CKaquT6bK/8RCcaHg84x69G
	W716sPfUlGUDlbEsX+ChVznKYR1rLvFKInkJ8g+ioPWoMRC68lCg0jQIsMuAT4iG
	/iZKas6ImwNmnfyt8e6+eHFvNtpbF3Gb2pRlaHvWhtXlPKEywfEoZFb0SDbvxUEU
	bbo1klTTz7dmhNI47MMOeRK0yQzaSyIjCdt3BdrpjBzxQaTKAYKwp+LLHsZ85s4T
	vFCSXsGXl3la4xjis/FbnlWxIdRhl/V4mryoYQbqdIpC8ZpgkHcf6GwCofn8UQoW
	mA9Lnw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rprqms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:09:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fd202ecf82so1866736d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750680545; x=1751285345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iUA4Ux34VVf9K7rAvlG3QrP3wRtZ4mYRuLZS2Rcg8zw=;
        b=XjHYkNMoSCyWnyF8AEOL/OaUANd+fjMS6TdyEnBEw8gRXXZxf47Oynt8Xb7SW/z8wJ
         Sm6RLRXaj1O3jFHRhupfVfVcfstKAoAR016p+BILodc1yhtZS8+oLVGpPbG78as/n9o9
         4qmSQuqPo+xloMeRA3y+6CkmPctMcAyT6FqfX50sd1ZoI+W2sS3A/54sr8lF/4srBiWf
         oXPM8R9comH5x2/htGgDxiQIb0lj5ZoRPqq0yghDKvB0ul4LNK9d9BX3n+lgckKGRtij
         sFK1tHqwVTGazGbupIWXgvtY3JbV2y3WDpVDXdiyQpS/3cuprCFqPXtN7Dzj/fhfAa/F
         zCJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9R6HickdsZNRTMoYObYHgqHwy9n6K8v2L+CS74xjjQA1MBF15/7jEFyUVbK0i2Pdhg+rskmEChCzS2oc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwySapxluDQ0u+0JtyMzKUU3E972LIxFFEyvPLl3UJk6Wjjw23n
	62tpZN0qLLSQZeP+bwgiPAZB54IsC+acG14FO6NeM+HTE/Dp8kC3C1fKdqjC3b7/6UOg5CK2I19
	lC2bWizWn1K3/9tc+A68zKn05Msv02MeoMslwE3Eb9XSVDrkjV5qjpCNfB4Avc+REkLaTvioeRe
	k=
X-Gm-Gg: ASbGnctgbGMgpSVErO7ccjPtYG9Go1za7zHHGf1+dTkyGxAMoq3lnU5Zi+SnaSMMQCU
	bQX0SHE/QfZRYUYx6BE5keycU3becb4zHl1D80Bq18MhQJJ4Dlut3f8UK8yeGRtvuRmmq18afZL
	CpmKaxmy7H3ixZSvHak7M5rPx7q4cZq6Q8ON/jj+SheYKV12+/EEiIDAkc4F2ooK4Gw7Ohr1Djr
	o8UUjgETEcgw5m8oeLcLPzdscujct0rmKcPSfmxRu51SWjblLV2W9vTiulDXpI9sIMrpP83L/Ec
	lNgRNZq4iOfysoIJGUAw6Yu1+cKx1Dr5La5X8Db/32xwih7jBIrFy13rMD66fsW5oCYww/wQiON
	Cp1g=
X-Received: by 2002:a05:622a:9:b0:4a6:fb4d:b4e with SMTP id d75a77b69052e-4a77a27a4bcmr72341221cf.13.1750680544727;
        Mon, 23 Jun 2025 05:09:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoNMINZTAhhl7CMp5Boaokx/8RjnVYVBHAJiF7SNTYL5MUao5HTMPsguWO70eQQTBb5Hr2qg==
X-Received: by 2002:a05:622a:9:b0:4a6:fb4d:b4e with SMTP id d75a77b69052e-4a77a27a4bcmr72340941cf.13.1750680544191;
        Mon, 23 Jun 2025 05:09:04 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a1857c124sm5866353a12.36.2025.06.23.05.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 05:09:03 -0700 (PDT)
Message-ID: <5bdae07b-a7b1-49be-b843-1704981bc63b@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 14:08:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/4] dt-bindings: mmc: controller: Add
 max-sd-hs-frequency property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sarthak Garg <quic_sartgarg@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
References: <20250618072818.1667097-1-quic_sartgarg@quicinc.com>
 <20250618072818.1667097-3-quic_sartgarg@quicinc.com>
 <6040afd9-a2a8-49f0-85e9-95257b938156@kernel.org>
 <9627ed6f-2bb8-40b0-b647-5f659d87f2f9@oss.qualcomm.com>
 <bba062a3-f96c-456b-8e9e-fdeb0dc2d28d@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bba062a3-f96c-456b-8e9e-fdeb0dc2d28d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685943e2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=yCTWpnfuZRHAWxVBKy4A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA3MyBTYWx0ZWRfX8TPgHYn8gSrV
 Kok2ITrey5EJ0zKogsuW8xI5s0I0i4ME/G/QcKVm2AI9oHPWXQX1i+cy3LNNUIN72VuaGa+jNqW
 cMVztWDnOOlTU/LBCdK5La7wsNv2NxTU2ON1EfBJ5NHqRvHARMlm7nyp74zugRtuHLfpffgCjGc
 HdrymfDLyOV7wXQf1n7ivsYosn7/1PAOKOh+anhEQdKeobZXY8SoD4oWQNW8ARZ0X1b8UosMsDO
 QfbtQlhhaQ4HYPPCqS9ETCa76eYorx0fZewtPGsgJGjfN0gIPkkWLDc5T9YeU/a4yBeg9VAtb5X
 Yq4e7O9JjiuNRegMZ1Tbd0LkBNJdf1JgOUM4B8u6hQNkg2NpZg/vLmEIe4UHG+8TDzRT8MclmN/
 NS8uKMytbe7VfPj3nf9KbNvUVXaQ/ZiGnEXg3D3PflhaGVG0+x/1BsizHhjocKCxSuZw8/vJ
X-Proofpoint-ORIG-GUID: UZRnHmnn25UMJxM4vBRowHhN3t-Cmypb
X-Proofpoint-GUID: UZRnHmnn25UMJxM4vBRowHhN3t-Cmypb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230073

On 6/22/25 11:48 AM, Krzysztof Kozlowski wrote:
> On 21/06/2025 12:20, Konrad Dybcio wrote:
>> On 6/18/25 9:43 AM, Krzysztof Kozlowski wrote:
>>> On 18/06/2025 09:28, Sarthak Garg wrote:
>>>> Introduce a new optional device tree property `max-sd-hs-frequency` to
>>>> limit the maximum frequency (in Hz) used for SD cards operating in
>>>> High-Speed (HS) mode.
>>>>
>>>> This property is useful for platforms with vendor-specific hardware
>>>> constraints, such as the presence of a level shifter that cannot
>>>> reliably support the default 50 MHz HS frequency. It allows the host
>>>> driver to cap the HS mode frequency accordingly.
>>>>
>>>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>>> ---
>>>>  .../devicetree/bindings/mmc/mmc-controller-common.yaml | 10 ++++++++++
>>>>  1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>>>> index 9a7235439759..1976f5f8c401 100644
>>>> --- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>>>> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>>>> @@ -93,6 +93,16 @@ properties:
>>>>      minimum: 400000
>>>>      maximum: 384000000
>>>>  
>>>> +  max-sd-hs-frequency:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description: |
>>>> +      Maximum frequency (in Hz) to be used for SD cards operating in
>>>> +      High-Speed (HS) mode. This is useful for platforms with vendor-specific
>>>> +      limitations, such as the presence of a level shifter that cannot support
>>>> +      the default 50 MHz HS frequency or other.
>>>> +    minimum: 400000
>>>> +    maximum: 50000000
>>>
>>> This might be fine, but your DTS suggests clearly this is SoC compatible
>>> deducible, which I already said at v1.
>>
>> I don't understand why you're rejecting a common solution to a problem
>> that surely exists outside this one specific chip from one specific
>> vendor, which may be caused by a multitude of design choices, including
>> erratic board (not SoC) electrical design
> 
> No one brought any arguments so far that common solution is needed. The
> only argument provided - sm8550 - is showing this is soc design.
> 
> I don't reject common solution. I provided review at v1 to which no one
> responded, no one argued, no one provided other arguments.

Okay, so the specific problem that causes this observable limitation
exists on SM8550 and at least one more platform which is not upstream
today. It can be caused by various electrical issues, in our specific
case by something internal to the SoC (but external factors may apply
too)

Looking at the docs, a number of platforms have various limitations
with regards to frequency at specific speed-modes, some of which seem
to be handled implicitly by rounding in the clock framework's
round/set_rate().

I can very easily imagine there are either boards or platforms in the
wild, where the speed must be limited for various reasons, maybe some
of them currently don't advertise it (like sm8550 on next/master) to
hide that

Konrad
