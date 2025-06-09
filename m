Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D815714B959;
	Mon,  9 Jun 2025 15:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749482832; cv=none; b=YDLuP++pMCiR+se+oM6agYsM4rlLT+VK4r54+9IFezF6kk9tKHe9wAShbq2J93AC1J2/u515PNFEd8KruOnu5APImk3hgy9DoC5dEmoIeCrXeezy0aHStyl/gIKa8M6L24qKEQyDjVxkjOgwDWXPthT+dHv7ZAyr5fzc/J3Uf6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749482832; c=relaxed/simple;
	bh=z6bW0f/QFxsWIgYMhZzVhcY+GojKxJbwM6aYpAc9Msg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tHmX3TlgLLvufDwg4lY3RGl8SMzJIhJJhkt9R7CczT/Sq47DpaNKh0ojcQ+ti/Z5v/jtKhyIW3VshrJEegVEQ3eSF7kWbP6OB+MzXF2ab5Uza8r3wEOaS+DvcZZh8VXqeTxw8Vjs1OzqwyQKMxffH3ktZVF+ZygX6gG0uQ2PiXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zq2owKRv; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zq2owKRv"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-747e41d5469so4879962b3a.3;
        Mon, 09 Jun 2025 08:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749482830; x=1750087630; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=YCX3855lIIrYAq3FzsVMhg+iBBVDLjPePoF+Ed0KM3E=;
        b=Zq2owKRvNr3UjuniFAmaVdqmf55kyi6rC0BxvyrH8TPHl21oCo6ytHdOMgTnv8DRuC
         q+GW2SGAo6zWSBY4sg36F10weXcGaGyWT3cJdP+ZRFC9rAxcCWIJGd9lDfjwAmm3eQwO
         2tTnTwkDrQr/FBFzIySNP1/KWbwMq02GyLVtGBogqk8ad6FSo6GNmx7rVjJXHU1cY/aC
         BNJGAZBcs+mCeChbiK6TQ355PGKzif9HRqZrqYnSGoNXt+KTalvQ9YcC9v2GDRSHRcqd
         grQPv4rQp3pe57fhjRqLl6BLSrEWTib3O9bcxr9cPfGzqy9AGngaBMmEL573ySs8VO3G
         jjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749482830; x=1750087630;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCX3855lIIrYAq3FzsVMhg+iBBVDLjPePoF+Ed0KM3E=;
        b=PYLC7jhVUB3/q5ltSJ752+tS9xKfyK2KWwtWBd9XCYIXU26Tny9vjrUfSf+ZMMZ1qi
         EExY64rj7TMgWpT7j5N4llM1pNdm+ieawUm/KxI6nxt6QxK1JWBpA77efFw262okgoZ9
         DQ2TqgGWNVFnKur4j+nrijsK2GDN3K+IbXpm9dFuV9mCBan5KxITvEGpNWI7v1clPvJ8
         d4KhDL/0p0Vwp8RhrruGdR90MNRmNRvM5hKUliHyRuI5f7Qq2V1Po3GmX1jD5Qb0nlh8
         kWmv5akB9DbQCSpZFqbtff4LP0jFi2SWyvma3/I6wF2aHbx/7mi9DIOH4iJtn5oNHFp0
         4r4w==
X-Forwarded-Encrypted: i=1; AJvYcCVqS74Lr4EKXaGF2BPoQiJ27qPWpjmpTd3TddJRUG0aecWhZGiIw+TE1ntA4RuwRsBUQvuy6Cd4Fi2gWTaE@vger.kernel.org, AJvYcCVzQNaba34IQM7A3RmdzfKoHb64NT6sbLLGFoYJ02puwRbvAj0B+Q37DPoN2cLB5G9zyU7eT7PIhRgObQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqW4g7bPWmqcLXfn9duKpzxfNkfxf5b4i11py19GgQjIA3BIQE
	ZF/2uMV0OcCnaC4Pa4mil0IvH5FpLFFZQMhEg3xD0+2CMl9eJJdtCYuA
X-Gm-Gg: ASbGncvbMHG8c7b3KvmvzXHk+dI3VihW0lU8M7hOxOKg/lD95uAs+Wt6FV5eAh26gfk
	6sNMYvN3X/XXcKcL0KaODdy6QbQzJ+GeVd2tPeTucF1deODOMJOAIYdrmPengQ9YSgdUI/R4XXy
	4qG1VXVLkGB5goa3IrMAL7z0qTdKMB83x16TI6j9rn17PzRfbrTAVfDHXZ1Iv1ioHJMJr8eI0sP
	15xpxnYWhJEpviXhJkSCVAKtKH4/mOwzmilh4R5bKMjSFWGaToMEFT7/3B6U6a4zWl4YSfuV/Lv
	8o2pQh9Qj3rqP3nWdDfZoeF0pN/XgiWgZkLBwddch3AAIILGboejT3W6uP9/08dUr4cb6YUlrkJ
	lyRoMjidgMlz/NvZNYAm17JTX1ExcuwitphY=
X-Google-Smtp-Source: AGHT+IFrjDLmzN3pC1qxx1QRDT77+XYDwISl+02d/eeA5HitGB3+qQ9BkPMOBH2jJQALym15L3V71A==
X-Received: by 2002:a05:6a00:3c8b:b0:740:9d7c:8f5c with SMTP id d2e1a72fcca58-74827f09a2cmr19987273b3a.18.1749482830074;
        Mon, 09 Jun 2025 08:27:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c6b31sm5851554b3a.129.2025.06.09.08.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 08:27:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d25fe7d8-1e15-42bd-9e95-35d2c195d400@roeck-us.net>
Date: Mon, 9 Jun 2025 08:27:07 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] hwmon: Widespread TOCTOU vulnerabilities in the hwmon
 subsystem
To: Armin Wolf <W_Armin@gmx.de>, Gui-Dong Han <hanguidong02@gmail.com>
Cc: vt8231@hiddenengine.co.uk, steve.glendinning@shawell.net,
 jdelvare@suse.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com
References: <CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com>
 <3f5feb87-330c-4342-88a1-d5076538a86d@roeck-us.net>
 <3401727c-ad93-42df-8130-413eda41ab3a@roeck-us.net>
 <CALbr=LYe3p9GW2Z_RUxKG+w2Q1wfWGRW=dRLoTraS7qJ7imdgw@mail.gmail.com>
 <0a3a06df-5da9-4b39-bf38-0894b8084132@gmx.de>
 <72661c37-c4f4-4265-9fa4-e4b31b43f6df@roeck-us.net>
 <06476e3b-3334-4c26-8762-6b410feb740d@gmx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <06476e3b-3334-4c26-8762-6b410feb740d@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/9/25 08:03, Armin Wolf wrote:
> Am 07.06.25 um 01:20 schrieb Guenter Roeck:
> 
>> On 6/6/25 14:30, Armin Wolf wrote:
>>> Am 06.06.25 um 09:03 schrieb Gui-Dong Han:
>>>
>>>>> On Thu, Jun 05, 2025 at 07:33:24AM -0700, Guenter Roeck wrote:
>>>>>>> I would like to discuss these issues further and collaborate on the
>>>>>>> best way to address them comprehensively.
>>>>>>>
>>>>>> I'd suggest to start submitting patches, with the goal of minimizing
>>>>>> the scope of changes. Sometimes that may mean expanding the scope of
>>>>>> locks, sometimes it may mean converting macros to functions. When
>>>>>> converting to functions, it doesn't have to be inline functions: I'd
>>>>>> leave that up to the compiler to decide. None of that code is performance
>>>>>> critical.
>>>>>>
>>>>> Actualy, that makes me wonder if it would make sense to introduce
>>>>> subsystem-level locking. We could introduce a lock in struct
>>>>> hwmon_device_attribute and lock it whenever a show or store function
>>>>> executes in drivers/hwmon/hwmon.c. That would only help for drivers
>>>>> using the _with_info API, but it would simplify driver code a lot.
>>>>> Any thoughts on that ?
>>>
>>> Hi,
>>>
>>> i am against adding a subsystem lock just to work around buggy drivers. Many drivers
>>> should use fine-grained locking to avoid high latencies when reading a single attribute.
>>>
>>
>> The point would be driver code simplification and increasing robustness, not
>> working around buggy drivers.
>>
>> Anyway, what high latency are you talking about ? Serialization of attribute
>> accesses would only increase latency if multiple processes read attributes from
>> the same driver at the same time, which is hardly a typical use case.
>>
>> Guenter
> 
> Some drivers read all registers (fan, temperature, etc) when updating the readings, and depending
> on the underlying bus system this might take some time. With a global lock reading a single value will thus
> take as much time as reading all values.
> 

Those very same drivers acquire a driver lock when reading all values,
and they typically do that when reading a single value, so there is no
difference. The real fix for that problem is to avoid driver-internal
caching and only read values which are actually needed.
On top of that, synchronization for the most part already happens
on the regmap (if used) or bus level, so adding another lock (or,
rather, replacing the driver lock with a subsystem lock) does not
make a difference either.

Guenter

