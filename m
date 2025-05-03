Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02294625;
	Sat,  3 May 2025 13:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746277225; cv=none; b=oVn39LJKbUKLyp2RkrZ9/xj60DjBAU+uUAO0q1YCDP7BIUaFRb8QveZsKwAVheey4POGgZRsWHXYFyYbp5JOCuFJYi2SX1fv0eJQ2POP54rXyM0ox1jmsoSw6NBE03nzbk/x6t9njpDUIARTQFmAZ9vOnIktvx2g3N300jm5NPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746277225; c=relaxed/simple;
	bh=CXKu4H/gExEuag1WYaDGWJ9NEVzSoRhUlAA0Emc6Dtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mLdLQVVEzb5ZkF0JwH4O8pfmBRabqwnyxSeU7KFIUw4a09w7pPTxlBu22il/OGQh0zfsCB4jtKRtYa1NYFNYlGqfZT9xo30mckC9Kj0ijjWjiA6PNsnqiwUbU3ztrHfu8yglG+pg+y11YJ9qDgrnkCXh9j1SNUnX1YI6tXBvo+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JssKDrvW; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JssKDrvW"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30549dacd53so2650744a91.1;
        Sat, 03 May 2025 06:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746277223; x=1746882023; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=twPOWHPY/GpskP+shdCV8ZpfvXDrBpSMUkEVjHEyLPY=;
        b=JssKDrvWjvsjP9ocEIQVi0Nbs0keIesHCaYbGwDja7EuipgELt3aD0J2SDfTNuWyW/
         o60jg0ORXMAuoBoUwS7ER7nCrkO3D9YxadimctmEIWaLs5isbK7Jld+0qEAmLJ6iQ7IC
         I7ZuVhdEkLJoTWMyVujnNR3rK/MbLGOiVMBNv2ColqT/sXnDLHUjkWEg42O79iPZSjo/
         Axy3tNtdFQ756gsOt/3/qdCK6N39YP5MlndmwckGz41m2zgtVEWTHN6KJIRTVZv18meg
         mvxa0Kv3WXBOGRRBOdxl04CE2eOAFz3BH490pAgm3Q3LJpPhIWSL56igCFlRRBy3ULeM
         WdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746277223; x=1746882023;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twPOWHPY/GpskP+shdCV8ZpfvXDrBpSMUkEVjHEyLPY=;
        b=JYpARTOIRRigIKvRSstOvvyaCZXMbmpNmsKVaoEFOstYlrrIYLzq2emQ0yaFAv/Frx
         fnfUqi4iDPrnaGpAK8wQMd80bPfX3GjWHbgZuM7Cbe+Iunw9xtjRY2WtL3a2yJ+5Zsn3
         qq09DDG1iYYBBqszsLjsIt9gocZjaOc2i6szw2hFiPiHRMQ49NWc/Xfg/fVpsIjIfFaX
         O6BMP09/b2IfK9PQufF3UbiF6I/85JlsD2pEEo7fsFEz0toi5DrtTHJTQ9WZHUByxafx
         NxDg4wSvQy+6YilF1qs4OZYXWDO7bfZ/pM/6QB4In8NHpYOahUBOyXt5jqbZCuV+BEsY
         A/7g==
X-Forwarded-Encrypted: i=1; AJvYcCUstkXpCX4aN0uiPr1gargpcnaCJT+lQrmhhJJu5obhJ2ES2JrXRUjj4YxCOSQ6h8BNsePmoFq/Z/OgzHY9@vger.kernel.org, AJvYcCVkPDjoEd/MslnArJEbszqITtLhfIsa+HaednuVzDWPHpsZlYxQXMft2X0+kpOnMJkckQiW+olQpwQ=@vger.kernel.org, AJvYcCXTODrp5qLlRttxekn1mghowwc9KIVH0DUezIGrXt/hRlvnBfEPJt6tnqTDMwqpOvVA4vAQ5MKDJ0z0QKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQkqM0x/bGoVSlfiQDeNe/16d7gepwBRWOGLO5X/7/zk4/Ox+w
	9nbZ3MOil8gacSb7mzz2v+n/NKtHcMNRTjTiHZ5YCW6Jwk81S98fCkUSMg==
X-Gm-Gg: ASbGnctjhKWV0CguJsIjHGFDnfkTNmt9Q0BHwTt9RBDfO+ScqMdHcdGa1GFgQZ0WyaC
	WUGj4IdnapL95Mky81PyH69Orv+6FiJVdSOL5Z722O+8cxdyr3C7Cq8nWwTIWqwggw17U0C5PsZ
	Rz/7nytlQ8ZRouqaq79Uww7k7yW4hMtpSSDWAs0ytTRM3IUBpR0i/FOQtKZ6qtd3R8oQvSIHUPq
	YY1SAsd0Nf34a4DfBkhKYldbfOWnOoV8qRmQXZBnq08EDjNuoCDP0TZQ8MorZngn4+qesRSRoeh
	g2LX/gXqR4pUK1x+2JfdpJB0PzJMZpUC6oP+T5+RpEcklMaYDw+SwKPVj44oCNCIftvuABDFIZd
	y3xbqyiQW6rOKSQ==
X-Google-Smtp-Source: AGHT+IGh9QMhehvMqHM+03Y6+Krdv6YrngeRJXvgc66Yloc6GVh4yixIl7pN8C01HUSDojOFesHLhg==
X-Received: by 2002:a17:90b:4ec3:b0:2fa:42f3:e3e4 with SMTP id 98e67ed59e1d1-30a42e52f4fmr13897349a91.3.1746277223080;
        Sat, 03 May 2025 06:00:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3480e9d4sm7712399a91.36.2025.05.03.06.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 May 2025 06:00:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f857fcdb-0da1-4bc7-9e7a-541317d8b424@roeck-us.net>
Date: Sat, 3 May 2025 06:00:20 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] hwmon: (cros_ec) register fans into thermal
 framework cooling devices
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 lschyi@chromium.org
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 Sung-Chi Li <lschyi@google.com>
References: <20250502-cros_ec_fan-v2-0-4d588504a01f@chromium.org>
 <20250502-cros_ec_fan-v2-3-4d588504a01f@chromium.org>
 <b2432c5c-2589-4cfe-821f-47e5128af2d0@t-8ch.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <b2432c5c-2589-4cfe-821f-47e5128af2d0@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/3/25 00:27, Thomas Weißschuh wrote:
> On 2025-05-02 13:34:47+0800, Sung-Chi Li via B4 Relay wrote:
>> From: Sung-Chi Li <lschyi@chromium.org>
>>
>> Register fans connected under EC as thermal cooling devices as well, so
>> these fans can then work with the thermal framework.
>>
>> During the driver probing phase, we will also try to register each fan
>> as a thermal cooling device based on previous probe result (whether the
>> there are fans connected on that channel, and whether EC supports fan
>> control). The basic get max state, get current state, and set current
>> state methods are then implemented as well.
>>
>> Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
>> ---
>>   Documentation/hwmon/cros_ec_hwmon.rst |  2 ++
>>   drivers/hwmon/cros_ec_hwmon.c         | 66 +++++++++++++++++++++++++++++++++++
>>   2 files changed, 68 insertions(+)
>>
>> diff --git a/Documentation/hwmon/cros_ec_hwmon.rst b/Documentation/hwmon/cros_ec_hwmon.rst
>> index 5b802be120438732529c3d25b1afa8b4ee353305..82c75bdaf912a116eaafa3149dc1252b3f7007d2 100644
>> --- a/Documentation/hwmon/cros_ec_hwmon.rst
>> +++ b/Documentation/hwmon/cros_ec_hwmon.rst
>> @@ -27,3 +27,5 @@ Fan and temperature readings are supported. PWM fan control is also supported if
>>   the EC also supports setting fan PWM values and fan mode. Note that EC will
>>   switch fan control mode back to auto when suspended. This driver will restore
>>   the fan state before suspended.
>> +If a fan is controllable, this driver will register that fan as a cooling device
>> +in the thermal framework as well.
>> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
>> index c5e42e2a03a0c8c68d3f8afbb2bb45b93a58b955..abfcf44fb7505189124e78c651b0eb1e0533b4e8 100644
>> --- a/drivers/hwmon/cros_ec_hwmon.c
>> +++ b/drivers/hwmon/cros_ec_hwmon.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/platform_device.h>
>>   #include <linux/platform_data/cros_ec_commands.h>
>>   #include <linux/platform_data/cros_ec_proto.h>
>> +#include <linux/thermal.h>
> 
> Needs a dependency on CONFIG_THERMAL.
> 
>>   #include <linux/types.h>
>>   #include <linux/units.h>
>>   
>> @@ -27,6 +28,11 @@ struct cros_ec_hwmon_priv {
>>   	u8 manual_fan_pwm_values[EC_FAN_SPEED_ENTRIES];
>>   };
>>   
>> +struct cros_ec_hwmon_cooling_priv {
>> +	struct cros_ec_hwmon_priv *hwmon_priv;
>> +	u8 index;
>> +};
>> +
>>   static int cros_ec_hwmon_read_fan_speed(struct cros_ec_device *cros_ec, u8 index, u16 *speed)
>>   {
>>   	int ret;
>> @@ -300,6 +306,34 @@ static const struct hwmon_channel_info * const cros_ec_hwmon_info[] = {
>>   	NULL
>>   };
>>   
>> +static int
>> +cros_ec_hwmon_cooling_get_max_state(struct thermal_cooling_device *cdev,
>> +				    unsigned long *val)
>> +{
>> +	*val = 255;
>> +	return 0;
>> +}
>> +
>> +static int cros_ec_hwmon_cooling_get_cur_state(struct thermal_cooling_device *cdev,
>> +					       unsigned long *val)
>> +{
>> +	const struct cros_ec_hwmon_cooling_priv *priv = cdev->devdata;
>> +	u8 read_val;
>> +	int ret = cros_ec_hwmon_read_pwm_value(priv->hwmon_priv->cros_ec, priv->index, &read_val);
> 
> Split declaration and assignment.
> 
>> +
>> +	if (ret == 0)
>> +		*val = read_val;
>> +	return ret;

Also, error handling always comes first.

	if (ret)
		return ret;

	*val = read_val;
	return 0;

>> +}
>> +
>> +static int cros_ec_hwmon_cooling_set_cur_state(struct thermal_cooling_device *cdev,
>> +					       unsigned long val)
>> +{
>> +	const struct cros_ec_hwmon_cooling_priv *priv = cdev->devdata;
>> +
>> +	return cros_ec_hwmon_write_pwm_input(priv->hwmon_priv->cros_ec, priv->index, val);
>> +}
>> +
>>   static const struct hwmon_ops cros_ec_hwmon_ops = {
>>   	.read = cros_ec_hwmon_read,
>>   	.read_string = cros_ec_hwmon_read_string,
>> @@ -307,6 +341,12 @@ static const struct hwmon_ops cros_ec_hwmon_ops = {
>>   	.is_visible = cros_ec_hwmon_is_visible,
>>   };
>>   
>> +static const struct thermal_cooling_device_ops cros_ec_thermal_cooling_ops = {
>> +	.get_max_state = cros_ec_hwmon_cooling_get_max_state,
>> +	.get_cur_state = cros_ec_hwmon_cooling_get_cur_state,
>> +	.set_cur_state = cros_ec_hwmon_cooling_set_cur_state,
>> +};
> 
> Move this directly after the definition of the functions.
> 
>> +
>>   static const struct hwmon_chip_info cros_ec_hwmon_chip_info = {
>>   	.ops = &cros_ec_hwmon_ops,
>>   	.info = cros_ec_hwmon_info,
>> @@ -374,6 +414,31 @@ static bool cros_ec_hwmon_probe_fan_control_supported(struct cros_ec_device *cro
>>   	       is_cros_ec_cmd_fulfilled(cros_ec, EC_CMD_THERMAL_AUTO_FAN_CTRL, 2);
>>   }
>>   
>> +static void cros_ec_hwmon_register_fan_cooling_devices(struct device *dev,
>> +						       struct cros_ec_hwmon_priv *priv)
>> +{
>> +	struct cros_ec_hwmon_cooling_priv *cpriv;
>> +	size_t i;
> 
> if (!IS_ENABLED(CONFIG_THERMAL))
> 	return;
> 
>> +
>> +	if (!priv->fan_control_supported)
>> +		return;
>> +
>> +	for (i = 0; i < EC_FAN_SPEED_ENTRIES; i++) {
>> +		if (!(priv->usable_fans & BIT(i)))
>> +			continue;
>> +
>> +		cpriv = devm_kzalloc(dev, sizeof(*cpriv), GFP_KERNEL);
>> +		if (!cpriv)
>> +			return;
>> +
>> +		cpriv->hwmon_priv = priv;
>> +		cpriv->index = i;
>> +		devm_thermal_of_cooling_device_register(
>> +			dev, NULL, devm_kasprintf(dev, GFP_KERNEL, "cros-ec-fan%zu", i), cpriv,
> 
> What happens for multiple/chained ECs? If both provide sensors the
> thermal device names will collide.
> 
> Error handling for devm_kasprintf() is missing.
> 
>> +			&cros_ec_thermal_cooling_ops);
> 
> Error handling for devm_thermal_of_cooling_device_register() is missing.
> 
>> +	}
>> +}
>> +
>>   static int cros_ec_hwmon_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>> @@ -402,6 +467,7 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
>>   	cros_ec_hwmon_probe_fans(priv);
>>   	priv->fan_control_supported =
>>   		cros_ec_hwmon_probe_fan_control_supported(priv->cros_ec);
>> +	cros_ec_hwmon_register_fan_cooling_devices(dev, priv);
>>   
>>   	hwmon_dev = devm_hwmon_device_register_with_info(dev, "cros_ec", priv,
>>   							 &cros_ec_hwmon_chip_info, NULL);
>>
>> -- 
>> 2.49.0.906.g1f30a19c02-goog
>>
>>

