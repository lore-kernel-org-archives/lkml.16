Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7FE266594;
	Tue,  8 Apr 2025 09:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104701; cv=none; b=G29lVWaLv7ev+CTv7TNQIJ7MofyNy0yedZCFiNWPJIwD3+fLihC1R9hO3qb9Vi1fbeHesvXzsmrwhfMjL3Vt64zaQszWHtpO8EgFcKtnaGub1I/dgMc6oq6eD7Kcwe7GI9ph0/qDh4rjE5VEFDzdMkUcPWSb0oEnz1t2UAt7Faw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104701; c=relaxed/simple;
	bh=PwheQ7XWr2HfBpe7Fbk4XD7Oa+SPx2X9kPrumZppBkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tZ2qwoY4IPZ6zwVi4QOqLYv1ca0RK01URQaJP3LNghrudtPGBZ7xycNZZ/4OdVZHaVPQjENtjC5eGs5JfwIE249JJ25e9dCpheYrYFR18VTleKok2FMCh16py36hx+8vAjgT7PlWG2lSg2jHE20WnFK+LGAW2JyQW1M7lGy8Yeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=NUVd4iHL; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=t68yO3LK reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="NUVd4iHL";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="t68yO3LK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744104699; x=1775640699;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QVNXOS2LxVQSHIpbDIVfnXE7eeQe+su9AU3LUdFEW9U=;
  b=NUVd4iHLf7DDX/eUPVNZD9rOecY1XR5dqZHpk9+NNFIzgbxOnFG6gNLa
   TLLKLv37F6XZUyxHrs3IV4O9oiMfVq2kMzVdcL0htfHAQCw+M/AjG/yYO
   Usl8YlfXdFSIXbq6JByWO8n74va/OJfhSsVorABcZQVmckt+3KtM1aa2c
   eSLyhXfx98dLp1KxGt/s/83lJ5NUJ+zNGem9i4bV0delrUa6uRP2QKxN8
   gpJ8EoyJt3+F3cFqkQXaZwwedWOXfB6V/Lfiv/wW/LGkKfUuq1YYDTYKe
   eeAlAVbVSVSWSFYjcVlW/V7xhztub1UKLol74nTSB2zIwrAt5Uq38wEeJ
   A==;
X-CSE-ConnectionGUID: Fer817JuQEqiAbn7FiTHKg==
X-CSE-MsgGUID: 5cq2tzgmRViDP83LL+9mVg==
X-IronPort-AV: E=Sophos;i="6.15,197,1739833200"; 
   d="scan'208";a="43397375"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Apr 2025 11:31:37 +0200
X-CheckPoint: {67F4ECF9-2A-2417938-F0170C2B}
X-MAIL-CPID: 0D72C79C590BE6ED7C163F3117526E61_2
X-Control-Analysis: str=0001.0A006371.67F4ECF6.006A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 25A2A169635;
	Tue,  8 Apr 2025 11:31:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744104693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QVNXOS2LxVQSHIpbDIVfnXE7eeQe+su9AU3LUdFEW9U=;
	b=t68yO3LK17uQFVgtIS6VKO+YAtnSNsSsuwGom0tnJE3ho3m45+YjapyHaJqXUImaNGemvS
	hj8nLsDu65/AS9d8QwgVRxRGPCQLwf/p1HSR03klka4Z3wsFioTnFeCHu7IGrVCk/E43LY
	SX+NCJwnxS/Bw+ZL65WWCMHYuKJfAwVm8PEO+JtL3grLQ2Hj6N5WwAryzI9lLJMn53BwhX
	3lM70Gxs494XoUzZyW2G3ZP4K/V91VhlB1pZBiQdx1nZweJu1hh2tt8DmHPZ2HQef7BA3P
	w23Z3/Rdn+LAkaabzOsbAqXpP233aDsQIs3bQnqOBNrX4Xgsoc+2MGOXOKpoyQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 4/7] ARM: dts: ls1021a-tqmals1021a: Add LVDS overlay for Tianma TM070JVGH33
Date: Tue,  8 Apr 2025 11:30:51 +0200
Message-ID: <20250408093059.551700-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408093059.551700-1-alexander.stein@ew.tq-group.com>
References: <20250408093059.551700-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This adds an overlay for the supported LVDS display tianma tm070jvhg33.
The on-board RGB-to-LVDS encoder and DCU graphics chain are configured
accordingly. Add power supply as well, which had been missing all the time.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/ls/Makefile             |  2 +
 ...tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso | 47 +++++++++++++++++++
 .../nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts   |  1 +
 3 files changed, 50 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso

diff --git a/arch/arm/boot/dts/nxp/ls/Makefile b/arch/arm/boot/dts/nxp/ls/Makefile
index 225a7665b8ad1..7f96de6f80224 100644
--- a/arch/arm/boot/dts/nxp/ls/Makefile
+++ b/arch/arm/boot/dts/nxp/ls/Makefile
@@ -8,4 +8,6 @@ dtb-$(CONFIG_SOC_LS1021A) += \
 	ls1021a-twr.dtb
 
 ls1021a-tqmls1021a-mbls1021a-hdmi-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-hdmi.dtbo
+ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtbo
 dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-hdmi.dtb
+dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb
diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
new file mode 100644
index 0000000000000..e9708f3c67403
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright 2013-2014 Freescale Semiconductor, Inc.
+ * Copyright 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+/dts-v1/;
+/plugin/;
+
+&backlight_dcu {
+	status = "okay";
+};
+
+&dcu {
+	status = "okay";
+
+	port {
+		dcu_out: endpoint {
+			remote-endpoint = <&lvds_encoder_in>;
+		};
+	};
+};
+
+&display {
+	compatible = "tianma,tm070jvhg33";
+	status = "okay";
+};
+
+&lvds_encoder {
+	status = "okay";
+};
+
+&lvds_encoder_in {
+	remote-endpoint = <&dcu_out>;
+};
+
+&lvds_encoder_out {
+	remote-endpoint = <&panel_in>;
+};
+
+&panel_in {
+	remote-endpoint = <&lvds_encoder_out>;
+};
diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
index 27a55fa638128..80dae0c09542d 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
@@ -147,6 +147,7 @@ hdmi_in: endpoint {
 	display: panel {
 		backlight = <&backlight_dcu>;
 		enable-gpios = <&pca9554_1 3 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_3p3v>;
 		status = "disabled";
 
 		port {
-- 
2.43.0

