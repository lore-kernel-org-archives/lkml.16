Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9D22AE6F;
	Fri, 30 May 2025 07:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748591755; cv=none; b=Kl0MefJM/bpZri6qvaU27ABb6BspOZ/UGWOpud7gMJ0Cbnsy1UL1zeTeWsZCpJA9xhcDi4gPNBxpfOuLh5FvGmJmOm8u1Wz9532/00PcsfDTAtHkcwLCxfTKZ2dWYj5bi1cpeDGDybkgga/w6mYwCXFPd5lzoQNrc7xVa1o746c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748591755; c=relaxed/simple;
	bh=eXU7Tu8aOR6EY9AGEGiCTirtK2RqItQcxYD9axhpbvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y9vHzVyfeGtZjKTgb/kQjX9Jax/hhcOF6+qKPmW/CstbrsHQfAXb+7ZuCISG9w9rvJQc+g1kXS+82ZN3fSCr5Ez8ItCxzkX3VDO9MpNOTFCCwC3uJo6pE8bRaSkvmF+nSe+8ntqiETPkVjZQOc7SEXxfiW3Xa7UAPa+KuIE3Q94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-52403e39a23so1004764e0c.2;
        Fri, 30 May 2025 00:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748591752; x=1749196552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ok4r17T6ykjtgTAKGiGjcQeNcSghR2j2d4lkyI3DeQI=;
        b=OCpREw5ZgBlMDhFj5fjUaGkkrHZZ8seSMD7Vk2OAu0wO55Dk4ER9Oiz6+zwsvf+iFA
         zAZT7h0Jdt6CaISDTmgoUc7Ol/zMdNt1akOwc6r8/bJE/O9WubStINwyLmjz+QMKKc9+
         ki8kD9HvYSZ5UMKeDhbgH1UGec5eIAO7RR8GNrZQZTwiim/TAYRlc8CjiNxjQKVor6SR
         G2NpsSmEZiqrHkUy6G2dbjBYnOD7vpPrwiVLx/BV+M88CLGEp31reIrOQmGX/1Z+kKyK
         Jh0ucp2kfIHco9liUz9ohOhWZ/RE2BUQAFJ8aWLaKFlifKiNA9JGQoI53Kv1fYwi9uuU
         hjvw==
X-Forwarded-Encrypted: i=1; AJvYcCV7uwOG3/ee77sStBQS7LnZkoKARl9zTDJGUELYD0I2dZIG2vYVeAmmZDpvjF2sVkxZjMtQf/0QtVcMi7PB@vger.kernel.org, AJvYcCVmRJzxNvUCd2Ybe78XhnBl1XDIceZZuCUSD/5OgP5OKRT1kpAqkTmk+Pho81OmBcRRdRDa4TAJOKQz@vger.kernel.org
X-Gm-Message-State: AOJu0YzXyZ7ieeTyOBJ0aRDpAGcDNofCWjrcQl1LIG9RoUxwVj7aKxv4
	4rf/WfMgBZbHa2vbg1dIW+EZ+0Pr8hGPj1iMEntEArKhbHQ1CYbQQrf0x19rvfhY
X-Gm-Gg: ASbGncvTNyp1ttC1SkR1Wt2yZ2heS7/qWllUHwAIboo06x7N5xibiV5RiO5ygq0XOne
	TSvxpQgmbZyPTq6ipD4xReo/r1nENyeJsT1Ol1Wg+hxDnCJKtpKJTvyfYklArTviya6FlK1F2ON
	Tx8y8NR2Z7NYlTNiKvyxjvyQg7ZZnEFYKxbaGc9rnDC7Ix9P5CRz6hXJy/Qcah7Pr6XHPJPWgm4
	/WtAUjCmyZqJkwoQ2pkYNGzOjnU5TZo+TAz4hcv6a8GBtMwgS18SCzYmaiw/QdLAXtVrDqheHR5
	uiXkDBoL62LyL02pQDXAmcgI/QJy5belCdOboq6KPg5GS2s1ZgDzsQiIEI8dWgLkVuRdfSRRvCF
	pIGn+3nmiSfKQPg==
X-Google-Smtp-Source: AGHT+IF+uiaX/LPE1EzLkl3N4pdq9YtJQhLtrfLn2WdG7a1YctPUrkNzOGkkD2bno1czNIhgONvdsg==
X-Received: by 2002:a05:6122:1d11:b0:529:1a6a:cc2f with SMTP id 71dfb90a1353d-530810d7929mr2260450e0c.7.1748591751740;
        Fri, 30 May 2025 00:55:51 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53074c3202bsm2653684e0c.39.2025.05.30.00.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 00:55:50 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4e59012c7eeso1179731137.1;
        Fri, 30 May 2025 00:55:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQ1U9+hPyXkb3bEu5phOdbjCWDZuWODLFw+81PSU/lEcJVmF/TiDcV57w6KFbi21EVKRWp7MKMXKdm/3tP@vger.kernel.org, AJvYcCWASq5rjwXn3sQT4KdEZCKHXh5h0boGKRoJ1r5jZHsWa1CuxC//8WcmcIUtxZ8DW5yRatm95wjhFssF@vger.kernel.org
X-Received: by 2002:a05:6102:2acf:b0:4df:4a04:8d5e with SMTP id
 ada2fe7eead31-4e6e40f71admr2518734137.8.1748591748944; Fri, 30 May 2025
 00:55:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529110418.481756-1-j-choudhary@ti.com> <2baf3c31-3edf-4c26-bd44-1d0560134871@ti.com>
In-Reply-To: <2baf3c31-3edf-4c26-bd44-1d0560134871@ti.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 May 2025 09:55:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUi7pf1YfKRjMv_7VuKwjR5XekRXfcEzuPScGzHraGjyQ@mail.gmail.com>
X-Gm-Features: AX0GCFt7oJH7p6mCJm1bY-0aqdw-heaNTVCV9PIi-1gerZa683Q1Oz7IoT6_--U
Message-ID: <CAMuHMdUi7pf1YfKRjMv_7VuKwjR5XekRXfcEzuPScGzHraGjyQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: dianders@chromium.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
	dri-devel@lists.freedesktop.org, tomi.valkeinen@ideasonboard.com, 
	max.krummenacher@toradex.com, ernestvanhoecke@gmail.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	kieran.bingham+renesas@ideasonboard.com, linux-kernel@vger.kernel.org, 
	max.oss.09@gmail.com, devarsht@ti.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Jayesh,

CC devicetree

On Fri, 30 May 2025 at 04:54, Jayesh Choudhary <j-choudhary@ti.com> wrote:
> On 29/05/25 16:34, Jayesh Choudhary wrote:
> > By default, HPD was disabled on SN65DSI86 bridge. When the driver was
> > added (commit "a095f15c00e27"), the HPD_DISABLE bit was set in pre-enable
> > call which was moved to other function calls subsequently.
> > Later on, commit "c312b0df3b13" added detect utility for DP mode. But with
> > HPD_DISABLE bit set, all the HPD events are disabled[0] and the debounced
> > state always return 1 (always connected state).
> >
> > Set HPD_DISABLE bit conditionally based on "no-hpd" property.
> > Since the HPD_STATE is reflected correctly only after waiting for debounce
> > time (~100-400ms) and adding this delay in detect() is not feasible
> > owing to the performace impact (glitches and frame drop), remove runtime
> > calls in detect() and add hpd_enable()/disable() bridge hooks with runtime
> > calls, to detect hpd properly without any delay.
> >
> > [0]: <https://www.ti.com/lit/gpn/SN65DSI86> (Pg. 32)
> >
> > Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP")
> > Cc: Max Krummenacher <max.krummenacher@toradex.com>
> > Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> > ---
> >
> > Changelog v2->v3:
> > - Change conditional based on no-hpd property to address [1]
> > - Remove runtime calls in detect() with appropriate comments
> > - Add hpd_enable() and hpd_disable() in drm_bridge_funcs
> > - Not picking up "Tested-by" tag as there are new changes
> >
> > v2 patch link:
> > <https://lore.kernel.org/all/20250508115433.449102-1-j-choudhary@ti.com/>
> >
> > [1]: <https://lore.kernel.org/all/mwh35anw57d6nvre3sguetzq3miu4kd43rokegvul7fk266lys@5h2euthpk7vq/>

Thanks for your patch!

> > This would also require dts changes in all the nodes of sn65dsi86
> > to ensure that they have no-hpd property.
>
> DTS patch is posted now:
> <https://lore.kernel.org/all/20250529112423.484232-1-j-choudhary@ti.com/>

On all Renesas platforms handled by that patch, the DP bridge's HPD pin
is wired to the HPD pin on the mini-DP connector.  What am I missing?

Regardless, breaking backwards-compatibility with existing DTBs is
definitely a no-go.

> >   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 40 +++++++++++++++++++++++----
> >   1 file changed, 35 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 60224f476e1d..e9ffc58acf58 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -190,6 +190,7 @@ struct ti_sn65dsi86 {
> >       u8                              ln_assign;
> >       u8                              ln_polrs;
> >       bool                            comms_enabled;
> > +     bool                            no_hpd;
> >       struct mutex                    comms_mutex;
> >
> >   #if defined(CONFIG_OF_GPIO)
> > @@ -352,8 +353,10 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata,
> >        * change this to be conditional on someone specifying that HPD should
> >        * be used.
> >        */
> > -     regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> > -                        HPD_DISABLE);
> > +
> > +     if (pdata->no_hpd)
> > +             regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> > +                                HPD_DISABLE);
> >
> >       pdata->comms_enabled = true;
> >
> > @@ -1195,9 +1198,17 @@ static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
> >       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> >       int val = 0;
> >
> > -     pm_runtime_get_sync(pdata->dev);
> > +     /*
> > +      * The chip won't report HPD right after being powered on as
> > +      * HPD_DEBOUNCED_STATE reflects correct state only after the
> > +      * debounce time (~100-400 ms).
> > +      * So having pm_runtime_get_sync() and immediately reading
> > +      * the register in detect() won't work, and adding delay()
> > +      * in detect will have performace impact in display.
> > +      * So remove runtime calls here.
> > +      */
> > +
> >       regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
> > -     pm_runtime_put_autosuspend(pdata->dev);
> >
> >       return val & HPD_DEBOUNCED_STATE ? connector_status_connected
> >                                        : connector_status_disconnected;
> > @@ -1220,6 +1231,20 @@ static void ti_sn65dsi86_debugfs_init(struct drm_bridge *bridge, struct dentry *
> >       debugfs_create_file("status", 0600, debugfs, pdata, &status_fops);
> >   }
> >
> > +static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
> > +{
> > +     struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> > +
> > +     pm_runtime_get_sync(pdata->dev);
> > +}
> > +
> > +static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
> > +{
> > +     struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> > +
> > +     pm_runtime_put_sync(pdata->dev);
> > +}
> > +
> >   static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
> >       .attach = ti_sn_bridge_attach,
> >       .detach = ti_sn_bridge_detach,
> > @@ -1234,6 +1259,8 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
> >       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> >       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> >       .debugfs_init = ti_sn65dsi86_debugfs_init,
> > +     .hpd_enable = ti_sn_bridge_hpd_enable,
> > +     .hpd_disable = ti_sn_bridge_hpd_disable,
> >   };
> >
> >   static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
> > @@ -1322,7 +1349,8 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
> >                          ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
> >
> >       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
> > -             pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
> > +             pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT |
> > +                                 DRM_BRIDGE_OP_HPD;
> >
> >       drm_bridge_add(&pdata->bridge);
> >
> > @@ -1935,6 +1963,8 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
> >               return dev_err_probe(dev, PTR_ERR(pdata->refclk),
> >                                    "failed to get reference clock\n");
> >
> > +     pdata->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
> > +
> >       pm_runtime_enable(dev);
> >       pm_runtime_set_autosuspend_delay(pdata->dev, 500);
> >       pm_runtime_use_autosuspend(pdata->dev);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
