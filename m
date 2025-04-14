Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9EA288CAE;
	Mon, 14 Apr 2025 19:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658779; cv=none; b=qjUg4EGbtJFfRimNeE0FYaCeakZ/BIikJvHurTd3TFjkxwJaxRne7QmsaVVz5ddfWWHgAV4GJF/9MlPva2bQPG/qNlE5T/VGIYNxYxGjQV5TEeb2gJEbYtGSD3O5wZ3+RTcsud/hKgrjkj025yQWA2HY3lWBzEWIgLh7YhmoO9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658779; c=relaxed/simple;
	bh=m+FYuLQYjsOp9BVJc2AAtfCcjaHG4eztv7W9Xydmt4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Q0h1OdkqsaMTLLbjbzIErcqQpMeRYAJyPxC9H1WAyw7uzWsttlDQ0E28VK3+wrUNy3V/erXdZjzYz+HTIL8K7HLQIUXxwyqnz1SaYCb6jaJcur6oDviSLa6Nu6SgH8JvvB+Le2GSEj5Ud7YDh6P11O8Ng/SbhOWEP743aLP6GM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dt3nRBEV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dt3nRBEV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D232FC4CEE2;
	Mon, 14 Apr 2025 19:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744658779;
	bh=m+FYuLQYjsOp9BVJc2AAtfCcjaHG4eztv7W9Xydmt4c=;
	h=From:Date:Subject:To:Cc:From;
	b=dt3nRBEV2n3jn7OTytmIQSvVFkBHR7uCzv107g6s0C8V70eP4IMw7VMAR1MoDk5Ux
	 Oj78CX8pyGHBq8yQ0UgaBriJyny89GAZmx/V/YDrqTUK/2A1jCDWaUR4vNQu95b8fq
	 piplnstzyDjMdXncmxiELwKNHK2sQ67XUO2uvB9QekMmzj0Cp/YC839EFj6dB7MUvc
	 POAkJK7+w5WFeVwQkEncTzpU8kq5b8MEBGz/bvYppH47K5lAcx6b0/FSpVe2GypnbP
	 NWcy+HBnWFaJsvCO+i26VVJgMp/ld2Ijh2oxBOzzdJ8hk6iUx/EQk3zOj3OOYGlhej
	 a3bq9kFQaU2SQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 14 Apr 2025 12:26:07 -0700
Subject: [PATCH] x86/boot/startup: Disable LTO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-x86-boot-startup-lto-error-v1-1-7c8bed7c131c@kernel.org>
X-B4-Tracking: v=1; b=H4sIAE5h/WcC/x3MQQ5FMBAA0KvIrE1SRcm/ilgUg0l+jExLJOLuG
 su3eTcEUqYAv+wGpZMDy5ZQ5BmMq98WQp6SwRpbm6qo8GodDiIRQ/Qajx3/UZBURdE6Mq2tG+N
 8CSnYlWa+vrzrn+cF2UBLsmwAAAA=
X-Change-ID: 20250414-x86-boot-startup-lto-error-26e0825706a3
To: Ingo Molnar <mingo@redhat.com>, Ard Biesheuvel <ardb@kernel.org>, 
 x86@kernel.org
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Linux Kernel Functional Testing <lkft@linaro.org>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2004; i=nathan@kernel.org;
 h=from:subject:message-id; bh=m+FYuLQYjsOp9BVJc2AAtfCcjaHG4eztv7W9Xydmt4c=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOl/EyMvx7tNCDvSmbeyPMcxvH/VhyPCntLvNtm0MofPO
 77t5o+jHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiFk6MDD0T7I8WJn6e+kdl
 3bzq3wU1zd2FX1d9jHkmsnL/8vwPb+cxMmxOeqwp3ifb88Xf7virLYlPVDzL2WIYO3RvXu5L/9Z
 VzAAA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

When building with CONFIG_LTO_CLANG, there is an error in the x86 boot
startup code because it builds with a different code model than the rest
of the kernel:

  ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 2' from vmlinux.a(head64.o at 1302448), and 'i32 1' from vmlinux.a(map_kernel.o at 1314208)
  ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 2' from vmlinux.a(common.o at 1306108), and 'i32 1' from vmlinux.a(gdt_idt.o at 1314148)

As this directory is for code that only runs during early system
initialization, LTO is not very important, so filter out the LTO flags
from KBUILD_CFLAGS for arch/x86/boot/startup to resolve the build error.

Fixes: 4cecebf200ef ("x86/boot: Move the early GDT/IDT setup code into startup/")
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Closes: https://lore.kernel.org/CA+G9fYvnun+bhYgtt425LWxzOmj+8Jf3ruKeYxQSx-F6U7aisg@mail.gmail.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/x86/boot/startup/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/boot/startup/Makefile b/arch/x86/boot/startup/Makefile
index ccdfc42a4d59..bb7c826e586c 100644
--- a/arch/x86/boot/startup/Makefile
+++ b/arch/x86/boot/startup/Makefile
@@ -7,8 +7,9 @@ KBUILD_CFLAGS		+= -D__DISABLE_EXPORTS -mcmodel=small -fPIC \
 			   -fno-stack-protector -D__NO_FORTIFY \
 			   -include $(srctree)/include/linux/hidden.h
 
-# disable ftrace hooks
+# disable ftrace hooks and LTO
 KBUILD_CFLAGS	:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS))
+KBUILD_CFLAGS	:= $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS))
 KASAN_SANITIZE	:= n
 KCSAN_SANITIZE	:= n
 KMSAN_SANITIZE	:= n

---
base-commit: 9287216a0c8f7bf7b485e18ad71584b434b59bb6
change-id: 20250414-x86-boot-startup-lto-error-26e0825706a3

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

