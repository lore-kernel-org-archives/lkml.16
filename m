Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F21521C162
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744878908; cv=none; b=d9YriGlkRGs19wcxq6ZqsRYvp7SEbefG50HtjZan8kKOvNrZ08hiYlbPiox2jN+o9p4wIvJXOyzeOEhfZsfC03U7AZ5biavXOaBUUSYXOk8YFOfgPHTbg7Yv3sGfDMqk2awhcjq2XXmUPCpMwjtae5SodSRHcxV6cw7K9fc7qTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744878908; c=relaxed/simple;
	bh=v7Beki1wx0pFxToSPLRFkM034OQKjMUf3qDwIahY5NM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=clcDKybG5IOsm+ngDfvQd4gV0vGHz5/lMvcNUlZl6Y5erIz5MflzOvdUR7mefN9Vadqtn4Bx6/LSeVw4XVUPeeiVIcmE01WLJ6OzPpefRGBMArRcj8+8+koXQF4oSj6O8CC7PxUjXH97morE8P5evojZXNg2YHADhTG+rYaZ7Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H03mvwnR; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H03mvwnR"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso3354295e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 01:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744878904; x=1745483704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8bFwlWCS6Kk0bCLYBtfT5ejGrulPH1qXFNrU5XO5/8E=;
        b=H03mvwnRiYcbZYS1DZNrmt5AS6xuF+vkG/VOBFyTlmX0CzDZdfOZqlT4mdWIHGd+7H
         u8s4w0fEXI53qwD4GNx4ONdXdvU/KRbIsV9YdbfdbnX2SJM+i8xnfLvWdtT4IX8CPv8t
         5URndPnbDjPuip5eXJ/JiG3J0m4lCev9Twjjpfmrm1emLomRMlJ1Fa1vMN2S0ZTsXLn5
         G1tpCVHswCqY7NwyDzvVCiLztkjT0QmdZihrDtB5P5/3/+T05VxWxmAleWU1pmhMD8Po
         r//58OPVdZQgwkC/7X4akrwL0vUnjiGXlxRmNHRh2cn/Om98YJ+NZwRFBG3md7eFDaBk
         cExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744878904; x=1745483704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8bFwlWCS6Kk0bCLYBtfT5ejGrulPH1qXFNrU5XO5/8E=;
        b=HRnlssXynD+2G34USbgXpIGnzMvHJF6iyyQT8FC3TsspF2x1/Ibvp3DAroXGD78i7V
         NKVj8J6mOzvu/8LM5BlmTA1Wy6UvahnMoSJRX6ce7ltcHLYQG4/fg+uSMJXyAodtPSeH
         7gsJKP8jcIdSBtfPrEzib7sx9LuJ/Q29e+swsigu30hJ2Npc3wQ864/0diMMRGIHthLh
         h2P98WFL6cGiM9HdOuWJftzogYkP/6WaWWKgQIq32mIyXh0ZzTddvQ19wkB2MwuEtyK+
         DZe0B6rArfqTIuexIcfC0+o5PSWUDcU49XfhrZzy8DCD3/e0FiV7HJv3XvinCs6X7JP1
         A4pg==
X-Forwarded-Encrypted: i=1; AJvYcCWTfBYpH4VmLkkflRZR3VD2FBZGsUgwG5yts4tQOGci3xoee8pBO5wQLs+EGNOxQyAU7bqkznsC2PHtWNA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy32zGasQfCPWlxh6mzk3HmtIkxAELLFrj0rAS5e5wthaJ5nsz+
	709Yblv7ByVnxraRgA9vHKvs3CFR4yfUMNl5NQSraqGvZPcHd1gM/WkDIiDv2jA=
X-Gm-Gg: ASbGncvjDCCdZfz1qqic8EkUjvclS8rucJBxArEnvLzUtRsrBPISlE6mYvzbsCvjHTz
	9RVYqLHuJ96d19wZSyjAV0twDgNRhBXPxI3Lk/2MNvRdgU93XEYOTIUYVd4dvZcfP4dtlxqXorG
	wMtioioKoGEeE7q8xlzB8CZUMvcPeDozkZFEfj4HRpw0IjOxTDkNSZ+6Iy/EnYw/GtIK0oZbkLF
	DVNfTSVjReRz6U3u1mrzw0oOdZq6chkkTs2t+d/Gx4GUL+jST/J2MEXPYyhGHNpc4or9f8ZWWko
	uoUazFsA5J7TMdhi0dfm1tYVxK8afKn/8yvLY5P5VeAv680wlMrq+jmI7AEWLkjWMrhhCT67Qtd
	2m9G/IQ==
X-Google-Smtp-Source: AGHT+IEB3uiv9d12q/gsfhCkq1pih+E/njAdV0CZuqhp7+y+hbWHDbSN03BGf2xjAj3/8S3g6KwzKA==
X-Received: by 2002:a05:600c:5127:b0:43c:ed33:a500 with SMTP id 5b1f17b1804b1-4406351b084mr16091615e9.10.1744878904468;
        Thu, 17 Apr 2025 01:35:04 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39ee411dd02sm4256434f8f.55.2025.04.17.01.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 01:35:04 -0700 (PDT)
Message-ID: <b9e232c9-ae06-42f1-9fca-a8c5d7d64a86@linaro.org>
Date: Thu, 17 Apr 2025 09:35:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/20] media: iris: Skip destroying internal buffer if not
 dequeued
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
 <20250408-iris-dec-hevc-vp9-v1-1-acd258778bd6@quicinc.com>
 <811cd70e-dc27-4ce0-b7da-296fa5926f90@linaro.org>
 <137c68d5-36c5-4977-921b-e4b07b22113c@linaro.org>
 <96bd9ffa-94f6-0d1f-d050-5bec13b3328f@quicinc.com>
 <70a630cb-06ad-403c-b2e2-ae6d26e0877e@linaro.org>
 <30ebc1b7-5746-59a3-0155-7a7870544622@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <30ebc1b7-5746-59a3-0155-7a7870544622@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/04/2025 17:40, Dikshita Agarwal wrote:
> 
> On 4/16/2025 5:40 PM, Bryan O'Donoghue wrote:
>> On 15/04/2025 05:58, Dikshita Agarwal wrote:
>>> Although firmware makes sure that during session close, all buffers are
>>> returned to driver and driver will release them but still we shouldn't rely
>>> for this on firmware and should handle in driver.
>>> Will fix this in next patch set.
>> Shouldn't we reset iris in this case ?
>>
> Not required.

OK sure.

Could you at least add an error message on close() if any buffer is not 
released ?

That way we can "trust but verify". What makes me suspicious is that we 
have one instance where a buffer hasn't been released which we expected 
to have been released - that may be reasons for that which we can't 
interrogate from APSS - fine but, then how can we be sure the software 
contract on close() is respected ?

So yes, I accept what you say that its not required but for peace of 
mind we should at the very least be noisy on close() about unreleased 
buffers and if we start to see kernel logs about unreleased bufs we 
should revisit resetting firmware.

---
bod
