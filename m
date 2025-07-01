Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1079F27934E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378208; cv=none; b=UIDlllaLkCLM25hx6+opSuOKFEUmWYfsXzjFc7M3LodaBGXjLCrtnundd2JlPYVSGYMBxH8IzFJIesZk8XjcGwehB9DEq2LVZNh1ZOfGnvnDbcrzqaeXqPAytcAsJn5fDFVX74/cnTzx3PIH9x9rgMsW++stPwut7Eb0SkpCOjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378208; c=relaxed/simple;
	bh=ytq/9fww8AXTLVMYocd4pAESXZABk52E6oaAbFgnIrc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gKUbVMWqJKchXJQpAv91vqy+H72wAI7AAXfxO07w+I5hi7VjDSncgNH8OBFagNne4N7J27RK4IdpdoTIdyKLR1Ny95ov98fNziKQa+i1JuNI7m6WCayEnO8+SA9GiIHyD9fXEDCS62M44q4YlrL6I/gThMpgNINQbrlf2GUnbhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D1292E8E;
	Tue,  1 Jul 2025 06:56:31 -0700 (PDT)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2716D3F58B;
	Tue,  1 Jul 2025 06:56:45 -0700 (PDT)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	loongarch@lists.linux.dev
Subject: [PATCH 09/23] LoongArch: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
Date: Tue,  1 Jul 2025 14:56:02 +0100
Message-Id: <20250701135616.29630-10-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701135616.29630-1-Dave.Martin@arm.com>
References: <20250701135616.29630-1-Dave.Martin@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of having the core code guess the note name for each regset,
use USER_REGSET_NOTE_TYPE() to pick the correct name from elf.h.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: loongarch@lists.linux.dev
---
 arch/loongarch/kernel/ptrace.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/kernel/ptrace.c b/arch/loongarch/kernel/ptrace.c
index 5e2402cfcab0..8edd0954e55a 100644
--- a/arch/loongarch/kernel/ptrace.c
+++ b/arch/loongarch/kernel/ptrace.c
@@ -864,7 +864,7 @@ enum loongarch_regset {
 
 static const struct user_regset loongarch64_regsets[] = {
 	[REGSET_GPR] = {
-		.core_note_type	= NT_PRSTATUS,
+		USER_REGSET_NOTE_TYPE(PRSTATUS),
 		.n		= ELF_NGREG,
 		.size		= sizeof(elf_greg_t),
 		.align		= sizeof(elf_greg_t),
@@ -872,7 +872,7 @@ static const struct user_regset loongarch64_regsets[] = {
 		.set		= gpr_set,
 	},
 	[REGSET_FPR] = {
-		.core_note_type	= NT_PRFPREG,
+		USER_REGSET_NOTE_TYPE(PRFPREG),
 		.n		= ELF_NFPREG,
 		.size		= sizeof(elf_fpreg_t),
 		.align		= sizeof(elf_fpreg_t),
@@ -880,7 +880,7 @@ static const struct user_regset loongarch64_regsets[] = {
 		.set		= fpr_set,
 	},
 	[REGSET_CPUCFG] = {
-		.core_note_type	= NT_LOONGARCH_CPUCFG,
+		USER_REGSET_NOTE_TYPE(LOONGARCH_CPUCFG),
 		.n		= 64,
 		.size		= sizeof(u32),
 		.align		= sizeof(u32),
@@ -889,7 +889,7 @@ static const struct user_regset loongarch64_regsets[] = {
 	},
 #ifdef CONFIG_CPU_HAS_LSX
 	[REGSET_LSX] = {
-		.core_note_type	= NT_LOONGARCH_LSX,
+		USER_REGSET_NOTE_TYPE(LOONGARCH_LSX),
 		.n		= NUM_FPU_REGS,
 		.size		= 16,
 		.align		= 16,
@@ -899,7 +899,7 @@ static const struct user_regset loongarch64_regsets[] = {
 #endif
 #ifdef CONFIG_CPU_HAS_LASX
 	[REGSET_LASX] = {
-		.core_note_type	= NT_LOONGARCH_LASX,
+		USER_REGSET_NOTE_TYPE(LOONGARCH_LASX),
 		.n		= NUM_FPU_REGS,
 		.size		= 32,
 		.align		= 32,
@@ -909,7 +909,7 @@ static const struct user_regset loongarch64_regsets[] = {
 #endif
 #ifdef CONFIG_CPU_HAS_LBT
 	[REGSET_LBT] = {
-		.core_note_type	= NT_LOONGARCH_LBT,
+		USER_REGSET_NOTE_TYPE(LOONGARCH_LBT),
 		.n		= 5,
 		.size		= sizeof(u64),
 		.align		= sizeof(u64),
@@ -919,7 +919,7 @@ static const struct user_regset loongarch64_regsets[] = {
 #endif
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 	[REGSET_HW_BREAK] = {
-		.core_note_type = NT_LOONGARCH_HW_BREAK,
+		USER_REGSET_NOTE_TYPE(LOONGARCH_HW_BREAK),
 		.n = sizeof(struct user_watch_state_v2) / sizeof(u32),
 		.size = sizeof(u32),
 		.align = sizeof(u32),
@@ -927,7 +927,7 @@ static const struct user_regset loongarch64_regsets[] = {
 		.set = hw_break_set,
 	},
 	[REGSET_HW_WATCH] = {
-		.core_note_type = NT_LOONGARCH_HW_WATCH,
+		USER_REGSET_NOTE_TYPE(LOONGARCH_HW_WATCH),
 		.n = sizeof(struct user_watch_state_v2) / sizeof(u32),
 		.size = sizeof(u32),
 		.align = sizeof(u32),
-- 
2.34.1

