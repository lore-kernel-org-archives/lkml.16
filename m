Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C9C275869
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749149738; cv=none; b=pNT6XpLVc7jQdHNfyLpvx2jcscM5wlg2ubHPcO8QpBhJctXS/5QcY12UsQzXQkSPFV56X8uu4UqrE0rpMLC81cM0RPiF33/z2RpD+4tVoo9bgVbL4fYyNQSbRk3X0gMMsZnvWvjvJKBeE1qkhOlrM+9u/hkXJ59VyjIOtrhkJ8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749149738; c=relaxed/simple;
	bh=zn3a8IA+wsHljEf0ocwaVYhvvYbNBAY70+W3fOTLFTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hUcNAsjNIuGx0pkyHzIBIuzogRGmzH3Ju5X2gDrZNjFxNpDr7AV7i8l82dL5h2z8ByXuakJ2leO3uqoDPhwK0r00MCXTb/JS8UTSxGaRme2LJDe2LfDu0uBtVbHTJFTNUhMMsKnVrqWIYA57cWwVcMcirQW2QpFr1T9l6e7wX8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=AzPGaupM; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="AzPGaupM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=Jd+XYEA3pEbCUDkOI0L8oYUprN/tANZB2XqREwLARWk=; b=AzPGaupMWwjr+jdlEJnJjLmb1h
	PpHNNNg3fl9L8FUUhISlhtsfe0fG0fgrspHJGFHQCX9BP7TvDPp6EUCIcvikuiR5Qk+i1zcJnoreA
	9sNVld9KOWASwXCBWeplxGf12yrpFZ4TABV4COZ/SSUpEiNFNq9q+VEnlTcXA1hjotA0uJbyErGUk
	TUizP+K0D3pZEsuB9CpN8gUxMjZUSFys5zLTHz3CxMu7o82BAB24QuaaozUO59ItNGn3Gasv+odGZ
	nf9krPnmFiyDF+ikuBG5E/w+86acMCiaWRLNQ4aINBC92xikNgZSgTPRCSvL4AoFDcc1W8AGb47Q7
	VvUHqc3w==;
Received: from i53875ad6.versanet.de ([83.135.90.214] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uNFkM-0000s7-Gi; Thu, 05 Jun 2025 20:55:26 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	jonas@kwiboo.se,
	dsimic@manjaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: rockchip: add regulator-enable-ramp-delay to RK860-0/-2/-3 regulators
Date: Thu,  5 Jun 2025 20:50:01 +0200
Message-ID: <20250605185001.377055-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RK860-0/-1/-2/-3 regulators are used on rk3588 boards in addition to
the main pmic, to supply components like the big cpu-clusters and npu.

So far nobody had a use-case for turning these off. The supplies for the
big cpu-clusters are on by default and those clusters normally are not
completely turned off during runtime.

This changed with the new Rocket driver for the NPU, which does use
runtime-pm and thus does turn off and on the NPU's supply regulator as
needed. This regulator is also needed to run to actually turn on the
power-domain for the NPU.

If the rocket driver now runtime-suspends while running a load and then
runtime-resumes again, hangs can be observed with messages like

  rockchip-pm-domain fd8d8000.power-management:power-controller: failed to set domain 'nputop' on, val=0

A way to "fix" that issue when it happens, is to set the regulator to
always-on. This suggests that the power-domain is trying to get power
from the regulator before it is ready to deliver power.

And in fact the datasheet for the regulator defines an "Internal soft-start
time" characteristic. For a target output voltage of 1.0V the _typical_
time to reach at least 92% of the output, is given as 260uS.

That means the time is dependent on the target voltage (up to 1.5V for
the type) and also the rest of the board design.

So add a regulator-enable-ramp-delay to all rk860-2/-3 nodes we have in
mainline right now. I've chosen 500uS to be on the safe side, as
260uS is the "typical" value for 1.0V and sadly no max value is given
in the datasheet.

This adds the property to all rk8600, rk8602 and rk8603 occurences that
are in mainline as of 6.16-rc1. There is currently no rk8601 used in
any in-kernel devicetree.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
changes in v2:
- also adapt rk8600 in rk3566-radxa-zero-3 (Quentin)
- reword commit description to be easier to understand (Quentin)

 arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi         | 1 +
 arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts            | 3 +++
 arch/arm64/boot/dts/rockchip/rk3588-armsom-lm7.dtsi           | 2 ++
 arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts          | 2 ++
 arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi           | 3 +++
 arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-common.dtsi | 2 ++
 arch/arm64/boot/dts/rockchip/rk3588-fet3588-c.dtsi            | 3 +++
 arch/arm64/boot/dts/rockchip/rk3588-firefly-core-3588j.dtsi   | 3 +++
 arch/arm64/boot/dts/rockchip/rk3588-firefly-icore-3588q.dtsi  | 3 +++
 arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi  | 3 +++
 arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts           | 2 ++
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts                | 3 +++
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi            | 3 +++
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi           | 2 ++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts            | 3 +++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi              | 2 ++
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi                | 3 +++
 arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dts           | 2 ++
 arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi           | 3 +++
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts            | 3 +++
 arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts        | 3 +++
 arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts      | 3 +++
 arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts         | 2 ++
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi           | 3 +++
 arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts            | 3 +++
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi          | 3 +++
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts              | 3 +++
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts              | 3 +++
 28 files changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi
index 1ee5d96a46a1..6fa0b4b35d9c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi
@@ -424,6 +424,7 @@ vdd_cpu: regulator@40 {
 		regulator-name = "vdd_cpu";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <712500>;
 		regulator-max-microvolt = <1390000>;
 		regulator-ramp-delay = <2300>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts b/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
index e04f21d8c831..a290360c3c49 100644
--- a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
@@ -219,6 +219,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		regulator-name = "vdd_cpu_big0_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -236,6 +237,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		regulator-name = "vdd_cpu_big1_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -264,6 +266,7 @@ vdd_npu_s0: regulator@42 {
 		regulator-name = "vdd_npu_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
 		regulator-ramp-delay = <2300>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-armsom-lm7.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-armsom-lm7.dtsi
index e44125e9a8fb..d44685f7a8dc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-armsom-lm7.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-armsom-lm7.dtsi
@@ -86,6 +86,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		regulator-name = "vdd_cpu_big0_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -103,6 +104,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		regulator-name = "vdd_cpu_big1_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts b/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
index ae9274365bed..0d0ff629127a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
@@ -212,6 +212,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		regulator-name = "vdd_cpu_big0_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -229,6 +230,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		regulator-name = "vdd_cpu_big1_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi
index cc37f082adea..9606d3378b95 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi
@@ -152,6 +152,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		regulator-name = "vdd_cpu_big0_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -169,6 +170,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		regulator-name = "vdd_cpu_big1_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -190,6 +192,7 @@ vdd_npu_s0: regulator@42 {
 		regulator-name = "vdd_npu_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
 		regulator-ramp-delay = <2300>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-common.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-common.dtsi
index 8a783dc64c0e..27f92fe334c4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-common.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-common.dtsi
@@ -98,6 +98,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		regulator-name = "vdd_cpu_big0_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -115,6 +116,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		regulator-name = "vdd_cpu_big1_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-fet3588-c.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-fet3588-c.dtsi
index 4331cdc70f97..a7e4b0cf44b5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-fet3588-c.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-fet3588-c.dtsi
@@ -154,6 +154,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		regulator-name = "vdd_cpu_big0_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -171,6 +172,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		regulator-name = "vdd_cpu_big1_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -194,6 +196,7 @@ vdd_npu_s0: regulator@42 {
 		regulator-name = "vdd_npu_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
 		regulator-ramp-delay = <2300>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-firefly-core-3588j.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-firefly-core-3588j.dtsi
index 80e16ea4154c..610305dc8b78 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-firefly-core-3588j.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-firefly-core-3588j.dtsi
@@ -56,6 +56,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		fcs,suspend-voltage-selector = <1>;
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-name = "vdd_cpu_big0_s0";
@@ -74,6 +75,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		regulator-name = "vdd_cpu_big1_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -96,6 +98,7 @@ vdd_npu_s0: vdd_npu_mem_s0: regulator@42 {
 		fcs,suspend-voltage-selector = <1>;
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
 		regulator-name = "vdd_npu_s0";
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-firefly-icore-3588q.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-firefly-icore-3588q.dtsi
index 6726eeb49255..50d3cda8956e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-firefly-icore-3588q.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-firefly-icore-3588q.dtsi
@@ -56,6 +56,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		fcs,suspend-voltage-selector = <1>;
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-name = "vdd_cpu_big0_s0";
@@ -73,6 +74,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		fcs,suspend-voltage-selector = <1>;
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-name = "vdd_cpu_big1_s0";
@@ -96,6 +98,7 @@ vdd_npu_s0: vdd_npu_mem_s0: regulator@42 {
 		fcs,suspend-voltage-selector = <1>;
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
 		regulator-name = "vdd_npu_s0";
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi
index af431fdcbea7..070c9930dd30 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi
@@ -146,6 +146,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		regulator-name = "vdd_cpu_big0_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -163,6 +164,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		regulator-name = "vdd_cpu_big1_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -184,6 +186,7 @@ vdd_npu_s0: regulator@42 {
 		regulator-name = "vdd_npu_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
 		regulator-ramp-delay = <2300>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts b/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
index 73d8ce4fde2b..f871c99e5b9a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
@@ -241,6 +241,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		regulator-name = "vdd_cpu_big0_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -258,6 +259,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		regulator-name = "vdd_cpu_big1_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index ebe77cdd24e8..f13ecd02dafa 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -394,6 +394,7 @@ vdd_npu_s0: regulator@42 {
 		regulator-name = "vdd_npu_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
 		regulator-ramp-delay = <2300>;
@@ -411,6 +412,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		regulator-name = "vdd_cpu_big1_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -505,6 +507,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		regulator-name = "vdd_cpu_big0_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index 3d8b6f0c5541..4cb4fe409cd4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -411,6 +411,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		regulator-name = "vdd_cpu_big0_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -428,6 +429,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		regulator-name = "vdd_cpu_big1_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -449,6 +451,7 @@ vdd_npu_s0: regulator@42 {
 		regulator-name = "vdd_npu_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
 		regulator-ramp-delay = <2300>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
index 91d56c34a1e4..e8e66e72ea54 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
@@ -230,6 +230,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		regulator-name = "vdd_cpu_big0_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -247,6 +248,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		regulator-name = "vdd_cpu_big1_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
index 7de17117df7a..ee0e49643acc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
@@ -307,6 +307,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		regulator-name = "vdd_cpu_big0_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -324,6 +325,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		regulator-name = "vdd_cpu_big1_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -347,6 +349,7 @@ vdd_npu_s0: regulator@42 {
 		regulator-name = "vdd_npu_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
 		regulator-ramp-delay = <2300>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
index 6052787d2560..2d91fa8185a8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
@@ -281,6 +281,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		regulator-name = "vdd_cpu_big0_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -298,6 +299,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		regulator-name = "vdd_cpu_big1_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
index c4933a08dd1e..1546a81cca50 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
@@ -198,6 +198,7 @@ vdd_npu_s0: regulator@42 {
 		regulator-name = "vdd_npu_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
 		regulator-ramp-delay = <2300>;
@@ -270,6 +271,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		regulator-name = "vdd_cpu_big0_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -287,6 +289,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		regulator-name = "vdd_cpu_big1_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dts b/arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dts
index 5a428e00ab93..29e6e730548b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dts
@@ -232,6 +232,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		regulator-name = "vdd_cpu_big0_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -249,6 +250,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		regulator-name = "vdd_cpu_big1_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
index 60ad272982ad..189bce24e656 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
@@ -133,6 +133,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		regulator-name = "vdd_cpu_big0_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -150,6 +151,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		regulator-name = "vdd_cpu_big1_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -173,6 +175,7 @@ vdd_npu_s0: regulator@42 {
 		regulator-name = "vdd_npu_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
 		regulator-ramp-delay = <2300>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
index 8b717c4017a4..c95a1386d61b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
@@ -251,6 +251,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		regulator-name = "vdd_cpu_big0_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -268,6 +269,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		regulator-name = "vdd_cpu_big1_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -289,6 +291,7 @@ vdd_npu_s0: regulator@42 {
 		regulator-name = "vdd_npu_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
 		regulator-ramp-delay = <2300>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
index 873a2bd6a6de..009b6a0579e7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
@@ -470,6 +470,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		compatible = "rockchip,rk8602";
 		reg = <0x42>;
 		fcs,suspend-voltage-selector = <1>;
+		regulator-enable-ramp-delay = <500>;
 		regulator-max-microvolt = <1050000>;
 		regulator-min-microvolt = <550000>;
 		regulator-name = "vdd_cpu_big0_s0";
@@ -485,6 +486,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		compatible = "rockchip,rk8603", "rockchip,rk8602";
 		reg = <0x43>;
 		fcs,suspend-voltage-selector = <1>;
+		regulator-enable-ramp-delay = <500>;
 		regulator-max-microvolt = <1050000>;
 		regulator-min-microvolt = <550000>;
 		regulator-name = "vdd_cpu_big1_s0";
@@ -504,6 +506,7 @@ vdd_npu_s0: regulator@42 {
 		compatible = "rockchip,rk8602";
 		reg = <0x42>;
 		fcs,suspend-voltage-selector = <1>;
+		regulator-enable-ramp-delay = <500>;
 		regulator-max-microvolt = <950000>;
 		regulator-min-microvolt = <550000>;
 		regulator-name = "vdd_npu_s0";
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
index 4ec7bc4a9e96..f9896bce86f7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
@@ -296,6 +296,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		reg = <0x42>;
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-max-microvolt = <1050000>;
 		regulator-min-microvolt = <550000>;
 		regulator-name = "vdd_cpu_big0_s0";
@@ -313,6 +314,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		reg = <0x43>;
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-max-microvolt = <1050000>;
 		regulator-min-microvolt = <550000>;
 		regulator-name = "vdd_cpu_big1_s0";
@@ -334,6 +336,7 @@ vdd_npu_s0: regulator@42 {
 		reg = <0x42>;
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-max-microvolt = <950000>;
 		regulator-min-microvolt = <550000>;
 		regulator-name = "vdd_npu_s0";
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
index 2c22abaf40a8..caafb142ae4f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
@@ -233,6 +233,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		regulator-name = "vdd_cpu_big0_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -250,6 +251,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		regulator-name = "vdd_cpu_big1_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index fbf062ec3bf1..9d87d129f00c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -267,6 +267,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		regulator-name = "vdd_cpu_big0_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -284,6 +285,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		regulator-name = "vdd_cpu_big1_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -303,6 +305,7 @@ vdd_npu_s0: regulator@42 {
 		reg = <0x42>;
 		fcs,suspend-voltage-selector = <1>;
 		regulator-name = "vdd_npu_s0";
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
 		regulator-ramp-delay = <2300>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts b/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts
index a72063c55140..d081adaf7be4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts
@@ -280,6 +280,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		regulator-name = "vdd_cpu_big0_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -297,6 +298,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		regulator-name = "vdd_cpu_big1_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -318,6 +320,7 @@ vdd_npu_s0: regulator@42 {
 		regulator-name = "vdd_npu_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
 		regulator-ramp-delay = <2300>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index 4fedc50cce8c..afbf69e23cb0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -217,6 +217,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		regulator-name = "vdd_cpu_big0_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -234,6 +235,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		regulator-name = "vdd_cpu_big1_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -255,6 +257,7 @@ vdd_npu_s0: regulator@42 {
 		regulator-name = "vdd_npu_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
 		regulator-ramp-delay = <2300>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
index f894742b1ebe..b4a302c97a50 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
@@ -195,6 +195,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		regulator-name = "vdd_cpu_big0_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -212,6 +213,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		regulator-name = "vdd_cpu_big1_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -233,6 +235,7 @@ vdd_npu_s0: regulator@42 {
 		regulator-name = "vdd_npu_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
 		regulator-ramp-delay = <2300>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
index dd7317bab613..072dbf877fec 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
@@ -294,6 +294,7 @@ vdd_cpu_big0_s0: regulator@42 {
 		regulator-name = "vdd_cpu_big0_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -311,6 +312,7 @@ vdd_cpu_big1_s0: regulator@43 {
 		regulator-name = "vdd_cpu_big1_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <1050000>;
 		regulator-ramp-delay = <2300>;
@@ -339,6 +341,7 @@ vdd_npu_s0: regulator@42 {
 		regulator-name = "vdd_npu_s0";
 		regulator-always-on;
 		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
 		regulator-ramp-delay = <2300>;
-- 
2.47.2

