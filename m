Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5D31E86E;
	Sun,  6 Jul 2025 10:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751797442; cv=none; b=rlqnaCFnCLuLjIFIybepaN9oAQHFAyafmzpyVsPQVGH0WdRRux/NxprhMaPW9I6epAEfKYOeJ9JSwC8V84WDMbjotQTk2iLhx9IhqaVc/3lMb1G/rHitLjfdriUzVBOWGG5tMsrQnMq1RnIzzaDjBQd0MagJ5QnVAmw9F2rpsrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751797442; c=relaxed/simple;
	bh=F0263zMv8G0iKYaC5yxEj4X+irraDgFLteH9ivlO5HU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qfs5n8uDWnGz8v4LRZaAG1OARl86uv9BKqGsm7/atsuP5lOKa9RkK+9jVsSBi5zPcYc/9v1wmKCuMo6q33ONWvDd5IwNcncReLHs4RcWcJAuyUj+bEDeGCRvPqRfEY3ufvZASxhtRQvVcuVDHdlHPoSoJTPj+zgrgG7t0Afj7+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=bIhsV5Rx; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="bIhsV5Rx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ulGSgijGk7YC4OX2ohfRWb9ZlHPzonSC7Ykb9+yR8PE=; b=bIhsV5Rx1JReBI9s0QhcdYeFOr
	2A06OeQ6hmRD+/EoF6jfCAXR6MuqjNvAKN84SjrW0l03TQPhYgBsdVXPUdvySFjUBVJn+Iq3SUJy2
	rgQT6RvuAR/L0nuvAPdkCRv+0m44QJs8cw7k1yj1493jDGA62tqBO9n55Ll+VW3h0X1/bvIxwtFmO
	CeGOJ8QzRP1nOoc8IY44p/4lj7Xg6HoWcvdH3N7iQqpe58GRc76NPDUi3LrAheSFXYnqEtqgrQ9UB
	pYF8oUVNwkMlzJMyD5lt0K94x/GWsIyYMcJjM5uENGeDQfSwBHgBL+hOrVgyNGvcytiWimKBT3HZH
	mJzVYP/w==;
Received: from i53875a35.versanet.de ([83.135.90.53] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uYMWu-0002nC-9F; Sun, 06 Jul 2025 12:23:28 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Alexey Charkov <alchark@gmail.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, Detlev Casanova <detlev.casanova@collabora.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: display: vop2: Add VP clock resets
Date: Sun, 06 Jul 2025 12:23:26 +0200
Message-ID: <5453371.fEcJ0Lxnt5@diego>
In-Reply-To: <20241115162120.83990-2-detlev.casanova@collabora.com>
References:
 <20241115162120.83990-1-detlev.casanova@collabora.com>
 <20241115162120.83990-2-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 15. November 2024, 17:20:40 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Detlev Casanova:
> Add the documentation for VOP2 video ports reset clocks.
> One reset can be set per video port.
>=20
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../display/rockchip/rockchip-vop2.yaml       | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-=
vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop=
2.yaml
> index 2531726af306b..5b59d91de47bd 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.ya=
ml
> @@ -65,6 +65,26 @@ properties:
>        - const: dclk_vp3
>        - const: pclk_vop
> =20
> +  resets:
> +    minItems: 5
> +    items:
> +      - description: AXI clock reset.
> +      - description: AHB clock reset.
> +      - description: Pixel clock reset for video port 0.
> +      - description: Pixel clock reset for video port 1.
> +      - description: Pixel clock reset for video port 2.
> +      - description: Pixel clock reset for video port 3.
> +
> +  reset-names:
> +    minItems: 5
> +    items:
> +      - const: aclk
> +      - const: hclk

the vop1 uses "axi" and "ahb" (and "dclk") for these reset names.

The vendor vop2 code also uses that name in comments, like
/*
 * Reset AXI to get a clean state, which is conducive to recovering
 * from exceptions when enable at next time(such as iommu page fault)
 */

So for these two we're not resetting clocks, but the parts of the
vop2 ... so I'd strongly wish for matching names for the vop2 :-)

Thanks
Heiko



> +      - const: dclk_vp0
> +      - const: dclk_vp1
> +      - const: dclk_vp2
> +      - const: dclk_vp3
> +
>    rockchip,grf:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> @@ -128,6 +148,11 @@ allOf:
>          clock-names:
>            minItems: 7
> =20
> +        resets:
> +          minItems: 6
> +        reset-names:
> +          minItems: 6
> +
>          ports:
>            required:
>              - port@0
> @@ -152,6 +177,11 @@ allOf:
>          clock-names:
>            maxItems: 5
> =20
> +        resets:
> +          maxItems: 5
> +        reset-names:
> +          maxItems: 5
> +
>          ports:
>            required:
>              - port@0
> @@ -183,6 +213,16 @@ examples:
>                                "dclk_vp0",
>                                "dclk_vp1",
>                                "dclk_vp2";
> +                resets =3D <&cru SRST_A_VOP>,
> +                         <&cru SRST_H_VOP>,
> +                         <&cru SRST_VOP0>,
> +                         <&cru SRST_VOP1>,
> +                         <&cru SRST_VOP2>;
> +                reset-names =3D "aclk",
> +                              "hclk",
> +                              "dclk_vp0",
> +                              "dclk_vp1",
> +                              "dclk_vp2";
>                  power-domains =3D <&power RK3568_PD_VO>;
>                  iommus =3D <&vop_mmu>;
>                  vop_out: ports {
>=20




