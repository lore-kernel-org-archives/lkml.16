Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82C5823DE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 11:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744025188; cv=none; b=Of0xgdWPUFy4E7f/NPECLlZj1iIRW7R03JC8BUBxYNHlwTTHiTLsdzDibgyj9k9l0ar1B2KcnByQfCjmkg+iFYw7mexHwen7ENNSMhdFO7/vp/aPopeHuX8o6C00kkByh+LVJex/QNvN7F+fLRwW/Bpl+epMhVHjLOVFjojCzvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744025188; c=relaxed/simple;
	bh=RviIKAswlPvNGRsEWdEPn05fxHOsZa6tlhHIEII4Ung=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ku1l4YzNfJMWKKfvEQONPCIGw2xF8zYZwoyGyHprdsFVWZf5TRtVtZkL6AjLTsiJ55hwR7jBgydIbXPeEh45wkrvg3vU3dR7zc3Jnfweaule/FT3S3cXmGT6QAPK79QWfNBd9AWk4o1HZyDvYDuH2ok2PgBOmjz5ouLa0tTQ8D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZVDY1fVP; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZVDY1fVP"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54acc04516cso4856166e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 04:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744025184; x=1744629984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMO1POcPMv7WcEI3IEK8Y5twX/lsGWmxAHtpCcotjPQ=;
        b=ZVDY1fVPITL5y0lB7xs6qqdEmtD18vOXeZpZXhyeAyFOCSNBGjAm4XuAhqYobZnDco
         RxkPpNI0MUCHaufv1teJaf7fQj/vCnq+c+HTUf0dpC6VkY/+E/eisw3yXTNPhbm9U4Vf
         S+hzaBrn2iesr9OfiGbTS5stgARF6StqOofTz7csKLN+d8PAFD4CIUpZkVUoqm/gSeRA
         HME9yR4Bft++hjU21ReXNXDNUA58q4+N86Hx8qjg/D8wns/4Z+5QjK85WRyVHGBomWmU
         zGD9GpNIg4EtXkrSEnOms5jOp1yasb1qSQduVT7eydqXaYCPTMUKj+haUV8lbcIP0QYr
         Hf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744025184; x=1744629984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wMO1POcPMv7WcEI3IEK8Y5twX/lsGWmxAHtpCcotjPQ=;
        b=T2Xk4HhHgl59rd31KvfGnLVmL9X0sKoNiATqQiMOKFOZ8aO3CN98IpqVWdUSqaFeni
         7oTnAF6HOzCcs8Cw+9VQiJO3Fj2DimwP0cBSs5us26PHmmFSa0WsNtAbwqecd66vIl48
         TkzjzWS7fV7SfGPlVDPfNXD4iy3hkF9fVCcuv30JWjPTIl2O3aJmaanuyUZnoCaC1731
         VInGMwHwVfGogGYQoII/tZhec9tHqXDIMm6tIOa5p5vvY9TOiB80gaPYpiuRh4e9XWVY
         b3lSMOC96vRKV+a32eCAMYkhozrLJOBbTmPbEI7TtVE+I7A5CsIBw6JJsNTZ/8tYWQ6b
         4+oA==
X-Forwarded-Encrypted: i=1; AJvYcCUws70ZjkP9sI9fNZCeMTuoGQBZy+vwW4UeS6gCawLlFcMOD+/7VucIbMQLaEWNuEEw5EOqStfmAjwp/ik=@vger.kernel.org
X-Gm-Message-State: AOJu0YwizFDwxyZoF9apACFohdX7SvNPO/wIWulkJYyYb9bFH+n1lADg
	tPLYd9abMEyxO+sHRJQerQO9E0ZTRLVIIecoN/sdeAO9AH/4osB0wG+rcex8hHlEIvy7TYj8bv+
	BKGFzAupUeqrH9iHBLA+4nBSGFfNrVXlkBKibjw==
X-Gm-Gg: ASbGncscRDcRgAiVUVISQTC82efXFi3fGCAv/HEAnjzebqIDQ1/fKJu81pNB7nEDq3C
	Q7o7itmd7egvOFq8x1fGDk1VdiLEW1LSgGuFJ0xta6RwFk0rztofxSfNxQjzy5gGRfavuqNETF4
	4570Y1dUw0qphJgQTVDxrq5+wmCNqDprrkdyhhccZcfgu7Z4ySAVk8VuyA9MpT5S+wvaBU
X-Google-Smtp-Source: AGHT+IEF0Umob27acb0T2mBiL6aYslIf1iwF0v4IeDnV4GdBZ6Kni8wcccQPNxQv4mkDvYKKandIkloAlzt8S6od9ac=
X-Received: by 2002:a05:6512:400c:b0:545:48c:6de2 with SMTP id
 2adb3069b0e04-54c297d099bmr1645433e87.13.1744025183610; Mon, 07 Apr 2025
 04:26:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
 <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org> <20250407103320-GYA13974@gentoo>
In-Reply-To: <20250407103320-GYA13974@gentoo>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Apr 2025 13:26:12 +0200
X-Gm-Features: ATxdqUFdC84fNZAgdG0QB3uYh3FcHqNCfMgI5v2DW_l-kU6Xw4akq4WaqW0KsIA
Message-ID: <CAMRc=MeFK1gX69CWH2gkYUqkLU-KCOcwHcA+gjN1RXFA++B_eQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpiolib: support parsing gpio three-cell
 interrupts scheme
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 12:33=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Linus Walleij:
>
> On 06:06 Wed 26 Mar     , Yixun Lan wrote:
> > gpio irq which using three-cell scheme should always call
> > instance_match() function to find the correct irqdomain.
> >
> > The select() function will be called with !DOMAIN_BUS_ANY,
> > so for specific gpio irq driver, it need to set bus token
> > explicitly, something like:
> >   irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
> >
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  drivers/gpio/gpiolib-of.c |  8 ++++++++
> >  drivers/gpio/gpiolib-of.h |  6 ++++++
> >  drivers/gpio/gpiolib.c    | 22 ++++++++++++++++++----
> >  3 files changed, 32 insertions(+), 4 deletions(-)
> >
>
>   I'd assume this patch [2/2] will go via pinctrl's tree?
> as patch [1/2] has been accepted by Thomas into tip tree [1]..
>   Additonally need to pull that commit first? since it's a dependency
>

No, this should go through the GPIO tree but for that I'd need an
immutable tag with patch 1/2.

Bart
