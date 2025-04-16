Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E3224BBE5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805187; cv=none; b=PR4GvOzm3A3RAl763MDj43wMaYaXlwiYj9u9rt2aMccTpaCwKqpZcGEHDgU84mxKLWh4CpdAhMuUgIyvHfMueBAtDVNwo0abGxEZ3A4Ziq0js7eh3HABVHQFJ2V5jbHnDw17Yb9Knd9zKGLTKhJlT9prUdgjTBB1dJ1pksMMkS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805187; c=relaxed/simple;
	bh=FchtojOjPkGYdbnwmQqwZdtrSm/2Z02HmaMULIjplwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jR192Ct4CPYeEMstzLHVjpvdbt/xVFnhRE9vVSXFumVgKQ8aTvCX1x4efzX88fGr7BTphoN/qng06SLUzUb7D3PCK0g+7cHzaQcnOs2CtRvVUXe1i6X5ZgLkFGeN16QnKqKP/q0xr8m4Ki9DHaLsudGnRc6Z771+zn6uYhnaJ2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nxgOtkLf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=W6KzcOi0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nxgOtkLf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="W6KzcOi0"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744805184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r7vr4Sv5pmESa96XKUbIYNisncnTruOja70mEsfDPFM=;
	b=nxgOtkLf9Yr31pgOWb+yvzNts1n+w4JE94KBWW+vj6GTOFYn4JNd+B6EuV4shPf2aWeABE
	U0KI3oRrzQRHSEseUKZWXlMQXWcHBU09k9Xhh9G5R+O8dqll00PN+RWE9O9t2rg1vF7Ms+
	FZMn4lnch8xzokOJLdYG7MJ3TSTksjl1E9FhXC9x8YeubtDlBytLmYz9ZK13Qmes/jqmEF
	BMd55xUo6rfjnpl+uW5K0BopdGZ610su92jusESTUPX6Ih+dK4Am3sWOW7RxJMmf8JxMcq
	/WR/38kbcwwzX/o3y0qW3wNIHT0/CF7yt26vjOGGhhXSKH8JxUgHfZvcyuxN+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744805184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r7vr4Sv5pmESa96XKUbIYNisncnTruOja70mEsfDPFM=;
	b=W6KzcOi0HsMCltmUL0DvmUikZqtrySrY5oT/W8VlobgsfudWE6aHj9rks0UrtUNHNN6K73
	XZ+lUaGPEBe5deDQ==
Date: Wed, 16 Apr 2025 14:06:22 +0200
Subject: [PATCH 07/10] tools/nolibc: move syscall() to sys/syscall.h
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250416-nolibc-split-sys-v1-7-a069a3f1d145@linutronix.de>
References: <20250416-nolibc-split-sys-v1-0-a069a3f1d145@linutronix.de>
In-Reply-To: <20250416-nolibc-split-sys-v1-0-a069a3f1d145@linutronix.de>
To: Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744805177; l=2942;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=FchtojOjPkGYdbnwmQqwZdtrSm/2Z02HmaMULIjplwc=;
 b=Y6WqBgfFqxvWRG3qq2IsZytxMJN1ffR3DPg/1wjop89zKK6J+bhL+LrxalNjsOGI1Ur7+8rqB
 W4/j7rwKrXTDRKWzV111gW0NbsHe5h+0QqL8bMZH8dB+pc9fQy35vFU
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

This is the location regular userspace expects the definition.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/include/nolibc/Makefile      |  1 +
 tools/include/nolibc/nolibc.h      |  1 +
 tools/include/nolibc/sys/syscall.h | 19 +++++++++++++++++++
 tools/include/nolibc/unistd.h      |  6 ------
 4 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index 747d73b453680a32d1b8748640f2ebd1ae9b1fb4..65c3b90f8ba9213401900a8568469bb2c5770dd6 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -47,6 +47,7 @@ all_files := \
 		sys/auxv.h \
 		sys/mman.h \
 		sys/stat.h \
+		sys/syscall.h \
 		time.h \
 		types.h \
 		unistd.h \
diff --git a/tools/include/nolibc/nolibc.h b/tools/include/nolibc/nolibc.h
index 8296cbbeebe994aa335b561a2d9986e529e001a6..cb5705d55d80862b0c942bffb6c38db7626aac86 100644
--- a/tools/include/nolibc/nolibc.h
+++ b/tools/include/nolibc/nolibc.h
@@ -99,6 +99,7 @@
 #include "sys/auxv.h"
 #include "sys/mman.h"
 #include "sys/stat.h"
+#include "sys/syscall.h"
 #include "ctype.h"
 #include "elf.h"
 #include "signal.h"
diff --git a/tools/include/nolibc/sys/syscall.h b/tools/include/nolibc/sys/syscall.h
new file mode 100644
index 0000000000000000000000000000000000000000..59efdec8fd1c8cd9f282d1e9ea52431003342a7f
--- /dev/null
+++ b/tools/include/nolibc/sys/syscall.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
+/*
+ * syscall() definition for NOLIBC
+ * Copyright (C) 2024 Thomas Weißschuh <linux@weissschuh.net>
+ */
+
+#ifndef _NOLIBC_SYS_SYSCALL_H
+#define _NOLIBC_SYS_SYSCALL_H
+
+#define __syscall_narg(_0, _1, _2, _3, _4, _5, _6, N, ...) N
+#define _syscall_narg(...) __syscall_narg(__VA_ARGS__, 6, 5, 4, 3, 2, 1, 0)
+#define _syscall(N, ...) __sysret(my_syscall##N(__VA_ARGS__))
+#define _syscall_n(N, ...) _syscall(N, __VA_ARGS__)
+#define syscall(...) _syscall_n(_syscall_narg(__VA_ARGS__), ##__VA_ARGS__)
+
+/* make sure to include all global symbols */
+#include "../nolibc.h"
+
+#endif /* _NOLIBC_SYS_SYSCALL_H */
diff --git a/tools/include/nolibc/unistd.h b/tools/include/nolibc/unistd.h
index e38f3660c0517d757de1ae497b61c4f61b9f1cdc..ac7d53d986cd11ac84dd0a17e5a7055c779b2b10 100644
--- a/tools/include/nolibc/unistd.h
+++ b/tools/include/nolibc/unistd.h
@@ -56,12 +56,6 @@ int tcsetpgrp(int fd, pid_t pid)
 	return ioctl(fd, TIOCSPGRP, &pid);
 }
 
-#define __syscall_narg(_0, _1, _2, _3, _4, _5, _6, N, ...) N
-#define _syscall_narg(...) __syscall_narg(__VA_ARGS__, 6, 5, 4, 3, 2, 1, 0)
-#define _syscall(N, ...) __sysret(my_syscall##N(__VA_ARGS__))
-#define _syscall_n(N, ...) _syscall(N, __VA_ARGS__)
-#define syscall(...) _syscall_n(_syscall_narg(__VA_ARGS__), ##__VA_ARGS__)
-
 /* make sure to include all global symbols */
 #include "nolibc.h"
 

-- 
2.49.0

