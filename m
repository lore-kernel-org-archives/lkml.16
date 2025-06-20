Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7856130E826
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750413782; cv=none; b=bjJJnOp7ACbCucVhGGb28Miu3mE8pUTM3kcpIDSkLOoIhrSEomuBTS9mfxEhArjVEvwm8L7YdkwVMC8wcTPokgQ3CHcf9IykE4jSuw4SpmphsQCFXb1dN0Eiy/0JyRpvTcWS2njieYX6KHMHRVPUIUVC381jnrXjnrnEFw+5YOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750413782; c=relaxed/simple;
	bh=/aUnQfYabeNvvoe0oidkYA3K4X8wFvr0KL7JCbKdbHg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=YTYyxMHnnmEML4sSCsW9SbTaezK7He2DtpOnlXeSGA+95olD36IOCB35rNiTv7xg3YGMN83nkpG2BxZbcW8cmzFk70XNwLRuwMyDc9XnsSQ2R0HqffpJdnpRk2kN+wCWJiziMRG5tn4gEhv4OmIXeD3ByO6Yix5qYurS25ONBOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55KA2vF8009926;
	Fri, 20 Jun 2025 12:02:57 +0200
From: Willy Tarreau <w@1wt.eu>
To: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>
Subject: [PATCH 3/4] tools/nolibc: move FD_* definitions to sys/select.h
Date: Fri, 20 Jun 2025 12:02:50 +0200
Message-Id: <20250620100251.9877-4-w@1wt.eu>
X-Mailer: git-send-email 2.17.5
In-Reply-To: <20250620100251.9877-1-w@1wt.eu>
References: <20250620100251.9877-1-w@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Modern programs tend to include sys/select.h to get FD_SET() and
FD_CLR() definitions as well as struct fd_set, but in our case it
didn't exist. Let's move these definitions from types.h to sys/select.h
to help port existing programs.

Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 tools/include/nolibc/Makefile     |  1 +
 tools/include/nolibc/sys/select.h | 56 +++++++++++++++++++++++++++++++
 tools/include/nolibc/types.h      | 48 +-------------------------
 3 files changed, 58 insertions(+), 47 deletions(-)
 create mode 100644 tools/include/nolibc/sys/select.h

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index 725cf49516185..823bfa08c6756 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -58,6 +58,7 @@ all_files := \
 		sys/random.h \
 		sys/reboot.h \
 		sys/resource.h \
+		sys/select.h \
 		sys/stat.h \
 		sys/syscall.h \
 		sys/sysmacros.h \
diff --git a/tools/include/nolibc/sys/select.h b/tools/include/nolibc/sys/select.h
new file mode 100644
index 0000000000000..a7481592c76f4
--- /dev/null
+++ b/tools/include/nolibc/sys/select.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
+
+/* make sure to include all global symbols */
+#include "../nolibc.h"
+
+#ifndef _NOLIBC_SYS_SELECT_H
+#define _NOLIBC_SYS_SELECT_H
+
+/* commonly an fd_set represents 256 FDs */
+#ifndef FD_SETSIZE
+#define FD_SETSIZE     256
+#endif
+
+#define FD_SETIDXMASK (8 * sizeof(unsigned long))
+#define FD_SETBITMASK (8 * sizeof(unsigned long)-1)
+
+/* for select() */
+typedef struct {
+	unsigned long fds[(FD_SETSIZE + FD_SETBITMASK) / FD_SETIDXMASK];
+} fd_set;
+
+#define FD_CLR(fd, set) do {						\
+		fd_set *__set = (set);					\
+		int __fd = (fd);					\
+		if (__fd >= 0)						\
+			__set->fds[__fd / FD_SETIDXMASK] &=		\
+				~(1U << (__fd & FD_SETBITMASK));	\
+	} while (0)
+
+#define FD_SET(fd, set) do {						\
+		fd_set *__set = (set);					\
+		int __fd = (fd);					\
+		if (__fd >= 0)						\
+			__set->fds[__fd / FD_SETIDXMASK] |=		\
+				1 << (__fd & FD_SETBITMASK);		\
+	} while (0)
+
+#define FD_ISSET(fd, set) ({						\
+			fd_set *__set = (set);				\
+			int __fd = (fd);				\
+		int __r = 0;						\
+		if (__fd >= 0)						\
+			__r = !!(__set->fds[__fd / FD_SETIDXMASK] &	\
+1U << (__fd & FD_SETBITMASK));						\
+		__r;							\
+	})
+
+#define FD_ZERO(set) do {						\
+		fd_set *__set = (set);					\
+		int __idx;						\
+		int __size = (FD_SETSIZE+FD_SETBITMASK) / FD_SETIDXMASK;\
+		for (__idx = 0; __idx < __size; __idx++)		\
+			__set->fds[__idx] = 0;				\
+	} while (0)
+
+#endif /* _NOLIBC_SYS_SELECT_H */
diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
index 16c6e9ec9451f..0b51ede4e0a9c 100644
--- a/tools/include/nolibc/types.h
+++ b/tools/include/nolibc/types.h
@@ -10,6 +10,7 @@
 #ifndef _NOLIBC_TYPES_H
 #define _NOLIBC_TYPES_H
 
+#include "sys/select.h"
 #include "std.h"
 #include <linux/mman.h>
 #include <linux/stat.h>
@@ -70,11 +71,6 @@
 #define DT_LNK         0xa
 #define DT_SOCK        0xc
 
-/* commonly an fd_set represents 256 FDs */
-#ifndef FD_SETSIZE
-#define FD_SETSIZE     256
-#endif
-
 /* PATH_MAX and MAXPATHLEN are often used and found with plenty of different
  * values.
  */
@@ -115,48 +111,6 @@
 #define EXIT_SUCCESS 0
 #define EXIT_FAILURE 1
 
-#define FD_SETIDXMASK (8 * sizeof(unsigned long))
-#define FD_SETBITMASK (8 * sizeof(unsigned long)-1)
-
-/* for select() */
-typedef struct {
-	unsigned long fds[(FD_SETSIZE + FD_SETBITMASK) / FD_SETIDXMASK];
-} fd_set;
-
-#define FD_CLR(fd, set) do {						\
-		fd_set *__set = (set);					\
-		int __fd = (fd);					\
-		if (__fd >= 0)						\
-			__set->fds[__fd / FD_SETIDXMASK] &=		\
-				~(1U << (__fd & FD_SETBITMASK));	\
-	} while (0)
-
-#define FD_SET(fd, set) do {						\
-		fd_set *__set = (set);					\
-		int __fd = (fd);					\
-		if (__fd >= 0)						\
-			__set->fds[__fd / FD_SETIDXMASK] |=		\
-				1 << (__fd & FD_SETBITMASK);		\
-	} while (0)
-
-#define FD_ISSET(fd, set) ({						\
-			fd_set *__set = (set);				\
-			int __fd = (fd);				\
-		int __r = 0;						\
-		if (__fd >= 0)						\
-			__r = !!(__set->fds[__fd / FD_SETIDXMASK] &	\
-1U << (__fd & FD_SETBITMASK));						\
-		__r;							\
-	})
-
-#define FD_ZERO(set) do {						\
-		fd_set *__set = (set);					\
-		int __idx;						\
-		int __size = (FD_SETSIZE+FD_SETBITMASK) / FD_SETIDXMASK;\
-		for (__idx = 0; __idx < __size; __idx++)		\
-			__set->fds[__idx] = 0;				\
-	} while (0)
-
 /* for getdents64() */
 struct linux_dirent64 {
 	uint64_t       d_ino;
-- 
2.17.5

