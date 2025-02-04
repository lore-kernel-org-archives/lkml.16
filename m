Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBCC207A0B
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 17:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738689794; cv=none; b=qgYeA+gmMmwN5/zs4zgHJ514zGKIYQjUFKk5qi87u7Gd00VOSpfiJwXFSLNyHzVwIL4S0YGOpBPzwIWRAcSA61ieLSZMa1316XF52Qu4r8CUCzOOWq14jQvjkfTZQnb7YDqIaYE41XZGO9GwMf/SLgXuwE1oqmmF7TprEOoVikU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738689794; c=relaxed/simple;
	bh=+Mc8NydDU1OM/dB7ToFbrdv1mQz3p3QgEZwtAF6rsQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lDAt0xZEEKan86A3s6a923yAICV7Y9n2D/d1Vb8nHsW9urhadXRZm9aqyd+OGk0wONjpOdKmYjsAATT80H8DdJcMG7rt10y6APH6Jvb1f2nD8gsCxR19xd3kA18QnoNewEs03IQ31ANWTmbPUSs23GZ8EnPWaZMN5jdDmACU1qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k4AlSJeR; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k4AlSJeR"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30737db1ab1so4945631fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 09:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738689789; x=1739294589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5BBuYTzTxCxHlA89cur3oiUM9mGTbCPIm1uiSGbWU0=;
        b=k4AlSJeR2dphoTGgUNpeB1fA5uvgIAnc4y9wHikTtOEnP2htCv/3NHN2OLfILBNcJX
         kgCwcDdDmOchaWEGmoQ+mAlN9s/jc4oyitMBR2ml/n1hyjGwR12/fzkQusLZEY4UprTO
         s1+PBIDDJ3HirQzoiIs6URRvvletUQuPpDywQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738689789; x=1739294589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5BBuYTzTxCxHlA89cur3oiUM9mGTbCPIm1uiSGbWU0=;
        b=XFz7A4fbUT5BS47Nzf0vkzcIfDITcWuaN+8cHB2l4phMiIA5tmg5oZeoFdv5WOXcA7
         /bVG3z/i13BcT+zwsqmjMGG4JmFyY8zfSijH+gsMqpUKb2thj/1+Gzoxgfcauvx8v2FD
         uQFQmRATzuCN/9rUtp63uv5/YAEHjabwCbJOS1aBQ5aURmndm5YGjnQgX1pWTS3W6yIV
         /J3wpYhKoQJDPhVd5KUGz+H/7B8GpJasQ+EpaHJcLWz6iPPHlZEVXhNDdeNVrmVphZrN
         7bOhYOT8NMPLukFqOsbegeAcD73xZV4Dq1/9FnE8gXnm5gSP1j9etF2ulWiRgR5HqH0J
         ZruQ==
X-Forwarded-Encrypted: i=1; AJvYcCXohWWooY7vHq4ZsF52ilcFrm1oI6eWDKFfP1+AQ8BwNp/MJqNYhwO4kIm8bdofUXeYJcQ/YD3RnS+HT1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrVdVOhiFGO0Tv1gR4uSOI4UhZQnkbVGumXn44w3qRPlRCTUFP
	zNJAMLCPRq5/a3VLZqb+uSTCX6dFiwcx0bZv31eceOXje9Blo9msjp3ImmieAnOb0FXhsY1V0fu
	B2A==
X-Gm-Gg: ASbGncv0sWdWIj8/z9xxsfXdp6D102yux21jXIbJIToHSoWYXA6/uRPPv6KYHX2Tv95
	NF/NA2mvSdDq7b9XbAzS2ZVQDGyypjGEFZSV9InpzvxXmRC1rESz/dpvDDcBWrK1ffaOmmBhVNV
	VLVuYtSzbGG/a9dClNT4kS5RALvHronkjOCnjO6DddXb2KTF5e3xKwRnICOS/YVlIQTiYtYr50n
	x2oK6gOljCN/Vt7N/yOkeS5tAWi5pllUYbypxFY14lF/KVPScFDseuhpCdpuXVYaJ6od6xg4duP
	selr+UQEBjp0t5sR/7X2HSeH2UrZq2/qjWjo6yQiOxGb7XtNNIC2Fv8=
X-Google-Smtp-Source: AGHT+IGo78hPPD7uj/Ax62a+vPXHzqoXfMI2XLEw+7tEs61iUXSSNy++4oH7S2PuAlrcu8703f4rMg==
X-Received: by 2002:a05:651c:19a2:b0:2fc:9869:2e19 with SMTP id 38308e7fff4ca-307968dbc84mr100724521fa.34.1738689788932;
        Tue, 04 Feb 2025 09:23:08 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a3069c6csm19866931fa.2.2025.02.04.09.23.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 09:23:08 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-540201cfedbso5310652e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 09:23:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVk0fQKgdh8lQadY+gx5kBzNno9eJRLCaxj0RRIqNUHabF8y2vk8q+/9ZXgS601YiN4KzXX88qIiWthYpw=@vger.kernel.org
X-Received: by 2002:ac2:5211:0:b0:53e:3a22:7a2e with SMTP id
 2adb3069b0e04-543e4c3fcf9mr7317073e87.47.1738689787581; Tue, 04 Feb 2025
 09:23:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129-uvc-eprobedefer-v1-1-643b2603c0d2@chromium.org>
In-Reply-To: <20250129-uvc-eprobedefer-v1-1-643b2603c0d2@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 4 Feb 2025 09:22:56 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XDUmo=OEFtoOt6vkpCVQ628QK2xX8+PBnqJVvj0y7pug@mail.gmail.com>
X-Gm-Features: AWEUYZnrPiry48nd_-swhnr9bFmRqR2dsreF7sUVpPQTg7S8Rc3CqXimX23DP7c
Message-ID: <CAD=FV=XDUmo=OEFtoOt6vkpCVQ628QK2xX8+PBnqJVvj0y7pug@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix deferred probing error
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jan 29, 2025 at 4:40=E2=80=AFAM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> uvc_gpio_parse() can return -EPROBE_DEFER when the GPIOs it depends on
> have not yet been probed. This return code should be propagated to the
> caller of uvc_probe() to ensure that probing is retried when the required
> GPIOs become available.
>
> Currently, this error code is incorrectly converted to -ENODEV,
> causing some internal cameras to be ignored.
>
> This commit fixes this issue by propagating the -EPROBE_DEFER error.
>
> Cc: stable@vger.kernel.org
> Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/u=
vc_driver.c
> index a10d4f4d9f95..73a7f23b616c 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2253,9 +2253,10 @@ static int uvc_probe(struct usb_interface *intf,
>         }
>
>         /* Parse the associated GPIOs. */
> -       if (uvc_gpio_parse(dev) < 0) {
> +       ret =3D uvc_gpio_parse(dev);
> +       if (ret < 0) {
>                 uvc_dbg(dev, PROBE, "Unable to parse UVC GPIOs\n");
> -               goto error;
> +               goto error_retcode;

FWIW, since you're specifically considering the -EPROBE_DEFER case,
it's probably worthwhile to make sure that dev_err_probe() is called.
That eventually calls device_set_deferred_probe_reason() which can be
helpful for tracking down problems.

It looks like uvc_gpio_parse() already calls this if gpiod_to_irq()
returns an error code probably you also want to make sure that
dev_err_probe() also gets called in the case where
devm_gpiod_get_optional() returns -EPROBE_DEFER. In that case,
potentially one could also get rid of the uvc_dbg() above.

In any case, IMO even without those changes your patch is still worth
landing. ...and maybe my suggestion should be in a separate follow-on
patch anyway. Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
