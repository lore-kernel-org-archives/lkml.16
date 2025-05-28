Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C773170826;
	Wed, 28 May 2025 00:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748393399; cv=none; b=MynZ4C0BvcI3cJdoXaUUk2feYwqLF5NDTMU6h4RJH5iDCOHfe6NXRxI2CNElypZmProlS51o4bfzRKDhclBbN7rha0uZAEYZ20dsE0dbdbar4kzMLRZG9KdlvC8CX71vVtajjbsGtyqlTrvt9yJemnzZez2PE7MFKRwTRFY4TTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748393399; c=relaxed/simple;
	bh=/5lfl4YMBtT4VjHrL3cDodoOP3+KO7dMgma1/FNXdGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TnvYGBx5ztDi8yrBVRJXWHCR7zTvVhMYTz3ZykFYdMWSOeQ6mVncJ1pxi1swUNXv77FNTbFbaP/nWtRfPCREse2OzBmOSrwt4KrXTLsbAHN0kCtETqEUCr6/8yRyOL+3BPeC3qsMWwuwu4MxaGr3Vkw9RLrDU4TCXp2sJhCj9ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j2EW4H6B; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2EW4H6B"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so27727195e9.3;
        Tue, 27 May 2025 17:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748393396; x=1748998196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEwZS6EEDxaSd57QrdCjYZSKZxAYb+pQ2zUGtVy10TE=;
        b=j2EW4H6B62GO92p+PM9M5cqlhVmD2yGgsnpp6HYSYBxqrWq85mR93+k3VWC6uzJhWk
         itvmZz4tSwWsaYK317vyy1u+gF7ab83qWL7mzu83eoydVu5mjztJy9XB9WQphFmSuLra
         Jc7JtHSbi58ZGidxYQoYRrhg1afeLZYyb78z9jEZLD4SDWEtfvvodq5Qxkxl0LLR5R+j
         EQOY2vQzG+xpk1YASPehF1oDkfqkDAfKdmpdfwPLkZVEFOn5BOZIK8Orhyy/OjE2xTtr
         M8MDMucqcAAdHMbZcYFYjwCA6xFUX1RUJ87oFmW4vLFBgxOljwIViOeZkMSogmw0rTTL
         gWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748393396; x=1748998196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEwZS6EEDxaSd57QrdCjYZSKZxAYb+pQ2zUGtVy10TE=;
        b=uOJY6bci2bZF+3LMAOdb/yehbb2UtztlKSNmrFN2h8UnaAcppK/aDpJosxya3apnwx
         TpshSfL+sPfSTdMNlEOBW8aAkARCQn2NEeSG6cuvPE6uIs2GsYqh96BORw3Bsrt/+Wph
         GFov4/AjDc37oL32ooPy6GUstDxFntldxqclxC9XI1sc23yqY83zONLHTdFZZZbHSOlc
         wto5etiEmQ2pwiNoVfwg/iB5SMyLcfhnTd9sab0RtEDsZ62onSOlQaNFIlw5mwunGigO
         1UJPIcATCqu4ZtYGBk01aby7n7e90d88cUlzKLmAX6qF1ZiMnBu5zxL8fcd6pSqE73ML
         jObA==
X-Forwarded-Encrypted: i=1; AJvYcCV5Zivy87PcrQtj4OM0ChlSpUuc0INtqQKNu6XnOmo5n9m4iVSDJup7XhadByeOqXd+5JdFw/PimLXz@vger.kernel.org, AJvYcCVh8tEsDkeXBIuNcPf0ams/ReptD1+KStKx1LQaA4JPZ9Ifqb5vRYx715cqiUTayWeNIQ9UO9FvwJ9ZYe3L@vger.kernel.org, AJvYcCWpijy04dFyvripQtOuGV6rCnr+7fksdxXkq9l90ME9f7hhc3iF0B+bqaHNCqmLwzA5KkMmS+2uiep/@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdz5mhQkcffuldYc7SncNbmQk8zBg9w4HkKpRfHNwZDRXp4mZ1
	T12ZapePBFwdHy51NZGlfL7mwX+Yh0d92BT47DUpd0ifG0TAu++PFRU6
X-Gm-Gg: ASbGncsdUQ/JUCiOcNLKaiTtOyJvFkikYFRvHgcFu8iCoT5ZvhTDeNbAHYW7DeGwdcZ
	n6r2g3xmn3vqpIK7m3S5hr4oNLTsZMUXhZhKBsp0GOxzpliO1Okb+m0vraC5y19CDdMEkebfjYL
	JEioJ7GuXw+zx1xu+/UgR79EHBx9sq5H0fx51Ffro7aGzmmPAlii7BjkbV8y061jl4+4yf07EGl
	LwxwfOj7MOLHcd9CYIPTeMlPuwT60E40S445oWw3D/REGFu8bV3Q0b0nAhw6vMF0C6hdJITkhHR
	k8BjzYyuD7+I2s760NUNBEsiREmybONy0W13ccAiCmemOhaX8finz1HXvZkkvfirX7gK4jBN7HV
	/8XZDPXBksqMmQLYYZvrB
X-Google-Smtp-Source: AGHT+IFde3cl89AG3OPln2YmH8CB1MFWeEQE8H1EKmFZelowv8WMNNox81qLiH4tHIyMj8nfAhcduQ==
X-Received: by 2002:a05:600c:1e1c:b0:444:c28f:e818 with SMTP id 5b1f17b1804b1-44c9493e382mr140841865e9.26.1748393395686;
        Tue, 27 May 2025 17:49:55 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-44fccee6c54sm33682535e9.1.2025.05.27.17.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 17:49:54 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 3/5] dt-bindings: reset: add binding for Airoha AN7583 SoC reset
Date: Wed, 28 May 2025 02:49:16 +0200
Message-ID: <20250528004924.19970-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250528004924.19970-1-ansuelsmth@gmail.com>
References: <20250528004924.19970-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for Airoha AN7583 SoC Resets. These are very similar to
EN7581 but lack some specific reset line hence the order is different
and a dedicated binding is needed.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../dt-bindings/reset/airoha,an7583-reset.h   | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

diff --git a/include/dt-bindings/reset/airoha,an7583-reset.h b/include/dt-bindings/reset/airoha,an7583-reset.h
new file mode 100644
index 000000000000..96cfe11d2943
--- /dev/null
+++ b/include/dt-bindings/reset/airoha,an7583-reset.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024 AIROHA Inc
+ * Author: Christian Marangi <ansuelsmth@gmail.com>
+ */
+
+#ifndef __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_
+#define __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_
+
+/* RST_CTRL2 */
+#define AN7583_XPON_PHY_RST		 0
+#define AN7583_GPON_OLT_RST		 1
+#define AN7583_CPU_TIMER2_RST		 2
+#define AN7583_HSUART_RST		 3
+#define AN7583_UART4_RST		 4
+#define AN7583_UART5_RST		 5
+#define AN7583_I2C2_RST			 6
+#define AN7583_XSI_MAC_RST		 7
+#define AN7583_XSI_PHY_RST		 8
+#define AN7583_NPU_RST			 9
+#define AN7583_TRNG_MSTART_RST		10
+#define AN7583_DUAL_HSI0_RST		11
+#define AN7583_DUAL_HSI1_RST		12
+#define AN7583_DUAL_HSI0_MAC_RST	13
+#define AN7583_DUAL_HSI1_MAC_RST	14
+#define AN7583_WDMA_RST			15
+#define AN7583_WOE0_RST			16
+#define AN7583_HSDMA_RST		17
+#define AN7583_TDMA_RST			18
+#define AN7583_EMMC_RST			19
+#define AN7583_SOE_RST			20
+#define AN7583_XFP_MAC_RST		21
+#define AN7583_MDIO0                    22
+#define AN7583_MDIO1                    23
+/* RST_CTRL1 */
+#define AN7583_PCM1_ZSI_ISI_RST		24
+#define AN7583_FE_PDMA_RST		25
+#define AN7583_FE_QDMA_RST		26
+#define AN7583_PCM_SPIWP_RST		27
+#define AN7583_CRYPTO_RST		28
+#define AN7583_TIMER_RST		29
+#define AN7583_PCM1_RST			30
+#define AN7583_UART_RST			31
+#define AN7583_GPIO_RST			32
+#define AN7583_GDMA_RST			33
+#define AN7583_I2C_MASTER_RST		34
+#define AN7583_PCM2_ZSI_ISI_RST		35
+#define AN7583_SFC_RST			36
+#define AN7583_UART2_RST		37
+#define AN7583_GDMP_RST			38
+#define AN7583_FE_RST			39
+#define AN7583_USB_HOST_P0_RST		40
+#define AN7583_GSW_RST			41
+#define AN7583_SFC2_PCM_RST		42
+#define AN7583_PCIE0_RST		43
+#define AN7583_PCIE1_RST		44
+#define AN7583_CPU_TIMER_RST		45
+#define AN7583_PCIE_HB_RST		46
+#define AN7583_XPON_MAC_RST		47
+
+#endif /* __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_ */
-- 
2.48.1

