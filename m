Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89B123C8C7;
	Tue,  8 Apr 2025 18:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744135674; cv=none; b=Etmmgos5VDFV6AOei3E+ngIaIJpleTVCtAfc5aIhYIQ32sZz/XexEu0/WgIiBtgEXeb6dIY9TYC85D1rKnSNkgkdUH6+8xJujxnzI/2plvf/AV8ZCZsK33BrWHOjDyk3VFq+XJZzQrznpx2adajBp/e2ZepIavYVndcZKHiiJus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744135674; c=relaxed/simple;
	bh=rkXra9kOREWmAsORcy0+XvfydkiyhJbKXo+APNRCe5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GyIsYmyeVOHxpmWEuy2HERPNIJ7ESRF7erusREzYFIYQzRslnN3AalBanIVA88TamIQgc6RZ2Gj3P22yz0XjFw6K6E49MegPy+H0z22YtWYP2Xj3+vopR7gzSi1ITN+9xxoBFHgbrxAjUfG+o7LHB3fhNP9BLjioz4oRiISrlA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhp08UmL; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhp08UmL"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-73712952e1cso5470866b3a.1;
        Tue, 08 Apr 2025 11:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744135670; x=1744740470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vhshArBE7GFfsDqBVcijf6Rw3bHMYKXCJZahS7CtZaw=;
        b=hhp08UmL9PA+ugwDSYhWbKE97ltRUIWEub22VvgIsJG+qTXFgUbcoFTZrztXr4cxe8
         kJ4R/GrHoJ2/zFfwbAoCOKGkmk0GAeSysjmXVUlgE6/kTmA6/8J0tLpkaz1/utracJWK
         FCQPnOhwEZ/lkEQCFq7lhkf2EA1YObQY2z8Zd2u7bdB2FDBB3Wqo5/MtHht0wYXvAnYJ
         48Gt0zXqK1+DGnxPvdj/tyi+wzGiGcrPFfDlkOT8xB5nrMitISdevrtzxVFlQK23l3jO
         xGY8tuOc3RgeztdP2kPIPq+8di7ZDLMXa8V6q7zLdhqUPUVOC9jkTrpGuID7wGPrjgHD
         GvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744135670; x=1744740470;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhshArBE7GFfsDqBVcijf6Rw3bHMYKXCJZahS7CtZaw=;
        b=OLdZMa0U1Z9q2mOThgTOlF4UxuPNB6kuZYnb7t0S/bZSYfmLiUw/HBNAE3+bT1EXSR
         F5WwMtcYH5V5oIW28Prj6cEov7eePO+eDTAyXU+sjd/TizKacTXJpSkF02osLC1zY97t
         j8ZLuOmt+6ulY9k+bD7NGv7Spaj6Uqd+wvIFfk/xmx+HEwJZUNuPhQ0ZHipMZFFNLpX1
         dvGcZBTZAP5tDueAQwgWU1UE/vF+sWDEztgy99bLyQdoz7jZdhfDEWO5ZiJaumleoqWN
         ZdGomKE6d/rQpSmULHdMenSvQyEHsVc2Wuc/wQXoVZxbJ4z9/zYUH17Re2vzTKWekqer
         Kjnw==
X-Forwarded-Encrypted: i=1; AJvYcCUNaCCoHgvMZvZ+m5gRH1A1lMj2D0OBNSoFUxwkIYGXnsAKCqJbyxefix57x50botVMMZYJZHTCpBMmdesu@vger.kernel.org, AJvYcCUi3kgeWwOpxhSFgPC2x9cRoKihiMkFHDoa8TwNwZJoJT2KSAvUy0aKY0Szz0DrQY61pDhC5QWwvQBzAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiJ9WWRLXEJJsRrf1NVtEjoei1/SKpit1RrYjj0UpLBdfvxNFg
	2PKYo7lsj1mUzoZFlY0j1OtkNdk/iXlcy9l4ZD2dsxIPEWLJCdZI
X-Gm-Gg: ASbGncsHAv4ylNDBC+iXJzMnHmmXF9VBVyK0wokLH0FlQh2qqYFHcob0OIHw/7TzPOC
	awdtU/kj5SbWaAQOJ3B/tupFutdtJlvsfe1y4uq9mhdiKb/NvPf3PdEIMCCQoPmeUrWjjFkg13U
	bdJMxGCVDJlzImaQI8X/kJ/XIBSNxzdsorK9LSz4LRp7nbl3XHpmejeQK3+0Z8/KWNBguEIyVpG
	qdC3K57uCvWJUHxwv2/t0Ejgj+ITJakkf0p6qhWAcHwQoLr5pd+tFp5HU0nGLjzXRtYxxJuqg9+
	9yvRBPf1Pg1vOApNLO6rJx0dpFguftcyZk1iGA+qu2jwvSq65ruNo0NeF6zYr6iWBXWJJJw4juu
	8u4D4j5FARVAQLKfTZwU5ygFels7+
X-Google-Smtp-Source: AGHT+IHqyMpIU1FUrhiZ3RNfjRFR3xnQKMeYbX4DWdX1+YH1sAAApL39/kjWHb41qHpmaFxZzgHBMg==
X-Received: by 2002:a05:6a00:2355:b0:736:6ac4:d204 with SMTP id d2e1a72fcca58-73bae4d11e8mr9150b3a.11.1744135670081;
        Tue, 08 Apr 2025 11:07:50 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b2d76sm10881998b3a.122.2025.04.08.11.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 11:07:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <661f972b-cd0f-4d9c-b429-5990edf8f13f@roeck-us.net>
Date: Tue, 8 Apr 2025 11:07:48 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (ina2xx) make regulator 'vs' support optional
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, NXP S32 Linux <s32@nxp.com>,
 imx@lists.linux.dev, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>,
 Eric Chanudet <echanude@redhat.com>, Florin Buica <florin.buica@nxp.com>
References: <20250403101516.3047802-1-ciprianmarian.costea@oss.nxp.com>
 <dab2f459-240f-4e4c-9bf6-8c0285354cfb@roeck-us.net>
 <4efff19d-b5e6-49b5-9a15-e4af622c6ebf@oss.nxp.com>
 <2a12e6be-c253-4542-86a0-aacb71671ed6@roeck-us.net>
 <1d7318bf-9971-41aa-a952-85367f001c9c@oss.nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <1d7318bf-9971-41aa-a952-85367f001c9c@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/4/25 01:36, Ciprian Marian Costea wrote:
> On 4/3/2025 7:06 PM, Guenter Roeck wrote:
>> On Thu, Apr 03, 2025 at 05:29:26PM +0300, Ciprian Marian Costea wrote:
>>> On 4/3/2025 3:15 PM, Guenter Roeck wrote:
>>>> On 4/3/25 03:15, Ciprian Costea wrote:
>>>>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>>>>
>>>>> S32G2/S32G3 based boards which integrate the ina231 sensor do not have a
>>>>> dedicated voltage regulator.
>>>>>
>>>>> Co-developed-by: Florin Buica <florin.buica@nxp.com>
>>>>> Signed-off-by: Florin Buica <florin.buica@nxp.com>
>>>>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>>>> ---
>>>>>    drivers/hwmon/ina2xx.c | 4 ++--
>>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
>>>>> index 345fe7db9de9..ab4972f94a8c 100644
>>>>> --- a/drivers/hwmon/ina2xx.c
>>>>> +++ b/drivers/hwmon/ina2xx.c
>>>>> @@ -959,8 +959,8 @@ static int ina2xx_probe(struct i2c_client *client)
>>>>>            return PTR_ERR(data->regmap);
>>>>>        }
>>>>> -    ret = (dev, "vs");
>>>>> -    if (ret)
>>>>> +    ret = devm_regulator_get_enable_optional(dev, "vs");
>>>>
>>>> devm_regulator_get_enable() should provide a dummy regulator if there is
>>>> no explicit regulator. Why does this not work ?
>>>>
>>>>> +    if (ret < 0 && ret != -ENODEV)
>>>>
>>>> Why this added check ?
>>>>
>>>> I know it used to be necessary if regulator support is disabled,
>>>> but that is no longer the case.
>>>>
>>>> Guenter
>>>>
>>>
>>> Hello Guenter,
>>>
>>> I've just tested and devm_regulator_get_enable() does work as you've
>>> described, providing a dummy regulator.
>>>
>>> But, according to the 'ti,ina2xx' binding [1] I see that the `vs-supply`
>>> property is not required. Hence wouldn't it be correct for `vs-supply` to be
>>> optional ? Using 'devm_regulator_get_enable_optional()'
>>>
>> Yes, but the reasoning you provided is different and suggested that the
>> current code would not work. Since that is not the case, the change would
>> be purely cosmetic. Also, I still don't see why the -ENODEV check would be
>> necessary.
>>
>> Guenter
> 
> For boards such as S32G274A-EVB, S32G274A-RDB2 and S32G399A-RDB3 which do not have a voltage regulator, 'devm_regulator_get_enable_optional()' would return error value -19 (-ENODEV). Also, other usages from the Linux Kernel seem to perform the same error check when using 'devm_regulator_get_enable_optional()' [1], [2] and [3].
> 
> This patch would help in S32G2 and S32G3 to not print an unnecessary kernel log warning hinting usage of a dummy regulator when such a regulator is not required according to the binding.
> 
> Would you like me to send a V2 with the commit title updated as follows ?
> 
> "
> hwmon: (ina2xx) make regulator 'vs' support optional
> 
> According to the 'ti,ina2xx' binding, the 'vs-supply' property is optional. Furthermore, S32G2/S32G3 based boards which integrate the ina231 sensor do not have a dedicated voltage regulator. Thus, making regulator support optional would help in avoiding any unnecessary kernel log warnings during boot.
> "

Make it:

"According to the 'ti,ina2xx' binding, the 'vs-supply' property is optional.
  Use devm_regulator_get_enable_optional() to avoid a kernel warning message
  if the property is not provided.
"

Then add a note to the code explaining that the check for -ENODEV is necessary
because the regulator core returns -ENODEV if the regulator is not available.

Why it makes sense for this function to return -ENODEV if an _optional_ regulator
is not available escapes me, but that is a different issue.

Guenter

