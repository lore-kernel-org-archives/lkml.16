Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075D718E362
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 14:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745245651; cv=none; b=XS7ilp5ScZ7DxjF9XW6hBn+IyacPH9VqsNndI0Y1ONelwCphqxegStEjjXb5PM9fk0REMBrFlZWvr+WIOdfiIwLqzqD3BP71lSqQHO4t7Ch5BANjZV3DW0Jg51shgUhQ+rVsWH6lRyPZecgSXqFCl0E/DugiD4sVhwAfSKHS7ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745245651; c=relaxed/simple;
	bh=bkfvxlflX4M9GtG+8EbDbpAdx6dfIhOdaSWgrzBRUPg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OxWO34Cuj4xLATIpHmUNfKTva1hsLnzlOA1UlDWuzXeJoZ5vWkU6W8u0Z8h33TY0ZcrL/ofyiX/Y8SZMfgKDUsm6MUReIrKHBtByubR3Ll2+6GOmbOMd4fX3UbomPkONTvWeJi2lJq9mvfPziBPcIlMEy796iSK/Vz96gCnEuPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=PawZ2fOf; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="PawZ2fOf"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c266c1389so2945958f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745245647; x=1745850447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zM2xTA3Ijm3UBkqygOS2aJTpcgU5eK9eWAc69Lekkw4=;
        b=PawZ2fOfrLROIIGEAWj7+IGPUChanXZ9vb2oQabSmHK0OxNN5AIwCWLWitZKKA/4ab
         UeTNR5haNCOW7JNVJ+SNuekvveZEpljd8AN/QTuhB0GDorPtyjEYljY9XhK+bCE1OhkF
         wN4pB5UyRCp34ovSplxTyJc+LEGRRq2hqNKJ0fej9b6GPUVGLXkQxaUu/P1eKmfrbmMF
         OnbwxUKdDRfxJsAL9gpAuON8PaJNKAc2yj5TVR+Wv6UFL/g+5Ggqz3ALgYOmnAU9jaXP
         clt8PPi+97AueU1inZ1NCZZrU80UsyiZv4UFyuIPBo9x0f6OJUr0QlslCwVksZ77M1wR
         B9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745245647; x=1745850447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zM2xTA3Ijm3UBkqygOS2aJTpcgU5eK9eWAc69Lekkw4=;
        b=xLGS178NfqBnN7q2ypM+q9ieDk4/evM0QkeTr6eu6t5ML0nXWNurSUiIqEp86FN2KV
         /++xToOHO6YOerQG68eCoGVGz1UZlLIgobxDoigpkncf6l8+dG1hnb4w0y6zo4ZImcsZ
         Bl2/0FWhIS97U/jtc3xUP8zErhxP7OZssFuwqV16zPG7OiivNLS2x+Hq+ddpVo/sjrUQ
         mMy2/kmi2GDPply4drEgMkBOcNDcGwp9G8oXEHinLwiiulueElTLEqAD5SnBeZaqAAuE
         P70ltCvL9yF2yctJ+qJdRjdbzBLzMzxuPuetRkGd5hJsC5731rT1eTWlZWSK1D3kIGY4
         YJ/g==
X-Forwarded-Encrypted: i=1; AJvYcCWxzSZ3L8g8cf92S54bSEF8XfM8TafcuTc7dwrsvew2VtI3M9e+TKWo7HhxDwMFurORl4zvJv+eeJSwEak=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl+cBoRmlMzDvwiUDfcF8QyhuviuW1xIFEPXcdwldLVKWm0U4Y
	tWGDhIC2ZBXEtNK3T3N2EuImLsjV6dqjUqalHSOZsRPaSKVQe/fgFu51vn4bmWM=
X-Gm-Gg: ASbGncsS6co+PVAp2Tg3Ia8PwUZS2QND2HKtxAo78t+4P9MBvWrGgZmnIOYaREMZdzG
	GxkuzjzVADgqmb6FonEtEiijW0CXzcsyE1E3V7QEbdoMdleYy2Iqg5BOK3LeehJniD1F1UTxnag
	ue7pwO0eYfYTuHkR10cf4pmacuiywWJQx1pdmhgWWNyuU4urySDaFmzr5XwP/83yuLAxeiszBb/
	Vl1kM+3cj2S2NZo+He7LrGndrW3fx1zKYz+0urSrsomdJ2sHrKcakLrSRcGA1ljPBcfj+YJdbdF
	j2csivEiDihUNQOc7GkdrafEYOgp6KW86Erg9h0Bk8Sso016vnagIEOpmB8=
X-Google-Smtp-Source: AGHT+IFtp6uDvT40Wf+eeybtMtOJKhVDujKLqASqoA/CInEEp1l3aj2FR72x/bhE1vGyIsJOBUURFA==
X-Received: by 2002:a05:6000:706:b0:39c:1257:dbab with SMTP id ffacd0b85a97d-39efbaf26f0mr7662645f8f.59.1745245647104;
        Mon, 21 Apr 2025 07:27:27 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3382:ef90:cd58:9e76:e88c:5cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa5a2300sm11840020f8f.101.2025.04.21.07.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 07:27:26 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v3 2/4] riscv: Add support for Zicbop
Date: Mon, 21 Apr 2025 16:24:39 +0200
Message-Id: <20250421142441.395849-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250421142441.395849-1-alexghiti@rivosinc.com>
References: <20250421142441.395849-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Zicbop introduces cache blocks prefetching instructions, add the
necessary support for the kernel to use it in the coming commits.

Co-developed-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/Kconfig                  | 15 +++++++++++++++
 arch/riscv/include/asm/barrier.h    |  5 -----
 arch/riscv/include/asm/cacheflush.h |  1 +
 arch/riscv/include/asm/hwcap.h      |  1 +
 arch/riscv/include/asm/insn-def.h   |  6 ++++++
 arch/riscv/include/asm/processor.h  |  1 -
 arch/riscv/kernel/cpufeature.c      | 21 +++++++++++++++++++++
 arch/riscv/mm/cacheflush.c          | 14 +++++++++++---
 8 files changed, 55 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bbec87b79309..28765ce563de 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -842,6 +842,21 @@ config RISCV_ISA_ZICBOZ
 
 	   If you don't know what to do here, say Y.
 
+config RISCV_ISA_ZICBOP
+	bool "Zicbop extension support for cache block prefetch"
+	depends on MMU
+	depends on RISCV_ALTERNATIVE
+	default y
+	help
+	  Adds support to dynamically detect the presence of the ZICBOP
+	  extension (Cache Block Prefetch Operations) and enable its
+	  usage.
+
+	  The Zicbop extension can be used to prefetch cache blocks for
+	  read/write fetch.
+
+	  If you don't know what to do here, say Y.
+
 config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
 	def_bool y
 	# https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=aed44286efa8ae8717a77d94b51ac3614e2ca6dc
diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index e1d9bf1deca6..b8c5726d86ac 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -14,11 +14,6 @@
 #include <asm/cmpxchg.h>
 #include <asm/fence.h>
 
-#define nop()		__asm__ __volatile__ ("nop")
-#define __nops(n)	".rept	" #n "\nnop\n.endr\n"
-#define nops(n)		__asm__ __volatile__ (__nops(n))
-
-
 /* These barriers need to enforce ordering on both devices or memory. */
 #define __mb()		RISCV_FENCE(iorw, iorw)
 #define __rmb()		RISCV_FENCE(ir, ir)
diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 8de73f91bfa3..effa02c2e682 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -80,6 +80,7 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
 
 extern unsigned int riscv_cbom_block_size;
 extern unsigned int riscv_cboz_block_size;
+extern unsigned int riscv_cbop_block_size;
 void riscv_init_cbo_blocksizes(void);
 
 #ifdef CONFIG_RISCV_DMA_NONCOHERENT
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e3cbf203cdde..affd63e11b0a 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -105,6 +105,7 @@
 #define RISCV_ISA_EXT_ZVFBFWMA		96
 #define RISCV_ISA_EXT_ZAAMO		97
 #define RISCV_ISA_EXT_ZALRSC		98
+#define RISCV_ISA_EXT_ZICBOP		99
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index 02c92c1657d2..d5adbaec1d01 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -263,4 +263,10 @@
 
 #define RISCV_INSN_NOP4	_AC(0x00000013, U)
 
+#ifndef __ASSEMBLY__
+#define nop()           __asm__ __volatile__ ("nop")
+#define __nops(n)       ".rept  " #n "\nnop\n.endr\n"
+#define nops(n)         __asm__ __volatile__ (__nops(n))
+#endif
+
 #endif /* __ASM_INSN_DEF_H */
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 5f56eb9d114a..09d4c963399a 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -52,7 +52,6 @@
 #endif
 
 #ifndef __ASSEMBLY__
-#include <linux/cpumask.h>
 
 struct task_struct;
 struct pt_regs;
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 2054f6c4b0ae..743d53415572 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -32,6 +32,7 @@
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
 static bool any_cpu_has_zicboz;
+static bool any_cpu_has_zicbop;
 static bool any_cpu_has_zicbom;
 
 unsigned long elf_hwcap __read_mostly;
@@ -119,6 +120,21 @@ static int riscv_ext_zicboz_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_ext_zicbop_validate(const struct riscv_isa_ext_data *data,
+				     const unsigned long *isa_bitmap)
+{
+	if (!riscv_cbop_block_size) {
+		pr_err("Zicbop detected in ISA string, disabling as no cbop-block-size found\n");
+		return -EINVAL;
+	}
+	if (!is_power_of_2(riscv_cbop_block_size)) {
+		pr_err("Zicbop disabled as cbop-block-size present, but is not a power-of-2\n");
+		return -EINVAL;
+	}
+	any_cpu_has_zicbop = true;
+	return 0;
+}
+
 static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
 				const unsigned long *isa_bitmap)
 {
@@ -442,6 +458,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_v, riscv_v_exts, riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
@@ -1112,6 +1129,10 @@ void __init riscv_user_isa_enable(void)
 		current->thread.envcfg |= ENVCFG_CBCFE;
 	else if (any_cpu_has_zicbom)
 		pr_warn("Zicbom disabled as it is unavailable on some harts\n");
+
+	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOP) &&
+	    any_cpu_has_zicbop)
+		pr_warn("Zicbop disabled as it is unavailable on some harts\n");
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index b81672729887..6265052ef8b6 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -101,6 +101,9 @@ EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
 unsigned int riscv_cboz_block_size;
 EXPORT_SYMBOL_GPL(riscv_cboz_block_size);
 
+unsigned int riscv_cbop_block_size;
+EXPORT_SYMBOL_GPL(riscv_cbop_block_size);
+
 static void __init cbo_get_block_size(struct device_node *node,
 				      const char *name, u32 *block_size,
 				      unsigned long *first_hartid)
@@ -125,8 +128,8 @@ static void __init cbo_get_block_size(struct device_node *node,
 
 void __init riscv_init_cbo_blocksizes(void)
 {
-	unsigned long cbom_hartid, cboz_hartid;
-	u32 cbom_block_size = 0, cboz_block_size = 0;
+	unsigned long cbom_hartid, cboz_hartid, cbop_hartid;
+	u32 cbom_block_size = 0, cboz_block_size = 0, cbop_block_size = 0;
 	struct device_node *node;
 	struct acpi_table_header *rhct;
 	acpi_status status;
@@ -138,13 +141,15 @@ void __init riscv_init_cbo_blocksizes(void)
 					   &cbom_block_size, &cbom_hartid);
 			cbo_get_block_size(node, "riscv,cboz-block-size",
 					   &cboz_block_size, &cboz_hartid);
+			cbo_get_block_size(node, "riscv,cbop-block-size",
+					   &cbop_block_size, &cbop_hartid);
 		}
 	} else {
 		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
 		if (ACPI_FAILURE(status))
 			return;
 
-		acpi_get_cbo_block_size(rhct, &cbom_block_size, &cboz_block_size, NULL);
+		acpi_get_cbo_block_size(rhct, &cbom_block_size, &cboz_block_size, &cbop_block_size);
 		acpi_put_table((struct acpi_table_header *)rhct);
 	}
 
@@ -153,6 +158,9 @@ void __init riscv_init_cbo_blocksizes(void)
 
 	if (cboz_block_size)
 		riscv_cboz_block_size = cboz_block_size;
+
+	if (cbop_block_size)
+		riscv_cbop_block_size = cbop_block_size;
 }
 
 #ifdef CONFIG_SMP
-- 
2.39.2

