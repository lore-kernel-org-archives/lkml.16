Received: from smtp-bc09.mail.infomaniak.ch (smtp-bc09.mail.infomaniak.ch [45.157.188.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CB329AB11
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751022639; cv=none; b=C/vzfoW6iYseyZbzmGY3PjtkmTL9RHbUi2QoZQZlSI/Yb6a4vS2v2bWVcVJ18s/ElxYrNnPOBQ4waM+ooUsOLtZabmZzeLV7kNt1azzjwWFFM06LNzI943ljf+1KwJYzEJLDSXO5KDl8WXBaOXhhwGUkv/Bg1/iHl2hJnCJUk4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751022639; c=relaxed/simple;
	bh=c2BRS8EGRW0lz16wd0YVRIyZ1Rmg4QlbyrrNMHMHbyU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bg5GylUfj8SlAq6fkG66awqqK2U45GR17ZDAh/GvWMBVQ9UH9CcxW54Rs8m1ZkfnKdx1cJ8GtMZahXzKD0Tts0zGduzQRCWdp+vSuaecpqY1EnStjrhm7ADjcSExoWrWRMXLGAjk+N+pQm9O19KNC3ANb2JU/zVumxIEgOgr0ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=45.157.188.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bTC9J1vZfzGvr;
	Fri, 27 Jun 2025 12:54:12 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bTC9G5wQdzvtY;
	Fri, 27 Jun 2025 12:54:10 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH v4 0/5] rockchip: rk8xx: allow to customize PMIC reset mode
 on RK806
Date: Fri, 27 Jun 2025 12:53:52 +0200
Message-Id: <20250627-rk8xx-rst-fun-v4-0-ce05d041b45f@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEB4XmgC/3XMSw6CMBSF4a2Yjq25fVocuQ/jALm30piAaZFAC
 Hu3MJGQODwn+f6JJYqBErscJhapDym0TR76eGBVXTZP4gHzZhKkASMtjy83DDymjvtPw720otL
 wsAgVy+YdyYdh7d3uedchdW0c13wvlvdfqRccOJWu0Fjosya4VjXFOJ6Q2FLq5U9bMHstsxZao
 SjAFBZxr9VGC7fXKmtwwoNEhUq7rZ7n+Qt2GSuIJgEAAA==
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
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Changes in v4:
- removed not-so-useful dev_dbg message about missing property,
- unwrapped RK806_RST_FUN_MSK into the line above,
- reworded regmap_update_bits error message according to Lee's
  suggestion,
- Link to v3: https://lore.kernel.org/r/20250618-rk8xx-rst-fun-v3-0-081f02d3d348@cherry.de

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
 drivers/mfd/rk8xx-core.c                            | 12 ++++++++++++
 include/linux/mfd/rk808.h                           |  2 ++
 6 files changed, 57 insertions(+)
---
base-commit: b004ef1a3e9210ef9b9092ed8812ab8cc65b10e9
change-id: 20250526-rk8xx-rst-fun-f261c40b6d0c

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>

