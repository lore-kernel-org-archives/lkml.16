Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1662EBB90;
	Fri, 27 Jun 2025 18:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751049602; cv=none; b=BbJcwfZM4BYfc4qRVS3z+/RcerIiZBm56BTHBhrPtEwaG3YfbVFOQzHQcFlkzTzVmgkTyyOYcj/4P3Ynq17zAcYVb+JcbO3uMcyL5Jg+X+2PgcAAt8ISHLp8e6l5WesUo9AdnvzP0GgCG0ZZ3gcerXShmNy1lZgtGfOkKGIQbBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751049602; c=relaxed/simple;
	bh=nVbFmmLKmZhzB8RvT3vMX9q7B5LYHhf8kIaqheREoPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QAmqPBLngxPwsCdguYoPYu6oN7fQEk0IUqE8Or1dKweg242wooa2nDCod2EK0/KzRG0IberSmAAjOb+7GJ9/FZ79y1XcvbXGiSNrhknsti06JzGEgWfZ6e/1Xs/ijoX0pCAXiHeXLvlY1DxukJrRzdZMo7mB7KuJpgfkY8a/OoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNEjvHVm; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNEjvHVm"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-747fc7506d4so265491b3a.0;
        Fri, 27 Jun 2025 11:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751049601; x=1751654401; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siWhviHf5s5kb5i61JeksO/RFhcaUxLVRTQZ76XuioA=;
        b=aNEjvHVmP8UM+rcvDQxA2Yp3V7+htk8A525O2APuo094Ytibu8KXfl6O0NfBlqcI3v
         o9NlMtW0btjEXW4mmhDWRZzJFPQW1mQr+V0BF9xbWCl84hfj+qazoT2P7XwDCGO2n6R7
         EqDJgrjMsgp/xTMytDxSsWsgoauKwuH+H2mgyCjjjLBYS6leNyXemmPaFLTjguBZxu+6
         6mcIrLXdQ5aMIhh6UthUivH/dDUTrDZkXuH/HvhuSvpFX899jPS9umO3N4J7oDYUNxfJ
         dJU1RgQh/6Xh9/ZTD7SDUiAYjKcdhriNNDxyCa80PJYkgXuSzMXHN3cmAdJ29bDvcwjv
         bW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751049601; x=1751654401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siWhviHf5s5kb5i61JeksO/RFhcaUxLVRTQZ76XuioA=;
        b=Jmm+o3zzPgYpTSFNuAnJOnGtGx4xzo6hRftBUGeKla8HqHdlFX5939P1HloOAUqkJ0
         Hfeggj8gn9bl57lbti4oFBYY+0NKpKBU273H4poKs0FN/CFAHXygv29bGJev1VmxRlZ6
         UUEXvDHr7PRyge8xnYqZGOVagvOzJA95heoQ+q9OfkPr2dtR5oRgdcvJWwxeu+JOGILW
         BnVzh5cjeLHzr27AJRuOMWvwIk5A5mvL42hlhe3TQQi49usWBlIrtnNDNMOcl5N2kVmT
         FAO1FfDTnOKJ5L0S6RF8jvsGumecFRigCLJZYtER0yc/zvGiYSjHlyLepitFDxKDG3MJ
         RcTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6QirY42HqnuY5pfoP2zy69DXIVA46ZNHbyBGvLSADh5eCTwhNPu0h/bww/zcwHVV2hvY0EtSBzTLpC70U@vger.kernel.org, AJvYcCXyEgZFnQ4NNJD/5OR5YmSCB1usK6sH93F4t6DxKZQxE3ggvWBrjyFqjaDR9qjzwc67qxVoBRK6b57F@vger.kernel.org
X-Gm-Message-State: AOJu0YwXy2gRaGKo9E4M9UTZPe3JeelD28HE4SuJkIDNBErEuzvz5Z/m
	zeTlB9cY2CEQN6gQJ/XmWyzgNct9E/spkpK+dPTew1zq6cUG3GxR+NX9zbgbF7syDG65I+vJb4C
	NugiRqKptsRImT75aDcW3xqng6j9BPG0=
X-Gm-Gg: ASbGncs/VikfyHfFvtL2mZjZQSSt2M0yYbB4iNb/y20+GA6v0FHvs7WoMJHjXTkTKHJ
	TFBLhYaUjdEQzQH4/FKnNIxPZHi6yQWjF7Nzgn0Cy8qaUfK6JvPsnZ9a2o9OPhhOeUfllX9Y7Bf
	qYIwthFpzYm4vVyF017SwDA+aYV3ceM5/SEYOumNRwrJs=
X-Google-Smtp-Source: AGHT+IG7DXpgyz78HE/l0Kl92IMNPGEMkpBChVBoXCc4zEE1USg0kAy1xclBltkrt4z/w0HTXdSmRFpCE0CJy5cjrH8=
X-Received: by 2002:a05:6a00:9283:b0:736:3979:369e with SMTP id
 d2e1a72fcca58-74af6ee09d2mr5846339b3a.9.1751049600545; Fri, 27 Jun 2025
 11:40:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620213447.56392-1-aford173@gmail.com> <CAJ+vNU0caeeC6in5dO_jkkbYNAnTL7drBZcmNBsstbrPWqUkHw@mail.gmail.com>
In-Reply-To: <CAJ+vNU0caeeC6in5dO_jkkbYNAnTL7drBZcmNBsstbrPWqUkHw@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 27 Jun 2025 13:39:48 -0500
X-Gm-Features: Ac12FXwEbq0LZniaWzZz7izf_58TqugWsShMRtxczDzTY_dudWpf8_R6poipXQI
Message-ID: <CAHCN7x++XGXu6DsPaOc2EpAbxzy+RZbDq5A5-j5a4roGDhv4fQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mm-beacon: Fix HS400 USDHC clock speed
To: Tim Harvey <tharvey@gateworks.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 12:56=E2=80=AFPM Tim Harvey <tharvey@gateworks.com>=
 wrote:
>
> On Fri, Jun 20, 2025 at 2:52=E2=80=AFPM Adam Ford <aford173@gmail.com> wr=
ote:
> >
> > The reference manual for the i.MX8MM states the clock rate in
> > MMC mode is 1/2 of the input clock, therefore to properly run
> > at HS400 rates, the input clock must be 400MHz to operate at
> > 200MHz.  Currently the clock is set to 200MHz which is half the
> > rate it should be, so the throughput is half of what it should be
> > for HS400 operation.
> >
> > Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini developme=
nt kit")
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arc=
h/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> > index 21bcd82fd092..8287a7f66ed3 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> > @@ -294,6 +294,8 @@ &usdhc3 {
> >         pinctrl-0 =3D <&pinctrl_usdhc3>;
> >         pinctrl-1 =3D <&pinctrl_usdhc3_100mhz>;
> >         pinctrl-2 =3D <&pinctrl_usdhc3_200mhz>;
> > +       assigned-clocks =3D <&clk IMX8MM_CLK_USDHC3>;
> > +       assigned-clock-rates =3D <400000000>;
> >         bus-width =3D <8>;
> >         non-removable;
> >         status =3D "okay";
> > --
> > 2.48.1
> >
> >
>
> Hi Adam,
>
> This caught my interest. Where in the IMX8MMRM do you see this and
> would it also apply to the IMX8MP? (You've patched your IMX8MM and
> IMX8MN boards).

My 8MP board already appears to be running at 400MHz, but I did check.
The reference I found was in the 8MM TRM, under 10.3.3.5 Clock
generator, there is a note:

CLK is different for the SDR and DDR modes.
- In the SDR mode, CLK is equal to the internal working clock (card_clk).
- In the DDR mode, CLK is equal to card_clk/2.

>
> Have you encountered any issues when running eMMC at HS400 due to this
> or is it just something you noticed in the RM more recently like with

One of my colleagues reported that the eMMC was running slower than he
expected, and I looked at the reference clock and noticed the 200MHz.
He asked if it needed to run 2x that since HS400 clocks on both edges.
I looked it up and found the note from above.  When I increased the
rate to 400MHz from 200MHz, the throughput doubled. I also noticed
some other boards, including the reference from NXP had the clock rate
set to 400MHz, so I don't think anything unreasonable.

adam

> my recent patch that lowers SPI clock due to an obscure RM note [1]
>
> Best Regards,
>
> Tim
> [1] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=3D=
965976&archive=3Dboth
