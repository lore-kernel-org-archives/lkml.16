Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311E41AD403
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 06:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744613395; cv=none; b=W6qI8bJCmB5DV3r4sxNBmwjirCUfm8rss+i8o2kAizq+8aTRWUaFyrUUomZhrgDLnFl95SvrLETHGmTTSQt4brq5v4tdUFLm0jb5QhbgDiK0/xSt8iq+GG2cHZEri/ermdH/dAXAhf4IZGIqqaiQ5wxcQ7yRXH5tFHVzs0r8tL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744613395; c=relaxed/simple;
	bh=GfB9SSXsFZcVPIYixufjS4TvSJHRqArRs8LNsNzw8hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MC9PpCArymag3rvxG8LPJOjJmoROeQsmfscBGM90TNGkGuC26nAwRQCZph9oFErAgXCvNlzD/pvVmYM9LuNaw8NEUoGbaITMg1MnsnWeoCuHk+EnH6FM0l7lHJ2zlb9pCYrRrCRN+hjHTQBlgKSWbsuN15QLu/HnEtMMcRDrPdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qqOExq9w; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qqOExq9w"
Date: Mon, 14 Apr 2025 12:19:43 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744613391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lGBFw2hdWC8TDA5yog697eJPHJRXG9owfWJfJ5MWngc=;
	b=qqOExq9wrfuj2E7BAHVXk5iB1JcUfjJ6LveWgHk4tJ9mqBs+mP8E7eXdez99vVL82IqFUe
	tIRCC7FlgxpUTcAp72JqqEGU3fq1cETeJKWzPvC8ywCc0y7lhw1HfJLCYFVuzIzf+E04FN
	iusWrAW+m3Xqfh/zU89hG1v9q2n+s+8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jai Luthra <jai.luthra@linux.dev>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, vaishnav.a@ti.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, u-kumar1@ti.com, stable@vger.kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: ti: k3-am62x: Rename I2C switch to
 I2C mux in IMX219 overlay
Message-ID: <rlak6samxx5p3rlvlhpibh3ibqf4hlyp457zcl2l2babel5njv@2aqkkauioeoc>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
References: <20250409134128.2098195-1-y-abhilashchandra@ti.com>
 <20250409134128.2098195-7-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m2vb5doimzrhycjq"
Content-Disposition: inline
In-Reply-To: <20250409134128.2098195-7-y-abhilashchandra@ti.com>
X-Migadu-Flow: FLOW_OUT


--m2vb5doimzrhycjq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 6/7] arm64: dts: ti: k3-am62x: Rename I2C switch to
 I2C mux in IMX219 overlay
MIME-Version: 1.0

On Wed, Apr 09, 2025 at 07:11:27PM +0530, Yemike Abhilash Chandra wrote:
> The IMX219 device tree overlay incorrectly defined an I2C switch instead
> of an I2C mux. According to the DT bindings, the correct terminology and
> node definition should use "i2c-mux" instead of "i2c-switch". Hence,
> update the same to avoid dtbs_check warnings.
>=20
> Fixes: 4111db03dc05 ("arm64: dts: ti: k3-am62x: Add overlay for IMX219")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>

Reviewed-by: Jai Luthra <jai.luthra@linux.dev>

> ---
>  arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso b/arch/a=
rm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> index 7a0d35eb04d3..dd090813a32d 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> @@ -22,7 +22,7 @@ &main_i2c2 {
>  	#size-cells =3D <0>;
>  	status =3D "okay";
> =20
> -	i2c-switch@71 {
> +	i2c-mux@71 {
>  		compatible =3D "nxp,pca9543";
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
> --=20
> 2.34.1
>=20

--m2vb5doimzrhycjq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmf8sAcACgkQQ96R+SSa
cUVbgQ/+OCj8AncO8Yr6uC9bhzntgfdfFAJNn8WfHb55QBDB7efxUZFWX/J7CNka
MtSLG6s/N3YOOQEbmDriV8cA0XLpwsVN6L7Xjf8md9TZ93oWWKxc9oNLuw/gFKnN
CQ/Jc7ayOBg51IR3ndU8xO/BgrhnYjJsRtthrVzdJDI73DL+AN/Yn03xw+0jRrhb
sBAWt9VDnKYg45P86EtAHiYWAOH40JZ+sSq0b34mrrv0W65uiT0BdB5YO6L9Uu2h
aHouxsp42H0MUVLFa6hPsbGqyfugvpSVQMKiYM0RB+irO2VgRvtRTiEpyPYMSv4l
JfmuZ6yn8e2Sx2hi4RMgrChYeDfIff6H94/mDXpCVc1omvPTFPt7GKGw7+ty6v83
ePBqOVw4xTzITmN7fSr5hk42FCN9UoNIey34OcUJkSOkdwty4M4mpYyLZVviKiiV
TfuA4tgvEkzxcvpdtHSNq2DngqIshtV/JC0kyXhHX3ezSWum9NsudZXgUNWOf17p
VKtnCbWyh9KQOyjkAhVuYRQrnBvL7x6Fp+ZC1RSpRQU4ZcZGUWx8ujuFIaMbti12
+fnsjG0hMkiloK7Qlp1UAiPfwLWZAXSVr5vwuyyvM515uiiIe5ormuLQOTLF7XmZ
teXAPh5qJRMJLp6P2plk2LouA1WjL0CIeS3Hx1rKqnWPQIfSVEo=
=AcOW
-----END PGP SIGNATURE-----

--m2vb5doimzrhycjq--
