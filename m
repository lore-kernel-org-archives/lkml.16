Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E3A2F533D;
	Tue, 17 Jun 2025 22:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750199533; cv=none; b=Wd0TzcW8RlxyvMZHEsz92kl5jeD5b83sW5KH17zTYpRlHP5pr817nhbL+6miNQ+FQBatXIQK9A1V6zUKHddbGlfg7iNelPH/blcuLNACFBjGTLdSnZL9d7LocxeunN7UfUuExAd4ZDz/xq0h9x6af3O8T2frCLrScrj/p8kCW5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750199533; c=relaxed/simple;
	bh=6iFGCl+vrI3UJYLZ8mJlwkON1FhnOipz+urUhHLe6wo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZcDPiciAIBHMrbg3WcORl1DkOSNu2vR1fQpcUK3yrKMsO6BOGgxnrH3OolB+OTkYaZB1qLGWscD5gOA07bkyVs+wGafBhEx/IkD9IGcMoOMbgBiCRcL0GNYICKI10+valETiale36I+wQd4rm9SaXzTSoUWv19vx0zJmY5+WAhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=C5tZyF3M; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="C5tZyF3M"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 38C2143165;
	Tue, 17 Jun 2025 22:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750199524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BY8lr3cwBhpY747VHtfxpWMlqtvjqMvD4rBIcdrKAxU=;
	b=C5tZyF3M+bt1MHFLo9nXnW9oA87sYfPMoAAzCDOJgOaUYBToftzB8ensVCrrjf5ioRM/Wa
	g5wOkC2qxmQxVXjUBxW8Uy6uAA3Nb4EE0xhKct/vS8kecXMneLuKjj3PHxitwbY4ZJ0fOc
	rijcA1Nml/R8umSpXkJ0E4sDhyPNZI26PUPADFlJ+VyVq2XGHtqjDQ5keBKRCtfnxY38+4
	03hw85ZtaInPvfAKpVWVzt/CGRreSijRiVZwL+VNLm8pA6XK0J4TUgLZNN+ZMDpD3Lv0K/
	6Rer6iJk4asT3b2KmrbZgxnOToRmPQdtETEClsoONKa2diUG02jwkaBOIcb3aQ==
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
Date: Wed, 18 Jun 2025 00:32:01 +0200
Subject: [PATCH 2/3] arm64: dts: rockchip: Fix the mipi port definition for
 RK3399
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-dtb_fixes-v1-2-e54797ad2eba@bootlin.com>
References: <20250618-dtb_fixes-v1-0-e54797ad2eba@bootlin.com>
In-Reply-To: <20250618-dtb_fixes-v1-0-e54797ad2eba@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Olivier Benjamin <olivier.benjamin@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddufeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepqfhlihhvihgvrhcuuegvnhhjrghmihhnuceoohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegueegiedvvdevveevvddufeejvefftdeugfffkeeileehheefieehgfelfeeileenucfkphepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeipdhhvghloheplgduledvrdduieekrddurddvtdgnpdhmrghilhhfrhhomhepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhrt
 ghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhotghktghhihhpsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: olivier.benjamin@bootlin.com

The RK3399's MIPI DSI has 2 ports: in an out. The definition of
the port property necessitates the value of #address-cells to be 1.

Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 5ebc380a24df86ba7172b0950b89cac56b61c507..5a7341fb6bcb0613af6f3ac31d99355a0f890e89 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -468,7 +468,7 @@ &mipi_dsi {
 
 	ports {
 		mipi_out: port@1 {
-			#address-cells = <0>;
+			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
 

-- 
2.49.0

