Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CD71F8730;
	Thu, 24 Apr 2025 22:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745534140; cv=none; b=dzD3XeUh253pKD5Ien+g/Zobk33S/sCKv2otahbnoyZNKr5tVLhbGRzH+Vwc/pCGtrvMJqc+8Wd6A4FIP+w4oK0B1lPyz4IZx7Lymp0XJT6S7ICKFpgCoIqQta4miWKmCP/SE6vWlAisdXs6j0nGQMZOGB94dnLFPt1XDmtg6iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745534140; c=relaxed/simple;
	bh=MLVolz7xk13M9MhNqOr5SrRTUcG5GkLN8vAM2KJiSNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TvtXkhR5xqaSUOMtxVwzpNk24hmXyMx1uKvJQXER6wd7JZnNKjKhOqNU3x41rkWZyd9UB8uPEonF/asRjJi13i0n7GGCQGISkL9/HRJUm8Zb0nuGsEZLndQV+L0W39evBST3EZSNx8t9D0rZn5Lmqc63JaWhsroP8IgKaIkIHcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWWNgy++; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWWNgy++"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2295d78b433so18618985ad.2;
        Thu, 24 Apr 2025 15:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745534138; x=1746138938; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=piRcXVq7sMzE5VR64xTnV64DS5lFgHG+6gelj4V0wvQ=;
        b=GWWNgy++MN6Z+l9Kajt+3Fc792sKq/ozfMax2W/38D8NygwSctZVmXC+7SFJU8U071
         +SJRNBMQy5SiEfP4TA5Mpl3aDFX5g66qh0528xx7ysG1DlrY8rGZN9toSEvczfXuNoj+
         dFfX5FFlA6YGnqY3aHNaBtROKPSKI1cA6VBl10MagydJGSQ9y9uZmSscE6vEKSZs/0h+
         Zb6MhIDLxSXDZSyoBpKm4eAtH8MxqVo2ZHdBVIbfde1V0sOhxPUH+woui+2djT05kfzU
         4DJEakyvbOM5zg+Ig4tDK+Fc6b6B0pLLosop4gtA85UUfEY3SuqADMoFQZC2oomJbqsj
         i+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745534138; x=1746138938;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=piRcXVq7sMzE5VR64xTnV64DS5lFgHG+6gelj4V0wvQ=;
        b=h3uReva7uWW+cGnAUwWWN9lmVRzI+nmC1ptPaCKqfcFnETOdRVr7NPabetL8Gamvdb
         ia8Z5HxoiGx/BaRI9F3/dOXQCSF4X+IgKWg+VeVqNRC/gtuBaMBWDgNhTEBa7bmajJel
         iE0Oxb+g0NXWDhSxjObi+hdao+UiqE9K+x6Tqr7i1EJAty5OIdqAg/kxuvzHTOR09dV2
         rEfM3reBkIbJTKtePGkaKExI/yNpeSEsnZ2lCFsdwu39J1+d7nOG/Q0MhlUAqSQmvDp5
         LLh5OW1KC5zv43w5C0jamzqG4pop2dOlj8ls/eiPOAZJEfk2LJayn0tq0zzl+KPJOWXI
         RiOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeHkNanVIsxoCTpE5WJ2RW2kudDnSyLF0DiMr3p4WKdu+QrU5f6koGRYqPCxQNr2sRHMj0udyuvYhBPqot@vger.kernel.org, AJvYcCXid/7gIhUzHo6/6q87O9G1UZfMS944B+yukG0MJyARRfMb0EYhQLT6gQ3v3QCGrfbczNtzpcddH4JhYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXw5JlMlMWaiHwy73Fu5a00l/UKHbbxlVsh1PtTKzbz5UOqu6N
	PUF6TJuXa4WMbohTmx5cdZqh3aQPFV7OsXsViDFojkIhDj3mH0H2
X-Gm-Gg: ASbGncuUZQlv3YtYzpstiBBe6xAD1ZzU6d8lokMvVxS0xlns/D3uikMV5xd0qJpZ8qi
	y9gn/1v7DPVOi61+pBU9GvvN5ltnE0nQgmJqHI1J/xCR0OhD8SeOeLXyzZHszyNgpcW50KDZdMJ
	mlQdpfNr20yaM7tnoOf6uTyW68tFzPlXtRK6oKhetkQO82vJuriDYGdUfhU6McLGpX042FXB2oV
	qwKy4VmgNSBqJv9L7hju7DUTiscWCg9dCZBSyZgtDk7/u4SRQJoRoKdn9YiRGNcD+QrIO8Xff67
	Ud4KoqjS++gj9VK7FzdWSpAoTU8y6hUJo3/pgPGGRwbD2/ebFkaHbhHzMSwUhR1pCwbqMXshspH
	g/8dm2AeZtEpFcA==
X-Google-Smtp-Source: AGHT+IF2BOZPaiyXen+OZfliYlqLibOIJlWawICtf7pjpxTaxc+vSQv4LbYQ5ubZQ1zyG5IXCrRf8w==
X-Received: by 2002:a17:902:e805:b0:223:5de7:6c81 with SMTP id d9443c01a7336-22dbf5f34f9mr543135ad.27.1745534137647;
        Thu, 24 Apr 2025 15:35:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dc2119sm19029765ad.91.2025.04.24.15.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 15:35:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c79317ca-27ba-48bc-8245-ff6d1eb0cba9@roeck-us.net>
Date: Thu, 24 Apr 2025 15:35:35 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) check sensor index in
 read_string()
To: Eugene Shalygin <eugene.shalygin@gmail.com>,
 Alexei Safin <a.safin@rosa.ru>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20250424202654.5902-1-a.safin@rosa.ru>
 <CAB95QAQ7P=sET9nxtp9OQ-kqosHXTcyBKvqwo_aDFuav=OVoEA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAB95QAQ7P=sET9nxtp9OQ-kqosHXTcyBKvqwo_aDFuav=OVoEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/25 13:39, Eugene Shalygin wrote:
> Hi,
> 
> maybe return the value of sensor_index, which already contains the
> error code, rather than EINVAL?
> 

Yes. The error is theoretic since attributed which are not supported
will be filtered out in asus_ec_hwmon_is_visible(), but the error return
from find_ec_sensor_index() should not be replaced. Also, returning
-EINVAL is just plain wrong.

FWIW, this should really be WARN_ONCE() instead of just an error
return because it indicates a programming error. This also applies
to the same check in asus_ec_hwmon_read().

Guenter

> Eugene
> 
> On Thu, 24 Apr 2025 at 22:27, Alexei Safin <a.safin@rosa.ru> wrote:
>>
>> Prevent a potential invalid memory access when the requested sensor
>> is not found.
>>
>> find_ec_sensor_index() may return a negative value (e.g. -ENOENT),
>> but its result was used without checking, which could lead to
>> undefined behavior when passed to get_sensor_info().
>>
>> Add a proper check to return -EINVAL if sensor_index is negative.
>>
>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>
>> Fixes: d0ddfd241e57 ("hwmon: (asus-ec-sensors) add driver for ASUS EC")
>> Signed-off-by: Alexei Safin <a.safin@rosa.ru>
>> ---
>>   drivers/hwmon/asus-ec-sensors.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
>> index d893cfd1cb82..769725ea18db 100644
>> --- a/drivers/hwmon/asus-ec-sensors.c
>> +++ b/drivers/hwmon/asus-ec-sensors.c
>> @@ -839,6 +839,10 @@ static int asus_ec_hwmon_read_string(struct device *dev,
>>   {
>>          struct ec_sensors_data *state = dev_get_drvdata(dev);
>>          int sensor_index = find_ec_sensor_index(state, type, channel);
>> +
>> +       if (sensor_index < 0)
>> +               return -EINVAL;
>> +
>>          *str = get_sensor_info(state, sensor_index)->label;
>>
>>          return 0;
>> --
>> 2.39.5 (Apple Git-154)
>>
> 

