Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1889E27380B;
	Mon, 16 Jun 2025 13:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750078843; cv=none; b=Qb8yWTfUi5CDKaWw0ttlsA6UtkT7Ar/YMr8p/DQ8ilfJqNz/qdtVBmtIKpW5ll3NIEmstb28PgFGMIwAx7TpE5ecrSl9Bd5OD3XqfL129ordw6sxNoV2g9PA7ATICwYBLLzkvpIEquy2f4fL6k4EjXSqWUlN6ZQ24f96zX6OTfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750078843; c=relaxed/simple;
	bh=AbFbpewLJ6OKNgF1h6DDvcr2+11XVpsz/pVZTtRpxjQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Dt9I/bs3r8+jshgTzdLhGtvyz/pLKW2n2hIAuukm+y5yyaD/3lRlcLkifNrRPMaLMp7Shmq24xyFTdS7mUz3fg0eLy85jp8pf1ioWeHF5FOlFM/GacRPC2PzteL08upMjnO+A+LUGla0+3QAJWOAMwvN/sPYs3srAXOPuvjEQfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cpHZ9FAf; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cpHZ9FAf"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-408fa4be483so2667519b6e.0;
        Mon, 16 Jun 2025 06:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750078840; x=1750683640; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=12AnQWXgbV7Rc7RDNj8IPWL57rXyUy2QtTACQSRQdog=;
        b=cpHZ9FAfdAuaTEWRQj+LNb+aL0gTRW2zgxtzn8YUHZMV/+EJiHC4D1yleXHUqqeqwP
         x/6825dn5xFGUgeB2imvuuCNyQd5gmhWIJ+M7HnD8q8rhRPAlNP1ZKiM08XzrCEWQuW5
         tEbhIjk4Kk7nu7E++P4PLkmmB5Z+VfU0WZShSmrPg4mRfhgEGr0iM74W/J2lbLoQDMN4
         Bs05tnGgZOmYj/pDMXOsRJbLgl6a5TRdyR49kP10ShSHiR6k+D4lMFh3UOldk8s3fCEo
         Gs8wcFcEzbSKozeIN1HVcLaBKw6Nzzkh5nlsjpZiqiubMOiDrAwP2r5UsA1ovgLsxYk2
         KCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750078840; x=1750683640;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12AnQWXgbV7Rc7RDNj8IPWL57rXyUy2QtTACQSRQdog=;
        b=ZgBnhEh06/NNnZTS1BONHDpL3royE4mdnF7mQ85+nsB+WUOMMsL40A5RWEABMz1gdE
         JN2HxIU7i+1hV/xx+FZRBMVwQadYLfsijN/6mZVuYENn5RiO0IOYSOJiB75VGKj0dK+X
         03wpPqpaQ021T7bE04rzVkpQedm8r4P2ObLMjB9a27mQowNkNi4ugYLh01DaSgj3egWR
         t2VPBscwQCBnAJ2vPAUeH5JvC6pV/hXzV/9tBsnQkU1G5GcigTeVmg11ZY93ljIb65Zm
         Hs0AgHqyFqsQAyhOGtgYXWY2UunAYkBaYLOf9aIC5PLA8qr4WU4M2d0olOllKcXRodq7
         qHTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9FF6XS5mZTGoOIgTxZ/zWiEdbPJ4Q3TB2SeRghIvHvhqcbln/1mysneHDoomr2+/Qbp0UFKlfIPJy+sS+@vger.kernel.org, AJvYcCXiq5Wcj9c8Q4s0aWlkOXm/JNc/gABUZAp04zd/Ln6zymmy8UQwvbVOz1+5C8ksi8nkHxPaT1r2oG17AA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSc03wdi4rGT4OGIlF1UaaZo7WE3W5iouiaR1BjQj0nSo4NGAH
	RLqoIpXz03OQsD4D0E0jWAPc9fGZG7ZfhMq4DUMATthGCazJY61Wxh2DvJk5eg==
X-Gm-Gg: ASbGncuzbgUEAFiVeBgVhqRAuAODMd6AWhIHGIBbi/1BmtN6M3RQpR3mhi+kkKdfo85
	5SiThIbMemvj6X56Iwwe/cEsBjv1AV9m8nWTgJDYRqY+2nCRZs2+0KixGSv9OHHVO60VNK1jbKr
	FLnUY595tnsaGb2D/geiOp0YZh+tmfquYRgtp5Bb9AjC04sxk7EN8cBvsg37NLAxGKFGgXks3YC
	vTGamvNYZgO9TQ8XFbdzcVPHa0Wr32TFt4faM8IXkbBInUp9cUShXAmqDGx+93pAjAGQsyOLDFo
	8nJ2hmekMp+KVDGevhPjfKxUZRL2DuGX4C5hsnODQJO1SpfH0HzlfSkUWEz4IZOZcEoTfXhdI0x
	7AXvV+69OjvNixURmP0zXKJsBY7tL9HUf3ro=
X-Google-Smtp-Source: AGHT+IGnT2gEGzTVK/Rzqk/HJtn2HVuBGfgJdTiCwV7h7ilvANcaWfvD+9AWy3TyVLHHWD8J7V4LZA==
X-Received: by 2002:a05:6a21:4d81:b0:1f5:769a:a4bf with SMTP id adf61e73a8af0-21fbd588862mr15876834637.36.1750078826374;
        Mon, 16 Jun 2025 06:00:26 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1680eeasm6797958a12.46.2025.06.16.06.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 06:00:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <454245c8-ce59-4c87-9d92-4a924f83aa1f@roeck-us.net>
Date: Mon, 16 Jun 2025 06:00:24 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] hwmon: (isl28022) Fix current reading calculation
From: Guenter Roeck <linux@roeck-us.net>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
Cc: patrick@stwcx.xyz, =?UTF-8?Q?Carsten_Spie=C3=9F?=
 <mail@carsten-spiess.de>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250519084055.3787-1-yikai.tsai.wiwynn@gmail.com>
 <20250519084055.3787-2-yikai.tsai.wiwynn@gmail.com>
 <CAMuHMdVX0risng0cgUp7uOycv2wUNsZ3SgCX8sq=14j6NXjNBw@mail.gmail.com>
 <5f774072-9d85-41d1-acf0-cb95450a16fb@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <5f774072-9d85-41d1-acf0-cb95450a16fb@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/16/25 05:59, Guenter Roeck wrote:
> On 6/10/25 05:27, Geert Uytterhoeven wrote:
>> Hi Yikai,
>>
>> On Mon, 19 May 2025 at 10:48, Yikai Tsai <yikai.tsai.wiwynn@gmail.com> wrote:
>>> According to the ISL28022 datasheet, bit15 of the current register is
>>> representing -32768. Fix the calculation to properly handle this bit,
>>> ensuring correct measurements for negative values.
>>>
>>> Signed-off-by: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
>>
>>
>>> --- a/drivers/hwmon/isl28022.c
>>> +++ b/drivers/hwmon/isl28022.c
>>> @@ -154,6 +154,7 @@ static int isl28022_read_current(struct device *dev, u32 attr, long *val)
>>>          struct isl28022_data *data = dev_get_drvdata(dev);
>>>          unsigned int regval;
>>>          int err;
>>> +       u16 sign_bit;
>>>
>>>          switch (attr) {
>>>          case hwmon_curr_input:
>>> @@ -161,8 +162,9 @@ static int isl28022_read_current(struct device *dev, u32 attr, long *val)
>>>                                    ISL28022_REG_CURRENT, &regval);
>>>                  if (err < 0)
>>>                          return err;
>>> -               *val = ((long)regval * 1250L * (long)data->gain) /
>>> -                       (long)data->shunt;
>>> +               sign_bit = (regval >> 15) & 0x01;
>>> +               *val = (((long)(((u16)regval) & 0x7FFF) - (sign_bit * 32768)) *
>>> +                       1250L * (long)data->gain) / (long)data->shunt;
>>
>> Isn't this complex operation to convert the 16-bit register value to
>> a two-complement signed number equivalent to a simple cast?
>>
>>      (s16)regval
>>
>> isl28022_read_in() has similar code, but as the sign bit is not always
>> the MSB, it needs two additional shifts:
>>
>>      ((s16)(regval << shift)) >> shift
>>
> 
> Yes, I know. This could all be simplified using sign_extend32(), but I really
> wanted to be able to apply it. If someone sends me a register map, maybe I can

s/map/dump/

> write unit test code and use it to simplify the driver.
> 
> Guenter
> 

