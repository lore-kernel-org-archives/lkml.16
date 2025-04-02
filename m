Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A501DFF0;
	Wed,  2 Apr 2025 22:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743632287; cv=none; b=Xr381T9m4SA2fETDHBkhK13sv8KkhndrSSkL+z56CwLYHYDFdHDWIVyYX6anUWST75/oIzNEh3irW0TQHuUhmHusWY6fKK71exZU6p2zr02ELIZJn77siZWO9j/nM1n4QwsB9pZDasN1L2w3vmB30mFJdqz0UFRvhfVQzcIHdc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743632287; c=relaxed/simple;
	bh=pT4UVKbYEfRyPNXPmld0py1Q8OAyzt7KckqJsTE4kCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P1mTKBITmI1XnCvJIJkRjcWJrt1ERb4r0Pn7jhdnpLbY7DZbuxXN3DxTfu9v3jYr704Pfg5Sn3g1mpLjR8rH1CfiIgx1ThSeUn9i/tRUHKnlPtO2vl5C59Z7e0BfpXAmv4fJku+aw2Y5h02hnTO1HHNDr26Nzyyws7ZKlV7Z4z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C65RtZJz; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C65RtZJz"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so188581b3a.2;
        Wed, 02 Apr 2025 15:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743632285; x=1744237085; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=l0qIJI6aAuZirA6X0j6WJKBAg6RpoyeAXY/gXUYvdTg=;
        b=C65RtZJzkqyTxcpEWAaunrCIWiIAynQ/M2PGOvzMBAWOxwso2bdnfDO5ypxrPFeAzo
         ToZ/k1/aOmjq8VGnzD1PEXuigo402lst0bOtSeZ1rGZYeqJA50yStUVWFlGwl7HuWeBM
         dTarGNIYAa6WsQivUS+6drOZi+uCkWZdobw6OB3OkVqgzFdjMYWdS6qLMCbNHybHI6+9
         hKDOa9oWgi6m/olQ8We7+AJNIF7o/4tV2Aja5ur4BPy4Zr/m9sMNdHoFNlvTPFkatuJd
         A2b8xDFnoVKMyHV3lICs5sNZ+1Kc2ikGXxnJlXouhl+M/nSkeoKECRkorgzleVgOhEfH
         RklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743632285; x=1744237085;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0qIJI6aAuZirA6X0j6WJKBAg6RpoyeAXY/gXUYvdTg=;
        b=RfP0tTTxV+CvFVUB9ypCEDIo4/mIr2exEPpA3oEMxlyCTZGT87qYMN6D6hoDt6VfPO
         smkb5hqTg8E/TLhBf5vfEMYf1m3ovBz5pQ5OlPsbU37sJimLUK6YYGh+GbbUbSqRjKDN
         pu8e2OkmEArU+Rzk6ymjAY/JefC91cJ+rFCCrr5/7epduDMIl1biOdY0EGX17JGJ+igQ
         wnNicVNqYNcPzzaQe08YY2MXLWpBvhuvpkIurUlvMLQkm5KKlkfAJhz70QunWmuSzrLG
         bnhslf25drxKvQktIFvCMZkxBa6ZpWVuQC3GuwJMzWrwI0EritfKisjkJje47QtpDpZw
         3RMA==
X-Forwarded-Encrypted: i=1; AJvYcCWnKdHa69MpZjplxftBkYuCUIFr9kNmXQRKZJYS3Dgf78mP7uo2qq+Wfb6Yv7GK3mWOn2UM8iYcTI1zMrs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhTCpWT05qwMjGf4Wwgo1S1HfOdAn3FaXYlgyiWdAD/74LvhZ+
	1bxwqBM6y2GEpqSltP5JjrBeC5KD14TFdJMcexf2gxz8T8ZNpd+5mt0Vyw==
X-Gm-Gg: ASbGnctpRKPGvDIComZ594T3GFaxIqg4RgfGyD0RGIAt1ucKvifBR03Bh0DDLvOX3G3
	DGQNV+5frE47XkGEW5y22n8/y0obzL4YLzzNpQgcjRbGg9dqpxYEGyV4njo0dnLE7xob9kNKLgr
	L0r43JIP15UcoPswYD609sSDxHndHEGTq0uuEMv7pJAEWRMwNpaWmLaTuxGn5pBGa2JLybZvy4h
	EsT06LMYgRKRqTjAOD2jiP5XZjb+Ble7gWmorvReSmBXWC4IHuGBaVdEFKOcCVKQg+bg7sUYH5j
	SKpRR7DX1UqF9l999OcnAww/8r3Xgk9lFIiN2C2KPsQAtT8Eau0cHZwJcE9lHEXaiZxHLVyJhW1
	zHTHDiAmhxLH9mD6+7g==
X-Google-Smtp-Source: AGHT+IGe/RHqhYUg4wLEJwAqTW4x/w0JmBH323SPMCg0At7a2RHx6rU+E79RqnfTnfGTNIDvyyYEsQ==
X-Received: by 2002:a05:6a20:9f4e:b0:1f5:8126:8a5d with SMTP id adf61e73a8af0-2009f5fdf88mr26251268637.17.1743632284859;
        Wed, 02 Apr 2025 15:18:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9a41468a2sm2685775a12.76.2025.04.02.15.18.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 15:18:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <81462799-6ef6-4079-9ebe-5b886d6e1eab@roeck-us.net>
Date: Wed, 2 Apr 2025 15:18:03 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (pmbus): Introduce page_change_delay
To: "William A. Kennington III" <william@wkennington.com>,
 Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250402193452.3571888-1-william@wkennington.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250402193452.3571888-1-william@wkennington.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/2/25 12:34, William A. Kennington III wrote:
> We have some buggy pmbus devices that require a delay after performing a
> page change operation before trying to issue more commands to the
> device.
> 
> This allows for a configurable delay after page changes, but not
> affecting other read or write operations.
> 
> Signed-off-by: William A. Kennington III <william@wkennington.com>
> ---
>   drivers/hwmon/pmbus/pmbus.h      |  1 +
>   drivers/hwmon/pmbus/pmbus_core.c | 59 ++++++++++++++++++++++----------
>   2 files changed, 41 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index ddb19c9726d6..742dafc44390 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -482,6 +482,7 @@ struct pmbus_driver_info {
>   	 */
>   	int access_delay;		/* in microseconds */
>   	int write_delay;		/* in microseconds */
> +	int page_change_delay;		/* in microseconds */
>   };
>   
>   /* Regulator ops */
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 787683e83db6..cfb724a8718b 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -116,6 +116,7 @@ struct pmbus_data {
>   	int vout_high[PMBUS_PAGES];	/* voltage high margin */
>   	ktime_t write_time;		/* Last SMBUS write timestamp */
>   	ktime_t access_time;		/* Last SMBUS access timestamp */
> +	ktime_t page_change_time;	/* Last SMBUS page change timestamp */
>   };
>   
>   struct pmbus_debugfs_entry {
> @@ -178,24 +179,44 @@ static void pmbus_wait(struct i2c_client *client)
>   
>   		if (delta < info->access_delay)
>   			fsleep(info->access_delay - delta);
> -	} else if (info->write_delay) {
> +	}
> +	if (info->write_delay) {
>   		delta = ktime_us_delta(ktime_get(), data->write_time);
>   
>   		if (delta < info->write_delay)
>   			fsleep(info->write_delay - delta);
>   	}
> +	if (info->page_change_delay) {
> +		delta = ktime_us_delta(ktime_get(), data->page_change_time);
> +

page_change_time isn't actually set. I suggest to just use data->write_time.
Also see below.

> +		if (delta < info->page_change_delay)
> +			fsleep(info->page_change_delay - delta);
> +	}
>   }
>   
> -/* Sets the last accessed timestamp for pmbus_wait */
> -static void pmbus_update_ts(struct i2c_client *client, bool write_op)
> +#define PMBUS_OP_READ_BIT 1
> +#define PMBUS_OP_WRITE_BIT 2
> +#define PMBUS_OP_PAGE_CHANGE_BIT 4

#define<space>NAME<tab>BIT(...)

> +
> +#define PMBUS_OP_READ PMBUS_OP_READ_BIT
> +#define PMBUS_OP_WRITE PMBUS_OP_WRITE_BIT
> +#define PMBUS_OP_PAGE_CHANGE (PMBUS_OP_PAGE_CHANGE_BIT | PMBUS_OP_WRITE)

That is way too complicated. Just make it

#define PMBUS_OP_READ		BIT(0)
#define PMBUS_OP_WRITE		BIT(1)
#define PMBUS_OP_PAGE_CHANGE	BIT(2)

A page change implies a write, so it is not necessary to combine the bits.

> +
> +/* Sets the last operation timestamp for pmbus_wait */
> +static void pmbus_update_ts(struct i2c_client *client, int op)
>   {
>   	struct pmbus_data *data = i2c_get_clientdata(client);
>   	const struct pmbus_driver_info *info = data->info;
> +	ktime_t now = ktime_get();
>   
>   	if (info->access_delay) {
> -		data->access_time = ktime_get();
> -	} else if (info->write_delay && write_op) {
> -		data->write_time = ktime_get();
> +		data->access_time = now;
> +	}
> +	if (info->write_delay && (op & PMBUS_OP_WRITE_BIT)) {
> +		data->write_time = now;
> +	}
> +	if (info->page_change_delay && (op & PMBUS_OP_PAGE_CHANGE_BIT)) {
> +		data->write_time = now;
>   	}

Seems to me that we should only need write_time and not
page_change_time since both will always be set together.

I also think this can be simplified if ktime_get() is always called anyway.

	ktime_t now = ktime_get();

	data->access_time = now;
	if (op & (PMBUS_OP_WRITE | PMBUS_OP_PAGE_CHANGE))
		data->write_time = now;

It doesn't matter if the values are set unnecessarily if there is no delay
because they won't be used in that case.

>   }
>   
> @@ -211,13 +232,13 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
>   	    data->info->pages > 1 && page != data->currpage) {
>   		pmbus_wait(client);
>   		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
> -		pmbus_update_ts(client, true);
> +		pmbus_update_ts(client, PMBUS_OP_PAGE_CHANGE);
>   		if (rv < 0)
>   			return rv;
>   
>   		pmbus_wait(client);
>   		rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
> -		pmbus_update_ts(client, false);
> +		pmbus_update_ts(client, PMBUS_OP_READ);
>   		if (rv < 0)
>   			return rv;
>   
> @@ -231,7 +252,7 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
>   		pmbus_wait(client);
>   		rv = i2c_smbus_write_byte_data(client, PMBUS_PHASE,
>   					       phase);
> -		pmbus_update_ts(client, true);
> +		pmbus_update_ts(client, PMBUS_OP_WRITE);
>   		if (rv)
>   			return rv;
>   	}
> @@ -251,7 +272,7 @@ int pmbus_write_byte(struct i2c_client *client, int page, u8 value)
>   
>   	pmbus_wait(client);
>   	rv = i2c_smbus_write_byte(client, value);
> -	pmbus_update_ts(client, true);
> +	pmbus_update_ts(client, PMBUS_OP_WRITE);
>   
>   	return rv;
>   }
> @@ -286,7 +307,7 @@ int pmbus_write_word_data(struct i2c_client *client, int page, u8 reg,
>   
>   	pmbus_wait(client);
>   	rv = i2c_smbus_write_word_data(client, reg, word);
> -	pmbus_update_ts(client, true);
> +	pmbus_update_ts(client, PMBUS_OP_WRITE);
>   
>   	return rv;
>   }
> @@ -408,7 +429,7 @@ int pmbus_read_word_data(struct i2c_client *client, int page, int phase, u8 reg)
>   
>   	pmbus_wait(client);
>   	rv = i2c_smbus_read_word_data(client, reg);
> -	pmbus_update_ts(client, false);
> +	pmbus_update_ts(client, PMBUS_OP_READ);
>   
>   	return rv;
>   }
> @@ -471,7 +492,7 @@ int pmbus_read_byte_data(struct i2c_client *client, int page, u8 reg)
>   
>   	pmbus_wait(client);
>   	rv = i2c_smbus_read_byte_data(client, reg);
> -	pmbus_update_ts(client, false);
> +	pmbus_update_ts(client, PMBUS_OP_READ);
>   
>   	return rv;
>   }
> @@ -487,7 +508,7 @@ int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg, u8 value)
>   
>   	pmbus_wait(client);
>   	rv = i2c_smbus_write_byte_data(client, reg, value);
> -	pmbus_update_ts(client, true);
> +	pmbus_update_ts(client, PMBUS_OP_WRITE);
>   
>   	return rv;
>   }
> @@ -523,7 +544,7 @@ static int pmbus_read_block_data(struct i2c_client *client, int page, u8 reg,
>   
>   	pmbus_wait(client);
>   	rv = i2c_smbus_read_block_data(client, reg, data_buf);
> -	pmbus_update_ts(client, false);
> +	pmbus_update_ts(client, PMBUS_OP_READ);
>   
>   	return rv;
>   }
> @@ -2530,7 +2551,7 @@ static int pmbus_read_coefficients(struct i2c_client *client,
>   	rv = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
>   			    I2C_SMBUS_WRITE, PMBUS_COEFFICIENTS,
>   			    I2C_SMBUS_BLOCK_PROC_CALL, &data);
> -	pmbus_update_ts(client, true);
> +	pmbus_update_ts(client, PMBUS_OP_READ | PMBUS_OP_WRITE);

I don't immediately follow the reason for adding PMBUS_OP_READ.

>   
>   	if (rv < 0)
>   		return rv;
> @@ -2734,7 +2755,7 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
>   	if (!(data->flags & PMBUS_NO_CAPABILITY)) {
>   		pmbus_wait(client);
>   		ret = i2c_smbus_read_byte_data(client, PMBUS_CAPABILITY);
> -		pmbus_update_ts(client, false);
> +		pmbus_update_ts(client, PMBUS_OP_READ);
>   
>   		if (ret >= 0 && (ret & PB_CAPABILITY_ERROR_CHECK)) {
>   			if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_PEC))
> @@ -2750,13 +2771,13 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
>   	data->read_status = pmbus_read_status_word;
>   	pmbus_wait(client);
>   	ret = i2c_smbus_read_word_data(client, PMBUS_STATUS_WORD);
> -	pmbus_update_ts(client, false);
> +	pmbus_update_ts(client, PMBUS_OP_READ);
>   
>   	if (ret < 0 || ret == 0xffff) {
>   		data->read_status = pmbus_read_status_byte;
>   		pmbus_wait(client);
>   		ret = i2c_smbus_read_byte_data(client, PMBUS_STATUS_BYTE);
> -		pmbus_update_ts(client, false);
> +		pmbus_update_ts(client, PMBUS_OP_READ);
>   
>   		if (ret < 0 || ret == 0xff) {
>   			dev_err(dev, "PMBus status register not found\n");

