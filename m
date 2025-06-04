Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6719D26ACC
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749046766; cv=none; b=LsAZ6szgfevzWeK8KCXh9gSRz9T/Z3IzHfYVtrf1EvFTVwl8ZxI55S9esww/PDIp2EQdXlxRxwZJ2XJtjqI7g1UlfVuOjsbqStrUSMK6dBVJjU4GgjZvAJ+6RvQonFrJk+JPO+LOiy+CzJhDeSmfZIoNjbaCMUTNtQ+VmXmOQKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749046766; c=relaxed/simple;
	bh=251WaT+JMDeyl8gX0jmb2fEMK7HNiXSHDKHWNo2ZsgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OgFokzf80yajPECR9HFJdLjwuyk7SVOtzSAzjpWdcYFUOYvdyAjxInmoCeG2Rjmd3hL/ig122cigkL03ZAZutQkjWpVFLzWU7lIoZsSHokBdots1CFtblz56bA80Oaoewa3KvEqvy11UkI9XYFpSV23QeumcviwE9jrq3bymm/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RN4lMjof; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RN4lMjof"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5547linj010763
	for <linux-kernel@vger.kernel.org>; Wed, 4 Jun 2025 14:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	68QutcxCYHS15NpUFLvGoYlDPJbMclT9Ep0Qrq9GkMQ=; b=RN4lMjofG/LdXVbT
	RKNs+BWuyv0r2q/Rjd5Vycklz8k9guLF+eYxJ5MIUbApT5HbK8qrHjOeAQMqaO9h
	C/7xyaGU0eqEzb3ANecUw8pjj/hbDKJWXMtUnndh73nrjz2MKQHQoc46zd5ipUyN
	NMKIzEWgtglnQo+/WH/LWXIYVoSBJ0WFxnA7gPhOfG87PLce0ui6/k5I7P2WI96K
	pceAo8DM80nPq0JAwODUqY9+9pesLQHpWLhKIpjR7m8eQqeY+OcbMM+26uttKPwB
	yuq0iHGkbFP8U1BjqkwyioWzbt6tCfG+331056+uz0iB1LohGqlWbOnnpHAKPVPb
	W1yyJA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ypa28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 14:19:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09a3b806aso144524485a.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 07:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749046762; x=1749651562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=68QutcxCYHS15NpUFLvGoYlDPJbMclT9Ep0Qrq9GkMQ=;
        b=a0fKpM1i4ibcXAiDCaD1rE4HSSdTFXijsW3GfDB6rob2vyFnXsKzTzdvc2QaUVQsDB
         efju7hXM/wAeCsYDlTqKyPdt6wJsJUDWNPyQWJeF4d4m/ai1ejG7pB0gdoqxjzyrmjjj
         +pGQzFhcCe4nVMSDdaMaqFfwuAjGfYsD+uIsZfkK8lxCgCaN7gwh/U+eTAUNMb5uqRrt
         gbZ7L94BiMutaEapxgQtMy0gW3eBSKdbEJz2RlzxjH/CdYxQvwEPgKfHgLI6NxcWhObE
         fD/wx/Xfwkoikx7BL0NMjLaGwGi8dONw1L6v+sbFuUqErRDAKCubK07Umd4+dLAe8i1u
         6/iw==
X-Forwarded-Encrypted: i=1; AJvYcCV9DDmGkyJe+hn5E5F3rzJy4ydehZr7WFLsQA4WFQAe4Th1+rm3f/oaWMT2zXn/vl2BIj60Yy7vb3YhSiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjhCeJhKtaahXJSsmSxFfSNp5waDlMNWVsr/aAZInXIsacDfz9
	5yxVZFvBdw+Hvu6TdOBggWsH2ZHNJj3ve5AEtQw0GTWFT2NGT6XLaq5zH8PLqjJU+mtdFEro3Bv
	GBxuNhrxYqt5s9EPq+FhH8VH+W6rAsXhhDPX296NUeCBOnXKwfrLw5Y+ud3p4mljF9/Y=
X-Gm-Gg: ASbGncumPrFgEErINCaBk+dlaeEo0DQrQa+g8KOeWrsus95OMuxpk7bgNNo8Y1QZxLZ
	Iw6/+kI7n2fZ/7JBiADgWxpye9vHQoR4+slzaFVVSbr+fpHJHsRnh12AQb1WlJi4gh36wWXcyXf
	f8C6lLs60VWC6j3h3Y6AVZYeR4EQKk2l/1sSXUXfgmJlqxlWJtsicqi+7hsUHUfcquZvzDHd3ZL
	6E7Xzg073d8R5o0KgiLmAOrDIeQhC1Ja8sAHNtpenIG4/zEaAAjq0HAhZq5MxsIEPdZ00yiL1ZL
	FLkpfglwsSStkf1pK3yDgudw9P+BbR1mK/KUijV+sMCwXYEWM8IQK33VBn4w6mVvpA==
X-Received: by 2002:a05:620a:24d3:b0:7c7:a574:c6d2 with SMTP id af79cd13be357-7d2198eee0cmr172821085a.9.1749046762026;
        Wed, 04 Jun 2025 07:19:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhu5IVwhXMCxfnNg+GTBKDVnu8vAYsZyd0PXpSc6Ek1K+ankBBiRwyZhFW7ELTLDR8pmTeZA==
X-Received: by 2002:a05:620a:24d3:b0:7c7:a574:c6d2 with SMTP id af79cd13be357-7d2198eee0cmr172818785a.9.1749046761567;
        Wed, 04 Jun 2025 07:19:21 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606a0ec0430sm2846895a12.80.2025.06.04.07.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 07:19:21 -0700 (PDT)
Message-ID: <b9752b9f-54d8-4ae0-916a-76149abcce69@oss.qualcomm.com>
Date: Wed, 4 Jun 2025 16:19:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] arm64: dts: qcom: qcs615: add venus node to
 devicetree
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Renjiang Han <quic_renjiang@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com>
 <20250527-add-venus-for-qcs615-v7-2-cca26e2768e3@quicinc.com>
 <429b4c99-b312-4015-8678-0371eac86de4@oss.qualcomm.com>
 <6a9e7daf-c0df-42db-b02d-96d9893afcde@quicinc.com>
 <idc4476ibh4geraklzpas5536jnwvbp6xhjjaajcdcwxicorrf@myh7kyz77rxy>
 <43e1f8db-5ab1-44ce-97c8-50910704788f@quicinc.com>
 <d6udpwmocodvlsm5ljqz7zbyonj2yahtlzmm2jjjveqrm2hmkz@andh5j4jgixr>
 <9faff664-9717-4259-8b23-bc44e64f6947@quicinc.com>
 <77ea49c3-f042-4ba9-a0da-1d0e4e4088d3@oss.qualcomm.com>
 <wyzyffaksofnubx72dy6uj6wuv5nk3bxii2ncdvb7ga3fegynj@z44aoiu4ywt6>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <wyzyffaksofnubx72dy6uj6wuv5nk3bxii2ncdvb7ga3fegynj@z44aoiu4ywt6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDExMCBTYWx0ZWRfX0cXVEU5hkM27
 hk6CT1sbm+mCAojED5YO5e1CHscCCxorogEUkY8vYm8RnkD7FmGLSvYNxppsBNy+Xy8PgAZVQqD
 ecPyWyyeZfAD9ngR0NJW8Y8cHcQahhsGmW6dx6AQEki6kLehMYWyS2Xtkx1nDvLG+SMoKz6I+x9
 cY2DTX9a6E0fA89WQnOZsMICfCCiciy+kvjOIxCQUnGTT9iWXTaC4ZfleeHXufgSqFr8chfOR4X
 CncLqwHxcr/hjS1gXv9ubgTIffGLraYoBRM7O3AilorU0CD/SuGHf8cBfb1OIUBUOumgsO6wDBS
 JdTAxnQn7hbOqwW/cxDRGL0NjPxQe/SpG9TBox0vpmU8LAJGN5s7y78FNtpUXizNjdaJSbM5i4n
 t+zpHovYryiHLqNhJ6LmLV60Qv23qp9B3JrsiBhXpO9e2jUhvH2Xo/EhqH/QX0SnMZzmqdIb
X-Proofpoint-ORIG-GUID: h1qhjRb2dxQnhgAb6I0PAn-CJO1YDo-F
X-Proofpoint-GUID: h1qhjRb2dxQnhgAb6I0PAn-CJO1YDo-F
X-Authority-Analysis: v=2.4 cv=T/uMT+KQ c=1 sm=1 tr=0 ts=684055eb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=CsjPDDX-YaRk47nNTkkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 adultscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040110

On 6/4/25 3:41 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 04, 2025 at 03:24:25PM +0200, Konrad Dybcio wrote:
>> On 6/4/25 2:05 PM, Renjiang Han wrote:
>>>
>>> On 6/3/2025 9:21 PM, Dmitry Baryshkov wrote:
>>>> On Thu, May 29, 2025 at 10:29:46AM +0800, Renjiang Han wrote:
>>>>> On 5/28/2025 7:04 PM, Dmitry Baryshkov wrote:
>>>>>> On Wed, May 28, 2025 at 05:13:06PM +0800, Renjiang Han wrote:
>>>>>>> On 5/27/2025 9:57 PM, Konrad Dybcio wrote:
>>>>>>>> On 5/27/25 5:32 AM, Renjiang Han wrote:
>>>>>>>>> Add the venus node to the devicetree for the qcs615 platform to enable
>>>>>>>>> video functionality. The qcs615 platform currently lacks video
>>>>>>>>> functionality due to the absence of the venus node. Fallback to sc7180 due
>>>>>>>>> to the same video core.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>>>>>>>>> ---
>>>>>>>> [...]
>>>>>>>>
>>>>>>>>> +            interconnect-names = "video-mem",
>>>>>>>>> +                         "cpu-cfg";
>>>>>>>>> +
>>>>>>>>> +            iommus = <&apps_smmu 0xe40 0x20>;
>>>>>>>> fwiw docs mention 0xe60 0x20 (which result in the exact same resulting sid)
>>>>>>> OK. Will update it with next version.
>>>>>> How would you update this?
>>>>> Thanks for your comments. I'll update it like this.
>>>>> iommus = <&apps_smmu 0xe60 0x20>;
>>>>>
>>>>> This 0xe40 SID was based on a previous project. However, after rechecking
>>>>> the documentation yesterday and confirming with colleagues, the correct
>>>>> SID value should be 0xe60. I’ve also validated it on local device, it
>>>>> works as expected. The reason 0xe40 seemed to work earlier is due to the
>>>>> mask value being 0x20, which causes the effective SID derived from 0xe40
>>>>> to be the same as 0xe60.
>>>> Using 0xe60 would be counterintuitive, as we have a non-zero masked bits
>>>> in the base value. It should be either <0xe60 0x0> or <0xe40 0x20>.
>>>
>>> Hi Dmitry
>>>
>>> Thank you for your comment.
>>>
>>> I’ve followed up on this sid with a colleague from the kernel team,
>>> and based on our discussion, it seems that the sid in this case should
>>> be the result sid. The actual sid is 0xe60, and with a mask of 0x20,
>>> the resulting sid would be 0xe40. Therefore, it should be <0xe40 0x20>.
>>>
>>> @Konrad, I’d appreciate any thoughts or suggestions you might have on it.
>>
>> What our docs describe as 'result sid' is literally 'base ~& mask', so if
>> we used that, setting the mask would be useless..
>>
>> Now, some old NHLOS builds are known to cause issues if the values aren't
>> exactly what they expect (some whitelisting must be going on there).
>>
>> I don't think this should be an issue on this platform, but let's just
>> use 0xe60 0x20 here to reflect the real values
> 
> Isn't 0xe40 also 'real'?

0xe60 and 0xe40 (unmasked) are two separate streams

Konrad> 
