Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E3D2750E3;
	Thu,  8 May 2025 14:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715242; cv=none; b=gbFesP4aMnW6aIQh/UO2qZsU1R6XmrQ87N9ICMQ8yCQlYCpHgxxABZaj68MtTfK1B73T9AaxMGWfd90n/jx+z/KgN8f6N/baibhPsDxu0o4nX7vPOijtgYnOLBR3YRbmVNSLP++Wa1c1TLH9593DqSrbcUQ6i5SrXyhvPrrbfEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715242; c=relaxed/simple;
	bh=OPLdpdXnFg1EEql9UQ1QOjqCfF/Fv3byRUuUihhireI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZixDW9WzuAbxb6KbcS8FPq02NHaX/s3frhm55/e5865Yye2jo2SlC8HhgehH6f3wyArrz3HwcBiW5uS7N3O7H/2F2qUNoEiopqEmBvoA65kFt2qD/9zesZ54nO0oFa83vWdcPwMk/OFCy8mQaol4tVJFhL013cJgJULJgMlStj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VNSG6AiP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VNSG6AiP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A725C4CEE7;
	Thu,  8 May 2025 14:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746715241;
	bh=OPLdpdXnFg1EEql9UQ1QOjqCfF/Fv3byRUuUihhireI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VNSG6AiPbVqEvOBkAdqaTDFy/d5EH5LlicjtO/KDj261y3ToJZKm17q5e5lERjZXk
	 YGCUwkxNWd/gq7INc0K7lX22GJb6OYtvEFXKkAzdmqzsdIlqxvsY3PMyz5yeHYIO0m
	 gGuwgbnHeiXXRozzwgTlMG/dEij4LRQeKDZ58tSXy855l/CL1RjxhZ6cYxc8pgFrOV
	 +xn68RQ/13ESXfksbJdGI7oK2pXIggKOXnQT52qivcJtw7DzCk/Nea7jqEEawreEz6
	 XVaAfde867eL/MsR2+xRdMKmppjsrizdax57r15uTtiCCupIsmqmPEphw0EhJDwvew
	 Qy9NqFXSn68Sg==
Date: Thu, 8 May 2025 15:40:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>, Jonas Karlman <jonas@kwiboo.se>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: soc: rockchip: Add RK3528 pipe-phy GRF
 syscon
Message-ID: <20250508-battering-uncured-476f83a5acce@spud>
References: <20250508134332.14668-2-ziyao@disroot.org>
 <20250508134332.14668-3-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aDgo01QbuFP+4Uz9"
Content-Disposition: inline
In-Reply-To: <20250508134332.14668-3-ziyao@disroot.org>


--aDgo01QbuFP+4Uz9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 08, 2025 at 01:43:29PM +0000, Yao Zi wrote:
> Add compatible string for pipe-phy GRF found on RK3528 SoC, which
> controls misc settings for the integrated naneng-combphy.
>=20
> Signed-off-by: Yao Zi <ziyao@disroot.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Do=
cumentation/devicetree/bindings/soc/rockchip/grf.yaml
> index 2f61c1b95fea..7e9321999435 100644
> --- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> @@ -16,6 +16,7 @@ properties:
>            - enum:
>                - rockchip,rk3288-sgrf
>                - rockchip,rk3528-ioc-grf
> +              - rockchip,rk3528-pipe-phy-grf
>                - rockchip,rk3528-vo-grf
>                - rockchip,rk3528-vpu-grf
>                - rockchip,rk3566-pipe-grf
> --=20
> 2.49.0
>=20

--aDgo01QbuFP+4Uz9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzCZAAKCRB4tDGHoIJi
0hUzAP9/lnZJfUnl5iV9let8e9oK6Y6itm+MEsM7dfEwvDCRAAD6Amozg0CiO/vr
K6wE/F+QimWIw4q3EHCAHrhp3YSxVAU=
=axYG
-----END PGP SIGNATURE-----

--aDgo01QbuFP+4Uz9--
