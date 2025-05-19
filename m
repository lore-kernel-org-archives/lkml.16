Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E06287505;
	Mon, 19 May 2025 16:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747672776; cv=none; b=knbxNlPCVlJF63Ut4va6oCxF8YEanNFyW8EX4OJ+ezygPAix0PhiYJIrQjBlF9VMTGoCFsORfk6oy5SAKCQZ95fYA0jrFS5rrrrTjuPRC2wHrjgFoUnlxBEShO9fWDUViEU8D9spZGAsRsk0jeNtUTTCMX+5+tzDtC7Sscqg5Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747672776; c=relaxed/simple;
	bh=GX9Qj2ylG5i74myAAsHfk2ONtONtLM/ds6uhY2pLujQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Or66ZqZ4WoBN6M09pqXTWCmWqYZ6cHEqgAjBzEcpz9CNSL6ssxEQmZ4Jhih6lR/X8YDtI1Ih5ssLjtdz6MTt6l3K8pDYx+jQAJNHpJnS5MEj7ZrJ4Zvr9rYCFHsiH/D0c1bFQsvnjK6vm4BDzytx/bP5wEMd7i2N8heI0k4XBLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tRHp0jDq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tRHp0jDq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31193C4CEE4;
	Mon, 19 May 2025 16:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747672775;
	bh=GX9Qj2ylG5i74myAAsHfk2ONtONtLM/ds6uhY2pLujQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tRHp0jDqfAOLN1wEFih56Maz86WsbkL/gu6gA+5rOc/aO64DCVaZ0DfysUKuSoHy6
	 fJAPNV6o9ertPmlCBxSpHolI9X3sp39HesR24mMb/sChtjyDRF0/5WvUg7u1do1v5S
	 28EpEMut/7CPrAs0iTBPNOgjTxKeuZ+evOLwhzvygU5CkPYfyZYMHYgdrbDPAOROLD
	 0o3ftPGARPKXvF/QnlhWGwJ7E1qCi4D9u15OBcWd2ag9ffLO4k7SkNpZW3GAUHqhE5
	 LjpQ7mbT3FFzUWdvtd1S+TNyHXxcNLz6Ykqg6OkY+1XSRvINiO2e5JyjQGvGvpCJlc
	 cAV8MYSAsT8fQ==
Date: Mon, 19 May 2025 17:39:29 +0100
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
Subject: Re: [PATCH v3 2/5] dt-bindings: phy: rockchip: naneng-combphy: Add
 RK3528 variant
Message-ID: <20250519-smell-exhume-df5ee34e31bb@spud>
References: <20250519161612.14261-1-ziyao@disroot.org>
 <20250519161612.14261-3-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TLrji4TZnIyWLWDI"
Content-Disposition: inline
In-Reply-To: <20250519161612.14261-3-ziyao@disroot.org>


--TLrji4TZnIyWLWDI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 04:16:08PM +0000, Yao Zi wrote:
> Rockchip RK3528 ships one naneng-combphy which operates in either PCIe
> or USB 3 mode. Document its compatible string.
>=20
> Signed-off-by: Yao Zi <ziyao@disroot.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-co=
mbphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-comb=
phy.yaml
> index 888e6b2aac5a..969d7b1850d6 100644
> --- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.y=
aml
> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.y=
aml
> @@ -12,6 +12,7 @@ maintainers:
>  properties:
>    compatible:
>      enum:
> +      - rockchip,rk3528-naneng-combphy
>        - rockchip,rk3562-naneng-combphy
>        - rockchip,rk3568-naneng-combphy
>        - rockchip,rk3576-naneng-combphy
> @@ -102,7 +103,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: rockchip,rk3588-naneng-combphy
> +            enum:
> +              - rockchip,rk3528-naneng-combphy
> +              - rockchip,rk3588-naneng-combphy
>      then:
>        properties:
>          resets:
> --=20
> 2.49.0
>=20

--TLrji4TZnIyWLWDI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCtewQAKCRB4tDGHoIJi
0lfYAQCtx96m/d5SWp3Mrz93mwH0LkNmQvVyWrBwI/VYaC49sgEAuh+Qt21wI2md
Nx9jIB2xPDYbGdylaq36IjXZQc6inwQ=
=eg7H
-----END PGP SIGNATURE-----

--TLrji4TZnIyWLWDI--
