Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E8127F160
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378230; cv=none; b=JU4zlp4sqZp1cKm9vRymmD0PefbYdEFLeF0BU0pyxR21bGfkWU0DC6NV6iXsuARvXU985DvswizVlFuV2ju73JqY2cJ/4vXcLXR9Euf1y/GsqsSIsYh42aUBEp7PHjtT3Vp1xI/Xi3SELzeeUnOmdAjQCThCBDgwMBALIx2TDy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378230; c=relaxed/simple;
	bh=mBa622U6pXefIiJyrD9MBioY7AjrmbwcSnWuYKTyB+U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G7FIjzuo/zFl1t1RAqiJKN6mSmlUfJtW7nRsbU56IyUgfjtHXKylfTciCQoXW4m7vVoaq/drMqJ06WL8aPdG2VfIp/or8ejVCp5IaXTWkMACdNJXsRCueYqclqBaSsdgccJly86EB4iLPdAuJ+eNQXVDavjTAeFjrnGhFQXWfWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD4822EC6;
	Tue,  1 Jul 2025 06:56:52 -0700 (PDT)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0EE73F58B;
	Tue,  1 Jul 2025 06:57:05 -0700 (PDT)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	linux-um@lists.infradead.org,
	x86@kernel.org
Subject: [PATCH 21/23] um: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
Date: Tue,  1 Jul 2025 14:56:14 +0100
Message-Id: <20250701135616.29630-22-Dave.Martin@arm.com>
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
Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: linux-um@lists.infradead.org
Cc: x86@kernel.org
---
 arch/x86/um/ptrace.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/um/ptrace.c b/arch/x86/um/ptrace.c
index 3275870330fe..c982ab7103f1 100644
--- a/arch/x86/um/ptrace.c
+++ b/arch/x86/um/ptrace.c
@@ -236,7 +236,7 @@ static int generic_fpregs_set(struct task_struct *target,
 
 static struct user_regset uml_regsets[] __ro_after_init = {
 	[REGSET_GENERAL] = {
-		.core_note_type	= NT_PRSTATUS,
+		USER_REGSET_NOTE_TYPE(PRSTATUS),
 		.n		= sizeof(struct user_regs_struct) / sizeof(long),
 		.size		= sizeof(long),
 		.align		= sizeof(long),
@@ -246,7 +246,7 @@ static struct user_regset uml_regsets[] __ro_after_init = {
 #ifdef CONFIG_X86_32
 	/* Old FP registers, they are needed in signal frames */
 	[REGSET_FP_LEGACY] = {
-		.core_note_type	= NT_PRFPREG,
+		USER_REGSET_NOTE_TYPE(PRFPREG),
 		.n		= sizeof(struct user_i387_ia32_struct) / sizeof(long),
 		.size		= sizeof(long),
 		.align		= sizeof(long),
@@ -257,10 +257,10 @@ static struct user_regset uml_regsets[] __ro_after_init = {
 #endif
 	[REGSET_FP] = {
 #ifdef CONFIG_X86_32
-		.core_note_type	= NT_PRXFPREG,
+		USER_REGSET_NOTE_TYPE(PRXFPREG),
 		.n		= sizeof(struct user32_fxsr_struct) / sizeof(long),
 #else
-		.core_note_type	= NT_PRFPREG,
+		USER_REGSET_NOTE_TYPE(PRFPREG),
 		.n		= sizeof(struct user_i387_struct) / sizeof(long),
 #endif
 		.size		= sizeof(long),
@@ -270,7 +270,7 @@ static struct user_regset uml_regsets[] __ro_after_init = {
 		.set		= generic_fpregs_set,
 	},
 	[REGSET_XSTATE] = {
-		.core_note_type	= NT_X86_XSTATE,
+		USER_REGSET_NOTE_TYPE(X86_XSTATE),
 		.size		= sizeof(long),
 		.align		= sizeof(long),
 		.active		= generic_fpregs_active,
-- 
2.34.1

