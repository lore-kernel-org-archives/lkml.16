Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663B417E0;
	Wed,  2 Apr 2025 00:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743553157; cv=none; b=O21r6iig+ivrsQ+jMc/NM5az9vpkiO7FEcaapRP9y/SiREAcaWj8CfvEzbDTrgNZTwMOsb7QdCUud2nx1oqnCZTHxlXKvp7aIKKmIcy/wWmbMJep6RB6W0FqhkER5tDT8seY9+us24xk0F2//654QY0R8uxnFKeQpdu6Xx6EyRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743553157; c=relaxed/simple;
	bh=02yG6laXOGLaOVyzrKEeTyoIYwMKqopyPivxPcvDbiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qil5MDXNBUDmOkYVyWKXhC0w99o/dPOrUGp8/I9XCulpg6k5/p/wt8X/cloEhm8cJiPfbSMLRRn/R9fdBPUhkfKqgJw4p3pIIkk1DvbMGB4wohP05WAcPRutBPz3v10tDNQ7WfmBdTngwACnol/+7jKvCKfLM0Y3zPVO7CACMBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GPC76FJ9; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPC76FJ9"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-227b828de00so108117675ad.1;
        Tue, 01 Apr 2025 17:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743553155; x=1744157955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=w0OuXo81szmST2NQBpsdRDPeT/B1BcrZH/KOhIskzf8=;
        b=GPC76FJ9ToAFvoT9WZDQkFXVSZHNXd7xioa38i9SLTQy3IP8TOInf/LYhqu6I5xKaq
         u2WDShY7cjmm6f4qOzhh+DAuDqdU6Ka7YZRwfhm00vrsPo3umrx5vMG0iGSktlG6dt/F
         5ZA9xk8uIX2U8ON9ApZpx7podTOniG6+2iG0KWkjILi7dEA83tlAUHWkD2QBEgG1SjS+
         5kZzIYJxss6E54DdCkDH70/exubO7IoWxzkoy05S0wc8uJRuNlMR3OyZ2u3LRfqN7EkU
         MXJkxuRu/t0/GNajIaPfnxJN8xYkyqfu5T0+wtwsrb39M3UAtSzr/jpc9Sw2KESQ1+Zc
         NksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743553155; x=1744157955;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0OuXo81szmST2NQBpsdRDPeT/B1BcrZH/KOhIskzf8=;
        b=u0NANDRV1uMyRZHRDdEPgBy9U0fx/QKO0jltMEl6d6NpdOP7PMY/cSshzw8ktXUXEG
         GEvrrkyrvk0vHk8SavN58+mYpiB7hFStNIxXRtLq9ClgQ8/zw5pt/QFQ0QieQcD3esHP
         FOu6YA7NOTQgwYCXquJaDZWS+C9/4iRW+uCSK1B6OIOwGvzvv4UaJSnZXbRybf4Eq5uz
         voHuxY0ghzkE6SwcaOBTbuT55SAfNZeP6rYYV78gSU395unDQbyuBdOKo1LPCp5WleSS
         x23cyvSq3LCE20BnSqEAbHzjIN9rNnUM3VHYSFopQuUhnRTFLp0BCsJMuN1wZaV/Go9i
         goOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIsDqQvo6a6HZaikUxlm5CFgm0IYjTX1f9vGdAhGZ2+tf4X65OW7C5QRpEap+CQJlKk15eotvF4e/5HAxp@vger.kernel.org, AJvYcCXpKEUtSn9zq+znr1eIUbiX9yZ/UGt7xQkH5tFSQLZQuyjRYoTtUtNuBPDQo1aDagr1w5aOA5qJNcnkEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoURl+3HWZKnpdZ6Pow1bZn8NmBCMS1tm5DApa+d/Mw9N1WCcg
	9BgRNbJDnWG10TGYGX1nzgD9hm9VJID64Jk+PL/KRpLQfUbS4Ewv
X-Gm-Gg: ASbGncsvn96rvfFR5bzo3i6PGkSeXzVR0Ud9sd7aK/TCSyOUGkcJG1AnO0l3/hv+86a
	LiU/4ixTuEc2JmeSZ3LGrCoO3mUhkbMsfE2NL6LdloGrB/BXwafIrgyLi9BZrVXjSdPa72gK7B6
	fPnW3DQeupw1i/JCdvK87TpnGWf+LUS0mMY7+HSJM87JWiAmBobI3WQerhA5zMbK/HffYSvjosh
	+VhfIrS3C9mkmy5U3FhASRLxT4ckOfZmKsAt1H46rwcwqYJGpe4kys/KDZShRZ4enL4Am1lkBjL
	Mh94mirAr/tScX3DXsJiApliJWBNb79F4zP4rskgC+MR7es5E7uLHqohy/O1f1S3bOFYlsj5N21
	r2bu6/xUExkZvKbQ6IA==
X-Google-Smtp-Source: AGHT+IHH6ZUYp4yQWN2YMFakZmCz4t5heWPmMTPxGuco+vUEUX8dD8PdstOQqlQBr86QeW72DQcVrw==
X-Received: by 2002:a17:902:ecd1:b0:223:35cb:e421 with SMTP id d9443c01a7336-2296c86c830mr5478745ad.49.1743553154601;
        Tue, 01 Apr 2025 17:19:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e2230dsm9604317b3a.40.2025.04.01.17.19.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 17:19:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <84d37c25-197b-44b4-b181-f71f5e8b81d8@roeck-us.net>
Date: Tue, 1 Apr 2025 17:19:12 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: max34451: Workaround for lost page
To: William Kennington <william@wkennington.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20250401220850.3189582-1-william@wkennington.com>
 <5a602ffc-5cbb-4f39-b815-545f3f1f4c98@roeck-us.net>
 <CAD_4BXgzvFavEcfhY5_BEi9y6pK0wJ1q4oqFYC5ctP53c57=wg@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAD_4BXgzvFavEcfhY5_BEi9y6pK0wJ1q4oqFYC5ctP53c57=wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/1/25 15:55, William Kennington wrote:
> On Tue, Apr 1, 2025 at 3:52 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 4/1/25 15:08, William A. Kennington III wrote:
>>> When requesting new pages from the max34451 we sometimes see that the
>>> firmware doesn't update the page on the max34451 side fast enough. This
>>> results in the kernel receiving data for a different page than what it
>>> expects.
>>>
>>> To remedy this, the manufacturer recommends we wait 50-100us until
>>> the firmware should be ready with the new page.
>>>
>>> Signed-off-by: William A. Kennington III <william@wkennington.com>
>>> ---
>>>    drivers/hwmon/pmbus/max34440.c | 7 +++++++
>>>    1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
>>> index c9dda33831ff..ac3a26f7cff3 100644
>>> --- a/drivers/hwmon/pmbus/max34440.c
>>> +++ b/drivers/hwmon/pmbus/max34440.c
>>> @@ -12,6 +12,7 @@
>>>    #include <linux/init.h>
>>>    #include <linux/err.h>
>>>    #include <linux/i2c.h>
>>> +#include <linux/delay.h>
>>>    #include "pmbus.h"
>>>
>>>    enum chips { max34440, max34441, max34446, max34451, max34460, max34461 };
>>> @@ -241,6 +242,12 @@ static int max34451_set_supported_funcs(struct i2c_client *client,
>>>                if (rv < 0)
>>>                        return rv;
>>>
>>> +             /* Firmware is sometimes not ready if we try and read the
>>
>> This is not the networking subsystem. Standard multi-line comments, please.
> 
> Okay, let me fix that.
> 
>>
>>> +              * data from the page immediately after setting. Maxim
>>> +              * recommends 50-100us delay.
>>> +              */
>>> +             fsleep(50);
>>
>> I would suggest to wait 100uS to be safe. The function is only called during probe,
>> so that should be ok.
> 
> Yeah, I don't think they did strenuous measurement of these values on
> their end. We have been using this patch for 4-5 years now with
> seemingly good robustness on the 50us value. I just pulled up an old
> email from the vendor that gives this context.
> 
>>
>> Is this a generic problem with this chip when changing pages ?
> 
> I believe that is the case, but this patch is pretty old at this
> point. Is there somewhere to add in quirks for such chips that would
> allow us to build in such a delay?
> 

So far we only have delays for all accesses and for write operations.
See access_delay and write_delay in struct pmbus_data. If the problem
only affects page changes, we might have to add page_change_delay or
something similar. Alternatively, maybe we could just set write_delay.
If the chip has trouble with page changes, it might well be that it has
trouble with write operations in general.

Thanks,
Guenter

