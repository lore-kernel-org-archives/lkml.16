Received: from smtp-bc0d.mail.infomaniak.ch (smtp-bc0d.mail.infomaniak.ch [45.157.188.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9743D250BEC
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282605; cv=none; b=SsDt/adXty1yqRHVGqOh7bBUQupJjLel+sUVK3ol16Vlh/MvRkcUriWqlSjXPo16+8Kq48AP95d+ifuCgYOVCu9yUCGp6HfKuT9J79Xln86qml1XH0AtUYVjLr1+TzzESS0Q8my3jk3E0Suhg9NjBuiO64z+qtpfqGAKOL4BLz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282605; c=relaxed/simple;
	bh=rYh4Dnb62unhJiOrcDe5+tZ7K91W5DKSNixfUcOvxAk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lYb0yRlkEsQZ6tAJZ3mEwgkXbwapYDqiyTbxXKaDpKuovFuvlnHl+VW6/jtXly2IvYeB4h2X60ymx16EaTqR2oNz2P0mLer7pahpRP++bUNxEaTfUG/HpdD+RgxlzOsLO/6rjmld8Skq87hWL8DV6CNphGlY4wr9ARIWBfkR8y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=45.157.188.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10:40ca:feff:fe05:1])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YsjpB5R7vzCW2;
	Tue, 11 Feb 2025 15:03:14 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4Ysjp64YmmzTBS;
	Tue, 11 Feb 2025 15:03:10 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH v6 0/4] arm64: dts: rockchip: minimal support for Pre-ICT
 tester adapter for RK3588 Jaguar + add overlay tests
Date: Tue, 11 Feb 2025 15:02:49 +0100
Message-Id: <20250211-pre-ict-jaguar-v6-0-4484b0f88cfc@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIlYq2cC/3XMTW7DIBCG4atErEs1M4CBrnqPqAt+hpgukgqnV
 qLIdy+JVNWK1eU3o+e9iYlb5Um87W6i8Vynejr2MbzsRBrD8cCy5r4FAWkkGORX66d0lp/h8B2
 ajB5KKMwuZic66u9SL4/g/qPvsU7nU7s++jPer/+mZpQobRkGiFlHC+k9jdza9TWzuKdm+uUGE
 LecJEg0Niv0ALpsuFpxchuuOreRqYDPykN45nrFFW647jx5i0zOELv8zM0fJ7AbbjoPFhx6DjB
 4WvNlWX4A4S1TXKgBAAA=
X-Change-ID: 20241206-pre-ict-jaguar-b90fafee8bd8
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jagan Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>, 
 Michael Riesch <michael.riesch@wolfvision.net>
Cc: Jonas Karlman <jonas@kwiboo.se>, Dragan Simic <dsimic@manjaro.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

This adds minimal support for the Pre-ICT tester adapter for RK3588
Jaguar.
GPIO3A3, GPIO3A4, GPIO3B2 and GPIO3D2 to GPIO3D5 are all routed to power
rails and can only be used as input and their bias are important to be
able to properly detect soldering issues.

Additionally, this adds build-time overlay application tests for all
Rockchip overlays to try to avoid future regressions.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v6:
- added overlay test for neu6a-wifi on top of neu6b-io,
- reworded instructions in comment to not use en/em-dashes,
- renamed placeholder from <name of overlay application test> to
  <overlay-application-test>
- added Rb from Dragan,
- Link to v5: https://lore.kernel.org/r/20250207-pre-ict-jaguar-v5-0-a70819ea0692@cherry.de

Changes in v5:
- re-add dtb-$(CONFIG_ARCH_ROCKCHIP) += *.dtbo so that an explicit rule
  exists and we don't rely on the overlay tests to generate the dtbo,
- reword comment on overlay tests by making it explicit that we require
  both an overlay test and an explicit build target for the dtbo,
- Link to v4: https://lore.kernel.org/r/20250131-pre-ict-jaguar-v4-0-c971e2852e8d@cherry.de

Changes in v4:
- fix typos in WolfVision patch,
- added Rb on WolfVision patch,
- Link to v3: https://lore.kernel.org/r/20250128-pre-ict-jaguar-v3-0-7be2f09d390a@cherry.de

Changes in v3:
- removed Fixes tag and intent to send to stable as this patch almost
  doubles the size of the main DTB. Let's not potentially break users of
  stable releases,
- added Wolfvision PF5 overlay tests, thanks Michael,
- added comment on how to add new overlays (via tests), and the side
  effects,
- grouped the overlay application test target with the definition of its
  dependencies (DTB + DTBO(s)),
- added trailers,
- Link to v2: https://lore.kernel.org/r/20250116-pre-ict-jaguar-v2-0-157d319004fc@cherry.de

Changes in v2:
- add overlay application tests for Edgeble NCM6A WiFi and Rock 5B PCIe
  Endpoint+SNRS
- add overlay application test for RK3588 Jaguar + Pre-ICT tester
  adapter,
- Link to v1: https://lore.kernel.org/r/20241206-pre-ict-jaguar-v1-1-7f660bd4b70c@cherry.de

---
Quentin Schulz (4):
      arm64: dts: rockchip: add overlay test for WolfVision PF5
      arm64: dts: rockchip: add overlay test for Edgeble NCM6A/NCM6B
      arm64: dts: rockchip: add overlay tests for Rock 5B PCIe overlays
      arm64: dts: rockchip: minimal support for Pre-ICT tester adapter for RK3588 Jaguar

 arch/arm64/boot/dts/rockchip/Makefile              |  43 ++++++
 .../dts/rockchip/rk3588-jaguar-pre-ict-tester.dtso | 171 +++++++++++++++++++++
 2 files changed, 214 insertions(+)
---
base-commit: febbc555cf0fff895546ddb8ba2c9a523692fb55
change-id: 20241206-pre-ict-jaguar-b90fafee8bd8

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>

