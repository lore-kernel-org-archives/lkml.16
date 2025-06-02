Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32441A23BA;
	Mon,  2 Jun 2025 05:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748842553; cv=none; b=fezdC32bkTkJV+G594sMTCbUDvP5g7UDCo1w18vyOfKtfqqtgkfU03ffQsPM0g4J4Uy5J/YL25FOD8V37eLFANQPYOfSfbwffCjZnT/vy6xEG6Oy7JWhZEiYkNJ2OkdI1bKRZCswcBtKzeaj2mgRNsB7zTVHzT6sMqvmXbn/2KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748842553; c=relaxed/simple;
	bh=xYawO1iMI+DktvXg7m+0yXGAuCtCj8eg6S/Kl5Wr6tI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mQn01iPpssQq3U+bKRccsa5EQgJ/BCXjGBpCgf1G4lsGcqchQBdhkn2WVCNSgnipdaBcVU9G1KG5rkVVpIxEtgAqrL5P6wAEZXVYBQWHBCEZVXPCvceAIPhJzwCk28TD0AptXeIt1/DVMrZ8ZMOT5k6KstFtePzde1r2lKyjQiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=lDcyj2KZ; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="lDcyj2KZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1748842551; x=1780378551;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xYawO1iMI+DktvXg7m+0yXGAuCtCj8eg6S/Kl5Wr6tI=;
  b=lDcyj2KZecaSA3bmZi/kRim5hh9FSlh80y78LUqFj702ZK0uqYDbf3AH
   PMoUNmPxa64rpoTKgPhCgTJ6BzS3uUXB/opvBJ/d4xoFJeXfoOPMwGBus
   vED1zToC/NLCwgrCpYPgVIXr6JsAwVABDJ9qp8j7J7IT8yTpgvu7dDxOX
   vmMB0mXSgSzhai0dGIW4dp6g54Sxu72dvn57OVIkCd2s/c69a63E6dMWo
   N4WyfhocqP4/n+7IyQKnkBC/Os3ceagLNryUCwRGnKv9zIX0vLS6R/5io
   QoeFR9NaIZG9JYW15HOoxtmqHGbfASBK553pFFFOjJeD0BCc/1UUFez4y
   Q==;
X-CSE-ConnectionGUID: 8pkaetzaTf2iFp4Ql+AwUg==
X-CSE-MsgGUID: xIBj22/+S1y/yI3wQAnNUQ==
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; 
   d="scan'208";a="42865331"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Jun 2025 22:35:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 1 Jun 2025 22:35:24 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Sun, 1 Jun 2025 22:35:17 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH v3 0/4] dt-bindings: mtd: microchip-nand: convert txt to yaml
Date: Mon, 2 Jun 2025 11:05:03 +0530
Message-ID: <20250602053507.25864-1-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Convert microchip nand controllers from text to yaml

Summary of changes:

Note:
- The changes are made on top of v6.15. 

v2 -> v3:

[PATCH 1/4] dt-bindings: mtd: microchip-nand: convert txt to yaml
- Remove pmecc nodes in example as it has a seperate binding

[PATCH 2/4] dt-bindings: mtd: microchip-nand: add atmel pmecc
- Dropped '|' from description
- Merged the fallback compatibles
- Dropped 'base address and size of' from description
- Dropeed clock source description
- Modifed if/then condition. the clock source is only required for sam9x7
 
[PATCH 3/4] dt-bindings: mtd: atmel-nand: add legacy nand
- Dropped '|' from description
- Fix address-cells and size-cells ranges
- Define each gpio entry. RB, CE and CD
- Move vendor specific properties to last.
- Fix node names in examples.

[PATCH 4/4] MAINTAINERS: add entry for microchip nand controller
- New patch updating myself as maintainer.

v1 -> v2:

https://lore.kernel.org/all/20250311122847.90081-1-balamanikandan.gunasundar@microchip.com/

[PATCH 1/3] dt-bindings: mtd: microchip-nand: convert txt to yaml
- Change the filename to match the compatible string
- Drop items and oneOf in the compatible property as it is just an enum
- Remove the if in the #address-cells and #size-cells
- Remove the unwanted comments that refers to .txt files
- Fix reg property description
- Define the properties in a list and add constraints
- Fix DT coding style and droped unused labels

[PATCH 2/3] dt-bindings: mtd: microchip-nand: add atmel pmecc
- Rename filename to match compatible string
- Add constraints for sam9x7
- Droped unused dt labels 

[PATCH 3/3] dt-bindings: mtd: atmel-nand: add legacy nand
- Filename matching the compatibles
- Remove "bindings" from the subject
- Remove "deprecated" as these are the only bindings available for the devices
- Add missing constraints.
- Add default for nand-ecc-mode
- Add 32 in pmecc-cap for sama5d2
- Add default for sector-size, pmecc-lookup-table-offset, nand-bus-width

Balamanikandan Gunasundar (4):
  dt-bindings: mtd: microchip-nand: convert txt to yaml
  dt-bindings: mtd: microchip-nand: add atmel pmecc
  dt-bindings: mtd: atmel-nand: add legacy nand controllers
  MAINTAINERS: add entry for microchip nand controller

 .../devicetree/bindings/mtd/atmel-nand.txt    | 227 ------------------
 .../devicetree/bindings/mtd/atmel-nand.yaml   | 167 +++++++++++++
 .../mtd/microchip,nand-controller.yaml        | 169 +++++++++++++
 .../bindings/mtd/microchip,pmecc.yaml         |  62 +++++
 MAINTAINERS                                   |   5 +-
 5 files changed, 401 insertions(+), 229 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/atmel-nand.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/atmel-nand.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/microchip,nand-controller.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/microchip,pmecc.yaml

-- 
2.34.1

