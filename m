Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4F021B1BC
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876287; cv=none; b=J/bE4CHEDG+A3+kou7bjUO1jjMMmuvqokmR/kNH5Zx934zp6c9ZKytik0wYJrGxoTjuEdtHcDOcGc1xXQnziLUVYnd66Sqk6+A5uNvo2dq8ZhT1nlbCGVtaB+E0RR3AKkrB1+iJCEHxv8gnARA3Hd9E7bx6AOHHW89qPT2IfiYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876287; c=relaxed/simple;
	bh=Lfh3obR/cWEw2XOsXVoh2BjkSwas37Gs2qVr6+P3ZiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NRYEbUlfNGwQvg47athlgKbwuab82WBSRCj89uSEh94eme+N8bvlpp7nl+E2idbZb0wKfP3u72fr7//IMk1woqZaDTZ8Bj9eyYq3apNrAGSh42P7lnP0uHBJdOcnMz5L6HCi39nuPTegeUHP+Jtbw9fOciSDLFv8AcSfblRhwSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e0c2iG8d; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e0c2iG8d"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30f30200b51so5317071fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876283; x=1745481083; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lfh3obR/cWEw2XOsXVoh2BjkSwas37Gs2qVr6+P3ZiA=;
        b=e0c2iG8dFrOe2p2heowtbTtGPiM+CTsWs64KgsndGHoIcugzkK2IoQUr/wJ4D+xoXB
         5lluTtWwIkImfOkbs0jTe0ZgzTY3oIsJmfsv8Nj0h18qmmLZ1BtYto6itNpzGoQ3XIh3
         0Lbj7EqiWCjdECWED+Eoj5VuQ945kU8Yl2FDTkYunhOTN82Z88k3p8/ySR2OEGpAqXWT
         mEFjdCglhDlYJovPx2jzilC6/2PMgjjt6lgqQnrTvZDA+AV9AfEagUMP35FRbkjlojLi
         n1SBQQkPDachSil6eaIsgr4mQheQvvKJ9DKe7j0KI66Gx//pT5FU4rEHny6whztkWCw7
         Kvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876283; x=1745481083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lfh3obR/cWEw2XOsXVoh2BjkSwas37Gs2qVr6+P3ZiA=;
        b=fh/WnxlJLvTlFqlgQ2d4kHa2hafXYZswVUbOw/WT4MfJ133LVfgelgxP0F3r4wZ//0
         2aoPZnnkvN7/WjUG2n8+pCCxXhdQmUxetk8pngYM3MHpMVpnMkAVXGNl7aqOpFL9HEqx
         keKKwELjDt7Ota01YuqSF2iTUvhBqG/z9c+FD7CGJSyde54dhxf/vFn03C46DwXIcxjj
         vwKysyYpUVkcS91IOfTZBw6LUV28NYcMG3jNnyDCkge8L40yc+PUD4UWUXgL1qWfNtRu
         P6i5kx47p0aMDXNyx1Rn0h9yCN2m7g2L09B572Wl7VFUsfOWv+8/htJPyR2i1jlvEzZT
         p2ig==
X-Forwarded-Encrypted: i=1; AJvYcCXFljioaIGDo7ZjkHK1iQbYUgiTOzBKnOnMqfmJlVUqeNarFIgrQtwRKGoo8FWKRuQF6emfAZCnwpXQ1bQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Am2qFQRiCCUsQsSrtqektNQ6dKJd60Hh2uwI6dGh0yuC1zs6
	RHvdFVASZasneOLTyG7PLnepPkBotFJmXQDznRhS2yZ8qrFzIoSZzLAVgh2zObzR+VqlGeDEEOv
	15yzEiJNeknNd+tUjicadwblpmvsAZuSf73jzoc5zC2oL3/8q0Rk=
X-Gm-Gg: ASbGncuYDUHP8Q6dPy7R0yx9QIsxtjykSFA4APZGCgUBhVu9KEjCyCxq+9r3QDAh1Ai
	VEvdd52INOb8c97Ba2K5rL39MtOQqIISGTz1DWX00E9Y2qu5hJR3z/I/wremIjUYLPdC541I4DF
	Twh+esAcx3Yy7r0eHkEdrrIA==
X-Google-Smtp-Source: AGHT+IF22vTCfimAhXspSKxNw20fTEOO+Y5j7ipBjFCQZlR3SJUnkLoVgGpm+KXLc0G/KFFZHy1BLVHF2mbakXnE4D0=
X-Received: by 2002:a2e:bd15:0:b0:30b:cd68:b6a6 with SMTP id
 38308e7fff4ca-3107f68a9b2mr23447381fa.6.1744876283329; Thu, 17 Apr 2025
 00:51:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-9ca13aa57312@bootlin.com>
 <20250416-aaeon-up-board-pinctrl-support-v3-1-9ca13aa57312@bootlin.com>
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-1-9ca13aa57312@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Apr 2025 09:51:11 +0200
X-Gm-Features: ATxdqUEzrSa8wQrPj-_TFVtVAQv-K8f-maneQ4kuW4K86GYPU_CNe9bbfkx_wMg
Message-ID: <CACRpkdaqw8o80=coMHv6esa-fVQHc408_==7iaBd3M0VFazEGA@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] gpiolib: add support to register sparse pin range
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 4:00=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> Add support to register for GPIO<->pin mapping using a list of non
> consecutive pins. The core already support sparse pin range (pins member
> of struct pinctrl_gpio_range), but it was not possible to register one. I=
f
> pins is not NULL the core uses it, otherwise it assumes that a consecutiv=
e
> pin range was registered and it uses pin_base.
>
> The function gpiochip_add_pin_range() which allocates and fill the struct
> pinctrl_gpio_range was renamed to gpiochip_add_pin_range_with_pins() and
> the pins parameter was added.
>
> Two new functions were added, gpiochip_add_pin_range() and
> gpiochip_add_sparse_pin_range() to register a consecutive or sparse pins
> range. Both use gpiochip_add_pin_range_with_pins().
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

This looks correct, useful API and nice naming too!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
