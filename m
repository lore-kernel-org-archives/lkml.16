Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E0F2405EB;
	Tue, 29 Apr 2025 15:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745941991; cv=none; b=nkR/vVUEzmey14YiWIvR3DJ+E7Z93bXaN/Dx6JpwM9cakbkrqH7IWILL8D9rnIb6XtU8M2Vq2PzflG7vWPdusPAlMDT2yWVwsVI3OwXioPA4WkGAgMBIT/LndWZY287U/qxOhn8+3oihUiO4HqvjdYgQHyFCiVBLBxNrkOxLuTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745941991; c=relaxed/simple;
	bh=qlAjtk3tN6wTgfg/HJjz3xA7Cj3B2pXR8JZVSucbYkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h43U2HHc/u793iEN4pavKb5DzuDovHfnMTgdcsc3OrGJ0Svcx60PMEVuE3SJCS6x3nxZ8qlgiG7h4/LQ9Yx/hmmpDodPBdOS5unu5/yLnk/7F8e6/WNGawhqmnn44nXNBTudR9YZ4TTfaEmLtw9bIetlfqazN2m8hInTWvQFm78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54e9021d2b5so4577823e87.1;
        Tue, 29 Apr 2025 08:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745941986; x=1746546786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8+3XDw0zebRF4K8CmESLbvyPpxu1c3QADWt4g05ubeo=;
        b=wGoZi59sBD3KSsc4vdmmcDccbsy1ppVRlLIlCjIgYvlpzztjx82G/fvoeCh9aO24ZS
         IlbcCECNdO/guARgfwfnOHl6VKy01hp/U2TK5y0LUHSFNTylw0Ohn+LHzQsfF80Dd8Y1
         6m0NAHNGF88vtI583jg6QN8xPp3zFFaZ80Ww6mzYNR4/35qPYevLgcgDihyFAmn2A/Ne
         doGo1EWqTDNYHBENyk2FY1TssJj9+4nMQJdPIEZxmOd8v/n3a/ORn4z8zbSHMI/+WFY7
         NMuuyHwC5xjYVCCVXq0ZyfKTEyzsnIx0rccEKHXf6L4pPhGcVr+XP1Ooxtyzw9ZNfj00
         LjVg==
X-Forwarded-Encrypted: i=1; AJvYcCUkGi5uoSgWsNalU9ZhifvzLNQW7yV89jIrhlw/4Dissv5/+Mxgt93apwbuwRYEuUct6jWvllo3vBrSkV6n@vger.kernel.org, AJvYcCVvS8frXnEh3il46r74k/sFTyy1I/7xMsJr31459gFizaNoJdTdTU+/hadOxGsWvAOsqp1r2S0plMDv@vger.kernel.org
X-Gm-Message-State: AOJu0YxakJzL4NpkuMyOT6XM1qZeRF9PXpa0XtxesfjYHu++CnYsROk+
	xI552id2MMoHAtrvCGiMR9K4nf9nuFderqts1Ifg17yIDGsTTJPaZu1y4OI9
X-Gm-Gg: ASbGncsWTYDd7KIkr64FESSyExUCUX7v2Zcpzl+3/dNQ1b3KgnzWKd5yh+mrXJHrNn8
	u68+A2n7N1G1RwtCEPncAlytaVaDtnrqohpG7I3v2WwEcH/72lZCZXaPafYO41m8c6EJGLsBF/8
	gm9dEVSP5f2Z7NlodCqoLyZR99mlVm9wcaLQoSorifVflip7XOXenqco2MVw8ZZwJE31QY9EfUx
	9fnSTgHEuvV0pPeYqi6ZxRvBS39E7YDgMcvgObO6xRCsNI3Ku4LafXMX9Mjy8cpd2DZWZ1pTnPX
	TxZjSHR/98EBta5Tna+j9VS4exbM7gyHj+xclTr4htQrKX+szPIFU53Y0fsoWj2inrGLZGnaoA=
	=
X-Google-Smtp-Source: AGHT+IHQTsGcVxMOfgcvQYWPG+gO84X9afJ37TaTBa1+MapJvM3MwasPRCy6AzjPTe99yZvCers28A==
X-Received: by 2002:a05:6512:3b0a:b0:54d:6b7b:4ff2 with SMTP id 2adb3069b0e04-54e9e163413mr1051089e87.4.1745941985875;
        Tue, 29 Apr 2025 08:53:05 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb896esm1909544e87.256.2025.04.29.08.53.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 08:53:04 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30effbfaf61so70349221fa.0;
        Tue, 29 Apr 2025 08:53:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDStgZElxCbqTHDNn00eLdn9B6MWYv7MjiASKK0dvOVUrDfAXKwwbMNJuL3IIOsqn/YcuGeGH7K4LxSC6G@vger.kernel.org, AJvYcCVmnpKDYIXblHpNqjqbmhodo+t/IxuRTvYvRBepXHElO81c9jn/N6e6bGlV/WheBN6Rosd0JsqkEfS5@vger.kernel.org
X-Received: by 2002:a05:651c:1546:b0:30b:aaca:9b2e with SMTP id
 38308e7fff4ca-31d4321c950mr11651651fa.0.1745941984684; Tue, 29 Apr 2025
 08:53:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250413134318.66681-1-jernej.skrabec@gmail.com>
 <6a056bf8-9f39-4204-9378-8cc39be60038@lunn.ch> <4645060.LvFx2qVVIh@jernej-laptop>
 <4975791.GXAFRqVoOG@jernej-laptop> <2486dae4-c5a5-4df2-8048-87b4b2d46d54@lunn.ch>
In-Reply-To: <2486dae4-c5a5-4df2-8048-87b4b2d46d54@lunn.ch>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 29 Apr 2025 23:52:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v66dF8hMmjjJMnpVxM+092q=ZYZ+kT316roZuty6i+rcXQ@mail.gmail.com>
X-Gm-Features: ATxdqUFWPc1KkFXbaozIMU3ylesK6FEAqWczY-QB5FUll7_UlkeMPMrayMJK3Jc
Message-ID: <CAGb2v66dF8hMmjjJMnpVxM+092q=ZYZ+kT316roZuty6i+rcXQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, samuel@sholland.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 11:45=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> > I just to be clear, I tested various combinations, including rgmii-id, =
and it
> > didn't work, except rgmii-rxid, which matches strapping. Of course Moto=
rcomm
> > PHY driver took that into account and set registers accordingly.
>
> So we have:
>
> &emac {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&ext_rgmii_pins>;
>         phy-mode =3D "rgmii-rxid";
>         phy-handle =3D <&ext_rgmii_phy>;
>         phy-supply =3D <&reg_gmac_3v3>;
>         allwinner,rx-delay-ps =3D <0>;
>         allwinner,tx-delay-ps =3D <700>;
>         status =3D "okay";
> };
>
> and
>
> &mdio {
>         ext_rgmii_phy: ethernet-phy@1 {
>                 compatible =3D "ethernet-phy-ieee802.3-c22";
>                 reg =3D <1>;
>
>                 motorcomm,clk-out-frequency-hz =3D <125000000>;
>
>                 reset-gpios =3D <&pio 3 14 GPIO_ACTIVE_LOW>; /* PD14 */
>                 reset-assert-us =3D <15000>;
>                 reset-deassert-us =3D <100000>;
>         };
> };
>
> The RX path looks O.K. RGMII-RXID means the PHY should be adding the
> 2ns delay. The allwinner,rx-delay-ps =3D <0> should be redundant, that
> should be the driver default. And there are no properties in the PHY
> node about RX. All good.

The default action when the property is missing is to leave the hardware
settings alone. I admit this doesn't match the bindings.

> TX is the problem. The allwinner,tx-delay-ps =3D <700> causes the MAC to
> add 700ps delay, and 'rgmii-rxid' means the PHY should not add any
> delay. But 700ps is too low. It should be around 2000ps. So something
> else is adding a delay, or the 700ps is not really 700ps.

Anything is possible. As was raised in a previous reply, it's possible
instead of extending the delay range, the decreased the step size and
added more steps. The problem is we don't really know.

> You say the PHY is a YT8531C. These PHYs also accept
> rx-internal-delay-ps and tx-internal-delay-ps properties in their DT
> node.
>
> Try setting 'rgmii-id', allwinner,tx-delay-ps =3D <0>, and both
> rx-internal-delay-ps and tx-internal-delay-ps in the PHY node to 1950.
> If that does not work, try other values in the PHY node.

I don't get why we should ignore the strappings instead of using them
as reference or even truth. If the strappings worked correctly w/ the
generic PHY driver (that doesn't know how to configure the delay mode
on the PHY side), isn't it working as intended?


ChenYu
