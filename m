Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2160F18BC0C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 05:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748842546; cv=none; b=gV6C3y/lVmkEHFrZFgBbrH8liFZKU1H8338AvM/c2VML/Dzcr1EJilptXsg+iKFy5djkI/ItMltYANDN9zcCQyA+L9bYCtuQTWVkAiCfGwV9EhBlWJ1Q5gjDPWNAktkHaBcvt3Pezu/rQ7LOi3JDrIuaXGMQngD6NJXeFgTew9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748842546; c=relaxed/simple;
	bh=MaGMkK/SWlKFsPuh4AWDT0+Ox1CB9o1INXA9ut4JqOs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DRVVTgtlGbKd2nJrgBxwjib2+ah2Nssrz8tjqiBTCgc9sk2tk0itGuYNZLN3UVze0yOxwERAG3vr4Y5wX/O5Y1ACH6LZ74vHQF62okA7z0m+YK0IUMvmG+HTyuuga0drf3yt+Rxe9TrsltTceRSHtyuimzAnfums3d2HdvBIPKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=kUao5eK4; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="kUao5eK4"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-311d5fdf1f0so3642668a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 22:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1748842544; x=1749447344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsYldGWMRaVQ+7mIriqN/NoKlP/8B7jbjmXeeUPejeE=;
        b=kUao5eK4qAht+ZtVTc+EOGo5+1ke6JZ+3Rbr3E+qY40/dP/z45He2eM7NpEeWcFp/o
         bsE7YoCkBCQDnKAO4iqUGVavzyki3asnsWJxtY4pkv7QmdKjHPrA7gpRpPOx8uta7dz8
         Jazjn9dUPNoQrp4+yTOzlKXAEP/fhQtVFc0zg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748842544; x=1749447344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JsYldGWMRaVQ+7mIriqN/NoKlP/8B7jbjmXeeUPejeE=;
        b=tGrKAzHf9Ihc7QNFWBE68B69JokVFVJw5LlzG50mMjwPzXoxZsTZo4p4F9F3OIO0k9
         jxjk/aw8/HN1dBCIJYcC80qvE7y4z2m6KZl/+NDKtOBIoBr1Fq47TT+1BZrjEA4FFkLR
         Bexq/72R+UbpbLHwczuh7bOtNAS+X8+ERlsP7WVVCHJG32R5+9KWnzi6RfQcSsiRbuBB
         iBfbmstddWUe60jlbKAkZ4lJ05cJCY9p7mJ2r/GnGE1oSbCd1bb2UlF5ppVs0shG6b1H
         VHJlcTj59urN6K/knLmcY/ZzPAAZFmO4tzCdbl6TbRt0ifwtVJ5PzmanfEemhvf6+ph8
         SF9w==
X-Forwarded-Encrypted: i=1; AJvYcCVNQAPIw9BFPXuf2bGEt/Ud6s1A7OsEJ1nQ0HKnFlbnXT2FYJmrWZuonlZuAHHZfYelOP6nv6ZOby4rvd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB+b3YKkFaeDK1tpcX5I5TjUx2SsLxBd6aidGhfJVqRKmA9kFk
	JGsRtiOfGubQ2nIjIim+HeZ/8cN/Jgr02YO/aYQrkY5T5vs5UaEkHAD0oWbQpXpi2eY5RGftwHq
	3y8fIG9U=
X-Gm-Gg: ASbGncu96MuuF1t2S+NK2V/8V8uyVT+8IrTm19CAIPkzjDronMqXPpFs5Wvym21Q6wZ
	wM8iUA2nFO8YqLhDLR4kdNVlhSg/weyYMld3AMjfLfBkmsvP8IUQ+N+W7Ow7dpnX1Yfcmcer21P
	Pl3oUisByr2lvtdZwpIhpt7iO1Ez+j1EbIFiVgcujH4GsKE4LsmwAY19i4MeIfR82AHiHpi0YHL
	lIg3j7otMf8FnXXyYKH7Hwq3LoealGXuGhqhvJ5zq0/hAaDsT2Faakxh4iGRqpW8YVQh9qHOyHQ
	tWJ0wilJJoUWCLywPGMwDcB0kn9En6xDp9G4ZOhbbEOWM1ZRtcXfqBDirUBa/+PWU7IlpabRd5x
	+jRM=
X-Google-Smtp-Source: AGHT+IET2bsCbj+dVujY3wHHGG62OFluOs0XDlbwXtk0pkPLiLdQoxeL7nhZ/IHJzqKAfMjF3JcPmQ==
X-Received: by 2002:a17:90b:1d49:b0:312:639:a062 with SMTP id 98e67ed59e1d1-31250413c17mr18106763a91.16.1748842544238;
        Sun, 01 Jun 2025 22:35:44 -0700 (PDT)
Received: from localhost.localdomain ([117.251.222.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e30cbe6sm4836986a91.39.2025.06.01.22.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 22:35:43 -0700 (PDT)
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
To: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	herbert@gondor.apana.org.au,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Ruud.Derwig@synopsys.com,
	manjunath.hadli@vayavyalabs.com,
	adityak@vayavyalabs.com,
	Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Subject: [PATCH v3 6/6] Add SPAcc Kconfig and Makefile
Date: Mon,  2 Jun 2025 11:02:31 +0530
Message-Id: <20250602053231.403143-7-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250602053231.403143-1-pavitrakumarm@vayavyalabs.com>
References: <20250602053231.403143-1-pavitrakumarm@vayavyalabs.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Makefile and Kconfig for SPAcc driver.

Signed-off-by: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Acked-by: Ruud Derwig <Ruud.Derwig@synopsys.com>
---
 drivers/crypto/Kconfig            |   1 +
 drivers/crypto/Makefile           |   1 +
 drivers/crypto/dwc-spacc/Kconfig  | 103 ++++++++++++++++++++++++++++++
 drivers/crypto/dwc-spacc/Makefile |  16 +++++
 4 files changed, 121 insertions(+)
 create mode 100644 drivers/crypto/dwc-spacc/Kconfig
 create mode 100644 drivers/crypto/dwc-spacc/Makefile

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 5686369779be..f3074218a4de 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -754,6 +754,7 @@ config CRYPTO_DEV_BCM_SPU
 	  ahash, and aead algorithms with the kernel cryptographic API.
 
 source "drivers/crypto/stm32/Kconfig"
+source "drivers/crypto/dwc-spacc/Kconfig"
 
 config CRYPTO_DEV_SAFEXCEL
 	tristate "Inside Secure's SafeXcel cryptographic engine driver"
diff --git a/drivers/crypto/Makefile b/drivers/crypto/Makefile
index 22eadcc8f4a2..c933b309e359 100644
--- a/drivers/crypto/Makefile
+++ b/drivers/crypto/Makefile
@@ -43,6 +43,7 @@ obj-$(CONFIG_CRYPTO_DEV_BCM_SPU) += bcm/
 obj-y += inside-secure/
 obj-$(CONFIG_CRYPTO_DEV_ARTPEC6) += axis/
 obj-y += xilinx/
+obj-y += dwc-spacc/
 obj-y += hisilicon/
 obj-$(CONFIG_CRYPTO_DEV_AMLOGIC_GXL) += amlogic/
 obj-y += intel/
diff --git a/drivers/crypto/dwc-spacc/Kconfig b/drivers/crypto/dwc-spacc/Kconfig
new file mode 100644
index 000000000000..e43309fd76a3
--- /dev/null
+++ b/drivers/crypto/dwc-spacc/Kconfig
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config CRYPTO_DEV_SPACC
+	tristate "Support for dw_spacc Security Protocol Accelerator"
+	depends on HAS_DMA
+	default n
+
+	help
+	  This enables support for SPAcc Hardware Accelerator.
+
+config CRYPTO_DEV_SPACC_CIPHER
+	bool "Enable CIPHER functionality"
+	depends on CRYPTO_DEV_SPACC
+	default y
+	select CRYPTO_SKCIPHER
+	select CRYPTO_LIB_DES
+	select CRYPTO_AES
+	select CRYPTO_CBC
+	select CRYPTO_ECB
+	select CRYPTO_CTR
+	select CRYPTO_XTS
+	select CRYPTO_CTS
+	select CRYPTO_OFB
+	select CRYPTO_CFB
+	select CRYPTO_SM4_GENERIC
+	select CRYPTO_CHACHA20
+
+	help
+	  Say y to enable Cipher functionality of SPAcc.
+
+config CRYPTO_DEV_SPACC_HASH
+	bool "Enable HASH functionality"
+	depends on CRYPTO_DEV_SPACC
+	default y
+	select CRYPTO_HASH
+	select CRYPTO_SHA1
+	select CRYPTO_MD5
+	select CRYPTO_SHA256
+	select CRYPTO_SHA512
+	select CRYPTO_HMAC
+	select CRYPTO_SM3
+	select CRYPTO_CMAC
+	select CRYPTO_MICHAEL_MIC
+	select CRYPTO_XCBC
+	select CRYPTO_AES
+	select CRYPTO_SM4_GENERIC
+
+	help
+	  Say y to enable Hash functionality of SPAcc.
+
+config CRYPTO_DEV_SPACC_AEAD
+	bool "Enable AEAD functionality"
+	depends on CRYPTO_DEV_SPACC
+	default y
+	select CRYPTO_AEAD
+	select CRYPTO_AUTHENC
+	select CRYPTO_AES
+	select CRYPTO_SM4_GENERIC
+	select CRYPTO_CHACHAPOLY1305
+	select CRYPTO_GCM
+	select CRYPTO_CCM
+
+	help
+	  Say y to enable AEAD functionality of SPAcc.
+
+config CRYPTO_DEV_SPACC_AUTODETECT
+	bool "Enable Autodetect functionality"
+	depends on CRYPTO_DEV_SPACC
+	default y
+	help
+	  Say y to enable Autodetect functionality of SPAcc.
+
+config CRYPTO_DEV_SPACC_DEBUG_TRACE_IO
+	bool "Enable Trace MMIO reads/writes stats"
+	depends on CRYPTO_DEV_SPACC
+	default n
+	help
+	  Say y to enable Trace MMIO reads/writes stats.
+	  To Debug and trace IO register read/write oprations.
+
+config CRYPTO_DEV_SPACC_DEBUG_TRACE_DDT
+	bool "Enable Trace DDT entries stats"
+	default n
+	depends on CRYPTO_DEV_SPACC
+	help
+	  Say y to enable Enable DDT entry stats.
+	  To Debug and trace DDT opration
+
+config CRYPTO_DEV_SPACC_SECURE_MODE
+	bool "Enable Spacc secure mode stats"
+	default n
+	depends on CRYPTO_DEV_SPACC
+	help
+	  Say y to enable SPAcc secure modes stats.
+
+config CRYPTO_DEV_SPACC_PRIORITY
+	int "VSPACC priority value"
+	depends on CRYPTO_DEV_SPACC
+	range 0 15
+	default 1
+	help
+	  Default arbitration priority weight for this Virtual SPAcc instance.
+	  Hardware resets this to 1. Higher values means higher priority.
diff --git a/drivers/crypto/dwc-spacc/Makefile b/drivers/crypto/dwc-spacc/Makefile
new file mode 100644
index 000000000000..bf46c8e13a31
--- /dev/null
+++ b/drivers/crypto/dwc-spacc/Makefile
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_CRYPTO_DEV_SPACC) += snps-spacc.o
+snps-spacc-objs = spacc_hal.o spacc_core.o \
+spacc_manager.o spacc_interrupt.o spacc_device.o
+
+ifeq ($(CONFIG_CRYPTO_DEV_SPACC_HASH),y)
+snps-spacc-objs += spacc_ahash.o
+endif
+
+ifeq ($(CONFIG_CRYPTO_DEV_SPACC_CIPHER),y)
+snps-spacc-objs += spacc_skcipher.o
+endif
+
+ifeq ($(CONFIG_CRYPTO_DEV_SPACC_AEAD),y)
+snps-spacc-objs += spacc_aead.o
+endif
-- 
2.25.1

