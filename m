Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D3C283FC7
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665252; cv=none; b=Afqw7piScLhGEsr6Ecy6Qk8XyvO2YDm7SKv5TCfD5O7FNeqnSukrL+aZOyisrf6djvxOp5BhQdgizru15piybaaK3Fx8WFtrZrbsgHBLO9eANLy/ElHCwnkF4XG17+4C0I3XJkf5b+TIVKMbt5bHvedrDlxNEaH7JaNjt+YbLo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665252; c=relaxed/simple;
	bh=ZaaIqKZbolp3tyZ4jlymGGO1E13TofaCBydtTF3D+SA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mdl4xRCNhWHYIBZbuXJwykExzZyifH0fKShp1gUM2+U4GZ/RBIsLGcQJP5bfX//CJEkzoNbgC31nX4o3p0MntsllxejwKgTgPqniYYCvf+ez2BBqZO7NBdNm543HykP4Ti4UPX4RO+yIsIHoUf4OvPHPvzgm9rnO0HlP49199lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lEcRPWmi; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lEcRPWmi"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e740a09eae0so3843181276.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747665249; x=1748270049; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tWQGQfS8CLVYL4QI2AOhtxcKvBGn1H3Acg4MC1GRK8o=;
        b=lEcRPWmifkInppT1N9UrnJseARWTG7sLTJgKffVtFApWU+IP1Udw+W5UE++U77Z/a2
         1WnbyrvPGt69MW1tU4Y05Xo5bMQ4vMDBzZxcoUYkiQ23iqtfKB20HYX7+doMvVnovB0+
         Ex66R33/CVyAzLBJffwCuDsUJjCisX3VpwDK9KGTP9KXzxX/58XpWqM7xx/KW6EpIetM
         BqrNbBd5WeV4z9JYTTdkmD1/LyvYZpjuj7L4KkesRhNPrGKw/KWA58WSDeOawFu7Bnyp
         5Mu81USbrTia4D169LHqGFSaX8Qrq+huQVFPm65UTCmaBMe2ozBlK53KTgbe2OyrLuPM
         aZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747665249; x=1748270049;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tWQGQfS8CLVYL4QI2AOhtxcKvBGn1H3Acg4MC1GRK8o=;
        b=TSqyr1ajxbwyRAfV5iINVWaACGiZaANl+lZ2IMs90eckPrjsgxt0Rx7SKhyH6STJPT
         HZNGlGUe3ekTRExi9yHVeFaM5xtJ4/JXl9uSlzajBpx7Y3+3P4PX4f7EBKo2kLQJXUUN
         plv7QZIZmp0q49A4ZzLBxe3XhhBlRq23tauv+xDCD70SISAd8BRyWE/mFGB3n0PbIYFM
         p9pkjUIGaCb5g+Q9cVqQ5t+bHYLOrjelnrxU1EFC0Lnt8qKTsZgp3B/zhrJUtl1cphHb
         Uk0WQ9GCkVSA4y0K2LIWNUVWQkXxYY/qd4lLkb8EG4Y7gSkK6EPMVbqIT5SKFOrTjZjl
         NRRA==
X-Forwarded-Encrypted: i=1; AJvYcCUi3ZIJ4YsnzbSRaBiRc/mCvJBRXRr3BSgwU3E5stqkqJOpxcg78ESetPLhOwhVGzmoivQt2QZ9/shJQWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC3fK7dvzmxS81+owJyBxJhNhgUnP2a97cXRg+qyCEcIQUSoZo
	P3fEzjbQA3Lw52T2E0A5zvfrtwOWEgfX1bu7P7xIz/MFV2/ChEOs8/0R01kpYViFxus3jE3jIbi
	ngea6W2nNpNR62n7FghDPd1iS+NGAlW/LsDwV+uhitg==
X-Gm-Gg: ASbGncs34MnzDr8cSNgv3IK/SdtWCcPwSFiQyIVJvo4XJgiArKeMAnJmA+kmDQgqh3a
	cPmK1wAnusDPTL26Jf19640/etVMerYwVTMIn3YaO/O1yogYAWrms5Opy+SOR3qxia0wnJQVPvw
	W4uBFG/3z1bopXgmRbre1WSjq+XrSsDsPtzw==
X-Google-Smtp-Source: AGHT+IFWUCxEZiHhmGzWmhcQHoV2f4N5kkNUGaz9Fah8Ux1VEsnpDKqNMNg1yrNsBceCDvpkLeFncOO16VyD8I7q6m8=
X-Received: by 2002:a05:6902:2082:b0:e7d:44ee:9c7a with SMTP id
 3f1490d57ef6-e7d44ee9e76mr1602221276.40.1747665249108; Mon, 19 May 2025
 07:34:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507160056.11876-1-hiagofranco@gmail.com> <20250507160056.11876-4-hiagofranco@gmail.com>
 <CAPDyKFrHD1hVCfOK-JV5FJM+Cd9DoKKZGKcC94fxx6_9Bsri1g@mail.gmail.com>
 <20250508202826.33bke6atcvqdkfa4@hiago-nb> <CAPDyKFr3yF=yYZ=Xo5FicvSbDPOTx7+fMwc8dMCLYKPBMEtCKA@mail.gmail.com>
 <20250509191308.6i3ydftzork3sv5c@hiago-nb>
In-Reply-To: <20250509191308.6i3ydftzork3sv5c@hiago-nb>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 May 2025 16:33:30 +0200
X-Gm-Features: AX0GCFsG_40iOKNCPwkbiqnn-4ukoqDDfiyLZnVk1h-WIiTDA33EI1CKHx8gLMM
Message-ID: <CAPDyKFpnLzk5YR3piksGhdB8ZoGNCzmweBTxm_rDX5=vjLFxqQ@mail.gmail.com>
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

On Fri, 9 May 2025 at 21:13, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> On Fri, May 09, 2025 at 12:37:02PM +0200, Ulf Hansson wrote:
> > On Thu, 8 May 2025 at 22:28, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > >
> > > Hello,
> > >
> > > On Thu, May 08, 2025 at 12:03:33PM +0200, Ulf Hansson wrote:
> > > > On Wed, 7 May 2025 at 18:02, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > > > >
> > > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > > >
> > > > > When the remote core is started before Linux boots (e.g., by the
> > > > > bootloader), the driver currently is not able to attach because it only
> > > > > checks for cores running in different partitions. If the core was kicked
> > > > > by the bootloader, it is in the same partition as Linux and it is
> > > > > already up and running.
> > > > >
> > > > > This adds power mode verification through the SCU interface, enabling
> > > > > the driver to detect when the remote core is already running and
> > > > > properly attach to it.
> > > > >
> > > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > > > Suggested-by: Peng Fan <peng.fan@nxp.com>
> > > > > ---
> > > > > v2: Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > > > > suggested.
> > > > > ---
> > > > >  drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
> > > > >  1 file changed, 13 insertions(+)
> > > > >
> > > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > > > index 627e57a88db2..9b6e9e41b7fc 100644
> > > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > > @@ -949,6 +949,19 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
> > > > >                         if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
> > > > >                                 return -EINVAL;
> > > > >
> > > > > +                       /*
> > > > > +                        * If remote core is already running (e.g. kicked by
> > > > > +                        * the bootloader), attach to it.
> > > > > +                        */
> > > > > +                       ret = imx_sc_pm_get_resource_power_mode(priv->ipc_handle,
> > > > > +                                                               priv->rsrc_id);
> > > > > +                       if (ret < 0)
> > > > > +                               dev_err(dev, "failed to get power resource %d mode, ret %d\n",
> > > > > +                                       priv->rsrc_id, ret);
> > > > > +
> > > > > +                       if (ret == IMX_SC_PM_PW_MODE_ON)
> > > > > +                               priv->rproc->state = RPROC_DETACHED;
> > > > > +
> > > > >                         return imx_rproc_attach_pd(priv);
> > > >
> > > > Why is it important to potentially set "priv->rproc->state =
> > > > RPROC_DETACHED" before calling imx_rproc_attach_pd()?
> > > >
> > > > Would it be possible to do it the other way around? First calling
> > > > imx_rproc_attach_pd() then get the power-mode to know if
> > > > RPROC_DETACHED should be set or not?
> > > >
> > > > The main reason why I ask, is because of how we handle the single PM
> > > > domain case. In that case, the PM domain has already been attached
> > > > (and powered-on) before we reach this point.
> > >
> > > I am not sure if I understood correcly, let me know if I missed
> > > something. From my understanding in this case it does not matter, since
> > > the RPROC_DETACHED will only be a flag to trigger the attach callback
> > > from rproc_validate(), when rproc_add() is called inside
> > > remoteproc_core.c.
> >
> > Okay, I see.
> >
> > To me, it sounds like we should introduce a new genpd helper function
> > instead. Something along the lines of this (drivers/pmdomain/core.c)
> >
> > bool dev_pm_genpd_is_on(struct device *dev)
> > {
> >         struct generic_pm_domain *genpd;
> >         bool is_on;
> >
> >         genpd = dev_to_genpd_safe(dev);
> >         if (!genpd)
> >                 return false;
> >
> >         genpd_lock(genpd);
> >         is_on = genpd_status_on(genpd);
> >         genpd_unlock(genpd);
> >
> >         return is_on;
> > }
> >
> > After imx_rproc_attach_pd() has run, we have the devices that
> > correspond to the genpd(s). Those can then be passed as in-parameters
> > to the above function to get the power-state of their PM domains
> > (genpds). Based on that, we can decide if priv->rproc->state should be
> > to RPROC_DETACHED or not. Right?
>
> Got your idea, I think it should work yes, I am not so sure how. From
> what I can see these power domains are managed by
> drivers/pmdomain/imx/scu-pd.c and by enabling the debug messages I can
> see the power mode is correct when the remote core is powered on:
>
> [    0.317369] imx-scu-pd system-controller:power-controller: cm40-pid0 : IMX_SC_PM_PW_MODE_ON
>
> and powered off:
>
> [    0.314953] imx-scu-pd system-controller:power-controller: cm40-pid0 : IMX_SC_PM_PW_MODE_OFF
>
> But I cannot see how to integrate this into the dev_pm_genpd_is_on() you
> proposed. For a quick check, I added this function and it always return
> NULL at dev_to_genpd_safe(). Can you help me to understand this part?

As your device has multiple PM domains and those gets attached with
dev_pm_domain_attach_list(), the device(s) that you should use with
dev_pm_genpd_is_on() are in imx_rproc->pd_list->pd_devs[n].

>
> >
> > In this way we don't need to export unnecessary firmware functions
> > from firmware/imx/misc.c, as patch1/3 does.
> >
> > If you think it can work, I can help to cook a formal patch for the
> > above helper that you can fold into your series. Let me know.
> >
> > >
> > > With that we can correcly attach to the remote core running, which was
> > > not possible before, where the function returns at "return
> > > imx_rproc_attach_pd(priv);" with the RPROC_OFFLINE state to
> > > rproc_validate().
> >
> > I see, thanks for clarifying!
> >
> > Kind regards
> > Uffe
>
> Thank you!
> Hiago.

Kind regards
Uffe
