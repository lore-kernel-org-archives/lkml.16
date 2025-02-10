Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E015F1E25F4
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739187374; cv=none; b=TrobaYI6SY6iTltb20j1FVpT9ZyFrVik8jHZlwPkgkLy2sweQZK042jQ702gZFcNGmlHzSE8b4TOTUrUrnoTTDnSrx2Cdzbkx4B80xjUuwAWd5IcDfgzzLtYQrdGba76AzgBl4JYDDKLxedoQbXApqEUK2sw3VIRZQQ2k86CHCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739187374; c=relaxed/simple;
	bh=AkuWlSFPTEfCDOeWGTtY0e+GfoFL2ylntt+Uiwmqoac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mBh6ae/Bu3jd1C9rKn39Ajqrk4ZuwylMNmxUNPVKRW/SfQB3Zhm1VpkUHbJ8Wo9o+npbdqBN90syhXD+LU5cxFt9D5eIkJRrjqasT66gM041ln1HUvZHYlTBaaIeYtPHkB5MYdETS/PGHKyBCVz2WNImZohOcQdTJ9lnGc8Yr9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iADAqORq; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iADAqORq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Zbw3qEV4YQbmjY
	nbEvEFBno12yv/IXeyr0StDSXCTOc=; b=iADAqORqUOhuU5SFjsnerf7YJ0qLif
	53XaD8c9N8K5LmQgX3vgMC9nOwMi2/BviweyiZydS/gXfphCerYOFDmlTPD0X3dV
	jgJ+pVy6+jUPafxh3TYQe3EJUJVGn86QkMV7sVUfA/aDvEcLal6jey2QBxgyTIPp
	r3z9o/TldbMxgADSp5V7rq9KFR/sD+gAmFsgBNIumzFHj3NKo64jX8kvASuCRIyu
	NxI10RokADqJsMiqCH12XH8dOIW/6/epM05+rVib9rgZ4J5m2CfX5DS1ENkSOoj3
	5mh9RjTBhmGdPW4bpsJht0qnYY8ePZyrCmIPcOX3W0TrS5snII5w5OGw==
Received: (qmail 802017 invoked from network); 10 Feb 2025 12:35:58 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Feb 2025 12:35:58 +0100
X-UD-Smtp-Session: l3s3148p1@J/uvHMgtiNZehh99
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH RESEND] x86/platform/olpc-xo1-sci: don't include '<linux/pm_wakeup.h>' directly
Date: Mon, 10 Feb 2025 12:34:54 +0100
Message-ID: <20250210113453.51825-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header clearly states that it does not want to be included directly,
only via '<linux/(platform_)?device.h>'. Which is already present, so
delete the superfluous include.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/x86/platform/olpc/olpc-xo1-sci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/platform/olpc/olpc-xo1-sci.c b/arch/x86/platform/olpc/olpc-xo1-sci.c
index ccb23c73cbe8..63066e7c8517 100644
--- a/arch/x86/platform/olpc/olpc-xo1-sci.c
+++ b/arch/x86/platform/olpc/olpc-xo1-sci.c
@@ -14,7 +14,6 @@
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
-#include <linux/pm_wakeup.h>
 #include <linux/power_supply.h>
 #include <linux/suspend.h>
 #include <linux/workqueue.h>
-- 
2.45.2

