Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE43222E3F8
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199604; cv=none; b=Yl/zqczPKFghL+MULp2sUeFGH57/vQbWQn81Gg2kuuKKwmLqjj2tnOvBD28j8YeOhQhmSzRe0B9URvSkgePvQNSDYGWSbIbf549BrMQzWzW0NjIDoI66j1izH06Mp+7zgdd6QXYFemx5YsqJwdnUUkORGQo1QKkPidOizTSem5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199604; c=relaxed/simple;
	bh=AuC2pbIDrgPcIILNDWzDkjvJlhTs7667wa7GfDgz5/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RDCFNuOY4+4eV/KQqQpt2zMD+SbdOkQ3klEzsuXTWsrJNO/+Ce3zwrZDoLtEleXIIiP1hqnRVRy/zXy2jovOSgwMqayezr2LwWE9AUaWs//rZRSQA3cfnfcZ5VNUXzqlj6Qgi5B68D7ajqI/9QTDA2dF27Wonq3OqILYud/YYis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uilgTmXD; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uilgTmXD"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739199599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=x8sCCa2YKkIDJYFULyVAbrsYRK6dAuQYm39tgqXv8zk=;
	b=uilgTmXDFxkm32EtyBiJt1IGKej1PPQHsFIgSQFxuqVIQx+7HhBvTaUu1GT7rH4RFIOT6g
	aHsjmXoiAy9D//lDCj00M9X8gPLi9y48uzV66u3OHVmpseemmBDe+/iaTUZKONklSipHIb
	/luFRDgTDc5h6WTMlytkX43+CJPhCgk=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Geoff Levand <geoff@infradead.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/ps3: Use str_write_read() in ps3_notification_read_write()
Date: Mon, 10 Feb 2025 15:59:18 +0100
Message-ID: <20250210145918.138816-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_write_read() helper function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
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
2.48.1

