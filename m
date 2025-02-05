Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5386916CD1D
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738769570; cv=none; b=Qv1tooU7vXcQXzCNLakz0Pe/ZakilVVSTIvwyO43Qcarkt+S5ZlLDDS1yACbr61ksmEZQEp6RafTPxuO5egUpAC6PilPCgRXiv4rt0hjiSDnj1GeR9J3pzZha+XVdMXEXK1gaVx2Jp2ygyapnZmazyFOSJLNy3a9Wwe6rAFvQ8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738769570; c=relaxed/simple;
	bh=068L9JuebzaVgYIlrk/x8qa8eMaFZWqz8jMTMgUSNPA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fn9gqyib+oPJQfkWzvcr6jvOfFiwblpavidl+5tQFvWiv2cmj+q2k/49LRLh4Sg4R/69dRkO4YV+pzAat4Y4EsIqC2V1tv4dQgSE0qH+VBXfyFl/8ozF8glQufZHL6ZAK89UIL99b3NU9TRUPN5pEswUU9lG945zIACs1r6pxaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1tfhOI-0005Jb-NI; Wed, 05 Feb 2025 16:32:38 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH v4 0/6] ARM64: dts: intel: agilex5: add nodes and new board
Date: Wed, 05 Feb 2025 16:32:21 +0100
Message-Id: <20250205-v6-12-topic-socfpga-agilex5-v4-0-ebf070e2075f@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIWEo2cC/43NQW7DIBCF4atErDvVMNiYZNV7RF1gGBykyljgI
 keR716STRat2i7/t/jeTRTOkYs4HW4ic40lprlF93IQ7mLniSH61oKQOokKoWqQBGtaooOSXFg
 mC3aKH7z1cMTglTfhaNCJJiyZQ9we+vm99SWWNeXr46zK+/o/t0pAGGnUw2CQNfLbwvP0ueY0x
 +3Vs7jjlZ6gpP53kBpodEe9ZueGkX4E1RMk/ANUDSRrnA+DCj3ab+C+71+P+jixbQEAAA==
X-Change-ID: 20241030-v6-12-topic-socfpga-agilex5-90fd3d8f980c
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>
Cc: kernel@pengutronix.de, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

This series adds the gpio0 and gmac nodes to the socfpga_agilex5.dtsi.
As the the socfpga-dwmac binding is still in txt format, convert it to
yaml, to pass dtb_checks.

An initial devicetree for a new board (Arrow AXE5-Eagle) is also added.
Currently only QSPI and network are functional as all other hardware
currently lacks mainline support.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Changes in v4:
- extract gmii-to-sgmii-converter binding to pcs subdir
- fix dt_binding_check warnings
- rebase to v6.13-rc1
- Link to v3: https://lore.kernel.org/r/20241205-v6-12-topic-socfpga-agilex5-v3-0-2a8cdf73f50a@pengutronix.de

Changes in v3:
- add socfpga-stmmac-agilex5 compatible
- convert socfpga-dwmac.txt -> yaml
- add Acked-bys
- rebase to v6.13-rc1
- Link to v2: https://lore.kernel.org/r/20241125-v6-12-topic-socfpga-agilex5-v2-0-864256ecc7b2@pengutronix.de

Changes in v2:
- fix node names according to dtb_check
- remove gpio 'status = disabled'
- mdio0: remove setting of adi,[rt]x-internal-delay-ps. 2000 is the
  default value
- add Acked-by to dt-binding
- Link to v1: https://lore.kernel.org/r/20241030-v6-12-topic-socfpga-agilex5-v1-0-b2b67780e60e@pengutronix.de

---
Steffen Trumtrar (6):
      dt-bindings: socfpga-dwmac: fix typo
      dt-bindings: net: dwmac: Convert socfpga dwmac to DT schema
      dt-bindings: net: dwmac: add compatible for Agilex5
      arm64: dts: agilex5: add gmac nodes
      dt-bindings: intel: add agilex5-based Arrow AXE5-Eagle
      arm64: dts: agilex5: initial support for Arrow AXE5-Eagle

 .../devicetree/bindings/arm/intel,socfpga.yaml     |   1 +
 .../bindings/net/pcs/altr,gmii-to-sgmii.yaml       |  47 +++++++
 .../devicetree/bindings/net/socfpga-dwmac.txt      |  57 ---------
 .../devicetree/bindings/net/socfpga-dwmac.yaml     | 109 ++++++++++++++++
 arch/arm64/boot/dts/intel/Makefile                 |   1 +
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     |  90 +++++++++++++
 .../boot/dts/intel/socfpga_agilex5_axe5_eagle.dts  | 140 +++++++++++++++++++++
 7 files changed, 388 insertions(+), 57 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20241030-v6-12-topic-socfpga-agilex5-90fd3d8f980c

Best regards,
-- 
Steffen Trumtrar <s.trumtrar@pengutronix.de>

