Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C5510E9;
	Wed, 16 Apr 2025 22:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744843163; cv=none; b=PhNRTAQ2/U8asIc+53lOUEoErebbkNgZHze4j/eV0DDwltSIWLWmjcHDi5u96TY5R9TDiHOnQ7Kgc3GIYQk6JQiXuIsjvljTJ/WoKkfybLHj/gDESScbN4HmlSN6mV7fyOIsNJ8ADbl9pjbWYWgSgrfQ7WrgdCwS2ogRdChfiSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744843163; c=relaxed/simple;
	bh=0ywOkpmSZy7QtERVDSIovJBSJd0Y/wXSpooai/mQx/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ei05XMI1Bz5gv3mXi7cFuWbK7dbbHGAcAJqOPtU8PfVKWCOnd0AyZdefPtjLBdEq6kpSV4M55NvBuwV0trYFhXgqagRqvhJyMgZbfNpAbv6RqWHMtPbHNCoZkgu0GLuFb2V0ZvAFjgoTiV+4NEeeR2gXv3Oq0x+FXdn5zFtBmF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lk50EdKr; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lk50EdKr"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7398d65476eso146475b3a.1;
        Wed, 16 Apr 2025 15:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744843160; x=1745447960; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Di+6RrXPMua2n5HMdjgC2sjgj2KIsJT0GcUG/FHGyWg=;
        b=lk50EdKrGToCrtm8bcDwKxKrQD7u+8gYw0nz8QFkziBcMoouR7J7tfuRiOESOdx3Rg
         pan2ep4kZymqD+msb8R26S8Q8Q9bcHbhpcE7duBC7so6WcfesYXaMej7e8J6aNUMw613
         nI1TvHV9GO3JBs55NdmAWFFdKfF8JVcIYBHz3JB03BJ/3K4eFJD0P6oU8xaol6FLH+V9
         XM1Xau9rlGzo/fbHataoLp2VVZslP+u4dhVlw7Zp0Rhn3wXtgsVSQb125x8Unw8ymqZu
         /fkErgjnkirvirHiZ3fOgZggdVVWUJgdbU0+A5dLSUAXO3vKr5MVkvFpH/0YClimnk/S
         RDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744843160; x=1745447960;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Di+6RrXPMua2n5HMdjgC2sjgj2KIsJT0GcUG/FHGyWg=;
        b=W2Ckt1mBUjdib/ztrN8RjMGISSQVTRAoIhwGs+ao1o3wDeSUrfMoIoKSqYEVk4DrQh
         c/D5LLIwcrFais3hGN2sK3lvOpZgwfzhwIrbVL5n/tE8JjWoec/lHRuP1zldFI2ZZ72M
         uz0s/rb8I7sOeElzNNMSZ4LghEI+WxRAsYOBAWQy00UFrR3gd3I6ejE6i9rjtwELOtdZ
         us8ddacYB5u6mB4145NEY17SWhhvtVnZ47V8oA0w/G0WtWDdF6bWu6oOjeQsu/wbwZ5b
         z0RqkjMYZmYmreYQ2qnmHD1VkPGPzQwJdyU/u/LJot74Ji0Lmu+tbp8SlCKcMcT6/YM4
         aHRA==
X-Forwarded-Encrypted: i=1; AJvYcCW1KM0LoU+w6rJ8zJTov6ulu8tTDReOpnyKuhuZcQrBLkrPX37CVAld7aGiXqiXIQHLAZIgwLMHzxv5z4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyac1tZwXDE172kY86WstcjuUkdp2G2Jx69KHCEbN4TxLCrWDXt
	Ti99RepYM+mnYrkGJmUOu3+aKZnZJq9QeCypKPcA8WfWX2SYAEwbW6pR3g==
X-Gm-Gg: ASbGncuAGSfCc6dMtmKJKYnl5Bml/nhC9kV9qU6ibU+B/gj/mpJA+wHreWl3lbIrMXf
	XMm5yD01aVvxKEMVgwx39+Ab/5+QGEabRZ3PjTkFL/LsHl3Hlvn7T1Mj5ftz8qrwUyv7+oM+KX/
	pF3ZcYNZRKsAxEwN2S/pIs/mPw5+kdsARGeGrboQMNSs9s+N9xHJmtPx8y+LkCRaf3UdWJJqBIL
	EoPMC3gKCdL7WbPmlKBiZfkl6tFMmKiOmwd5iedhHhxqw0ahlR1vGGPYiuyt3SG57cO1G/mn7xw
	tXQ3lNqCcHaOSoMd3IqA29/6qimPXNcsremg8udVwqnrdd8ICuwBGGIIfk+JrD9X/L6LXbBeR2F
	ZAGhK3+1+5S76nw==
X-Google-Smtp-Source: AGHT+IFuCCSXFvoFhMreSQd0DEHVwTsEvcp0YeLQlNe0ZZsZTT5kLoxK340mBNQHrXjJTwv3gWowZQ==
X-Received: by 2002:a05:6a20:4322:b0:201:8a06:6e3b with SMTP id adf61e73a8af0-203be006cb1mr884687637.9.1744843159690;
        Wed, 16 Apr 2025 15:39:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c6059sm11427957b3a.51.2025.04.16.15.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 15:39:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <acf31929-5d13-4fc5-b370-ab7fc5062455@roeck-us.net>
Date: Wed, 16 Apr 2025 15:39:17 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (spd5118) restrict writes under SPD write
 protection
To: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>,
 Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250416-for-upstream-spd5118-spd-write-prot-detect-v1-0-8b3bcafe9dad@canonical.com>
 <20250416-for-upstream-spd5118-spd-write-prot-detect-v1-2-8b3bcafe9dad@canonical.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250416-for-upstream-spd5118-spd-write-prot-detect-v1-2-8b3bcafe9dad@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/25 23:46, Yo-Jung (Leo) Lin wrote:
> On some platforms, SPD Write Protection for the SMBus controller may be
> enabled. For the i801 family, this will forbid writing data to devices
> residing on addresses from 0x50 to 0x57. This may lead to the following
> issues:
> 
>    1) Writes to the sensor hwmon sysfs attributes will always result in
>       ENXIO.
> 
>    2) System-wide resume will encounter errors during regcache sync back,
>       resulting in the following messages during resume:
> 
>       kernel: spd5118 1-0050: Failed to write b = 0: -6
>       kernel: spd5118 1-0050: PM: dpm_run_callback(): spd5118_resume [spd5118] returns -6
>       kernel: spd5118 1-0050: PM: failed to resume async: error -6
> 

Missing:

3) NVMEM access will fail

> To address this, check if the sensor can be written to at probe, and bypass
> write-related functions if writing to the sensor is not possible.
> 
> Signed-off-by: Yo-Jung (Leo) Lin <leo.lin@canonical.com>
> ---
>   drivers/hwmon/spd5118.c | 31 +++++++++++++++++++++++++++++--
>   1 file changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index 3cb2eb2e0227..9dd5342c31dd 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -75,6 +75,7 @@ static const unsigned short normal_i2c[] = {
>   struct spd5118_data {
>   	struct regmap *regmap;
>   	struct mutex nvmem_lock;
> +	bool write_protected;
>   };
>   
>   /* hwmon */
> @@ -284,7 +285,7 @@ static umode_t spd5118_is_visible(const void *_data, enum hwmon_sensor_types typ
>   	case hwmon_temp_lcrit:
>   	case hwmon_temp_crit:
>   	case hwmon_temp_enable:
> -		return 0644;
> +		return data->write_protected ? 0444 : 0644;
>   	case hwmon_temp_min_alarm:
>   	case hwmon_temp_max_alarm:
>   	case hwmon_temp_crit_alarm:
> @@ -499,7 +500,7 @@ static const struct regmap_range_cfg spd5118_regmap_range_cfg[] = {
>   	},
>   };
>   
> -static const struct regmap_config spd5118_regmap_config = {
> +static struct regmap_config spd5118_regmap_config = {
>   	.reg_bits = 8,
>   	.val_bits = 8,
>   	.max_register = 0x7ff,
> @@ -563,6 +564,21 @@ static int spd5118_init(struct i2c_client *client)
>   	return 0;
>   }
>   
> +static bool spd5118_write_protected(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	int mode = 0;
> +	int err = 0;

Both initializations are unnecessary.

> +
> +	mode = i2c_smbus_read_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE);
> +	if (mode < 0)
> +		dev_warn(dev, "Failed to read MR11: %d", mode);
> +
> +	err = i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE, mode);
> +

That would try to write the error back if MR11 can not be read, which would be
a bad idea. If the register is not even readable, being able to write it is of
secondary concern.

> +	return (err < 0);

I think this requires a better means to determine if the address range is write
protected. The above is just a wild guess, after all.

Isn't this already handled somehow for DDR4 nvmem (ee1004) ? That has ultimately
the same problem because ee1004 devices can not be accessed if the i2c address
range is write protected.

> +}
> +
>   static int spd5118_probe(struct i2c_client *client)
>   {
>   	struct device *dev = &client->dev;
> @@ -580,6 +596,11 @@ static int spd5118_probe(struct i2c_client *client)
>   	if (!data)
>   		return -ENOMEM;
>   
> +	if (spd5118_write_protected(client)) {
> +		data->write_protected = true;
> +		spd5118_regmap_config.cache_type = REGCACHE_NONE;
> +	}
> +

This is insufficient, and overwriting spd5118_regmap_config is not a good idea.
It should be a completely separate configuration which does not list any writeable
registers. I also don't see the value in dropping register caching entirely.

However, even that is insufficient: The driver relies on the register range
being writeable. It is not immediately visible, but the regmap code writes
MR11 to select the nvmem page. If this fails, the entire driver is unusable.
At the very least nvmem access would have to be disabled. However, if the ROM
monitor left the chip in read-only state and had set the page to a value != 0
(I have seen that with some motherboards), temperature monitoring would not work
either at least for memory with spd chips from manufacturers who took the
specification literally (such as Renesas).

That does not apply if the chip is programmed in 16-bit mode (which is not
currently supported), making handling the situation even more complicated.

I think that drivers/i2c/busses/i2c-i801.c should detect if the address space
is write protected, and the driver should not even try to instantiate if that
is the case.

_If_ the driver is to be instantiated, the write protect flag should be passed
to the driver from the instantiating code, for example with a device property.

>   	regmap = devm_regmap_init_i2c(client, &spd5118_regmap_config);
>   	if (IS_ERR(regmap))
>   		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed\n");
> @@ -638,6 +659,9 @@ static int spd5118_suspend(struct device *dev)
>   	u32 regval;
>   	int err;
>   
> +	if (data->write_protected)
> +		return 0;
> +
>   	/*
>   	 * Make sure the configuration register in the regmap cache is current
>   	 * before bypassing it.
> @@ -662,6 +686,9 @@ static int spd5118_resume(struct device *dev)
>   	struct spd5118_data *data = dev_get_drvdata(dev);
>   	struct regmap *regmap = data->regmap;
>   
> +	if (data->write_protected)
> +		return 0;
> +

suspend/resume support should be disabled completely in this situation
since it is very much pointless.

Worse, if the BIOS for some reason decides to select a different (non-zero)
page on resume, the driver would be completely inoperable after resume.
That is another argument for not instantiating it in the first place
if this is the case. The impact is just completely unpredictable.

Guenter

>   	regcache_cache_only(regmap, false);
>   	return regcache_sync(regmap);
>   }
> 

