Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C969F266EE2
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745401026; cv=none; b=AgFTZDADXfkstO98Lm7ua9JtYNIOfW/2GGE4oa6Eg8JXoyyAO7mQav2AUrKXRtxeROkJECQp+pS4aT2FJzMorBgmUUjGutye7iFgmdanjtLn3SuVtuMBqE31cbHR9hXoO5RquogMPCmy9n0B/MbIkVFl7JI7joNXdyZGjHw26KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745401026; c=relaxed/simple;
	bh=dc8PR/VKmB9BxmFgu1NuW03MZkmuDs+GL3hwxFvsZcE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jPLoXX9YHbdDHmGpICjiDk977VpgMjm7+7D9COOo9PveI45MDCIFRmvaBr8YNwzHP348T/v8gcuAR1kLkXyFo6vcg2xJRyPSy66N5iyzqCQgYfr7kYkd9Wk+TaDiea9dOSiZmLGt5/REXDKSw90S1hQY2cSqIMg9PjI39XMacg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=RY3Cjy8+; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="RY3Cjy8+"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-af590aea813so753451a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 02:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1745401023; x=1746005823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlwv3tgoeUy6P2c2ThKyW3Vg1sKyoas8gJ12eZIqlpo=;
        b=RY3Cjy8+VXVcnOH22IX3Q6td0beoxy0RwhOiEo5qlwuyoeaK+Ql1R3FcPWyhism9Xt
         4VFvJbcYNR9HvY0QQR7EV+vhjnu1pY7yllg6w5O/H6qNNsiOS1DGt6ccmnPWbBR9Wq6E
         uvsDXMqPQdpmbjSzreoewW5FJppSGHidBISXMsU3ukTBHj5xsd7QuhNQx6ImWLmj1t0I
         tyvcYzAnlgH8wIeT4v2k6ONWN3+3AfnJknC30XxcBlk1TzOFlRdN0z8zHd48Mstj276M
         MopjG2oDXhnFQe2RYTWifJ5hafo7UzyF6NsQWJWhayQwWh0MyKm4cAZns3xn6inmZ/Fa
         3LFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745401023; x=1746005823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlwv3tgoeUy6P2c2ThKyW3Vg1sKyoas8gJ12eZIqlpo=;
        b=nQBBUtkPL1h1Vurysxu6Z7gHgrT4BN3hbYKtbysIc21UfZ9EN8Vz4xUTlYlvTznZP1
         YdYtb4mzXxl20IevmWNURAcHr6JwSPxPPD7m3TY2ZoZXdNwhMFjkpaAuuCoLr/CD86ER
         yOCg3IL6wOTfmah/H6KP8bbdy2ZHkfhnY/QMP8Y1ftxqrvoxursOS25ggSjHUgUzN+Wv
         fHNWuLs5bzlI7UX1VT6opJSwsHPJnVopuSGsvM6K8ulvvBadzoNWsg0k/m8UWY92C+l/
         dpP3XbCmegEX/UJc7fJhwAA/i0nBdoRdBwT4M7EPwNXHTCIgInu8Kuawtk8bOZOt+4b0
         L7OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUisK54tWvtryKsKQoTH5tixSdbQJhLnomkc3J83NMDq/iLMF8lt3RaY82lPrsVPuW2Zd07+4Ur2bE0PQo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLOWkzh6NOW3+eosFCuk3UcoRKsIDfeQAJ7l64zuQRDpL8/kcq
	KEg4H2MsAFRteVXbHG4G7l2Plc+c4ZIycYWZoLX6ERmopNBsRG/ey+jKJRxp2F4=
X-Gm-Gg: ASbGncs3v9nmOaunf9Mt0AorTMC0PmPcCdTB4QLKPM6LNt4vbj9e+C0hYtd5k+bpLfA
	rBzWZlHczFEzoj+tVtzyMFnBYmTSsO49Y1GuR8ce60MbGFDmq+Nz3n5axWb3El52K4CR1i6KhO0
	wTlJjwhp2sYOWBtCveV6Z0AegcYxbZuTmN/65lOQ0MXRXzsLlGN96/9JftWEtBZ87PdANffX7i7
	hIQVHU8tieFzogBqTAE+xQRp1gyTwqLx2LAxWi//LWI17puCFjkpjXnLhdDgQfdNjdtQt+b9YRf
	RKKnpmFHdnVwlqhYs3ljlBETPAtIT5EtW/pjY0IuJCDrGNKZR+1lsNGd0RZYVX/h/WSrmzIKYas
	=
X-Google-Smtp-Source: AGHT+IGQ8xlsW4d+eBJ+oGBBq5d/ZFuItOWl7SCRrXOODg2nfq78c93h7SZdNc8Yj5tHMPnuXvvGnw==
X-Received: by 2002:a17:902:dac7:b0:21f:98fc:8414 with SMTP id d9443c01a7336-22da3387b8dmr31122275ad.26.1745401022942;
        Wed, 23 Apr 2025 02:37:02 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50ecec54sm99557885ad.168.2025.04.23.02.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 02:37:02 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: sam@ravnborg.org,
	neil.armstrong@linaro.org,
	daniel@ffwll.ch,
	dianders@google.com,
	hsinyi@google.com,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	knoxchiou@google.com
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v10 2/2] arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks
Date: Wed, 23 Apr 2025 17:36:47 +0800
Message-Id: <20250423093647.4074135-3-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423093647.4074135-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20250423093647.4074135-1-cengjianeng@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MT8186 ponyta, known as huaqin custom label, is a
MT8186 based laptop. It is based on the "corsola" design.
It includes LTE, touchpad combinations.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
---
Changes in v10:
- No change.

Changes in v9:
- PATCH 2/2: Add sound model to fix the warning.
- Link to v8:https://lore.kernel.org/all/20240914063122.1622196-3-cengjianeng@huaqin.corp-partner.google.com/

Changes in v8:
- PATCH 2/2: Change the commit about ponyta.
- Link to v7:https://lore.kernel.org/all/20240913031505.372868-3-cengjianeng@huaqin.corp-partner.google.com/

Changes in v7:
- PATCH 2/2: Remove prototype sku.
- PATCH 2/2: Disable the other trackpad to enable one of them.
- Link to v5:https://lore.kernel.org/all/20240909023148.1677936-3-cengjianeng@huaqin.corp-partner.google.com/

Changes in v6:
- No change.

Changes in v5:
- PATCH 2/2: Remove sku2147483647.
- Link to v4:https://lore.kernel.org/all/20240906085739.1322676-3-cengjianeng@huaqin.corp-partner.google.com/

Chage since v3:
- No change.

Changes in v2:
- PATCH 2/2: Modify the dtb name without rev2.
- Link to v1:https://lore.kernel.org/all/20240902125502.1844374-1-cengjianeng@huaqin.corp-partner.google.com/

---
 arch/arm64/boot/dts/mediatek/Makefile         |  2 +
 .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 18 +++++++
 .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 22 +++++++++
 .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 49 +++++++++++++++++++
 4 files changed, 91 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 58484e830063..3aa06476c6c0 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -64,6 +64,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-chinchou-sku16.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393216.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393217.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393218.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-ponyta-sku0.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-ponyta-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-rusty-sku196608.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-starmie-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-starmie-sku1.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
new file mode 100644
index 000000000000..986498af4c70
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-ponyta.dtsi"
+
+/ {
+	model = "Google Ponyta sku0 board";
+	compatible = "google,ponyta-sku0", "google,ponyta", "mediatek,mt8186";
+};
+
+&i2c2 {
+	trackpad@15 {
+		status = "disabled";
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
new file mode 100644
index 000000000000..ff5eea0ddeb4
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-ponyta.dtsi"
+
+/ {
+	model = "Google Ponyta sku1 board";
+	compatible = "google,ponyta-sku1", "google,ponyta", "mediatek,mt8186";
+};
+
+&i2c2 {
+	trackpad@2c {
+		status = "disabled";
+	};
+};
+
+&usb_c1 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi
new file mode 100644
index 000000000000..0abf69077089
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-steelix.dtsi"
+
+&keyboard_controller {
+	function-row-physmap = <
+		MATRIX_KEY(0x00, 0x02, 0)	/* T1 */
+		MATRIX_KEY(0x03, 0x02, 0)	/* T2 */
+		MATRIX_KEY(0x02, 0x02, 0)	/* T3 */
+		MATRIX_KEY(0x01, 0x02, 0)	/* T4 */
+		MATRIX_KEY(0x03, 0x04, 0)	/* T5 */
+		MATRIX_KEY(0x02, 0x04, 0)	/* T6 */
+		MATRIX_KEY(0x01, 0x04, 0)	/* T7 */
+		MATRIX_KEY(0x00, 0x04, 0)	/* T8 */
+		MATRIX_KEY(0x00, 0x01, 0)	/* T9 */
+		MATRIX_KEY(0x02, 0x09, 0)	/* T10 */
+		MATRIX_KEY(0x01, 0x09, 0)	/* T11 */
+		MATRIX_KEY(0x01, 0x05, 0)	/* T12 */
+	>;
+
+	linux,keymap = <
+		CROS_STD_MAIN_KEYMAP
+		MATRIX_KEY(0x00, 0x02, KEY_BACK)
+		MATRIX_KEY(0x03, 0x02, KEY_REFRESH)
+		MATRIX_KEY(0x02, 0x02, KEY_ZOOM)
+		MATRIX_KEY(0x01, 0x02, KEY_SCALE)
+		MATRIX_KEY(0x03, 0x04, KEY_SYSRQ)
+		MATRIX_KEY(0x02, 0x04, KEY_BRIGHTNESSDOWN)
+		MATRIX_KEY(0x01, 0x04, KEY_BRIGHTNESSUP)
+		MATRIX_KEY(0x00, 0x04, KEY_PLAYPAUSE)
+		MATRIX_KEY(0x00, 0x01, KEY_MICMUTE)
+		MATRIX_KEY(0x02, 0x09, KEY_MUTE)
+		MATRIX_KEY(0x01, 0x09, KEY_VOLUMEDOWN)
+		MATRIX_KEY(0x01, 0x05, KEY_VOLUMEUP)
+	>;
+};
+
+&mt6366codec {
+	mediatek,dmic-mode = <1>; /* one-wire */
+};
+
+&sound {
+	model = "mt8186_rt1019_rt5682s";
+};
+
-- 
2.34.1

