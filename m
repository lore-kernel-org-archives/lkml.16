Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B218413C816
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743406588; cv=none; b=CRXOEXFBdN8aZInL0XQEvMxSqBWv5EHWmcnepVh4cQPf48sZ47IGfGSctWTr8zI16yMmENagrkvUuqS4qSvF0+k54ZKAR+HX+oF33UyYFb3UjC/1d8FIpcFkme8QAgqtdMUQKrDmwVJ7doMFRJ0YBaqaXJ9K9e4P2si0tiu/r64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743406588; c=relaxed/simple;
	bh=QyLt4N4wZLyduJinq/k8qiXVy17sLytvUJBhnINNAnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L3254Dl2zFQaw0+DTVOkI/+kdvXHAmYJPvP8fbOss5xlO/mhtEyhqzMZMiLhv3VUF4SWXWi6JiyLM5yWSph03PjzIHb1eFN+0rAJuixXvwRaoW+y81jcSyfixzO6k1+hJtwgsFGAYP/BwOf7I+Ac1F0iVYCFLo0JCYuCtPgt7zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eqet5Pfh; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eqet5Pfh"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30db1bc464dso37513711fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 00:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743406585; x=1744011385; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHk99e5gnxtUp9asOQB4E8iTtC8OB1RJZHuycukp2LM=;
        b=eqet5PfhpHtaYoKPMxToxT4iB5iVv2kQk4wYlbN98SXY3UUsr9W1iNDS0uA03cWqjT
         5VZfjg5TjPqhJdIvwMNH8rAEReoFpqDRiJhM1uUdbN2LA5V+eGIYDSwPCw/iMZo+zYcB
         qCWgfkVqt8AeOVQrKBIEAAYMnTvQoqozMBLY0fj5kDPtOt7iCWs1LXqIjbeIh0tuFYA3
         SaG1bxwhC1M0QH7/N+lpk9Qd02vqS/m08C7AKj8qONIbC7Dso5jyzDqNWQk2/Uf4RTNd
         zf72CAmV953q9T7FBT9xlYCiym/7PbKtFYyj4IxMsdr88vUeU1klEJBY7THyAU+jrSnx
         b8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743406585; x=1744011385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHk99e5gnxtUp9asOQB4E8iTtC8OB1RJZHuycukp2LM=;
        b=bLoj39Ep5sAXTheOSlY3S/Y9RIL+gDW9zxrHT97o8orAQdETyLV+KZbUKo8ZvrjmQQ
         fRAWYhluP+EHimNumx+akTjhYeCpD1DPaJpvW2LU+6x1x6GQ07tyz9cDymNhOlMju18Z
         R8CHHQf72d8YBHyd487AP1Mgz+1FSIn8noIVwmddTf1JbUqXoYi/1Mo1kv/vu2g5vtcs
         yMf8BgLAR+clr6ro8iPhX2lj54HjwUu//SOgKBT6tiq3e+ckAAhEBjUzMMGj+ZJfvJmO
         kJS4ZgEx7qw+6EEIUXb/1UFVhItbQsfyBwV8Ycnx7jfJtJgRoDfIa/5AWNa3PJDx8dEc
         U3nw==
X-Forwarded-Encrypted: i=1; AJvYcCXDM+FEG3vYOqA0aFT43qKVyLBO9SnxA06vQt1EaXM1djO3oSWdxxWt59X5BiUxKrfTBXPvQLyKdcZMzBo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy5b5cPbQsp7iZ2OJq3Rrr0FPFSEuiXq8qozpmS13GmyhHzzxc
	6llisWIn7WDD/igkf2bvNPlKpQhbqZnv+4ea8FA6g3xL0laNidQYA801s88E74hpXeqP6XKXr8U
	TtZxfNpOUdUEYDR9xLHyeVD7M0xfl+B72ZPbkaw==
X-Gm-Gg: ASbGnct8qEFpozpqT6a0nR0amqiaWe6eyL+U5jbuwn3zlSpewjMwneUoJCMnYtcjidQ
	USe+3tlhoIseqM0dViuSYgH6IAr8ZRybW8kekwH5UYtwqMxKtPZzhxA9GpcPC/XqQSKLIBGMJFK
	FgVc9FwMmKlUYaTg644GFEuAHJB3nx0IBW87NAM2ZGaxYsLabRvEqWQ92BeQ==
X-Google-Smtp-Source: AGHT+IGyhvEeoPw64LNsndrt/+sosKv3AogA4mQRxuBQ502poVOEjcU1BVPSkPdwIY0u71SAxTxzwGkOPVNELi2wGpY=
X-Received: by 2002:a05:651c:30c2:b0:30b:e983:9ba0 with SMTP id
 38308e7fff4ca-30de02c8791mr26982091fa.23.1743406584711; Mon, 31 Mar 2025
 00:36:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <579283e5c832d77aeed531e8680961c815557613.camel@sapience.com>
 <1d8bf01be50646bb7b36abfc1ecb25eb997598dd.camel@sapience.com>
 <CAMRc=Mc6Tn9CZJA6EN_a0i=hiiz6jTr9oYLHdJ8iyrtsw+LmZw@mail.gmail.com>
 <76e77de144a51d345c3542dd77dd0bdd86e4d5e5.camel@sapience.com> <d4204a3c44b31c6527b91558f9691b6a05faaadc.camel@sapience.com>
In-Reply-To: <d4204a3c44b31c6527b91558f9691b6a05faaadc.camel@sapience.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 31 Mar 2025 09:36:13 +0200
X-Gm-Features: AQ5f1JqYCos557rcCzy4DMQxB_6JY9I4cSmMc-HjsYAwMCdOvxlzyoAoyIhCeyM
Message-ID: <CAMRc=MeUA9FCp1P_e8Ztzs_2RuTWt0bBfQwKZDsx+N7m1wOR0g@mail.gmail.com>
Subject: Re: rc4 and later log message: gpiochip_add_data_with_key:
 get_direction failed -> pincntrl patch?
To: Genes Lists <lists@sapience.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 29, 2025 at 11:59=E2=80=AFAM Genes Lists <lists@sapience.com> w=
rote:
>
> On Sun, 2025-03-16 at 08:48 -0400, Genes Lists wrote:
> > On Tue, 2025-03-11 at 10:40 -0700, Bartosz Golaszewski wrote:
> > > On Tue, 11 Mar 2025 15:03:59 +0100, Genes Lists
> > > <lists@sapience.com> said:
> > > > On Sat, 2025-03-08 at 15:45 -0500, Genes Lists wrote:
> > > > > ......
> >
> > >
> > > There are two problems here. The issue you're seeing is fixed in
> > > next but
> > > not in mainline due to my omission. I will send a patch for that.
> > >
> > > On the other hand, the pinctrl driver in question should be fixed
> > > too.
> > > Can you try the following change:
> > >
> > > diff --git a/drivers/pinctrl/intel/pinctrl-intel.c
> > > b/drivers/pinctrl/intel/pinctrl-intel.c
> > > index d889c7c878e2..0c6925b53d9f 100644
> > > --- a/drivers/pinctrl/intel/pinctrl-intel.c
> > > +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> > > @@ -1068,7 +1068,11 @@ static int intel_gpio_get_direction(struct
> > > gpio_chip *chip, unsigned int offset)
> > >
> > >         pin =3D intel_gpio_to_pin(pctrl, offset, NULL, NULL);
> > >         if (pin < 0)
> > > -               return -EINVAL;
> > > +               /*
> > > +                * For pins configured to functions other than
> > > GPIO, default
> > > +                * to the safe INPUT value.
> > > +                */
> > > +               return GPIO_LINE_DIRECTION_IN;
> > >
> > >         reg =3D intel_get_padcfg(pctrl, pin, PADCFG0);
> > >         if (!reg)
> > >
> > > ?
> > >
> > > FYI: This was uncovered by commit 9d846b1aebbe ("gpiolib: check the
> > > return value of gpio_chip::get_direction()").
> > >
> > > Bart
> >
> > Hi Bart - I don't see this pincntrl patch in mainline yet -  what's
> > your thinking on this?
> >
> > thanks!
> >
> (resending in plain text - sorry about that)
>
> Hi Bart - I don't see this pincntrl patch in linus tree -  what's your
> thinking around this?
>

I already answered here:
https://lore.kernel.org/all/CAMRc=3DMe0-Tv3ZZDsdijuErYZTswbjQ0obMGh_XtUn+cT=
-uCZ3A@mail.gmail.com/

Bartosz
