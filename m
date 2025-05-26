Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A6320E6F3;
	Mon, 26 May 2025 14:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748270435; cv=none; b=WrSsAyb9jOvZbvcTa4E3jkmvDa2/kAWjnlY2CrsECuWGd++uxrMsC4OZAZbL8QyjhXLd8KGeSRrJJ0y0XTTrbEmtqK3QNtiweLgZrZWHAuGoWPkKtuDt3RNurxmOwHYr29fP/LrBancVgTYs0rQHvXQN48gMmDKRMpyDyWn6GAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748270435; c=relaxed/simple;
	bh=UwYs87yRsBWeAWhjsFHInESFLeGByLOKRNJA8pL/8tA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oept1SwIfBJHSNWUZ/nb0IMmBPqc8iNZ6awKuaO/mhXDF9pQvUpRh838WxxcJxX9j+0hlbmOIwG0LmIHsigFzdZoOzLmaMITMy/HkKWngxjgTnc+0DYk+Ff3+GUkured9nr0h2F9TyqZaQ1W7f13ldJfO58PoDH6TB1glq87JIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [27.18.99.37])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16709a31a;
	Mon, 26 May 2025 22:40:23 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Subject: [PATCH v4 0/4] Add SpacemiT K1 USB3.0 host controller support
Date: Mon, 26 May 2025 22:40:16 +0800
Message-Id: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFB9NGgC/12OQW6DMBBFr4JmXUfGGI/JKveoshjbQ7GqQGIDa
 RVx9zokq0qzeSP9p/eAzClyhmP1gMRrzHEaC+iPCvxA4xeLGAqDkqqVbY3CafFdi3D3jVgb0Sp
 pSUqFyhKUzTVxH3923+f5xYlvS9HOryc4yiz8dLnE+ViRM8F3ZDyq2ivmYA36ukWtEY0mNrbvO
 4cMT9cQ8zyl3z11bXbZu8r+qyonBRrZeeuIFJnTfVjmA4fl4Ec4b9v2B7jy5tz4AAAA
X-Change-ID: 20250517-b4-k1-dwc3-v3-5208a002728a
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748270423; l=3206;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=UwYs87yRsBWeAWhjsFHInESFLeGByLOKRNJA8pL/8tA=;
 b=VKhvsm5zyaoz+pOknrfYlyH+CSJHZUmJn4KRjwnhQm3gtswdUiMWtwRYa/PZcZFjqn0ibmCn1
 FMAG47sUzAHBen03n+EY+t1jemAzpmRu1L+H+tXCEDv1enfjEuAIhCZ
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHkwfVh5OTkhOGENLTxkeGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVITFlXWRYaDxIVHRRZQVlPS0hVSktJQk1KSlVKS0tVS1kG
X-HM-Tid: 0a970d099e7703a1kunm5f56ec4c12d97
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PyI6KQw4GjE*TQwsGisLFQMv
	AjEKFBVVSlVKTE9DSUxLT0hLSkNMVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVITFlXWQgBWUFPQkhNNwY+

The USB 3.0 controller found in the SpacemiT K1 SoC[1] supports both USB3.0
Host and USB2.0 Dual-Role Device (DRD). The PHY interfaces required for the
K1 USB subsystem — PIPE3 (for USB 3.0) and UTMI+ (for USB 2.0) — have
already been supported in a separate patchset [2].

This controller is compatible with DesignWare Core USB 3 (DWC3) driver.
However, constraints in the snps,dwc3 binding limit the ability to extend
properties to describe hardware variations. The existing generic DWC3 driver,
dwc3-of-simple, still functions as a glue layer.

To address this and promote trasition to flattened dwc node, this patch
introduces dwc3-common, building upon prior work that exposed the DWC3 core
driver [3].

This patchset is based on usb-next (6.15-rc6) and has been tested on BananaPi and Jupiter development boards.

Link: https://developer.spacemit.com/documentation?token=AjHDwrW78igAAEkiHracBI9HnTb [1]
Link: https://lore.kernel.org/linux-riscv/20250418-b4-k1-usb3-phy-v2-v2-0-b69e02da84eb@whut.edu.cn [2]
Link: https://lore.kernel.org/all/20250414-dwc3-refactor-v7-3-f015b358722d@oss.qualcomm.com [3]

Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
Changes in v4:
- dt-bindings spacemit,k1-dwc:
  - reorder properties
  - add properties of phys & phy-names
  - add usb hub nodes in example dt
- add support for spacemit,k1-mbus
- dwc3 generic plat driver:
  - rename dwc3-common.c to dwc3-generic-plat.c
  - use SYSTEM_SLEEP_PM_OPS macros and drop PM guards
- dts:
  - reorder dts properties of usb dwc3 node
  - move "dr_mode" of dwc3 from dtsi to dts
- Link to v3: https://lore.kernel.org/r/20250518-b4-k1-dwc3-v3-v3-0-7609c8baa2a6@whut.edu.cn

Changes in v3:
- introduce dwc3-common for generic dwc3 hardware
- fix warnings in usb host dt-bindings
- fix errors in dts
- Link to v2: https://lore.kernel.org/r/20250428-b4-k1-dwc3-v2-v1-0-7cb061abd619@whut.edu.cn

Changes in v2:
- dt-bindings:
  - add missing 'maxItems'
  - remove 'status' property in exmaple
  - fold dwc3 node into parent
- drop dwc3 glue driver and use snps,dwc3 driver directly
- rename dts nodes and reorder properties to fit coding style
- Link to v1: https://lore.kernel.org/all/20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn

---
Ze Huang (4):
      dt-bindings: usb: dwc3: add support for SpacemiT K1
      dt-bindings: soc: spacemit: Add K1 MBUS controller
      usb: dwc3: add generic driver to support flattened DT
      riscv: dts: spacemit: add usb3.0 support for K1

 .../bindings/soc/spacemit/spacemit,k1-mbus.yaml    |  55 ++++++
 .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 116 +++++++++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  51 ++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  67 ++++++++
 drivers/usb/dwc3/Kconfig                           |   9 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/dwc3-generic-plat.c               | 189 +++++++++++++++++++++
 7 files changed, 488 insertions(+)
---
base-commit: ab6dc9a6c721c2eed867c157447764ae68ff9b7e
change-id: 20250517-b4-k1-dwc3-v3-5208a002728a

Best regards,
-- 
Ze Huang <huangze@whut.edu.cn>

