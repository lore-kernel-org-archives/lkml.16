Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805DE2F5328;
	Tue, 17 Jun 2025 22:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750199534; cv=none; b=DM4fJg0BgqwpbYkV8fLjRqONwodC493OJfRuJhXsS3tnQ9NzCE0Cco0mI0z1HHNUtNKBN17jz24J1dcKb1YoEzA+ZzZyOJJuy/atv6buXGZ6+cgj/c6/KhWCR1a2+YQ2ffRneUy/fiSvL2qL6P7B23RKmpQ8lk/BO5o1SGtXzfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750199534; c=relaxed/simple;
	bh=dCX1n65xBRoezMqGO2CbhPRyi4/zYkLQkgcntqwDZio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PfaY5kHAhVQ1Djrg3YAXgTs2mQddfT8y0niG5lg9+2uz0Xg9zL9AtPrYpY0QgteJK4sEMj/kcs2v6eDqBHGNqrAgK6/W08xGnpc2rGQfTyybkwEp9jVIqjuVwaatXPLJ+vqWkkq2lnh99nbtRGsW6t2G4j+QmwH4i3Zxnz06+YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=f7YEoRxa; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="f7YEoRxa"
Received: by mail.gandi.net (Postfix) with ESMTPSA id A21D64316C;
	Tue, 17 Jun 2025 22:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750199525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=esmmfpi3kvEuTnF8NNPy+ASdlcPdHl8nczq2Wpky2kI=;
	b=f7YEoRxabbDiuDE81Y4N7liiuep0PepQZBg4OcbRpIFGIKa4Bn/euoAyzd5uw/Dqwk32+3
	3ZfiIWRiAz+G/U/aPg4jtSknpoUL3rw0jZIl42c21UD0ai3BnXJnWL8dO8ziKmBz53G5LP
	ua9CNK/CX6XDyNfKjkN5B/Sfl8It4K5mbJzTAs34AikOaMRL7SldUojIGlSAG9DsCrjBly
	B8l1OmSOyUrd/gfBQuCx8RzgXbxKj7mr2FPpzKU5PVqUsCo1GmxTS1+7fyq+Fpsf6f3qhp
	bFxZfOaciK6wQ+0N6uXDXw4hLHh9bpeJuihmnY5qOwZH324wEJ32gLSYAWDHMw==
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
Date: Wed, 18 Jun 2025 00:32:02 +0200
Subject: [PATCH 3/3] arm64: dts: rockchip: Remove unused property in
 PinePhone Pro MIPI panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-dtb_fixes-v1-3-e54797ad2eba@bootlin.com>
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

The MIPI panel definition in the PinePhone Pro DTS includes a
"pinctrl-names" property, which is unused in the absence of pinctrl-0.

Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 5a7341fb6bcb0613af6f3ac31d99355a0f890e89..405140700208365c8631de86a2d7b6e577b7aa7f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -485,7 +485,6 @@ panel@0 {
 		reset-gpios = <&gpio4 RK_PD1 GPIO_ACTIVE_LOW>;
 		vcc-supply = <&vcc2v8_lcd>;
 		iovcc-supply = <&vcc1v8_lcd>;
-		pinctrl-names = "default";
 
 		port {
 			mipi_in_panel: endpoint {

-- 
2.49.0

