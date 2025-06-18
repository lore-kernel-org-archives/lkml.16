Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AA42E54B8
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249274; cv=none; b=C9+y2deP+X9zBEU+WpG9z+BV44UdgqpsDHwnkKBemUp6wDMGck7nJtbN/pMw4jG5Pdsymh3gXXFfwg0uwT5OUUdbrcnykJ6Hx4UwOZiauMZid5XVEl7JFBbRhEBJ3ENqikcoz1gwoXm0jXr1el7aPYvbSBdbhIFagSOpLdpRlro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249274; c=relaxed/simple;
	bh=b6LBHyIi5e1ZGbbaIWqJEeHGDHa8TD6jbCAi8i0g/oY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Or1FZu+E3AD7ILlULLTSbowYsAOto5j2WFUexLrQA2Ca8H5IiV6JCpFmqF1SCqi9pzjlnNWkLLyZtUfGK3Q90HxWoVbPqUVdNignyLQM+9NxL2kRmELAvByLuHUWmok82tuN8WDNRx7CNlGmFmXKd8HRrD4PjztvP3+6tu0Af54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yQsDrIXy; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yQsDrIXy"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b43cce9efso45092401fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750249270; x=1750854070; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n761KcazBD8NAVChuciBYR6i+PEWOHat/DvKkhEEUwg=;
        b=yQsDrIXyB7G4LkpsrIocLZHLpqLQw2RFg4qrElRaDYVM2OkHKw5q+z9Wn96k7IVpre
         SZMMquQhjW9CxaXDy+BwvgtpucdsKr6yE9SoQNya1ziolqNT7CjbPOmJNdEu4FkHGmH4
         JXEhmgMzUbj9I12TPMZdsKOKy5RgnOMeQ/v4JaUjC9H4jKbeQPoiaxA2kuG6ReNFWp2G
         zr4igDVs1KyqWS2PQRg4CPW0JW2oTYDlRknI71jn+qmy92OshaOdPcIjYHXzFOGycJcT
         mYk2hQ3KH8lDb5b3oCqMdJ3PjJ+rVoa3/YU63EO87LwQReTkD2NUQT6Pt8mUhFCuoz2K
         PdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249270; x=1750854070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n761KcazBD8NAVChuciBYR6i+PEWOHat/DvKkhEEUwg=;
        b=ClOID/5cSN6bq8U4dT81RArY+iw58PC09Y9cY2ws8FV535ixoB5z4JcBASV5zk1obE
         47jSThVT6wrqGBC4XFpruj3sT2jxAN+vJOzfFft4rmlpO7F27w4Rp9jUgxuc++qi/zoM
         h3lJj7MRmDgmFi2fBtxAEZegpp4nEtJcn6pfScerQmEb/otLJXOwwnHrZ5FLQriIpzIy
         xCwrlntbzPaSE+MMb582UJBa8xbR+OGii5kIcY0sclx4ko+wURHqbJFXXVWP3kxDhs2R
         IYqqC+eqbROlqXBzYyL5mb4zEHJimEMQSNosd3xR8YOTXYEZNpp4lgL5OYA+uh+mWAhK
         EOIw==
X-Forwarded-Encrypted: i=1; AJvYcCUJLOjPfVsx5YcTMjb7EqVpX3xPuxyePX4R9gxv4pW9FZdHMw4P9gm4Z2CoUBoJ4FdhQTbPfHDRRT4keyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNKV3jq54klBAfL8jtCWMmt5kdlH+mF/AS3LuLem4/3nmZGvCX
	KJ2DDWgLgeXU40Lj1wYbdYLFBcxylDoIs+mwMvhsKQ6yIdFqbNglul02XE3SsULRCnXPiBXmHjZ
	hVamAtiNEC7uhWCDqm/+5GhaqvB4bOhdiEFcxzdOoSA==
X-Gm-Gg: ASbGncsLEvtfZLYggAiIB6TxBU3GLcPo3n1Ry85dh5bOcxtpO0ITJhociMO8DJ3FlMZ
	o9cxzYM21XpvWWDAA53sqoFhQEXzG1ho9KlHDO8oBRtCdVePc4O1xdgVhCSak97bupExFRxM9Dj
	tAnNVvyZnqwq+OmKetVyfDXj3G66HHrT2csyfg+6Q32tc=
X-Google-Smtp-Source: AGHT+IFxHCRWz//u1od0Lrwty9Yf9DHcSgaAHfAvrbBiimpXB2OEA85EDmSgQGSVRLhnSLdlgZURbr7ybwWz1kTTt2A=
X-Received: by 2002:a2e:a546:0:b0:32a:6312:bfc1 with SMTP id
 38308e7fff4ca-32b4a5a5c86mr42763701fa.24.1750249270277; Wed, 18 Jun 2025
 05:21:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com> <CAMRc=MeTmwgbHv9R_=GFmjkAV4Nvc-SeSCOz1k6pnGUrF+R9Mg@mail.gmail.com>
In-Reply-To: <CAMRc=MeTmwgbHv9R_=GFmjkAV4Nvc-SeSCOz1k6pnGUrF+R9Mg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:20:56 +0200
X-Gm-Features: AX0GCFvzIWiUTEnf7w2o5CriFQLwK7aVK0h_a_ivR8DSarlEz7uy-y-3wDCyAbg
Message-ID: <CACRpkdax9ojguF1SAfiN9iZi=x3VFpCea6KnhzL3JBD9EXZepw@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Introduce HDP support for STM32MP platforms
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 10:05=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> On Fri, Jun 13, 2025 at 12:16=E2=80=AFPM Cl=C3=A9ment Le Goffic
> <clement.legoffic@foss.st.com> wrote:
> >
> > This patch series introduces the Hardware Debug Port (HDP) support for
> > STM32MP platforms.
> >
> > It includes updates to the mmio gpio driver, the addition of device tre=
e
> > bindings, the HDP driver, and updates to the device tree files for
> > STM32MP13, STM32MP15,
> > and STM32MP25 SoCs.
> > The series also updates the MAINTAINERS file to include myself as the
> > maintainer for the STM32 HDP driver and adds the necessary
> > pinmux configurations for HDP pins on STM32MP157C-DK2 as example.
> >
> > Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>
> > ---
>
> [snip]
>
> > ---
> > Cl=C3=A9ment Le Goffic (9):
> >       gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
> >       dt-bindings: pinctrl: stm32: Introduce HDP
> >       pinctrl: stm32: Introduce HDP driver
> >       MAINTAINERS: add Cl=C3=A9ment Le Goffic as STM32 HDP maintainer
> >       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp13
> >       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp15
> >       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp25
> >       ARM: dts: stm32: add alternate pinmux for HDP pin and add HDP pin=
ctrl node
> >       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp157c-dk2=
 board
> >
>
> Patches 1-4 and 5-9 can go upstream independently. I suggest taking
> patch 1/9 through the GPIO tree and providing an immutable tag to
> Linus to take patches 2-4 through the pinctrl tree. Linus: are you OK
> with that?

Yes go ahead if you want, an immutable branch based on v6.16-rc1
is the best for me, then I pull that in.

I could also just apply it and hope for the best... it usually works.

Yours,
Linus Walleij
