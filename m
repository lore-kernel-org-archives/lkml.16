Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A13179A3;
	Fri,  4 Apr 2025 23:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743810398; cv=none; b=VDdiDbvzKWO7LsTDtA7pJDYXMz14dZCbhYEW1SE/g6P8w9xSQDLf5H8ttj7NMBf8sy1TFnMPr6gSWeReIZIXFuHYsjONz5qY8aYctU3TXr6t5RTQBXAAaQiVb+i4Bzw1Y6scCVpn3bTjE5JOILHgH+uFvNGqPlIMN2BzISzaERw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743810398; c=relaxed/simple;
	bh=Fgy1gD7TKxFC9RpaZZjTlAM72FuAVNSNmhM4hqETpFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nj0uJNGSSuHKErjup98lTfAfuIFS/CtqaKsAqGw33YfbAFBOA3D2BomIPPYMwJ2gh3rSn32agAZmxF/Fevcsd6+1xUGTSOiga3r9+hd03I443VYwd+Tul0zYVEq0QIMwexxhCGuxVAXKNBwAlzDuCgIv44qwcU6Rak+AebCfvOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpUoNe3l; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpUoNe3l"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-224171d6826so35400045ad.3;
        Fri, 04 Apr 2025 16:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743810396; x=1744415196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=CXMhkUeB8NIhXAv8NP/zBZCIlJRxSGkD0lFOpzyMoJ4=;
        b=lpUoNe3lGBGH8uPdBKdzPtfLnDri+Dhm1akHphOScbvLywh7c7iaaM/BqqLLerYXNc
         S+WRcxe3rcRBcartLG3d8Vrn1fnk4fBmM0dEWLCZ+D7u4ZDC18J/z8ZlH2Vb81MVceor
         s7Nq8BxfV+qWOTIUN8ZAdIhNdk16qfSsNGgy/KLltoCIU12TmqzrsexfaId9E8mthMFk
         z89F3aTKpQgaJb0y9hG1tT8gcvfRdQV9fS5INm0Qxcf+wPT+Ew3eJ/t96GXib9Izg5cY
         DrAPkziiLTyxL9KBcZNBMgyj5fKp5SbkZ0NzV0gXYw20cr/87z3aQ+KzJnxgWdx8OMC6
         In9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743810396; x=1744415196;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXMhkUeB8NIhXAv8NP/zBZCIlJRxSGkD0lFOpzyMoJ4=;
        b=TRbvz6EDkm/GqoOUVOJLTTHvgsjIaBYw6eOker5tIjyefeoCSdT6Vg/cYqS3eXGIFY
         fzcVFQRMsvoRN5zHLecJxkKqvyk1hX/krXsbIGDix1ueUOgbPxz6sIsoAcBKmoWe2fGI
         FcJnwsWz0Aa6uzdo6MUq6S1G4W7yf54Gvs8yr/UwBsbXwzcFuL4DW7DXkcHG9eer7TrA
         PP7Ozf6Ae97y0/R2XVG86kde+uzb6azHPQnTp+ksE2b/20hldUOufqQopvr9AKxr7yQH
         Hx3cvvn70Vdf3ElbMqdoLrknT8eBVaozOvC2RPyFzGEWivUZz0QQ1AlhR4C1DjxwmxLc
         +d3A==
X-Forwarded-Encrypted: i=1; AJvYcCUt785qGOX6E93cCoYF2DwpV4qly+wh+fnU3cTKvcZprmWbaL1UnBygLud/RJMDTT5h/DOVMF9kgl3PWw==@vger.kernel.org, AJvYcCX/LxVZYUrGbmIP7CzlTRYOa1f5v8O9+qn65k4q+u7pTxrGhqXyDS5gN+XB4FTL+Gz1u6yHAx4szhAbMzWb@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu2ryqVCXAdM6RB1EWFunzImVnqsE4I6AawrXFttv48KfvLI/g
	mX14wA5Udm5TduLrw/H1VgesIQTD99r057v9xEwMtU44MJcxhcmm
X-Gm-Gg: ASbGncsT/bW6xwaageA6WKY5W/NpGqauGaBsAqNbV7LEBtA1JTYQD0E0GWnkWqfBP7t
	9esh8ocJi8xwCmzs6ayt99BDijFnISjIJq24v9VB6wWRlyaP118IFEZuoKjdTTzpwPnd9sOYUbV
	1on5gL9B8JMw0aXBiFZNoNT72H4czLOVwiV+BRSg202oRX7f+F5uZV1g02t4hmGAA+lUeUhKWVH
	RRSHzkFo3z7Bk6HiUIesajFR7dit55VyVNPLuuoJ8pc5+CeX0MXYQg2PhIMJJicuxgKoE362O0E
	NlFVelCeJ+gv8juuMkAVUYFfTIwc/E6qNAYEwafWxK1vQkLnmnhaDoAkr1iBGz4sMasCkjj21B4
	ll8O+jEgmaSvqTiMyUQ==
X-Google-Smtp-Source: AGHT+IFFSJycdRAKWz44wkVOCBPfAloGWYlCvuIoLWIPYsm/sTWty7Tzz9/X8TeolwTBmP7+BbKRIA==
X-Received: by 2002:a17:902:ef0a:b0:229:1717:8812 with SMTP id d9443c01a7336-22a89eac8d3mr72592325ad.0.1743810396050;
        Fri, 04 Apr 2025 16:46:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297877659asm38583275ad.250.2025.04.04.16.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 16:46:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7d6d8740-9d9e-4cc4-9e7b-d005fb87fa2c@roeck-us.net>
Date: Fri, 4 Apr 2025 16:46:34 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hwmon: (pmbus): Introduce page_change_delay
To: William Kennington <william@wkennington.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250402202741.3593606-1-william@wkennington.com>
 <20250403211246.3876138-1-william@wkennington.com>
 <444f9411-851b-4810-8f6e-35306ac9bfdb@roeck-us.net>
 <CAD_4BXg3WzRZWiRo42JF0-oxffdj+N0agkyeE_m0Gd1YGda8+w@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAD_4BXg3WzRZWiRo42JF0-oxffdj+N0agkyeE_m0Gd1YGda8+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/4/25 12:31, William Kennington wrote:
> On Thu, Apr 3, 2025 at 5:28 PM Guenter Roeck <linux@roeck-us.net> wrote:

>>> @@ -2530,7 +2527,7 @@ static int pmbus_read_coefficients(struct i2c_client *client,
>>>        rv = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
>>>                            I2C_SMBUS_WRITE, PMBUS_COEFFICIENTS,
>>>                            I2C_SMBUS_BLOCK_PROC_CALL, &data);
>>> -     pmbus_update_ts(client, true);
>>> +     pmbus_update_ts(client, PMBUS_OP_READ | PMBUS_OP_WRITE);
>>
>> I'd argue that this does not warrant a PMBUS_OP_WRITE in the first place.
>>  From the chip's perspective, the operation is complete after the data
>> is returned. This is just as much a write as any other SMBus read operation
>> (a write of an address followed by a read). If you think otherwise, please
>> explain.
>>
>> Either case, the change warrants an explanation in the patch description.
> 
> The previous behavior was to treat this as a write though? I updated

That dpesn't mean that the previous code was correct.

> the description about picking the maximum delay in the code change
> above, but this specific instance is still classified the same.
> 
> I think technically we shouldn't do a single smbus transfer, but do
> the write followed by read with a write delay injected between them. I
> don't want to make that change here but it doesn't make sense to
> ignore the write delay IMHO.
> 

Every single SMBus read transfer is a write (chip address plus register address)
followed by a read. Following your logic, every read should be treated as a write,
followed by the write delay, followed by the read.

Guenter

