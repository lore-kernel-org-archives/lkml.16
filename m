Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F84277808
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745397509; cv=none; b=jLbI2rLmJBLHG7dD0IcwURlOdFw3qjkxWqW/HSOqsnt/pRAEmf6yZdlNRv0bM+KH4Q7R9fbGUc6LGu0uQmlC8m/+wUjNb4r54CDPdiSC7nJ+etJBhm7/Urxm9vwGCFLvov4mF+FFB7LgpRCh3VHJULLguTdXZfQoT4Gr0PZgwtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745397509; c=relaxed/simple;
	bh=qBj3z1T7rwn3ux+C+eO3W5yXwh6jAnKUWzTTH12y0wc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RYIqSwmVhZQEgT/3zfORmq0ZxOxCxlOGmUW1Hqh5vY0d510lmO/xKPtjVwPxj0yLgALYyv+HYLdWv1r9GcOk6DFPGvSXMC/EbEXAzZ0+cQ9Ds04LfFq1pOkhWUibViuPNlIzR8g3y+e+H0FfwLapZujwWG+jIYOPXwUyMcjSiGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GxM94OvQ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GxM94OvQ"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so5865698e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 01:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745397505; x=1746002305; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSDycrf39wnAyWpIWRB4jBBrGHgujqLhxop3dNMcnqc=;
        b=GxM94OvQC4I9HSK2KjtMN3KM5El3+HIV6zBJJ/20o4NWKjVnnU44pH5Yhx0VrLL3f8
         NMV1HFXVXZjBD6ilOxRE+2UmeynopJK7V/cG+hBqdWErXemanc2pw5uqvI27lY9QQBF5
         0HlZEZrUy9iWQ5nIVHyxvUrclhU5e/P0J47nId9AnEqZaiKYYJEBjMbQ2y9BeOqWUN8D
         X+TtiM2u4nolK/b1WZ9NgkEhp3rsQPlazW8u4NknmQVGtHMEIu399h9h8CMbOscCq1TG
         6Tyes5Z9d1PN3dlwuSiohvm/fjW7h0gVLyV2eY5sDzeREivCJKZz7bRb+uaWbHBduhMe
         ORyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745397505; x=1746002305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSDycrf39wnAyWpIWRB4jBBrGHgujqLhxop3dNMcnqc=;
        b=s1/NwZxe7Q8YB8BwBlWPnf7o0GsKCd/phEqyeSXUpQj9urxGf1OQPHjvbMbvRZgmEO
         tgkNbrkKfAgqFlkwh06qOZ68YA82tm9UuZCoXK/Qd1bxUBcNnEox1wj7qklnQ1Qim81A
         X3tgMyay1GqrJsdODM37mTzWJjzURGR/RQwu3z56gNVS9XB8Wh6shmj21xE36TncdeqZ
         OxT44/PEFpV1pyYHJSI/KDP8kNqgn1jFFstImf8u1EarrPBXaHIxg+uvA/JFsjUZ5oCZ
         d5XW8kXjfmPEJYCXJ+PaCTFM6oV7AguGwaBNayCJnGmJcDtb4h3JSM8+SfN0tQB8EO9i
         K6dg==
X-Forwarded-Encrypted: i=1; AJvYcCWC79rNBGPh9UvRmjeO9YKkJxGgZJCto90ogHkjTZpTzkRmUpdgWzOB13q20P5dAAXgUig1ua11E+YxExY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUaSYPYblkg4qWzEpjYh8XrsuLiXZ7GoKhye3qvQlITQpC5SVW
	1QWRc7hrRGCnuGDYXvolI+g59lxSXVbjrMiAbu+oIUe0Q+FRWzMq1moPCiPiSl+1IWhQojMiU/B
	pokfy3VcAXfDimj14b0uCpxEBly/PZxARlOXE+A==
X-Gm-Gg: ASbGncukVBVCfmY2WuJB31vPFbFCvvZYKysSY13l+e1XtL8D85wd3iD2Cxepzh9QoO+
	xghpCUogkWcqZE0Hm8REf9SK+iPqwwSCbJUZhyVcW0QhtDbvdL7RyQKFIKnL0PdLfC5Tmke99iV
	cGXdZBFlISLwqED8uvwvioPw==
X-Google-Smtp-Source: AGHT+IF2teZ+utBk3nbrptOE1OwOQHV13ZcYzWp4JC8Rks36uJd/7V0CNyiI6xhWlLjjle8y5+kVGlRVXioIPF4arc0=
X-Received: by 2002:a05:6512:108b:b0:54d:653c:351a with SMTP id
 2adb3069b0e04-54d6e631790mr6082193e87.31.1745397505326; Wed, 23 Apr 2025
 01:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3fc723de-c7e9-4a03-852b-93d5538847d7@portwell.com.tw>
In-Reply-To: <3fc723de-c7e9-4a03-852b-93d5538847d7@portwell.com.tw>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 10:38:13 +0200
X-Gm-Features: ATxdqUGxmUFjZwr7eCepx2PgXtnPDoeuvGQPnxU2bfQ5F1M995XyX7ukEGxVZ7A
Message-ID: <CACRpkdZKuiR7jaa-gsVTc=w64yhXv_Pny9u_zOkHDjcyXaXSeA@mail.gmail.com>
Subject: Re: [PATCH v5] platform/x86: portwell-ec: Add GPIO and WDT driver for
 Portwell EC
To: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, brgl@bgdev.pl, 
	wim@linux-watchdog.org, linux@roeck-us.net, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, jay.chen@canonical.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yen-Chi,

thanks for your patch!

On Fri, Apr 18, 2025 at 10:24=E2=80=AFAM Yen-Chi Huang
<jesse.huang@portwell.com.tw> wrote:

> Adds a driver for the ITE Embedded Controller (EC) on Portwell boards.
> It integrates with the Linux GPIO and watchdog subsystems to provide:
>
> - Control/monitoring of up to 8 EC GPIO pins.
> - Hardware watchdog timer with 1-255 second timeouts.
>
> The driver communicates with the EC via I/O port 0xe300 and identifies
> the hardware by the "PWG" firmware signature. This enables enhanced
> system management for Portwell embedded/industrial platforms.
>
> Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
(...)

> +static int pwec_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +       return (pwec_read(PORTWELL_GPIO_VAL_REG) & (1 << offset)) ? 1 : 0=
;

I would use BIT(offset) instead of open-coding (1 << offset) in all of thes=
e
instances.

The main reason we use it is that the BIT() macro hardwires U (unsigned)
to the parameter so no mistakes can be made (even if you have
no mistakes here obviously, it's a good habit).

Either way this is not a big deal so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
