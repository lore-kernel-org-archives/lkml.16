Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E542063D8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 20:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744923386; cv=none; b=HYSsb4jkqFTYE+/+7OzXpwgKiCV/x+3dBMvYKDtphXGiq6KJ49RipT8BwQcJty+1Z/kp92op4q6CpJShMocOJJiLiTBukrhPz2oriWVZrXk+PdOMigpx1bhfUO9l+CgkSso6ydgv4zJ9Cxiksw/ocl8/2Z9PCWPN/+ZRujbmxwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744923386; c=relaxed/simple;
	bh=V7PDpk2GFXR6cXkHRnlnFl27UJzlnxaonCAEGxbDy5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=be0fv+bnHMFHuuyaNgASCXu1I/aLg4lZVQnLBvrJNx5yiT/8yDYIIwZq4loE5KfcWyDNu8i/2K2k1dNSsLJmIxL2CrjQyqIbWlVUukeNUy5UrnIFNCZFkoTwmhHa/OS54tJVIfYyFvpm/4/xr/hhzFiE5LWVPjL4tM+Vj42fAx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HfbTr0Pk; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HfbTr0Pk"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54acc0cd458so1448615e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 13:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744923383; x=1745528183; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Fv+1SPiZIDJMfYYyVTz9JfiGK8xQsdvl6qvFoYBv9E=;
        b=HfbTr0PkzoLMdpZO4YpL1iyPUywtbZBkIIRNonyTsKFQQWZvs9vdgYNhJU2dWK3so7
         kzVqQqO1CuqdchSYfAIoKHVjZLbQT6V9x78VLERRzIXtFrw8sk5pMGK4PHZMtaaPdwdm
         l28UkxLSbMSYhisM7oIjCKf1e0nSaud2aDOm6qREWLCduYRmq8/zU0d6PyG5am4ltNdL
         jSmoHCh15BGli5AhlyEvFuzny397votXAqEBnmpOe3kStAI1nZxopR3ouLZBDgeWdGMu
         VJ0hp4o4kjAq1mmnSFmJbY+Ma8RKpNz+UMx3S2et3Oc4HzcsIMTY36ZB/B58qxncDrPq
         5yQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744923383; x=1745528183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Fv+1SPiZIDJMfYYyVTz9JfiGK8xQsdvl6qvFoYBv9E=;
        b=fjfO8TkQg5gNPPorwkgML6ghgqcyml7xtpjnNzpUQHJWyyWBPT1b/Nz2ekNULZbkEy
         H1u7hSkADF6vIhHLYD+T8cS7TOWmHrpFdn+hpDB+o1eFk/6Wup5IFwmE1uXlC1bIg48C
         NyFed3xDAo2aG4zuJH6nOV6WtGzOB5QIdWfBRhExALYIUCljFW2x3OlbyxdaDNwPnKLR
         1QS1NqpNEPzuNh3l9oEHJ9Swt7e2vDyMKkpBM4ckGAY1ImEBxltUe8Z1qW/QmRgNkjsr
         DF/N2RbL4cY/0DwFxEfxx/RcUFnwOJQX0nchTudE4Zjj30UOt3yIpCc/BTFRVuWo6+9s
         Sf+A==
X-Forwarded-Encrypted: i=1; AJvYcCUUe4VTWj8H3UR9qIk/DQRbOpGIn09zh9UOvv7AgdIcio6S3zXYKqZOujjG2o/1CVzKa8qGD5ZASxfGXWg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh4S5vve+yDxElymc5P6CZayvUP34yVPG20TkUB00CSrJf6nlT
	oanU/oXA6/FtEqevMPm4cR8S0rdh76jT+E8XmbyCmEuGLM+fH6Y6toxm1j/CMVJTt2/cxadGXVZ
	E9/aJTe6Cu3vgv9AENgiv2+FtNi8U/LmQYs1K
X-Gm-Gg: ASbGncvO+Wx4VglbctJLSkggH77+EChg7wcXlpJVE0XjyQTAlxHtmCCDWY1XFZhXAK+
	lozjxznj6F69oifbzoWGDXwRo9aXrftWrwmyKbUKlLW00pXxe4KdONXFd4E0sRbtCth5JjWVINS
	daqR7WDCBgj7xRw/UPVZ8T3JhsYxJwitD/CHcNFF+ORCLn5MJPCA==
X-Google-Smtp-Source: AGHT+IF0A2qLak23h90FXemjjq1QSkYxyUlJpX0SxLY+jGfQkwpWy77tDR0Zm8B6OSQfWtCedekDAXvMVmWnr/eLmso=
X-Received: by 2002:a05:6512:15aa:b0:545:576:cbca with SMTP id
 2adb3069b0e04-54d6e61d361mr87421e87.8.1744923382449; Thu, 17 Apr 2025
 13:56:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417142513.312939-1-ulf.hansson@linaro.org> <20250417142513.312939-6-ulf.hansson@linaro.org>
In-Reply-To: <20250417142513.312939-6-ulf.hansson@linaro.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 17 Apr 2025 13:55:46 -0700
X-Gm-Features: ATxdqUFg-9XKLQu-Jp_yqmPhQEY6HN_legQJia2_mCP7a2s8KIX0565-yrMa0hQ
Message-ID: <CAGETcx9bHGuJ_J6yF14x0NJJXGWgoDn_X_ScBKaGdD4aTBvo5w@mail.gmail.com>
Subject: Re: [PATCH 05/11] pmdomain: core: Use device_set_node() to assign the
 fwnode too
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
> Rather than just assigning the dev->of_node for the genpd's device, let's
> use device_set_node() to make sure the fwnode gets assigned too. This is
> needed to allow fw_devlink to work correctly, for example.
>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/pmdomain/core.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index da51a61a974c..3911d3e96626 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -2627,6 +2627,7 @@ static bool genpd_present(const struct generic_pm_d=
omain *genpd)
>  int of_genpd_add_provider_simple(struct device_node *np,
>                                  struct generic_pm_domain *genpd)
>  {
> +       struct fwnode_handle *fwnode;
>         int ret;
>
>         if (!np || !genpd)
> @@ -2635,7 +2636,9 @@ int of_genpd_add_provider_simple(struct device_node=
 *np,
>         if (!genpd_present(genpd))
>                 return -EINVAL;
>
> -       genpd->dev.of_node =3D np;
> +       fwnode =3D &np->fwnode;

Use of_fwnode_handle() please.

> +
> +       device_set_node(&genpd->dev, fwnode);
>
>         /* Parse genpd OPP table */
>         if (!genpd_is_opp_table_fw(genpd) && genpd->set_performance_state=
) {
> @@ -2661,7 +2664,7 @@ int of_genpd_add_provider_simple(struct device_node=
 *np,
>                 return ret;
>         }
>
> -       genpd->provider =3D &np->fwnode;
> +       genpd->provider =3D fwnode;
>         genpd->has_provider =3D true;
>
>         return 0;
> @@ -2677,6 +2680,7 @@ int of_genpd_add_provider_onecell(struct device_nod=
e *np,
>                                   struct genpd_onecell_data *data)
>  {
>         struct generic_pm_domain *genpd;
> +       struct fwnode_handle *fwnode;
>         unsigned int i;
>         int ret =3D -EINVAL;
>
> @@ -2686,6 +2690,8 @@ int of_genpd_add_provider_onecell(struct device_nod=
e *np,
>         if (!data->xlate)
>                 data->xlate =3D genpd_xlate_onecell;
>
> +       fwnode =3D &np->fwnode;
> +

Use of_fwnode_handle() please.

-Saravana

>         for (i =3D 0; i < data->num_domains; i++) {
>                 genpd =3D data->domains[i];
>
> @@ -2694,7 +2700,7 @@ int of_genpd_add_provider_onecell(struct device_nod=
e *np,
>                 if (!genpd_present(genpd))
>                         goto error;
>
> -               genpd->dev.of_node =3D np;
> +               device_set_node(&genpd->dev, fwnode);
>
>                 /* Parse genpd OPP table */
>                 if (!genpd_is_opp_table_fw(genpd) && genpd->set_performan=
ce_state) {
> @@ -2713,7 +2719,7 @@ int of_genpd_add_provider_onecell(struct device_nod=
e *np,
>                         WARN_ON(IS_ERR(genpd->opp_table));
>                 }
>
> -               genpd->provider =3D &np->fwnode;
> +               genpd->provider =3D fwnode;
>                 genpd->has_provider =3D true;
>         }
>
> --
> 2.43.0
>
