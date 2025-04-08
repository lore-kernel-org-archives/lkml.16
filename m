Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFBD1CF8B;
	Tue,  8 Apr 2025 02:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744077966; cv=none; b=M9KEAdK7PM4hunrUtJufpe+T2d66iHhKkxC7Z8mxjUMQ2WXh3SrevIul8cZegS+Hz+7yUJWVw2agtSbXVM2xa+qn+6Pnv/jFSkCk08HQ/kqqQJIwHBk9CRNVDwYLhAAHZz5j4kP6vTd4cIIZ4PaNA21Q4FVVkL1zNcwxztrvOnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744077966; c=relaxed/simple;
	bh=9F7sCCoGBSiWF1k5xI6BkJQ3blPL/yKosYOTxsCMtYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdArtl7vLdRNZzLa1uAbWpMvZ27KJb0lNYFTTwtlyHY9JqyMqvpCF3Cx3wOrbMIBgJxseUOChQpyVzeVi1qmi2Y8zh+uBAhNAXB52RXA1DZ7SWvapG5ZWBjLdk7JF/Sm7WIuwb044yQzZVWvYdyaJkKexuvoab656cseu8y2+w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GyDyTv4K; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GyDyTv4K"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736b34a71a1so5925599b3a.0;
        Mon, 07 Apr 2025 19:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744077964; x=1744682764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rIc84lf/eP/MYXPb5aGJA9+wsbj0Dhq/CJw6jNEGe2c=;
        b=GyDyTv4KXShjPdmy7XQCsdLZZxmI/x+0sAJBoDuukxVLsXgAUIjO/iJU1MrGPSBtZh
         jDwrKadVGx5fC6E7c0S8D70EzzQHoJHitfUXDnhiHTY16SZLo1SkDZzuo6brCDGjdrgv
         k17uX6+fPWwtpfqu1YGDlgQaOvzvd3Nf7Y6Ua/qWta/X6GNEGEnhtbNbxhsxjOAGr1rk
         7IHkDd3hO19Q6tGLCLBTLlfpR2DU4Gf9hEHcQdEB2d11s2v9yLDY8NTAOUUBrsVZk5iL
         VDTh4C0SWam92+k3hyZEcCB8/NxiVJvzDqBd4r4Tl+yG4DvxmmN8IXqvxMyESIeMqTy0
         zAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744077964; x=1744682764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rIc84lf/eP/MYXPb5aGJA9+wsbj0Dhq/CJw6jNEGe2c=;
        b=kF4cMu/Qasfp9237vG3/R4mqp+xYwE185CNOpOo9IpHmJD8287+AIA9lgX1ZBr5sDg
         zM/o4q0k6/N4VwswFDA1ptgB/Q6rbL6FKnNjaFNamTYoU+zBm6s0HrZiNhEavw3fAbst
         RhB2M/J45He9CUWTh8J34oEdpJkPCrE0HQZLrziN28NYIuZlpi3qMlti6P82xc+FEIvN
         c410TKvEuobKydMX9beuD7DQ4ZCiLae3GV1nKd+hyelbTUggjyqJtDY4s52mrVXOQZ3H
         bQrC3yF5rTxmGTzhfH5cUe00xdqgSMnnMnbjkHyoYunIYhnFf6vki7kCg7wMBDJHvVEA
         hAjw==
X-Forwarded-Encrypted: i=1; AJvYcCX9+9cUaF+ds+WcEKxw7+CK8y1/B/RaRvVsdXpkgYlLk5Mh+/3yh/r86tu5Zjkcsea2fiBQsyAkkmQTpEbf@vger.kernel.org, AJvYcCX94/qWcxMAsjl80XC4q1RlybZ60YwvTCtMhxwNyN5bmmAnrWd1I7E1EkuEgvQXr+qt6uWHb2auDrW6iA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi97JPACpKau0R0HAAUGZ8yasweqX4BoTcsxLf1HoVfg847UoB
	ZFwY092NMBRgFOyPqDgjGfpOxalbsapxXLETV4BGN7RhePdbmk4B
X-Gm-Gg: ASbGncufjanldTUQYP8+Q21JuPIdr6sZ7y7p7H9ZuK0qVC1ThxS2dOR9HEAYt9DwWhd
	r9wwIGAp2vP6/1ASUIU2QGFfWWCSKr7W52YQgPMdncW4Z8tc2UJbsOQvY6bIMeodM+BKtNUF2zA
	7XLvVk+XUCIBZ6EQHwx1nv9VEtSwtYSanWjLJw4QdBuFYLY8kM9hUwRqNVuAcoQ/YLTPguLaP0q
	7Rfmfz0orW0fVLMXDvLli90DAZLMUZs/DGuo5kQXwiXVydEodSspPashgWDArRFeEUROk6BcvQQ
	DcUs6TljNT881bxpFgf/D8ZNNjqO/xaLK+8MiRoYxaBIn4uyKNjIMyAb8vQnqQafmGm/
X-Google-Smtp-Source: AGHT+IHK8PQC0R91KvK8h6B+A4w3iDQHOSv+LURM+rlsgTZUxmP6yTsVkRmUaBs6Di/+vsK7Omzn8g==
X-Received: by 2002:a05:6a21:174d:b0:1f5:874c:c987 with SMTP id adf61e73a8af0-201046020a5mr21261234637.15.1744077963962;
        Mon, 07 Apr 2025 19:06:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b2f40sm9567417b3a.142.2025.04.07.19.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 19:06:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 7 Apr 2025 19:06:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "William A. Kennington III" <william@wkennington.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: Re: [PATCH v2] hwmon: max34451: Work around lost page
Message-ID: <7cc91dea-c24c-4948-9916-8cad865d023e@roeck-us.net>
References: <20250401220850.3189582-1-william@wkennington.com>
 <20250408011006.1314622-1-william@wkennington.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408011006.1314622-1-william@wkennington.com>

On Mon, Apr 07, 2025 at 06:10:06PM -0700, William A. Kennington III wrote:
> When requesting new pages from the max34451 we sometimes see that the
> firmware responds with stale or bad data to reads that happen
> immediately after a page change. This is due to a lack of clock
> stretching after page changing on the device side when it needs more
> time to complete the operation.
> 
> To remedy this, the manufacturer recommends we wait 50us until
> the firmware should be ready with the new page.
> 
> Signed-off-by: William A. Kennington III <william@wkennington.com>

Applied to hwmon-next.

Alexis: Do you happen to know if the new revision of MAX34451 still
has this problem ? Also, it would be nice to get some feedback if
the patch covers all affected devices.

Thanks,
Guenter

> ---
> V1 -> V2: Make all page changes delay the required 50us
> 
>  drivers/hwmon/pmbus/max34440.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
> index c9dda33831ff..0d9cb39a9cc6 100644
> --- a/drivers/hwmon/pmbus/max34440.c
> +++ b/drivers/hwmon/pmbus/max34440.c
> @@ -12,10 +12,19 @@
>  #include <linux/init.h>
>  #include <linux/err.h>
>  #include <linux/i2c.h>
> +#include <linux/delay.h>
>  #include "pmbus.h"
>  
>  enum chips { max34440, max34441, max34446, max34451, max34460, max34461 };
>  
> +/*
> + * Firmware is sometimes not ready if we try and read the
> + * data from the page immediately after setting. Maxim
> + * recommends 50us delay due to the chip failing to clock
> + * stretch long enough here.
> + */
> +#define MAX34440_PAGE_CHANGE_DELAY 50
> +
>  #define MAX34440_MFR_VOUT_PEAK		0xd4
>  #define MAX34440_MFR_IOUT_PEAK		0xd5
>  #define MAX34440_MFR_TEMPERATURE_PEAK	0xd6
> @@ -238,6 +247,7 @@ static int max34451_set_supported_funcs(struct i2c_client *client,
>  
>  	for (page = 0; page < 16; page++) {
>  		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
> +		fsleep(MAX34440_PAGE_CHANGE_DELAY);
>  		if (rv < 0)
>  			return rv;
>  
> @@ -312,6 +322,7 @@ static struct pmbus_driver_info max34440_info[] = {
>  		.read_byte_data = max34440_read_byte_data,
>  		.read_word_data = max34440_read_word_data,
>  		.write_word_data = max34440_write_word_data,
> +		.page_change_delay = MAX34440_PAGE_CHANGE_DELAY,
>  	},
>  	[max34441] = {
>  		.pages = 12,
> @@ -355,6 +366,7 @@ static struct pmbus_driver_info max34440_info[] = {
>  		.read_byte_data = max34440_read_byte_data,
>  		.read_word_data = max34440_read_word_data,
>  		.write_word_data = max34440_write_word_data,
> +		.page_change_delay = MAX34440_PAGE_CHANGE_DELAY,
>  	},
>  	[max34446] = {
>  		.pages = 7,
> @@ -392,6 +404,7 @@ static struct pmbus_driver_info max34440_info[] = {
>  		.read_byte_data = max34440_read_byte_data,
>  		.read_word_data = max34440_read_word_data,
>  		.write_word_data = max34440_write_word_data,
> +		.page_change_delay = MAX34440_PAGE_CHANGE_DELAY,
>  	},
>  	[max34451] = {
>  		.pages = 21,
> @@ -415,6 +428,7 @@ static struct pmbus_driver_info max34440_info[] = {
>  		.func[20] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
>  		.read_word_data = max34440_read_word_data,
>  		.write_word_data = max34440_write_word_data,
> +		.page_change_delay = MAX34440_PAGE_CHANGE_DELAY,
>  	},
>  	[max34460] = {
>  		.pages = 18,
> @@ -445,6 +459,7 @@ static struct pmbus_driver_info max34440_info[] = {
>  		.func[17] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
>  		.read_word_data = max34440_read_word_data,
>  		.write_word_data = max34440_write_word_data,
> +		.page_change_delay = MAX34440_PAGE_CHANGE_DELAY,
>  	},
>  	[max34461] = {
>  		.pages = 23,
> @@ -480,6 +495,7 @@ static struct pmbus_driver_info max34440_info[] = {
>  		.func[21] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
>  		.read_word_data = max34440_read_word_data,
>  		.write_word_data = max34440_write_word_data,
> +		.page_change_delay = MAX34440_PAGE_CHANGE_DELAY,
>  	},
>  };
>  
