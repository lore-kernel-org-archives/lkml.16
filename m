Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37AE1EDA3E
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 13:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738935817; cv=none; b=PVakJ3pPeqEqO4NIjsDhkLy2HmdllTjP5Jst5uMZc9vTWqOKaJG0XGbtOscJwkMdszoIB9fmZOn6wk5KVErIqeBWWG1EqNhmh7yyPQWjsX2vhg8BscH414exnNr6pB/s93/loPbwp+wIsSBCts9JLh1lkxYEtB6v0BehbNS2elY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738935817; c=relaxed/simple;
	bh=FHXUInqL1mERxxhyzNOi52kx1FixifBEqw9FLbgO6ak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y1FJ+aslPOhL3KvImfJ4izra6vcvRCyESWVPnqa17yhb7WKxBkdNdeoMwAvmOmS8CSMIjKC+40EkTPr2UOcAyyI/IFmSRRs8Lm2v4NsTs++8CcpMjFugnuDinAGqHDR/lVIDcaZjIrAZVtRWg13BqrY5zn7jRdX6qyLRV9FSxfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IgMMk9gZ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IgMMk9gZ"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5441db195a8so650873e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 05:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738935814; x=1739540614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKsA6ABCoqBy1+Rb3r5XpccEe89AQ7e2K8/y7ck82Vw=;
        b=IgMMk9gZ3JPUYBx/vOP6SoETaTqSSkg1iVoaSrvoZZRjmyVPTR7uXLkUyRJDBh+44C
         9qH7Pget8/lMo7QlJ5039TV/rRiAmCZjmf6T1kTLFj9LLmU1r8bD82X+VZhoRkxeFQzk
         S4EzUikNabl4jDWsojT5NDw19aIKyyL43ZRfliLt3xbgM++6w6ctXEnK5PSbou2gbSSs
         9FDKZXi551DRgrMNvxqiezx6uriDsxNl5omaxXV9rEluB3kAXq1lLVeGb2yrrZZ45QnG
         9T9J7kcqk4hsBI6odtKhrT1G1RF4CeR0o1rPIgpE7+l58xgbHZjUifudEsiROt4twjaV
         lAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738935814; x=1739540614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hKsA6ABCoqBy1+Rb3r5XpccEe89AQ7e2K8/y7ck82Vw=;
        b=prejrLW30Ii9rp45urI5+G8gEXDxUc0ytevZjTiKK5Xktp6+1SCnrgNmQdZDhSD2PF
         IIQTQSes2PtY0f8Ruy2FGU2Uq/9FNXKq7xdbWLTvietz01FZLoydGmTTNCTsR7Kr8vsR
         +KNtg0CSP3+XWCRWLqbe5GO4oDMYaX0YZrWACNdPVXMjpFoUGeRaBL4/DcvUNsAVgm1t
         w/4/vfQy1q/3sGzxWbTAaxowCyww2CabHw+oGxkDgpq6WMZzpNqACwHaX6DIiUt+7xrs
         iqRwvPN3EXvuH/qkxu3AbHZX56RgZhwdipzzuRwUjA0t0hdCl9XwnILId0FyUMJcf4X4
         dyTg==
X-Forwarded-Encrypted: i=1; AJvYcCUNXFbiTXq4Tj04aEA1QIoYvsVXcXCzaaudprI2k6S858uwaNF2r5Tjo3iLyiqrSh4v/nRwTzOr2Kcfyjw=@vger.kernel.org
X-Gm-Message-State: AOJu0YztJGbqz8OR3RBtm2KgAhLJhsAIxyIDWt9sg1pJVIorDfYOEKN7
	vr1WbiEBbCkk6x9Z3aEXy+Qf8cRoUd/uxuQnUr/iSvj+u5D5lm2bJHPRVCztnGPLmlwc555AcV/
	J15/F5p6w/xkUTpo/AeKy4/S0Wx7iF/v2T6E2/fYp+Kka+76N5t4=
X-Gm-Gg: ASbGnctjrRZ/M9RKaprJJvfAOVvJO8ltaYQdbiRCMYUdqrpJRgTjsq4lQ75KvVN1qre
	EMucKwx7WmwLp+NgyYZYKNUeNeZOkO9PZQALiRTnZKGI2TOoA1dlvDmxnd50mrPN7GA4UUjsR0A
	E9XC3ZWVGBm6s6lHmm6Db0gm5goII=
X-Google-Smtp-Source: AGHT+IHks/1sa0KdRih+/AWLyA7Q3wgROj+ap1j3UX5UezETpT6I8+u4s+rJOBhjffLIcT1QtpxoyyrTQqGKdpXxMKw=
X-Received: by 2002:a05:6512:31ce:b0:541:3175:19b4 with SMTP id
 2adb3069b0e04-5440e643812mr2557388e87.11.1738935813528; Fri, 07 Feb 2025
 05:43:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204175659.150617-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MeS1gCP2aNKs9xydqLQQnVbWHbVoSqTyLzVcENDFZYM=g@mail.gmail.com> <Z6YMDwflaxCFdnoc@smile.fi.intel.com>
In-Reply-To: <Z6YMDwflaxCFdnoc@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Feb 2025 14:43:21 +0100
X-Gm-Features: AWEUYZn4w0AFhjUVVaaPzWXSUburvcZM3FGt7u2UBMubmSEsv8i14THnw7uGdr0
Message-ID: <CAMRc=McATQEVKrh=Pi6u8tSgQac85YoT=U8X6WrdRW8mXgUSyw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Deduplicate some code in for_each_requested_gpio_in_range()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 2:35=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Feb 07, 2025 at 09:46:31AM +0100, Bartosz Golaszewski wrote:
> > On Tue, Feb 4, 2025 at 6:57=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > >  /**
> > > - * for_each_hwgpio - Iterates over all GPIOs for given chip.
> > > + * for_each_hwgpio_in_range - Iterates over all GPIOs in a given ran=
ge
> > >   * @_chip: Chip to iterate over.
> > >   * @_i: Loop counter.
> > > + * @_base: First GPIO in the ranger.
> > > + * @_size: Amount of GPIOs to check starting from @base.
> > >   * @_label: Place to store the address of the label if the GPIO is r=
equested.
> > >   *          Set to NULL for unused GPIOs.
> > >   */
> > > -#define for_each_hwgpio(_chip, _i, _label) \
> > > +#define for_each_hwgpio_in_range(_chip, _i, _base, _size, _label)   =
                   \
> > >         for (CLASS(_gpiochip_for_each_data, _data)(&_label, &_i); \
> > > -            *_data.i < _chip->ngpio; \
> > > +            *_data.i < _size;                                       =
                   \
> > >              (*_data.i)++, kfree(*(_data.label)), *_data.label =3D NU=
LL) \
> > >                 if (IS_ERR(*_data.label =3D \
> > > -                       gpiochip_dup_line_label(_chip, *_data.i))) {}=
 \
> > > +                       gpiochip_dup_line_label(_chip, _base + *_data=
.i))) {}           \
> > >                 else
> >
> > Can you add a kerneldoc here as well, please?
>
> Sure, but it will duplicate the above.
>

Will it though? It's a separate macro with different semantics.

Bart
