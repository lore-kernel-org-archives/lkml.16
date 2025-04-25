Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF752367D5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745570562; cv=none; b=qZYHl6bjNei06J6qL0Y5ZpjWN+9SVvdIzf7n6q73SeLq39z3+csFEVIjr+dsuo+Csw+zdH7OgxPQhnWCMI0j66FAjCQ2QAYo1HNOYLjvTMCFoKCXJ0NUuKkzzKpA/YzATpi6pAOHORD3Xks9ZBeKH59NeFa2ImNItZvdDvAHI6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745570562; c=relaxed/simple;
	bh=4bDzOVGV+XLX77n3e4NpTlhTl6brbPNo5L6qcGyq06Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJpAfqYob89RrLnx+9GB2+NDc0i2tA38MTpgebnFXjffGPtzobZdgUqhqcxoMdx/K2s0qMSNMfLe5bSqxq8E2enkGTr3zG85tw48KnDWKib3XhriOdymSmFqdDElsIrqGGGhSUSNIwd5a2I/oke+M4X4kGbsNYCcppuVQD/Sx6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rva1cdQ6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rva1cdQ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E5C3C4CEE4;
	Fri, 25 Apr 2025 08:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745570561;
	bh=4bDzOVGV+XLX77n3e4NpTlhTl6brbPNo5L6qcGyq06Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rva1cdQ6yxvEFo/u3yejDGVln7i3hZsw8UEf/zYpEtG1HL+cVDRKZpQmivKzR66UH
	 iQLzqmKxu0MpK/DRq1FIHNCSUbu2hhgSxz7XOCyDiEI/8yuTGAv89+HtSNRYqDeXJa
	 sX+FkQZF7MPAw264nnTfyD6vCs4upi9OdXP7lFTJo5hAl+oORiiQnAuK9ipQdq/9KQ
	 fikyiYHoTNUa5b3wS7glIR70VHRXsyEg/0h4Qv60KQOwnlOGiPXKDnUe9xdO9Q/uEn
	 Lp0jeLjNbnQdg/vcnrPAbJV6MoG6Qe+Y6F4i6kSCINC6UDA1UNdUxXTa1nSRGETmVn
	 VawkEQM0B3WiQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	"Ahmed S . Darwish" <darwi@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 03/15] x86/cpu: Remove CPU_SUP_UMC_32 support
Date: Fri, 25 Apr 2025 10:42:00 +0200
Message-ID: <20250425084216.3913608-4-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250425084216.3913608-1-mingo@kernel.org>
References: <20250425084216.3913608-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are 486 based CPUs.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/Kconfig.cpu      | 14 --------------
 arch/x86/kernel/cpu/umc.c | 26 --------------------------
 2 files changed, 40 deletions(-)

diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
index f656033b3a8a..df586ff2178f 100644
--- a/arch/x86/Kconfig.cpu
+++ b/arch/x86/Kconfig.cpu
@@ -376,20 +376,6 @@ config CPU_SUP_TRANSMETA_32
 
 	  If unsure, say N.
 
-config CPU_SUP_UMC_32
-	default y
-	bool "Support UMC processors" if PROCESSOR_SELECT
-	depends on M486SX || M486 || (EXPERT && !64BIT)
-	help
-	  This enables detection, tunings and quirks for UMC processors
-
-	  You need this enabled if you want your kernel to run on a
-	  UMC CPU. Disabling this option on other types of CPUs
-	  makes the kernel a tiny bit smaller. Disabling it on a UMC
-	  CPU might render the kernel unbootable.
-
-	  If unsure, say N.
-
 config CPU_SUP_ZHAOXIN
 	default y
 	bool "Support Zhaoxin processors" if PROCESSOR_SELECT
diff --git a/arch/x86/kernel/cpu/umc.c b/arch/x86/kernel/cpu/umc.c
deleted file mode 100644
index 65a58a390fc3..000000000000
--- a/arch/x86/kernel/cpu/umc.c
+++ /dev/null
@@ -1,26 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <linux/kernel.h>
-#include <asm/processor.h>
-#include "cpu.h"
-
-/*
- * UMC chips appear to be only either 386 or 486,
- * so no special init takes place.
- */
-
-static const struct cpu_dev umc_cpu_dev = {
-	.c_vendor	= "UMC",
-	.c_ident	= { "UMC UMC UMC" },
-	.legacy_models	= {
-		{ .family = 4, .model_names =
-		  {
-			  [1] = "U5D",
-			  [2] = "U5S",
-		  }
-		},
-	},
-	.c_x86_vendor	= X86_VENDOR_UMC,
-};
-
-cpu_dev_register(umc_cpu_dev);
-
-- 
2.45.2

