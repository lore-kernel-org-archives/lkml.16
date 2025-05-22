Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D69223321;
	Thu, 22 May 2025 07:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747899298; cv=none; b=VBu/oeTDidWP50kUdj4ar7iFA6b2F608nq4+h5UZZ5Zi3Ig60SlMaWsmkQ8RpDXoB1rU1kFvc8hUjETqnJ3Y2OB0l1oD3+5rOc+SWPkj5kHIKHpp9afw2HYEkTgSCVPPnfNxbkhOG7/9BdnX9cdjG5MHOT+z7pPn+8e/IyXXfTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747899298; c=relaxed/simple;
	bh=qSJHHc8k5MfpKchCcNenRwbGYpCg2PCgp1X9efr60IA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U1Yj+pPVjCuTyOivd+IUnEFQsnrBJw9WhkqS3QclJD71NIYW5slpTG5Px+mT0xbxX6851fLANIrFth6J+p3alyDOPRMfrhtdCt38JXnr0B4zg43d/vZbcrmVd7OlEakstBi7Mmd49vXqTxNP371KmYFwJ6Y6cFHmmX9tMpUZLus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=i+ZMt4Zy; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="i+ZMt4Zy"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54M7YaA1578086;
	Thu, 22 May 2025 02:34:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747899276;
	bh=TFyX924fU1OUnTJNM9k4dpsAiJ/BmLU4EV8L8EYmGN0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=i+ZMt4ZyOJSERcc+4hrX1KOs+GCM9MH4fA/2Ybir/7w7MdLPNXOHvhb0WRu1hgbEx
	 XQLpFdG1COOaKABDzvXaxmLopJEdNmGUXEmTTKvgw/Z6bw1AmHEYofOZJdMUHb+U8V
	 qNccdrErhKWyZByhVxsAzsk8fsvsU5Y4S5tXgu2w=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54M7Ya872794440
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 22 May 2025 02:34:36 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 May 2025 02:34:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 May 2025 02:34:36 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54M7YQ4n475080;
	Thu, 22 May 2025 02:34:32 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 1/2] arm64: dts: ti: k3-j742s2-mcu-wakeup: Override firmware-name for MCU R5F cores
Date: Thu, 22 May 2025 13:04:25 +0530
Message-ID: <20250522073426.329344-2-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522073426.329344-1-b-padhi@ti.com>
References: <20250522073426.329344-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The J742S2 SoC reuses the common k3-j784s4-j742s2-mcu-wakeup-common.dtsi
for its MCU domain, but it does not override the firmware-name property
for its R5F cores. This causes the wrong firmware binaries to be
referenced.

Introduce a new k3-j742s2-mcu-wakeup.dtsi file to override the
firmware-name property with correct names for J742s2.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 .../arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j742s2.dtsi           |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi

diff --git a/arch/arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi
new file mode 100644
index 000000000000..61db2348d6a4
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Device Tree Source for J742S2 SoC Family
+ *
+ * TRM: https://www.ti.com/lit/pdf/spruje3
+ *
+ * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ */
+
+&mcu_r5fss0_core0 {
+	firmware-name = "j742s2-mcu-r5f0_0-fw";
+};
+
+&mcu_r5fss0_core1 {
+	firmware-name = "j742s2-mcu-r5f0_1-fw";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-j742s2.dtsi b/arch/arm64/boot/dts/ti/k3-j742s2.dtsi
index 7a72f82f56d6..d265df1abade 100644
--- a/arch/arm64/boot/dts/ti/k3-j742s2.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j742s2.dtsi
@@ -96,3 +96,4 @@ cpu3: cpu@3 {
 };
 
 #include "k3-j742s2-main.dtsi"
+#include "k3-j742s2-mcu-wakeup.dtsi"
-- 
2.34.1

