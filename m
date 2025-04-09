Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FC7262811;
	Wed,  9 Apr 2025 14:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209175; cv=none; b=Uds99HFVBPtaxkZ9kF2G1deoke72rP9ww3j0typHBRcXGu5x+7kWAFZTGooVaLcOJCTb7pvowZByyatz5zwqZWqtY/4IKnSUISiWczgkDcpMkryVIVFc+N9t8WyYOiGBU1HyJOJOyjCIwbIvrSz21qCfCSpaqi12R+PsMpNWwfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209175; c=relaxed/simple;
	bh=dgs4VNIUccb3VKlgy5RETMbn/dH56y2TOWu0Ep1tE0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u9d8waGSBvyyMo6R+9ZKfIZoke6CWBHMEo/b8Fia93hjh7qEerqMW1YUybphALnOCPUxX4eLVPniZdQoHCkZgU6/Cm9ROFUZuYvOg7+QBw+ajDx8QWxS8k0PZXYS/nyXGrxcqmnL8xlXEjxKhy2rYO64MkfLYN/yVryOO7wdU4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7/hrkG2; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7/hrkG2"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-227b650504fso64334915ad.0;
        Wed, 09 Apr 2025 07:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744209173; x=1744813973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hACfhNRwlqXovej2hysiEcuy4h8cF45gwT3gzZ3u9kk=;
        b=B7/hrkG2zh+iJFpVEu+VGJBnDyThX626GdhNeBLKiW4F4oGlEAnOP/ewF8jALIoR9w
         ynMZpyKZwqu/cPZLP3A5LN8Q9zBkjseV9Oia2S/PPBxNdQl/k5Wh5euqwNJwxJno+CJw
         igosXybf1+hpm8mdLBbr0EeCRb6TB1IbNe7KCgOzD6MJzC4xb7vWTIQYZgw4iv4mTfMC
         jYvQEx/c69/smu5ts8FxAxhi7gHppo1AGtI0fcBOb3G8iEJkP8dUbcNscoVejcaMxgAX
         2QcNT5mdF09GBiOpEHWCQZymeI3+VJwj+FDDnvu/AbBDUl61VckIpD6FjP+dDKvygsvH
         oZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744209173; x=1744813973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hACfhNRwlqXovej2hysiEcuy4h8cF45gwT3gzZ3u9kk=;
        b=RItt43X9PfOrFNR8j8DgWAuTRdf6ksHS3GqLZSpO/MkFLMYHT8qHRYX4rFDVK2yQWJ
         I2GmNYyrCZTv3X6cry+xnt1AQm8PQL/6q8FyXCJqE+e8p8xnLU0ZAcmFLiYaDaUdFRgz
         +kjgomdL0zM6R2DoUjqbeXoRnknNLwRdM/ir22qfkyoxK8e5FgQ3Co5YUu61QCY+WvdX
         TgLOg965qkcjnBicVsO9XskqapKurCGGTHa4ZIjMJ2ADsfLukI8iFeY2jltUy/cOOxt9
         7tQmDkyNRZEgyDAsibgoHucMCELYPU1EUi6iMCLK357j3S2tofybadXedldlGSVDr6rV
         SBug==
X-Forwarded-Encrypted: i=1; AJvYcCWCLZtMh/ocvogS6VZCIv7AnoFj2g44IHr2ATKljX6/2yZZc0Ps/LRH1M0MVYlriuvJQHMAB5tucicpPw==@vger.kernel.org, AJvYcCWt/GR+ekjF1/mTaTdFbGQB3lKXwOgrDtl3RT7DsSTLDr/1d6m8WfjftRZtGfqS6gFjYLs7U7elefgFBXhU@vger.kernel.org
X-Gm-Message-State: AOJu0YzGjb7VpQv5gZW1iHfJVVFR97uHG4bbIJWIkjrcM4Pyqn5rTAed
	dr7wuD+lJN8TRPU9j9f58/4W7NB/f4a/uvcFafFs1NkQKisFmk2W
X-Gm-Gg: ASbGnctb2OxZf5bEAM6+bgbCl1mXajDj6UINsqXI3YHdOxw5ieAobk5QxyuRA8R7soW
	gvQ/hpWKRAYamo1YlNXXBgc3O4SJfCEAP3AXUtjITyYFPqvWzuJnuBscqxXH4Y9yVbn7r5z2O0i
	e+5p+uObzcq3ZrZF7rS4EEQDUeI1QS1N2kebzh/7icVeUEhp88nRcKnc/bxgamj0XIdmgwfFKv2
	Xt4uZzjZQi3AvIi27vZV6VDNX/q85WNYRv15nELkX2Ok7mMNBQl3X27Ua4U9aAnRsQBT8U4nYLM
	PkCMDVrwDU8DlJFH3X4BvGCfFwTUWmZWm6kbVIEP66IO51ds65V+Kac0tUdDawCt
X-Google-Smtp-Source: AGHT+IHU1lXmIHmOtQjdOWvnkxGXNioa+/z6LgGjPgjk6iEbR/WK2GRs0RMBTbVw9FVcTLiUXbEByQ==
X-Received: by 2002:a17:903:1b03:b0:223:67ac:8929 with SMTP id d9443c01a7336-22ac3e100eamr43781285ad.0.1744209172512;
        Wed, 09 Apr 2025 07:32:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8aff9sm12583075ad.79.2025.04.09.07.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:32:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Apr 2025 07:32:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, s32@nxp.com, imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Florin Buica <florin.buica@nxp.com>
Subject: Re: [PATCH v2] hwmon: (ina2xx) make regulator 'vs' support optional
Message-ID: <badbf2eb-1968-4549-98eb-5ee916860090@roeck-us.net>
References: <20250409074529.2233733-1-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409074529.2233733-1-ciprianmarian.costea@oss.nxp.com>

On Wed, Apr 09, 2025 at 10:45:29AM +0300, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> According to the 'ti,ina2xx' binding, the 'vs-supply' property is
> optional. Use devm_regulator_get_enable_optional() to avoid a kernel
> warning message if the property is not provided.
> 
> Co-developed-by: Florin Buica <florin.buica@nxp.com>
> Signed-off-by: Florin Buica <florin.buica@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Applied, after converting multi-line comment to standard form.

Guenter

> ---
>  drivers/hwmon/ina2xx.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> index 345fe7db9de9..b79e9c2072b3 100644
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c
> @@ -959,8 +959,11 @@ static int ina2xx_probe(struct i2c_client *client)
>  		return PTR_ERR(data->regmap);
>  	}
>  
> -	ret = devm_regulator_get_enable(dev, "vs");
> -	if (ret)
> +	/* Regulator core returns -ENODEV if the 'vs' is not available.
> +	 * Hence the check for -ENODEV return code is necessary.
> +	 */
> +	ret = devm_regulator_get_enable_optional(dev, "vs");
> +	if (ret < 0 && ret != -ENODEV)
>  		return dev_err_probe(dev, ret, "failed to enable vs regulator\n");
>  
>  	ret = ina2xx_init(dev, data);
