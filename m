Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413CE256C99
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 13:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970840; cv=none; b=P9eu9FZ9hh6GsSbudtxD7eyBk9yR64wjNSwx6I6T7EETEqbbPX3jEm4WTgu6geTTU0SpxRvQfohSDkc+fBnfMP0OIBqCAWoTAL/WMJULHek8DygxKuuCBLMqevwppasTJsMsazLy3psO0Irh7nG+LpYGSmrR41upMrl2gHY6eK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970840; c=relaxed/simple;
	bh=fKLluswzTa56gHUFwQvXEf5D8fw4b1KiETn3nSG7kY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CqCBEESjYATtTv7/+kZGuVsCli5Ax0jDqX7TJ88Gj/XQxJrvN8BSb9cuGX5LuF1UR+EOQGrUuComQT95mNThbFelBE/AXILluSHHvTUqHJHengixXvCT3d77HSJk973R4g5Qktm+4qk7rqCp35EwW5mQkXOcKla5XTr1fVtKDTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=mulF8EG1; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="mulF8EG1"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22fa47f295aso22469655ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 06:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970838; x=1747575638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxTPUwSNoQG9w3qR3LtIgBXvV+xInFFIHYJOltRLchg=;
        b=mulF8EG1Oivs2iD4DHOeqSs3Y/9IqHxLENpZC7WGZEGfVJktolBoXUGR1jpEw9teIg
         Q5+6Y+fGMdmkp/4ZYKhIT+eapESVXCuSc1cC1kRLMpo7SC8pu+q9XYy0UEgAr8AXdsqJ
         sUMaSBiNjU4VqmE1w+DMQL5xdzf1Nzz1DxuiN8Ep08mxHo7tjrXgzJMgKTYieaxjsAhn
         4xYHOJDPUVjYXhlk4PjjjzOTDPs9lsMtO4FwxcQNlwxVVLdWF63yGIS+rkosmb2T+2jR
         scmWJXdyru62e3Aial4tCZCl/IeDPNATkMra7fXushG98wAzBVdkdE8zDhyC8nXI9y3B
         MOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970838; x=1747575638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxTPUwSNoQG9w3qR3LtIgBXvV+xInFFIHYJOltRLchg=;
        b=WQZqnHeO++IdkZhIWfFU7D0Nryc448Qird3Xr+wK6W+DnWg/eYboWiDTuez7Y+r0N2
         2oZlSuRAWG1aXLxh0YcmlwJW4pfRdZUOALlYJc+hbRHztrV2vOtohuu77gGF6ZMMJX0A
         S14debg1vO+cCLx5gyxqMTbqYfsbIXi84vNeMpYRGssDK1AeAmCkrxFL17fSuMuq1VwT
         MqGL56dSyeycqiUteIiSxlB+cZ4EhDuQgUXlCjHHIkgZ8VKi624iPpeU/Q5gpl8wTbSR
         ZpglU+UT7F0qo7NVRFzRzISdzcIiL5IADRXXb+gNMx4/EMKAI65+3MOq8K7B0D0qlo4W
         ROvw==
X-Forwarded-Encrypted: i=1; AJvYcCU4arWh8bXXRGBEY4NkSK86dhrNSniC/AKBb2WuOMtP4Rme1g99vK/hOo5C4BofoKk/e/WFaaQpa0cePsc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwegviDHVnjr5gf7XbmN5T76Ubezk/bI6DdBHpmCMgFWMtHj8iT
	RTLGjfFYPFdfayPJJHe136lLmFR1gRfWiqQda7gN+HUd1LCnliVzi9+qUCasmH8=
X-Gm-Gg: ASbGncvOWSFD3Ddh35/ZRk6/JCCa2sWEN9UUYP7947NQo0LmgmN3Up5KvrPEayCGbtu
	bzP1ciEf33VgG4QsIGIGNP7MzyKBVi2XxrLdNIh/iIP6fWPIcl/7V5YOJROEuecPWTMBiR2E3eW
	6Eya6SRP4Ww1gRZjJy7+xZAFQ69KuEAFGLdW3IYTUtcGJp8P21HMzGnSG2q9iC2QnwNq5DxCNsC
	x5hs4GE86tYHNALpb7oYHzgFH6wr3wRJ9jxCdJO/Ap0d0ilMmEnZ7tM1VY48av0KX5dHKKCNkGN
	kKk+bs1U77a6x/rZXspkqu9w0pYALfnc0PTrVUEzNUFSiRZ0KTYwrLoytulz9i7i7X2ksV2cRIy
	wQmqB3joSuMYsiw==
X-Google-Smtp-Source: AGHT+IHA3PsXqyuN65sUtIV2Ta99+xXozSEhh2Q4R2ahfGnFgJSheXDWuFscswXV0+c2V15ebDTDaw==
X-Received: by 2002:a17:902:d581:b0:21f:1549:a563 with SMTP id d9443c01a7336-22fc8b0cbbbmr134190455ad.2.1746970838172;
        Sun, 11 May 2025 06:40:38 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:40:37 -0700 (PDT)
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
Subject: [PATCH v3 04/23] RISC-V: Add defines for the SBI message proxy extension
Date: Sun, 11 May 2025 19:09:20 +0530
Message-ID: <20250511133939.801777-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
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
 arch/riscv/include/asm/sbi.h | 60 ++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 4dd6aafb8468..d295c26a7c26 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -35,6 +35,7 @@ enum sbi_ext_id {
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_STA = 0x535441,
 	SBI_EXT_NACL = 0x4E41434C,
+	SBI_EXT_MPXY = 0x4D505859,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -402,6 +403,65 @@ enum sbi_ext_nacl_feature {
 #define SBI_NACL_SHMEM_SRET_X(__i)		((__riscv_xlen / 8) * (__i))
 #define SBI_NACL_SHMEM_SRET_X_LAST		31
 
+enum sbi_ext_mpxy_fid {
+	SBI_EXT_MPXY_GET_SHMEM_SIZE,
+	SBI_EXT_MPXY_SET_SHMEM,
+	SBI_EXT_MPXY_GET_CHANNEL_IDS,
+	SBI_EXT_MPXY_READ_ATTRS,
+	SBI_EXT_MPXY_WRITE_ATTRS,
+	SBI_EXT_MPXY_SEND_MSG_WITH_RESP,
+	SBI_EXT_MPXY_SEND_MSG_WITHOUT_RESP,
+	SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS,
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
+	SBI_MPXY_MSGPROTO_RPMI_ID = 0x0,
+};
+
+/** RPMI message protocol specific MPXY attributes */
+enum sbi_mpxy_rpmi_attribute_id {
+	SBI_MPXY_RPMI_ATTR_SERVICEGROUP_ID = SBI_MPXY_ATTR_MSGPROTO_ATTR_START,
+	SBI_MPXY_RPMI_ATTR_SERVICEGROUP_VERSION,
+	SBI_MPXY_RPMI_ATTR_MAX_ID,
+};
+
+/* Encoding of MSG_PROT_VER attribute */
+#define SBI_MPXY_MSG_PROT_VER_MAJOR(__ver)	(((__ver) >> 16) & 0xffff)
+#define SBI_MPXY_MSG_PROT_VER_MINOR(__ver)	((__ver) & 0xffff)
+#define SBI_MPXY_MSG_PROT_MKVER(__maj, __min)	(((__maj) << 16) | (__min))
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
-- 
2.43.0

