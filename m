Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619A23C465
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 11:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749122305; cv=none; b=dvR+rF7tTDZ9G3lo2gj/eniM6vbFamSecnmXUMh6xkB7QjHwfbyTKB340RfOyFWgwustuNSBiXokbr1ceIWzv5Mf6tG/MtHTEXzDW4oDkLgKpS+rMuAOieWFq6uQn7rnI5+e2KsWgDx1aevPBbrPwhcu0J9nUh0l6w2NA3SxiPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749122305; c=relaxed/simple;
	bh=fJQoK0l81dkQqNhgdGQiDnK1SLdRuzzDfV/DKyrBG28=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Hl2uhnQME8KgGNWH8trP5+jKpRiAO3jq/XaBOSMPMUWTRgOEj1yuN+/3CjLIw9v7+7Oe/eEsb381rNCWLx+4C0f3MUJd3C3NpIYAM+oNYHvxv0qD0K3iBziInlP58AyIvAUY9tnpbItAaZSbBkPMoe5tXkmMjzqLx+1xjj3WJPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=TuKKKtNd; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="TuKKKtNd"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1749122291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=13cxEH6HxdmpWJc8QzYDB4UlEOp0j6xlHHpJ/zaokQk=;
	b=TuKKKtNd+g/Kb3VvnuS++kfG2LyDperU5Qbq8xI3fnT6fUOx7xkBS5xYcoCwqDhJ5YHXiE
	fXRzVEGwfenIvRfOiUpCx1CSinLT3vQzp4iRybeLpaAZZb0adb7ICTm4+TNMHUZ0IgVoZY
	jUYxO6eTQESrTpvzdETOa/HOpInYxpJfI1THm4my2ruW8Ts8DScWwxHg/v3gpBNNdwcDNW
	Nk90mY832LDw5jfsa7slPZRxByPsqPqykxh+zRbCwsFvSiQ267wNLI5UNTGe3xpRApFtwe
	nVKFltZPau6NkQOotaEEsbOD92tyU2K/SYxTZXZx+KJXIeYqpZJEx7fZ4N9IxA==
Content-Type: multipart/signed;
 boundary=9a3e5395647fd1bec2889ce64d9b6b8ce6ab0473fcc5380cf846fa546bd7;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 05 Jun 2025 13:17:43 +0200
Message-Id: <DAEK3EQVNWQX.24DOM2VICSGCP@cknow.org>
To: "Alexey Charkov" <alchark@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on
 ArmSoM Sige5
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-1-717e8ce4ab77@gmail.com>
In-Reply-To: <20250603-sige5-updates-v1-1-717e8ce4ab77@gmail.com>
X-Migadu-Flow: FLOW_OUT

--9a3e5395647fd1bec2889ce64d9b6b8ce6ab0473fcc5380cf846fa546bd7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Jun 3, 2025 at 7:01 PM CEST, Alexey Charkov wrote:
> List both CPU supply regulators which drive the little and big CPU
> clusters, respectively, so that cpufreq can pick them up.
>
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 28 ++++++++++++++++=
++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/=
arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> index b09e789c75c47fec7cf7e9810ab0dcca32d9404a..d9c129be55a0d997e04e6d677=
cdc98fb50353418 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> @@ -207,6 +207,22 @@ vcc_3v3_ufs_s0: regulator-vcc-ufs-s0 {
>  	};
>  };
> =20
> +&cpu_b0 {
> +	cpu-supply =3D <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_b1 {
> +	cpu-supply =3D <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_b2 {
> +	cpu-supply =3D <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_b3 {
> +	cpu-supply =3D <&vdd_cpu_big_s0>;
> +};
> +
>  &combphy0_ps {
>  	status =3D "okay";
>  };

The &cpu_bN nodes should come after the &combphy0_ps node.

Cheers,
  Diederik

> @@ -215,6 +231,18 @@ &cpu_l0 {
>  	cpu-supply =3D <&vdd_cpu_lit_s0>;
>  };
> =20
> +&cpu_l1 {
> +	cpu-supply =3D <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l2 {
> +	cpu-supply =3D <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l3 {
> +	cpu-supply =3D <&vdd_cpu_lit_s0>;
> +};
> +
>  &gmac0 {
>  	phy-mode =3D "rgmii-id";
>  	clock_in_out =3D "output";


--9a3e5395647fd1bec2889ce64d9b6b8ce6ab0473fcc5380cf846fa546bd7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaEF86gAKCRDXblvOeH7b
btTlAQDI6lgSC9KhTjsX1bMR1+ahztGxcgRpovUts1PqDZ5LkAEAomVjXYHvh+hm
ilgYDdQ31HkVBaW8QO6e4mmm5NYzGAE=
=aDIe
-----END PGP SIGNATURE-----

--9a3e5395647fd1bec2889ce64d9b6b8ce6ab0473fcc5380cf846fa546bd7--
