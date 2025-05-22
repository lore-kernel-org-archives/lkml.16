Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3EF1E7C38
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940369; cv=none; b=e2MgygoToPwf+tURkWg+4H2XA6AUc7NSu7/dvRr1/LuEyWK3qIMVeedBoROaxVrBqJCxkTewNNg892KOnTBgcVA8E8MqjIe97CXwK1s3Iv4ToNC4xBk7n4VZeWrddajWulPvmWT7z7RHSy+PjJKo3qMJ7PL5k7CYo+ZDH2VhwF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940369; c=relaxed/simple;
	bh=ur7YbUqNfAfABg/WZQGZKIefNXNm7QwnkWAijkrsaMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gF2jzX5IWOnl69PCwdRxF2NHPZhGTZi3fdaf5kFN71HBF1YluyInMzn+aTJPyUJ+KLlExAQTeUFl2qSUB/RXM7BWN68rI/TgcvNFOugzF6ljYt0d2fl3oz8f7S9DmfC6E584CNagEsptg2JMkl4vDjgFYxgtXVAUS6Cb4kPu5BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZr6OBVV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZr6OBVV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MHlSs6027677
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D3hythJW7O3Ln+CjN8TBZmcFFx5xKO2LTaidnlRHNd4=; b=KZr6OBVVTRIRwofL
	PF04cRXBMhOQiM1kMLiIsfCxis7pzSS7wV6Kkeocb3LgfWV1Wp27h1f32ZMBu+hn
	m4rpH7rv4DW/yh9UHWqn5KVwqjL4VUtxK1v5F3Tzp4D79g9v1sKxK1Z+gfJ72QzK
	6xTg/eM/k1mxpNvT7eI6l2jTWlAreYjKQxnQSb8XTRD2LiqERJyqDPchRWGuT3nb
	6ipihpJhunUY2ln5sHf45qVJlvYhBpNEBiiMKaL1NGQ451Xfd1qdnZlaHmGRIt/v
	vGb/ZvZSGM1q8tGHCupGQLAaLnKb45sEo9uFMIoq2Mnu7t+NJGJhHU8xapdCJWFR
	ix5eMw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9fapg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:59:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5ad42d6bcso226360685a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940365; x=1748545165;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3hythJW7O3Ln+CjN8TBZmcFFx5xKO2LTaidnlRHNd4=;
        b=rhi8Wy2LTDHY8eTlTvJYOKRN5MgRZzlhAEF57bpcNnrSV9cDut7A5jyOh1HerMx7A0
         u8zvOJrP1gVzADnxtg+qzN9s53W3MWE2BW3BZsbJsgoIM8PAjpJlZuQPgYDuS93d7ujd
         sxf5Km+zK9ziaJcfQSPw7qO1MKSJ/6pEj4Tjl06dYd+u47BSxXVlUyAAW4q0wAuGn1U4
         puLK72hAN419pKQ7AsC85BzrZH4ECnb2N1QMOW2VVOU+WtR1iVh4j1PUfmU7xYO2gZzs
         w9qpd+okJxSKBQZJqyGKUusMqi/v0GF3Qm9Ith5cAjcGdYzKxSESeqn2jgf21NFT+sbY
         1pNg==
X-Forwarded-Encrypted: i=1; AJvYcCXTvOthBtuqzjUG4tY5G/loWFvs7yPqorNlR+Wxreh7LvdSI+I/vIprA8wdnbWyvEN0HUFkoBNZuVOTtRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnErG4gVRdZvcqw2+0s8UnFDo2St7HuYk/3NdMhEzW3eTYIxU5
	jyvWtDvnjm4tYbW7lq9rLcwsBYN715lHd6Xoh+QgAHWyUAzOJrF7dNb+D6spKO5nQeQq9i/bk67
	5T887BTKX/Q5DwozPDRpcznkaw6GEOS5ilG3CSXWNIJPPfIeD4hXXPUVf2NWIMbVAJak=
X-Gm-Gg: ASbGncsj64YZSulEYNHb/bivZCRVG2ujWtPa/hyxVGs7ooA3STO7mz5zJLoZImUkDq7
	jYqm5Y7npkIRexf8IpY0W2Ut4eotJy1n0Fjmjfz4bp0ImeWYkH4q4u2jG0k3dV/GrL//PDjGMM6
	Km6FZ9VU4hdI8j5gDoHgP02jUt1t3GyPYf0VjfGaQN0Mlrn7Vc041T6RQKdDn859Y40MgNN20Qq
	yuORw3PD+xcZpj61hcxenwplrwQIAmC6RffdEUYFUZ2qOyAOHzJU8z8PdgIvSkwnJ8unyIolcD4
	G5iiMvCMSfDmfhcyX/gydGkOHGFtJqBDXQ7ac/6+X4usXS44FG50Un3ZMtcJsPVpRA==
X-Received: by 2002:a05:620a:6202:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7cd4a08ee21mr1100097085a.0.1747940365559;
        Thu, 22 May 2025 11:59:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQOAYGhe6K1LjGcBN6vbBiDnDIWsN+lmRlqcPeMkJaP1WJt5jFRdI44FsjYiPFQzGx3Bjnlw==
X-Received: by 2002:a05:620a:6202:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7cd4a08ee21mr1100094885a.0.1747940365191;
        Thu, 22 May 2025 11:59:25 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e746csm11208840a12.47.2025.05.22.11.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 11:59:24 -0700 (PDT)
Message-ID: <e3033f51-9837-44e6-904a-9fef6b108252@oss.qualcomm.com>
Date: Thu, 22 May 2025 20:59:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sc7280: Add memory region for
 audiopd
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ling Xu <quic_lxu5@quicinc.com>, cros-qcom-dts-watchers@chromium.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, Eugene Lepshy <fekz115@gmail.com>
References: <20250516110029.1637270-1-quic_lxu5@quicinc.com>
 <20250516110029.1637270-2-quic_lxu5@quicinc.com>
 <uzyxagnmxz5tsjy32mfro2alwdpcq5kybwzcbsysul7u6adgdf@x7katw7eme6u>
 <b90ee18a-5e88-4c36-a623-ae9447c53a46@quicinc.com>
 <2mu3bncxoq57rxi22dyd6ys2wa5n3wmtadfvixozshxgenutai@dlkbqgplzrrd>
 <46caa88e-790b-4733-83bc-75ed6c7ca2d8@quicinc.com>
 <CAO9ioeVoqQhDhBW_fVU8kkt=3trV9YhEDUO0izdf8cuCDqU4Tw@mail.gmail.com>
 <76071cc9-b052-4628-9890-239b0acd260f@oss.qualcomm.com>
 <fd2vic3g5jjk22y7yv24mtwr27ies2my5lih3zfj6yw4zd2obo@artndh3vepbb>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fd2vic3g5jjk22y7yv24mtwr27ies2my5lih3zfj6yw4zd2obo@artndh3vepbb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3rDvhkBPSMHG6mkTIbIpyIWn2_34gQiG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MSBTYWx0ZWRfX3WwJn9lszbFt
 srWYi7jtIA4EpuRxvTVZzESxlyLtC/bQ9uz5Te76D3Ff84NIVl4kMYtASK6ojqbOPSkvq5c+DEs
 f9imlxwh+sV2Nd6HNBu6w2N10khvAqWuy8OXl0Lr1XGTUaZrJ1xEXhTgjd0V1tPUsIN5Rhlqxpj
 3peg5gaN7WuQnHNeCoXKfHxHjsrmzuP3kJe2FSOdslp4r0Lz6MEtiRTJA9Z0X3ybc7OL59aw6B5
 pNJjfn1phIWjhJX5L4f2ULfSyve0/NEKiwlEDQE2E3C7YlI7ciKhwZeXy8Z2Q0rS18cQgslTKeS
 n5LPZ2qxVdQYQAY3zj5AqCsX/Lm3/pgeNF7Xu8JNRVzuWFDCtOExfhFJADRKSURFpZkDQeLYiGJ
 LmE8dM9InSQ9S8lQcGXhLJPvAFpnFS2kgec7CHhe5QVjOPgqf/P9KssZQKBhnGo2YYok9Six
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=682f740e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=WcJvuXKDj7ErHkShSZUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 3rDvhkBPSMHG6mkTIbIpyIWn2_34gQiG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=956 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220191

On 5/22/25 8:51 PM, Dmitry Baryshkov wrote:
> On Thu, May 22, 2025 at 08:27:40PM +0200, Konrad Dybcio wrote:
>> On 5/22/25 2:16 PM, Dmitry Baryshkov wrote:
>>> On Thu, 22 May 2025 at 13:44, Ling Xu <quic_lxu5@quicinc.com> wrote:
>>>>
>>>> 在 5/20/2025 9:53 PM, Dmitry Baryshkov 写道:
>>>>> On Tue, May 20, 2025 at 02:41:22PM +0800, Ling Xu wrote:
>>>>>> 在 5/17/2025 5:47 AM, Dmitry Baryshkov 写道:
>>>>>>> On Fri, May 16, 2025 at 04:30:27PM +0530, Ling Xu wrote:
>>>>>>>> Add reserved memory region and VMIDs for audio PD dynamic loading and
>>>>>>>> remote heap memory requirements.
>>>>>>>
>>>>>>> Why? Was it not working without this heap?
>>>>>>
>>>>>> yes, it will not working without this heap.
>>>>>> Memory region is required for audio PD for dynamic loading and remote heap memory
>>>>>> requirements. For more info, please refer below patches, it has provided a more
>>>>>> detailed explanation.
>>>>>> https://lore.kernel.org/all/bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com/
>>>>>> https://lore.kernel.org/all/effea02f-6ffb-42e9-87df-081caafab728@oss.qualcomm.com/
>>>>>
>>>>> This triggers a bunch of questions:
>>>>>
>>>>> - What is audio PD?
>>>>>
>>>> Audio PD is a protection domain which is running on DSP for audio
>>>> specific processing.
>>>>> - Is it a required component?
>>>> yes. it is needed wherever there is some audio use cases where
>>>> DSP audio PD dynamic loading is needed.
>>>
>>> Which use cases?
>>>
>>>>> - For which platforms ?
>>>>>
>>>> For platforms that require dynamic loading of DSP audio PD.
>>>
>>> Please be more specific, we are not playing a guessing game here.
>>>
>>>>> - What happens if there is a memory region, but it is not used by the
>>>>>   driver (SM8650, SM8550).
>>>>>
>>>> It won't be used.
>>>
>>> So, what happens? DSP crash? system reboot? blue smoke coming from the SoC?
>>>
>>> I'm asking all those questions to understand:
>>> - whether this is applicable to previous SC7280 platforms or just RB3Gen2 / IDP
>>> - whether this needs to be backported or not
>>> - whether a similar fix should be applied to other platforms.
>>
>> I wouldn't worry about FP5 too much (albeit it's apparently not easy
>> to test it out and even having spent some time trying to, I couldn't
>> figure out how these things connect), but the chromebooks may be
>> potentially problematic. That said, we can overwrite it in sc7280-chrome
>> if necessary
> 
> What about NothingPhone?

I got Nothing to say, we can ask +Eugene to test it

But I suppose you should be able to check if 845/8150 needs it
and we can probably assume the base-7280's config matches

Konrad
