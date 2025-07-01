Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE8C27510C;
	Tue,  1 Jul 2025 13:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378215; cv=none; b=t0It36bEeYyltlAxLctn1wzzj4cfUqgtcAtV+ULUXtPKeuU3tqAeOHfl/Flq5vXG2D9TkOLzD9VZ0WfKvcssb1td4nSIh15R32DA61wMlqw93iQSqKg8Xv60pmuKTxXtj5aDMaTTHF6aT6/dqQKZpEbEc7XYsMKp+rvQ/kjn6BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378215; c=relaxed/simple;
	bh=ox6i9QWjKiCmOoFpS4FdQnJUmMqGX3zS4XFhykMKXZU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ccwypCdeH/Wu9MGOTW9j1sR2aPTewYSJ+cPyFGg1COg/W/kBXE4MH0Uod1zISmPrrc7F0hpeL4HgkDrt6z9J5x87wxrBQrjUh+/z/9sDPYhpIaI0tnYVqZu+6zjhA1DheluZSMa7p3ttiTgknxUrtH1TB8P8KQq6rwSPb/BouLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE9C32E91;
	Tue,  1 Jul 2025 06:56:38 -0700 (PDT)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C86C33F58B;
	Tue,  1 Jul 2025 06:56:52 -0700 (PDT)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	linux-parisc@vger.kernel.org
Subject: [PATCH 14/23] parisc: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
Date: Tue,  1 Jul 2025 14:56:07 +0100
Message-Id: <20250701135616.29630-15-Dave.Martin@arm.com>
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
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: linux-parisc@vger.kernel.org
---
 arch/parisc/kernel/ptrace.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/parisc/kernel/ptrace.c b/arch/parisc/kernel/ptrace.c
index ceb45f51d52e..8a17ab7e6e0b 100644
--- a/arch/parisc/kernel/ptrace.c
+++ b/arch/parisc/kernel/ptrace.c
@@ -562,12 +562,12 @@ static int gpr_set(struct task_struct *target,
 
 static const struct user_regset native_regsets[] = {
 	[REGSET_GENERAL] = {
-		.core_note_type = NT_PRSTATUS, .n = ELF_NGREG,
+		USER_REGSET_NOTE_TYPE(PRSTATUS), .n = ELF_NGREG,
 		.size = sizeof(long), .align = sizeof(long),
 		.regset_get = gpr_get, .set = gpr_set
 	},
 	[REGSET_FP] = {
-		.core_note_type = NT_PRFPREG, .n = ELF_NFPREG,
+		USER_REGSET_NOTE_TYPE(PRFPREG), .n = ELF_NFPREG,
 		.size = sizeof(__u64), .align = sizeof(__u64),
 		.regset_get = fpr_get, .set = fpr_set
 	}
@@ -629,12 +629,12 @@ static int gpr32_set(struct task_struct *target,
  */
 static const struct user_regset compat_regsets[] = {
 	[REGSET_GENERAL] = {
-		.core_note_type = NT_PRSTATUS, .n = ELF_NGREG,
+		USER_REGSET_NOTE_TYPE(PRSTATUS), .n = ELF_NGREG,
 		.size = sizeof(compat_long_t), .align = sizeof(compat_long_t),
 		.regset_get = gpr32_get, .set = gpr32_set
 	},
 	[REGSET_FP] = {
-		.core_note_type = NT_PRFPREG, .n = ELF_NFPREG,
+		USER_REGSET_NOTE_TYPE(PRFPREG), .n = ELF_NFPREG,
 		.size = sizeof(__u64), .align = sizeof(__u64),
 		.regset_get = fpr_get, .set = fpr_set
 	}
-- 
2.34.1

