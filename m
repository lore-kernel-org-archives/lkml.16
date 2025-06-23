Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDE81F1522
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750665742; cv=none; b=p0cvw4j5//Kh/3Q2IwBTjnwTw2Hd/kw2xOFrKwZUEL0TPkf1j6zp2zeJJSYANPe2SbuTD+qlyF5WSO+Trb9VEEfD/OO7cI/sFkhwJxsvx/K9tDAWuoajIn+b2bN7jGM6tJtmvGKNB4+JZdL9NhDcNdpe3osQlphwKPi1tGzp9xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750665742; c=relaxed/simple;
	bh=Q1XA+JXOXCtWnCp7t/Ht+LN00pee1Odcfo7xDqQpe9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/K4sLbovD69sOQmj1C+/8JDsa+lj1esWEbtLvPGAItAU3w+0lUpz4x3r71nQPF8qlXZVl3JlK056VlwhKeZssiefwmJctRkfyoCY3ITegu6uWeWQtoSrH42iVByL/0UvP/RK3W+K2W7geom1cvVYaDsnuH71UMHZN3NEFBWhWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=D4YRDySO; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="D4YRDySO"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553dceb342aso2961947e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 01:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750665739; x=1751270539; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90hYW1+aPldHsph4xdNI+bk1oOWB4WZEP2NZvvKLy10=;
        b=D4YRDySOH9FmimArWTAMwZnEKhzSqXMdMjCSFUeHq+cvo21FE+OnsuSMgzWsW2Y1IY
         Yw5YA2stcOLa7+MnvzxbFQsWjZNvMcjpJkxxBbsUpOeErSaHaDgA4oGylByJFsUcJ3ad
         IQtISQ76Yjtp6O0m6tiBKpqrl+MoEvhx7gnDqwSouIlSIQoy0tdTdcI85ewXzuMehz/a
         3rFMBTE39bkRSW9RuB7PIA2iKouHOrWgvMTfhNMHjeQO59bDKaz7BO5nhxtm8o6wyem8
         oGyY2h26qZz3wqFDx1AtwDFT4xBajozUSf5aab35U4tX0SmLF8akfz9W2a5eGDJGbRRg
         ZlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750665739; x=1751270539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90hYW1+aPldHsph4xdNI+bk1oOWB4WZEP2NZvvKLy10=;
        b=k1JnxjhiROFlHyUEXktYFWdRWOcbOhPT93Moa4pYE33yupgPlv5+pYRZJ/P47xtfcC
         Ynnavn8nUUMca20rQZ8lF44K4KsdgQQveLzwY/+yA9C09IbvWp81Rigess2LX1lUOmtS
         vqYhIL47EwujG1mWEpBrKg9mq6iOkOVJr3bSoft0qkr5TdW8cgnrk2HrZq24olTpvr5N
         E/JxKydcJIRtrBNnHbo6K8LqdwLaN3IO5JLZr2wWaqO7eBe9/3F43CF6Sv280g+4WMgI
         KcDdjW3dHJViNQQ0Sseyt+oY19Uq56r2ugRAXZCfONRc48gRmyDRDWXT7LKB9+C3c9nR
         6BXw==
X-Forwarded-Encrypted: i=1; AJvYcCVz+lw36twH9XA6bu2ZIuwRJEEXfIVs1IyI+DszASq3mKnhIVxhCuSYe6HzXK43AyppMdsk8nTRv1ESfFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAajEpOJNn6+7eeRBh2+v5RLau/60jKpvITQpJSMyfMkGU3QGX
	kBIQf+VNUS0h52J7Tpzit3dSMzwtksCJv//av+9Y0PhSbGYAw0Mv03typQwYrdRFkn6fV2/+moH
	paeMff3BGCiMSjQLi4H+P3lkz7GpYpIlEvsyxrZjrGA==
X-Gm-Gg: ASbGnctD1p9jhJA3ajwrMzCAqbedLOSoIJq/XQRHd3gUDB2QenpkDcJckQdHV4zjJQa
	gHBVpXx5xciQLAt/Cp0gVb1soNqRafxvOFC2Vrsa0FzcZVUEZ0bjkzVM423n0M2zJWWCmt7XsAd
	LL9r2Fa0N09WzHFew+DuZVxQbuL3QVVLcUZk/817QVMeiimm2YoqydIerdBIVrHRy5ocpye9cPf
	1bi4dP4zLK8
X-Google-Smtp-Source: AGHT+IEFylPNpljR3XEed8pOfJjdvyjRz09M/WdcYWwyhunaD1GCVyLqOiEz7HDVLXwhU8X3xjf+1mUDhqvI4bVZzDk=
X-Received: by 2002:a05:6512:220b:b0:553:5e35:b250 with SMTP id
 2adb3069b0e04-553e3bf3becmr3556332e87.32.1750665738699; Mon, 23 Jun 2025
 01:02:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
 <20250610-gpio-sysfs-chip-export-v1-7-a8c7aa4478b1@linaro.org> <CACRpkdZ0W10E7UX7KDnej0SX_Jtuo8r1xSTJsGmXDrDYwArO7Q@mail.gmail.com>
In-Reply-To: <CACRpkdZ0W10E7UX7KDnej0SX_Jtuo8r1xSTJsGmXDrDYwArO7Q@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Jun 2025 10:02:07 +0200
X-Gm-Features: AX0GCFtqPzZP2-oWr-aSqSDePQwxUQnU63M4YMuZivBMwcnE-5malFS4943V3L0
Message-ID: <CAMRc=Meaif1zDeV5mQj3sdJB5et36a_6RctLoVLQc+EH8ig9LQ@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 07/15] gpio: sysfs: add a parallel class device
 for each GPIO chip using device IDs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 10:27=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> On Tue, Jun 10, 2025 at 4:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > In order to enable moving away from the global GPIO numberspace-based
> > exporting of lines over sysfs: add a parallel, per-chip entry under
> > /sys/class/gpio/ for every registered GPIO chip, denoted by device ID
> > in the file name and not its base GPIO number.
> >
> > Compared to the existing chip group: it does not contain the "base"
> > attribute as the goal of this change is to not refer to GPIOs by their
> > global number from user-space anymore. It also contains its own,
> > per-chip export/unexport attribute pair which allow to export lines by
> > their hardware offset within the chip.
> >
> > Caveat #1: the new device cannot be a link to (or be linked to by) the
> > existing "gpiochip<BASE>" entry as we cannot create links in
> > /sys/class/xyz/.
> >
> > Caveat #2: the new entry cannot be named "gpiochipX" as it could
> > conflict with devices whose base is statically defined to a low number.
> > Let's go with "chipX" instead.
>
> That's unfortunate but it's good to separate them, and
> gpio/gpiochip is a bit tautological so this is a better sysfs name
> anyway.
>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> > +       /chipX ... for each gpiochip; #X is the gpio device ID
> > +           /export ... asks the kernel to export a GPIO at HW offset X=
 to userspace
> > +           /unexport ... to return a GPIO at HW offset X to the kernel
> > +           /label ... (r/o) descriptive, not necessarily unique
>
> Not necessarily *globally* unique, I think it's required to be unique
> per-gpiochip right? Otherwise it will be hard to create these files.
>

Yes, this must be updated as well, the labels are of course unique.

Bart

> > +           /ngpio ... (r/o) number of GPIOs exposed by the chip
>
> I like this approach, it's a good compromise between different
> desires of the sysfs ABI.
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij
