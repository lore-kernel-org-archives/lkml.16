Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6681DFDAB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743481654; cv=none; b=BbPpEoA5GA7j9HLh9GoWtVdf1d6kFWlX8R142Wdx24ITIcryCWc4NhetSfpcOlte17/9vqdpIWA4SrPHJ6SB0jgMB64hOXjrumDP89YmHvZ3raIc4jxpQ7xbvJtdfRbe1YXJU7Z2Rz5VN41Yk/dFcbysWfQrCkHnkHBMcaT5i1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743481654; c=relaxed/simple;
	bh=iZmlswQ3UvXTNTH1uFvXsw0rEiRaXkBAaCexmzsnDMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a+/OUIeyxq4LQoWwXuM5EFgIDUElG+A2V2oSU62ykwtA31iNMrSBWSfpLnmV2ivlzQFqp0xCbpogtNjwpk5m8/wBFhaj/7hDm55jL4NpSo6EDSpvJEw6Uj5coPsDwJgvOtwOSLK0KHYXH4PQT9zdVtW5ysb5K8DcZMyOxFaSxfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KpFXWg1z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KpFXWg1z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C1BC4CEF2;
	Tue,  1 Apr 2025 04:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743481654;
	bh=iZmlswQ3UvXTNTH1uFvXsw0rEiRaXkBAaCexmzsnDMc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KpFXWg1zOoDO6YBmxuDfiCEDJlkaLSqPIQkTOJ0w2lTFSDAf5HRMN/ILv1/VWnaJJ
	 pClY4UfBCuBGCYti3HKLFuNMoPxKPrnEsTF8KcZj+d0ZpVny+6gdlaZMFVhN6EIsVt
	 9PTHnrZWkRb8j5/mvUiDxDwhfgBqFgjj0nq7I45/6DZgrPxRyXGP25SIgHZx+0XjdK
	 /nW+oBrr4ZW73fyRJ6FsjkRHR3bIX8zLtEDjWWNCmbWj7pgDRO6kRTEl+bpdh4zgX8
	 7efB5vnziusZh+435rHxhVujflRU/vIT7UpZBS2FNklH833k6kXR6lRmsn7yimw+t4
	 yOxDDdUcrHCQA==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 08/11] objtool/loongarch: Add unwind hints in prepare_frametrace()
Date: Mon, 31 Mar 2025 21:26:43 -0700
Message-ID: <270cadd8040dda74db2307f23497bb68e65db98d.1743481539.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1743481539.git.jpoimboe@kernel.org>
References: <cover.1743481539.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If 'regs' points to a local stack variable, prepare_frametrace() stores
all registers to the stack.  This confuses objtool as it expects them to
be restored from the stack later.

The stores don't affect stack tracing, so use unwind hints to hide them
from objtool.

Fixes the following warnings:

  arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-160
  arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[23]=-1+0 reg2[23]=-2-152

Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
Fixes: cb8a2ef0848c ("LoongArch: Add ORC stack unwinder support")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503280703.OARM8SrY-lkp@intel.com/
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/loongarch/include/asm/stacktrace.h   |  3 +++
 arch/loongarch/include/asm/unwind_hints.h | 10 +++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/stacktrace.h b/arch/loongarch/include/asm/stacktrace.h
index f23adb15f418..fc8b64773794 100644
--- a/arch/loongarch/include/asm/stacktrace.h
+++ b/arch/loongarch/include/asm/stacktrace.h
@@ -8,6 +8,7 @@
 #include <asm/asm.h>
 #include <asm/ptrace.h>
 #include <asm/loongarch.h>
+#include <asm/unwind_hints.h>
 #include <linux/stringify.h>
 
 enum stack_type {
@@ -43,6 +44,7 @@ int get_stack_info(unsigned long stack, struct task_struct *task, struct stack_i
 static __always_inline void prepare_frametrace(struct pt_regs *regs)
 {
 	__asm__ __volatile__(
+		UNWIND_HINT_SAVE
 		/* Save $ra */
 		STORE_ONE_REG(1)
 		/* Use $ra to save PC */
@@ -80,6 +82,7 @@ static __always_inline void prepare_frametrace(struct pt_regs *regs)
 		STORE_ONE_REG(29)
 		STORE_ONE_REG(30)
 		STORE_ONE_REG(31)
+		UNWIND_HINT_RESTORE
 		: "=m" (regs->csr_era)
 		: "r" (regs->regs)
 		: "memory");
diff --git a/arch/loongarch/include/asm/unwind_hints.h b/arch/loongarch/include/asm/unwind_hints.h
index a01086ad9dde..2c68bc72736c 100644
--- a/arch/loongarch/include/asm/unwind_hints.h
+++ b/arch/loongarch/include/asm/unwind_hints.h
@@ -23,6 +23,14 @@
 	UNWIND_HINT sp_reg=ORC_REG_SP type=UNWIND_HINT_TYPE_CALL
 .endm
 
-#endif /* __ASSEMBLY__ */
+#else /* !__ASSEMBLY__ */
+
+#define UNWIND_HINT_SAVE \
+	UNWIND_HINT(UNWIND_HINT_TYPE_SAVE, 0, 0, 0)
+
+#define UNWIND_HINT_RESTORE \
+	UNWIND_HINT(UNWIND_HINT_TYPE_RESTORE, 0, 0, 0)
+
+#endif /* !__ASSEMBLY__ */
 
 #endif /* _ASM_LOONGARCH_UNWIND_HINTS_H */
-- 
2.48.1

