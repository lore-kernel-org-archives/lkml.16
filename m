Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4268A1DEFE6
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750697351; cv=none; b=hXCluTMHc2QmpR6hp8wdViQQTyxhSWyWjJPel9r6sCGc3YMT0VK7w8dE387wBqgYJ7FJoMcwh+QcOWg44bSeKJxk+U64huilBpgY8lntw7LgyghTrj2fnJBS79RPBUQ26c7mul73nMt9ObAhymScoP0JA4HvFIjQLIP51ERy4vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750697351; c=relaxed/simple;
	bh=5iX5TDDQ/ZWXuMmKih/2iDlpTvJYeMdTeNuIBAQze6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kXWBTfKFeoUvRo2/E+3TLDp3ENP0qhXkLyWdoiyMlaRwSmM1BBYlsRJ3aqvEDAMz38QVExdTFq4rBYciX4wzKq+e/J/oHE1Lz833vBk1dZNVpG4VZM1zZEkvEb4gvJmv2OTBgPPYXyZllrFtYCXyM2kFtwqSEabKvkkksBWt4u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=RzTp+Kbh; arc=none smtp.client-ip=192.19.166.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="RzTp+Kbh"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 83B87C000540;
	Mon, 23 Jun 2025 09:42:25 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 83B87C000540
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1750696945;
	bh=5iX5TDDQ/ZWXuMmKih/2iDlpTvJYeMdTeNuIBAQze6A=;
	h=From:To:Cc:Subject:Date:From;
	b=RzTp+Kbhz26Ii8nPSgXdscghCTRmZi+oVcYqTDS0zqmDKy8g3iDIJfg1HK8c7G+i9
	 eBwGsFt5PTrLxFJp1i/8qRw4CzavqtujCROKGCI87GcTnBvjTjGdkCXjoMpJEapNsJ
	 Ymkflcpoh2J9cHaxD8dmbsfIeKX8bbZldG/pdXLM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 61A3F18000530;
	Mon, 23 Jun 2025 09:41:55 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2] scripts/gdb: Fix interrupts display after MCP on x86
Date: Mon, 23 Jun 2025 09:41:52 -0700
Message-ID: <20250623164153.746359-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The text line would not be appended to as it should have, it should have
been a '+=' but ended up being a '==', fix that.

Fixes: b0969d7687a7 ("scripts/gdb: print interrupts")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
Changes in v2:

- remove accidentally added files which did not belong to the patch

 scripts/gdb/linux/interrupts.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/gdb/linux/interrupts.py b/scripts/gdb/linux/interrupts.py
index a48b5874663e..419ab98d2e2b 100644
--- a/scripts/gdb/linux/interrupts.py
+++ b/scripts/gdb/linux/interrupts.py
@@ -141,7 +141,7 @@ def x86_show_interupts(prec):
 
     if constants.LX_CONFIG_X86_MCE:
         text += x86_show_mce(prec, "&mce_exception_count", "MCE", "Machine check exceptions")
-        text == x86_show_mce(prec, "&mce_poll_count", "MCP", "Machine check polls")
+        text += x86_show_mce(prec, "&mce_poll_count", "MCP", "Machine check polls")
 
     text += show_irq_err_count(prec)
 
-- 
2.43.0

