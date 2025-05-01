Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14DB27510B;
	Thu,  1 May 2025 07:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746084604; cv=none; b=FSXTm89JxUKKTS7eeXgcDGgvznTfjSy82+6uXX9JmXJROteZiFbdo1ONybj7UaPdmePeUJ9+weFSgf3PejqJtU91mbNFtnt0Fy6igDSTutE50qJDO22MtlwPEtOXvi0GFR1v59ANWuwACWGwc56DapY0RdBr4HLQzoqOiC75wDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746084604; c=relaxed/simple;
	bh=qmJzK1KsFbjxFaviZGe+X3O14b1NctKbwqRyJwKzkzU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LA57Et3ivZDJzRBWTmiOcgvYviMrQnWyXqC8jpfDUxib1nr3UVi3kArUmpl8ui9SnGkwmIEVD5teoj/Oa1ZkYVDDdKdtqTqS1TSLMHy5VECjvjzHQ/HBnfMosVfz4RDvdghOzlerGeYyRHiWgcFcApUGeC2Cr/kJ8hUSdlmmZ54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wXc/nkaJ; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wXc/nkaJ"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5417TviN4160581
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 May 2025 02:29:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746084597;
	bh=Du7fmxFaT2Dho3YcT2SozYDlmnXc97lplTOiOtsjxW4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wXc/nkaJB+jSltMUiiT6YwAkhWrjXnRGMqAQG7WiY2e2BkdpWCVWMi1ixG5TR9qHE
	 SsRuNepqFoH/ChO90c1xVAgbH5iWM6Nxan26f4G5gH/i7GgsQdkxWIFkNBUxuzLkk7
	 i7njFak3BI+iCP3haFfzWvLwiXtZpPKUIXT3Blpk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5417TvLA119713
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 May 2025 02:29:57 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 May 2025 02:29:57 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 May 2025 02:29:56 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5417TuHa102658;
	Thu, 1 May 2025 02:29:56 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>
Subject: [PATCH 1/3] dt-bindings: arm: ti: Add bindings for AM62D2 SoC
Date: Thu, 1 May 2025 12:59:21 +0530
Message-ID: <20250501072923.1262414-2-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250501072923.1262414-1-p-bhagat@ti.com>
References: <20250501072923.1262414-1-p-bhagat@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The AM62D2 SoC belongs to the K3 Multicore SoC architecture with DSP core
targeted for applications needing high-performance Digital Signal
Processing. It is used in applications like automotive audio systems,
professional sound equipment, radar and radio for aerospace, sonar in
marine devices, and ultrasound in medical imaging. It also supports
precise signal analysis in test and measurement tools.

Some highlights of AM62D2 SoC are:

* Quad-Cortex-A53s (running up to 1.4GHz) in a single cluster.
  Dual/Single core variants are provided in the same package to allow
  HW compatible designs.
* One Device manager Cortex-R5F for system power and resource management,
  and one Cortex-R5F for Functional Safety or general-purpose usage.
* DSP with Matrix Multiplication Accelerator(MMA) (up to 2 TOPS) based on
  single core C7x.
* 3x Multichannel Audio Serial Ports (McASP) Up to 4/6/16 Serial Data Pins
  which can Transmit and Receive Clocks up to 50MHz, with multi-channel I2S
  and TDM Audio inputs and outputs.
* Integrated Giga-bit Ethernet switch supporting up to a total of two
  external ports with TSN capable to enable audio networking features such
  as, Ethernet Audio Video Bridging (eAVB) and Dante.
* 9xUARTs, 5xSPI, 6xI2C, 2xUSB2, 3xCAN-FD, 3x eMMC and SD, OSPI memory
  controller, 1x CSI-RX-4L for Camera, eCAP/eQEP, ePWM, among other
  peripherals.
* Dedicated Centralized Hardware Security Module with support for secure
  boot, debug security and crypto acceleration and trusted execution
  environment.
* One 32 bit DDR Subsystem that supports LPDDR4, DDR4 memory types.
* Low power mode support: Partial IO support for CAN/GPIO/UART wakeup.

This adds dt bindings for TI's AM62D2 family of devices.

More details about the SoCs can be found in the Technical Reference Manual:
https://www.ti.com/lit/pdf/sprujd4

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 18f155cd06c8..3183089dcfbf 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -31,6 +31,12 @@ properties:
           - const: phytec,am62a-phycore-som
           - const: ti,am62a7
 
+      - description: K3 AM62D2 SoC and Boards
+        items:
+          - enum:
+            - ti,am62d2-evm
+          - const: ti,am62d2
+
       - description: K3 AM62P5 SoC and Boards
         items:
           - enum:
-- 
2.34.1

