Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC8372603
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 11:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746617553; cv=none; b=t3cYp3WCgXGCrm9QRgF6+E5ZhjN1yTSXX+eOKEk2H+yT92cOCy8W+DSDmIpe6LAHesY/J+VAbRVgCRU0jw89MYma20fb5U3N1yw4CEotLfUUjPsW3S1lVZ42Ek5vuvY0Wbcx5npVhhrsMeZbXGDwgcaEqBBTcy1zWirQKhdeJ0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746617553; c=relaxed/simple;
	bh=3XbAz2PGXTRyrdvEhkXrGX16BDmtijuZ4bay8iyN02Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uRY3JZ1Eht/7URqx5r7kQvzoH3k0gQ2tvektCxxdvf09vCIiqdDUFHdPWEPWuOxC6Amf7ziyPhEzN850KUp0P2JteN8ddu2Vc3gJBQH5jSdEAg2Ye9iSZNvtI+HZzdgf2TIEAVvQ5e7WHfUUxCZxJUv2bEcgo/XUjcKJ5zW/C6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vw5ND7Rx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vw5ND7Rx"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso12207125e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 04:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746617550; x=1747222350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nb+zlo587RuPjZXBWr3+oLX8zkFQSZwHVEcLM+1lwB8=;
        b=vw5ND7Rx5+lkbzZeLWZ6WPBEWTxNcVx3hSjMP6HMR3ahY7OyvaI8rC4FfJlJSZYpQp
         eFOkcqNQhOswgb0yznonZ+TskDQt40sao3XnOlMob8Z7DFg80YhPmQ2pHJnt5iriTBYr
         yd8Y5KH5ktQ8mppxSiaxqyvSTsMxZG/zSTxZGQCog+TAd6YCwgfTD7myefBaWW+G8b1Z
         nof97H2C59nvdDi0VknOy8JlDYskeazSHv3glHd73lMViyQWGVnOFNWkXbrmrXEYmuU8
         7HMg7gYzDvnwSJwjlnGcHVasJcABjBi+2XYpAvCNSfIOeSzSjTZomZmiKGTzVshTnkU/
         kkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746617550; x=1747222350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nb+zlo587RuPjZXBWr3+oLX8zkFQSZwHVEcLM+1lwB8=;
        b=ri3znUz7q9mTY4NEoZvnIFsaSVRN/Q0WxHf64XA4nXYDIStmY5022HdHzNG8sgNE5S
         y/OxeLm/bhtPBtw62m6BNCmWuN2qTlv8414Zi210xptXA2DrgoXRn51j+76kfWh4bH8C
         wGGchucrzUdeBysl5RcEnf3FU7LXrtC4Q749rBQzzu3r5U3nKBcN5HvTfvfwfDVaknE1
         Pyd84Gci4JXQLn0DMjRZ1mBja9s2NpgIbaBSujcKIDKeG48sWN8ee2WKEfc1W4g4NVxU
         c081PYyMmpTdQmbeM3lxUCuci2Ldc4Idc8BBtFrn+uFxAyW9vB2dQqXK9MHWqfnkb1Mf
         dWXw==
X-Forwarded-Encrypted: i=1; AJvYcCW87F4kB6PYD5tlBCZeC5IUBo/4IkpOUN8dPFinbMWTRoIeK4V027VjF8ydh8wLYOX28hRfwZAn19rwgNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSRauzwAEco3fHOf4gGPEmJcB5g2QHV3f810hGdRQZglejgD+4
	unvzvN/69meu2ThPMQoFk33nUKXKnG5rMcAsOQqZ5+zUzP+A4YPu5+AB7H0a5AA=
X-Gm-Gg: ASbGncuHj0fpuRf19payaOf/QwV/SitWQYaWjRvGpiVnGR+mEmsW7Da0dP2zgLJER95
	V1C3Fq+aOgQxKznIz8qsVK9KS6SVP4zxK4Eed/D1buuOPHf/e/VYJFfmd6Ogi9npxyXp5KNuXNZ
	Sjo2X3Qy4IUxfXJoh51TJvh89g4sHDcp3YbjTJQfqwkSlYM8EYRDYOJk9y98cb/rhJrBB/fO4N4
	ZgXQeqSOEOzH1X/hk8LsK80AiL6DbV7vFdz5sEj94CsIBFVgTbMv1HgwMr7Dqh15RKGfOL4Lcu0
	zN76uD6zZgCgJQMKwocH63CwjTYvYqgTTtpJWyiV1Gk3IQ==
X-Google-Smtp-Source: AGHT+IEItGOXOrk5wMY3AvgagcMlmqm3t9UoMOHncdRejXrITI+PTxVIePkvuItRyBuA1HIIIAv1lQ==
X-Received: by 2002:a05:6000:250d:b0:391:4559:8761 with SMTP id ffacd0b85a97d-3a0b4a4b31emr2533881f8f.36.1746617549892;
        Wed, 07 May 2025 04:32:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a0b22bd6a3sm4059664f8f.27.2025.05.07.04.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 04:32:29 -0700 (PDT)
Date: Wed, 7 May 2025 14:32:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takahiro AKASHI <akashi.tkhro@gmail.com>
Subject: Re: [RFC 3/7] pinctrl: introduce pinctrl_gpio_get_config()
Message-ID: <aBtEyciwVip9FaKP@stanley.mountain>
References: <cover.1746443762.git.dan.carpenter@linaro.org>
 <0e982ace876920162d27a521f5f460b1dd6fc929.1746443762.git.dan.carpenter@linaro.org>
 <f59c3493-4630-4cf1-8d25-d4e9fbf23498@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f59c3493-4630-4cf1-8d25-d4e9fbf23498@oracle.com>

On Mon, May 05, 2025 at 10:00:35PM +0530, ALOK TIWARI wrote:
> > +int pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset, unsigned long *config)
> > +{
> > +	struct pinctrl_gpio_range *range;
> > +	const struct pinconf_ops *ops;
> > +	struct pinctrl_dev *pctldev;
> > +	int ret, pin;
> > +
> > +	ret = pinctrl_get_device_gpio_range(gc, offset, &pctldev, &range);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ops = pctldev->desc->confops;
> > +	if (!ops || !ops->pin_config_get)
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&pctldev->mutex);
> > +	pin = gpio_to_pin(range, gc, offset);
> > +	ret = ops->pin_config_get(pctldev, pin, config);
> 
> can we add reason here, as now we are not calling pin_config_get_for_pin()
> 
> https://lore.kernel.org/all/20231002021602.260100-3-takahiro.akashi@linaro.org/
> 

I don't even know why I changed that.  Using pin_config_get_for_pin()
works and it's cleaner.

regards,
dan carpenter

