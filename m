Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FF224BBE2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805188; cv=none; b=WX6T+F+P9bxck+DF8cxDt+DD0yrf3vpwjTxOSk98MrH5UrWP/DTN8hJLGo4d8TvHKaWf8BMVT5Xtgq3g/e60H9W2/kDm8R1LaYGSTO8tzDwyqaVBEVFxMyLzpPdbPbwr6KQtdnP66uE9ZgrgAFbKtCXsVoTve4u2BomO/rtMoIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805188; c=relaxed/simple;
	bh=VlCWVBZLPVVDDzV0ZU+ZVnBVcZRtRE3tN9Wy+3iVLq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MkwrU/jgYkjXGqYJnYMOZFr0QM3odQ9CrrNvG0z8SzQYrgdlVK7MUVF6tbK7muePdqs/S7rDSocJDlBOAXRhQZi4ZrWJ5CGchb1UFSwUC53m5xDfwT7EY32fpR4XQdJx9evgQryTLQDsxvm1Y8WsjgqipSQBqOw9D/x5fsCbAIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MRPib1Ct; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=is3vmZSG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MRPib1Ct";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="is3vmZSG"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744805183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tGrQuRPsSyUXfEKNZ/KdVH5q6P06Sel2Spt2RFQ0F4w=;
	b=MRPib1CtYBgXt8raTSuqHqLgKIw6zW2ByeYK3V/JCFdmDoZLdEf1cCEYZngAY3TS12jKZY
	nQkvYsOduZnucsUYBX8CLHdRN2u38V+hNOiVxbKBhfgXJ27hhHlGS90W3fjMzbxdO4QvMv
	uKbYHIdcBhUWR+DAeRSKMbS4G1Z/o9B+Wec5PVdBcws1FPQgZnrYJp64UR+Q/Hox5cgxbH
	VasTLdBBSDcG8sJxI+Aek8idhBeXqwi0O7Baxzqh9Bp0Hv84UzBnZTFJeF2MzX/doRpebX
	rSGE5Z9lDUXaWCoqkwe/LlawAtR5ihue0v83iI6bmNxukAtc7zKnbQlq3IqVSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744805183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tGrQuRPsSyUXfEKNZ/KdVH5q6P06Sel2Spt2RFQ0F4w=;
	b=is3vmZSGIw0C+zXyS+Z8DPrGoyiabEiktOla1Nq1PG2oS6GyJB1rr8fgtW6E+R9U/ynP6n
	Vd4xrAZUFZeK7vAg==
Date: Wed, 16 Apr 2025 14:06:20 +0200
Subject: [PATCH 05/10] tools/nolibc: move mmap() and friends to sys/mman.h
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250416-nolibc-split-sys-v1-5-a069a3f1d145@linutronix.de>
References: <20250416-nolibc-split-sys-v1-0-a069a3f1d145@linutronix.de>
In-Reply-To: <20250416-nolibc-split-sys-v1-0-a069a3f1d145@linutronix.de>
To: Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744805177; l=4739;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=VlCWVBZLPVVDDzV0ZU+ZVnBVcZRtRE3tN9Wy+3iVLq0=;
 b=qtMimDZyY1+rv4Fn7OqvAHkuoKno1OqNr2l2ZguoFMNCXtddkdskuZ9FNki0RVDTB2+eIZdGW
 iA3588v0NiqC11uDndeXnofHtH1rYQmPxYJXL5SYXM2FvnfodADAVHe
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

This is the location regular userspace expects these definitions.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/include/nolibc/Makefile   |  1 +
 tools/include/nolibc/nolibc.h   |  1 +
 tools/include/nolibc/sys.h      | 48 -------------------------------
 tools/include/nolibc/sys/mman.h | 63 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+), 48 deletions(-)

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index a3781f39692532fb75c7aaf70f65b2d5bf7c7abd..ca8817e84c3a5b4df3d373e60a956945d2665b94 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -45,6 +45,7 @@ all_files := \
 		string.h \
 		sys.h \
 		sys/auxv.h \
+		sys/mman.h \
 		time.h \
 		types.h \
 		unistd.h \
diff --git a/tools/include/nolibc/nolibc.h b/tools/include/nolibc/nolibc.h
index 0d8c49e0dddc595c2f029788ecb5b51231e2695a..ffdf501db1b6faebe2f0d5f56bd3c31c1a8ec164 100644
--- a/tools/include/nolibc/nolibc.h
+++ b/tools/include/nolibc/nolibc.h
@@ -97,6 +97,7 @@
 #include "types.h"
 #include "sys.h"
 #include "sys/auxv.h"
+#include "sys/mman.h"
 #include "ctype.h"
 #include "elf.h"
 #include "signal.h"
diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 5fa351e6a3512a3d0c609867244ac91e8563ab2a..13e6b2479fbf8bcb36843072665e50046c5f41eb 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -24,7 +24,6 @@
 #include <linux/resource.h>
 #include <linux/utsname.h>
 
-#include "arch.h"
 #include "errno.h"
 #include "stdarg.h"
 #include "types.h"
@@ -697,53 +696,6 @@ int mknod(const char *path, mode_t mode, dev_t dev)
 	return __sysret(sys_mknod(path, mode, dev));
 }
 
-#ifndef sys_mmap
-static __attribute__((unused))
-void *sys_mmap(void *addr, size_t length, int prot, int flags, int fd,
-	       off_t offset)
-{
-	int n;
-
-#if defined(__NR_mmap2)
-	n = __NR_mmap2;
-	offset >>= 12;
-#else
-	n = __NR_mmap;
-#endif
-
-	return (void *)my_syscall6(n, addr, length, prot, flags, fd, offset);
-}
-#endif
-
-/* Note that on Linux, MAP_FAILED is -1 so we can use the generic __sysret()
- * which returns -1 upon error and still satisfy user land that checks for
- * MAP_FAILED.
- */
-
-static __attribute__((unused))
-void *mmap(void *addr, size_t length, int prot, int flags, int fd, off_t offset)
-{
-	void *ret = sys_mmap(addr, length, prot, flags, fd, offset);
-
-	if ((unsigned long)ret >= -4095UL) {
-		SET_ERRNO(-(long)ret);
-		ret = MAP_FAILED;
-	}
-	return ret;
-}
-
-static __attribute__((unused))
-int sys_munmap(void *addr, size_t length)
-{
-	return my_syscall2(__NR_munmap, addr, length);
-}
-
-static __attribute__((unused))
-int munmap(void *addr, size_t length)
-{
-	return __sysret(sys_munmap(addr, length));
-}
-
 /*
  * int mount(const char *source, const char *target,
  *           const char *fstype, unsigned long flags,
diff --git a/tools/include/nolibc/sys/mman.h b/tools/include/nolibc/sys/mman.h
new file mode 100644
index 0000000000000000000000000000000000000000..ad9d06b6b7919ec76a0652266158366cf639a77a
--- /dev/null
+++ b/tools/include/nolibc/sys/mman.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
+/*
+ * mm definition for NOLIBC
+ * Copyright (C) 2017-2021 Willy Tarreau <w@1wt.eu>
+ */
+
+#ifndef _NOLIBC_SYS_MMAN_H
+#define _NOLIBC_SYS_MMAN_H
+
+#include "../arch.h"
+#include "../sys.h"
+
+#ifndef sys_mmap
+static __attribute__((unused))
+void *sys_mmap(void *addr, size_t length, int prot, int flags, int fd,
+	       off_t offset)
+{
+	int n;
+
+#if defined(__NR_mmap2)
+	n = __NR_mmap2;
+	offset >>= 12;
+#else
+	n = __NR_mmap;
+#endif
+
+	return (void *)my_syscall6(n, addr, length, prot, flags, fd, offset);
+}
+#endif
+
+/* Note that on Linux, MAP_FAILED is -1 so we can use the generic __sysret()
+ * which returns -1 upon error and still satisfy user land that checks for
+ * MAP_FAILED.
+ */
+
+static __attribute__((unused))
+void *mmap(void *addr, size_t length, int prot, int flags, int fd, off_t offset)
+{
+	void *ret = sys_mmap(addr, length, prot, flags, fd, offset);
+
+	if ((unsigned long)ret >= -4095UL) {
+		SET_ERRNO(-(long)ret);
+		ret = MAP_FAILED;
+	}
+	return ret;
+}
+
+static __attribute__((unused))
+int sys_munmap(void *addr, size_t length)
+{
+	return my_syscall2(__NR_munmap, addr, length);
+}
+
+static __attribute__((unused))
+int munmap(void *addr, size_t length)
+{
+	return __sysret(sys_munmap(addr, length));
+}
+
+/* make sure to include all global symbols */
+#include "../nolibc.h"
+
+#endif /* _NOLIBC_SYS_MMAN_H */

-- 
2.49.0

