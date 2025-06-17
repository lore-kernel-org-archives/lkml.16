Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5E1CA6F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 00:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750119245; cv=none; b=rwXMM33/SwHjY1Gt/mCz1J68MpW4RjVj4Gx1HDY9vtY/O+sUnpddGLCU1jQgu2MLXd39Nz9QFyvaco33eIE9eBpm9RTTL3+6f5+P6aeeGXNoK9fzoMQZHLu8aQttbPDsPhFsibefCBFj3+g2X6khQOIRmCgBM4sb1ReA+1lRAKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750119245; c=relaxed/simple;
	bh=BCUpnu00PdYTBYe5/iMD4TN6t9Gob1BlHNTNi7fYXxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SaQboqGFdOVVF7kJ3o/qSxTGrxhg2hBc+wZz0jMNBGQq75tmjn2GdHNsOd8YCzoetuXi4dy2ZF+fDC4eUNz7Qi6ZoLUf5G1oD0lyfSLx3Z9/GxfUiyk7fiW6MXQRtHwLY5/SYNnW50IwoSTPsnF1it51qzlkYXENBPkKRveErGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jUKeohdZ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jUKeohdZ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-73972a54919so4415239b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 17:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750119243; x=1750724043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xPzkNisft+m84N4JYez02rZP6098OOb7aM1R5PhuhU=;
        b=jUKeohdZnZtmsL8mj/emMhk0SSdV9kK1WxVewPB9EnBFgyV4w76cO/HXfb2zeldY4p
         0zmSBWEzC6EzsASERu1MzG10/MQNyBr8M9OSbc4UC5xeWvK+sNGPMpYy9uoZfITZ2lmg
         pi86zvSAu3jxzArN8DplfNlapZjh/QHk+g0FE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750119243; x=1750724043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xPzkNisft+m84N4JYez02rZP6098OOb7aM1R5PhuhU=;
        b=WbP8pv1x+7aorEMWgEVpSxdAg2u0bT2nsQOIHazaKNtwkt1S1lPqR8cRcB/WSc/BP9
         Id/nQ/MrrCG5eKUGguH4G8k+ntxaxHcVvvl+PjoT0vcc21+VShuv6Z4WCbkgnb6ZixMz
         rFSxEX0EnESW99JOg+PpUqgLrfPgwjIUzF2gIHwVQ/pK/6ciKLp9bNGOD6qeGRMOg001
         5uvsMJg5/GvA8XtleOeuVXSqFOCyNTRlD65TJZerptRDuFB0qxI0lDN2d4iZvINvYPNJ
         NaRTtHT1mVCFkQFLrDQLBS5cd2nXJuIYGJz5aQOsrcJ1sP4F8OSbEmhPpfB59mLOM6YP
         TqBA==
X-Forwarded-Encrypted: i=1; AJvYcCWuKcH3/vlEXUS91+w9U4+pGOtxXX9PJmi5tFGia4va2ULv85U+ShxptRQz4m0jgCRIs05tguaZ3vqsOkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuxNaVPMo3/9KlV9MG0PF47hCD+tN7S9iA4r5owuJnpqhXcAE5
	+vh9jVNmMV1pzRZ6XkRR6LmNcU8Hs8iPc+780UKgxweC7pZ6A+2TOTfp863/rxZHHhN+y5livZQ
	nqkM=
X-Gm-Gg: ASbGnctk276MSd2UmiN36LlWtlpy8hFaxnmr9khBqx5HGr4TIhwIbpnVXr2pbwv4/we
	GLtmjCs3A5ZGLHs8+T6LmMhU24oqJqfo/vlnAfRArWfkirl3bpisapq2UcaDCJQo2yls6+MSgBt
	+1JC9A8LPTbT5KzmNmFwyT8TIK+2Hw+bTcPF3ftvhGIFdQZh58NbjzGfcOj1VQ5cHLHxA2yj9ZP
	VrBwk7alTOHwtneeQOQvGOCYtGSznKYzEHTR/AwYfGTIaU7k2WnqswAgqa/BTPzZnJdYJ+aW5OC
	YRNzM1YOSvlDe3hWtUNmAx+xMhNd8l3s+kS/OsPVtPx116MSTwRl+roL213lwXsaWXPleD7htgI
	Tx20bI7wE2YocA40L6pWVKt/Lhw==
X-Google-Smtp-Source: AGHT+IHopMeiysLHLUm2UwKFfaYh8XXUnm8+saAykHxh5tngdMDGPaNZWGzzmLKDKexkl8u4WP0aiA==
X-Received: by 2002:a05:6a00:848:b0:742:aecc:c472 with SMTP id d2e1a72fcca58-7489cf6ada7mr14771974b3a.2.1750119243132;
        Mon, 16 Jun 2025 17:14:03 -0700 (PDT)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com. [209.85.216.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900ad24csm7758236b3a.109.2025.06.16.17.14.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 17:14:02 -0700 (PDT)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-311ef4fb43dso4033587a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 17:14:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1gK4+XyeZOOfRK5MHHxYb4hykKcHe1bYcpe0IizHtF7d0ISSNkPOm3gYm0EQ+Ob/Jk8gu8GTlE09prCk=@vger.kernel.org
X-Received: by 2002:a17:90a:da8f:b0:311:ae39:3dad with SMTP id
 98e67ed59e1d1-313f1d05b32mr18262369a91.30.1750119242065; Mon, 16 Jun 2025
 17:14:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
 <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
 <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com> <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
In-Reply-To: <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 16 Jun 2025 17:13:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UOucHSqgGE_OfW9MAeLbwqtk1emCiByxJw-LpQnCbDww@mail.gmail.com>
X-Gm-Features: AX0GCFs2ZyAAIENHNjz3BASVq2N7KuTDsUG8ACNS6wvc-Dx4zSZzUpIgLa-Czmw
Message-ID: <CAD=FV=UOucHSqgGE_OfW9MAeLbwqtk1emCiByxJw-LpQnCbDww@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 9, 2025 at 8:43=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Mon, Jun 9, 2025 at 6:02=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.co=
m> wrote:
> >
> > On Tue 25 Feb 2025 at 08:04, Doug Anderson <dianders@chromium.org> wrot=
e:
> >
> > > Hi,
> > >
> > > On Tue, Feb 18, 2025 at 11:30=E2=80=AFAM Jerome Brunet <jbrunet@bayli=
bre.com> wrote:
> > >>
> > >> The auxiliary device creation of this driver is simple enough to
> > >> use the available auxiliary device creation helper.
> > >>
> > >> Use it and remove some boilerplate code.
> > >>
> > >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > >> ---
> > >>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 +++++-------------------=
-----------
> > >>  1 file changed, 7 insertions(+), 42 deletions(-)
> > >
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > >
> > > I'll snooze this for a bunch of weeks and check back to see if this
> > > can be landed in drm-misc-next every once in a while. If you notice
> > > that drm-misc-next has the necessary patches before I do then feel
> > > free to poke me and I'll commit it.
> >
> > Hi Doug,
> >
> > FYI, this is safe to take with v6.16-rc1.
> > Please let know in case you prefer a resend.
>
> Thanks for the reminder. Unfortunately, I still need to wait. This
> patch will need to land through drm-misc-next and that doesn't have
> v6.16-rc1 yet.
>
> https://cgit.freedesktop.org/drm/drm-misc/
>
> ...presumably v6.16-rc1 will get merged in before too much longer.
> I'll try to keep an eye on it.

Pushed to drm-misc-next:

[3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
      commit: 6526b02e10209608464f2645af59b2cc955b5a19
