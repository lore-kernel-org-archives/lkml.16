Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2DC20B7F1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744361520; cv=none; b=hgytsOzWfACWf5Thxg57xtiiT+RhqBEtw+StzIf0yutPfUxiJfC0lm3aHBNHefjBxF3OqdMEMfIHsYsvtmLuCUJF0ivkf98WmZ0aTLPud+g7TF7ZHPaC2FgJR58sF9gxUQ7xIvOpHjc3hElbPE73pPTWu7fVSSSluLMaW/5FDHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744361520; c=relaxed/simple;
	bh=RckdnWTOR3/NEjM3EQskH1tUB/EtYgY1qOD6epDGTe0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lZQz6Y/vDDXBnAWEg3BbXyHdLq4M900H+r8rX7oyVPbMARRYrfa+N5KlKyMVqbESCgg/gwhfwgIZtM0WDj2UOr+ip4mxTKfyuODdL8M0VcMCwbK/p+7VjTLD1mpc4dThpNHiVNdIrVGtS9bHfT3l+6VaqKwovkjC8pDoycU3API=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WoFndN8k; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WoFndN8k"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744361516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rD0AeWa3VYYnbBf/+BWpTsXB9fuGYu1O2IlTp9BrMoU=;
	b=WoFndN8kzgMVyUySouKB4elQnoEc5kScFJ51C5wivJqaHbv7CGmh2Lqm0Q7p8iufUDD/yd
	9l5TwN7oo8l7L0Ni9V1rilPmEFQFNXA/1C9fkL2Q4q7+NJcElHcp5usdc15AZaxvSwWBtR
	vhnmqZxYcLuZdEYdy3Q8xDByfuGkjLg=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Geoff Levand <geoff@infradead.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] powerpc/ps3: Use str_write_read() in ps3_notification_read_write()
Date: Fri, 11 Apr 2025 10:51:33 +0200
Message-ID: <20250411085134.7657-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_write_read() helper function.

Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/powerpc/platforms/ps3/device-init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/ps3/device-init.c b/arch/powerpc/platforms/ps3/device-init.c
index 61722133eb2d..22d91ac424dd 100644
--- a/arch/powerpc/platforms/ps3/device-init.c
+++ b/arch/powerpc/platforms/ps3/device-init.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 #include <linux/reboot.h>
 #include <linux/rcuwait.h>
+#include <linux/string_choices.h>
 
 #include <asm/firmware.h>
 #include <asm/lv1call.h>
@@ -724,7 +725,7 @@ static irqreturn_t ps3_notification_interrupt(int irq, void *data)
 static int ps3_notification_read_write(struct ps3_notification_device *dev,
 				       u64 lpar, int write)
 {
-	const char *op = write ? "write" : "read";
+	const char *op = str_write_read(write);
 	unsigned long flags;
 	int res;
 
-- 
2.49.0

