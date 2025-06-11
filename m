Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154AB229B27
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623001; cv=none; b=qhJhx60zbIQC7RG3sPVO5ZNo7ZloZbuelbokBCrT6pgQs29pXJz8mNUzOkWxHq7UUXNpnVeWjj/PBDbQrAJtkLq5ik9UYnW8HHcTk61qgm3gvlUJ2yx40dUR+vk6Ktn2qrVibUW9nxtCYNKpsiikoyuTB/5hkE2ZMZaYDMwzdu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623001; c=relaxed/simple;
	bh=Ye4ZfiaWihO02YpFLTTLPq3t5G3QxU79yUJd03niZWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G2WkQe3sR2V439iKCPdcGusb8aCLOabEAPztiwUH89XJ4pOGxxJ5XZ/Q9zcVO/r+RT03cFXKd5EVwM67R0eq/uOew3dWSwZpBXdONcydDKdZYwu4m50cY6T/cR/Af9KKepIvOIeJnd2vug5ZZGCFfjUGI03E3mqcEdcwKW4baD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ZQUZxqjR; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ZQUZxqjR"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23508d30142so79207155ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749622999; x=1750227799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3K28ccsWlxMwqCRbaP9oqvPlrdelc8/pGL6q7Sf+y0A=;
        b=ZQUZxqjRZemVSFwQHx5IMUUa5M2XwvCOq7a3X2lY+EVNTyCnkPvv+xAZ0B3O3T4nt9
         /tVpkytAOeZSj8dWmSVbQU8jRyefdTNxXAHUtJ0MNVDMph4n05MBL4/60ceb3pWohN5a
         cYGFk1N1dZjytv95FvDmCXyEsHvS/CeKbEZidZELQj59I2meHw89tEHcw6Cw7yHjPCGR
         RuIsPpT+Wm+KFivkDVaUavmVSxrJYil4jA8s0TxNHWWkKEZRQEmY8WWBzOa49FkruhY/
         LZ6ge3FYgYj0u3sJzMrc2a7p+67eNQbK6IZprWYd2vVgDArrx4tl7DV/rJKHpdIKDzRF
         Ys8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622999; x=1750227799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3K28ccsWlxMwqCRbaP9oqvPlrdelc8/pGL6q7Sf+y0A=;
        b=YJjlU+USA2zqjlO0h+CxLZbZfoUJttMo2J1yekxJXXkWzWODrw2dpG8pKl6OqzlDfh
         /6DClB7xglqF/Qyhx7kAho607Awqgxz95/+GQW7snswTcDJf6Rz4zi/aHdhTXCGv3kuF
         Tt6Pe7osLKVpuyeuuSHAch+DhPsPxNXj8B0ZGn1nC8AMpEHfppAkkCiL2/DU/ediwsr2
         OZGLe3b+7aN9gnOg6NVL/VQFMFrVy5YNVzV+kmNhy5Ffcco6mqC5SueUVzabijXPvPZF
         ec6XC70uIbOKrKVRhZ5ftGIU54WoBvXA93qSQESMfKVKW7AzCZVUzsjZPTkF1eVdxiXl
         m74A==
X-Forwarded-Encrypted: i=1; AJvYcCXTyb4bint2W6QJfx43aeRshARAGPx3AjDp/e1zrspiO2w5GZ3BqNZFyIX840J588Aci096BWxhJXFULyw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE5QjgEqmAE1H7qc7Sp/6lNiXLf6QZsBGPPCyyengZ2TWim218
	AcErMvizbtfyulxrmogzPoztnMciynD+a3tyxh+/Y+apatJ85h38PfKf+tuywbRPpKI=
X-Gm-Gg: ASbGncuhp3Bnbb3dPavkLrhgzc48FovT0m+lHKjjjTU9Je3EfS78oHTGywCbct89VUP
	yNpxGlS8Lsj6OudZp7l0lqJwUyqpzQt8gxVy5l+2mv/AvP8+JLYhAT1J8s51OMCEEG2lr27dVGG
	rupntSYzLncERxOJvlwJAWUa5JNisCtavzJ+3V9OcL8YVsQArCEDH1JRBRWHbdyyysGf8yRy8C8
	Avb2WSXgEpYiQcSPB04Zl8+zss4MO+SV32JOCF1AyNlANpnkc3xyncCPH7CaX9vvN9iFNzGuPsw
	uhMuSFuSwbW2WSn6UToouaz4ZhC4HtH3HvcmA/eNi7E6mlP7q6nUJZNlIMblvsoTZ18XefwRvGg
	RVR7r9m4HHiLzuzMFndVsTizh+A==
X-Google-Smtp-Source: AGHT+IHLDZwFxM0MKNLl6ed9TvPphtVlyXYtS+o1/xlJG/p+4dis78BCknfh/vBsGOTDe6Pt8koHtA==
X-Received: by 2002:a17:902:f645:b0:235:2403:77b6 with SMTP id d9443c01a7336-236426b4fb1mr22190665ad.37.1749622999268;
        Tue, 10 Jun 2025 23:23:19 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:23:18 -0700 (PDT)
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
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v5 03/23] RISC-V: Add defines for the SBI message proxy extension
Date: Wed, 11 Jun 2025 11:52:18 +0530
Message-ID: <20250611062238.636753-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add defines for the new SBI message proxy extension which is part
of the SBI v3.0 specification.

Co-developed-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 61 ++++++++++++++++++++++++++++++++++++
 include/linux/wordpart.h     |  8 +++++
 2 files changed, 69 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 341e74238aa0..cb89cd784a4d 100644
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
@@ -430,6 +432,65 @@ enum sbi_fwft_feature_t {
 
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

