Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C6A1C84BE;
	Wed, 14 May 2025 15:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235290; cv=none; b=XGWXwwZD+qkUl/AA4E3lfDF8bHsmrF6/k6gJ6X2IgJKcV8banLoEHUryDCYHNtX99FLR1OmiDGrPx3fB2X5mrVADs2j5WVHhyY6gY/dnXJg7dkHcPx6mffpJaeH291Q8qMbTpvcqwO+NdT6pMCaRE1setdC5vOI3hAYinnYyAJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235290; c=relaxed/simple;
	bh=xCYtFUpTGqULhhJDmrRpY7eJGnIV2/9UMmy9AU5uAa8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OEe3yEBc0FLDYgPxayrznd4axjXmnd3ZxSbDTThwHrcrGFk+m8hCcZlWH6RTpDMMBg19TzmAQJQiqMxLn4xtTqiUC28V1n3GRLfIRXLns3CCT7izajMjZntNK6MpO8T2q7yyvgielCcgb5KZ0NIXIoggOVRnmFlBDG3hEdN4KoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Wehp5Nrs; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Wehp5Nrs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=r/T8u/YGlcTXI2+Z4Mxkx4Z7ysJrrW1T+OiQN9/psA4=; b=Wehp5NrskZ74iDp1HpaA1cAZWF
	m/op1NJ/aypjE44REZtffndjc6zKYnfMotDPTxjiOtusAUmgvWppl/q+ZkT+SSkN+WqQZO2qOJ5PL
	KHLmfaLXx218Vk5ppWEwbusjuhMCzXsn6MOOB7kQpLgd+fA/gwHGTUp2qXd3LAh9TmicNvutNVPTk
	5R8BX4KGkNurQIpF641Fi6OOfcA+VvqLzy4oV3nZ4UMx6nE46urKnUStpY2imU9KSVuPkmp7B28H6
	8jd202o13PgJEmNHXbWi4vtHouWPJh5hud7MwNa93S8HUN3qWfYa8838gDxU6Dpf6jlukguCg77x4
	C+TTAEQw==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFDi7-0006vE-Ne; Wed, 14 May 2025 17:07:55 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/6] Add two board-families from Theobroma-Systems
Date: Wed, 14 May 2025 17:07:39 +0200
Message-ID: <20250514150745.2437804-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both the Cobra and PP1516 boards are based around the PX30 SoC and can be
found with a variety of display options.

As new boards should not use the deprecated snps,reset-* properties
in the gmac node, I also added a core mdio-node for the gmac and
converted the Theobroma Ringneck board over.

Testing with the new node both before and after converting Ringneck
showed the board finding its network both when booting locally and
from the tftp/nfs.

changes in v4:
- fix mistake of "," and ";" in pinctrl-hogs after moving entries around
- the port properties for the DSI displays were added in
  - https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=bf0636f4348e098e2338eebbe42d7780c58a1195
  - https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e782ac936941cff4c5580bb5cc2ec0e91468068c

changes in v3:
- more sorting
- more Reviewed-bys
- pull-down for dsp-rst
- pp1516 accel pinctrl group

changes in v2:
- add received Acks/Reviews
- drop "rockchip" prefix from system-power-controller (Diederik)
- split out prototype-pins to prototype variant
- address Quentin's review comments
  - ethernet0 alias for Cobra
  - a number more pinctrl entries for gpios
  - drop unused slp pinctrl entries
  - additional comments
  - use gpio-constants for pmic int
  - ordering (nodes + properties)
  - clarify vccio_sd more
  - interrupt line for pp1516 accelerometer

Heiko Stuebner (6):
  arm64: dts: rockchip: add basic mdio node to px30
  arm64: dts: rockchip: move reset to dedicated eth-phy node on ringneck
  dt-bindings: arm: rockchip: add PX30-Cobra boards from Theobroma
    Systems
  arm64: dts: rockchip: add px30-cobra base dtsi and board variants
  dt-bindings: arm: rockchip: add PX30-PP1516 boards from Theobroma
    Systems
  arm64: dts: rockchip: add px30-pp1516 base dtsi and board variants

 .../devicetree/bindings/arm/rockchip.yaml     |  18 +
 arch/arm64/boot/dts/rockchip/Makefile         |   6 +
 .../rockchip/px30-cobra-ltk050h3146w-a2.dts   |  39 ++
 .../dts/rockchip/px30-cobra-ltk050h3146w.dts  |  39 ++
 .../dts/rockchip/px30-cobra-ltk050h3148w.dts  |  39 ++
 .../dts/rockchip/px30-cobra-ltk500hd1829.dts  |  73 +++
 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi  | 566 ++++++++++++++++
 .../rockchip/px30-pp1516-ltk050h3146w-a2.dts  |  39 ++
 .../dts/rockchip/px30-pp1516-ltk050h3148w.dts |  39 ++
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi | 602 ++++++++++++++++++
 .../boot/dts/rockchip/px30-ringneck.dtsi      |  22 +-
 arch/arm64/boot/dts/rockchip/px30.dtsi        |   6 +
 12 files changed, 1485 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3148w.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi

-- 
2.47.2

