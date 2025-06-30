Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4278C23BF96
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751273879; cv=none; b=Fb7Bs6XCm/e1vXu22vLrnyTB16d7Q+ErVRqzCted58TFtL96hWnVJjqB/P6Z9Z4y3v12WfP5EgKz0XuT7fTmc/osoymQpvByyi7ztEbAxp/cRct1zs+HaYXE8njHk0AIsIgXZnblLDCiEFbHGo/JNBtuWRr2Tic4UBVNXLhHX6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751273879; c=relaxed/simple;
	bh=onLgqf9wBQTKSo4b8bzwNbk/HjG4OEyCuw7AQptX5lc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hi+O3UphXTCM+cWIx2P6bAbwyRYdNxvtV/WFNugvI2H1a+6VBMYVHT/I9WqH9R7INrejO2jEeDkHoXNgSjeh7feA+jzp1X9xN3u5ZGvwLRyltRuIbW0JK8eBp/L/w5Q3yfWvt9l7H193I5L7XS8YcIHOma2/LIRmwWSJj2pamxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vICJWPed; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vICJWPed"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553b9eb2299so4698507e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 01:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751273875; x=1751878675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFXh1Z91L70sdrJwqWRqSBN592H16a2JIB1wd9q9WPE=;
        b=vICJWPed84G7CviciejousAgpZUjAY9W7mXrPCSzycY6Lf4+tS3rQSfRDGzHtxWvEF
         cD84eLu5UKyVKxNVXy7UMhw5vzqLN8g18KuTEKErg12jAIFQYjvgw2hsnYbIDAfw9uMt
         VLET3VctgLCQxshJ0+Fru9GmmfZD/LlARt6ZmQ7t2mBxJ1vm8sFJCYXnZUey4MrtCCGf
         a5GG2bZKwTADX9adF0ITpS08n0XvI/7Eos35WhTl85QQNZ454EOX1iQ18OLdqgK+3UNc
         a8+7QGnkiUHoGFBeT27047mqL91tse/uT/hTJGXPD0ZmRiJtzRCofrUQskDFRjqQ3d3d
         1VVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751273875; x=1751878675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFXh1Z91L70sdrJwqWRqSBN592H16a2JIB1wd9q9WPE=;
        b=P3J56EV3Ko6n6xnyL8Aovyy7rGI/wBrzzvapbySTd/ZteN3FAIPt/l2VtpWCeakQnk
         86bSIuX9ntnUYdoqMv3rpG6Qku/SB0Cx1oyudu3URPSTu2pVDuAIHGuyiFLfH4VeQ76x
         rYtJtIJwP+tz++lxu67GAa9EGHfcIY7m9DVhwCBn42+dL4A4+SN2ppDYLNcp4rf+lF73
         8Y64UU28/d2q1FwKM/kqXowE+js4ESw67vLrX1E55plex4EtuqjLCAVUW6OHBea4qqDg
         vCrFvHgHcVwAcnCm7rn5NPmq+GzVXTnYdqdl4xPClLUWvW2EZafrHALmCiIwfvvqf9Yw
         roGg==
X-Forwarded-Encrypted: i=1; AJvYcCWTZo9bo/p+n4wWuwuJlKsy9LPjeHy85kFHPKhyqVAeRt1U8NjhOGlUEnNFJ0Q15WIdr+qDhr1rgpzMlVU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuMhMvj85Z/1zCBIqy3RCM3BbGTvYlhiSBtP0i6chL5K0SXCir
	fikoulNUs7td5pvKJlJuOQ498vw0NX8RXEblSdAHWkcTNU89cFC7OGtejtK621gih8eWmbZF8Na
	9W3dkpYtD9770gO0lXGIVdckaZ0lepazb2BCiPi6kHA==
X-Gm-Gg: ASbGncsAcajzQlJkkNx68YCKTAxc6fE+uv+KqZ0ZRqtytrky6u2EP9JWJJ6b/kHjrqr
	7Y6NByL6mg0a7BXgVRtoViRR9EacTYohBcOprnwUrTfvRA/HW/JZXLOEgX/50lcKcy54KvsyegW
	eFbKcZJh559xhOai7uQqJNilav4Tayq/VSC8biyeleg6J/T5SdHr9zv9AqrPi3sgDQYwoZmNVsk
	bk=
X-Google-Smtp-Source: AGHT+IHOVxPAMJSWh0SZLmaax8LuaMUfFhCW4STA1Hrax7bYhPG3/h1ZqtEQ5/+skwDUgLGcELqi8cmedawhg6Ze3Rg=
X-Received: by 2002:ac2:4bd1:0:b0:554:f82f:180e with SMTP id
 2adb3069b0e04-55502cb4e30mr5622503e87.16.1751273875362; Mon, 30 Jun 2025
 01:57:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
 <20250623-gpio-sysfs-chip-export-v2-5-d592793f8964@linaro.org> <aF68N4ZYKupWHJoL@black.fi.intel.com>
In-Reply-To: <aF68N4ZYKupWHJoL@black.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Jun 2025 10:57:44 +0200
X-Gm-Features: Ac12FXyIhO7e-cJUzkPo19wadzgUrXNHYc5Zx6JLIkPswC_feeEvjBGPtz7bWAE
Message-ID: <CAMRc=Me9QX8OWwFcTHQjXgDKiu_90gaLGeQp600aSSJi0yzbYg@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] gpio: sysfs: rename the data variable in gpiod_(un)export()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 5:43=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Jun 23, 2025 at 10:59:53AM +0200, Bartosz Golaszewski wrote:
> >
> > In preparation for future commits which will make use of descriptor AND
> > GPIO-device data in the same functions rename the former from data to
> > desc_data separately which will make future changes smaller and easier
> > to read.
>
> ...
>
> > +     attrs =3D desc_data->attrs;
> > +     desc_data->attr_group.is_visible =3D gpio_is_visible;
> > +     attrs[GPIO_SYSFS_LINE_ATTR_DIRECTION] =3D &desc_data->dir_attr.at=
tr;
> > +     attrs[GPIO_SYSFS_LINE_ATTR_VALUE] =3D &desc_data->val_attr.attr;
> > +     attrs[GPIO_SYSFS_LINE_ATTR_EDGE] =3D &desc_data->edge_attr.attr;
> >       attrs[GPIO_SYSFS_LINE_ATTR_ACTIVE_LOW] =3D
> > -                                             &data->active_low_attr.at=
tr;
> > +                             &desc_data->active_low_attr.attr;
>
> These were added in the previous patch and immediately got rewritten?!
> Sounds like a wrong patch order.
>

Yeah, bad rebase. Thanks for catching it.

Bart
