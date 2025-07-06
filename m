Received: from forwardcorp1a.mail.yandex.net (forwardcorp1a.mail.yandex.net [178.154.239.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69B41B3925
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 23:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751843352; cv=none; b=pmsSMnqsORFrws8gsT+QUQHO5C+eGEsJGCmAQwLJRT5KK3ZLtZ6gdREKMlVK4R9PqUF+fcO9826gTNes4G+mP8hLRmOc3k+oHNMcadYATU1+ZQwPh7gajacAiC3bHsk4EAgYLtSQuKzW0CUpFj+8uRm1JLk4b6So/ybr87wZpbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751843352; c=relaxed/simple;
	bh=oB2tgyIlqhlAAL7FhpYwuTEpvoVXsD8POM8pltt03Es=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TbJHEv4o09PeeOJLWwV4ULil8e8+2a5QT/iLYc8xYNm8LFfRWIHdbPHZxOA1q6aH/55i7ee49LxlJYLa8rHN2now9NUT9JSZ+ys52u5782mploHt6xxRFONMaeGi8bFlAofA85q5+PmbhlrpMyl6dcL5k3+f88wwkVXK5n3CCag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex-team.ru; spf=pass smtp.mailfrom=yandex-team.ru; dkim=pass (1024-bit key) header.d=yandex-team.ru header.i=@yandex-team.ru header.b=GUur+13C; arc=none smtp.client-ip=178.154.239.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex-team.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex-team.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex-team.ru header.i=@yandex-team.ru header.b="GUur+13C"
Received: from mail-nwsmtp-smtp-corp-main-69.vla.yp-c.yandex.net (mail-nwsmtp-smtp-corp-main-69.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:3a87:0:640:845c:0])
	by forwardcorp1a.mail.yandex.net (Yandex) with ESMTPS id 63FAE60ACD;
	Mon,  7 Jul 2025 02:07:05 +0300 (MSK)
Received: from d-tatianin-lin.yandex-team.ru (unknown [2a02:6bf:8080:41f::1:27])
	by mail-nwsmtp-smtp-corp-main-69.vla.yp-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id a6pCSa0GheA0-lla0LRIy;
	Mon, 07 Jul 2025 02:07:04 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; t=1751843224;
	bh=LrCpVuLAUvZWC17CNToIYvvgAeo7G8QEmG5JEtbD7Vo=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=GUur+13C7ypxM6BBbH+w9Jfcj8F7eHQf/dlIpIke3Ja1s2axFlaoHBeFKXCHDxtb6
	 H5sdOMPpL8Xdpb6G51BoVnP0XBhoAszIBoTG73/yJJWqTHfU3AhCWvtxioU99zxzyH
	 qU4ywkYWAgsaA94yqzGKAY++NdgoyW+6VWw1X/nY=
Authentication-Results: mail-nwsmtp-smtp-corp-main-69.vla.yp-c.yandex.net; dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Daniil Tatianin <d-tatianin@yandex-team.ru>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Thomas Huth <thuth@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arch/x86/ptrace: remove misleading comments about pt_regs
Date: Mon,  7 Jul 2025 02:06:28 +0300
Message-Id: <20250706230628.240966-1-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This comment hasn't been true for at least 10 years, ever since commit
ff467594f2a4 ("x86/asm/entry/64: Save all regs on interrupt entry").

Remove to prevent reader confusion.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
---
 arch/x86/include/asm/ptrace.h          | 8 ++------
 arch/x86/include/uapi/asm/ptrace-abi.h | 7 ++-----
 arch/x86/include/uapi/asm/ptrace.h     | 7 ++-----
 3 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/arch/x86/include/asm/ptrace.h b/arch/x86/include/asm/ptrace.h
index 50f75467f73d..dcc6f8beae2c 100644
--- a/arch/x86/include/asm/ptrace.h
+++ b/arch/x86/include/asm/ptrace.h
@@ -101,11 +101,7 @@ struct fred_ss {
 };
 
 struct pt_regs {
-	/*
-	 * C ABI says these regs are callee-preserved. They aren't saved on
-	 * kernel entry unless syscall needs a complete, fully filled
-	 * "struct pt_regs".
-	 */
+	/* C ABI says these regs are callee-preserved. */
 	unsigned long r15;
 	unsigned long r14;
 	unsigned long r13;
@@ -113,7 +109,7 @@ struct pt_regs {
 	unsigned long bp;
 	unsigned long bx;
 
-	/* These regs are callee-clobbered. Always saved on kernel entry. */
+	/* These regs are callee-clobbered. */
 	unsigned long r11;
 	unsigned long r10;
 	unsigned long r9;
diff --git a/arch/x86/include/uapi/asm/ptrace-abi.h b/arch/x86/include/uapi/asm/ptrace-abi.h
index 5823584dea13..b06535b1226b 100644
--- a/arch/x86/include/uapi/asm/ptrace-abi.h
+++ b/arch/x86/include/uapi/asm/ptrace-abi.h
@@ -26,17 +26,14 @@
 #else /* __i386__ */
 
 #if defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)
-/*
- * C ABI says these regs are callee-preserved. They aren't saved on kernel entry
- * unless syscall needs a complete, fully filled "struct pt_regs".
- */
+/* C ABI says these regs are callee-preserved. */
 #define R15 0
 #define R14 8
 #define R13 16
 #define R12 24
 #define RBP 32
 #define RBX 40
-/* These regs are callee-clobbered. Always saved on kernel entry. */
+/* These regs are callee-clobbered. */
 #define R11 48
 #define R10 56
 #define R9 64
diff --git a/arch/x86/include/uapi/asm/ptrace.h b/arch/x86/include/uapi/asm/ptrace.h
index e0b5b4f6226b..c48e56bc6fa0 100644
--- a/arch/x86/include/uapi/asm/ptrace.h
+++ b/arch/x86/include/uapi/asm/ptrace.h
@@ -42,17 +42,14 @@ struct pt_regs {
 #ifndef __KERNEL__
 
 struct pt_regs {
-/*
- * C ABI says these regs are callee-preserved. They aren't saved on kernel entry
- * unless syscall needs a complete, fully filled "struct pt_regs".
- */
+/* C ABI says these regs are callee-preserved. */
 	unsigned long r15;
 	unsigned long r14;
 	unsigned long r13;
 	unsigned long r12;
 	unsigned long rbp;
 	unsigned long rbx;
-/* These regs are callee-clobbered. Always saved on kernel entry. */
+/* These regs are callee-clobbered. */
 	unsigned long r11;
 	unsigned long r10;
 	unsigned long r9;
-- 
2.34.1

