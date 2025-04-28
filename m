Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B27111AD
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745874931; cv=none; b=c3qTR+LN5/tj9/TiHLRo6XVzf8DaY32JGt4vdUUvRj8E7UOpSBnIshcO8b1o0Bs3FLSxJBzNYrfOmEcwAdaMNHifJdq1ARWjcOfIFhsLexZXrYLEa7FG1Tap8r95UNbro7KqWPfnRVuQ0Jsp1nftZyLyBgBc6ta0WZS2F6RKcUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745874931; c=relaxed/simple;
	bh=8KOQPgIx5iLX94Vf3h+wdeh8fAqvL6vQXESoj0bi9KM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hUxHjTefowpS7e274Kn+H18z22Kca4INTGhrp5+s6z+5lAuCLfMCnbL8i91QpagFZneJq+YG9eG+o8NFHdChTViqD07ijaacT3Z7VeTZE6bAhh6pBTmYsEZorKLty4ACj/5cADGscV93XKGWEpcWCl1+EIAlegc/SHFQU+HJf1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a2thdrcD; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a2thdrcD"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-225477548e1so56288365ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745874928; x=1746479728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hanN27KZoqo0z82RNW8lpqnAS/vBC+tork2hH91F48I=;
        b=a2thdrcDyupeLV4vhDv2BbpjqbHaC0dNAWPIAFCF9/9c5KDbx/fTM+FWJ12xT4zqoa
         ZuW7mOfjsJcIHMDZtzmDryHRE84awSYG1TSoCmDtbCb8ZZOMB98K+qmUpo18qccIaQJC
         myu1W7LFSTLDyLDJk8c3cGQes6SNO8H09FSpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745874928; x=1746479728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hanN27KZoqo0z82RNW8lpqnAS/vBC+tork2hH91F48I=;
        b=IoqoCVRH0W9D17y+GIxNlamj3AuZO1hMjNccK+J8sejIxdibGzsocdJuZ0F2f05pa4
         I5bJLBpCnZS6beVyaMRYzScxMBWK2CZGenUcjF1VwPvhvnMC7ugeRTdSfXQS6JKHODrS
         AemzoBNHAl4qke6Mcd6xvE3YiwxJBcmGGBj+snSFPUqW+Y6Ut8nfvIOlyW7zfvm6qAGF
         N2lwUWp04d3pSFwV0j0UHkqC6eA3kgtsWsUCUy4AyKZFN9lSyS3yZtSFqT2OBgAeikJh
         zWXPaiFkqGLwheUTkat6bmn8cSM6GPXaQBShLry8K+OjEp6JAy6ADyh46SUbgIIc6WZq
         W4lg==
X-Forwarded-Encrypted: i=1; AJvYcCWSevXdiYNa7l2lZYiz16yqrRHXh/6Z4aKRQkamwbuYfA8/FWR85xJJ7YWFefNhTEqMi5B5dfGefACXAn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVzy6W9vDbpHpSRx6kvtjQ6cIxoTDGmv4yR+FgvVp+p0uAqgcl
	MNGr1B8cM7+HqcRvIdYBE8hwIaDeGJSJNoAkxF+cZrs93W4Gx5QO5yYpae5eWgv6j+HyJKk61/A
	=
X-Gm-Gg: ASbGncuFlXkpqfHVjo0w2saomqrwjBW1VoQf4N1AuTIdgdYu9qNkEdMw+eBrA7As5GW
	tSSyKI51LoSVpesvhoYIw3uqduAl3+NoNEjeM6b8dvpnZnIB5Doaxph/Nhyy+1oAxanvp2i0yJI
	JsyW75YwgBpvUfj3eJfO7bMg8s1q6LPpPbTPuudJNDfiObXe7n/vuY8gxh6p2JkPieADJETj2Ai
	jhLutS0P5x8MTHvEjcPLRQB9f/P6CCyCQE3vJqcVdkCojMYMiJIngzG9VPT9gREnZzkmF0F0VOp
	9DqPM90zTOfy4CJy4rgJiKEyolv/MIr1Lhq0KI6ZHwA58v0hvDjPvagYfAcH5DlWA9D6MvgjfM0
	mHOBu2LP7
X-Google-Smtp-Source: AGHT+IHNZ4lP/O/dmFxQiNjrS+n3rVQC5mqQhWq/m6cvQba50GQKst29EjUHeN3GePmqp+YMJK33SQ==
X-Received: by 2002:a17:902:db02:b0:223:fabd:4f99 with SMTP id d9443c01a7336-22de5ec17aamr16743355ad.5.1745874927890;
        Mon, 28 Apr 2025 14:15:27 -0700 (PDT)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com. [209.85.214.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dc7d5fsm87986915ad.103.2025.04.28.14.15.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 14:15:26 -0700 (PDT)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-225477548e1so56287905ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:15:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXcUtAt1tL3zX9oNnSnlV9sTb1qyF97QOMj98JrwFnAufL47cW79ttTs42F7j2JwJ+sYFIbL8PG3abPM4Q=@vger.kernel.org
X-Received: by 2002:a17:90b:3a44:b0:309:f67c:aa8a with SMTP id
 98e67ed59e1d1-30a21546738mr1846179a91.5.1745874925916; Mon, 28 Apr 2025
 14:15:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424105432.255309-1-j-choudhary@ti.com> <3f44ec0b-216c-4534-a6de-7b17929cb9e1@ti.com>
In-Reply-To: <3f44ec0b-216c-4534-a6de-7b17929cb9e1@ti.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 14:15:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WytPZCF-jcWFgXoAOoXOV61bw2_ftJbdbWZviHQqap5w@mail.gmail.com>
X-Gm-Features: ATxdqUFuySNI3rOAaMe62mEHPq2JIyed3obe4-5b7857UFDyYpkL2fq2SDRRguQ
Message-ID: <CAD=FV=WytPZCF-jcWFgXoAOoXOV61bw2_ftJbdbWZviHQqap5w@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/bridge: ti-sn65dsi86: Enable HPD functionality
To: "Kumar, Udit" <u-kumar1@ti.com>
Cc: Jayesh Choudhary <j-choudhary@ti.com>, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
	dri-devel@lists.freedesktop.org, tomi.valkeinen@ideasonboard.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 24, 2025 at 6:32=E2=80=AFPM Kumar, Udit <u-kumar1@ti.com> wrote=
:
>
> Hello Jayesh,
>
> On 4/24/2025 4:24 PM, Jayesh Choudhary wrote:
> > For TI SoC J784S4, the display pipeline looks like:
> > TIDSS -> CDNS-DSI -> SN65DSI86 -> DisplayConnector -> DisplaySink
> > This requires HPD to detect connection form the connector.
> > By default, the HPD is disabled for eDP. So enable it conditionally
> > based on a new flag 'keep-hpd' as mentioned in the comments in the
> > driver.
> >
> > Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> > ---
> >
> > Hello All,
> >
> > Sending this RFC patch to get some thoughts on hpd for sn65dsi86.
> >
> > Now that we have a usecase for hpd in sn65dsi86, I wanted to get
> > some comments on this approach to "NOT DISABLE" hpd in the bridge.
> > As the driver considers the eDP case, it disables hpd by default.
> > So I have added another property in the binding for keeping hpd
> > functionality (the name used is still debatable) and used it in
> > the driver.
> >
> > Is this approach okay?
> > Also should this have a "Fixes" tag?
>
> >
> >   .../bindings/display/bridge/ti,sn65dsi86.yaml      |  6 ++++++
> >   drivers/gpu/drm/bridge/ti-sn65dsi86.c              | 14 +++++++++----=
-
> >   2 files changed, 15 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65ds=
i86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.ya=
ml
> > index c93878b6d718..5948be612849 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yam=
l
> > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yam=
l
> > @@ -34,6 +34,12 @@ properties:
> >         Set if the HPD line on the bridge isn't hooked up to anything o=
r is
> >         otherwise unusable.
> >
> > +  keep-hpd:
> > +    type: boolean
> > +    description:
> > +      HPD is disabled in the bridge by default. Set it if HPD line mak=
es
> > +      sense and is used.
> > +
>
> Here are my suggestions
>
> 1) use interrupt in binding as optional instead of keep-hpd
>
> 2) use interrupt field (if present to enable of disable HPD functions in
> driver)

Officially we've already got a "no-hpd" specified in the device tree.
You're supposed to be specifying this if HPD isn't hooked up. It would
be best if we could use that property if possible. If we think that
using the lack of "no-hpd" will break someone then we should be
explicit about that.

I'd also note that unless you've figured out a way to turn off the
awful debouncing that ti-sn65dsi86 does on HPD that using HPD (at
least for initial panel power on) only really makes sense for when
we're using ti-sn65dsi86 in "DP" mode. For initial eDP panel poweron
it was almost always faster to just wait the maximum delay of the
panel than to wait for ti-sn65dsi86 to finally report that HPD was
asserted.

I could also note that it's possible to use the ti-sn65dsi86's "HPD"
detection even if the interrupt isn't hooked up, so I don't totally
agree with Udit's suggestion.

I guess the summary of my thoughts then: If you want to enable HPD for
eDP, please explain why in the commit message. Are you using this to
detect "panel interrupt"? Somehow using it for PSR? Using it during
panel power on? If using it for panel power on, have you confirmed
that this has a benefit compared to using the panel's maximum delay?

-Doug
