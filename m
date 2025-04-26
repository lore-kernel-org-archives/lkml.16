Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3699315A864
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 04:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745640742; cv=none; b=sZfCneEZxM/19t3IJV5XYWdRujaNEIwLqlTxuTflEO/abtz3V/0F9Y7UCaaC2JjgKR9V+cps4HSzPeOU3RREJ3hlL0o+zd/kovPh02BiQ/jAg8852tOQcoBYtto0UIJ3osZM/L9KKkHHaMiaUhXlCCImqXTXUiXeIsJKVoB7HBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745640742; c=relaxed/simple;
	bh=X798se1yqIjQj7BbSweueyaGMPQVZK7ePL+HlYpOiZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BT4YyuyqWOdTw8LhXYpAWZOq43RZpz/otiPqQo9P9FSc9CWWax9W+4/Kazi6P5+YrGg0+DZA3nEIX+V/pAePz5DjJO4LzBwgiQOCEpJv6mz9F3p6lDjc/b1jBBNkTgNYMDMPm6D+d9D6JHHuEDdqJ5aNp3SC4tX6KvWQHOPXl10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=q4dqkHAF; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="q4dqkHAF"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22423adf751so33034955ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1745640738; x=1746245538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LuPMmzATkY8xATRRwXVPRE8uVlsNQkZoSS0OdxW6pAs=;
        b=q4dqkHAFNc3Pn+JawZchO8BBJ6LPgnT8aiqXxj3ZwvFhuttaoA9IWpH9RbOxVHzolH
         A/s3+IPdgR8AvX2790EUa10YcRvHmGTjnLfFmIk/GDreQzOgQ6rVFNIpKUhhxPWrcY5K
         nwr7UCti+JysAAWb4JvsA4XN3UvHZ2TUvbgCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745640738; x=1746245538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LuPMmzATkY8xATRRwXVPRE8uVlsNQkZoSS0OdxW6pAs=;
        b=NepeSuY/U1+tVX9KB4TbLQ8cLd7+AC47MIQVBTOaPXPZ5soQibVXW5wL2npTAtVR7A
         qBEtHBqFIcektKEN5/zXK83G9Bb2PX5fHSn+xWtRjlsj4BsqYQnao/pvbssd+Q+0A7Uv
         i3r/R5DWkhS1fchqz8yvt5YiOe472yUVKzPsq+lQH+Detsu7YeYHzdf2QRS5n7KZ1Reb
         fFbYr3PpRjRcMpL4wqsyy+VqN34auqS5lEqFgXYBdOsI+68C0kXnkh9U9FAwNqdoovzB
         jxihWKcFeIk4RKXRTZTxu32peZqQOQrwvq2SbfgF9mWLtst5hAwNcUEXZ1RL66UzqThp
         CLIA==
X-Gm-Message-State: AOJu0Yyp+3xknOF+oDo2KNi1xhje5nWjbs3Bz0l1BdDzmzhKq281t3NR
	y6yXTaGcrB6wMbKTHYcOjOfcTgO4p4Av9iTFbeOSX8xIjiQ56zt9IsVX8Haq1hYo/1QcBEIplR3
	QmB8=
X-Gm-Gg: ASbGncuFX0q5z6r5yXi0tuJIxEOsFEGFpTRu0eaLiM2z9leCEZ+C/cW2r1jCfAVbZiR
	6SKwVfOwFGPlEkaetm7emNp+apa8xugzxiF13sAUlFfOaoiEnqrDT2KxMmtAPjrNi5iLUrPnBGc
	kvLTX5zJoJgIoNG+GB7V622HngFfUPhuKVOZflUEQhBZYy1i/W1Zn4lu5ax7l4p95CG+mDoDwmy
	h75XKE6S4fJ0Qx/s8sM6uwVQNbp4rwGl8f+zRUJV9q57B630d9u2o61x/hr2HVbVrJn8ezN4IPl
	xTt+tV2MwktueNTWKWu+gSlTIKnKn1hHZEaL2R1cB0Xagtx9x+Kd/o9lgj9VUu/g
X-Google-Smtp-Source: AGHT+IHIZFD7SC+VCaiJEN9Ucea/7xDUmwe56OfPeUEExIBNy9kJZpr29LjEj0S+2onGXU4Fs1xFhw==
X-Received: by 2002:a17:903:3d08:b0:224:910:23f6 with SMTP id d9443c01a7336-22dbf743518mr74777915ad.45.1745640738287;
        Fri, 25 Apr 2025 21:12:18 -0700 (PDT)
Received: from shiro.work.home.arpa. ([2400:4162:2428:2ffe:5393:61f3:16d7:186f])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-22db51025basm41093945ad.187.2025.04.25.21.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 21:12:17 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: w@1wt.eu,
	linux@weissschuh.net,
	linux-m68k@lists.linux-m68k.org,
	geert@linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH] tools/nolibc: Add m68k support
Date: Sat, 26 Apr 2025 13:12:12 +0900
Message-ID: <20250426041212.4141152-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Palmer <daniel@thingy.jp>

Add nolibc support for m68k. Should be helpful for nommu where
linking libc can bloat even hello world to the point where you get
an OOM just trying to load it.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 tools/include/nolibc/arch-m68k.h | 141 +++++++++++++++++++++++++++++++
 tools/include/nolibc/arch.h      |   2 +
 2 files changed, 143 insertions(+)
 create mode 100644 tools/include/nolibc/arch-m68k.h

diff --git a/tools/include/nolibc/arch-m68k.h b/tools/include/nolibc/arch-m68k.h
new file mode 100644
index 000000000000..6dac1845f298
--- /dev/null
+++ b/tools/include/nolibc/arch-m68k.h
@@ -0,0 +1,141 @@
+/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
+/*
+ * m68k specific definitions for NOLIBC
+ * Copyright (C) 2025 Daniel Palmer<daniel@thingy.jp>
+ *
+ * Roughly based on one or more of the other arch files.
+ *
+ */
+
+#ifndef _NOLIBC_ARCH_M68K_H
+#define _NOLIBC_ARCH_M68K_H
+
+#include "compiler.h"
+#include "crt.h"
+
+#define _NOLIBC_SYSCALL_CLOBBERLIST "memory"
+
+#define my_syscall0(num)                                                      \
+({                                                                            \
+	register long _num __asm__ ("d0") = (num);                            \
+									      \
+	__asm__ volatile (                                                    \
+		"trap #0\n"                                                   \
+		: "+r"(_num)                                                  \
+		: "r"(_num)                                                   \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
+	);                                                                    \
+	_num;                                                                 \
+})
+
+#define my_syscall1(num, arg1)                                                \
+({                                                                            \
+	register long _num __asm__ ("d0") = (num);                            \
+	register long _arg1 __asm__ ("d1") = (long)(arg1);                    \
+									      \
+	__asm__ volatile (                                                    \
+		"trap #0\n"                                                   \
+		: "+r"(_num)                                                  \
+		: "r"(_arg1)                                                  \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
+	);                                                                    \
+	_num;                                                                 \
+})
+
+#define my_syscall2(num, arg1, arg2)                                          \
+({                                                                            \
+	register long _num __asm__ ("d0") = (num);                            \
+	register long _arg1 __asm__ ("d1") = (long)(arg1);                    \
+	register long _arg2 __asm__ ("d2") = (long)(arg2);                    \
+									      \
+	__asm__ volatile (                                                    \
+		"trap #0\n"                                                   \
+		: "+r"(_num)                                                  \
+		: "r"(_arg1), "r"(_arg2)                                      \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
+	);                                                                    \
+	_num;                                                                 \
+})
+
+#define my_syscall3(num, arg1, arg2, arg3)                                    \
+({                                                                            \
+	register long _num __asm__ ("d0")  = (num);                           \
+	register long _arg1 __asm__ ("d1") = (long)(arg1);                    \
+	register long _arg2 __asm__ ("d2") = (long)(arg2);                    \
+	register long _arg3 __asm__ ("d3") = (long)(arg3);                    \
+									      \
+	__asm__ volatile (                                                    \
+		"trap #0\n"                                                   \
+		: "+r"(_num)                                                  \
+		: "r"(_arg1), "r"(_arg2), "r"(_arg3)                          \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
+	);                                                                    \
+	_num;                                                                 \
+})
+
+#define my_syscall4(num, arg1, arg2, arg3, arg4)                              \
+({                                                                            \
+	register long _num __asm__ ("d0") = (num);                            \
+	register long _arg1 __asm__ ("d1") = (long)(arg1);                    \
+	register long _arg2 __asm__ ("d2") = (long)(arg2);                    \
+	register long _arg3 __asm__ ("d3") = (long)(arg3);                    \
+	register long _arg4 __asm__ ("d4") = (long)(arg4);                    \
+									      \
+	__asm__ volatile (                                                    \
+		"trap #0\n"                                                   \
+		: "+r" (_num)                                                 \
+		: "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4)              \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
+	);                                                                    \
+	_num;                                                                 \
+})
+
+#define my_syscall5(num, arg1, arg2, arg3, arg4, arg5)                        \
+({                                                                            \
+	register long _num __asm__ ("d0") = (num);                            \
+	register long _arg1 __asm__ ("d1") = (long)(arg1);                    \
+	register long _arg2 __asm__ ("d2") = (long)(arg2);                    \
+	register long _arg3 __asm__ ("d3") = (long)(arg3);                    \
+	register long _arg4 __asm__ ("d4") = (long)(arg4);                    \
+	register long _arg5 __asm__ ("d5") = (long)(arg5);                    \
+									      \
+	__asm__ volatile (                                                    \
+		"trap #0\n"                                                   \
+		: "+r" (_num)                                                 \
+		: "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4), "r"(_arg5)  \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
+	);                                                                    \
+	_num;                                                                 \
+})
+
+#define my_syscall6(num, arg1, arg2, arg3, arg4, arg5, arg6)                  \
+({                                                                            \
+	register long _num __asm__ ("d0")  = (num);                           \
+	register long _arg1 __asm__ ("d1") = (long)(arg1);                    \
+	register long _arg2 __asm__ ("d2") = (long)(arg2);                    \
+	register long _arg3 __asm__ ("d3") = (long)(arg3);                    \
+	register long _arg4 __asm__ ("d4") = (long)(arg4);                    \
+	register long _arg5 __asm__ ("d5") = (long)(arg5);                    \
+	register long _arg6 __asm__ ("a0") = (long)(arg6);                    \
+									      \
+	__asm__ volatile (                                                    \
+		"trap #0\n"                                                   \
+		: "+r" (_num)                                                 \
+		: "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4), "r"(_arg5), \
+		  "r"(_arg6)                                                  \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
+	);                                                                    \
+	_num;                                                                 \
+})
+
+void _start(void);
+void __attribute__((weak, noreturn)) __nolibc_entrypoint __no_stack_protector _start(void)
+{
+	__asm__ volatile (
+		"movel %sp, %sp@-\n"
+		"jsr _start_c\n"
+	);
+	__nolibc_entrypoint_epilogue();
+}
+
+#endif /* _NOLIBC_ARCH_M68K_H */
diff --git a/tools/include/nolibc/arch.h b/tools/include/nolibc/arch.h
index 8a2c143c0fba..ba3da0f098f1 100644
--- a/tools/include/nolibc/arch.h
+++ b/tools/include/nolibc/arch.h
@@ -33,6 +33,8 @@
 #include "arch-s390.h"
 #elif defined(__loongarch__)
 #include "arch-loongarch.h"
+#elif defined(__m68k__)
+#include "arch-m68k.h"
 #else
 #error Unsupported Architecture
 #endif
-- 
2.49.0

