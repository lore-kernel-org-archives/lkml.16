Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7601202C38
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 12:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743510013; cv=none; b=DX7NlyeyB+EzyzisIzAEjYhtOBEImMoqzGUpgAGf6hAfey/58L+7qLVPZZdUQ4KIO77HFmQ7mZXgoG6sFSiPfDtPAu1wif1kMSkWEIcEMnxz9SSTGI8Hxj7dnpF0j71lOMvX52W7xkcvI9A4BEAXULEVkjC5BXAIYYtHZazYZIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743510013; c=relaxed/simple;
	bh=dKjPgmKmqyPFfrKL/o1FVi2WVQPuBqkf3y1a5UJuMSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WAxn2j9F+qo+qoPfNDy3w5JjaXEScUnwuQFLkdoao8lIBKBO8OTFjGvI3wBgfHAuaa7ZOsTF4PkB4SRoh/LsjvDuNWdf5J/W+pxV5Sz1V0j78clAmiAXFuUepiqiNocljmYD4Djo4G27Xs4zXVTHgUkNfQept2NsCfieK4m8jSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WMU708Eu; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WMU708Eu"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso36670975e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 05:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743510010; x=1744114810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u40FSTwz9ltEwkPBj8DAGOUl61JmubNoHLrIbWFFZgk=;
        b=WMU708Euich1hVr/7hx9u1Y7ICDoar0kZv0vgPZsKMr6WmYbXceu+4lK1aiwVsm++S
         ZsPnVcv+FGASTfD06NoEci3eM/l3ypsy1xmYGI/jDg40TEmwHU+vYwuTuk6stJWFN+Jl
         Vx+tLqzNjAS9mg5I1MN4rDcEfY28fNjYjao/uBdjyeB96iOccGipI02nxaIlCvbzZ2s7
         JQSxOhdGIJgfQwG+Dsn2kUNqIsiHSANFvPYcZWBQYBMN6P7N4lFuBW+XAPVx17Klh2P0
         nnvrVOhE3nRW2hqdxccxkYCnfsQEM4ropBWwmv8xoIus7bB/luTqRkx/Tx46esPAWfHA
         XvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743510010; x=1744114810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u40FSTwz9ltEwkPBj8DAGOUl61JmubNoHLrIbWFFZgk=;
        b=GfsuMgqyO5QotSDmwir5rQjgzmbzdFr1myM0vsArnI2PNWlzJ+edldydaKYRxk9A9u
         hesDoT7vlv0hBpMEM2CQ3yuWab7WYLnjTgbtwXgQQfB3X9xLLH5Kw/rwTzyA9End3rSL
         uyBqFQzOY8J+J42kRIY++S3RBXoQXHT4dZLabc+7pBuQpKoKubxDgJ/ZlPpED14ituIc
         zcKLKpaWEoe/TN59j5OqFj0X2jSUQqVS6Uk3R38mPatBjYiLA6irtYLeyeIaB+FBSmZL
         DErMEXBY5gsqc5Pk/CdMcglFWAsimVeZKP+yMTeWMB6YRtp+EmmRXchnkYuz1XoX7xwD
         oO2g==
X-Forwarded-Encrypted: i=1; AJvYcCXgghTAzSIBm2JkdaYSwNf/2cImVfVzAD9SaTok8LtKRHpPD/YG1jWRPo6aMtjXIUZpCeDDLTdplrsHXrI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxLEGwlXKymX49n3iu80Wc/JhLSREwZsxnUFizkSrXsuF8bjld
	b0dkLEBKqUEPVUI2dnJRlAvreifi0Tc3b+83SAw3r9s0YZtJPgRUTAe73Mevhck=
X-Gm-Gg: ASbGnctEhS7mXbIc3j5kRJ/WwjpxrUzQyG8VTBAxRitH+9EpztM1YnrrYKSm2mw9iGC
	ImByjXdXuANeVd0lzaRQfdCXR8pMQMAWR3VymD7AHg16T8X/Xx8kFKbZzTdCPJGlL2J/IUuf0wi
	zjE1r7qYovVDHS2b9WLP/h6Y1wUEUBnJDAknR3YfGQqmmhYE/l5jMtVNJjyXrz3bUxAsFY4gTPK
	mNEG3RTaLnHTdhhUuAqTgRNNMeF4P+yeKTZJ3KX87OFg25m3PETMwsEfn/252LCOjEAB7wFy3Zk
	wqa5cmX81aM5GYkf9OJbAnQRoLi5wbDGGMQ1Gs98gZMh+sFCe20rDE8ZXL+thtHerU318c4Pr+T
	TAm35S/m2OA==
X-Google-Smtp-Source: AGHT+IEAyjNnqhQdjxN+s3yUvwDysJt9fO4zS10+QJm5P6u0nZ2k22vHjJEOSoho7ee0nVvgqa8ssw==
X-Received: by 2002:a05:6000:250f:b0:39c:1f04:a367 with SMTP id ffacd0b85a97d-39c1f04a399mr4181408f8f.4.1743510010130;
        Tue, 01 Apr 2025 05:20:10 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6589efsm14281053f8f.16.2025.04.01.05.20.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 05:20:09 -0700 (PDT)
Message-ID: <be89aad7-130b-4542-84e0-ffa252dff6cf@linaro.org>
Date: Tue, 1 Apr 2025 13:20:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: MAINTAINERS: Switch from venus Reviewer to
 Maintainer
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Trilok Soni <quic_tsoni@quicinc.com>,
 stanimir.k.varbanov@gmail.com, quic_dikshita@quicinc.com,
 mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
 <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-1-0ec1007fde3c@linaro.org>
 <93ca218a-71a2-4751-860c-025ec29b9180@quicinc.com>
 <f1d4d88f-1ca0-4be8-84cd-3ef0d224feb4@xs4all.nl>
 <2539ae48-d75f-bb52-3873-de0b6d9a8180@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <2539ae48-d75f-bb52-3873-de0b6d9a8180@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2025 06:28, Vikash Garodia wrote:
> Hi Hans,
> 
> On 3/31/2025 12:56 PM, Hans Verkuil wrote:
>> On 29/03/2025 02:38, Trilok Soni wrote:
>>> On 3/28/2025 6:26 PM, Bryan O'Donoghue wrote:
>>>> I'd like to volunteer my help in keeping venus maintained upstream.
>>>>
>>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> ---
>>>>   MAINTAINERS | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 29b4471574982bf3f8d03158cd5edcb94bc9fab9..5ccddd2030efd96324e53fcee8048120990a85d5 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -19592,7 +19592,7 @@ F:	drivers/usb/typec/tcpm/qcom/
>>>>   QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
>>>>   M:	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
>>>
>>> Is Stanimir still an active maintainer here?
>>
>> He's no longer maintaining venus.
>>
>> Bryan, can you post a v2 removing Stan as maintainer? Stan, can you Ack
>> that v2?
> I would propose to have Dikshita in the list instead. That way we can have same
> folks managing patches for both iris and venus, given that Stan is no more
> sending PRs.
Yes, I think Dikshita makes sense here.

I'll V3 this to this effect.

---
bod
