Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B842750E4;
	Wed, 11 Jun 2025 11:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749642245; cv=none; b=P/lRSEhm3YnG2zbfKB5YrOaBjhZLcM+qw1R7COFqCPUiGvT29xWayHTVjy4XGwxy1Cje4b3B34jxERcqmr3/ssTwjlFF7Xj030R/oYf0iT3nIRDuekTr9uLf7DmKafii79+bKsMI+Al/dtFewub6IqUzCZlwL7EJcePK8NjuvAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749642245; c=relaxed/simple;
	bh=Ujjq7fVMJJEqsfB9LKib1s8AugcOz1tF5lMotjn5bPo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VL72GaK007Ft/OUD2zAGZL6DHiFjthUZbq+Aww/pn0RPTxFT2kaYx4q+2ODxPZoVqVksa76pTgSMGqr69d+8buxHXNroZyNCfQ3RlPxqAwNtxliy9bly8UMRfhpX+mECFNK0NTL0jx2OvQBTJaRa/uY9/bXjcvHLeTvyNL51Y84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qqQXeRV7; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qqQXeRV7"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55BBhwGm2576491;
	Wed, 11 Jun 2025 06:43:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749642238;
	bh=5P1928OJ/hfBXkHA8GPkkj34f9sTZpGnS8JHTo3Dnsw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qqQXeRV7qyagLO4+6hagfTzEOqzHspM3vxWqCs46EWJsfazYKnJCfmRXyGfI/E8BF
	 pMWJsDsyN3f7q3Alg8RUXu09L4HtBtG00mTUU2igIql2lNg5nmMnGluZdSU6rT2XWT
	 nzNH0hKkSQbbeyEqIMweQtQG6x+Jiv6cNLciWAbs=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55BBhwYv1109018
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 11 Jun 2025 06:43:58 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 11
 Jun 2025 06:43:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 11 Jun 2025 06:43:57 -0500
Received: from uda0492258.dhcp.ti.com (dhcp-172-24-227-169.dhcp.ti.com [172.24.227.169])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55BBhavI270460;
	Wed, 11 Jun 2025 06:43:54 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v2 5/5] arm64: dts: ti: k3-j721s2: disable "mcu_cpsw" in SoC file and enable in board files
Date: Wed, 11 Jun 2025 17:13:36 +0530
Message-ID: <20250611114336.2392320-6-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250611114336.2392320-1-s-vadapalli@ti.com>
References: <20250611114336.2392320-1-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Following the existing convention of disabling nodes in the SoC file and
enabling only the required ones in the board file, disable "mcu_cpsw" node
in the SoC file "k3-j721s2-mcu-wakeup.dtsi" and enable it in the board
files:
a) k3-am68-sk-base-board.dts
b) k3-j721s2-common-proc-board.dts

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v1 of this patch was 2 different patches which have currently been
squashed:
 https://lore.kernel.org/r/20250529133443.1252293-13-s-vadapalli@ti.com/
 https://lore.kernel.org/r/20250529133443.1252293-14-s-vadapalli@ti.com/

In addition to squashing the patches and updating the commit message,
"mcu_cpsw" has been enabled in "k3-am68-sk-base-board.dts" as well,
since it uses the SoC file of J721S2.

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts       | 1 +
 arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts | 1 +
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi       | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
index 5fa70a874d7b..893b730911e8 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
@@ -619,6 +619,7 @@ &main_sdhci1 {
 };
 
 &mcu_cpsw {
+	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcu_cpsw_pins_default>, <&mcu_mdio_pins_default>;
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
index e2fc1288ed07..a482b3ad5095 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
@@ -409,6 +409,7 @@ &main_sdhci1 {
 };
 
 &mcu_cpsw {
+	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcu_cpsw_pins_default>, <&mcu_mdio_pins_default>;
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
index bc31266126d0..b5fd012d9564 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
@@ -552,6 +552,8 @@ mcu_cpsw: ethernet@46000000 {
 			    "tx4", "tx5", "tx6", "tx7",
 			    "rx";
 
+		status = "disabled";
+
 		ethernet-ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.34.1

