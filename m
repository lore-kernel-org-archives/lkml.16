Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05FF227817D;
	Tue,  1 Jul 2025 13:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378205; cv=none; b=mRuwewYzQ/bpve095w5im27Hm6URVS0WKfnfRA1Pfp/fsTQXp5BmmVH1Rf0GBM/10xV/8YGlD3dj6HEEay/ZapnPmXAMSfmMDBWgNknVPdy2OPK8vjoSmwOQ7reMQTMztaFBXjRT88nunNVtFtqEnrZaW6loYa2/zsph/rH0ejo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378205; c=relaxed/simple;
	bh=3bIgU0XyHqo1DF6Gu7rQQsMcLwH873FqmpmTDaoYukM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pvl8h7VZ7n2JTifG7JpAUGa5ufK5sGQ4kEUo/ptyzjDe2DH84Dy6g+Zh55hxwHHJkIW1Ck2NUN6JdSZkKcCZjtXZq3WBGzAc6W50UIgp0Vb9miig+TZul642TroolG13HxUIbpcQUiPVy2idZm3x+AbjZm1+F8d8pRuUh/eAWyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 060BA237B;
	Tue,  1 Jul 2025 06:56:28 -0700 (PDT)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33EEF3F58B;
	Tue,  1 Jul 2025 06:56:42 -0700 (PDT)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Guo Ren <guoren@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	linux-csky@vger.kernel.org
Subject: [PATCH 07/23] csky: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
Date: Tue,  1 Jul 2025 14:56:00 +0100
Message-Id: <20250701135616.29630-8-Dave.Martin@arm.com>
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
Cc: Guo Ren <guoren@kernel.org>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: linux-csky@vger.kernel.org
---
 arch/csky/kernel/ptrace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/csky/kernel/ptrace.c b/arch/csky/kernel/ptrace.c
index 0f7e7b653c72..6bb685a2646b 100644
--- a/arch/csky/kernel/ptrace.c
+++ b/arch/csky/kernel/ptrace.c
@@ -166,7 +166,7 @@ static int fpr_set(struct task_struct *target,
 
 static const struct user_regset csky_regsets[] = {
 	[REGSET_GPR] = {
-		.core_note_type = NT_PRSTATUS,
+		USER_REGSET_NOTE_TYPE(PRSTATUS),
 		.n = sizeof(struct pt_regs) / sizeof(u32),
 		.size = sizeof(u32),
 		.align = sizeof(u32),
@@ -174,7 +174,7 @@ static const struct user_regset csky_regsets[] = {
 		.set = gpr_set,
 	},
 	[REGSET_FPR] = {
-		.core_note_type = NT_PRFPREG,
+		USER_REGSET_NOTE_TYPE(PRFPREG),
 		.n = sizeof(struct user_fp) / sizeof(u32),
 		.size = sizeof(u32),
 		.align = sizeof(u32),
-- 
2.34.1

