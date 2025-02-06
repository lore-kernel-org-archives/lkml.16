Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23742417EF
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 23:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738885298; cv=none; b=g30b6A7Od2WQyB3uoTRNnkgyLrQw7R2lDexp5xecWFQnrtxZ++gVWbVT+NutAq5GsZ80BmMsRh0R5zIg5vDFPs9E90eqMSJHFCfe1NPhpZR/3F/ZBm3OU/MAqigLUz0h0FTy+xDNdf845ZLcIWwxrHwNi8IwEk7ZW8sAJ9+ADdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738885298; c=relaxed/simple;
	bh=hmgR9I5sOhhxD9BIWUF+0QS2s1W9+BaJgbLVbHWk1aM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UjqbifMA5rFsyeivewkWoyWJrIZU6aguAFdyrlOzlxTPHfeQGygBx9KTimSLU/oLkgoBbmrbr+eqsTURZ39LAyRJrKigw3iHHjZAwTCOf4BbRaYMwShLF6V3UG3QyGHYrD2KkA9Smyo1j+3ZsTrUQvjdxg8HZOk1YebZbljgyc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mw1OLzhn; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mw1OLzhn"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21f05693a27so22494605ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 15:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738885296; x=1739490096; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6EnTCjaZeRqF8kLNb69XLofT0N+4qheoFYDQm0Filuo=;
        b=mw1OLzhnCglTKVKxAlGnSiwbP25de9qGIq7bc/w/fZWwmGBzMrTSYZBoepcxGFvJV0
         vTdBMQFpXSijiR/LjAnQ2SSqWC3W+v6IQRjkdrIZR+SzsOt59gDMUsl36f6FR6cKVNRw
         H29uZUiOORQXxt7aZHGGUsdMeDnephek+69p7/bajpCiq2D+GMiZseneZY2zM8XZFA5m
         skRk8kL8YAbCQrKMmoK2ZfcAwtOXzlUXGsqQMcyjvzDjpVDP+RUrSvkYPrTIr7Cuo6KC
         1Mdjt2upKfBvPE0jXcjScsHLnF7ILWfFIcvpG4ybethC5SbxvRfTiMR7QMLJljkSYGvm
         7Ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738885296; x=1739490096;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6EnTCjaZeRqF8kLNb69XLofT0N+4qheoFYDQm0Filuo=;
        b=XFn4qJ+qeeAfSaMqNRM9323JkrfrHTB1tiAvsn3ZMjCh3UXfruUflgnQv1shrnBf/X
         7josB0YjaP9xUNdSv5Imo0X3sXxUIoZwTla5Jp4D6trqdjhYTzFPPrSkfEPzTEtxOIiO
         vmQTaPwKCLLZZYWmPlzqGTszl4ZLXMBOuwoih+o2YCHUNQMlOtjOcqSVYQJQ+UiJiP22
         xJTxUwbYnAMtteFfHNxq8wBCDzkV6yq0dQWJDKtTNtxQSkbyLZFY50WPn19xbBquhsYe
         cm0GUXZck+DaPcUbCZGGEpjjxuD55e0vMs6ccwforJ2EH5wBn7lgNQxBzEdqYYCpG1Gt
         2w/A==
X-Forwarded-Encrypted: i=1; AJvYcCXearPy3rZBPlV3ZZ+d+qATp9RnQWCc5qMnU4eEF1KYaSlMnvP5//urg7y2jYtVM4DMeu9pXLZ5l1dk2/U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl2CNKwlyF9WSnnmMJgw2lu4A8ZFplDGypaDX0pw3b8U+YUdL1
	wH+J8Iz9qPftA4c3OYwxNZrfWw1WwgjdSRWyO6YCaKIyrZ4NwG+v
X-Gm-Gg: ASbGnctMmXUIbhgy2bJrS1fS006kbSu0xZYUoiWzBtsY+Jr7C8DrU3AK2FJpIVVKLKF
	zbCE+eSie5LqPLhl00KabqOlpvzrb71Jg2Ue0EWxVJmgY+UWp05KqyfKCwvyvDSYe2wkIphxveO
	K39+zd/YtiyeP0ywxMSHUC2I5j9AY3pEr55GoKLssEJzGjWyoThnVpMbIUdh3h3zQhQ+NYNRSuO
	gA+h2fFHAGTqiAxIuwbgUfUqTxI7EJmvMiP1uKauS1U7Uybba6PgKrhADQXQ5VOx1ZVKDbCkuQl
	vF/wLJiivfZAZ2rBtAHXgjWFpygUvJtrZVLnCiu8oM64+VRsOAEPaaCFSQpGQs+8
X-Google-Smtp-Source: AGHT+IEv4hj8dwJaPrfpa1aXGNGR5tuYk6YX1OJGTuLCD1jcr4Vsqpget1z6kEg+jNOLCdRkcYvoOw==
X-Received: by 2002:a05:6a20:438c:b0:1ed:a72f:bed1 with SMTP id adf61e73a8af0-1ee03b5a90emr3068953637.32.1738885295822;
        Thu, 06 Feb 2025 15:41:35 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51af65a24sm1631189a12.58.2025.02.06.15.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 15:41:35 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <01d03e10-b832-415c-9dfd-61be31b49b1e@roeck-us.net>
Date: Thu, 6 Feb 2025 15:41:33 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 29/33] hwmon: (it87) Check the it87_lock() return
 value
To: Bart Van Assche <bvanassche@acm.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marco Elver <elver@google.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
 Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
 Frank Crawford <frank@crawford.emu.id.au>
References: <20250206175114.1974171-1-bvanassche@acm.org>
 <20250206175114.1974171-30-bvanassche@acm.org>
 <9f0cdbde-957c-44a6-a7ce-d3d412ecfbb4@roeck-us.net>
 <7304c187-d80c-44dd-bbaf-4de1555a8278@acm.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <7304c187-d80c-44dd-bbaf-4de1555a8278@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/6/25 15:34, Bart Van Assche wrote:
> On 2/6/25 2:51 PM, Guenter Roeck wrote:
>> On 2/6/25 09:51, Bart Van Assche wrote:
>>> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
>>> index e233aafa8856..8e3935089fca 100644
>>> --- a/drivers/hwmon/it87.c
>>> +++ b/drivers/hwmon/it87.c
>>> @@ -3593,7 +3593,9 @@ static int it87_resume(struct device *dev)
>>>       it87_resume_sio(pdev);
>>> -    it87_lock(data);
>>> +    int err = it87_lock(data);
>>
>> I am not going to accept patches with inline variable declarations
>> if the patch is fixing an earlier problem, sorry. This only results
>> in unnecessary backport failures.
> 
> Hi Guenter,
> 
> Is this perhaps how you want me to format this patch?
> 

Yes, that would be ok.

Guenter

> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index e233aafa8856..5cfb98a0512f 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -3590,10 +3590,13 @@ static int it87_resume(struct device *dev)
>   {
>          struct platform_device *pdev = to_platform_device(dev);
>          struct it87_data *data = dev_get_drvdata(dev);
> +       int err;
> 
>          it87_resume_sio(pdev);
> 
> -       it87_lock(data);
> +       err = it87_lock(data);
> +       if (err)
> +               return err;
> 
>          it87_check_pwm(dev);
>          it87_check_limit_regs(data);
> 
> Thanks,
> 
> Bart.

