Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B992B9A4;
	Fri, 30 May 2025 02:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748571680; cv=none; b=aMr1IVRgNpucrWs9eF7EOARdmWszltpo8S1HMKESqRjQdFG00bDpzfPfTDm+q6dkEnGeTJU1okCgQzSeMWKyDy3e574QgpnUl6RikOt/vKZKPxx0yjJyz8e8e+iVaeHxj25og90Olm169l7wVENX39hLmKVZVVkGyoHsZkbCdto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748571680; c=relaxed/simple;
	bh=Z5S/u7bBXJz+UJbmVHinb1QfE/kpI3juJH+VPbf0yqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cfQf8/xOvAY3kWGV0V0edhUs9tnWCha4PWqJlZ+5XVYhrzgfqq3hJE8+oSwLm5/EjAc1g9ocIpXPLCM/XVFJwsae6epIekCl2uVY3FXJR/q+0f9rwkC13DW2KIkmuIx/J9nClunrLbjrU6qXPkX07MtatDlWHfZEZAmXfm4G6wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7EQwxWL; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7EQwxWL"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3dc75fe4e9bso8904945ab.0;
        Thu, 29 May 2025 19:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748571677; x=1749176477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmH5dt7dkmT0sqR1VIsfV7vNMyQYFdcO4lpGZIrbck0=;
        b=m7EQwxWLS/7Rlz3wSA43qjKYJt9DbWEhq+bpXb23ITXnYqYvg5i3U/RqI2TH3FC/Ln
         10ktWI7BJ1Cj4j1t0WUAP2G6lN+b3G5JqR1oxIa9boA3GDo62PtoXCbzdfRnDR5ax/J4
         1RuGK4ZQJhwvNRBjEWRPSQz4OroHqUwPN3j9x3+a6Q6IKBEvO2mtOX3sa3a9Wb/kjIp4
         XqtWJfPbmVKr7XkjoCaQhe/3xNN3mcnYM3cs3F08F7dF0JqBnwzL9vpiD6vBu+3js6F4
         prvXOoLs30JVHEXLPtrNGlyDytw57J0Akmeeq/jLum8OKUHy4+QkYviu6TMXF274MrhP
         vvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748571677; x=1749176477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HmH5dt7dkmT0sqR1VIsfV7vNMyQYFdcO4lpGZIrbck0=;
        b=R3P+W/FbLzI+UHFlaLulgkeM47BvZt1QPCtBSQJaVnPxRA5dQ3V1xFo6c8icBW8mv+
         evKh3duI6nG2lfdxh+eexbD42tY6ZVkZvqS5AZ5tHBJKhWRJ5vElcEJb81whkrurI3EF
         vakcnCFIZc3eSciFQqav5BdMX3iyQIjYmgUNDmudjWP7H/MpMBUSVAl1Gk0/i+b8OyuV
         6Dvs45bNfa1AIaVNESl6smIyORWxTuvngeivkEvljVcWuaQkoznLsgIPyAbZjc22ORb1
         iVp3iNL6QPqgzsuf5f/ePRpYEpLWBPcgleY8LOtz5Hhjp4VUgChYk6tzpQHM+CuLT8JF
         sh9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAPNH3vQXkG3ROxBlNXuH7iXYAx6xfSxdsDGVcq0k6fGxUOqv2J8tiuWXYVx/B1+YMQWGYGB+YAJ13@vger.kernel.org, AJvYcCX0e7pr+OWtfaL49BWmYAUtPauH/S76hYTMWmlVX/mdsknTxbGC6SsfEBNJF0hZkLHyRUFJtZ1I/8AR7oqN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2+RNdMj2rOUnSnXT6kTpVA39v9L8lWq4LnuJJfO8TeOoHlc+U
	r3eST7z5nENDrUa8/HAzaqlSm1Wkz0/eROBQihWqBYbkLboyrqsZLK5vYpOS4I9OytY6DDH9WgU
	3b+0qOWG4vYNiUjdJZ26MRRCbEOEGNrTGG3ok
X-Gm-Gg: ASbGncvvOKIlcABK58J7wkrXGnujb2LOA2moxHs2enu6HSNcA0BaTOv4MvTTxJIBmfQ
	+zfQp7UEUtptT98O0SUTICJeiQNlvDeMrbvf7XxwyoMz2PpdgxAsa+vSqPM+RjyIb1SWlH02BUn
	/HitXFgu2A5EBEZ8KfOjzQJkq55DrdMBcu
X-Google-Smtp-Source: AGHT+IF3V2Reg6jytvBoWQIFfYDbO3xHDMdxyQHBKHDQU6qnKv9QNLMNJun7za9/cXwvOQopUbNOEo2NaT5EoYkZ2lc=
X-Received: by 2002:a05:6e02:b27:b0:3dc:8a59:9d91 with SMTP id
 e9e14a558f8ab-3dd9a2f69b8mr15435425ab.5.1748571677153; Thu, 29 May 2025
 19:21:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528015837.488376-1-shengjiu.wang@nxp.com>
 <20250528015837.488376-5-shengjiu.wang@nxp.com> <20250528083704.ne6wyoj6vcmy7azq@pengutronix.de>
In-Reply-To: <20250528083704.ne6wyoj6vcmy7azq@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 30 May 2025 10:21:03 +0800
X-Gm-Features: AX0GCFsoAsJ1BSh1zryHTek_C0ndoEf3QlabWsiqEfnyP_mssnH9rTINpQzDe4g
Message-ID: <CAA+D8AMDbenx8scnBZdABAxF8MaYsBRzxXZjgGhMRbCJ-1wwcw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] arm64: dts: imx943-evk: add sound-wm8962 support
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, carlos.song@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 4:37=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> Hi,
>
> On 25-05-28, Shengjiu Wang wrote:
> > Add WM8962 codec connected to SAI1 interface.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx943-evk.dts | 79 ++++++++++++++++++++
> >  1 file changed, 79 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/=
boot/dts/freescale/imx943-evk.dts
> > index ff6e9ac5477f..da08aaa95904 100644
> > --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> > @@ -36,6 +36,15 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
> >               enable-active-high;
> >       };
> >
> > +     reg_audio_pwr: regulator-wm8962-pwr {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-max-microvolt =3D <3300000>;
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-name =3D "audio-pwr";
> > +             gpio =3D <&pcal6416_i2c3_u171 12 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +     };
> > +
> >       reserved-memory {
> >               ranges;
> >               #address-cells =3D <2>;
> > @@ -50,6 +59,21 @@ linux,cma {
> >               };
> >       };
> >
> > +     sound-wm8962 {
> > +             compatible =3D "fsl,imx-audio-wm8962";
>
> Out of curiosity did you considered making use of "audio-graph-card2"?
>
> The "fsl,imx-audio-wm8962" seems like a pretty simple sound card which
> could be added via the "audio-graph-card2" as well. Don't get me wrong,
> it's not wrong what you're doing here but making use of the generic
> sound card would be nice because it's very common to just copy'n'paste
> the audio integration from the corresponding evk.dts file.

Thanks for the suggestion.

WM8962 has a function .set_pll(), which hasn't been supported in
audio-graph-card2.  so we still use fsl,imx-audio-wm8962.

Best regards
Shengjiu Wang

>
> Regards,
>   Marco
>
> > +             audio-codec =3D <&wm8962>;
> > +             audio-cpu =3D <&sai1>;
> > +             audio-routing =3D "Headphone Jack", "HPOUTL",
> > +                     "Headphone Jack", "HPOUTR",
> > +                     "Ext Spk", "SPKOUTL",
> > +                     "Ext Spk", "SPKOUTR",
> > +                     "AMIC", "MICBIAS",
> > +                     "IN3R", "AMIC",
> > +                     "IN1R", "AMIC";
> > +             hp-det-gpio =3D <&pcal6416_i2c3_u48 14 GPIO_ACTIVE_HIGH>;
> > +             model =3D "wm8962-audio";
> > +     };
> > +
> >       memory@80000000 {
> >               reg =3D <0x0 0x80000000 0x0 0x80000000>;
> >               device_type =3D "memory";
> > @@ -103,6 +127,28 @@ i2c@4 {
> >                       reg =3D <4>;
> >                       #address-cells =3D <1>;
> >                       #size-cells =3D <0>;
> > +
> > +                     wm8962: codec@1a {
> > +                             compatible =3D "wlf,wm8962";
> > +                             reg =3D <0x1a>;
> > +                             clocks =3D <&scmi_clk IMX94_CLK_SAI1>;
> > +                             AVDD-supply =3D <&reg_audio_pwr>;
> > +                             CPVDD-supply =3D <&reg_audio_pwr>;
> > +                             DBVDD-supply =3D <&reg_audio_pwr>;
> > +                             DCVDD-supply =3D <&reg_audio_pwr>;
> > +                             gpio-cfg =3D <
> > +                                     0x0000 /* 0:Default */
> > +                                     0x0000 /* 1:Default */
> > +                                     0x0000 /* 2:FN_DMICCLK */
> > +                                     0x0000 /* 3:Default */
> > +                                     0x0000 /* 4:FN_DMICCDAT */
> > +                                     0x0000 /* 5:Default */
> > +                             >;
> > +                             MICVDD-supply =3D <&reg_audio_pwr>;
> > +                             PLLVDD-supply =3D <&reg_audio_pwr>;
> > +                             SPKVDD1-supply =3D <&reg_audio_pwr>;
> > +                             SPKVDD2-supply =3D <&reg_audio_pwr>;
> > +                     };
> >               };
> >
> >               i2c@5 {
> > @@ -128,6 +174,12 @@ pcal6416_i2c3_u171: gpio@21 {
> >                               reg =3D <0x21>;
> >                               #gpio-cells =3D <2>;
> >                               gpio-controller;
> > +
> > +                             audio-pwren-hog {
> > +                                     gpios =3D <12 GPIO_ACTIVE_HIGH>;
> > +                                     gpio-hog;
> > +                                     output-high;
> > +                             };
> >                       };
> >               };
> >
> > @@ -262,6 +314,23 @@ &lpuart1 {
> >       status =3D "okay";
> >  };
> >
> > +&sai1 {
> > +     assigned-clocks =3D <&scmi_clk IMX94_CLK_AUDIOPLL1_VCO>,
> > +                       <&scmi_clk IMX94_CLK_AUDIOPLL2_VCO>,
> > +                       <&scmi_clk IMX94_CLK_AUDIOPLL1>,
> > +                       <&scmi_clk IMX94_CLK_AUDIOPLL2>,
> > +                       <&scmi_clk IMX94_CLK_SAI1>;
> > +     assigned-clock-parents =3D <0>, <0>, <0>, <0>,
> > +                              <&scmi_clk IMX94_CLK_AUDIOPLL1>;
> > +     assigned-clock-rates =3D <3932160000>,
> > +                            <3612672000>, <393216000>,
> > +                            <361267200>, <12288000>;
> > +     pinctrl-0 =3D <&pinctrl_sai1>;
> > +     pinctrl-names =3D "default";
> > +     fsl,sai-mclk-direction-output;
> > +     status =3D "okay";
> > +};
> > +
> >  &scmi_iomuxc {
> >
> >       pinctrl_ioexpander_int2: ioexpanderint2grp {
> > @@ -297,6 +366,16 @@ IMX94_PAD_GPIO_IO28__LPI2C6_SCL          0x40000b9=
e
> >               >;
> >       };
> >
> > +     pinctrl_sai1: sai1grp {
> > +             fsl,pins =3D <
> > +                     IMX94_PAD_SAI1_TXFS__SAI1_TX_SYNC       0x31e
> > +                     IMX94_PAD_SAI1_TXC__SAI1_TX_BCLK        0x31e
> > +                     IMX94_PAD_SAI1_TXD0__SAI1_TX_DATA0      0x31e
> > +                     IMX94_PAD_SAI1_RXD0__SAI1_RX_DATA0      0x31e
> > +                     IMX94_PAD_I2C2_SDA__SAI1_MCLK           0x31e
> > +             >;
> > +     };
> > +
> >       pinctrl_uart1: uart1grp {
> >               fsl,pins =3D <
> >                       IMX94_PAD_UART1_TXD__LPUART1_TX         0x31e
> > --
> > 2.34.1
> >
> >
> >
