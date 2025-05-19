Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839262868BA
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747671308; cv=none; b=LdYm8wcFEHWuBduUB0Rs/weXLIwtKjWUa+CF9qN7Xnj1EHrIdWjwoJbdEdiknN9jFGhRRoFA5bMSWZ7I0z/zfSIYmqmAHXyh4P5Zh61oaa0x+g0Q06WXlACWr43R+IuBSg+OSDdIjBYDwbo0xFIZAngHLzglvqYHPc6ko6czERU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747671308; c=relaxed/simple;
	bh=c93LfdDMdxxL1G2N4IRzJFli1vNWVx+Ilmk1Vy42WsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=saNdJ/KqNAToI5ucJ3o3WvJT3TgTXM/IGp+2n6uXnxxeL9IM8vlSAsNy/nfpFAcfvUp6AAplToHxbTYq6TBXP41iWCS36OMK4up4dX149H3wYbGboWP5/F2SwXPHdU2k6+JPer1VYeNR3S7DsqF3Y3fgw0XnWXUA9xTnhBrgBoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GUTDGwhW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GUTDGwhW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747671305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RhRu6EuymcFvDIFk2FD/5bzqcstVfgi8WU4KbHCXAUU=;
	b=GUTDGwhWLWBIpsFntEHbb9gyV9QXw68aM8tEzCR3o1scDGcAKUuEbIFiWAapOCKQLGT4yj
	5Y1AcsINvr8wBD3JEl4ij9COfmuZrgdhbPBnx1XFbFEag9jdkB1oCNb3vbjcQnaz8Y4jHM
	V8zXZ/nwY/PX4aWD2UKYsFgow6kVOF8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-ItCgDrUWPUe7Xze-VfimUg-1; Mon, 19 May 2025 12:15:04 -0400
X-MC-Unique: ItCgDrUWPUe7Xze-VfimUg-1
X-Mimecast-MFC-AGG-ID: ItCgDrUWPUe7Xze-VfimUg_1747671303
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ad540ac3219so253774966b.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747671303; x=1748276103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RhRu6EuymcFvDIFk2FD/5bzqcstVfgi8WU4KbHCXAUU=;
        b=QQOv3ILbA/w6Fz78bCkqYdQT3nXxk8tv/RxWhOqdjoMHlQGpzzbuda56X8GiQjyy6+
         wNJY2M0loSM299tuKF3t5h3JLlaIlY1Rj40jizln4xtvzQ2+5Il10M06YnfBaQfDjAYK
         3DK/3d4ZmPGJXeatsxgKnnEfW+OWWpbKJteozUEnNAAzzbDMxq42JT0oMAmXZOr7O84P
         gCIMAfzfBnAnq7ZSQzUgkYF0W4dCJZ3SCWmr5VuU6n2uAWQnxUB+tErBJ4HBQbwYuB2+
         vusc54Z+iTFvGoi7pQaIJ+tFhmnhtpaGA4OpbLLh7N9KCDLV9abAs/9Je62VkT776jVa
         WWiw==
X-Forwarded-Encrypted: i=1; AJvYcCWfZ1SA4XaI854WChfBN/qq8BjhPgIGjgsQJmEG3WTpePwdzCPYbRMoNe9/VXqjsl7AdaiUOCZMyu3Y6nM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsPaO6imrZpH0mTQBFxBqUkpFJH+Ec4ju1MTht05K24+0ZcssJ
	NOCn9V6EKQH+PwGTga/tksa1chGfzyG9cQvMPwm17Hwzazq3Q45TeNywjfMu3rYirpkgDkcbGek
	ZWH8kA69VPC9oFEf0P0aYD9Gj6jiluoc69X1yW6zbQbGTsp207VD9dMGoLsk/qv2iaw==
X-Gm-Gg: ASbGncskwuveSQixDwDr8WtFiGcnARWA+Hzp7EXwTF4d/kQLGWRDHUu8lu3kGuWxofC
	yem+9cMyASSxl52mvmlAwwvj1u5kTjS/XKm0XJ4TQlkt2a2+92buiB5vXwjhCdJaz7VOpuqplV/
	1zLreslZ6I/FznHpd3YNY0OGFO9pkd/i3lE7RD3U+hG9UmwJN0bnnanI116talpfk1a55/tHWSZ
	AGScOnmMuzkXkZ7hEzE6MPArkRd82nTBzIL8CleyNghQspVVTdqEq44C/3/nRNO3/NoTUBBrYSU
	dv6uxQsTDFpAndclGwOG6cBTxKIq0inmF3iuXvrS7jt+5Mp+ld7IkMD+sIrFWNFWmHVTJJKByu8
	XPWNnMtL53HrJotT4BgFp6aPpRzb5FyFs9tdnGytwIkDV1GYw/zQrEOVBE890HQ==
X-Received: by 2002:a17:907:1b2a:b0:ad2:233f:f024 with SMTP id a640c23a62f3a-ad536b82ac2mr1329213366b.17.1747671302821;
        Mon, 19 May 2025 09:15:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmFp34WQgxmGxbjDO27qbsv1VbZr+WF5JVEmDYgXua/9BqdR1gBDhL+GhA1myY8aVTZpE5SA==
X-Received: by 2002:a17:907:1b2a:b0:ad2:233f:f024 with SMTP id a640c23a62f3a-ad536b82ac2mr1329210466b.17.1747671302369;
        Mon, 19 May 2025 09:15:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d498737sm606674366b.138.2025.05.19.09.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 09:15:01 -0700 (PDT)
Message-ID: <0dfc74c9-7cec-4453-80fc-d6ff8d1a46f6@redhat.com>
Date: Mon, 19 May 2025 18:15:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] input: goodix: add poll mode for goodix touchscreen
To: Joseph Guo <qijian.guo@nxp.com>, Bastien Nocera <hadess@hadess.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "open list:GOODIX TOUCHSCREEN" <linux-input@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250519085744.3116042-1-qijian.guo@nxp.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250519085744.3116042-1-qijian.guo@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 19-May-25 10:57 AM, Joseph Guo wrote:
> goodix touchscreen only support interrupt mode by default.
> Some panels like waveshare panel which is widely used on raspeberry pi
> don't have interrupt pins and only work on i2c poll mode.
> The waveshare panel 7inch panel use goodix gt911 touchscreen chip.
> 
> Update goodix touchscreen to support both interrupt and poll mode.
> 
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
> ---
>  drivers/input/touchscreen/goodix.c | 69 +++++++++++++++++++++++++++---
>  drivers/input/touchscreen/goodix.h |  4 ++
>  2 files changed, 67 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index aaf79ac50004..87991b56494d 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -47,6 +47,7 @@
>  #define RESOLUTION_LOC		1
>  #define MAX_CONTACTS_LOC	5
>  #define TRIGGER_LOC		6
> +#define POLL_INTERVAL_MS		17	/* 17ms = 60fps */
> 
>  /* Our special handling for GPIO accesses through ACPI is x86 specific */
>  #if defined CONFIG_X86 && defined CONFIG_ACPI
> @@ -497,6 +498,23 @@ static void goodix_process_events(struct goodix_ts_data *ts)
>  	input_sync(ts->input_dev);
>  }
> 
> +static void goodix_ts_irq_poll_timer(struct timer_list *t)
> +{
> +	struct goodix_ts_data *ts = from_timer(ts, t, timer);
> +
> +	schedule_work(&ts->work_i2c_poll);
> +	mod_timer(&ts->timer, jiffies + msecs_to_jiffies(POLL_INTERVAL_MS));
> +}
> +
> +static void goodix_ts_work_i2c_poll(struct work_struct *work)
> +{
> +	struct goodix_ts_data *ts = container_of(work,
> +			struct goodix_ts_data, work_i2c_poll);
> +
> +	goodix_process_events(ts);
> +	goodix_i2c_write_u8(ts->client, GOODIX_READ_COOR_ADDR, 0);
> +}
> +
>  /**
>   * goodix_ts_irq_handler - The IRQ handler
>   *
> @@ -523,16 +541,50 @@ static irqreturn_t goodix_ts_irq_handler(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
> 
> +static void goodix_enable_irq(struct goodix_ts_data *ts)
> +{
> +	if (ts->client->irq) {
> +		enable_irq(ts->client->irq);
> +	} else {
> +		ts->timer.expires = jiffies + msecs_to_jiffies(POLL_INTERVAL_MS);
> +		add_timer(&ts->timer);
> +	}
> +}
> +
> +static void goodix_disable_irq(struct goodix_ts_data *ts)
> +{
> +	if (ts->client->irq) {
> +		disable_irq(ts->client->irq);
> +	} else {
> +		del_timer(&ts->timer);
> +		cancel_work_sync(&ts->work_i2c_poll);
> +	}
> +}
> +
>  static void goodix_free_irq(struct goodix_ts_data *ts)
>  {
> -	devm_free_irq(&ts->client->dev, ts->client->irq, ts);
> +	if (ts->client->irq) {
> +		devm_free_irq(&ts->client->dev, ts->client->irq, ts);
> +	} else {
> +		del_timer(&ts->timer);
> +		cancel_work_sync(&ts->work_i2c_poll);
> +	}
>  }
> 
>  static int goodix_request_irq(struct goodix_ts_data *ts)
>  {
> -	return devm_request_threaded_irq(&ts->client->dev, ts->client->irq,
> -					 NULL, goodix_ts_irq_handler,
> -					 ts->irq_flags, ts->client->name, ts);
> +	if (ts->client->irq) {
> +		return devm_request_threaded_irq(&ts->client->dev, ts->client->irq,
> +						 NULL, goodix_ts_irq_handler,
> +						 ts->irq_flags, ts->client->name, ts);
> +	} else {
> +		INIT_WORK(&ts->work_i2c_poll,
> +			  goodix_ts_work_i2c_poll);
> +		timer_setup(&ts->timer, goodix_ts_irq_poll_timer, 0);
> +		if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_NONE)
> +			goodix_enable_irq(ts);
> +		return 0;
> +	}
>  }
> 
>  static int goodix_check_cfg_8(struct goodix_ts_data *ts, const u8 *cfg, int len)
> @@ -1420,6 +1472,11 @@ static void goodix_ts_remove(struct i2c_client *client)
>  {
>  	struct goodix_ts_data *ts = i2c_get_clientdata(client);
> 
> +	if (!client->irq) {
> +		del_timer(&ts->timer);
> +		cancel_work_sync(&ts->work_i2c_poll);
> +	}
> +
>  	if (ts->load_cfg_from_disk)
>  		wait_for_completion(&ts->firmware_loading_complete);
>  }
> @@ -1435,7 +1492,7 @@ static int goodix_suspend(struct device *dev)
> 
>  	/* We need gpio pins to suspend/resume */
>  	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_NONE) {
> -		disable_irq(client->irq);
> +		goodix_disable_irq(ts);
>  		return 0;
>  	}
> 
> @@ -1479,7 +1536,7 @@ static int goodix_resume(struct device *dev)
>  	int error;
> 
>  	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_NONE) {
> -		enable_irq(client->irq);
> +		goodix_enable_irq(ts);
>  		return 0;
>  	}
> 
> diff --git a/drivers/input/touchscreen/goodix.h b/drivers/input/touchscreen/goodix.h
> index 87797cc88b32..132e49d66324 100644
> --- a/drivers/input/touchscreen/goodix.h
> +++ b/drivers/input/touchscreen/goodix.h
> @@ -56,6 +56,7 @@
>  #define GOODIX_ID_MAX_LEN			4
>  #define GOODIX_CONFIG_MAX_LENGTH		240
>  #define GOODIX_MAX_KEYS				7
> +#define GOODIX_NAME_MAX_LEN			38
> 
>  enum goodix_irq_pin_access_method {
>  	IRQ_PIN_ACCESS_NONE,
> @@ -91,6 +92,7 @@ struct goodix_ts_data {
>  	enum gpiod_flags gpiod_rst_flags;
>  	char id[GOODIX_ID_MAX_LEN + 1];
>  	char cfg_name[64];
> +	char name[GOODIX_NAME_MAX_LEN];

This adding of the name variable, seems to be some leftover change from another patch?

Please drop this for v2.

Regards,

Hans



>  	u16 version;
>  	bool reset_controller_at_probe;
>  	bool load_cfg_from_disk;
> @@ -104,6 +106,8 @@ struct goodix_ts_data {
>  	u8 main_clk[GOODIX_MAIN_CLK_LEN];
>  	int bak_ref_len;
>  	u8 *bak_ref;
> +	struct timer_list timer;
> +	struct work_struct work_i2c_poll;
>  };
> 
>  int goodix_i2c_read(struct i2c_client *client, u16 reg, u8 *buf, int len);
> --
> 2.34.1
> 

