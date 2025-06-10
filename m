Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5099C248F74
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749595954; cv=none; b=Kmtw4s3GuAVqbh4hTi+EjIr/WJErYqtHXLK3PmyXQUYMzN2H+Xog19XI6qPpJ5sEv9hsm5yNVLRwpyaZGGrG7W7Q9pJHQVCiEL3Jli4Es2wRUVWjf1q4uCIdNcOaKVBi1WOjPEEZ8Er6wUrdELQLJPibPsgqsfr6HfHrjIW5gkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749595954; c=relaxed/simple;
	bh=dGvEL7VFQMEHyCl9uhKD2qLMJqcGj2fNl68zFI+CAcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EfJ/NavhXOmfEH6m8S7ml2C0lkO7zeE3mt7uGeMCaNpYQWs17mfzvKEFd+7Yqgv/aSdYrbUFC31jY6IN7LCeA4XVtl5lEPkPMbtLU9PWjTLP8dF4QmrLz/Wjz1AUTZ6dgGVYcpuOGoas9l87gCCs8cpAhfm1SG1PL6zsfNttJjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DQ51gCR4; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DQ51gCR4"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553230a9753so768998e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749595949; x=1750200749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jDzIKnfoXKVxpTDnGzOlzzRBRZz/lpcLf4ffLk3rm3E=;
        b=DQ51gCR4zyHBQsAO3THxmep1HOUDK+vpZCSjhA94cktIduNcodYUGsXUImm2utb1HR
         lNi594PgRpr0EaFMAxAXtC5hnKB4rmFzprNLmK+/3QLWDdtVAItrMfEJQ97SpG8vtrSG
         C5NRZ/QcOYRTX/FVO9JE3/3pNJJU8komB3YkQczkMF1ALSApqcvltWNYHAWDKu6Aybzd
         HxBRiVLaOF+mbs+JqROqeICRXVF9javIo8MWyFBe2xQIt0wW0c955Vr6X+eRS0Kh3w5S
         aoLP29XsVEdqM2yvJ2RqhrWMHW7XcKv3j0dfbx7CGRhhoFf6sq1t1dzl2kLAO/DJHvBr
         gBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749595949; x=1750200749;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jDzIKnfoXKVxpTDnGzOlzzRBRZz/lpcLf4ffLk3rm3E=;
        b=Il6Cf8xk/AZxwxalJba7wts9JEPk4WWwk7fAigMXc8uoMyKj/ecva/PHtwdOSVkapz
         qTxvCbBCFNFKE0qjp5RLtUn5j5hqAYQpfaB19xvZuCmuGX6Rtr0LiOIzQjReE43V5H4P
         rvEJk4KGdSWG60AJR5gvbab27nNIMJK74KwMX+Ozwk+OSqDcIV7tNK69qlvYs1CRXvuG
         jTmuGGLJmtw/f3/NHCetqtu++xL0Qs8gL4h/j95YaoT3khBoWIcbi/7NB4fZWArwtfgD
         gCLz71/1Zo1paIkACz+DYbePW2elLfiMerAPPoYMvI9J/7r+bITQlqzsA4BipZSijXrF
         94DQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeNbSPxvdC52R0N463zUiC5AfCQEbmN6P5leNxeI0P73HXbARfyCcXsqoMeN7+xRdrnLZqKw+EOGhb/08=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcuGY6i/yAIcElOsiutYJ0vHJ7lMAwxak4faCayCTeddDbVmx/
	eyG7L4uaNUVPQsy6io4Kxj2KegkVyFfx9bu4vw/Bcu1Ftrdmucc50NGF6l6D2TQpfaM=
X-Gm-Gg: ASbGncsq/B4Z46ezPxBP/9SG79U5PWaYKOjzvszcUlpxCLD0T3N7LYqzY89LcxKEoAa
	+3yGndF7yuEcWnKQkvQONgvXWiKvjj2S40CaXTsr+yvNk1+1wZG/MbVOuBSEchFmvZYdQDIHtZG
	VU3xi5+sqfdRJzEqEcPaFFc3GPOaFP7KsLeJVA/YZ3Nxg8UOFM9kiI8NZK30R6y7T9nTp4X1sig
	8jHfREu0KiZK6Ed/mQWvrb+11yOUAvRrbnEZsMIygmcY2JjyjZiiPoHdE0ZAq+XWTjmHlkSkLGs
	7kKSgszTjzHMwnPv/2MfxIIjmvz/I6jD0SIbHm0sRJsHbvkdY3CCZXFAlUv37oU6ZACMfmpu3Mv
	EEOvwZohao7hHrpbAswTCHwUKCN8KQ80J1QrsN0Yy
X-Google-Smtp-Source: AGHT+IEtuqJcRIG0E5fei0/F3drx/EifVxzaUFRy6V7mzVWAdahdyPi7wDfC9TSKmVZdcMYEaT5BQw==
X-Received: by 2002:a05:6512:39c1:b0:553:2874:8efb with SMTP id 2adb3069b0e04-5539c2482femr113667e87.11.1749595949406;
        Tue, 10 Jun 2025 15:52:29 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d03acsm1722972e87.32.2025.06.10.15.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 15:52:27 -0700 (PDT)
Message-ID: <13db6444-d9e9-4c37-a68d-7ed2c4d52ef6@linaro.org>
Date: Wed, 11 Jun 2025 01:52:27 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: qcom: sm8550: Add support for camss
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 quic_depengs@quicinc.com
References: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
 <0367d5bd-a42e-4b6c-b841-ba20190b3127@linaro.org>
 <dc4720a8-2f15-44aa-9a52-8440c7518328@linaro.org>
 <739bad1b-f26d-44a6-9cc1-eee28023474f@linaro.org>
 <dc82457e-de2b-43ec-a50c-08f7d8bdeff1@linaro.org>
 <1883d9d7-26d4-40b1-9848-ae0477cf95c7@linaro.org>
 <6bbd526c-3193-40c7-91be-e629949dca8a@oss.qualcomm.com>
 <b4a7aed0-a05e-4d1b-965f-78e0c5e0709b@linaro.org>
 <10f07a65-0549-443d-889b-d36b3515a237@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <10f07a65-0549-443d-889b-d36b3515a237@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/11/25 01:17, Bryan O'Donoghue wrote:
> On 10/06/2025 22:13, Vladimir Zapolskiy wrote:
>> Hi Konrad.
>>
>> On 6/11/25 00:04, Konrad Dybcio wrote:
>>> On 6/10/25 11:02 PM, Vladimir Zapolskiy wrote:
>>>> On 6/10/25 22:02, Bryan O'Donoghue wrote:
>>>>> On 10/06/2025 13:49, Vladimir Zapolskiy wrote:
>>>>>>>
>>>>>>> List feedback from DT people is isp@ is the correct prefix.
>>>>>>>
>>>>>>
>>>>>> My bad, but I don't understand this comment, it seems irrelevant...
>>>>>>
>>>>>> The expressed concern is about the novel label name.
>>>>>
>>>>> I mean to say the feedback from Krzysztof was that we should use isp@
>>>>> not camss@ and I agree.
>>>>>
>>>>
>>>> Let me repeat it thrice, it's okay...
>>>>
>>>> I don't object against the properly selected device tree node name
>>>> "isp",
>>>> here I object against a never used and very questionable label name
>>>> "isp".
>>>>
>>>> Please feel free to ask more questions, if you still find it confusing.
>>>>
>>>> Again, I may missed a discussion about the need to get and use a novel
>>>> label name, then please share a link to it, it'll be very much
>>>> appreciated.
>>>
>>> To hopefully help out:
>>>
>>> label: node-name@unit-address {
>>>      property = value;
>>> };
>>>
>>
>> Thank you, here is a link to the wanted section of the dt specification
>> for Bryan's comprehension:
>>
>> * https://github.com/devicetree-org/devicetree-specification/blob/main/
>> source/chapter6-source-language.rst.
>>
>> If for whatever reason a proposed "isp" label is preferred, then
>> since a label rename is not an ABI change, it would make sense to
>> do a massive change of renaming all camss labels. Otherwise there will
>> be an outstanding incorrespondence/confusion of the label names in
>> board .dts files, and that's bad.
>>
>> -- 
>> Best wishes,
>> Vladimir
> 
> Ah the label, I thought you meant node.

I'm trying to do my best in expressing myself by means of the second
signaling system. As an example when I write "a label" repeatedly, I mean
to transmit "a label" symbol, hence I hope it should not be overly
complicated to understand me.

It's great that the understanding is reached now, it would be better,
if we can save some time in future.

There is no bug introduced in this particular change, however it shall be
fixed and be resubmitted.

--
Best wishes,
Vladimir
