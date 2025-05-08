Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1054D35966;
	Thu,  8 May 2025 17:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746724569; cv=none; b=RlvxyaS/2vIYENqlx+TSFQq+WoXBeQ5Tu3Pr/nyA5xFk21uzXOi3dWobqMpWcZZws/88xuG86Y0KcUKJC8SkJd47pe+eFs7y4e5pg1Yz7YPfETF81FwlNlPtEaSPdQdlL/Pb+SbgNDpflrAKs2z/w9QCRcTcPoCYL3qN9KUqLZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746724569; c=relaxed/simple;
	bh=atGPLnDuJG+mizMTdVJkVlb9g0793VRoDMLlmUA0by8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BIYwDjh81ay3zRuv2qlnZnJv5MzJUVAHX9O+utFjSYufhVgXBl4R/98g5uVijF6AoP2m4zZiDouZ9zJWTyKaCfXnQdfW3SnpaKrRKiD0YtB7vRE49K83IBhFTnKPLFgnF2lC/SGhhSubXqsGCuPOd9XTz4B6l5txL7r21r1AtJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=x/vmDNAv; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="x/vmDNAv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=b+ZizUotZK/18JQ4QX3F6gdp6ns7bch/VC6ViFwIDYA=; b=x/vmDNAvCAAs+eu7Ag26+PGRjQ
	uPnX3w4LUrTOG4lTqzHXTl2DnEQ2rXTVVDiWHPeIjepWDFpsiKAzrXHv4T+P4c+6fID8zNtKRM1G6
	djVR6xBgD6v4fD6Xqt7LynBWNJgy0Mx1i9FCBKL/L4EZSw6PK8SQBe0xPyIIWGIXtfD25io88xL+Z
	c0MHOadpyo/aBsrjTe2pu9l/4gXpif2I6v2jaEiEtBfMJWWw5po2ImxFJllX6KlfvPxtpv8nT2dqI
	pUEOxephowVfF+I0PWQQg5orL9tTaFyO89uaoirRY6qY02TTQTc9mbgyzMxLFFQWUeZhSoXpPlERD
	rjK/Hrkg==;
Received: from [61.8.144.177] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uD4qg-0007uM-1c; Thu, 08 May 2025 19:15:54 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
 Frank Wang <frank.wang@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Shresth Prasad <shresthprasad7@gmail.com>, Chukun Pan <amadeus@jmu.edu.cn>,
 Jonas Karlman <jonas@kwiboo.se>, Yao Zi <ziyao@disroot.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 2/5] dt-bindings: phy: rockchip: naneng-combphy: Add RK3528
 variant
Date: Thu, 08 May 2025 19:15:52 +0200
Message-ID: <6254524.DvuYhMxLoT@phil>
In-Reply-To: <20250508134332.14668-4-ziyao@disroot.org>
References:
 <20250508134332.14668-2-ziyao@disroot.org>
 <20250508134332.14668-4-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 8. Mai 2025, 15:43:30 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Yao Zi:
> Rockchip RK3528 ships one naneng-combphy which operates in either PCIe
> or USB 3 mode. Document its compatible string.
>=20
> Signed-off-by: Yao Zi <ziyao@disroot.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  .../devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-co=
mbphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-comb=
phy.yaml
> index 888e6b2aac5a..bd064754e537 100644
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
> +             - rockchip,rk3528-naneng-combphy
> +             - rockchip,rk3588-naneng-combphy
>      then:
>        properties:
>          resets:
>=20




