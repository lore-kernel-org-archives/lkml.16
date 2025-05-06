Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5282A286883
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746551379; cv=none; b=g71/dhfQ1eCLyi73k0XYgYfYbJq7VlHaa+f1fdEJloQ4iV9ZXZNEEbXpYXfPJEpnA8G+yTJAMuekEFVLjNi++wJtW5RDJble1JBDUT6FduaUk4Lh5ApIiNUOavM4q7sWbavdwPu8WUwDhMxLHk4kJhPvLyk3gipgOg9WQMzmYHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746551379; c=relaxed/simple;
	bh=m1ua2gv6ZUlge2dnQ93gbROLZjd8XU7U5kTj2XLvWwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nbhGnGLXpdkZkszfeUSwblikqjj1xIP3bSM1HSd6hZ9maEdrmuCZHr4uMRh2pKCfewLbHL1QqrwlopjnTn3abeNX/d9Of7xKXj6dFuE4Y2jT73CzbayKWcIKeGo1JxctIYN/r69difQRlSkMcrZagxTevHpwR7B8SbE17DrNdtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQHgu+p5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQHgu+p5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B17C4CEE4;
	Tue,  6 May 2025 17:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746551378;
	bh=m1ua2gv6ZUlge2dnQ93gbROLZjd8XU7U5kTj2XLvWwk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MQHgu+p5PED9cj85Ma+nsVJZ/Up0A3uFJjLDZSZiDLy4EE5D7QZ5YklxpNGVqGhYE
	 xVLUDbRkHIbupMq9mMh+PEC+g88bSpYnkeK4vsNSqPCFV+OTdvhWWT4XCbcDMlkjJJ
	 SeY7ejP0F3X3cKf4K3GgfXWMlQkrr3F/MfoVvQdZiXzfCBj2fC4n0c2ANiSsp9ZaVR
	 u9YcdrdlQ8TzGsRnk7zziNudRLVlOSIEiM4gxhNaWV9BisWWbqID2RKEo1D7zr0yvv
	 t29OsNkYD6QgizYvLApsiCxu6JTolj46JS/xIS0NoPbjaU+VkOwp/7OtpZXguTg1L4
	 bZWfIEtDTKqfw==
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
Subject: [PATCH 03/15] x86/kconfig: Rename x86_64_defconfig to defconfig.x86_64 and i386_defconfig to defconfig.i386
Date: Tue,  6 May 2025 19:09:12 +0200
Message-ID: <20250506170924.3513161-4-mingo@kernel.org>
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

