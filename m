Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABB524E4BD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453207; cv=none; b=K7t8ghQytKd5w/lcGiatNppq0Jj9VQk8CloryxOFlZSOAs2TIBiWpT0P9XYSlb1iy5TSmCovAXuteUvtsFhi5sKiEN8WCVvABuGWp5jlclFgc5WIfYnmXx3dVvfhDKhQWs8V7NtnxB+/3rk1Hk74qLHS7fHnKTO7e5pxGEjr0qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453207; c=relaxed/simple;
	bh=hflC/7EECoo+FWEYujbHOxOfZC61B76JoGLGfoAngoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h745nEJN3whKPN+IoFhr8Jlmc+mEzsbfBWkVhevCjhdmApaNBU6XJColkpb47mEJ/MaAvhQ7dsctpDh8wowD1Z21U6qaTXlzo2PCLfT3Z9PsF+cswiPQxQ7ks4H6upmx8c3DHjajRjnkSRPeExsmC2fjZ7Zu/V5G8M33Zl/preg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oDIt/6cU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oDIt/6cU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5626pBeU025201
	for <linux-kernel@vger.kernel.org>; Wed, 2 Jul 2025 10:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aHOxsE8EA5bCxjxcI+SDUjFcl+31uQAcsQipjX1gMnQ=; b=oDIt/6cU0of3O2Zm
	tgpG2eB+nl45Av9pnRBhnYscFSBV+pZvylbh+9csIk5RtLOnvq4FMvw3VLII+EzF
	xVJoiqiRAvP0IF/wBFu2kHvwuLwM//EkAVqtCMOoAfNyHSZvAM4LdtRsm6zDwo+T
	QUcjHVbZD/08vYQkYZg2vRIOEscHGWuz34lXjWt7JsK3CthRBoshzjV+PbZG5Zcf
	AOrRlW+mAnk62VZN6I6AUueYsXpqaNgy8ttZTxOfKcfBSxceMYDpyQcmbjDPmvHF
	JhsG94EHmfzYwZzTCicqBOxveSmqQQHKiz2OmTC+gINBsgo43u1DszLw2NqnNifn
	pOKvMw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64sgjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:46:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748e1e474f8so6908829b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751453203; x=1752058003;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aHOxsE8EA5bCxjxcI+SDUjFcl+31uQAcsQipjX1gMnQ=;
        b=fvVDaEf/nzgM6RhOhhcLGoFB737+Nf24OiY4S9ULGxHeq1Nc6TbHj/TUn36K8DRSxO
         paTEWA4oLYKdtlFsWQs6wdh+ZPQau691/OXigDyDUAgPLDS6b3ThnDrjfl5upNPl3pYD
         DVfePg7v6msH/6+kf0pxxuI8bQSrC+RT/WlB3B2UwAuk/7+j5Os/XXQnKdoQB+ICQSzy
         dRPtptjKmWcxhwDTi8NrYZcFozEp5n6in3TGEo4mEKB7DD6S74vWm3hgtkAdGI7u0lf7
         pmxKwS/XpKB0ARzePyyBpHRwsvODtKbGHt0A9nA7bjYFxbueJBdpMt0Lcm2EDZPjwSpG
         VR9A==
X-Forwarded-Encrypted: i=1; AJvYcCXZakfPWj5Y5TNsAGIScmMKaxg5LZRVmU+9wFFwXYDqirmnShhQKey/1wyOEkAwMwVanvitZEUlgwxuW5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeCkRxsNBuQLwR4Tit63jm2ILEd8j69b7Gz0loRPIcFrnqZ3hn
	E5WJZ2OExq8spqdWnEhCaAY8nu+Se+QOtOUsLBlS042+dCz+bctFnivn+3flXi+1/xQG1h7AQMH
	AS+wwggWGF9KEBydc9vqrboldEcoFwYn6Ym7UnVI7Ck1IPzqlqQPd+B1yQ1LXvzVrCzk=
X-Gm-Gg: ASbGncuGrxH22i2g4yrq3MlcuPaJWoIawfCflZA7HMJdEyKPcEgFLMXwgdgDq9EOWNK
	4KAovfGbIqjySc16nyNwFkw9eVIep6N2vtePSTZ2rchc4YIU8BR62pH5cSNBV1Yb9Q6w+drM61o
	JV6qNlqeygwdZflvjFsihtRO2Ba+NWlQR8VTf40xHVTQpwFfxs2WketNDnYoDtKbK1XVdMiCwlG
	S047xH6GpPZeHGOWIW79hkMaW6nsgtT/Hheq1oO3h0K+gPL1jFzfRHxPzX8uGx7e19VcWt82HHl
	IW8UOtbrv/K3HInfZCwPi+4xXjVTYqa8oL1KqXQ23sPs3XFaaFjzuhr0DNhFJdc=
X-Received: by 2002:a05:6a00:929e:b0:748:e1e4:71d9 with SMTP id d2e1a72fcca58-74b512a4b63mr3111394b3a.22.1751453203284;
        Wed, 02 Jul 2025 03:46:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA7+CiZe4GA2cMk4Bhuat5NfBqDvPTJs1RWS1RavlKQ1uFs+BBJ1Y7wgYQ7e7I4vItRWBvcQ==
X-Received: by 2002:a05:6a00:929e:b0:748:e1e4:71d9 with SMTP id d2e1a72fcca58-74b512a4b63mr3111356b3a.22.1751453202802;
        Wed, 02 Jul 2025 03:46:42 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541bdeasm14377283b3a.53.2025.07.02.03.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 03:46:42 -0700 (PDT)
Message-ID: <37695966-1d7c-46c3-9717-30da4e8d1930@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 16:16:37 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: sram: qcom,imem: Document Qualcomm IPQ
 SoC's IMEM compatibles
Content-Language: en-US
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
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <a68f46f0-8053-4d9f-96f7-55de33bb301f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=68650e14 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=z-AMgQe07C8pQQwPwfQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4NyBTYWx0ZWRfX9mbpLt0tjQ/c
 CHmfUPhEXSAmgNiehjovpqFr7RLOK5TppBtBQafa8F4nCrqiejfW6mhWhx7JKpbYbinrI8WZ9wK
 qlRe7jwI/3BtoFaXoCtgI64baP/OTvn9c52hI4tHum/3ZL2taO2KkeWJZvDduZcvwb1HdIuU4i3
 Fu0LGvqP4wgAzvinFT5zjxAFVieu0GX+WtsGvfckIXeOv8lhaHenouPCZ7ruxsgIrF6Og/fKJmk
 IQFJiHgsIBKdmUaQJj97aztPFhRPN027nVLWQqGMAmcaQft7geqwcAkPL11FJUWjmL3n14l9B/J
 CCs5pZAi/V4X1j/ifWVBQ1I7I9Go/3AAw3nKWPJEGSCFTDIb0JaC9fsD7szMPlxc6x9OlHhv539
 BZm3n10iRN0zXeFXKsV3fb5MvM5vuA7XE0zE115ul6/dL5D+4ON3V6qSY/YU0GSgXwvUZY7N
X-Proofpoint-GUID: jRsuH2DQWMkKKQ4Qg49EhYjf9lVribYR
X-Proofpoint-ORIG-GUID: jRsuH2DQWMkKKQ4Qg49EhYjf9lVribYR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=810
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020087


On 7/2/2025 3:49 PM, Krzysztof Kozlowski wrote:
> On 02/07/2025 12:17, Kathiravan Thirumoorthy wrote:
>> IMEM is present in the Qualcomm's IPQ SoCs as well. Document the same.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/sram/qcom,imem.yaml | 6 ++++++
>>   1 file changed, 6 insertions(+)
>
> Where is the changelog? This is not a v1.

This is the v1. The series[1] I pointed out describes only for the 
IPQ5424 SoC. Since I have added few more SoCs, thought v1 is the 
appropriate numbering.

[1] 
https://lore.kernel.org/linux-arm-msm/20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com/

>
>> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>> index 72d35e30c439ccf4901d937f838fe7c7a81f33b1..48e2f332e0e9fc9fa4147fa12d9c6c70a77fafda 100644
>> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>> @@ -18,6 +18,12 @@ properties:
>>       items:
>>         - enum:
>>             - qcom,apq8064-imem
>> +          - qcom,ipq8074-imem
>> +          - qcom,ipq6018-imem
>> +          - qcom,ipq5018-imem
>> +          - qcom,ipq9574-imem
>> +          - qcom,ipq5332-imem
>> +          - qcom,ipq5424-imem
> Random order, no, follow existing style. This applies for every qcom
> binding and you received such feedbacks in the past.

Apologies — I arranged them based on the evolutionary order of SoCs. 
I’ll correct this in v2 and ensure it’s handled properly in the future.

>
> Best regards,
> Krzysztof
