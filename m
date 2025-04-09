Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E85E25DD03
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213800; cv=none; b=P8nqhTywFDWCuGDA8slq2Ocuq/LtqWIbQmde8laTQvHR4RO9SZEN+fAWVHe9uhA3UCWo5YD1IAcpxsXv4rskB66PPqvBo4y4vnFEkd3iupISk46Hvz6KjvBqupYUepfFK439ApG6BT4BQxUVt5BZyPB/rBrqXNm2+hSMxL1+wLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213800; c=relaxed/simple;
	bh=WXRiZYkhHVHFmRRwzWFhADs30dpyMTMTkJuTmtflUOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2H9P+jjRZECXOVOdCCU/un8U3L21upe2g28h58mMBWSHQDhsmxhNvgEhLtCjlat5oR4OcYYWl+q/3rxHnLmjfTqIkbEK985Z8YJ7258VfuOI4IeEEUkHR92zPTZY9YC1PBUHjTxqfCItR8jBqMVGMTszUls4SrQ1/WG6EdJgrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fXHUUVQR; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fXHUUVQR"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39ab85402c9so769434f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 08:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744213795; x=1744818595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=32r104ragES+JBKWZpr/5fwyEiz2V+wgrRvKzXjgako=;
        b=fXHUUVQRsl+J/ijg7XVvIh8Zqd/rEIAu8lzYO7889d/H/xZ1bTOKdAMvjzTJOodjke
         9EFBYjqghtHlN8xxpxwASi731XBVl2j5qC/08AFCcoyJoJkL1TcV+4Pzy3qNXMV1Koke
         haalEY538gTulC0GzTwp2+oviqWujqCtKtPb5zVW+ez65WY2hzAMietRFBFpYPdICi//
         PY8GXrn1tnyElUCLmKyx+6ppLy3xehNuaQtDKbpTsIjW9swEJvygipk00AMpmYPgGx8n
         ZSCJugh6Yue1WATwMxr58/w+DRLMgNH5Cd6RZZ3azQNlPgK+/aK8PXYxm1UIXCRcNta/
         lJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213795; x=1744818595;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=32r104ragES+JBKWZpr/5fwyEiz2V+wgrRvKzXjgako=;
        b=RdxMZ4C8sbL3Wo2fksrg7EgjXx3qa5Muyo7ugFGxq2bzoIu88NnQkRwWlV9HxFSOWX
         1+I39hi0QzNRmPkp2m9acvQ+OkxCidE6TPp6MRtI1QqB/Py4rpw/zvbbyC1c6CstYzTN
         yJRHPAI/8hQtTHcSD7wXZA/9xRDA0zpzEcE8uZlT8GqtNhU/P3CCr0fPA5WhybvUn0aN
         +FY0NnBEkn3IypS8C0Oq/qyi5nMajUlhXnBhQegGLg8zOXYSxOM10aBCF23/HAbUKfGb
         axQjDHNhr1DrXPyXMKYMsON7crs4TL94sFE7lQs463xqblfiE6YwLtf3PefHRDjH9oNw
         2rAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhWoLFkBG4uliyhv0620RTxgDaMvqTbFTzO9XYq9hXT9N0VtynLiXlgxe+omIzdfe/xd7go5lRBte79bI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx05BF/UkcULqK4lQ/B0HPOkD4pZlHI4SDbDfJTDHboMq4Zl1SD
	gQEIPDvxqPW0dD9Z5wEmuKbSY5hUBCHRJWZ8pfgBgHmxO4U38SNgKa6jwRsGLDI=
X-Gm-Gg: ASbGncuzkbugwey1cbe2xZW0Yu4/R/ZsSI1I+zJlkrhvTosMZqU/CuMC1Y3incaaCo5
	IMmplW1U/o6z2YtjHy0lhk4sIs26aWFL0huThRlh/Opmo4xkDD3bBNH4g9j9G4UYOI2TzDkA5Ye
	2w3S+5cuvg3JxVgJqkDg9tmfSGBKS9pnDI4ImYtTSk+krms6YdDG9pNv0MN3QAGkPrwRDN9pJEL
	Zy3CCNlWidwepHtgPywpzgPdCLl72mEqPcd7CAWnfAO+pVwOy3BimqgzZB8uvgCXBRg4K+K0/Sp
	BCcGZhXfrwYrYZWWnBzCRPZdaO1guPyi2X642c3KrgFG5tAkvImpaZWLU3U=
X-Google-Smtp-Source: AGHT+IHFa+fVHyswKOhtWqv4wKhHcTO4gf1B7gffW/HC7i18H9UIMgFVHBSmLtlQ+wSwbCCT8gAfVA==
X-Received: by 2002:a5d:5986:0:b0:391:29ab:c9df with SMTP id ffacd0b85a97d-39d87ab55ffmr1238324f8f.4.1744213795374;
        Wed, 09 Apr 2025 08:49:55 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8938d527sm2009165f8f.59.2025.04.09.08.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 08:49:54 -0700 (PDT)
Message-ID: <8406618a-20a9-4f9c-9ad9-09943524a7c7@linaro.org>
Date: Wed, 9 Apr 2025 17:49:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] [v2] Input: stmpe-ts - use module alias instead of
 device table
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Yu Jiaoliang <yujiaoliang@vivo.com>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
 <20250409122314.2848028-3-arnd@kernel.org>
 <Z_aTOUUmyXpWnt57@smile.fi.intel.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Z_aTOUUmyXpWnt57@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/04/2025 17:33, Andy Shevchenko wrote:
> On Wed, Apr 09, 2025 at 02:22:55PM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> When compile tested with W=1 on x86_64 with driver as built-in:
>>
>>   stmpe-ts.c:371:34: error: unused variable 'stmpe_ts_ids' [-Werror,-Wunused-const-variable]
>>
>> Ideally this would be referenced from the platform_driver, but since
>> the compatible string is already matched by the mfd driver for its
>> parent device, that would break probing.
>>
>> In this case, the of_device_id table just serves as a module alias
>> for loading the driver, while the device itself is probed using
>> the platform device name.
>>
>> Remove the table and instead use a module alias that reflects how
>> the driver is actually probed.
> 
> ...
> 
>> +MODULE_ALIAS("platform:stmpe-ts");
> 
> Isn't the preferable way to have platform device ID table instead?
> Krzysztof?

There is no ID table currently and I (usually) object for having both:
ID tables and aliases. In this case it is just simpler to have alias
than entire table and MODULE_DEVICE_TABLE(). Also it is unlikely it will
grow into many aliases. If it tries, then I will object.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
