Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A459323956E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819222; cv=none; b=VA8OOQs216ZiyQKP7Iui5aOowEEZigXMCD4YwJLMudplhvWtQX6XuZPbGszQ8E4UbIMzhcZnOwppxAxeTyHHL6Are3t/PFSbv4G5XkC+k5mU7qwP7Y5f5lZCN2/IhqEx/j0+gVJgsurcej39Mi+GjvzMbNIBZNITxkUiKuLJbqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819222; c=relaxed/simple;
	bh=9xM4pOZZ5lB7dJZlrvgyVzTtw3XBlGTyEv7mdd/+a/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I+3bHSEVUgIbgI/v75IT5XE8qjFVwv9SGvIzdXAsJgQdBMO+QxnKF2X27HU9VN1tV4Y2e9ixCzIXhcu6WYQJ9LEaQJOJ0DksTqEN7F2cgwPY7iNjpADiocYec33GvemPfGDT+KD3x4oOQx6Z4cAz7AFZZj+Mp432ZP0CPGYmOVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K9ii955f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K9ii955f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747819218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NJPos3YBLSU1UAISzp+dkM8QIUpmjEm9JfKB33N6Mq8=;
	b=K9ii955fSm0mL/yG1zLWApX52FIt+3N4+2PRLHdeHGnoGmqtrMaRfIBJyjTRtxMDc/m+6g
	zikGHwscQoB7bhllq7OpyItIw+WRAXNDbeCmjvXaJIaxsYkF/6rcrPc3Z4LyXw+YnBDAMX
	5Gyv7CLzIcBli2adNXy52np6NQE7Vec=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-HQAgbI2APHKX-fkZpdRr8Q-1; Wed, 21 May 2025 05:20:15 -0400
X-MC-Unique: HQAgbI2APHKX-fkZpdRr8Q-1
X-Mimecast-MFC-AGG-ID: HQAgbI2APHKX-fkZpdRr8Q_1747819214
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-acbbb000796so484034866b.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 02:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747819214; x=1748424014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NJPos3YBLSU1UAISzp+dkM8QIUpmjEm9JfKB33N6Mq8=;
        b=qE6BXhLlvNZgSA3YUvrCdJS3YkjjwVtBxq06LhSTUrDnCgGVUzskg3SqXLyoDRNJw/
         wDgo6d8I8nRIdl0CnqZHkM2lTtfMiasLhjhLqfouzQt4uY6NsSBRlvsk7Nkrc9ImXXhW
         GBmzJDGI7C5IHuDA22gGAYVNyY0Z0ijxoqOw/CUlu6nNxqR2m9qHAajyYKQ3kChfHLCW
         Ov7yB6CXEn6RNxulj2V/tqLdTkm1heBJmSW1sj3Nx4yKwEujF2tlu98Fvv8+teMJq0Ke
         SNXJxr7dPtmjDnu0swaEMV81lDugAXFNIDECs4sVKFAO4Qrh0mXm/NWZjwYG6kNrsZeb
         0K7w==
X-Forwarded-Encrypted: i=1; AJvYcCXXlkphzFbQpkRzdU53+JTAhXzZcJEBqF/eKbGvGv6VB1esJue5a4JRtELiiqllcREDo5SJxzc65b1hiHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMARQObv5YiE63DZ2f1lrkg9gk3xlKsQkreSYbXfjjLsUKPklj
	V6uU+u5PiSln4iDv8JWQx/McRWspH0DNeyG0wi5EnMbi+NTqsVtr8yJ3SfchiOqwHiewQXRbKrH
	0fMn9KYCZQwNTGwnmM8Lb83zAk1oo7n/mN+lwH/7PxlfKEHdnsGkIryNrsWy1KV/MRg==
X-Gm-Gg: ASbGncuFeG18YW7+pRGvZ63Q7l+cTK/HItn5TxbNTVGkGwzPnSQZQStmOaW1ArggBUG
	bm2FkreD+cGhJ+wmpiL3GvXT3pjkKzA4ZNgHL1ODHNlCeAvcgJ58/0qp/LN0WSG22zgDwbfMo+m
	WkL1tqY3jqfDyPW0Pqjfce//G07QdF5O6PwzP0CxIf+9Hnh9mEXV62IVDSP9eOERAm1KeCuQsIK
	BmtmPXR0NVs3AweXMFimBxcf+/LjJMGhd49wqyAISlRokt3+bcCyLPRpM6I/wqKvJyAEyD5w+XT
	e7uvIDrqhVeHa0eTEu9O5J9IVJFQ8oLotAehmSRX4Bv5+/R5PMfY1HBXrcj8QA4T6s7IxK8w3jW
	Rh8CyGqECq8s9sMzm2R89SsVeqKE8yyJV7xbBESpNXMG2EW3EEVtbNF5/2zW7DQ==
X-Received: by 2002:a17:907:96a1:b0:ad2:3f54:1834 with SMTP id a640c23a62f3a-ad536dce664mr1847647666b.40.1747819213619;
        Wed, 21 May 2025 02:20:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmn5qXIf8Mni2E1FpCrbqLmsDi9fGP5wHM4dBS+po1FRaB0XOZMJJYhP61VkBKwOFmXzgVJA==
X-Received: by 2002:a17:907:96a1:b0:ad2:3f54:1834 with SMTP id a640c23a62f3a-ad536dce664mr1847645066b.40.1747819213183;
        Wed, 21 May 2025 02:20:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04e821sm874759966b.17.2025.05.21.02.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 02:20:11 -0700 (PDT)
Message-ID: <496e6e58-8ed4-4536-bca8-feb89e7e6e69@redhat.com>
Date: Wed, 21 May 2025 11:20:11 +0200
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
Cc: haibo.chen@nxp.com, justin.jiang@nxp.com
References: <20250521025011.887562-1-qijian.guo@nxp.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250521025011.887562-1-qijian.guo@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Joseph,

Thank you for the new version.

For the next version, the subject here should have been "[PATCH v2] input: ...".

You can do this by doing e.g. :

git format-patch -v2 HEAD~
git send-email v2-0001-....patch

On 21-May-25 4:50 AM, Joseph Guo wrote:
> goodix touchscreen only support interrupt mode by default.
> Some panels like waveshare panel which is widely used on raspeberry pi
> don't have interrupt pins and only work on i2c poll mode.
> The waveshare panel 7inch panel use goodix gt911 touchscreen chip.
> 
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
> Reviewed-by: Haibo Chen <haibo.chen@nxp.com>
> ---
> Change from v1 to v2
> - Remove unused variable in goodix_ts_data struct
> - Use polling infrastructure
> ---
>  drivers/input/touchscreen/goodix.c | 50 ++++++++++++++++++++++++++----
>  1 file changed, 44 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index aaf79ac50004..58e49e5cf148 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -47,6 +47,7 @@
>  #define RESOLUTION_LOC		1
>  #define MAX_CONTACTS_LOC	5
>  #define TRIGGER_LOC		6
> +#define GOODIX_POLL_INTERVAL_MS		17	/* 17ms = 60fps */
> 
>  /* Our special handling for GPIO accesses through ACPI is x86 specific */
>  #if defined CONFIG_X86 && defined CONFIG_ACPI
> @@ -497,6 +498,14 @@ static void goodix_process_events(struct goodix_ts_data *ts)
>  	input_sync(ts->input_dev);
>  }
> 
> +static void goodix_ts_work_i2c_poll(struct input_dev *input)
> +{
> +	struct goodix_ts_data *ts = input_get_drvdata(input);
> +
> +	goodix_process_events(ts);
> +	goodix_i2c_write_u8(ts->client, GOODIX_READ_COOR_ADDR, 0);
> +}
> +
>  /**
>   * goodix_ts_irq_handler - The IRQ handler
>   *
> @@ -523,16 +532,33 @@ static irqreturn_t goodix_ts_irq_handler(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
> 
> +static void goodix_enable_irq(struct goodix_ts_data *ts)
> +{
> +	if (ts->client->irq)
> +		enable_irq(ts->client->irq);
> +}
> +
> +static void goodix_disable_irq(struct goodix_ts_data *ts)
> +{
> +	if (ts->client->irq)
> +		disable_irq(ts->client->irq);
> +}
> +
>  static void goodix_free_irq(struct goodix_ts_data *ts)
>  {
> -	devm_free_irq(&ts->client->dev, ts->client->irq, ts);
> +	if (ts->client->irq)
> +		devm_free_irq(&ts->client->dev, ts->client->irq, ts);
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
> +		}
> +	else
> +		return 0;
>  }

The '}' here is wrongly indented, also if you use {}, which is not strictly
necessary here, please use them in both branches of the if.

Since in this function we're dealing with a multi-line statement I think it
might be better to write this as:

static int goodix_request_irq(struct goodix_ts_data *ts)
{
	if (!ts->client->irq)
		return 0;

	return devm_request_threaded_irq(&ts->client->dev, ts->client->irq,
					 NULL, goodix_ts_irq_handler,
					 ts->irq_flags, ts->client->name, ts);
}

This will also make the diff smaller.

Or you can keep what you have and drop the {}.

Regards,

Hans





>  static int goodix_check_cfg_8(struct goodix_ts_data *ts, const u8 *cfg, int len)
> @@ -1229,6 +1255,18 @@ static int goodix_configure_dev(struct goodix_ts_data *ts)
>  		return error;
>  	}
> 
> +	input_set_drvdata(ts->input_dev, ts);
> +
> +	if (!ts->client->irq) {
> +		error = input_setup_polling(ts->input_dev, goodix_ts_work_i2c_poll);
> +		if (error) {
> +			dev_err(&ts->client->dev,
> +				 "could not set up polling mode, %d\n", error);
> +			return error;
> +		}
> +		input_set_poll_interval(ts->input_dev, GOODIX_POLL_INTERVAL_MS);
> +	}
> +
>  	error = input_register_device(ts->input_dev);
>  	if (error) {
>  		dev_err(&ts->client->dev,
> @@ -1435,7 +1473,7 @@ static int goodix_suspend(struct device *dev)
> 
>  	/* We need gpio pins to suspend/resume */
>  	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_NONE) {
> -		disable_irq(client->irq);
> +		goodix_disable_irq(ts);
>  		return 0;
>  	}
> 
> @@ -1479,7 +1517,7 @@ static int goodix_resume(struct device *dev)
>  	int error;
> 
>  	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_NONE) {
> -		enable_irq(client->irq);
> +		goodix_enable_irq(ts);
>  		return 0;
>  	}
> 
> --
> 2.34.1
> 

