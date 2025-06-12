Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD42E2F4322
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 12:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749731595; cv=none; b=OA8nilytL6sk1gY7iRBfwYZXj86CHFK8k7k2w+5nTpIPmlf7EipR78FX4aiM9I1Xq9/kYJsgju/aRDIqgCtV6+X+JKGrji1f2QdZ6zeU3XuBHcr1G1qff7LvxSkiZCm/cblgA9acUBVIptN3mHISYo8IaCYg/FoL/cZjnFst0GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749731595; c=relaxed/simple;
	bh=8Pota8dkR02wT49S2HF4L/MTLN6ujHuKIgNCMs+APmE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GtW6Jr1pw3xqkJXIBiW7378FNyJGidaKNoltfg3UepQKhoIIF6tQ+g9HuMYLjeqCxehvDNJG38cA8bFCDzt1WA5mfvJjeihHKWsShQhYirFZxQsOL3by+eJ8dHrIAqL9e/rAufGJzREnrpiI5/4ddL20Xasl/pb3qBevNQCNuq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=q6UflVGZ; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="q6UflVGZ"
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 969AF3F803
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 12:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1749731589;
	bh=Afhp3MnDZ8YSz90JTIix2BbrvKztAqO/KlIyy5S9co0=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=q6UflVGZ7dG9hwKRD2omMg+HIJ6C4l8+IVdxMXrAGTt4tsrYzFGJGTgf0cogCdQq4
	 QX5wXJ0MkALDuige0eYCisp03v7U90PXbQY2AVTr8RKQeMrigFENehe5fgh/PiVXxm
	 Ot2aMUuDwrrdWBpuycFDp34EXbfhmDxQZmYJX8UOss0Jyjgm6JY+MK6DqPTudTB0gR
	 XulHFcdMA5TGJT9oo0EeP4RdOzEdJ2rWLo8nFmlKd1KwOUbQyu0uYzDZ8tnLIWBTiT
	 xKnavyWKQmqKQMGWkUNs+h0oWxs7pMtIVLkTyQyAsRPDJ5nEzOR9b6gRSfn0HSrgOB
	 jw1sBtxzYd4EQ==
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4033c872b60so834732b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 05:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749731588; x=1750336388;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Afhp3MnDZ8YSz90JTIix2BbrvKztAqO/KlIyy5S9co0=;
        b=EFRoD8yfyPpkBGXR26QVFYrQ9pFu85NfHgrGZhmeb8W2CRBOvP8GC5yOp/mwHi4f3Z
         Fu+qYdf5c5AfUYGGuNMk2zehx76hstvdsBFL58xXMTYXLDarDZbWFRDndqtsIcohS9Vx
         KHQFlnr2xpggk7tbNa7s16sZgow1U6TmWBfNo2oGBCRfg+Jnr13hKcoUyq32ZX2NAh8C
         tm+8Tkvfb+80MjHAkr24OItbfFBakbS6FsebVVyhUo9ftfx8Z70Xp62XH07j1CDcaxtM
         IbhS5u5I7GqOaHSHreVaj+PB6KHdW/vdMSc7+QnHWuvr6GT777bUCC7ai//t+RaGpOW1
         M8xw==
X-Forwarded-Encrypted: i=1; AJvYcCX6pZBPJYnXSDWmK9J3O32A4H24PHXQ4RGn79ZJ3W8WKMiHCxUmkLSoRmGHLuygkQCa01f9Ll4JYmVCSik=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUwh/iBbSAqpWmsL2XAQFxEktSrSnnX6+5Rpv1KJ7H5UkZXhL7
	8EgN1m/vQOKGFubBUYsKljzfqNUu0EuF1+4H9wYVYDUDx6ickn4yJKoEXjqXj+3hn0641tu13Co
	pcW7bHt26mqeElMIrng2uhfM4DMpJjLtCemGIqhaXk9Hxfga17F6sQ2UKXCKY0tBehukv8X1Wkh
	nDO3i28T3ZUQv9fMsBwS/7omrzFOZidmNRmw6duwm4awgnu0kt+2b7lLYn
X-Gm-Gg: ASbGncvhsUdyXl6KFs77FXB+07IGoPjvt6D9brWBXnxRPlam+P2g9oj8J7L4K93KdM9
	EWQIKZVgVjZHmKVpB1CmrwxMfpWCw+5WxMHJ4CT+A6ZmLPRKAaYV77xQj3mz2/3lbhBLzCqDH1U
	XoxA==
X-Received: by 2002:a05:6808:16a8:b0:409:f8e:7297 with SMTP id 5614622812f47-40a66904a25mr1784592b6e.0.1749731588029;
        Thu, 12 Jun 2025 05:33:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9HuVD3Y9Nh7ECoxqwi5r1Xuu8Ah9JUblEg9FqkvPNVWpQgNLnrb5MDLjHD3iYqYF983yf9ar+8ttzysxtSzM=
X-Received: by 2002:a05:6808:16a8:b0:409:f8e:7297 with SMTP id
 5614622812f47-40a66904a25mr1784576b6e.0.1749731587697; Thu, 12 Jun 2025
 05:33:07 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 12 Jun 2025 05:33:07 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-starfive-v1-0-8507b46516f5@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-starfive-v1-0-8507b46516f5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Thu, 12 Jun 2025 05:33:07 -0700
X-Gm-Features: AX0GCFtdm9VbqPFJLvMDFhcnx6E9vLWf-37xaveMuUbtcRw4xMIIZFLi_WmdP6o
Message-ID: <CAJM55Z-a19+wXSQtLbEgJDvFDuXCc=Q3NsJzLC7OS40FxOUuZA@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: starfive: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>, Emil Renner Berthing <kernel@esmil.dk>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>, 
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Bartosz Golaszewski wrote:
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO chips in starfive pin control drivers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Thanks!

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
> Bartosz Golaszewski (2):
>       pinctrl: starfive: jh7100: use new GPIO line value setter callbacks
>       pinctrl: starfive: jh7110: use new GPIO line value setter callbacks
>
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 8 +++++---
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 7 ++++---
>  2 files changed, 9 insertions(+), 6 deletions(-)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250612-gpiochip-set-rv-pinctrl-starfive-89120203688c
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
