Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5B029615C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148425; cv=none; b=AcrI8TACi625BdIxcWGZWK/ZVe9I8Jnms2YsjPoZNWx3c1IZm6Xn5V/y0YrPg1gWkqvXMi/GemIhaKyXM5VklWbNZUTZLuRDKO0Y6R5WWCd1chETMPuC/U9F01m1tKUzJC9YIHSNIP0DHXpErQiLBsfRRRvCgZFyMESpQJF9ozE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148425; c=relaxed/simple;
	bh=8yYHhsk6aMkF+7LDvlU62jXCOJIeWXFnbuZRr/rWNfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oiTbkj1NhwYoU8qo4N0hpjLgbgQyD1a+DinurZBIxAqFN/pIF/64g9QO3r79DODAxJ9hQ/tOeqpCW6jq0OxmrLPNPL2SiGyoq0JFWAjCZePY11WyVZHfTqsC7e1iHTWJZTSGhbvJEKpQ2KQTXBaztrYnhVq/pRSLDO4Amk4gxh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W9+d0LI8; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W9+d0LI8"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2351227b098so44284955ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750148423; x=1750753223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0zl5UgUMJioINXEhfKw/OPFCjl4142IWY9RjIGoGFw=;
        b=W9+d0LI8+UdMHmzRSI819lrmhq8Z/1urzXKx/QhCCgI5Kr73XTflATW40xQRb7pR7r
         8Wge0OBuNquzzBLYDm/fmJH75fwSDY3ijAZnTtaRr4b6MxSDqd1FyfXyGTSplLjDcp8/
         HkVpmaTvORVcevstAv2mBshgvutS2d1jGzJ4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148423; x=1750753223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t0zl5UgUMJioINXEhfKw/OPFCjl4142IWY9RjIGoGFw=;
        b=tUzJ7Dblg1brK+gNZptXKavdjnc7huGOEGQBezF0Musn9Fixr9cNaG6U8hgK+Rfc74
         iTFJHegTlKOAMkrU8ninjpTUFAM+LtUSdLVdtIg0c81Is5RTlK630Esk6tw8DToxQdHA
         1O2/9SfRnn2axRxu6H3f8o7odd9eGsF7SsCxM14nzaEmJfQsrV4hHOfRhcnTiv1HvlyL
         zaWFALh6L3qyR5n+PM6E1OehMypdheD0kwDaSfsHFiy9YdHCyhcFExscjzl5Bw77A/xg
         cSiNEIAHYdoJE+I1nfxsAkReIp40KKIw3VZtaYv99+VpePhKvdj11icBEPFVA4kzmMqC
         Mf7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZVvscYTTbCuIfKJJs08MDLr2rEjbrrHP4RC2eA5MsezHMUqzFMugMkKCNdp+h0wB3DA4knxHkePRA2Q4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHidw6hpZ8Z57iEIZldemzSak8walh9pKMtbfqu21q0Dtcmwhh
	VIRRDb2p/vX0mv+zJUgOaT+poBS8IbInVOe8cWiRpfpGVP1Ij+QeX2AQdal7WMGFvw==
X-Gm-Gg: ASbGncvVGy3C+oWqZA1TMbTSJv8Kho07yFnaMvhSCaFf9rRyClkLIDcx4vtI3XOsnWr
	7wJxxcEhvkYsg/It4ifp+w4adKeAsJYiHNpjj6ElFgk9X9IYF70viBLOUP6o2RN6BiPZCyLendv
	cpoXALSx8u2A6D6pds+ci/O9qwmHguSMu1e3WEzmvADSMeukHbzsVL/4tqmHHeMv+RFI7k4dlso
	sz8NWsxAWGWVV6a/aIK495reoqAFPFpSjNCRWJCSF0m2zHtTYsu/tS7TdhSjvHh1jA3cqcFgvcN
	WRJoPpapu79o7aWWOlKDqXJXei9Dl7diWspP9CW25iUX3h8WYMP5HOXw0Eh84xKbp9VZSCY8gpg
	AiiSF
X-Google-Smtp-Source: AGHT+IF4kxUCNX955eBUeMtmUp09tZHq5eVY7way6VVQf06qYS7+0eKNuGC1EFb0EH+rMHbB8Kt5lw==
X-Received: by 2002:a17:903:440f:b0:235:60e:3704 with SMTP id d9443c01a7336-2366b32ccafmr198804545ad.12.1750148423221;
        Tue, 17 Jun 2025 01:20:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:24a1:2596:1651:13d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781f7sm74598885ad.110.2025.06.17.01.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:20:22 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v3 6/6] arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks
Date: Tue, 17 Jun 2025 16:20:03 +0800
Message-ID: <20250617082004.1653492-7-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
In-Reply-To: <20250617082004.1653492-1-wenst@chromium.org>
References: <20250617082004.1653492-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device tree for the MT8186 based Squirtle Chromebooks, also known
as the Acer Chromebook Spin 311 (R724T). The device is a 2-in-1
convertible.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../dts/mediatek/mt8186-corsola-squirtle.dts  | 107 ++++++++++++++++++
 .../dts/mediatek/mt8186-corsola-steelix.dtsi  |   2 +-
 3 files changed, 109 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index a8b8796276aa..a4df4c21399e 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -68,6 +68,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393218.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-ponyta-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-ponyta-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-rusty-sku196608.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-squirtle.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-starmie-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-starmie-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-steelix-sku131072.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
new file mode 100644
index 000000000000..f721ad4e5c97
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-voltorb.dtsi"
+
+/ {
+	model = "Google squirtle board";
+	compatible = "google,squirtle", "mediatek,mt8186";
+	chassis-type = "convertible";
+};
+
+&i2c1 {
+	touchscreen@10 {
+		compatible = "elan,ekth6915";
+		reg = <0x10>;
+		interrupts-extended = <&pio 12 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		reset-gpios = <&pio 60 GPIO_ACTIVE_LOW>;
+		vcc33-supply = <&pp3300_s3>;
+		status = "fail-needs-probe";
+	};
+
+	touchscreen@16 {
+		compatible = "elan,ekth8d18", "elan,ekth6a12nay";
+		reg = <0x16>;
+		interrupts-extended = <&pio 12 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		reset-gpios = <&pio 60 GPIO_ACTIVE_LOW>;
+		vcc33-supply = <&pp3300_s3>;
+		status = "fail-needs-probe";
+	};
+};
+
+&i2c2 {
+	trackpad@68 {
+		compatible = "hid-over-i2c";
+		reg = <0x68>;
+		hid-descr-addr = <0x20>;
+		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pin>;
+		vdd-supply = <&pp3300_s3>;
+		wakeup-source;
+		status = "fail-needs-probe";
+	};
+};
+
+&i2c5 {
+	clock-frequency = <400000>;
+
+	/delete-node/ codec@1a;
+
+	rt5650: codec@1a {
+		compatible = "realtek,rt5650";
+		reg = <0x1a>;
+		interrupts-extended = <&pio 17 IRQ_TYPE_EDGE_BOTH>;
+		avdd-supply = <&mt6366_vio18_reg>;
+		cpvdd-supply = <&mt6366_vio18_reg>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&speaker_codec_pins_default>;
+		cbj-sleeve-gpios = <&pio 150 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		realtek,dmic1-data-pin = <2>;
+		realtek,jd-mode = <2>;
+	};
+};
+
+&sound {
+	compatible = "mediatek,mt8186-mt6366-rt5650-sound";
+	model = "mt8186_rt5650";
+
+	audio-routing =
+		"Headphone", "HPOL",
+		"Headphone", "HPOR",
+		"HDMI1", "TX";
+
+	hs-playback-dai-link {
+		codec {
+			sound-dai = <&rt5650>;
+		};
+	};
+
+	hs-capture-dai-link {
+		codec {
+			sound-dai = <&rt5650>;
+		};
+	};
+
+	spk-hdmi-playback-dai-link {
+		codec {
+			sound-dai = <&it6505dptx>;
+		};
+	};
+};
+
+&speaker_codec {
+	status = "disabled";
+};
+
+&trackpad_steelix {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
index 822a177e7c19..8a196dc9a96b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
@@ -118,7 +118,7 @@ &i2c2 {
 	i2c-scl-internal-delay-ns = <22000>;
 
 	/* second source component */
-	trackpad@2c {
+	trackpad_steelix: trackpad@2c {
 		compatible = "hid-over-i2c";
 		reg = <0x2c>;
 		hid-descr-addr = <0x20>;
-- 
2.50.0.rc2.692.g299adb8693-goog

