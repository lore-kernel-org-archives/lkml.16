Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CA52A1BB
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 00:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744936237; cv=none; b=gXBj3vig1RhYrq7vuA9zGumLoCD4OFvWNd8I4jxgNWBCmynN8HpFmbO00rqCUsHwFxGkVtROVUrRj2hvUOIk1hRPG/VitGXqH4U3HQl6UxoWRq9IDgyKEse9bgevVg6KVzIQAYp7j8li05i2O/kPJwz5qcNlgaN8v7nZ72o76nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744936237; c=relaxed/simple;
	bh=teAQtIIgrsyG9gqv2XUIXLjFkPTTKS4DNvTftIjPFE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQlKd2u8Pi/8czHnHomP9IRTa/3Dw84JeLbvQQXwbCfctJ0hAkKmIh3vHLsIrvCQlcC0eqaSLf9kii6rzClf05Z0exfBFKLCKqda9NU/dEX2bmf7DbkuAZHUXDrEZ6NoGYdN7w5rYZ7Q0MlcZ8mZlpNKFcK+enChHBXs8IbjW7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LCb1bS8t; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LCb1bS8t"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54996d30bfbso1268229e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 17:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744936234; x=1745541034; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRStZ+2egg7DY4RvB22DIQ8mwU20T0KsGY9/et/qm98=;
        b=LCb1bS8tgBiRvKAEryWHT4+J1Df2wI7B6AA2cCUbV8AZYWoZuF7yA8r2Yzt3igdn1O
         TGTdxWMoW1Dh17UjqNKT1AP0oizSDYfaJrKd1/eV7nbCiqRsp+kav98wEPSn0hlUmaI1
         tMAwUUzpj7uYtLluqyiSc9ZZSW7gDp4+bZCHifbibEnMFipYWtwyCH9PtnNZRydCfXes
         MhDqVozYNssC02JIZupz8wQux/b7YbQVa/B92pHJvO7bL8ji96qOHiphzXs6GthaMNyf
         xZvEkRVNot7hU4AfYl7OX00AxwSmQBe+8TIN3kKUkL5KDLVplEC1fX2UGLBriIluPqfe
         xcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744936234; x=1745541034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zRStZ+2egg7DY4RvB22DIQ8mwU20T0KsGY9/et/qm98=;
        b=mNky+B0qajfuobBvbsYMQnp2GbI9uy6ba29pHCxY0oiJ7Qa3lhvO/3awGCQwBVt5YU
         /5K12j6k1Wn+l1JJqP1kWWLohqL9qa7GPWJmP+Z2k2u9huVJXIU5CXJbkUq5ijpyPnei
         Jnu8TXHKpbcLPUOFZK3YDNKi7pciRbZDlrnYSvK/HfcjCvB+/+iN96G3rP3mNqax5j5r
         5TfvIxxgjjYNoXpzwZ6z/ShvQSYi3VeX5le0O0GERZkYR/g9LMRx5rGJHJytcbRM9Jqw
         cvE6aJP5dF1ZzX06Mx0GDJLzG9kSK/eGriGUWChfn3SyCjXq1ssx/uloqEL8ifLgsKBV
         5CxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjEeBCXDBJiianDPFb3M2dCcQxl+3k9v+65tY/skNXKqk7WPWZrrQ3HaBwC3R7eMDe+cKjn4Yh9Cs/3pU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+y9gWWqUzRK1F3y5cp1KjMAVnLUJPV22JhRDrUotDG1t760Ih
	JqUutsMaW25OkCKe1AniycsgnmkyN4NHLdpWD1iiPSnYL4JkE5+wHrI6V0IjZ6ZBNSM9EFPfYH2
	tSZDewaolOvLdNJLkSx5yZN7jQ+EFGM10t39g
X-Gm-Gg: ASbGncv+rNv7V05aFUx2ON77dJRBLZKvoXmO6G5+G0LALbI3cNZrYnnLwhOZH1130ib
	i0oFE+Wf8H9mFQyvhO7SvKnj/dFT2GNUuHiFzXUXrjDoT3Cww28k8Paw/So+BvrK3oOgQ1qraDh
	kTms2DNztWOg4wUFHPMknfOuQPRZ9laZ/SlCbEsM/RjYqebew=
X-Google-Smtp-Source: AGHT+IG3XD/xd1L4getjSXyzKhJ/tUmw+zRdL3AduxLLVD1S7dldUsdPHIZT/6KW0n4GYVlVfvABqRfIZjoj9xcApZs=
X-Received: by 2002:a05:6512:4013:b0:54b:117c:1356 with SMTP id
 2adb3069b0e04-54d6e66896emr211762e87.56.1744936233589; Thu, 17 Apr 2025
 17:30:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417142513.312939-1-ulf.hansson@linaro.org> <20250417142513.312939-11-ulf.hansson@linaro.org>
In-Reply-To: <20250417142513.312939-11-ulf.hansson@linaro.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 17 Apr 2025 17:29:56 -0700
X-Gm-Features: ATxdqUGpJJVZF3u7FnJNC0M4_7BmLxu5IpIq6-Gcvk5MBvzfHTZtM4vMnuDU8VE
Message-ID: <CAGETcx8jWtGAb9CyFyBmuXjNx6XPGHQLmyr6+6S2+vyMnA6j7A@mail.gmail.com>
Subject: Re: [PATCH 10/11] pmdomain: core: Default to use of_genpd_sync_state()
 for genpd providers
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>, 
	Peng Fan <peng.fan@oss.nxp.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Johan Hovold <johan@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 7:25=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
>
> Unless the typical platform driver that act as genpd provider, has its ow=
n
> ->sync_state() callback implemented let's default to use
> of_genpd_sync_state().
>
> More precisely, while adding a genpd OF provider let's assign the
> ->sync_state() callback, in case the fwnode has a device and its driver/b=
us
> doesn't have the ->sync_state() set already. In this way the typical
> platform driver doesn't need to assign ->sync_state(), unless it has some
> additional things to manage beyond genpds.
>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/pmdomain/core.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 9c5a77bf59d2..695d7d9e5582 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -2671,6 +2671,8 @@ int of_genpd_add_provider_simple(struct device_node=
 *np,
>
>         if (!dev)
>                 genpd->sync_state =3D GENPD_SYNC_STATE_SIMPLE;
> +       else if (!dev_has_sync_state(dev))
> +               dev_set_drv_sync_state(dev, of_genpd_sync_state);

Do you need the dev_has_sync_state() check? dev_set_drv_sync_state()
already check for everything under dev and drv. The only think it
doesn't check is "bus", but if the bus has a sync_state() it should
call the drv->sync_state() anyway.

-Saravana

>         device_set_node(&genpd->dev, fwnode);
>
> @@ -2740,6 +2742,8 @@ int of_genpd_add_provider_onecell(struct device_nod=
e *np,
>
>         if (!dev)
>                 sync_state =3D true;
> +       else if (!dev_has_sync_state(dev))
> +               dev_set_drv_sync_state(dev, of_genpd_sync_state);
>
>         for (i =3D 0; i < data->num_domains; i++) {
>                 genpd =3D data->domains[i];
> --
> 2.43.0
>
