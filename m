Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D58328A1D6
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750244913; cv=none; b=AateUc7QNL7S3EUAQQQmEF1Ml8RF47DyCBezSbRlmXCn4C+yJhUiBsmCp85pQ6/KU9PPNB3rwN6VddgNE7+eYKbLmWEckSD9k0bFjWLq/E9bUEQbxKoVBn9VX2JCxcz/zUqyOJMNRzmg1/oMNetIVOI27A/AQ/j375dN5+IcUSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750244913; c=relaxed/simple;
	bh=DWY2j4BwgDoCzsCVjrX9qM1FVccm21ydRjarE/7nZ9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bQIJkqu0lJMgK8SypGwrJ7gHSvQT8Te8HazBAr/U8kIO4zojN2fNVaKU0bRFoxIdPnQ2M/7hfnDFPO1tCz9GgCkwK4nv9lAzgNRMeFVL81HmffuQJrmL60NFesHMnJHLPt6zk+Y3h1IJ9emKC4rVVpHfa2XCwDEeq/ipNtx3kC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QV9TfPox; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QV9TfPox"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a365a6804eso5059253f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750244910; x=1750849710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZtIjx1H604kHpCCT/i9zvqA7AzOCUNGiWPkoqfHW1sE=;
        b=QV9TfPoxKU01x8k9NAfXKlCa1YyT+zTqXKb91djJ0sAki9eFV1LaPqVe3j+R51znh6
         pAhwNamN754RTI5q6/TbU4r3KqK+LZd+Uwa/K5XhLbpLOfKKottLuJ1oJ1TiQH7pF/i3
         mP9t+O6IMfqfTk/fMQkazCPdL/pSuK3YvnwyDlF79xd8itbGjP3VyKY2VvJtwwHvpgO8
         jpJgGI/Ehxh+hz3c8/4ikaqWSPL0bq46dWVfpgRoAqz4sdt9U1Afgix+Xyq+WjecbrfA
         oNNhTN6Jj1OvY1qhK14R1xRQKcpzehuvcs2picfNfsxO8OVcAfZ5jrCPQiscvBBiAL2F
         j4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750244910; x=1750849710;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtIjx1H604kHpCCT/i9zvqA7AzOCUNGiWPkoqfHW1sE=;
        b=N+X8F3euhWAT4x+xmKMiVeBYqFczICjBdQeytiaWHF2bXtJPwiSZ0spFYvVmDyyXN5
         BOM2ktTWeZ+5AuI9qzTzKkKnBvj9hV7nuiPIlkUl1kfSCpFpAMgwxVTEzSt3mQPqO52q
         Knnsw9cjaqgfaD/GzWiOErrh28iwgeU3uC6AevCOlNVfhY1D9EerAvWY+UDeEnJZQNXr
         oUlqEuTZjjk62oqhtJbzrsLizQq2v1MrrzD6XUgJsv7QztRUtXufwjal/jYMWSumbMvE
         5s6PbRKURsg0K2NbhL9FtVGmYoia/iJ34XUIu63gV5gXNTTdqC2xicYwWEa6KQkQPyp9
         waUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuK2irTKUunBYkmXiN5ZA978gcEsfG4saNIwummA0M1rkzztVcRZsVbs111MnyucGMVwwVNBskXOjvKs8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDKhl1EgNbCi/k6XjCtdifXv+P3c7/PXyU6HefAlcPWNEpyiLg
	E3yTC3MVqpUeY1SsIb2jh52krBCE75G/y+ybD4b0eLPOwsAhpGZE1bB5VHkapNObam4=
X-Gm-Gg: ASbGnctLObeYKI/8uBmO5BtJK3UH/E8sIBR+ZM/7Pw28c4ETZFTFReTxQ0Sla8QE1gH
	xwnVZSaV8AO19/9cpdWRZiQixN4awmt/f46A3MBAGhc6OBFfd/1Sik3IA1qRHClZXTeWWpV06GC
	zjZBt3R5nhzUK9vlm70t4Jk7Kcvrgsa9PK6IxUGf+uNHJHTtau3HBdFJ68DnBxv3/XnB83hcHGj
	1u6zeDgD3lVLEEtALbIv7s/fiuJ4dJZqsmRRDzb0Y9JqXchSynTKW6ybkEjbwXrh0V9QmHkUyVe
	KWEn88VxmlHaGB8McoeGoEWTkEQT/o+I9yZTJj5r/vQ+5itbQPusprYxgHksROl0JdCAxwwEd7y
	AkRdriYE550VvcuE10LqVgkT+MyQ=
X-Google-Smtp-Source: AGHT+IHn/G4EzkvrTYF2d+H9Hf5eubic1v9xu40MDUa7Z15ib1OJXlBvAfwdheD+/JgizfAMHPCa9Q==
X-Received: by 2002:a05:6000:144f:b0:3a3:7ba5:93a5 with SMTP id ffacd0b85a97d-3a57237c9a7mr15991668f8f.26.1750244910365;
        Wed, 18 Jun 2025 04:08:30 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7389bsm16713344f8f.37.2025.06.18.04.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 04:08:29 -0700 (PDT)
Message-ID: <ec3defcc-f19d-4224-9029-14c1e95399b7@linaro.org>
Date: Wed, 18 Jun 2025 12:08:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: hfi: explicitly release IRQ during teardown
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, quic_dikshita@quicinc.com,
 loic.poulain@oss.qualcomm.com, mchehab@kernel.org, hans.verkuil@cisco.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250612082943.2753676-1-jorge.ramirez@oss.qualcomm.com>
 <54157ce5-8a6b-75ae-0a21-a8df59242c40@quicinc.com> <aFAVTvsDc8xvwBme@trex>
 <1bdf289b-5eec-d5de-a08b-6c7a772e15a3@quicinc.com> <aFA5FpJPRmJ/ltI9@trex>
 <aFJlqGFPrO9Hw4f1@trex>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <aFJlqGFPrO9Hw4f1@trex>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/06/2025 08:07, Jorge Ramirez wrote:
> On 16/06/25 17:32:38, Jorge Ramirez wrote:
>> On 16/06/25 20:14:36, Vikash Garodia wrote:
>>> Hi Jorge,
>>>
>>> On 6/16/2025 6:29 PM, Jorge Ramirez wrote:
>>>> On 16/06/25 17:26:24, Vikash Garodia wrote:
>>>>>
>>>>> On 6/12/2025 1:59 PM, Jorge Ramirez-Ortiz wrote:
>>>>>> Ensure the IRQ is released before dismantling the ISR handler and
>>>>>> clearing related pointers.
>>>>>>
>>>>>> This prevents any possibility of the interrupt triggering after the
>>>>>> handler context has been invalidated.
>>>>>>
>>>>>> Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
>>>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>>>>> ---
>>>>>>   drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
>>>>>>   1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
>>>>>> index b5f2ea879950..d9d62d965bcf 100644
>>>>>> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
>>>>>> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
>>>>>> @@ -1678,6 +1678,7 @@ void venus_hfi_destroy(struct venus_core *core)
>>>>>>   	venus_interface_queues_release(hdev);
>>>>>>   	mutex_destroy(&hdev->lock);
>>>>>>   	kfree(hdev);
>>>>>> +	devm_free_irq(core->dev, core->irq, core);
>>>>> Could you please check and add the handling here [1] as well ?
>>>>>
>>>>> [1]
>>>>> https://elixir.bootlin.com/linux/v6.16-rc1/source/drivers/media/platform/qcom/venus/core.c#L427
>>>>
>>>> hi Vikash, sorry I dont get your point - what do you mean?
>>> IRQ need to be freed even for error cases during venus_probe().
>>>
>>
>> but  this is what the current patch does (venus_hfi_destroy is called at
>> the end of probe error handling as well).
>>
> 
> for background, this fixes a null derreference in the Venus driver -
> reproduceable in RB3Gen2 on a particular error condition during probe.
Shouldn't it be the case that devm removes the handler for us anyway ?

Why not ->         disable_irq_nosync(core->irq);

i.e. disable the IRQ until the normal/expected exit path removes it.

---
bod
