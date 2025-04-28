Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFBA26FD8D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745850611; cv=none; b=M54UQWf54s3DH0AC3shdwcG6pa8VUkvNzOCV0+xAjR4fkQcmTow4A+ExKMlnCXLvDydA4V+EV3aeyhJcsZ6PK81mxt+LceC3iQLIfHQLdr08om6r6Gb6WN/Ok6uC9VKxuYGPreTec4YwKzHWzEeHbJweERHIxZ4B7SL8Fw28WP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745850611; c=relaxed/simple;
	bh=zEMdjIk8RW3nE7SZBprDXtmorPtx/9VQt+qnPKRkz8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KVK5kRXmS/X1C6R18sADEXv0xHwQvvqjVTZCqwDD1YsPFB8ztp7QXhi2gD8CfTTHwv72DGEPImW0meCsEI7p/tEGYMkGVyQceSQffHsq1q44eD7TYuqkgIoyImnA5vYrWWfJ9lrmbrUXraqCDodIMKcDHmSKv+akUmHwIlvhTEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yshyn.com; spf=pass smtp.mailfrom=yshyn.com; dkim=pass (2048-bit key) header.d=yshyn.com header.i=@yshyn.com header.b=TYThmJvT; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yshyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yshyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yshyn.com header.i=@yshyn.com header.b="TYThmJvT"
Received: from phoenix.uberspace.de (phoenix.uberspace.de [95.143.172.135])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 0386E17FF6C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:23:04 +0200 (CEST)
Received: (qmail 10346 invoked by uid 988); 28 Apr 2025 14:23:03 -0000
Authentication-Results: phoenix.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by phoenix.uberspace.de (Haraka/3.0.1) with ESMTPSA; Mon, 28 Apr 2025 16:23:03 +0200
From: Illia Ostapyshyn <illia@yshyn.com>
To: linux-kernel@vger.kernel.org
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Illia Ostapyshyn <illia@yshyn.com>
Subject: [PATCH] scripts/gdb: Use d_shortname instead of d_iname
Date: Mon, 28 Apr 2025 16:21:17 +0200
Message-ID: <20250428142117.3455683-1-illia@yshyn.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: -
X-Rspamd-Report: MID_CONTAINS_FROM(1) BAYES_HAM(-2.783733) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -1.383733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=yshyn.com; s=uberspace;
	h=from:to:cc:subject:date;
	bh=zEMdjIk8RW3nE7SZBprDXtmorPtx/9VQt+qnPKRkz8g=;
	b=TYThmJvThWI8EHelpB/26MgIUQHSM6MBUJvfeZJUdhrcaOSkgcJCwXGvbfCAeEL1OIq7Ux/hVq
	k5xi7bY1EO2dSgnXD6Xk20iHgAjezlnEe4WAanVIbYqzHVBEKffNMgM0kmmRWvwskT2aRA8x2n/G
	0wEUxKsA1BupGiM+VG2pQB2HCjqALQtkib3ffhOxQ2aIprO3kkgJTWgkE+QFmy9yt3SSPXoYW+o7
	k9mO8Lz/8ofrjL3GYCxsFAAppDziOYVaMF/LLFADnciy5yAjwlrhTlzPMjUEztgQjTdoT4MiBfOx
	gkMBohujSV6q7QWF/iECMU9JTh5RqjSQbAopgS8g==

Commit 58cf9c383c5c68666808 ("dcache: back inline names with a
struct-wrapped array of unsigned long") introduced a d_shortname union
in place of d_iname.  However, the gdb scripts for vfs still reference
the old field.  Update the scripts to reference the correct field and
union member.

Signed-off-by: Illia Ostapyshyn <illia@yshyn.com>
---
 scripts/gdb/linux/vfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/gdb/linux/vfs.py b/scripts/gdb/linux/vfs.py
index c77b9ce75f6d..b5fbb18ccb77 100644
--- a/scripts/gdb/linux/vfs.py
+++ b/scripts/gdb/linux/vfs.py
@@ -22,7 +22,7 @@ def dentry_name(d):
     if parent == d or parent == 0:
         return ""
     p = dentry_name(d['d_parent']) + "/"
-    return p + d['d_iname'].string()
+    return p + d['d_shortname']['string'].string()
 
 class DentryName(gdb.Function):
     """Return string of the full path of a dentry.
-- 
2.47.2

