Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856B2136348
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 21:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750715325; cv=none; b=EIfYCSBIRfU9WDqsp1vMf1k/lgvPljiaph50BmfEBaf4yNJWbeZsfliZUKIO914iphDIXw7XHm4VooddAz8ZVhsO1FWAoH7GPunex6G3B82y8ASn3G16J6gF5RAVM4iKmrU1sdSrWdgIFJoXK4BzbFYOqy1kCB6rGpWYI98rxeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750715325; c=relaxed/simple;
	bh=hJyVid30p5LGKMkfyWhwG16GW8Cc9MyuHBSTdDTOe6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=J/nunTHa4Cpjw4iBajqZKOOFua8aW+YJK+6jhHwzTyiWO+4dXGYLSsWWwFdLnTdXsbWzAI/rjYkjLiostcYjb1kUh3SkVxk4BDdLpm7hfhYjCXgLCbqNGIDNjFqjRDADRHTBjt9GqcwvFcdZdK5+7JI1SS4wAKIfS+Lv/X0Fjnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=jo4yJg5v; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="jo4yJg5v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1750715321;
	bh=hJyVid30p5LGKMkfyWhwG16GW8Cc9MyuHBSTdDTOe6c=;
	h=From:Date:Subject:To:Cc:From;
	b=jo4yJg5vhPnAHrSeNz0zbRnxuaJkt1u7/v/iTKxplSCMrl1AsTQfwJsBQOqLTFi6k
	 8LPjShWSv1wf1P2EFab9aSxqh08iN35NPR3m8k+PvuA17+C6+yGqE7IrIaXANj09e4
	 HbgijS6E1ow38Wt2aVK3qYbISdA7uD50Xh+sLImQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 23 Jun 2025 23:48:34 +0200
Subject: [PATCH] tools/nolibc: use arm64 name over aarch64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250623-nolibc-aarch64-arm64-v1-1-a2892f1c1b27@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIALHLWWgC/x2MQQqAIBAAvxJ7Tkgzob4SHVbbcqEsVogg+nvSZ
 WAOMw9kEqYMQ/WA0MWZj1RE1xWEiGklxXNxMI3pGmdalY6NfVCIEqKzCmUv1BgsWVq8Nj2U9BR
 a+P634/S+H9leIppmAAAA
X-Change-ID: 20250623-nolibc-aarch64-arm64-1ac4e4efb129
To: Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750715320; l=2737;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=hJyVid30p5LGKMkfyWhwG16GW8Cc9MyuHBSTdDTOe6c=;
 b=HBer9ofHHOElICR4fYuAix9rYnC3XV1nolUKGyei9Dd/XQOvMukAGPqYhvp/+zymiF8/hl0iz
 td2/IDWVN7GDrG/MgyUZ5eVTxR6atYp373ckrOVCWUIMrgkmXTWdhXA
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Nolibc generally uses the kernel's architecture names.
aarch64 is the only exception.

Remove the special case.
Nothing changes for the users.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/Makefile                         |  3 +--
 tools/include/nolibc/{arch-aarch64.h => arch-arm64.h} | 10 +++++-----
 tools/include/nolibc/arch.h                           |  2 +-
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index 4bace7737b2ade388e138474c10f027a71e21816..07e7ae418ff50b34ce83c5f9ae17526dd5432667 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -23,8 +23,7 @@ else
 Q=@
 endif
 
-nolibc_arch := $(patsubst arm64,aarch64,$(ARCH))
-arch_file := arch-$(nolibc_arch).h
+arch_file := arch-$(ARCH).h
 all_files := \
 		compiler.h \
 		crt.h \
diff --git a/tools/include/nolibc/arch-aarch64.h b/tools/include/nolibc/arch-arm64.h
similarity index 97%
rename from tools/include/nolibc/arch-aarch64.h
rename to tools/include/nolibc/arch-arm64.h
index 937a348da42e1b134d9736a5a0f6920df6e4709d..02a3f74c8ec841e67004a1a3187908966e20f1d4 100644
--- a/tools/include/nolibc/arch-aarch64.h
+++ b/tools/include/nolibc/arch-arm64.h
@@ -1,16 +1,16 @@
 /* SPDX-License-Identifier: LGPL-2.1 OR MIT */
 /*
- * AARCH64 specific definitions for NOLIBC
+ * ARM64 specific definitions for NOLIBC
  * Copyright (C) 2017-2022 Willy Tarreau <w@1wt.eu>
  */
 
-#ifndef _NOLIBC_ARCH_AARCH64_H
-#define _NOLIBC_ARCH_AARCH64_H
+#ifndef _NOLIBC_ARCH_ARM64_H
+#define _NOLIBC_ARCH_ARM64_H
 
 #include "compiler.h"
 #include "crt.h"
 
-/* Syscalls for AARCH64 :
+/* Syscalls for ARM64 :
  *   - registers are 64-bit
  *   - stack is 16-byte aligned
  *   - syscall number is passed in x8
@@ -150,4 +150,4 @@ void __attribute__((weak, noreturn)) __nolibc_entrypoint __no_stack_protector _s
 	);
 	__nolibc_entrypoint_epilogue();
 }
-#endif /* _NOLIBC_ARCH_AARCH64_H */
+#endif /* _NOLIBC_ARCH_ARM64_H */
diff --git a/tools/include/nolibc/arch.h b/tools/include/nolibc/arch.h
index 4ae57aaf9779610dfb63458416f147116d0a98e6..db69537c71d86f5ddc332aa0967bec206feb503b 100644
--- a/tools/include/nolibc/arch.h
+++ b/tools/include/nolibc/arch.h
@@ -20,7 +20,7 @@
 #elif defined(__ARM_EABI__)
 #include "arch-arm.h"
 #elif defined(__aarch64__)
-#include "arch-aarch64.h"
+#include "arch-arm64.h"
 #elif defined(__mips__)
 #include "arch-mips.h"
 #elif defined(__powerpc__)

---
base-commit: eb135311083100b6590a7545618cd9760d896a86
change-id: 20250623-nolibc-aarch64-arm64-1ac4e4efb129

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

