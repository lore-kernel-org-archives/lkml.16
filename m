Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A15228A402
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747928720; cv=none; b=tymfH7WqbbAAfV7nzaYfKvi/Z4gZGVSRVk/Ds9bj3ZmkzY1+uxWoYcP4/uwk85F2PIUbg3tSm1Pzmu8m+eRAAiJaQWJzAfqcGHVM9ju8XcAxpwpIr3Bpz/yWEf9bx3NSUOEXVrB1kJk0AHecbe1CF/VkvzDZb4/HHuhir5VoIJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747928720; c=relaxed/simple;
	bh=2oo5AEuln8MnpRMZv0SN3H54uiodXBOSQCn4VTiIjJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qMZOplvJTsJ/HTxvCpRFwXXq6yEc3VFevKp4OHDCJA3y28mr6m5AHMQz+FUffoRH8Vqlvijg0u1h4lD+fEL+Nb5PdGDe8vfnrj9ZhPez9emLxFrRpkeMGQGvRrPFZs38kgr3h3ZU4vRXbRGXJn0Skza7WbHyTTlkH1ywb4OA1O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BKg64CKf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BKg64CKf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7UlPw021413
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gxqXkbYZFLp5W72JIXRZoPEyHZQry5w4rYue7BdQmmA=; b=BKg64CKfTd1PHlJX
	BLs02zPUVePYRf8As9ciuR0j4DPlNxF5hlolx/Y7COfBsHTW7I9ky5q8If2ZBh69
	9xELkVp9iFAzzfxCcVEh5r99L2INffSAikBbUnfCAFLUeqRrMgMx4fKZGmp+G1iV
	tBxwHLccHwa91MIGGyc9pLe6NbGhr+fY6LRPm1idcLbYzGn/766un+H7fjXofFpE
	sM4GNMOSkVCpFd7UzvVFZN1TJCfQ34u1oAkrv5DXN4eJbEePZErq8Rl63H6hWvvL
	nW4VRuL/IeG5etrvIOaoQB7NzOv4yjrRCo8cmg7bx0t9rqNmCdNbYrA9P/uNP2QN
	odSx+g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0729w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:45:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8b297c78aso17428446d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747928716; x=1748533516;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gxqXkbYZFLp5W72JIXRZoPEyHZQry5w4rYue7BdQmmA=;
        b=htSagcHSsJp7DDuVo7l26opqWbOFo8a9nEAls6Y8yv5kQdJf0GpQLnV/vfCQT+B2XB
         6lIxkVsVk+NeoOFsK3z5O0+r3SIQH07PfE6mJqLBI4Xdkwk7fA1rQZ/YBV3cQyPY5wL0
         jc3cIKCjwgR27mGh5yReTwCX2H1aSpOtZ2bFIfNALyQpNC8GQjzZTxOE+cc/8zdQ2/ic
         YjXRpCHdgKTnbaHasS/CM6VFG/bUydkYRxBAmWGRCrs7txWh4FObEoHIQvsSogklSlFL
         CIolvkGVhHmeAkP/J8+M9NyLdoi1FXx2pLAIdDaSY+8WJR3Od+CZnydZRilhPTrQsF0S
         zdNg==
X-Forwarded-Encrypted: i=1; AJvYcCWh8d4o5OgkNSGqW99uOqZoSMFVes3hZbjDZmQT8luP3QpEYf5VZSCvS1nZFb8vasT7yYuleAx9FrE2BAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxNOVBtcgxvOwgXKuyotXwehQKUPHjg39GzG2/Mqfxq0PFRRye
	nHg27rbcm/9/QjDvJDdeEA4powUSipvq77zGhO5KB/U/bIJWfgGArNKu/eis/ik7kYwjflm50iW
	49kbLIlme6noPQRwcUeUkxS0BVMwz4r9A+B4Hu8N3ElpEMDcqYEQloyhrs+2/LvuJga8=
X-Gm-Gg: ASbGncvhzGSQtLxbNXAZMWXGcc8WaM1ovWsrX8jqk5p9QnSI5cqbbFLUY7W/ILdL5/T
	N/1/VPvzsyG6JIHwsosVMtiEedbqFfKDrlIZd5Uw698LmR/N0ZWlKkH4Ox5txaqiILTWagMfUM6
	Y70t6Nn5Abi4i7efYO+LyY5teP9dSNS+21JL0Mp0WdghjAODRO3jh1DKg9JAR2RJRsf3P6RsYZk
	+krBpbsrJ/RoLkxuF7EabONkNTxhhGxWHtow0RbuuVQ+htoZ94uKM6oVbIOP8nUmoHF8aBog3hI
	vk/QE/vW7GKfxdcMhsqBtGmEAAnBc1GPSX2FM5xY8iZAFXmbQUS0VOxT8iI6UxBi4w==
X-Received: by 2002:ad4:5941:0:b0:6f7:d0b9:793b with SMTP id 6a1803df08f44-6f8b0944b8emr130228506d6.8.1747928716283;
        Thu, 22 May 2025 08:45:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQNmrcRDS0TOey9X0Jcpi53g1AQj/TZ0iGbNkYLDXuyFaDcRqj+aik6BrMWX0FUjzxKOJjlw==
X-Received: by 2002:ad4:5941:0:b0:6f7:d0b9:793b with SMTP id 6a1803df08f44-6f8b0944b8emr130228236d6.8.1747928715833;
        Thu, 22 May 2025 08:45:15 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4e8afdsm1101228966b.176.2025.05.22.08.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 08:45:15 -0700 (PDT)
Message-ID: <85e30c0c-ea77-47da-9fd9-4293c7a78c75@oss.qualcomm.com>
Date: Thu, 22 May 2025 17:45:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] dt-bindings: watchdog: qcom-wdt: Document
 qcom,imem property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
 <20250519-wdt_reset_reason-v4-3-d59d21275c75@oss.qualcomm.com>
 <20250520-portable-anteater-of-respect-c7be5c@kuoka>
 <37bd619d-242e-4488-8d45-c2c85612bee9@oss.qualcomm.com>
 <b8003fdf-66a1-47e1-8c78-069f0739ea37@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b8003fdf-66a1-47e1-8c78-069f0739ea37@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 72KUNrcV1pV3LVb5AnnEvPknbaJEKxN7
X-Proofpoint-ORIG-GUID: 72KUNrcV1pV3LVb5AnnEvPknbaJEKxN7
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682f468d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=3MHuiekdCO7yvOlYeq8A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE2MCBTYWx0ZWRfXwtvU2AGYXSvH
 EueXJsDSjY9xExdmMGELwT0u6nUc6LQNHDHvTYuB8AL9IcslA0QQnr6q0Pu49fY6n8qK55uQJXw
 dieU2WN139ADBNL1XF4wdRANfMJgYocdeFrGVYefPH1WciAsynYmReDlGojvQpvzwZVCjVIOp4C
 jqxO0eWGvnz/gcda/KZchzlZI9ehZwvJlRFnx8M/nAjSOKZVDKYxYgyLWhgmuvIj4/mLMAEe/md
 DJY4Ehg3/uAYY6h1I4WWzI2Xe/OTM0aVyFzfINO0rU5CBGz+w4ra4u9sXb7+ZN/u8mAABIbEkxA
 lQybDyfWGA4Bolk9NYG9no5tqDfw3qb53VKwRB0rnVdHxhoOLKZiqLv79k9sCy3jnc1DzMJOYac
 ORqyszev6uBWAtiKyVd8WZ2s5bo8vsjYbHK9R1yxJ9cml/17Hy5x95gyzkb0upR3W1PWDefI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220160

On 5/21/25 8:53 AM, Krzysztof Kozlowski wrote:
> On 20/05/2025 18:00, Konrad Dybcio wrote:
>> On 5/20/25 9:25 AM, Krzysztof Kozlowski wrote:
>>> On Mon, May 19, 2025 at 02:04:03PM GMT, Kathiravan Thirumoorthy wrote:
>>>> Document the "qcom,imem" property for the watchdog device on Qualcomm
>>>> IPQ platforms. Use this property to extract the restart reason from
>>>> IMEM, which is updated by XBL. Populate the watchdog's bootstatus sysFS
>>>> entry with this information, when the system reboots due to a watchdog
>>>> timeout.
>>>>
>>>> Describe this property for the IPQ5424 watchdog device and extend support
>>>> to other targets subsequently.
>>>>
>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>> ---
>>>> Changes in v4:
>>>> 	- New patch
>>>> ---
>>>>  .../devicetree/bindings/watchdog/qcom-wdt.yaml       | 20 ++++++++++++++++++++
>>>>  1 file changed, 20 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>>> index 49e2b807db0bc9d3edfc93ec41ad0df0b74ed032..bbe9b68ff4c8b813744ffd86bb52303943366fa2 100644
>>>> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>>> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>>> @@ -81,6 +81,16 @@ properties:
>>>>      minItems: 1
>>>>      maxItems: 5
>>>>  
>>>> +  qcom,imem:
>>>
>>> Shoouldn't this be existing 'sram' property? If IMEM is something
>>> similar to OCMEM, then we already use sram for that.
>>
>> We specifically want a handle to a predefined byte in IMEM, something akin
>> to qcom,4ln-config-sel in
>>
>> Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> 
> Nothing stops that with sram. Above example is poor, because it mentions
> syscon. There is no hardware as syscon. Does not exist. What is IMEM
> here, what is this relationship?

IMEM is indeed a small block of on-die SRAM. In this context, another subsystem
may write a magic value at a known offset that would correspond to the platform
having been rebooted by the watchdog. Now why the wdt register is cleared in the
first place, I have no clue.

Konrad
