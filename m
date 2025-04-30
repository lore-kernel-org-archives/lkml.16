Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC038219314
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746005746; cv=none; b=Ojv7whEeOPsQO6IA2/D40YqF5HOoBTmkBW9+AZAZj1LhXKbDFa56ftaO2Z1awflD7Li9/9yqNxoP86HTvVOfj1JpGVKd4w8RIh8fU/jrBOtCQCLpGcKZLPoiSPogliNKsXz15D/MLjyOcs3uhZjz2CqnKgMrt7gW1XGo95MD+AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746005746; c=relaxed/simple;
	bh=Pq9BfiOdZyNySS6Oc6INFzMRWWtutsa2WXTAkUDipEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QzxBuf/3bzeuVD8apSzk3eScmgO/F1Od/3Lftnl1GhoYd7bIM+iUxCA7AHNhgun2Plr+wtDkX2Sx0Pe4tw3ffXeaAT8uxK2tgyp+rbMJxtepUE8Jqf15nsiqAGIOleafiqfQL4gmIfH93B5OrLGRWQT5yy/KRouD05ewPStNDkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=l4jjMu3h; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tSVGAcA5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="l4jjMu3h";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tSVGAcA5"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746005743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QnbDKBvSHAjsGRlqJ73b13EXZeHz5vL3RyuYlFhM1I8=;
	b=l4jjMu3h8Fe8nf+pg38dt2BItmcqP0E/mDMGlRPAzgq9/vVmDMjBuW4fMPxR791z1rf3tw
	HSjmq8aBbeZHOYcGJbsW6c+s9gv6XiEJ2uKBMEYj9siSwgczRxgS+Vao6AwbHBzgqsU7xE
	mwDjjjnzj0fqljsyD0HiCfIt4cKhCdFcH/5Id6fsBhkuEr1914YVNqtmc8vMDz9uPjn+2D
	u1NnbbEmyS+KTF/dCdws16F9O3DZScTL1t727IvbsZETfvQ2ePxG1u6S7U2EkUmvb09ckT
	67wOVqp/a19cQ78JThQMvd6lriO9hitDKNrif74HQEtHbnqRkpt+5IvlNRUR/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746005743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QnbDKBvSHAjsGRlqJ73b13EXZeHz5vL3RyuYlFhM1I8=;
	b=tSVGAcA5PvXLVKU5UNAhqgMwgIT9JsGiCATADG5WjFkEJ94t3YsHl7WuFPCdMX87ZA1JX5
	JIjq4XGaSz6XD6Bw==
Date: Wed, 30 Apr 2025 11:35:32 +0200
Subject: [PATCH 1/2] tools/nolibc: move poll() to poll.h
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250430-poll-v1-1-44b5ceabdeee@linutronix.de>
References: <20250430-poll-v1-0-44b5ceabdeee@linutronix.de>
In-Reply-To: <20250430-poll-v1-0-44b5ceabdeee@linutronix.de>
To: Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746005742; l=4232;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Pq9BfiOdZyNySS6Oc6INFzMRWWtutsa2WXTAkUDipEo=;
 b=FHOBwQNWFN7D8wHxMvYoJpYcle5xCksoDabtNSs9mmFibjrEG4S8FkC1laXRuCXivnH+MZSYA
 2NTj5QSheMhCncFvWcbnw/OOU+z2PxfcOPOJJynWFFGJ4FmUu2TIjbJ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

This is the location regular userspace expects the definition.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/include/nolibc/Makefile |  1 +
 tools/include/nolibc/nolibc.h |  1 +
 tools/include/nolibc/poll.h   | 55 +++++++++++++++++++++++++++++++++++++++++++
 tools/include/nolibc/sys.h    | 37 -----------------------------
 4 files changed, 57 insertions(+), 37 deletions(-)

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index 41ef18872a7e9435a5efec9c0b32b9e29fcd4ce8..3ad6ac3fde0aed8eac12ed944c06015bbccde6f1 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -36,6 +36,7 @@ all_files := \
 		getopt.h \
 		limits.h \
 		nolibc.h \
+		poll.h \
 		signal.h \
 		stackprotector.h \
 		std.h \
diff --git a/tools/include/nolibc/nolibc.h b/tools/include/nolibc/nolibc.h
index d1b949e094eeb7cc0fe875deeafa4c972ecf35b2..05a4bd5fba8bab9b6f896e617f73c49e30a1242e 100644
--- a/tools/include/nolibc/nolibc.h
+++ b/tools/include/nolibc/nolibc.h
@@ -114,6 +114,7 @@
 #include "dirent.h"
 #include "fcntl.h"
 #include "getopt.h"
+#include "poll.h"
 
 /* Used by programs to avoid std includes */
 #define NOLIBC
diff --git a/tools/include/nolibc/poll.h b/tools/include/nolibc/poll.h
new file mode 100644
index 0000000000000000000000000000000000000000..be6e44fe022d9e8f196821c6c5eb6d0a56e8aacb
--- /dev/null
+++ b/tools/include/nolibc/poll.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
+/*
+ * poll definitions for NOLIBC
+ * Copyright (C) 2017-2021 Willy Tarreau <w@1wt.eu>
+ */
+
+/* make sure to include all global symbols */
+#include "nolibc.h"
+
+#ifndef _NOLIBC_POLL_H
+#define _NOLIBC_POLL_H
+
+#include "arch.h"
+#include "types.h"
+#include "sys.h"
+
+#include <linux/time.h>
+
+/*
+ * int poll(struct pollfd *fds, int nfds, int timeout);
+ */
+
+static __attribute__((unused))
+int sys_poll(struct pollfd *fds, int nfds, int timeout)
+{
+#if defined(__NR_ppoll)
+	struct timespec t;
+
+	if (timeout >= 0) {
+		t.tv_sec  = timeout / 1000;
+		t.tv_nsec = (timeout % 1000) * 1000000;
+	}
+	return my_syscall5(__NR_ppoll, fds, nfds, (timeout >= 0) ? &t : NULL, NULL, 0);
+#elif defined(__NR_ppoll_time64)
+	struct __kernel_timespec t;
+
+	if (timeout >= 0) {
+		t.tv_sec  = timeout / 1000;
+		t.tv_nsec = (timeout % 1000) * 1000000;
+	}
+	return my_syscall5(__NR_ppoll_time64, fds, nfds, (timeout >= 0) ? &t : NULL, NULL, 0);
+#elif defined(__NR_poll)
+	return my_syscall3(__NR_poll, fds, nfds, timeout);
+#else
+	return __nolibc_enosys(__func__, fds, nfds, timeout);
+#endif
+}
+
+static __attribute__((unused))
+int poll(struct pollfd *fds, int nfds, int timeout)
+{
+	return __sysret(sys_poll(fds, nfds, timeout));
+}
+
+#endif /* _NOLIBC_POLL_H */
diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 68e60e6742114a5422c8afef56a67415ed652c2f..5733fe54911dca44c7423951ff85fb166d95c06f 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -766,43 +766,6 @@ int pivot_root(const char *new, const char *old)
 }
 
 
-/*
- * int poll(struct pollfd *fds, int nfds, int timeout);
- */
-
-static __attribute__((unused))
-int sys_poll(struct pollfd *fds, int nfds, int timeout)
-{
-#if defined(__NR_ppoll)
-	struct timespec t;
-
-	if (timeout >= 0) {
-		t.tv_sec  = timeout / 1000;
-		t.tv_nsec = (timeout % 1000) * 1000000;
-	}
-	return my_syscall5(__NR_ppoll, fds, nfds, (timeout >= 0) ? &t : NULL, NULL, 0);
-#elif defined(__NR_ppoll_time64)
-	struct __kernel_timespec t;
-
-	if (timeout >= 0) {
-		t.tv_sec  = timeout / 1000;
-		t.tv_nsec = (timeout % 1000) * 1000000;
-	}
-	return my_syscall5(__NR_ppoll_time64, fds, nfds, (timeout >= 0) ? &t : NULL, NULL, 0);
-#elif defined(__NR_poll)
-	return my_syscall3(__NR_poll, fds, nfds, timeout);
-#else
-	return __nolibc_enosys(__func__, fds, nfds, timeout);
-#endif
-}
-
-static __attribute__((unused))
-int poll(struct pollfd *fds, int nfds, int timeout)
-{
-	return __sysret(sys_poll(fds, nfds, timeout));
-}
-
-
 /*
  * ssize_t read(int fd, void *buf, size_t count);
  */

-- 
2.49.0

