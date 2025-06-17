Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3F3212B3B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750169562; cv=none; b=EcJS8LyhrSVLguxj9nwpJix38iuJbmjXOSkRgPr7HlVu6l5bV8tQ3MJhoAex0s1nV8xPqo1l7Ee7Le6LD54v+tajtdetDoGg3pEYK+4IBBhqRlbi+zdCecuU6Z+KAeZHptZ3fYwyBLo1AKiAHAGTiAKGI57zpzqY6/jZ/wwWbVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750169562; c=relaxed/simple;
	bh=0s2dRbN0g2gKz6XQ+HO2LSarbkcOLvedvxAPVmt+IDU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=i8bI9kAoTQMt090p53IXqNwU6ecdw5kJFqXMdR+4CMeqJGD8jLb282hwATyVdv/4WjTjfKKJ1SJWE5/liWfaaR4pmef212OkLXks7tZIZLj5fCZnOCKEUaQf0SVIKMe/eBh0524opkycU3Z42gn/zslH4teViIauJLvaE5c3UtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=csKXF/NL; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="csKXF/NL"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1750169555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EU6wYxxis5OVyKQeXPeKsMgd/+hFjCLFtAdHnU0fngg=;
	b=csKXF/NLXzJ1s3RyHE5JxoPiKYUNxWkDu+UfyYwZ3JsUfASSP3vLk3Zsb6mNCI3RBcEF7w
	nhncl6wMcDAQSbqNOE0tAH/CrmjlrlE7J4robyP6OJajpgPPGjnpG7F2T26uMfR39Pd5/Z
	Rpk/XjD5wJHpJIS9avPxV1sIPR9SubcSzccGWeKvOFGRzskyqBy0ua51kmVZrB3yRzKkqO
	XTsBvHplABC7+GGbHWrBsSc3wuHflwWEFnZBciaKvapVA5QJ64cSs4UCqloJ8Bm9BYTxJI
	9iDDoRMPsupSFLiXbWzNPHvvU3PvaelbsXcGJ6i+5Xh6hJtuD9PjKxrMA/8xUQ==
Content-Type: multipart/signed;
 boundary=cdab7635ac7d132188f79799f8586cac554d0abe4ed63d598f1e12607abe;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 17 Jun 2025 16:12:23 +0200
Message-Id: <DAOVBOKLXLS2.S9MXDD29X68J@cknow.org>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-phy@lists.infradead.org>
Subject: Re: [PATCH 2/5] dt-bindings: phy: rockchip-inno-csi-dphy: add
 rk3588 variant
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: <michael.riesch@collabora.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, "Vinod Koul"
 <vkoul@kernel.org>, "Kishon Vijay Abraham I" <kishon@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Jagan Teki" <jagan@amarulasolutions.com>,
 "Sebastian Reichel" <sebastian.reichel@collabora.com>, "Collabora Kernel
 Team" <kernel@collabora.com>
References: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
 <20250616-rk3588-csi-dphy-v1-2-84eb3b2a736c@collabora.com>
In-Reply-To: <20250616-rk3588-csi-dphy-v1-2-84eb3b2a736c@collabora.com>
X-Migadu-Flow: FLOW_OUT

--cdab7635ac7d132188f79799f8586cac554d0abe4ed63d598f1e12607abe
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

I'm (unfortunately) not seeing any @rock-chips.com recipients ...

On Tue Jun 17, 2025 at 10:54 AM CEST, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
>
> The Rockchip RK3588 variant of the CSI-2 DPHY features two reset lines.
> Add the variant and allow for the additional reset.
>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../bindings/phy/rockchip-inno-csi-dphy.yaml       | 60 ++++++++++++++++=
++++--
>  1 file changed, 55 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy=
.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> index 5ac994b3c0aa..6755738b13ee 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> @@ -21,6 +21,7 @@ properties:
>        - rockchip,rk3326-csi-dphy
>        - rockchip,rk3368-csi-dphy
>        - rockchip,rk3568-csi-dphy
> +      - rockchip,rk3588-csi-dphy
> =20
>    reg:
>      maxItems: 1
> @@ -39,18 +40,49 @@ properties:
>      maxItems: 1
> =20
>    resets:
> -    items:
> -      - description: exclusive PHY reset line
> +    minItems: 1
> +    maxItems: 2
> =20
>    reset-names:
> -    items:
> -      - const: apb
> +    minItems: 1
> +    maxItems: 2
> =20
>    rockchip,grf:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
>        Some additional phy settings are access through GRF regs.
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,px30-csi-dphy
> +              - rockchip,rk1808-csi-dphy
> +              - rockchip,rk3326-csi-dphy
> +              - rockchip,rk3368-csi-dphy
> +              - rockchip,rk3568-csi-dphy
> +    then:
> +      properties:
> +        resets:
> +          items:
> +            - description: exclusive PHY reset line
> +
> +        reset-names:
> +          items:
> +            - const: apb
> +
> +      required:
> +        - reset-names
> +    else:
> +      properties:
> +        resets:
> +          minItems: 2
> +
> +        reset-names:
> +          minItems: 2
> +
>  required:
>    - compatible
>    - reg
> @@ -59,7 +91,6 @@ required:
>    - '#phy-cells'
>    - power-domains
>    - resets
> -  - reset-names
>    - rockchip,grf
> =20
>  additionalProperties: false
> @@ -78,3 +109,22 @@ examples:
>          reset-names =3D "apb";
>          rockchip,grf =3D <&grf>;
>      };
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        csi_dphy0: phy@fedc0000 {
> +            compatible =3D "rockchip,rk3588-csi-dphy";
> +            reg =3D <0x0 0xfedc0000 0x0 0x8000>;
> +            clocks =3D <&cru PCLK_CSIPHY0>;
> +            clock-names =3D "pclk";
> +            #phy-cells =3D <0>;
> +            resets =3D <&cru SRST_CSIPHY0>, <&cru SRST_P_CSIPHY0>;
> +            rockchip,grf =3D <&csidphy0_grf>;
> +            status =3D "disabled";
> +        };
> +    };

... which could hopefully tell us what the value is/should be for the
*required* 'power-domains' property, which is missing in this example.
IOW: the binding example is invalid according to its own binding.
(btw: you can drop the 'csi_dphy0' label)

And hopefully also for rk3568 so we can add it to rk356x-base.dtsi and
you can add it in patch 5 where it's also missing.

Grepping for "csi-dphy" in arch/arm*/boot/dts/rockchip returns:
- px30.dtsi
- rk356x-base.dtsi

With this patch set applied, we'd have a 3rd result: rk3588-base.dtsi

For all the listed compatibles, it's only actually defined in px30.dtsi.

Cheers (and sorry),
  Diederik

--cdab7635ac7d132188f79799f8586cac554d0abe4ed63d598f1e12607abe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaFF3zAAKCRDXblvOeH7b
bhpEAPwJIALkzS4QIOY/nXMwYzCnZR2In2099ChPU4fsvOLbagEAnx8/aQHAXAqa
LU1To43ksWlQApoJuHYhWu28pXyU/wo=
=w/02
-----END PGP SIGNATURE-----

--cdab7635ac7d132188f79799f8586cac554d0abe4ed63d598f1e12607abe--
