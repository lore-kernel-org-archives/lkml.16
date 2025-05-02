Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4CB2580C0;
	Fri,  2 May 2025 15:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200391; cv=none; b=NVbSJyAUpAw07qhgQjsYGod/3UPVnW4HkWwljMe1V5rUJCigxKmoyAJSMWfB0n0wotilDSaHlpf0fqz9vQ1JpmB2sQcS5NCS5MQziOBlhMAXfUubYRugfrM2fVSg1gqflAHWg2R5PC2QRNRqGVmcdhB8IxlkPrGv5ETTa5sfl3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200391; c=relaxed/simple;
	bh=evUrA98cZZZSXu4RU3Z6upaO1iGAMvutau8Qm4W8bxE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=udPQ+uUnswBpUu6Juyr3SDugYcE0Og/mdwSE4tofxlLChdAVM7mlho+GJlNPm6VWPim1HeTDYgvkdUtZSXI+CVnfObhNTgCsZfTxHCzTNJirhIdYrLkmBod5GCUpy1VYlTPBsUU5qrfYpUfdZ6cbixgIvu+B8iXPT8VqgeDq6fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JAfg3+jG; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JAfg3+jG"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542FdgaB3896448
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 10:39:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746200382;
	bh=YhCY1iDUbu37jepiOAA6VwvvexBYQDCMMdCEXW+5rfo=;
	h=From:To:CC:Subject:Date;
	b=JAfg3+jGT8+L+rPMs8b/kmA6NKjymDKkB18z9Hwb6i9ekfke82CHqyFH5DnrwtbwC
	 5BqWTEomMCiy1lra1s42rt/6XevTcDrfnEbcZF/uT6b0RmFcN6S/t6o5MUymdZCC2P
	 S5jeT0KOniK9dM89caNNrk9RqAe/kDlU08AmO2wk=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542Fdg8i042337
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 10:39:42 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 10:39:42 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 10:39:42 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542FdfOB102775;
	Fri, 2 May 2025 10:39:42 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>
Subject: [PATCH v2 0/3] Add support for AM62D2 SoC and EVM
Date: Fri, 2 May 2025 21:09:12 +0530
Message-ID: <20250502153915.734932-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This patch series adds support for the AM62D SoC and its evaluation
module (EVM) board. The AM62D SoC is a high-performance Digital
Signal Processing (DSP) device with a quad-core Cortex-A53 cluster,
dual Cortex-R5F cores, and a Cx7 DSP core with Matrix Multiplication
Accelerator (MMA). It features a range of peripherals, including
multichannel audio serial ports, Ethernet, UARTs, SPI, I2C, USB, and
more.

The EVM board is a low-cost, expandable platform designed for the AM62D2
SoC, having 4GB LPDDR4 RAM, Gigabit Ethernet expansion connectors, audio
jacks, USB ports, and more.

This patch series includes updates to the device tree source (DTS) files,
device tree bindings, and pin control header files to support the AM62D SoC
and EVM board.

Bootlog-
https://gist.github.com/paresh-bhagat12/1757cc54a39f1baf883341af2a383db6
Tech Ref Manual-https://www.ti.com/lit/pdf/sprujd4
Schematics Link-https://www.ti.com/lit/zip/sprcal5

Note: This patch series should be applied after the below series 
has been merged.
https://lore.kernel.org/all/20250415153147.1844076-1-jm@ti.com/

Change Log:
V1 -> V2: Fixed indentation and build errors.

Paresh Bhagat (3):
  dt-bindings: arm: ti: Add bindings for AM62D2 SoC
  arm64: dts: ti: Add pinctrl entries for AM62D2 family of SoCs
  arm64: dts: ti: Add support for AM62D2-EVM

 .../devicetree/bindings/arm/ti/k3.yaml        |   6 +
 arch/arm64/boot/dts/ti/Makefile               |   3 +
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts      | 445 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-pinctrl.h           |   3 +
 4 files changed, 457 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts

-- 
2.34.1

