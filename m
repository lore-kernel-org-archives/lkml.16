Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FD223774
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 03:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750734561; cv=none; b=Y5NuTyMVHv6wsO6pSE4ci0O/0Onv8Tv2essswEESxant2CGdkEWs0V1cigmHJZBeKFT4GaX6KVD8Hr5JqVXN1W7piKXpr2Ia2SKJK3cnMAu6d/pEEQIkO2HN9byek2ZhGk5ZcV9M5Di5xhzq/48/TFG2JQ8RsxyE8wSSqOqycSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750734561; c=relaxed/simple;
	bh=YGvDaLTtcK1FEWqHANmxfV/oj1NBdAGvyHAThtMEXlU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tkzIhozIJRtCh3mbBVDx1HVwAWuwY84Ec6bhdoEZqeLY7ikQx0VvY3r8Dl9iA2WnUS6u1RwRlx7dxOmFsgzCfRd3Di3UrAi2fYQRbqCzerNp0B7z5/qwgQhVLMHVTieYjO67415wUt5OARg9NR5rjCGbFS4+tSx6vN3l58gxxxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=chLk4k1m; arc=none smtp.client-ip=192.19.144.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="chLk4k1m"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 24739C000C84;
	Mon, 23 Jun 2025 20:00:57 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 24739C000C84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1750734057;
	bh=YGvDaLTtcK1FEWqHANmxfV/oj1NBdAGvyHAThtMEXlU=;
	h=From:To:Cc:Subject:Date:From;
	b=chLk4k1mG5ZR96cQVcWXdemtEatvXdlXVrLqGMfDdCSuEtyhqrM1b7zUZT1Jd5NHC
	 9D4392hfUEQlN81fN1oKGLhDl7kdBjM9O/WOFCuzh49cyIUS+UkP1H8u/C8NbUNgmu
	 NXHcwqI9631ctgUozBVCk10uJpaIWhZaP9Lb6so8=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id C09631800051E;
	Mon, 23 Jun 2025 20:00:26 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] scripts/gdb: De-reference per-CPU MCE interrupts
Date: Mon, 23 Jun 2025 20:00:19 -0700
Message-ID: <20250624030020.882472-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The per-CPU MCE interrupts are looked up by reference and need to be
de-referenced before printing.

Fixes: b0969d7687a7 ("scripts/gdb: print interrupts")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 scripts/gdb/linux/interrupts.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/gdb/linux/interrupts.py b/scripts/gdb/linux/interrupts.py
index 199d9e8193f4..8bd0d7108ae0 100644
--- a/scripts/gdb/linux/interrupts.py
+++ b/scripts/gdb/linux/interrupts.py
@@ -110,7 +110,7 @@ def x86_show_mce(prec, var, pfx, desc):
     pvar = gdb.parse_and_eval(var)
     text = "%*s: " % (prec, pfx)
     for cpu in cpus.each_online_cpu():
-        text += "%10u " % (cpus.per_cpu(pvar, cpu))
+        text += "%10u " % (cpus.per_cpu(pvar, cpu).dereference())
     text += "  %s\n" % (desc)
     return text
 
-- 
2.43.0

