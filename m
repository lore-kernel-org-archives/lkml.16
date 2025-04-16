Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A4224A055
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805185; cv=none; b=jO4jKeslbhT+ajhRebBnGRTwCvsnc7AMLR1c/1px2cYBK6gVnmMG1fl98yuAZ3D8oHkoDbOyxrQGW6eBEYkA28kMKB7JICjIozYERkwUcDh1vQ3woL8c6wZJ+u0hzbGxaBFKdVSbeXGxjEBs5BdNquw6Ta8LG0PgybZ3kAiyfDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805185; c=relaxed/simple;
	bh=/v1YZLb5r0nwuzBwXN9pK+KCnV1nO/MMUBtr8E5Yrus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pX3+SNsI06Jy715uQV5gSA0+2fGTvKjOc+AGh3P+20MpfXkiTnUZeSfIhpxkcYTdAv+wNMX6sRw2Z++Ge5Q6f/v+PiKVTmdtsAITGD1pCD9mcoJlERkVIVTE6nKAS3rI9QaJ9JPqagrYtKBhIy62GePVRdAoDAqpNoRbHf9F7CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JBlsWcpe; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kV4dRiKD; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JBlsWcpe";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kV4dRiKD"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744805181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OtHlFmG4xMfevK368geVp5vwSOOouC9xi41I1IozzwI=;
	b=JBlsWcpeztaI1nc0zF//sewYNrKtHRXzi58qL3SNexi/byDvrGdfu0asPhmShink3Lfpa9
	IM9x/9G3YX850gGt7XUPsaMiobKSFtA86zZmgOWkbogrxIitbw3epFNoftcUdT9A7SwW67
	5qsVwVkf3nR4Rx9F60xmWRiCV91rniPNUjYrW2uUd3gq1QPseGjAyFt5LX9KFbopxVnUVV
	Y91eOPxClOCYcN19P6E16n48zS230kfR6TFQtIUP3YAd3CfNZ6tFDvSw9aE5M/RVT/n6TX
	V7SbZBOFmziSTNOq1tpxGiH2SfeZMT2K3XpTg5MN2dEtoEpnN37ZTI2r0Bu6ew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744805181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OtHlFmG4xMfevK368geVp5vwSOOouC9xi41I1IozzwI=;
	b=kV4dRiKDz5DQHEpwBrkgpNlvTx0fV/A/GKdyywn3NkB/IO9JjEV5ZO/SPYhFpE4+2Hk4WE
	usz8H422JvmKlzAg==
Date: Wed, 16 Apr 2025 14:06:17 +0200
Subject: [PATCH 02/10] tools/nolibc: add elf.h
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250416-nolibc-split-sys-v1-2-a069a3f1d145@linutronix.de>
References: <20250416-nolibc-split-sys-v1-0-a069a3f1d145@linutronix.de>
In-Reply-To: <20250416-nolibc-split-sys-v1-0-a069a3f1d145@linutronix.de>
To: Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744805177; l=1759;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=/v1YZLb5r0nwuzBwXN9pK+KCnV1nO/MMUBtr8E5Yrus=;
 b=5urcga8JNB3Agfa0IMvsjpbtvE2GaILFFYBH/5wBZ8bt/eADjYapbnRcgcL4K2e0UBATT70/y
 wvHwLUOTD4MBXK2OdWSzB/SmsXeDavUra7zes98PIj+1dhONjlWivoN
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The UAPI header do already provide an elf.h implementation.
Reexport it under its libc name.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/include/nolibc/Makefile |  1 +
 tools/include/nolibc/elf.h    | 15 +++++++++++++++
 tools/include/nolibc/nolibc.h |  1 +
 3 files changed, 17 insertions(+)

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index f562cb53be10efc4e0758b8836cf3ace5b3c151f..fd76d267d79a8533b7e78375c30324c962b01973 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -30,6 +30,7 @@ all_files := \
 		crt.h \
 		ctype.h \
 		dirent.h \
+		elf.h \
 		errno.h \
 		limits.h \
 		nolibc.h \
diff --git a/tools/include/nolibc/elf.h b/tools/include/nolibc/elf.h
new file mode 100644
index 0000000000000000000000000000000000000000..beb0b3a87569a3037055c8fe7e9b086a26ca7d13
--- /dev/null
+++ b/tools/include/nolibc/elf.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
+/*
+ * Shim elf.h header for NOLIBC.
+ * Copyright (C) 2025 Thomas Weißschuh <thomas.weissschuh@linutronix.de>
+ */
+
+#ifndef _NOLIBC_SYS_ELF_H
+#define _NOLIBC_SYS_ELF_H
+
+#include <linux/elf.h>
+
+/* make sure to include all global symbols */
+#include "nolibc.h"
+
+#endif /* _NOLIBC_SYS_ELF_H */
diff --git a/tools/include/nolibc/nolibc.h b/tools/include/nolibc/nolibc.h
index 70872401aca8d5aa37b12ee585193353f692576d..127f0d9068c6508bd45acfe0ebf2ce15acc422b0 100644
--- a/tools/include/nolibc/nolibc.h
+++ b/tools/include/nolibc/nolibc.h
@@ -97,6 +97,7 @@
 #include "types.h"
 #include "sys.h"
 #include "ctype.h"
+#include "elf.h"
 #include "signal.h"
 #include "unistd.h"
 #include "stdio.h"

-- 
2.49.0

