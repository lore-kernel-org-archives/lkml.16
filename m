Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72453218845;
	Thu, 27 Mar 2025 14:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743086524; cv=none; b=Lg1m8Dv6akAzVZAaMTS/WYRnwwH7yLjKSgPBpLD/mFAD0Uyeihr42ysSMdAZwSbqY9vWKc5eVGvS3A1FPIqZ6rhQz6av3a9V4GPmTcncbikdbLiiMXXeaXEn56R890bY17tCLExRD+e5o9IB21Ax5VrRfKy1OoKigOSlokuERxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743086524; c=relaxed/simple;
	bh=OKzg/WII6f+encAGx68+FMKsUbg0Olcjva+9t8NcGec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eZZd6FJIBFuEGJHEz6m4uwgp0MvvbqZfl0gcIfsB1DmZZ9Cyqzyz8q+vwtFaFaJHPUyb9D03ZDzMojgkzqdUjr5N7QwF+KLjVslKoFRVLE/7XKj4U2l3NjnLTZFz4s07bB4vALnncYIkHG1mdQelGjqjOyXihMBMKnr2ITbssOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=kyZW5zXN; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=RABhvT7j reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="kyZW5zXN";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="RABhvT7j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1743086522; x=1774622522;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K0ZPvbEX5oIac0KAWj+UHOagnYaNlDgXKH6Ic5pW24Y=;
  b=kyZW5zXNJkisyEFsKKl3iVNLXkwndibwd5Pws6Jr1fCnpi2mIpgFKpGq
   LknoPmUDd+K+9MLl2mREZKbq+eorqELZ6VrPRYQDZKGAIsPGYt9O72N4+
   MzbRMihyu2mSJNTsOfgllsHstCEBOfBB7IRdJdr4Qti3R/0vHFmEFYMRu
   FIqZXIiqmO9+I8dRMqFfYF0Tj4N1VszYIsj3UrjNiDwbI2N54RHMe/ptp
   3tNo6yl6WCZS7jFHW2Ho+cFTbdFntC2uyafQanrS5A1jaLIBW5fvXf1K7
   ZZme2eKgOWO3ir4ugM6Wr8/fcr4Hy8hd4hfFk0KroB3shZBIllWnlIQ7a
   w==;
X-CSE-ConnectionGUID: atJQoWbkQNSyFBHHfxh6zw==
X-CSE-MsgGUID: oHpKk3eWRmS5BgUHSst1Lw==
X-IronPort-AV: E=Sophos;i="6.14,280,1736809200"; 
   d="scan'208";a="43199520"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 Mar 2025 15:42:00 +0100
X-CheckPoint: {67E563B8-2A-DC4DC9A0-F4F29281}
X-MAIL-CPID: C949553AC5661CB4E0C7C2A4FD560C8D_0
X-Control-Analysis: str=0001.0A00639C.67E563B4.0065,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DA2A716C181;
	Thu, 27 Mar 2025 15:41:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1743086516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K0ZPvbEX5oIac0KAWj+UHOagnYaNlDgXKH6Ic5pW24Y=;
	b=RABhvT7jP2rpdyFNmmUNK8+a7oL0n24/QTCUZ+uyEvqHvvsb14bzt6qiPlryRpxe0Qt/lN
	23aZ0GGGcVMTgqE3KorHpSQYNU575QJsfEU/oluATb6yCJF15nAd8ulik7q6/tB09r8yWM
	qqnuiLfTjKCMEuBJHG0VRheqiJB7fihp7Kwu/SeRRMwtnlOoAKbMFzXYo5IDsFfpjEILge
	kNxgsiGfzCdml0rrtCwGPj2+mOB42494gFaPLNcOEOU3JD1O9kFIO6agDMsTtUOuXDBlil
	YrnNnve2e/DYmF1bADftSkteowbOPnTqBEisqLKuaQJ6q4Uy79llonoXkMkOUg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] ARM: dts: ls1021a-tqmals1021a: Add LVDS overlay for Tianma TM070JVGH33
Date: Thu, 27 Mar 2025 15:41:10 +0100
Message-ID: <20250327144118.504260-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
References: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
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
accordingly. Add the missing power supply as well.

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

