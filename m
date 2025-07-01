Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F191427F18C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378231; cv=none; b=l3gguJP5Jn3AW9NOWXojMoRH6JHIxkT/qVevrRrT050cjIllZPGgERhqQb5u2/kzEcn+Tuc3pZMQWlJrIB1BpfcCM0c7L0tlSxCHLxbEO+ZLcsBa5YvsmHEHTs0CBdStgI+ot5QtC04SMrtCkXgflK/zT9F0csX1HSu4emyTrx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378231; c=relaxed/simple;
	bh=nkf3sQ7q7SJbL/+5fAV0ezxYJVbd/mAcUBUYHmZnM7s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y0T6uR7haxf3K/qgHlcPtV4aj5lkx9Pgd9lq+eshSaBtT1QcSfomsQsf3rjHFDvX0/UJS/pcGXDl9z9jr/APp/RKv9QxuKI5FfU/y7HWXwVviR0sp+wyuqapJCveMSt1eZ7WucvxoK0Vj2RQQqbjvPhpFqkU9JIQclJP21MqBBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CEFF2F7D;
	Tue,  1 Jul 2025 06:56:54 -0700 (PDT)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A21B3F58B;
	Tue,  1 Jul 2025 06:57:08 -0700 (PDT)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 22/23] xtensa: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
Date: Tue,  1 Jul 2025 14:56:15 +0100
Message-Id: <20250701135616.29630-23-Dave.Martin@arm.com>
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
Cc: Chris Zankel <chris@zankel.net>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/xtensa/kernel/ptrace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/xtensa/kernel/ptrace.c b/arch/xtensa/kernel/ptrace.c
index 9056cd1a8302..ff0600a0584c 100644
--- a/arch/xtensa/kernel/ptrace.c
+++ b/arch/xtensa/kernel/ptrace.c
@@ -193,7 +193,7 @@ enum xtensa_regset {
 
 static const struct user_regset xtensa_regsets[] = {
 	[REGSET_GPR] = {
-		.core_note_type = NT_PRSTATUS,
+		USER_REGSET_NOTE_TYPE(PRSTATUS),
 		.n = sizeof(struct user_pt_regs) / sizeof(u32),
 		.size = sizeof(u32),
 		.align = sizeof(u32),
@@ -201,7 +201,7 @@ static const struct user_regset xtensa_regsets[] = {
 		.set = gpr_set,
 	},
 	[REGSET_TIE] = {
-		.core_note_type = NT_PRFPREG,
+		USER_REGSET_NOTE_TYPE(PRFPREG),
 		.n = sizeof(elf_xtregs_t) / sizeof(u32),
 		.size = sizeof(u32),
 		.align = sizeof(u32),
-- 
2.34.1

