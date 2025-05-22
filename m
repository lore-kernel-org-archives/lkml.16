Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEA53234;
	Thu, 22 May 2025 07:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747899289; cv=none; b=aS5rgwAGIkT5HpGLTq+7b2OSPy5wBZXbgaT4T0a1f4RuIceUnMRJQoGuR7/HKmDhw3NctebB7No93xZbqGodT0yQOLOcX0kyZnmTxD+lTb0JZg5hMXMvuhog6bgSc8dN8dkE34e4s+c18XGOweOCQJCMk5OxKDwvOLboKratPUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747899289; c=relaxed/simple;
	bh=tmXSjXeY3Rsp4TFJtH8ucpXsQ2FpoX0la7ZMecvwW+E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TTMVgUACNUmJlORs/ZY6u2F/hW3h/gAATzaL/AGO7u3RN6PV5vVi/B0unVfGmGoMSda30yFIOYlZb/H2oZPC/caZqTlhDyEk3/QahsaxHFIOY4b5s+WLcin6nGMyEb9V4TpEvyPrTcm89YbLDWQV1DJIQeRpExZzlQvY6m5eOBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=apYiFh4R; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="apYiFh4R"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54M7Ye0E530792;
	Thu, 22 May 2025 02:34:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747899280;
	bh=F6MDUPj39cYfdScK6l2pJt36hKiuoFRjVjXtKbkUBx8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=apYiFh4Rw52KZRBS0DE5xP3F9v6lrEX0KScl3fMBSnVtwgvfOjJ6xpoxvHjlUELaJ
	 4o2VCDUbY0ZozOWforGdAUX5fF2Z7wYFhOmX0ZNHqLFE+Ap1LPIk5RkvbNcAYL8tdj
	 N+Hcj9M5e0f4+45ke6ghPaJcjyXZiU6kwHFQt1H0=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54M7Yec33319980
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 22 May 2025 02:34:40 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 May 2025 02:34:40 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 May 2025 02:34:40 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54M7YQ4o475080;
	Thu, 22 May 2025 02:34:36 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/2] arm64: dts: ti: k3: Switch MCU R5F cluster to Split-mode
Date: Thu, 22 May 2025 13:04:26 +0530
Message-ID: <20250522073426.329344-3-b-padhi@ti.com>
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

Several TI K3 SoCs like J7200, J721E, J721S2, J784S4 and J742S2 have a
R5F cluster in the MCU domain which is configured for LockStep mode at
the moment. Switch this R5F cluster to Split mode by default in all
corresponding board level DTs to maximize the number of R5F cores.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi              | 4 ++++
 arch/arm64/boot/dts/ti/k3-am69-sk.dts                   | 4 ++++
 arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi             | 4 ++++
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts                  | 4 ++++
 arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi             | 4 ++++
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi            | 4 ++++
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 4 ++++
 7 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi b/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
index 4ca2d4e2fb9b..fe3dc035c067 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
@@ -303,6 +303,10 @@ &mcu_r5fss0_core1 {
 			<&mcu_r5fss0_core1_memory_region>;
 };
 
+&mcu_r5fss0 {
+	ti,cluster-mode = <0>;
+};
+
 &main_r5fss0 {
 	ti,cluster-mode = <0>;
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
index f28375629739..57404882cc89 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
@@ -992,6 +992,10 @@ &mcu_r5fss0_core1 {
 			<&mcu_r5fss0_core1_memory_region>;
 };
 
+&mcu_r5fss0 {
+	ti,cluster-mode = <0>;
+};
+
 &main_r5fss0 {
 	ti,cluster-mode = <0>;
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
index 291ab9bb414d..7c3899d608b8 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
@@ -266,6 +266,10 @@ &mcu_r5fss0_core1 {
 			<&mcu_r5fss0_core1_memory_region>;
 };
 
+&mcu_r5fss0 {
+	ti,cluster-mode = <0>;
+};
+
 &main_r5fss0 {
 	ti,cluster-mode = <0>;
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
index ffef3d1cfd55..2b26471a9181 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
@@ -1361,6 +1361,10 @@ &mcu_r5fss0_core1 {
 			<&mcu_r5fss0_core1_memory_region>;
 };
 
+&mcu_r5fss0 {
+	ti,cluster-mode = <0>;
+};
+
 &main_r5fss0 {
 	ti,cluster-mode = <0>;
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
index 0722f6361cc8..72fd5d39e145 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
@@ -566,6 +566,10 @@ &mcu_r5fss0_core1 {
 			<&mcu_r5fss0_core1_memory_region>;
 };
 
+&mcu_r5fss0 {
+	ti,cluster-mode = <0>;
+};
+
 &main_r5fss0 {
 	ti,cluster-mode = <0>;
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
index 54fc5c4f8c3f..2d420041c0e5 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
@@ -560,6 +560,10 @@ &mcu_r5fss0_core1 {
 			<&mcu_r5fss0_core1_memory_region>;
 };
 
+&mcu_r5fss0 {
+	ti,cluster-mode = <0>;
+};
+
 &main_r5fss0 {
 	ti,cluster-mode = <0>;
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
index fa656b7b13a1..0d45ca9d92e2 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
@@ -1122,6 +1122,10 @@ &mcu_r5fss0_core1 {
 			<&mcu_r5fss0_core1_memory_region>;
 };
 
+&mcu_r5fss0 {
+	ti,cluster-mode = <0>;
+};
+
 &main_r5fss0 {
 	ti,cluster-mode = <0>;
 };
-- 
2.34.1

