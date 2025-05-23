Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDF71FECBD
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 14:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748010953; cv=none; b=i2tG0YbqEKx47eSpoHyRf6Rk0tNoxWe+E+Z1l8fhhqT8YoOxMPkh/x6SmYbtoi4ERbQ4vtZXGd9qWAVda7iNJ+LSvoJFgwSh0pv48lzFW06aMIZ9V0FuVyyDHgJ+nmb5/B40d5wEamGE71f7Qdb9zBhmK2ftN5sajTnYJHx7Foo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748010953; c=relaxed/simple;
	bh=nb5MIHzZQoB8mXGv0L0rC6FlGJoqw4TAeRfHD8H751Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qobdl7TTeKEJ+AxFYwBnMFSEb4w5+gM5UwEgqwuzoXQpurs9Te09X1I39FsEd56RB228mejUDh4r6NEbqMt7T4KOrBSk+rSPc4xbcU7nL8eHgKsUjzC+htwfiCSXinpno7g4YR7+/Y0fNgIvqCmp8JzN3sLaF0Fdd6/V3pVsFJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SoaTJP8C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SoaTJP8C"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCFZ1a023047
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 14:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n6Mmle5qkluUPd0ScbLmNz4p82STRkadMEldLmYpYHM=; b=SoaTJP8C+BEEZnpN
	UXakJEZoCSdSIucXnSRvs65Lyskrt0FGeNzyhwYJZ2wCVqK4OqXDoNs66V6PMK8b
	sMun1t8JcQ/BMmMFwKTZ+1F8tAV2E59SA5HIzRdZiQdy69c5+3rOzEF8x7ORTAU3
	ff9F2keYEuHK8tFxOI8+m4zpfaUMpcN84fxpb1fSrcq3UwMAtfY14lF186+JpN0D
	IwxplXQ5Ru0h0W8W/e9nJEKCzKQO1Iw33Mqa88HhHKmmq77c72IlBbnB4+lWSiJ/
	KpeGnasqVggY7fImSaDCPEAQ7tQmfwq0mJy06FvOXyz9Xn3/h3yt0bHcL5IQHwww
	5HEkjQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf52815-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 14:35:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23222fdb4f2so99352425ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748010949; x=1748615749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n6Mmle5qkluUPd0ScbLmNz4p82STRkadMEldLmYpYHM=;
        b=uZTnWUIy6BmBY0QqG4CIpxvhpJZ+581dFHxfqiYmvZSWQbKE9Y/KTRPCNMdpz0uoyC
         tDM3IgLAa5JhNENV81vzLJexjlsp9DivRrANnxfXSbE5g/zaRaoriVgZ/gvuzG8bKiql
         sD0LTqURIacoLM5sAACt08R2ocC0/Bl+kcVhShCWioOr3VlflP2KpthevAWWo1WgBviP
         xNXehY7qRzj4v+UXI2FWcWlF5M0PlccLStUYUQaimQbNtnACWzQd6W+o+4vGq/ogc9x6
         mV79424yc3Q2Q6dZYGpyZJRnE6ZanobSqjKCVfMmuAPmgnhaABIqzNp3edE1vWSv7PyA
         E1hA==
X-Forwarded-Encrypted: i=1; AJvYcCXGztwfkIo4dyfx2BvI2QGpX3afjBUsiiraE3LRrdvaHEo46m3qkvCHt0ypht6KGnuLuPqPmqE9KK5HKtY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjp1EcM9m5pTh1zHIX3O4a8ipuLlI7OOlOHftQrljGZ3Jv86vr
	lE/Kh4g3821q4oyaI0Un+u1C9uIKWc9wzDhpAcVewAxwR+moJfPVBUObIjyZxofCtnaS08NFhAh
	c1MBAg9MeAw8oOoRswtiBAiEkDdEzznxLxF41Oy6/eEA7uBE8dG0ufIoh7qViOePlwpvGOpEie1
	Q=
X-Gm-Gg: ASbGnctt6+l5VxJKyVXGnH4C2lGaOVvvJz+XYCBT7rWphN4dWFdBaA2ogXwyMfoguri
	oDVXAnme8HXKXZZ1fbVRfMayMbKnTWNSZs6DVa9eJkvu1dZTtBaH0uEkHRksOG2+TsQLDE6hG4P
	cq9WYw/fiH2+wu3L9xp27pli1YdwAI5gZX+euAk0S87C9kzlW65I0MLZVu5hbYtHi79Dz+M8r3O
	13jvfDU7Ke8szRfEbvlOA4Z8/UJjHnbqscNcy03sU3QCLWZp8YwUMmVYlb9/JxCqkfR+j1ZGb87
	EjnaIqqph8+5Tp9hehuY7tTM1odb95t0Jb6Ar8aE5QeRI9DZqw==
X-Received: by 2002:a17:902:e846:b0:22e:4586:e33f with SMTP id d9443c01a7336-231de3bb190mr397101935ad.45.1748010948719;
        Fri, 23 May 2025 07:35:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvKQ06+PnrffVM4A+mUFpR2nXICQWZtK2Hi5nSL3adjam4W93/m7zrZV9zAU4Ml3ZwGTFO2A==
X-Received: by 2002:a17:902:f706:b0:224:1ef:1e00 with SMTP id d9443c01a7336-231de36b29fmr404812985ad.19.1748010937955;
        Fri, 23 May 2025 07:35:37 -0700 (PDT)
Received: from [192.168.1.38] ([61.3.77.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23401ab6c20sm5827495ad.66.2025.05.23.07.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 07:35:37 -0700 (PDT)
Message-ID: <8efa9abd-bf7d-4f9d-969b-70c0452fc2b5@oss.qualcomm.com>
Date: Fri, 23 May 2025 20:05:30 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] dt-bindings: watchdog: qcom-wdt: Document
 qcom,imem property
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
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
 <85e30c0c-ea77-47da-9fd9-4293c7a78c75@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <85e30c0c-ea77-47da-9fd9-4293c7a78c75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: i6bz3PZpHAh8Xyp7vheLVd17scltCn-e
X-Proofpoint-ORIG-GUID: i6bz3PZpHAh8Xyp7vheLVd17scltCn-e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDEzMSBTYWx0ZWRfX0Bib2UpzobJk
 MzVlJFDCWGNw/8/mZ6HVYQP5WbSl7hkVR1Jov00bybG98cYWiziKg9ChtP2QjpgmwAlEGEh6nyT
 AZ5MfVQYsvcnOv6Xma2i5OBk67cfwwnZOy1yDJ3pIFuKcDHcPGNhUvySo/P+J2PYrPVpj7xShjx
 vZNr0To8CM7ynsmIFiI0Y5UcbI80Suge2Ypbl6ybltiBYqTwWN6jnkgLLQSmDt2YNIFkJXFvvBN
 UjeI0waWIz9e4/SsvYLHW/eV1OSbAQsJnL77g07CENyZuPoWsZIqG+A0wtfjhcdjcxXBq9lVDaM
 nuN4JtjFjCAK+jV+eLqzmwFPuJowOK9h4Ofmi9/EOd1CizZdpziTmezrE9negrK+jSLmG2jNyAx
 Qua6y4gcJjtSw1pyrSYiJ6qgUZND/6YK5M+jDYS+X9MKtRbKPJCtN8Gl1j7sfm4YWDQO/kbk
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=683087c6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=r29b3dQpSJuOyoiVDjf7vg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=U33IDs7WUbLw9VpaiQwA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_04,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230131


On 5/22/2025 9:15 PM, Konrad Dybcio wrote:
> On 5/21/25 8:53 AM, Krzysztof Kozlowski wrote:
>> On 20/05/2025 18:00, Konrad Dybcio wrote:
>>> On 5/20/25 9:25 AM, Krzysztof Kozlowski wrote:
>>>> On Mon, May 19, 2025 at 02:04:03PM GMT, Kathiravan Thirumoorthy wrote:
>>>>> Document the "qcom,imem" property for the watchdog device on Qualcomm
>>>>> IPQ platforms. Use this property to extract the restart reason from
>>>>> IMEM, which is updated by XBL. Populate the watchdog's bootstatus sysFS
>>>>> entry with this information, when the system reboots due to a watchdog
>>>>> timeout.
>>>>>
>>>>> Describe this property for the IPQ5424 watchdog device and extend support
>>>>> to other targets subsequently.
>>>>>
>>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>>> ---
>>>>> Changes in v4:
>>>>> 	- New patch
>>>>> ---
>>>>>   .../devicetree/bindings/watchdog/qcom-wdt.yaml       | 20 ++++++++++++++++++++
>>>>>   1 file changed, 20 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>>>> index 49e2b807db0bc9d3edfc93ec41ad0df0b74ed032..bbe9b68ff4c8b813744ffd86bb52303943366fa2 100644
>>>>> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>>>> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>>>> @@ -81,6 +81,16 @@ properties:
>>>>>       minItems: 1
>>>>>       maxItems: 5
>>>>>   
>>>>> +  qcom,imem:
>>>> Shoouldn't this be existing 'sram' property? If IMEM is something
>>>> similar to OCMEM, then we already use sram for that.
>>> We specifically want a handle to a predefined byte in IMEM, something akin
>>> to qcom,4ln-config-sel in
>>>
>>> Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
>> Nothing stops that with sram. Above example is poor, because it mentions
>> syscon. There is no hardware as syscon. Does not exist. What is IMEM
>> here, what is this relationship?
> IMEM is indeed a small block of on-die SRAM. In this context, another subsystem
> may write a magic value at a known offset that would correspond to the platform
> having been rebooted by the watchdog. Now why the wdt register is cleared in the
> first place, I have no clue.


Thanks, Konrad for chiming in and providing the background information. 
With respect to the WDT register, when the interrupt is triggered, I see 
the expire bit is set in the watchdog register. The bite interrupt is 
handled by TZ and TZ does the system reboot. After the system reboots, 
bit is cleared. I have cross checked with the design team and they 
confirmed that the behavior is expected one.

Krzysztof, Based on the discussions from the previous versions, I have 
made the changes. Can you help to guide me on how to handle this? Should 
I just name the property as "sram" and point to the sub block in the 
IMEM region like how it is done at [1][2], which is more or like similar 
to what I have submitted in V1 of this series[3] Or is the current 
approach acceptable? Or some other way to handle this?

[1] 
https://lore.kernel.org/linux-arm-msm/20250523-topic-ipa_imem-v1-1-b5d536291c7f@oss.qualcomm.com/T/#u

[2] 
https://lore.kernel.org/linux-arm-msm/20250523-topic-ipa_imem-v1-2-b5d536291c7f@oss.qualcomm.com/T/#u

[3] 
https://lore.kernel.org/linux-arm-msm/20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com/


>
> Konrad
