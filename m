Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D01726B959
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745395126; cv=none; b=k1pYZoV3ywkzmZf3KvMNP+TaC9FIEtJ5Z5zFf6pGSheaOt/sjOr4KxW6sHb5gLXYx8ufzeCFiI4gMM/hJdA0rXP4hSgNBUAbz836p9xP3RPX+2tejeqHhge0vLBnbk2GQSw9Clfo2c+aFk8R8uy0rzvBeoLqBM2y9Bj26dTaQdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745395126; c=relaxed/simple;
	bh=X+aUROIJbDq0/WVAsN/aL3+kk/RTavZCUl3H6Q6PUsI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U2+XPs5J6n3M5Szw4+IZ+Fp2gVr5IOlym5QmpmATRfxXVS3whlVWlvyxhm0/k6NedvGIWzJrlGTu6JE0OfHfzfSSvNNHktNNKSZwbl4WAswL/qaPLfBYC7i1w3AunKSNtKwtASKJ9rz8cMgPQaO2MLKfPHQVm0OzSWkRsdWLICY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rl8Ymkaf; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rl8Ymkaf"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-70427fb838cso47714797b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745395124; x=1745999924; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98OKaYF4tpZApGWukE9uaoalFuC45/rEeEJt/zz+1to=;
        b=rl8Ymkaf2QJ1lpB1Y4CEiiBHzPc7ZAu3PwB/+KD69X81DPnswVFjtZlk8QdU/93+P9
         PtPfCq49madHiOFb7BJsQSyUi4cvg2u4I+wC+ydfQZ+U7neKUPVcdNpHvlQZcRvoZTWC
         GAnkZHN6UuLAyqhcg/3iMxTkc60F4K//EwdlWyj6y9ObC+fmQkphoSuPc5xdPcRAH8E8
         wq3SFIIamFYp7h80RGwdgZ0+MuxJ/YXFBSjfmb71ahNHG4xz/VHZG33GSrPpH56BJ33i
         dKZIGDl79SP3jUDe2Fi3bNOZVpFQHRKl9ZboyBDq4kUiTWh17ZC2wJzrIxBduNGic240
         mQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745395124; x=1745999924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98OKaYF4tpZApGWukE9uaoalFuC45/rEeEJt/zz+1to=;
        b=VT9GryjI702VzVKRU57txn/AyLEk92BMc4nw2n9GIGrR3eigv1e80q1D1hSSa+qoeb
         1PTvKkFLh+Cx5kSNdhkk58mhAQDH0H4nQZi7DYRnTff3fiWyab9XWQDDDUq+/2YKYecd
         nOaHwl0EMxq6v1xJNleLWhjUvzDbDHjbH9YcIlOMGQ+4Cqb0HgUyCHWHBBuUYJnIRVZ2
         SbnREVoyWtMZ4JZrsOMoJ9VIfDq1dT+yLT7WqfbELb/4oGyOWaBv/2ee1D63WKrJ+++a
         X6W8D1QWMImZVHp8ZnkDiAvYEMDc7bNmvCIkRJCKiXbtGEwRHZTMOmWxCMnfDPb6t2cv
         LQIg==
X-Forwarded-Encrypted: i=1; AJvYcCVEp7+TITCfjbmFYcCFGrchhcY7C21uZCQBIMyXWbCExZ7GW4x4X4PisJEq36ziMHqq97SDuJmQ32XowPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUTZ2uR8joiyToIjXzEkKVlw9Y2Q614ufUEsURw/e/Cd0NNODB
	AsG7KKtgbM3qCTxym9L5Lzu7yTPwrH0efbLFGrc5RE1Fw8bUX7HET35fy1fHTK/Zu97ZJfUmk9+
	k9GzNdy5l9wb8eH5d0V/EQrQwu4l3GSahw0JXDA==
X-Gm-Gg: ASbGncuHb08UGOW+dSijwh+cR1r21Ld3eP/jdsss7vU6Z95L5JZ1s4WhPxbyL2raZ6N
	uXxKFu4aAa2Kkg1hDdYwSnupW+5C5WjMuTHJ1sxJ6lCEs0LzqWQ/qwlj9P9WqrrNGni0NWJWe0T
	z0fP/rQOoFpzY/Gvf9P6gm+Q==
X-Google-Smtp-Source: AGHT+IEid6abI3qyjvwJVFhFo6K8MH5FI0X29/TyKFu7qItzM19P/8jYPPedtCkMFzrRPgTlj3DcfgKz+l+YCjA6mJo=
X-Received: by 2002:a05:690c:d07:b0:6f7:5605:c62b with SMTP id
 00721157ae682-706ccdc6cf9mr271103927b3.27.1745395123911; Wed, 23 Apr 2025
 00:58:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
 <20250417142513.312939-9-ulf.hansson@linaro.org> <CAGETcx9rvTWPbDCnTLb+ToVk8BMipTa1Y14vpn=bPBkM=CjoZg@mail.gmail.com>
In-Reply-To: <CAGETcx9rvTWPbDCnTLb+ToVk8BMipTa1Y14vpn=bPBkM=CjoZg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 23 Apr 2025 09:58:08 +0200
X-Gm-Features: ATxdqUF5401xpyLBZD02333wpwgBQly_TMiuPAqVbNXp07uH7DpC68Wtyaxt4dM
Message-ID: <CAPDyKFoxggSnRZxQ7QBbF2-akoj8TTMGawxeH_0ZnPQ7CBCnUA@mail.gmail.com>
Subject: Re: [PATCH 08/11] pmdomain: core: Add internal ->sync_state() support
 for genpd providers
To: Saravana Kannan <saravanak@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>, 
	Peng Fan <peng.fan@oss.nxp.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Johan Hovold <johan@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Apr 2025 at 02:24, Saravana Kannan <saravanak@google.com> wrote:
>
> On Thu, Apr 17, 2025 at 7:25=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.o=
rg> wrote:
> >
> > If the genpd provider's fwnode doesn't have an associated struct device
> > with it, we can make use of the generic genpd->dev and it corresponding
> > driver internally in genpd to manage ->sync_state().
> >
> > More precisely, while adding a genpd OF provider let's check if the fwn=
ode
> > has a device and if not, make the preparation to handle ->sync_state()
> > internally through the genpd_provider_driver and the genpd_provider_bus=
.
> >
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >  drivers/pmdomain/core.c   | 36 ++++++++++++++++++++++++++++++++++++
> >  include/linux/pm_domain.h |  7 +++++++
> >  2 files changed, 43 insertions(+)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 512f89e6d302..9c5a77bf59d2 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -2374,6 +2374,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd=
,
> >         INIT_WORK(&genpd->power_off_work, genpd_power_off_work_fn);
> >         atomic_set(&genpd->sd_count, 0);
> >         genpd->status =3D is_off ? GENPD_STATE_OFF : GENPD_STATE_ON;
> > +       genpd->sync_state =3D GENPD_SYNC_STATE_OFF;
> >         genpd->device_count =3D 0;
> >         genpd->provider =3D NULL;
> >         genpd->device_id =3D -ENXIO;
> > @@ -2656,6 +2657,7 @@ int of_genpd_add_provider_simple(struct device_no=
de *np,
> >                                  struct generic_pm_domain *genpd)
> >  {
> >         struct fwnode_handle *fwnode;
> > +       struct device *dev;
> >         int ret;
> >
> >         if (!np || !genpd)
> > @@ -2665,6 +2667,10 @@ int of_genpd_add_provider_simple(struct device_n=
ode *np,
> >                 return -EINVAL;
> >
> >         fwnode =3D &np->fwnode;
> > +       dev =3D fwnode->dev;
> > +
> > +       if (!dev)
> > +               genpd->sync_state =3D GENPD_SYNC_STATE_SIMPLE;
>
> I don't want people directly poking into fwnode.

There are already other subsystems doing it like this. Like
drivers/gpio/gpiolib.c for example. I didn't think it was a big deal,
my bad!

>
> Use get_device_from_fwnode() that's in drivers/base/core.c? Might need
> to move it to a header. Make sure to put_device() it back.

Sure, I can certainly do that!

>
> Or ideally, figure it out using some other means like looking for
> #power-domain-cells number? (if that'll always give the right answer).
> Point being, the framework should know which type it's registering
> even if there was no fwnode/fw_devlink.

When adding the genpd-of-provider we are only passing a device node.
Looking for "#power-domain-cells" can't tell us whether the node will
have a device or not.

>
> >
> >         device_set_node(&genpd->dev, fwnode);
> >
> > @@ -2718,8 +2724,10 @@ int of_genpd_add_provider_onecell(struct device_=
node *np,
> >  {
> >         struct generic_pm_domain *genpd;
> >         struct fwnode_handle *fwnode;
> > +       struct device *dev;
> >         unsigned int i;
> >         int ret =3D -EINVAL;
> > +       bool sync_state =3D false;
> >
> >         if (!np || !data)
> >                 return -EINVAL;
> > @@ -2728,6 +2736,10 @@ int of_genpd_add_provider_onecell(struct device_=
node *np,
> >                 data->xlate =3D genpd_xlate_onecell;
> >
> >         fwnode =3D &np->fwnode;
> > +       dev =3D fwnode->dev;
>
> Can you do this some other way please? I really don't like this look up.

Okay, I will use get_device_from_fwnode().

Thanks again for reviewing!

[...]

Kind regards
Uffe
