Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFF91D6DB4
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750443644; cv=none; b=YtzNQEqOjLaFGtBWTCnhnYDlBWtPfVnRcTqIVFFw7LAgB4kENKMk8W8xq6zfGbn003/jaiVUqyk6lthC4luTKzPVO7+DXxSGARXo46R86orZa1pdzYeWM3UKBP+6K8HTf0l1TUMj7KclTuD6ZFDT1VMvay8CT1B+rLpx70L54DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750443644; c=relaxed/simple;
	bh=6u8C8M8Hg3lVZITVmwYlqyMTRE7W4LXnZp4RY2sG32s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tSVT8MXWCHEuMsR7bFGuCM6/X/itc0FNks0r2fYSyEiCW9FDH5Idujqiz4d1ggJD3HHVvB9KUzoJtKUnO3KeJFUFHdvk3PxFGSIRcpT8yIa7DQ1w8VYh4qmBj1jBg989VhY/wTYIohIj48oEtzEEesEXIgwmN4jt5rkCnKqxKeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=pQ20kFmX; arc=none smtp.client-ip=192.19.166.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="pQ20kFmX"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id D195FC0000F9;
	Fri, 20 Jun 2025 11:14:53 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com D195FC0000F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1750443293;
	bh=6u8C8M8Hg3lVZITVmwYlqyMTRE7W4LXnZp4RY2sG32s=;
	h=From:To:Cc:Subject:Date:From;
	b=pQ20kFmXJ0sNCg9+BpP/rDrmO6aRZS/ClWxSQQTXeASQ04hg8zi24TJuiYikPtsDc
	 2M4VTxF00PS78X/X+f+AEdGKC8RaA5XCHk71TXlBX5Qy1yTSTUbKqPIfsc6OoISBNY
	 b7xAaXBHz7B4SPrmDh2fUFbBXC0CFEVQCtSMdlig=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id B4E28180004FC;
	Fri, 20 Jun 2025 11:14:53 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Shanker Donthineni <sdonthineni@nvidia.com>
Subject: [PATCH] scripts/gdb: Fix interrupts.py after maple tree conversion
Date: Fri, 20 Jun 2025 11:14:46 -0700
Message-ID: <20250620181446.477246-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit 721255b9826b ("genirq: Use a maple tree for interrupt
descriptor management"), the irq_desc_tree was replaced with a
sparse_irqs tree using a maple tree structure. In the interest of
providing both a minimal bugfix as well as something that is unlikely to
break in the future, invoke the irq_to_desc() function directly from
within GDB in order to obtain the interrupt number. This requires us to
handle the gdb.error exception to continue walking the tree.

Fixes: 721255b9826b ("genirq: Use a maple tree for interrupt descriptor management")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 scripts/gdb/linux/interrupts.py | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/scripts/gdb/linux/interrupts.py b/scripts/gdb/linux/interrupts.py
index 616a5f26377a..81bfa09f45fb 100644
--- a/scripts/gdb/linux/interrupts.py
+++ b/scripts/gdb/linux/interrupts.py
@@ -7,7 +7,6 @@ import gdb
 from linux import constants
 from linux import cpus
 from linux import utils
-from linux import radixtree
 
 irq_desc_type = utils.CachedType("struct irq_desc")
 
@@ -23,12 +22,11 @@ def irqd_is_level(desc):
 def show_irq_desc(prec, irq):
     text = ""
 
-    desc = radixtree.lookup(gdb.parse_and_eval("&irq_desc_tree"), irq)
-    if desc is None:
-        return text
-
-    desc = desc.cast(irq_desc_type.get_type())
-    if desc is None:
+    try:
+        desc = gdb.parse_and_eval(f"irq_to_desc({irq})")
+        if desc == 0:
+            return text
+    except gdb.error:
         return text
 
     if irq_settings_is_hidden(desc):
@@ -221,7 +219,7 @@ class LxInterruptList(gdb.Command):
             gdb.write("CPU%-8d" % cpu)
         gdb.write("\n")
 
-        if utils.gdb_eval_or_none("&irq_desc_tree") is None:
+        if utils.gdb_eval_or_none("&irq_desc_tree") or utils.gdb_eval_or_none("&sparse_irqs") is None:
             return
 
         for irq in range(nr_irqs):
-- 
2.43.0

