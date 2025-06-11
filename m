Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570BD246BCD
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 21:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749677946; cv=none; b=AN6O8bGqEO9v6Z9pug50BERb70FUkpn07kBvmd4j64xbQfMXdfGgM/Mq980/+TgBjf9lFlvDnvpPHAo6Aqg46m0LPuhXdy+yOQaajg1MgjdqHpox+yPFNqoQjotf7d/jVj/wMA7dwpnzMOGOzqJ/8U4uDbd5eBFa0mJywHyDeog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749677946; c=relaxed/simple;
	bh=7wfgut9r0z2URNp/r0dotLN2fdcorVv7r5QCCeI6kmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZNwOAPpaL66CCEs8Py9Y+RPGnCkdy0xTiVzqtSFGEhQ4Mijs1j04OnPAliSpgrtoxSa1jmNLl/y14hnQJvJzdmItZIDEr0x0l3xWWivzkd/T17eEQQ3j4Xcjbq6ucXiwrKO0f9iMwn4SuCKOn9+p0RfdNEHNOX4NzJnUIxcFWyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Vz8MtQgR; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vz8MtQgR"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-747d59045a0so313333b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749677938; x=1750282738; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWt7b+ImqtoWAiZlh6Cce7mreaqBJVy9uH7u+QDcU9Q=;
        b=Vz8MtQgRCLkaPak/86IaDkq/EqwCESy4KlX5wE+gbdQ8K2daOADeci07nUSmAOQgVA
         C6DISf0e5PdoEtKh1DeMrGG2EMc+qrWJV4xDpqfMwl8RgvLP+lt6+fazcKenYkimYcge
         ITN5jH3WetMOWk8RqH3SiGMr4QyrhhmmicZU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749677938; x=1750282738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWt7b+ImqtoWAiZlh6Cce7mreaqBJVy9uH7u+QDcU9Q=;
        b=WxYGfnONIfZvNmZdrGpQhwNiojzVQeyoGKUE4IjMIKtfPFGHLEDeuHmi/2alT2hxZU
         ygpR9HrSlbSwvYIb4ddEMmGPmEShq6p2XFiOMwvA/2Q1E52aCyhYzHMUtAv3fKpPxzzL
         FWEVvtFuworT6UjafkBur2D4Zqauc8nCZ6LT3DKKZxbXXD8BBTOPjm8ihCSkP404RzHa
         y13/KYyjTDwTUpuOuNgUNWf7wz9nv3VLr7g155eX+xAqNeUiHpYF7xDgZAtxE2Hv0YMK
         lefFYFpkdKTB3i9nolyUK540GER9OSpOp0yYTOQAE6A+XQnN4wFNUBbzDqi3wr9mDgdG
         APnA==
X-Forwarded-Encrypted: i=1; AJvYcCUqwz8GYREW2h1iF3Z3qao0G51YmeC7Gv10KvyKt0L28MD6FK1cu1X8NKj0+FxeLSY4eRHrYn7HJUlOcYE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6OXetOp/NMxDRS6ns0qcV0QiK5cJUd/mYyDgCE+n3zOor9Fcd
	5JYUSaMFLspX96q0VJ67GjWjsNPqZtxJcLO3R9EcLCcuL2EkS0E7+UvrpBNbWGCdAtTGFBtd0V4
	Tid0=
X-Gm-Gg: ASbGncthXLRjh8FCUM18YyqY+HJgalE1UqFKkhPLly3TJLy2GDHczqP965v2s2kiRYu
	Jgh+CsbdbLrpqmdf8yWK2ugn6B1LiMCDqABlgX2Bxip1glza4ZN7HErtoAMdp0snGQqSHOZLqkd
	fKNXr4uOll+8f7GtWGs5DfUky33mmi/RlrFllANm6zSL8tItk0/Uw0JLjRsIQr2ca9aN4il0kRg
	JJmQtCJ5sCzGC7L/gQgE4rnOVcZ0DlWfhc6PaaKWcyt+domCh02WHFOXmoP8fCa5IOjbyQOzAJ9
	nE9uYqa0kd3bkefF6CExNJiRb/zxQEOvlG3ECi3eoOy6JB2fDF/BSNkkpnpNGOC4c2tod/7ooBb
	Oa5gkRHCdC0deVCENo4oLpXySL+doGA==
X-Google-Smtp-Source: AGHT+IErcmU9Uw9BkpNNOX2JyJtmHzLyo2BwaVfhUpXyyRA6fjvgqEfNzSp/cZwrJPGiI4PlyqnDRw==
X-Received: by 2002:a05:6a20:549c:b0:20d:df67:4921 with SMTP id adf61e73a8af0-21f97752d7bmr2039348637.4.1749677938492;
        Wed, 11 Jun 2025 14:38:58 -0700 (PDT)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com. [209.85.215.177])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fd6140120sm70468a12.29.2025.06.11.14.38.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 14:38:57 -0700 (PDT)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b2fca9dc5f8so178996a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:38:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrxNxcCllMySTxN6MlHquDFwKyZpWqz42v4LasSGDmAUaj2Pxb3zXHuW8XWz7RhJAVjAYKyney6ePMNWo=@vger.kernel.org
X-Received: by 2002:a17:90b:3d87:b0:313:2adc:b4c4 with SMTP id
 98e67ed59e1d1-313bfbdb37bmr1609467a91.24.1749677935135; Wed, 11 Jun 2025
 14:38:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611052947.5776-1-j-choudhary@ti.com>
In-Reply-To: <20250611052947.5776-1-j-choudhary@ti.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 11 Jun 2025 14:38:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WvH73d78De3PrbiG7b6OaS_BysGtxQ=mJTj4z-h0LYWA@mail.gmail.com>
X-Gm-Features: AX0GCFt8rakO8gJRiwfAIPFbP6QcoyCGjlAjSHLBCdKw389Bce6LPh81MDUm4uI
Message-ID: <CAD=FV=WvH73d78De3PrbiG7b6OaS_BysGtxQ=mJTj4z-h0LYWA@mail.gmail.com>
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

On Tue, Jun 10, 2025 at 10:29=E2=80=AFPM Jayesh Choudhary <j-choudhary@ti.c=
om> wrote:
>
> @@ -1195,9 +1203,17 @@ static enum drm_connector_status ti_sn_bridge_dete=
ct(struct drm_bridge *bridge)
>         struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
>         int val =3D 0;
>
> -       pm_runtime_get_sync(pdata->dev);
> +       /*
> +        * The chip won't report HPD right after being powered on as
> +        * HPD_DEBOUNCED_STATE reflects correct state only after the
> +        * debounce time (~100-400 ms).
> +        * So having pm_runtime_get_sync() and immediately reading
> +        * the register in detect() won't work, and adding delay()
> +        * in detect will have performace impact in display.
> +        * So remove runtime calls here.

That last sentence makes sense in a commit message, but not long term.
Someone reading the code later won't understand what "remove" means.
If you change "remove" to "omit" then it all makes sense, though. You
could also say that a pm_runtime reference will be grabbed by
ti_sn_bridge_hpd_enable().


> +        */
> +
>         regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
> -       pm_runtime_put_autosuspend(pdata->dev);
>
>         return val & HPD_DEBOUNCED_STATE ? connector_status_connected
>                                          : connector_status_disconnected;
> @@ -1220,6 +1236,20 @@ static void ti_sn65dsi86_debugfs_init(struct drm_b=
ridge *bridge, struct dentry *
>         debugfs_create_file("status", 0600, debugfs, pdata, &status_fops)=
;
>  }
>
> +static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
> +{
> +       struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> +
> +       pm_runtime_get_sync(pdata->dev);
> +}
> +
> +static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
> +{
> +       struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> +
> +       pm_runtime_put_sync(pdata->dev);
> +}
> +
>  static const struct drm_bridge_funcs ti_sn_bridge_funcs =3D {
>         .attach =3D ti_sn_bridge_attach,
>         .detach =3D ti_sn_bridge_detach,
> @@ -1234,6 +1264,8 @@ static const struct drm_bridge_funcs ti_sn_bridge_f=
uncs =3D {
>         .atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_st=
ate,
>         .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
>         .debugfs_init =3D ti_sn65dsi86_debugfs_init,
> +       .hpd_enable =3D ti_sn_bridge_hpd_enable,
> +       .hpd_disable =3D ti_sn_bridge_hpd_disable,
>  };
>
>  static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
> @@ -1322,7 +1354,8 @@ static int ti_sn_bridge_probe(struct auxiliary_devi=
ce *adev,
>                            ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CO=
NNECTOR_eDP;
>
>         if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_DisplayPort)
> -               pdata->bridge.ops =3D DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_=
DETECT;
> +               pdata->bridge.ops =3D DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_=
DETECT |
> +                                   DRM_BRIDGE_OP_HPD;

I think you also need this in the "DRM_MODE_CONNECTOR_DisplayPort" if test:

/*
 * If comms were already enabled they would have been enabled
 * with the wrong value of HPD_DISABLE. Update it now. Comms
 * could be enabled if anyone is holding a pm_runtime reference
 * (like if a GPIO is in use). Note that in most cases nobody
 * is doing AUX channel xfers before the bridge is added so
 * HPD doesn't _really_ matter then. The only exception is in
 * the eDP case where the panel wants to read the EDID before
 * the bridge is added. We always consistently have HPD disabled
 * for eDP.
 */
mutex_lock(&pdata->comms_mutex);
if (pdata->comms_enabled)
  regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG,
    HPD_DISABLE, 0);
mutex_unlock(&pdata->comms_mutex);

Does that sound right?
