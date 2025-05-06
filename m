Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB4E2D4B68
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 02:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746499785; cv=none; b=Htp0evWft2Sp+wq3UOE0coaKtwJnncVEw3kjSPjZEHzmc8QiDnDyXJq4Wa1gX1uVgx7Sef1iGlZcnMr5cqu+znp9BxuWjuJG5xqZ/67qyIfUqfaV6DCGvfxgNI6x3wDFu7xWK8inBdJEOb7s3rYHeK6ARM7LMVuRNAnMqJ4jxIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746499785; c=relaxed/simple;
	bh=BVcS6y/RkytdfYbg6aiFphNw4k53SlFmqyW2ahlf+8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufzjUcwhQpmXQHR1LvyCzCXalyuGKVtx0hhD3hkCBN+cSVEcEvvKRUnP+nmxD4EaBTiByo/oJC0kfIErg22JTr/vm/VumJjyjOKUlAiDa0ApNtoXU28E7jkUoX3Nc03PKxd0HK/YQvLj7i7jcwRB83ja0QQlOYpsGEeYUUx9XA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KTjtg1OE; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KTjtg1OE"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so4599527b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 19:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746499782; x=1747104582; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q0+JSDpYT5BNX3k6gPTP+QpNOml9kj6YJgCfvY0JCRs=;
        b=KTjtg1OEHaijcvjo+g0DgZpMEWvryOFq4uOnmLvDSZPE3l2KjSX2P4zaX2XVZosm+J
         NyeEkECA21eh5/ct5hV+99+fu76Oymt6THZe40hSXSO9eYiCB6okRSEZjhNzUZr5TVt/
         +ZllpcB7MgSLRdW0LAbb9J5lLI90bV2245AYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746499782; x=1747104582;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q0+JSDpYT5BNX3k6gPTP+QpNOml9kj6YJgCfvY0JCRs=;
        b=nUkitu7d105rYO2bjDHNwviPy/LdkxRHSp7KDINVzVI9sZv4EeDwlC4G/v4KY4ZPr1
         oh0LlKbwAFyPzq/YK7B35nhhaIjAEhQQ5W2t0sKeK4dkqCke9AB1RJR2a6JFicJAv1QF
         KH96+8vDkflhy9XcFG1/K3TFO71Dj+5SoOv3D8UK3SlZBWzJK+UoxSbJEYSosc1BtGxK
         ajMLjLr048F7u2DymYnKus9NaBLBOMeXQ+/VReoCk4ScJqgRUiLm4jy3IOarlkyRjPn1
         ZRf2TZ6d/O0t/1gIRk6+2x5ouhCmzbBltmv9m+LLdDzpkzi7qma5Vz5Tjy70bRdlMj+k
         f34Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEe/aKNBI8HT4uu+T0OInlqftUes+/12NOB5Mk6dYb7g5cFqeMfVyPRV3F9AVhGL27Xpd0jmDiwTKe2co=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN+/tTlFT2i89qb5IQMKfsiOiiSO06u+/a5aZiA6xArSeVSkfu
	KfBu1YXRJaqq9wbTDhE0BRqPdZrzUUhNl14rbGtgQTyQaAQ7/tYxOVwQqV1NRg==
X-Gm-Gg: ASbGncs/tKTWvfARypqL7Hbt4PjK0Q6KQGk2OexPEcYMEfN8Xl2w51pusEMmUm04Rdl
	kbXxodVSriHvZIVYcRol/jDPRxtyh4I9lkGyImaAWPEmdmcKczyxzH/9WpiQfVkBZ9U+i2VeEnz
	uPr0QcDt7xvPBl8Cx9OlFmKi8TrSR2QUpUBFb+CXHldCI24wJOD9i71eNFYKiqFUINYmhMSwKBm
	sAtRmVZPQYthcUl3kwMNv4AiaLZUMP18fawsKBEVnuVuBH/K1o8nbXahb0zjwCXIW/O2kIP1s7L
	tG6qTQOE/JUC2tprR77bDmo0X6LZIqrSrQ==
X-Google-Smtp-Source: AGHT+IEEZ1PfoCNd1C1LjNnH37ZRF5k8qCVtLcVSMSDNAUIZcoEsuzle0aPuWxV/v0FJ4LrYSFQ+Ew==
X-Received: by 2002:a05:6a20:2d2b:b0:1f5:619a:8f75 with SMTP id adf61e73a8af0-20e96108b51mr15452923637.2.1746499782489;
        Mon, 05 May 2025 19:49:42 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:d4bd:e7e5:608:dbd7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c6b6d8sm6384494a12.69.2025.05.05.19.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 19:49:42 -0700 (PDT)
Date: Tue, 6 May 2025 10:49:37 +0800
From: Sung-Chi Li <lschyi@chromium.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (cros_ec) register fans into thermal
 framework cooling devices
Message-ID: <aBl4wcX889otz_ms@google.com>
References: <20250502-cros_ec_fan-v2-0-4d588504a01f@chromium.org>
 <20250502-cros_ec_fan-v2-3-4d588504a01f@chromium.org>
 <b2432c5c-2589-4cfe-821f-47e5128af2d0@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2432c5c-2589-4cfe-821f-47e5128af2d0@t-8ch.de>

On Sat, May 03, 2025 at 09:27:18AM +0200, Thomas Weißschuh wrote:
> On 2025-05-02 13:34:47+0800, Sung-Chi Li via B4 Relay wrote:
> > From: Sung-Chi Li <lschyi@chromium.org>
> > 
> > Register fans connected under EC as thermal cooling devices as well, so
> > these fans can then work with the thermal framework.
> > 
> > During the driver probing phase, we will also try to register each fan
> > as a thermal cooling device based on previous probe result (whether the
> > there are fans connected on that channel, and whether EC supports fan
> > control). The basic get max state, get current state, and set current
> > state methods are then implemented as well.
> > 
> > Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> > ---
> >  Documentation/hwmon/cros_ec_hwmon.rst |  2 ++
> >  drivers/hwmon/cros_ec_hwmon.c         | 66 +++++++++++++++++++++++++++++++++++
> >  2 files changed, 68 insertions(+)
> > 
> > diff --git a/Documentation/hwmon/cros_ec_hwmon.rst b/Documentation/hwmon/cros_ec_hwmon.rst
> > index 5b802be120438732529c3d25b1afa8b4ee353305..82c75bdaf912a116eaafa3149dc1252b3f7007d2 100644
> > --- a/Documentation/hwmon/cros_ec_hwmon.rst
> > +++ b/Documentation/hwmon/cros_ec_hwmon.rst
> > @@ -27,3 +27,5 @@ Fan and temperature readings are supported. PWM fan control is also supported if
> >  the EC also supports setting fan PWM values and fan mode. Note that EC will
> >  switch fan control mode back to auto when suspended. This driver will restore
> >  the fan state before suspended.
> > +If a fan is controllable, this driver will register that fan as a cooling device
> > +in the thermal framework as well.
> > diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> > index c5e42e2a03a0c8c68d3f8afbb2bb45b93a58b955..abfcf44fb7505189124e78c651b0eb1e0533b4e8 100644
> > --- a/drivers/hwmon/cros_ec_hwmon.c
> > +++ b/drivers/hwmon/cros_ec_hwmon.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/platform_data/cros_ec_commands.h>
> >  #include <linux/platform_data/cros_ec_proto.h>
> > +#include <linux/thermal.h>
> 
> Needs a dependency on CONFIG_THERMAL.
> 

I think adding the `if (!IS_ENABLED(CONFIG_THERMAL))` you suggested is
sufficient, and turning on or off CONFIG_THERMAL both can compile, so I'll only
add the guarding statement in the `cros_ec_hwmon_register_fan_cooling_devices`.

> > +
> > +	if (!priv->fan_control_supported)
> > +		return;
> > +
> > +	for (i = 0; i < EC_FAN_SPEED_ENTRIES; i++) {
> > +		if (!(priv->usable_fans & BIT(i)))
> > +			continue;
> > +
> > +		cpriv = devm_kzalloc(dev, sizeof(*cpriv), GFP_KERNEL);
> > +		if (!cpriv)
> > +			return;
> > +
> > +		cpriv->hwmon_priv = priv;
> > +		cpriv->index = i;
> > +		devm_thermal_of_cooling_device_register(
> > +			dev, NULL, devm_kasprintf(dev, GFP_KERNEL, "cros-ec-fan%zu", i), cpriv,
> 
> What happens for multiple/chained ECs? If both provide sensors the
> thermal device names will collide.
> 

How about changing the "cros-ec-fan%zu" to "%s-fan%zu", which prefixes the
`dev_name()`? Here is an example from a device: cros-ec-hwmon.12.auto-fan0.

> Error handling for devm_kasprintf() is missing.
> 

Thank you for catching this, I will skip registering that device if the
devm_kasprintf() fails.

> > +			&cros_ec_thermal_cooling_ops);
> 
> Error handling for devm_thermal_of_cooling_device_register() is missing.
> 

I think we should continue registering other fans, so maybe we add a warning
here if the registration fails?

> > +	}
> > +}
> > +
> >  static int cros_ec_hwmon_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> > @@ -402,6 +467,7 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
> >  	cros_ec_hwmon_probe_fans(priv);
> >  	priv->fan_control_supported =
> >  		cros_ec_hwmon_probe_fan_control_supported(priv->cros_ec);
> > +	cros_ec_hwmon_register_fan_cooling_devices(dev, priv);
> >  
> >  	hwmon_dev = devm_hwmon_device_register_with_info(dev, "cros_ec", priv,
> >  							 &cros_ec_hwmon_chip_info, NULL);
> > 
> > -- 
> > 2.49.0.906.g1f30a19c02-goog
> > 
> > 
