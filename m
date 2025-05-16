Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED98248872
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747364744; cv=none; b=XupCAAS6xzTKnK5Rg87I+D/7LazrEcHZct9NlG6rg7RVjNV0GVk+4yo6EiUA0JFuicDRItTdFU7ui+knNYnx0edvSIawrQliS+w80OKFkfwffLCjMYcjg85KbXjwXt57WtZerf3r8J+kC0PaWvp+uPgu4S4QEO0bTBiuWgVNq+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747364744; c=relaxed/simple;
	bh=SJyGNr6paspHqClO15IcSsmeN8j2SgCuQFiwXWo4W3o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b6mBCxQ0UFTuAQvyX8GTHhBRYlLH6FO7HFKcKjTJbmZTwt7ymH/ZRphcA85Z2mDt7sBzmm3RDdYHIu4BjLR7Et2KSL3vnvHGfP0AitFmqqPI6s11k1LCuGljWGAugIIWBfWCL0xUs/QdT6YG18vB+uaIsvKJc3YkG43gsPWywHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=UjsgheEZ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="UjsgheEZ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22c33677183so15632195ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364742; x=1747969542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6ciFGfibwQSe7Dz2z8LF3Oi63gmDdi7aOYsraaH6S0=;
        b=UjsgheEZM0i9jGEo9VB+PNOO4dlSoC7QWvBd4NKNtWQ1+B0Kp/FkCR2QlclX6JpmVh
         a8R9N42XSjGK7Xr5Txh+wUh7cyDwqEgOMwpWaOgd0nzsJzvlPrMaLofi2NCV82XTiyMB
         196dzOZVptAXoh7aYJyRaWzOKcL2DyLGlb5oFEf4Q+lrsQ2j+1mBrkGEj7IFPnyvfB7F
         GyVJ2GBK1vDyTfpZ2Z6iBBi3KzIZCcGBrrnUcI3FPpAi46okBI2e16kOWzEmYVMRCHun
         nemrE6fq9tX+Xu2z6q0S2PI7OLbThx/bFQrs0AAtOEpHdSGI7xRq/4elOzuZPbiJNbI9
         1iSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364742; x=1747969542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6ciFGfibwQSe7Dz2z8LF3Oi63gmDdi7aOYsraaH6S0=;
        b=wBptbow5Z1QRK2NILYLVhRBJMmS3TJj6n/CmgggG8+DOouL2c4B6WwEAFYOICwjTg6
         pfCdLUdo23fA3J4A1AFH8KfWvPAYLp/e6uLt2PDnhEFzFcRW1s02anqz7LxuVuGvqi3O
         lY46rsnGanFhqC5IXzhqqFc2FU2NCuig0cak/STD6nYJ6YcrNWaU93T2ML7WXOnHCYiq
         z2Cn9gh+f51RVvBB0JjJXatIvEGYMrK+8qg4O0Bf1ccPtoP3t4eI1CPJK+QSwVzg34oa
         /EoHnT+7T+nR2CP+SWtI5WFDKfZmZd9LM+fTps4x8fugvp9Cr4eyYsdrWcehL0P7kDoE
         uG6A==
X-Forwarded-Encrypted: i=1; AJvYcCV0bl4otLMkQgcaWuCpyQZTw22NfHMuuh2z3EFv3e1LN2O+vcQ9nEhChu1R7Oe34CRUuwScM6gQiYiFd0U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvgf7oqAthXGC8N71EcDR/igwQYnyBFwtkCQ6s0+U+qUh/M99H
	ZOdzM2ngqeG9m6JpQM5gH81dg6ipLiqiBRL7PN1Obx1/o3dRnNCYBGkf6XwXv7dfw+A=
X-Gm-Gg: ASbGnctRFjX5urmGdwRUAwBgNpE/VxkLxlykDJk7nSkvk7LVeWXFwDGLkvk2gSJPLDX
	WMSR3Ih13PJrlxsvA77dHb54DS3ggsk5NXpbj5uf+Vp3LFvN6SXjbnXfXvOi7iFEm1AgS3DbBGA
	FnEJtiepMk8KRWTyO/GodwiAWTXTOixUGJVlTSZxFt65CUb6ds5t8f0EPmKmV+gMxCVwMQDZhH5
	3eG/3nsiUMMIGruAl0xOskWry4xM4SJJ7eDYfR+4BsIHGFLmz/qy8hDGtesMDiICNNyqzp/ZkT0
	BaUhZ0wb3xu9irFMFOvMlCnFE4Ztzx2+E+Y+KahjbQtvCdP6ljl+0k32G6LA+vdMihakky1GGMo
	aFb3XU0xOnv6GRV9Q7kPGKQ==
X-Google-Smtp-Source: AGHT+IHHAN9KUlQpyndVpMdv3EmGeRNRqlG+KvGrOQcL5JQgzWEKTPLq/Qbd2zlHxnE/jzbP8gbRYw==
X-Received: by 2002:a17:902:d543:b0:22e:4cae:5965 with SMTP id d9443c01a7336-231de37664bmr12056405ad.29.1747364742397;
        Thu, 15 May 2025 20:05:42 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.05.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:05:41 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH v2 02/12] riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions
Date: Fri, 16 May 2025 11:03:00 +0800
Message-Id: <20250516030310.16950-3-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250516030310.16950-1-cyan.yang@sifive.com>
References: <20250516030310.16950-1-cyan.yang@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SiFive vendor extension support to the kernel with the target of
"xsfvqmaccdod" and "xsfvqmaccqoq".

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 arch/riscv/Kconfig.vendor                     | 13 +++++++++++++
 .../include/asm/vendor_extensions/sifive.h    | 14 ++++++++++++++
 arch/riscv/kernel/vendor_extensions.c         | 10 ++++++++++
 arch/riscv/kernel/vendor_extensions/Makefile  |  1 +
 arch/riscv/kernel/vendor_extensions/sifive.c  | 19 +++++++++++++++++++
 5 files changed, 57 insertions(+)
 create mode 100644 arch/riscv/include/asm/vendor_extensions/sifive.h
 create mode 100644 arch/riscv/kernel/vendor_extensions/sifive.c

diff --git a/arch/riscv/Kconfig.vendor b/arch/riscv/Kconfig.vendor
index b096548fe0ff..e14f26368963 100644
--- a/arch/riscv/Kconfig.vendor
+++ b/arch/riscv/Kconfig.vendor
@@ -16,6 +16,19 @@ config RISCV_ISA_VENDOR_EXT_ANDES
 	  If you don't know what to do here, say Y.
 endmenu
 
+menu "SiFive"
+config RISCV_ISA_VENDOR_EXT_SIFIVE
+	bool "SiFive vendor extension support"
+	select RISCV_ISA_VENDOR_EXT
+	default y
+	help
+	  Say N here if you want to disable all SiFive vendor extension
+	  support. This will cause any SiFive vendor extensions that are
+	  requested by hardware probing to be ignored.
+
+	  If you don't know what to do here, say Y.
+endmenu
+
 menu "T-Head"
 config RISCV_ISA_VENDOR_EXT_THEAD
 	bool "T-Head vendor extension support"
diff --git a/arch/riscv/include/asm/vendor_extensions/sifive.h b/arch/riscv/include/asm/vendor_extensions/sifive.h
new file mode 100644
index 000000000000..608004250e2e
--- /dev/null
+++ b/arch/riscv/include/asm/vendor_extensions/sifive.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_SIFIVE_H
+#define _ASM_RISCV_VENDOR_EXTENSIONS_SIFIVE_H
+
+#include <asm/vendor_extensions.h>
+
+#include <linux/types.h>
+
+#define RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD		0
+#define RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ		1
+
+extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_sifive;
+
+#endif
diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/vendor_extensions.c
index 9feb7f67a0a3..92d8ff81f42c 100644
--- a/arch/riscv/kernel/vendor_extensions.c
+++ b/arch/riscv/kernel/vendor_extensions.c
@@ -6,6 +6,7 @@
 #include <asm/vendorid_list.h>
 #include <asm/vendor_extensions.h>
 #include <asm/vendor_extensions/andes.h>
+#include <asm/vendor_extensions/sifive.h>
 #include <asm/vendor_extensions/thead.h>
 
 #include <linux/array_size.h>
@@ -15,6 +16,9 @@ struct riscv_isa_vendor_ext_data_list *riscv_isa_vendor_ext_list[] = {
 #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_ANDES
 	&riscv_isa_vendor_ext_list_andes,
 #endif
+#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE
+	&riscv_isa_vendor_ext_list_sifive,
+#endif
 #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
 	&riscv_isa_vendor_ext_list_thead,
 #endif
@@ -45,6 +49,12 @@ bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsig
 		cpu_bmap = riscv_isa_vendor_ext_list_andes.per_hart_isa_bitmap;
 		break;
 	#endif
+	#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE
+	case SIFIVE_VENDOR_ID:
+		bmap = &riscv_isa_vendor_ext_list_sifive.all_harts_isa_bitmap;
+		cpu_bmap = riscv_isa_vendor_ext_list_sifive.per_hart_isa_bitmap;
+		break;
+	#endif
 	#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
 	case THEAD_VENDOR_ID:
 		bmap = &riscv_isa_vendor_ext_list_thead.all_harts_isa_bitmap;
diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/kernel/vendor_extensions/Makefile
index 866414c81a9f..d5fdde0e863b 100644
--- a/arch/riscv/kernel/vendor_extensions/Makefile
+++ b/arch/riscv/kernel/vendor_extensions/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_ANDES)	+= andes.o
+obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE)	+= sifive.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead_hwprobe.o
diff --git a/arch/riscv/kernel/vendor_extensions/sifive.c b/arch/riscv/kernel/vendor_extensions/sifive.c
new file mode 100644
index 000000000000..6042cc3021de
--- /dev/null
+++ b/arch/riscv/kernel/vendor_extensions/sifive.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <asm/cpufeature.h>
+#include <asm/vendor_extensions.h>
+#include <asm/vendor_extensions/sifive.h>
+
+#include <linux/array_size.h>
+#include <linux/types.h>
+
+/* All SiFive vendor extensions supported in Linux */
+static const struct riscv_isa_ext_data riscv_isa_vendor_ext_sifive[] = {
+	__RISCV_ISA_EXT_DATA(xsfvqmaccdod, RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD),
+	__RISCV_ISA_EXT_DATA(xsfvqmaccqoq, RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ),
+};
+
+struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_sifive = {
+	.ext_data_count = ARRAY_SIZE(riscv_isa_vendor_ext_sifive),
+	.ext_data = riscv_isa_vendor_ext_sifive,
+};
-- 
2.39.5 (Apple Git-154)

