Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51D527A91F
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748360464; cv=none; b=oTesVLTCm/QHF/LFzMcAjbPVB1FCTNx5YrlojsmaMgKKiZhTrVkp2YTExo+0mfcTqEjT1a92Jpe/HT2lY8/DergR3J+CjsyCuhK+Lm3UZa6cg1jRd4ubpaJxsLu5t/1FgC7WYFzq/NmO/4cdUtN7zwl4y+ihDZ98qV9r1n2vBTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748360464; c=relaxed/simple;
	bh=vQ3QVNkPOZTAiUL/JR4v0Jl56aEHncKyH8WIy0rWZVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GqtTNB2TR1jDT6QMMLD1s9qWYaIoGV7njhc6eG4d38lDg1jNr9LromcqRkfRdk6DvTvQHFcSh85P38fDY1vLlXYOzMMIb7RLsXNujEMjFgPGPf76ourLfQGx4+/Ajv6pf37pj9SoN0hHGghy/nweIKkcfRdN//NOyHD2GOIk02U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NC6+BIv9; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NC6+BIv9"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-232059c0b50so29774725ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748360462; x=1748965262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeydDyU8ewlBXPi1n8ex9WFeBrnGziCIRQQWhLDa9Ek=;
        b=NC6+BIv95vfqbZ5TdPpX4k12WGP/mz7JgktMGOzVgwDOxR1RT7vngO4UpYbm8fWqXS
         Wtfat8MkNfbv90ls32VI+W3w0FLwCZDDioNBe/z9c5rpACRHeWzfd2p1mDG7lapdFGTh
         6uQthTuFakOxDVVFW/GlW4pH5KFQvI3RDK+vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748360462; x=1748965262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XeydDyU8ewlBXPi1n8ex9WFeBrnGziCIRQQWhLDa9Ek=;
        b=McTT/8itlZXuUceOIvcYHmdanHd2ApcvZ3h52H1fOXf0X6qujioayieBr4irKW45G+
         IB7U9Zd0pf04JRhOeAYDF/K/FQ6LQ60PUrZLLNPpD7ndEOM5cH0YlYScguZ4EeC1qcIe
         6DgQEP7+yYcd7iEubv7iENWcpMc/auzJpDCCPvub9WPWOu3VjSzIhdWJK5KPYu0sniPj
         g9UKen9MvhjrZ9PHt56L3YyGf07cO9amr7WtKwlpp7oOHLcHSpxVPFk6j9j6PCvmY2sK
         RnKGlEXG8wYTSfjfo3J2LBrIQLdQBBesOLu4Pa0ROytAXHuMvWrZS5E9+04vDirCHV+o
         D6lw==
X-Forwarded-Encrypted: i=1; AJvYcCVgqy6mTQfd/DG/g6iDYKyTQTmXhh6UJKZnWfWaLKYUn1L/KMHGnStL3hw18aWPVFdwUIMxW01eqbPIHfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPOiQiGnurUNLi6pB43XH2MYAd2YAMdMy5HfYjmgcNzCLXA4hU
	8V6UQTVbahCizaoa+UgQKJUb9c01ldeQFE5Utw+PY0Ti9RRQsTY3Zp4/zZ0RgHOYkHC826jIaK4
	qjWc=
X-Gm-Gg: ASbGncuIiCwlX1ox4f4jmdplNYEG10nJpett6X8LfRjzyThm//fEqOn+zEX58ttiHmp
	XRacmXvc47vh7EfdKXgnjODbygUtVvS43sowmZ0tQFMuAiTzVD4dRWzqXy5pPl661vrAxcoYCmW
	pZSfmDW4kcQzy18LV0Qxd18fj1etIYymnhDrheEN0TtM1NOENwWa4X/5XOz8NvsCi0B9T3iRPH9
	UpPUY/hVDLC/cEyOjOtK1rf2iv24pChZin1GMlrJi7jSPZxjZpxrpnVfSdSnFJom5g1N9HTRgLj
	uebobzeirWcMVHzeWJgnhyat45x7pRlV+ZyACSWlCyAS1U98QWeLED7x9dpuol8bMAwfWxwW3rJ
	s/zYoo9ahbSMCGTQ=
X-Google-Smtp-Source: AGHT+IFJsNq8G24cQzMIONIq9v9uD5942vic9XWcl4JK39UF6pYJxJRh+6XSaUM4zvOenxs0MGBekQ==
X-Received: by 2002:a17:902:d2d1:b0:22f:a932:5374 with SMTP id d9443c01a7336-23414fc9852mr238435375ad.48.1748360462198;
        Tue, 27 May 2025 08:41:02 -0700 (PDT)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com. [209.85.216.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2349dcc64f3sm14759345ad.3.2025.05.27.08.41.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 08:41:02 -0700 (PDT)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-311374f95b8so2157266a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:41:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXSqPHYL0tCLOu8xK4JONVrKMFnuauUdSwyuZUe1onvJu3iScduSgfmVd9SIds8ANiynLcmnL+yJT5XUQU=@vger.kernel.org
X-Received: by 2002:a17:90b:3ec6:b0:30a:4700:ca91 with SMTP id
 98e67ed59e1d1-3110f31c2ebmr18375340a91.1.1748360461082; Tue, 27 May 2025
 08:41:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508115433.449102-1-j-choudhary@ti.com> <CAD=FV=V1mNX-WidTAaENH66-2ExN=F_ovuX818uQGfc+Gsym1Q@mail.gmail.com>
 <cr7int6r6lnpgdyvhhqccccuyrh7ltw5qzh7kj5upznhea4pfh@rn6rwlf7ynqt>
In-Reply-To: <cr7int6r6lnpgdyvhhqccccuyrh7ltw5qzh7kj5upznhea4pfh@rn6rwlf7ynqt>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 27 May 2025 08:40:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WeY+7rkf+61TEv2=O_QEufQ+-6JWLnNnVq4YC_vPRZUQ@mail.gmail.com>
X-Gm-Features: AX0GCFu6oHYgEYO-UX_wnBKECT_7Fwxez_Qo8ePpiYfVvnR_WniA6Ewzh05Szp0
Message-ID: <CAD=FV=WeY+7rkf+61TEv2=O_QEufQ+-6JWLnNnVq4YC_vPRZUQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jayesh Choudhary <j-choudhary@ti.com>, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
	dri-devel@lists.freedesktop.org, tomi.valkeinen@ideasonboard.com, 
	max.krummenacher@toradex.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, kieran.bingham+renesas@ideasonboard.com, 
	linux-kernel@vger.kernel.org, max.oss.09@gmail.com, devarsht@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 22, 2025 at 6:14=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> > > @@ -1194,13 +1196,14 @@ static enum drm_connector_status ti_sn_bridge=
_detect(struct drm_bridge *bridge)
> > >  {
> > >         struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge)=
;
> > >         int val =3D 0;
> > > +       u8 link_status[DP_LINK_STATUS_SIZE];
> > >
> > > -       pm_runtime_get_sync(pdata->dev);
> > > -       regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
> > > -       pm_runtime_put_autosuspend(pdata->dev);
> > > +       val =3D drm_dp_dpcd_read_link_status(&pdata->aux, link_status=
);
> > >
> > > -       return val & HPD_DEBOUNCED_STATE ? connector_status_connected
> > > -                                        : connector_status_disconnec=
ted;
> > > +       if (val < 0)
> > > +               return connector_status_disconnected;
> > > +       else
> > > +               return connector_status_connected;
> >
> > I'd really rather not do this. It took me a little while to realize
> > why this was working and also not being slow like your 400ms delay
> > was. I believe that each time you do the AUX transfer it grabs a
> > pm_runtime reference and then puts it with "autosuspend". Then you're
> > relying on the fact that detect is called often enough so that the
> > autosuspend doesn't actually hit so the next time your function runs
> > then it's fast. Is that accurate?
> >
> > I'd rather see something like this in the bridge's probe (untested)
> >
> >   if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_DisplayPort) {
> >     pdata->bridge.ops =3D DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
> >
> >     /*
> >      * In order for DRM_BRIDGE_OP_DETECT to work in a reasonable
> >      * way we need to keep the bridge powered on all the time.
> >      * The bridge takes hundreds of milliseconds to debounce HPD
> >      * and we simply can't wait that amount of time in every call
> >      * to detect.
> >      */
> >     pm_runtime_get_sync(pdata->dev);
> >   }
> >
> > ...obviously you'd also need to find the right times to undo this in
> > error handling and in remove.
>
> What about:
> - keeping pm_runtime_get()/put_autosuspend() in detect, but..

I guess? The problem is that if the calls in pm_runtime_get() actually
cause the device to be resumed then detect() will not actually work.
The chip simply won't report HPD right after being powered on because
it needs the debouncing time. ...so having the calls there is
misleading. Instead, I'd rather have a comment in there about why we
_don't_ have the pm_runtime_get() calls there...


> - also adding .hpd_enable() / .hpd_disable() callbacks which would also
>   get and put the runtime PM, making sure that there is no additional
>   delay in .detect()?

Sounds reasonable to me and sounds like it works.
