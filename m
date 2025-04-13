Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547A7194A67
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 08:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744533721; cv=none; b=oSVbwxjg/DFd4tUy+WjuLIDoWlPMRswBIpV7k/1a///m2kTNGBafRoFMspRdNBWRuugQCgj19r76SFWeJ82EcW/ZOj56+32Lse4PswGAe1DgYYb1lIxy2fjj3/wBig0q0JhP7VU9ti0nUWPZjVXWBKSXU6xqrCLbivJ0lj1O1s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744533721; c=relaxed/simple;
	bh=iTGGyPYCxV6KsMg5n7PXTQ2VJ806bjR0JYp2KNLPRXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q19QfiOErdNA4PbibBb0ZtXzkoWtEQysyq665FOFwmxJnikEJWGnq/JvJZieNpq4p/7bJPvUo6PrH9mASVB4BD3OXORFP/zP2vBreqRJool9bk3kixn66YhOloLPW0V5ygZ+kXvy0grGXtlSHcQx6MOFrknooVuDnJ4YY/1aTes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/Dd+HDt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/Dd+HDt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D37AC4CEDD;
	Sun, 13 Apr 2025 08:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744533720;
	bh=iTGGyPYCxV6KsMg5n7PXTQ2VJ806bjR0JYp2KNLPRXA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e/Dd+HDtOo6scDMDiYFaEAyOkzHm6GdigKnRfRY4CRrF0wApe/yWcpnreGpi7h3wb
	 IsDTRgCMRICZzCHDgn/sTGu4Xp2FFCKb2IBwHIbqTIG+Svt2SicewMi/7LPUqZeZ1V
	 X4offItUDvV8Ztlvk7eLSvKUbw1DoCPw8pPxqv1li6TObs5CD4OB0lDdssA5T5Uvze
	 vPOZsNCfXDFjAIlrmpOnZ/VLjVbGYbcxJwUm8rqcwiA0AAJt6ntdlCxyrD/szWbgSE
	 NMsywHIQiona8KJ3BWrcLypbN1vKEqXrUErNF7yffXFTeNuYmI+Bec+cwLYMiucwJV
	 SdmkhMCAJ01/w==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Mario Limonciello <superm1@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>
Subject: [PATCH 4/6] x86/platform/amd: Move the <asm/amd_hsmp.h> header to <asm/amd/hsmp.h>
Date: Sun, 13 Apr 2025 10:41:42 +0200
Message-ID: <20250413084144.3746608-5-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250413084144.3746608-1-mingo@kernel.org>
References: <20250413084144.3746608-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Collect AMD specific platform header files in <asm/amd/*.h>.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Mario Limonciello <superm1@kernel.org>
Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Cc: Carlos Bilbao <carlos.bilbao@kernel.org>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst | 2 +-
 MAINTAINERS                                        | 4 ++--
 arch/x86/include/asm/{amd_hsmp.h => amd/hsmp.h}    | 2 +-
 drivers/platform/x86/amd/hsmp/acpi.c               | 2 +-
 drivers/platform/x86/amd/hsmp/hsmp.c               | 2 +-
 drivers/platform/x86/amd/hsmp/plat.c               | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 7a1409ecc238..1142234335ab 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -395,7 +395,7 @@ Code  Seq#    Include File                                           Comments
                                                                      <mailto:thomas@winischhofer.net>
 0xF6  all                                                            LTTng Linux Trace Toolkit Next Generation
                                                                      <mailto:mathieu.desnoyers@efficios.com>
-0xF8  all    arch/x86/include/uapi/asm/amd_hsmp.h                    AMD HSMP EPYC system management interface driver
+0xF8  all    arch/x86/include/uapi/asm/amd/hsmp.h                    AMD HSMP EPYC system management interface driver
                                                                      <mailto:nchatrad@amd.com>
 0xFD  all    linux/dm-ioctl.h
 0xFE  all    linux/isst_if.h
diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..ce2942d0fef4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1097,8 +1097,8 @@ R:	Carlos Bilbao <carlos.bilbao@kernel.org>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/arch/x86/amd_hsmp.rst
-F:	arch/x86/include/asm/amd_hsmp.h
-F:	arch/x86/include/uapi/asm/amd_hsmp.h
+F:	arch/x86/include/asm/amd/hsmp.h
+F:	arch/x86/include/uapi/asm/amd/hsmp.h
 F:	drivers/platform/x86/amd/hsmp/
 
 AMD IOMMU (AMD-VI)
diff --git a/arch/x86/include/asm/amd_hsmp.h b/arch/x86/include/asm/amd/hsmp.h
similarity index 91%
rename from arch/x86/include/asm/amd_hsmp.h
rename to arch/x86/include/asm/amd/hsmp.h
index 03c2ce3edaf5..f3253d27bf49 100644
--- a/arch/x86/include/asm/amd_hsmp.h
+++ b/arch/x86/include/asm/amd/hsmp.h
@@ -3,7 +3,7 @@
 #ifndef _ASM_X86_AMD_HSMP_H_
 #define _ASM_X86_AMD_HSMP_H_
 
-#include <uapi/asm/amd_hsmp.h>
+#include <uapi/asm/amd/hsmp.h>
 
 #if IS_ENABLED(CONFIG_AMD_HSMP)
 int hsmp_send_message(struct hsmp_message *msg);
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index c1eccb3c80c5..3c7acb90c3ab 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -9,7 +9,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <asm/amd_hsmp.h>
+#include <asm/amd/hsmp.h>
 
 #include <linux/acpi.h>
 #include <linux/device.h>
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index a3ac09a90de4..e262e8a97b45 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -7,7 +7,7 @@
  * This file provides a device implementation for HSMP interface
  */
 
-#include <asm/amd_hsmp.h>
+#include <asm/amd/hsmp.h>
 
 #include <linux/acpi.h>
 #include <linux/delay.h>
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index b9782a078dbd..0eb73fcb9806 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -9,7 +9,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <asm/amd_hsmp.h>
+#include <asm/amd/hsmp.h>
 
 #include <linux/build_bug.h>
 #include <linux/device.h>
-- 
2.45.2

