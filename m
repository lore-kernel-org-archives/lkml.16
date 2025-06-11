Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4F1261362
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749647093; cv=none; b=a7WdKBefSjps4k/X3fYFl+YinXuk7m9zg4wN7nwZKQRwMIqeOKCv3ri8B0otO7Ew9/b4BO76wRBMWhkRqgVhisGW7Ci9wOTXqjnMMKZ7pF/OtsZWzasoTOBVF+Qp83YpwCYGQXgXVN2NOHrFjS9iesGbcchv7zE6DDcBmKCl1C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749647093; c=relaxed/simple;
	bh=k5waaBh9LoM/S8QVD0ttHeEtj4oYMj1eBNvv46Hvl/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jyi0QrbCAWzM3XEvNNegVZY/+elUcA9AtRJljGvUBC+ex1T+KG6yiXqxWSd3Wu5fUCONyDTjAKaVKpvptivMWa0/1+rxJDW+wTjrCR+heLS7qRY32hm4g8HyNnNCffaUnwBkrKl5/CMaXqYaZxpOCy20fzQheCUrlFjXdQKqD+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KqnP/F5B; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KqnP/F5B"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so46530585e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749647090; x=1750251890; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3OhmJykF73g4g4DUewCzO19WAhssmAxRzm/neMwhoQQ=;
        b=KqnP/F5BOiVC16fwG/0QDiVrfzcQllV1rQYeQG/wZIpcqQcm9hLTFnec2IspgVX+la
         S3mC0mM2x7EfgoQt1QUW60ki0vGFQ0Yai45+mBrwwOhfyvGbz5bPaWcRlinQdYMrBK1n
         CH8ubval0aFPYj0F+doAuAkvGnDoTaeJ0VzXC0p1jIzKdOwDgAzLImlBBc84hUxzerAd
         bgGpCa/LmmxnMQUarUW6hgz/4Pdz7GV+rzT3g7vLiev00JRYDutVkCUh0bxsZO8CR0/E
         DWBpXHFSqC6BG2IOUhfIUBBUEXYUpk2yHKFsK+MBneOV1fBFuVUWfili1yLX8PRvXsoK
         zXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749647090; x=1750251890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3OhmJykF73g4g4DUewCzO19WAhssmAxRzm/neMwhoQQ=;
        b=uO+/LZSEQVldBZ7Rsw/4eNYUKMB7llPi1K5oCDiOveDyPqBEPUvq8CnOX3txGFtWS9
         KPyIZOCxtLjhgKJ5woZaFgE90+kj7yhhMXw/b7AghF5u9BbaWzIzgXcFfodhDxLzeV9f
         46DYlVECCLqRBoaQwtOGx80OtonQRei84x0lx8exwOBA+dzr780C5iFAtVFvZRyXleTR
         GUDqwyyz3YiffgOL/lrNz2/jbXfMpDx09Ds4jxQd9fXNJ1bPHUpzGCaGjqqtVNeKCALA
         ddEI4MK+Lh2Ey/IFuFyWy3l144jV4JO76omfk4lxh24UazkK62dbSD3XI1FCeCVPefbm
         gCKA==
X-Forwarded-Encrypted: i=1; AJvYcCUma4X/BYxmT2Hj1fODPsqFFrEx1JNj1Sps8TgwqTHwPH0Mq/c05XkbWf6W/sAD1djVkr4rdjklLmPkIwM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqel437DGFehsH257pdn01VNjd3HSSiv+EfszWDwVo9tV7ipop
	JuCNobfAr9EpOeY40zbCTgcgYBfEtq18pqCP8IgVvKv0UhAqv4ldyciwE+9/NM7NVck=
X-Gm-Gg: ASbGncsO/ORMKbL44GM988/NBsAxlVjEaJjqvjWvA+GvO58C77sh8eqC+U4JprgkRcp
	FeeB2ut34cHk0Z9cTYx98Af1YyQcQbICxLFmAJ5dqQ0bvLNJAbAMWCTcX8iaa/9KyRfoN0cNC89
	uF9lh9uJxpUuJytovoUnaEBRs/PLXQXMaSLE7XDKB90WyEVMJw43kH5E5BXKsHccWQrjsWPsEpk
	DSmx5vk7Rq5b11huONmbRyorOBJekI7LX8vAcdJaFAlm2rfIPFp7gXYvRJRtcm1mW+wJaqu787q
	PEVWI7z13Wqe5UIAjPU1kn6r/yzWHbCS1Mq+ExRuHcuktOpIHRGJ9Lsng/z8IgqNa/o4wfTUDYP
	GdqBrGICRWEteHPIX6tFBSXX37xNOMEAiF45Kv2vx5b4hgg==
X-Google-Smtp-Source: AGHT+IFzkW8lPMC7tzTRiI6f7ckQa2Ooh8n8VNSW4sNQvkqTlYj+uMr4gzo2JsXa5wbaxyrrmtUcfg==
X-Received: by 2002:a05:6000:24c8:b0:3a4:d83a:eb4c with SMTP id ffacd0b85a97d-3a558a43cb0mr2754736f8f.57.1749647089644;
        Wed, 11 Jun 2025 06:04:49 -0700 (PDT)
Received: from [192.168.1.105] (92-184-112-57.mobile.fr.orangecustomers.net. [92.184.112.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm15211113f8f.74.2025.06.11.06.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 06:04:49 -0700 (PDT)
Message-ID: <51e609a8-cea5-43be-9e4c-6790f7d40138@linaro.org>
Date: Wed, 11 Jun 2025 16:04:47 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: mediatek: Fix a flag reuse error in
 mtk_cqdma_tx_status()
To: Qiu-ji Chen <chenqiuji666@gmail.com>
Cc: sean.wang@mediatek.com, vkoul@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com,
 stable@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20250606071709.4738-1-chenqiuji666@gmail.com>
 <ff77f70e-344d-4b8a-a27f-c8287d49339c@linaro.org>
 <CANgpojXWk1zvu32bMuGgkVGVNvPw+0NWmSUC62Sbc3WcUXAd3A@mail.gmail.com>
 <ca3ce8df-aa4f-4422-8455-29db2440d8d5@linaro.org>
 <CANgpojV51R5sKvowPiMk5MRAzJ3KZoti6mRXjD3Knfz6kk6+MA@mail.gmail.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <CANgpojV51R5sKvowPiMk5MRAzJ3KZoti6mRXjD3Knfz6kk6+MA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/6/25 20:48, Qiu-ji Chen wrote:
> Hello Eugen,
> 
> Thank you for discussing this with me!
> 
> In this specific code scenario, the lock acquisition order is strictly
> fixed (e.g., pc->lock is always acquired before vc->lock). This
> sequence is linear and won't interleave with other code paths in a
> conflicting nested pattern (e.g., the pc → vc sequence never coexists
> with a potential vc → pc sequence). Therefore, a standard spin_lock()
> is sufficient to safely prevent deadlocks, and explicitly declaring a
> nesting level via spin_lock_nested() is unnecessary.
> 
> Additionally, using spin_lock_nested() would require specifying an
> extra nesting subclass parameter. This adds unnecessary complexity to
> the code and could adversely affect maintainability for other
> developers working on it in the future.

Okay, this makes sense. Thanks for explaining

> 
> Best regards,
> Qiu-ji Chen
> 
>> On 6/6/25 12:14, Qiu-ji Chen wrote:
>>>> On 6/6/25 10:17, Qiu-ji Chen wrote:
>>>>> Fixed a flag reuse bug in the mtk_cqdma_tx_status() function.
>>>> If the first spin_lock_irqsave already saved the irq flags and disabled
>>>> them, would it be meaningful to actually use a simple spin_lock for the
>>>> second lock ? Or rather spin_lock_nested since there is a second nested
>>>> lock taken ?
>>>>
>>>> Eugen
>>>>
>>>
>>> Hello Eugen,
>>>
>>> Thanks for helpful suggestion. The modification has been submitted in
>>> patch v2 as discussed.
>>>
>>> Best regards,
>>> Qiu-ji Chen
>>
>> You are welcome, but in fact I suggested two alternatives. Any reason
>> you picked this one instead of the other ?

