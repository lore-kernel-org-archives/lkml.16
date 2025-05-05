Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763633596A;
	Mon,  5 May 2025 11:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746445333; cv=none; b=KBW6x/posg8+tOKG0dwQjIKSKdL59kW9rxSTmpHHoIHTZLsui2/0tyjgWjapbZAkKz9WtjwLAwgItJet41XlCA7AUxqt9V6YGXvqtNZF1KAzOzyjKltEstd9lptQwZRjerRSs+S8Q10BJ/0a2GckNAgbKajsNl94tDsirU/xHog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746445333; c=relaxed/simple;
	bh=3ShDgHcrv0si/8F2zUrP8xt3sbXDU6yq8+ErTpjgbbA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RG/ENaQl0PjzUwIPeylLrVWezYIa8TqMFvtE59V+MKa1FHxrHygprCnun65Fus73kY9MU1vAPxXAXMjVMtSPD3dDwBdfKLzQTP8eKHvZPxBvNxn9xP08JKBR817zojSddGNBiPLKJ1Mer4mwKKFC/zGSwJTx5sxhAdVkCh/Figg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hp4EBdh9; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hp4EBdh9"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c1efc457bso2845571f8f.2;
        Mon, 05 May 2025 04:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746445329; x=1747050129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KruIqdPdauGVWjRYCa4lawsGc3EYFEr3EbHiC3ED+fE=;
        b=Hp4EBdh9ixPBzHy7kPaFpLpFSciYdaZgMNgksVYiBjIL90kcS2k3orzgBClchk/qgB
         llRaX5Wt5QDr/hV2W+MPpDsYPr+HFWxdIFGmUPMfKE00y2sbVwHA7rgWukARWxP3DSNC
         Wjc+zSv5fuJcw3NWHVUKXj/2Cc7LRbJwB8QawrxAAqhLsevKoA6/O4uupCZSNrRaMmn+
         EpyIXcFDzDaQJrCs+ZPyjIKSZQleca/unsXFXqGFqty4WGYTVmjHs5ABR6YXCwBCT07z
         dgfX56pUZdhwXGhVGuq9FGnDOLMrKhlUisDtsi6M2RimcTkTYtUNxhr7uLywwNCW7OoJ
         2LUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746445329; x=1747050129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KruIqdPdauGVWjRYCa4lawsGc3EYFEr3EbHiC3ED+fE=;
        b=L9V5pCFJWfzve+i/I+ZD0fAkpMYpiHt3TILac3D70A3NCEuXnd9GnSU59VUCACTWbq
         EPI7jW6t2vpwIZkXDBKtYS2iJ9ZmyZbDHPR0X7SHMakL0sYNC++LnV/GhrpBRqBqGrUI
         LetwfT7vXQEGbUFjXJ/Iv0LfR4YfAzu214UyXqgaNsfkESlCTN6mXMAOWjwES1ncHVgN
         W85+cvhwp0mupMsxrFA4Gh1TCanEFuHMfnGtd5qMfcnIec1DvPIMcV2BbwTdJOz+vSks
         NZSGBBXdao2ZXFO1F+5go0DrvU/8A1vjZ5TDMUBXeEn3Kj0vFbQX8cETkbUSJvpkbH7a
         sJ4g==
X-Forwarded-Encrypted: i=1; AJvYcCUmpCc5vpUtpwOGfvdkpexb6W/VKX4excVyAeVOYyvS1VYNw5+O97brTzq8sFo9M6lEk/sEowGSo9CENV91@vger.kernel.org, AJvYcCVO4BkAnP0m/8SbuE9rf3r61M9hzLReh/YZ2iqnxwvoinMOPvK7A1OE9Ccw/SZAEFjXAcQUVeHjoUwj@vger.kernel.org
X-Gm-Message-State: AOJu0YziSw1Jy/g7E9ptGIK19STRdHQ87WVd0KmM5IR+mOMsCEnVJfRE
	iqsWpQ9qTA0Uo9Ox4TGhf7HU6wNoqnr1mn26b02cKuZctLJ6uy62Wk5Cpx7+2vbzcLQ7fbDyZUH
	AiO6WYIzDsTSpWRMf9v9JLnczN1Y=
X-Gm-Gg: ASbGncsDjVG7FiBe82I3EYz3LBmqCn2EHU0lqmYMyPsYsbFX8p/+7w9Dp8tKB4ruiAK
	Tvn96+N+Q+FgzDLKjOxt0/Q9Xx4N0liRWHNiL9TkfCA5rqdcwJ6u+jbreB07i9FH75MBCdr5wmk
	1MAv+duwrtrRdDViRDUEq+mJxGke4cddFphA==
X-Google-Smtp-Source: AGHT+IF0b08rVUeiB6pMpxCseBfmukd/TOtG6DGSWcy45xXCpz3/srzTxmFTfkMiKUYFe9RprpS0sbmx07u7TavER8A=
X-Received: by 2002:a05:6000:1ac9:b0:39c:1f04:a646 with SMTP id
 ffacd0b85a97d-3a09fd726camr4763586f8f.13.1746445328440; Mon, 05 May 2025
 04:42:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503094149.29201-1-clamor95@gmail.com> <20250503094149.29201-3-clamor95@gmail.com>
 <ffac4a1b-5dfa-48e9-8ac4-37939b6a9347@linaro.org>
In-Reply-To: <ffac4a1b-5dfa-48e9-8ac4-37939b6a9347@linaro.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 5 May 2025 14:41:57 +0300
X-Gm-Features: ATxdqUG83kxEDJWXfjf1kMB8KKjw9VeaTfQqOHpfaGzkV6Mu-zq0PSNbH5qNHFs
Message-ID: <CAPVz0n3i7=jM9GB-CggFOJEN7B+oBWvyqsSn8UXav3MH0BQJ5g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm: panel: Add support for Renesas R61307 based
 MIPI DSI panel
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 5 =D1=82=D1=80=D0=B0=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 10:50=
 Neil Armstrong <neil.armstrong@linaro.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 03/05/2025 11:41, Svyatoslav Ryhel wrote:
> > R61307 is liquid crystal driver for high-definition amorphous silicon
> > (a-Si) panels and is ideal for tablets and smartphones.
> >
> > Supported compatibles are:
> > - hit,tx13d100vm0eaa
> > - koe,tx13d100vm0eaa
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >   drivers/gpu/drm/panel/Kconfig                |  13 +
> >   drivers/gpu/drm/panel/Makefile               |   1 +
> >   drivers/gpu/drm/panel/panel-renesas-r61307.c | 327 ++++++++++++++++++=
+
> >   3 files changed, 341 insertions(+)
> >   create mode 100644 drivers/gpu/drm/panel/panel-renesas-r61307.c
> >
>
> <snip>
>
> > +static int renesas_r61307_probe(struct mipi_dsi_device *dsi)
> > +{
> > +     struct device *dev =3D &dsi->dev;
> > +     struct renesas_r61307 *priv;
> > +     int ret;
> > +
> > +     priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->vcc_supply =3D devm_regulator_get(dev, "vcc");
> > +     if (IS_ERR(priv->vcc_supply))
> > +             return dev_err_probe(dev, PTR_ERR(priv->vcc_supply),
> > +                                  "Failed to get vcc-supply\n");
> > +
> > +     priv->iovcc_supply =3D devm_regulator_get(dev, "iovcc");
> > +     if (IS_ERR(priv->iovcc_supply))
> > +             return dev_err_probe(dev, PTR_ERR(priv->iovcc_supply),
> > +                                  "Failed to get iovcc-supply\n");
> > +
> > +     priv->reset_gpio =3D devm_gpiod_get_optional(dev, "reset",
> > +                                                GPIOD_OUT_HIGH);
> > +     if (IS_ERR(priv->reset_gpio))
> > +             return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
> > +                                  "Failed to get reset gpios\n");
> > +
> > +     if (device_property_read_bool(dev, "renesas,inversion"))
> > +             priv->inversion =3D true;
> > +
> > +     if (device_property_read_bool(dev, "renesas,contrast"))
> > +             priv->dig_cont_adj =3D true;
> > +
> > +     priv->gamma =3D 0;
> > +     device_property_read_u32(dev, "renesas,gamma", &priv->gamma);
> > +
> > +     priv->dsi =3D dsi;
> > +     mipi_dsi_set_drvdata(dsi, priv);
> > +
> > +     dsi->lanes =3D 4;
> > +     dsi->format =3D MIPI_DSI_FMT_RGB888;
> > +     dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYN=
C_PULSE |
> > +                       MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_L=
PM;
> > +
> > +     drm_panel_init(&priv->panel, dev, &renesas_r61307_panel_funcs,
> > +                    DRM_MODE_CONNECTOR_DSI);
>
> Please switch to devm_drm_panel_alloc()
>

This helper is not available as for 6.15-rc5

> > +
> > +     ret =3D drm_panel_of_backlight(&priv->panel);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "Failed to get backlight\n=
");
> > +
> > +     drm_panel_add(&priv->panel);
> > +
> <snip>
>
> With that:
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
