Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6871A315C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 12:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749732360; cv=none; b=s5hruGi63PVgxwG2ZB+ZC8TqW7lzpwHEMyrDwbqTaDn0eNhoZoaLWQu6x3pszKQ6mvqhfHfrSCD21skhXUh29QxVwZ7lft7BK9vUzYrOSR4HU5B5DkNSFP/ERWUTC2HuCSHPVWr6w+6JpuCcmha4MEc3SsIHkkvfSEZ0UN+2P7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749732360; c=relaxed/simple;
	bh=1HdeTsKzO17uuGONKnmRpLqzCeVNHk7yoQQEiaXqA7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YQBR+M7mp/i6lXUbILvylsa5tuR4+V8Hg+unM9YSr3V99C14ZTDz1u7vwtdDx5hI8+1NErpE2WwOmXt4Wk45mOYCsef98r/PlgyJbIQb/I1MrM1gbz6s0opBOMSEO4ar+nEDFXiZCZ1IKklKaUHdxC/k09yaqafvwp+/1/8azh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=X2lQWMd3; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="X2lQWMd3"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5532a30ac41so893009e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 05:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749732357; x=1750337157; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2U7VSbXiyqPZsh+GuDnhbJ8vkS2YTh1A7lk+84P+QSc=;
        b=X2lQWMd3pZEbMHiKN9S9F7rjaOkARicttsTHwaHb+fSc9TciZ7ouVls5AY8GTiIM/V
         fM3mYNRN9Z17bojgfx5bA/DgiY6X+6MhOyF36ZfdzqRd6kmfehsfNwgnNY2sttdqy3bn
         58G5qccGsZA5iUAstRFG+q0xb24wkiIpu7oijB1tE65M9IlHYQmZVx0PUUc3frdEsyjN
         kCK42wAFyVyIRpINTxfx6pfj0+qSR1M8d2vgbhPimXhO3K4+aHqqtjpZpqQpczf1krGY
         rzYJITEQrJJftk/oEyZuAOtIbiyIj+EVqUdoZ4T4322fHjrjIU1EUc2VmLfO+TDCHzxa
         ISmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749732357; x=1750337157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2U7VSbXiyqPZsh+GuDnhbJ8vkS2YTh1A7lk+84P+QSc=;
        b=gY9PoLj7FJ9HRav1jerfiv+RLaAX8rkkLX0H8UPp9FNJ5l9tnWgUfOiBoK1RLnmZtA
         VXonuUNlHCJY2r6FTXIEo1maY85VQ3fYMso1I5jEd2WbxWmvmNq1ZKON25Hzho+G13Nb
         f7tyHUjeZ75qVrInc/Y0hlFpId1xPq8Mz1mpgD6Om036h1woVD9Y6v8KBW1s71wA0rNM
         66EEYbshLmjFzMLqo/n11FU4ncJ63QyuuBYoLZ+OioXJVzmRNnJf6wS2GVw2ODHLCHMv
         LxdCfjLGXTQ8lWYQ5RGJTaW/58kLcPMlVPlkleTBxW74k0KN5Un/5T/2XohlFsunwCO1
         n8hg==
X-Forwarded-Encrypted: i=1; AJvYcCWPndIg6EMpxz9sGef0ewY5KWix7z8SUD6iA0FxBIqYZ0h4/53+1NAq7XlLaivjYdz6beryok60Zxp1gtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YylBiBwntXqYM07VwNZEwrM/teWJexKncvFCI1Mw3pb8u1ct6Wv
	yKxRmWAEENTehHBCl/iZhredmDTTKMsruXV+9nOiPBj2RW92zPvFuFEWlDWFGioUhJtdB0duFZz
	Qo0C9hfVjLpyTCayIPYdXqJf3XIs12KS8xNeG+7bDxw==
X-Gm-Gg: ASbGnct0lVQEVzOLxB0ZD3fd5RU23AxaF/lKVlzkqrN+Pn9V88UYDBFVsuz5f1zhPfP
	0vEXO5ouQ/jsntWWRiS1WegWQM2h9TOXFX01nOPtWpTTKEglo4MnCKzpQ8ksFtziHJZYq/VKNGu
	1N34ZKyOEiWAsGoX9AAX83wwkw3P17YwqOzn7aGKBgeugpGS9NdX5a1VigeXqdw+ibLt901esDb
	9s=
X-Google-Smtp-Source: AGHT+IF+0Mekv6FpFqTRyts5+5VmEL5JiWmZ43lLx3r++M9HONAgJixQI4vI3imUBxU9EG9kgVe/b9KcTe0breTR6dg=
X-Received: by 2002:a05:6512:2354:b0:553:2edd:a7e0 with SMTP id
 2adb3069b0e04-5539c11671cmr2453917e87.16.1749732357132; Thu, 12 Jun 2025
 05:45:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-0-2d45c1f92557@linaro.org>
 <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-2-2d45c1f92557@linaro.org> <aErJz7C7f1iC4Aqm@opensource.cirrus.com>
In-Reply-To: <aErJz7C7f1iC4Aqm@opensource.cirrus.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 14:45:45 +0200
X-Gm-Features: AX0GCFu8U5zT7-CTdlghDirLZZrOO8-pxVidLweEpr2lAEyo77Jxgek7rDwDTzo
Message-ID: <CAMRc=MeSTN51Zjn5Ou9+bbSwS6skPvHh-eGC4Zs9j0uCu=B9Bg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: cirrus: cs42l43: use new GPIO line value
 setter callbacks
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>, Linus Walleij <linus.walleij@linaro.org>, 
	David Rhodes <david.rhodes@cirrus.com>, patches@opensource.cirrus.com, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 2:36=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> On Thu, Jun 12, 2025 at 02:19:54PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> > +static int cs42l43_gpio_set(struct gpio_chip *chip, unsigned int offse=
t,
> > +                         int value)
> >  {
> >       struct cs42l43_pin *priv =3D gpiochip_get_data(chip);
> >       unsigned int shift =3D offset + CS42L43_GPIO1_LVL_SHIFT;
> > @@ -493,23 +494,27 @@ static void cs42l43_gpio_set(struct gpio_chip *ch=
ip, unsigned int offset, int va
> >               offset + 1, str_high_low(value));
> >
> >       ret =3D pm_runtime_resume_and_get(priv->dev);
> > -     if (ret) {
> > -             dev_err(priv->dev, "Failed to resume for set: %d\n", ret)=
;
> > -             return;
> > -     }
> > +     if (ret)
> > +             return ret;
>
> Is there a reason to lose the error message here? Always nice to
> know which of the two paths failed when things go bad.
>

No reason other than being in line with most other drivers which
typically just return a value without a message. I don't care much, we
can restore it.

Bart

> Thanks,
> Charles
> >
> >       ret =3D regmap_update_bits(priv->regmap, CS42L43_GPIO_CTRL1,
> >                                BIT(shift), value << shift);
> >       if (ret)
> > -             dev_err(priv->dev, "Failed to set gpio%d: %d\n", offset +=
 1, ret);
> > +             return ret;
> >
> >       pm_runtime_put(priv->dev);
> > +
> > +     return 0;
> >  }
