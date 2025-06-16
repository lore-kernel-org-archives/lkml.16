Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A91286D6F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750090102; cv=none; b=KRtKYneUC//xqvH6+s4AEzaIuzoMRzaZ9QlvCbEHFNEcGYCOp4Yva8JkhtZp0BP8EbTr4adNvwGdxDjTdBDQ1obuMOJJekbLlbnweDkp1zEovGj1g4wWkePYDkaIJ4TLq62J4Fq65oPATROTvvFF/xFfBwFvpHkL3WCsGVVmMW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750090102; c=relaxed/simple;
	bh=hRBgOq4APKw2y8RYVbZ1gYWD7szlzHz0G09X13KV7qQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a6pmZEKT/RViamnsuTJoZyaiCkF7HRguOi+av9F8c5bzD0/IktS2Z3rAuXBMq8+mXwLH/v8EIowABfObbNuXEkO8AcmXEE1zJOMeEyGpDobeA3EqDXGLxgoM93pkYdH+xE5j3fsZKfJx3xxAXj9kLfOvt5yen1pbIVJ8XG4+OM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZCS/55hN; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZCS/55hN"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4531e146a24so29306755e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750090098; x=1750694898; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a5x30H0yIc6HW7ib5oxYVmHAekW/AqIC/RAZDFhWWGM=;
        b=ZCS/55hNlkd4E3ABvHjuL2k/lcwa2B72q4u7hhnQDvpvn5rQb4ypwJepn6GjeruMDR
         ypH3+YuNB5EpOlmBM6XtfT1TiWWNIpWtkOxmAOKG6Ieg74vZE1gPgfKzp5GCnCzII1Kn
         nWKzriCvHrjkirJ9PAt4QfZAmqc23faMQ928lyZp0dBtZERIkijwrshUPkqATqWTyIra
         /bdHrmJs0bcmjqWUTK5h/C+dTgk2yVsjAGIwMu+gOI/hL7eQdB7d/va0CBj+8tdeF9sp
         kMzRyTJxiUNBKIX63zjt/74sWJxH0wGuA26ucbx5/uaWFo2DX2o0eY+kbHvwGJl+zeL5
         NnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750090098; x=1750694898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a5x30H0yIc6HW7ib5oxYVmHAekW/AqIC/RAZDFhWWGM=;
        b=cGQrNJ2RzZO2Kv1V+7vPIllcaBKHn8I8qrQL+gdZVn2sGOFG1wE/cSnRHsSxA+Z+cD
         5NGPf3xNpQ0s1aq6KKP8i5wMtsBcJzw/TGZUhzVO7//ifi0RGXtmdlqFnnLslJRpe44x
         pJt84x3fsvd75noNj0KoX3WlL+Cf2DVMVgLlLm8XAZ5XSb7AURbL3Q1YTgrU1EH7/lW8
         bbGvLgk5yO5YslhckFVZvpv5SfAgy+MVegzw8Rw3bEEtc3sxZhuORisMZ4SKcQiz+sQf
         Pkfe9atVcPaA2hFwLV/YHVC++HHEX6EVD3G92lYTS0SnibMlPXO9BxpvzoEw8bL+CYMw
         6sow==
X-Forwarded-Encrypted: i=1; AJvYcCWnF/0WpS0W671IzTtpm2QBETgXZ1ujrsDJPgGgEPUYG5udkIOl89ELaPZfiIVsZzaz1K8YEjd3kB5X5/k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGw+27mS/FoWDllahBETvmsMbkLtzpNhIJE5ZASxt6PpZa3B3v
	ss9egcMUxSqZ0AZRyYqIRirkjfIkW5/nxkJCMZH7eEmY/aKsmjV/sXzGZLuCRmixvI0=
X-Gm-Gg: ASbGncu9Mbw1gla3rEXSul2hisQSVlJBJuKUziMqb+6jC5SmGyw6rpVPRKLVBs9W71s
	Dhyls1x4PR/jmgmD3X6pbmkF7H79ipRsyuXKHkCtdy2j0Y5hDulV5XkK1jw8d5of0O0Z73GvOFW
	O2UJDIUqNvX5jeXsZaXqtXhCOq6lgoP6u9LeMVux81enRm7c5DtGw2oXgT92wv0htEDU5QqV8/Z
	ulnCv2Gnaqd6GAu1MSYjAOW5qwM5NNe7rf3ofNRjLjaeYLKAxZwAA0Wq3lVi72y7XYol1wK7NvE
	DaDkdCQCZMa1mPxKAKwx6j3l48Bmod7CTdacd9caO/ozdsSihMewxb/bwxsKsMPzLbRc7LMfW4G
	9p3itv4RmBEp2Ly9AxGPYxkCSCF8=
X-Google-Smtp-Source: AGHT+IFprAWkawH42OL4Sz9tt4KKrYG6bZs86pGWjUVLMBCA8Vbyzc5s6Wod8JkjjmaDSK8H+pKM+w==
X-Received: by 2002:a05:600c:500d:b0:450:cabd:160 with SMTP id 5b1f17b1804b1-4533ca46532mr100521395e9.3.1750090098474;
        Mon, 16 Jun 2025 09:08:18 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c50esm147563205e9.4.2025.06.16.09.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 09:08:18 -0700 (PDT)
Message-ID: <2df8eeec-406d-4911-9c1b-1aafcc8be8d5@linaro.org>
Date: Mon, 16 Jun 2025 17:08:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: qcom: camss: vfe: Fix registration sequencing
 bug
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Johan Hovold <johan@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Depeng Shao <quic_depengs@quicinc.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
References: <20250612-linux-next-25-05-30-daily-reviews-v1-0-88ba033a9a03@linaro.org>
 <20250612-linux-next-25-05-30-daily-reviews-v1-2-88ba033a9a03@linaro.org>
 <c90a5fd3-f52e-4103-a979-7f155733bb59@linaro.org>
 <21bc46d0-7e11-48d3-a09d-5e55e96ca122@linaro.org>
 <fe113f83-fbbd-4e3b-8b42-a4f50c7c7489@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <fe113f83-fbbd-4e3b-8b42-a4f50c7c7489@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/06/2025 16:00, Vladimir Zapolskiy wrote:
> Hi Bryan.
> 
> On 6/16/25 17:09, Bryan O'Donoghue wrote:
>> On 13/06/2025 10:13, Vladimir Zapolskiy wrote:
>>>
>>> Per se this concurrent execution shall not lead to the encountered bug,
>>
>> What does that mean ? Please re-read the commit log, the analysis is all
>> there.
> 
> The concurrent execution does not state a problem, moreover it's a feature
> of operating systems.

I don't quite understand what your objection is.

I'm informing the reader of the commit log that one function may execute 
in parallel to another function, this is not so with every function and 
is root-cause of the error.


>>> both an initialization of media entity pads by media_entity_pads_init()
>>> and a registration of a v4l2 devnode inside msm_video_register() are
>>> done under in a proper sequence, aren't they?
>>
>> No, I clearly haven't explained this clearly enough in the commit log.
>>
>> vfe0_rdi0 == /dev/video0 is complete. vfe0_rdi1 is not complete there is
>> no /dev/video1 in user-space.
> 
> Please let me ask for a few improvements to the commit message of the next
> version of the fix.
> 
> Te information like "vfe0_rdi0 == /dev/video0" etc. above vaguely assumes
> so much of the context
Sure but this is a _response_ email to you and you know what vfe0_rdi0 is.

The statement doesn't appear in the commit log.

---
bod
