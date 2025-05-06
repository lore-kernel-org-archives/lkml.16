Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991A1286883
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746551382; cv=none; b=X6bnI1qlQsbpwa0/X79SGyQSzJeCxDG1bAAuXXjNQAvzoNFbJTypNZCNEq7ErnDRc0oZnNh2Mx2Omaa2LVqPEQNoAWvAsNdFPrHqnbzmX/Y8SS0XOsxoq8T9JAYH5RU7fBDMVJRG0NOaOevw+PyqcxrmbN4W4+cZdTX+tpjjVXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746551382; c=relaxed/simple;
	bh=j8msM/0S8KJZ4cok9LJpfQK4wpdWi6sw06L1GPevgNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EI1x1EyZv7MiioO8ah/QlUNXneAT5cvd6KKmO8lMw/L8QhtGkIH6NRWeCtLcvPeg5HJfEJl90A2FeEbBubu4y5deAkQ7xvTK2iH/n25HildWyJEvT9pY4EbF0Tud2qAYjH8YzYYK6qQ00AJedAQLWxv1cwmf8MS21yWTACAhako=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tQ2orUv8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tQ2orUv8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44DD9C4CEEF;
	Tue,  6 May 2025 17:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746551382;
	bh=j8msM/0S8KJZ4cok9LJpfQK4wpdWi6sw06L1GPevgNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tQ2orUv81lG3Edq2Qrj6UJnGOx3+lvdXNxHx+O+RkaQhQsyLKqSG+BspH9AHOCAYy
	 jc3W99NCt/dNUNpFOgSzo1kbOe+nW2jX2afzdtP2EKSGVboS7+mKsDuT8obXLCEIuJ
	 mI4cMyp8Y8G9ub3kzJI9eFNeOi4EL7+4S9BzLF8uTHOjpnd+4MlWpbG8/qBjM5MnVo
	 kg1pnaeRzJ0c9pxlWx41Ri1TR5LK2hk5i6jZRO/1oyJqo6MpvHp7PKuW9b/QU9GLsR
	 WgAxrXllVCT2lKukO8dzJDi0KgmNQNOw9Wm7mQ5MSrE6k3yf9vtoj/zbO6F29LMCd5
	 pBnWcE7d5PnJw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Ingo Molnar <mingo@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 04/15] x86/kbuild: Introduce the 'x86_32' subarchitecture
Date: Tue,  6 May 2025 19:09:13 +0200
Message-ID: <20250506170924.3513161-5-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250506170924.3513161-1-mingo@kernel.org>
References: <20250506170924.3513161-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These days the canonical counterpart to the x86_64 architecture
is the x86_32 architecture - except our Makefiles don't accept it
as an ARCH target.

Make it so.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
---
 Makefile                                              |  7 +++++--
 arch/x86/Kconfig                                      |  2 +-
 arch/x86/Makefile                                     | 10 +++++++---
 arch/x86/configs/{defconfig.i386 => defconfig.x86_32} |  0
 tools/scripts/Makefile.arch                           |  7 +++++--
 5 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index b29cc321ffd9..84a4912f3343 100644
--- a/Makefile
+++ b/Makefile
@@ -407,10 +407,13 @@ UTS_MACHINE 	:= $(ARCH)
 SRCARCH 	:= $(ARCH)
 
 # Additional ARCH settings for x86
-ifeq ($(ARCH),i386)
+ifeq ($(ARCH),x86_64)
         SRCARCH := x86
 endif
-ifeq ($(ARCH),x86_64)
+ifeq ($(ARCH),x86_32)
+        SRCARCH := x86
+endif
+ifeq ($(ARCH),i386)
         SRCARCH := x86
 endif
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 4b9f378e05f6..3282638072b9 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2,7 +2,7 @@
 # Select 32 or 64 bit
 config 64BIT
 	bool "64-bit kernel" if "$(ARCH)" = "x86"
-	default "$(ARCH)" != "i386"
+	default "$(ARCH)" != "i386" && "$(ARCH)" != "x86_32"
 	help
 	  Say yes to build a 64-bit kernel - formerly known as x86_64
 	  Say no to build a 32-bit kernel - formerly known as i386
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index bae2c7bbb8db..fb4f0f15d1df 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -1,15 +1,19 @@
 # SPDX-License-Identifier: GPL-2.0
-# Unified Makefile for i386 and x86_64
+# Unified Makefile for x86_64 and x86_32
 
-# select defconfig based on actual architecture
+# When in doubt, select defconfig based on host architecture:
 ifeq ($(ARCH),x86)
   ifeq ($(shell uname -m | sed -e 's/i.86/i386/'),i386)
-        KBUILD_DEFCONFIG := defconfig.i386
+        KBUILD_DEFCONFIG := defconfig.x86_32
   else
         KBUILD_DEFCONFIG := defconfig.x86_64
   endif
 else
+  ifeq ($(ARCH),i386)
+        KBUILD_DEFCONFIG := defconfig.x86_32
+  else
         KBUILD_DEFCONFIG := defconfig.$(ARCH)
+  endif
 endif
 
 ifdef CONFIG_CC_IS_GCC
diff --git a/arch/x86/configs/defconfig.i386 b/arch/x86/configs/defconfig.x86_32
similarity index 100%
rename from arch/x86/configs/defconfig.i386
rename to arch/x86/configs/defconfig.x86_32
diff --git a/tools/scripts/Makefile.arch b/tools/scripts/Makefile.arch
index eabfe9f411d9..9aedca27ac9a 100644
--- a/tools/scripts/Makefile.arch
+++ b/tools/scripts/Makefile.arch
@@ -14,10 +14,13 @@ endif
 SRCARCH := $(ARCH)
 
 # Additional ARCH settings for x86
-ifeq ($(ARCH),i386)
+ifeq ($(ARCH),x86_64)
         SRCARCH := x86
 endif
-ifeq ($(ARCH),x86_64)
+ifeq ($(ARCH),x86_32)
+        SRCARCH := x86
+endif
+ifeq ($(ARCH),i386)
         SRCARCH := x86
 endif
 
-- 
2.45.2

