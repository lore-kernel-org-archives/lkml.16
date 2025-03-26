Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC651C6FE6;
	Wed, 26 Mar 2025 23:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743033104; cv=none; b=jwQhuQnrPKcRMfkn4AoUmeoAXqWsf3Z/gleLaLx6JWIHmyqWltTSrxIPKKCHeRaaWofVpn1clHvRMpeUmvlxHMkuwRyJxRhNvepH94ROssegjmZGK8i7aziJoxSQ9MYbOOR6Xrabp8qsR5I8ZWaznp5U+kazXwiC1rM43In9PlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743033104; c=relaxed/simple;
	bh=uA4AdssvpPqQ86j2mMIE0l6Ccwq4JMgcJayRJEXySK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uu+bPHj+ZQrsi+Aqma/eACW1mBp2FbojMhcRBSmMj8xbHR2y8eajhyJPPNp+74/FTaMAXKhWgLE5acjt29arzwGAv5Zj6HNM28e5qe6YYMXzADDE29NxQ8gi8AMs5iUCcWFPraFs0VRPVxIwibYOtxe3GmMbw77OiJeS9O6UCIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnEbuyR+; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnEbuyR+"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-548409cd2a8so490011e87.3;
        Wed, 26 Mar 2025 16:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743033101; x=1743637901; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uA4AdssvpPqQ86j2mMIE0l6Ccwq4JMgcJayRJEXySK0=;
        b=fnEbuyR+o6vGooi7cdhHEyWsyQU+ZVJfcHn+Q0kcSqw5r9Zg6+tc0nA694vAAqTirX
         9OlyiWplBm0F61zT6RUYEw3fr9pDJqtgKdocCq5op1pf0cRbj/eEw7MM2xhwIqWMaZqD
         U8M7T4IhlwLPmXT/DLiApx3Ql3aAEqT5pdJi+AEa3ED5PoUiI80AkA6++HQhlan5/b95
         VUBSeXp9yIbJuHVcsC0p0M4sKr2RXQ8W8L9eyfO8IAmlAsWf2P+VDsGHpCCBdvi967Fz
         nwypITS0RcOB8/LH/D8C64K1N+GyfsNKXXPKdzMOVlcKIZKMPKm0UEW8OoScVsnvrOhE
         KlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743033101; x=1743637901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uA4AdssvpPqQ86j2mMIE0l6Ccwq4JMgcJayRJEXySK0=;
        b=eEvdW4jp7UuQLubZuY3G9JRQO8CollueabVIcszqbHneBRN5NniBqc5czlO1DL0ewg
         R1AdfblzzbosWExsNSMAUPcWOt/dsIiifdjj6sJyakDU6Gyt+vTdcqaGr3K2EFnz3N3P
         pYLGI0FOOkzsAUTBqLlf6FQvDZ2PkfbgDcLXE4uYrbNMebx0bwbkim7EKCmEG/X+Uutm
         dp/0ZiPAq0Z5/D3xLvBVqxO8gEZhQoDFIOHAId1b4VArWO4tQnDQrZsGARO4QQrE74hQ
         Wtq//9UprIR34vtNS8h8gM99szfLj8gRJ+imjMm49e8+KQeMg+/JLTkza+K9zRrDR674
         QGdg==
X-Forwarded-Encrypted: i=1; AJvYcCUXPLsEU6q/gnoe77FWja76j2vyQIhNjZSg3tdeeUEfDSgty/aj40XSRmZ5yYQC7nCmyO3OKL+GOtDghrlL@vger.kernel.org, AJvYcCWdvcjp2OWZ4nR53a9W2JLVGtPc///cII1SqnrxW6Lub7N93EaSuIAZLiLtIP7sHngj8U12qDP/YY6Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8xuP3kT1WDx9hnYxrIp7sTnlMJN6zGUiRRt6bOenDgEVRIE2b
	/SCKbv568XB9hKls4l/Tc4DmDuqw9Pz/HyBxFe8I4VrJ18ucv189n3F39/nZGgmxdJ2syGlJelE
	IUaS5tVFaGdlR5IzTFxaCfHASeGmOOg==
X-Gm-Gg: ASbGncucy/4OfPbV/yycymj/U+Cj/dBsUuYdWaNUJ++fAzgpYUAltrmCSPLjVL315nu
	0BbQZd9qlVUG/vy59kFA91hc5DyA+rjo8YR6C2SegHYOI4y02w1zQAIg+8txKkgz8aGKDeibG8J
	uFd2OfZLSwPHt9gvy0F3l3EZCZBTe8Kz1K7R5aDhq1NqdgcZL8x10Kp8/Ipg==
X-Google-Smtp-Source: AGHT+IFYELfgiO+wxoWio008fIXIKA1kkoHvCfFRSp46GuCuNDakMgDbEsBHq6K37MFmmLbGrQDsEYkZtP/RiQvI5A4=
X-Received: by 2002:a05:6512:108d:b0:549:8f4a:6ba7 with SMTP id
 2adb3069b0e04-54b012201fbmr462220e87.36.1743033100314; Wed, 26 Mar 2025
 16:51:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326223841.193234-1-marex@denx.de> <20250326223841.193234-2-marex@denx.de>
In-Reply-To: <20250326223841.193234-2-marex@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 26 Mar 2025 20:51:29 -0300
X-Gm-Features: AQ5f1Jr4DbKXNs0s_yqnIidvZAgpTckMlWcRo8PQ0KBPDukXSJkiLvMa4vA1eSg
Message-ID: <CAOMZO5A0HKUNrYmdVrSZp6zcmVcdS0TRTiz_7py73c3b+ng3Bg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add initial support for
 i.MX 95 Verdin Evaluation Kit (EVK)
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Conor Dooley <conor+dt@kernel.org>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, Hiago De Franco <hiago.franco@toradex.com>, 
	Joao Goncalves <jpaulo.silvagoncalves@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Max Merchel <Max.Merchel@ew.tq-group.com>, Michael Walle <mwalle@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Tim Harvey <tharvey@gateworks.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 7:39=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> Add initial support for i.MX 95 Verdin Evaluation Kit (EVK), which
> used to be the Titan EVK. Currently supported is lpuart1 as console,
> SDHC1/2/3 as storage, WM8904 Audio, USB3.0 and ENETC ethernet RGMII
> Gigabit port.
>
> Note that the SoM used in this EVK is a derivative SoM from Verdin
> line of SoMs, an actual i.MX95 Verdin SoM is under development.
>
> [1] https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx=
95-evaluation-kit
>
> Reviewed-by: Jo=C3=A3o Paulo Gon=C3=A7alves <joao.goncalves@toradex.com>
> Tested-by: Jo=C3=A3o Paulo Gon=C3=A7alves <joao.goncalves@toradex.com> # =
i.MX95 Verdin EVK
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
