Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0C1204090;
	Thu, 17 Apr 2025 06:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744871954; cv=none; b=EpfNrDiTrij2YQ+0NaPKyMDjm62Hg2/dchPkVOGvM81jDW2j8pguJkok6CGYYmqUo/wQVxECK5+SEGgmz/Rw+C9eBtT6eREsfNkwfaDQZS7XXKs5Wvum+BveTyA38FlTs5+QlTG/InGkxSjDXox0alTAPtIcjU8VJhWjaAZqpCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744871954; c=relaxed/simple;
	bh=peHTTsxBFSa6Jdp4XIFMvH0WV8caGlWnOYqbEHFv97c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lFXmYzEj8F1v0Fhjt2tJBNMiZEGCc0Dq+XYNd6vLWkUZcHnrwggeMkgWfVMcJKsI1DtmX45PjiejvzBH1A0yD/hWQw42flrj/5LXjyGQhlHNPMc3aPaZkgeLp3jrNDYZdBSs9KL8ClnEkqG2wJXEzle5f8fO4D/2XVyHqEWOmO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=U6tYYwjY; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=biMYgslo reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="U6tYYwjY";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="biMYgslo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744871952; x=1776407952;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0uoJATyqcQrQSMZvw44Xp0gRE9A+lcSGKNpT/0B43S8=;
  b=U6tYYwjYD68GDaVC2lkdDrXnO0BYYEWD8rLA9d2VK3u6D4pcK2DCHA4Y
   hiReLXrV9hl6FoFxtPhQB4HjBZ7K8sE6snecCgJTDRV9BgGpp5slnxxPl
   OJ4Teg21Lhpv4XtftJxXlNsHz1wWPMHgwpEOR935rppm8QlAc0ITsBssz
   u3l8DrDlHNyj3KXX4TsLNr6B8TZXi8WxNWFRjGEWErNad3vRAmWk/xV+n
   UUrWA938StbZd8eZHpm2vtLROUu0sh9Uom8nwe7MvDtIAHOSM7oFUhfs8
   y1ePMieKpPwszuB4bwUPuBHsB1QiqAbqIOr3Pr8RGe19fFlZMTn5JtGUZ
   Q==;
X-CSE-ConnectionGUID: hqLQ5uwsTgyys5AiJv9tPA==
X-CSE-MsgGUID: iEj/ubU5TvmL4Wi3uOYGvA==
X-IronPort-AV: E=Sophos;i="6.15,218,1739833200"; 
   d="scan'208";a="43583950"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 17 Apr 2025 08:37:59 +0200
X-CheckPoint: {6800A1C6-29-7141A0B0-E6EDEC14}
X-MAIL-CPID: 36C074C3F2A1B9B0CE2A889E02FB02E6_3
X-Control-Analysis: str=0001.0A006378.6800A1C6.0038,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 50B7116169D;
	Thu, 17 Apr 2025 08:37:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744871873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0uoJATyqcQrQSMZvw44Xp0gRE9A+lcSGKNpT/0B43S8=;
	b=biMYgslofK0d6rk0y53PzqwfBiViYBM2gICLIMa3h5u0Ghqtpuc95VnxPn5ZTiHQhJiUH3
	7EnblQ8k0d2Rgst1bUtjDmzR2EQqpSINcdDUugieb94ue/X2W80uvHAxPyzRJ+LZlFy33V
	LCkZieAN53FPBHCAEhsla6WFzX8Is1+drdjJIH5bjETWHPenGrdNxr0UM8iQQzuRjeKxJ/
	iLpHdm1Y6cPdVJO/gQD3lb3A2VEcyy0lc4/U2GzOk/V2Pjyozrramp0X0Yu9UPPnnUS5eV
	rSk0QPASFgGKRzJe7sHMQkQjs72W+av3SG9EeoTq17FJcIkVDlpY+ZdmiF+tAQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "open list:DRM DRIVERS FOR FREESCALE IMX 5/6"
 <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject:
 Re: [PATCH 1/1] dt-bindings: display: imx: convert ldb.txt to yaml format
Date: Thu, 17 Apr 2025 08:37:49 +0200
Message-ID: <2987529.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250416211929.3502902-1-Frank.Li@nxp.com>
References: <20250416211929.3502902-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Mittwoch, 16. April 2025, 23:19:27 CEST schrieb Frank Li:
> Convert ldb.txt to yaml format.
>=20
> Additional changes
> - fix clock-names order to match existed dts file.
> - remove lvds-panel and iomuxc-gpr node in examples.
> - fsl,imx6q-ldb fail back to fsl,imx53-ldb.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/display/imx/fsl,imx6q-ldb.yaml   | 182 ++++++++++++++++++
>  .../devicetree/bindings/display/imx/ldb.txt   | 146 --------------
>  2 files changed, 182 insertions(+), 146 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx=
6q-ldb.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/imx/ldb.txt
>=20
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.=
yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.yaml
> new file mode 100644
> index 0000000000000..7edd5f28b1372
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.yaml
> @@ -0,0 +1,182 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx6q-ldb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale LVDS Display Bridge (ldb)
> +
> +description:
> +  The LVDS Display Bridge device tree node contains up to two lvds-chann=
el
> +  nodes describing each of the two LVDS encoder channels of the bridge.
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - fsl,imx53-ldb
> +      - items:
> +          - const: fsl,imx6q-ldb
> +          - const: fsl,imx53-ldb

My DT bindings foo is not that great, but I would have expected something l=
ike this:
oneOf:
  - items:
      - const: fsl,imx53-ldb
  - items:
      - enum:
          - fsl,imx6q-ldb
      - const: fsl,imx53-ldb

Best regards,
Alexander

> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  gpr:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle points to the iomuxc-gpr region containing the LVDS
> +      control register.
> +
> +  clocks:
> +    minItems: 6
> +    maxItems: 8
> +
> +  clock-names:
> +    items:
> +      - const: di0_pll
> +      - const: di1_pll
> +      - const: di0_sel
> +      - const: di1_sel
> +      - const: di0
> +      - const: di1
> +      - const: di2_sel
> +      - const: di3_sel
> +    minItems: 6
> +
> +  fsl,dual-channel:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      if it exists, only LVDS channel 0 should
> +      be configured - one input will be distributed on both outputs in d=
ual
> +      channel mode
> +
> +patternProperties:
> +  '^lvds-channel@[0-1]$':
> +    type: object
> +    description:
> +      Each LVDS Channel has to contain either an of graph link to a pane=
l device node
> +      or a display-timings node that describes the video timings for the=
 connected
> +      LVDS display as well as the fsl,data-mapping and fsl,data-width pr=
operties.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +      display-timings:
> +        $ref: /schemas/display/panel/display-timings.yaml#
> +
> +      fsl,data-mapping:
> +        enum:
> +          - spwg
> +          - jeida
> +
> +      fsl,data-width:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: should be <18> or <24>
> +        enum:
> +          - 18
> +          - 24
> +
> +    patternProperties:
> +      '^port@[0-4]$':
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          On i.MX5, the internal two-input-multiplexer is used. Due to h=
ardware
> +          limitations, only one input port (port@[0,1]) can be used for =
each channel
> +          (lvds-channel@[0,1], respectively).
> +          On i.MX6, there should be four input ports (port@[0-3]) that c=
orrespond
> +          to the four LVDS multiplexer inputs.
> +          A single output port (port@2 on i.MX5, port@4 on i.MX6) must b=
e connected
> +          to a panel input port. Optionally, the output port can be left=
 out if
> +          display-timings are used instead.
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - gpr
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx5-clock.h>
> +
> +    ldb@53fa8008 {
> +        compatible =3D "fsl,imx53-ldb";
> +        reg =3D <0x53fa8008 0x4>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        gpr =3D <&gpr>;
> +        clocks =3D <&clks IMX5_CLK_LDB_DI0_SEL>,
> +                 <&clks IMX5_CLK_LDB_DI1_SEL>,
> +                 <&clks IMX5_CLK_IPU_DI0_SEL>,
> +                 <&clks IMX5_CLK_IPU_DI1_SEL>,
> +                 <&clks IMX5_CLK_LDB_DI0_GATE>,
> +                 <&clks IMX5_CLK_LDB_DI1_GATE>;
> +        clock-names =3D "di0_pll", "di1_pll",
> +                      "di0_sel", "di1_sel",
> +                      "di0", "di1";
> +
> +        /* Using an of-graph endpoint link to connect the panel */
> +        lvds-channel@0 {
> +                reg =3D <0>;
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +
> +                port@0 {
> +                    reg =3D <0>;
> +
> +                    endpoint {
> +                        remote-endpoint =3D <&ipu_di0_lvds0>;
> +                    };
> +                };
> +
> +                port@2 {
> +                    reg =3D <2>;
> +
> +                    endpoint {
> +                        remote-endpoint =3D <&panel_in>;
> +                    };
> +               };
> +        };
> +
> +        /* Using display-timings and fsl,data-mapping/width instead */
> +        lvds-channel@1 {
> +                reg =3D <1>;
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +                fsl,data-mapping =3D "spwg";
> +                fsl,data-width =3D <24>;
> +
> +                display-timings {/* ... */
> +                };
> +
> +                port@1 {
> +                     reg =3D <1>;
> +
> +                     endpoint {
> +                         remote-endpoint =3D <&ipu_di1_lvds1>;
> +                     };
> +                };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/display/imx/ldb.txt b/Docu=
mentation/devicetree/bindings/display/imx/ldb.txt
> deleted file mode 100644
> index 03653a291b549..0000000000000
> --- a/Documentation/devicetree/bindings/display/imx/ldb.txt
> +++ /dev/null
> @@ -1,146 +0,0 @@
> -Device-Tree bindings for LVDS Display Bridge (ldb)
> -
> -LVDS Display Bridge
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -The LVDS Display Bridge device tree node contains up to two lvds-channel
> -nodes describing each of the two LVDS encoder channels of the bridge.
> -
> -Required properties:
> - - #address-cells : should be <1>
> - - #size-cells : should be <0>
> - - compatible : should be "fsl,imx53-ldb" or "fsl,imx6q-ldb".
> -                Both LDB versions are similar, but i.MX6 has an addition=
al
> -                multiplexer in the front to select any of the four IPU d=
isplay
> -                interfaces as input for each LVDS channel.
> - - gpr : should be <&gpr> on i.MX53 and i.MX6q.
> -         The phandle points to the iomuxc-gpr region containing the LVDS
> -         control register.
> -- clocks, clock-names : phandles to the LDB divider and selector clocks =
and to
> -                        the display interface selector clocks, as descri=
bed in
> -                        Documentation/devicetree/bindings/clock/clock-bi=
ndings.txt
> -        The following clocks are expected on i.MX53:
> -                "di0_pll" - LDB LVDS channel 0 mux
> -                "di1_pll" - LDB LVDS channel 1 mux
> -                "di0" - LDB LVDS channel 0 gate
> -                "di1" - LDB LVDS channel 1 gate
> -                "di0_sel" - IPU1 DI0 mux
> -                "di1_sel" - IPU1 DI1 mux
> -        On i.MX6q the following additional clocks are needed:
> -                "di2_sel" - IPU2 DI0 mux
> -                "di3_sel" - IPU2 DI1 mux
> -        The needed clock numbers for each are documented in
> -        Documentation/devicetree/bindings/clock/imx5-clock.yaml, and in
> -        Documentation/devicetree/bindings/clock/imx6q-clock.yaml.
> -
> -Optional properties:
> - - pinctrl-names : should be "default" on i.MX53, not used on i.MX6q
> - - pinctrl-0 : a phandle pointing to LVDS pin settings on i.MX53,
> -               not used on i.MX6q
> - - fsl,dual-channel : boolean. if it exists, only LVDS channel 0 should
> -   be configured - one input will be distributed on both outputs in dual
> -   channel mode
> -
> -LVDS Channel
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -Each LVDS Channel has to contain either an of graph link to a panel devi=
ce node
> -or a display-timings node that describes the video timings for the conne=
cted
> -LVDS display as well as the fsl,data-mapping and fsl,data-width properti=
es.
> -
> -Required properties:
> - - reg : should be <0> or <1>
> - - port: Input and output port nodes with endpoint definitions as define=
d in
> -   Documentation/devicetree/bindings/graph.txt.
> -   On i.MX5, the internal two-input-multiplexer is used. Due to hardware
> -   limitations, only one input port (port@[0,1]) can be used for each ch=
annel
> -   (lvds-channel@[0,1], respectively).
> -   On i.MX6, there should be four input ports (port@[0-3]) that correspo=
nd
> -   to the four LVDS multiplexer inputs.
> -   A single output port (port@2 on i.MX5, port@4 on i.MX6) must be conne=
cted
> -   to a panel input port. Optionally, the output port can be left out if
> -   display-timings are used instead.
> -
> -Optional properties (required if display-timings are used):
> - - display-timings : A node that describes the display timings as define=
d in
> -   Documentation/devicetree/bindings/display/panel/display-timing.txt.
> - - fsl,data-mapping : should be "spwg" or "jeida"
> -                      This describes how the color bits are laid out in =
the
> -                      serialized LVDS signal.
> - - fsl,data-width : should be <18> or <24>
> -
> -example:
> -
> -gpr: iomuxc-gpr@53fa8000 {
> -	/* ... */
> -};
> -
> -ldb: ldb@53fa8008 {
> -	#address-cells =3D <1>;
> -	#size-cells =3D <0>;
> -	compatible =3D "fsl,imx53-ldb";
> -	gpr =3D <&gpr>;
> -	clocks =3D <&clks IMX5_CLK_LDB_DI0_SEL>,
> -		 <&clks IMX5_CLK_LDB_DI1_SEL>,
> -		 <&clks IMX5_CLK_IPU_DI0_SEL>,
> -		 <&clks IMX5_CLK_IPU_DI1_SEL>,
> -		 <&clks IMX5_CLK_LDB_DI0_GATE>,
> -		 <&clks IMX5_CLK_LDB_DI1_GATE>;
> -	clock-names =3D "di0_pll", "di1_pll",
> -		      "di0_sel", "di1_sel",
> -		      "di0", "di1";
> -
> -	/* Using an of-graph endpoint link to connect the panel */
> -	lvds-channel@0 {
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
> -		reg =3D <0>;
> -
> -		port@0 {
> -			reg =3D <0>;
> -
> -			lvds0_in: endpoint {
> -				remote-endpoint =3D <&ipu_di0_lvds0>;
> -			};
> -		};
> -
> -		port@2 {
> -			reg =3D <2>;
> -
> -			lvds0_out: endpoint {
> -				remote-endpoint =3D <&panel_in>;
> -			};
> -		};
> -	};
> -
> -	/* Using display-timings and fsl,data-mapping/width instead */
> -	lvds-channel@1 {
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
> -		reg =3D <1>;
> -		fsl,data-mapping =3D "spwg";
> -		fsl,data-width =3D <24>;
> -
> -		display-timings {
> -			/* ... */
> -		};
> -
> -		port@1 {
> -			reg =3D <1>;
> -
> -			lvds1_in: endpoint {
> -				remote-endpoint =3D <&ipu_di1_lvds1>;
> -			};
> -		};
> -	};
> -};
> -
> -panel: lvds-panel {
> -	/* ... */
> -
> -	port {
> -		panel_in: endpoint {
> -			remote-endpoint =3D <&lvds0_out>;
> -		};
> -	};
> -};
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


