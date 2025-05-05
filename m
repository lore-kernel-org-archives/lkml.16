Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F352D202C2A
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746443401; cv=none; b=KLpNbCj/D+bgerTVm51x0ThluuFchAmdoO9a6uIJiQiqXro6D01pBYCan2NYZ5303t6f2Wim/q3XX15v2SlZqnOAxwlwbfKFWej7u+XAHVBguiKqliPDn607tVLBCwot+BdzuBXnN8dsUDWSF+a955JA8rIVGzGAOjbjYxs09jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746443401; c=relaxed/simple;
	bh=m1ua2gv6ZUlge2dnQ93gbROLZjd8XU7U5kTj2XLvWwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MiRPi5QpMo4aFlX7MeGYskFWSQkW9ZKuuyE7Kxw4/LMK+WFD92Yonv/w1aX4HT3ahhHMBRdCA9GbWQdPQpuush9ZQgAYsJ0G1CHj2QjAS4eP7eg8NSSiej1wfhUeglGhE8I7UFr6fz5ULAdgt4o9M+al3xz+6/S0Zf0lo4nvWhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X7aPAPxh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7aPAPxh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16E9C4CEEF;
	Mon,  5 May 2025 11:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746443400;
	bh=m1ua2gv6ZUlge2dnQ93gbROLZjd8XU7U5kTj2XLvWwk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X7aPAPxhRKErbI+obFnDegtqEgSR5P86sVx1hBUrAustEvn8Ywex4ExXtgaQvjO7K
	 7yUWa+iGoqYR7h+VLFGZuyfhYcq8bvz5UKsS3TeN3N9IKlMAfEOBrqaEd+coEDeuvh
	 ma0CL5hnASb25cIVrUHrtOqCrz+VWz6Y5zu1761x7CvVo+KuwrMXHfDoy/ydbOCLhk
	 eCgwMDvSynS4vGZRvo0sufVqOqHkUhu1ZovKIRA/AhYcCbE9v5d5+QxbW2BUjqNiBJ
	 8wTVu/qrEr+EoTKj12unIP1L2albNCbDhm7vuVrHMW/kcQ88rBKoS4lNL+LRvzGPT6
	 RdEV6ykpFQjXw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 03/15] x86/kconfig: Rename x86_64_defconfig to defconfig.x86_64 and i386_defconfig to defconfig.i386
Date: Mon,  5 May 2025 13:09:34 +0200
Message-ID: <20250505110946.1095363-4-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250505110946.1095363-1-mingo@kernel.org>
References: <20250505110946.1095363-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Editing the defconfigs with shell filename completion is unnecessarily
hard due to bad naming: if one remembers 'arch/x86/config/defconfig',
it won't lead to the right files, because the defconfigs are
prefixed with $(ARCH)_.

Under the principle of 'higher order names should go first', prefix
them with 'defconfig' and postfix them with .$(ARCH), and thus make
all x86 configs match the arch/x86/config/defconfig.* pattern.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
---
 Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst | 2 +-
 arch/x86/Makefile                                                | 6 +++---
 arch/x86/configs/{i386_defconfig => defconfig.i386}              | 0
 arch/x86/configs/{x86_64_defconfig => defconfig.x86_64}          | 0
 drivers/gpu/drm/ci/build.yml                                     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
index 03c55151346c..bcd2bdf6c076 100644
--- a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
+++ b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
@@ -426,7 +426,7 @@ machine; if you want to compile the kernel on another system, check
   Look out for a line starting with '# using defaults found in'. It should be
   followed by a path to a file in '/boot/' that contains the release identifier
   of your currently working kernel. If the line instead continues with something
-  like 'arch/x86/configs/x86_64_defconfig', then the build infra failed to find
+  like 'arch/x86/configs/defconfig.x86_64', then the build infra failed to find
   the .config file for your running kernel -- in which case you have to put one
   there manually, as explained in the reference section.
 
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 594723005d95..bae2c7bbb8db 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -4,12 +4,12 @@
 # select defconfig based on actual architecture
 ifeq ($(ARCH),x86)
   ifeq ($(shell uname -m | sed -e 's/i.86/i386/'),i386)
-        KBUILD_DEFCONFIG := i386_defconfig
+        KBUILD_DEFCONFIG := defconfig.i386
   else
-        KBUILD_DEFCONFIG := x86_64_defconfig
+        KBUILD_DEFCONFIG := defconfig.x86_64
   endif
 else
-        KBUILD_DEFCONFIG := $(ARCH)_defconfig
+        KBUILD_DEFCONFIG := defconfig.$(ARCH)
 endif
 
 ifdef CONFIG_CC_IS_GCC
diff --git a/arch/x86/configs/i386_defconfig b/arch/x86/configs/defconfig.i386
similarity index 100%
rename from arch/x86/configs/i386_defconfig
rename to arch/x86/configs/defconfig.i386
diff --git a/arch/x86/configs/x86_64_defconfig b/arch/x86/configs/defconfig.x86_64
similarity index 100%
rename from arch/x86/configs/x86_64_defconfig
rename to arch/x86/configs/defconfig.x86_64
diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml
index 274f118533a7..2e0ce38d73cd 100644
--- a/drivers/gpu/drm/ci/build.yml
+++ b/drivers/gpu/drm/ci/build.yml
@@ -35,7 +35,7 @@
     - .build
     - .use-debian/x86_64_build
   variables:
-    DEFCONFIG: "arch/x86/configs/x86_64_defconfig"
+    DEFCONFIG: "arch/x86/configs/defconfig.x86_64"
     KERNEL_IMAGE_NAME: "bzImage"
     KERNEL_ARCH: "x86_64"
 
-- 
2.45.2

