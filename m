Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EE51FDA8E;
	Wed,  2 Jul 2025 05:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751432675; cv=none; b=IFw1H2fih9ZQApf0JTZw7fH/ibAg2m4L3hLTXabBbAuW5ECdM/ujtIZl4lblrElwMMuhBCJhpW4lapXC3RMNcwKdUr3MaDJBLxq/BL+2HvjDaXucOjbCCqnOi2zyEVs971H4sgSxLbv51sovCa47TH6yo3IpZh5nHJLGy5X0ixE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751432675; c=relaxed/simple;
	bh=AmsLSIXvoTPPxoJnd/jXfjcXhtHYalVq77+RGiOjFs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JVEOBBS908CMh8pgy5J72mLdlAB/YvQQTk/gFQXVDVbGsj+PtkyJAfMw5SUqKPC2RpPkV8Wz4YuzlQjnfAsvc11KQbia6XJTa0LFIUKVCoxzv4WG+kKv/iIDhkQJ2zXJKmtekamuos29sFxf/qL4QhgRtUp8qT65KsF4BRvaiSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTnEs2qY; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTnEs2qY"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3138e64b42aso7431687a91.0;
        Tue, 01 Jul 2025 22:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751432674; x=1752037474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YF+z+9UJtGb+XbPNA4vnSpzZQyRgL5kz75DPKXiDmdo=;
        b=KTnEs2qYdR7rR28D7o5niZzo2SK1ljZeOnCCsjgU81qczwmJinLtnhib1sAJ7HcLZ5
         F6sYPPMdZXwTkXX6GHrEJ29uARH038aY7KxOwp3Z5ID/ZWyuHseYTYagRTHeM0GgUkiu
         NS8Do1AlGKEoWcJw7xNGntBRwnRqGjrsOAbnYd0VVLz3pQH8bpCjKhKDtjKf0eFaRSv0
         3PrZZ1RNLJjrTFNucvBkkIFO7iTCDhL1MVFyjGJkl8v1OucwPyaGzXUOMlfLQcD831I/
         FGK+iPvhcSgVETewq3gdoXL2IJ3f26gwxvYTzjFBJ1ps/CuMJp3zJcXv5q7snqfRC37j
         4LVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751432674; x=1752037474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YF+z+9UJtGb+XbPNA4vnSpzZQyRgL5kz75DPKXiDmdo=;
        b=jn2eP6QpoCyXJZ+ypNzlsmDB8IsDRK8JT+JGakOMt21oOomvdurEGZA/bwmk/tq+Az
         lH2FAKsd2W3nJB9srL/VaTqAb/pRqF9J4eW4+rv35KdE01Dj5go084lyukV/83wdlmNW
         O1BGnngDFv4lBtM3WSeIqaGI3HyJWxBjZL5nVXkQAwcil0hQRrSF14p8ehMMxO5GPHZZ
         9e3IPp3ipbBWvvwkYJFCCze/h5cL/uwS4v7gvPUw2LG2qAeBTVXHx8OQCX2WBIUXABsg
         jB90suMv0jRFqLuMLRYsK+kPXW0GLpiMTaL6zZSH8soUikUt1S9x6IKMiKAxrxvWvsZ3
         +/1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5hrLstHwwZ1s8MH96PmLFsiAQbKdVZx/q/qRqNSoWxovcmpMRbzIlY1OrgeomYDQFw7ZFeo2/evUhYr2o@vger.kernel.org, AJvYcCW2zGgWEBZZvS7+/VJyV2RjeqIetDieIKujJNjfQgMmdLf/j0CVshn4bYT0KL5klaRUQYsPXHIDR6lz@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi9DmHHhxnj/Ll1DMSLYCb1R4FkswGSLtQCM2PNFw1gyW8H/Ur
	ajfV4qkdgmf1oKRd05IFr3f7+vM3CeJW3l38JoYhL6DBYiugOxIlrwPHGOPWsO1z
X-Gm-Gg: ASbGncv86ODnvxseRZuTymTTT3TpahuX2kkjFSMZMz+20XMUQWvacBDMGKOrzMXUSKc
	W7xlepF2NYW4ZnuHyMZiYUmOED19+jF6i6ttnB9Sy7t9DbLStK74EaGSMPUIhBRbhvyKWogHrPC
	3wf696rE9jNjI+TshWiNd7IAg7Dr+Zkr4reggvsjVl1RAsfW43hHqudlWw847wlTnchyBJvVntQ
	dVU3ahUWqDWN1amgHaX6E+FC02Hll5EnWXVmBBrS1xBb14h71wB3lzaBhTW/WRdlSO1XXzQUku2
	95IYGlcQXy12ooMZNBrMrXRkp8Dtp5g343e6zibmdAOB4ckADJ8thMV1GgSUvpyv5KamYdjX6xg
	g21zdI6vJCYnODDulnmSpWxSVqsa/Uls0KEKb4xOtbj1bw3V21A==
X-Google-Smtp-Source: AGHT+IFHbwDhMvbqCmis9Avzz0dITiewmawmhCdCrU+rThLZ332gFQVSpCI8zquGUjTRwmwtjMg8pA==
X-Received: by 2002:a17:90b:5183:b0:311:c1ec:7d05 with SMTP id 98e67ed59e1d1-31a90c1faf7mr2410967a91.35.1751432673558;
        Tue, 01 Jul 2025 22:04:33 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f54270a5sm18168323a91.25.2025.07.01.22.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:04:33 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH 5/5] ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC
Date: Tue,  1 Jul 2025 22:04:16 -0700
Message-ID: <20250702050421.13729-6-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250702050421.13729-1-rentao.bupt@gmail.com>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Ren <rentao.bupt@gmail.com>

Add initial device tree for the Meta (Facebook) Darwin AST2600 BMC.

Darwin is Meta's rack switch platform with an AST2600 BMC integrated for
health monitoring purpose.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-facebook-darwin.dts | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 2e5f4833a073..debbfc0151f8 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -20,6 +20,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-bletchley.dtb \
 	aspeed-bmc-facebook-catalina.dtb \
 	aspeed-bmc-facebook-cmm.dtb \
+	aspeed-bmc-facebook-darwin.dtb \
 	aspeed-bmc-facebook-elbert.dtb \
 	aspeed-bmc-facebook-fuji.dtb \
 	aspeed-bmc-facebook-galaxy100.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
new file mode 100644
index 000000000000..f902230dada3
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2021 Facebook Inc.
+
+/dts-v1/;
+
+#include "ast2600-facebook-netbmc-common.dtsi"
+
+/ {
+	model = "Facebook Darwin BMC";
+	compatible = "facebook,darwin-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial0 = &uart5;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
+			      <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+			      <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
+			      <&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
+	};
+
+	spi_gpio: spi {
+		num-chipselects = <1>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
+	};
+};
+
+/*
+ * BMC's "mac3" controller is connected to BCM53134P's IMP_RGMII port
+ * directly (fixed link, no PHY in between).
+ * Note: BMC's "mdio0" controller is connected to BCM53134P's MDIO
+ * interface, and the MDIO channel will be enabled in dts later (when
+ * "bcm53xx" driver's probe failure is solved on the platform).
+ */
+&mac3 {
+	status = "okay";
+	phy-mode = "rgmii";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii4_default>;
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+	};
+};
+
+&i2c0 {
+	eeprom@50 {
+		compatible = "atmel,24c512";
+		reg = <0x50>;
+	};
+};
+
+&adc0 {
+	ref_voltage = <2500>;
+	status = "okay";
+
+	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
+		     &pinctrl_adc2_default &pinctrl_adc3_default
+		     &pinctrl_adc4_default &pinctrl_adc5_default
+		     &pinctrl_adc6_default &pinctrl_adc7_default>;
+};
+
+&adc1 {
+	ref_voltage = <2500>;
+	status = "okay";
+
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
+		     &pinctrl_adc10_default &pinctrl_adc11_default
+		     &pinctrl_adc12_default &pinctrl_adc13_default
+		     &pinctrl_adc14_default &pinctrl_adc15_default>;
+};
+
+&emmc_controller {
+	status = "okay";
+};
+
+&emmc {
+	status = "okay";
+
+	non-removable;
+	max-frequency = <25000000>;
+	bus-width = <4>;
+};
-- 
2.47.1

