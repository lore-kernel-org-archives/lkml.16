Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E729B2EA73B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750254899; cv=none; b=ufv+bSuHRsyfjW745fBy0CLD0d3oO10NxC3EfPv/5Ql87MCSdyF0QSsS9+eClWKsFTd1ECLSrrwsC3/azHJ96+BJjHXRzyKhrjAdR0zimk21cfkVCjb8S2ec8qnqTt8eRPHxPYROVEUDEC0NeOIyC5dxcESNfMdwKtqhlL2XDRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750254899; c=relaxed/simple;
	bh=5EYynZg3PDGd4sSEBcRTPT+Lzin0Nrl3aE0xoUdsBDM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=RSMimc503mJsLagUCA+P7/8i8E9KZhrCfCzoY0qts0Kx9Quewsi1+VEThGJTPqelNbl/s0SXrakic2s6mVr64iav+hk6dqsMNGZClf0WGrNtmnkQgp63Fr9GW8POpS1qOUGNdJ/TcO3u+SmzV3fYjEZF1D0AwB2BPEjKeQPrM+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=KwN4nI+s; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="KwN4nI+s"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1750254885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NNSuuSfon4v/pI6IqbQjhOGu6PQA9a2GdCCeTthXBQE=;
	b=KwN4nI+sPvrR3Atnz9e4RDMD/yXXMZ5uKrzyu8qawrYeXE4EZaNPQt2z/rZSdMMeWoJRMw
	o7rGNEoRHx5S57NlsH3aLFtvfacb/J3RIALrpa7Edf57l+6tb2F9WmASv7+Ec4lWcPEyvp
	9MCY5GyWR2OTXLMVI8fS1feNwH7qQcWCN4eD77RSjpa4r7aTXyHioxIjW71h8JOVUg3uaX
	jqItFNw3k/ynTUaa3yiI42cOap8vFqXaWf6L1f/tIIumxf5gh+HVPLrdukPL8YEDYZA+PZ
	ia7tcVeiyFcAaF+eJEmW54IQqBzOsn1QD+Yg6XL164FZDSRjsEjXDC0Et+v4Ag==
Content-Type: multipart/signed;
 boundary=9dfd3ed0cdf1941689833775b5493883736f568288baa81c052167a40120;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 18 Jun 2025 15:54:42 +0200
Message-Id: <DAPPKP3OWLMU.C6HXTY24NZ4H@cknow.org>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Fix the panel compatible for
 the PinePhone Pro
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Olivier Benjamin" <olivier.benjamin@bootlin.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
References: <20250618-dtb_fixes-v1-0-e54797ad2eba@bootlin.com>
 <20250618-dtb_fixes-v1-1-e54797ad2eba@bootlin.com>
In-Reply-To: <20250618-dtb_fixes-v1-1-e54797ad2eba@bootlin.com>
X-Migadu-Flow: FLOW_OUT

--9dfd3ed0cdf1941689833775b5493883736f568288baa81c052167a40120
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Jun 18, 2025 at 12:32 AM CEST, Olivier Benjamin wrote:
> As documented in its bindings, the compatible for the Himax HX8394
> MIPI-DSI LCD panel controller is in 2 parts.
> The PinePhone Pro DTS currently only specifies the first part of the
> compatible, generating a warning.
>
> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch=
/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> index 04ba4c4565d0a205e2e46d7535c6a3190993621d..5ebc380a24df86ba7172b0950=
b89cac56b61c507 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> @@ -479,7 +479,7 @@ mipi_out_panel: endpoint {
>  	};
> =20
>  	panel@0 {
> -		compatible =3D "hannstar,hsd060bhw4";
> +		compatible =3D "hannstar,hsd060bhw4", "himax,hx8394";
>  		reg =3D <0>;
>  		backlight =3D <&backlight>;
>  		reset-gpios =3D <&gpio4 RK_PD1 GPIO_ACTIVE_LOW>;

Reviewed-by: Diederik de Haas <didi.debian@cknow.org>

But I'd actually suggest to combine it with patch 3 and use that
opportunity to also fix the property sorting, so you'd get 1 patch which
fixes all of the panel issues.

Cheers,
  Diederik

--9dfd3ed0cdf1941689833775b5493883736f568288baa81c052167a40120
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaFLFJQAKCRDXblvOeH7b
btb2AQCP2M61/SnTc3rFJb6VZ5pU6CwVut533jHFQU+h+sbrNwEAqNoB84+3F5h/
FBJ6x+MXFLlxBAsVt7NKd1cgWc86cAo=
=S//c
-----END PGP SIGNATURE-----

--9dfd3ed0cdf1941689833775b5493883736f568288baa81c052167a40120--
