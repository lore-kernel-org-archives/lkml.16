Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F4729344B;
	Fri, 11 Apr 2025 12:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744374892; cv=pass; b=rED0Tay/pt4rBBZqmgaEjaAwbZ2N946FBlRHXvJCnKh8f6UdL/g10TjBp2r+arhibdCdAucJU5NvkcOQ+ZOqyB3ir8Taf19mcqjuJ51ahNDEdMxF0/TuO8nUep7j+Djl330fs6jeT5G3U1vZmXMf4GJkbqm3lY+xcpxWOwVdulM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744374892; c=relaxed/simple;
	bh=Qos49NVgrAlMjMuABgHqA09+VX8Qabl+AB2UgZAZVnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWFfXaGE9zLnTnd3fk2iX5y6FWBosxdxaVeX3f1C7alSR3hhSoRo3sL/oeHEX0lNDf9Fyc1S1jbzVowUSqRVDTt1IwaiwrlcA9rOBluuNT5NiqfPvBWw27l2nl6UL3I1bmumEwtOhGSf5y4GT9RBUIWRa3QehGfdHkHgPkgHZ74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=g+apquat; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="g+apquat"
ARC-Seal: i=1; a=rsa-sha256; t=1744374871; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jAu+dIumyTWcixiH0aT0BkZ9JZKPDflHo1ApovBUplJwVJJocBl+EFKtjR659jp6tKeUvIzXbFhMbA8MtRTn1ZPnBam9PnUGxS6BaPtOIjH1A2tCXNBw23TPkV87X9+j9BaLSHTdtzuFQD3VRclClboSKCX8olp7M8GGPomiAMo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744374871; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IDhcIJLaAPZ0hY0thCIRQ8WB/yFxEgviJhFDdroGRPo=; 
	b=Q7FyUOOip/KwR4X/A/jH7VdkY97fRhqBHzO8WOMVmkiTS8oH0H3vw14RrvLqx47wijd5eDCBlaZWOCp4HQ/gT7utu8xvxbcJ62ziGl1tYV/D9vU3MsVSTlbvfl3Vp1P0OZjTvwrM0gwDku+hOP30bzmVifAzlbymlTrdRXLD1Uw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744374871;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=IDhcIJLaAPZ0hY0thCIRQ8WB/yFxEgviJhFDdroGRPo=;
	b=g+apquat2dDMp5AnqJiMZhbVK0WFh6t+sv9IytZhoB6XbIyl1wj/85aBAOUlCRQJ
	An1ZdawVyZOJKIfEh9wJjIkyL9+yzDFfK4rOXeP/CnWxtlHrLhwZ+UryxLPu9DRuCYA
	MBG0Q7Z3x5EggR2MrINCzK6XhKTMNH+MmEL/J91c=
Received: by mx.zohomail.com with SMTPS id 1744374869473393.2831161950327;
	Fri, 11 Apr 2025 05:34:29 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 477931801EB; Fri, 11 Apr 2025 14:34:26 +0200 (CEST)
Date: Fri, 11 Apr 2025 14:34:26 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: quentin.schulz@cherry.de, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dse@thaumatec.com, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v3 2/3] arm64: dts: rockchip: add dsi controller nodes on
 rk3588
Message-ID: <p5wucvjabwnkw2itlfrq6hs4wp673cnt2yzqumroz2r3zu5rts@eayxhqm5i4h2>
References: <20250226140942.3825223-1-heiko@sntech.de>
 <20250226140942.3825223-3-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ekx3fcfiyobjremz"
Content-Disposition: inline
In-Reply-To: <20250226140942.3825223-3-heiko@sntech.de>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.2/244.360.14
X-ZohoMailClient: External


--ekx3fcfiyobjremz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/3] arm64: dts: rockchip: add dsi controller nodes on
 rk3588
MIME-Version: 1.0

Hi,

On Wed, Feb 26, 2025 at 03:09:41PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>=20
> The RK3588 comes with two DSI2 controllers based on a new Synopsis IP.
> Add the necessary nodes for them.
>=20
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com> # RK3588 EVB1

Greetings,

-- Sebastian

>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk3588-base.dtsi
> index 5535d5d905f6..9f9e0d3c7722 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/clock/rockchip,rk3588-cru.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/power/rk3588-power.h>
>  #include <dt-bindings/reset/rockchip,rk3588-cru.h>
>  #include <dt-bindings/phy/phy.h>
> @@ -1406,6 +1407,62 @@ i2s9_8ch: i2s@fddfc000 {
>  		status =3D "disabled";
>  	};
> =20
> +	dsi0: dsi@fde20000 {
> +		compatible =3D "rockchip,rk3588-mipi-dsi2";
> +		reg =3D <0x0 0xfde20000 0x0 0x10000>;
> +		interrupts =3D <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks =3D <&cru PCLK_DSIHOST0>, <&cru CLK_DSIHOST0>;
> +		clock-names =3D "pclk", "sys";
> +		resets =3D <&cru SRST_P_DSIHOST0>;
> +		reset-names =3D "apb";
> +		power-domains =3D <&power RK3588_PD_VOP>;
> +		phys =3D <&mipidcphy0 PHY_TYPE_DPHY>;
> +		phy-names =3D "dcphy";
> +		rockchip,grf =3D <&vop_grf>;
> +		status =3D "disabled";
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			dsi0_in: port@0 {
> +				reg =3D <0>;
> +			};
> +
> +			dsi0_out: port@1 {
> +				reg =3D <1>;
> +			};
> +		};
> +	};
> +
> +	dsi1: dsi@fde30000 {
> +		compatible =3D "rockchip,rk3588-mipi-dsi2";
> +		reg =3D <0x0 0xfde30000 0x0 0x10000>;
> +		interrupts =3D <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks =3D <&cru PCLK_DSIHOST1>, <&cru CLK_DSIHOST1>;
> +		clock-names =3D "pclk", "sys";
> +		resets =3D <&cru SRST_P_DSIHOST1>;
> +		reset-names =3D "apb";
> +		power-domains =3D <&power RK3588_PD_VOP>;
> +		phys =3D <&mipidcphy1 PHY_TYPE_DPHY>;
> +		phy-names =3D "dcphy";
> +		rockchip,grf =3D <&vop_grf>;
> +		status =3D "disabled";
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			dsi1_in: port@0 {
> +				reg =3D <0>;
> +			};
> +
> +			dsi1_out: port@1 {
> +				reg =3D <1>;
> +			};
> +		};
> +	};
> +
>  	hdmi0: hdmi@fde80000 {
>  		compatible =3D "rockchip,rk3588-dw-hdmi-qp";
>  		reg =3D <0x0 0xfde80000 0x0 0x20000>;
> --=20
> 2.47.2
>=20
>=20

--ekx3fcfiyobjremz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmf5DFEACgkQ2O7X88g7
+pqkLQ/+MtRu/6wuVD8vKaXfYITTqMMKPNMm/y2MpaKVOVwek4rNxfOCTj2dAxgr
QY3aUQuKLEw1ljC6QWrVAUVvnbEiGb/TEwEt0AdJcP0JHkip8BcBYiRMHDN7jiz9
k3SqIXRKDnZYE2kTbH9QPgs/ebnjJPkH0g6s3uB1n+VFSHWybgo60STsrCwTQMnn
ozgz/tOwKloLhYLEv7onjpCQh36JIQ7Y9F2SOAjar8iGPy2D/pvoFpn4Ztv9EArS
iyW0SsAHFODXcrYD44w/luoq3+YIKj4j/C5H4qYl8YFVNqPKgOYQJ6aOSm/9iWfo
wZ9wEgupLu49FccxegXcYEKTFYmAp4g8jH5gpKIag3Mq2r2moy38Mb8DjxEUXNrj
hs4c9h8+dgYTNYzyRHLO3WJz5Hv8d2DsCqZ3qRvcfoi/xbA2IiF7pqYYzje/K12J
/JZUpYBV8ixlCyA5RK/UAuGvPDMOKn/TpwofWh2imW2sMw9y5ToUI2jP0hxCrTE8
3L+6JKRY67iauXez3A0ds5oRrS3EtdVX/R+oxKddD0BwtxlgcAk68XR8GHN+L5e/
ouw5bRmAUyMArUADyyNSZ20xw6bRCerWH9yYI+5UbxSxK7OoBhRgs/SeRpZsEj7M
qr106Y9szomiMFM/jeIkfdhxajGnuHIgpTBK6ivYT2VmMTB6wak=
=lXSV
-----END PGP SIGNATURE-----

--ekx3fcfiyobjremz--
