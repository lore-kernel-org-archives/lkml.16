Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE6A2F272E;
	Fri,  4 Jul 2025 10:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751623830; cv=none; b=QihNvLWTudmeL1CaThodHkyKx+UrfNuKrO3lQ7TeqDulyK+9k9JzCR9u3kHZAOgnNva095lkHtqQjYUGOEqZ/iomDuwg8asbF4q3DJ3NrKj4DTB9JVnNqJLkVCrXujsoXQQmzvU1qUgTDYW08ZjL4e6idPTx6ci86pBJNseeR7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751623830; c=relaxed/simple;
	bh=bJoKfALriuJO9Lf49jizcJsBXpk+qdh0vI2kCtIkqhk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bBrX1m1SD2iqFYubqyEt+UiNdAM7/41A64ddupAvlljmXW3pZRMy+q0XbXrC498q0idqbjOgDKoByIQrvdVAUVadbDhl6Nu2e/4uv+HQ9o0fMYumamRmtEgdInWx8k1RmU6J2rHyavJUCnnji1QLxWcehE+7HycvmpPIB966t44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=S/W+RI60; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="S/W+RI60"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 564AAF8E273754;
	Fri, 4 Jul 2025 05:10:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751623816;
	bh=uEnf8eeIm+WChWJl5MHAtmjlkU1sdVlbIqPrOppFbIw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=S/W+RI60Gxk/xW4lp84wLoXoLJMHtjyGqTM6d4H3rivK+gBZwaSE7CdKV0hzRCS3o
	 nTsW0Ks2qVvmfK88F88jhIsvELNRptU8HZ12mwgOYCwir4pe8wPiPYC2JNdzuDa2zK
	 ZslUAvqgDKb7/hbQNmb0F6qWR6O9lAxfWbszrzoc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 564AAFX12719275
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 4 Jul 2025 05:10:15 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 4
 Jul 2025 05:10:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 4 Jul 2025 05:10:15 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 564AAER42531939;
	Fri, 4 Jul 2025 05:10:15 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <devarsht@ti.com>, <s-vadapalli@ti.com>, <andrew@lunn.ch>
Subject: [PATCH v6 2/4] dt-bindings: arm: ti: Add AM62D2 SoC and Boards
Date: Fri, 4 Jul 2025 15:39:52 +0530
Message-ID: <20250704100954.2231853-3-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704100954.2231853-1-p-bhagat@ti.com>
References: <20250704100954.2231853-1-p-bhagat@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The AM62D2 SoC, part of the K3 architecture, is built for high-performance
DSP tasks in automotive audio, pro audio, radar, sonar, and medical
imaging. It features up to four Cortex-A53 cores (1.4GHz), two Cortex-R5F
cores, and a C7x DSP with 2 TOPS MMA. Key interfaces include multi-channel
McASP audio, TSN-capable Gigabit Ethernet, and a range of peripherals
(UART, SPI, I2C, CAN, USB, eMMC/SD, OSPI, CSI). It supports LPDDR4/DDR4,
secure boot with hardware security, and low-power modes with
CAN/GPIO/UART wakeup.

This SoC is of part K3 AM62x family, which includes the AM62A and AM62P
variants. A key distinction is that the AM62D does not include multimedia
components such as the video encoder/decoder, MJPEG encoder, Vision
Processing Accelerator (VPAC) for image signal processing, or the display
subsystem. Additionally, the AM62D has a different pin configuration
compared to the AM62A, which impacts embedded software development.

This adds dt bindings for TI's AM62D2 family of devices.

More details about the SoCs can be found in the Technical Reference Manual:
https://www.ti.com/lit/pdf/sprujd4

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index bf6003d8fb76..e80c653fa438 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -25,6 +25,12 @@ properties:
               - ti,am62a7-sk
           - const: ti,am62a7
 
+      - description: K3 AM62D2 SoC and Boards
+        items:
+          - enum:
+              - ti,am62d2-evm
+          - const: ti,am62d2
+
       - description: K3 AM62A7 SoC PHYTEC phyBOARD-Lyra
         items:
           - const: phytec,am62a7-phyboard-lyra-rdk
-- 
2.34.1

