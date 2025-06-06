Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A081EEA31;
	Fri,  6 Jun 2025 19:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749237762; cv=none; b=Tjc7fo2hH3mA44dtH3Cqcqk0ESigfMQKDFnCsFmRcAZxdD6zDWhoh1veCAqAotW/uLwH03aFnhg0NFk7C8INEwRwuFuxGmgf0WfgLDqwjqoZv7ap4AmtidjfWK4vv4RrJfHVk4PCXmb7mj68yOmeosmkPm5TGbAW8FhiS/tLL4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749237762; c=relaxed/simple;
	bh=CnEdH1+Z2CTJ9Zuf+LRk8SuOpBuI7gjC9ykeeEhanMU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fn9/l5KH8B6sbZBB+3OWgOiLg28BR8nH0joVCX3NCyjIY70UDqmc1hLXu6heaUGQqsMJ9hD0dCf5jT/QGO8wo52nxTbFjA9Uc7I/85LBW5h8aZZ0dd0p/s8vmNeUKHaPUOUrgF6+eTOZVVQbhtI8bmuxvmk0sIYa5n0kylMcmD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6/UloRT; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6/UloRT"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-451d6ade159so21521135e9.1;
        Fri, 06 Jun 2025 12:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749237759; x=1749842559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZolhV8X06QdceO7CzE5y1gL4qY3spYRGaKK90w3Qq18=;
        b=j6/UloRT1za25kux3oZRIsCANJ2LO7bi3tXNSKNANOQ9VPLiaml3KBi6myXWnIYPfL
         76lSE+NOI6ok57Ds8kLSn2SSy2cH2KVJw/2lj4NtvYel+fnPfx3vpNxJ2BnfqRhvZdd/
         6ECY1uc7dnSHjYfH8e4O+LtO72qopRgvuCFa1bsx+EeXoo8LtBIwvVEi3JJL/NXcyk/5
         425YwJ2Ly8MF1BE2X25kY059qUwdSn6vy9jXEKA+EZbwOloZpu2Mop3opxGmEKllCglx
         P6cGmynGZagiw6QjmoENtfi5oGa0bHCqL/ZjK/XEb+IXmCLYzQNKmP+Wad1lzKCGx2LF
         8BAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749237759; x=1749842559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZolhV8X06QdceO7CzE5y1gL4qY3spYRGaKK90w3Qq18=;
        b=rRuGSeGMg8RS4tHEYSkZFkw2fKlgd4d/EdK4gkPW3JrVvXGcbsu1IPJhsKjhN2xe4z
         r1dw9UCAR4rg1L4JxF3w0D7SZ0Q1D+ex3dL2B48GQDxbPxiAlOQZ6UQWxOD/59QbvQOr
         KcKaF0gtZ1wHuh30Xt7bjudMyY6qdPOq9QCoEylaqzxxAgE6Ij4dh9kjjfR4qZhMDEg5
         FJ0CQgzuNkcSy5hw8afHhcsgmvb6902S+ByaMGAK3NqKDUiaKroCk4A2scdjDUiciBW2
         mFdbLuxHNjSKPhF0LC7/A6BTknBLDGL6fIZEbcX1CmY+29yN33g/ACJoYJG2FaoxKU0b
         kavg==
X-Forwarded-Encrypted: i=1; AJvYcCVjo1LtBMP7YbIIaySEABVHVuLgFAq55OGpQJbH9pG8nGzeU46y49GPt0fRNbeF4POsaLA6jQ5eWl2dQrru@vger.kernel.org, AJvYcCXfPtmdUAmhS4wt8kt8AvgnTb4obE++N8LOmAd+v8KS+q0Qp//VHZRu7X+ULGO6wqqG7cARc4rQyuwa@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl1uQkFFnv7GFsykdq7fjLK5c/FaQHu1oA4kxo0GyWHyQOFOrE
	jR9tycpKv4btBlHcaL6+FM/bljcnxm9oIgD8wrODat1Ofiv9hlHXwerufNAbYA==
X-Gm-Gg: ASbGncsrAD8uzqMw5nf0Nn/w85uJx63Ns0xc4nH2lUwYKlsmIwHQuAwj6T3jkHSbqw7
	pzC59O5uffWYSvxc0XbLebER3kVpSUC1wP+dMxv1QWz6aACf1VlcwuOc+YYfAOLZS7oxoGutxT2
	5ez64PEfydxFm8LY0x+qx7KIjAK6dEQSbSiZHH2fzJODg30jZnTvziPfTdDvDWYJxCoBwwqx2uN
	zaLJN9i94rxKl1BjZRc10jMx3ykAMaG6vvt062eL1coMVhw4jcMt8LMKLCGr/K9B/FXcxjQ5Fdx
	Bw0UL8mKUkwcT+npi9m7MIoHqPoXpQKeUYv5pxbZKVj41/BIDt891+VpKAPjh3T5DrOe5mh92d+
	4XP/lwDNWX7m9DKN6qd5OaXepRmEiUBE=
X-Google-Smtp-Source: AGHT+IHvYkioXXi9euOPF6eBXLqwVwcWGxM2cdh3Mcrbf418BuLqjjgdxRNMHv/c4ueJMT5PlyjZsw==
X-Received: by 2002:a05:600c:3b95:b0:450:d30e:ff96 with SMTP id 5b1f17b1804b1-452012b66afmr51338315e9.0.1749237758229;
        Fri, 06 Jun 2025 12:22:38 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-452730b9b27sm30951595e9.23.2025.06.06.12.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 12:22:37 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] phy: move Airoha PCIe PHY driver to dedicated directory
Date: Fri,  6 Jun 2025 21:22:02 +0200
Message-ID: <20250606192208.26465-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250606192208.26465-1-ansuelsmth@gmail.com>
References: <20250606192208.26465-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for additional PHY driver for different Airoha SoC,
move the current PCIe PHY driver in a dedicated directory.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                                     |  4 ++--
 drivers/phy/Kconfig                             | 11 +----------
 drivers/phy/Makefile                            |  4 ++--
 drivers/phy/airoha/Kconfig                      | 13 +++++++++++++
 drivers/phy/airoha/Makefile                     |  2 ++
 drivers/phy/{ => airoha}/phy-airoha-pcie-regs.h |  0
 drivers/phy/{ => airoha}/phy-airoha-pcie.c      |  0
 7 files changed, 20 insertions(+), 14 deletions(-)
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 rename drivers/phy/{ => airoha}/phy-airoha-pcie-regs.h (100%)
 rename drivers/phy/{ => airoha}/phy-airoha-pcie.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6dbdf02d6b0c..2f30432916a3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -735,8 +735,8 @@ M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/phy/airoha,en7581-pcie-phy.yaml
-F:	drivers/phy/phy-airoha-pcie-regs.h
-F:	drivers/phy/phy-airoha-pcie.c
+F:	drivers/phy/airoha/phy-airoha-pcie-regs.h
+F:	drivers/phy/airoha/phy-airoha-pcie.c
 
 AIROHA SPI SNFI DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 8d58efe998ec..7f9f5b786643 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -72,16 +72,6 @@ config PHY_CAN_TRANSCEIVER
 	  functional modes using gpios and sets the attribute max link
 	  rate, for CAN drivers.
 
-config PHY_AIROHA_PCIE
-	tristate "Airoha PCIe-PHY Driver"
-	depends on ARCH_AIROHA || COMPILE_TEST
-	depends on OF
-	select GENERIC_PHY
-	help
-	  Say Y here to add support for Airoha PCIe PHY driver.
-	  This driver create the basic PHY instance and provides initialize
-	  callback for PCIe GEN3 port.
-
 config PHY_NXP_PTN3222
 	tristate "NXP PTN3222 1-port eUSB2 to USB2 redriver"
 	depends on I2C
@@ -93,6 +83,7 @@ config PHY_NXP_PTN3222
 	  schemes. It supports all three USB 2.0 data rates: Low Speed, Full
 	  Speed and High Speed.
 
+source "drivers/phy/airoha/Kconfig"
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
 source "drivers/phy/broadcom/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index e281442acc75..0ad0e5309493 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -10,9 +10,9 @@ obj-$(CONFIG_PHY_LPC18XX_USB_OTG)	+= phy-lpc18xx-usb-otg.o
 obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
 obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
 obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
-obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
-obj-y					+= allwinner/	\
+obj-y					+= airoha/	\
+					   allwinner/	\
 					   amlogic/	\
 					   broadcom/	\
 					   cadence/	\
diff --git a/drivers/phy/airoha/Kconfig b/drivers/phy/airoha/Kconfig
new file mode 100644
index 000000000000..1674134ea664
--- /dev/null
+++ b/drivers/phy/airoha/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Phy drivers for Airoha platforms
+#
+config PHY_AIROHA_PCIE
+	tristate "Airoha PCIe-PHY Driver"
+	depends on ARCH_AIROHA || COMPILE_TEST
+	depends on OF
+	select GENERIC_PHY
+	help
+	  Say Y here to add support for Airoha PCIe PHY driver.
+	  This driver create the basic PHY instance and provides initialize
+	  callback for PCIe GEN3 port.
diff --git a/drivers/phy/airoha/Makefile b/drivers/phy/airoha/Makefile
new file mode 100644
index 000000000000..616dc96302af
--- /dev/null
+++ b/drivers/phy/airoha/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
diff --git a/drivers/phy/phy-airoha-pcie-regs.h b/drivers/phy/airoha/phy-airoha-pcie-regs.h
similarity index 100%
rename from drivers/phy/phy-airoha-pcie-regs.h
rename to drivers/phy/airoha/phy-airoha-pcie-regs.h
diff --git a/drivers/phy/phy-airoha-pcie.c b/drivers/phy/airoha/phy-airoha-pcie.c
similarity index 100%
rename from drivers/phy/phy-airoha-pcie.c
rename to drivers/phy/airoha/phy-airoha-pcie.c
-- 
2.48.1

