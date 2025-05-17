Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1411EA90;
	Sat, 17 May 2025 19:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747509597; cv=none; b=N3QGYz2Dt41iDY8k6Yy//+MKPbik9UayiOxDmUShk24pBF0gMef1kAFgQhSHb22T/U4pZQZGScATVgfgIEymVe+prmreO4vZbCG3I3mjkzz4oWS5K6yaV6CNf4ORFhZTBcF+ifHgeF3QTOE8PXQ+lKKjt6yhiSGrtP5d7QIziQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747509597; c=relaxed/simple;
	bh=m0rhmjL8pDzWwTV99e480ZMyCgYeWWuByDM1d3BgpJg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CgnLbPeMVCFz76A5w8M0WDtjPdG8S0AvYSEp5nLwHfFPLi5u/NlPcbj7OIF4RlDe4eel6j2NJXfi7USsaMVQ+YwVCyAQ703z85g4eL1iAtROpY20yFYQ3LCdP5x2Ki2QrnBHNvyM9ZTOPUcbzFlwqq3nNQPl+XvKshSKiPLZEtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [27.18.99.32])
	by smtp.qiye.163.com (Hmail) with ESMTP id 15658ef3f;
	Sun, 18 May 2025 03:19:44 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Subject: [PATCH v3 0/3] Add SpacemiT K1 USB3.0 host controller support
Date: Sun, 18 May 2025 03:19:18 +0800
Message-Id: <20250518-b4-k1-dwc3-v3-v3-0-7609c8baa2a6@whut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADbhKGgC/yXMyw6DIBCF4Vcxsy4JIDDoqzQuuIwtadQWrG1if
 PeSuvxOcv4dCuVEBfpmh0xbKmmZK9pLA+Hu5huxFKtBcqm5Fsi8Yg/B4ie0bGuZltw6ziVK66B
 +npnG9P33rsPpTK93za7nCN4VYmGZprT2jfMmhs6ZgFIESRStwSA0KoVolCNjx7HzSDAcxw83d
 CnCqwAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747509584; l=2565;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=m0rhmjL8pDzWwTV99e480ZMyCgYeWWuByDM1d3BgpJg=;
 b=RQik/nkIEBOID3dW/RIXcwUzBpll9dRE5Er0E9l14Zewu8TxWxL1+VA6nzaYwaF8oDxeDGbbm
 6t19cUhiwfQCxQsAyhm6gaORVvB8KC4/5Vvdi4XXfcPrcAA5TR5pX2M
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSk0eVktPTxlCTBlJShpJT1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVISVlXWRYaDxIVHRRZQVlPS0hVSktJT09PS1VKS0tVS1kG
X-HM-Tid: 0a96dfb024c803a1kunm15658ef3f
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PyI6OSo6EDE9CCo9Qxo3LA4B
	EwoKFExVSlVKTE9MTktCTkJKSktMVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVISVlXWQgBWUFPSUhCNwY+

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
Ze Huang (3):
      dt-bindings: usb: dwc3: add support for SpacemiT K1
      usb: dwc3: add common driver to support flattened DT
      riscv: dts: spacemit: add usb3.0 support for K1

 .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  |  84 +++++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  50 ++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  69 ++++++++
 drivers/usb/dwc3/Kconfig                           |   9 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/dwc3-common.c                     | 191 +++++++++++++++++++++
 6 files changed, 404 insertions(+)
---
base-commit: ab6dc9a6c721c2eed867c157447764ae68ff9b7e
change-id: 20250517-b4-k1-dwc3-v3-5208a002728a

Best regards,
-- 
Ze Huang <huangze@whut.edu.cn>

