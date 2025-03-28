Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EA3233144
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168553; cv=none; b=XSaA5YMCEzHq+rW5ce6lJd9ZPXQc8zsqL6diuU6/kBOsEQAgBRq215ku88kaPr9T3bvJY75Ybb0BhPOIfo+KKRkrmlGTb/hJHfAC+lzpvm+2jOsf79PFpbyvK+2b5VYvn7xzOokcNthOBIymW4MA83Q7mNJ/JnTV0Vpuvl4U1MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168553; c=relaxed/simple;
	bh=HxCB1zwS8eQL0a0e1XiRZ4zEUKNTLOu4NFQqFhJWyys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b6mncn1A8h6hdGdjbED6a6dqcDej0ZHzGIFA3jm9MjyrHvxwlsnE1j4pEo4AQx8SYCw2nHBxJkw5uxSGPoj7ZXHPZfdiw51vkauIR5Z8l9Dj53iwSwG7pgSp09qH+B3PQSp2HoBRYfgLDUhpN4/ENZglaKX7xgFGLdlaF8ioBd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ElAyk2Fq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ElAyk2Fq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90ECCC4CEE4;
	Fri, 28 Mar 2025 13:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168553;
	bh=HxCB1zwS8eQL0a0e1XiRZ4zEUKNTLOu4NFQqFhJWyys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ElAyk2Fq7hPffw15UI8stR95Ii1uMG9M88cd79nUCgi1ePBqceaaoBVFITLCrKGKA
	 7udP8LDs3oMHIfhKIMJMTINI8QdlKbyFYnF2m9LqMVEPWZ0yXbbsw1Jx4R9PlAimAC
	 7PgEZ866Eo8lewSCjRDDjQzpktP5cVMIqHOUtCUfnDk3TyB57pqLJULO7iDdURl1lB
	 lTLjuPlUWWY6uymTnHpOqB4hNcBdKL2rhIQjLMXQKmN+NwUoI/7IF9ljG9JImZ+YQk
	 FPlnh7heuboUiNm0D3l9Mh38aL0jNEWJdLZvntlPqheowOQyjps23RU+XtKTCFaZLJ
	 VLPodeggg8qKA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 45/49] x86/alternatives: Simplify the #include section
Date: Fri, 28 Mar 2025 14:27:00 +0100
Message-ID: <20250328132704.1901674-46-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328132704.1901674-1-mingo@kernel.org>
References: <20250328132704.1901674-1-mingo@kernel.org>
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
index d724ae8913da..242c0b1f7e40 100644
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

