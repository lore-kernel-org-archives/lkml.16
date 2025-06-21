Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B3C1DFE20
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 10:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750501218; cv=none; b=dAjQE60XcSEluG6GX7Wzgd4j8MP1r2SmF9cNcXVIJ7MG8rgRKY/92Z7kzf3WZPBITHakSLZyUL+v+8PmLako7XCnkbo6aZKEdGzuS5L4WNp8wcUUOH882r78fTMuh27oqsbP6dP/09jz7Yv8LAic4DyKw7Fpwcjdsx8ISpB6Qyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750501218; c=relaxed/simple;
	bh=uYTOGq0jOvna7DKf7Dv4VMej982iuzaeDJSxWzLVVUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FRLp3dZ7e4hceNdYkLhCIBD9zfHX7IAxNTICRM0skZ2AMH5516+xvZorX+HH17ZrP9OFPiGMdD2Gz5EThqPkXH3QSWfbbXaQQLZMjRFsFrC3Lz3T/8p5Xza5hbex8ST4mwBG5+2JYQORylrgy6JQUHHevOObUVMmFBPDb8eb1DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i1r+Crfs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i1r+Crfs"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L5a35t027576
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 10:20:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rynw3AOu/IaDP3omqKgtPfVAeJGLq3yLWQV4mFHxifs=; b=i1r+CrfsWXFeiVfk
	A3SouKbh6YKBwE6ClE4oQm9DBT2Yxs4plbgbGFrFCE3Zifu8NZv+d8yopQ+l28Yx
	mog2Gh3zf4TW57SiYBBvps4+edRGva8OhsxGSoh1lpmUzwCgzHUYWUjhGU/rgwp9
	9sy2ftGg0rtUZGQVO3l+hnh1+4SqxnQUae8yCb55oszgBQbDEwh0xHjpu0J7syrm
	uCbWeyW/gBxc+zCuKeRMe55ivY4qGlbiXHy/FNEPrmhjyMiFFR1BqdkApmgwNLcu
	U6a4hdtBTcaz9OSQ9Dn0QLNBQPtNb58zI3QY9IS4PVz8caSMwQ7SIrWOzYlDChYH
	L+Y5PA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dpqtrbmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 10:20:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8aa327049so3515306d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 03:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750501215; x=1751106015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rynw3AOu/IaDP3omqKgtPfVAeJGLq3yLWQV4mFHxifs=;
        b=C6oJ+a045Tpln/JuUs2WyIBTVXvZgT5eqGJs/lq3CySl6INmuoDrIkbyr7viqvyMIH
         I+SQAYpmzwsluK55YrrsyP0aU/liojtjxnYa+UhvWe2UA07VcZNf5S16LR7HbaFDxJLs
         ehF+CJZQXoyjtQ/k1skei073q5yBLVcGRGRuQTaS8gfw6FVxQ7EpIgHFScwIVW9q33k8
         OVhfZYQEZ28Be5oJ2BJlGNSyLjWrA9M8vIUpVHcs4chuDiLJ71Zg+PTvdtBASy0gYytW
         Kz+TAD6pVEQi437SqSWKzFoMPPZI6yy+PMZroenAKm55EN0e3BGL0bVn4pMYc0v67WwW
         Z9pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBzElHhu7hrlaLpdK8/vGQ/RaS5ZkZ9X21dsMxh7GbZC9+9MOzAL8YkIxag/Q4NGkhX5v67FHcdsCqdAY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi5bVRwERWFxmCIJsxSwNuc7MDlj2QKwrTOmC6vaEG1KVmOTKP
	lohdm1qIlKKkqHKOs8SkBVlCPON18uG1yJ6IkubQAduoDeu0HBFEF0JovHLNzAQ9iT525ZS2Zvi
	IawKQVM4DmSSK3AHWOdnFxAEXVL6eC4iFZrNP/helmKXpkFXjlxstCJvLavXULPBv1Xs=
X-Gm-Gg: ASbGnctqQl0hWKPFRDqOF+OSAxqnEgR3l7bF1MSCTuR7hBmVUZRe713YKgQ/FQGoIly
	PyY6gMgUQwV2GerpV4fxYim7CeXWVphtoEgFdH3evj4cOCEacY42n/ro/Eck5JqJO0U5wYzcdI/
	oGQCCfhQE3syNS+dp92syZULDi6rX1Ke1G5g1Rr3rSElMwMW96747gRdpW5h6yi9GP09Lln92li
	qdbrnU6y+sCBWDVKDgnQroSVZJ1r+E45+V2V4wRRYwvrM5t9ZoX1e1mvBKKBdm/QlXbJk5f4yvv
	3VDrSp+y/VpVRyi1bOy+imdS1A2h4yXevySPSBPPgkg78TNPxh6o8rsqrtc20gz2e6FW1nC2kj2
	5e7I=
X-Received: by 2002:a05:6214:80d7:b0:6fd:b24:4e14 with SMTP id 6a1803df08f44-6fd0b244f40mr24550376d6.8.1750501214974;
        Sat, 21 Jun 2025 03:20:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENGnJKDkVr9os6hHS84wNudz3PjxojZ9bH/SywhPnRHict04HderlvMlUs0FRZqVtVgTL8Cw==
X-Received: by 2002:a05:6214:80d7:b0:6fd:b24:4e14 with SMTP id 6a1803df08f44-6fd0b244f40mr24550356d6.8.1750501214618;
        Sat, 21 Jun 2025 03:20:14 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b6e36sm333295866b.120.2025.06.21.03.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 03:20:14 -0700 (PDT)
Message-ID: <9627ed6f-2bb8-40b0-b647-5f659d87f2f9@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 12:20:11 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6040afd9-a2a8-49f0-85e9-95257b938156@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA2MCBTYWx0ZWRfXyIZeYy552/2s
 Obse1MPqHhV1dxwBgh0HUm6JP9BUkxm5jdn5cDpMb01V3sYrZQkwxyKgL0ts3sGxxhgR2oGn+Fi
 MP53uEQzWi0qESc5WYoz8LM+ClaVAbm6WyRb+divcrjJJTb+rLs2KUXoAhaQkQDam4vAeiC23ds
 3GeQxb/OKQkFa+nI2ofSk/KCdYG170UeS1RrNz9yUcWaHp8Dyu7zX5ddNvvz49t966VPlAiheaC
 ofYWp+3oodb3kt6AJgjf5p/QbJHrdeh/PENQifnvgzV2rQQktDG3AaC0HIOJ+IDnY1DUjpCkAHw
 tuWPiBbwJMejWFcbtbxrc63RcCTUtDXZMYnwN1ThybstJfBnHAJ6xr/LprLRjAPs0dOQTvh1xXQ
 h2G9Q2TZjSnkj5w+cIir5xWAOdOxogAvwEgjt0OhD6SQbBj0FcqAqwIccoIpAMCrjdotXBom
X-Proofpoint-ORIG-GUID: aibTOPVmpB2nzVpZ7Of9FdE7386AUgoq
X-Authority-Analysis: v=2.4 cv=cbPSrmDM c=1 sm=1 tr=0 ts=68568760 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=pUFaWy8oF3eVePBgSHwA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: aibTOPVmpB2nzVpZ7Of9FdE7386AUgoq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210060

On 6/18/25 9:43 AM, Krzysztof Kozlowski wrote:
> On 18/06/2025 09:28, Sarthak Garg wrote:
>> Introduce a new optional device tree property `max-sd-hs-frequency` to
>> limit the maximum frequency (in Hz) used for SD cards operating in
>> High-Speed (HS) mode.
>>
>> This property is useful for platforms with vendor-specific hardware
>> constraints, such as the presence of a level shifter that cannot
>> reliably support the default 50 MHz HS frequency. It allows the host
>> driver to cap the HS mode frequency accordingly.
>>
>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> ---
>>  .../devicetree/bindings/mmc/mmc-controller-common.yaml | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>> index 9a7235439759..1976f5f8c401 100644
>> --- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>> @@ -93,6 +93,16 @@ properties:
>>      minimum: 400000
>>      maximum: 384000000
>>  
>> +  max-sd-hs-frequency:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      Maximum frequency (in Hz) to be used for SD cards operating in
>> +      High-Speed (HS) mode. This is useful for platforms with vendor-specific
>> +      limitations, such as the presence of a level shifter that cannot support
>> +      the default 50 MHz HS frequency or other.
>> +    minimum: 400000
>> +    maximum: 50000000
> 
> This might be fine, but your DTS suggests clearly this is SoC compatible
> deducible, which I already said at v1.

I don't understand why you're rejecting a common solution to a problem
that surely exists outside this one specific chip from one specific
vendor, which may be caused by a multitude of design choices, including
erratic board (not SoC) electrical design

Konrad
