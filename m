Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAFB24BBE8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805188; cv=none; b=sCcr2rkxPUZTWeE8h10AoKZiM5iHfK0jKdwCmlMGiv52G+Dejkb8C5nFtc8Z2e2WN6PSMUxviKHR0eF4xjDgZMz0yE8Ct76pKciFhuYjqhU+zloKYGPltChSnEMG1RNJMldI/rZcxBX6gUP0vQlvtBl1AdBm9o+oQ2rbYnwswU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805188; c=relaxed/simple;
	bh=f7J3bfWoyvlM97cQCSmrDgCuvCxwgYPCmYmCfAG0YyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XAS9fq5KowHFEs+PV9m6fObFm+hg+284vIOasevp5325pStoJnBt4ayKlkck2k7WemWEW4PNkdFS2/AL4O6o5mnsxjMkRoz1UG/WqDI/PdfApMD3ST2XejQy+M/tjpqfeGTCSTZqtYiiOBU0q3t3dFgbu85+F2FYHZkr3Q58br4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dlavbNfE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SKk4BNiT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dlavbNfE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SKk4BNiT"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744805183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aoGf611ZvRtfc18ew3SA5tA32H9JNlt/cfHJAKwalvQ=;
	b=dlavbNfExsmj+Hkbh14tAsQv1YURES8zQXWpsiC6pWSyC0bJjAlHwiIGz8F5tgi5h/ccKL
	ZxtYt+x10KWnMS3hCwLdwca5bGQReLoKmbns9DNoLJlu3ZdH9wFDp3bmLqd1+m4lUh1sHN
	aT938br7hAUe8A0V4cWMf2QUYri8BJqMFr/pwll5c12Q2ZwX5Mp1dCVhHhBBN2erSSDM/B
	cTSqJgYL2aNHRm5oSo9R10Rw01wwggbSvUoOWKikbFkVlDODnLNCdU1KzHzRT1QkCNeKZC
	7hv/cemMkHozbwYVF+LAoNJ0RdmSWAgitSxBCcFvUH4DPAlo3aAenXZZWCAZPA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744805183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aoGf611ZvRtfc18ew3SA5tA32H9JNlt/cfHJAKwalvQ=;
	b=SKk4BNiT5lu4LOkrIH7LB+uxiFxq2yzM0C3lB9BJXZRix2aPpFDTt//jlpVt8rFUfEXU0U
	nrRiGM0HKUouAIBA==
Date: Wed, 16 Apr 2025 14:06:21 +0200
Subject: [PATCH 06/10] tools/nolibc: move stat() and friends to sys/stat.h
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250416-nolibc-split-sys-v1-6-a069a3f1d145@linutronix.de>
References: <20250416-nolibc-split-sys-v1-0-a069a3f1d145@linutronix.de>
In-Reply-To: <20250416-nolibc-split-sys-v1-0-a069a3f1d145@linutronix.de>
To: Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744805177; l=6025;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=f7J3bfWoyvlM97cQCSmrDgCuvCxwgYPCmYmCfAG0YyM=;
 b=5xuEiTku8nx3EX4vF/qDjsrTFxXZLixMffWjJ17lbihOL2ufqg2I7FDbYXjxpYwshdpz3S201
 yghMA2H4VG/DDYry97yXRVKRWiVkoUlnRMf6pn46BhVdIhWZQJhVUps
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

This is the location regular userspace expects these definitions.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/include/nolibc/Makefile   |  1 +
 tools/include/nolibc/nolibc.h   |  1 +
 tools/include/nolibc/sys.h      | 56 -------------------------------
 tools/include/nolibc/sys/stat.h | 74 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 76 insertions(+), 56 deletions(-)

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index ca8817e84c3a5b4df3d373e60a956945d2665b94..747d73b453680a32d1b8748640f2ebd1ae9b1fb4 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -46,6 +46,7 @@ all_files := \
 		sys.h \
 		sys/auxv.h \
 		sys/mman.h \
+		sys/stat.h \
 		time.h \
 		types.h \
 		unistd.h \
diff --git a/tools/include/nolibc/nolibc.h b/tools/include/nolibc/nolibc.h
index ffdf501db1b6faebe2f0d5f56bd3c31c1a8ec164..8296cbbeebe994aa335b561a2d9986e529e001a6 100644
--- a/tools/include/nolibc/nolibc.h
+++ b/tools/include/nolibc/nolibc.h
@@ -98,6 +98,7 @@
 #include "sys.h"
 #include "sys/auxv.h"
 #include "sys/mman.h"
+#include "sys/stat.h"
 #include "ctype.h"
 #include "elf.h"
 #include "signal.h"
diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 13e6b2479fbf8bcb36843072665e50046c5f41eb..c76dc80147281041afa1cb443d01897d186f7168 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -968,62 +968,6 @@ pid_t setsid(void)
 	return __sysret(sys_setsid());
 }
 
-/*
- * int statx(int fd, const char *path, int flags, unsigned int mask, struct statx *buf);
- * int stat(const char *path, struct stat *buf);
- */
-
-static __attribute__((unused))
-int sys_statx(int fd, const char *path, int flags, unsigned int mask, struct statx *buf)
-{
-#ifdef __NR_statx
-	return my_syscall5(__NR_statx, fd, path, flags, mask, buf);
-#else
-	return __nolibc_enosys(__func__, fd, path, flags, mask, buf);
-#endif
-}
-
-static __attribute__((unused))
-int statx(int fd, const char *path, int flags, unsigned int mask, struct statx *buf)
-{
-	return __sysret(sys_statx(fd, path, flags, mask, buf));
-}
-
-
-static __attribute__((unused))
-int stat(const char *path, struct stat *buf)
-{
-	struct statx statx;
-	long ret;
-
-	ret = __sysret(sys_statx(AT_FDCWD, path, AT_NO_AUTOMOUNT, STATX_BASIC_STATS, &statx));
-	if (ret == -1)
-		return ret;
-
-	buf->st_dev          = ((statx.stx_dev_minor & 0xff)
-			       | (statx.stx_dev_major << 8)
-			       | ((statx.stx_dev_minor & ~0xff) << 12));
-	buf->st_ino          = statx.stx_ino;
-	buf->st_mode         = statx.stx_mode;
-	buf->st_nlink        = statx.stx_nlink;
-	buf->st_uid          = statx.stx_uid;
-	buf->st_gid          = statx.stx_gid;
-	buf->st_rdev         = ((statx.stx_rdev_minor & 0xff)
-			       | (statx.stx_rdev_major << 8)
-			       | ((statx.stx_rdev_minor & ~0xff) << 12));
-	buf->st_size         = statx.stx_size;
-	buf->st_blksize      = statx.stx_blksize;
-	buf->st_blocks       = statx.stx_blocks;
-	buf->st_atim.tv_sec  = statx.stx_atime.tv_sec;
-	buf->st_atim.tv_nsec = statx.stx_atime.tv_nsec;
-	buf->st_mtim.tv_sec  = statx.stx_mtime.tv_sec;
-	buf->st_mtim.tv_nsec = statx.stx_mtime.tv_nsec;
-	buf->st_ctim.tv_sec  = statx.stx_ctime.tv_sec;
-	buf->st_ctim.tv_nsec = statx.stx_ctime.tv_nsec;
-
-	return 0;
-}
-
 
 /*
  * int symlink(const char *old, const char *new);
diff --git a/tools/include/nolibc/sys/stat.h b/tools/include/nolibc/sys/stat.h
new file mode 100644
index 0000000000000000000000000000000000000000..0eaf5496ce233a4d8b5a239eef5ecefe05a39dd6
--- /dev/null
+++ b/tools/include/nolibc/sys/stat.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
+/*
+ * stat definition for NOLIBC
+ * Copyright (C) 2017-2021 Willy Tarreau <w@1wt.eu>
+ */
+
+#ifndef _NOLIBC_SYS_STAT_H
+#define _NOLIBC_SYS_STAT_H
+
+#include "../arch.h"
+#include "../types.h"
+#include "../sys.h"
+
+/*
+ * int statx(int fd, const char *path, int flags, unsigned int mask, struct statx *buf);
+ * int stat(const char *path, struct stat *buf);
+ */
+
+static __attribute__((unused))
+int sys_statx(int fd, const char *path, int flags, unsigned int mask, struct statx *buf)
+{
+#ifdef __NR_statx
+	return my_syscall5(__NR_statx, fd, path, flags, mask, buf);
+#else
+	return __nolibc_enosys(__func__, fd, path, flags, mask, buf);
+#endif
+}
+
+static __attribute__((unused))
+int statx(int fd, const char *path, int flags, unsigned int mask, struct statx *buf)
+{
+	return __sysret(sys_statx(fd, path, flags, mask, buf));
+}
+
+
+static __attribute__((unused))
+int stat(const char *path, struct stat *buf)
+{
+	struct statx statx;
+	long ret;
+
+	ret = __sysret(sys_statx(AT_FDCWD, path, AT_NO_AUTOMOUNT, STATX_BASIC_STATS, &statx));
+	if (ret == -1)
+		return ret;
+
+	buf->st_dev          = ((statx.stx_dev_minor & 0xff)
+			       | (statx.stx_dev_major << 8)
+			       | ((statx.stx_dev_minor & ~0xff) << 12));
+	buf->st_ino          = statx.stx_ino;
+	buf->st_mode         = statx.stx_mode;
+	buf->st_nlink        = statx.stx_nlink;
+	buf->st_uid          = statx.stx_uid;
+	buf->st_gid          = statx.stx_gid;
+	buf->st_rdev         = ((statx.stx_rdev_minor & 0xff)
+			       | (statx.stx_rdev_major << 8)
+			       | ((statx.stx_rdev_minor & ~0xff) << 12));
+	buf->st_size         = statx.stx_size;
+	buf->st_blksize      = statx.stx_blksize;
+	buf->st_blocks       = statx.stx_blocks;
+	buf->st_atim.tv_sec  = statx.stx_atime.tv_sec;
+	buf->st_atim.tv_nsec = statx.stx_atime.tv_nsec;
+	buf->st_mtim.tv_sec  = statx.stx_mtime.tv_sec;
+	buf->st_mtim.tv_nsec = statx.stx_mtime.tv_nsec;
+	buf->st_ctim.tv_sec  = statx.stx_ctime.tv_sec;
+	buf->st_ctim.tv_nsec = statx.stx_ctime.tv_nsec;
+
+	return 0;
+}
+
+
+/* make sure to include all global symbols */
+#include "../nolibc.h"
+
+#endif /* _NOLIBC_SYS_STAT_H */

-- 
2.49.0

