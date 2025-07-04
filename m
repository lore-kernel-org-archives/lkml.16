Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708982882A3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619114; cv=none; b=DU0zJOx3P5rD3iNw1NauNjfxCy6mC+BRWkPh9kDKgV9c7nv7uxdxMSyUtIeKHjFErCaFKza5rFDm0qGgkPDXTmDH0hMGZJR8IAg9iXj8N/E4o4oW189pVucV8wg4LXerzAtm+1SoAIKunymMD/Nk2TccC15KUgnolAxdqMkAQ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619114; c=relaxed/simple;
	bh=yk7qosRnx0eOI4j1ITuzzy6/1oMiAdFL9WJAu1EtCW4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=kyelf9w0UrMtD7Co7Q3l+wRNeYVNWdUiS5dt4FpHouKmEJthaS7YLGHItqLcDrbyzng2aC7MB7ARJehrGNZxGAsEESdv6bf/v+DWxio4p0dhJREJ+lugqR48e7L5VCc7quHb+0E35p/Vir8kMvM3dTtdM+ex7GcX6M+norhTV+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S2L7S3/a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S2L7S3/a"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5646GwBl032417
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 08:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AZR6M9UH+ORRWSUKy7bTgigDZ2Mla2YST+gR8xNyJPk=; b=S2L7S3/aGUrjW3GG
	vaKph1KhhA7nSh11pR6m3PAYoj/RgX289xEHjoCROmGs4HQsC2CUSvtbQFtzLD6m
	fjfXwpa7jHgapUwr+TguzWdPlSug9D90k3CAhLyIBtSj9Tlf3YdwU4EVkwMtlwcB
	wJGt58GrJh4Z2Bate0J8mXx4YfRJg5Unh1+KAGdhX5JatQvnIiCTWJphglTyi50e
	r3XMoKEfmGN/Ki08ON8rSOIoBvBP/VvVPEMsncXy8RcvX2omDLLrLHdi2tJns001
	iwXMZtxA0yjcNpxghYZy16p3r5eJAJS2ZO1zvaJwArCtYbb6aox51fiyAXrzp0P4
	QsVEIA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9u7rd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:51:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-313f8835f29so1525691a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 01:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751619110; x=1752223910;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AZR6M9UH+ORRWSUKy7bTgigDZ2Mla2YST+gR8xNyJPk=;
        b=G7KlOdsA9E2nC2pEsuBeGFEmKxfqWT62LAABKHhS6C4v/bGNP1tiC++xGXMFHreq8Z
         pIqtnlGC5FdBM6vCxXrnzMqhABRT88c1+vv6K0A1qTTtP12kPfDLE+fd1/xRST2V3w4S
         36lAwIYBEK3/pMD94iG423oHbvuWQGCh5Vh2+Ek4wmZ/BUWZ2KfmrkhBbMB6H6YRnS3U
         jE1Cq7vTtH2+mtwe7w0tU/csDore2zu92p9IkaDpVQp1Tq4z+nQ9whplJeGY/03VH6D5
         y1vWV25vdKprX448WIjqymc9FRWB2KOrO5cJVstTnxzRV0rLOuLg4N8LeZ1mUvAsWkXL
         jtng==
X-Forwarded-Encrypted: i=1; AJvYcCVYsdX1ktJa4aILgFna0SrCPgVzPP19j9Gn4JT7XWWXI1w2NxH+nSM7C/cD6KLciKQtmIRVc27WBcWRY0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxWjU3Ep2Kvx3orwIroh7JoA1+DzkFDn5FrakRZLvREDfmxJky
	0SwSkakSITMowdE41JxRjWbvujyJ94tg5igmUt7Qs01afcBLN7hKLiSEiWh+sgn4friXgM9YVcP
	zSn88sTTLEhwdOg0t5rXU6bPFc4eMzBWsXZL+E7yJlVeNDYhsYfkUoKrgEicKtOqEIt4=
X-Gm-Gg: ASbGncuJCqJ7iB7pXXbiRC6DCZuCDSr2DcOn7pUMOQwyb7Y0wLSUreT5cEBEqOJMlSV
	yRUneo6RuDa+7hTjjDvT2cZ49MOd9Yv1N41Ewj1r6SvDOrCCgjW8Zq8LT9QVcSYYIzNKrwBBJrq
	YJ2NGaD5kQI/TNFbpUsEW0YmsrFPrFpAaYwK478SbM2XE43ncUjTeOR+i2je1WWCuVz0yAaJYhG
	IBjCofG1vMY8ccV8uwNaeNs4hN+TI8aR/Wa58AwvHBUaeZMjvwoMnT1XXPLrAMAQ02FdZqkYLWf
	7nYppnTEJJPSnZ2PjXEXnR4GANWYFrAPe1tLJET8/JkU4SwiGA7ftTxn/2IS/xw=
X-Received: by 2002:a17:90b:4a81:b0:312:e279:9ccf with SMTP id 98e67ed59e1d1-31aac432867mr2650947a91.5.1751619109722;
        Fri, 04 Jul 2025 01:51:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjHONIzeZBcmHDs0wQAo/69TAD7L3QCa4R8AjRrd36Wfaj0nIqIpoFwuQZvSMwqbOAfbsgpw==
X-Received: by 2002:a17:90b:4a81:b0:312:e279:9ccf with SMTP id 98e67ed59e1d1-31aac432867mr2650903a91.5.1751619109127;
        Fri, 04 Jul 2025 01:51:49 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a9cc675absm4678341a91.19.2025.07.04.01.51.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 01:51:48 -0700 (PDT)
Message-ID: <735a84f4-25b7-431e-9280-aed34e9254a1@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 14:21:44 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: sram: qcom,imem: Document Qualcomm IPQ
 SoC's IMEM compatibles
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
 <20250702-imem-v1-1-12d49b1ceff0@oss.qualcomm.com>
 <a68f46f0-8053-4d9f-96f7-55de33bb301f@kernel.org>
 <37695966-1d7c-46c3-9717-30da4e8d1930@oss.qualcomm.com>
 <e1424499-718a-41c8-b729-0ea96bb6a172@kernel.org>
 <b5481363-ab6e-4b27-8a5c-d766f64e5169@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b5481363-ab6e-4b27-8a5c-d766f64e5169@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68679627 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=2Hie-wN6ZoqyeGEPU0sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: IHbD0ijia0oq25dpQJY4Np_SZ6faPXvy
X-Proofpoint-GUID: IHbD0ijia0oq25dpQJY4Np_SZ6faPXvy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2NyBTYWx0ZWRfX+RewwWPAUWjY
 zFJuCPmCLBji8HZ+95CzL1KQkVdaYbn4gEYXvY3IzUo2Js2x0TasRP7UKAzwUwsS3Em44MPFivG
 SMnyywfIYBbAhrE1jHlFqMcVthZIFkcB5BHVHOuTtGoF4FS2Q6L/Z1kLyxDtk0EbS3UQqJA+8Ak
 KoztjxQCQ3O9bN7nf9qNSYowWmiGCmeBjNEEhbRXdowlHzij2dMr3umKhiMY0H0Ra1rFD0nGJRz
 pUtsAqDdlgVGyKxnft2VIZ1UPkWfLOEp8/z9GHI3FvvU/ydDo2LDKf4Agoyu8QFWQpzs3ISxgA4
 BKn0nUCr4nJTpCz/YT4uKiMZ3x12fD9EGrAWcZi5CUkodRH1cppsiV/ZUA0jVfMOcSzgULvn0aA
 nTMic1LZbKKXsw7PpvpHjxYOA7MNpf6lrTvN4Y/R6A1Ij2+QFjedI+2pEB+XwGMHpFcTTfg/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040067


On 7/2/2025 4:29 PM, Kathiravan Thirumoorthy wrote:
>
> On 7/2/2025 4:18 PM, Krzysztof Kozlowski wrote:
>> On 02/07/2025 12:46, Kathiravan Thirumoorthy wrote:
>>> On 7/2/2025 3:49 PM, Krzysztof Kozlowski wrote:
>>>> On 02/07/2025 12:17, Kathiravan Thirumoorthy wrote:
>>>>> IMEM is present in the Qualcomm's IPQ SoCs as well. Document the 
>>>>> same.
>>>>>
>>>>> Signed-off-by: Kathiravan Thirumoorthy 
>>>>> <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>>> ---
>>>>>    Documentation/devicetree/bindings/sram/qcom,imem.yaml | 6 ++++++
>>>>>    1 file changed, 6 insertions(+)
>>>> Where is the changelog? This is not a v1.
>>> This is the v1. The series[1] I pointed out describes only for the
>>> IPQ5424 SoC. Since I have added few more SoCs, thought v1 is the
>>> appropriate numbering.
>>>
>>> [1]
>>> https://lore.kernel.org/linux-arm-msm/20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com/ 
>>>
>> But IPQ5424 is already there, so you reworked that patch.
> Okay, so this should be V6?


Let me drop the IPQ5424 support and send the V2. I hope that is fine.


>>
>>
>>>>> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml 
>>>>> b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>>> index 
>>>>> 72d35e30c439ccf4901d937f838fe7c7a81f33b1..48e2f332e0e9fc9fa4147fa12d9c6c70a77fafda 
>>>>> 100644
>>>>> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>>> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>>> @@ -18,6 +18,12 @@ properties:
>>>>>        items:
>>>>>          - enum:
>>>>>              - qcom,apq8064-imem
>>>>> +          - qcom,ipq8074-imem
>>>>> +          - qcom,ipq6018-imem
>>>>> +          - qcom,ipq5018-imem
>>>>> +          - qcom,ipq9574-imem
>>>>> +          - qcom,ipq5332-imem
>>>>> +          - qcom,ipq5424-imem
>>>> Random order, no, follow existing style. This applies for every qcom
>>>> binding and you received such feedbacks in the past.
>>> Apologies — I arranged them based on the evolutionary order of SoCs.
>> Where is such ordering documented? How is it expressed in your internal
>> guideline for example?
> I made the mistake unintentionally and apologized for the same!
>>
>> Best regards,
>> Krzysztof
