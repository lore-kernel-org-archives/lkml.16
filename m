Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114ED10E3
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 06:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748500283; cv=none; b=Moj2xZPQgqi9WZEIqzbjmPEcSKfoOVq8HywyXsufTfbLoAiokmn1n+hBUC/eqaM7bnwtcOeGqKpgv0ZIz/fy7S4fjyvn5QqkKZg1si3esVhAstAkOdQJJdB64Tptakvcl/gFdR+Q7gACmxJbG/+kjdVEiUoBNLIA42Jlf5fIab0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748500283; c=relaxed/simple;
	bh=j8BqjmjHZNv71a5DNyE9aKkxJqPzWFLn/6qs1DPKhuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VtS9m9STXO68WGhXB+eZYxEe4gXUxo0M5r4nHR44qBvMTBwsLIrvCr4KMjOVXR7GVk+1VvGaIo+F+OMoYgoL2Q73OshEf1PjT+ic7NJ4vTfnyqhGvLOZpJ3fHWxDSLZ/CvHLssE7ElY3CKi77Ymo3odvhxBhUQHRITACaO8gVh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yQeTN6q7; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yQeTN6q7"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6045a484818so117540a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748500279; x=1749105079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rt6mhCx+Xta4pmHm0wtc8Qz2ggrm33jLnwirmmfkTiM=;
        b=yQeTN6q7zQAG1AVIIuU3mZTZ3x3/RBONr/Xz0AbM+dmGuZKpJo+z6O+hSF23vXwZn+
         aEnKLGZNtKNyWpkVWakJ/ImUV9M8CRBMIWcKA75oq5iV40p5haf4m9EtyqM2DdbgK6E8
         DAwC6x3yQ62SytDc1TVarnKLuFitwPlLKz7RjdlxIvgssTfon89Sdp6lxkdZxag7BlAd
         I17uoQJ58YMtxhAgKEm8b5R45pV5nCD/zoq5QIL+Fis3dUi1c5WmCdhWNaA5DkuDTGvp
         yZ/giVOyofizM3q8m4bNk1G+zYTDwo9jUQTSw+hdQTJVoOXwuxf3xU3C7i6xfGTvEbXR
         qwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748500279; x=1749105079;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rt6mhCx+Xta4pmHm0wtc8Qz2ggrm33jLnwirmmfkTiM=;
        b=fGl99ljpgfgDZa3rmAk2MwVwcLhsluoVE4e61ZTzbU0qAgi1CJOhZAeO0Iy8DoB9N2
         rldPw77LYZhA5eHfn4NUN2EPszjjcvPh7YyH2XostewOkb/Af6W3OhRb7Er3nT5irXNw
         6WzW0HIG2gf+HvqsOo6IF3zIg9XUWC0em8nIyoRR8PaaM6NHHKnMCrKtTKqQJBO5eEou
         8C7/s0YlxUgG48qYtWgHNvgjNmIWsHITH6OOm11wjUUjKuuzVL/yyVTT9EdeVI8OLphV
         RgAbh6RpFDqDBN2POavkqGa3oo0oiogvz0ZTwKtFFcG5gl5hKG0TN7wWHm30HMdNIdYR
         0OIg==
X-Forwarded-Encrypted: i=1; AJvYcCXDPbm1Rjw48oNbD5XQvKKjlfERSHeIyu1MP5NiQ6wCvjf+kIxNDpVWthbQHooL1RUI6E1EeFWRQZ5s2Ss=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOXeEJniZM9LHcuptkbeZhUatKdbwqY55dB+YY1ah6Ys3z97Zh
	V7wKsFa3mDI0Qqol3MJzFGZ1ini/OCGAZhXZ9i2fkjeQ7S43mh50zSYdU1voFSdY3Vw=
X-Gm-Gg: ASbGncuVm7ZIKkZJ1OefPkl76CwayhcsC/NP1pQc4iFfHQTKF/tkyS2HBLRsKwrpMis
	puHOmszHd8RGVFFT6S6hjfmh4s6UFPdPiAx0o8zpHhC3AntdXnvcs3UXUXGaF3o8SakP4KGb/rP
	hSJKamSYkh9zREgf9OvGplP2prJHPavgmRFdrTFXupjjyTIYhyYV6Vab2nA+jmvcKiMSr3ZKxBM
	upjhvUWSiuGQ7RLMff5QGtu2MIQ50bLExwjAlFmZU8UcSiY9ZY2eib7OFDm9Mq0UrCCDt9qLIjq
	SfnvPPmtnIC4uNv9RIZCvFfCmjW7rGnIbF7SG4X+9JgBRZ5nzsDDIagbYt5MsXxa/K7B29g=
X-Google-Smtp-Source: AGHT+IHBoTLt2zj07UfvDpduyo6VwGS6VJkEDnEAwKaxoqBhRhFaLtslOtTaIwBlX2xZrWOmGrIukw==
X-Received: by 2002:a05:6402:51d2:b0:602:a0:1f27 with SMTP id 4fb4d7f45d1cf-60518ce9f36mr1664563a12.1.1748500279313;
        Wed, 28 May 2025 23:31:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fee1esm83489266b.25.2025.05.28.23.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 23:31:18 -0700 (PDT)
Message-ID: <8b2f664d-8e89-460f-a8df-d3fab13fe889@linaro.org>
Date: Thu, 29 May 2025 08:31:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: flash: leds-qcom-flash: Fix registry access after
 re-bind
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250528194425.567172-2-krzysztof.kozlowski@linaro.org>
 <42be0934-2e97-4d02-98df-b5a03195e8ae@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <42be0934-2e97-4d02-98df-b5a03195e8ae@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/05/2025 05:11, Fenglin Wu wrote:
>> -static struct reg_field mvflash_4ch_regs[REG_MAX_COUNT] = {
>> +static const struct reg_field mvflash_4ch_regs[REG_MAX_COUNT] = {
>>   	REG_FIELD(0x06, 0, 7),			/* status1	*/
>>   	REG_FIELD(0x07, 0, 6),			/* status2	*/
>>   	REG_FIELD(0x09, 0, 7),			/* status3	*/
>> @@ -854,11 +854,17 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
>>   	if (val == FLASH_SUBTYPE_3CH_PM8150_VAL || val == FLASH_SUBTYPE_3CH_PMI8998_VAL) {
>>   		flash_data->hw_type = QCOM_MVFLASH_3CH;
>>   		flash_data->max_channels = 3;
>> -		regs = mvflash_3ch_regs;
>> +		regs = devm_kmemdup(dev, mvflash_3ch_regs, sizeof(mvflash_3ch_regs),
>> +				    GFP_KERNEL);
>> +		if (!regs)
>> +			return -ENOMEM;
>>   	} else if (val == FLASH_SUBTYPE_4CH_VAL) {
>>   		flash_data->hw_type = QCOM_MVFLASH_4CH;
>>   		flash_data->max_channels = 4;
>> -		regs = mvflash_4ch_regs;
>> +		regs = devm_kmemdup(dev, mvflash_4ch_regs, sizeof(mvflash_3ch_regs),
> 
> Minor: sizeof(mvflash_4ch_regs)

Copy paste, thanks.

> 



Best regards,
Krzysztof
