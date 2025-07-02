Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551CD1FC0E3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 05:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433271; cv=none; b=c8JZ6KbAnNZ2zr/gHt0BVmrF66lamPzVDCcmXy6elRHtZrYmkN9D4R6wQgF5JfcWE3pdSrNIAYhqFN+ieaMNzuqCJzdwU2/144XAE2dyP3LKdSuv7P0IPyJmuFVkEgF4TV4UYMdPi+wiTi9WhdFc6+0kQPub5pTcPSdn2cJu10A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433271; c=relaxed/simple;
	bh=WhFOZeO6QPZYot9X8PgUO7X8WeF9pMZndeU1I3waGkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tFsu5J46XsXVjlvBMbm7HEU+hb6GzdoUd0yrGJJKmxaEnjdyAIq6TxD8js+YFAakGQfxThbwKVczYWOTZfz04XrdEJatHt6oRbGeMAeJo7BdSasm1GhO/9+/MJJYfQ/BXMeuoSF2BsC5h6tq3PMy6JDJ3tOtZQFxL4NInDExD+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=dPKRXDaZ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="dPKRXDaZ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-236470b2dceso34023815ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 22:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433270; x=1752038070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sxHWlmZntdYALz3N2e235Pk7qD/y6rLx7JLAfVbzfY=;
        b=dPKRXDaZhZgKu3RHThxsvzEhuNVWzqs1K4jFboGj1OOq8XV9/66cN/Er9hW4z/wZsH
         06NGXZcY02ZIFLCj39EKHdljk7OrtCDdfM9KMEcoZnSMURtrz0x2jxNz6kktcmZNgK0t
         5ce7PBNDXbxOs6SRZd+zcjN7XEmXmLhKFl2UvnZItjU/VlNYna2ekVHIGyw8LJSWBZ9K
         5+VnA0UckOMl181jfKKAERqGpz6LIrWqsit0hOSrc+JL0WMVb9nQYVCcOCOEaKP8IWQp
         mkCEiZ7YKOTkfGlkM5QQexcjKJEgwONGQxOV/I7xZXZyHFATkVbOuMvYmY8KRBuhVdPq
         0D/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433270; x=1752038070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sxHWlmZntdYALz3N2e235Pk7qD/y6rLx7JLAfVbzfY=;
        b=Y7deTNP8K/FhCFWBtJEFLuhoe/P9O9aslyVBw+gJ9iJXm+Dzn+WOCt/tLfoos0Ks3m
         ibeoe8wOQGZoNjtk6HjfYp4FTc/2QHrP5M8xcG7TNnBR6WYu4XTLaUV8ICWA4KldVHO0
         2VkqfWX2c9Q1YxDAIUMzYL9AW8EgLunGH3Xch9c7EOKBv1NwZbkH4umWG7QjIUbyvdNX
         zkPqwokxDh9qXzU5JYTPDMC560PTtypyRAv3jPlGDzz3BXaOJeFBa2CHtT4AKh6E0ryh
         SlZcZuhpS6tkRRVa6u0x5itDQCs6Q8SaOVBkx6ZU770mMTpmIliV5tdaC/7cNUg10JRt
         DN1g==
X-Forwarded-Encrypted: i=1; AJvYcCWrCO5unGW5hpHjBNu5ENydNEItKR7e3j9drWSxJ/XbxABSdBGvts/KpO79OHsJOihBy+VqTecUQL/o+YI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHi+/2YXOeLtS7+Iqsy1PNC635gwfIBQVJMRJZlwuKbcfvRGVd
	hAjHuz91huDzEh8f2ioWnPigohEZEzABRZvCXKc+BYSMKRx40kRShueugiMFGzZbQPrBKuGmj7R
	dyRf3
X-Gm-Gg: ASbGnctAb9sMZ5X48kgc3Cf6Up9rHB9jSAsi4Q8jOeT0SPucxYDWYcG2x/kw3oh/McQ
	Z3JZYm/teKkeUgrKGXFneVXjNrSW0iOEdqX4lukoVLW1JtT3sZx3TSKToBVNoMqkp71gI6S2P55
	UdtKoQjtT3VmNzcYlMDe9Rbjcu6JzVV2WDvM51wfTKfZfz2cL1QPhZKSBvfk3kWzP0Bs6W/0PWU
	ETHxo+ZOwlHvtsjXHfdssTjqAj9wnt6GYRZrLzAPDypRdAbOOirVW5QITH6bzPa3M5lrCZznG4T
	BaGJQIrOZVTsTpvMG7zleVcF2idHHIMdfm5UcIL1gjwlJsp0oNvsr/9T/rfIZqhVPvOCofGdy/V
	+EeQsryekCFz9KBwh
X-Google-Smtp-Source: AGHT+IHMGd/9qBl/omjJ5870DXltKh0wARVvx5nQ5ubBQ6cP0FDKJQIwjqOoR2ghmUNQi63Y0l8eoA==
X-Received: by 2002:a17:902:ced1:b0:231:c9bb:60fd with SMTP id d9443c01a7336-23c6e58accdmr22920115ad.33.1751433269504;
        Tue, 01 Jul 2025 22:14:29 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:14:29 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Len Brown <lenb@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v7 03/24] RISC-V: Add defines for the SBI message proxy extension
Date: Wed,  2 Jul 2025 10:43:24 +0530
Message-ID: <20250702051345.1460497-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add defines for the new SBI message proxy extension which is part
of the SBI v3.0 specification.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Co-developed-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 63 ++++++++++++++++++++++++++++++++++++
 include/linux/wordpart.h     |  8 +++++
 2 files changed, 71 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 341e74238aa0..59a7285ff956 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -10,6 +10,7 @@
 #include <linux/types.h>
 #include <linux/cpumask.h>
 #include <linux/jump_label.h>
+#include <linux/wordpart.h>
 
 #ifdef CONFIG_RISCV_SBI
 enum sbi_ext_id {
@@ -36,6 +37,7 @@ enum sbi_ext_id {
 	SBI_EXT_STA = 0x535441,
 	SBI_EXT_NACL = 0x4E41434C,
 	SBI_EXT_FWFT = 0x46574654,
+	SBI_EXT_MPXY = 0x4D505859,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -430,6 +432,67 @@ enum sbi_fwft_feature_t {
 
 #define SBI_FWFT_SET_FLAG_LOCK			BIT(0)
 
+enum sbi_ext_mpxy_fid {
+	SBI_EXT_MPXY_GET_SHMEM_SIZE,
+	SBI_EXT_MPXY_SET_SHMEM,
+	SBI_EXT_MPXY_GET_CHANNEL_IDS,
+	SBI_EXT_MPXY_READ_ATTRS,
+	SBI_EXT_MPXY_WRITE_ATTRS,
+	SBI_EXT_MPXY_SEND_MSG_WITH_RESP,
+	SBI_EXT_MPXY_SEND_MSG_WITHOUT_RESP,
+	SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS
+};
+
+enum sbi_mpxy_attribute_id {
+	/* Standard channel attributes managed by MPXY framework */
+	SBI_MPXY_ATTR_MSG_PROT_ID		= 0x00000000,
+	SBI_MPXY_ATTR_MSG_PROT_VER		= 0x00000001,
+	SBI_MPXY_ATTR_MSG_MAX_LEN		= 0x00000002,
+	SBI_MPXY_ATTR_MSG_SEND_TIMEOUT		= 0x00000003,
+	SBI_MPXY_ATTR_MSG_COMPLETION_TIMEOUT	= 0x00000004,
+	SBI_MPXY_ATTR_CHANNEL_CAPABILITY	= 0x00000005,
+	SBI_MPXY_ATTR_SSE_EVENT_ID		= 0x00000006,
+	SBI_MPXY_ATTR_MSI_CONTROL		= 0x00000007,
+	SBI_MPXY_ATTR_MSI_ADDR_LO		= 0x00000008,
+	SBI_MPXY_ATTR_MSI_ADDR_HI		= 0x00000009,
+	SBI_MPXY_ATTR_MSI_DATA			= 0x0000000A,
+	SBI_MPXY_ATTR_EVENTS_STATE_CONTROL	= 0x0000000B,
+	SBI_MPXY_ATTR_STD_ATTR_MAX_IDX,
+	/*
+	 * Message protocol specific attributes, managed by
+	 * the message protocol specification.
+	 */
+	SBI_MPXY_ATTR_MSGPROTO_ATTR_START	= 0x80000000,
+	SBI_MPXY_ATTR_MSGPROTO_ATTR_END		= 0xffffffff
+};
+
+/* Possible values of MSG_PROT_ID attribute */
+enum sbi_mpxy_msgproto_id {
+	SBI_MPXY_MSGPROTO_RPMI_ID = 0x0
+};
+
+/* RPMI message protocol specific MPXY attributes */
+enum sbi_mpxy_rpmi_attribute_id {
+	SBI_MPXY_RPMI_ATTR_SERVICEGROUP_ID = SBI_MPXY_ATTR_MSGPROTO_ATTR_START,
+	SBI_MPXY_RPMI_ATTR_SERVICEGROUP_VERSION,
+	SBI_MPXY_RPMI_ATTR_IMPL_ID,
+	SBI_MPXY_RPMI_ATTR_IMPL_VERSION,
+	SBI_MPXY_RPMI_ATTR_MAX_ID
+};
+
+/* Encoding of MSG_PROT_VER attribute */
+#define SBI_MPXY_MSG_PROT_VER_MAJOR(__ver)	upper_16_bits(__ver)
+#define SBI_MPXY_MSG_PROT_VER_MINOR(__ver)	lower_16_bits(__ver)
+#define SBI_MPXY_MSG_PROT_MKVER(__maj, __min)	make_u32_from_two_u16(__maj, __min)
+
+/* Capabilities available through CHANNEL_CAPABILITY attribute */
+#define SBI_MPXY_CHAN_CAP_MSI			BIT(0)
+#define SBI_MPXY_CHAN_CAP_SSE			BIT(1)
+#define SBI_MPXY_CHAN_CAP_EVENTS_STATE		BIT(2)
+#define SBI_MPXY_CHAN_CAP_SEND_WITH_RESP	BIT(3)
+#define SBI_MPXY_CHAN_CAP_SEND_WITHOUT_RESP	BIT(4)
+#define SBI_MPXY_CHAN_CAP_GET_NOTIFICATIONS	BIT(5)
+
 /* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
diff --git a/include/linux/wordpart.h b/include/linux/wordpart.h
index 5a7b97bb7c95..ed8717730037 100644
--- a/include/linux/wordpart.h
+++ b/include/linux/wordpart.h
@@ -31,6 +31,14 @@
  */
 #define lower_16_bits(n) ((u16)((n) & 0xffff))
 
+/**
+ * make_u32_from_two_u16 - return u32 number by combining
+ * two u16 numbers.
+ * @hi: upper 16 bit number
+ * @lo: lower 16 bit number
+ */
+#define make_u32_from_two_u16(hi, lo)	(((u32)(hi) << 16) | (u32)(lo))
+
 /**
  * REPEAT_BYTE - repeat the value @x multiple times as an unsigned long value
  * @x: value to repeat
-- 
2.43.0

