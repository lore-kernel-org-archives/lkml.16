Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702D027FD52;
	Tue,  6 May 2025 16:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746548505; cv=none; b=rQTe/JlvDwspl6v2ibP/XY4fZHFs53jgU6IYn0kS3TISsuNgIJq8sFTaDolWFItZZbR1OtJ7MAZqtfz6n+WgeAz3SuQxKic5L69AKqTuWYfKHSrHPloH3m2kjq/xXcrIODWzD3Z6iJdKf5tVBztu3ST8jIx/htwHiwz+rPsOH7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746548505; c=relaxed/simple;
	bh=Y5vB3RUwm/jQB8fSOOeUJbh+2DxhwOmT4Fj6JhKOiSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDh8Xb7DJd2W5DkexqMMSYSLClVsqHTgloVf5yJNRqo5r+0BaXURBY4SdeGukz4Y+UBSxc3yo5kgTyRuCNfP35ifW5A4agv4JBki0PtIXuAWhKYQhNB8xvXuuyc+LfHlUKCjabznsTb485SP3Ga7cqXEwyQtyCKFUB4rHwsnC6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q8jwC9WD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q8jwC9WD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0EF0C4CEE4;
	Tue,  6 May 2025 16:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746548504;
	bh=Y5vB3RUwm/jQB8fSOOeUJbh+2DxhwOmT4Fj6JhKOiSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q8jwC9WDmnDsANLxcaOE0kri9jAfO3Z0S8LmgIdUeC1Dyhha15VolybR25EWWSxTH
	 XpEQ918zIv7sHK/8TokDEJbpTEbl4vcIpfSasui0aOgIfd2wTf/Z5pQE5Am0DuVkIA
	 WSsqUibNTsv4ICXwt4Kaxaaf5gEuAGsxfC3NMBK1kszL8UqGVeOPlA1xskmZlKsZif
	 Uof9Gg7HBm4FBQBJMmkPFWNMNvnExJ1m7TQsJKPvjb+6ve9ozUhbn2ds6qsoEF2uUw
	 ykwvbG7fo4gXSPXHUr48CbC1zKMVV6vQnJ4eaLi4Y7FiNcjGRzrfmvYhCRvg89ZpCo
	 s07+b/Uk3W0tQ==
Date: Tue, 6 May 2025 17:21:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: rk3036: add SCLK_USB480M clock-id
Message-ID: <20250506-yesterday-married-28c9228a3746@spud>
References: <20250503202532.992033-1-heiko@sntech.de>
 <20250503202532.992033-2-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FxJ1Bes51ilW0HN+"
Content-Disposition: inline
In-Reply-To: <20250503202532.992033-2-heiko@sntech.de>


--FxJ1Bes51ilW0HN+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 03, 2025 at 10:25:29PM +0200, Heiko Stuebner wrote:
> Contrary to how it is implemented right now, the usb480m clock is a
> controllable mux that can switch between the 24MHz oscillator and the
> clock output of the usb2phy.
>=20
> Add the needed clock-id to allow setting this mux from DT.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  include/dt-bindings/clock/rk3036-cru.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/dt-bindings/clock/rk3036-cru.h b/include/dt-bindings=
/clock/rk3036-cru.h
> index 99cc617e1e54..5cbc0e2b08ff 100644
> --- a/include/dt-bindings/clock/rk3036-cru.h
> +++ b/include/dt-bindings/clock/rk3036-cru.h
> @@ -47,6 +47,7 @@
>  #define SCLK_MACREF		152
>  #define SCLK_MACPLL		153
>  #define SCLK_SFC		160
> +#define SCLK_USB480M		161
> =20
>  /* aclk gates */
>  #define ACLK_DMAC2		194
> --=20
> 2.47.2
>=20

--FxJ1Bes51ilW0HN+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBo3FAAKCRB4tDGHoIJi
0ltiAP9FWMNhoWrVMp0z/pgUZyM0tQBD8W3Hi+tKT+ENQfDz5wEAvhQtk1bN5pLM
OuU0p7M6sggc8PRBtdbQnL66XBSi0Qs=
=+Blf
-----END PGP SIGNATURE-----

--FxJ1Bes51ilW0HN+--
