Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056831FAC4E;
	Thu, 19 Jun 2025 12:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335410; cv=none; b=Zrvw3Nb5qiCvmXB2hx3nUBXvhLl8CRpdfSXD0WR1Wp6o5N/wglF5JlTbjSxbyTLzAfRgVc4Ed3U75J1E1KdpTu6P8/C97E+SiAKbKFjcG8LN5FUJqZKkKEA0kP9FT8vV9lmJ0Lax8RHghsp/w41IYBY88pxDl2+NNJUbp6g5U70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335410; c=relaxed/simple;
	bh=6wN7csM93NkFNN8SNrqKw6r1Mcbe0e20LWcBQS9Uvr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QmfXYqYlaggpfIJE2IWJocYJCAIYMxs+jLptqT/KVe9gDN65agoSkywC1r9WeabfU5Uywd2GKqJo2PxxdW+h8Dftponc8DML9dDr1eBG//iPY9keu0iiU3mikwVQJXDY7MQcfa/6nKRZ0i0wCPjoh5UVw6KxWvnvaFHBqP6v9u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Coc5dFHZ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Coc5dFHZ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45363645a8eso291365e9.1;
        Thu, 19 Jun 2025 05:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335406; x=1750940206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsuVMHdPyoMl29LL1KXzCdxntqN9YJP95SRtroOttNI=;
        b=Coc5dFHZ/2yrqmhReTLEX5ddoZYmZIFt7/b8NA157x488huzeySBmMpkPJRISMTXKp
         siOwb0Rga0gXBtpOAqj84V7KMXyygDRcGAEdZ3MfyMfKLUFjbnhE43wZZW/GKNJyHviu
         bENX0ntTrD/R3G1oqTD44VIco+rXgPdJEEgva8Whxd2Df96YFCkL4JCTn9eOH/QD6VtU
         ClIa5Lv7e/rRkTNks2aRrauSs8JPsrsWGJJLYlQnYwWMco/EOm4BBTZaxCYvYRM7Ro7O
         5RYu69tpLIp2RZyy9jP9rp5yciV14kQQ5WxRc+PhviGD5eXbheeiXrcjOQ5FTRdGds0l
         AXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335406; x=1750940206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bsuVMHdPyoMl29LL1KXzCdxntqN9YJP95SRtroOttNI=;
        b=dj29o5qoEHlygMlVkK5LMiR8EfZAp4PAdY1C2QsDz8exT3z8smpiWyij9dndXXosbo
         hNvLAs7WiqxnGPsgtmyucfG8iceLGmZGLID0Y751+W+Vo6OyE+qS3ZgTaUNX3XpuVoUu
         /rwNE/02A0j12Lalbmy87pXFUn/VGix6MQXREITWpF1Da3EdPn+d8tN9Wd80hqHkp+30
         SdkQX9M04BCWJc5Sx9ELPSLTJDz5y1/OOYtBDSswoJKPmzW10HQHp62HzUaP3O+0NK0q
         2mIoaI4qG7gXwBSGrCsqe28vQFyfOgTsUqQhRvTtt2rXq0ljFL0Qb+LUqqmBQrkRlHdF
         WwDA==
X-Forwarded-Encrypted: i=1; AJvYcCUAqZLu5N5xbxbYCYxx/xCqHIetKodtm9vWGhA72dkmzpW9LLa22zrkWZzGpx7lxhk6slWX8uEydJUM@vger.kernel.org, AJvYcCX+0XYz8K9dok0+ahtWEuTIxhrwajnwYrEo3jW19W7qYV1VqsAxfCgXlSVoTZ/TG/qHQ8kUxKdlkq8svblJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/tmv9ydViBMzNPQc446wZ85Rhp4q0fdvc2joifFWQanmGMBHP
	mJJzBysGM9TcjfUcieVROlOuYu2H+2dr+3DO2bdpLnuaAAxyBxENpMmEsoIlPqWstGyKIc8gzc3
	2i3CwHrA3s9qaQJoUeD/qf8YS84fILQ8=
X-Gm-Gg: ASbGncsi1NaDwmQQn53CFOXEaV5MNl2p6xQSl2nawJd6qPnA+TL1ovxOiV4RbuQK27g
	nLcDggB566GwDtoCa1nGFjEcfiuY8aDyvKEAebEF13W0awCCMc5RDp4mD74cwYycbctWhAhF9/9
	t+gZOuRmNo/AnNPsurEvw96COA9PTsRSyQRpJZzMzVaMan
X-Google-Smtp-Source: AGHT+IHxoyMAzrf2LbgQDNwEuwJWUIdpjjM+Ph04bO+CgSJPWdYFSEfS4CRU7pDTnsLGVs9SUjjHJrw11Y4guCcdrIQ=
X-Received: by 2002:a5d:64c9:0:b0:3a4:dde7:ee12 with SMTP id
 ffacd0b85a97d-3a572e9e01cmr18889997f8f.53.1750335406067; Thu, 19 Jun 2025
 05:16:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526114353.12081-1-clamor95@gmail.com> <20250526114353.12081-3-clamor95@gmail.com>
 <20250619-nondescript-holistic-ostrich-6d1efc@houat> <CAPVz0n2rG+VJ5dwHmSxtzD5JtRy7p=g-gygKGUoSaECQCEkFfQ@mail.gmail.com>
 <20250619-slim-bright-warthog-77f8ed@houat>
In-Reply-To: <20250619-slim-bright-warthog-77f8ed@houat>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 19 Jun 2025 15:16:34 +0300
X-Gm-Features: Ac12FXx30xubSIzbk_WR5SeH8bWRwhhe_clcHUJEn_GMfTRXwnQ2inDKt96s1Qk
Message-ID: <CAPVz0n2eDciXnLOo_cEh8Hjy=hY1NW0DNRs8K5Y7d0Ey5JGbNQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] drm: bridge: Add support for Solomon SSD2825
 RGB/DSI bridge
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 19 =D1=87=D0=B5=D1=80=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 15:0=
5 Maxime Ripard <mripard@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Jun 19, 2025 at 01:17:12PM +0300, Svyatoslav Ryhel wrote:
> > =D1=87=D1=82, 19 =D1=87=D0=B5=D1=80=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE =
12:41 Maxime Ripard <mripard@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Mon, May 26, 2025 at 02:43:53PM +0300, Svyatoslav Ryhel wrote:
> > > > +static ssize_t ssd2825_dsi_host_transfer(struct mipi_dsi_host *hos=
t,
> > > > +                                      const struct mipi_dsi_msg *m=
sg)
> > > > +{
> > > > +     struct ssd2825_priv *priv =3D dsi_host_to_ssd2825(host);
> > > > +     struct mipi_dsi_device *dsi_dev =3D priv->output.dev;
> > > > +     u8 buf =3D *(u8 *)msg->tx_buf;
> > > > +     u16 config;
> > > > +     int ret;
> > > > +
> > > > +     if (!priv->enabled) {
> > > > +             dev_err(priv->dev, "Bridge is not enabled\n");
> > > > +             return -ENODEV;
> > > > +     }
> > >
> > > Transfers can and should happen even when the bridge is disabled. The
> > > hardware might not permit that, but you'll need to elaborate in the
> > > comment about why.
> >
> > This ensures that hw was configured properly in pre_enable and since
> > pre_enable is void it will not return any errors if it fails.
>
> There's no relationship between the bridge pre_enable and enable hooks,
> and the MIPI-DSI host transfer one. It's perfectly valid to call
> transfer if the bridge is detached or disabled.
>

That is twisted logic, but ok, fine, I don't care.

> > > > +     if (msg->rx_len) {
> > > > +             dev_warn(priv->dev, "MIPI rx is not supported\n");
> > > > +             return -EOPNOTSUPP;
> > > > +     }
> > > > +
> > > > +     guard(mutex)(&priv->mlock);
> > > > +
> > > > +     ret =3D ssd2825_read_reg(priv, SSD2825_CONFIGURATION_REG, &co=
nfig);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     switch (msg->type) {
> > > > +     case MIPI_DSI_DCS_SHORT_WRITE:
> > > > +     case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
> > > > +     case MIPI_DSI_DCS_LONG_WRITE:
> > > > +             config |=3D SSD2825_CONF_REG_DCS;
> > > > +             break;
> > > > +     case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
> > > > +     case MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM:
> > > > +     case MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM:
> > > > +     case MIPI_DSI_GENERIC_LONG_WRITE:
> > > > +             config &=3D ~SSD2825_CONF_REG_DCS;
> > > > +             break;
> > > > +     case MIPI_DSI_DCS_READ:
> > > > +     case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
> > > > +     case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
> > > > +     case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
> > > > +     default:
> > > > +             return 0;
> > > > +     }
> > > > +
> > > > +     ret =3D ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG, co=
nfig);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     ret =3D ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0x0000);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     ret =3D ssd2825_write_dsi(priv, msg->tx_buf, msg->tx_len);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     if (buf =3D=3D MIPI_DCS_SET_DISPLAY_ON) {
> > > > +             /*
> > > > +              * NOTE! This is here since it cannot be called in br=
idge enable because
> > > > +              * bridge pre enable and bridge enable have no gap in=
 between.
> > > > +              *
> > > > +              * Existing framework bridge-panel seq is:
> > > > +              *      panel_prepare > bridge_pre_enable > bridge_en=
able > panel_enable
> > > > +              *
> > > > +              * Using prepare_prev_first was tested, but it switch=
es seq like this:
> > > > +              *      bridge_pre_enable > panel_prepare > bridge_en=
able > panel_enable
> > > > +              *
> > > > +              * This will not work since panel hw MUST be prepared=
 before bridge is
> > > > +              * configured. Correct seq should be:
> > > > +              *      panel_prepare > bridge_pre_enable > panel_ena=
ble > bridge_enable
> > >
> > > Where is that requirement coming from?
> >
> > This is how my device's (LG P895) bridge-panel combo works. Panel hw
> > must be enabled before bridge, then bridge hw, then panel can send
> > init sequence and then bridge must complete configuration.
>
> Do you have a documentation for that DSI device?
>

No

> DSI devices typically come with requirement of the power states of the
> lanes, that's what you want to discuss here. How we can model that in
> software is a discussion we need to have once we've identified what the
> hardware needs exactly.
>
> > > panel prepare is documented as:
> > >
> > >   The .prepare() function is typically called before the display cont=
roller
> > >   starts to transmit video data.
> > >
> > >
> > > And video data transmission for bridges only happen at bridge_enable
> > > time.
> > >
> > > So, from an API PoV, all the sequences above are correct.
> >
> > There is no way ATM for this bridge to complete configuration, there
> > either should be a way to swap panel_enable and bridge_enable or there
> > should be added an additional operation like bridge_post_enable or
> > smth like that for cases like here when bridge has to complete
> > configuration after panel init seq is sent.
> >
> > > > +              * Last two functions should be swapped related to ex=
isting framework.
> > > > +              * I am not aware about method which allows that.
> > > > +              *
> > > > +              * Once there will be such method/flag, code below sh=
ould be moved into
> > > > +              * bridge_enable since it is basically a bridge confi=
guration completing
> > > > +              * after initial panel DSI sequence is completed.
> > > > +              */
> > >
> > > If there's anything to fix, we should do it before introducing that
> > > driver.
> >
> > I just want to have a bridge my device uses to be supported by
> > mainline linux. I have no intention to touch any part of DRM framework
> > and cause instabilities, maintainers rage and hate.
>
> And I just want all drivers to behave consistently.
>

Ye, sure.

> > > > +static void ssd2825_bridge_atomic_pre_enable(struct drm_bridge *br=
idge,
> > > > +                                          struct drm_atomic_state =
*state)
> > > > +{
> > > > +     struct ssd2825_priv *priv =3D bridge_to_ssd2825(bridge);
> > > > +     struct mipi_dsi_device *dsi_dev =3D priv->output.dev;
> > > > +     const struct drm_crtc_state *crtc_state;
> > > > +     const struct drm_display_mode *mode;
> > > > +     struct drm_connector *connector;
> > > > +     struct drm_crtc *crtc;
> > > > +     u32 input_bus_flags =3D bridge->timings->input_bus_flags;
> > > > +     u16 flags =3D 0, config;
> > > > +     u8 pixel_format;
> > > > +     int ret;
> > > > +
> > > > +     if (priv->enabled)
> > > > +             return;
> > >
> > > What is this guarding against?
> >
> > blocks repeating ssd2825_bridge_atomic_pre_enable calls
>
> Which happens in which situation?
>
> > > > +     /* Power Sequence */
> > > > +     ret =3D clk_prepare_enable(priv->tx_clk);
> > > > +     if (ret)
> > > > +             dev_err(priv->dev, "error enabling tx_clk (%d)\n", re=
t);
> > > > +
> > > > +     ret =3D regulator_bulk_enable(ARRAY_SIZE(ssd2825_supplies), p=
riv->supplies);
> > > > +     if (ret)
> > > > +             dev_err(priv->dev, "error enabling regulators (%d)\n"=
, ret);
> > > > +
> > > > +     usleep_range(1000, 2000);
> > > > +
> > > > +     ssd2825_hw_reset(priv);
> > > > +
> > > > +     /* Perform SW reset */
> > > > +     ssd2825_write_reg(priv, SSD2825_OPERATION_CTRL_REG, 0x0100);
> > > > +
> > > > +     /* Set pixel format */
> > > > +     switch (dsi_dev->format) {
> > > > +     case MIPI_DSI_FMT_RGB565:
> > > > +             pixel_format =3D 0x00;
> > > > +             break;
> > > > +     case MIPI_DSI_FMT_RGB666_PACKED:
> > > > +             pixel_format =3D 0x01;
> > > > +             break;
> > > > +     case MIPI_DSI_FMT_RGB666:
> > > > +             pixel_format =3D 0x02;
> > > > +             break;
> > > > +     case MIPI_DSI_FMT_RGB888:
> > > > +     default:
> > > > +             pixel_format =3D 0x03;
> > > > +             break;
> > > > +     }
> > > > +
> > > > +     connector =3D drm_atomic_get_new_connector_for_encoder(state,=
 bridge->encoder);
> > > > +     crtc =3D drm_atomic_get_new_connector_state(state, connector)=
->crtc;
> > > > +     crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> > > > +     mode =3D &crtc_state->adjusted_mode;
> > > > +
> > > > +     /* Set panel timings */
> > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_1,
> > > > +                       ((mode->vtotal - mode->vsync_end) << 8) |
> > > > +                       (mode->htotal - mode->hsync_end));
> > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_2,
> > > > +                       ((mode->vtotal - mode->vsync_start) << 8) |
> > > > +                       (mode->htotal - mode->hsync_start));
> > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_3,
> > > > +                       ((mode->vsync_start - mode->vdisplay) << 8)=
 |
> > > > +                       (mode->hsync_start - mode->hdisplay));
> > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_4, mod=
e->hdisplay);
> > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_5, mod=
e->vdisplay);
> > > > +
> > > > +     if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> > > > +             flags |=3D SSD2825_HSYNC_HIGH;
> > > > +
> > > > +     if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> > > > +             flags |=3D SSD2825_VSYNC_HIGH;
> > > > +
> > > > +     if (dsi_dev->mode_flags & MIPI_DSI_MODE_VIDEO)
> > > > +             flags |=3D SSD2825_NON_BURST_EV;
> > > > +
> > > > +     if (input_bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
> > > > +             flags |=3D SSD2825_PCKL_HIGH;
> > > > +
> > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_6, fla=
gs | pixel_format);
> > > > +     ssd2825_write_reg(priv, SSD2825_LANE_CONFIGURATION_REG, dsi_d=
ev->lanes - 1);
> > > > +     ssd2825_write_reg(priv, SSD2825_TEST_REG, 0x0004);
> > > > +
> > > > +     /* Call PLL configuration */
> > > > +     ssd2825_setup_pll(priv, mode);
> > > > +
> > > > +     usleep_range(10000, 11000);
> > > > +
> > > > +     config =3D SSD2825_CONF_REG_HS | SSD2825_CONF_REG_CKE | SSD28=
25_CONF_REG_DCS |
> > > > +              SSD2825_CONF_REG_ECD | SSD2825_CONF_REG_EOT;
> > > > +
> > > > +     if (dsi_dev->mode_flags & MIPI_DSI_MODE_LPM)
> > > > +             config &=3D ~SSD2825_CONF_REG_HS;
> > > > +
> > > > +     if (dsi_dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
> > > > +             config &=3D ~SSD2825_CONF_REG_EOT;
> > > > +
> > > > +     /* Initial DSI configuration register set */
> > > > +     ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG, config);
> > > > +     ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0);
> > > > +
> > > > +     priv->enabled =3D true;
> > > > +}
> > > > +
> > > > +static void ssd2825_bridge_atomic_enable(struct drm_bridge *bridge=
,
> > > > +                                      struct drm_atomic_state *sta=
te)
> > > > +{
> > > > +     /* placeholder */
> > > > +}
> > >
> > > That doesn't work with any bridge or panel that doesn't require any D=
CS
> > > command to power up, unfortunately.
> >
> > Yes that is a flaw unfortunately, if you have suggestions of fixing
> > this just tell me.
>
> Untangle pre_enable and enable from transfer, and in enable actually
> enable the bridge, and it will work just fine.
>

No it will not, I have tried and panel fails cause panel hw is init in
pre-enable and init sequence is sent in enable, which is expected
logic. Yet bridge cannot complete configuration because panel enable
function is called AFTER bridge enable.

> Maxime
