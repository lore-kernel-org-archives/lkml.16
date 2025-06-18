Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7844B2E267E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248884; cv=none; b=a4jrAthRWgmNiwfGZUkfPk6ZnazVK+DlTR3HvoydMEuRvpS3q1yVwW2ohjJENwBNIgIaJcMKp7KUojzK4Mi+g8ZT1pC0e3DGKbtoNfsEdFD5v3nh87cMESwtrYOcx0jw7Tt27uNBrnVV69wKE7O+vRWJNkglw0lvR5hp+acRaOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248884; c=relaxed/simple;
	bh=eDNnGBkTf0Y5fws6LhOepKDma0EWdw+271uEbOW9qV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qEPVN9XCG5ywl6lTuHgqCkSg/u1G64TmZjPvsNX1JntZDtbHMnD4nZA17NjLku4Pupcqd7z5QXZYP2M6r8L6ipCiGjL4y4iDMlj3ecpxut5rgEvc6dSQnjbhUJjdPeMOR5uTUCT3Jp2zgC3r/aN4fh3Act7of+/GqkzLWF32EKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=XHhA7NPF; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="XHhA7NPF"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b271f3ae786so5020094a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248882; x=1750853682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXsaU5bufMYm3XYxPsa+imfe1GGPBzMdyNVNNOxnCRU=;
        b=XHhA7NPFwpehY5KaKM3HO/EUpWL+R/IGCGYL4o4faWaHJGEnlqDptK7pbUIE71MA2g
         UB2qEJuoppIvgXjbl8520YQGeMWh1Xr83z/CR/H/sBXt5GuCAOD6tto3xzKkDUlowV0w
         JDgqNmGsLeys+1w8+q3kVb80r0ed7G2ysoQriIsskztuZAGf40pE/Iz+Y0LNIZ14zQxc
         DeHeyYCJvQGzLWpfyqJ31kXOJMmdzPSXDshSOw+jd2ye+URsue+RHNBM9Ih9mjFR8IbO
         iTNWcQt2zUzNJQWe29sDkb/raiTCOEHRzUUrDJ3mxhJaupjVUTxCtrTowZFMOXERH0fr
         gjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248882; x=1750853682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nXsaU5bufMYm3XYxPsa+imfe1GGPBzMdyNVNNOxnCRU=;
        b=Bs6ktuve7nxoydhBQtTGmHOOha30QSZCc1BsZ62eJgXsyCnhl8s7aEcKAwsOWinmzL
         TUHYOLUGegE4b3poP41HrHfRDC2bUo1o2pveswYNd4/f713ENBJa1mV+bg43JfneJNKG
         +8F0QaZ5tLFaHnbdgN1ZVkUcXG+NyWkozMgY2RrDAQuHIe3rxJ/OiyLUS72SHsYRfPy+
         CoTqVtwe0R0savvd4rRFpN8gew8kbn4GRFEElRvIfXOzvn2RlL/VbxLPcjCE1WsmHLfJ
         zM3jKjaAi4HJy5635T4rnGS+2U80tb2YTPd5Dc6GHD8aFsMP5RlDQKaM5KL1+MPXtEXA
         BkcA==
X-Forwarded-Encrypted: i=1; AJvYcCWUDMyEPZLTGd8gAclB3xIFIt+Z0pY+KeZCNP57BCgGdBy5uRy9M1tZE1vhxpo1Sgqcmlk8paCiFiiveHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPEAXr81pFwXAjAxbF2l3JNPssm/kJl0xWQnIQRPXzvsGXynUP
	pIH42+Tyiq5VuXqIH53nOADrXy0OZqnvuvzr5QWmYeTXhvCgaA49iKeSSM5dp7eA4m4=
X-Gm-Gg: ASbGncuxN6LMy3j+Z/TrIKq/FvV021kPvZvC59dKPv385jQunudaUv7XC+kifhWA7NE
	5/C6aFLo2jOMbQ7PbBv3Ddwj9c9oZ6nQi9YrgvU+Q5kAtyKaWD/tJ8j4/OesF4mUa4m5JTR84vD
	4yQUI6Lt0U+R8dqW5YLcy13IRymundNBImXIQZj95ACa+6evoAcpwU+Dca/DefbFcdGnFXWY6sp
	EKohICfKNNa3/d7jG1FR16BDvG5UaJhD9enIHCMyIR4iLLk6DgpBwBsEDJrCLzGrpbNSX+iNDMf
	i4WkmHsZxTil81oScuDK5PB5OJp9wZ4iT45iV/cRCK5q2l9gw9Dk/7X7BdwH+5JtAcaNTAVHZ8X
	eoTIlr9nm250ZvODpEBXOPdfdbzR/
X-Google-Smtp-Source: AGHT+IHDAt6S+LCqNlP/AcoJd0DtxuOspyynusq6LumWUM8AG0KDy5DjUm6vNvbZrBQI2+c48YQfNA==
X-Received: by 2002:a05:6a21:9006:b0:21c:fa68:b47c with SMTP id adf61e73a8af0-21fbd4d5478mr26347574637.18.1750248881659;
        Wed, 18 Jun 2025 05:14:41 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:14:41 -0700 (PDT)
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
Subject: [PATCH v6 03/23] RISC-V: Add defines for the SBI message proxy extension
Date: Wed, 18 Jun 2025 17:43:38 +0530
Message-ID: <20250618121358.503781-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
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

