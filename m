Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAB52AE68;
	Wed, 23 Apr 2025 03:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745379195; cv=none; b=UXikwT6rOlB+cevVu/h8BqvK5MTIlfe49alvIRtqrizmDVGGComiONCE/Tll4WCM8uqVbobKtYR1yp9MjMMz/YFB6g+rXajTzRpvOthcogfnWqbat8hrbrH/YnW5C8Kfx6sjVyg9ZyHwmwTuTW9srO9pVvG1R2qWiP8/RU1FurA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745379195; c=relaxed/simple;
	bh=jS90rSc27ulInqTRRu2mTYdMWqvV/HxS/UoBPrHlXs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a9YHxn5L86Du2AQVQ4O3LdJIfaCoB9zfkTX7ZLQcXwyP9RgIZisvxgPFPmfMPObJxhhMdcVRI4QBtlXJ/pVJ6IUnP/PHIeHtZxIzvWy40ieDa6AenO1EtQn8qmFkxjJSaVl3WeBNlfN35cN1QbjGedJBxwPlxiiG/UE1RDCXbwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCx4BCO4; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCx4BCO4"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22401f4d35aso65610725ad.2;
        Tue, 22 Apr 2025 20:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745379192; x=1745983992; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=UgsEp7YJLDJNup4ewZXGwa90P9H9nwXIJWvTvQpNZ9o=;
        b=MCx4BCO4UPRamXrtC34xpA9/kon3xQB0bULNAOtTNDYzMZCD53B8xX7tN6z7wb0pzh
         KJFc9wRR+23SJq1g83WE5fcJuhD3EPQz0+r/ibom2uRP4H2TgIB79lyghHfzGfg39NEi
         U4v+QHvaAyaNfvZgv/awMHNfcrazpWclOgCjuZlKrT8sLfkezh99upZb03vSdyCFlz0K
         mBdbIugr04mFR+9gIEs9wq2kbiY2etzjj8Y8HWFG0CeBWC1/P8YgWL42Yyfdfk8OtBJY
         Zcq4Lta44rzepuymZz+bhSXR1zvtJK8I6OSDVDf2rsdId9ediTsE50gZPHxC3uWzP8KE
         io/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745379192; x=1745983992;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UgsEp7YJLDJNup4ewZXGwa90P9H9nwXIJWvTvQpNZ9o=;
        b=KipIRAtxjh5FbnftSSEZ5fnaIyqQzi3mbei+OH1b6SDtrYBCJ9myQl0BMDTgeGe1nx
         4cWO3tCrQGX0AvpUIYP3w8XVRju4OHlIsCAPBUKMQ7hz9/J/l5scDJB94lmBtRJvIw4W
         bphwbY8BXzFLfFTx6GyYKGXhMfQUo3Z3iW1kAjSLEk1uxHa01WctoqkbF6hXhBiSr8OR
         acVbWpU8FOBHW90P9aNAqw0g8++OWWWypMyg5KbKSXG026/mHrw2M+7GZhrdy8zVnmA5
         JcktqOfZal0Z2xzfoiGZH5QCBGXXlyhwZLvLxTp+66mpU2oXQ9Rg9r+KXCg3beXH6G9s
         17OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFu4Yb5QrvkGj5wD9csjyQ4Y7ksdTjKRuqx3unWxS1izE8qiODgfToXQ/tarw7uHCfOQdyo05ILN4WlA==@vger.kernel.org, AJvYcCXjyG9x3fKvz9RsuHvnPTWKx2RbYSKftSEr0ec7EP0Kjm1kprNC9F9nhBU7SEV0Xy9py6NCRayNdP42OIV5@vger.kernel.org
X-Gm-Message-State: AOJu0YzMlob0ybIPXdn6TK9H0UUFPBv7Rb6o/oYtOLm3HemVfXFgseDB
	DluX9HbMHGArzi6vPvviS6A/CczSJfPQbF6HhFh9O6OwCPjkb6Km
X-Gm-Gg: ASbGnctmrANDaynxAOs2w6fCrMWSqKQ8hR7tgS/DvdW849Z3zlLR8ZCtgUyNUCvEq9F
	2rN7C9qDn1S8jPeIbNUhztzfQiTNxJJe/VpUEpbTnPgq1hMYB8msjY98wSmWdTZTGxArQ7c5jL4
	jwHwY7GtnTwNAwuPOFHOiJ9Heshu2kXS62y9pdGjXMFxqPoXWeLdPQleJmC95rvOhBPdAPR3npV
	W19VJsCFz2VgguISH/gLZDSPZhvbwT1VnNUeNhXkYjvdVmfYEjG6/0W3/sWBaT2qfTyMLSlwGkU
	v3E1LlGoIygFCqZEOOuK/pm6oDeQQ4uZoCP22PXH+GYHezJUMm7ulHJE6Mm6K5N/faJLWpgE7Oc
	wOW0jprKrzRmyDA==
X-Google-Smtp-Source: AGHT+IHrYIaYOC1Q1v0Lsnf9cEIHgTwUwsgl2dakYyuxJi3EwFwlXyN933Xa128sIWFour4lLQ7ywA==
X-Received: by 2002:a17:903:40cb:b0:227:e82b:b585 with SMTP id d9443c01a7336-22c53583228mr219459095ad.20.1745379192353;
        Tue, 22 Apr 2025 20:33:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bda70esm93895605ad.15.2025.04.22.20.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 20:33:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e05a1228-8b6b-491e-8b2a-925319cb50a2@roeck-us.net>
Date: Tue, 22 Apr 2025 20:33:10 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (spd5118) restrict writes under SPD write
 protection
To: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250416-for-upstream-spd5118-spd-write-prot-detect-v1-0-8b3bcafe9dad@canonical.com>
 <20250416-for-upstream-spd5118-spd-write-prot-detect-v1-2-8b3bcafe9dad@canonical.com>
 <acf31929-5d13-4fc5-b370-ab7fc5062455@roeck-us.net>
 <CABscksOHUdS2jJ2PZQXymheLuX25spxYVGX5Bu0YJxEybvYw+Q@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CABscksOHUdS2jJ2PZQXymheLuX25spxYVGX5Bu0YJxEybvYw+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/22/25 19:25, Yo-Jung (Leo) Lin wrote:
> On Thu, Apr 17, 2025 at 6:39 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 4/15/25 23:46, Yo-Jung (Leo) Lin wrote:
>>> On some platforms, SPD Write Protection for the SMBus controller may be
>>> enabled. For the i801 family, this will forbid writing data to devices
>>> residing on addresses from 0x50 to 0x57. This may lead to the following
>>> issues:
>>>
>>>     1) Writes to the sensor hwmon sysfs attributes will always result in
>>>        ENXIO.
>>>
>>>     2) System-wide resume will encounter errors during regcache sync back,
>>>        resulting in the following messages during resume:
>>>
>>>        kernel: spd5118 1-0050: Failed to write b = 0: -6
>>>        kernel: spd5118 1-0050: PM: dpm_run_callback(): spd5118_resume [spd5118] returns -6
>>>        kernel: spd5118 1-0050: PM: failed to resume async: error -6
>>>
>>
>> Missing:
>>
>> 3) NVMEM access will fail
>>
>>> To address this, check if the sensor can be written to at probe, and bypass
>>> write-related functions if writing to the sensor is not possible.
>>>
>>> Signed-off-by: Yo-Jung (Leo) Lin <leo.lin@canonical.com>
>>> ---
>>>    drivers/hwmon/spd5118.c | 31 +++++++++++++++++++++++++++++--
>>>    1 file changed, 29 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
>>> index 3cb2eb2e0227..9dd5342c31dd 100644
>>> --- a/drivers/hwmon/spd5118.c
>>> +++ b/drivers/hwmon/spd5118.c
>>> @@ -75,6 +75,7 @@ static const unsigned short normal_i2c[] = {
>>>    struct spd5118_data {
>>>        struct regmap *regmap;
>>>        struct mutex nvmem_lock;
>>> +     bool write_protected;
>>>    };
>>>
>>>    /* hwmon */
>>> @@ -284,7 +285,7 @@ static umode_t spd5118_is_visible(const void *_data, enum hwmon_sensor_types typ
>>>        case hwmon_temp_lcrit:
>>>        case hwmon_temp_crit:
>>>        case hwmon_temp_enable:
>>> -             return 0644;
>>> +             return data->write_protected ? 0444 : 0644;
>>>        case hwmon_temp_min_alarm:
>>>        case hwmon_temp_max_alarm:
>>>        case hwmon_temp_crit_alarm:
>>> @@ -499,7 +500,7 @@ static const struct regmap_range_cfg spd5118_regmap_range_cfg[] = {
>>>        },
>>>    };
>>>
>>> -static const struct regmap_config spd5118_regmap_config = {
>>> +static struct regmap_config spd5118_regmap_config = {
>>>        .reg_bits = 8,
>>>        .val_bits = 8,
>>>        .max_register = 0x7ff,
>>> @@ -563,6 +564,21 @@ static int spd5118_init(struct i2c_client *client)
>>>        return 0;
>>>    }
>>>
>>> +static bool spd5118_write_protected(struct i2c_client *client)
>>> +{
>>> +     struct device *dev = &client->dev;
>>> +     int mode = 0;
>>> +     int err = 0;
>>
>> Both initializations are unnecessary.
>>
>>> +
>>> +     mode = i2c_smbus_read_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE);
>>> +     if (mode < 0)
>>> +             dev_warn(dev, "Failed to read MR11: %d", mode);
>>> +
>>> +     err = i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE, mode);
>>> +
>>
>> That would try to write the error back if MR11 can not be read, which would be
>> a bad idea. If the register is not even readable, being able to write it is of
>> secondary concern.
>>
>>> +     return (err < 0);
>>
>> I think this requires a better means to determine if the address range is write
>> protected. The above is just a wild guess, after all.
> 
> For now I'll probably approach this from the i801 side (as later part
> of your comments suggest), and skip the device instantiation if write
> protection is enabled.
> 
>>
>> Isn't this already handled somehow for DDR4 nvmem (ee1004) ? That has ultimately
>> the same problem because ee1004 devices can not be accessed if the i2c address
>> range is write protected.
> 
>>From ee1004_probe_temp_sensor() I think that the temperature sensor on
> ee1004 (jc42) uses address 0x18, and the ee1004 itself at 0x5*
> addresses seems to be just an read-only eeprom and has no pm
> operations. That's probably why it evades the issue of write
> disabling.
> 

They also have multiple pages, but it looks like they use I2C addresses outside
the 50..57 rage to select the current page. So, yes, they should be fine.

>>> +}
>>> +
>>>    static int spd5118_probe(struct i2c_client *client)
>>>    {
>>>        struct device *dev = &client->dev;
>>> @@ -580,6 +596,11 @@ static int spd5118_probe(struct i2c_client *client)
>>>        if (!data)
>>>                return -ENOMEM;
>>>
>>> +     if (spd5118_write_protected(client)) {
>>> +             data->write_protected = true;
>>> +             spd5118_regmap_config.cache_type = REGCACHE_NONE;
>>> +     }
>>> +
>>
>> This is insufficient, and overwriting spd5118_regmap_config is not a good idea.
>> It should be a completely separate configuration which does not list any writeable
>> registers. I also don't see the value in dropping register caching entirely.
>>
>> However, even that is insufficient: The driver relies on the register range
>> being writeable. It is not immediately visible, but the regmap code writes
>> MR11 to select the nvmem page. If this fails, the entire driver is unusable.
>> At the very least nvmem access would have to be disabled. However, if the ROM
>> monitor left the chip in read-only state and had set the page to a value != 0
>> (I have seen that with some motherboards), temperature monitoring would not work
>> either at least for memory with spd chips from manufacturers who took the
>> specification literally (such as Renesas).
>>
>> That does not apply if the chip is programmed in 16-bit mode (which is not
>> currently supported), making handling the situation even more complicated.
>>
>> I think that drivers/i2c/busses/i2c-i801.c should detect if the address space
>> is write protected, and the driver should not even try to instantiate if that
>> is the case.
>>
>> _If_ the driver is to be instantiated, the write protect flag should be passed
>> to the driver from the instantiating code, for example with a device property.
> 
> Although I'll try not instantiate the device at all for now, in case
> that there are some users that still think reading DRAM temperature is
> helpful, if I were to add a device property here at runtime (e.g. in
> i2c_register_spd), should I also update its devicetree binding?
> 

I don't think so - the device property would not be visible in devicetree
and only be used internally.

>>
>>>        regmap = devm_regmap_init_i2c(client, &spd5118_regmap_config);
>>>        if (IS_ERR(regmap))
>>>                return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed\n");
>>> @@ -638,6 +659,9 @@ static int spd5118_suspend(struct device *dev)
>>>        u32 regval;
>>>        int err;
>>>
>>> +     if (data->write_protected)
>>> +             return 0;
>>> +
>>>        /*
>>>         * Make sure the configuration register in the regmap cache is current
>>>         * before bypassing it.
>>> @@ -662,6 +686,9 @@ static int spd5118_resume(struct device *dev)
>>>        struct spd5118_data *data = dev_get_drvdata(dev);
>>>        struct regmap *regmap = data->regmap;
>>>
>>> +     if (data->write_protected)
>>> +             return 0;
>>> +
>>
>> suspend/resume support should be disabled completely in this situation
>> since it is very much pointless.
>>
>> Worse, if the BIOS for some reason decides to select a different (non-zero)
>> page on resume, the driver would be completely inoperable after resume.
>> That is another argument for not instantiating it in the first place
>> if this is the case. The impact is just completely unpredictable.
> Wouldn't this already be catched spd5118_init() function, where the
> driver would attempt to overwrite the MR11, and the device won't even
> probe successfully if that fails?
> 
Yes, you are correct, but it is still unpredictable: Depending on what the BIOS
is doing, the page may be set to different values (for example, it might depend
on the type of reboot - soft, hard, or powercycle).

Thanks,
Guenter


