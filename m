Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F9F12B63
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747743748; cv=none; b=q8EwZINSz6e73+nOqICigpAcBe2a74q9Wph29S7zZ+cci6xZxkwh5w6o2RWecjFX725GRR0DdHtHjxnvw9qZvuErFGvJdQYUIvJc4thkaE9Q0YbWK0OnJ6qGtNwgUPOFcBkhFdR0RxxPRjPgjRHRJDQWIZq08gdahqe/OR9NwvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747743748; c=relaxed/simple;
	bh=QouWssyxn4NBMq4oguRadbPcsKGXlZJW7CbUFKqwr9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rlDll+Jzzv3fc7Xod8kn0k5PcQcI4sLHGWO9STHoIyn0a8a02pUGtFkvR/Y/3bgqbNYfTzzgHV4yrs1n7iCmPwvSgIzPAiOnfGIdpN7bNQA/pDa8IwqsCBS381dVQSM9uaJjCPy6oZpoTd958y2u7BoHX/fkL9QRe0q6EciUZ94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UaFaWBJ8; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UaFaWBJ8"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-70dd29b0d34so14659297b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 05:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747743746; x=1748348546; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MEOAQ4+huP5P2UxwDkmIJwHky2Zn8+jD9WJaoKTnTcI=;
        b=UaFaWBJ8y+eJQxKeIswymC92n2WfUGPupp/aGhvEMcMQh/JOphG/zZkiZrs5A4O4zz
         4/1Pt/9phf7nyGPbun3U2rWOKtr2ioOJ1U7cer3Eyd9WiOz1UDHsPEgqA6gqAySgHrUW
         3jHTHXpSNEbgd1fhlpx78M3HIfVOMFIpRHqMe2OiIq7QqYfF+Eyhg2BwgkHNf0H69zXJ
         nTIh+m1Hid5NxG7mb8Q3lxAkxSaGE9WZkYyz054kkPl9wNMZ0SiotmQ2uBAblMCjD6eY
         f3MThIbTWluydT/U03DcmuRXz87UpWgpnpiMip1iZQfDwRY69xdvPolnB6Dwd6w9EgDa
         H1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747743746; x=1748348546;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MEOAQ4+huP5P2UxwDkmIJwHky2Zn8+jD9WJaoKTnTcI=;
        b=uMHdYkd0oPt7RBG//Wqzz9zHrGLc+adFvEav11gJzQi52pAasWbrgkIC6ZmZZoTmKj
         ulVQfwlK9Vj+b5fLx6gdda9KZtN8/FoV21j+lBmO72nxs8nEkw0mQ/0cRuxoi9N8ac20
         c9poVW/ENmXwqmIj0/8st3RwjRL0T1p3OonDyhc/UolUw4BNXVcjJPMNxP2O+5V+sZma
         LUwv3YM4dnDuJe3NJN3ILX7LSJM3J0pXfe+RiIxejtkNuCV8sOooYP/R6q6ssJD11YBp
         Jua3hq8ABJtBrwOFQU0MRaTAEkNIgYji4RNxkG9koU0rH109oYbRDWhuayS8BuuQPM0i
         Tu8g==
X-Forwarded-Encrypted: i=1; AJvYcCVJaHiU802Dx+nSroRve3CE0Kbnatoho8mLqdfWXSuASou4DeSCInEWmSBhS7yPoW3I5FjoZDD5jM7YqUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS2rG1Xv9KC1kR73CA/0Cdd0hSiMjJm2VfHcKRud+DpxoOIpK3
	U6sgt9n3IbacAwqfh0rNXX7c1c4i+DbCZ3nlOTHa8O/rT2nJ6hBrvViZqI8hcbDIFRjY0JicE6g
	KrqVrfBaNdYuZkkKu+bHGTzX/Lz7BEH049yQMKrSIOg==
X-Gm-Gg: ASbGncvWXvCPl/CXLM0Vk3ftkI4HlYoLTmSWwXXNKIVplQJZTglUqf3ZmYq7corC7Th
	Vy0m/vNCe7bkwXumMxwsiZ4ww50IuKaSBb+UW79Nq7QIabQLj4GykQNMjrSp4fjhNcnefDh8+XY
	bEWJsQZ916HV6o+MMI1gLrtg4fvjaNTd4DaQ==
X-Google-Smtp-Source: AGHT+IEoqQjb+R4v4FqIJ9NsaAJz8P+torT+l2h/KrsSDMTfNo1fSuoB13kxgbLiWRiK4DxnCXAbwKmJB14az3T0qSA=
X-Received: by 2002:a05:690c:ed1:b0:70d:d1a6:fcfc with SMTP id
 00721157ae682-70dd1a6ffb1mr74617027b3.13.1747743745677; Tue, 20 May 2025
 05:22:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507160056.11876-1-hiagofranco@gmail.com> <20250507160056.11876-4-hiagofranco@gmail.com>
 <CAPDyKFrHD1hVCfOK-JV5FJM+Cd9DoKKZGKcC94fxx6_9Bsri1g@mail.gmail.com>
 <20250508202826.33bke6atcvqdkfa4@hiago-nb> <CAPDyKFr3yF=yYZ=Xo5FicvSbDPOTx7+fMwc8dMCLYKPBMEtCKA@mail.gmail.com>
 <20250509191308.6i3ydftzork3sv5c@hiago-nb> <CAPDyKFpnLzk5YR3piksGhdB8ZoGNCzmweBTxm_rDX5=vjLFxqQ@mail.gmail.com>
 <20250519172357.vfnwehrbkk24vkge@hiago-nb>
In-Reply-To: <20250519172357.vfnwehrbkk24vkge@hiago-nb>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 20 May 2025 14:21:49 +0200
X-Gm-Features: AX0GCFvecIGQgQvYviOe7hMAhu1Tk0oNxkZ2kd0dxrSn8Ur7tJ7dhdnhpp02IIc
Message-ID: <CAPDyKFpGcgMzOUHf-JTRTLBviFdLdbjZKrMm8yd37ZqJ1nfkHw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_rproc: add power mode check for
 remote core attachment
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-pm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 May 2025 at 19:24, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> Hi Ulf,
>
> On Mon, May 19, 2025 at 04:33:30PM +0200, Ulf Hansson wrote:
> > On Fri, 9 May 2025 at 21:13, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > >
> > > On Fri, May 09, 2025 at 12:37:02PM +0200, Ulf Hansson wrote:
> > > > On Thu, 8 May 2025 at 22:28, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > > > >
> > > > > Hello,
> > > > >
> > > > > On Thu, May 08, 2025 at 12:03:33PM +0200, Ulf Hansson wrote:
> > > > > > On Wed, 7 May 2025 at 18:02, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > > > > > >
> > > > > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > > > > >
> > > > > > > When the remote core is started before Linux boots (e.g., by the
> > > > > > > bootloader), the driver currently is not able to attach because it only
> > > > > > > checks for cores running in different partitions. If the core was kicked
> > > > > > > by the bootloader, it is in the same partition as Linux and it is
> > > > > > > already up and running.
> > > > > > >
> > > > > > > This adds power mode verification through the SCU interface, enabling
> > > > > > > the driver to detect when the remote core is already running and
> > > > > > > properly attach to it.
> > > > > > >
> > > > > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > > > > > Suggested-by: Peng Fan <peng.fan@nxp.com>
> > > > > > > ---
> > > > > > > v2: Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > > > > > > suggested.
> > > > > > > ---
> > > > > > >  drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
> > > > > > >  1 file changed, 13 insertions(+)
> > > > > > >
> > > > > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > > > > > index 627e57a88db2..9b6e9e41b7fc 100644
> > > > > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > > > > @@ -949,6 +949,19 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
> > > > > > >                         if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
> > > > > > >                                 return -EINVAL;
> > > > > > >
> > > > > > > +                       /*
> > > > > > > +                        * If remote core is already running (e.g. kicked by
> > > > > > > +                        * the bootloader), attach to it.
> > > > > > > +                        */
> > > > > > > +                       ret = imx_sc_pm_get_resource_power_mode(priv->ipc_handle,
> > > > > > > +                                                               priv->rsrc_id);
> > > > > > > +                       if (ret < 0)
> > > > > > > +                               dev_err(dev, "failed to get power resource %d mode, ret %d\n",
> > > > > > > +                                       priv->rsrc_id, ret);
> > > > > > > +
> > > > > > > +                       if (ret == IMX_SC_PM_PW_MODE_ON)
> > > > > > > +                               priv->rproc->state = RPROC_DETACHED;
> > > > > > > +
> > > > > > >                         return imx_rproc_attach_pd(priv);
> > > > > >
> > > > > > Why is it important to potentially set "priv->rproc->state =
> > > > > > RPROC_DETACHED" before calling imx_rproc_attach_pd()?
> > > > > >
> > > > > > Would it be possible to do it the other way around? First calling
> > > > > > imx_rproc_attach_pd() then get the power-mode to know if
> > > > > > RPROC_DETACHED should be set or not?
> > > > > >
> > > > > > The main reason why I ask, is because of how we handle the single PM
> > > > > > domain case. In that case, the PM domain has already been attached
> > > > > > (and powered-on) before we reach this point.
> > > > >
> > > > > I am not sure if I understood correcly, let me know if I missed
> > > > > something. From my understanding in this case it does not matter, since
> > > > > the RPROC_DETACHED will only be a flag to trigger the attach callback
> > > > > from rproc_validate(), when rproc_add() is called inside
> > > > > remoteproc_core.c.
> > > >
> > > > Okay, I see.
> > > >
> > > > To me, it sounds like we should introduce a new genpd helper function
> > > > instead. Something along the lines of this (drivers/pmdomain/core.c)
> > > >
> > > > bool dev_pm_genpd_is_on(struct device *dev)
> > > > {
> > > >         struct generic_pm_domain *genpd;
> > > >         bool is_on;
> > > >
> > > >         genpd = dev_to_genpd_safe(dev);
> > > >         if (!genpd)
> > > >                 return false;
> > > >
> > > >         genpd_lock(genpd);
> > > >         is_on = genpd_status_on(genpd);
> > > >         genpd_unlock(genpd);
> > > >
> > > >         return is_on;
> > > > }
> > > >
> > > > After imx_rproc_attach_pd() has run, we have the devices that
> > > > correspond to the genpd(s). Those can then be passed as in-parameters
> > > > to the above function to get the power-state of their PM domains
> > > > (genpds). Based on that, we can decide if priv->rproc->state should be
> > > > to RPROC_DETACHED or not. Right?
> > >
> > > Got your idea, I think it should work yes, I am not so sure how. From
> > > what I can see these power domains are managed by
> > > drivers/pmdomain/imx/scu-pd.c and by enabling the debug messages I can
> > > see the power mode is correct when the remote core is powered on:
> > >
> > > [    0.317369] imx-scu-pd system-controller:power-controller: cm40-pid0 : IMX_SC_PM_PW_MODE_ON
> > >
> > > and powered off:
> > >
> > > [    0.314953] imx-scu-pd system-controller:power-controller: cm40-pid0 : IMX_SC_PM_PW_MODE_OFF
> > >
> > > But I cannot see how to integrate this into the dev_pm_genpd_is_on() you
> > > proposed. For a quick check, I added this function and it always return
> > > NULL at dev_to_genpd_safe(). Can you help me to understand this part?
> >
> > As your device has multiple PM domains and those gets attached with
> > dev_pm_domain_attach_list(), the device(s) that you should use with
> > dev_pm_genpd_is_on() are in imx_rproc->pd_list->pd_devs[n].
>
> Ok got it, thanks for sharing.
>
> I just send the v3 with the changes Peng proposed (here
> https://lore.kernel.org/lkml/20250519171514.61974-1-hiagofranco@gmail.com/T/#t),
> but I am a bit confused which path we should take, the initial approach
> proposed or using these PD functions. Maybe we can discuss this in the
> new v3 patch series?

I think it would be better if we can avoid sharing low-level firmware
functions for PM domains. I am worried that they may become abused for
other future use-cases.

So, if possible, I would rather make us try to use
dev_pm_genpd_is_on() (or something along those lines), but let's see
what Peng thinks about it before we make the decision.

[...]

Kind regards
Uffe
