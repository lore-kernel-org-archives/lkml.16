Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA76227591;
	Thu,  6 Feb 2025 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738838423; cv=none; b=qdLvSDJ5xI6PbhYS7crIy4Q4DteECvaGnNgQ3VecWtmMnxBdrdz0L9PQtvSMPjILgZcRlHxcJQHKKXwSjx2rOoCswMByx+lAVFcLYOEUWGcmmE2EkW+hAGL5QxiF79Bz2+UPp+t25ucfv2EZ2aE4Eod920t88QYVdoZX50Ysf/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738838423; c=relaxed/simple;
	bh=ZyICc/mqZ+XVKDTrqCzrM8zOi9VXfm+MUmIjVQg1srk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rIVQIe0P9/k2M61DLbIBv86WHA5iA6IMJZ84yXZLxdh5wqYSfD7lb8xxxF16edybhkBeeKyd6+JavN55yDkDu2JXJDb1I2ApA77+0HYpMFzNszuqNFQL2S7BqNOv8JJr0R32bzkXMAdLjioHGUTYE2uGOe/rQ1mVpZXB7nBqt3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pOnSxLcK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pOnSxLcK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738838419;
	bh=ZyICc/mqZ+XVKDTrqCzrM8zOi9VXfm+MUmIjVQg1srk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pOnSxLcKxU/pB/I/8a3thNQPK8aiR/syY3YJsVh/l/ibb24w+XmC8v7z2e/Qx1fhj
	 sDXnCaucpksNuQAjZvOT1CNIiiHQxRQ1hxiVBPIVEFFVwPv1j8beYVxfXAod+iyCmo
	 sbbicje6wB6sFxuMU7FEDlEWxLw6r0ZbrjZGrkLbyAOLx0H93+5uP/0d1bm/33qtvB
	 a3q4i2LKnAWwJmLbf1bFnfPuEqHqSqfaGOx12wUpLrOEPLseTKeo2eB3xeMqfmCZ8N
	 j3oxsAzureHkQuL/sCK0x+b3MXYyLUs3sm+zDSvTyrD/MnSi+p9e9RtePkz8rJ+HmZ
	 7DBq1HHsrTrlQ==
Received: from yukiji.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AB33E17E1090;
	Thu,  6 Feb 2025 11:40:18 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 06 Feb 2025 11:38:09 +0100
Subject: [PATCH v3 2/4] arm64: dts: mediatek: add support for MT8370 SoC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-dts_mt8370-genio-510-v3-2-5ca5c3257a4c@collabora.com>
References: <20250206-dts_mt8370-genio-510-v3-0-5ca5c3257a4c@collabora.com>
In-Reply-To: <20250206-dts_mt8370-genio-510-v3-0-5ca5c3257a4c@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738838416; l=4210;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=ZyICc/mqZ+XVKDTrqCzrM8zOi9VXfm+MUmIjVQg1srk=;
 b=7wwXJe+DI7Lif4ON4ocgNXgwqPuyGM2pT1YL9jg9NX+Pwq5Wnlsa0CLX7Vluc3pIFlbmwnwUJ
 zFsIH34ODWEAiOHlf4UmfKEU3SOvvF2WGA/JeVfrFrWZY9obzhhz/JJ
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

Add the support of the Mediatek MT8370 SoC, a less powerful variant of
MT8390 SoC.
Their main differences are:
- Arm Cortex-A55 cores number (4 vs 6)
- Arm Cortex-A78 core speed (2.0 GHz vs 2.2 Ghz)
- Arm Mali-G57 GPU core number (2 vs 3)

Like MT8390, MT8370 hardware register maps are identical to MT8188.

Note:
The devicetree for MT8370 SoC does not currently contain the needed
overrides to support the Mali GPU integrated into this SoC. This is
scheduled to be done with a later change.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi |  8 ++--
 arch/arm64/boot/dts/mediatek/mt8370.dtsi | 64 ++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 338120930b819645662465fa7b3c6be6491764ff..5d78f51c6183c15018986df2c76e6fdc1f9f43b4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -492,7 +492,7 @@ cpu_little0_crit: trip-crit {
 			};
 
 			cooling-maps {
-				map0 {
+				cpu_little0_cooling_map0: map0 {
 					trip = <&cpu_little0_alert0>;
 					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
@@ -530,7 +530,7 @@ cpu_little1_crit: trip-crit {
 			};
 
 			cooling-maps {
-				map0 {
+				cpu_little1_cooling_map0: map0 {
 					trip = <&cpu_little1_alert0>;
 					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
@@ -568,7 +568,7 @@ cpu_little2_crit: trip-crit {
 			};
 
 			cooling-maps {
-				map0 {
+				cpu_little2_cooling_map0: map0 {
 					trip = <&cpu_little2_alert0>;
 					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
@@ -606,7 +606,7 @@ cpu_little3_crit: trip-crit {
 			};
 
 			cooling-maps {
-				map0 {
+				cpu_little3_cooling_map0: map0 {
 					trip = <&cpu_little3_alert0>;
 					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
diff --git a/arch/arm64/boot/dts/mediatek/mt8370.dtsi b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..cf1a3759451ff899ce9e63e5a00f192fb483f6e5
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2025 Collabora Ltd.
+ * Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
+ */
+
+/dts-v1/;
+#include "mt8188.dtsi"
+
+/ {
+	compatible = "mediatek,mt8370";
+
+	cpus {
+		/delete-node/ cpu@400;
+		/delete-node/ cpu@500;
+
+		cpu-map {
+			cluster0 {
+				/delete-node/ core4;
+				/delete-node/ core5;
+			};
+		};
+	};
+};
+
+&cpu6 {
+	clock-frequency = <2200000000>;
+};
+
+&cpu7 {
+	clock-frequency = <2200000000>;
+};
+
+&cpu_little0_cooling_map0 {
+	cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+};
+
+&cpu_little1_cooling_map0 {
+	cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+};
+
+&cpu_little2_cooling_map0 {
+	cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+};
+
+&cpu_little3_cooling_map0 {
+	cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+};
+
+&ppi_cluster0 {
+	affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
+};

-- 
2.48.1

