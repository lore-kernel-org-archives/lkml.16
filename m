Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F331F9F75
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739279318; cv=none; b=XsX0p63irYPm3KDKdbbnpHxK+Y4lmMmE7/oH1sHeTSINFtPKAQZhFSeOrVFTWgEgmTZehcTauZZ5lFXVOnTVw04NHOvc70IH/1KYpNJgWkfLuXRpTMV+UuApxhIecy037gK4fNUexFnCZnSJYkWmS6ZWARN2s/LTfB1ZML6dPIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739279318; c=relaxed/simple;
	bh=vnvebyZwwLc8OwSou8hBVCmlvtKLxHwqaxSZLdVAAuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L70Uaxk0S0Z0sxkZOVIFO0Qa1P3XvGli/MZ2JabqD9X13dSBEoTgPG4/Zg6x9YjA2z7hRLHxeDFyNrlKZSGBsgIo6HZQr1Vp3QJjrGsLZFQwMnuaoPPaFJv7yLkVdLHjC1VvOp32cPkdX0aVRd0O+74ZZV+nJR5x18YD6hWcNYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R2z28JaH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R2z28JaH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BBHosp026400
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vHAtLns7KnEDpQV6jYYQrWll7xcYebywPguBOqRPaJA=; b=R2z28JaHgjLe1yI0
	/irQfjKQeEBCQ66Ruo5WBPc9zIs7WF6gYdOBC7o/R0pDEgDiBOplozE7oCj222Co
	+LJdpdfW09d/RrAFM2NpvEWAgt8bzdTCCVbLRN/QgbEpI6/GpS1v7trutqB8mKv9
	/NnknjddikDbMMUVKVHG0X2TPTucGnmh+1M5f/A6poh3X1WawLsddO/kz/ybEG78
	e+aWHEA2Qh5exBV+MElZOlQ3gu9AFFZbQbFUffRPgZbmp7/w7L3Fb+JCByRDbouw
	EbShoTWg76Oohviy+p9LOJxagNtVGTIWVKC0Ej2f4h8gAmVGcBHXUfI8Cmcr6Tpc
	Enw+1g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44r5j58bvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:08:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c060bcafebso30118585a.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 05:08:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739279315; x=1739884115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vHAtLns7KnEDpQV6jYYQrWll7xcYebywPguBOqRPaJA=;
        b=tHd4XUfCp5M1yYA7snDNeTXzki9y0LyJ5erzq2o9GuH9yqtSgpdSig//trY5d6fdo3
         ag6QyLt+w/K/Nq77yB9e/LvdQBKcdXn1T8byi26RsCWZW04LT0QrbS7IlyzKHdfwoDSf
         blg1fzkyxlAREAmNWShjnpJyS2slpx7MO3DBGHj345ghONuKqqbPkLoRGOFEAf1hKiHs
         6bvL1zgwsznCQn6a6YTtZ0NplsbjDYyWyW/PiPoFtQ/rO3GL4pvHQjkt405h78nyvFi5
         sxitWu3IEFbH41KV5yqvKeMpWlsgsllliSo2eJQYx4ZTuhgnvHDHdWiu645ytEEepeg4
         xbrA==
X-Forwarded-Encrypted: i=1; AJvYcCVIvlnXCmtM69AiIBdaBqH6JMGwb1ZTZJQBuv+t0ZeJOCgBteTQKO++JeQJKH/Cv9bwgQ7hy91Wf984V2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsWLjDWbhvh8XVYMRzQCq2Fxcaq9gsHHh4bJsrwBkhY6JpQXEE
	X+gZ0nnl5qF1YFtrVitek+z2uRkjFXBnBGfRq/p8jGVUhxcnW2C+a2r+z2rVERjrIS8iV1VZQQp
	Hv2HgxSUp+B8rRr77IbRir/PRiO6UBxjreGY4wLUJy2Lr9jDQynxDa5lIrG/Vphc=
X-Gm-Gg: ASbGncsW1/FwdJ0NvzI1uRDLBdHLCLtvZTof+ZVdoqHhsomMM6KOQIJKBb+IGlD2Of3
	Z7zxCmgjVEeOc07wjsua2JxPxTXg5sYnOULw4LlgdtiLt6SIMRVZEm7oXfGpJKLGkMn/Rm27yTY
	KjhLIbq23S7AfqK5fks30pZB+EU6h9ZWMp7AlgmIJW0lV7iyruXr/gC6yiSedHl+B6fre+Tzh5e
	Vs5bxWD+AOQDsKz9U9g+8ho2Iexps41ZpYsVvszKU0Yb+a4ffLjirmV5RH9oSd9fFQM0z1tsjlE
	FytfJlzGPRTgRLrRT/ggp+CpgLfrd4DKwuoLDnJYuCcqeVGSeKaSIjqvSoo=
X-Received: by 2002:a05:622a:315:b0:471:8bb2:ed1d with SMTP id d75a77b69052e-471a3da4884mr13265571cf.9.1739279315314;
        Tue, 11 Feb 2025 05:08:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxyWN2FQWfRwG4MGFHiOrHCWVf9nY3hnm7QYJ0cnrKFuy9MLK1m5TwTpomSl/Zgd9LOHGw+A==
X-Received: by 2002:a05:622a:315:b0:471:8bb2:ed1d with SMTP id d75a77b69052e-471a3da4884mr13265421cf.9.1739279314824;
        Tue, 11 Feb 2025 05:08:34 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7ee6f81fesm3927466b.157.2025.02.11.05.08.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 05:08:34 -0800 (PST)
Message-ID: <6d52d3aa-0dab-406d-bf4f-0bace77d46d7@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 14:08:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8650: add PPI interrupt
 partitions for the ARM PMUs
To: neil.armstrong@linaro.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250207-topic-sm8650-pmu-ppi-partition-v1-0-dd3ba17b3eea@linaro.org>
 <20250207-topic-sm8650-pmu-ppi-partition-v1-2-dd3ba17b3eea@linaro.org>
 <ba546075-cfc0-4b17-9129-f99054e2e1ae@oss.qualcomm.com>
 <6aa71142-3b1d-476f-9c78-1207fbbed3f5@linaro.org>
 <bbbd36a1-d67c-404c-b749-eefcf493ed7f@oss.qualcomm.com>
 <a2fbae9e-d1cc-44a7-86b7-9e15aa0490b1@linaro.org>
 <21f7eb11-bb0d-4e4d-a4b1-780c03fb86d9@oss.qualcomm.com>
 <36ba4696-1af2-49e7-90bf-f6f559b76fb7@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <36ba4696-1af2-49e7-90bf-f6f559b76fb7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 29xGdz0zPSoLjKj3H3qRees6U-b7onIw
X-Proofpoint-GUID: 29xGdz0zPSoLjKj3H3qRees6U-b7onIw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_05,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=985 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110086

On 11.02.2025 9:02 AM, neil.armstrong@linaro.org wrote:
> On 10/02/2025 19:29, Konrad Dybcio wrote:
>> On 10.02.2025 4:30 PM, neil.armstrong@linaro.org wrote:
>>> On 10/02/2025 16:23, Konrad Dybcio wrote:
>>>> On 9.02.2025 3:44 PM, Neil Armstrong wrote:
>>>>> On 07/02/2025 21:30, Konrad Dybcio wrote:
>>>>>> On 7.02.2025 11:31 AM, Neil Armstrong wrote:
>>>>>>> The PMUs shares the same per-cpu (PPI) interrupt, so declare the proper
>>>>>>> interrupt partition maps and use the 4th interrupt cell to pass the
>>>>>>> partition phandle for each ARM PMU node.
>>>>>>>
>>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>> ---
>>>>>>
>>>>>>> @@ -5309,6 +5309,20 @@ intc: interrupt-controller@17100000 {
>>>>>>>                 #size-cells = <2>;
>>>>>>>                 ranges;
>>>>>>>     +            ppi-partitions {
>>>>>>> +                ppi_cluster0: interrupt-partition-0 {
>>>>>>> +                    affinity = <&cpu0 &cpu1>;
>>>>>>> +                };
>>>>>>> +
>>>>>>> +                ppi_cluster1: interrupt-partition-1 {
>>>>>>> +                    affinity = <&cpu2 &cpu3 &cpu4 &cpu5 &cpu6>;
>>>>>>> +                };
>>>>>>> +
>>>>>>> +                ppi_cluster2: interrupt-partition-2 {
>>>>>>> +                    affinity = <&cpu7>;
>>>>>>> +                };
>>>>>>
>>>>>> I'm not sure this is accurate.
>>>>>>
>>>>>> I *think* it's cores 0-1 and 2-7, but I can't find a concrete answer
>>>>>
>>>>> Core 7 is a Cortex-X4, and has a dedicated PMU node, look at the cpu compatibles.
>>>>
>>>> Look at what these compatibles do in code. Nothing special for the X.
>>>
>>> So you suggest to revert Rob's change ?
>>>
>>> https://lore.kernel.org/all/20240417204247.3216703-1-robh@kernel.org/
>>>
>>> So what I understood is that yes the code is the same, but the perf
>>> attributes are not necessarily the same between heterogeneous cores,
>>> so each instance here would load the attributes for each core type
>>> correctly instead of only using the ones from the first core
>>>
>>> Again, other SoCs uses this same scheme so I wonder what's the issue here ?
>>
>> So I'm a little confused here. Is this partitioning scheme only describing
>> a set of same-kind cores to Linux so that the PMU interrupts only arrive at
>> one PMU device? Or does it reflect some actual physical topology of clusters
>> and how they're connected to the GIC?
>>
>> If the former, I have no issues with this version of the patch.
> 
> The former, we simply partition the PPI interrupt for each device node, it
> has obviously something to do with the topology, but the goal is not to describe
> the topology.

Ok, good

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
