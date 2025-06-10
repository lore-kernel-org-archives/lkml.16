Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB98B283FD7
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749593209; cv=none; b=SkqNy9Hfs6LjqnukvaCh27zh12kydwNj62vKWwJoCrJSLtqYn50tIAdSh/wuITFgbsOuidz2CVpaTc5xI2jyWqu+4+LdNGsMX9og+R8DRgP0YwTO+KZu4RhN1hgPtPYibZsUFMiWdsooBxFmrqDaapVRsTmxEc5o7hckLbOh44k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749593209; c=relaxed/simple;
	bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u4/s3nY49D0UeYznIXT8tu3KpqzCf7ly0cpRySEkt8v/0ElzdfAoHV4l94AnlvpVuVQ72dGe3YgPWuTQLTtue2+EKYhPVKhwEeZiIEAj/E1eeu2mhiR8ObOf1OmBxF96C1BS6OesPx5aF9dqteIma0i0PMu6/6nRo1m9KKrvrMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JBJYrun6; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JBJYrun6"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55351af2fc6so7162642e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749593204; x=1750198004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=JBJYrun6Y8qBLpH9PeR9sxX/5z4fhsjOpHAkFqgY0n2+M6LRu3j4vZiLPDo+BfITjb
         Oa9OiHV6c2aIF8gRcMZtA8BdO0qGfwjvCCnFAPTjF+5ODhsxXVyIWWTQFP/oMQH0bO+y
         BslMRlE/h2JaJl4K0u1Z54N15+GJSs/nex480LPcBIEZtTWNUvMV4H+MDCyGVjXj1O0O
         2JouZ2smwpnISJy3oXIlUy8shjX00CXFA2iiS7ZJzTjsiOe9O5hQF84Y8YCFdVZGn5TW
         iIJA7+dXQwCW35mgrBlQWbGKdJWrQD2QR3uI/Z9S4gxp4O75uxJ68M/6XhNV6iGLN6uU
         cxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593204; x=1750198004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=DfB38BdTTLaOy0QGTLwFrwM421tjWAimwGEbTHoylYnSRPD6v+JdDNlLBmc+CLhGwy
         QgkXiMDKaBT4bdDCoqCtzibwCT9bx1/MN4e4jLUKRCMacLvVLtJApvdNbx+WNR8ivQlp
         edCXkvmK7IUWcQ1pDORMAy9Xbh5CRY0arzoUqHTDwRwHuRd/9vwP/ogWgruQpQ3fAp7V
         KBgnmsZU1Ne7uF4Tv+Vv9RaDEgQFJzS8DwUg9wav3fininTIDBtdzuRIF53Uynuy5DJt
         w+aJm8apdVqf2LY4AK93fighwtHt3ahCLCJpQRxcWdZXU9ZUuJe+HkeLV838F15vkVuK
         Fuww==
X-Forwarded-Encrypted: i=1; AJvYcCVSTJBg1jsmBg13PlIw5PpKfX4IVLXCSl3HBGGI4cO/3tH3PPp5RgTnAB094wxRnf5snjawqYyYZfxJS7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcdFYLaQ4CV94oj/yWgfWyARvPyuYtY9I1X8cos2g96DNJDWHO
	qtq7Ta2Pf+rkK8vHhizmI1mobgdoNM7rGBgmBud8rr9UPhneb3evT2Ohl0Cznjo/3GacJR8sFRV
	mE+LrI4BGhaYoNJ8VjKpShKn/j1+yIWqE+zq+Ef5V3Q==
X-Gm-Gg: ASbGncsk7y3ad3JF3dKBbFVFQz55WKxld7QKyiXOrT0hUUox9KAf/8IXgteenSwJGdX
	RnrbZs7TAss0FWcAP3pMOvXlTM+vlaKQBvYo2BAnMZ80zW2lnsfKRF2jNnWrEu6s4+FvUr3u/ud
	jthoEcEapLG4/oNEJQqQFPsKSFNXR66FaUNrZLk5f2sAY=
X-Google-Smtp-Source: AGHT+IGlqZqOxo94Fq1AxRXbuSE8IQ4NwQa1mjzmaOgaM7Du8n0a08UJH2Mj9vvFcKeYpn253k3S/NXDYuSRYxggVL8=
X-Received: by 2002:ac2:4c4f:0:b0:553:659c:53fa with SMTP id
 2adb3069b0e04-5539d4be3f5mr111095e87.5.1749593203962; Tue, 10 Jun 2025
 15:06:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org> <20250610-gpiochip-set-rv-gpio-v1-8-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-8-3a9a3c1472ff@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 00:06:32 +0200
X-Gm-Features: AX0GCFsQuNMrR1lnqoFxpoWnn4BCOjfc6g0nU8IoyS3i9wf_s_1MzLLDkyq5jQE
Message-ID: <CACRpkdb8GBwtOGQYrVkxiv8ZCjEE6pkQ_kSEutY2jYG0bUbFVg@mail.gmail.com>
Subject: Re: [PATCH 08/12] gpio: nomadik: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 2:33=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
