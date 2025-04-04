Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D611993B7;
	Fri,  4 Apr 2025 00:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726484; cv=none; b=nmiAN1pqsiOLipM9pAG4eVVVCY6oFWl8HuXOY1sUJXmYqgp3rIGH/Bp3FP/PQGBcMt4hR1wae7hglVKdcJJxnDskOrfwkyfFDDAkoDlgfZMVnFwq/PmtsXZiNlBc8WMHZkrJplJ7469mGs/Q2WOSHMuUIHpD+pIFSvGgD97zJZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726484; c=relaxed/simple;
	bh=BJik7vJPS2lFwv3TLRuoQUkazn4jaw1FbCRLyyJksNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oc0mpw2Y4DmZHf8z8GbZcPDYrY8LMR6qV6adWkOdbmvra4D0ygeZ4dNargwJt9kdPmbq1YWn0sjYRj6edNIwCEgw+BU0ES2PcZgg8vEyCFFIu+FAhvLGIejh/rabGVWuqL49pjB+/eGtvyjGMaFTE1EGMdJel9V7C61Z1yihJLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9Yio4Xe; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9Yio4Xe"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22401f4d35aso16288105ad.2;
        Thu, 03 Apr 2025 17:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743726481; x=1744331281; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tiLWhcw8UrQp578t/bvkEK8RmfqpeY7OLy0Zrqy/lb4=;
        b=F9Yio4XeUcHcuJQ5+ucnlYeqiKxBqhPfHjfrgmwz3hMn73TWaTCYw6ulzfd1gBdz4q
         EOyrl0GxGh0syFOnRcB+hn1uXtoR3MvbAmfOh2mjJa93FWQhrO+nG7CUq7H48RN0NVrY
         mnZD5hLkLuNvI7fihATMKGs9zwrSNp/jBq279r8aj5I1KBDc7gGWYBq7wO0I7ARwkMs0
         pReaJiVzG4sG1GiqqEGZvJnODrOHOnhzwNJOU5+BrfdeX/vbLK36kYwpGQpjvGqTCE2x
         Mh52zaci4tCTQkDW5Cv6zRlewboe6bLdhOoePvLuGfQCCBdvrQ2cC74Ad9Yg0DH2onX/
         04Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743726481; x=1744331281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tiLWhcw8UrQp578t/bvkEK8RmfqpeY7OLy0Zrqy/lb4=;
        b=eUJQ2Dct5uL43L+T7MAMtf7SPny86akWllkCxLu36PPem7aEJFIt/rS670HX0rWUbh
         YWpuH31Kq8L//N8nHMvHDfNmZrGks0K4vZasnUMDhY/ahqFR5piLtado+7gXRP431W14
         G1+IBkWo1H9gjey9wcing9btsYJNqtYjHTrRSjnpjnR0kLiwDjTeJxutP3V2Z0l9N9wn
         M5evg/h7wEaFG893VBXLcKW5UnQzybU9HMWFn/MqfdNY7feADf+rcLFlgfN803fFuaW2
         jbcus3UBvxx/T6dpE4evmZkYHeSyTBj66GZeSOL5aP5+SuuaUrJbwQUBYDbABXMn/Ii/
         PjMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKMfM2ZKSAahA9BUGl4ms2yZoP+AFOGrKDlR0qtzrxyU9cRndXxTYCAMnCNqbEGLBQV6Oe3QPUXvwDg6gp@vger.kernel.org, AJvYcCWjMF6rVPznSa97DNQeJZiNurpiRMgMpfl63h/gcsigpopOHRK0JsL8Ng05GC3bpNoIUAXkqYnoN3F/5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaR8Fb7+/jnCf5QV1IHl/FaAaTiei+2og7F2U7iiCHWGOEXHDT
	dqTieJuDJ8zIZaFGTdtAqdiogWUu14B3xc4NYlRXLLn+Y7qUMggV65yTuA==
X-Gm-Gg: ASbGncuqd2du4gEad18bC8cZJROPV0IbV2GKkazxUFMngKUTp1ozDlQ2E0bllVU8GFQ
	BuceDWmMZ2+UDUF86TPrO4z1Gqvko4KACAwPFKqjLG/Ot46wFH+8xaxMqo9arSm6Nv/KwcVOv9J
	NiBkaLPAAkClPEhfbUa59shFDs3Usq3lR4xafIW8jMzCfmUU90UtsCIIIKvUArmT0+f9xeCv5Rr
	jmYNFC3WjmychhIRcnmgMii3lexPVAyUukqd+GOZhVsgddwnzsiAN2BuyZorOijtNzGVuX5mQHY
	dOjg6aiZ4BmWaD+q+C7up1qcMCjWKyH9YQjEoP6011myT3myUVkZ7QGO++yAvnA81axO
X-Google-Smtp-Source: AGHT+IFl0VJ59GwoYz6sJFiE/82HtFdo3fFicQbo7C0oWzGqmP/WiUhH/hcQCZqs2xdattHx/IpLFw==
X-Received: by 2002:a17:903:3df1:b0:224:78e:4ebe with SMTP id d9443c01a7336-22a8a09a412mr10904985ad.33.1743726480708;
        Thu, 03 Apr 2025 17:28:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785ad875sm20880275ad.17.2025.04.03.17.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 17:28:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 3 Apr 2025 17:27:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "William A. Kennington III" <william@wkennington.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: (pmbus): Introduce page_change_delay
Message-ID: <444f9411-851b-4810-8f6e-35306ac9bfdb@roeck-us.net>
References: <20250402202741.3593606-1-william@wkennington.com>
 <20250403211246.3876138-1-william@wkennington.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403211246.3876138-1-william@wkennington.com>

On Thu, Apr 03, 2025 at 02:12:46PM -0700, William A. Kennington III wrote:
> We have some buggy pmbus devices that require a delay after performing a
> page change operation before trying to issue more commands to the
> device.
> 
> This allows for a configurable delay after page changes, but not
> affecting other read or write operations.
> 
> Signed-off-by: William A. Kennington III <william@wkennington.com>
> ---
> V1 -> V2: Simplify how the backoff time is stored and computed
> V2 -> V3: Use the BIT macro
> 
>  drivers/hwmon/pmbus/pmbus.h      |  1 +
>  drivers/hwmon/pmbus/pmbus_core.c | 67 +++++++++++++++-----------------
>  2 files changed, 33 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index ddb19c9726d6..742dafc44390 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -482,6 +482,7 @@ struct pmbus_driver_info {
>  	 */
>  	int access_delay;		/* in microseconds */
>  	int write_delay;		/* in microseconds */
> +	int page_change_delay;		/* in microseconds */
>  };
>  
>  /* Regulator ops */
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 787683e83db6..3aa5851610b2 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -114,8 +114,8 @@ struct pmbus_data {
>  
>  	int vout_low[PMBUS_PAGES];	/* voltage low margin */
>  	int vout_high[PMBUS_PAGES];	/* voltage high margin */
> -	ktime_t write_time;		/* Last SMBUS write timestamp */
> -	ktime_t access_time;		/* Last SMBUS access timestamp */
> +
> +	ktime_t next_access_backoff;	/* Wait until at least this time */
>  };
>  
>  struct pmbus_debugfs_entry {
> @@ -170,33 +170,30 @@ EXPORT_SYMBOL_NS_GPL(pmbus_set_update, "PMBUS");
>  static void pmbus_wait(struct i2c_client *client)
>  {
>  	struct pmbus_data *data = i2c_get_clientdata(client);
> -	const struct pmbus_driver_info *info = data->info;
> -	s64 delta;
> -
> -	if (info->access_delay) {
> -		delta = ktime_us_delta(ktime_get(), data->access_time);
> -
> -		if (delta < info->access_delay)
> -			fsleep(info->access_delay - delta);
> -	} else if (info->write_delay) {
> -		delta = ktime_us_delta(ktime_get(), data->write_time);
> +	s64 delay = ktime_us_delta(data->next_access_backoff, ktime_get());
>  
> -		if (delta < info->write_delay)
> -			fsleep(info->write_delay - delta);
> -	}
> +	if (delay > 0)
> +		fsleep(delay);
>  }
>  
> -/* Sets the last accessed timestamp for pmbus_wait */
> -static void pmbus_update_ts(struct i2c_client *client, bool write_op)
> +#define PMBUS_OP_READ BIT(0)
> +#define PMBUS_OP_WRITE BIT(1)
> +#define PMBUS_OP_PAGE_CHANGE BIT(2)

I guess you really don't like tabs. Ok, no problem, I can fix that up when
I apply the patch. Either case, please move the defines ahead of the first
code block.

> +
> +/* Sets the last operation timestamp for pmbus_wait */
> +static void pmbus_update_ts(struct i2c_client *client, int op)
>  {
>  	struct pmbus_data *data = i2c_get_clientdata(client);
>  	const struct pmbus_driver_info *info = data->info;
> +	int delay = info->access_delay;

Hmm, this is a functional change. It always sets the minimum wait
time to access_delay, even if the operation is a write. I guess
it makes sense because otherwise there would be no delay after
a write if only access_delay is set. However, that means that
PMBUS_OP_READ is not really needed anymore and can be dropped.

This should be explained in the patch description.

>  
> -	if (info->access_delay) {
> -		data->access_time = ktime_get();
> -	} else if (info->write_delay && write_op) {
> -		data->write_time = ktime_get();
> -	}
> +	if (op & (PMBUS_OP_WRITE | PMBUS_OP_PAGE_CHANGE))
> +		delay = max(delay, info->write_delay);
> +	if (op & PMBUS_OP_PAGE_CHANGE)
> +		delay = max(delay, info->page_change_delay);
> +

I would have set PMBUS_OP_WRITE | PMBUS_OP_PAGE_CHANGE in the calling code,
but this is ok too. However, please make it

	if (op & (PMBUS_OP_WRITE | PMBUS_OP_PAGE_CHANGE)) {
		delay = max(delay, info->write_delay);
		if (op & PMBUS_OP_PAGE_CHANGE)
			delay = max(delay, info->page_change_delay);
	}

After dropping PMBUS_OP_READ, that can be simplified further to

	if (op) {
		...
	}

> +	if (delay > 0)
> +		data->next_access_backoff = ktime_add_us(ktime_get(), delay);
>  }
>  
>  int pmbus_set_page(struct i2c_client *client, int page, int phase)
> @@ -211,13 +208,13 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
>  	    data->info->pages > 1 && page != data->currpage) {
>  		pmbus_wait(client);
>  		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
> -		pmbus_update_ts(client, true);
> +		pmbus_update_ts(client, PMBUS_OP_PAGE_CHANGE);
>  		if (rv < 0)
>  			return rv;
>  
>  		pmbus_wait(client);
>  		rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
> -		pmbus_update_ts(client, false);
> +		pmbus_update_ts(client, PMBUS_OP_READ);
>  		if (rv < 0)
>  			return rv;
>  
> @@ -231,7 +228,7 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
>  		pmbus_wait(client);
>  		rv = i2c_smbus_write_byte_data(client, PMBUS_PHASE,
>  					       phase);
> -		pmbus_update_ts(client, true);
> +		pmbus_update_ts(client, PMBUS_OP_WRITE);
>  		if (rv)
>  			return rv;
>  	}
> @@ -251,7 +248,7 @@ int pmbus_write_byte(struct i2c_client *client, int page, u8 value)
>  
>  	pmbus_wait(client);
>  	rv = i2c_smbus_write_byte(client, value);
> -	pmbus_update_ts(client, true);
> +	pmbus_update_ts(client, PMBUS_OP_WRITE);
>  
>  	return rv;
>  }
> @@ -286,7 +283,7 @@ int pmbus_write_word_data(struct i2c_client *client, int page, u8 reg,
>  
>  	pmbus_wait(client);
>  	rv = i2c_smbus_write_word_data(client, reg, word);
> -	pmbus_update_ts(client, true);
> +	pmbus_update_ts(client, PMBUS_OP_WRITE);
>  
>  	return rv;
>  }
> @@ -408,7 +405,7 @@ int pmbus_read_word_data(struct i2c_client *client, int page, int phase, u8 reg)
>  
>  	pmbus_wait(client);
>  	rv = i2c_smbus_read_word_data(client, reg);
> -	pmbus_update_ts(client, false);
> +	pmbus_update_ts(client, PMBUS_OP_READ);
>  
>  	return rv;
>  }
> @@ -471,7 +468,7 @@ int pmbus_read_byte_data(struct i2c_client *client, int page, u8 reg)
>  
>  	pmbus_wait(client);
>  	rv = i2c_smbus_read_byte_data(client, reg);
> -	pmbus_update_ts(client, false);
> +	pmbus_update_ts(client, PMBUS_OP_READ);
>  
>  	return rv;
>  }
> @@ -487,7 +484,7 @@ int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg, u8 value)
>  
>  	pmbus_wait(client);
>  	rv = i2c_smbus_write_byte_data(client, reg, value);
> -	pmbus_update_ts(client, true);
> +	pmbus_update_ts(client, PMBUS_OP_WRITE);
>  
>  	return rv;
>  }
> @@ -523,7 +520,7 @@ static int pmbus_read_block_data(struct i2c_client *client, int page, u8 reg,
>  
>  	pmbus_wait(client);
>  	rv = i2c_smbus_read_block_data(client, reg, data_buf);
> -	pmbus_update_ts(client, false);
> +	pmbus_update_ts(client, PMBUS_OP_READ);
>  
>  	return rv;
>  }
> @@ -2530,7 +2527,7 @@ static int pmbus_read_coefficients(struct i2c_client *client,
>  	rv = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
>  			    I2C_SMBUS_WRITE, PMBUS_COEFFICIENTS,
>  			    I2C_SMBUS_BLOCK_PROC_CALL, &data);
> -	pmbus_update_ts(client, true);
> +	pmbus_update_ts(client, PMBUS_OP_READ | PMBUS_OP_WRITE);

I'd argue that this does not warrant a PMBUS_OP_WRITE in the first place.
From the chip's perspective, the operation is complete after the data
is returned. This is just as much a write as any other SMBus read operation
(a write of an address followed by a read). If you think otherwise, please
explain.

Either case, the change warrants an explanation in the patch description.

Thanks,
Guenter
