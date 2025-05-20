Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45AF6210F5D
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747723790; cv=none; b=PK7fsOlZW8anaIZcSA4Hsj6c3Ln9PXT4S2nBr2ww0tTw2BuF6E18p0oxbP5T/Co2j/r0rD1Ot+LV8RLOqHzpw0RABGQAKVx1ksxkXfQHJznKWwhPMIm2CdDd27h1EWHAud57qYbQAi1rZDRKNArgQCPpRjw3LwII1bUxFD8cWz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747723790; c=relaxed/simple;
	bh=QRhChKgCx1c5REOWDfJJeI9cbJ1pcG2pyDF3snU2xlM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eRGNOFbOA3HHrrcU7lBAygmbKLdEBiYb24PCGl5zIcthHx6Rw2SRYUP3vB/3zky8XLYgokrFLkG2EeytC1JuPqMjXszoR9Gsrxt+aZgObHP2obolFumB2Yc7qeK+5GHySW8AGYoE50w45DQWLWELd5OCydjOKxfkZNqko4ga4Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxQK0CJixoNxPzAA--.48361S3;
	Tue, 20 May 2025 14:49:38 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBxn8UBJixorc_iAA--.56937S2;
	Tue, 20 May 2025 14:49:37 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] LoongArch: Do not include larchintrin.h
Date: Tue, 20 May 2025 14:49:36 +0800
Message-ID: <20250520064936.32291-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxn8UBJixorc_iAA--.56937S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxGrWkGw1DGrykXrWDCr1Utwc_yoW5tFWxpr
	43Zr98trWUXF1fCwn2vF15Xrn8t3yvgw12vFy3W3yxur47JryIvrs5Grs8XF15Xa95Xr1v
	gw1fZ34Fq3WDCabCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcDDGUUUUU

larchintrin.h is a system header of compiler, include it in the
kernel header may lead to the fatal error "'larchintrin.h' file
not found".

There are two related cases so far:

(1) When compiling samples/bpf, it has been fixed in the latest
kernel [1].

(2) When running bcc script, it has been fixed in the latest
bcc [2] [3], like this:

$ /usr/share/bcc/tools/filetop
In file included from <built-in>:4:
In file included from /virtual/include/bcc/helpers.h:54:
In file included from arch/loongarch/include/asm/page.h:7:
In file included from arch/loongarch/include/asm/addrspace.h:9:
arch/loongarch/include/asm/loongarch.h:11:10: fatal error: 'larchintrin.h' file not found
   11 | #include <larchintrin.h>
      |          ^~~~~~~~~~~~~~~
1 error generated.

Maybe there are same errors for the other unknown projects, it is
annoyance to add the include path each time. In order to avoid such
errors once and for all, do not include larchintrin.h, just use the
builtin functions directly.

[1] https://git.kernel.org/torvalds/c/548762f05d19
[2] https://github.com/iovisor/bcc/commit/8aa9f7072d53
[3] https://github.com/iovisor/bcc/commit/af8258c21004

Cc: stable@vger.kernel.org # 6.6+
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/include/asm/loongarch.h | 31 +++++++++++---------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index 52651aa0e583..b33e4c9cb903 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -9,14 +9,6 @@
 #include <linux/linkage.h>
 #include <linux/types.h>
 
-#ifndef __ASSEMBLY__
-#include <larchintrin.h>
-
-/* CPUCFG */
-#define read_cpucfg(reg) __cpucfg(reg)
-
-#endif /* !__ASSEMBLY__ */
-
 #ifdef __ASSEMBLY__
 
 /* LoongArch Registers */
@@ -173,19 +165,22 @@
 
 #ifndef __ASSEMBLY__
 
+/* CPUCFG */
+#define read_cpucfg(reg) __builtin_loongarch_cpucfg(reg)
+
 /* CSR */
-#define csr_read32(reg) __csrrd_w(reg)
-#define csr_read64(reg) __csrrd_d(reg)
-#define csr_write32(val, reg) __csrwr_w(val, reg)
-#define csr_write64(val, reg) __csrwr_d(val, reg)
-#define csr_xchg32(val, mask, reg) __csrxchg_w(val, mask, reg)
-#define csr_xchg64(val, mask, reg) __csrxchg_d(val, mask, reg)
+#define csr_read32(reg) __builtin_loongarch_csrrd_w(reg)
+#define csr_read64(reg) __builtin_loongarch_csrrd_d(reg)
+#define csr_write32(val, reg) __builtin_loongarch_csrwr_w(val, reg)
+#define csr_write64(val, reg) __builtin_loongarch_csrwr_d(val, reg)
+#define csr_xchg32(val, mask, reg) __builtin_loongarch_csrxchg_w(val, mask, reg)
+#define csr_xchg64(val, mask, reg) __builtin_loongarch_csrxchg_d(val, mask, reg)
 
 /* IOCSR */
-#define iocsr_read32(reg) __iocsrrd_w(reg)
-#define iocsr_read64(reg) __iocsrrd_d(reg)
-#define iocsr_write32(val, reg) __iocsrwr_w(val, reg)
-#define iocsr_write64(val, reg) __iocsrwr_d(val, reg)
+#define iocsr_read32(reg) __builtin_loongarch_iocsrrd_w(reg)
+#define iocsr_read64(reg) __builtin_loongarch_iocsrrd_d(reg)
+#define iocsr_write32(val, reg) __builtin_loongarch_iocsrwr_w(val, reg)
+#define iocsr_write64(val, reg) __builtin_loongarch_iocsrwr_d(val, reg)
 
 #endif /* !__ASSEMBLY__ */
 
-- 
2.42.0

