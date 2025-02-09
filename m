Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5592220693;
	Sun,  9 Feb 2025 21:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739135454; cv=none; b=GClGIpQslTdQgnphZZAr9qddncRo7RGUCFMo5OVP8Of1keqMPaeTbX+Uuv2krD6Hyt8oaWNnuNito2h5+zZPtJOcv4WIzW0cpF5l5oBlwGtgsVQO261Yr/mFou4ZftyyREhxY759OtNpaa7FlyKboArc8cvs8EQCjXQ8zD8qMYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739135454; c=relaxed/simple;
	bh=guzYv5LmVGaIreageLXhOAkgNCKV5+b2hEihES31yf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NPGJbf9ysJgyVWJMufbAqYLylI6Py0G1cgsACXi6RXwPC/7xR/P0muVhIL4HyUAAN8Xe4dq54zxdmH8wamOeXClRnM/TOiavvzZUPe6PXT0szVrlmRZiEZA5XCFm7ASMwxGT/uJh0phFvyp8qKQJlP3GVxLbsRvkbZsxA2CkM5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=17ofavTr; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="17ofavTr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Gb2iab43R14TaHi2LhilVsAfQHLjbSucuUohgG/g22s=; b=17ofavTrJlDkSA0wepYh6WqHEx
	Gki+F+NfSeySibY9PcEYt/HYGQquBsCOewjIUBGnFlq2fpG0nG4B6K/3JZ9pPZGSTYYRotrV0Lb7y
	bEBYjCp1BLSm4TvIrvpN4iiW+V7LB4NgO7dCVOe74BUBLeezfgwxfkaAco2Vo130qptNV34zLQRan
	mq4m5D7H/W1eqJlAu0fQBru4RWt3gRej2HFK9VE2gQFnO9LwUbd6apgBcJZLQW7Yy2Q15CX2L2n2F
	LPZicvxnaiaYb24nddgLbacbwjZ4ESAEeKMN547AI7wTn/uwdnCEnoxiaKnhNqUl1HfZTKNOadi6j
	nvIZ8sEQ==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thEZk-00027w-Eh; Sun, 09 Feb 2025 22:10:48 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alexey Charkov <alchark@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
Subject:
 Re: [PATCH 1/3] dt-bindings: ASoC: rockchip: Add compatible for RK3588 SPDIF
Date: Sun, 09 Feb 2025 22:10:47 +0100
Message-ID: <4315116.iIbC2pHGDl@diego>
In-Reply-To: <20250120-rk3588-spdif-v1-1-1415f5871dc7@gmail.com>
References:
 <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
 <20250120-rk3588-spdif-v1-1-1415f5871dc7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Mark,

Am Montag, 20. Januar 2025, 10:01:27 MEZ schrieb Alexey Charkov:
> Add a compatible string for SPDIF on RK3588, which is similar to the
> one on RK3568.
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>

as the binding is more in the driver-realm, is this patch still
somewhere on your radar?

Thanks a lot
Heiko

> ---
>  Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
> index c3c989ef2a2c81eba73fae3d1ee4bfd18a8e5d29..32dea7392e8d49fc6402a64fc9f7115a47a8b8ad 100644
> --- a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
> +++ b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
> @@ -31,6 +31,10 @@ properties:
>                - rockchip,rk3288-spdif
>                - rockchip,rk3308-spdif
>            - const: rockchip,rk3066-spdif
> +      - items:
> +          - enum:
> +              - rockchip,rk3588-spdif
> +          - const: rockchip,rk3568-spdif
>  
>    reg:
>      maxItems: 1
> 
> 




