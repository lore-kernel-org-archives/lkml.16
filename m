Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99680293C5F;
	Tue, 17 Jun 2025 22:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750198354; cv=none; b=LPTbn6YeL/FMrZ21ZKG71oe+TyQnLgEH8c7ifnDgBtFdn+9b/oomBtbbrcKY/xARiFhSWcYJKi/Wb689dfyx+mY6Qbq2IcGUCqHesnpul4GtgLT7r2SeEwAVlDvw0ZNezThlUIAMyqPYDfJH6Na9lgOYIYZlM/oJnprefZrukPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750198354; c=relaxed/simple;
	bh=7RG41+s8tLicHaINioXBPqPfTHs8Tglwrn8OtPWj1rc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cW10EgQarPhOq6FXEY5YmBy3wYIYoCFPlH0MCudWDB5EznhSgRnZOBRmLawwi+lhYKVBv2yZOBKdHtge4vJGGhTlIzjz2BCFqbb2YnuSTlV9/7FLTJIDYfy1Xr2eyNnMaV2dlEWhu69C+XT62Mza8NF+Qjx5FAwgIldE1cMLI2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avCFCOum; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avCFCOum"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-236192f8770so1257555ad.0;
        Tue, 17 Jun 2025 15:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750198351; x=1750803151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSAwLiv169Pgv9iGc8xTMLJMCRfaJi/jc1tTODDUNXQ=;
        b=avCFCOumhOpyX7mDpqvgdNAjNsIqxqEoWIX2UTRWNxnY3pYWXeX2tw8wOuTv8ztFW2
         Dt1UfD4Ckaa+VTOnPPZ4no5Gz115EEdlX7brLaVbII8e2e41y7JC6m8KJ9XoXRQ69OEA
         3xAQOIOZDU/jed6K48wHDwZLDAU+D5AdF4xErRcHVnL/8trGnlIvjDPxVzNOzv7Y/qha
         gxlF00e6c7Q7T//qyXwrjmNBDexU5xMNaSw8x3PW0afgmjY9y13189EjnT4VyrwnHoF0
         GG0cDwn5pD4T7cIicraE/8PNnivSjZj/saq854pLyyYh3lWHPRU2Xi1po4LkQ2pFnHC0
         Tkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750198351; x=1750803151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSAwLiv169Pgv9iGc8xTMLJMCRfaJi/jc1tTODDUNXQ=;
        b=rlkzwIQzi+7pIUQ13VMqM8n0/CObWvinMzkyTIs6XzExe/ykrpqi+dsY9TeT257K6L
         L4Bg2cddMkqvmFbUOgDdIu5D87tBlBMMSdU9OG7/21AHwZhjT6qnDX4G0VBna0TulqI6
         BHaGOjL3J4uTaeEI1xEP+YOiTDu/BvVOlshfzCv6MyGWCirTHMc6u6xakQJtS+nkWSfW
         kvBQVG7NJh7/o1qomHACv9xoFPdqwROztqSLIPvoiUYsoBDujN1wFFu6fELOHj+wRTOH
         D/Cdz6tjw4fakKlCUJmgCHwOC/Wqh3pmbofqVjcfa3HWwY3LjVQrk1osYjrtkByJEEwJ
         g3Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ4tB8pd/sXMFJHzZnKkA+anHCmB1MnQpNeYJIggN1hK204uldxYqciGhtbnmMC3HAoJXs+pJIus3zfpsP@vger.kernel.org, AJvYcCWQx7KYL0CyqXy7F2qnIC26587aAkL1i6SlD6mXmOYHm/EQmSvkEaZSkJKiZ0tt0emSbl3Xm3BxXigO@vger.kernel.org
X-Gm-Message-State: AOJu0YxkEJPKdFZCjjt+S7vysgRMUfL5dDWq7f2vyO5DCbG5YvUEdRjp
	WmI1XZmZxg5N4a6dwgdHoEMVxfEqYK9NCKY47gHvJ8WAr2ordGc3Kiys
X-Gm-Gg: ASbGncsbtYIl/AhLSOnWbDl0tKT/yowViFwxrxh6NBHPdmGykkBAfGVX8eIuFkeqVRD
	ls/RpODpuz7bWjs8K4NlT4C84GrB5LBr3IGov7gkFxrqrpfFPkYecnTfOYtBuA0r0Rg8Y1QtPWU
	oeTL03MLbPhMPKulaF2yA1MlAjfgZKFdGMlRIvsglfbYnoblD7yk9pi+n7tqG0PKtqFeKr/Qh46
	yRrAjjsrsQ0VCMhxXGLDWj1FTWOp0UvX6IXCx0lPZmLc3UrEQFQaoBaCzvUa9LYry12NVq+jfxb
	aWC/gid6s2oTp22vm7i6/kIVfNq9fecSkb5R50QolsWRE3NMsT60EidsQCnWRg==
X-Google-Smtp-Source: AGHT+IGSBat5Awpb3N8too0zVfUcZWGcDL1zGBWVl236KVi6rOnzDQmx1jh0YLkVAbzlzUqKZyFymw==
X-Received: by 2002:a17:902:d548:b0:234:325:500b with SMTP id d9443c01a7336-237c20f843amr3332005ad.22.1750198350834;
        Tue, 17 Jun 2025 15:12:30 -0700 (PDT)
Received: from wash.local ([50.46.184.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781c7sm85862635ad.128.2025.06.17.15.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 15:12:30 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 17 Jun 2025 15:12:00 -0700
Subject: [PATCH v5 2/3] arm64: dts: rockchip: Add rk3588 based Radxa CM5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-rk3588s-cm5-io-dts-upstream-v5-2-8d96854a5bbd@gmail.com>
References: <20250617-rk3588s-cm5-io-dts-upstream-v5-0-8d96854a5bbd@gmail.com>
In-Reply-To: <20250617-rk3588s-cm5-io-dts-upstream-v5-0-8d96854a5bbd@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jimmy Hon <honyuenkwun@gmail.com>
Cc: Steve deRosier <derosier@cal-sierra.com>, devicetree@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.14.2

Add initial support for the Radxa Compute Module 5 (CM5). The CM5 uses a
proprietary connector.

Specification:
- Rockchip RK3588
- Up to 32 GB LPDDR4X
- Up to 128 GB eMMC
- 1x HDMI TX up to 8k@60 hz
- 1x eDP TX up to 4k@60 hz
- Gigabit Ethernet PHY

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 .../arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi | 135 +++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..6410ea5255dc783e5d24677853ccf1c78008e834
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Joseph Kogut <joseph.kogut@gmail.com>
+ */
+
+/*
+ * CM5 data sheet
+ * https://dl.radxa.com/cm5/v2210/radxa_cm5_v2210_schematic.pdf
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
+#include <dt-bindings/usb/pd.h>
+
+/ {
+	compatible = "radxa,cm5", "rockchip,rk3588s";
+
+	aliases {
+		mmc0 = &sdhci;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led_sys: led-0 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "on";
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+};
+
+&cpu_b0 {
+	cpu-supply = <&vdd_cpu_big0_s0>;
+};
+
+&cpu_b1 {
+	cpu-supply = <&vdd_cpu_big0_s0>;
+};
+
+&cpu_b2 {
+	cpu-supply = <&vdd_cpu_big1_s0>;
+};
+
+&cpu_b3 {
+	cpu-supply = <&vdd_cpu_big1_s0>;
+};
+
+&cpu_l0 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l1 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l2 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l3 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&gpu {
+	mali-supply = <&vdd_gpu_s0>;
+	status = "okay";
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0m2_xfer>;
+	status = "okay";
+
+	vdd_cpu_big0_s0: regulator@42 {
+		compatible = "rockchip,rk8602";
+		reg = <0x42>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_cpu_big0_s0";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <550000>;
+		regulator-max-microvolt = <1050000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vdd_cpu_big1_s0: regulator@43 {
+		compatible = "rockchip,rk8602";
+		reg = <0x43>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_cpu_big1_s0";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <550000>;
+		regulator-max-microvolt = <1050000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
+&mdio1 {
+	rgmii_phy1: phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x1>;
+	};
+};
+
+&pd_gpu {
+	domain-supply = <&vdd_gpu_s0>;
+};
+
+&sdhci {
+	bus-width = <8>;
+	no-sdio;
+	no-sd;
+	non-removable;
+	max-frequency = <200000000>;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	mmc-hs200-1_8v;
+	status = "okay";
+};
+

-- 
2.50.0

