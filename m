Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8B4215798;
	Wed,  9 Apr 2025 21:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744235554; cv=none; b=mfojOGZ9tChfXoFpjmZRowp9+dgDlkAgRaucvVL8DT94L0UndQ9VeU8bNLOi839t2xjR8ut2PDmt1A628GzsInCwkPdzv7ImQH6umuNpQrvD/iEWPGE6cgLHaOC1zVQ8Qdi5+yKy6+HEK+tYPm3UoIdlPuiwJqPN23l0txGAWYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744235554; c=relaxed/simple;
	bh=CXl1nA0gkeV3YEJmr8NWq0DTje/v81qqIMYYeDNAeDU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t5iiIy/HmlvCOtgpcefsilp2F04IVZPWvM2d6kQDEgOOPR2efV7rj3C+AVhzwLDNo9CAe24quCj5MORNvrYxPebcozSk09Pxr5NyIknk9tSDa4LYQ9ltaT/U6v/z2SUJ5Bd2vCJzWbQsjCGYGFmxndW2iqwnP1eznvFw18Hxbuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XHDuLYqj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XHDuLYqj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C563AC4CEE8;
	Wed,  9 Apr 2025 21:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744235553;
	bh=CXl1nA0gkeV3YEJmr8NWq0DTje/v81qqIMYYeDNAeDU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=XHDuLYqjrOWOMRNWHG6AeY5Mtn8ADaRdFFep9MMuj1N9uaB/BgbZI4KPzxFWhuwoy
	 bG3tsj944PcXJi24qOgjbWL9ALH5ICZQMgpcNIXPum4q/PzAi6+hKwGyDHcDWS5gwN
	 BwyzRCrYikMxDu23jqoBWSSBvzLCIakPChgIuUqVEMhk9m4AX1d305gAiczPTzSmkS
	 lJbuAofZZ7HQ9QOcDe60mG8X5W7V1ICac96vDoFdnQeVEaXcoW/h0AdCbaS73d4T+H
	 ZBUQxF1m+ZfxKq5Tmq6b5My7QPmACzIUM+1AchxTPUXY+WLq3Br9ppKTRQhBbjY/po
	 xu7FyM2SEAHSA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA93C36002;
	Wed,  9 Apr 2025 21:52:33 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v4 0/3] Driver for the Apple SPMI controller
Date: Wed, 09 Apr 2025 23:52:11 +0200
Message-Id: <20250409-spmi-v4-0-eb81ecfd1f64@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAvs9mcC/13MywrCMBCF4VcpWRuZJL2NK99DXKS5tAF7IZGgl
 L67aa1QXJ5hvn8mwXhnArlkM/EmuuDGIY38lBHVyaE11Om0CQdegICchql3tNRC8bxB4JUk6XX
 yxrrXlrnd0+5ceI7+vVUjW6+/QPENREaBKqxtUTIrEe217aV7nNXYkzUQ+RFVO+IJGaV0A6W0D
 eI/EgfEYEciIeSy5qbSaEEf0bIsH2wPcXQCAQAA
X-Change-ID: 20250304-spmi-6d3c24b9027a
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Jean-Francois Bortolotti <jeff@borto.fr>, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744235551; l=1649;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=CXl1nA0gkeV3YEJmr8NWq0DTje/v81qqIMYYeDNAeDU=;
 b=XaQhaaJwxWHZCyL0KjusE3kB1Cm7zwrQ5Xz6uFE0AeD50bT/9JjX1VrQy+u4VWeDkY50nLAPX
 baXS3qrjf/BBHGmLCoCIkp68qo0X+nI92t2lj1YDpAIHXpBgv0S4QhT
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

Hi.

This patch series adds support for the SPMI controller persent in most
Apple SoCs. The drivers for the attached PMU and subdevices will be in
further patch series.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Changes in v4:
- Rebase on 6.14
- Link to v3: https://lore.kernel.org/r/20250310-spmi-v3-0-92a82e7d9f0d@gmail.com

Changes in v3:
- Inlined helpers, dropped unneccesary error prefixes
- Link to v2: https://lore.kernel.org/r/20250307-spmi-v2-0-eccdb06afb99@gmail.com

Changes in v2:
- Removed redundant error prints
- Various style fixes
- Better explanation of why the driver is needed
- Link to v1: https://lore.kernel.org/r/20250305-spmi-v1-0-c98f561fa99f@gmail.com

---
Jean-Francois Bortolotti (1):
      spmi: add a spmi driver for Apple SoC

Sasha Finkelstein (2):
      dt-bindings: spmi: Add Apple SPMI controller
      arm64: dts: apple: Add SPMI controller nodes

 .../devicetree/bindings/spmi/apple,spmi.yaml       |  49 ++++++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi          |   7 +
 arch/arm64/boot/dts/apple/t8103.dtsi               |   8 +
 arch/arm64/boot/dts/apple/t8112.dtsi               |   7 +
 drivers/spmi/Kconfig                               |   8 +
 drivers/spmi/Makefile                              |   1 +
 drivers/spmi/spmi-apple-controller.c               | 168 +++++++++++++++++++++
 8 files changed, 250 insertions(+)
---
base-commit: a24588245776dafc227243a01bfbeb8a59bafba9
change-id: 20250304-spmi-6d3c24b9027a

Best regards,
-- 
Sasha Finkelstein <fnkl.kernel@gmail.com>


