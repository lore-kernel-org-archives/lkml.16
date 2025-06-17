Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB582F532F;
	Tue, 17 Jun 2025 22:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750199532; cv=none; b=bofsKWILsGZrUPyGdU5xchoLRsrrNE1lUye0GMcIsyp/qaXWT1MSim4qRnLOZ3FnRXxiMQlyHCUCLMjYtXoPMWvk6RME8P8F1zoVXQem+b6BrC9tHBnGspPMlFYYV0thnuMN4D/gC3mWfpFzfyHUqFWVcSUv6Aq4+5khFA0EkS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750199532; c=relaxed/simple;
	bh=nIg121UCuhRPAARvxyMgNGYeXPPt0yPDCGheulVUPew=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fYf0TK65mXtqwXYhvVzB5HFxZpEVwd6ao3Sg1rZEilMIVRfBeJfZkV3LGbwF9pFYrdHMGg6F5omOBjgAkiv5lGgGQqN4RAQAYVNf7Q4Mx1CHK1tDfM0OHm9PoZW54bz5FSiywtPt1gVNrdUSMF/Hkp3lVXLMnmakJT3ULK6IBgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kibDh6Lg; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kibDh6Lg"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4762441B5F;
	Tue, 17 Jun 2025 22:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750199523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=50/m+/yb0jxBjg1zUH7OGJM94gBchdEwxDdiaXdUt8c=;
	b=kibDh6LgFbbHogi/cLqDkDUuFnWUKPi51fZeyLRVk1ZUZVbfEKsPeFmlykH7krrqSY9qEj
	EwyJsh8npSM38ionZkwt5Cjnb9U3MOGI69yHD5GU8W3fZJm+OQ+MBbKTlTlUiSirCFVuac
	Nr++Cx+bhdAx+d37y8BInbkXlOs0Ky4K4zruOv7z7m6gEgXZ/kEIvSe+NQKyMQlGox4EYF
	7o98CNi45zM+JxdX275n+vTA9UVZz7QuNQ2XprM0UV32GErgrRwtPFLYB/eXec+XIB8Kvx
	qGB9dIuCIlprDp1ZZ8byTixDpwg2CtKZmcTM0asLpZhKuI0QDFRmISeBu4KErA==
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
Subject: [PATCH 0/3] Fix the Rockchip PinePhone Pro DTS warnings.
Date: Wed, 18 Jun 2025 00:31:59 +0200
Message-Id: <20250618-dtb_fixes-v1-0-e54797ad2eba@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN/sUWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0ML3ZSSpPi0zIrUYl1LczMTUxOguKFRqhJQfUFRKlgCqDw6trYWAL5
 +fvdbAAAA
X-Change-ID: 20250618-dtb_fixes-97645402512e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Olivier Benjamin <olivier.benjamin@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddufeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepqfhlihhvihgvrhcuuegvnhhjrghmihhnuceoohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtledttdduvdfhjeeiffevieegleevieelfeelfffhueelveevjeelhedvheekieenucfkphepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeipdhhvghloheplgduledvrdduieekrddurddvtdgnpdhmrghilhhfrhhomhepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhrtghpt
 hhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhotghktghhihhpsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: olivier.benjamin@bootlin.com

Small fixes to the PinePhone Pro DTS to fit bindings and
suppress warnings at build.

Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
Olivier Benjamin (3):
      arm64: dts: rockchip: Fix the panel compatible for the PinePhone Pro
      arm64: dts: rockchip: Fix the mipi port definition for RK3399
      arm64: dts: rockchip: Remove unused property in PinePhone Pro MIPI panel

 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
---
-- 
Olivier Benjamin <olivier.benjamin@bootlin.com>

