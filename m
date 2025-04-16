Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CEE24BC05
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805188; cv=none; b=aeNrKXyRcq3mmaVI1F4T1CrHQt412ZvqJejK+Q5vf0CFo15v6zy68xphu86ZKZ5qcsVOSi9AdnDArhROGYttUOEL90fzNJaXxsbvRrI7JA0Txku5qlHfLXAtTQHcgTMWngk7rZYHKUeWnPXex59fGSxvPHvD+XAhaqM1wMeBUFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805188; c=relaxed/simple;
	bh=LrHZmBSjZyJtBwi7Xec5/FgQGau4RHBwW5b5Qv66hLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TROWDbmL6MhTSXezJT5NjEqWCYTyB/kIbiDknf3OIFUDKVPNScgvH72AWRXvERLt0cV1vqjQ1pGuwyfOMj6hKS2CtgYXfh8jBa4k5xEp0tWgn6hHn5JZw1HjM0jpN+crAcy7+sS6/frlNQrsiiebMQjaFbYtLSRBl7FkWytnKAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GHfUsUSh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BhrNHaP5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GHfUsUSh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BhrNHaP5"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744805185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+O/lR8DudN7PYqjkHN9bqWoJLyoECOmuCmKyj9nlMf8=;
	b=GHfUsUSh96+0mn0gY2mB8rfvTaHn1TN0Z/pgOisyVpwDmE3Nrj0b/jNtPjvqrSTdPGc1FI
	TBp4ijr5Dl3woIXyu2c0JGsnabhaRiw3Tc50zbLpXiwUetUIGae/CtITTEAcdDwMvmrJT0
	gYRjeQuJvVaX4iAOU1kbkx//6N6+LIgv7UxFYle53UIbxBEP9pTdW/Em0KTqvI0cGnlLGv
	D+TZpGQMZ43WgzC9U9BrbD0kPm5H8nahwPcBxo8KPRJ72lXmHiUJYU0jA8PTB1GGYpskR/
	FL3MeDnBct8vGC3+EyDsPStrHo61cwVGo5/Sgjin0ukZi6UUSTzkyOIS3ervwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744805185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+O/lR8DudN7PYqjkHN9bqWoJLyoECOmuCmKyj9nlMf8=;
	b=BhrNHaP578C3qmvxovOmMHJArMpMYvsFO24WO9OF0h+jc8GSLTi8v6Yx/14h49zBr2asBX
	elbMhkRGDZ1eBECg==
Date: Wed, 16 Apr 2025 14:06:24 +0200
Subject: [PATCH 09/10] tools/nolibc: add sys/types.h shim
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250416-nolibc-split-sys-v1-9-a069a3f1d145@linutronix.de>
References: <20250416-nolibc-split-sys-v1-0-a069a3f1d145@linutronix.de>
In-Reply-To: <20250416-nolibc-split-sys-v1-0-a069a3f1d145@linutronix.de>
To: Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744805177; l=1132;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=LrHZmBSjZyJtBwi7Xec5/FgQGau4RHBwW5b5Qv66hLc=;
 b=0Jgg1AlI7SqVNN60rDdXiQ2EWk+N0dStEc06lXeMcSkxP1Y3ffXIbnTlF76BZjy6uT8nOz04X
 JkWItv6/ZoiCfPZAkhZAcU7vhypbZlAvLrZp6iL0zTvSVm1WkL3ewpW
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

This is the location regular userspace expects the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/include/nolibc/Makefile    | 1 +
 tools/include/nolibc/sys/types.h | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index fd1fc769cbbea7c6af998630020d6d621505f2a1..fec0d4eb2119c8ad2bf65d386b8b5799adf0be5c 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -49,6 +49,7 @@ all_files := \
 		sys/stat.h \
 		sys/syscall.h \
 		sys/time.h \
+		sys/types.h \
 		time.h \
 		types.h \
 		unistd.h \
diff --git a/tools/include/nolibc/sys/types.h b/tools/include/nolibc/sys/types.h
new file mode 100644
index 0000000000000000000000000000000000000000..8a264a13275c4ad72cd0345368dc00a731f88cc0
--- /dev/null
+++ b/tools/include/nolibc/sys/types.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
+/*
+ * sys/types.h shim for NOLIBC
+ * Copyright (C) 2025 Thomas Weißschuh <thomas.weissschuh@linutronix.de>
+ */
+
+#include "../types.h"

-- 
2.49.0

