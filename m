Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D8118CC10
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 08:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744533726; cv=none; b=BjEpCDfyfhD+l59vyPzb4e3xU/G/P5aURf8pAuC6a2mEntIXVn0W4d1+I3oQes1xJeqwxMTNk0zd2rmxzO7T4pPrFdYqVFx/suYsLUy36z1H0mZzA75PqefPww5YgI4itKxjLzZaFjwmA78bkDGKktPxkk8Bb2Zy1QIficNCQ2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744533726; c=relaxed/simple;
	bh=VFGYoxLIKPg40Obpj6rCYDWionMe+vi6BNza8sME7ws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ap9cLLxrFileJQ9HHPD3P6GZcn3a9qHMFYzaH4F312dj7fCf+8hx7KVNsiRymXDslKJanUPiuGu74g0ff94mpTR7lIsz7UbLyzLhJpUaONm0bVlqJkCo4G15u4MTEP1NxywsisLw/MBx/jjb+dbrI1dCEpmEe4ECLVi0GILjbfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n4WH/Vvv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n4WH/Vvv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 330ECC4CEE7;
	Sun, 13 Apr 2025 08:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744533726;
	bh=VFGYoxLIKPg40Obpj6rCYDWionMe+vi6BNza8sME7ws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n4WH/VvvZD/A628iyx7nQ0LrCidOy/wWMx6IOrBHYWLYUZtXwXw+WnUViEXfmphse
	 RU9WcVX+3Ni7OZ6Vu2LLA/GZVjgVgG1xa+Por9Xc4LLRIepmG6qQPh1ub7bwHhGOI2
	 J/WFxh8fGVCFFgTtzVJ7zGvVNpZBM3HZGpoPpIJmo1H3y0krL0vYqa+c37Woe9+Ze8
	 7Ye9d+8x0/89hF0pKAbwgyI0veHnq69AEzuq+s5vYk4UnHMxAJSQvbxZnUhEdcJ9Xz
	 jRcfo4uLecrjQwp6v2UOHvMvCK9MS/k6YvR/P0HqzfHaa2hFkeV76/mIjJ6t1RkTSU
	 NinMNwWKb5LgQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Mario Limonciello <superm1@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 6/6] x86/platform/amd: Move the <asm/amd_node.h> header to <asm/amd/node.h>
Date: Sun, 13 Apr 2025 10:41:44 +0200
Message-ID: <20250413084144.3746608-7-mingo@kernel.org>
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
 MAINTAINERS                                     | 2 +-
 arch/x86/include/asm/amd/nb.h                   | 2 +-
 arch/x86/include/asm/{amd_node.h => amd/node.h} | 0
 arch/x86/kernel/amd_node.c                      | 2 +-
 arch/x86/pci/fixup.c                            | 2 +-
 drivers/edac/amd64_edac.c                       | 2 +-
 drivers/hwmon/k10temp.c                         | 2 +-
 drivers/platform/x86/amd/hsmp/acpi.c            | 2 +-
 drivers/platform/x86/amd/hsmp/plat.c            | 2 +-
 drivers/platform/x86/amd/pmc/pmc.c              | 2 +-
 drivers/platform/x86/amd/pmf/core.c             | 2 +-
 drivers/ras/amd/atl/internal.h                  | 2 +-
 sound/soc/amd/acp/acp-rembrandt.c               | 2 +-
 sound/soc/amd/acp/acp63.c                       | 2 +-
 sound/soc/amd/acp/acp70.c                       | 2 +-
 sound/soc/sof/amd/acp.c                         | 2 +-
 16 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ce2942d0fef4..684b62c42014 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1142,7 +1142,7 @@ M:	Mario Limonciello <mario.limonciello@amd.com>
 M:	Yazen Ghannam <yazen.ghannam@amd.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
-F:	arch/x86/include/asm/amd_node.h
+F:	arch/x86/include/asm/amd/node.h
 F:	arch/x86/kernel/amd_node.c
 
 AMD PDS CORE DRIVER
diff --git a/arch/x86/include/asm/amd/nb.h b/arch/x86/include/asm/amd/nb.h
index adfa0854cf2d..ddb5108cf46c 100644
--- a/arch/x86/include/asm/amd/nb.h
+++ b/arch/x86/include/asm/amd/nb.h
@@ -4,7 +4,7 @@
 
 #include <linux/ioport.h>
 #include <linux/pci.h>
-#include <asm/amd_node.h>
+#include <asm/amd/node.h>
 
 struct amd_nb_bus_dev_range {
 	u8 bus;
diff --git a/arch/x86/include/asm/amd_node.h b/arch/x86/include/asm/amd/node.h
similarity index 100%
rename from arch/x86/include/asm/amd_node.h
rename to arch/x86/include/asm/amd/node.h
diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
index b670fa85c61b..a40176b62eb5 100644
--- a/arch/x86/kernel/amd_node.c
+++ b/arch/x86/kernel/amd_node.c
@@ -9,7 +9,7 @@
  */
 
 #include <linux/debugfs.h>
-#include <asm/amd_node.h>
+#include <asm/amd/node.h>
 
 /*
  * AMD Nodes are a physical collection of I/O devices within an SoC. There can be one
diff --git a/arch/x86/pci/fixup.c b/arch/x86/pci/fixup.c
index efefeb82ab61..36336299596b 100644
--- a/arch/x86/pci/fixup.c
+++ b/arch/x86/pci/fixup.c
@@ -9,7 +9,7 @@
 #include <linux/pci.h>
 #include <linux/suspend.h>
 #include <linux/vgaarb.h>
-#include <asm/amd_node.h>
+#include <asm/amd/node.h>
 #include <asm/hpet.h>
 #include <asm/pci_x86.h>
 
diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 417940f455d3..25180165ca8e 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -3,7 +3,7 @@
 #include <linux/string_choices.h>
 #include "amd64_edac.h"
 #include <asm/amd/nb.h>
-#include <asm/amd_node.h>
+#include <asm/amd/node.h>
 
 static struct edac_pci_ctl_info *pci_ctl;
 
diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index 3685906cc57c..472bcf6092f6 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -20,7 +20,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/pci_ids.h>
-#include <asm/amd_node.h>
+#include <asm/amd/node.h>
 #include <asm/processor.h>
 
 MODULE_DESCRIPTION("AMD Family 10h+ CPU core temperature monitor");
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 3c7acb90c3ab..02e22c1f3a1d 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -23,7 +23,7 @@
 
 #include <uapi/asm-generic/errno-base.h>
 
-#include <asm/amd_node.h>
+#include <asm/amd/node.h>
 
 #include "hsmp.h"
 
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 0eb73fcb9806..c9a1b1ed4224 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -18,7 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/sysfs.h>
 
-#include <asm/amd_node.h>
+#include <asm/amd/node.h>
 
 #include "hsmp.h"
 
diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index d789d6cab794..e5c4e6be37f7 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -28,7 +28,7 @@
 #include <linux/seq_file.h>
 #include <linux/uaccess.h>
 
-#include <asm/amd_node.h>
+#include <asm/amd/node.h>
 
 #include "pmc.h"
 
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index a2cb2d5544f5..cecadae3f3bf 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -14,7 +14,7 @@
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/power_supply.h>
-#include <asm/amd_node.h>
+#include <asm/amd/node.h>
 #include "pmf.h"
 
 /* PMF-SMU communication registers */
diff --git a/drivers/ras/amd/atl/internal.h b/drivers/ras/amd/atl/internal.h
index c63fee30cc18..05bbee20eeaf 100644
--- a/drivers/ras/amd/atl/internal.h
+++ b/drivers/ras/amd/atl/internal.h
@@ -18,7 +18,7 @@
 #include <linux/ras.h>
 
 #include <asm/amd/nb.h>
-#include <asm/amd_node.h>
+#include <asm/amd/node.h>
 
 #include "reg_fields.h"
 
diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
index 746b6ed72029..c30a7b59fbff 100644
--- a/sound/soc/amd/acp/acp-rembrandt.c
+++ b/sound/soc/amd/acp/acp-rembrandt.c
@@ -22,7 +22,7 @@
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
 
-#include <asm/amd_node.h>
+#include <asm/amd/node.h>
 
 #include "amd.h"
 #include "../mach-config.h"
diff --git a/sound/soc/amd/acp/acp63.c b/sound/soc/amd/acp/acp63.c
index 52d895e624c7..0ddde14da7d5 100644
--- a/sound/soc/amd/acp/acp63.c
+++ b/sound/soc/amd/acp/acp63.c
@@ -21,7 +21,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/pci.h>
 
-#include <asm/amd_node.h>
+#include <asm/amd/node.h>
 
 #include "amd.h"
 #include "acp-mach.h"
diff --git a/sound/soc/amd/acp/acp70.c b/sound/soc/amd/acp/acp70.c
index 6d5f5ade075c..7f4a25b46576 100644
--- a/sound/soc/amd/acp/acp70.c
+++ b/sound/soc/amd/acp/acp70.c
@@ -23,7 +23,7 @@
 #include "amd.h"
 #include "acp-mach.h"
 
-#include <asm/amd_node.h>
+#include <asm/amd/node.h>
 
 #define DRV_NAME "acp_asoc_acp70"
 
diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 7c6d647fa253..7e6f10726ff0 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -16,7 +16,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 
-#include <asm/amd_node.h>
+#include <asm/amd/node.h>
 
 #include "../ops.h"
 #include "acp.h"
-- 
2.45.2

