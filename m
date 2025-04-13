Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6D9190679
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 08:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744533718; cv=none; b=lr8ZMwftzRxAfdrnPEj+KgBYFgx0U0iC4HUO7p8gH4Qk1hDGFJ3wnYQ2GWFLVmEL9G7KVUHViUwECaQoX7cuuySzL7vEj1VvKUi3cFMlp3D/nBGGTbTRcbzn2s/sozTCVPVLkA1Yv6A4+TLvGAyQ9n00xXHyGzjzlIahMLw0XnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744533718; c=relaxed/simple;
	bh=0hUzcczFroY/vPX1MuguiUr3hK9rr66aXBjv4hQWhBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N965lBjjn9wY/2HXYAuTSwd+7f+7bHxIpgZlnrlOHALMxwXb9FVYskagxVQitANuLA3iu3cI9DjKDnKVW2dWqG/v9RaY+dZ0M/0soiK7xqTeJEWpgF/jUm4jJXIfROtFmvkQLFKYs0BL3xv4kgO3z00r6itwk3H8TrMMQB637dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NW8F/T7k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NW8F/T7k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1092DC4CEE7;
	Sun, 13 Apr 2025 08:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744533718;
	bh=0hUzcczFroY/vPX1MuguiUr3hK9rr66aXBjv4hQWhBc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NW8F/T7kmaqnVP8xIYr114Wf6zOjuTUtVAbhS7FETuk2Sa7ZVg6o3TpPrNh92bWiH
	 y6ciW68F8RqG5LVen86VOM/jTGM3BctGY6BZm/Jwfnlg5qrCM4CTRyKdl7BVpQes8I
	 w+G7k6epkvrFbKHcfHUtnpydPAsFzqblKqhbhfw6NHjIoQGa4iSjfZN8Y1FleiD5DK
	 0d+FAkhdR7G55FHK19PYxNhycYDdLdN0+cY6NYSabh4IpLGQwEGgrcBXXFbROKIris
	 RGyGEsArgbw11XxYFvz5o467m5dEHVkrcFBrdORl4tb+JNv8lt6cK4FS2YhemFV1If
	 JcXQBvXvovhmA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Mario Limonciello <superm1@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 3/6] x86/platform/amd: Move the <asm/amd_nb.h> header to <asm/amd/nb.h>
Date: Sun, 13 Apr 2025 10:41:41 +0200
Message-ID: <20250413084144.3746608-4-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250413084144.3746608-1-mingo@kernel.org>
References: <20250413084144.3746608-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Collect AMD specific platform header files in <asm/amd/*.h>.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Mario Limonciello <superm1@kernel.org>
---
 arch/x86/include/asm/{amd_nb.h => amd/nb.h} | 0
 arch/x86/kernel/amd_gart_64.c               | 2 +-
 arch/x86/kernel/amd_nb.c                    | 2 +-
 arch/x86/kernel/aperture_64.c               | 2 +-
 arch/x86/kernel/cpu/cacheinfo.c             | 2 +-
 arch/x86/kernel/cpu/mce/inject.c            | 2 +-
 arch/x86/mm/amdtopology.c                   | 2 +-
 arch/x86/mm/numa.c                          | 2 +-
 arch/x86/pci/amd_bus.c                      | 2 +-
 drivers/char/agp/amd64-agp.c                | 2 +-
 drivers/edac/amd64_edac.c                   | 2 +-
 drivers/platform/x86/amd/pmc/mp1_stb.c      | 2 +-
 drivers/pnp/quirks.c                        | 2 +-
 drivers/ras/amd/atl/internal.h              | 2 +-
 14 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/x86/include/asm/amd_nb.h b/arch/x86/include/asm/amd/nb.h
similarity index 100%
rename from arch/x86/include/asm/amd_nb.h
rename to arch/x86/include/asm/amd/nb.h
diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
index c884deca839b..3485d419c2f5 100644
--- a/arch/x86/kernel/amd_gart_64.c
+++ b/arch/x86/kernel/amd_gart_64.c
@@ -39,7 +39,7 @@
 #include <asm/gart.h>
 #include <asm/set_memory.h>
 #include <asm/dma.h>
-#include <asm/amd_nb.h>
+#include <asm/amd/nb.h>
 #include <asm/x86_init.h>
 
 static unsigned long iommu_bus_base;	/* GART remapping area (physical) */
diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
index 6d12a9b69432..bac445d217e6 100644
--- a/arch/x86/kernel/amd_nb.c
+++ b/arch/x86/kernel/amd_nb.c
@@ -13,7 +13,7 @@
 #include <linux/export.h>
 #include <linux/spinlock.h>
 #include <linux/pci_ids.h>
-#include <asm/amd_nb.h>
+#include <asm/amd/nb.h>
 
 static u32 *flush_words;
 
diff --git a/arch/x86/kernel/aperture_64.c b/arch/x86/kernel/aperture_64.c
index 89c0c8a3fc7e..769321185a08 100644
--- a/arch/x86/kernel/aperture_64.c
+++ b/arch/x86/kernel/aperture_64.c
@@ -29,7 +29,7 @@
 #include <asm/gart.h>
 #include <asm/pci-direct.h>
 #include <asm/dma.h>
-#include <asm/amd_nb.h>
+#include <asm/amd/nb.h>
 #include <asm/x86_init.h>
 #include <linux/crash_dump.h>
 
diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index b3a520959b51..247fa8746fe5 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -16,7 +16,7 @@
 #include <linux/stop_machine.h>
 #include <linux/sysfs.h>
 
-#include <asm/amd_nb.h>
+#include <asm/amd/nb.h>
 #include <asm/cacheinfo.h>
 #include <asm/cpufeature.h>
 #include <asm/mtrr.h>
diff --git a/arch/x86/kernel/cpu/mce/inject.c b/arch/x86/kernel/cpu/mce/inject.c
index 06e3cf7229ce..bb060f8326ef 100644
--- a/arch/x86/kernel/cpu/mce/inject.c
+++ b/arch/x86/kernel/cpu/mce/inject.c
@@ -24,7 +24,7 @@
 #include <linux/pci.h>
 #include <linux/uaccess.h>
 
-#include <asm/amd_nb.h>
+#include <asm/amd/nb.h>
 #include <asm/apic.h>
 #include <asm/irq_vectors.h>
 #include <asm/mce.h>
diff --git a/arch/x86/mm/amdtopology.c b/arch/x86/mm/amdtopology.c
index 628833afee37..f980b0eb0105 100644
--- a/arch/x86/mm/amdtopology.c
+++ b/arch/x86/mm/amdtopology.c
@@ -25,7 +25,7 @@
 #include <asm/numa.h>
 #include <asm/mpspec.h>
 #include <asm/apic.h>
-#include <asm/amd_nb.h>
+#include <asm/amd/nb.h>
 
 static unsigned char __initdata nodeids[8];
 
diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index 64e5cdb2460a..fed02d1073c7 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -18,7 +18,7 @@
 #include <asm/e820/api.h>
 #include <asm/proto.h>
 #include <asm/dma.h>
-#include <asm/amd_nb.h>
+#include <asm/amd/nb.h>
 
 #include "numa_internal.h"
 
diff --git a/arch/x86/pci/amd_bus.c b/arch/x86/pci/amd_bus.c
index 631512f7ec85..95ae1971a5f1 100644
--- a/arch/x86/pci/amd_bus.c
+++ b/arch/x86/pci/amd_bus.c
@@ -5,7 +5,7 @@
 #include <linux/cpu.h>
 #include <linux/range.h>
 
-#include <asm/amd_nb.h>
+#include <asm/amd/nb.h>
 #include <asm/pci_x86.h>
 
 #include <asm/pci-direct.h>
diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
index 8e41731d3642..bf490967241a 100644
--- a/drivers/char/agp/amd64-agp.c
+++ b/drivers/char/agp/amd64-agp.c
@@ -16,7 +16,7 @@
 #include <linux/mmzone.h>
 #include <asm/page.h>		/* PAGE_SIZE */
 #include <asm/e820/api.h>
-#include <asm/amd_nb.h>
+#include <asm/amd/nb.h>
 #include <asm/gart.h>
 #include "agp.h"
 
diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 90f0eb7cc5b9..417940f455d3 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -2,7 +2,7 @@
 #include <linux/ras.h>
 #include <linux/string_choices.h>
 #include "amd64_edac.h"
-#include <asm/amd_nb.h>
+#include <asm/amd/nb.h>
 #include <asm/amd_node.h>
 
 static struct edac_pci_ctl_info *pci_ctl;
diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
index c005f00988f7..3b9b9f30faa3 100644
--- a/drivers/platform/x86/amd/pmc/mp1_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -11,7 +11,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <asm/amd_nb.h>
+#include <asm/amd/nb.h>
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
 #include <linux/uaccess.h>
diff --git a/drivers/pnp/quirks.c b/drivers/pnp/quirks.c
index 6085a1471de2..6e1d4bfd28ac 100644
--- a/drivers/pnp/quirks.c
+++ b/drivers/pnp/quirks.c
@@ -290,7 +290,7 @@ static void quirk_system_pci_resources(struct pnp_dev *dev)
 
 #ifdef CONFIG_AMD_NB
 
-#include <asm/amd_nb.h>
+#include <asm/amd/nb.h>
 
 static void quirk_amd_mmconfig_area(struct pnp_dev *dev)
 {
diff --git a/drivers/ras/amd/atl/internal.h b/drivers/ras/amd/atl/internal.h
index f9be26d25348..c63fee30cc18 100644
--- a/drivers/ras/amd/atl/internal.h
+++ b/drivers/ras/amd/atl/internal.h
@@ -17,7 +17,7 @@
 #include <linux/bitops.h>
 #include <linux/ras.h>
 
-#include <asm/amd_nb.h>
+#include <asm/amd/nb.h>
 #include <asm/amd_node.h>
 
 #include "reg_fields.h"
-- 
2.45.2

