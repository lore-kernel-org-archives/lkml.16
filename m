Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E56242D72;
	Tue, 20 May 2025 13:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747748085; cv=none; b=Yj5/4IiEVRJxf62iiMijkuxyUn10J/0IKAP6Qy7mE4yFM67nssICAgWVZH7XfvN4Jv9NHwhuEMU2JNF2jqsVz4hdEmvtgWsozcaOKosROwHiwKy2krLwG99MAlMNtgWzJ7MtsxIyZdADVKWaDwAGeFiaSUzcQtrrjOT0uTMljkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747748085; c=relaxed/simple;
	bh=gFVBHCCsBHL4lLZoEhsrJGKq4vpU6nZU7dUlkmtYGok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fMJ0/S/V2GDG7ld5vBrRAz1MUO2hqWdAKKTFExgvsAmOqe/Sf91YsAX2fc6CklxIDWrwJXC3A0x6UEsouqOI4M92izSgNuCvCeO75pLDjJmkRsuSfWlTlXw0Sp6nlbUHvjGSFsgZkLpcNXfFYTM/64gHZwBnicbni8mb6QNI6tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eV4GZ6C7; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eV4GZ6C7"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so7091833e87.1;
        Tue, 20 May 2025 06:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747748081; x=1748352881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfD1s22Ic364TvVTHCagUpXijjIYK42cBGG9M8zpn10=;
        b=eV4GZ6C7zdxo1hdHX9IfW52FaAiDhku305CC7KTM+GF/UtSzI0F0TPFVnaEqhwbQgX
         AIIDcOu/eIZR4RnTDpcxI4PvBdgct11l6MfF7ilOqoElOEboKsd5dleGHb+GSDfTHHHr
         ws1ApiMbaAytpDPZeKUqyyVlXPkKlTeekCpE4ld/vRFl3p5CegCnkVNVhhQuH62Z0QDO
         up7AzKORTJWNO6j9hgtk2HjRExLBQZ7xJwn5YC7IBmdOt9cAFj9aRdtVpJtsmNm58+IE
         9XmW0TwmLJzf72umKxf4tKnG3KV+CoofJi5o4pOGo86IjPr0smFvcsRJaMvHU1TfcFhW
         DgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747748081; x=1748352881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfD1s22Ic364TvVTHCagUpXijjIYK42cBGG9M8zpn10=;
        b=Lz7xYmH5XAXEAtH83JQSKOAgfJKbUEJ4JDQHUtcnQcBvxEgPjNZiMzihfQYR8dZSQx
         d+asxV2xIMeRt7l5FmtcEmSexXN1GeNrXc0RHxlgG9ztypXBQjp4i1DSD4pdmHsC/9Sp
         4GpHqh/G3JTuDMqEbAI4E0KE2tAGLif4Jnn4hBz16RZDJlm0H9sarWT5hda78DnCd4n4
         7CtF/oW3PqfSPGyvrre3/85lNxoel7n5kggFC0z7ZPpN1MS8KBMKVjNp4T+lTQUGeHqq
         laViNSyn0JU0TGLkA9AWnrerJy0WHAMutc8f+mkWMOLaPXc/ZN89ndFQNpj7510mJ+nu
         F7tw==
X-Forwarded-Encrypted: i=1; AJvYcCVGDRmnLCK97Ix/uvZJSqz4mtTdMajGZ94QemYlUAcuVvBa1tJ/tCjeNDabK3BgT/Z0xWiL1Ftlue5kWQXJ@vger.kernel.org, AJvYcCXn8IZvf18gtqu/vWLNxU3jun3wg4d6kehSMcMXvBagh8oMS1LWNpCBqKOgVdsxUIfvm7Ffm98KNh5J@vger.kernel.org
X-Gm-Message-State: AOJu0YwE/3wDXmoeVhwUelcWCVva6K31x5SpOo8sF38sxjHngrJ9D8/4
	rawjhH35AIMgkf0RhQjiXhlRUyP5h19kz1WsiKbUm1WM62LvruFn9Izm7ugmG/DqMUJRziXOqbM
	VqDGapwBJ3WLi0mxrkSiCX0dllDxVcmQ=
X-Gm-Gg: ASbGncvMkFl+VknQ2vXTmYMzaZCfHM4Ku3TqLjWUZmJNQDIpsbsw+0ncQI7NsiHGWxu
	Zds6/eY8f5m6Wclp0It2S0SDoFPuRn6puTSnbpKjZoJWOFBBFYKWXKZg7AqF/FvxA4HrRFEs6Xd
	fDzBHtlD1zhXfN+TVZR+tQblKQICMcA04986Ne/jcZ7pnjS+rZmAIEu5MOGztCmWA=
X-Google-Smtp-Source: AGHT+IGOdVh5BabNP6weiWFLJXZ3ZVMdQGC/USr/zeCgTmal+W0BVS9hJ31uxCQihRwgnGjI33KrTTR4UAo6HbnMaFc=
X-Received: by 2002:a05:6512:4602:b0:549:490e:240d with SMTP id
 2adb3069b0e04-550e71d7d90mr5140507e87.28.1747748080897; Tue, 20 May 2025
 06:34:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520115143.409413-1-c.stoidner@phytec.de>
In-Reply-To: <20250520115143.409413-1-c.stoidner@phytec.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 20 May 2025 10:34:29 -0300
X-Gm-Features: AX0GCFu-SKgKDmlyHEywfDCC8Hm0Dm6pbXAwBI2nvYfhldnFsrevIPgWdHRuit4
Message-ID: <CAOMZO5D8giOiBCeV5AP1pL+hCFQt9bs3gFsr2mCgMSSbcbCovw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
To: Christoph Stoidner <c.stoidner@phytec.de>
Cc: Primoz Fiser <primoz.fiser@norik.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	upstream@lists.phytec.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 8:52=E2=80=AFAM Christoph Stoidner <c.stoidner@phyt=
ec.de> wrote:

> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/=
arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> index 88c2657b50e6..c08f4b8a65a6 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> @@ -58,6 +58,9 @@ &fec {
>                                  <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
>                                  <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
>         assigned-clock-rates =3D <100000000>, <50000000>, <50000000>;
> +       phy-reset-gpios =3D <&gpio4 23 GPIO_ACTIVE_HIGH>;
> +       phy-reset-duration =3D <1>;
> +       phy-reset-post-delay =3D <0>;

These properties are marked as deprecated in fsl,fec.yaml.

It would be better to place the properties described by
ethernet-phy.yaml under the ethernet-phy@1 node.
