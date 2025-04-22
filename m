Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966C0242D60
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 22:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745361177; cv=none; b=rTjKB+pubqpIn7PmMHqdUeEPtja2iXwDoR0YnXcHOfqwUablgOTbtNVf7f4mD3LOO00GxqY9UHQ0qbIbrhjh8w6crafpSjl28HDIoWOvEdN6kJ8xTLVRjUvxnlPqGZope5M3NvU8B3IV5uEZoNMqWoRlPI00EKSBfQfyfOYQtqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745361177; c=relaxed/simple;
	bh=aCS2cK9NMLOgdPJc2YMJuBdkvSB+hznw6VZLrT4/yrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=APU+EvMBT9mZunfqR0qL/xFtQ9zi0jrNYu2nZyP8LlONHPfm9cnLKW5mq2z7P90fNAD5keGvFRrCTvVBEV3doq06XsDZjQXeRjG+qlhGZNNc8z1PuYosTsTcu0H+CSy1MxPe3Pr5f2u857K8gt89V67u94gMgh9Lmb9EAn+N7aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=M0Ty1pmh; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="M0Ty1pmh"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-400fa6eafa9so3757910b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745361174; x=1745965974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0enfuZN8PYOZ9kUVWVSTuEglj88WTzbGk4XLCM/1V/4=;
        b=M0Ty1pmhGgdurJfIRT4zGoaHK6YWNX4hfZH2DMElQwDpQt3NXuf5sTFHuFtktObCI7
         hlKqk1YIbIL7Hl0k7tBiUeKdEK3VwRAxeQ4Q9xO1xJz5SCJ/ClZflqsdmJOZTB0L93rF
         vegoXvsWvgMA/APQzB72HEKlGpsE0KIobRbibwI+monu0ZDNesieNw4rA4Z9w3JOehuL
         xHRhS4maY4yCOomIm6q4QhfwHlKlOB+PyT+5WnTU7VX5etTtCtvtZSbYxL2CLiT9Hfrs
         SI8pRHuhdlef+Lp+VbHUpLF7EcC/Utzp3NntfZiEG0hk8dvqkvVs5ob10w/IXQKldwq9
         LI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745361174; x=1745965974;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0enfuZN8PYOZ9kUVWVSTuEglj88WTzbGk4XLCM/1V/4=;
        b=qrGs0uRChGcPQhaitfkXQKimahP5hWCU951j0SOO7ooueXk0P702GIihr9M4ecwI+1
         twbf+2EDTuV8QJKohElbjpFP5CPGQ9q6KZyo14Pelb3MlxwTa4FZmsdBOomod1aaNSEo
         3x0QFkvRroY8VSJ/hGYJEIGMH97QzeGPyvlSbWHkK8FWMMtO9szk5zkS+yBvwWOgJ/nO
         sRS0Qdw3IQwmZmeB0fhwIy8Pe1eGeyiQF+I0Y80fF/12gh1Jz+yAOpCtoHY8lJJ/SZLT
         WQ9VCXHTuXy2jIQAPwFdNL5qgNza82Bnqo+UWxqIRsZQCtBYG+Y5La7nqvT5GxJLeN9+
         /y9w==
X-Forwarded-Encrypted: i=1; AJvYcCUsa7PwMZzV/SUI44c2JPF1l4matKgvJtkW7/HLbdlgdh0TgtZIQYx7L5aY5uye53byBLKpdbiuybRmYDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQqj89aF67BfwpIydbMCfjeJxY94TtT7t6VYk5CPfAcjSaLfpc
	One9QP17w2m3uXI3NcyI4Od+Ud1qcrUrHddHeWhnQANccdLAbfzllxOr6PHJyfk9gfFgFLqWcFW
	ooko=
X-Gm-Gg: ASbGncuzV2hfmiNNvyF6sfqG66lUEz94TVWx+vf5/xCFELsY7fkyCNXjuRnf6NnScJI
	nDFFxCAra7GjYUUdYyMOlnq3t+CQu/dzg4kxeXAW+cUgXGrnp9tl7pgT/qQcrLdcrlFtPI0aNRc
	GE0G6GVXrOlUhC0B0zKSF7fKeVh7Q6WnfgLP6cJNa4bDZrxCwoAoQWKoa4jeIYxKwxTOaYUOMDl
	hdGqtdVfqOqmuq0X3x251oj9y6dwFGSvWKbGUALV0E858KshyXO80Lop0WZveEj8P5qqMoVIvlv
	nACJtswkQU9IfQE0Bj4bCAOwS2mr/+gyzIlO1rGIKgjlgPr9gGaDR0N9OmHbpcz/HU7nBgcknzK
	5E58RTncFs2/spdpqSQ==
X-Google-Smtp-Source: AGHT+IHvVrklhnSlyJTxpErpE/n72OpKh62nNWyp8cMVFUzxtrhvNrhnh0eu4ElUTBXm+gMfXgTvuw==
X-Received: by 2002:a05:6808:4c07:b0:3f7:ff67:1d9a with SMTP id 5614622812f47-401c0c8bd38mr7958485b6e.36.1745361174563;
        Tue, 22 Apr 2025 15:32:54 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3? ([2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401beeaf3f4sm2331375b6e.6.2025.04.22.15.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 15:32:53 -0700 (PDT)
Message-ID: <22e934cd-117f-40fb-a788-edcfc0f8b0ba@baylibre.com>
Date: Tue, 22 Apr 2025 17:32:51 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: pressure: bmp280: drop sensor_data array
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250422-iio-pressure-bmp280-rework-push-to-buffers-v1-1-ee722f29aeca@baylibre.com>
 <CAHp75Ve_C6BXo75xy4+xZ5b1O9-TT5TGGQDgTR_F1s3TFK3p6Q@mail.gmail.com>
 <12dac98d-3e6b-4c2b-8ac0-d526bdb5efd4@baylibre.com>
 <CAHp75VcHMTSGRrodixsLDS-xCi8KQJ0MtMSMi7tfATUgd3E5uA@mail.gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <CAHp75VcHMTSGRrodixsLDS-xCi8KQJ0MtMSMi7tfATUgd3E5uA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/22/25 5:19 PM, Andy Shevchenko wrote:
> On Wed, Apr 23, 2025 at 12:22 AM David Lechner <dlechner@baylibre.com> wrote:
>>
>> On 4/22/25 3:57 PM, Andy Shevchenko wrote:
>>> On Tue, Apr 22, 2025 at 10:28 PM David Lechner <dlechner@baylibre.com> wrote:
>>>>
>>>> Drop the sensor_data array from struct bmp280_data and replace it using
>>>> local structs in each interrupt handler.
>>>>
>>>> The sensor_data array in struct bmp280_data is not used to share data
>>>> between functions and isn't used for DMA, so there isn't really a need
>>>> to have it in the struct. Instead, we can use the struct pattern for
>>>> scan data in each interrupt handler. This has the advantage of allowing
>>>> us to see the actual layout of each scan buffer for each different type
>>>> of supported sensor. It also avoid juggling values between local
>>>
>>> of the supported
>>
>> I think what I wrote is correct grammar. Same as if I would have written
>> "each type of sensor". I would not write "each type of the sensor".
> 
> Ah, I meant the plural: of the supported sensors. Otherwise are you
> talking only about one sensor?
> 
"each type of the sensors" doesn't sound right to me either.

I am talking about more than one type, not more than one sensor. Sensor just
describes what types I am talking about.

So perhaps we could just avoid it with "each different sensor type".
