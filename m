Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEAE2F4A15;
	Wed,  2 Jul 2025 14:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751466049; cv=none; b=s5h9LfQkc9mYv08lGE09PNR+vsV/recYltYSXxKMBPV9ZuFEi1ikfSI4CrwqxuRYBI+AcXtAYzske9RFq1fyAiAP739DWb9WwYqAeFY+bt/xydH+CWysfM6/0HBMvCWGD3c2cgPPBO2dggskLaGGvKXSJGf62+WAh/xXPmuEdCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751466049; c=relaxed/simple;
	bh=Pip7qVEFQVYSY76zLUx9PHCExnbAXgnUt8LulPOmRNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MbGzeo/X8B48c0mI4TircJwZk+lSylNNUJ3970gi3QYr5yaTOIrQE8aL8Vy/OeubVGG655DsGszMyzWER+e2EMSO40WjYAjaLWPxTTNBHEZ4tqDAta+RzLSwf9XBc04zRW420jEFOh2Qik6HiDUOhVP0bJ/cq08zD02bnZYlgbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kf7C140y; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kf7C140y"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3190fbe8536so3451237a91.3;
        Wed, 02 Jul 2025 07:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751466047; x=1752070847; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGQkzz5zRxRRS2uo+kWwt7fThwG7BuLxpPIngGvvrqc=;
        b=Kf7C140yfoSvZmd3EKFpSUPnHLUFwfvFTJrWJDgq1SK0R0AGT8qBtazkhdonEgKeR0
         XP1OXYYcEtzKCMxN4a22irggtK3NkKhFqZJiCAjuPMjMLVDY7xI2bmky978LtbT/+9bv
         HqJpq5SQlGlta/zPkxwmHyE1CrktAPiozs7FxahyctFgnIak/ww8RT3CH2cATlrdgJ+Y
         2IvpsN68Z19XtTSjB9X23pE5rmOIxzQtdPT7bc11c+KEwHwrdpnVWUIHF1TE7J5hlp+P
         ZlxXpLxTQgx18ir9NQbS3DXS5Pfvqv93E0ONBYfJBh3as3///dHPQRvs3rP0wQIoErzg
         pWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751466047; x=1752070847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yGQkzz5zRxRRS2uo+kWwt7fThwG7BuLxpPIngGvvrqc=;
        b=ane2vxuQ5RzUFzosCa5aaSOUtYxPKYJ6wABicclLAQ4+MGkhQH0SWBUeFrOGJ0TVPa
         RTTB7FikwlcQQ4PwXuVu/bWxmDCba3NP5TNWhHk+mjGubK0Fx9N4paFVsR8ZgCLTdBIG
         8Ceiys9ZtSr2USE2ZpaKqXAnNNZMoSd5BIwfZxRO1+3sBIoMaDo9AY/HeliNGSTeaSY1
         qotCUvKSlOxM2aTr9l56w+WfGIHUqaplQo9a3epqormpJ679nllmU1VpVwWkIXiI7T8H
         lDwYaJao5rPBfjGA1XDlWPeETrK49FnXxVojjKc8obVdNY4UdF5deSmfqUyuf8cK61EG
         pocw==
X-Forwarded-Encrypted: i=1; AJvYcCVdEzV4GTNQQqHZCA8Lun/B7UO8O3FEdsC/nMSrgkIcnF3VE3E6/9VE2k49RGNSbAQynkUrVr7Ym303@vger.kernel.org, AJvYcCXpakeqp7Zp+4hkguvPiuwTwHRWSWThghRHVv2gRHe3iOH/Wt4WVOSpACmbnipSxcq5xh47R0i7cMqHr3w8@vger.kernel.org
X-Gm-Message-State: AOJu0YwAK1av1JUqEW0HMByUljYsKAH9ynUdAmNTswVtnC1Z6+r8YOrW
	yI3ELjrnHh3RPpiLElfVRw2Awc/wSseVGP14Ig5EFR8VNhYvxgBT+iDo6hwR7UUbblvse1D+JWa
	SpjGp98B9IcsT6ZT2UGryd0RUPptq1I0=
X-Gm-Gg: ASbGncsdw8Uf+BeidB5Eyjoqa5MvjZeV5DaHqTnoBStgpNKdeahceoFuPNlRcsF5J0E
	zSyH3YYAJQGxqGUIiYzRaW17qpTX92huiwUx9gHzcQUt1YYi2lF6cQUraQPyub1GdhINhQbEZaQ
	m8UvWwRFpBy5HHzIXp6oABLC9OCK4aKnlsYQcnYrP9sOobJzO8cPzokQ==
X-Google-Smtp-Source: AGHT+IHXe/1zFmqCjXQ3C8alvXOHiCKHLQ3bJLFyVQ/G6RNjB0hyZ7QrXCV2jrtHiA4TmMP8JM9c+KanMU9aiN4g/Xk=
X-Received: by 2002:a17:90b:1c12:b0:31a:947d:6ca1 with SMTP id
 98e67ed59e1d1-31a947d71e7mr2657565a91.22.1751466046836; Wed, 02 Jul 2025
 07:20:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620213447.56392-1-aford173@gmail.com>
In-Reply-To: <20250620213447.56392-1-aford173@gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 2 Jul 2025 09:20:35 -0500
X-Gm-Features: Ac12FXzt0gezjSCPgKwgvm9n1EIPWkC5-wwtbhI6dVypdKni0yvTumI1x5nEKA8
Message-ID: <CAHCN7x+2A476SgUP3uWSLovpDU0qxxP=a+sXLbdE0UU6Bv+_YQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mm-beacon: Fix HS400 USDHC clock speed
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 4:34=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> The reference manual for the i.MX8MM states the clock rate in
> MMC mode is 1/2 of the input clock, therefore to properly run
> at HS400 rates, the input clock must be 400MHz to operate at
> 200MHz.  Currently the clock is set to 200MHz which is half the
> rate it should be, so the throughput is half of what it should be
> for HS400 operation.
>

Shawn and/or Fabio,

Any chance this can get reviewed and possibly applied for the next kernel?

thank you,

adam

> Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development=
 kit")
> Signed-off-by: Adam Ford <aford173@gmail.com>
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/=
arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> index 21bcd82fd092..8287a7f66ed3 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> @@ -294,6 +294,8 @@ &usdhc3 {
>         pinctrl-0 =3D <&pinctrl_usdhc3>;
>         pinctrl-1 =3D <&pinctrl_usdhc3_100mhz>;
>         pinctrl-2 =3D <&pinctrl_usdhc3_200mhz>;
> +       assigned-clocks =3D <&clk IMX8MM_CLK_USDHC3>;
> +       assigned-clock-rates =3D <400000000>;
>         bus-width =3D <8>;
>         non-removable;
>         status =3D "okay";
> --
> 2.48.1
>
