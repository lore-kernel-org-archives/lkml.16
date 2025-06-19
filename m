Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C4D2045B1;
	Thu, 19 Jun 2025 10:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750328248; cv=none; b=X0D8MLQorJzKIcsrH+UDkmuYoLYoEIKIsz+Df4YwRHW+9f3vF/AE3iEfzVYJW9oQajBxcsIXm5wAxVTnMqjK3s0sizx9VTRTcm3dYizItLb4gXK2Cm3l68/EzkyZnQ9xk5VSGPdM3qhEUvRUiKXCxEe+UG/Q6we1ygqaEI887bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750328248; c=relaxed/simple;
	bh=cqHAr2VvunZiAEnJWf9a2zomiqVn/v4pOv6cE8UH7jQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=biiEj+XeWWF+1FoIAkvsPvoIoCJUp4/waOrgit0kZsfOVSXas67QVRf9ek7qauLUbsvr/l2gu+7360BMn+BjpkimyhL7Tz+nAQ9uX1QiQgFpApwT5/KoDTTYLelqUl/4q3q7B2Ryy2+mao1Qf1UywWOp4w6GnRT6ezKgFfzbrpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7/WFwHS; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7/WFwHS"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451d3f72391so6123195e9.3;
        Thu, 19 Jun 2025 03:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750328245; x=1750933045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ao7gCqbk2nwxvTf9N0zcHGoO6CYaEdqlxe/q9BiVKGQ=;
        b=U7/WFwHSlFmjgSOJ1ue5G3jWGPtvZ+P3C5Cyf/yt2r9BqieE0DAcZkeOu0BGCCxYLu
         pifJfnBPSF/lOkhtF2/FN5/jqtybI3T4gBrE6gLWulCat7sRU6ajgYcge/UKM5No7xak
         BoPQa9qvn+i/yCYa0uaj55WMlLQyj3oeCO1qx7Gz+YFCxhuWMlgiS3qd54v0uxy3l8fV
         Kv6LMtTyZTOv0wEmrPxekM8wD39zjU3jrwxnsYo0rBBzkwjXyBXcMf6xChIwiu8L6XfZ
         bJMrFmvPJjPYuQu9DFmwKcVzMpqFpqxUG0HiaGT/5QHN0zAgPBNQVluHHsbsVNNLJtpt
         5q2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750328245; x=1750933045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ao7gCqbk2nwxvTf9N0zcHGoO6CYaEdqlxe/q9BiVKGQ=;
        b=CaElgHMoAgQu5KeV2x1uqEuM5Le+Laa6Cp385OVKQpYRP4enWg9LktvA4KRZWUE0g3
         VptWZweNBndEIXZ6EYn2cuoEl2ROOXLhoFVcnPpmqe+lrSpY+Q1nRzXi+qD50Qud6jYY
         37saWPfvlEmmHNfPn6eZvnbWLLe/Z4R0dPyhvzlVJ7b8afJ8jFP0oy7UmTLEV/jkXBST
         DYuu7MbfczTgS4NVK7ZZAZwHGr3xv1JmoCQ4/WWIieDaagulQKy62FGVNVpmN7f3eY1T
         wC7n/FOIQPYUwYLbduwFGbAELgtZ+KjT4kBoLV99ID9oqrNGMAkjggjC1xLYXiA8xa/i
         KUkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpMBrHOaWH33IZZsDnos4JAYIWJ+m9/18g9bpX2DhN05DgQl0ACSA92zSqNBxMF84bhsH8ZVuWP5QyF7lK@vger.kernel.org, AJvYcCXOB3sNocfzDT4bAbf2/nmKpDx2ZdQMk9Ix5ja2OhnkzIQckk8iAWpxdz47KHd0x7yAzcl0P8KouQ4c@vger.kernel.org
X-Gm-Message-State: AOJu0YyGpPPCybo2alc1rxJRZHQ/ixrGhAlGC4uQnvWDMCZ2Mn21ThHQ
	GqbWYtGe80wQ4Hn4XBojx0CpAc8KapAF5FCMeShN7rJZBviEqIUMRSQh4POFv7+p5Jr78FPWCC5
	ZMFoFe3wDBhiz9k/7cHVmtRNLhkcE7yw=
X-Gm-Gg: ASbGncvo2p+fxJnpEzC8BYmK6fRQYBgdUn2DQlhQirZxb+MHwxnEHwvq+bEN1AqIzHn
	hk5quTLmqaxcK0YQQhspBf4X0r0XuCbTltiMdYZlKu5VwGGdTtzveZ1qHrw/AtmMO2eiqXmoqZH
	z94m6uYH838lWBIatCoeFfMg0H2G4kZSjY7MSURypTg2FS
X-Google-Smtp-Source: AGHT+IHwtk3I9wsayzQv0EzwP+ieJxggcDc9+OSYuqMeYAfVbKcvpm4rj/VK4C8kR6QjwmimsWaej+5Gqn88b0H8qP4=
X-Received: by 2002:a05:6000:430e:b0:3a5:1c3c:8d8d with SMTP id
 ffacd0b85a97d-3a572e56dc1mr17286269f8f.55.1750328244310; Thu, 19 Jun 2025
 03:17:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526114353.12081-1-clamor95@gmail.com> <20250526114353.12081-3-clamor95@gmail.com>
 <20250619-nondescript-holistic-ostrich-6d1efc@houat>
In-Reply-To: <20250619-nondescript-holistic-ostrich-6d1efc@houat>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 19 Jun 2025 13:17:12 +0300
X-Gm-Features: Ac12FXwt7ii5S_NZ_PqQMyLvlMeVkxBJDTQVellqtZCJ-I81n9o_WJs1aPyancw
Message-ID: <CAPVz0n2rG+VJ5dwHmSxtzD5JtRy7p=g-gygKGUoSaECQCEkFfQ@mail.gmail.com>
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

=D1=87=D1=82, 19 =D1=87=D0=B5=D1=80=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 12:4=
1 Maxime Ripard <mripard@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, May 26, 2025 at 02:43:53PM +0300, Svyatoslav Ryhel wrote:
> > +static ssize_t ssd2825_dsi_host_transfer(struct mipi_dsi_host *host,
> > +                                      const struct mipi_dsi_msg *msg)
> > +{
> > +     struct ssd2825_priv *priv =3D dsi_host_to_ssd2825(host);
> > +     struct mipi_dsi_device *dsi_dev =3D priv->output.dev;
> > +     u8 buf =3D *(u8 *)msg->tx_buf;
> > +     u16 config;
> > +     int ret;
> > +
> > +     if (!priv->enabled) {
> > +             dev_err(priv->dev, "Bridge is not enabled\n");
> > +             return -ENODEV;
> > +     }
>
> Transfers can and should happen even when the bridge is disabled. The
> hardware might not permit that, but you'll need to elaborate in the
> comment about why.
>

This ensures that hw was configured properly in pre_enable and since
pre_enable is void it will not return any errors if it fails.

> > +     if (msg->rx_len) {
> > +             dev_warn(priv->dev, "MIPI rx is not supported\n");
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> > +     guard(mutex)(&priv->mlock);
> > +
> > +     ret =3D ssd2825_read_reg(priv, SSD2825_CONFIGURATION_REG, &config=
);
> > +     if (ret)
> > +             return ret;
> > +
> > +     switch (msg->type) {
> > +     case MIPI_DSI_DCS_SHORT_WRITE:
> > +     case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
> > +     case MIPI_DSI_DCS_LONG_WRITE:
> > +             config |=3D SSD2825_CONF_REG_DCS;
> > +             break;
> > +     case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
> > +     case MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM:
> > +     case MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM:
> > +     case MIPI_DSI_GENERIC_LONG_WRITE:
> > +             config &=3D ~SSD2825_CONF_REG_DCS;
> > +             break;
> > +     case MIPI_DSI_DCS_READ:
> > +     case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
> > +     case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
> > +     case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
> > +     default:
> > +             return 0;
> > +     }
> > +
> > +     ret =3D ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG, config=
);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0x0000);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D ssd2825_write_dsi(priv, msg->tx_buf, msg->tx_len);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (buf =3D=3D MIPI_DCS_SET_DISPLAY_ON) {
> > +             /*
> > +              * NOTE! This is here since it cannot be called in bridge=
 enable because
> > +              * bridge pre enable and bridge enable have no gap in bet=
ween.
> > +              *
> > +              * Existing framework bridge-panel seq is:
> > +              *      panel_prepare > bridge_pre_enable > bridge_enable=
 > panel_enable
> > +              *
> > +              * Using prepare_prev_first was tested, but it switches s=
eq like this:
> > +              *      bridge_pre_enable > panel_prepare > bridge_enable=
 > panel_enable
> > +              *
> > +              * This will not work since panel hw MUST be prepared bef=
ore bridge is
> > +              * configured. Correct seq should be:
> > +              *      panel_prepare > bridge_pre_enable > panel_enable =
> bridge_enable
>
> Where is that requirement coming from?
>

This is how my device's (LG P895) bridge-panel combo works. Panel hw
must be enabled before bridge, then bridge hw, then panel can send
init sequence and then bridge must complete configuration.

> panel prepare is documented as:
>
>   The .prepare() function is typically called before the display controll=
er
>   starts to transmit video data.
>
>
> And video data transmission for bridges only happen at bridge_enable
> time.
>
> So, from an API PoV, all the sequences above are correct.
>

There is no way ATM for this bridge to complete configuration, there
either should be a way to swap panel_enable and bridge_enable or there
should be added an additional operation like bridge_post_enable or
smth like that for cases like here when bridge has to complete
configuration after panel init seq is sent.

> > +              * Last two functions should be swapped related to existi=
ng framework.
> > +              * I am not aware about method which allows that.
> > +              *
> > +              * Once there will be such method/flag, code below should=
 be moved into
> > +              * bridge_enable since it is basically a bridge configura=
tion completing
> > +              * after initial panel DSI sequence is completed.
> > +              */
>
> If there's anything to fix, we should do it before introducing that
> driver.
>

I just want to have a bridge my device uses to be supported by
mainline linux. I have no intention to touch any part of DRM framework
and cause instabilities, maintainers rage and hate.

> > +static void ssd2825_bridge_atomic_pre_enable(struct drm_bridge *bridge=
,
> > +                                          struct drm_atomic_state *sta=
te)
> > +{
> > +     struct ssd2825_priv *priv =3D bridge_to_ssd2825(bridge);
> > +     struct mipi_dsi_device *dsi_dev =3D priv->output.dev;
> > +     const struct drm_crtc_state *crtc_state;
> > +     const struct drm_display_mode *mode;
> > +     struct drm_connector *connector;
> > +     struct drm_crtc *crtc;
> > +     u32 input_bus_flags =3D bridge->timings->input_bus_flags;
> > +     u16 flags =3D 0, config;
> > +     u8 pixel_format;
> > +     int ret;
> > +
> > +     if (priv->enabled)
> > +             return;
>
> What is this guarding against?
>

blocks repeating ssd2825_bridge_atomic_pre_enable calls

> > +     /* Power Sequence */
> > +     ret =3D clk_prepare_enable(priv->tx_clk);
> > +     if (ret)
> > +             dev_err(priv->dev, "error enabling tx_clk (%d)\n", ret);
> > +
> > +     ret =3D regulator_bulk_enable(ARRAY_SIZE(ssd2825_supplies), priv-=
>supplies);
> > +     if (ret)
> > +             dev_err(priv->dev, "error enabling regulators (%d)\n", re=
t);
> > +
> > +     usleep_range(1000, 2000);
> > +
> > +     ssd2825_hw_reset(priv);
> > +
> > +     /* Perform SW reset */
> > +     ssd2825_write_reg(priv, SSD2825_OPERATION_CTRL_REG, 0x0100);
> > +
> > +     /* Set pixel format */
> > +     switch (dsi_dev->format) {
> > +     case MIPI_DSI_FMT_RGB565:
> > +             pixel_format =3D 0x00;
> > +             break;
> > +     case MIPI_DSI_FMT_RGB666_PACKED:
> > +             pixel_format =3D 0x01;
> > +             break;
> > +     case MIPI_DSI_FMT_RGB666:
> > +             pixel_format =3D 0x02;
> > +             break;
> > +     case MIPI_DSI_FMT_RGB888:
> > +     default:
> > +             pixel_format =3D 0x03;
> > +             break;
> > +     }
> > +
> > +     connector =3D drm_atomic_get_new_connector_for_encoder(state, bri=
dge->encoder);
> > +     crtc =3D drm_atomic_get_new_connector_state(state, connector)->cr=
tc;
> > +     crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> > +     mode =3D &crtc_state->adjusted_mode;
> > +
> > +     /* Set panel timings */
> > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_1,
> > +                       ((mode->vtotal - mode->vsync_end) << 8) |
> > +                       (mode->htotal - mode->hsync_end));
> > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_2,
> > +                       ((mode->vtotal - mode->vsync_start) << 8) |
> > +                       (mode->htotal - mode->hsync_start));
> > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_3,
> > +                       ((mode->vsync_start - mode->vdisplay) << 8) |
> > +                       (mode->hsync_start - mode->hdisplay));
> > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_4, mode->h=
display);
> > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_5, mode->v=
display);
> > +
> > +     if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> > +             flags |=3D SSD2825_HSYNC_HIGH;
> > +
> > +     if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> > +             flags |=3D SSD2825_VSYNC_HIGH;
> > +
> > +     if (dsi_dev->mode_flags & MIPI_DSI_MODE_VIDEO)
> > +             flags |=3D SSD2825_NON_BURST_EV;
> > +
> > +     if (input_bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
> > +             flags |=3D SSD2825_PCKL_HIGH;
> > +
> > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_6, flags |=
 pixel_format);
> > +     ssd2825_write_reg(priv, SSD2825_LANE_CONFIGURATION_REG, dsi_dev->=
lanes - 1);
> > +     ssd2825_write_reg(priv, SSD2825_TEST_REG, 0x0004);
> > +
> > +     /* Call PLL configuration */
> > +     ssd2825_setup_pll(priv, mode);
> > +
> > +     usleep_range(10000, 11000);
> > +
> > +     config =3D SSD2825_CONF_REG_HS | SSD2825_CONF_REG_CKE | SSD2825_C=
ONF_REG_DCS |
> > +              SSD2825_CONF_REG_ECD | SSD2825_CONF_REG_EOT;
> > +
> > +     if (dsi_dev->mode_flags & MIPI_DSI_MODE_LPM)
> > +             config &=3D ~SSD2825_CONF_REG_HS;
> > +
> > +     if (dsi_dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
> > +             config &=3D ~SSD2825_CONF_REG_EOT;
> > +
> > +     /* Initial DSI configuration register set */
> > +     ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG, config);
> > +     ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0);
> > +
> > +     priv->enabled =3D true;
> > +}
> > +
> > +static void ssd2825_bridge_atomic_enable(struct drm_bridge *bridge,
> > +                                      struct drm_atomic_state *state)
> > +{
> > +     /* placeholder */
> > +}
>
> That doesn't work with any bridge or panel that doesn't require any DCS
> command to power up, unfortunately.
>

Yes that is a flaw unfortunately, if you have suggestions of fixing
this just tell me.

> > +static void ssd2825_bridge_atomic_disable(struct drm_bridge *bridge,
> > +                                       struct drm_atomic_state *state)
> > +{
> > +     struct ssd2825_priv *priv =3D bridge_to_ssd2825(bridge);
> > +     int ret;
> > +
> > +     if (!priv->enabled)
> > +             return;
> > +
> > +     msleep(100);
> > +
> > +     /* Exit DSI configuration register set */
> > +     ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG,
> > +                       SSD2825_CONF_REG_ECD | SSD2825_CONF_REG_EOT);
> > +     ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0);
> > +
> > +     /* HW disable */
> > +     gpiod_set_value_cansleep(priv->reset_gpio, 1);
> > +     usleep_range(5000, 6000);
> > +
> > +     ret =3D regulator_bulk_disable(ARRAY_SIZE(ssd2825_supplies),
> > +                                  priv->supplies);
> > +     if (ret < 0)
> > +             dev_err(priv->dev, "error disabling regulators (%d)\n", r=
et);
> > +
> > +     clk_disable_unprepare(priv->tx_clk);
> > +
> > +     priv->enabled =3D false;
> > +}
> > +
> > +static int ssd2825_bridge_attach(struct drm_bridge *bridge, struct drm=
_encoder *encoder,
> > +                              enum drm_bridge_attach_flags flags)
> > +{
> > +     struct ssd2825_priv *priv =3D bridge_to_ssd2825(bridge);
> > +
> > +     return drm_bridge_attach(bridge->encoder, priv->output.bridge, br=
idge,
> > +                              flags);
> > +}
> > +
> > +static enum drm_mode_status
> > +ssd2825_bridge_mode_valid(struct drm_bridge *bridge,
> > +                       const struct drm_display_info *info,
> > +                       const struct drm_display_mode *mode)
> > +{
> > +     if (mode->hdisplay > 1366)
> > +             return MODE_H_ILLEGAL;
> > +
> > +     if (mode->vdisplay > 1366)
> > +             return MODE_V_ILLEGAL;
> > +
> > +     return MODE_OK;
> > +}
> > +
> > +static bool ssd2825_mode_fixup(struct drm_bridge *bridge,
> > +                            const struct drm_display_mode *mode,
> > +                            struct drm_display_mode *adjusted_mode)
> > +{
> > +     /* Default to positive sync */
> > +
> > +     if (!(adjusted_mode->flags &
> > +           (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NHSYNC)))
> > +             adjusted_mode->flags |=3D DRM_MODE_FLAG_PHSYNC;
> > +
> > +     if (!(adjusted_mode->flags &
> > +           (DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC)))
> > +             adjusted_mode->flags |=3D DRM_MODE_FLAG_PVSYNC;
> > +
> > +     return true;
> > +}
> > +
> > +static const struct drm_bridge_funcs ssd2825_bridge_funcs =3D {
> > +     .attach =3D ssd2825_bridge_attach,
> > +     .mode_valid =3D ssd2825_bridge_mode_valid,
> > +     .mode_fixup =3D ssd2825_mode_fixup,
> > +
> > +     .atomic_pre_enable =3D ssd2825_bridge_atomic_pre_enable,
> > +     .atomic_enable =3D ssd2825_bridge_atomic_enable,
> > +     .atomic_disable =3D ssd2825_bridge_atomic_disable,
> > +
> > +     .atomic_reset =3D drm_atomic_helper_bridge_reset,
> > +     .atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_st=
ate,
> > +     .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> > +};
> > +
> > +static const struct drm_bridge_timings default_ssd2825_timings =3D {
> > +     .input_bus_flags =3D DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE
> > +              | DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE
> > +              | DRM_BUS_FLAG_DE_HIGH,
> > +};
> > +
> > +static int ssd2825_probe(struct spi_device *spi)
> > +{
> > +     struct ssd2825_priv *priv;
> > +     struct device *dev =3D &spi->dev;
> > +     struct device_node *np =3D dev->of_node;
> > +     int ret;
> > +
> > +     /* Driver supports only 8 bit 3 Wire mode */
> > +     spi->bits_per_word =3D 9;
> > +
> > +     ret =3D spi_setup(spi);
> > +     if (ret)
> > +             return ret;
> > +
> > +     priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
>
> devm_drm_bridge_alloc()
>

OK

> > +     spi_set_drvdata(spi, priv);
> > +     priv->spi =3D spi;
> > +
> > +     dev_set_drvdata(dev, priv);
> > +     priv->dev =3D dev;
>
> spi_set_drvdata and dev_set_drvdata are doing the same thing here.
>

spi_set_drvdata is actually used, but dev_set_drvdata may be removed, yes.

> Maxime
