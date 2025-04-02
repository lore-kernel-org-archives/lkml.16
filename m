Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CBB238168;
	Wed,  2 Apr 2025 13:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743600885; cv=none; b=phHh3ZBa3gosQu1f9Ks6PDD8dcgXgcULpLKY9o9pQ46CHAyEYIblA1pcIfUq2+u6i1KyytjoED+zxlpdUYuEqI68dCGYhCZW4GBcLywzBBDndEcCdv9GX8JDznmaPEDKoz6358ntvThr5by583TCkStTwbD9RY5s5yFCobiAuKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743600885; c=relaxed/simple;
	bh=1Vvlfk1WR61JSY4I6mA0KbR0jL8QIxca3L6B0pHyd/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=diEF8UoxEfoqiSVdcl6Lj+MLQXMsVjsvCs5Oa5ywuz81hTlNfp1bfS4RPnK4iWa0MNChykAsA2hiVTixAbWHswucLjlfpJwNihY63ACwAy5OPcJ7OVckb55Zuh9N1dVrJALBlCw4p5sg9++3BD2hZpJGs8+Dwa2U8GaSZqr8emQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=USYAC7D9; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="USYAC7D9"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-73972a54919so121349b3a.3;
        Wed, 02 Apr 2025 06:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743600883; x=1744205683; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=oM4dIlENBzmCrkF/MVmHBr9o/bxamEKafWPRvKH+k5Q=;
        b=USYAC7D99epuAN6e8Y4FDZbOsmThebeQv47bmh4FL8ntQKQf0tLPSM+Ht1PwR4i12U
         xq5IRdD+bgL5kiUMgmvSm52cPwCtnK+c9FLO3mb3gVhGVuZUSNOZ3PJJpS4ZAHyUpRyZ
         uV1tF+keGwN4Cyaznb0sPxqMdV73/IXjI/IpK9FSFILmshVns0S6kFZu1++XE4/Ie1/R
         5MVJ3ql18jzhCRenAOHR6d3mjUNREeuPiqCPeAUlvavfVyNPU2taBininvz/ZTCPQD/g
         0roiKAHhUW9cUrkRhJyjdZcCZS57/QukdIqVKsz+0vBaO+BVhF+ytV1SGBmM8YAmgLDA
         QKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743600883; x=1744205683;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oM4dIlENBzmCrkF/MVmHBr9o/bxamEKafWPRvKH+k5Q=;
        b=NNpNhSxN12wsbhRy21WSHdtv7/mD/tcolAM0WPvEKxEFlJB+Zn8mpnS9cGyjiko9bq
         B3zaOs/vr2NBJxzz/bfoP5LW7ahJCMl4TbPr2fXhax0mBO0O3p5x873cBcZ/r+fKKLEl
         BYxAo5grQK7fvQarTN2kR2ZgX3AmdjDt6WZU435u5Wtl6iv3tOSBJQzIe0rY+nMV6FUK
         0qErAP2rLEzsVgzhyltZFwmoI314/wPBRMwJmYBaTrRY8RcWA+4D+MG2Wyf+BtTsJku0
         fmFtJ6gapttRmVso63ermXRFibx85ca03XCBx2HRB8urXI6GWrr2xuNnJzUk4UudBZ/W
         ZGug==
X-Forwarded-Encrypted: i=1; AJvYcCXRaJQIp7U700ba0Nwkf/x80BYeTCoKC3sfn16RBnjHIpSC4RqipANuMzJufaAgnbgMI8lCb9a26y7uvQ==@vger.kernel.org, AJvYcCXw40b+EWyK24hHARKaLhB0EfhYwpG8MDDyOS17P0+99OJ48laiOauKT9m315P3Ep1qC5+kIf7tZQLuJEJl@vger.kernel.org
X-Gm-Message-State: AOJu0YyFCldQc9fdEHGM1/uf8I2/G7pkVbdKjR4k7O7SxZgKg22aKilk
	g8aT4CAHlmYuTIPOLV5MGv0udJYTv3oSqCb/HgPAbYoPgJi7KeZZ
X-Gm-Gg: ASbGncuGqXQwBHwQoZaP2ysw5v3ypH3S5V5ZJntLPjf44f3j7tPw/OFuLxNPQjDWVZX
	z5PZj5c91tCB9PIVkXHkgH7cV+ojefz4K9KbCoOn+NGfBEWKBw2OYavGRm2vbKqe8e9e8kuZlBJ
	NROk07uU6DLxjmGOhPYdouRgTxP/0ZHYXXALeCz7yzwyhEmtis2lOLLc49gy9wPId8J6AJrIDqZ
	0DhKahBBqzUzEkcKHiR49VAR8PbS8Fl2Iotyps4l/YJf5SrykGkYUiGldYM3/75R669Pw9LGN7M
	PNpUAjjb7s3eT5xjc8Gy+j3luhW+awL9+DNo55qqhN8eOhd5+XEE8eUVfdbGonxiqAe6EBOsIIF
	5CUeN6KqN+utIy3JSPw==
X-Google-Smtp-Source: AGHT+IEIhvroKxYlDv/3ZMvAZuAXQz4vMLWwCVmGJDXd8YcRbaeyhMlDmhOD1GHhqpSudUbhmqouCQ==
X-Received: by 2002:a05:6a20:9f99:b0:1f5:80a3:b003 with SMTP id adf61e73a8af0-2009f7ee203mr25401787637.37.1743600882757;
        Wed, 02 Apr 2025 06:34:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73971069b62sm10871531b3a.112.2025.04.02.06.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 06:34:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ae38b526-520f-45ae-b9d3-7628058d56d8@roeck-us.net>
Date: Wed, 2 Apr 2025 06:34:41 -0700
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
 <84d37c25-197b-44b4-b181-f71f5e8b81d8@roeck-us.net>
 <CAD_4BXhUVRpNjORSHYiwhxXAGbAv5=4SYekWZhK+r9Wi=n5+Lw@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAD_4BXhUVRpNjORSHYiwhxXAGbAv5=4SYekWZhK+r9Wi=n5+Lw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/2/25 01:33, William Kennington wrote:
> On Tue, Apr 1, 2025 at 5:19 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 4/1/25 15:55, William Kennington wrote:
>>> On Tue, Apr 1, 2025 at 3:52 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>
>>>> On 4/1/25 15:08, William A. Kennington III wrote:
>>>>> When requesting new pages from the max34451 we sometimes see that the
>>>>> firmware doesn't update the page on the max34451 side fast enough. This
>>>>> results in the kernel receiving data for a different page than what it
>>>>> expects.
>>>>>
>>>>> To remedy this, the manufacturer recommends we wait 50-100us until
>>>>> the firmware should be ready with the new page.
>>>>>
>>>>> Signed-off-by: William A. Kennington III <william@wkennington.com>
>>>>> ---
>>>>>     drivers/hwmon/pmbus/max34440.c | 7 +++++++
>>>>>     1 file changed, 7 insertions(+)
>>>>>
>>>>> diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
>>>>> index c9dda33831ff..ac3a26f7cff3 100644
>>>>> --- a/drivers/hwmon/pmbus/max34440.c
>>>>> +++ b/drivers/hwmon/pmbus/max34440.c
>>>>> @@ -12,6 +12,7 @@
>>>>>     #include <linux/init.h>
>>>>>     #include <linux/err.h>
>>>>>     #include <linux/i2c.h>
>>>>> +#include <linux/delay.h>
>>>>>     #include "pmbus.h"
>>>>>
>>>>>     enum chips { max34440, max34441, max34446, max34451, max34460, max34461 };
>>>>> @@ -241,6 +242,12 @@ static int max34451_set_supported_funcs(struct i2c_client *client,
>>>>>                 if (rv < 0)
>>>>>                         return rv;
>>>>>
>>>>> +             /* Firmware is sometimes not ready if we try and read the
>>>>
>>>> This is not the networking subsystem. Standard multi-line comments, please.
>>>
>>> Okay, let me fix that.
>>>
>>>>
>>>>> +              * data from the page immediately after setting. Maxim
>>>>> +              * recommends 50-100us delay.
>>>>> +              */
>>>>> +             fsleep(50);
>>>>
>>>> I would suggest to wait 100uS to be safe. The function is only called during probe,
>>>> so that should be ok.
>>>
>>> Yeah, I don't think they did strenuous measurement of these values on
>>> their end. We have been using this patch for 4-5 years now with
>>> seemingly good robustness on the 50us value. I just pulled up an old
>>> email from the vendor that gives this context.
>>>
>>>>
>>>> Is this a generic problem with this chip when changing pages ?
>>>
>>> I believe that is the case, but this patch is pretty old at this
>>> point. Is there somewhere to add in quirks for such chips that would
>>> allow us to build in such a delay?
>>>
>>
>> So far we only have delays for all accesses and for write operations.
>> See access_delay and write_delay in struct pmbus_data. If the problem
>> only affects page changes, we might have to add page_change_delay or
>> something similar. Alternatively, maybe we could just set write_delay.
>> If the chip has trouble with page changes, it might well be that it has
>> trouble with write operations in general.
>>
> 
> So I did some digging and asked the original contributors to the
> patch. It would appear that it's specifically an issue with this IC
> around page switches and not any arbitrary write command. There is an
> issue where it does not correctly respond to the second command issued
> after a PAGE switch occurs, if the commands come in too quickly. They
> believe it's an issue with max34451 (and other derivative ICs) not
> correctly clock stretching while the PAGE command is processed.
> 
> Let me know what approach you would prefer to take here. It seems like
> it would be most optimal to have a quirk specifically to delay
> commands after a PAGE.
> 

I think we should add page_change_delay to struct pmbus_data, plus its handling
in the pmbus core.

Thanks,
Guenter

