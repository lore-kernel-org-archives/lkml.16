Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63748241676
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 08:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743668423; cv=none; b=c3Oppbz2kNxyDv0j6v7hdTI6n2jbPeThGg0ZzMZEsem9k5lbp6MFn45aOGGSOSS4u+iTw6wQL+vEOyBWnxgCy/74IvgT4nyJUxOFLPrba6JV56A6BnUoCsU/Z1QBMWCtuXH/zo8fCmZ2mp+cQhhMItxSn8CJo4h5DRKY0SxprMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743668423; c=relaxed/simple;
	bh=WtU0K9gXSVbwK3uZYqz27sU+ErkGzv8fI/hhbeLAXNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IDjeulhnICowoU1Ri/hS4U1k+C3PnonOFC0GYutSAoxrwdoRxHwRhD6eCfTrzo5O1UKfV7xROz1+5dFquFhun8P9RFhXNUYOJzftCNP6tg+UfzQ43E+DVjB+JTPE2ho9XUNewhqekfIKGczTLkZM/avSKTfbokY/o0vwhePYIu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sjFk2UQm; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sjFk2UQm"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30c0517142bso5242231fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 01:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743668419; x=1744273219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtU0K9gXSVbwK3uZYqz27sU+ErkGzv8fI/hhbeLAXNQ=;
        b=sjFk2UQm3sgHfZVvdEeaf/nukjD0yUq0jTEvp+A5dofQrW+JtlCqDBtbIhFYHNJwLi
         gM0jEbJ8jHh1vhUAehztMc8SswKnQxpXmyondA+TMEiZa2+fMSxScttccZNiAc2dz23Z
         zXcOBzZdJ71OD2X8wYwocaqHi1iwyqj7nLFh7FaefkWQKNnUqSnX65LA1A0/1rZtFUGv
         VVH4nkq9yaSQcbJLaBjVRpGsBYqRndgj+/1xvBW9sTuhMvJD/xxPbyznN4j+YiCEviug
         Dnj1Bty49P+Lep6D22R2rM4rAQK1J+TieZN18xOY7K4dDtKPCpdLvnJQ4E6EqxYLZngs
         Z/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743668419; x=1744273219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WtU0K9gXSVbwK3uZYqz27sU+ErkGzv8fI/hhbeLAXNQ=;
        b=ActVRY6U0XcuPUkg7/u2xrvC6/WHI5nrepSSu59NokrkcGfUjroXYbM4zuaB3Nzrqp
         TsknCH9jkLoEqLaUxO6Wu1dFtOj+g/CHtmFc7ObjibV1cz7Ru3ljltC3W7MWLdRmQzUO
         2NqxnO2LOlx8cTkJKj0bRt5gwCr6CqELbPGRLLseF5vhAcoxo7xuK2ZjzMB6yY6ajIw5
         3XdNAM2edZ7DNilgsbCTHn+uBoNKIXR8I7srPxulQCJRX4vuFUUowOCjw6gtdD+2GFCx
         72U8XgEV2W7XT5IXmSFFd8B42rOfYKfpL0lhXmtcmOLx0pKBLD7upy8ICl/P5EDYEATM
         fDrg==
X-Forwarded-Encrypted: i=1; AJvYcCX+y0+t8mjSH3rlvKbcHKaXupRcJwdeZxB4WjAFa//CZgd7uY+/6EwJzk6LT0rsqjZWmBpMu/65vQ/UkhA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY9QASNqlrDXChuhBfiN2tl+qi37sGvzTEfKEctSShmv8GjEB6
	sGaT7UE7jH8o3Tt5OxjZ5ouTDmsa8WteJQhxpa00gC+hLwfDdpJ8ZFpYHlPzscCbkkcditz4DQP
	F6hXsUdzI/WTwNOlh5cINx2bxyf9VciR4rqWo0Q==
X-Gm-Gg: ASbGncsbqw4NF75MdpwxUP4UrDRQv1l2GvmdZgdCekg1gpi6yZLWazE87Fpy+23s4Ay
	EzMGq01PpzxRDc3bEXv5CboNmH9I9ktnr9sPOlfS+MO6cp0HSjTPDxGiHCXeqb+SiTXeklyKJgB
	9OZ1pNscWVxvkWpwEQA0Fz88+e/oubN9R6qH2ZT3SQYGdpCiQ5nY4kipHX
X-Google-Smtp-Source: AGHT+IFXDWgpi7fgc4MQ2tsjz70/KKFNjkKho3c6vYNifn3mFK6XrakHKOLgdFy1aXwb0t30Ek/o/iYmKSzDnTaDwjk=
X-Received: by 2002:a2e:9a09:0:b0:30b:963e:9b1a with SMTP id
 38308e7fff4ca-30f02b974edmr5446951fa.23.1743668419465; Thu, 03 Apr 2025
 01:20:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402152000.1572764-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MfzRVy85NR_eSQc3ZX_OmgCRUKuBdd6TqCu=Adwh9drrA@mail.gmail.com> <Z-5BHzTEed607Afz@smile.fi.intel.com>
In-Reply-To: <Z-5BHzTEed607Afz@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Apr 2025 10:20:08 +0200
X-Gm-Features: AQ5f1Jr6MvHtO5d24SGEw18trMjEWdMN20_xEgQSTjeferZCCT3H-6FHaxyvrZ0
Message-ID: <CAMRc=Mc12B-b-w6bJeOgwFvzbmaqzL+uT7vJssVYN4tMu3YpaQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Make gpiod_put() error pointer aware
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 10:04=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Apr 03, 2025 at 08:58:09AM +0200, Bartosz Golaszewski wrote:
> > On Wed, Apr 2, 2025 at 5:20=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > When non-optional GPIO is requested and failed, the variable that hol=
ds
> > > the (invalid) descriptor can contain an error pointer. However, gpiod=
_put()
> > > ignores that fact and tries to cleanup never requested descriptor.
> > > Make sure gpiod_put() ignores that as well.
> > >
> > > While at it, do the same for the gpiod_put_array().
> > >
> > > Note, it arguable needs to be present in the stubs as those are usual=
ly
> > > called when CONFIG_GPIOLIB=3Dn and GPIOs are requested using gpiod_ge=
t_optional()
> > > or similar APIs.
>
> > I'm not a fan of this. Silently ignoring NULL makes sense in the
> > context of _optional() calls where we want to do nothing on GPIOs that
> > aren't there.
>
> > But this encourages people to get sloppy and just ignore
> > error pointers returned from gpiod_get()?
>
> From where did you come to this conclusion, please? We have many subsyste=
ms
> that ignore invalid resource on the release stage, starting from platform
> device driver core.
>

The fact that many people do something does not mean it's correct.
Many other subsystem scream loudly when that happens, so I would be ok
with adding a big WARN_ON(IS_ERR(desc)).

> > Also: all other calls error out on IS_ERR(desc) so why would we make it=
 an
> > exception?
>
> Because it's _release_ stage that participates in the cleaning up of
> the allocated resources in error paths. It's a common approach in
> the kernel. I would rather ask what makes GPIOLIB so special about it?
>

Just because it's the release stage, does not mean you shouldn't care
about the correctness of the consumer code. Passing an IS_ERR(descr)
to any of the GPIO APIs can happen if the user ignores an error
returned by gpiod_get(). That's not alright.

Bart
