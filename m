Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04A7221FD5
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 11:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746704622; cv=none; b=sJiOvYAZ83R2oA+zjo+I1KWq3lh1nWIfShg0MTZcLI3AplkBQzyF2cx2bIzgtKVrqXlNo248Ve5UnFFAKumOLeqGZs+b7j82PrQz2+kenWWVd81zpBzqp0b2zzAD4MQeOWrJrm+3r3QlgdwFSGoZCvllXUv3jetGLNShuazNGwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746704622; c=relaxed/simple;
	bh=/DF69Vu+/19jWM2d4uDTK4sN0XTxtluDD78pb2XWoQ0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NUankYXe6blW9kxQbwEc5WPzNA+E67G0Vnn8GXLMVTikfH1jokMkzJuKKr0O3KHJBnxmM+sc88AouuMS53kmxc/uJoDyK+9iDxINFecHWZwXQWaeNaFc81tmR6DpGpj/NobwzaQXzdE9884sJtiRY+7LtZGwjhfUa/Deihzq4IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MuttHzY1; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MuttHzY1"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so4982275e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 04:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746704619; x=1747309419; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iyIbvSlFzL9tklWdENYxgwn726Q+wXKuuiY2Rfd97J4=;
        b=MuttHzY1tGyIWi9+7ju4igkDI5apFWRvTmxc1gxUiZ4AXuEwKusq1n/NTRovVxfit9
         80ewTprJF0nZY4e7yrLw2kIzFZJ8Z6Nbo+Ld4QTzQrm7tfunSf6yNvYMxlh/02o4ryoj
         PxK2ggNa9M1FDhfnkO8bieXp8p4O2m9yZurOUghGVO4LokoLfcpy3KrvwDZlcEBBfBu8
         qxx+KQ3KHm5+QFd9uQvb9F/1vOGLOMVf2EYAbp/DXGiAK+3qjXwDqjilJ0wyTeTNR/FC
         5OuEu8Ie19k1cUEdN5EPtf2qjs/CALiaxayO+jf5RGkEZZ2/4w+HBQVRsRsAecTaBQPy
         rLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746704619; x=1747309419;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iyIbvSlFzL9tklWdENYxgwn726Q+wXKuuiY2Rfd97J4=;
        b=GKFYEcnoQ+F91RPexfkIpxmo/+evZyz7juLNt89apO0A6ZKnv7hf2CjndHj+WzHbmX
         irRNZDdxTepd4mj+jf3sPJlGD3hb8boAUJh2228xMwbQ/vx/i/n5CbFn8kuXyUDCEokq
         f4Co2k89k5fcWuI5Vqy7GNz7Y1TmsGhAj73Qg8bpVQNT2LxJzcs536FUj9vrT9RACxdh
         o1kNnV6ktsRjbZ4/7C8meJxJPkNH6242FECKnE3eSFB5bvk0Zdh5bPDyFUszMTiHmSPd
         vhl6cYRE+5tkq1ZFi+R6E4CFFz/ySYnZ5r/0sXjiMnk7Zv+i0bttNv6z2vVc1Eex7vTb
         zLSw==
X-Gm-Message-State: AOJu0Yw+b5S3enascfasX9jYzCcSBnVFB9jefAino4PKma6+qiGIGxXb
	B4YAFp1dKcQv8tSjVF0SbMpgAVbPPIm6JASQE7g8LfOCPdxjERa9knK4GpRoDNUwLjVxwQ==
X-Google-Smtp-Source: AGHT+IHinN/s8aDJdmtFxeBWr/2xru34oMAhgGDdYH6mvO5OUknD45BG+MK3IR8OLJhr3EqAP/6zAiw5
X-Received: from wmcn28.prod.google.com ([2002:a05:600c:c0dc:b0:442:cd39:5ca4])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4744:b0:43d:fa5d:9314
 with SMTP id 5b1f17b1804b1-441d44e3655mr42698565e9.32.1746704619017; Thu, 08
 May 2025 04:43:39 -0700 (PDT)
Date: Thu,  8 May 2025 13:43:30 +0200
In-Reply-To: <20250508114328.2460610-5-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250508114328.2460610-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3987; i=ardb@kernel.org;
 h=from:subject; bh=xxf59ivCEFowwWRLXhxeRuA7HoE9SsAg99Xa2A4F2To=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUNmxqNvnS+bn2fWfuH/6D/17/wtDhd6Vh8WeS9Ul2O/9
 Dqz8TWmjlIWBjEOBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCRhT8ZGZ78dOoXlfSvv+xV
 JayRlLtx3/olW9++8kxxltZqXnNedDrD/zQOWQ7JdRvmPo3PtT9eoNjxy5f3K7+cbfyp4NAIT7b nLAA=
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Message-ID: <20250508114328.2460610-6-ardb+git@google.com>
Subject: [PATCH v2 1/3] arm64/boot: Move init_pgdir[] and init_idmap_pgdir[]
 into __pi_ namespace
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

init_pgdir[] is only referenced from the startup code, but lives after
BSS in the linker map. Before tightening the rules about accessing BSS
from startup code, move init_pgdir[] into the __pi_ namespace, so it
does not need to be exported explicitly.

For symmetry, do the same with init_idmap_pgdir[], although it lives
before BSS.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/pgtable.h | 2 --
 arch/arm64/kernel/head.S         | 6 +++---
 arch/arm64/kernel/image-vars.h   | 4 ----
 arch/arm64/kernel/pi/pi.h        | 1 +
 arch/arm64/kernel/vmlinux.lds.S  | 8 ++++----
 5 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index d3b538be1500..6a040f0bbfe1 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -754,8 +754,6 @@ static inline bool pud_table(pud_t pud) { return true; }
 				 PUD_TYPE_TABLE)
 #endif
 
-extern pgd_t init_pg_dir[];
-extern pgd_t init_pg_end[];
 extern pgd_t swapper_pg_dir[];
 extern pgd_t idmap_pg_dir[];
 extern pgd_t tramp_pg_dir[];
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 2ce73525de2c..ca04b338cb0d 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -89,7 +89,7 @@ SYM_CODE_START(primary_entry)
 	adrp	x1, early_init_stack
 	mov	sp, x1
 	mov	x29, xzr
-	adrp	x0, init_idmap_pg_dir
+	adrp	x0, __pi_init_idmap_pg_dir
 	mov	x1, xzr
 	bl	__pi_create_init_idmap
 
@@ -101,7 +101,7 @@ SYM_CODE_START(primary_entry)
 	cbnz	x19, 0f
 	dmb     sy
 	mov	x1, x0				// end of used region
-	adrp    x0, init_idmap_pg_dir
+	adrp    x0, __pi_init_idmap_pg_dir
 	adr_l	x2, dcache_inval_poc
 	blr	x2
 	b	1f
@@ -507,7 +507,7 @@ SYM_FUNC_END(__no_granule_support)
 
 SYM_FUNC_START_LOCAL(__primary_switch)
 	adrp	x1, reserved_pg_dir
-	adrp	x2, init_idmap_pg_dir
+	adrp	x2, __pi_init_idmap_pg_dir
 	bl	__enable_mmu
 
 	adrp	x1, early_init_stack
diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index 5e3c4b58f279..c3b4c0479d5c 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -54,10 +54,6 @@ PROVIDE(__pi_is_midr_in_range_list	= is_midr_in_range_list);
 PROVIDE(__pi__ctype			= _ctype);
 PROVIDE(__pi_memstart_offset_seed	= memstart_offset_seed);
 
-PROVIDE(__pi_init_idmap_pg_dir		= init_idmap_pg_dir);
-PROVIDE(__pi_init_idmap_pg_end		= init_idmap_pg_end);
-PROVIDE(__pi_init_pg_dir		= init_pg_dir);
-PROVIDE(__pi_init_pg_end		= init_pg_end);
 PROVIDE(__pi_swapper_pg_dir		= swapper_pg_dir);
 
 PROVIDE(__pi__text			= _text);
diff --git a/arch/arm64/kernel/pi/pi.h b/arch/arm64/kernel/pi/pi.h
index c91e5e965cd3..1f4731a4e17e 100644
--- a/arch/arm64/kernel/pi/pi.h
+++ b/arch/arm64/kernel/pi/pi.h
@@ -22,6 +22,7 @@ static inline void *prel64_to_pointer(const prel64_t *offset)
 extern bool dynamic_scs_is_enabled;
 
 extern pgd_t init_idmap_pg_dir[], init_idmap_pg_end[];
+extern pgd_t init_pg_dir[], init_pg_end[];
 
 void init_feature_override(u64 boot_status, const void *fdt, int chosen);
 u64 kaslr_early_init(void *fdt, int chosen);
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index e73326bd3ff7..466544c47dca 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -249,9 +249,9 @@ SECTIONS
 	__inittext_end = .;
 	__initdata_begin = .;
 
-	init_idmap_pg_dir = .;
+	__pi_init_idmap_pg_dir = .;
 	. += INIT_IDMAP_DIR_SIZE;
-	init_idmap_pg_end = .;
+	__pi_init_idmap_pg_end = .;
 
 	.init.data : {
 		INIT_DATA
@@ -321,9 +321,9 @@ SECTIONS
 	BSS_SECTION(SBSS_ALIGN, 0, 0)
 
 	. = ALIGN(PAGE_SIZE);
-	init_pg_dir = .;
+	__pi_init_pg_dir = .;
 	. += INIT_DIR_SIZE;
-	init_pg_end = .;
+	__pi_init_pg_end = .;
 	/* end of zero-init region */
 
 	. += SZ_4K;		/* stack for the early C runtime */
-- 
2.49.0.987.g0cc8ee98dc-goog

