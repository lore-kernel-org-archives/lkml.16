Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54CB307487
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751616596; cv=none; b=ssCl20/N1y3Tx5T2FmorlfCUzomajkZeImCe7ZCKeDsB1r9iSftvMYYB6kJ8hPmJAH7gb/U3c3FzM8sMDGDg2ky4BsQe0sOcCgkJSjV3XDRZeTCCUf/TbJSAUgI3ezJAhXZgo/ZAot2JpxseFggr4TwCaYhyaEaevyA5Ab3G3gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751616596; c=relaxed/simple;
	bh=dlMnnwp1dpnotw8e5/iEHxXbLwDZGkrbADhWsQHKiFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jTnPMtb74v0t3HHKdCk/blwZWBGyUOrUTrmRvZp/7BebMpLytdiYKzS9f31Dh/LD1jsXvb1HWy4ENmot7pctQIVPQ/7a7kmSvn05+WIcgJm8xWbdew4XX5i44/yfb64taku3buWDssvMbG98nhO9cvZWc1iHuiHzYCVKYBJe28A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OWJFAgp8; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OWJFAgp8"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so1997468e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 01:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751616593; x=1752221393; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlMnnwp1dpnotw8e5/iEHxXbLwDZGkrbADhWsQHKiFs=;
        b=OWJFAgp85si9j+xJ8F836ZuzFcvFNeh3M7fKd5Aik+Y4UdJyAv9nFxe5ye3oiNq6MB
         GMYni1yy6uIhtO/AXVWvijmcq8WxerQ8h0aS3FT4t2awG/KUJEq1w8vF7yQX05IpJS9s
         zTUlWVdsjIjVm991MSAb11ZukZEX5b/OBmXDKxu2IV80FRl6z9/0HpO/LgqzhUYYrrUg
         xkfoeuzGssZkZLicEj0uYImlEbaiG/ATI2qxBTy6ytql86e+N2RUrS8e7Ne24qZegy/c
         MPVDHiHKShBMyel7Rv/HA/NV3VOZBEhHhaSwF+Gri9VrPKKnm0XXNz9CIFLDrZb8kSyF
         JUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751616593; x=1752221393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlMnnwp1dpnotw8e5/iEHxXbLwDZGkrbADhWsQHKiFs=;
        b=r7zLoOkaB9Jsms96khL3TAONJa2qYbfqW4OqXE9FWERZUYAKK6ULEMk8uuW40R721N
         Dbpug1PT96hVeClFi5pmGuhJbBpLRijhSKAk+jsnAdyZRUKA8UldvhaFhpLAVgeEDxGo
         kPgHTLOffL+lQDYoym6b5NCmDNi94DvoU6tGX3+/EqW6lxcBF6cAN6VfS83nVKjMcItx
         6uW5Y+sYJocH4IDw+GFZMikNVTi9GSJHoYSFOPNMWDSeEsi/j9TrlXbXg866CYKYPvyh
         6Bu9AKHLYYCG7sM6vZUFPqSABk2V3EgXZ0GIwrKxTRUdFmnrRHjZ0dTBVfCjsHXW19mh
         SeJw==
X-Forwarded-Encrypted: i=1; AJvYcCV+L340DmloB3spXFLqcWMNBMAEDnI94vcr2m71DWMIk/EpdN6ratp9R5PmuddG2On6WxtiILsvfgmQWNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLmnv4VVWfPj9o2kDs0UHcpKOeT1FAbHMhAmpnhOvnYDbUu11d
	eT+lzcXQi9ctBsl7XjUggS0ZrrS7/cjrLlS38iUhkBBVES7ghLW3Boaup6bLBkHC/P3Dwwrgyez
	+qGv7jh+95n10mEoCMq2xPZRqf2M3Jmlpq0cid9sSng==
X-Gm-Gg: ASbGncvMyQweCNz/910cOnKqFzC/N3h5G2PnheMe4Vad3YcgJL6oBp7hObKNi57oysd
	+GJEvAimL8YRHSSZsllvW7pxYhsnaYn8m9LW80vSA17StNfGppqPDYjk3x+sh4cCNEjpNhwTdBM
	5aO8h3OGu2uuh00EJosQ0FDM+WN23wcKOwrwMx8CHp3ml78WaT6OmwH83HHGw0nrtXvxb2HLYDg
	g==
X-Google-Smtp-Source: AGHT+IE4LgEsW9jjv71RhSCmOAPvG/Ad9nkwHJ9y2F8Rwu4ip+/5BNS6kZwLHzfjh3sGGG/3P6x2aOFT/NRZcazuhoI=
X-Received: by 2002:a05:6512:1102:b0:550:e692:611b with SMTP id
 2adb3069b0e04-5565baa727cmr572418e87.16.1751616592750; Fri, 04 Jul 2025
 01:09:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625153711.194208-1-brgl@bgdev.pl> <d92e7c52-eab5-4759-af3f-16b24254bff6@oss.qualcomm.com>
 <CAMRc=Md=ABd+aSc7DE-2dsR5rMnpnvbetuexw8vmrf7_zzT31Q@mail.gmail.com> <CACRpkdZTXzyROqb3mGoQrsO5X_Y9-yDSU2ESUxivpb=N1WsP-g@mail.gmail.com>
In-Reply-To: <CACRpkdZTXzyROqb3mGoQrsO5X_Y9-yDSU2ESUxivpb=N1WsP-g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 4 Jul 2025 10:09:41 +0200
X-Gm-Features: Ac12FXzBbjGix2e4hwrUzcQzOAwkz-H-4Z3odNBxk-58uy8AtckdJWtwxkPRDTs
Message-ID: <CAMRc=MeL3PNJjBQ88L9Hqj+kvHvBDFTe36YR2Oi6OZbLnKEWsg@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT] pinctrl: qcom: make the pinmuxing strict
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 12:21=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Fri, Jun 27, 2025 at 10:26=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
>
> > Yeah, I would be surprised if nothing broke.It's probably worth
> > looking into the implementation of the strict flag as it makes every
> > muxed pin unavailable as GPIO even if - like in this case - the
> > function *is* "gpio". Of course the "gpio" string has no real meaning
> > to the pinctrl core, it's just a name but it would be awesome if we
> > could say for a given function that this means GPIO and as such should
> > be available to the GPIOLIB API.
>
> Can't we just add a special callback to the pinmux_ops for that?
> like
>
> int (*is_gpio_mode) (struct pinctrl_dev *pctldev, unsigned int pin);
>
> That the core code can call to ask the driver if a pin is in GPIO
> mode already? A simple strcmp("gpio", ...) is one way for the
> Qualcomm driver to implement that.
>

Yeah, this is similar to what I proposed in my RFC except that I went
with a flag in struct pinfunction. I think it's more future-proof than
string comparison, especially when we also have functions called
"egpio" which, while not used now, may also need this (possibly).

It's unfortunate that the struct pinfunction list for given controller
- while defined globally - does not seem to be stored anywhere in
pinctrl core data structures. That would allow the core to query these
things like function name and - in this case - whether it's a GPIO
without going through pinmux callbacks. Maybe this could be added to
struct pinctrl_desc?

Bart
