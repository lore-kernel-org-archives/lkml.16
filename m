Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D86024A062
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805186; cv=none; b=Haq2ABNKFGlWCqIdIrYEGUmonFyWPVjWQ3U0yqTlDt7xLfFRgOZiV6cNxIMdC74tMKD9zDZF0VV5f/iSwfc5gxsDcxqrT8CcIvcH+ZMm4n+LAi3/mLO4QuFWF2RgW4ZVCwBpXly88CRy+yejegN41DVDJd3GmJ8DePf9e+fqi1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805186; c=relaxed/simple;
	bh=jcMAMRnolUY1bDZt4MbiC8UWAP3z6gSGbjezDeJ4Z4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=culmVFKBx3NDroHyPytzSM5oLCXfXi8L/1QwXhkoNDBvmEqWADbm21MSJPyXrOsGg+S8B9BG+7NBdIzucdZ+fe2L9wGH0hzNa1nprSre8hqXkMj1oafa3UjsJtNWaVyk/a2qkKfavM5qJguGKCsFz1gx5VuhMwdJFH2QvvrKgkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aAPCOmpU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=443wkJ2F; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aAPCOmpU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="443wkJ2F"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744805182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O47BuNNWp13z6juq4IINR3lK0GsXcN1rSFQjsRGU+oc=;
	b=aAPCOmpUbmUfN9GU8cEWehRy1RLDxdKpmrR9o1hWfEZ0IJ8GSs5bFaMm4I4qvIzTdcsVO2
	1AQJgPGn+KSISGXYfAmHZfwC0hbh02dzqnyb5LjMfpUEn3cV8Kmt9yxRSuEk01eW2NUTsz
	FIknA1Jl17tNWXLHogV+s9myUqAZ+xpcgxuRsQ2vrvN6m4AcwGG4ocG8DeLNVD/61NNtbZ
	FkGZNWkBeMrqM1CmncoohLhO7yEUMX7J2n1hNgxFccwmlSjB4IfKegxMeZ5pIoot76P4s+
	8GGI4rdQasbWe5nIO1jbt2Jlvk0ex4Flm1GrKKkVtEwzxxGH7wtja4zRJqwImQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744805182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O47BuNNWp13z6juq4IINR3lK0GsXcN1rSFQjsRGU+oc=;
	b=443wkJ2Fx2h89663rwxjRCIaGkba4s5yUfFWm3hFbSGtNoJdbH5sSvBB04uBXH7aH99DKt
	tmMdL1A5bud7AlCw==
Date: Wed, 16 Apr 2025 14:06:19 +0200
Subject: [PATCH 04/10] tools/nolibc: move getauxval() to sys/auxv.h
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250416-nolibc-split-sys-v1-4-a069a3f1d145@linutronix.de>
References: <20250416-nolibc-split-sys-v1-0-a069a3f1d145@linutronix.de>
In-Reply-To: <20250416-nolibc-split-sys-v1-0-a069a3f1d145@linutronix.de>
To: Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744805177; l=2973;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=jcMAMRnolUY1bDZt4MbiC8UWAP3z6gSGbjezDeJ4Z4c=;
 b=3AV1pfbj5N0QXHOFyF/zUAhXlsECD95xWZG41NbJ2748ZJt517h179aONPmKxhK6NlOdCheNp
 XwfpxGZxs0WCvWqkVlDxgDbFWwJPK08aXchT3k/4gz1Z+i/8ceQ9UcZ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

This is the location regular userspace expects the definition.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/include/nolibc/Makefile   |  1 +
 tools/include/nolibc/nolibc.h   |  1 +
 tools/include/nolibc/stdlib.h   | 26 --------------------------
 tools/include/nolibc/sys/auxv.h | 41 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 43 insertions(+), 26 deletions(-)

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index 2132e4f4d2165729ec6d10860d0586f1b71ee0fb..a3781f39692532fb75c7aaf70f65b2d5bf7c7abd 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -44,6 +44,7 @@ all_files := \
 		stdlib.h \
 		string.h \
 		sys.h \
+		sys/auxv.h \
 		time.h \
 		types.h \
 		unistd.h \
diff --git a/tools/include/nolibc/nolibc.h b/tools/include/nolibc/nolibc.h
index bb4183a8fdc41023d9b8b37fe35ec37ca408b4c6..0d8c49e0dddc595c2f029788ecb5b51231e2695a 100644
--- a/tools/include/nolibc/nolibc.h
+++ b/tools/include/nolibc/nolibc.h
@@ -96,6 +96,7 @@
 #include "arch.h"
 #include "types.h"
 #include "sys.h"
+#include "sys/auxv.h"
 #include "ctype.h"
 #include "elf.h"
 #include "signal.h"
diff --git a/tools/include/nolibc/stdlib.h b/tools/include/nolibc/stdlib.h
index 86ad378ab1ea220559d5ab1adc4bb9972977ba9e..ba8a1427121fc543fc83646e5108c645cbdd62a2 100644
--- a/tools/include/nolibc/stdlib.h
+++ b/tools/include/nolibc/stdlib.h
@@ -102,32 +102,6 @@ char *getenv(const char *name)
 	return NULL;
 }
 
-static __attribute__((unused))
-unsigned long getauxval(unsigned long type)
-{
-	const unsigned long *auxv = _auxv;
-	unsigned long ret;
-
-	if (!auxv)
-		return 0;
-
-	while (1) {
-		if (!auxv[0] && !auxv[1]) {
-			ret = 0;
-			break;
-		}
-
-		if (auxv[0] == type) {
-			ret = auxv[1];
-			break;
-		}
-
-		auxv += 2;
-	}
-
-	return ret;
-}
-
 static __attribute__((unused))
 void *malloc(size_t len)
 {
diff --git a/tools/include/nolibc/sys/auxv.h b/tools/include/nolibc/sys/auxv.h
new file mode 100644
index 0000000000000000000000000000000000000000..04c2b9cbe51a262025bbbc7c74a0640c71529eab
--- /dev/null
+++ b/tools/include/nolibc/sys/auxv.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
+/*
+ * auxv definitions for NOLIBC
+ * Copyright (C) 2017-2021 Willy Tarreau <w@1wt.eu>
+ */
+
+#ifndef _NOLIBC_SYS_AUXV_H
+#define _NOLIBC_SYS_AUXV_H
+
+#include "../crt.h"
+
+static __attribute__((unused))
+unsigned long getauxval(unsigned long type)
+{
+	const unsigned long *auxv = _auxv;
+	unsigned long ret;
+
+	if (!auxv)
+		return 0;
+
+	while (1) {
+		if (!auxv[0] && !auxv[1]) {
+			ret = 0;
+			break;
+		}
+
+		if (auxv[0] == type) {
+			ret = auxv[1];
+			break;
+		}
+
+		auxv += 2;
+	}
+
+	return ret;
+}
+
+/* make sure to include all global symbols */
+#include "../nolibc.h"
+
+#endif /* _NOLIBC_SYS_AUXV_H */

-- 
2.49.0

