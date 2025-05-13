Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97AD28E57E
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142461; cv=none; b=tnB8BaKHckfJm/365lBNpfFPYt3LziVuDgRWXqnYoBkoYC4+f07TCFOBKjaYsUtcJAKGTJue5XN515BLcDRS2OWP5hU2efSvlOIY9Q8a42Be9URzZqRExfCj0UAONxaVRaTuEVCJFRnEy6zv/21zuD5sw+lXtSH8DZSIf9Q/Qjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142461; c=relaxed/simple;
	bh=a07HNvK2s/ifER9xOGcNCCEiUl0FR+rf5Vx8rLmQK6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M1A3gHfoIReAJa0HHUq3oxJyhsGSlYmkrHuyJ9b6rAOxk2kwDGhBda0RIHpjVvYlo1qJR6nONGRXmhjNMRCbBD3mr8ZeU6f6CzQcSUtLEXkJa1oUxDazrV5MLHRpFNgUiPf+ziDCI8DUhGjwlCs+Vs8E+rW/LK4XfBtNdEh7bmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g7+h+o3t; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g7+h+o3t"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54fcb7e3474so3832174e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747142458; x=1747747258; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a07HNvK2s/ifER9xOGcNCCEiUl0FR+rf5Vx8rLmQK6M=;
        b=g7+h+o3teH0r1X4KOJVtZq8+gUr+VICHsaqiR5FoISDLP6PHQNnFpu/F8jFmVdGKEM
         T1XEoZOnRd0IOcFoSRJsNNQiEGFWaHuM23Zaka68/N8SX7B5NRrIO4/7ItCKMyNdvfuq
         dn7w+Oqxssf2HjZPIsuAgDRO7sM46IBlYYzx3wbY2ENG/7WmcjQZKTW5TPxjEZ0wY9hx
         kEKd16lb9q2+42gqe3p4HPpbLAnL83VUoY8d4fYlU2XJXtmL9e/TjLm9XeYtcbSL3e7Y
         ++LvoT3k07h/NniGzARU4hviKSj8cs/t8zjDmFTMxA+G5HcXUlzHP3Qny5f5gy7gXp5T
         k39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142458; x=1747747258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a07HNvK2s/ifER9xOGcNCCEiUl0FR+rf5Vx8rLmQK6M=;
        b=gnUrDXWkpW0YxkxxhILIs2CqDWRRS+GdPAzDFQLyDZRAJ7zR2IrSQVvefQx1+TOxTp
         zDF6gRrBbvl9+Dnz65yUEosm921N+FFXn0fZgY62UhlpRYV/dmItYSU69USMpbu+lAyv
         rEHOm2GMOtXD/8rKxDI7d749yQkHPAWcTcHYzEgTNASCkeHDgNI03bSQnUePUIu4yzxL
         B7/30L8ey/dCfmBBik4+mbMafC+52tgXK3pkTAzr1HEf8SWFWp3/hrzqXEHvnDF+glvI
         upNG2A33KnF1RobUHWwDEclqVHYsg0LYoGy0f0xqc7uxnk9uT1NUZZLbPEqZh0bZmrhQ
         yYKw==
X-Forwarded-Encrypted: i=1; AJvYcCWZ/l4lR697gI4OvMBFzNzM9B+OdDQQHVcFrhPqBs+jp3xIdJ/s9O0GgqB2WIIvTokSdKvQKvHbBVsOpGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTyuxLL8X9fH65k1w3Fv4XoL78kNoSy0V78mFo1oJNTI3aC4RB
	/S8idBSH3rY+bLYb72J07ff/69X3OCoWHT0NvzVflKKNzwW8oRTO6qHFx0QDFTCWTUNherUpGDQ
	Wcz4jVLAwCvS8JDRoRK8aiC97RY1meSkz4Ybhmg==
X-Gm-Gg: ASbGncswUwBHMFCG4QRE0NU+GyMiriUUL0X/rqexTn0CnSoDWmeIYNDtzqMEl7YU+aK
	lb5K5h2Li5JYS9ct/cyXKJo3J5UCHRSxVSygnT9aXp/Hbxh4ODfJIzw9qjFFdT38Gp62/v0YP9C
	oL7/l03ppMo6iFLFypF3r+kjeyrJXcHSpK
X-Google-Smtp-Source: AGHT+IGEAON4CqeWB7MIriXflZ3TKRdVPaHoB+BTW6X7JW4SlMZJHvBn+KzxohMwhUgzM+6fwnKvwVBVuufnBpAzy7A=
X-Received: by 2002:a05:6512:3b88:b0:54f:c66b:8b78 with SMTP id
 2adb3069b0e04-54fc67ecebbmr5256122e87.49.1747142457796; Tue, 13 May 2025
 06:20:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512-pin-v1-0-d9f1555a55ad@nxp.com> <20250512-pin-v1-1-d9f1555a55ad@nxp.com>
 <20250512-mongoose-vacation-f81a56dd6c5d@spud> <20250513075532.GB14572@nxa18884-linux>
In-Reply-To: <20250513075532.GB14572@nxa18884-linux>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:20:44 +0200
X-Gm-Features: AX0GCFuZNXL7sad4G9E3lsfZTN1DW6pieeaGbeQGotqOwvfnEpDnUcCktC-com4
Message-ID: <CACRpkdYmupji8a0np0xzogjcvJ8YFstAgg_XwdxNczhQjBZOPg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: firmware: nxp,imx95-scmi-pinctrl:
 Introduce nxp,iomuxc-daisy-off
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	NXP S32 Linux Team <s32@nxp.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 8:46=E2=80=AFAM Peng Fan <peng.fan@oss.nxp.com> wro=
te:

> >Same comment here as was left on the driver.
> >I also don't get why there's a property being introduced from something
> >you can determine based on the soc.

I agree with Conor's observation.

> we are targeting a common pinctrl driver for i.MX SCMI based SoC.
> So that means pinctrl-imx-scmi.c needs support i.MX95, i.MX94 and i.MX9[X=
].
>
> Each time we support a new SoC, we need to hardcode the register offset i=
n
> the driver. But if using DT here, no need to update the pinctrl driver an=
ymore
> when supporting a new i.MX SoC.

I understand that it is convenient, but that doesn't mean it is the right
thing to do.

I would advice you to keep this in the driver and use the SoC compatible
to determine the offset, just as is done today.

If information can be deduced from what is already present in the
device tree it is redundant to add stuff like this, and it inevitably
will create copy-paste errors where the wrong offset is used
with the wrong SoC.

Yours,
Linus Walleij
