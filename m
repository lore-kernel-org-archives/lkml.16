Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F0B1E47B3;
	Mon, 16 Jun 2025 06:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750056192; cv=none; b=faEgNIE5NP2GLG8I+TNzNf5OLgwvVgHYEI+kjXnunkNgNn7BZd7bduEorImjpf6An4j8hd87ZrVkAyFsww8xjeSIYUbtzdashontKBV9SwSKcjf9i3sGRQPC04RVMNS8regd+nJB86RSt39sLaWZ5Vks+ZQ8WvgpE4ivIVC0okA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750056192; c=relaxed/simple;
	bh=OlsHUGq2O2ieQsD/aOKfW7ocz12uFu7mwwXmelDHk5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iSforKU8tuV3hKxc4cFg21AwrscEhS2djcJEtEy4WBwjL72OLKX0C5nxmQNqyxi8KpaxOGMPqNdwJ3ZBipmwAQFb2MBjeRLtT79Yfd3QnryvJRVRlWqdswjJx6aQN9hDO6MYlNwlIwnmbJAhfjHuvQjXeAYl7owdf9OlffcG8xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adnQ52HF; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adnQ52HF"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so26409855e9.2;
        Sun, 15 Jun 2025 23:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750056189; x=1750660989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxVFKfNvM2BqAgB6j79WL0EsmcX/ySBTZGTfRt9FrXo=;
        b=adnQ52HFqgOQ5gxbeVd5bQAisujwNAjdNLj87f2ghuGCagYAvx5RPhT62mFl1cKMGT
         XpNqzhfi6sm9q6TAUtl9Z9ycFTnnwMM5I79TzMMuIAkqOeQlmOvw07woQucbfQ4HKLPH
         RkzZ7gqOlXuZEO3EjGROHvSLeBTpgWwQcfKax4BborjivtcDwYukxq/wmpH2DQul5OAy
         bkludpJa9Uf2+1wyoZ5f+CS6qMdjzH5andjAZjB5gbDC+aYXktWiKQZ72jei9rZGFRJi
         pM46jqb4PbRg/q6tT1IQdkw+G/iZvtIB5l94Tz7YwEUR3kao1rHixYtuAkuKZMc++L2C
         2LRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750056189; x=1750660989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UxVFKfNvM2BqAgB6j79WL0EsmcX/ySBTZGTfRt9FrXo=;
        b=uCqUsK8XiIXbqtgTzSoxotApkw7j8/piOlXxmHsDg5CJ64JZ5oVozbFX9Ey4B5vCYv
         6sd/LzptCd+Lrw/1G6qZtoOe8Oum8MqtiT7OVqTM+Cn9hVIK69lfJREqeVWKaOL/BESq
         zlHoL9g1fr2yBZvnuCeKSlTPKdCLw4XSJ7hRLwyw/GwZ4gcQ//ytZjqNbfNukayjeu01
         7r6X0TjpJnAzHNFinHWB4mOv3OKQak+zT6mUa+Birl2ypYmetipRw6mYaz9Q0KSFBNm+
         dhNEtuBM4St9rX69zRMjGtfTlCRHCU2hi0BqUWXvRK0TakhOlMY8LuIE0RkqMb4Hyyqv
         cciA==
X-Forwarded-Encrypted: i=1; AJvYcCXE++CEOQUesLvtnXPj5+Jk0p9AXLJSglda/3KnezcgUnsZuhG731psF8Tm7ngYPtUMpEDFeJas82p0@vger.kernel.org, AJvYcCXZI96D6ylrByAo3ESlfosjqUewHUjN65kdP2pPXG4OnTyBoBDXxm1BeFh0UhqtZkX2ILOCrIJ5fdK612Cd@vger.kernel.org
X-Gm-Message-State: AOJu0YzEwuu3bLnsK9hxGt+Tse1nN+yne0Q1L6LugSTN6tTYwrEMValp
	Sve2jVajfNIkhyEc1fqU6Knl/yCmuHQ0OLNqjBOJWVbiHFBf8kj1BT9Jt4T2btUFGGAmzEe1p5n
	KP2u3s1FgEaJ8i+DMQ2/nRpYZgWJGkC3IKgWh
X-Gm-Gg: ASbGncsuLeNGPvMc5iL+GyEs4QlE2zwWbAjBTMMDOI+4XIHQxA9qH95k5HmS6mo9mCx
	q4Hj+CNwLVUnpGQOBrWXl/3CT7CSOlhphs5nE8Xmr5FZM8hdVne4lxFpGZ0G+T3goHL47oj/Uay
	gVf0v/Yv47J4zTJGZjVpoXHV6HlR8DL5YNGNz0F24ZQ4zp
X-Google-Smtp-Source: AGHT+IEwlB4QUQeFMOPwl01laMzufAmY822smlnWFy3hy01YA2cBmDYgFTBipsnFP9vE8aGnDCq2ZR+CAREFF5BJtDM=
X-Received: by 2002:a05:6000:2010:b0:3a4:f70d:8673 with SMTP id
 ffacd0b85a97d-3a57237dc6cmr6965969f8f.25.1750056188970; Sun, 15 Jun 2025
 23:43:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303120455.90156-1-clamor95@gmail.com> <CAPVz0n0XSzxzkPocRVx6QF7xwmA4otSeSEiRZgJQ3oStyUBrLA@mail.gmail.com>
In-Reply-To: <CAPVz0n0XSzxzkPocRVx6QF7xwmA4otSeSEiRZgJQ3oStyUBrLA@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 16 Jun 2025 09:42:56 +0300
X-Gm-Features: AX0GCFuN9A6nBmialOiDeiAg-dzMMc_1kxFppc1ouGvrqvHbGHQHd0TyVB9y9Jk
Message-ID: <CAPVz0n2MLmHfVNb25=o1_woE7v16hoamwFbbT3ecE+BP1Bn9aw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm: bridge: add support for Triple 10-BIT
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Maxim Schwalm <maxim.schwalm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D0=B1, 3 =D1=82=D1=80=D0=B0=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 12:50=
 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D0=BF=D0=BD, 3 =D0=B1=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 14:05 Svy=
atoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > Triple 10-BIT LVDS Transmitter is used in Microsoft Surface RT and
> > MStar TSUMU88ADT3-LF-1 HDMI bridge is used in ASUS Transformer AiO
> > P1801-T.
> >
> > ---
> > Changes on switching from v2 to v3:
> > - place mstar,tsumu88adt3-lf-1 alphabetically
> > - fix typos
> >
> > Changes on switching from v1 to v2:
> > - sort compatible alphabetically in schema
> > ---
> >
> > David Heidelberg (1):
> >   dt-bindings: display: extend the LVDS codec with Triple 10-BIT LVDS
> >     Transmitter
> >
> > Maxim Schwalm (1):
> >   drm/bridge: simple-bridge: Add support for MStar TSUMU88ADT3-LF-1
> >
> > Svyatoslav Ryhel (1):
> >   dt-bindings: display: extend the simple bridge with MStar
> >     TSUMU88ADT3-LF-1
> >
> >  .../devicetree/bindings/display/bridge/lvds-codec.yaml       | 1 +
> >  .../devicetree/bindings/display/bridge/simple-bridge.yaml    | 1 +
> >  drivers/gpu/drm/bridge/simple-bridge.c                       | 5 +++++
> >  3 files changed, 7 insertions(+)
> >
> > --
> > 2.43.0
> >
>
> These patches had no activity/feedback from maintainers for a while,
> so, in case they got lost in the depths of email box, this is a
> friendly reminder that they are still relevant and I would like them
> to move on.
>
> Best regards,
> Svyatoslav R.

These patches had no activity/feedback from maintainers for a while,
so, in case they got lost in the depths of email box, this is a
friendly reminder that they are still relevant and I would like them
to move on.

Best regards,
Svyatoslav R.
