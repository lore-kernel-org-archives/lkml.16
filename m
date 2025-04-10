Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B65189B84;
	Thu, 10 Apr 2025 09:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744276303; cv=none; b=OIXo4PADaGpsE7t3rxI9t7wZkUa9KdmMuTdkUds0pUS3Az8aE6PBYpR9mt3WaZw5SpbgR5j4H8wBtWuOcm29Jif/BoFVF2UO+BMZP9BLT6bke3n3NuwMv1s8oSL6/rcL7nlAfLhYOP7UZb5WqGK8gXhgCX5sVOkLBWePGuGEArA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744276303; c=relaxed/simple;
	bh=aTPVMYbW6F0IqppqC40Mcn7dIv8KOa0Pnw0g2LzJ5rY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GmA6oLhwpvCttwjPjUV+gmRJfe4iefWLfbk1N81vgPEdfiiIZdUHPfeU61vpL2Wfzy6H/D1jddojAfuph66nIkwMJXDdpu0jpwC71D1nR8fPmE9TecKVf3Wg1NbVhRAoisB3bvM4FW/iq1KUiUi2DmdV32/4NPBDTq93h4vVEtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=k64BKgH2; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="k64BKgH2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Q7XeSNwUSyKsnPHjzguFYMm/+HQnjTgqG1Z3ie3pBlE=; b=k64BKgH2UFkjxG4Hthfdq7uVRP
	bYAoS6CUmGYx7xXgn1+VVf3RjjrbUYW5fNq+bxp1uO7DMOzVLjhD6FYaPk0YxTdx70jFgt/FdbjKx
	hn+5ant+gddH2+aUdKnm/V2OuA5//nbVyiCAZGhWVaDgDRxuKvHMunrDItSeCYABqoFSYjgBKqiDx
	KEp5DEIJP6uv7jCnxMb5tpp7y42m/3Ku4sT7kHOIUuUyWXrv3XILCQlQerunqrS8gyXNIA0Wcuzv/
	OQBi7bQ/coxWxu1xfcqFezqhP/Tn1hNpUvr9oGhQjrg4MUFP8aOICuFzyJINEXKWfT3vHcL6l3+16
	fwff5YEw==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u2nwY-0003XO-TF; Thu, 10 Apr 2025 11:11:30 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Frank Wang <frank.wang@rock-chips.com>,
 Zhang Yubing <yubing.zhang@rock-chips.com>,
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2] dt-bindings: phy: rockchip: Add missing "phy-supply" property
Date: Thu, 10 Apr 2025 11:11:30 +0200
Message-ID: <4668554.cEBGB3zze1@diego>
In-Reply-To: <20250407165607.2937088-1-robh@kernel.org>
References: <20250407165607.2937088-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Montag, 7. April 2025, 18:56:06 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Rob Herring (Arm):
> Several Rockchip PHYs use the "phy-supply" property, but don't
> document it. Add it to the current known users.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


> ---
> v2:
>  - Drop maxItems
> ---
>  .../devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml   | 3 +++
>  Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml  | 3 +++
>  Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml  | 3 +++
>  3 files changed, 9 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-co=
mbphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-comb=
phy.yaml
> index 888e6b2aac5a..3e101c3c5ea9 100644
> --- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.y=
aml
> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.y=
aml
> @@ -42,6 +42,9 @@ properties:
>        - const: phy
>        - const: apb
> =20
> +  phy-supply:
> +    description: Single PHY regulator
> +
>    rockchip,enable-ssc:
>      type: boolean
>      description:
> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yam=
l b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
> index b42f1272903d..8b7059d5b182 100644
> --- a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
> @@ -47,6 +47,9 @@ properties:
>        - const: pcs_apb
>        - const: pma_apb
> =20
> +  phy-supply:
> +    description: Single PHY regulator
> +
>    rockchip,dp-lane-mux:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
>      minItems: 2
> diff --git a/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yam=
l b/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
> index ba67dca5a446..d7de8b527c5c 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
> @@ -46,6 +46,9 @@ properties:
>    reset-names:
>      const: phy
> =20
> +  phy-supply:
> +    description: Single PHY regulator
> +
>    rockchip,phy-grf:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: phandle to the syscon managing the phy "general registe=
r files"
>=20




