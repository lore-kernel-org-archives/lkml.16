Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7AD24E4B0
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 20:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739218421; cv=none; b=rkyFhxH9mfqRgQ/3YrPyelXwFpkyzWlpQm4qAa7wGmM8o30keOWHN2OzhhMaByy2fUX71z8emRyEWOqVqzu8g8Bh27lVDFGjoSh/BpRwwythIBj6dA8bmKLweP+ssZ3uOmZwDvgpf5R9Zg7sxxLB7pU5amfk2vljqIvbKOVn9JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739218421; c=relaxed/simple;
	bh=eS7Xiq1mBUz2ufzFA3rI+awIHkaF6JmT7B8fpLKxT04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lJ1hCRhbinpZbVR2VxMXtbDMsh8ut7+4XDQRZ56S58lbX3BcIVCdMPXqbFLgLQKjynJbafiTORZHYytlFkjv8LXHhnuvGw5MuMWN6KGHJLzZYUbp6x7ibc0QMThLa1S2ltAsxILEHn3Le4YWdz2cmshvX/26DdyTx2Fnn2YjysE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XmF0I/Lz; arc=none smtp.client-ip=192.19.166.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XmF0I/Lz"
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id E276EC0006F0;
	Mon, 10 Feb 2025 12:06:44 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com E276EC0006F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1739218004;
	bh=eS7Xiq1mBUz2ufzFA3rI+awIHkaF6JmT7B8fpLKxT04=;
	h=From:To:Cc:Subject:Date:From;
	b=XmF0I/LzSUHscSi6zGQB4WrExzx6BfEbSqIOYNQt/alFEAM8wkZUuSLBKPgSbDQjX
	 sBoWjTPZIo1oZrh9fAsV4UiWLOjO2MPu+prW2g0pbNMFj22FGaB6KCcqa+PTdNv+D9
	 Co1TDxgZvh/JB+tW8rq1Svf+Eevo4/TyZF6KjQjY=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id BB93718041CAC6;
	Mon, 10 Feb 2025 12:06:44 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org (open list:MEMORY MANAGEMENT)
Subject: [PATCH] tools/mm: Fix build warnings with musl-libc
Date: Mon, 10 Feb 2025 12:05:18 -0800
Message-ID: <20250210200518.1137295-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

musl-libc warns about the following:

/home/florian/dev/buildroot/output/arm64/rpi4-b/host/aarch64-buildroot-linux-musl/sysroot/usr/include/sys/errno.h:1:2: attention: #warning redirecting incorrect #include <sys/errno.h> to <errno.h> [-Wcpp]
    1 | #warning redirecting incorrect #include <sys/errno.h> to <errno.h>
      |  ^~~~~~~
/home/florian/dev/buildroot/output/arm64/rpi4-b/host/aarch64-buildroot-linux-musl/sysroot/usr/include/sys/fcntl.h:1:2: attention: #warning redirecting incorrect #include <sys/fcntl.h> to <fcntl.h> [-Wcpp]
    1 | #warning redirecting incorrect #include <sys/fcntl.h> to <fcntl.h>
      |  ^~~~~~~

include errno.h and fcntl.h directly.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 tools/mm/page-types.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/mm/page-types.c b/tools/mm/page-types.c
index bcac7ebfb51f..d7e5e8902af8 100644
--- a/tools/mm/page-types.c
+++ b/tools/mm/page-types.c
@@ -24,8 +24,8 @@
 #include <signal.h>
 #include <inttypes.h>
 #include <sys/types.h>
-#include <sys/errno.h>
-#include <sys/fcntl.h>
+#include <errno.h>
+#include <fcntl.h>
 #include <sys/mount.h>
 #include <sys/statfs.h>
 #include <sys/mman.h>
-- 
2.43.0

