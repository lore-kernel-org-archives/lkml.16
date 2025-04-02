Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760CA23314A;
	Wed,  2 Apr 2025 09:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743584790; cv=none; b=u6jnGVvtcnSON7OQ5D+MKvEt0+dLn+wwDCmljovvMw8nbhWhV/Jn1N/VUgEqIouttk90ouIR2+7ZmeUszYMlqwwxCueX44DCp6SfxDyOH2oapBc2H5mdeOPyfzURDSWTGY66CGcVIN6kUuqHBxteFd3xNrfnEFI+8R7aIIDi6m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743584790; c=relaxed/simple;
	bh=+DtDgRryVbhRcjFy78n1sONheq+Cd0bctWKChaGqmPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=siuTz3m+IvqeULCL8RPWtM1J9lAqYyM56WcmstofdvkBV2poK242Okpo9CPCBNTyhzgp6KlYaBpRCIYeBP79Y75kzcpWSYTVN2Za067BW2DkFssZYC9txkvNM38u6hxkzADQg9Y4YKEN+nSjTSSJFU0h7pg64d41kNunspwT9/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=glGmzojd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="glGmzojd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743584781;
	bh=+DtDgRryVbhRcjFy78n1sONheq+Cd0bctWKChaGqmPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=glGmzojd9QONIsyYXH+Ac+Qxl5ZQjqRVl+inbow79b4OO9QAtINNlQkWzqloGsL68
	 AF8tTQh0wctxVRvrjBraar4yDjbyJnBtXZyuXXboidhumzJtZCCb5KKzarlVYQGC9N
	 WiborEGzI7s9fwk/4uN0+axlNf8Iakas3ECiZJr1dRg98RqY2DN1QHTcAnR9s9kmC+
	 JXsl63FjWSzJZ89J8QeT6HgJXHxKhFGHZ2SX/QwNfbEexwUknDSkgMwvW/YkscNPSa
	 rHpyRbbHSRT2WsQSSH9baX5A0e8s3ZtOrP+sb7yH+VAv8dL0/R1UF95vY/95v6bPdM
	 mb+Y3jVKnwm9A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9195017E0809;
	Wed,  2 Apr 2025 11:06:20 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	weiyi.lu@mediatek.com,
	tinghan.shen@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 2/2] arm64: dts: mediatek: mt8195: Reparent vdec1/2 and venc1 power domains
Date: Wed,  2 Apr 2025 11:06:15 +0200
Message-ID: <20250402090615.25871-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402090615.25871-1-angelogioacchino.delregno@collabora.com>
References: <20250402090615.25871-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By hardware, the first and second core of the video decoder IP
need the VDEC_SOC to be powered up in order to be able to be
accessed (both internally, by firmware, and externally, by the
kernel).
Similarly, for the video encoder IP, the second core needs the
first core to be powered up in order to be accessible.

Fix that by reparenting the VDEC1/2 power domains to be children
of VDEC0 (VDEC_SOC), and the VENC1 to be a child of VENC0.

Fixes: 2b515194bf0c ("arm64: dts: mt8195: Add power domains controller")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 50 +++++++++++++-----------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 0cb96cba727a..aeca7eeb4067 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -619,22 +619,6 @@ power-domain@MT8195_POWER_DOMAIN_VPPSYS0 {
 					#size-cells = <0>;
 					#power-domain-cells = <1>;
 
-					power-domain@MT8195_POWER_DOMAIN_VDEC1 {
-						reg = <MT8195_POWER_DOMAIN_VDEC1>;
-						clocks = <&vdecsys CLK_VDEC_LARB1>;
-						clock-names = "vdec1-0";
-						mediatek,infracfg = <&infracfg_ao>;
-						#power-domain-cells = <0>;
-					};
-
-					power-domain@MT8195_POWER_DOMAIN_VENC_CORE1 {
-						reg = <MT8195_POWER_DOMAIN_VENC_CORE1>;
-						clocks = <&vencsys_core1 CLK_VENC_CORE1_LARB>;
-						clock-names = "venc1-larb";
-						mediatek,infracfg = <&infracfg_ao>;
-						#power-domain-cells = <0>;
-					};
-
 					power-domain@MT8195_POWER_DOMAIN_VDOSYS0 {
 						reg = <MT8195_POWER_DOMAIN_VDOSYS0>;
 						clocks = <&topckgen CLK_TOP_CFG_VDO0>,
@@ -680,15 +664,25 @@ power-domain@MT8195_POWER_DOMAIN_VDEC0 {
 							clocks = <&vdecsys_soc CLK_VDEC_SOC_LARB1>;
 							clock-names = "vdec0-0";
 							mediatek,infracfg = <&infracfg_ao>;
+							#address-cells = <1>;
+							#size-cells = <0>;
 							#power-domain-cells = <0>;
-						};
 
-						power-domain@MT8195_POWER_DOMAIN_VDEC2 {
-							reg = <MT8195_POWER_DOMAIN_VDEC2>;
-							clocks = <&vdecsys_core1 CLK_VDEC_CORE1_LARB1>;
-							clock-names = "vdec2-0";
-							mediatek,infracfg = <&infracfg_ao>;
-							#power-domain-cells = <0>;
+							power-domain@MT8195_POWER_DOMAIN_VDEC1 {
+								reg = <MT8195_POWER_DOMAIN_VDEC1>;
+								clocks = <&vdecsys CLK_VDEC_LARB1>;
+								clock-names = "vdec1-0";
+								mediatek,infracfg = <&infracfg_ao>;
+								#power-domain-cells = <0>;
+							};
+
+							power-domain@MT8195_POWER_DOMAIN_VDEC2 {
+								reg = <MT8195_POWER_DOMAIN_VDEC2>;
+								clocks = <&vdecsys_core1 CLK_VDEC_CORE1_LARB1>;
+								clock-names = "vdec2-0";
+								mediatek,infracfg = <&infracfg_ao>;
+								#power-domain-cells = <0>;
+							};
 						};
 
 						power-domain@MT8195_POWER_DOMAIN_VENC {
@@ -696,7 +690,17 @@ power-domain@MT8195_POWER_DOMAIN_VENC {
 							clocks = <&vencsys CLK_VENC_LARB>;
 							clock-names = "venc0-larb";
 							mediatek,infracfg = <&infracfg_ao>;
+							#address-cells = <1>;
+							#size-cells = <0>;
 							#power-domain-cells = <0>;
+
+							power-domain@MT8195_POWER_DOMAIN_VENC_CORE1 {
+								reg = <MT8195_POWER_DOMAIN_VENC_CORE1>;
+								clocks = <&vencsys_core1 CLK_VENC_CORE1_LARB>;
+								clock-names = "venc1-larb";
+								mediatek,infracfg = <&infracfg_ao>;
+								#power-domain-cells = <0>;
+							};
 						};
 
 						power-domain@MT8195_POWER_DOMAIN_VDOSYS1 {
-- 
2.48.1

