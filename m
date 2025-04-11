Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EE929C32E;
	Fri, 11 Apr 2025 12:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375006; cv=pass; b=OFIJ4WQ/878sy2Kd1yVChkQduK81gjbQRHdJS7WVAG7/QWOL2C6sharLl0z2HQyQXluCxzafHyKwhmpAOgmpoqlTHsL600oA5WijbhMEqj35bn+nPBEz0mPVjw/4xvqHElM9+USZxASgmxrSmlR/no/fQRJjBO17nAJaUFTVTOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375006; c=relaxed/simple;
	bh=/Odg9lL9TgBKwEIAHmwzHxOyl6eF0Cd6KglLSqmCqBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GiyrQ5vXXP20GlxPbrjjY3iZn0B6wpS1BKuCZru4hvr8k7IRPEzPH5Op5v9XR1X6Z3bccohqjr9KO4h6MXZTVAJ19hQilW3YNthaWty98jZrOejmOGX7Az/KygnnhrKjT1SW+CdXTWuOLjKdwZ4vCrop7eqcIAYgUe84ccBXlJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=CPPXP7mB; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="CPPXP7mB"
ARC-Seal: i=1; a=rsa-sha256; t=1744374996; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z2BghWrAKiUotlAVU/k3Yodv4OdFxYLO33Tib6mF667GaBi8+I34ya8GHOrPpsFUyLRNjpPN52f0pYLnqYdtFfcx0ef9bXV0J5lyX7ALMNtZlAZPCCk8+Emf+mJJCAErEEodVA8ceVv7DOqyPfsPWdNnCwIlS77hX4viogKzZ9Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744374996; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Pl05Da7C3vz6G/H2IKlSjFxpaCyLWPpzmBcWtm8HlMM=; 
	b=nFORDdQXA01Vdu2VxbwlrunBZMVKMa9Pf9baXbUSLSGilNg53tpQ1W9gTgxr6sG06wwn1rGjyp/In4oq28OYqbIE6oxyFJSHyE2CZUKGYn0cU845xElOmQoBz833YMODT8V5qJg0XihmIauJ8lm7TNfsDu5mYpiZY60wEBCMDus=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744374996;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=Pl05Da7C3vz6G/H2IKlSjFxpaCyLWPpzmBcWtm8HlMM=;
	b=CPPXP7mB1N0G8YugQE+svNa7kN5wdFLfAr1TGWzzCq4i6dbpa4X+ydymS7/EhWgE
	dyrswrDhD/3fHN2xB8shD6/ok05ZbOBC8mjVWkvpVuMDG288KCTxhwQqOZbykuKK9Iz
	bEEEZvAk2eKGIrIsyiKPzPDq6ysFarK95jcSLXJk=
Received: by mx.zohomail.com with SMTPS id 1744374993419573.2779806109937;
	Fri, 11 Apr 2025 05:36:33 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 7FFA51801EB; Fri, 11 Apr 2025 14:36:30 +0200 (CEST)
Date: Fri, 11 Apr 2025 14:36:30 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: quentin.schulz@cherry.de, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dse@thaumatec.com
Subject: Re: [PATCH v3 0/3] arm64: dts: rockchip: add and enable DSI2 on
 rk3588
Message-ID: <4pygfbajnn4g6nt5jdzdymp6ukwft5qhhll4c3urmefgchmx5j@iwzmdsyq3dqq>
References: <20250226140942.3825223-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tqddv3vmsx3kze6v"
Content-Disposition: inline
In-Reply-To: <20250226140942.3825223-1-heiko@sntech.de>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.2/244.360.14
X-ZohoMailClient: External


--tqddv3vmsx3kze6v
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/3] arm64: dts: rockchip: add and enable DSI2 on
 rk3588
MIME-Version: 1.0

Hi,

On Wed, Feb 26, 2025 at 03:09:39PM +0100, Heiko Stuebner wrote:
> This adds the dcphy and dsi2 controller nodes and adds an overlay
> for the Tiger-Haikou Video-Demo adapter that provides a DSI display.

I think this can be merged now, so that I can send a patch adding
the RK3588 EVB1 panel in the devicetree without having to specify
any dependencies on other series? :)

Greetings,

-- Sebastian

> changes in v3:
> - rebase on newly added overlay-test-infrastructure
> - add reset-gpio to gpio expander
>=20
> changes in v2:
> - adapt to changed dcphy binding (phy-cells =3D 1)
> - tiger-overlay changes (Quentin):
>   - drop forgotten hdmi-connector node
>   - improve description
>   - fix node sorting
>   - drop unnecessary pwm-pinctrl (set in tiger.dtsi)
>=20
> Heiko Stuebner (3):
>   arm64: dts: rockchip: add mipi dcphy nodes to rk3588
>   arm64: dts: rockchip: add dsi controller nodes on rk3588
>   arm64: dts: rockchip: add overlay for tiger-haikou video-demo adapter
>=20
>  arch/arm64/boot/dts/rockchip/Makefile         |   5 +
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  99 ++++++++++++
>  .../rk3588-tiger-haikou-video-demo.dtso       | 153 ++++++++++++++++++
>  3 files changed, 257 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-vide=
o-demo.dtso
>=20
> --=20
> 2.47.2
>=20
>=20

--tqddv3vmsx3kze6v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmf5DM4ACgkQ2O7X88g7
+pqUHw/+Nf5gsmCdCh559WvamUyOxdMHUed8EwFz9zqglvZN58ibQRL6awLyI/oh
N9mxk0QkExDpfBzD7Dy9GSrZ5bs7+Tg+LlMbT7Jq3NcLhkUZLk29hJA18S1+4I0U
KurrJqF/baxgDcAT1wbmYG/7avHqiG54lZKMksGis+OEOQQ8XZkxd9E9TXyCTG3V
8ylbmgV4lZC0JId2ESy2AuMidpvw83cFhRM5FNdlEDXgs2hLkbRCn9kkZew364mw
O9qooKKVI3Z6QlKCKvlpJd17HOdAeezNrXScpYPh80bNi69LMQ/PUOVDON0Eni/S
ikvRVlK4kuLXYxznAQqfLelPvu1rAVuqxsmq8xoBhsfOnpklr5jTpyEUX0BlaU9M
viuldgbDp6DrcbMsJVCGZxVTjWqr4WrY01v7aO7Js9/oqkk5xjF45w2X0nQxzF/v
5AJ5EuKN4JqvD1m7dFqvRJXBP9yJPxTP8wIekiYWka0EZfiF8WJHlHndZFWj0dWl
eCt6MSwS038x+GZfbLSl6/wy87IT5EmmwutEtkCV5LOrPT22kyjvtyq2m3IHjwmK
T7i75CmZfwuyHYlgKHekhZlOnBBLQ09zmc3kxsaciI2B8I5YhAFnLF55TiUwnFmq
09LsWD9M3vRXCvAXWSw5dJgc0ZxxbOuXwtWmOFDmjbe6shm0RxI=
=UWSi
-----END PGP SIGNATURE-----

--tqddv3vmsx3kze6v--
