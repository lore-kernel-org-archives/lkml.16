Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9845A1FF7B5;
	Mon,  7 Apr 2025 15:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040097; cv=none; b=ZC3x/3mThR4pZcOat0HCsHGW5mrDjQsQCpDYjF02oVZ1Ji2MMlXYEHoVdvtjEk5hsEs9NXiqJIBMfFCRu/v3Vb2AS9f47dXODxtzj9KJMubtCgUgCCoAyrUP/LJTWdbMF8LRuvZmY+VN0wO6LzTjMifTzy1aI6JaLBb7oW6VaY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040097; c=relaxed/simple;
	bh=yz2gwwXZp8QwPMQsFpWcLfMGnpdMV1SmNYXV+W0y0PQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=AlXvvhRWg/2EPldHEqQmQCMl4xUeNuhA2zVBq867n/DAfEUjH4b8WyL9jPQdf+jhTKlUD1tQs3xTv8xZreVA/6BDC1mqqNo0dL5sLpziT4Ib4Y64mFkMXLP0HLMDaQACTYQvilLKf89+2qXr56afdK8lNnmWvEDNRrETdNJxIvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ad4OZuzT; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ad4OZuzT"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537FYfgc408834
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 10:34:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744040081;
	bh=RbRVJgB2du8ydGrHNeqxiskz3OR4/cSTNp5c0THLTGc=;
	h=From:Subject:Date:To:CC;
	b=ad4OZuzTQbR7oa5jv2Mr4p5+GNh4KULRcSEoMX/KpfPmvWmCw1PjziQ1tDIAXGb/j
	 ivM6Ul/+XcXMHmuB7jzyNiqkDWL+jagIUOFVOkjt4LqIIezAsL6yLF9aiaa8iXqwr0
	 ft22Pq42U0YROUTLU7ZG+aGsqk1K2LkIcYApsRxw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537FYfM3024411
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 10:34:41 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 10:34:40 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 10:34:40 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537FYeOf090531;
	Mon, 7 Apr 2025 10:34:40 -0500
From: Bryan Brattlof <bb@ti.com>
Subject: [PATCH v4 0/3] arm64: dts: ti: introduce basic support for the
 AM62L
Date: Mon, 7 Apr 2025 10:34:37 -0500
Message-ID: <20250407-am62lx-v4-0-ce97749b9eae@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAI3w82cC/02MwQqDMBAFf0Vybkqymibpqf9Regi6qQtVSyLBI
 v57E6HS4zzezMoiBsLIrtXKAiaKNI0ZmlPF2t6NT+TUZWYgoJEAgrvhAq+Ft8421qDvjEaWz++
 AnpY9dH9k7inOU/js3QRlLQklpDC/RAIuuDISjHK17oy/zXRup4EVP9X/jj2cOjvopZaojVWgD
 2fbti/CBEoczQAAAA==
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bryan Brattlof <bb@ti.com>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3817; i=bb@ti.com;
 h=from:subject:message-id; bh=yz2gwwXZp8QwPMQsFpWcLfMGnpdMV1SmNYXV+W0y0PQ=;
 b=owNCWmg5MUFZJlNZjGVlSgAAYf///3990nf6fb/zxnN73/u6/+lz6o97P3/38W+Z+/vP/t+wA
 RsxpDJ6hoANAADQANABoAGgA0AAGRkADQAB6g9QaDTQyNNGmmQ008oyep5RptJkQNNNDRkaaANA
 AGjTQaMnqeoAaGjJoGjIaDQMjajQaDQDIA000GmnpBk00A0AYRoDFDRoDTQNDQDQA0xA00aGgNG
 gAA0xDTIyYjQMjTIDQDTEAAAAxDQBoxkECMF5CqnoTSIXYWaFdcAQSjhObSlfF7GCwLBz5efqBU
 5DD+Vjg/QlNW3kU8weGbd0VowtrKF2BJVwBxHwxVcGhnbzjLNNpBVdBSWYenxyXNSTfzgWi4VAC
 v7cPSPKpdiUSz2/nGBCJfmJw+ZM/Z5KUr3LUFWCGEjZ3XklGrcxFA4ubWXelkWKpHGuj+oEASCl
 CyIz7Bc/QcOkKS94t1RQAyqflVBjDn0Rc84qwDY5N3v2HWhdJ+GjJpVg1dZhrH1Sx97FJiBApky
 Np/s0srgiEay7MYxLUSthESYYXVlBqELn6eYM59KUuOGZIz126vOFT96aPfL4gCcGrfZWDsCEIT
 W9SckMaKbBJAxGHrvzLFZLiG7+/HsKNlAT4X1uVjSUaBwjlERWF4NQlZsBGYb/7YBqEvdyvAYmF
 4YMqlzpA6zNs0Yi/Z/xdyRThQkIxlZUoA==
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
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

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Bryan Brattlof (1):
      dt-bindings: arm: ti: Add binding for AM62L SoCs

Vignesh Raghavendra (2):
      arm64: dts: ti: k3-am62l: add initial infrastructure
      arm64: dts: ti: k3-am62l: add initial reference board file

 Documentation/devicetree/bindings/arm/ti/k3.yaml |   6 +
 arch/arm64/boot/dts/ti/Makefile                  |   3 +
 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi        | 672 +++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62l-thermal.dtsi     |  19 +
 arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi      | 144 +++++
 arch/arm64/boot/dts/ti/k3-am62l.dtsi             | 121 ++++
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts         | 294 ++++++++++
 arch/arm64/boot/dts/ti/k3-am62l3.dtsi            |  67 +++
 arch/arm64/boot/dts/ti/k3-pinctrl.h              |   2 +
 9 files changed, 1328 insertions(+)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20241220-am62lx-ca9498efd87e

Best regards,
-- 
Bryan Brattlof <bb@ti.com>

