Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4B91CBA02
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406060; cv=none; b=SXCM2FCDHLGYVfmnN8S8lyYtd/0qCtlzUiPRTjLRWrR3gNc4sPrufJs/H7T3NL9EyTv7BsPPBWsI91RmS2NZHSeeBflzNGpifNViR01m/neL7V51HWzfKvXCUuRINJutuBS9w0xlS0alSxHJQ93wnLbhKM62kzrKD1Kz0mZPOyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406060; c=relaxed/simple;
	bh=YnfzKMEwLBYoy9n3/p/PzVFMeRhxGAjnJtCfLo3CK04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ApVAPUyAPpe1BKcKzoJ6vBOGMAzhhbUpgr0eToAojT4C7MfDu1YUeEutqigCDBLlyrVLz9oBOUZV9Nz+2At4Hlhc5T5aptws+ahryLxXNPGjZ2JoO3wW5MdnwgAqSyVaSns6QokmT3CH3nb1bdvvn8ucnWiVusZe1TMjlpDhpnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HhV/ai/G; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HhV/ai/G"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5499659e669so6804657e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745406056; x=1746010856; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YnfzKMEwLBYoy9n3/p/PzVFMeRhxGAjnJtCfLo3CK04=;
        b=HhV/ai/GZNfP0KshxWTOSpygdXV6n5HU1KBbQM/2ffGVjmDgv2W9aUbLM4Jc/B+slk
         ELFFg6+XRwmkqZFdTFBakZ4g4COw1EbC0OfEcxcQikk9RtTXLn0VioLfOcqX0t3W1psN
         /XLiqfnbv+jqJ7LsGoOqvqGWeADMezDebdsjemufxzy+Nwd5x1RJeG6WgQTcUiVcX3HL
         fZXf2XlJHyPqdysgEgay18H/l8zq+xYffJcPbHP5txcYbeY7VSjMXIdtfZa4VoOUJQF6
         VK5I30/rl5QK7E7UQ3eXJ1uMb+QXiv0LOhQmC+XswAvHOkm8d8Rg7FV7B8TUUl0KrUaV
         rmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745406056; x=1746010856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YnfzKMEwLBYoy9n3/p/PzVFMeRhxGAjnJtCfLo3CK04=;
        b=sYwrlvJg2tKMupYcfZxky/WF35Hv3b5q6MeQWtgblySkJnNYJLWvAPEvHdBdkSBv9G
         0zXg6lKO4ODKVxpdiZcysB8fpWHBBGWEuA+QvKPk8HelLYClwC6HYDdyeDvPLvrowUKa
         JtClmoNZW9etDlShmNGzBeXgb4DHBg7dpt7SjMRsF9gRYEEJdeignU2QJQ2uFX4ftY0d
         /yhvY9F0bfqZWNNiIoA5et1YtxuAU5g9eO3900iL5ybeqixGGA+ADszW2L+wcTXhGGWe
         wFtQMpdRWL6vCwdC1sCBZrSnUj53YxOo0YS6D1yBWZNxwGurxDaKoK8gNiHDUUYH2AkB
         P7Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ2mwDdLGUieaIGA38TplVDre95JLGjZSuFZWNrDv0OT6Nob7ZpjeCieVu0xARcnCo7qIj8Cw6FzfD9w8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Q4wtpwPW2f5hl77fDO5D8XXLxIk2QanszzhdF91z5VoRRxzJ
	dZfSkzfNshT2y8CNfDj/c7PqDhQhwpzm3vw6MuZi6sN4wSdh0Hj7eD72/POlPxqhEbaCS7WsPIO
	ctiPO9aLOD+qzFpZtd7O1q0KoiTDDAtvxxwSvfg==
X-Gm-Gg: ASbGnctsSVe/6G9Lar6nplCOZR41vT1Lkubjcd1GhmB0KDm9Sq6Wjxg064GEtGbCL0H
	hM1kAqlV95I9zIzPi4WVMNb5tfbaT/beaXmOy4aa4JZM0ixsR9gAFsLd6ddk9Ea67iiSDDnzhDw
	U2NCE5sB0QLTf8vL0mtOirgw==
X-Google-Smtp-Source: AGHT+IHMCySz3z6SljYbbcEsFOxE9JkbCutC0ziw5S/nYiq5XuUyK8ef365iq8jZ7YlaLZiMtkJdFLKp9/dUsZ/eF3c=
X-Received: by 2002:a05:6512:31d0:b0:54a:cc03:693d with SMTP id
 2adb3069b0e04-54d6e61dd6bmr5088730e87.9.1745406056469; Wed, 23 Apr 2025
 04:00:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-gpiochip-set-rv-hid-v1-0-2e6762b582f6@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-hid-v1-0-2e6762b582f6@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 13:00:44 +0200
X-Gm-Features: ATxdqUE_gVFsHXxkj74AZEmclfvOPWvTaJ08Tt0ls6iGN_ulCw8C7P0a0FJrIas
Message-ID: <CACRpkdYdDPL_L-q2bofv+6wv53xSCsvOugt7+xE3oxX2=PtMew@mail.gmail.com>
Subject: Re: [PATCH 0/6] hid: use new GPIO setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Rishi Gupta <gupt21@gmail.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 10:55=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO drivers under drivers/hid/.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
