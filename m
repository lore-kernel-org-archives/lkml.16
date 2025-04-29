Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2427A253320
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745892542; cv=none; b=BikkrsGXWcxUjnFu1B2rNHEfclj9JJgjgsivletKTlr2ifyCexgf/bz7zrDfRl7oH5OURhM1VHn1T84nitQqqn2fgu9GOArtzD38tle3tp2nMGe2sr40siRn6De2NWe2z7vAmF1es02Nf8cGRjYdv0i75oCFWJfdXq4xbCtGCho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745892542; c=relaxed/simple;
	bh=1VflgDCAbYM0nvDCbUBD9RSTMKnjWcdXs3kPY+dpC/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N2Ad5Q2/+ioabmy1ngPiiS2a83P6ODU2QuA0e+cwow9A2J9N6PD3RqBjugxOQl0HKImP+F3eKXRJ3GmpmCHBXNLS+DY2Ma3UJZn0bpBAlyV7frEJVSK8TNbrJj9G3JnU7HikWqMfnHLTLI5WEcw8InBOlDzTWgQ6+M2g1NcskUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lessconfused.com; spf=pass smtp.mailfrom=lessconfused.com; dkim=pass (1024-bit key) header.d=lessconfused.com header.i=@lessconfused.com header.b=TgGrlrgz; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lessconfused.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lessconfused.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lessconfused.com header.i=@lessconfused.com header.b="TgGrlrgz"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b13e0471a2dso4011802a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1745892529; x=1746497329; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOL8cAzDh7/cTXRXsftT/THY4eVY9mbWKCNY3CIWC+E=;
        b=TgGrlrgzGWIWsI9ZY8VsWX/ChTwwRvKE/7s3Y4NW3VnpWbL3nZ9MJIOcBVPb6hAIpM
         9p4KT84GH0KpugNaofi2ih98kqC7jlBfwPy9TA2C1fOBU7kiBwSq5jh+hzTh7dHhciDH
         w0XJ3Vy52eY3cJf+huvyBw6b6XjRX0lmWGEjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745892529; x=1746497329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rOL8cAzDh7/cTXRXsftT/THY4eVY9mbWKCNY3CIWC+E=;
        b=H8pccauoLBopWyYoGy/y9EH8J9HwrvF2ECvDfJpDdIBNuIDJePiLDTmhTluZJbNoOL
         URcG0NjFH86ofiKO+oyzmyos0Al42kiqyyIeW8KNFHQA51+ZiHHVhYVLI0/6nz8X7EgL
         sVs4OnIUDhWkXzU2j+wK3GrC7XflySAFbd1mILACMSLSom2GfdzOLQEwMKLFucPvyrkv
         L36riOHk+5Hq5voZpujIThgPL3skz66SbHBX3dnf2fuwXyKIVuwnzCkK9GdLrWd3EAt/
         VIwd9wdNqlbTTTvVwWSL1HdxMn5e30fMpqL0NsWajj4zCOWjLuuNx0MxN5bfOCaPIw89
         exnA==
X-Forwarded-Encrypted: i=1; AJvYcCVsD20xc+khIhB1huZyB6iSYc4t7cekqLw4OMuVH+PSCGFAVBCtKuhR82ywXdmDKwYaQI3tqjhonvoDmJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YywuqeDt8+gH0UFrPgq7m/ZhqBw53gHfw6JlFd7XlPX28d8TrG4
	UdqYSYvabnXPT14qVpxEz5V4aAKdcFkCKUR/zTGBYzEEaWSzhgzV9nS04evRaudjEE2fLVl+RTH
	ZQ3i4hP9DlFkKtflODKxIm0D26U+GfAXBaBJSZg==
X-Gm-Gg: ASbGnctwH2EUVVvTJGkfay/hHO08RxPuaD+0fNo2stXQ5ImrpjIIViZdp5G8wt/pSJO
	ly+ELvU9I96M5bniYJryE60kwV35qSDb66XvIRg6CemjjVQn8UR4M61JtQNqs2Tw9JRkEr1/8Mq
	O+vdWdTse6tFW4QJBLZyB4cdYH2hmWoa9WQ2wVnGht+SKn5bKDKjO7CcM=
X-Google-Smtp-Source: AGHT+IHCPRZOUIvFcl8lsvnwfO+9RLYKzmV+Oh7P+gkUHVtVP2yGSVFYEv1JALFXz/61Bb1nArjTw0CpObv33VgEMCo=
X-Received: by 2002:a17:90a:c88c:b0:309:ebe3:1ef9 with SMTP id
 98e67ed59e1d1-30a013070damr20213230a91.12.1745892529578; Mon, 28 Apr 2025
 19:08:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425203118.1444481-1-da@libre.computer> <20523c9e-f7de-4355-82ed-380ee03083f0@linaro.org>
In-Reply-To: <20523c9e-f7de-4355-82ed-380ee03083f0@linaro.org>
From: Da Xue <da@lessconfused.com>
Date: Mon, 28 Apr 2025 22:08:38 -0400
X-Gm-Features: ATxdqUEtIxVd1qwCtsriUSTxo6iPaZohjrD-HjaaVAgl0Wkxs3YcV-UpkMno1rk
Message-ID: <CACdvmAi9v=DFqSOjWdeAabNC1QECs0U3yHM4LZ=Gtthn-pUMNA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: gxl: set i2c bias to pull-up
To: neil.armstrong@linaro.org
Cc: Da Xue <da@libre.computer>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 3:50=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 25/04/2025 22:31, Da Xue wrote:
> > GXL I2C pins need internal pull-up enabled to operate if there
> > is no external resistor. The pull-up is 60kohms per the datasheet.
> >
> > We should set the bias when i2c pinmux is enabled.
>
> So, yes in some cases when the on-board pull-up is missing, the on-pad
> pull-up is required, but the whole idea was to only add the pull-up prope=
rty
> when needed.
>
> So I know the real motivation is again about the 40pin headers, where
> some applications don't add a pull-up and still want to have i2c working.
>
> So my question is: why can't the pull-up property be added in overlays ?

The issue is the property types. I wish the bias was bias =3D <PULL_UP>
instead of bias-disabled, bias-pull-up, bias-pull-down since we have
to hack a bunch of /delete-property/ in the overlays. A lot of the
merging tools ignore /delete-property/. This is a convenience patch
which may cause push-pull times to change by an insignificant amount.
We have been carrying this patch out-of-tree for 5+ years without
issues. I have not seen any design on GXL that had a PU for I2C.
Externally, I've seen threads of people asking why I2C does not work
on other boards.

>
> Neil
>
> >
> > Signed-off-by: Da Xue <da@libre.computer>
> > ---
> >   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 10 +++++-----
> >   1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/bo=
ot/dts/amlogic/meson-gxl.dtsi
> > index 2dc2fdaecf9f..aed8dbfbb64d 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> > +++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> > @@ -214,7 +214,7 @@ mux {
> >                               groups =3D "i2c_sck_ao",
> >                                      "i2c_sda_ao";
> >                               function =3D "i2c_ao";
> > -                             bias-disable;
> > +                             bias-pull-up;
> >                       };
> >               };
> >
> > @@ -576,7 +576,7 @@ mux {
> >                               groups =3D "i2c_sck_a",
> >                                    "i2c_sda_a";
> >                               function =3D "i2c_a";
> > -                             bias-disable;
> > +                             bias-pull-up;
> >                       };
> >               };
> >
> > @@ -585,7 +585,7 @@ mux {
> >                               groups =3D "i2c_sck_b",
> >                                     "i2c_sda_b";
> >                               function =3D "i2c_b";
> > -                             bias-disable;
> > +                             bias-pull-up;
> >                       };
> >               };
> >
> > @@ -594,7 +594,7 @@ mux {
> >                               groups =3D "i2c_sck_c",
> >                                     "i2c_sda_c";
> >                               function =3D "i2c_c";
> > -                             bias-disable;
> > +                             bias-pull-up;
> >                       };
> >               };
> >
> > @@ -603,7 +603,7 @@ mux {
> >                               groups =3D "i2c_sck_c_dv19",
> >                                     "i2c_sda_c_dv18";
> >                               function =3D "i2c_c";
> > -                             bias-disable;
> > +                             bias-pull-up;
> >                       };
> >               };
> >
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
