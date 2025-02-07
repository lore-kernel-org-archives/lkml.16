Received: from smtp-bc09.mail.infomaniak.ch (smtp-bc09.mail.infomaniak.ch [45.157.188.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52EC1EB1AD
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941620; cv=none; b=j4TifOk1ms/R5fp6z2vAqzgYxexMel5hHj0WVbcyFieJpG5HpE55aTyG6B/K3J6CT9slquXkpU4B5kqXyYqiXzYjNtThD2WL4qrjiLqU1hOq5MGt1DHPFmPrlMxAMQD4ujly1zdoMC2tlaiir2LzB51a20vK9rYBmlrMwsklQUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941620; c=relaxed/simple;
	bh=LpIibsjOdskommsa92S1H/0C4lxkS0o8gvVpdIh6j9w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V92Epo8HneZesfglYIKyBdBaJUpAa0+qYh81idZkWAYfc4OLNrv6fxPg12DGRT/g4uQqmE5tZ86TrthCrTvwTX69NwQHmU9uNVfEO43l0Rn8Lg2TDCX7F7oxrnTF9XJSAMmZOUIeQf6BSZp4BKN4jplzRligby5EybpJriR3y14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=45.157.188.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10:40ca:feff:fe05:0])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YqHhp4Lr8zPPm;
	Fri,  7 Feb 2025 16:20:10 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YqHhm54lLzpyq;
	Fri,  7 Feb 2025 16:20:08 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH v5 0/4] arm64: dts: rockchip: minimal support for Pre-ICT
 tester adapter for RK3588 Jaguar + add overlay tests
Date: Fri, 07 Feb 2025 16:19:57 +0100
Message-Id: <20250207-pre-ict-jaguar-v5-0-a70819ea0692@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ0kpmcC/3XMTWrDMBCG4asEraswM5ItKaveI3Shn1GsLpIgu
 yYh+O5VAgFT0+U3w/M+xMi18CgOu4eoPJexXM5tdB87EQd/PrEsqW1BQBoJenmt7RQn+e1PP77
 K4CD7zGxDsqKh9s7l9goev9oeyjhd6v3Vn/F5/Tc1o0Rpct9DSDoYiJ9x4Frv+8TimZrpzTtA3
 HKSILEzSaED0HnD1YqT3XDVuAlMGVxSDvxfrldc4YbrxqMzyGQ7YpvWfFmWX6yiN49pAQAA
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
      arm64: dts: rockchip: add overlay test for Edgeble NCM6A
      arm64: dts: rockchip: add overlay tests for Rock 5B PCIe overlays
      arm64: dts: rockchip: minimal support for Pre-ICT tester adapter for RK3588 Jaguar

 arch/arm64/boot/dts/rockchip/Makefile              |  39 +++++
 .../dts/rockchip/rk3588-jaguar-pre-ict-tester.dtso | 171 +++++++++++++++++++++
 2 files changed, 210 insertions(+)
---
base-commit: bb066fe812d6fb3a9d01c073d9f1e2fd5a63403b
change-id: 20241206-pre-ict-jaguar-b90fafee8bd8

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>

