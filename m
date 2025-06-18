Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A329C3A8F7
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750242779; cv=none; b=YjgqH25lLS8HE9O/JzB1JUhSoLmKS1F5uIAhM1BsngrDk/upcTHfK1Cw84wU14qZyVYLfy1X2Ss5ecSKM/Tbf61EOXkTGf5LBEqJ+rJ3CSCqsMn+WPAKePmmwOJMPNidLD+iaGB8JxgOIoMcHMOm1N5WnExwn3WYkmKuDIGc4us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750242779; c=relaxed/simple;
	bh=RoUxprTWYp6bt8a6NhcyoQF0P4UOPKXOfvfhvUMjDrM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uRQ6DejtK0TE0HQhxKLuLzqv0s2hsWu1qqXrGwxKh2hkDvy+sqrQfe2guijgv2qxayK9uCW6OZYf9+yr8Qq9PHWJTT5WXZ6ssUgnqvVdgCC90yoRlki9NsR6MfH7vfztZpTzoCcUu3E8Fkl38kIiybqAOhIQ5PwOd7yN2KRlfcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=84.16.66.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bMg6t0WC0zW6F;
	Wed, 18 Jun 2025 12:32:54 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bMg6r6KLZzD9N;
	Wed, 18 Jun 2025 12:32:52 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH v3 0/5] rockchip: rk8xx: allow to customize PMIC reset mode
 on RK806
Date: Wed, 18 Jun 2025 12:32:39 +0200
Message-Id: <20250618-rk8xx-rst-fun-v3-0-081f02d3d348@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMeVUmgC/3XMQQ6CMBCF4auQrq2ZlrZSV97DuMB2kMYEyBQbC
 OHuFjYaE5fvJd+/sIgUMLJzsTDCFGLouzzKQ8FcW3cP5MHnzSRIDVoaTs9qmjjFkTevjjfSCKf
 gbjw4ls1A2IRp711vebchjj3Nez6J7f1XSoIDx7qyylt1UggX1yLRfPTItlKSH21A/2qZtVClF
 xa0Nd5/63Vd3yy6hw3oAAAA
X-Change-ID: 20250526-rk8xx-rst-fun-f261c40b6d0c
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
 Daniel Semkowicz <dse@thaumatec.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

This allows to customize the PMIC reset method (also called RST_FUN) on
RK806 PMIC from Rockchip, mainly found on RK3588 devices but also on
RK3576.

Finally, this is required on the two RK3588 devices from Theobroma as
U-Boot changes the silicon-default (which is suitable for us) to
something that breaks our companion microcontroller's reboot detection
which breaks a bunch of assumptions in the MCU FW code.

To validate this works on those devices do the following:

On Tiger:
i2cset -y -f 6 0x6f 0x9 0x62
On Jaguar:
i2cset -y -f 0 0x6f 0x9 0x62

You hear a nice (loud :) ) beep, then reboot and it should stop right
before entering U-Boot TPL again.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v3:
- (hopefully) fixed missing bitfield.h include in driver as reported by
  Intel's kernel test robot,
- removed dt-binding header file,
- removed mentions to constants that used to be in dt-binding header
  file since they aren't anymore,
- added (patch 3) header file in arch/arm64/boot/dts/rockchip to make
  the value of rockchip,reset-mode easier to understand when reading the
  device tree,
- Link to v2: https://lore.kernel.org/r/20250605-rk8xx-rst-fun-v2-0-143d190596dd@cherry.de

Changes in v2:
- moved rst_fun variable declaration out of the switch-case,
- initialized rst_fun variable to make kernel test robot happy even
  though the variable wouldn't be used uninitialized due to breaking
  before using it,
- renamed rockchip,rst-fun to rockchip,reset-mode
- rewrote rockchip,reset-mode binding description to not mention the
  relation to registers or register values,
- added binding header file to make it easier to understand what the
  mode is when reading a Device Tree without having to read the binding,
- Link to v1: https://lore.kernel.org/r/20250526-rk8xx-rst-fun-v1-0-ea894d9474e0@cherry.de

---
Quentin Schulz (5):
      dt-bindings: mfd: rk806: allow to customize PMIC reset mode
      mfd: rk8xx-core: allow to customize RK806 reset mode
      arm64: dts: rockchip: add header for RK8XX PMIC constants
      arm64: dts: rockchip: force PMIC reset behavior to restart PMU on RK3588 Jaguar
      arm64: dts: rockchip: force PMIC reset behavior to restart PMU on RK3588 Tiger

 .../devicetree/bindings/mfd/rockchip,rk806.yaml     | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts      |  2 ++
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi      |  2 ++
 arch/arm64/boot/dts/rockchip/rk8xx.h                | 18 ++++++++++++++++++
 drivers/mfd/rk8xx-core.c                            | 15 +++++++++++++++
 include/linux/mfd/rk808.h                           |  2 ++
 6 files changed, 60 insertions(+)
---
base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
change-id: 20250526-rk8xx-rst-fun-f261c40b6d0c

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>

