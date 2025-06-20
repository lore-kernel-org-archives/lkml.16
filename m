Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7875027CCE4
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750413782; cv=none; b=Mapy+hqOU+n7fxOSulLOp7EZHFnNAHQfRZ6v8zem59DO2UDvkLzM0Sj5NsHJGwHtIxt+BcuZo1Roq69pXV2Ay/uPHv31+XCW0N+gK8W/K/hRA5D8Jjgns+BNrFYapFNR+UmlHYpz6UcrJZDCTpb4M+AyOrnlIZsVGdcoI/BK/9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750413782; c=relaxed/simple;
	bh=bYfC2Vp6/4HomcxJ4kr8vJzTAiXmvotjcZmSeB8lQ/4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=o7gycr6DDTzMZJhvdpSweokycxaP040NlaScezbucQvtsUhmyD4qZPTywco3GddrQ3pRiIzqc3qmW4qOqkbesedWIRXVi06cbKqXdwZlaA1yI+wP6sFmDMHmkDP/pTSEJA4qv7+9vb20d4CfGyh/yVTGRzIsCHrjEJsvVXT3K7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55KA2vJ0009925;
	Fri, 20 Jun 2025 12:02:57 +0200
From: Willy Tarreau <w@1wt.eu>
To: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>
Subject: [PATCH 2/4] tools/nolibc: add the more portable inttypes.h
Date: Fri, 20 Jun 2025 12:02:49 +0200
Message-Id: <20250620100251.9877-3-w@1wt.eu>
X-Mailer: git-send-email 2.17.5
In-Reply-To: <20250620100251.9877-1-w@1wt.eu>
References: <20250620100251.9877-1-w@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

It's often recommended to only use inttypes.h instead of stdint.h for
portability reasons since the former is always present when the latter
is present, but not conversely, and the former includes the latter. Due
to this some simple programs fail to build when including inttypes.h.
Let's add one that simply includes stdint.h to better support these
programs.

Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 tools/include/nolibc/Makefile   | 1 +
 tools/include/nolibc/inttypes.h | 8 ++++++++
 2 files changed, 9 insertions(+)
 create mode 100644 tools/include/nolibc/inttypes.h

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index f91d29705733a..725cf49516185 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -34,6 +34,7 @@ all_files := \
 		errno.h \
 		fcntl.h \
 		getopt.h \
+		inttypes.h \
 		limits.h \
 		math.h \
 		nolibc.h \
diff --git a/tools/include/nolibc/inttypes.h b/tools/include/nolibc/inttypes.h
new file mode 100644
index 0000000000000..1088034ef7cca
--- /dev/null
+++ b/tools/include/nolibc/inttypes.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
+
+#ifndef _NOLIBC_INTTYPES_H
+#define _NOLIBC_INTTYPES_H
+
+#include "stdint.h"
+
+#endif /* _NOLIBC_INTTYPES_H */
-- 
2.17.5

