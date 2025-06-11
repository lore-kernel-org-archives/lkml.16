Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56FE028A714
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638973; cv=none; b=fJeFcCdH8rWv+MEcTGHS50M3x/ha/MUCu9NeF1574TVEktgf0q2Z2o6x0T3dnlkXSW2+WEgupGMlHXy01dG7z2X5SFutvK6tsgixwiwBw6KONjARkQWHeXRpkZCFCFyWp2tz1+ezfVQfToBdfnRaKTf19v09mlUG4SlaP4BZJkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638973; c=relaxed/simple;
	bh=1Pq3fWCbMme7can5L1VXxkKY/ixp6vJKLVRm1fVwo3g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sQscgs0/rlQKGUO1eDKIph0IRMHFF8ywZjbL7oYAust/AY30DeL2MDETQy+Ep5IjdU+oIuBAq0IleLEMH1nctuAN/mY0W1Po7P8VtdLUfUDjkEyLivky0uCaVVSXuvPAlQmOpwZZonaAakMj2ouh99+oNqRplmNRCyTIFIu46mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54BAE1688;
	Wed, 11 Jun 2025 03:49:11 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 109A83F77D;
	Wed, 11 Jun 2025 03:49:28 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	ardb@kernel.org,
	frederic@kernel.org,
	james.morse@arm.com,
	joey.gouly@arm.com,
	scott@os.amperecomputing.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 5/6] arm64/asm: introduce lsui.h
Date: Wed, 11 Jun 2025 11:49:15 +0100
Message-Id: <20250611104916.10636-6-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250611104916.10636-1-yeoreum.yun@arm.com>
References: <20250611104916.10636-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces lsui.h header file for applying runtime patch
to use load/store unprevileged instructions when cpu supports
FEAT_LSUI otherwise uses method implemented via ll/sc way with
clearing PSTATE.PAN bit

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/include/asm/lsui.h | 37 +++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 arch/arm64/include/asm/lsui.h

diff --git a/arch/arm64/include/asm/lsui.h b/arch/arm64/include/asm/lsui.h
new file mode 100644
index 000000000000..39bf232f3eb7
--- /dev/null
+++ b/arch/arm64/include/asm/lsui.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Arm Ltd.
+ */
+#ifndef __ASM_LSUI_H
+#define __ASM_LSUI_H
+
+#define LL_SC_MAX_LOOPS	128 /* What's the largest number you can think of? */
+
+#include <asm/futex_ll_sc_u.h>
+
+#ifdef CONFIG_AS_HAS_LSUI
+
+#define __LSUI_PREAMBLE	".arch_extension lsui\n"
+
+#include <linux/compiler_types.h>
+#include <linux/export.h>
+#include <linux/stringify.h>
+#include <asm/alternative.h>
+#include <asm/alternative-macros.h>
+#include <asm/cpucaps.h>
+
+#include <asm/futex_lsui.h>
+
+#define __lsui_ll_sc_u_body(op, ...)					\
+({									\
+	alternative_has_cap_likely(ARM64_HAS_LSUI) ?		\
+		__lsui_##op(__VA_ARGS__) :				\
+		__ll_sc_u_##op(__VA_ARGS__);				\
+})
+
+#else	/* CONFIG_AS_HAS_LSUI */
+
+#define __lsui_ll_sc_u_body(op, ...)		__ll_sc_u_##op(__VA_ARGS__)
+
+#endif	/* CONFIG_AS_HAS_LSUI */
+#endif	/* __ASM_LSUI_H */
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

