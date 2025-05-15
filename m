Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A8E297A6B
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299445; cv=none; b=fsFuOtH5XoMoeivk4QKO3BDO9bQnDFihIrzIWjyBiq7Bj7J1zVoogmBZCHtLjbiGZhH1eW4oVrHLjj6UesYmVgJLY4D69u3B2BjRXVyCVm9+gveRSbCrrmwVItBXCB87Y2k6lfDjZD3yANBnNdkiM/hytje9JpO9IcYeFTeCegw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299445; c=relaxed/simple;
	bh=2tk4H+fk/LrLZYsMn8ozSeweIE7ZBdN4wJXiE7egGzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UifxBPbN2N7pRBfbOZVUZybJM4WBjTJf2ARDlwKahMZhSVWCQLIxXj1h2kll4lkFB5FqrB/zZ8yhr901TrxZU2nzwOwgQGBc3OaYxQo3eF7jrVc6YoAI75Jh8Rw+gzZ7mlZXF5U4Pw23U38syQnB2r4v/tvbJYlDEY0wYIhjQrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TdmM97pF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TdmM97pF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF23C4CEE9;
	Thu, 15 May 2025 08:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747299445;
	bh=2tk4H+fk/LrLZYsMn8ozSeweIE7ZBdN4wJXiE7egGzg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TdmM97pFP3IIhx1JbJeiDkNO9ys7wAIpdqadWORw9ZOgbIcp4MJxAkKeoAUl7cGFd
	 Cfr7K7ziBO6zHszwtqGNTDUR3Xh60jWXX1QgnEW3UQ+P5HKHxO9xqSIp4xnNd2udET
	 6QT3MT9otavKbiByti5esmkE0PyfyGwfJHOUF9con0vNxEDF/PfmPNqOrb/QbimqRF
	 Kg8xdumj/RyCPNSsm1a7hJMtjVpGjQLvJb9/pAMo9tYY8C+hLV6hUMpCFTyI1l6Twt
	 geTPTTdVkL2ITwx5E2BQ1iKpFcr8Suy2qvGmYzV6bwv2aZAv4e4dZXIP13uxGS3UVf
	 5cpgIhjsbhzXA==
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
	Thomas Gleixner <tglx@linutronix.de>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 03/15] x86/cpu: Remove CPU_SUP_UMC_32 support
Date: Thu, 15 May 2025 10:56:53 +0200
Message-ID: <20250515085708.2510123-4-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515085708.2510123-1-mingo@kernel.org>
References: <20250515085708.2510123-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are 486 based CPUs.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Cc: Ahmed S . Darwish <darwi@linutronix.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: H . Peter Anvin <hpa@zytor.com>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Link: https://lore.kernel.org/r/20250425084216.3913608-4-mingo@kernel.org
---
 arch/x86/Kconfig.cpu      | 14 --------------
 arch/x86/kernel/cpu/umc.c | 26 --------------------------
 2 files changed, 40 deletions(-)

diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
index 97bffa97df41..68788de88b1d 100644
--- a/arch/x86/Kconfig.cpu
+++ b/arch/x86/Kconfig.cpu
@@ -375,20 +375,6 @@ config CPU_SUP_TRANSMETA_32
 
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

