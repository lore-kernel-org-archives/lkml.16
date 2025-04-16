Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717F124BC00
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805188; cv=none; b=CNQnl+2Huulnrs+/GwUzpn88ay6TjzbAJitHePEXu5X3d59crfNFtOQBMQQFUh/ctFUIXzBSFFeI6bKleojDmcUY77fbufcwGpwb/uEE3mprOBgQ5cwr2HYXNaYQH+qNG/YqRW/A3TEr4KmKNrpTzkB0bBk8cpN1lG2vJKAhrks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805188; c=relaxed/simple;
	bh=1Qnrc6rAw5hJRam6pGN88aEHp/LPtZpgzUasKky/zvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XBqHoKSmr4/OJddw/GqzRpA2Jy7Z8VcxVp+a5G2cI7tg1965ii+UcdqovWsVi1+n3/wYF9aLeOLxKOfixxqnb65qd8zR77iJfQ9iPB77deGsO50GF0D9Marzxde2N90rx8uuioAzBTVgavabbT2VLJCffh1aynPqUsIYMh1DOYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JlNSglxj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HKK77xW2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JlNSglxj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HKK77xW2"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744805184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EsZfCVPNTklu2oJUJZUYoKj73ykVR4loztF04/oA3HA=;
	b=JlNSglxjqjpBWDev9KWSBkblNI8agW0Q3116ud5PIxp0sNloW9Ja+3CpxdZAl45Pl8jV6f
	qQz6EEu/6pNuDrkmk49qpgUpj6WjHU9HvYiZabKG4kmNs2h+CvseBI3Y75ej80vCENKzx8
	MHieSu7DxDN05qro0Xldethidkn0A0iTRtTlKwqyrePldbzDTS2mi2MVcWUQLFFhfdNrTz
	zyd0tK6LfCbSI2FWuheBFcMBJqm89SKz5c5fUxSZ9CIvDJAfPtmUW0He2tEwOyMAInlQsj
	pAVwtPtItgDmrc+/fUnDm7jEGn7tPlG8LTl0hUQRWlCF4Wg2rvYpYqvlZ0MFRQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744805184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EsZfCVPNTklu2oJUJZUYoKj73ykVR4loztF04/oA3HA=;
	b=HKK77xW2PhxzwcMgNM3WW+YdL+tl0/Tefyv0b73NhaRoP9w6s5oBZesn7WxdGYcZkZauof
	EF/91Z7rGgw9QCAA==
Date: Wed, 16 Apr 2025 14:06:23 +0200
Subject: [PATCH 08/10] tools/nolibc: move gettimeofday() to sys/time.h
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250416-nolibc-split-sys-v1-8-a069a3f1d145@linutronix.de>
References: <20250416-nolibc-split-sys-v1-0-a069a3f1d145@linutronix.de>
In-Reply-To: <20250416-nolibc-split-sys-v1-0-a069a3f1d145@linutronix.de>
To: Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744805177; l=3163;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=1Qnrc6rAw5hJRam6pGN88aEHp/LPtZpgzUasKky/zvs=;
 b=EYgoyrPEYV9bJwgytoIVdD21+tmnPXyhDJejyKqExoVoSVSSF2+B29E3nmrwWDsD2IoYHE7st
 k5o5ndNFWvbDOSWdy+jOcptRGMX/J6NW99jyAr3ybL1N9bzeKa05bJ+
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

This is the location regular userspace expects this definition.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/include/nolibc/Makefile   |  1 +
 tools/include/nolibc/nolibc.h   |  1 +
 tools/include/nolibc/sys.h      | 21 ---------------------
 tools/include/nolibc/sys/time.h | 36 ++++++++++++++++++++++++++++++++++++
 4 files changed, 38 insertions(+), 21 deletions(-)

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index 65c3b90f8ba9213401900a8568469bb2c5770dd6..fd1fc769cbbea7c6af998630020d6d621505f2a1 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -48,6 +48,7 @@ all_files := \
 		sys/mman.h \
 		sys/stat.h \
 		sys/syscall.h \
+		sys/time.h \
 		time.h \
 		types.h \
 		unistd.h \
diff --git a/tools/include/nolibc/nolibc.h b/tools/include/nolibc/nolibc.h
index cb5705d55d80862b0c942bffb6c38db7626aac86..d84e8610bf1081bc92d969ab760d8277e25a5174 100644
--- a/tools/include/nolibc/nolibc.h
+++ b/tools/include/nolibc/nolibc.h
@@ -100,6 +100,7 @@
 #include "sys/mman.h"
 #include "sys/stat.h"
 #include "sys/syscall.h"
+#include "sys/time.h"
 #include "ctype.h"
 #include "elf.h"
 #include "signal.h"
diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index c76dc80147281041afa1cb443d01897d186f7168..aab0685af84f46298aae37e5a1bfecb07861db33 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -487,27 +487,6 @@ int getpagesize(void)
 }
 
 
-/*
- * int gettimeofday(struct timeval *tv, struct timezone *tz);
- */
-
-static __attribute__((unused))
-int sys_gettimeofday(struct timeval *tv, struct timezone *tz)
-{
-#ifdef __NR_gettimeofday
-	return my_syscall2(__NR_gettimeofday, tv, tz);
-#else
-	return __nolibc_enosys(__func__, tv, tz);
-#endif
-}
-
-static __attribute__((unused))
-int gettimeofday(struct timeval *tv, struct timezone *tz)
-{
-	return __sysret(sys_gettimeofday(tv, tz));
-}
-
-
 /*
  * uid_t getuid(void);
  */
diff --git a/tools/include/nolibc/sys/time.h b/tools/include/nolibc/sys/time.h
new file mode 100644
index 0000000000000000000000000000000000000000..1d326c05ee627b6bdb7d2777cbb11eea385f2407
--- /dev/null
+++ b/tools/include/nolibc/sys/time.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
+/*
+ * time definitions for NOLIBC
+ * Copyright (C) 2017-2021 Willy Tarreau <w@1wt.eu>
+ */
+
+#ifndef _NOLIBC_SYS_TIME_H
+#define _NOLIBC_SYS_TIME_H
+
+#include "../arch.h"
+#include "../sys.h"
+
+/*
+ * int gettimeofday(struct timeval *tv, struct timezone *tz);
+ */
+
+static __attribute__((unused))
+int sys_gettimeofday(struct timeval *tv, struct timezone *tz)
+{
+#ifdef __NR_gettimeofday
+	return my_syscall2(__NR_gettimeofday, tv, tz);
+#else
+	return __nolibc_enosys(__func__, tv, tz);
+#endif
+}
+
+static __attribute__((unused))
+int gettimeofday(struct timeval *tv, struct timezone *tz)
+{
+	return __sysret(sys_gettimeofday(tv, tz));
+}
+
+/* make sure to include all global symbols */
+#include "../nolibc.h"
+
+#endif /* _NOLIBC_SYS_TIME_H */

-- 
2.49.0

