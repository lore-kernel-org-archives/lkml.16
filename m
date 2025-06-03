Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662881F583D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 10:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748946538; cv=none; b=H1D8yE6cWh3g5R+dhlLOW1kNiUEwaY0WU2KiwF0nHU6HbRZyJ1navmQttUjWBjPsLkrrLz7oFF7F4Ngi1w+P+JAb82PcGa1Wv30+kiCd1ZaMobEN8oaorz9zrz91Usv5vSZOUnJWxET5ByKF5m9EW0S5wBORgQyWA1SsrfXXe+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748946538; c=relaxed/simple;
	bh=xPrZ71KYZi8FAW1xo6peZL39uNTqnX/Wm5X7NSs7dM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VwrGuIaCeF3IeH4qNr3O8DEPOAWqbPO1XBsfsxrA0t7QauFQbsR4qfmHAR+Zd82l/74KxWjtWqa1joIIP6gfABhfAGsmgQvzttxVsG3Hew80v0XHPM7w2wCEcg4tty+ur8kUFCI6K2xVT8S2YOJNmkZr2HBkFX5MufsvqkcSzx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nphDXibu; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nphDXibu"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e7da03bb0cdso3817058276.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 03:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748946535; x=1749551335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MV4nJ5ccv3/M7r9xysN8i7uyE9/mcP/N7Hy04O9n47g=;
        b=nphDXibuVp9pdQdI3LH2J+VbNuDaw1Yj9JMBGksqBe3PlwOZG4nhP6PA1wWie3RUyO
         vJ3Pi6CAkeo3kVlBAGbc3aUNHBFYJlTTXXzzvs+vsPq5kZ2hX5ijeXZyMFfztAAiIshP
         X44VCO8m3i2NT/bclJv2n6pvtz1W8nHmdfo5wW/dKbIdr9/zfP6di/9zucZSDKby3Rvb
         AQycCwkr0+7VXIFJ4YoeYq5ed2XrXskBxJWF08DB/VFWbuApjHx1mbClEri9jvbdST6/
         dsfX3RqCrmECdPZ+KeJShsoty5LMGLzWendVxUFvHYnxl7dpHL1hUKSxQ8b28ySncK5C
         BuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748946535; x=1749551335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MV4nJ5ccv3/M7r9xysN8i7uyE9/mcP/N7Hy04O9n47g=;
        b=DOdByvvigqhhvgaRQ68CqpOjjDTsMiSB5Ujs2OEvtVPV0vbe8g9lasTlqrCvB5QSsf
         zkPqK1MnV+Q976Ey4zWAe9CGH7YM2KgNfeqHSOw9snZVgefPulPfRXESdiARMjPH6ePz
         pis7GKZyW2Mzhhp1eFH5tP3hXqGKXTnpFEu59dukGJ4FJVBhPWcQRakQ0dMZg5Sh/rdX
         CrqPCu0hN/31T7yfdlWMrCONHCH+xlQbc2PpK+XWocnrTxIEi0VIlKH5xo8OgdpBgq/V
         wQbAUVKrbRB6+Xcq3BqjbLijFl5qLTjWXs0/eSe4LLPMrAXArnkxk5K7CK71fyb4D9X3
         e1ig==
X-Forwarded-Encrypted: i=1; AJvYcCXbhLXgeMrG/YdftLbfcwEvKN9e0gqKCYt8aqUzGl+zHOf+N3uZBNUniUTEUo8/rpNPOOmg+99LWKgnpz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX/Z6ZjFytlGaG2y+pcFo8yO78P/+wPsYKs1AFEPsv8xrWV6Y/
	i7NwLztygniBvLJerE4Lxii7tb/jT6Qv0k9f0uCaydgLVNgsNHGhO21BZaoNtKcGimoD9ShuPgd
	/mQkKjJQeLAPYgde5ZqeONXDcDvdRp/j33FoxCG+q1g==
X-Gm-Gg: ASbGncvA4mRCkzewbvEvCxb+4/SrNy4ZynbUjoCHsKbpQ878mTCazBMiD9xu6ZhaJTY
	k5i1niJE6YjZVRud6XpcJL+M+W8/EeEVhYDuWHsZf0k7o1ShZNJt3N6YOIR7Hjdv1brBngwTipq
	7T4Nw40pQmOl158xxT8gRTfrUGdG5gCekw
X-Google-Smtp-Source: AGHT+IH4+xeTkbUpI+FfhiXOCleYefqPHgZgtwzGFOjpb6L8oa9N/SBOOg/sSGsfoxJzPOXu5RhVUjIwT65OkFKLppA=
X-Received: by 2002:a05:6902:2191:b0:e7d:d181:3261 with SMTP id
 3f1490d57ef6-e81289e7aefmr15612598276.12.1748946535281; Tue, 03 Jun 2025
 03:28:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
 <20250523134025.75130-3-ulf.hansson@linaro.org> <CAGETcx-hsKb_BDPLuSM3A_ac0x6Z4NOq2pCmjKKJHTYbYZPwcA@mail.gmail.com>
In-Reply-To: <CAGETcx-hsKb_BDPLuSM3A_ac0x6Z4NOq2pCmjKKJHTYbYZPwcA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Jun 2025 12:28:19 +0200
X-Gm-Features: AX0GCFuqqwX6GW-cR_X_S04Eq-qwU4Rrpef6Z_VwxA6qf8jMfcuSHvvLut1eSeo
Message-ID: <CAPDyKFokW-wDUL6tTQ9WoVS4OJqtfMvxWiiZp6Hhf2hQpP1rWQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/21] pmdomain: core: Add a bus and a driver for genpd providers
To: Saravana Kannan <saravanak@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Jun 2025 at 02:23, Saravana Kannan <saravanak@google.com> wrote:
>
> On Fri, May 23, 2025 at 6:40=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.o=
rg> wrote:
> >
> > When we create a genpd via pm_genpd_init() we are initializing a
> > corresponding struct device for it, but we don't add the device to any
> > bus_type. It has not really been needed as the device is used as cookie=
 to
> > help us manage OPP tables.
> >
> > However, to prepare to make better use of the device let's add a new ge=
npd
> > provider bus_type and a corresponding genpd provider driver. Subsequent
> > changes will make use of this.
> >
> > Suggested-by: Saravana Kannan <saravanak@google.com>
> > Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >  drivers/pmdomain/core.c | 89 ++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 88 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 9a66b728fbbf..da515350c65b 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -27,6 +27,11 @@
> >  /* Provides a unique ID for each genpd device */
> >  static DEFINE_IDA(genpd_ida);
> >
> > +/* The parent for genpd_provider devices. */
> > +static struct device genpd_provider_bus =3D {
> > +       .init_name =3D "genpd_provider",
> > +};
> > +
> >  #define GENPD_RETRY_MAX_MS     250             /* Approximate */
> >
> >  #define GENPD_DEV_CALLBACK(genpd, type, callback, dev)         \
> > @@ -44,6 +49,14 @@ static DEFINE_IDA(genpd_ida);
> >  static LIST_HEAD(gpd_list);
> >  static DEFINE_MUTEX(gpd_list_lock);
> >
> > +#define to_genpd_provider_drv(d) container_of(d, struct genpd_provider=
_drv, drv)
> > +
> > +struct genpd_provider_drv {
> > +       struct device_driver drv;
> > +       int (*probe)(struct device *dev);
> > +       void (*remove)(struct device *dev);
> > +};
> > +
> >  struct genpd_lock_ops {
> >         void (*lock)(struct generic_pm_domain *genpd);
> >         void (*lock_nested)(struct generic_pm_domain *genpd, int depth)=
;
> > @@ -2225,6 +2238,26 @@ static int genpd_set_default_power_state(struct =
generic_pm_domain *genpd)
> >         return 0;
> >  }
> >
> > +static int genpd_provider_bus_probe(struct device *dev)
> > +{
> > +       struct genpd_provider_drv *drv =3D to_genpd_provider_drv(dev->d=
river);
> > +
> > +       return drv->probe(dev);
> > +}
> > +
> > +static void genpd_provider_bus_remove(struct device *dev)
> > +{
> > +       struct genpd_provider_drv *drv =3D to_genpd_provider_drv(dev->d=
river);
> > +
> > +       drv->remove(dev);
> > +}
>
> Not sure if I'm missing some corner case you found out, but you don't
> need these stubs just to call the drv ops. Driver core does it anyway
> if the bus probe/remove functions are missing.

Right, they are probably just leftovers used for debug-prints during
development.

Thanks for spotting this!

>
> > +
> > +static const struct bus_type genpd_provider_bus_type =3D {
> > +       .name           =3D "genpd_provider",
> > +       .probe          =3D genpd_provider_bus_probe,
> > +       .remove         =3D genpd_provider_bus_remove,
> > +};
> > +
> >  static void genpd_provider_release(struct device *dev)
> >  {
> >         /* nothing to be done here */
> > @@ -2262,6 +2295,8 @@ static int genpd_alloc_data(struct generic_pm_dom=
ain *genpd)
> >         genpd->gd =3D gd;
> >         device_initialize(&genpd->dev);
> >         genpd->dev.release =3D genpd_provider_release;
> > +       genpd->dev.bus =3D &genpd_provider_bus_type;
> > +       genpd->dev.parent =3D &genpd_provider_bus;
> >
> >         if (!genpd_is_dev_name_fw(genpd)) {
> >                 dev_set_name(&genpd->dev, "%s", genpd->name);
> > @@ -3355,9 +3390,61 @@ int of_genpd_parse_idle_states(struct device_nod=
e *dn,
> >  }
> >  EXPORT_SYMBOL_GPL(of_genpd_parse_idle_states);
> >
> > +static int genpd_provider_probe(struct device *dev)
> > +{
> > +       return 0;
> > +}
> > +
> > +static void genpd_provider_remove(struct device *dev)
> > +{
> > +}
>
> Same might apply here.

Let me check and see if/what can be dropped.

I think you told me that I needed the ->probe() function to keep
fw_devlink happy, but maybe I got that wrong.

[...]

Kind regards
Uffe
