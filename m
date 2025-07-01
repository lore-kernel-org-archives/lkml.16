Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A24278741
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378209; cv=none; b=QCTHJxQ2W5GHH/+wx9Hci4XYHgfqot8cI7CMYps7oxMvWxoQmyyTCl3JglrIUXt3+3aSu3y+G6PsMb9e5lwPiMDBExvBuAiLNtD7SCAq9L4t3QgrnDlAkGUaeE4Um+52Y7YkDnj2ogfgA1E9Zy96d+3VZiP+Ei+zWFT382Kqyys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378209; c=relaxed/simple;
	bh=/x8vGB0nmkspDjfupjudUNeIZO1JlkzKZlMCbeEmwRs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MI9/SvRRK8IVQYYncfKFlKwBoI6pxlSe/qB48GbTMGUxB24VOuZu19zoCnM4CJuVoc2ux7CAACK9RFyO0mT1PpJtyamwsc0Yh0wYXpdAkeE+givBpvZ4nVyeoFCehojsrAiHVbi3hGKCDeGxoWMR3j6iNwq4rz+T2N3SgkjZNfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90A582D95;
	Tue,  1 Jul 2025 06:56:32 -0700 (PDT)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE61A3F58B;
	Tue,  1 Jul 2025 06:56:46 -0700 (PDT)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	linux-m68k@lists.linux-m68k.org
Subject: [PATCH 10/23] m68k: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
Date: Tue,  1 Jul 2025 14:56:03 +0100
Message-Id: <20250701135616.29630-11-Dave.Martin@arm.com>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: linux-m68k@lists.linux-m68k.org
---
 arch/m68k/kernel/ptrace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/kernel/ptrace.c b/arch/m68k/kernel/ptrace.c
index c20d590e4297..cfa2df24eced 100644
--- a/arch/m68k/kernel/ptrace.c
+++ b/arch/m68k/kernel/ptrace.c
@@ -319,7 +319,7 @@ enum m68k_regset {
 
 static const struct user_regset m68k_user_regsets[] = {
 	[REGSET_GPR] = {
-		.core_note_type = NT_PRSTATUS,
+		USER_REGSET_NOTE_TYPE(PRSTATUS),
 		.n = ELF_NGREG,
 		.size = sizeof(u32),
 		.align = sizeof(u16),
@@ -327,7 +327,7 @@ static const struct user_regset m68k_user_regsets[] = {
 	},
 #ifdef CONFIG_FPU
 	[REGSET_FPU] = {
-		.core_note_type = NT_PRFPREG,
+		USER_REGSET_NOTE_TYPE(PRFPREG),
 		.n = sizeof(struct user_m68kfp_struct) / sizeof(u32),
 		.size = sizeof(u32),
 		.align = sizeof(u32),
-- 
2.34.1

