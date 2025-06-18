Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74594274FC2;
	Wed, 18 Jun 2025 12:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251214; cv=none; b=lUlqKvxIG0LAzLQKemIGR1cB+Qw253rPB4R7gxML5mqygyQepIN8JUxKM4mGijvhneq6pxKU6IWmOvztYcQ7t6WYwW3EQlKdLr79LZDTrSswV/Ex5A+akcze+Hkp5JvahcvYV62O+hIkweI1L4LCKV7Fpd+zx6j3WDb+jQ6rrN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251214; c=relaxed/simple;
	bh=sacsAAKCzzZLnS5k6vyAPfe6zVW2ePNHSkbl5+yXPEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ct4sX9Mql8ME+dGkid6YfnVvKyhpuzdx/skIXDFKs1qlX81Y9oRdEC7lrx5VxnBpwPVYT23K34wVHTi8qiQJ2rSuvXizLTOOsth0RLr4zH1L3b+YlS5MleLFWt4E+wJNVkVxRwVBvSRmJ1nMDdgoaybZJv/u2wUDyNLliomDSqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKVSj4UD; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKVSj4UD"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so623329b3a.1;
        Wed, 18 Jun 2025 05:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750251212; x=1750856012; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=oRWjUaUzjwZIRs1Yr8RHoGlgQsJ2OGgk2bJ45eNBrT4=;
        b=ZKVSj4UDSOZAAll0fsS0d2oBST9U50SKLrX8PvHZw055e5XT7sAzOSEpl5vRb/Y4eG
         nnvYdSEwEkpMDLzHFOGiRJPC58B/hNeb0h2ydEWbqxDJakcMeiuw7rqQrFRzH2nYkcPf
         bklvydVM/OkgqJMrGrnGB8FaZ6zIEOtqnuWls/FtXi7MR41kEFr9EQfxoIfNc/i0Letm
         O1OWTrbOarcJRa8bfBQpCC9VzJdGRnCJzBt9SEWMQnTPad6XtkURbq4LJP2u+CCva2nX
         AlK6sqXJCtVtdYIVcnQlXMU7Myzxz+SIN0iKCOhM6ltDc6coC9DbQSi7JXyv/2cy0/Sq
         LY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251212; x=1750856012;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRWjUaUzjwZIRs1Yr8RHoGlgQsJ2OGgk2bJ45eNBrT4=;
        b=vZCajMVqyjVLZGVZ+qBkeAb0hgxv3jAUnsOaYGfBNpcFGz/aRe65I5Qths1b+FV0v7
         p6ERP5y/Dj5wZtba1LeQ6XbjJojOEVxkxbBk8mulm94JsDKlVasnB0P4XLve3etX/MO2
         tFoAx9TdOalARTQEG6ehj97RxaCZfNCUDMkEcfJ4AX2Mfea8RjaJWDW8wrKHtaKKNQVl
         brjc7BFdZZQ+2JvnQE9MRUmqa6NV43mLtovIU/F7m30n+Oo4VLKwAUeA2vN3JmdWOtcd
         O+DQXvtiHlWnGM6/r1X8AgF35R1iL/W2rAp/L5fWzr0vk9HcpqlJbxvpStyUI+Dpq15J
         3KYw==
X-Forwarded-Encrypted: i=1; AJvYcCUGyUQ4b0iHUEPH7Icg7N8AxqlXrAf3eSwSwqXO206xVy4qWOtpyPUx5FLuI9Q/cmpTrW1Y0EUCxpM=@vger.kernel.org, AJvYcCVrwNv5eb7vLypaw664Zf3zl7dWgIAelBwW2DoUH9mZyRhEJL3z8PdokzZvoIEOQgYr9nZ9QB0bHxyFHnL5@vger.kernel.org, AJvYcCXx9/k+dDc/xK5yad6QPdYxvQ2+pUidRO+iWcUnkfmoYfbT9sF91Xy1WUdTv9KM2kXO3PyDl70mI9thWQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJwt7xDdOvV26tYdhom6Kk1jlhluiZTWr4ed6HNNs8YVBkwW5C
	XX9MZ0F78UGAUUfDfSMakhkDrUh5JQwWxnAhtqcyWhInbTXF7HK82/gR
X-Gm-Gg: ASbGncs+E385Mc7fmma0sDiVWWSh2slYA2rEczszzs5mw+aahL2/nb+vkS/9BSzeMyi
	y3wP6vJwMiHsCU8EyRCpIikjNB4wxm0SMGONdcpXM3mmlMZqUqJ2riMS88to3T0CAFBn6KpCPtO
	8qVAoDQuxZzY8ZUJofQ9KYXEyzWiFS+GgG9n9JDzpB2FsF+hW1f5iLLWfnFXbhvsTOZ79036bmm
	OIQBs67KtyKrwqzOeoo4V/Qg62bmoein+fxxr1IO5iB9Bjppw/GsEmixuSSR7jfJCteDDl/qMII
	Dzrml5CMW/BL2KkYyhYS4J6d0T6gDaV3kDzXF/P7OsgRNiGjnH6K1QiBDKy+aDl0lBAFkIOTB/B
	IOIySyrisX5oazxMJkX4kmEo6CxaNrJlLbM4=
X-Google-Smtp-Source: AGHT+IERtSS9P9ZtjKKvs3VvAEIr7hcaMZrpGn27OIO94ymZWevJlHzD/jO84tw7z3Fi0w6Mflbb+Q==
X-Received: by 2002:a05:6a00:180b:b0:740:6f6:7338 with SMTP id d2e1a72fcca58-748e6ec3dbemr3273988b3a.3.1750251211577;
        Wed, 18 Jun 2025 05:53:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffecfc5sm11231863b3a.13.2025.06.18.05.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 05:53:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6cd4eb0f-4b4b-4540-877b-6531023b4a5d@roeck-us.net>
Date: Wed, 18 Jun 2025 05:53:29 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] hwmon: (cros_ec) add PWM control over fans
To: Sung-Chi Li <lschyi@chromium.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250512-cros_ec_fan-v3-0-a9f2b255f0cd@chromium.org>
 <20250512-cros_ec_fan-v3-2-a9f2b255f0cd@chromium.org>
 <ca2c10be-3dc4-45e1-b7fc-f8db29a1b6a0@t-8ch.de> <aFJqLkkdI86V3fM9@google.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <aFJqLkkdI86V3fM9@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/18/25 00:26, Sung-Chi Li wrote:
> On Mon, May 12, 2025 at 09:30:39AM +0200, Thomas Weißschuh wrote:
> 
> Sorry for the late reply, I missed mails for this series.
> 
>> On 2025-05-12 15:11:56+0800, Sung-Chi Li via B4 Relay wrote:
>>> From: Sung-Chi Li <lschyi@chromium.org>
>>>   static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 index, u8 *temp)
>>>   {
>>>   	unsigned int offset;
>>> @@ -73,7 +117,9 @@ static long cros_ec_hwmon_temp_to_millicelsius(u8 temp)
>>>   static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>>>   			      u32 attr, int channel, long *val)
>>>   {
>>> +	u8 control_method;
>>>   	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
>>> +	u8 pwm_value;
>>>   	int ret = -EOPNOTSUPP;
>>>   	u16 speed;
>>>   	u8 temp;
>>
>> Ordering again.
>>
>> This should be:
>>
>> struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
>> int ret = -EOPNOTSUPP;
>> u8 control_method;
>> u8 pwm_value;
>> u16 speed;
>> u8 temp;
>>
>> or:
>>
>> struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
>> u8 control_method, pwm_value, temp;
>> int ret = -EOPNOTSUPP;
>> u16 speed;
>>
>> <snip>
>>
> 
> Would you mind to share the sorting logic, so I do not bother you with checking
> these styling issue? Initially, I thought the sorting is based on the variable
> name, but after seeing your example (which I am appreciated), I am not sure how
> the sorting works. Is it sorted along with the variable types (
> "u8 control_method", "u16 speed", etc)? If that is the case, why "u16 speed" is
> in the middle of the u8 group variables?
> 


It is called "reverse christmas tree". Longer lines first.

Guenter

