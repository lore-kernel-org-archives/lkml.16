Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCCD260580
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739900; cv=none; b=preb1s7UmlnRZLEPnx19ZTxEawpdp+oILnBhSphb2phEawQ6RD4EF4OvZmYtsO3ekGTvjU6yX9l/YODsV0TOLk+nbDdZdyJgw9S7NGLldMyNm0DulIpbTeDA8Fkt9hElHHVKUwCCSXW3yAJrj+xYDWwcDNLpCu+qISbxqRMwglg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739900; c=relaxed/simple;
	bh=H9CvRZ+d3EO8wng9e7dPGuz7tmNjxnR/ZAx77aFKjSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xa3xPK8m1UcQMmR3JpxNOb7mdbjZQOe/FzxcMqSaV5oCAZauUjZDIarfcWrrI1Hwc8E/M+Np15uEyxMy6siHkac13WsSOyEFO5Bp937cIXGyW/sEyV6itS848FHo2pEYm/ba56voB7vVlMHHiJ7ZX1WkEbkRXz23VxPwkeSnaYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D7W/z6VN; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D7W/z6VN"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-747fba9f962so940094b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749739894; x=1750344694; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZF8QzGPobTCQxU3cK3KGjHnmiAyxl3Hnpr6d0zTgBdg=;
        b=D7W/z6VNcxok81E/pDlw059MML25KBqBIL5gsRUFkl+vLF98L761hlHoZIMamJC2lZ
         YJ4A1eNvYg8+Pba5N1zkXLLafZ1EuXKwmYJl3oNO4KjdAhILCt5IRf4JLp/agoHN9yPe
         Y6KLIxs7y3Ka80+fSY1OW+WXuTDFaxgLmHUhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749739894; x=1750344694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZF8QzGPobTCQxU3cK3KGjHnmiAyxl3Hnpr6d0zTgBdg=;
        b=Sh4XzxijZ1ItuR53cQrJYu1kPQl/rIO0bXDUSb9G/0t4O6B1YuQDu/Ml0wPVg6PIa4
         YRtsii4A1/5Eq0KHEPOuhwyAqnaHB7xRzkrlbVCONUJ9juiOlMHl/A+44fYfPLosi6MZ
         PriNfu5RtMd+9f2+a8VI83JbXVO16UQeR3Zou5vu5LOch6U++/gTQjAQl2ZkltNGmwRJ
         wvZ47GVQX8tAI12+nD25JPs6jOFFSNRfDqUwjZOrfaS+tIgz3vwyLdzsUTUHk1cSt0At
         QbSWZc3faKCAUqOKt3sZJtoSpshLQxExoCAA4RllLRBBAhBMo90H5R9nYt4foN4ktF8K
         UDEA==
X-Forwarded-Encrypted: i=1; AJvYcCWvOZOuEB1gDtzyMwfhzrvbPrvpU4p9NsrY7sn6BuVUxBWe2tylMEJtfcfoZDMhyU7yvs/DKXutHTQwW68=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXIXrGlHIqYK9WlofkkGUWeYmdZ08uTlTG4j4XsE9yCOK7O8vP
	CO7DVnUpJhWGqsK7MLr653EVKqDOwJ2TzfQaHSfUFlDJHgunNVpRqdizeNQPjhV5QXiewUf239G
	oMqg=
X-Gm-Gg: ASbGncuITwGlBip8aCBmMSmMlKqsYWD7F4LDLz6dojvbAggLwvw0rJWJEL+qyNZBYOH
	poyX0LmV4ZLCs6yxEY563V1ZE9PG6thFJlvmLbcu/sOwbbg0T0nE0z2hZqjgYHFEbVuUHw2viph
	Vj/aouYn1Puc7GnAWAEBJGhK9Dih1hbjOO+S3uPHjzdndHbhqreNJ+ufcUyBjcARtIwgZsHaOOL
	BEfoygxXLOOeWh74X4/B4tpGKon5m7MoBBjRCxDYo5uhonMkihVhHEUhKavweao9PDm2miReQH7
	qHz0HXkeAD86YLdqsOoEznxD9fJe99nGejO/BO4xWPu2/z+X1MPshAz+VbsxxcSDAsCpg1eTNZF
	D8ymqoaupV3P5Syt+ROzg1pqwzb4SBA==
X-Google-Smtp-Source: AGHT+IFPVc2tlKpeXLp+Y2mCYbnmo1HyliDPKEvs32mDs7+p+Gr6HsdgxgpIDOAyCIAiJAddoT/J+A==
X-Received: by 2002:a05:6a00:2e1f:b0:740:6f6:7338 with SMTP id d2e1a72fcca58-7487ce16507mr5204044b3a.3.1749739893653;
        Thu, 12 Jun 2025 07:51:33 -0700 (PDT)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com. [209.85.214.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488087e640sm1547735b3a.4.2025.06.12.07.51.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 07:51:32 -0700 (PDT)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2363e973db1so18288605ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:51:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSS5A/Tceh2ygGCl2+ZIoqFlyMJnjbxYFjOHHbuuB195JhAjB/ZJKjFK0lqg4lmkntaJlDaBH+vWNOQkc=@vger.kernel.org
X-Received: by 2002:a17:90b:3b90:b0:311:9cdf:a8a4 with SMTP id
 98e67ed59e1d1-313bfd90bb1mr4862616a91.8.1749739891134; Thu, 12 Jun 2025
 07:51:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611052947.5776-1-j-choudhary@ti.com> <CAD=FV=WvH73d78De3PrbiG7b6OaS_BysGtxQ=mJTj4z-h0LYWA@mail.gmail.com>
 <547a35f4-abc0-4808-9994-ccc70eb3c201@ti.com>
In-Reply-To: <547a35f4-abc0-4808-9994-ccc70eb3c201@ti.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Jun 2025 07:51:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XzSOqnLQCjDiJX7wrGH0UGq839a84v3QT9cj3eK+AeRA@mail.gmail.com>
X-Gm-Features: AX0GCFvUog-W0Yq8ScavOChYN1RdpooYMU-w84jaSxr5YZftWGA6ukEIfk_PLzY
Message-ID: <CAD=FV=XzSOqnLQCjDiJX7wrGH0UGq839a84v3QT9cj3eK+AeRA@mail.gmail.com>
Subject: Re: [PATCH v4] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org, 
	tomi.valkeinen@ideasonboard.com, max.krummenacher@toradex.com, 
	ernestvanhoecke@gmail.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, kieran.bingham+renesas@ideasonboard.com, 
	linux-kernel@vger.kernel.org, max.oss.09@gmail.com, devarsht@ti.com, 
	geert@linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 11, 2025 at 9:39=E2=80=AFPM Jayesh Choudhary <j-choudhary@ti.co=
m> wrote:
>
> Hello Doug,
>
> On 12/06/25 03:08, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Jun 10, 2025 at 10:29=E2=80=AFPM Jayesh Choudhary <j-choudhary@=
ti.com> wrote:
> >>
> >> @@ -1195,9 +1203,17 @@ static enum drm_connector_status ti_sn_bridge_d=
etect(struct drm_bridge *bridge)
> >>          struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge)=
;
> >>          int val =3D 0;
> >>
> >> -       pm_runtime_get_sync(pdata->dev);
> >> +       /*
> >> +        * The chip won't report HPD right after being powered on as
> >> +        * HPD_DEBOUNCED_STATE reflects correct state only after the
> >> +        * debounce time (~100-400 ms).
> >> +        * So having pm_runtime_get_sync() and immediately reading
> >> +        * the register in detect() won't work, and adding delay()
> >> +        * in detect will have performace impact in display.
> >> +        * So remove runtime calls here.
> >
> > That last sentence makes sense in a commit message, but not long term.
> > Someone reading the code later won't understand what "remove" means.
> > If you change "remove" to "omit" then it all makes sense, though. You
> > could also say that a pm_runtime reference will be grabbed by
> > ti_sn_bridge_hpd_enable().
>
> Okay. Will edit this.
>
> >
> >
> >> +        */
> >> +
> >>          regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
> >> -       pm_runtime_put_autosuspend(pdata->dev);
> >>
> >>          return val & HPD_DEBOUNCED_STATE ? connector_status_connected
> >>                                           : connector_status_disconnec=
ted;
> >> @@ -1220,6 +1236,20 @@ static void ti_sn65dsi86_debugfs_init(struct dr=
m_bridge *bridge, struct dentry *
> >>          debugfs_create_file("status", 0600, debugfs, pdata, &status_f=
ops);
> >>   }
> >>
> >> +static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
> >> +{
> >> +       struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> >> +
> >> +       pm_runtime_get_sync(pdata->dev);
> >> +}
> >> +
> >> +static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
> >> +{
> >> +       struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> >> +
> >> +       pm_runtime_put_sync(pdata->dev);
> >> +}
> >> +
> >>   static const struct drm_bridge_funcs ti_sn_bridge_funcs =3D {
> >>          .attach =3D ti_sn_bridge_attach,
> >>          .detach =3D ti_sn_bridge_detach,
> >> @@ -1234,6 +1264,8 @@ static const struct drm_bridge_funcs ti_sn_bridg=
e_funcs =3D {
> >>          .atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicat=
e_state,
> >>          .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_st=
ate,
> >>          .debugfs_init =3D ti_sn65dsi86_debugfs_init,
> >> +       .hpd_enable =3D ti_sn_bridge_hpd_enable,
> >> +       .hpd_disable =3D ti_sn_bridge_hpd_disable,
> >>   };
> >>
> >>   static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
> >> @@ -1322,7 +1354,8 @@ static int ti_sn_bridge_probe(struct auxiliary_d=
evice *adev,
> >>                             ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MOD=
E_CONNECTOR_eDP;
> >>
> >>          if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_DisplayPort)
> >> -               pdata->bridge.ops =3D DRM_BRIDGE_OP_EDID | DRM_BRIDGE_=
OP_DETECT;
> >> +               pdata->bridge.ops =3D DRM_BRIDGE_OP_EDID | DRM_BRIDGE_=
OP_DETECT |
> >> +                                   DRM_BRIDGE_OP_HPD;
> >
> > I think you also need this in the "DRM_MODE_CONNECTOR_DisplayPort" if t=
est:
> >
> > /*
> >   * If comms were already enabled they would have been enabled
> >   * with the wrong value of HPD_DISABLE. Update it now. Comms
> >   * could be enabled if anyone is holding a pm_runtime reference
> >   * (like if a GPIO is in use). Note that in most cases nobody
> >   * is doing AUX channel xfers before the bridge is added so
> >   * HPD doesn't _really_ matter then. The only exception is in
> >   * the eDP case where the panel wants to read the EDID before
> >   * the bridge is added. We always consistently have HPD disabled
> >   * for eDP.
> >   */
> > mutex_lock(&pdata->comms_mutex);
> > if (pdata->comms_enabled)
> >    regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG,
> >      HPD_DISABLE, 0);
> > mutex_unlock(&pdata->comms_mutex);
> >
> > Does that sound right?
>
>
> Here I don't think it is necessary to add this because enable_comms
> will be called again after probe either in hpd_enable() (in case
> refclk exist) or pre_enable() (in case it doesn't) with correct value.

I don't think that's necessarily true, is it? From my memory, this happens:

1. Main driver probe and we create the sub-devices, like the GPIO,
backlight, and AUX.

2. As soon as the GPIO probe happens, someone could conceivably claim
one of the GPIOs and set it as an output, which would cause a
"pm_runtime" reference to be held indefinitely.

3. After AUX probes, we create the bridge sub-device.

4. When the bridge probe runs, comms will still be enabled because the
"pm_runtime" reference keeps them on.

...there's also the issue that we use "autosuspend" and thus comms can
still be left on for a chunk of time even after there are no
"pm_runtime" references left.

-Doug
