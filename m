Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A859417A2F0
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 22:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745707671; cv=none; b=nhrkEvY0G5louyFaP8j0E2ESkkYBCTONXW5MMO33K+6foFL+/pz1dS+WsOqLfesRN85rLIZOb4d3dOW8St0510MWQDSQh69qRxSb3mCvm8pEI57YhEwg5xW/B4XqlAoIYqg+k4ace1sCTkkDM5hCjfDNJqDCtEIm0sdYrBIRo9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745707671; c=relaxed/simple;
	bh=7jnVwNv2fEMSIEnmRi1jlxWFVRZqZR5NsvlfRYB1RZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OCk/fgbBrfcN4eZkBS12X97AlrzJunXKEU+ydGbabJZOO6mMzPzt4qb1GZ0uv7u9XL9xQ2AnBiUVvW9XBfE918+5YWGclLTwMDDGsXsW290NPRRTsB9kKxkVpUZk2VFPBuCnddjmcLNsI5Fap2JG25WoTRYLe4xbIcEm8T1/2VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=ftWh7nNU; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="ftWh7nNU"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b07d607dc83so3106043a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 15:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1745707667; x=1746312467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TQLaLeT73x9xsXfg44TW/m8g/pnyYWDCj9Tv82ccYJE=;
        b=ftWh7nNUfHgbQV4sYZW2nR+r02iDHQD9lZl9ZFqP/uG1zKGp+Y1743pmRe6757eXh1
         XnkD2gBxMTZP70QTvY+cnY57X+/dj8iKCIN/oumydES1f0D/tqG82AKfhZMFYaJHUcXg
         3suybSEJ7UoZxoELFDz2xK7JOyvuoSn6D0/F4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745707667; x=1746312467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQLaLeT73x9xsXfg44TW/m8g/pnyYWDCj9Tv82ccYJE=;
        b=hnwZK6eHHR9XfB7Vf10udlTn5UE2P3JVMK3lkabloqSUP/NuNK61P6VFR3bDUFMD46
         9sYxKi7r04f9Xzfw0VA1rwZMddYdIDA0Hp9NSzWoC9YemEhnSTfFS3NKums8sr0G1AQK
         KNZwWN1VJ+EOes34jpJ9DnPLJqnJxPXKUtpbA18O/jqdU6phndZos6VZVNZlMM4BtQSf
         2jz3UNnCrJ3FJWRbZb9yqtFzOLl3hx3u3H3uQwoq4c28v3Bb16IrRBkAZL6/9tTkZljt
         6FI2dwU9/pp9gBgWBbMt85bGqRrC/GbnlA40Tr1I17XnhoAiyM4+NsIPgBO19VClBrNF
         438w==
X-Gm-Message-State: AOJu0YxfWpqEfob0KFipDRXHqYcJ2vunGpRXKvoVqk7Bt+D42ZUmVJsS
	6xD6GKUpKhSDHA5iya7pF/NpVBdXEWl9+hUBk26dZaiCcTisGSZUgUsmI4Ny1KmBHzEsjiWzA9M
	2bJ4=
X-Gm-Gg: ASbGncvcYjp0M5f9wJWoXbeagKaj2yoP2Xiov/0KItHa5Okm4bx1TuNjRw4X9LeRXmd
	FAb4yWdk1irPgkiCEfIZ6gLpYxQPNeEhoDFA46F92+vboGjPSD7eF1oHGxaCM11tLkhrddsWRXE
	IlyVqMlFYcWICMoloRzQ+pdXETUrCtMlnPuwbmS9Dqb9o7UWFMDqudoDg6str3Pqh/2x0CwLoCn
	Tb5kl9f1//XF0bxDvpxKwIzS7FxlsvowO7eaIOb5objDfHl1n3q6YXPOPB4vX7ZkCSjTRdjH5cT
	2/Di7A5sxVvND+QCqo8kOziEEocELcv4GqyPntbK/ot0s0vHCtekmSizkBslTyk/
X-Google-Smtp-Source: AGHT+IEdCDDjo4yW3+IH0PY2boqnoSSaIO4QUefy4XRkK90mMsiPhPXe+a3+6eYvXQ38oNJtjM09ig==
X-Received: by 2002:a05:6a20:43a8:b0:1f5:a3e8:64c1 with SMTP id adf61e73a8af0-2045b42a884mr9488088637.0.1745707666631;
        Sat, 26 Apr 2025 15:47:46 -0700 (PDT)
Received: from shiro.work.home.arpa. ([2400:4162:2428:2ffe:5393:61f3:16d7:186f])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b15fa80fa6asm4844659a12.61.2025.04.26.15.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 15:47:46 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: w@1wt.eu,
	linux@weissschuh.net,
	linux-m68k@lists.linux-m68k.org,
	geert@linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH v3] tools/nolibc: Add m68k support
Date: Sun, 27 Apr 2025 07:47:38 +0900
Message-ID: <20250426224738.284874-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nolibc support for m68k. Should be helpful for nommu where
linking libc can bloat even hello world to the point where you get
an OOM just trying to load it.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 tools/include/nolibc/arch-m68k.h            | 141 ++++++++++++++++++++
 tools/include/nolibc/arch.h                 |   2 +
 tools/testing/selftests/nolibc/Makefile     |   5 +
 tools/testing/selftests/nolibc/run-tests.sh |   5 +
 4 files changed, 153 insertions(+)
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
index b8c1da9a88d1..d20b2304aac2 100644
--- a/tools/include/nolibc/arch.h
+++ b/tools/include/nolibc/arch.h
@@ -35,6 +35,8 @@
 #include "arch-loongarch.h"
 #elif defined(__sparc__)
 #include "arch-sparc.h"
+#elif defined(__m68k__)
+#include "arch-m68k.h"
 #else
 #error Unsupported Architecture
 #endif
diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index d17750761d9f..2671383045db 100644
--- a/tools/testing/selftests/nolibc/Makefile
+++ b/tools/testing/selftests/nolibc/Makefile
@@ -80,6 +80,7 @@ IMAGE_s390       = arch/s390/boot/bzImage
 IMAGE_loongarch  = arch/loongarch/boot/vmlinuz.efi
 IMAGE_sparc32    = arch/sparc/boot/image
 IMAGE_sparc64    = arch/sparc/boot/image
+IMAGE_m68k       = vmlinux
 IMAGE            = $(objtree)/$(IMAGE_$(XARCH))
 IMAGE_NAME       = $(notdir $(IMAGE))
 
@@ -103,8 +104,10 @@ DEFCONFIG_s390       = defconfig compat.config
 DEFCONFIG_loongarch  = defconfig
 DEFCONFIG_sparc32    = sparc32_defconfig
 DEFCONFIG_sparc64    = sparc64_defconfig
+DEFCONFIG_m68k       = virt_defconfig
 DEFCONFIG            = $(DEFCONFIG_$(XARCH))
 
+EXTRACONFIG_m68k      = -e CONFIG_BLK_DEV_INITRD
 EXTRACONFIG           = $(EXTRACONFIG_$(XARCH))
 
 # optional tests to run (default = all)
@@ -130,6 +133,7 @@ QEMU_ARCH_s390       = s390x
 QEMU_ARCH_loongarch  = loongarch64
 QEMU_ARCH_sparc32    = sparc
 QEMU_ARCH_sparc64    = sparc64
+QEMU_ARCH_m68k       = m68k
 QEMU_ARCH            = $(QEMU_ARCH_$(XARCH))
 
 QEMU_ARCH_USER_ppc64le = ppc64le
@@ -162,6 +166,7 @@ QEMU_ARGS_s390       = -M s390-ccw-virtio -append "console=ttyS0 panic=-1 $(TEST
 QEMU_ARGS_loongarch  = -M virt -append "console=ttyS0,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS_sparc32    = -M SS-5 -m 256M -append "console=ttyS0,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS_sparc64    = -M sun4u -append "console=ttyS0,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
+QEMU_ARGS_m68k       = -M virt -append "console=ttyGF0,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS            = -m 1G $(QEMU_ARGS_$(XARCH)) $(QEMU_ARGS_BIOS) $(QEMU_ARGS_EXTRA)
 
 # OUTPUT is only set when run from the main makefile, otherwise
diff --git a/tools/testing/selftests/nolibc/run-tests.sh b/tools/testing/selftests/nolibc/run-tests.sh
index 040956a9f5b8..8277599e6441 100755
--- a/tools/testing/selftests/nolibc/run-tests.sh
+++ b/tools/testing/selftests/nolibc/run-tests.sh
@@ -26,6 +26,7 @@ all_archs=(
 	s390x s390
 	loongarch
 	sparc32 sparc64
+	m68k
 )
 archs="${all_archs[@]}"
 
@@ -186,6 +187,10 @@ test_arch() {
 		echo "Unsupported configuration"
 		return
 	fi
+	if [ "$arch" = "m68k" ] && [ "$llvm" = "1" ]; then
+		echo "Unsupported configuration"
+		return
+	fi
 
 	mkdir -p "$build_dir"
 	swallow_output "${MAKE[@]}" defconfig
-- 
2.49.0

