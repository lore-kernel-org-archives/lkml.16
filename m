Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C984278E61;
	Fri, 11 Apr 2025 12:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744374877; cv=pass; b=aH/OCPFefKIfaVNczWaPQHhBUS5Bhvb2T0MbGCfIrg9cynnMZiGtn1nmtrFnT4wa87p6TMCfjiupOrg7HWVbja6gDkHFWYlaX6HcpieoeRhnBwandEjo7rLVu5ZgmtJ6ukje6YilFAYJlE1N7QT3pVKiUhAerasxHoX/7il+3bA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744374877; c=relaxed/simple;
	bh=UEq5PfkoSU6Ys+nuDcAZobJOsCqH67yJG290ZpqXYEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQbUwRYtRq0OSMxq4p16k4uW+fKRug3rcO4kUK5hJDyM6q0ER4KNYGUcg4Z/wr8OSqeKLJDD70ffaU8CiHzrGyBQkHjJSzzSEWS/otLOA76P4Is3a8yATrUHByKSDQbF9cZLpkDlbDWW/+e23FB74Hhqgj996X5jKZ80oM1MZPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=VRhWPrxE; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="VRhWPrxE"
ARC-Seal: i=1; a=rsa-sha256; t=1744374853; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=J12NbyA007YxzZNPY2TSEROLBTteBHzZKrib0FiKJ+sAN3PegqHrru9IZwDEUFjLz/Ue9v/U6ht0GoC78IAVlqDN5Pid0huBXItrgIzgcWLoUjBBC3vPd5upnYo1emCXhzzqHdEvpqf4cXJlH1Ix5mC1vR3HTUi6dCsCFSfa1So=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744374853; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bzczYYuZcL7JZL80mwvPXP+/D/Quzt4oc+nptJFLHjA=; 
	b=F46fsv5k1hSnhCSTwpj/f5vukORYVK64vgFeNlnEB3ODiPbkuQRbtkBFGNUon+O7AeirdBStM6+/oC/HmcF5pLaJKCCLEn++e80cnXw2efLoNUmnihI2ImeiC2uD0Be1mfecJzr1C8onkRHnPvVLSqYXF4UdZdcfpQyO7CRcONI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744374853;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=bzczYYuZcL7JZL80mwvPXP+/D/Quzt4oc+nptJFLHjA=;
	b=VRhWPrxEYf/sPBQZvQ/8wIN9Ns/rvZ3q7x8o0z+nD1vMmU0uG+7i4BkwbyzYrslW
	ilPkjF+P+GswFM6AIqNQy5W62oCg3IT1J8rv/DmNKr2Wpe/vHjbpyTsnhgzmygvXziO
	TCRjvFwtWaU//XpFd0wzUJfOMSHfSf8H+1/rOq24=
Received: by mx.zohomail.com with SMTPS id 174437484240762.90746457848559;
	Fri, 11 Apr 2025 05:34:02 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id AD25C1801EB; Fri, 11 Apr 2025 14:33:56 +0200 (CEST)
Date: Fri, 11 Apr 2025 14:33:56 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: quentin.schulz@cherry.de, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dse@thaumatec.com, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v3 1/3] arm64: dts: rockchip: add mipi dcphy nodes to
 rk3588
Message-ID: <lvn74g6bcw2bxd3ciizso6pfvhp3ulxhmqrxm67zjcdx674fnv@3sxsqwsv5bin>
References: <20250226140942.3825223-1-heiko@sntech.de>
 <20250226140942.3825223-2-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fjxkfmf5zvl4ht2g"
Content-Disposition: inline
In-Reply-To: <20250226140942.3825223-2-heiko@sntech.de>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.2/244.237.79
X-ZohoMailClient: External


--fjxkfmf5zvl4ht2g
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/3] arm64: dts: rockchip: add mipi dcphy nodes to
 rk3588
MIME-Version: 1.0

Hi,

On Wed, Feb 26, 2025 at 03:09:40PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>=20
> Add the two MIPI-DC-phy nodes to the RK3588, that will be used by the
> DSI2 controllers and hopefully in some future also for camera input.
>=20
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com> # RK3588 EVB1

-- Sebastian

>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk3588-base.dtsi
> index 8b497eb5da16..5535d5d905f6 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -574,6 +574,16 @@ sys_grf: syscon@fd58c000 {
>  		reg =3D <0x0 0xfd58c000 0x0 0x1000>;
>  	};
> =20
> +	mipidcphy0_grf: syscon@fd5e8000 {
> +		compatible =3D "rockchip,rk3588-dcphy-grf", "syscon";
> +		reg =3D <0x0 0xfd5e8000 0x0 0x4000>;
> +	};
> +
> +	mipidcphy1_grf: syscon@fd5ec000 {
> +		compatible =3D "rockchip,rk3588-dcphy-grf", "syscon";
> +		reg =3D <0x0 0xfd5ec000 0x0 0x4000>;
> +	};
> +
>  	vop_grf: syscon@fd5a4000 {
>  		compatible =3D "rockchip,rk3588-vop-grf", "syscon";
>  		reg =3D <0x0 0xfd5a4000 0x0 0x2000>;
> @@ -2915,6 +2925,38 @@ usbdp_phy0: phy@fed80000 {
>  		status =3D "disabled";
>  	};
> =20
> +	mipidcphy0: phy@feda0000 {
> +		compatible =3D "rockchip,rk3588-mipi-dcphy";
> +		reg =3D <0x0 0xfeda0000 0x0 0x10000>;
> +		rockchip,grf =3D <&mipidcphy0_grf>;
> +		clocks =3D <&cru PCLK_MIPI_DCPHY0>,
> +			 <&cru CLK_USBDPPHY_MIPIDCPPHY_REF>;
> +		clock-names =3D "pclk", "ref";
> +		resets =3D <&cru SRST_M_MIPI_DCPHY0>,
> +			 <&cru SRST_P_MIPI_DCPHY0>,
> +			 <&cru SRST_P_MIPI_DCPHY0_GRF>,
> +			 <&cru SRST_S_MIPI_DCPHY0>;
> +		reset-names =3D "m_phy", "apb", "grf", "s_phy";
> +		#phy-cells =3D <1>;
> +		status =3D "disabled";
> +	};
> +
> +	mipidcphy1: phy@fedb0000 {
> +		compatible =3D "rockchip,rk3588-mipi-dcphy";
> +		reg =3D <0x0 0xfedb0000 0x0 0x10000>;
> +		rockchip,grf =3D <&mipidcphy1_grf>;
> +		clocks =3D <&cru PCLK_MIPI_DCPHY1>,
> +			 <&cru CLK_USBDPPHY_MIPIDCPPHY_REF>;
> +		clock-names =3D "pclk", "ref";
> +		resets =3D <&cru SRST_M_MIPI_DCPHY1>,
> +			 <&cru SRST_P_MIPI_DCPHY1>,
> +			 <&cru SRST_P_MIPI_DCPHY1_GRF>,
> +			 <&cru SRST_S_MIPI_DCPHY1>;
> +		reset-names =3D "m_phy", "apb", "grf", "s_phy";
> +		#phy-cells =3D <1>;
> +		status =3D "disabled";
> +	};
> +
>  	combphy0_ps: phy@fee00000 {
>  		compatible =3D "rockchip,rk3588-naneng-combphy";
>  		reg =3D <0x0 0xfee00000 0x0 0x100>;
> --=20
> 2.47.2
>=20
>=20

--fjxkfmf5zvl4ht2g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmf5DC0ACgkQ2O7X88g7
+prdKg/8D+e/PQmWiaPq92NTiX3x04IaNL3q23gGelMcchdHm/Cc52ZmqdQsq/PB
oZqOK0fOxforJ/MWJy4bFr9HevB1RhTXQoWbiE7UcoFJZlnqMEckH3VT0r8f1DcF
kKAZQ2fYjZx6JeKbTJOOYU0uhiUAEvzkMeBm34DnTxN9NL5uBRrJGGfxKP6s9uTx
uWWTPHqC1SV+8huJJwTv2vEZ+COqGzE+oqZ7s7GuUZB3HpjWeWr5FnRrI9dYfSVW
8YEaZM7h9tTlifNBvy1ice13Fn2xccgoEgbsVwsbLAmnzffwq+Aofyb2nB3FLZ6g
GRnhtsci0N+NNgwH2b8Mf56U1nJIsWaVmiSrQsBAMiRYxmXbq3J4heUcjOO3RVOM
dRThE7H04NH5suras3f30pAxLjV3gJZ+V4Pip2b3CHcmQWmXG+6AHMKuEjSWvvw+
KlgyFEs+IJZeJs1RcV3AHD0EiFu5YwOOoC+Z3MLYMIT06fWw/6jiChgCCk3hREmz
Jgx5vdaOGn6siQW1mmJEoNEr7GJVWH1hfr06s4SI9prShXocUMjcQHW4VM+1liPe
x05epWEG9+gag+dtkbiC+KvBzhcjuVeUQ89aR9fh5jqe/zmSs/ZQ/fT66CUzgCjj
3ZPdXgf9lzSJLMB0kfpMdfuXk2spNB0/IIS2FYguINZNnybWY6Q=
=pywf
-----END PGP SIGNATURE-----

--fjxkfmf5zvl4ht2g--
