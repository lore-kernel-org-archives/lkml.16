Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F8718C00B
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 08:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744533713; cv=none; b=gfRfMr8iOuNm/DXNiqpdY8kijCnNCZUctUTgXLYJpYH1RweLF5UuChEu9XnqfYN93B8LWIZJo4uAkErdqJHlaiJSCNLgCwYRGB/CafX681DbFliVpZzIfJSBc/twRc8BlXTX+vLzlo4rvQLp058iNCHLpr3oJanyum/DTywA88s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744533713; c=relaxed/simple;
	bh=p3zhV+cC/dJn10doITQvJYBlHcrLapyBUYkDdStY/YU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RTdq8bbR3W6XWd9jwe+wXXd1uoivmwmZ+uJ3KI8Db6+gKrMEP1Sm2jeToBZe/2ml4mkBf9DzSr15Da5XIZDg2gfPDdXViWz8XFJZwPAJTvVm8O/03Z3gyi5ZuAq/EAZSx1AG0QWyXta8s1TjGQBUqKXtelxVOVOw1kjC88/sZW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNseuvkA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNseuvkA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 207F7C4CEE7;
	Sun, 13 Apr 2025 08:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744533713;
	bh=p3zhV+cC/dJn10doITQvJYBlHcrLapyBUYkDdStY/YU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CNseuvkAq3ELcITxUBclmo8px1rp8bzbNyzjBbWiF/6OAH/ca9DJXcFV8jpZg6ep/
	 rSxpFJT8uVn3vOTMqRBRI9K935VAsMAeSkTqOd83e8z+cubCkiHGuNLlUUbxdPjA95
	 hfHjqF8H30+vBYl0wfXwMaSQjPh6CtOTNr3Poz73xSj9RRExgVKts8wUCl4Y2nS8/X
	 xzFpDizyhqsJPTP08yU4B/U+jW6N461nblm9Za1ruOJgGMpQ/F5B7D7XwqQbwEuc9n
	 TAaT+zJyZsWs6uPXYMO2L2FjTczG0X23XZ1buf7tZpWyxTVem278fP+kJ+rGuIF8mv
	 R2tXaY/E5TLNQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Mario Limonciello <superm1@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 1/6] x86/platform/amd: Move the <asm/amd-ibs.h> header to <asm/amd/ibs.h>
Date: Sun, 13 Apr 2025 10:41:39 +0200
Message-ID: <20250413084144.3746608-2-mingo@kernel.org>
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

Cc: Borislav Petkov <bp@alien8.de>
Cc: Mario Limonciello <superm1@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/events/amd/ibs.c                     | 2 +-
 arch/x86/include/asm/{amd-ibs.h => amd/ibs.h} | 0
 tools/perf/check-headers.sh                   | 2 +-
 tools/perf/util/amd-sample-raw.c              | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/events/amd/ibs.c b/arch/x86/events/amd/ibs.c
index 0252b7ea8bca..172619932fe3 100644
--- a/arch/x86/events/amd/ibs.c
+++ b/arch/x86/events/amd/ibs.c
@@ -26,7 +26,7 @@ static u32 ibs_caps;
 #include <linux/hardirq.h>
 
 #include <asm/nmi.h>
-#include <asm/amd-ibs.h>
+#include <asm/amd/ibs.h>
 
 /* attr.config2 */
 #define IBS_SW_FILTER_MASK	1
diff --git a/arch/x86/include/asm/amd-ibs.h b/arch/x86/include/asm/amd/ibs.h
similarity index 100%
rename from arch/x86/include/asm/amd-ibs.h
rename to arch/x86/include/asm/amd/ibs.h
diff --git a/tools/perf/check-headers.sh b/tools/perf/check-headers.sh
index a4499e5a6f9c..493a13830419 100755
--- a/tools/perf/check-headers.sh
+++ b/tools/perf/check-headers.sh
@@ -185,7 +185,7 @@ done
 # diff with extra ignore lines
 check arch/x86/lib/memcpy_64.S        '-I "^EXPORT_SYMBOL" -I "^#include <asm/export.h>" -I"^SYM_FUNC_START\(_LOCAL\)*(memcpy_\(erms\|orig\))" -I"^#include <linux/cfi_types.h>"'
 check arch/x86/lib/memset_64.S        '-I "^EXPORT_SYMBOL" -I "^#include <asm/export.h>" -I"^SYM_FUNC_START\(_LOCAL\)*(memset_\(erms\|orig\))"'
-check arch/x86/include/asm/amd-ibs.h  '-I "^#include [<\"]\(asm/\)*msr-index.h"'
+check arch/x86/include/asm/amd/ibs.h  '-I "^#include [<\"]\(asm/\)*msr-index.h"'
 check arch/arm64/include/asm/cputype.h '-I "^#include [<\"]\(asm/\)*sysreg.h"'
 check include/linux/unaligned.h '-I "^#include <linux/unaligned/packed_struct.h>" -I "^#include <asm/byteorder.h>" -I "^#pragma GCC diagnostic"'
 check include/uapi/asm-generic/mman.h '-I "^#include <\(uapi/\)*asm-generic/mman-common\(-tools\)*.h>"'
diff --git a/tools/perf/util/amd-sample-raw.c b/tools/perf/util/amd-sample-raw.c
index 9d0ce88e90e4..456ce64ad822 100644
--- a/tools/perf/util/amd-sample-raw.c
+++ b/tools/perf/util/amd-sample-raw.c
@@ -9,7 +9,7 @@
 #include <inttypes.h>
 
 #include <linux/string.h>
-#include "../../arch/x86/include/asm/amd-ibs.h"
+#include "../../arch/x86/include/asm/amd/ibs.h"
 
 #include "debug.h"
 #include "session.h"
-- 
2.45.2

