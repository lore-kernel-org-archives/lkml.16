Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45BA8F5B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 11:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750764668; cv=none; b=DVptsBYISxkZhmG3RyXLA1aY9NKN5kBh5k4TkO/ik4LJYQwNklSkq0usv4cupxAIGJAl/fCWRDL91TlkKUMrNrrDrOw25cZ8YNhlwMaHvtQP31zy79tUhqWWKiVhumO9C99nTRxZ+SZgF2kfgD5ZdB2EcYTKRFM6PdM4i8/mmFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750764668; c=relaxed/simple;
	bh=a6FQRtWgdc4H6ouPQjEBGjBObZvMnwOumkGQDBxKJ+s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fe0ovtEOTzEuNLKD05kyq0kiwF758cuRNg2JmELgg9nI91/M/fLddz+W9qIcT5rTcComgGTBAVkBJUeXZtaL6wOuyCLufMtJRfDtgvbqfIYMaDvNqcWXLeAg9bc7CoT2J6g78Nsf/0YvwWAIXIOIX1sOGP1i1iFrDNekkfchCVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bRN1m0MS3z10XPc;
	Tue, 24 Jun 2025 19:26:20 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id E58281402EA;
	Tue, 24 Jun 2025 19:30:56 +0800 (CST)
Received: from kwepemq200002.china.huawei.com (7.202.195.90) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 24 Jun 2025 19:30:54 +0800
Received: from M910t.huawei.com (10.110.54.157) by
 kwepemq200002.china.huawei.com (7.202.195.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 24 Jun 2025 19:30:54 +0800
From: Changbin Du <changbin.du@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Alexandre Ghiti <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Changbin Du <changbin.du@huawei.com>
Subject: [PATCH] riscv: Prevent early kernel panic in instrumented apply_early_boot_alternatives
Date: Tue, 24 Jun 2025 19:30:42 +0800
Message-ID: <20250624113042.2123140-1-changbin.du@huawei.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq200002.china.huawei.com (7.202.195.90)

Under FTRACE=y, DYNAMIC_FTRACE=n, and RISCV_ALTERNATIVE_EARLY=n, the kernel
panics upon returning from _mcount() in the early boot path. This occurs
during _start_kernel() -> setup_vm() -> apply_early_boot_alternatives().

The CC_FLAGS_FTRACE is only removed from alternative.c when
CONFIG_RISCV_ALTERNATIVE_EARLY=y. Therefore, no function calls should be
made to alternative.c during early boot in this configuration.

Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
Signed-off-by: Changbin Du <changbin.du@huawei.com>
---
 arch/riscv/include/asm/alternative.h | 6 ++++++
 arch/riscv/kernel/alternative.c      | 4 ++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index 3c2b59b25017..c670b0cc55f4 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -31,7 +31,13 @@
 #define ALT_ALT_PTR(a)			__ALT_PTR(a, alt_offset)
 
 void __init apply_boot_alternatives(void);
+
+# ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
 void __init apply_early_boot_alternatives(void);
+# else
+static inline void apply_early_boot_alternatives(void) { }
+# endif
+
 void apply_module_alternatives(void *start, size_t length);
 
 void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index 7eb3cb1215c6..5406c3301627 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -205,6 +205,7 @@ void __init apply_boot_alternatives(void)
 	apply_vdso_alternatives();
 }
 
+#ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
 /*
  * apply_early_boot_alternatives() is called from setup_vm() with MMU-off.
  *
@@ -219,12 +220,11 @@ void __init apply_boot_alternatives(void)
  */
 void __init apply_early_boot_alternatives(void)
 {
-#ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
 	_apply_alternatives((struct alt_entry *)__alt_start,
 			    (struct alt_entry *)__alt_end,
 			    RISCV_ALTERNATIVES_EARLY_BOOT);
-#endif
 }
+#endif
 
 #ifdef CONFIG_MODULES
 void apply_module_alternatives(void *start, size_t length)
-- 
2.43.0

