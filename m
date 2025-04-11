Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC5B29DB88
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350184; cv=none; b=NMppSQXch8ChZnZontfE/LzqVR78sfmrjPuI7tcaskLgyJsf5VssZauXFF/D/TbZCjZUSC57svFwDT+LFdLBerNU0ldTZQK/5gPG4llZRKqRfnrd7u91vceI/BG04XzTf1f8dynYTEF6zCURxHW8OFA9SDrZoqhWl5ZizU0folM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350184; c=relaxed/simple;
	bh=CW+oLjMLLZx9Xmr4WIfZNc/V67kLp4BlPYfvRUYZM64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MIr6R9TwD/KR9O/DPY3Pw1B0m723+47oTgcEUpGPFYWC/8wmCLu+sQZUKQSA2MjDLFkLKW60dYIfO5+OVXsaLYCKT7x8yWPHvnZ4QrNI1YwM1ZlKoGO/SO+6sLMAwXlpfmDrHq/pQMafqMMt71bvdkPXTCWCNV7A8oIEoJusB1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxiA5bVJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxiA5bVJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8800CC4CEE5;
	Fri, 11 Apr 2025 05:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350184;
	bh=CW+oLjMLLZx9Xmr4WIfZNc/V67kLp4BlPYfvRUYZM64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NxiA5bVJhJFCTNUOvjGGvpsAxFjN3J7xqozxe1Mw7j9gkL2MMemVxYMjRJcfPl8PI
	 sxl0WahQ+NLTgcI77tC7VrNkYXszBHuu7QaWxN7Es/WicJ2kw3ZoK9IEJGmGaHCDAY
	 HSWSlYxBtmK0YR1Pggrv4/Umj2jMHFjO8XkAL56P/w4/o1EB2YsJt01S5o9utiDSNs
	 o2wX8BxvuXjoUJGMfgYI1P8vACwGiGrZ7HHms4O6WFpFS4MfLxr+C8RCjSJQ+NTpM1
	 PCKagMSMl707LfeO9YAIHflmUzlP4Qo/52qUsUK3aH+cywuKNSp8da2SRUAQJEPMFN
	 BuwqJf5asYSOA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 47/53] x86/alternatives: Simplify the #include section
Date: Fri, 11 Apr 2025 07:40:59 +0200
Message-ID: <20250411054105.2341982-48-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250411054105.2341982-1-mingo@kernel.org>
References: <20250411054105.2341982-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We accumulated lots of unnecessary header inclusions over the years,
trim them.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 28 +++-------------------------
 1 file changed, 3 insertions(+), 25 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index b8e0b1b2383f..eb3be5d3efef 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -1,36 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #define pr_fmt(fmt) "SMP alternatives: " fmt
 
-#include <linux/module.h>
-#include <linux/sched.h>
+#include <linux/mmu_context.h>
 #include <linux/perf_event.h>
-#include <linux/mutex.h>
-#include <linux/list.h>
-#include <linux/stringify.h>
-#include <linux/highmem.h>
-#include <linux/mm.h>
 #include <linux/vmalloc.h>
 #include <linux/memory.h>
-#include <linux/stop_machine.h>
-#include <linux/slab.h>
-#include <linux/kdebug.h>
-#include <linux/kprobes.h>
-#include <linux/mmu_context.h>
-#include <linux/bsearch.h>
-#include <linux/sync_core.h>
+
 #include <asm/text-patching.h>
-#include <asm/alternative.h>
-#include <asm/sections.h>
-#include <asm/mce.h>
-#include <asm/nmi.h>
-#include <asm/cacheflush.h>
-#include <asm/tlbflush.h>
 #include <asm/insn.h>
-#include <asm/io.h>
-#include <asm/fixmap.h>
-#include <asm/paravirt.h>
-#include <asm/asm-prototypes.h>
-#include <asm/cfi.h>
+#include <asm/nmi.h>
 
 int __read_mostly alternatives_patched;
 
-- 
2.45.2

