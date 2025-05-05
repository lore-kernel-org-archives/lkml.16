Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7125925D21A
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746460903; cv=none; b=TTrmns48qrkVm7Q+cH49WvUKuInooI33XRj+H8qADkG3Y+uN3F+jEviW/VrRhj0qQx32QKacxl6DKspwulROH2z7QjjJkXsEGnCD613dlPjXpWKiqEHuwJlmH+r/+AVJNXXVRo/ZKVTZnRwCRKODaWZWG7rL+jhswPVgPGwtDiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746460903; c=relaxed/simple;
	bh=oksWoz/qfjF62lhOVwkmnzE68DlyPmns5CNFXyzzkwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kGLZK4W9vLkBa7h4Jz9n8nxPV/DuRdYkOreXAuFn6c0IIHHwG41B7AjUsBRGD3d2CdCXlme/IDTmC3muvTNsR5EDJY7KLboeaC1CrMEKgSpHk6PWuphC1yxuuUkBY0F2EukUzKYKn1isbLo6kkpJJUQRMekshG/REBAAv9UxOg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VFji+27z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VFji+27z"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545BSqeD016559
	for <linux-kernel@vger.kernel.org>; Mon, 5 May 2025 16:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y4u8e0uMKU6snjywf73T2BPJqst0pyG3KVo1RsgJxxg=; b=VFji+27zWJlXNPRE
	IZhTs13tWR+rM99hSJepJ+Ma1MDn/1cec/06WQOPN6uO1SkELyLSEANbtgJ+AE/X
	FZ7N8haGB4r71tSzMAr2pDbAAQ+eFXjGLrFRg2ktpgkmqEiQaj2rzwFxrPyQmR++
	rqWqiJt6Zu2bRhwRybVzbheZFUekZ/AzxdJBSVad3CN8jYsg2mYgRvfrXYqbhaiL
	dagzqowDbFrWH1ty6aRLmZCzEvmSdh09QH0EPS6N0myiwojzCazYxAb9IGVWOvqN
	WK5dKDa4wBi9B6tPYAnVfg4vj2guvA5NyP17NrB2s6zXKp0GmWt1qrYnLdXFcmD4
	35Y6OQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dafg4jtd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 16:01:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8f3766737so14371786d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 09:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746460899; x=1747065699;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y4u8e0uMKU6snjywf73T2BPJqst0pyG3KVo1RsgJxxg=;
        b=XlAtqhy19pRf3BtzRyprt6JwJp6k8ZnkaLpxlhWA9rN5mcGHS/3eoSFXo24KELNpc6
         lV7b1tEIPPALN9U4r/9nmpJ0PrAzz43pqnRLxJCrS908hrDDV/xOsXLHvbI7ROHjbkN4
         mR/J+y51nFvdCNVG8ipLKcqu8aLAVFiPECfNHu6zxJpkgQ8iNhuN8moHoEaq/w0Rvt14
         B+BWpktVY3BG9TQmGal8pH2rtiD1sEi2mDbFUAeuSk2Hw9eHxUc6Nb1apBdEtTQzsv6P
         YqNk/YUpDYE2xzOIsAPE1DF/kG2ZF1/7lDHgCrzAglC+36ZEZPiVulJIzBvtfudcm+Be
         Jt3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX95yoVQu45BAHtjUrggcWaXf2xWCi3yIH7KsBL/Jy4z6eIFO6ud4jGSf9/5VkjXu03kUr88A2mRnFXCBA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy/cuIYJVEg1pn6l9igsa8a9lTz865SKgGq69L7KTiFzYgAcf9
	RxV2NqB5PeMs28tEfUF8kDRkvLGwjgiL3KMNpsKzcaAZzUXjKKGsxCJXLkHdscqWfFRPrGTje7J
	Q/+dBGSE/Y72mT1e593IQBjah0AaGCRU7to6dVjtKledJv2lNpWB1eFsUkEItCMk=
X-Gm-Gg: ASbGncvP6DhCyvY2w6UiIFgAQZY5z7VMq9Tca2/BD+6I+sllEL488o51YmdE3ZQOyHa
	A/WuOabau7/YV+GWTuAHanUORdJdlkbXtDj2GmcplGrPAe0lZBxTUdtdfKiXSQyBtEg2ebJblM4
	j0jfHHTk9cZKa+c5HNh44CNKcu/4jW+/Z1PQDbZhD97//uNzh8JD9q/MRe+AqxiWNM2KiyblaV7
	oMpgwd9pIDmqW7gVsNjjUc37kUwQp7DxzvyzFVK8avCB3rGoRSNiOJ6GkQTcWXK6unS30TCVpv6
	Y7zp/DR5x3BR6rAZYNW9DNGEaPbwxhK0q6F6sPfuf5Kkkq+L+/FnLmz1qTqCiKrscCw=
X-Received: by 2002:a05:620a:319a:b0:7c5:6fee:246f with SMTP id af79cd13be357-7cad5b37edfmr776322185a.1.1746460899159;
        Mon, 05 May 2025 09:01:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+/p0BrecmIrDNm5RILVrBtCb7WrTDff8xHjP9/Y7QIwhw3Dv3HKuLgZUUhA3XQT8Z4ktRng==
X-Received: by 2002:a05:620a:319a:b0:7c5:6fee:246f with SMTP id af79cd13be357-7cad5b37edfmr776317885a.1.1746460898565;
        Mon, 05 May 2025 09:01:38 -0700 (PDT)
Received: from [192.168.65.169] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a3cc5sm521149566b.51.2025.05.05.09.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 09:01:38 -0700 (PDT)
Message-ID: <0f64aadb-badd-497c-b936-7644f5c5021a@oss.qualcomm.com>
Date: Mon, 5 May 2025 18:01:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] dt-bindings: serial: describe SA8255p
To: Praveen Talari <quic_ptalari@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        devicetree@vger.kernel.org, psodagud@quicinc.com, djaggi@quicinc.com,
        quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
        quic_arandive@quicinc.com, quic_mnaresh@quicinc.com,
        quic_shazhuss@quicinc.com, Nikunj Kela <quic_nkela@quicinc.com>
References: <20250502171417.28856-1-quic_ptalari@quicinc.com>
 <20250502171417.28856-2-quic_ptalari@quicinc.com>
 <20250504-hilarious-ultra-grebe-d67e7d@kuoka>
 <6f97510c-eb6c-4f3b-b219-aa8d895b060b@quicinc.com>
 <20250505-ostrich-of-impossible-conversion-a0f8ac@kuoka>
 <4ebe065e-9686-4e35-bb00-a9e816fb8926@quicinc.com>
 <1de5c0b7-7761-4d0c-bced-7e26150e995f@kernel.org>
 <d96eb6b7-5b48-446c-8b33-ba282d896e85@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d96eb6b7-5b48-446c-8b33-ba282d896e85@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PweVCbVjPQPvmZEuessPSazTSE0Qltwc
X-Proofpoint-ORIG-GUID: PweVCbVjPQPvmZEuessPSazTSE0Qltwc
X-Authority-Analysis: v=2.4 cv=atqyCTZV c=1 sm=1 tr=0 ts=6818e0e4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=4zt5D2LFsg2i9ozxeDMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDE1MiBTYWx0ZWRfX1fSDx99NT0vL
 vk16dLxm6dG/quEKNsEpNw77N6FJNmMHQFoooJ5rhoVgGuQh4qjEypETbInIj9Da8bSON0oUk3I
 Dtq+VzW6gLKvlx5Ln67ePtDySPlKSRRuKlHJDL5FpdXhruwfjeM47xw7O3lDICC96Ni4Mh3ezvM
 WscQP0FiAKw+iqx5jnovMoQPslBLDDNlvkQIMMMOJc6GjqaRxrG5zxRu2ubxG3U2Mmdtti4YnII
 7cU1zRHVC6VdUPjMOKi7PNc2Zav7CzPkKvtYOoda6f/JtOpeIHq56LL2T0SFr+Sb1GzcF+GVXsS
 PH+7qaXsqpmvn3KZCGhA6hMdEzPs2fZq6FGBrXWxe9/3SXzuqupu1QVDrVmOcb/Uixb7ohon6CA
 CLRvFaMztK4dORzLcIsRyXnuAZYow/qg6KJ/rBtIaZ585f9ywzqLzoG2tyyTiIoV+8AWfmFX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_07,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050152

On 5/5/25 3:42 PM, Praveen Talari wrote:
> Hi Krzysztof
> 
> On 5/5/2025 3:29 PM, Krzysztof Kozlowski wrote:
>> On 05/05/2025 08:51, Praveen Talari wrote:
>>>>>>> +    serial@990000 {
>>>>>>> +        compatible = "qcom,sa8255p-geni-uart";
>>>>>>> +        reg = <0x990000 0x4000>;
>>>>>>> +        interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
>>>>>> Why isn't here wakeup interrupt? Commit msg also does not help me to
>>>>>> understand why number of interrupts varies.
>>>>> Currently we are not using wake-irq because it is optional for our current
>>>>> implementation.
>>>> Great explanation. I asked why is it optional, answer because it is
>>>> optional.
>>> sorry.
>>>> What does it mean optional? This is part of the SoC, so how given one,
>>>> fixed SoC can have it routed or not routed in the same time?
>>> the serial driver doesn't enter runtime suspend mode until the port is
>>> closed.
>>>
>>> therefore, there is no need for a wake IRQ when the driver is in an
>>> active state
>> You described current Linux driver, so if we change Linux driver or we
>> try for example FreeBSD, then bindings are different?
> 
> Currently, the driver includes code to register the device's wakeup capability
> 
> but it lacks the necessary handler code for wakeup IRQ. According to the serial driver,
> 
> the wake IRQ is meant to wake up the device but the device remains active because
> 
> the serial driver does not enter runtime suspend mode until the port closed.
> 
> So it is better to exclude the wake IRQ until the appropriate code is added.

No, dt-bindings must describe the hardware in its entirety (to the
extent that software differentiates it), to the best of our
understanding, the drivers are free to exist or not, similarly they
may not implement all the features

DTB and kernel versions can be out of sync, so having a complete DT
description saves us from having to add explicit backwards
compatibility clauses in each driver and maintain them for the next 15
years, as well as letting the user update the kernel without worrying
about a breakage

Konrad
