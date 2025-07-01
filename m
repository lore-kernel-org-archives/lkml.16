Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C144B277C86
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378202; cv=none; b=n4NA/uwmGQ8Ja6QE0WyT+hUn3s0eswHqSCffOQJ3WdEodYMjFuCMmRQCW/OckoJZjs5MrsxorL06+siGf0L/dy0wK/Gbez3hGIkrSqBeW9g38wkW03o9htLRFzKwpESLaW6lvDsLgs0FBb97ewYJXLgV1Ax9HHyUFF4bpwOnOGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378202; c=relaxed/simple;
	bh=ieyE9ETnb3U8FCyTH8Xt6FmpLK2fj7uOWDi1mDrtPbY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k49ShSz8BTcxYO3BXagRvvXIrWJexe8UlAsCTMxxAr1A3yaMEUEpFgDsKl3wPrO8UWfAxQzBG4xqvxPYqzVJs6drTf+wJBSaeNL5tBWBSWtf60Yb925CYROCQr3gPZk8C6MMtutYl4KKfVVP590oWJ1IZ3mWqezzijXoupbHHJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C009626BA;
	Tue,  1 Jul 2025 06:56:24 -0700 (PDT)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED95F3F58B;
	Tue,  1 Jul 2025 06:56:38 -0700 (PDT)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/23] ARM: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
Date: Tue,  1 Jul 2025 14:55:58 +0100
Message-Id: <20250701135616.29630-6-Dave.Martin@arm.com>
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
Cc: Russell King <linux@armlinux.org.uk>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/kernel/ptrace.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/kernel/ptrace.c b/arch/arm/kernel/ptrace.c
index c421a899fc84..7951b2c06fec 100644
--- a/arch/arm/kernel/ptrace.c
+++ b/arch/arm/kernel/ptrace.c
@@ -677,7 +677,7 @@ enum arm_regset {
 
 static const struct user_regset arm_regsets[] = {
 	[REGSET_GPR] = {
-		.core_note_type = NT_PRSTATUS,
+		USER_REGSET_NOTE_TYPE(PRSTATUS),
 		.n = ELF_NGREG,
 		.size = sizeof(u32),
 		.align = sizeof(u32),
@@ -689,7 +689,7 @@ static const struct user_regset arm_regsets[] = {
 		 * For the FPA regs in fpstate, the real fields are a mixture
 		 * of sizes, so pretend that the registers are word-sized:
 		 */
-		.core_note_type = NT_PRFPREG,
+		USER_REGSET_NOTE_TYPE(PRFPREG),
 		.n = sizeof(struct user_fp) / sizeof(u32),
 		.size = sizeof(u32),
 		.align = sizeof(u32),
@@ -702,7 +702,7 @@ static const struct user_regset arm_regsets[] = {
 		 * Pretend that the VFP regs are word-sized, since the FPSCR is
 		 * a single word dangling at the end of struct user_vfp:
 		 */
-		.core_note_type = NT_ARM_VFP,
+		USER_REGSET_NOTE_TYPE(ARM_VFP),
 		.n = ARM_VFPREGS_SIZE / sizeof(u32),
 		.size = sizeof(u32),
 		.align = sizeof(u32),
-- 
2.34.1

