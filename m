Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBD724C069
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805189; cv=none; b=b1EhS9rL2UruCyYfJ4nHPmb5GuERAL9xb421aUk1JFxrc96ntXQKMVp3uSi9nI6obMadeqQ5nuizF2l6JQ4Um7o4Pf9MptQgWqljhht1k4Xv1lQ75wh6uDCLL9xvDcV1wKdAKvmeA2P3xRwzeYF3bDC3wcCDjkm3H9olLNdECVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805189; c=relaxed/simple;
	bh=bUqetqfqugUph9SnRQpvh9vvZUw+iWnE9v6heKbB7vU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f3kiuvunjS5Xooh/3TtHAzkNDfabtmoYIu1rX1SRTaqt3c0+UWer25gBi7dMcCB7d99F2FcUFAoQVHWYYVXwEYjDHrdJcz+G9yIr/HUAoog5Chv6UHtaqGf1VWnf3htCSNp1Wo4HFM+7Wng++DQjUB7EjOdezI/AmiMDNFodPoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=h8bL7wpO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=N7SzhCyM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="h8bL7wpO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="N7SzhCyM"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744805185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Td79ungl+z18GYzQJHk6JryrllOjSBev7euiR9Nk08=;
	b=h8bL7wpOJdCbMf8fezgd5NRVd1Dx+sVH9JtQfUTgwwkzQBHYavLhe8D+Nx53robHIMuDAW
	eHB4q0Soyb9HicJ4mkVmimP2NF9gKIycmD+PYUZ0dkHa0ldD8jsGV/zApGhA5xYxB4FwRE
	kZChxXtXoc+YmBrNuur8Nj51ABnpxGICCqp0KYFaYn+1l1EMyKAG7ZiEq7UhNgwzAURZpb
	7XqAxCUqmO7vh6uUBKPMwbrL6Gs1rK9QeZNzDFROOgUm3C7+C5hFZKdve3lyPaLqCCYIfT
	1UTD/ndqRzjjRk2/0Cs8DkvShHiGrS8c8m27u9I7BRbF5furFAZsHzNCBlNwig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744805185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Td79ungl+z18GYzQJHk6JryrllOjSBev7euiR9Nk08=;
	b=N7SzhCyMAe9uZDpQ9U4lf9F0mK+50HVIT4P/pRG3X3jQdoXdzCDAHr/lUaQCzrk65SkmaQ
	r6NLVJnQv04uTgCQ==
Date: Wed, 16 Apr 2025 14:06:25 +0200
Subject: [PATCH 10/10] tools/nolibc: move wait() and friends to sys/wait.h
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250416-nolibc-split-sys-v1-10-a069a3f1d145@linutronix.de>
References: <20250416-nolibc-split-sys-v1-0-a069a3f1d145@linutronix.de>
In-Reply-To: <20250416-nolibc-split-sys-v1-0-a069a3f1d145@linutronix.de>
To: Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744805177; l=5115;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=bUqetqfqugUph9SnRQpvh9vvZUw+iWnE9v6heKbB7vU=;
 b=PYrGK/0nggOcCYqTqtBGP0f1FpbkkLemmGfpnxDMJNnOseK5KQ4FGmFATxHT13jf+FBcNZ/04
 wyS9zA3FxntDMb/see64Hv88GBvmWm2fjEpnt0il4uh3TJzfaK5Sris
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

This is the location regular userspace expects these definitions.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/include/nolibc/Makefile   |  1 +
 tools/include/nolibc/nolibc.h   |  1 +
 tools/include/nolibc/sys.h      | 53 ------------------------------
 tools/include/nolibc/sys/wait.h | 71 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 73 insertions(+), 53 deletions(-)

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index fec0d4eb2119c8ad2bf65d386b8b5799adf0be5c..b5d4479abc3b727b6260b9c6ecd34d2b25906c2b 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -50,6 +50,7 @@ all_files := \
 		sys/syscall.h \
 		sys/time.h \
 		sys/types.h \
+		sys/wait.h \
 		time.h \
 		types.h \
 		unistd.h \
diff --git a/tools/include/nolibc/nolibc.h b/tools/include/nolibc/nolibc.h
index d84e8610bf1081bc92d969ab760d8277e25a5174..e8843880e4dfca54dcd3f2aec33dab83cb25c17c 100644
--- a/tools/include/nolibc/nolibc.h
+++ b/tools/include/nolibc/nolibc.h
@@ -101,6 +101,7 @@
 #include "sys/stat.h"
 #include "sys/syscall.h"
 #include "sys/time.h"
+#include "sys/wait.h"
 #include "ctype.h"
 #include "elf.h"
 #include "signal.h"
diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index aab0685af84f46298aae37e5a1bfecb07861db33..d07456d6e5727cdcb2d4f49c0de73568207a6331 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -1054,59 +1054,6 @@ int unlink(const char *path)
 }
 
 
-/*
- * pid_t wait(int *status);
- * pid_t wait4(pid_t pid, int *status, int options, struct rusage *rusage);
- * pid_t waitpid(pid_t pid, int *status, int options);
- */
-
-static __attribute__((unused))
-pid_t sys_wait4(pid_t pid, int *status, int options, struct rusage *rusage)
-{
-#ifdef __NR_wait4
-	return my_syscall4(__NR_wait4, pid, status, options, rusage);
-#else
-	return __nolibc_enosys(__func__, pid, status, options, rusage);
-#endif
-}
-
-static __attribute__((unused))
-pid_t wait(int *status)
-{
-	return __sysret(sys_wait4(-1, status, 0, NULL));
-}
-
-static __attribute__((unused))
-pid_t wait4(pid_t pid, int *status, int options, struct rusage *rusage)
-{
-	return __sysret(sys_wait4(pid, status, options, rusage));
-}
-
-
-static __attribute__((unused))
-pid_t waitpid(pid_t pid, int *status, int options)
-{
-	return __sysret(sys_wait4(pid, status, options, NULL));
-}
-
-
-/*
- * int waitid(idtype_t idtype, id_t id, siginfo_t *infop, int options);
- */
-
-static __attribute__((unused))
-int sys_waitid(int which, pid_t pid, siginfo_t *infop, int options, struct rusage *rusage)
-{
-	return my_syscall5(__NR_waitid, which, pid, infop, options, rusage);
-}
-
-static __attribute__((unused))
-int waitid(int which, pid_t pid, siginfo_t *infop, int options)
-{
-	return __sysret(sys_waitid(which, pid, infop, options, NULL));
-}
-
-
 /*
  * ssize_t write(int fd, const void *buf, size_t count);
  */
diff --git a/tools/include/nolibc/sys/wait.h b/tools/include/nolibc/sys/wait.h
new file mode 100644
index 0000000000000000000000000000000000000000..1af366a63f2079af587d74389530dbcc9cfb588a
--- /dev/null
+++ b/tools/include/nolibc/sys/wait.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
+/*
+ * wait definitions for NOLIBC
+ * Copyright (C) 2017-2021 Willy Tarreau <w@1wt.eu>
+ */
+
+#ifndef _NOLIBC_SYS_WAIT_H
+#define _NOLIBC_SYS_WAIT_H
+
+#include "../arch.h"
+#include "../std.h"
+#include "../types.h"
+
+/*
+ * pid_t wait(int *status);
+ * pid_t wait4(pid_t pid, int *status, int options, struct rusage *rusage);
+ * pid_t waitpid(pid_t pid, int *status, int options);
+ */
+
+static __attribute__((unused))
+pid_t sys_wait4(pid_t pid, int *status, int options, struct rusage *rusage)
+{
+#ifdef __NR_wait4
+	return my_syscall4(__NR_wait4, pid, status, options, rusage);
+#else
+	return __nolibc_enosys(__func__, pid, status, options, rusage);
+#endif
+}
+
+static __attribute__((unused))
+pid_t wait(int *status)
+{
+	return __sysret(sys_wait4(-1, status, 0, NULL));
+}
+
+static __attribute__((unused))
+pid_t wait4(pid_t pid, int *status, int options, struct rusage *rusage)
+{
+	return __sysret(sys_wait4(pid, status, options, rusage));
+}
+
+
+static __attribute__((unused))
+pid_t waitpid(pid_t pid, int *status, int options)
+{
+	return __sysret(sys_wait4(pid, status, options, NULL));
+}
+
+
+/*
+ * int waitid(idtype_t idtype, id_t id, siginfo_t *infop, int options);
+ */
+
+static __attribute__((unused))
+int sys_waitid(int which, pid_t pid, siginfo_t *infop, int options, struct rusage *rusage)
+{
+	return my_syscall5(__NR_waitid, which, pid, infop, options, rusage);
+}
+
+static __attribute__((unused))
+int waitid(int which, pid_t pid, siginfo_t *infop, int options)
+{
+	return __sysret(sys_waitid(which, pid, infop, options, NULL));
+}
+
+
+
+/* make sure to include all global symbols */
+#include "../nolibc.h"
+
+#endif /* _NOLIBC_SYS_WAIT_H */

-- 
2.49.0

