Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F9E1C6FE5
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750051105; cv=none; b=RW/4IlAm9rF+TWmvXM9FIZk1a78T8+3k+tMbvnOtNEH/BpoC4GtHkShiYgflJ/giHeXMZwc787mCXCh+xVVRfT3EoKnI3krO/h2RQikrU7Hjy3gbLLvBb2CvPwVDuQ+TWIuloi2MMVlgT4omPCUWMD0IeA6M9jgTczvWPTpBwcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750051105; c=relaxed/simple;
	bh=dSTO6ceL4cBcJlGtrwFEVwSB8h1XEE3UyPcaVRgLcoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ETFx6PNFxme48t7/w1C4A2nbuIPFcY4RyCRh955XtijUrhLPHnaSGZW+9Zq2b/J1DDUem6WSEUtUzw4GnFOVtnm7Taos46Zy0VvPgaN33ifPnI6h5K0jfYLy0N4NyzAHy6EBcuVj2um3+9Y+eDE3Dnqc6kpx7ae7jsGOlTH1yFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LL2R0Cy5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LL2R0Cy5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FMwodn021521
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eah5o1kUJVZGAXwBZNw8iMgtalpjcoQR+VZU+ZsxQwU=; b=LL2R0Cy5w0o97slA
	hXfKgWsa/Mq+CtRLCE7pdpmGRx11xMV5gQaahmOGEWtHOfykvb57s4pDlLov80vd
	rpPDi/1YZkvBpGA2tAz2iSYVWqxNbs7e0uw0hp52LnmX8bOqajNbhG6FyPyxmS+y
	nr382m3JvFj61XXQe5xPw+Sz0TNcw3PtM33cjgMkVkSr2ogU9tgcygH+7x8AOuWl
	KdQam2heRJVMiIwVI26oGRgTE2FjGElDHB9HpIrfbdTVgS6Bbz7WPKZDwgj9RgsF
	hVsBLyiECHifKPbwkM65VjZ4WUocRWCBKw92SaNV7QqTMDLlSigPNShLdeuwBNEw
	EEmISw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f734tb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:18:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-231d13ac4d4so59043625ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 22:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750051100; x=1750655900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eah5o1kUJVZGAXwBZNw8iMgtalpjcoQR+VZU+ZsxQwU=;
        b=wrD27bSCG1xD215FEe0IYONs0GKovTulRRzgkUqVi0WSl2gxfh8ZNDIt6WDYwooTq1
         yIKrnfZIxbdqJiltdHIwTpBYgtNz292A4B3Z0cs6/0Gbwzoz1SWOSvgDb2eDS9hdKvQG
         T3/GXNSWtMzKryq2ePfSy2UXWAfuL48QPRljgwFtZnkfjuhMHw+1zlIhhaOyq/e2LSUu
         usc1tHsocWgJElxAo4nDvc9E0uq13Sk5XaVkxXWS+T/Fv908D0Q0/r3WT2TjMV4PLDAb
         6xEFiHjZ+izslyQBQSGHBLU6x7enRpLILRyFs3Pbg3WS3ot/rpkjEM4WeV0XRtDiEWCI
         QQ7w==
X-Forwarded-Encrypted: i=1; AJvYcCXrpH91Ek7J9oRGHlMeZGrbnqqo/j8SDbIwqzqZcQryatIePgZ6t7IEoHCmyVn0ZNFs+RB9XlV/dWJ/k88=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3IyO8o89nEBbQBT9TrDAN3WpU6ovF1p5HGDu7UfatTa1QPi4x
	0rd4jRES+n4bV6KXpg3eLvHArpyezONQZv17GZ+w88ib16ebRE5h8U7D5o/n5DAXP7FN+voYSGk
	hr+hK57w3osjSBRX4N0qnJy+7oBMsi2jYWR66VDQ0afY26m8eQYnODjQYgi6Pq6IAqPc=
X-Gm-Gg: ASbGncvWVHc4DUv9k5HII7TU3apxhC4GyNrLJeNhb9II/LF6tMRvtlGeOmNEhvCY8Z7
	t9fiUHWbrIuqdjNpFRBTCLiKFlQxaRhMFPZbJ8eKHdv5w05xUtBRNiI/Hf86trrQa0PJcVrNaPq
	QxUejS3X87R6rnhN5MmGTjVYKTFwYZ8eQXb6qfq5adg8gBCclR+vHJUjJ4wfN1L+1dgl6GQx10c
	uLKfsTrJy4LxTDEF3pNrYNy975cTNASZdYXOsl/02t95RVj1BVgWj8R7+peLenORYY4sKvmbiN3
	mNLK8r2JzyG/UO4FXP4pv1xDrOGiEJl5FCd6x3bCnJsODSawS4ML01km3rVZSJ8=
X-Received: by 2002:a17:902:d510:b0:235:1966:93a9 with SMTP id d9443c01a7336-2366b3135e7mr102105025ad.3.1750051100107;
        Sun, 15 Jun 2025 22:18:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKX5qugZa1AxrKnkhp2zsOgIOkWCwkCCSqcySZ7F3F6nUv30kFT3Ho/o5/GcaX/FF9+6nTvw==
X-Received: by 2002:a17:902:d510:b0:235:1966:93a9 with SMTP id d9443c01a7336-2366b3135e7mr102104765ad.3.1750051099523;
        Sun, 15 Jun 2025 22:18:19 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de78204sm52672895ad.101.2025.06.15.22.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jun 2025 22:18:18 -0700 (PDT)
Message-ID: <a8b33510-c010-452f-9177-ce743b732d21@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 10:48:13 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] dt-bindings: watchdog: qcom-wdt: Document sram
 property
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com>
 <20250610-wdt_reset_reason-v5-3-2d2835160ab5@oss.qualcomm.com>
 <20250610180345.GA2382213-robh@kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20250610180345.GA2382213-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAzMyBTYWx0ZWRfXznlD7B6Nliry
 FjeD0T1ObrORoIHtE9E8xFI4g5xboulw0Cz8h2Xwl7s5S0iKrC55KIdQLXJ9HA0cBUYylrRSKWn
 8hman/Hyj+Ld3bw550GQUyhdd+csuiCSzHd1KyuU0BKQ4fa9zPy5FL6vDQoHMeVQTSksG1VqWcl
 LkLKBAlzLVzq0jGEG6OCwjvcZXcEldN7H7GRAOFe6b+Cr/0MEHLNUPEpo57X0TR4Z7vZVvFRilW
 55NahOtvZ0OT94tqDzPyRANC19zhA25J6MlN0WJ1spfQ25TZ+yz43P3IZtaX1i9GrHSCzY5tpQd
 FAEXvn0sVShRcUR/LnZETyhCeJkqkGR0S0L8w0QoHkat28X8LkJhhWiy3Ih32kSJXtDKesxT/ky
 k8NluJzaweT71K9HG9KLGfDm4vSH5bVNNGLbXNIFvZnpD4xsR7fJwEYRNaU+7pNb5+SgbIMG
X-Proofpoint-GUID: P7sA5UNXSQwchMWEz2x2Y9l46KuLaxek
X-Proofpoint-ORIG-GUID: P7sA5UNXSQwchMWEz2x2Y9l46KuLaxek
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=684fa91d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Xrx7LQK3kUNipwB-6k4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160033

Thanks Rob for the review comments!

On 6/10/2025 11:33 PM, Rob Herring wrote:
> On Tue, Jun 10, 2025 at 07:15:19PM +0530, Kathiravan Thirumoorthy wrote:
>> Document the "sram" property for the watchdog device on Qualcomm
>> IPQ platforms. Use this property to extract the restart reason from
>> IMEM, which is updated by XBL. Populate the watchdog's bootstatus sysFS
>> entry with this information, when the system reboots due to a watchdog
>> timeout.
>>
>> Describe this property for the IPQ5424 watchdog device and extend support
>> to other targets subsequently.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>> Changes in v5:
>> 	- Rename the property 'qcom,imem' to 'sram'
>> Changes in v4:
>> 	- New patch
>> ---
>>   .../devicetree/bindings/watchdog/qcom-wdt.yaml       | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>> index 49e2b807db0bc9d3edfc93ec41ad0df0b74ed032..74a09c391fd8e2befeac07f254ea16d0ca362248 100644
>> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>> @@ -81,6 +81,16 @@ properties:
>>       minItems: 1
>>       maxItems: 5
>>   
>> +  sram:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description:
>> +      phandle to the IMEM syscon node that exposes the system restart reason
>> +    items:
>> +      - items:
>> +          - description: phandle of IMEM syscon
>> +          - description: offset of restart reason region
>> +          - description: value indicate that the watchdog timeout has occurred
> A 'sram' property points to an SRAM region (see mmio-sram binding), not
> a syscon and offset.
>
> The 'value' should be a separate property or implied by the compatible.

Sorry for the delay. It was a long weekend here!

Let me start with the requirement (Please feel free to skip it). When 
the system goes for reboot, Xtensible Boot loader (XBL) find the cause 
and update the particular offset (in this case it is 0x7b0) in the IMEM 
region with the known values. On the next boot, if the system is 
rebooted due to  watchdog timeout, watchdog's bootstatus is updated 
accordingly, which this series tries to address it.

Based on the previous review comments / discussions [1], it is decided 
to go with the above approach, i.e., name the property to 'sram' and let 
it points to the syscon region (IMEM) along with the offset to read and 
what value to expect. So that we don't have to touch the driver if 
either of the offset or the value changes across the platforms.

Currently, IMEM region (which is a on-chip SRAM) in the most of the QCOM 
platforms are modeled as 'syscon' [2]. So I have followed the same 
approach here as well. Should I describe the IMEM region as "sram" 
(mmio-sram)  instead of the "syscon" (existing approach) and retrieve 
the offset and desired value from the compatible? or stick with existing 
approach and name the property to something else? Could you guide me 
here to proceed further?

[1] 
https://lore.kernel.org/linux-arm-msm/20250519-wdt_reset_reason-v4-3-d59d21275c75@oss.qualcomm.com/#t

[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/sram/qcom,imem.yaml


Thanks,

Kathiravan T.

>
> Rob
