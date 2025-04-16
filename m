Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DB424A05A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805186; cv=none; b=lWcGSRJah96xlt6bJ0EK2L5rH1C2SKOTIP+Wdu6/w6ev7tNX8nRQOSEzLWfvPgjGJL/gDiUqg87dsUyvL6y/rxPuYgQZYTHQs8kkumc32unufvq04fPbURDiG6rj9NvHsnzV5dSEKFvWD1SJdnFJ6b+BwH9nBhXGVHt0CGqX8oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805186; c=relaxed/simple;
	bh=HmLYaF6k75emMNYuVKPaAVfZFtSclPYYeJ0ZzkL/MFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nqy9FuVhZZMwydTOZs59SgC4ES2cCmRtHgCHXolAxWUcj2BC5t6wC69MRyP/rRqnQzMPikHC0mw3KXHB+LQNm66PlSaCsfu7pUsERBkG0wDIvb2kYIHDZHViSs5x10rEbl6ywH5B7xT/xZ4t774xeQ1sKJwaFjHvDpZFCnhJ1+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=luYtl5qE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cnOJl8gq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="luYtl5qE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cnOJl8gq"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744805182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1TF1+UPseHbLqKixvEBKKrw7HcxtjV+VM41Hak2YZ+c=;
	b=luYtl5qEIb2GAfRMoftqlCTkRiTeQPvlrqLZ1czJH1+lRv/jN+Da6YfXppbEfergLaZ0Qq
	KeadDVBArKN0lG2mPm/qPZGr/kUVR0/xJqUwme2gBLQL7jdo9fIWAXEPXWW5VFQCg7dcuh
	0o1V7ic7h6huB2uhbrec3gVhlkTHeao/oiqLF7/ZqfL8vUM9iug77vY+GGDBJZPcyPssuj
	1s+I4aTbsX5qPmf8ZxrARmrd2w5XgkM/7lOZWXKyEdaSlEnpRfOYdJucoysd5K+rDHLjDz
	Rttxfmd1B6qg1MFEkEakHl7SgaEVQu4hLpVYDB3ZfPESfsrniyK91ELrqDZrnw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744805182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1TF1+UPseHbLqKixvEBKKrw7HcxtjV+VM41Hak2YZ+c=;
	b=cnOJl8gqhzoQ4YMtor8pID9qmiX88Nd9OZTgMPVO2SI3Rx25UnMimu5C37aazq9JXGLpmr
	x+SJJjLjxI1B5sCA==
Date: Wed, 16 Apr 2025 14:06:18 +0200
Subject: [PATCH 03/10] tools/nolibc: move open() and friends to fcntl.h
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250416-nolibc-split-sys-v1-3-a069a3f1d145@linutronix.de>
References: <20250416-nolibc-split-sys-v1-0-a069a3f1d145@linutronix.de>
In-Reply-To: <20250416-nolibc-split-sys-v1-0-a069a3f1d145@linutronix.de>
To: Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744805177; l=4920;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=HmLYaF6k75emMNYuVKPaAVfZFtSclPYYeJ0ZzkL/MFw=;
 b=ijLcVYHNTKCnJgCuZGgQlgtAZAhqppbY5Qu9VfTdmT+n5wRcCYpqex2BnAc7dg5uDaO6j19CJ
 nWbc3f5h70GBon6sXZIKENxu1TDSkdUQKRF5Kz+N0LY9cH1OjUlCWpb
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

This is the location regular userspace expects these definitions.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/include/nolibc/Makefile |  1 +
 tools/include/nolibc/dirent.h |  1 +
 tools/include/nolibc/fcntl.h  | 69 +++++++++++++++++++++++++++++++++++++++++++
 tools/include/nolibc/nolibc.h |  1 +
 tools/include/nolibc/sys.h    | 52 --------------------------------
 5 files changed, 72 insertions(+), 52 deletions(-)

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index fd76d267d79a8533b7e78375c30324c962b01973..2132e4f4d2165729ec6d10860d0586f1b71ee0fb 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -32,6 +32,7 @@ all_files := \
 		dirent.h \
 		elf.h \
 		errno.h \
+		fcntl.h \
 		limits.h \
 		nolibc.h \
 		signal.h \
diff --git a/tools/include/nolibc/dirent.h b/tools/include/nolibc/dirent.h
index c5c30d0dd6806b1bec2fa8120a3df29aaa201393..d3fb9500c60a31bc1b75601d78871df82ca75f7d 100644
--- a/tools/include/nolibc/dirent.h
+++ b/tools/include/nolibc/dirent.h
@@ -9,6 +9,7 @@
 
 #include "stdint.h"
 #include "types.h"
+#include "fcntl.h"
 
 #include <linux/limits.h>
 
diff --git a/tools/include/nolibc/fcntl.h b/tools/include/nolibc/fcntl.h
new file mode 100644
index 0000000000000000000000000000000000000000..5feb08ad54a7d943b8100eac21f4058310efea91
--- /dev/null
+++ b/tools/include/nolibc/fcntl.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
+/*
+ * fcntl definition for NOLIBC
+ * Copyright (C) 2017-2021 Willy Tarreau <w@1wt.eu>
+ */
+
+#ifndef _NOLIBC_FCNTL_H
+#define _NOLIBC_FCNTL_H
+
+#include "arch.h"
+#include "types.h"
+#include "sys.h"
+
+/*
+ * int openat(int dirfd, const char *path, int flags[, mode_t mode]);
+ */
+
+static __attribute__((unused))
+int sys_openat(int dirfd, const char *path, int flags, mode_t mode)
+{
+	return my_syscall4(__NR_openat, dirfd, path, flags, mode);
+}
+
+static __attribute__((unused))
+int openat(int dirfd, const char *path, int flags, ...)
+{
+	mode_t mode = 0;
+
+	if (flags & O_CREAT) {
+		va_list args;
+
+		va_start(args, flags);
+		mode = va_arg(args, mode_t);
+		va_end(args);
+	}
+
+	return __sysret(sys_openat(dirfd, path, flags, mode));
+}
+
+/*
+ * int open(const char *path, int flags[, mode_t mode]);
+ */
+
+static __attribute__((unused))
+int sys_open(const char *path, int flags, mode_t mode)
+{
+	return my_syscall4(__NR_openat, AT_FDCWD, path, flags, mode);
+}
+
+static __attribute__((unused))
+int open(const char *path, int flags, ...)
+{
+	mode_t mode = 0;
+
+	if (flags & O_CREAT) {
+		va_list args;
+
+		va_start(args, flags);
+		mode = va_arg(args, mode_t);
+		va_end(args);
+	}
+
+	return __sysret(sys_open(path, flags, mode));
+}
+
+/* make sure to include all global symbols */
+#include "nolibc.h"
+
+#endif /* _NOLIBC_FCNTL_H */
diff --git a/tools/include/nolibc/nolibc.h b/tools/include/nolibc/nolibc.h
index 127f0d9068c6508bd45acfe0ebf2ce15acc422b0..bb4183a8fdc41023d9b8b37fe35ec37ca408b4c6 100644
--- a/tools/include/nolibc/nolibc.h
+++ b/tools/include/nolibc/nolibc.h
@@ -106,6 +106,7 @@
 #include "time.h"
 #include "stackprotector.h"
 #include "dirent.h"
+#include "fcntl.h"
 
 /* Used by programs to avoid std includes */
 #define NOLIBC
diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 08c1c074bec89a27e53e5d461a3ebbf71ec323d1..5fa351e6a3512a3d0c609867244ac91e8563ab2a 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -764,58 +764,6 @@ int mount(const char *src, const char *tgt,
 	return __sysret(sys_mount(src, tgt, fst, flags, data));
 }
 
-/*
- * int openat(int dirfd, const char *path, int flags[, mode_t mode]);
- */
-
-static __attribute__((unused))
-int sys_openat(int dirfd, const char *path, int flags, mode_t mode)
-{
-	return my_syscall4(__NR_openat, dirfd, path, flags, mode);
-}
-
-static __attribute__((unused))
-int openat(int dirfd, const char *path, int flags, ...)
-{
-	mode_t mode = 0;
-
-	if (flags & O_CREAT) {
-		va_list args;
-
-		va_start(args, flags);
-		mode = va_arg(args, mode_t);
-		va_end(args);
-	}
-
-	return __sysret(sys_openat(dirfd, path, flags, mode));
-}
-
-/*
- * int open(const char *path, int flags[, mode_t mode]);
- */
-
-static __attribute__((unused))
-int sys_open(const char *path, int flags, mode_t mode)
-{
-	return my_syscall4(__NR_openat, AT_FDCWD, path, flags, mode);
-}
-
-static __attribute__((unused))
-int open(const char *path, int flags, ...)
-{
-	mode_t mode = 0;
-
-	if (flags & O_CREAT) {
-		va_list args;
-
-		va_start(args, flags);
-		mode = va_arg(args, mode_t);
-		va_end(args);
-	}
-
-	return __sysret(sys_open(path, flags, mode));
-}
-
 
 /*
  * int pipe2(int pipefd[2], int flags);

-- 
2.49.0

