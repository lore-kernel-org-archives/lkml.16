Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDEE1DE4DC;
	Thu,  8 May 2025 03:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746673771; cv=none; b=kR8tdQCuBblF987ewdBgQA5PdoejiFHkodT6Wwrc81CHHdbLQmtPQa2DfYYjxRVvIK2gzpYF8u22F7CuHLGksXZfcCq4a21iIh11MhPTcBqf554GAbMNdH2FUwGSGIHRyRBXAVNm/VAfd5B4x5dHUIZVnvOmHNrtSDcdylLuPh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746673771; c=relaxed/simple;
	bh=iFJEv0aCDpP3KrGQLBBni66RlLjMKeg2xPS6cbd5vfE=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=pYsfUm4xxDsLgQBMUYDFuPpZLs5cZ7f+uAnDiEIJjNHXjowAP62pXPGdpsXGioZ/5Mqe376BkMRbAe1Q5wyjXptAiBr0CBFrXUmFVaSlFS0zQPHHqqrUMqShEz82M1P1jYphsKOwxmPa1gCabg2crqwUYLxjaOrSUiUT8BTYfKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MimeWdoA; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MimeWdoA"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54839KSx1716632
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 May 2025 22:09:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746673760;
	bh=+/FHwb425XGG7MVdKCdw8EDa+F9cw7AXYEpkXodaQVY=;
	h=From:Subject:Date:To:CC;
	b=MimeWdoA2L77NLJzc8b3GmWhuB/lcAajMIa9DT2NDbWWeZJOsN2f1mz8lKQISMw81
	 o2i+XsCdEqoMC3ftWaL2SAUy2SOoG9p5WCg41dbdqoJaYQ8e0JU2A4hvsMpzjA7jmK
	 GSdTvY3FsuvjOor+h4yv2Lfs4KRNRMsCwZvprriE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54839Ko6102453
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 May 2025 22:09:20 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 May 2025 22:09:19 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 May 2025 22:09:19 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54839JKZ066227;
	Wed, 7 May 2025 22:09:19 -0500
From: Bryan Brattlof <bb@ti.com>
Subject: [PATCH v5 0/3] arm64: dts: ti: introduce basic support for the
 AM62L
Date: Wed, 7 May 2025 22:09:18 -0500
Message-ID: <20250507-am62lx-v5-0-4b57ea878e62@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAF4gHGgC/1XMQQ7CIBCF4asY1mJgCgKuvIdxgXSwJLY10JCap
 neXNrHq8k3m+yeSMAZM5LSbSMQcUui7MuR+R1xjuzvSUJdNgIHgAIza9giPkTprhNHoa62QlOd
 nRB/GNXS5lt2ENPTxtXYzLNclIRln+pPIQBmVmoOWtlK19uchHFzfksXn6teYzVTFoOeKo9JGg
 voz4msEU5sRxTg0SglzM2hxM/M8vwFuZuztAQEAAA==
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.13.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Everyone,

This small series adds the initial support (currently just a UART) for 
TI's AM62L SoC family.

The AM62L is a lite, low power and performance optimized family of 
application processors that are built for Linux application development. 
AM62L is well suited for a wide range of general-purpose applications 
with scalable ARM Cortex-A53 core performance and embedded features such 
as: Multimedia DSI/DPI support, integrated ADC on chip, advanced lower 
power management modes, and extensive security options for IP protection 
with the built-in security features.

Additionally, the AM62Lx devices includes an extensive set of 
peripherals that make it a well-suited for a broad range of industrial 
applications while offering intelligent features and optimized power 
architecture as well. In addition, the extensive set of peripherals 
included in AM62Lx enables system-level connectivity, such as: USB, 
MMC/SD, OSPI, CAN-FD and an ADC.
 
AM62L is a general purpose processor, however some of the applications 
well suited for it include: Human Machine Interfaces (HMI), Medical 
patient monitoring , Building automation, Smart secure gateways, Smart 
Thermostats, EV charging stations, Smart Metering, Solar energy and 
more.
 
Some highlights of AM62L SoC are:
 - Single to Dual 64-bit Arm® Cortex®-A53 microprocessor subsystem up to 
   1.25GHz Integrated Giga-bit Ethernet switch supporting up to a total 
   of two external
 - 16-bit DDR Subsystem that supports LPDDR4, DDR4 memory types.
 - Display support: 1x display support over MIPI DSI (4 lanes DPHY) or 
   DPI (24-bit RGB LVCMOS)
 - Multiple low power modes support, ex: Deep sleep and Standby
 - Support for secure boot, Trusted Execution Environment (TEE) & 
   Cryptographic Acceleration

For more information check out our Technical Reference Manual (TRM) 
which is located here:

	https://www.ti.com/lit/pdf/sprujb4

Happy Hacking
~Bryan

Changes in v1:
 - switched to non-direct links so TRM updates are automatic
 - fixed indentation issues with a few nodes
 - separated bindings into a different patch
 - removed current-speed property from main_uart0{}
 - removed empty reserved-memory{} node
 - removed serial2 from aliases{} node
 - corrected the main_uart0{} pinmux
 - Link: https://lore.kernel.org/all/20241117-am62lx-v1-0-4e71e42d781d@ti.com/

Changes in v2:
- alphabetized phandles
- corrected macro and node names for main_uart0 pinmux
- Link to v2: https://lore.kernel.org/r/20250108-am62lx-v2-0-581285a37d8f@ti.com

Changes in v3:
- added more nodes which have been validated
- added link to data sheet which is now public
- Link to v3: https://lore.kernel.org/r/20250109-am62lx-v3-0-ef171e789527@ti.com

Changes in v4:
- corrected copyright date
- used the ranges property for the fss{} node
- converted control MMR's space into a syscon{} node
- Link to v4: https://lore.kernel.org/r/20250407-am62lx-v4-0-ce97749b9eae@ti.com

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Bryan Brattlof (1):
      dt-bindings: arm: ti: Add binding for AM62L SoCs

Vignesh Raghavendra (2):
      arm64: dts: ti: k3-am62l: add initial infrastructure
      arm64: dts: ti: k3-am62l: add initial reference board file

 Documentation/devicetree/bindings/arm/ti/k3.yaml |   6 +
 arch/arm64/boot/dts/ti/Makefile                  |   3 +
 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi        | 673 +++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62l-thermal.dtsi     |  25 +
 arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi      | 133 +++++
 arch/arm64/boot/dts/ti/k3-am62l.dtsi             | 121 ++++
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts         | 294 ++++++++++
 arch/arm64/boot/dts/ti/k3-am62l3.dtsi            |  67 +++
 arch/arm64/boot/dts/ti/k3-pinctrl.h              |   2 +
 9 files changed, 1324 insertions(+)
---
base-commit: ed6f779e213070572e53e9801e4a6e510d7bc208
change-id: 20241220-am62lx-ca9498efd87e

Best regards,
-- 
Bryan Brattlof <bb@ti.com>

