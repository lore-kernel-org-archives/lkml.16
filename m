Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86EB827A929
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378220; cv=none; b=uw+9NZPvdCJtDbVnLCBUf+Zx9PhQdTiV6VSuhsT2pIXlC2Gv6pNcgAkeecQafgDxKaaNtBo8lobO+lWTzc9vZo1AbBRz5pF12GS7J2bSUONmUd9Utc2gAVe5gu5+gVj8e2emCVSbgysYTlbbOlkCaa5ObsGKDImw8ikxDjbsv8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378220; c=relaxed/simple;
	bh=AAX0iPBJOCozDEx8Jg2VqOvV+HH/ZWLZpQ4wKqZ0Kog=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XRzLjt8bhXfX9zk20D43Hd22xEnfFDd1bY2FsWD2UOLRjhOd44K/yliC+SI68YTrD4Xajc44q9BJdhGSCmqs6wiOSffJWuXechOFZO5+VjKOPzjiMxr0wvOyj+sN3+ehrtPBBp9GatpPtlJzcv2M1UaGHGQrWRJR9+lgtRNdO54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9573A2ED2;
	Tue,  1 Jul 2025 06:56:42 -0700 (PDT)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57E923F58B;
	Tue,  1 Jul 2025 06:56:56 -0700 (PDT)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 16/23] riscv: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
Date: Tue,  1 Jul 2025 14:56:09 +0100
Message-Id: <20250701135616.29630-17-Dave.Martin@arm.com>
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
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/kernel/ptrace.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index ea67e9fb7a58..8e86305831ea 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -186,7 +186,7 @@ static int tagged_addr_ctrl_set(struct task_struct *target,
 
 static const struct user_regset riscv_user_regset[] = {
 	[REGSET_X] = {
-		.core_note_type = NT_PRSTATUS,
+		USER_REGSET_NOTE_TYPE(PRSTATUS),
 		.n = ELF_NGREG,
 		.size = sizeof(elf_greg_t),
 		.align = sizeof(elf_greg_t),
@@ -195,7 +195,7 @@ static const struct user_regset riscv_user_regset[] = {
 	},
 #ifdef CONFIG_FPU
 	[REGSET_F] = {
-		.core_note_type = NT_PRFPREG,
+		USER_REGSET_NOTE_TYPE(PRFPREG),
 		.n = ELF_NFPREG,
 		.size = sizeof(elf_fpreg_t),
 		.align = sizeof(elf_fpreg_t),
@@ -205,7 +205,7 @@ static const struct user_regset riscv_user_regset[] = {
 #endif
 #ifdef CONFIG_RISCV_ISA_V
 	[REGSET_V] = {
-		.core_note_type = NT_RISCV_VECTOR,
+		USER_REGSET_NOTE_TYPE(RISCV_VECTOR),
 		.align = 16,
 		.n = ((32 * RISCV_MAX_VLENB) +
 		      sizeof(struct __riscv_v_regset_state)) / sizeof(__u32),
@@ -216,7 +216,7 @@ static const struct user_regset riscv_user_regset[] = {
 #endif
 #ifdef CONFIG_RISCV_ISA_SUPM
 	[REGSET_TAGGED_ADDR_CTRL] = {
-		.core_note_type = NT_RISCV_TAGGED_ADDR_CTRL,
+		USER_REGSET_NOTE_TYPE(RISCV_TAGGED_ADDR_CTRL),
 		.n = 1,
 		.size = sizeof(long),
 		.align = sizeof(long),
@@ -380,7 +380,7 @@ static int compat_riscv_gpr_set(struct task_struct *target,
 
 static const struct user_regset compat_riscv_user_regset[] = {
 	[REGSET_X] = {
-		.core_note_type = NT_PRSTATUS,
+		USER_REGSET_NOTE_TYPE(PRSTATUS),
 		.n = ELF_NGREG,
 		.size = sizeof(compat_elf_greg_t),
 		.align = sizeof(compat_elf_greg_t),
@@ -389,7 +389,7 @@ static const struct user_regset compat_riscv_user_regset[] = {
 	},
 #ifdef CONFIG_FPU
 	[REGSET_F] = {
-		.core_note_type = NT_PRFPREG,
+		USER_REGSET_NOTE_TYPE(PRFPREG),
 		.n = ELF_NFPREG,
 		.size = sizeof(elf_fpreg_t),
 		.align = sizeof(elf_fpreg_t),
-- 
2.34.1

