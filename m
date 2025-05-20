Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BE01B042C
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 00:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747699956; cv=none; b=CDn1JB4SyINAEW9Xehr8/2wQdOKjNGjmuELFuuovvCAvFUIsn85XgHvttXQzksrZPGL0mVu7abl4PCJo/fXyw8j3HcFlvJGO5pWnEx+isPya6IcG8eAIfSboklQ/+LtLNDZDLSP51Yx5m8tAtiqVgs4Ha4OoN3ai0c+4r17Zq98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747699956; c=relaxed/simple;
	bh=IT9pHtUz+s0Q1gCJStym6qSugp/fBQlHxKJt8Jm1lqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oMCxEV2m/17BxiEkQ8cBrvN1fflu3k1sMDkppcKdKAlQtW+GXLJSH8CrRGbdUTchWJMn7iX5tMipp6JXbZjZEa3yNVuZ3/9dF0WoRdjedReAitO4KUI40eHQIVN8iWewpTG10evBmhfqIoBYXCUeABC+px1J04kc1aGGq0XiZzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ArDLwFJk; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ArDLwFJk"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-48b7747f881so808301cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747699954; x=1748304754; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSOzuf4zM3x/LvxSKSjkkww83y4Ey5iG99RHEpA5ilY=;
        b=ArDLwFJkiaHPZv6ar0tUkpSfpcjTh4ZWx39OrgqYhKaK7LRPeLL21cn2us6xNzt3Bg
         uDzqGaA0dVzuymvoWTbsJPTCQr9rDZCUC9Mj2poxy38XTvlsz1FEekWMntS5n+e/WhR1
         jBKTn2ruvv/x3KA3XWVIgmBxP941wlkzX+r2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747699954; x=1748304754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XSOzuf4zM3x/LvxSKSjkkww83y4Ey5iG99RHEpA5ilY=;
        b=LjcXu94guP1Qat/rCHrI9f+BghL9zm4lqAHn/T6hcf25Bjf+xNyxqjFAdHlrCkNlip
         UjJ+3CEc2K2IBKfA8CN52qnc8RvkzmYDfn0PxQzREoRNpmsilwctAB65tNxsoz+U9yTj
         SvluR3t9LbPVOoNPWojN4CBLxanL4FkwLVfA83DosjzXZAgX5V/AFZaIX+2LjRPJBaas
         sbTE+sarBICKVPkROjthTPGRWxyrhjDupKDnR/CO41Jp9v1nHLMg9EnSuNQrPuqIJgUq
         yQe09IQKxTJw8yLcjwCSmEiaTdLqYG97D0Sr03uE1NQiAn4AMxapo/lFHZPXHHQw3ZVe
         3/Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUm9B21hFRecQzJljMqkFWQThLMQfYA5Ydpz7NK6NcQA+eB54QzG7i6ELjZH7OTmc4yGRBSF2ncW26K508=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv3D5A9Iw24a+jOqduEJvCN427zVBTSNTWBBJhBFvbd8zNuEe5
	x6RLfdE+ODnyLYzOb4EHeaBeAhlXD0MvLzXfD9lPVFHRTL2WI7Tu/ZBFFqxwsuwDo9NyqvBMd9B
	flAfHUx6k5KpcxYV6fZrDXVCtHH4qTqQgZDKG3TQPNXbk2zO22SZtQh3K
X-Gm-Gg: ASbGncuFudmJ8J0PrDmFCpziiRmgnE1QGPBxz9rVpNPNSCAeuxAKisji6BZq7MkiAyi
	/lMZwx5zMOJwliuDuGW4ECikLnop8SCtVVUmabGiZpo4DBOMAcY3lDZzkEwYuFCPo9P1GUVogiD
	i7xySWCZjNqDlYCsDAZno0LOT/EHwv0zeWmSGaKecLvIRu+xk5HMc=
X-Google-Smtp-Source: AGHT+IGeiEqytsKfbvcOJoATsM9r1IDoSbSawj6sJz4yq7+zFCOByAUS9aOucjOKsanjqRavnKGD/ACfZHzBtCS7E5k=
X-Received: by 2002:a05:622a:4a:b0:478:f8ac:8adf with SMTP id
 d75a77b69052e-49601270e9bmr8144761cf.19.1747699953197; Mon, 19 May 2025
 17:12:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519170055.205544-1-antonio.borneo@foss.st.com> <df2124f7-8df9-4fb3-b687-5968805c668a@roeck-us.net>
In-Reply-To: <df2124f7-8df9-4fb3-b687-5968805c668a@roeck-us.net>
From: Julius Werner <jwerner@chromium.org>
Date: Mon, 19 May 2025 17:12:20 -0700
X-Gm-Features: AX0GCFuJfn0H6VbpxEdzZcu5Pm6YQSV9kAZ5ya8oZZA3CzSoInnwOJUz-Vgz-14
Message-ID: <CAODwPW-gEOotp8KGhzk3E11PqF9xdan8dOwxe_SW4txh+uQp=w@mail.gmail.com>
Subject: Re: [PATCH] watchdog: arm_smc_wdt: get wdt status through SMCWD_GET_TIMELEFT
To: Guenter Roeck <linux@roeck-us.net>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>, Julius Werner <jwerner@chromium.org>, 
	Evan Benn <evanbenn@chromium.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't really know about the issue Guenter mentioned, but otherwise,
from the driver's side this looks good to me.

Reviewed-by: Julius Werner <jwerner@chromium.org>

On Mon, May 19, 2025 at 10:58=E2=80=AFAM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On 5/19/25 10:00, Antonio Borneo wrote:
> > The optional SMCWD_GET_TIMELEFT command can be used to detect if
> > the watchdog has already been started.
> > See the implementation in OP-TEE secure OS [1].
> >
> > If CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set, at probe time check
> > if the watchdog is already started and then set WDOG_HW_RUNNING in
> > the watchdog status. This will cause the watchdog framework to
> > ping the watchdog until a userspace watchdog daemon takes over the
> > control.
> >
> > Link: https://github.com/OP-TEE/optee_os/commit/a7f2d4bd8632 [1]
> >
> > Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> > ---
> >   drivers/watchdog/arm_smc_wdt.c | 18 +++++++++++++++---
> >   1 file changed, 15 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/watchdog/arm_smc_wdt.c b/drivers/watchdog/arm_smc_=
wdt.c
> > index 8f3d0c3a005fb..f1268f43327ea 100644
> > --- a/drivers/watchdog/arm_smc_wdt.c
> > +++ b/drivers/watchdog/arm_smc_wdt.c
> > @@ -46,6 +46,8 @@ static int smcwd_call(struct watchdog_device *wdd, en=
um smcwd_call call,
> >               return -ENODEV;
> >       if (res->a0 =3D=3D PSCI_RET_INVALID_PARAMS)
> >               return -EINVAL;
> > +     if (res->a0 =3D=3D PSCI_RET_DISABLED)
> > +             return -ENODATA;
> >       if (res->a0 !=3D PSCI_RET_SUCCESS)
> >               return -EIO;
> >       return 0;
> > @@ -131,10 +133,20 @@ static int smcwd_probe(struct platform_device *pd=
ev)
> >
> >       wdd->info =3D &smcwd_info;
> >       /* get_timeleft is optional */
> > -     if (smcwd_call(wdd, SMCWD_GET_TIMELEFT, 0, NULL))
> > -             wdd->ops =3D &smcwd_ops;
> > -     else
> > +     err =3D smcwd_call(wdd, SMCWD_GET_TIMELEFT, 0, NULL);
> > +     switch (err) {
> > +     case 0:
> > +             if (IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED))
> > +                     set_bit(WDOG_HW_RUNNING, &wdd->status);
>
> This is the wrong use of this configuration option. It is only needed
> in a driver if the watchdog status can not be read from hardware.
> That is not the case here. Worse, using it in a driver like this
> overrides the watchdog core module parameter "handle_boot_enabled".
>
> Guenter
>
> > +             fallthrough;
> > +     case -ENODATA:
> >               wdd->ops =3D &smcwd_timeleft_ops;
> > +             break;
> > +     default:
> > +             wdd->ops =3D &smcwd_ops;
> > +             break;
> > +     }
> > +
> >       wdd->timeout =3D res.a2;
> >       wdd->max_timeout =3D res.a2;
> >       wdd->min_timeout =3D res.a1;
> >
> > base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
>
