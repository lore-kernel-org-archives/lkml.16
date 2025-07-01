Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C38276038
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378212; cv=none; b=QS1B9qtEqE3Oxo4IolJcMsQdP0QWQ9FhTaO6cBoOlcXf22OTvpqBcAdfkXIsgshoTjvNtQQkiQBkd9jjOe0LMUJ7sqiJqZk+cPL0iOdEahzvY6uoMXsDaIHzDvUH/+fRyog4s76Q1q0nKUfyuR4fyQR7qnzjkUXLYnqEOAbdaN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378212; c=relaxed/simple;
	bh=19AJDUxx7NF+xN6X50eYbEMXtITQkNa9S1m0FT5ZAz4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=alfjXqUiKDSSxijJkYO4JoHOS9asjGZ3tfXms2asiV8TG19eP84FA/NMQcxQTZgP/n1HEb0e3n5ucMt/6hG1nZ9YpFedc2hSWHt5yGBSjMgkdGwsPw2drLvjCbPSDv85gLSXu/OIS/ScsIznk6LOdcVNLBPdZCWB48LXIF8V/eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FC102EC5;
	Tue,  1 Jul 2025 06:56:35 -0700 (PDT)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B11C23F58B;
	Tue,  1 Jul 2025 06:56:49 -0700 (PDT)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Dinh Nguyen <dinguyen@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 12/23] nios2: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
Date: Tue,  1 Jul 2025 14:56:05 +0100
Message-Id: <20250701135616.29630-13-Dave.Martin@arm.com>
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
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/nios2/kernel/ptrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/nios2/kernel/ptrace.c b/arch/nios2/kernel/ptrace.c
index 9221c15972e6..c88f5cabc0c1 100644
--- a/arch/nios2/kernel/ptrace.c
+++ b/arch/nios2/kernel/ptrace.c
@@ -95,7 +95,7 @@ enum nios2_regset {
 
 static const struct user_regset nios2_regsets[] = {
 	[REGSET_GENERAL] = {
-		.core_note_type = NT_PRSTATUS,
+		USER_REGSET_NOTE_TYPE(PRSTATUS),
 		.n = NUM_PTRACE_REG,
 		.size = sizeof(unsigned long),
 		.align = sizeof(unsigned long),
-- 
2.34.1

