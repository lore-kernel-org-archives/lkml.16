Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB46511712;
	Thu, 19 Jun 2025 15:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750348322; cv=pass; b=Hyu9lqjgijUEf3sktqT6meY+yuhrX9NmtQ1F1/3eYNj7o2GTWTWKd6RFtKYw6s09pwBNpt5p0dsj1R75q0lG5DGroLcefxJEuCrulhoYcOwNzkfr7SNJqIBPM8ILCZJtDBQwhEYMp7PgO57EUfXSCJUt6Miy3pW8T2bX4ZOT1l0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750348322; c=relaxed/simple;
	bh=3e+MnoCUQpIjahFcmnDHaFng1/HMNPCLp9IxTyA3Fuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i20ojxpwFiZ/NHlb5SMwrqh01yDyhttZGpYmbJEDPjQSwtyTQnFAOU7iOwBeKgay425IRBXUxHZmLmoo+nqtUJavBha6Ff8KEGdKaZkN5Rul4S5F4U1TP1Wnuoe7kT9Ztw0Q+YHSEIONp6ra6crBrTDUXVi3/KebPRPpRCjQWIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=g8SBqgUo; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="g8SBqgUo"
ARC-Seal: i=1; a=rsa-sha256; t=1750348305; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IcM1T3srtgYwUeY4mYmXJciHOaGmt3kjIYtN+Ups+ny/VYTLhM5k5QvFqWV9Mit6BJsiGMY87T7RReKdf7KCUElLe4apTB8a/YZDDAKrrxsXz/ytIrGRBl+O9SixREXUpdYKq24YKgTgmfooxlvOcodvcBR4K0xmDsOqe67v5cE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750348305; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZCoeH3n1KmlC4QaPJtFmhLx7PqSf1liYHdZw1gO42lw=; 
	b=Phh5MA2v/ChxBwfja9NInH0Ma+zC8oYOhT06T/K+S99cUFWmrlndBom/CyzneWfCnJIA5P8zVPxxmqE1yRDOYoCv7sPGwSUVBugtp/onnLqp1TBLkGCakmSzmTKpXy52FutnQi9wcfU1qYUiUF2jdc7OuiKteJCSrOig6do5L0g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750348305;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=ZCoeH3n1KmlC4QaPJtFmhLx7PqSf1liYHdZw1gO42lw=;
	b=g8SBqgUor4pKiCJVPY8a80SyRdlpSyONnw5+acbP7KyUP6D0N2czMSQnvUmMKa66
	cARh0eqYABAESAjZOW/DM0O2m2KlqiCYp8wOnGvu1GLsxqSBzOC3E7IBzfto4+gvHMs
	wnPkrBJj4iuc1y9BYQgtOkV14HpnssKejnzbwm7A=
Received: by mx.zohomail.com with SMTPS id 1750348302329727.2550679522411;
	Thu, 19 Jun 2025 08:51:42 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id C6C6C1805A8; Thu, 19 Jun 2025 17:51:37 +0200 (CEST)
Date: Thu, 19 Jun 2025 17:51:37 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
	Daniel Semkowicz <dse@thaumatec.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v3 3/5] arm64: dts: rockchip: add header for RK8XX PMIC
 constants
Message-ID: <t3wbjpbw7phqvip4yvxm5kux6hor5pehzamrw6hjv3hq2b3j3n@zuf2vuhgpdpp>
References: <20250618-rk8xx-rst-fun-v3-0-081f02d3d348@cherry.de>
 <20250618-rk8xx-rst-fun-v3-3-081f02d3d348@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pu5pnebwd6cicvnp"
Content-Disposition: inline
In-Reply-To: <20250618-rk8xx-rst-fun-v3-3-081f02d3d348@cherry.de>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.2/250.326.2
X-ZohoMailClient: External


--pu5pnebwd6cicvnp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 3/5] arm64: dts: rockchip: add header for RK8XX PMIC
 constants
MIME-Version: 1.0

Hi,

On Wed, Jun 18, 2025 at 12:32:42PM +0200, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
>=20
> To make it easier to read the device tree, let's add constants for the
> rockchip,reset-mode property values that are currently only applicable
> to RK806 PMIC.
>=20
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  arch/arm64/boot/dts/rockchip/rk8xx.h | 18 ++++++++++++++++++

I think this header should be in include/dt-bindings/, otherwise the
series LGTM.

Greetings,

-- Sebastian

>  1 file changed, 18 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk8xx.h b/arch/arm64/boot/dts/r=
ockchip/rk8xx.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..a6fbef71c06493c35b0f36974=
76167aaafa24f30
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk8xx.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR MIT) */
> +/*
> + * Device Tree defines for Rockchip RK8xx PMICs
> + *
> + * Copyright 2025 Cherry Embedded Solutions GmbH
> + *
> + * Author: Quentin Schulz <quentin.schulz@cherry.de>
> + */
> +
> +#ifndef _DT_MFD_ROCKCHIP_RK8XX_H
> +#define _DT_MFD_ROCKCHIP_RK8XX_H
> +
> +/* For use with rockchip,reset-mode property */
> +#define RK806_RESTART		0
> +#define RK806_RESET		1
> +#define RK806_RESET_NOTIFY	2
> +
> +#endif
>=20
> --=20
> 2.49.0
>=20

--pu5pnebwd6cicvnp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmhUMgUACgkQ2O7X88g7
+praYQ/+OsDoV143cUMLkmfVtsK7nqdpHgi5QYeMWvwzlvie418qaE4536HiU5h6
HLJmwHAIOErsHPJFhQInCR4mCqhY9kg7BkW99taAjYfUO8kcIsyFeT9YfM2TZBPU
nI4+15OFD0C4qNeafh6jalgjbhVq1rPB2B8tO3HnU+vYRaJCf5nZm9lwP6zWJKIT
Dwc0en5+nxQySijc3A+TpSjCcAF+iEsaSwQvsase3UqHQOyfNgu3BvmPRPA7iqh+
5Z+FkZvutgSwatiDcIECaTP6xe8AC8noY+KLIr5Eoa/dy8ppeGQaCMaDoLMgJ5AF
u4G79LWzrCmF43LKo2rP+xIVrjxk2/kg+Udqctpy+mQHtNJQ614034lXd2fIMcxZ
WZEyrKDeGL53qUqZpzSKV7a8RdIGyOFrX7a7QUyENOu5/yy01U1XruBNA5BDE7cx
eoKDXMtzwpil/3JjkAgLcNV/dqusLpyf5aP3TzjORncngzI0Nwjxvbt5bimf7UVu
5TDwpt9ZAVlu4KI7W/1DHfgjphAy0+oM44Eb//yIpZI2tcHUw13mVX7nJE1++4pM
59rh+fs95SbmOAQa9ct3SG1fnzuxgNhhAL1g2SLbXW5OJDDanGFSVt+z54LjnQO4
82YihEmMJd4Y1oY8aLuTayArlQkftbTi9qZEa3jzipAb0bLU+M0=
=rZbZ
-----END PGP SIGNATURE-----

--pu5pnebwd6cicvnp--
