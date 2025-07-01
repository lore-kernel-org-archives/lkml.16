Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EBE9277CB2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378203; cv=none; b=ON3UhUONvtQruu6+jqjxjJr68tezcfg2EB7EJHipinTRYlquh4HR1DCOWIkLeDliv3y6cyDmJRjxeiKpBD7kYKb+7htFiGOr1GRRmeKqn2Y5vfd3xEbCP6kv5GQDeSWra3gT8KpX3MrSmAhNuoWxJJgrwH/1sw1SLfKk28HVsqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378203; c=relaxed/simple;
	bh=fGBQy5H9Eg8UKPtdjbbWliurPYD6999EXV9MDysGqv0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aDWVziip1PpBAUbDfSenU+siWDlFcbE4S1fPtM+VBFr7Ifz4NE2A+NPaY83fR0A0A2y0kGmoAzn0OhSrTKAY0Ad8OmHy3n7QXhFtFGM95aMKAB1dBV7wKdyE9du5MzBgZ6vMfOV9O9IKqVBqlnra++/MMzq74PnxCbs5DT/rbtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88F872D8E;
	Tue,  1 Jul 2025 06:56:26 -0700 (PDT)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D7FA3F58B;
	Tue,  1 Jul 2025 06:56:40 -0700 (PDT)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 06/23] arm64: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
Date: Tue,  1 Jul 2025 14:55:59 +0100
Message-Id: <20250701135616.29630-7-Dave.Martin@arm.com>
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

This does not affect the correctness of switch(note_type) and similar
code, since note type values known to Linux for coredump purposes were
already required to be unique.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/kernel/ptrace.c | 52 +++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index ee94b72bf8fb..4b001121c72d 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -1586,7 +1586,7 @@ enum aarch64_regset {
 
 static const struct user_regset aarch64_regsets[] = {
 	[REGSET_GPR] = {
-		.core_note_type = NT_PRSTATUS,
+		USER_REGSET_NOTE_TYPE(PRSTATUS),
 		.n = sizeof(struct user_pt_regs) / sizeof(u64),
 		.size = sizeof(u64),
 		.align = sizeof(u64),
@@ -1594,7 +1594,7 @@ static const struct user_regset aarch64_regsets[] = {
 		.set = gpr_set
 	},
 	[REGSET_FPR] = {
-		.core_note_type = NT_PRFPREG,
+		USER_REGSET_NOTE_TYPE(PRFPREG),
 		.n = sizeof(struct user_fpsimd_state) / sizeof(u32),
 		/*
 		 * We pretend we have 32-bit registers because the fpsr and
@@ -1607,7 +1607,7 @@ static const struct user_regset aarch64_regsets[] = {
 		.set = fpr_set
 	},
 	[REGSET_TLS] = {
-		.core_note_type = NT_ARM_TLS,
+		USER_REGSET_NOTE_TYPE(ARM_TLS),
 		.n = 2,
 		.size = sizeof(void *),
 		.align = sizeof(void *),
@@ -1616,7 +1616,7 @@ static const struct user_regset aarch64_regsets[] = {
 	},
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 	[REGSET_HW_BREAK] = {
-		.core_note_type = NT_ARM_HW_BREAK,
+		USER_REGSET_NOTE_TYPE(ARM_HW_BREAK),
 		.n = sizeof(struct user_hwdebug_state) / sizeof(u32),
 		.size = sizeof(u32),
 		.align = sizeof(u32),
@@ -1624,7 +1624,7 @@ static const struct user_regset aarch64_regsets[] = {
 		.set = hw_break_set,
 	},
 	[REGSET_HW_WATCH] = {
-		.core_note_type = NT_ARM_HW_WATCH,
+		USER_REGSET_NOTE_TYPE(ARM_HW_WATCH),
 		.n = sizeof(struct user_hwdebug_state) / sizeof(u32),
 		.size = sizeof(u32),
 		.align = sizeof(u32),
@@ -1633,7 +1633,7 @@ static const struct user_regset aarch64_regsets[] = {
 	},
 #endif
 	[REGSET_SYSTEM_CALL] = {
-		.core_note_type = NT_ARM_SYSTEM_CALL,
+		USER_REGSET_NOTE_TYPE(ARM_SYSTEM_CALL),
 		.n = 1,
 		.size = sizeof(int),
 		.align = sizeof(int),
@@ -1641,7 +1641,7 @@ static const struct user_regset aarch64_regsets[] = {
 		.set = system_call_set,
 	},
 	[REGSET_FPMR] = {
-		.core_note_type = NT_ARM_FPMR,
+		USER_REGSET_NOTE_TYPE(ARM_FPMR),
 		.n = 1,
 		.size = sizeof(u64),
 		.align = sizeof(u64),
@@ -1650,7 +1650,7 @@ static const struct user_regset aarch64_regsets[] = {
 	},
 #ifdef CONFIG_ARM64_SVE
 	[REGSET_SVE] = { /* Scalable Vector Extension */
-		.core_note_type = NT_ARM_SVE,
+		USER_REGSET_NOTE_TYPE(ARM_SVE),
 		.n = DIV_ROUND_UP(SVE_PT_SIZE(ARCH_SVE_VQ_MAX,
 					      SVE_PT_REGS_SVE),
 				  SVE_VQ_BYTES),
@@ -1662,7 +1662,7 @@ static const struct user_regset aarch64_regsets[] = {
 #endif
 #ifdef CONFIG_ARM64_SME
 	[REGSET_SSVE] = { /* Streaming mode SVE */
-		.core_note_type = NT_ARM_SSVE,
+		USER_REGSET_NOTE_TYPE(ARM_SSVE),
 		.n = DIV_ROUND_UP(SVE_PT_SIZE(SME_VQ_MAX, SVE_PT_REGS_SVE),
 				  SVE_VQ_BYTES),
 		.size = SVE_VQ_BYTES,
@@ -1671,7 +1671,7 @@ static const struct user_regset aarch64_regsets[] = {
 		.set = ssve_set,
 	},
 	[REGSET_ZA] = { /* SME ZA */
-		.core_note_type = NT_ARM_ZA,
+		USER_REGSET_NOTE_TYPE(ARM_ZA),
 		/*
 		 * ZA is a single register but it's variably sized and
 		 * the ptrace core requires that the size of any data
@@ -1687,7 +1687,7 @@ static const struct user_regset aarch64_regsets[] = {
 		.set = za_set,
 	},
 	[REGSET_ZT] = { /* SME ZT */
-		.core_note_type = NT_ARM_ZT,
+		USER_REGSET_NOTE_TYPE(ARM_ZT),
 		.n = 1,
 		.size = ZT_SIG_REG_BYTES,
 		.align = sizeof(u64),
@@ -1697,7 +1697,7 @@ static const struct user_regset aarch64_regsets[] = {
 #endif
 #ifdef CONFIG_ARM64_PTR_AUTH
 	[REGSET_PAC_MASK] = {
-		.core_note_type = NT_ARM_PAC_MASK,
+		USER_REGSET_NOTE_TYPE(ARM_PAC_MASK),
 		.n = sizeof(struct user_pac_mask) / sizeof(u64),
 		.size = sizeof(u64),
 		.align = sizeof(u64),
@@ -1705,7 +1705,7 @@ static const struct user_regset aarch64_regsets[] = {
 		/* this cannot be set dynamically */
 	},
 	[REGSET_PAC_ENABLED_KEYS] = {
-		.core_note_type = NT_ARM_PAC_ENABLED_KEYS,
+		USER_REGSET_NOTE_TYPE(ARM_PAC_ENABLED_KEYS),
 		.n = 1,
 		.size = sizeof(long),
 		.align = sizeof(long),
@@ -1714,7 +1714,7 @@ static const struct user_regset aarch64_regsets[] = {
 	},
 #ifdef CONFIG_CHECKPOINT_RESTORE
 	[REGSET_PACA_KEYS] = {
-		.core_note_type = NT_ARM_PACA_KEYS,
+		USER_REGSET_NOTE_TYPE(ARM_PACA_KEYS),
 		.n = sizeof(struct user_pac_address_keys) / sizeof(__uint128_t),
 		.size = sizeof(__uint128_t),
 		.align = sizeof(__uint128_t),
@@ -1722,7 +1722,7 @@ static const struct user_regset aarch64_regsets[] = {
 		.set = pac_address_keys_set,
 	},
 	[REGSET_PACG_KEYS] = {
-		.core_note_type = NT_ARM_PACG_KEYS,
+		USER_REGSET_NOTE_TYPE(ARM_PACG_KEYS),
 		.n = sizeof(struct user_pac_generic_keys) / sizeof(__uint128_t),
 		.size = sizeof(__uint128_t),
 		.align = sizeof(__uint128_t),
@@ -1733,7 +1733,7 @@ static const struct user_regset aarch64_regsets[] = {
 #endif
 #ifdef CONFIG_ARM64_TAGGED_ADDR_ABI
 	[REGSET_TAGGED_ADDR_CTRL] = {
-		.core_note_type = NT_ARM_TAGGED_ADDR_CTRL,
+		USER_REGSET_NOTE_TYPE(ARM_TAGGED_ADDR_CTRL),
 		.n = 1,
 		.size = sizeof(long),
 		.align = sizeof(long),
@@ -1743,7 +1743,7 @@ static const struct user_regset aarch64_regsets[] = {
 #endif
 #ifdef CONFIG_ARM64_POE
 	[REGSET_POE] = {
-		.core_note_type = NT_ARM_POE,
+		USER_REGSET_NOTE_TYPE(ARM_POE),
 		.n = 1,
 		.size = sizeof(long),
 		.align = sizeof(long),
@@ -1753,7 +1753,7 @@ static const struct user_regset aarch64_regsets[] = {
 #endif
 #ifdef CONFIG_ARM64_GCS
 	[REGSET_GCS] = {
-		.core_note_type = NT_ARM_GCS,
+		USER_REGSET_NOTE_TYPE(ARM_GCS),
 		.n = sizeof(struct user_gcs) / sizeof(u64),
 		.size = sizeof(u64),
 		.align = sizeof(u64),
@@ -1943,7 +1943,7 @@ static int compat_tls_set(struct task_struct *target,
 
 static const struct user_regset aarch32_regsets[] = {
 	[REGSET_COMPAT_GPR] = {
-		.core_note_type = NT_PRSTATUS,
+		USER_REGSET_NOTE_TYPE(PRSTATUS),
 		.n = COMPAT_ELF_NGREG,
 		.size = sizeof(compat_elf_greg_t),
 		.align = sizeof(compat_elf_greg_t),
@@ -1951,7 +1951,7 @@ static const struct user_regset aarch32_regsets[] = {
 		.set = compat_gpr_set
 	},
 	[REGSET_COMPAT_VFP] = {
-		.core_note_type = NT_ARM_VFP,
+		USER_REGSET_NOTE_TYPE(ARM_VFP),
 		.n = VFP_STATE_SIZE / sizeof(compat_ulong_t),
 		.size = sizeof(compat_ulong_t),
 		.align = sizeof(compat_ulong_t),
@@ -1968,7 +1968,7 @@ static const struct user_regset_view user_aarch32_view = {
 
 static const struct user_regset aarch32_ptrace_regsets[] = {
 	[REGSET_GPR] = {
-		.core_note_type = NT_PRSTATUS,
+		USER_REGSET_NOTE_TYPE(PRSTATUS),
 		.n = COMPAT_ELF_NGREG,
 		.size = sizeof(compat_elf_greg_t),
 		.align = sizeof(compat_elf_greg_t),
@@ -1976,7 +1976,7 @@ static const struct user_regset aarch32_ptrace_regsets[] = {
 		.set = compat_gpr_set
 	},
 	[REGSET_FPR] = {
-		.core_note_type = NT_ARM_VFP,
+		USER_REGSET_NOTE_TYPE(ARM_VFP),
 		.n = VFP_STATE_SIZE / sizeof(compat_ulong_t),
 		.size = sizeof(compat_ulong_t),
 		.align = sizeof(compat_ulong_t),
@@ -1984,7 +1984,7 @@ static const struct user_regset aarch32_ptrace_regsets[] = {
 		.set = compat_vfp_set
 	},
 	[REGSET_TLS] = {
-		.core_note_type = NT_ARM_TLS,
+		USER_REGSET_NOTE_TYPE(ARM_TLS),
 		.n = 1,
 		.size = sizeof(compat_ulong_t),
 		.align = sizeof(compat_ulong_t),
@@ -1993,7 +1993,7 @@ static const struct user_regset aarch32_ptrace_regsets[] = {
 	},
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 	[REGSET_HW_BREAK] = {
-		.core_note_type = NT_ARM_HW_BREAK,
+		USER_REGSET_NOTE_TYPE(ARM_HW_BREAK),
 		.n = sizeof(struct user_hwdebug_state) / sizeof(u32),
 		.size = sizeof(u32),
 		.align = sizeof(u32),
@@ -2001,7 +2001,7 @@ static const struct user_regset aarch32_ptrace_regsets[] = {
 		.set = hw_break_set,
 	},
 	[REGSET_HW_WATCH] = {
-		.core_note_type = NT_ARM_HW_WATCH,
+		USER_REGSET_NOTE_TYPE(ARM_HW_WATCH),
 		.n = sizeof(struct user_hwdebug_state) / sizeof(u32),
 		.size = sizeof(u32),
 		.align = sizeof(u32),
@@ -2010,7 +2010,7 @@ static const struct user_regset aarch32_ptrace_regsets[] = {
 	},
 #endif
 	[REGSET_SYSTEM_CALL] = {
-		.core_note_type = NT_ARM_SYSTEM_CALL,
+		USER_REGSET_NOTE_TYPE(ARM_SYSTEM_CALL),
 		.n = 1,
 		.size = sizeof(int),
 		.align = sizeof(int),
-- 
2.34.1

