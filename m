Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318D1265CAA;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861260; cv=none; b=cMw58WaqkWzY3K6lT5M8qyxoKqFLBkmwe7+Mrzp0BdlkKaMSkTuoSCLcQeVmZTg+uZ/r4oI3UfkmECSTsCOliE4F0VjGAyh0qDJ2lqaUeUd8PP0Ad70MZSoXY6vkxq5+WiJZf+mWIemfXaQmHI/u0bcg5UOtMcBKyJu0WKALEO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861260; c=relaxed/simple;
	bh=r/g52Sw7NE3cZ4s+t+ohbfBzr9iGvkNvjqfeVNpE7FQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DwnEsX4GK/KQ5PD4HOeiVQju3nYna1sT2hCEmBTGqxNfHOsZI4IKu77Kvbuo54/40syWej3f+onoNU4t29qcP+sKbn5nS5SawZnfxGJYYzuWa7zR95A8ZpVfxdqnH5y5l3ZUUHIxGeZlT0/FdUCjNGSmGn02kHoM+DkkUPI5oyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=upzViby8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="upzViby8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6F0DC4AF0D;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750861259;
	bh=r/g52Sw7NE3cZ4s+t+ohbfBzr9iGvkNvjqfeVNpE7FQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=upzViby8EQuva8lr/4oenmGINdY9cilyMktgzhlfDm9eJCX+RFmyuthJv498IYo5e
	 04XAyroc0vg8RaNHfV4H0ycOk3CmJpXFBlNl/f86j7/yBmU5ifttGnnP7az+EDGwON
	 6XraF55xTvqJLFYlkJmOhY1aojILQh7P1wu+Jx/qDkX3rrVDpKoeoBcF39LtpinDnA
	 oQxUWOb/eM/8EVyPlwGRIpjewvlLrbrOK33FJ08hiqTr1+F3DFJjikHFo7IVKODMNf
	 1vjM7HKnXWzF7K/scCSBz+S82jLwhAUhXwLt6mYy93Hj2miK3UpJJijA6/cz8B0Hkx
	 oWb9shvPDBuiw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5668C7EE39;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Wed, 25 Jun 2025 16:20:59 +0200
Subject: [PATCH v4 4/7] riscv: hwprobe: Add MIPS vendor extension probing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-p8700-pause-v4-4-6c7dd7f85756@htecgroup.com>
References: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
In-Reply-To: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>
Cc: Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750861257; l=5977;
 i=aleksa.paunovic@htecgroup.com; s=20250514; h=from:subject:message-id;
 bh=/ra2A5ZQBIS0eY7nK1+Pygc9iGRZBnPpkjFyim2jAcM=;
 b=DKnf1MnaJfdG4LaMyGA42WkhQmot9xI5Tl2HPA2YoVTRV69zvFWo+5MJTGdWmn3ejdsDCkkjI
 gBuFjf9NjEHD27S1ci/8j0AnZGzSBn9L6JtoKkBqwRfZyA1CFDVQS4K
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=gFVSVYLKAgJiS5qCnDyUMGOFuczv8C6o0UmRs+fgisA=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250514
 with auth_id=403
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Add a new hwprobe key "RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0" which allows
userspace to probe for the new xmipsexectl vendor extension.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 arch/riscv/include/asm/hwprobe.h                   |  3 ++-
 .../include/asm/vendor_extensions/mips_hwprobe.h   | 23 ++++++++++++++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h              |  1 +
 arch/riscv/include/uapi/asm/vendor/mips.h          |  3 +++
 arch/riscv/kernel/sys_hwprobe.c                    |  4 ++++
 arch/riscv/kernel/vendor_extensions/Makefile       |  1 +
 arch/riscv/kernel/vendor_extensions/mips_hwprobe.c | 22 +++++++++++++++++++++
 7 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 7fe0a379474ae2c64d300d6fee4a012173f6a6d7..948d2b34e94e84e4c2c351ffe91f4b3afcefc3f7 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 13
+#define RISCV_HWPROBE_MAX_KEY 14
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
@@ -22,6 +22,7 @@ static inline bool hwprobe_key_is_bitmask(__s64 key)
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
 	case RISCV_HWPROBE_KEY_CPUPERF_0:
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
+	case RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0:
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0:
 		return true;
 	}
diff --git a/arch/riscv/include/asm/vendor_extensions/mips_hwprobe.h b/arch/riscv/include/asm/vendor_extensions/mips_hwprobe.h
new file mode 100644
index 0000000000000000000000000000000000000000..0af8c07c22f293b5f772709f774de78dd60c7f39
--- /dev/null
+++ b/arch/riscv/include/asm/vendor_extensions/mips_hwprobe.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 MIPS.
+ */
+
+#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_MIPS_HWPROBE_H_
+#define _ASM_RISCV_VENDOR_EXTENSIONS_MIPS_HWPROBE_H_
+
+#include <linux/cpumask.h>
+#include <uapi/asm/hwprobe.h>
+
+
+#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_MIPS
+void hwprobe_isa_vendor_ext_mips_0(struct riscv_hwprobe *pair, const struct cpumask *cpus);
+#else
+static inline void hwprobe_isa_vendor_ext_mips_0(struct riscv_hwprobe *pair,
+						 const struct cpumask *cpus)
+{
+	pair->value = 0;
+}
+#endif
+
+#endif // _ASM_RISCV_VENDOR_EXTENSIONS_MIPS_HWPROBE_H_
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index aaf6ad97049931381f9542bb9316c873ec6ab9f6..5d30a4fae37a82ef4d968d20b187420772ad8946 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -106,6 +106,7 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0	11
 #define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE	12
 #define RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0	13
+#define RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0	14
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/include/uapi/asm/vendor/mips.h b/arch/riscv/include/uapi/asm/vendor/mips.h
new file mode 100644
index 0000000000000000000000000000000000000000..11d41651178233a5f06ab9541ea0506d9883aa19
--- /dev/null
+++ b/arch/riscv/include/uapi/asm/vendor/mips.h
@@ -0,0 +1,3 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+#define RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 0b170e18a2beba576f4f8787d6ef6aa67c5c3d0e..6c73e167ef4ccc7f99dd2793acde2595fffdcbad 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -15,6 +15,7 @@
 #include <asm/uaccess.h>
 #include <asm/unistd.h>
 #include <asm/vector.h>
+#include <asm/vendor_extensions/mips_hwprobe.h>
 #include <asm/vendor_extensions/sifive_hwprobe.h>
 #include <asm/vendor_extensions/thead_hwprobe.h>
 #include <vdso/vsyscall.h>
@@ -309,6 +310,9 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
 		hwprobe_isa_vendor_ext_thead_0(pair, cpus);
 		break;
+	case RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0:
+		hwprobe_isa_vendor_ext_mips_0(pair, cpus);
+		break;
 
 	/*
 	 * For forward compatibility, unknown keys don't fail the whole
diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/kernel/vendor_extensions/Makefile
index ccad4ebafb43412e72e654da3bdb9face53b80c6..bf116c82b6bdb3aee23e27fc0b2a69be7c7a5ccb 100644
--- a/arch/riscv/kernel/vendor_extensions/Makefile
+++ b/arch/riscv/kernel/vendor_extensions/Makefile
@@ -2,6 +2,7 @@
 
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_ANDES)	+= andes.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_MIPS)  	+= mips.o
+obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_MIPS)  	+= mips_hwprobe.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE)	+= sifive.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE)	+= sifive_hwprobe.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead.o
diff --git a/arch/riscv/kernel/vendor_extensions/mips_hwprobe.c b/arch/riscv/kernel/vendor_extensions/mips_hwprobe.c
new file mode 100644
index 0000000000000000000000000000000000000000..43944f2b484af257fa358cda53c12b4d6f54b78b
--- /dev/null
+++ b/arch/riscv/kernel/vendor_extensions/mips_hwprobe.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 MIPS.
+ */
+
+#include <asm/vendor_extensions/mips.h>
+#include <asm/vendor_extensions/mips_hwprobe.h>
+#include <asm/vendor_extensions/vendor_hwprobe.h>
+
+#include <linux/cpumask.h>
+#include <linux/types.h>
+
+#include <uapi/asm/hwprobe.h>
+#include <uapi/asm/vendor/mips.h>
+
+void hwprobe_isa_vendor_ext_mips_0(struct riscv_hwprobe *pair,
+				   const struct cpumask *cpus)
+{
+	VENDOR_EXTENSION_SUPPORTED(
+		pair, cpus, riscv_isa_vendor_ext_list_mips.per_hart_isa_bitmap,
+		{ VENDOR_EXT_KEY(XMIPSEXECTL); });
+}

-- 
2.34.1


