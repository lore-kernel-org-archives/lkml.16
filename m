Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE70246BAC
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749572558; cv=none; b=fmHLmtxla++ZQPSzhASKSW7qxYOcnVAg+J0FNOfaNipm/hCsZD5fyJEwO8OmoWOCeoHmh63OIoaE+uFu4W/tIP6SVpYRVIYJaIdq4EWykCogS5dYLqbJGaUrXhB/cLrIhGQp/H0h1b3N97nBgtb51DYJFpStRK1VDIdNCEo1xks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749572558; c=relaxed/simple;
	bh=DKz1wqUdrKSC5vIdrUnkzDi63WgqPFdh61ZjYbPXjmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W/pA2wqhK+JBzxMixXoHHYoBWErYToKsVJyHcye67h1n7vBcqE/oOAoSMyEDQeAqvzV4hptuH3mhopHfvHEOBHPcSvX/sE4aSqSkpD/Bd0TExrTM0mg8BiUSLXnJVkV+kvJz4niG9+0k/yu2PHIwIXXWzOjvkK095xgLLF5XlNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=avuOipTi; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="avuOipTi"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-742c7a52e97so4875862b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749572555; x=1750177355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MkV/lIBNtXhNBujMG9Z7i6F6IxQ5xfqe1rAYT6Q4Xc=;
        b=avuOipTigdJHPfVXKFMwjlajrx3dGW79ql02viEsgQWue3WrPM6Y/al5l4GxtrXBT4
         a6PNyImK8+FkpgvwoVYr7lChSMIPyHX1Rpl/rt2FG5MIvm7gt/wR4+LG7b7WJiJV0PN/
         c3kwDj8ybGDxE8gGrxdwR4YgJoRb5CpNEAgGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749572555; x=1750177355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+MkV/lIBNtXhNBujMG9Z7i6F6IxQ5xfqe1rAYT6Q4Xc=;
        b=hWMAJgNdNh/5GuOTbWNvJRRSa54TO8c7cDTha9yTn2vUiCvrE86ZdEwQRy/k0bwg+D
         86k2JPfBcYx3JHP91XNTsSVA8wS4tO+x+72f17GCoYqsQplLTf2Da+wxoZUr2lJidiBg
         96SDieHdgY40fyZydVfWEMcXNsy2mk/UJF/Ru5b8nckpVa31da16Vze1DwT7v50QArnj
         CpU8/RzVRjHZt9YBI2jt/rXJIeveWmK6WTnMU8veY1A5fIyGx8jUjDnEpW6mHtkD8ZZd
         5GyyWVZVnSkaX8aGgZ7sD1ydUcILGFUKiYHAdvTlnh2KUO3Rp8qvY/E1XMZNo83mj5No
         LdHw==
X-Forwarded-Encrypted: i=1; AJvYcCXjPfIK6mX+GKF5+0jG98+5se9jMZ5VOGYdHXCEYZ2NR1LfhGa19xHiIwkUF+OuMtNyP94TMkCe6BNNuQY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+hwgMn1lM/z+q+FrVJFx/KTwM831WP7q+TI+yHxoh97QN26O2
	56h3w+eQoc/SqEbReGLU/zuxljmylko3xpNm2NFswiVr/l/7NG2YIsbpnu1nDjhe0uQOs7T5cu5
	L0zTp5w==
X-Gm-Gg: ASbGncsVCpkN3TCkBi5/9J2I1I8+PQ1Ce1V2Fg0tYE0jJ7/eG7n8kduuOjQyRhTkb6O
	VZ+kPkfzG4u7+Adbix7g1db5T5TIcy/YPRm2DsTjHeyu14UsI2SrqUWf7JOHjxj46Tdi9B2/761
	j6TKaJbadxRYrVhy9911pg3F7TRsukLLuv5Fm3aJKMmubpDEeVV0ba5w8S4IK8JbgyL2l94it/y
	s8IbwV8WNggJIslWSbCTNkEvBxyboILMJPQkZsGRS8o0XyXathlsxD2PEr7FAgQYV3ndAZ+KUW5
	TBBU4AUuws6SkdGP1U85EVf2kMTTaPC24XRkbmcO7IcfezZ8LyHsV1VsYPE/0Th8nqrtWqrOVIG
	UBHKBZ0Wuiv7ae+a0kY2ktNuvwJewFXFygPMu
X-Google-Smtp-Source: AGHT+IE7oszkkx9rJleUw5A88gDWoGnp0oj8z4Z8+luV+xHaZycleOl/Ewz1dpFs77E1ySMjvIWZSg==
X-Received: by 2002:a05:6a21:4a4b:b0:21f:5aa1:3102 with SMTP id adf61e73a8af0-21f867582dcmr294428637.37.1749572554643;
        Tue, 10 Jun 2025 09:22:34 -0700 (PDT)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com. [209.85.216.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ed58e9bsm7056933a12.10.2025.06.10.09.22.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 09:22:33 -0700 (PDT)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-311c95ddfb5so3955535a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:22:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVgvZ25zdR9zm8FXDVO70q9ChEuqbq8WL4cL1aKTzew5IKXWqO+PA8fTl9s7fEyiZUPYQMvjOAdWvhM/gQ=@vger.kernel.org
X-Received: by 2002:a17:90b:2ecb:b0:311:c1ec:7d03 with SMTP id
 98e67ed59e1d1-313af213ad2mr200487a91.32.1749572552155; Tue, 10 Jun 2025
 09:22:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529110418.481756-1-j-choudhary@ti.com> <2baf3c31-3edf-4c26-bd44-1d0560134871@ti.com>
 <CAMuHMdUi7pf1YfKRjMv_7VuKwjR5XekRXfcEzuPScGzHraGjyQ@mail.gmail.com>
 <84fdbd23-d694-453f-a225-dbac19b34719@ti.com> <CAD=FV=XaR6Pq7E-13zR5PC_u=3SD=sc05_TzxWJR2FS040zESg@mail.gmail.com>
 <71c41c44-1c2e-4fee-a1a8-31472c9f838d@ti.com>
In-Reply-To: <71c41c44-1c2e-4fee-a1a8-31472c9f838d@ti.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Jun 2025 09:22:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X2npwru2=2XYpzbvMTc-jFAGzG3xVDRuCp1_D=QoRWcQ@mail.gmail.com>
X-Gm-Features: AX0GCFvFpx0zG4Qs1kd0_XBriaPr08VtGCdfFDF-WmL85SRtc32MwKBnYrqm0zE
Message-ID: <CAD=FV=X2npwru2=2XYpzbvMTc-jFAGzG3xVDRuCp1_D=QoRWcQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: ernestvanhoecke@gmail.com, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
	dri-devel@lists.freedesktop.org, tomi.valkeinen@ideasonboard.com, 
	max.krummenacher@toradex.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, kieran.bingham+renesas@ideasonboard.com, 
	linux-kernel@vger.kernel.org, max.oss.09@gmail.com, devarsht@ti.com, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 10, 2025 at 12:43=E2=80=AFAM Jayesh Choudhary <j-choudhary@ti.c=
om> wrote:
>
> Hello Doug,
>
> On 10/06/25 03:39, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Jun 2, 2025 at 4:05=E2=80=AFAM Jayesh Choudhary <j-choudhary@ti=
.com> wrote:
> >>
> >> Hello Geert, Krzysztof,
> >>
> >> (continuing discussion from both patches on this thread...)
> >>
> >> On 30/05/25 13:25, Geert Uytterhoeven wrote:
> >>> Hi Jayesh,
> >>>
> >>> CC devicetree
> >>>
> >>> On Fri, 30 May 2025 at 04:54, Jayesh Choudhary <j-choudhary@ti.com> w=
rote:
> >>>> On 29/05/25 16:34, Jayesh Choudhary wrote:
> >>>>> By default, HPD was disabled on SN65DSI86 bridge. When the driver w=
as
> >>>>> added (commit "a095f15c00e27"), the HPD_DISABLE bit was set in pre-=
enable
> >>>>> call which was moved to other function calls subsequently.
> >>>>> Later on, commit "c312b0df3b13" added detect utility for DP mode. B=
ut with
> >>>>> HPD_DISABLE bit set, all the HPD events are disabled[0] and the deb=
ounced
> >>>>> state always return 1 (always connected state).
> >>>>>
> >>>>> Set HPD_DISABLE bit conditionally based on "no-hpd" property.
> >>>>> Since the HPD_STATE is reflected correctly only after waiting for d=
ebounce
> >>>>> time (~100-400ms) and adding this delay in detect() is not feasible
> >>>>> owing to the performace impact (glitches and frame drop), remove ru=
ntime
> >>>>> calls in detect() and add hpd_enable()/disable() bridge hooks with =
runtime
> >>>>> calls, to detect hpd properly without any delay.
> >>>>>
> >>>>> [0]: <https://www.ti.com/lit/gpn/SN65DSI86> (Pg. 32)
> >>>>>
> >>>>> Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge co=
nnector operations for DP")
> >>>>> Cc: Max Krummenacher <max.krummenacher@toradex.com>
> >>>>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> >>>>> ---
> >>>>>
> >>>>> Changelog v2->v3:
> >>>>> - Change conditional based on no-hpd property to address [1]
> >>>>> - Remove runtime calls in detect() with appropriate comments
> >>>>> - Add hpd_enable() and hpd_disable() in drm_bridge_funcs
> >>>>> - Not picking up "Tested-by" tag as there are new changes
> >>>>>
> >>>>> v2 patch link:
> >>>>> <https://lore.kernel.org/all/20250508115433.449102-1-j-choudhary@ti=
.com/>
> >>>>>
> >>>>> [1]: <https://lore.kernel.org/all/mwh35anw57d6nvre3sguetzq3miu4kd43=
rokegvul7fk266lys@5h2euthpk7vq/>
> >>>
> >>> Thanks for your patch!
> >>>
> >>>>> This would also require dts changes in all the nodes of sn65dsi86
> >>>>> to ensure that they have no-hpd property.
> >>>>
> >>>> DTS patch is posted now:
> >>>> <https://lore.kernel.org/all/20250529112423.484232-1-j-choudhary@ti.=
com/>
> >>>
> >>> On all Renesas platforms handled by that patch, the DP bridge's HPD p=
in
> >>> is wired to the HPD pin on the mini-DP connector.  What am I missing?
> >>
> >> If the bridge's HPD is connected to that of the connector, then I am
> >> pretty certain HPD will not work for renesas platform. The detect hook
> >> always gives "connected" state in the driver (even if it is unplugged)=
.
> >> Do you have different observation on your end?
> >> If not, then we do need something like this patch while addressing the
> >> backwards-compatibility concerns.
> >>
> >> During v1 RFC[2], I did observe that renesas also have DisplayPort
> >> connector type and might require hpd, but since the support was
> >> already there and no issue was raised, I assumed it does not require
> >> HPD.
> >>
> >> [2]:
> >> https://lore.kernel.org/all/01b43a16-cffa-457f-a2e1-87dd27869d18@ti.co=
m/
> >>
> >>
> >>>
> >>> Regardless, breaking backwards-compatibility with existing DTBs is
> >>> definitely a no-go.
> >
> > FWIW, we are in a little bit of a sticky situation here. We were in a
> > bit of a bad place from the start because the Linux driver ignored HPD
> > from the beginning but we didn't actually document that people should
> > be setting the "no-hpd" property until a little bit later. You can see
> > some discussion about this in commit 1dbc979172af ("dt-bindings:
> > drm/bridge: ti-sn65dsi86: Document no-hpd") where I noted "this is
> > somewhat of a backward-incompatible change." ...but, at the time, it
> > wasn't really a big deal because there were very few users (the one in
> > tree at the time was cheza, which was a dev board used internally at
> > Google).
> >
> > ...so, as of that change in May of 2020, it was documented that eDP
> > users were _supposed_ to be setting NO_HPD. I even remember Bjorn
> > requesting the "or is otherwise unusable" phrasing because we pretty
> > much wanted to set this property on everyone using sn65dsi86 as eDP
> > (even if they have HPD hooked up) because the debouncing time is so
> > long that it was better to hardcode the max delay instead of reading
> > the HPD line. Of course, even though we documented that they were
> > supposed to have the "no-hpd" property didn't necessarily mean that
> > everyone did. The code has never enforced it. I don't believe it even
> > checks the property...
> >
> > So if there are dts files out there that don't set the property and
> > they were submitted after the bindings change in 2020, _technically_
> > they've been wrong the whole time. We're not changing history by
> > adding a new requirement so much as fixing broken DTS files. Although
> > the Linux driver always allowed them to get away with being broken,
> > technically DTS is separate from Linux so if they've been violating
> > the bindings then they've been wrong. :-P That being said, they've
> > been working and it would be nice to keep them working if we can, but
> > one could make an argument that maybe it would be OK to require them
> > to change...
> >
> >
> >> Got it.
> >> Let me try to figure out a way to fix it without messing it up.
> >
> > While a bit on the ugly side, it seems like perhaps you could just do t=
his:
> >
> > 1. If enable_comms is called before the bridge probe happens, just go
> > ahead and disable HPD.
> >
> > 2. When the bridge probe happens, if you notice that HPD should be
> > enabled and comms are on you can just enable HPD then (grabbing the
> > comms_mutex while doing it).
> >
> > 3. Any subsequent enable_comms called after the bridge probe happens
> > shouldn't disable HPD.
> >
> > ...you'd probably want a comment about the fact that "no-hpd" property
> > is unreliable, which is why we can't figure this out in a better way.
> >
> >
>
>
> Ernest mentioned in v2[3] that when pdata->bridge.type is not
> set, the type field is 0 causing issue for eDP when enable_comms
> is called before auxiliary_driver probe.
>
> So it should be okay to check the bridge type for
> DRM_MODE_CONNECTOR_Unknown (0) OR DRM_MODE_CONNECTOR_eDP (14) and
> disable HPD in both case?
> Or equivalently using !(DRM_MODE_CONNECTOR_DisplayPort) as this bridge
> would support only these 2 connector types???

Yeah, I'd check for "not displayport".


> Then for DP case, it should behave like you mentioned: First disabling
> HPD till types is set in auxiliary_driver probe. And once set to 10,
> (for DRM_MODE_CONNECTOR_DisplayPort) enabling it for DisplayPort
> connector type.

Sounds reasonable to me.

-Doug
