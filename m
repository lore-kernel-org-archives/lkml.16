Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF0125FA13
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 22:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750373851; cv=none; b=AqWv1XTj5XKCwxg/sjHchni043wqD6MGZ8NZQUN4KJdSF1mDTHdhZnLo/3UbaDq4pkypjXAkOr1vmD31jDs+uCNRwjQs9enx6e6J1cu18rHbqMm5g7qkJNmTnWLlUC/QfelNNJDOE2wVxv7qo+h74f7OWhqqX33MWZrHrMcg4k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750373851; c=relaxed/simple;
	bh=SDXGraCLLAGk5RchBb5Bz0yOpH1nMVaOuCpN4NHd/fg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EVWHZh22VCgDfI7NA69CSLdJOWJVnpch+7L7GW4Zfx1fAs5yyfn1RPWPHW0hAUs5K/wucsi4h1Im7pjRhKt/443mvPGrEI4f4y/r13p5YJ/rrUzAaq4hCdPHlZWAxULG0xfFp4yRnNv3fJYVQoF/770c7R4+Y6oMB4+nmg8mGec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HFe8RqZe; arc=none smtp.client-ip=192.19.144.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HFe8RqZe"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 8A998C00280C;
	Thu, 19 Jun 2025 15:51:10 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 8A998C00280C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1750373470;
	bh=SDXGraCLLAGk5RchBb5Bz0yOpH1nMVaOuCpN4NHd/fg=;
	h=From:To:Cc:Subject:Date:From;
	b=HFe8RqZebwhXSGwrT22L6BOIA04MBgxQJiluz5EdXFOgbyHu+F/EMVmKTG5DVrhA4
	 PzjCMmbo28iniqv9qcon3U+eLV/tedLhkxBzUNgOxT/n2soWMgkLhNGMYt96E4Yf7B
	 91El35cSO8QtaxtxGaXoNby3G5Fa8NKWTJ+XK6SA=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 28CAA18000530;
	Thu, 19 Jun 2025 15:51:10 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jeff Layton <jlayton@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] scripts/gdb: Fix dentry_name() lookup
Date: Thu, 19 Jun 2025 15:51:05 -0700
Message-ID: <20250619225105.320729-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "d_iname" member was replaced with "d_shortname.string" in the
commit referenced in the Fixes tag. This prevented the GDB script
"lx-mount" command to properly function:

(gdb) lx-mounts
      mount          super_block     devname pathname fstype options
0xff11000002d21180 0xff11000002d24800 rootfs / rootfs rw 0 0
0xff11000002e18a80 0xff11000003713000 /dev/root / ext4 rw,relatime 0 0
Python Exception <class 'gdb.error'>: There is no member named d_iname.
Error occurred in Python: There is no member named d_iname.

Fixes: 58cf9c383c5c ("dcache: back inline names with a struct-wrapped array of unsigned long")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
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
2.43.0

