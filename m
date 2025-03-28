Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521CB214A65
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 09:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743154861; cv=none; b=JuJ9LSFi6NwXC+V+aLlk7nHH+R5WWjynNQjm9ELnBzqHfi3LtdE5V6aPWZlqTzNC+6ezjQ9W96SJzjJwbatcsTxvJha0dDIAEdZkE/B4hlk6xiucj099lAnEmw7LXLuKrkRecO52noBC72FVjV/fMHtZMeLhF47cNvrz1T8KCtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743154861; c=relaxed/simple;
	bh=L2wZicz84aKDbZU9N8NwXaO+DJOgQtMNqH+z1xR1eMg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NF4tMnOQ6KgJ1h4YL8fXaW2hoUNdwTEIZacZOCBOhtnZNUjzZMFusN1QFwok7pr1JK6+9URVi/I+dIUGBTdcgmtIBVqmqcsXrY6RPhBl9PCVMhE4aGww2N86XLrML/IMKvYmp81Rd8lUZJxlTlFu/QN8Xwf7lNWC8+u9JiwH/dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=YxnjgrqP; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="YxnjgrqP"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2243803b776so60075975ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 02:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1743154857; x=1743759657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7sLKbM1GxYyyD1I95xtv6zOCj7bHrFx0RiH3FTmLOI=;
        b=YxnjgrqP2n7SHI8ucDtm079xGpQwPfG8bxXX9wfCfAzcvdJN4b9AXlEDSdmmdP5Gl4
         jch9Ood9qP6E/NsrqjhkMxYLJIZKd9NgaJMxJB/RWdLDNsoaSY+oVjhQgQRh8kMSVvCY
         QnlSQG0FFcZfpuXnTy+cuo5T37KsjBDHXmMEFSkCUpmfUkSj2ZXVGDvXe4eg+VxbXc6V
         x9m1tpUgxGLfNy+amkhwV3yCwb283OGPP3QXmD46gt6v33INeZ5+lObAXww90mv/74/O
         SW6ZSatbgFD3IRyIQ7seHMRgcI1bOeYaPwAzYIxdYVgXFsz8m5l5LgqJvGQwfgrkWDQc
         FJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743154857; x=1743759657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7sLKbM1GxYyyD1I95xtv6zOCj7bHrFx0RiH3FTmLOI=;
        b=e+be431YCieTuZYs1Ove3/IHmRE8Uv1TkX/3fllUYeEoXAaazenHbf47yTgCOgp0sI
         amQQrkBkD7QDqg3PnY2RBB7h76JybRfbrIthEceRq5iJOjWL2gowJEFdAzx09QidR2cM
         qgNuVoay/nW1V2yoGSQqeVlcbIS2wkIt3nI24SiVMYzxHAq8MdbYijE1Fq/laqPOonU4
         6DOoUnNuv3OmxXVOXasRHhTrYlc9bMwuzmUzRxNyQWT5QAwpSL8txmus5em+oC27boBl
         og2Tfeg6SrbfxCPMC7N2Kp5JpL6Fh6TKND6SQp60XCX3ibL3Yql8PsCm2+uq7w18JZm/
         J9aw==
X-Forwarded-Encrypted: i=1; AJvYcCXkTy8HnlnUhM7bRfiJIBAAMct68eESdSiWR3JTMCr67EG4uBR3+QkAxC4CFjXKj0qgT4Y51HlV3HKttqE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgNmuhqslyYfTMZVui1uegcfeZAdllcDkQn4fvApom1Of94FhD
	QnoCkgqrjA5u0CAyzxrlP2hErCBv467GZa5phuQPX74GwQoGn95mEFdAf8nW5sE=
X-Gm-Gg: ASbGncutDoOU1IK4Iure43qrA/7smZMKnCA39AxhX6L3pk+2RqZ538JlOhxHPeMihl3
	lBqKxbnGamQNSfD1nqtTOHRKwnUbmq/LbAl8nImaulA1yVLs40sTnXAby4+0ozNMNScQFEN+fmQ
	MRsAUovWxW/eXuAiVu7rax/6335kOQy4DbdXV16TEhZkNeEFnDH9mzS/IqezcICYS2IIUaLI9Kv
	kVc6e/B1Xxq7VuYr+cr0F6yfdq7xxco/PubbSERBYFpnrV/Ai+Jsw8JDFZJ3ht6rpERlW4inSA+
	uLaUHjWWcKoMAdoMUWdvtMdMbjWP2TQLAZcDMo+YDYKTBwqjvoBksZgQCAcDNPJyXWIil/6srHT
	GGnY=
X-Google-Smtp-Source: AGHT+IHrCAmD8rW6ulLWjoKzD0DZQFfirZ4O72cN3Wg27gYzM+6Ab11Lts8MO1iP1coA0GbOqOR8Og==
X-Received: by 2002:a17:902:e748:b0:224:1935:d9a3 with SMTP id d9443c01a7336-228048bb34bmr99905155ad.21.1743154857449;
        Fri, 28 Mar 2025 02:40:57 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7397106c7b7sm1283012b3a.116.2025.03.28.02.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 02:40:57 -0700 (PDT)
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
Subject: [PATCH v9 2/2] arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks
Date: Fri, 28 Mar 2025 17:40:34 +0800
Message-Id: <20250328094034.3400233-3-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250328094034.3400233-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20250328094034.3400233-1-cengjianeng@huaqin.corp-partner.google.com>
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

