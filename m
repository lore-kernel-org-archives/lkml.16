Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAF726A0B3;
	Wed, 11 Jun 2025 11:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749642233; cv=none; b=qt8Z4HCpINXB6VPCjqrgjBISB6alNkoy2RmpS+B36vXF5HwwHbzrthkfDWK5Nc1K4LaCV4tb9iK8HUQ7F0lXH1xNuf6TxZZAvQraG324GHuEHoA1VEvR9a6NZfdipYrF6C4jpiOpqlv1s+UDa8uf4VbtK3DOEXIhZs3XFzsLPDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749642233; c=relaxed/simple;
	bh=MPR2cNqIzV4zNMkRkjqykLHeeN+/bXK5N6sydvZqJGA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tCbGWi7rqRXhZ5DkZ3JInWKETA+Tw22Jl5dk398WxJaQYuDN6QlXXdPOaOsyQn3onfl98V0MwsPlvtWC8q7y+xErqRaCn3p938Oe+ll/zh83gVNTFGjBpZ+L9cCztWmXlCo0avbt8Nse0K4fpOBYQFOzen+L8qZyt/iBX6+t3B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gCB3VUE2; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gCB3VUE2"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55BBhiH62587909;
	Wed, 11 Jun 2025 06:43:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749642224;
	bh=01SkIyYDrdKEhOlWGDqsXApkLwVFyXWIyMF6ULwGqHs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gCB3VUE2UDJk9t2yzhYHSaNuCmqUM6p8AAuZKAYpnIvZzSXLrBmFsFXEuDM4KFhq0
	 rtyoshPwL8nF+P2ddZuz+Ht+hyReJoLhYqeGcpYRaecnA752CWTXwLccNBI6t3l/vS
	 pKXtauIb4oihrom8uTCtXdBZbus1PUT1q+h4A1DE=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55BBhib11108922
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 11 Jun 2025 06:43:44 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 11
 Jun 2025 06:43:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 11 Jun 2025 06:43:44 -0500
Received: from uda0492258.dhcp.ti.com (dhcp-172-24-227-169.dhcp.ti.com [172.24.227.169])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55BBhavE270460;
	Wed, 11 Jun 2025 06:43:41 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v2 1/5] arm64: dts: ti: k3-am62: disable "cpsw3g" in SoC file and enable in board files
Date: Wed, 11 Jun 2025 17:13:32 +0530
Message-ID: <20250611114336.2392320-2-s-vadapalli@ti.com>
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
enabling only the required ones in the board file, disable "cpsw3g" node
in the SoC file "k3-am62-main.dtsi" and enable it in the board files:
a) k3-am62-lp-sk.dts
b) k3-am625-beagleplay.dts
c) k3-am525-sk.dts

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v1 of this patch was 4 different patches which have currently been
squashed:
 https://lore.kernel.org/r/20250529133443.1252293-2-s-vadapalli@ti.com/
 https://lore.kernel.org/r/20250529133443.1252293-3-s-vadapalli@ti.com/
 https://lore.kernel.org/r/20250529133443.1252293-4-s-vadapalli@ti.com/
 https://lore.kernel.org/r/20250529133443.1252293-5-s-vadapalli@ti.com/

Squashing the patches is the only change since the v1 series, in
addition to updating the commit message accordingly.

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts       | 4 ++++
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi       | 2 ++
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 1 +
 arch/arm64/boot/dts/ti/k3-am625-sk.dts         | 1 +
 4 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
index aafdb90c0eb7..cec77fba24e6 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
@@ -149,6 +149,10 @@ &sdhci1 {
 	vqmmc-supply = <&vddshv_sdio>;
 };
 
+&cpsw3g {
+	status = "okay";
+};
+
 &cpsw_port2 {
 	status = "disabled";
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index 9e0b6eee9ac7..3d8650e7c80b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -724,6 +724,8 @@ cpsw3g: ethernet@8000000 {
 		dma-names = "tx0", "tx1", "tx2", "tx3", "tx4", "tx5", "tx6",
 			    "tx7", "rx";
 
+		status = "disabled";
+
 		ethernet-ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index 72b09f9c69d8..999f5baaba1a 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -585,6 +585,7 @@ &usb1 {
 };
 
 &cpsw3g {
+	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&rgmii1_pins_default>, <&spe_pins_default>,
 		    <&gbe_pmx_obsclk>;
diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk.dts b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
index 2fbfa3719345..9c2258dfd08d 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
@@ -201,6 +201,7 @@ &sdhci1 {
 };
 
 &cpsw3g {
+	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_rgmii1_pins_default>, <&main_rgmii2_pins_default>;
 };
-- 
2.34.1

