Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8DD5695;
	Fri, 23 May 2025 12:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748003474; cv=none; b=Ek+dEnA4nP5GA7BDO9LkUdN3gB64nUktlA60l9fxpLNKotAzRxsvQH10uPUQzoLfGOAIhgsMAfHSnagezWOQE5jpUIGq+BTG4z85NV6cS5w/EwDShAGRVHmc5fJNrifhc01Gj7OdPD0tZn4e+SPfNkZIBXUkHNoGkTAfIrOfBr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748003474; c=relaxed/simple;
	bh=6RL7KQIOgJBaxllw15lEHWUqm8MNQgnkMaFeUS0xE7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Emix2L4JqQru+p9lr5nGglvNSDIEXRfn5WHpGSh8BOvq0dxXns6IyP9SJ7vJ9U0/Eel4uPsm8owGAIGM0EEh66Ls0aqt/NZW6D+v/wDyTSG4FTYyiacvVTaNOMHXt17iR+AlAZbIFdBvCekN2LG4pbBJwLR1UHC/CPt9wlvXmaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LveV0kGh; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LveV0kGh"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-602039559d8so9450772a12.1;
        Fri, 23 May 2025 05:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748003471; x=1748608271; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZePJaaViCvSD05MKtWm1uzZsAobi9HR7bhRGFEkvks=;
        b=LveV0kGhYDF9kbKi+JE7ELI7ktb1bN9OCOIQj1jer2N4NOjRS5tXQRCW1XNgjgVhpt
         PNox1uBj/lBUn4b8ghW/h9soz1/Jxo++3CaQtHNmDMBXjHYZPDOgbsLXWRI2aAKOYXwg
         QvE6wx3ZuDDZxuuBYA6AJwC6QUl7kik/XUISarspwzfCGw+VlaCTF7wXm0LcS+6qi/Sv
         nw9fru6mNHxwrQ12corZvoDkjOxXBjDeqKyjUgj3IDfaPQqV7mLEQJgLj//0NKyUvh3S
         kv/MK1c3dOIvto/f1Cf58gmiWFRQ1U3BwVJA3MgHp5G6uEIuj7d+18tk1zS0/TJkRXcG
         ho8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748003471; x=1748608271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZePJaaViCvSD05MKtWm1uzZsAobi9HR7bhRGFEkvks=;
        b=xPk7UuC42cazrWMeNzQB/zCr7T/R6Cm6p89yEfEjB3WJZcP71vrE0ud8nGCJyDc+YW
         ZevH43V9wi4a6urbgN/Wc0UEwaxV25zLN2sqRKYsEuNJEnxi3aUhun3Lp04GjESXUUrx
         e6xSpWcXXhKecxibCo9uKv8ayjuK5yWQfCyWPeN9VuXHqJtURDJ92P5Q7VScJQyACkZa
         IBXulnxPRGzvztRktE7t7p4p/cuOrEIp9yEkaxIrFxarelXHhHdpDp3TgyHwD7xVdaLu
         ZnNhgMOq1vezpgrfDd/P0Gd7Fvu9JbtsyULaxzEea6gjV8lmaXLRdkT0fJtmRQ8bBkHQ
         HCcw==
X-Forwarded-Encrypted: i=1; AJvYcCVUHxcXwGFMMflUTeHCUngSHw02RBtGyAFKd92T08hOebB5+Nu5qY2Ux0Nllni6O2woQQ1Gi2u2eRrd@vger.kernel.org, AJvYcCXi2grKaoRJAuM4EwwE9oxi5L3Iryu3GEj4qn684AGCY2xmNUKl75Bh/Sk62rIivnhVW/oR4G5xRf/25bbG@vger.kernel.org, AJvYcCXye4jqRkw81zsgMwqBOGPdzb4sj7gKr494wuoGYbhcLyIy73SL+DYu+YJVS67bXvy/4z+hHezLXetB@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwp+RFvu+gBXfuAWR5jnnZYj9mYcU89wOAb06MyXbQG26rItZB
	wqaYggei+y0B4M1uug+BlTEbsODUlH1qY3HESLcrJb1k0+PVGtgSnK/TJadFoFFmDm7a8dLE+Ug
	TXNZ1EScHf1l0/l33AosqAHJ9+EPDHGY=
X-Gm-Gg: ASbGnctHnp1ThRsY1AeJrhqOo4EarX2Bsv3Cr5/D4WNBYCdoFVcTYev5Cy86oYbN4gS
	Gu7uXDgPfbszYL9tQDAE68XdgRFeV3HiZPFmENjxAyBE7Six5BQxyWVyFGZaQ59YRBwHWa8teMC
	6BLDQodGnB6LfHUXSntAPHkmotMtU3V/zo
X-Google-Smtp-Source: AGHT+IGWlJUkoqEM1lKufCkJoGQC1KPn5qxbYU6vzVhsAOysE3E9HU2ESod2o4cWjRIgZJsMEdsYZE4ddIeAwpI8ivY=
X-Received: by 2002:a17:907:d05:b0:ad5:1c28:3c4b with SMTP id
 a640c23a62f3a-ad536f29859mr2451295366b.52.1748003470843; Fri, 23 May 2025
 05:31:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523104552.32742-1-ziyao@disroot.org> <20250523104552.32742-2-ziyao@disroot.org>
In-Reply-To: <20250523104552.32742-2-ziyao@disroot.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 23 May 2025 20:30:57 +0800
X-Gm-Features: AX0GCFuUC-pGEjSv1O0q4b7QC2Sp4Bks5MdQhMyjc7562FwoYKnYCHzHRGmQXp0
Message-ID: <CAMpQs4JRy+Q2D5B9cOLyuD=8EcWNqqyhJcm+X5wiqTgjy5cikA@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: clock: Document Loongson 2K0300 clock controller
To: Yao Zi <ziyao@disroot.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, Mingcong Bai <jeffbai@aosc.io>, 
	Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 6:46=E2=80=AFPM Yao Zi <ziyao@disroot.org> wrote:
>
> Document the clock controller shipped in Loongson 2K0300 SoC, which
> generates various clock signals for SoC peripherals.
>
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  .../bindings/clock/loongson,ls2k0300-clk.yaml | 52 ++++++++++++++++++
>  .../dt-bindings/clock/loongson,ls2k0300-clk.h | 54 +++++++++++++++++++
>  2 files changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/loongson,ls2k=
0300-clk.yaml

I don't think a new binding file for 2K0300 is needed. Adding
compatible entries to loongson,ls2k-clk.yaml would be more appropriate
as they are almost all similar.

>  create mode 100644 include/dt-bindings/clock/loongson,ls2k0300-clk.h
>
> diff --git a/Documentation/devicetree/bindings/clock/loongson,ls2k0300-cl=
k.yaml b/Documentation/devicetree/bindings/clock/loongson,ls2k0300-clk.yaml
> new file mode 100644
> index 000000000000..d96b9d7cb7c4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/loongson,ls2k0300-clk.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/loongson,ls2k0300-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson-2K0300 SoC Clock Controller
> +
> +maintainers:
> +  - Yao Zi <ziyao@disroot.org>
> +
> +description: |
> +  The Loongson 2K0300 clock controller generates various clocks for SoC
> +  peripherals. See include/dt-bindings/clock/loongson,ls2k0300-clk.h for
> +  valid clock IDs.
> +
> +properties:
> +  compatible:
> +    const: loongson,ls2k0300-clk
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: External 120MHz reference clock
> +
> +  clock-names:
> +    items:
> +      - const: ref_120m
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clk: clock-controller@16000400 {
> +        compatible =3D "loongson,ls2k0300-clk";
> +        reg =3D <0x16000400 0x100>;
> +        clocks =3D <&ref_120m>;
> +        clock-names =3D "ref_120m";
> +        #clock-cells =3D <1>;
> +    };
> diff --git a/include/dt-bindings/clock/loongson,ls2k0300-clk.h b/include/=
dt-bindings/clock/loongson,ls2k0300-clk.h
> new file mode 100644
> index 000000000000..5e8f7b2f33f2
> --- /dev/null
> +++ b/include/dt-bindings/clock/loongson,ls2k0300-clk.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (C) 2025 Yao Zi <ziyao@disroot.org>
> + */
> +#ifndef _DT_BINDINGS_CLK_LOONGSON_LS2K300_H_
> +#define _DT_BINDINGS_CLK_LOONGSON_LS2K300_H_
> +
> +/* Derivied from REFCLK */
> +#define LS2K0300_CLK_STABLE                    0
> +#define LS2K0300_PLL_NODE                      1
> +#define LS2K0300_PLL_DDR                       2
> +#define LS2K0300_PLL_PIX                       3
> +#define LS2K0300_CLK_THSENS                    4
> +
> +/* Derived from PLL_NODE */
> +#define LS2K0300_CLK_NODE_DIV                  5
> +#define LS2K0300_CLK_NODE_PLL_GATE             6
> +#define LS2K0300_CLK_NODE_SCALE                        7
> +#define LS2K0300_CLK_NODE_GATE                 8
> +#define LS2K0300_CLK_GMAC_DIV                  9
> +#define LS2K0300_CLK_GMAC_GATE                 10
> +#define LS2K0300_CLK_I2S_DIV                   11
> +#define LS2K0300_CLK_I2S_SCALE                 12
> +#define LS2K0300_CLK_I2S_GATE                  13
> +
> +/* Derived from PLL_DDR */
> +#define LS2K0300_CLK_DDR_DIV                   14
> +#define LS2K0300_CLK_DDR_GATE                  15
> +#define LS2K0300_CLK_NET_DIV                   16
> +#define LS2K0300_CLK_NET_GATE                  17
> +#define LS2K0300_CLK_DEV_DIV                   18
> +#define LS2K0300_CLK_DEV_GATE                  19
> +
> +/* Derived from PLL_PIX */
> +#define LS2K0300_CLK_PIX_DIV                   20
> +#define LS2K0300_CLK_PIX_PLL_GATE              21
> +#define LS2K0300_CLK_PIX_SCALE                 22
> +#define LS2K0300_CLK_PIX_GATE                  23
> +#define LS2K0300_CLK_GMACBP_DIV                        24
> +#define LS2K0300_CLK_GMACBP_GATE               25
> +
> +/* Derived from CLK_DEV */
> +#define LS2K0300_CLK_USB_SCALE                 26
> +#define LS2K0300_CLK_USB_GATE                  27
> +#define LS2K0300_CLK_APB_SCALE                 28
> +#define LS2K0300_CLK_APB_GATE                  29
> +#define LS2K0300_CLK_BOOT_SCALE                        30
> +#define LS2K0300_CLK_BOOT_GATE                 31
> +#define LS2K0300_CLK_SDIO_SCALE                        32
> +#define LS2K0300_CLK_SDIO_GATE                 33
> +
> +#define LS2K0300_CLK_GMAC_IN                   34
> +
> +#endif // _DT_BINDINGS_CLK_LOONGSON_LS2K300_H_
> --
> 2.49.0
>
>

--=20
Thanks.
Binbin
