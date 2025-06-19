Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBD2207DEF
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750318307; cv=none; b=nEHfKrMGcwBIJSFVzJQ2pTzo0DX5xFia8Az2AMt694zS4bxc4ZVSJ5DKyeBOodL/VmVuo7cstm2kEnU7LKxB1hkwLOh46OunZtZ9fA3lQKFom39RwvjiH3Dx0Mn8p6/DIpgLnshkUai9jgILM7QvenyZHw07CMrqHyUsYGxdogE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750318307; c=relaxed/simple;
	bh=h/xAbTgqwuDuCs07xJgrDe0Zl4dSSM0gNNwMrlIxM4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YxVfQjv+y0qhbnDGWW8doPGKTVEkODM9Zhia8jT3eBzZCNPdY1CqdNG5fXwP8dUEq5BYv90UhPG2xb5N5EJ/ZMW16HwhoXqiEy8VUmeN4Uxadb8uN3ycIHzZVTar/70iCiuc/ulFxIBlABIF7w+4WxVy0ohkTWzFaoJigI7YyI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WrsIaStf; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WrsIaStf"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7426c44e014so380659b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 00:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750318304; x=1750923104; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/6HEeVYXpXU6RreyOy7zn5CfwVrX4q21JdmfX9O+7vE=;
        b=WrsIaStflcS+BtjUi9gmFHObJuC5gl/OyoV0Lkw36FfPIqBHv5PEuCmMZ9Mpz586+9
         5ipUOPYEaqxkOuxVxqCtpnck27Ow0XjiJElcwSYBDpbMNCd89NAYSI3ojtOGqYeKqmeD
         pWadNSYYwoCVk5C4Nzcf8AIoE7lji+/PslNiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750318304; x=1750923104;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/6HEeVYXpXU6RreyOy7zn5CfwVrX4q21JdmfX9O+7vE=;
        b=i3QxGZEZ4iqX04wWHrQoQ9kCgEj1DN2mq408UjVZgt3Dm1SPJ9yl7KWWVXqHkfShXK
         Y4MRfpzLCDH6q7LVurMP7qh23myE8GCzH9cISGp0Jaa6mbfw5avnlYfQyDPRF3ULw33i
         HXBBEtFdTp+YNOMnrM0iEwY8IWkAe+ose4rbHP7EpCbNTgo8WD+0W9OEEmURu17rr2jI
         ZJY1dBT9XVJ6h8J2hn2nYHR2jKOX8JagYAz0SE984Uu5GJquDwTI8UYvTpvhKRKl/DBT
         EwC16QNnHVJqZsxIHw3Xbx+bBBuG1bqDyg17wDAS8nQM+a6xGoSdzOvMZ8oKq5dx7E8m
         uJjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj7SJyDsWHalnNCXAwMU473LRdCfcGne7sosSQbZROzwI7WTBtSLk7a2xu3n505a6uqwXNABttvIVueuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDRqBLroqb3P2ncKPNRYYR7EgvaQnR6s8TnQvV0DfGrM9hIyvD
	aw4Q4KplR6qriGdNGEL225qU9DL1OQAGuNshrgNEjEG4U1W13z50cf5vQBxtASiayA==
X-Gm-Gg: ASbGnctzzKzDROnTb3nfxW5nDO831BpKragX69aaQgbUUYmI7BTL5PHzqHq0Jbh5kV/
	VkoccucIlXnH3UTJ7xUTU2hKEJVVKeINjbnVaVu+skhRhRqS57Dwl7h8XMieGuvWQRm2khTAvQo
	BW8PzC7DwLreM7zul16uUkB4PF6G4oXSBcK4UKuOvUnhVR7ynXSWgeHVgMY0JZB63xXjmbtGI2k
	f2bXWxU32x9RA+57zPqYwsvGu+CWFUMhP0ggCu2BX6eZrVbSbdKn/4uxcBMq5ow0vMgAkTBq356
	iMrUOSaEv6ukixMxfBoKp4XvY8Fcx1oi/BCrTwfSRfuK4vKFMcH179Tw
X-Google-Smtp-Source: AGHT+IF0ZYZgWeMtdv/hdPMG5U98Dqrg1Jl+7X1ZOlhA9cR0wv8e8vSVU5qxSXVj3uoB4yRwTNll9A==
X-Received: by 2002:a05:6a21:6d8c:b0:21f:53a9:b72c with SMTP id adf61e73a8af0-21fbd5d4e88mr30033304637.38.1750318304219;
        Thu, 19 Jun 2025 00:31:44 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:ccaf:647f:8bd4:277f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe168d7ecsm12385185a12.64.2025.06.19.00.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 00:31:43 -0700 (PDT)
Date: Thu, 19 Jun 2025 15:31:39 +0800
From: Sung-Chi Li <lschyi@chromium.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 3/3] hwmon: (cros_ec) register fans into thermal
 framework cooling devices
Message-ID: <aFO82_5riDyC0FMs@google.com>
References: <20250512-cros_ec_fan-v3-0-a9f2b255f0cd@chromium.org>
 <20250512-cros_ec_fan-v3-3-a9f2b255f0cd@chromium.org>
 <7309c804-19e3-4715-b8c9-efa31c8ea9e1@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7309c804-19e3-4715-b8c9-efa31c8ea9e1@t-8ch.de>

On Mon, May 12, 2025 at 09:35:47AM +0200, Thomas Weißschuh wrote:
> On 2025-05-12 15:11:57+0800, Sung-Chi Li via B4 Relay wrote:
> > +	if (!IS_ENABLED(CONFIG_THERMAL))
> > +		return;
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
> 
> The failures are swallowed silently. They should be propagated.
> 

After rethinking  about the logic, I think I should try and register all fans
with best effort, so I should not return immediately; instead, I will log an
warning log, and continue with the next fan.

> > +
> > +		type = devm_kasprintf(dev, GFP_KERNEL, "%s-fan%zu", dev_name(dev), i);
> > +		if (!type)
> > +			return;
> > +
> > +		cpriv->hwmon_priv = priv;
> > +		cpriv->index = i;
> > +		cdev = devm_thermal_of_cooling_device_register(dev, NULL, type, cpriv,
> > +							       &cros_ec_thermal_cooling_ops);
> > +		if (!cdev)
> 
> ..._cooling_device_register() returns an error pointer on failure, not NULL.
> 

Thank you, will use IS_ERR for checking and %pe to print error.

> > +			return;
> > +	}
> > +}
> > +
> >  static int cros_ec_hwmon_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> > @@ -412,6 +489,7 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
> >  	cros_ec_hwmon_probe_temp_sensors(dev, priv, thermal_version);
> >  	cros_ec_hwmon_probe_fans(priv);
> >  	priv->fan_control_supported = cros_ec_hwmon_probe_fan_control_supported(priv->cros_ec);
> > +	cros_ec_hwmon_register_fan_cooling_devices(dev, priv);
> >  
> >  	hwmon_dev = devm_hwmon_device_register_with_info(dev, "cros_ec", priv,
> >  							 &cros_ec_hwmon_chip_info, NULL);
> > 
> > -- 
> > 2.49.0.1015.ga840276032-goog
> > 
> > 
