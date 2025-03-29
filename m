Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047E61420DD
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 12:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743250099; cv=none; b=nsOmqOKbf32G5Ijc2m1bOB0POrrjpOFh85WGVKSyP1fxWIPPn0vJnHBfF2gmHn19Ti7Xa9gMWtk5jHYj+4f2IBUD+U/sfO7Z4CSU+/AZoV4notN6Rbr4zHvWmwDGvqL8lTaqeazJ/Olx241n8+/kvlsLqbnJ2TxzZ8x0lfzMnL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743250099; c=relaxed/simple;
	bh=L7JTo0E0gzn7rLnvsNJRz+dUNZ0JNHvemC0kxqfvfjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AfX/K/3DliQ3YdKIGU4qVG/KUwAe+3YhJAEBguDKvmJQm8pXXiX/uYnmxdRFnsCLlzug96md+xYxoCl/8GNIovwmcoGb1sZc9rpCjsM1y/HWpy6kcxR+24KTLl287kVbSrC6O/pk3BWxbXs0x9AgFKqenwHZMGh1HUcXC8xnhag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BfKtNglN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BfKtNglN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52T7tsFP024948
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 12:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0C9gknJATnLKxpwXnEsHTDid47o633iNtgcda9/d9AY=; b=BfKtNglNc8x1BJ6q
	P917REaxLGWzozaObGTUAmoaBwMZjtNUNARrwSV93ApOYIY07YcDQfWe5Ygve/Fk
	wBMDxcGQ6IbPfDdcKK8lAHkN66mi//XfWRH63CkZMvsYYvqdc+gVklPSF1CKz4NE
	3u0OVtzoPdSPhQAsbkX4RZZVhWoIYGPDHbcN8y493HDEAyca1jHe64uOpSEUGlMO
	ecYF7X10kPT8Vh1mLdsD6DZcZG8NJrzjYv0OHX7CrMCE6Lg1nHZyj2A5yGGIHbUo
	xv8gW8prJ8JDYhNPL685ri1tnwUubDeJq1GjL2S4kxNCN2cPE8yHFo29U4hu+ZHW
	HWKYVg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7tv8ryw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 12:08:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8ff8c9dcfso4867096d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 05:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743250095; x=1743854895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0C9gknJATnLKxpwXnEsHTDid47o633iNtgcda9/d9AY=;
        b=t1NsNTGFyMJAyyEH+KGiXY40grfTo71/7LCw3NcYV9cpZZz6W7JmPPOsvc98b0b8iu
         NgOiUurnOJUAoYQHSXHSKGahKnxaK0CYpJbQes9WNxTSaY+tjUsOrbpBFHJb9ioaQ6sh
         LjJM7iCXLaoGngJCClrUzvXwarNnVW3CztiQu+b8mEGGvW3vnHW1TPAiDMg0f484vM3Q
         hynRybOueshmRdHMe6KL/Aj78Y8frqPlsvB33Q7dhC0oGIAqUnfH7u2cB17qwV8RbiFI
         wghZBgNFsFC50MCDtK0CTM/fHt2a5usLY5PHOAwCBtPajPS3EsI09LMmqfcfzhRd3zZO
         BX9g==
X-Forwarded-Encrypted: i=1; AJvYcCVEyxxDZqIMvUi/pZOo4QJPqAbZzMA07F6mjsBAWJdcuh/bBzL67kId0UsEfOlGj/iuXBbHwJl2HXleus0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnCegzJ2hkaPBpEd37TVomylFZXR8II3HhJWeYa6YZSelrqKp3
	jjPg5smoBBTOVC4XJ4hL7k7aqz88QlGqpD3lM8zT+CIPx9Nj7JHap8nu7AioOD7nFsuBvobstDY
	Ob46ou3uD6vYTT/Abexxmfu/GveudyYubothDpZXFqw82oC3hQQkPCLW8LXK2aYA=
X-Gm-Gg: ASbGncuSVmtcIhJvPQZSyHave3FInU38KrnPNNLrlRQAZ28rb7VX9Ryn8RJFvSf9Xgo
	TahLigGa8m5TvkaoqZYxuUNFXIezIkg97Si1l9vpsqguY6HfQG4jhOcX6BnKY9wcQbBGxv3J+PU
	qZA4XmEVzbXRLqRWypPvw8fT9MxssxYzGyf0XG6qtwER/4a8exM6vkUTWk337wpfXz9W4A6e0a0
	NUABK5u/nHb9iCxKmjCHHpGlsR493bth03Z7yKtMB/AxAR9xjdXoyy+T72HiF4HQ3GtMK404GzQ
	zZ7wTCKu43CTjLQMa3/5c0PrbsC6KDs3nXqK2h3CQM9o4CRYOg2me5XBkM5kNeDa4LFRlw==
X-Received: by 2002:a05:6214:4005:b0:6e8:f645:2639 with SMTP id 6a1803df08f44-6eed60173fcmr12213396d6.5.1743250094709;
        Sat, 29 Mar 2025 05:08:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHk2TeNdBaucLn9okSalMI69L3QObeCM+4ngmKxDw6cS677XnXJGRFXWModiedovv9j0mcijA==
X-Received: by 2002:a05:6214:4005:b0:6e8:f645:2639 with SMTP id 6a1803df08f44-6eed60173fcmr12213216d6.5.1743250094238;
        Sat, 29 Mar 2025 05:08:14 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7196dd9a5sm316166966b.166.2025.03.29.05.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Mar 2025 05:08:13 -0700 (PDT)
Message-ID: <1bd6d249-e0bc-4750-83a6-db70f2e58ef6@oss.qualcomm.com>
Date: Sat, 29 Mar 2025 13:08:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sa8775p: add QCrypto node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250227180817.3386795-1-quic_yrangana@quicinc.com>
 <ea79cee4-8c47-4054-bd17-2097ada4e583@kernel.org>
 <b57fa204-d3d2-4b74-8834-3f2d93726a99@quicinc.com>
 <73ed6108-27ab-43ac-abd3-82656693404d@kernel.org>
 <4a205725-af49-4f28-ab78-7059451d66c8@quicinc.com>
 <gkjdjzmhtsr4la5ami4qnsqgrd3zzdvu46eyaxpwh2brfsqm6m@wwkuxljbfwa4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <gkjdjzmhtsr4la5ami4qnsqgrd3zzdvu46eyaxpwh2brfsqm6m@wwkuxljbfwa4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OIon3TaB c=1 sm=1 tr=0 ts=67e7e2b0 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=sY3dAEUmMzCiYxic9fkA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: DRVdwEtK3gt6_AFJRYhhruSVS9K4jmk2
X-Proofpoint-GUID: DRVdwEtK3gt6_AFJRYhhruSVS9K4jmk2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-29_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503290086

On 3/28/25 1:48 PM, Dmitry Baryshkov wrote:
> On Fri, Mar 28, 2025 at 11:34:58AM +0530, Yuvaraj Ranganathan wrote:
>>
>>
>> On 3/27/2025 12:38 PM, Krzysztof Kozlowski wrote:
>>> On 26/03/2025 18:40, Yuvaraj Ranganathan wrote:
>>>> On 3/25/2025 1:00 PM, Krzysztof Kozlowski wrote:
>>>>> On 27/02/2025 19:08, Yuvaraj Ranganathan wrote:
>>>>>> The initial QCE node change is reverted by the following patch 
>>>>>> https://lore.kernel.org/all/20250128115333.95021-1-krzysztof.kozlowski@linaro.org/
>>>>>
>>>>> Use commit SHA syntax (see submitting patches, checkpatch).
>>>>>
>>>>>> because of the build warning,
>>>>>>
>>>>>>   sa8775p-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
>>>>>>     ...
>>>>>>     'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
>>>>>
>>>>> Not relevant warning.
>>>>>
>>>>>
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>>
>>>> Are you saying this is not the warning seen at merging?
>>> Tell me how it is relevant? Tell me how can I reproduce it.
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Below commands will show the above warnings without the fix,
>> make clean && make qcom/qcs9100-ride.dtb CHECK_DTBS=1
>> make clean && make qcom/qcs8300-ride.dtb CHECK_DTBS=1
> 
> You are probably running those commands on a tree where the patch was
> not reverted. That's useless. Please update your patches to stop
> mentioning the (outdated) warning and just describe your changes (i.e.
> adding the QCE nodes, you are not fixing any warnings with your change).

(please use linux-next/master unless asked otherwise)

Konrad
