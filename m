Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868AAEC5
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745260288; cv=none; b=EpD80EJAkAVul1/nMSuOMMG7J63IToMf/su6TJ0GH5Q6AGUHI9mgVUjBKB80SkA5dhFhB2BtuzyF3RJqY9FqpwFk8WmZz9CXRYprqc/YgH42OBJExlH2w2K2sq6E5hVrUha7vTZ4zRE9Jmq/z/35ruI8UL/UuaSKMgzFq5u9gC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745260288; c=relaxed/simple;
	bh=QUTJY9K021nJBAG3GUS36kBFqXDDfpfbHRxe5Z5M2yc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m5T45wVqP5gOAr6mNhzl+g0df5aultasDxpAlSu3GA+CcibMa3pKvOhyCuKeff6pOpEQs0aRT7JWU4sKd3djp8wexyoTmJRCXktNVAjFMZ8R81ZFPB1O46w/vMBbQb/7OkaLluvE6i2Cf1IprJS+YGroSAquLr1wWnDdYZujPOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hYRQdE86; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hYRQdE86"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745260278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E3ybrypQERCxYfRiNAJIXspuGT3P1YIpk3kQKCZFkuA=;
	b=hYRQdE86HeqsEcoqI/4cwdCjv74pqBqzj6DJxsGYhb0mgqznsY5AKDDsaUhJAp067OyRZv
	sbcx6QCusIv/+iPbVsrUOJbqh8a3xIPxI1SSuQwXvBRI+saVR5Atg0LBUVzAJMbt0p6az8
	S3yqyPaPxqK9LurcsMU357yPgKMYMXU=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-hardening@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: Replace strcpy() with strscpy() in proc_ppc64_init()
Date: Mon, 21 Apr 2025 20:31:08 +0200
Message-ID: <20250421183110.436265-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strcpy() is deprecated; use strscpy() instead.

Don't cast the destination buffer from 'u8[]' to 'char *' to satisfy the
__must_be_array() requirement of strscpy().

No functional changes intended.

Link: https://github.com/KSPP/linux/issues/88
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/powerpc/kernel/proc_powerpc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/proc_powerpc.c b/arch/powerpc/kernel/proc_powerpc.c
index 3816a2bf2b84..d083b4517065 100644
--- a/arch/powerpc/kernel/proc_powerpc.c
+++ b/arch/powerpc/kernel/proc_powerpc.c
@@ -9,6 +9,7 @@
 #include <linux/proc_fs.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
+#include <linux/string.h>
 
 #include <asm/machdep.h>
 #include <asm/vdso_datapage.h>
@@ -56,7 +57,7 @@ static int __init proc_ppc64_init(void)
 {
 	struct proc_dir_entry *pde;
 
-	strcpy((char *)systemcfg->eye_catcher, "SYSTEMCFG:PPC64");
+	strscpy(systemcfg->eye_catcher, "SYSTEMCFG:PPC64");
 	systemcfg->version.major = SYSTEMCFG_MAJOR;
 	systemcfg->version.minor = SYSTEMCFG_MINOR;
 	systemcfg->processor = mfspr(SPRN_PVR);
-- 
2.49.0

