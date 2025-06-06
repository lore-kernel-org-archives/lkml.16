Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F9528937C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224099; cv=none; b=SotE2hdeRd06EjK4654DrL66DUnofS61uYNdtrDSbTJQKkdKY6n8Zyigri0IpOM6jDvZleui4fMGdymM7bnCpbPwsqWXjNexv9rLDlvkcm1poPDiyVhCyUz22ZPirTkdqpR4krbtpWMn306lFXk0saipKd09pDZp0dnENrC1FGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224099; c=relaxed/simple;
	bh=3U+y0mvrYcUDNm0lFtJarweNEzMOapJF5DzVUHf/hkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rkASfTFRZsHG1EWwEx9RPb+71jF2UZE3uOdm3n/1Up3MxwZ4Yc8/fd5v+OWoLDW1Uq0a35R/lC0bLuGpBNMfCJ/n6KE7UXbKd+N0t0DH4ZF6oWOhLSydd+BBkQ5OBKSWe46XdcmDYKyzrgV9TqYT8dqLwXqWYWOtiT+uEJdcSqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=N5CAAhL6; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="N5CAAhL6"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565MZlU011741;
	Fri, 6 Jun 2025 15:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=PeI/p
	k5Il/MGVPlz2adzv5NVdLjN9omB9528dMPld/c=; b=N5CAAhL6bvx03RnB+7uJa
	DKPYkH7eLAHxLxvnyErWZQ+GOsQlqyBP0jMJKsQbiz1GTRt0QWzVfGjkdrx1ebmU
	w9V+I/qhiZ6ZzUJYeDKfijQ9G15kAkG1Xm/ubnVYaufu+gf99LFpLjZVOtLPNjad
	Qf7VLjTm009ygy80+M7RAH/LjXpNvlhagffqe/fMntlOJpK0z9iJLx22HMUeedur
	Aia7s8GSbD6z5ubdRiPLpMDcsWESifb2NllzWFzj6Sv9OeiCM1G5hbyB5/sB1w5j
	AN4CTOY4VNXFsGxyRpFfiNfwbH5mxFEmFAD0vP0uA8DPpmrLIHOc+eEY8+NrRggQ
	g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8j89cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:34:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 556Eshsk039288;
	Fri, 6 Jun 2025 15:34:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7des69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:34:50 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 556FYh3j015517;
	Fri, 6 Jun 2025 15:34:50 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-187-118.vpn.oracle.com [10.154.187.118])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 46yr7des15-4;
	Fri, 06 Jun 2025 15:34:50 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC 03/13] objtool: Disassemble code with libopcodes instead of running objdump
Date: Fri,  6 Jun 2025 17:34:30 +0200
Message-ID: <20250606153440.865808-4-alexandre.chartre@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250606153440.865808-1-alexandre.chartre@oracle.com>
References: <20250606153440.865808-1-alexandre.chartre@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506060136
X-Proofpoint-GUID: AF7nlqu_3zg58uwv76jnljc7-Sj5ajxD
X-Proofpoint-ORIG-GUID: AF7nlqu_3zg58uwv76jnljc7-Sj5ajxD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEzNyBTYWx0ZWRfX+iqYyXOcqGzH Ysd0gBbvJY8+R7HSK3MrnAx2Birk5Jv/hp4PphWgtlK3MejmQ//+N3nT6pWkHtOBuakj7iMs+sZ KdN9QLwDbXu2KVAHHNuuI1+VQclPA8Y+edJoZ+jSS8jE3tATo7R31GxDMVg6j+FePhuch28cU52
 d0G65kU6BhiDj3n3Xj5UiMx235NxVu9ke6RBNCbvKdFA64lEyNvCRR70cw6DZzJ3r6epAVyBOWr j8FKAsp7sSpg3PNLyIZbOW1Z2HDNQgYYxAlGd5HMNo721nYLOjWewnOZ/Z0WFmt7tVBTkGriHpT EgEArh4VU1/kY4h+ZhirstjB5fEAmhOmTAxhf2A1PC9+qlNPEMXX3+hF7h/wTN2/URcUr+Mkn17
 eLD46CD4KuobMma047DRukE86UeJng9F5oP4HqM9QPaLbt/gUrWvxwOyI/RVvfxe9SJ+bHbL
X-Authority-Analysis: v=2.4 cv=QI1oRhLL c=1 sm=1 tr=0 ts=68430a9b cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=OvpEF-eQTjwjmUvlGM4A:9

objtool executes the objdump command to disassemble code. Use libopcodes
instead to have more control about the disassembly scope and output.

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/objtool/Makefile                  |   2 +-
 tools/objtool/arch/loongarch/decode.c   |   6 +
 tools/objtool/arch/powerpc/decode.c     |   6 +
 tools/objtool/arch/x86/decode.c         |   7 +
 tools/objtool/check.c                   |   4 +-
 tools/objtool/disas.c                   | 186 +++++++++++++++---------
 tools/objtool/include/objtool/arch.h    |   5 +
 tools/objtool/include/objtool/check.h   |   5 +
 tools/objtool/include/objtool/objtool.h |   4 +
 9 files changed, 154 insertions(+), 71 deletions(-)

diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index 8c20361dd100..00350fc7c662 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -34,7 +34,7 @@ INCLUDES := -I$(srctree)/tools/include \
 # is passed here to match a legacy behavior.
 WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed -Wno-nested-externs
 OBJTOOL_CFLAGS := -Werror $(WARNINGS) $(KBUILD_HOSTCFLAGS) -g $(INCLUDES) $(LIBELF_FLAGS)
-OBJTOOL_LDFLAGS := $(LIBELF_LIBS) $(LIBSUBCMD) $(KBUILD_HOSTLDFLAGS)
+OBJTOOL_LDFLAGS := $(LIBELF_LIBS) $(LIBSUBCMD) $(KBUILD_HOSTLDFLAGS) -lopcodes
 
 # Allow old libelf to be used:
 elfshdr := $(shell echo '$(pound)include <libelf.h>' | $(HOSTCC) $(OBJTOOL_CFLAGS) -x c -E - 2>/dev/null | grep elf_getshdr)
diff --git a/tools/objtool/arch/loongarch/decode.c b/tools/objtool/arch/loongarch/decode.c
index b6fdc68053cc..bf5ac6750512 100644
--- a/tools/objtool/arch/loongarch/decode.c
+++ b/tools/objtool/arch/loongarch/decode.c
@@ -386,4 +386,10 @@ unsigned long arch_jump_table_sym_offset(struct reloc *reloc, struct reloc *tabl
 	default:
 		return reloc->sym->offset + reloc_addend(reloc);
 	}
+
+int arch_disas_info_init(struct disassemble_info *dinfo)
+{
+	return disas_info_init(dinfo, bfd_arch_loongarch,
+			       bfd_mach_loongarch32, bfd_mach_loongarch64,
+			       NULL);
 }
diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
index c851c51d4bd3..c0fcab2d643c 100644
--- a/tools/objtool/arch/powerpc/decode.c
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -127,4 +127,10 @@ unsigned int arch_reloc_size(struct reloc *reloc)
 	default:
 		return 8;
 	}
+
+int arch_disas_info_init(struct disassemble_info *dinfo)
+{
+	return disas_info_init(dinfo, bfd_arch_powerpc,
+			       bfd_mach_ppc, bfd_mach_ppc64,
+			       NULL);
 }
diff --git a/tools/objtool/arch/x86/decode.c b/tools/objtool/arch/x86/decode.c
index 98c4713c1b09..6c13c67ed9b9 100644
--- a/tools/objtool/arch/x86/decode.c
+++ b/tools/objtool/arch/x86/decode.c
@@ -880,3 +880,10 @@ unsigned int arch_reloc_size(struct reloc *reloc)
 		return 8;
 	}
 }
+
+int arch_disas_info_init(struct disassemble_info *dinfo)
+{
+	return disas_info_init(dinfo, bfd_arch_i386,
+			       bfd_mach_i386_i386, bfd_mach_x86_64,
+			       "att");
+}
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 085fcc1b643b..9cfac23185b8 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4701,8 +4701,6 @@ int check(struct objtool_file *file)
 			goto out;
 	}
 
-	free_insns(file);
-
 	if (opts.stats) {
 		printf("nr_insns_visited: %ld\n", nr_insns_visited);
 		printf("nr_cfi: %ld\n", nr_cfi);
@@ -4726,5 +4724,7 @@ int check(struct objtool_file *file)
 		disas_context_destroy(disas_ctx);
 	}
 
+	free_insns(file);
+
 	return ret;
 }
diff --git a/tools/objtool/disas.c b/tools/objtool/disas.c
index ed74554bccbf..f2eb1050ce11 100644
--- a/tools/objtool/disas.c
+++ b/tools/objtool/disas.c
@@ -4,17 +4,52 @@
  */
 
 #include <objtool/arch.h>
+#include <objtool/check.h>
 #include <objtool/warn.h>
 
+#include <bfd.h>
 #include <linux/string.h>
+#include <tools/dis-asm-compat.h>
 
 struct disas_context {
 	struct objtool_file *file;
+	disassembler_ftype disassembler;
+	struct disassemble_info info;
 };
 
+/*
+ * Initialize disassemble info arch, mach (32 or 64-bit) and options.
+ */
+int disas_info_init(struct disassemble_info *dinfo,
+		    int arch, int mach32, int mach64,
+		    const char *options)
+{
+	struct disas_context *dctx = dinfo->application_data;
+	struct objtool_file *file = dctx->file;
+
+	dinfo->arch = arch;
+
+	switch (file->elf->ehdr.e_ident[EI_CLASS]) {
+	case ELFCLASS32:
+		dinfo->mach = mach32;
+		break;
+	case ELFCLASS64:
+		dinfo->mach = mach64;
+		break;
+	default:
+		return -1;
+	}
+
+	dinfo->disassembler_options = options;
+
+	return 0;
+}
+
 struct disas_context *disas_context_create(struct objtool_file *file)
 {
 	struct disas_context *dctx;
+	struct disassemble_info *dinfo;
+	int err;
 
 	dctx = malloc(sizeof(*dctx));
 	if (!dctx) {
@@ -23,8 +58,49 @@ struct disas_context *disas_context_create(struct objtool_file *file)
 	}
 
 	dctx->file = file;
+	dinfo = &dctx->info;
+
+	init_disassemble_info_compat(dinfo, stdout,
+				     (fprintf_ftype)fprintf,
+				     fprintf_styled);
+
+	dinfo->read_memory_func = buffer_read_memory;
+	dinfo->application_data = dctx;
+
+	/*
+	 * bfd_openr() is not used to avoid doing ELF data processing
+	 * and caching that has already being done. Here, we just need
+	 * to identify the target file so we call an arch specific
+	 * function to fill some disassemble info (arch, mach).
+	 */
+
+	dinfo->arch = bfd_arch_unknown;
+	dinfo->mach = 0;
+
+	err = arch_disas_info_init(dinfo);
+	if (err || dinfo->arch == bfd_arch_unknown || dinfo->mach == 0) {
+		WARN("failed to init disassembly arch\n");
+		goto error;
+	}
+
+	dinfo->endian = (file->elf->ehdr.e_ident[EI_DATA] == ELFDATA2MSB) ?
+		BFD_ENDIAN_BIG : BFD_ENDIAN_LITTLE;
+
+	disassemble_init_for_target(dinfo);
+
+	dctx->disassembler = disassembler(dinfo->arch,
+					       dinfo->endian == BFD_ENDIAN_BIG,
+					       dinfo->mach, NULL);
+	if (!dctx->disassembler) {
+		WARN("failed to create disassembler function\n");
+		goto error;
+	}
 
 	return dctx;
+
+error:
+	free(dctx);
+	return NULL;
 }
 
 void disas_context_destroy(struct disas_context *dctx)
@@ -32,60 +108,54 @@ void disas_context_destroy(struct disas_context *dctx)
 	free(dctx);
 }
 
-/* 'funcs' is a space-separated list of function names */
-static void disas_funcs(const char *funcs)
+/*
+ * Disassemble a single instruction. Return the size of the instruction.
+ */
+static size_t disas_insn(struct disas_context *dctx,
+			 struct instruction *insn)
 {
-	const char *objdump_str, *cross_compile;
-	int size, ret;
-	char *cmd;
-
-	cross_compile = getenv("CROSS_COMPILE");
-	if (!cross_compile)
-		cross_compile = "";
-
-	objdump_str = "%sobjdump -wdr %s | gawk -M -v _funcs='%s' '"
-			"BEGIN { split(_funcs, funcs); }"
-			"/^$/ { func_match = 0; }"
-			"/<.*>:/ { "
-				"f = gensub(/.*<(.*)>:/, \"\\\\1\", 1);"
-				"for (i in funcs) {"
-					"if (funcs[i] == f) {"
-						"func_match = 1;"
-						"base = strtonum(\"0x\" $1);"
-						"break;"
-					"}"
-				"}"
-			"}"
-			"{"
-				"if (func_match) {"
-					"addr = strtonum(\"0x\" $1);"
-					"printf(\"%%04x \", addr - base);"
-					"print;"
-				"}"
-			"}' 1>&2";
-
-	/* fake snprintf() to calculate the size */
-	size = snprintf(NULL, 0, objdump_str, cross_compile, objname, funcs) + 1;
-	if (size <= 0) {
-		WARN("objdump string size calculation failed");
-		return;
-	}
-
-	cmd = malloc(size);
+	disassembler_ftype disasm = dctx->disassembler;
+	struct disassemble_info *dinfo = &dctx->info;
+
+	/*
+	 * Set the disassembler buffer to read data from the section
+	 * containing the instruction to disassemble.
+	 */
+	dinfo->buffer = insn->sec->data->d_buf;
+	dinfo->buffer_vma = 0;
+	dinfo->buffer_length = insn->sec->sh.sh_size;
+
+	return disasm(insn->offset, &dctx->info);
+}
 
-	/* real snprintf() */
-	snprintf(cmd, size, objdump_str, cross_compile, objname, funcs);
-	ret = system(cmd);
-	if (ret) {
-		WARN("disassembly failed: %d", ret);
-		return;
+/*
+ * Disassemble a function.
+ */
+static void disas_func(struct disas_context *dctx, struct symbol *func)
+{
+	struct instruction *insn;
+	size_t addr, size;
+
+	printf("%s:\n", func->name);
+	sym_for_each_insn(dctx->file, func, insn) {
+
+		addr = insn->offset;
+		printf(" %6lx:  %s+0x%-6lx      ",
+		       addr, func->name, addr - func->offset);
+		size = disas_insn(dctx, insn);
+		printf("\n");
+		if (size != insn->len)
+			WARN("inconsistent insn size (%ld and %d)\n", size, insn->len);
 	}
+	printf("\n");
 }
 
+/*
+ * Disassemble all warned functions.
+ */
 void disas_warned_funcs(struct disas_context *dctx)
 {
 	struct symbol *sym;
-	char *funcs = NULL, *tmp;
 
 	if (!dctx) {
 		ERROR("disassembly context is not defined");
@@ -93,27 +163,7 @@ void disas_warned_funcs(struct disas_context *dctx)
 	}
 
 	for_each_sym(dctx->file, sym) {
-		if (sym->warned) {
-			if (!funcs) {
-				funcs = malloc(strlen(sym->name) + 1);
-				if (!funcs) {
-					ERROR_GLIBC("malloc");
-					return;
-				}
-				strcpy(funcs, sym->name);
-			} else {
-				tmp = malloc(strlen(funcs) + strlen(sym->name) + 2);
-				if (!tmp) {
-					ERROR_GLIBC("malloc");
-					return;
-				}
-				sprintf(tmp, "%s %s", funcs, sym->name);
-				free(funcs);
-				funcs = tmp;
-			}
-		}
+		if (sym->warned)
+			disas_func(dctx, sym);
 	}
-
-	if (funcs)
-		disas_funcs(funcs);
 }
diff --git a/tools/objtool/include/objtool/arch.h b/tools/objtool/include/objtool/arch.h
index 01ef6f415adf..aecf8fc29571 100644
--- a/tools/objtool/include/objtool/arch.h
+++ b/tools/objtool/include/objtool/arch.h
@@ -6,6 +6,8 @@
 #ifndef _ARCH_H
 #define _ARCH_H
 
+#include <bfd.h>
+#include <dis-asm.h>
 #include <stdbool.h>
 #include <linux/list.h>
 #include <objtool/objtool.h>
@@ -98,7 +100,10 @@ int arch_rewrite_retpolines(struct objtool_file *file);
 
 bool arch_pc_relative_reloc(struct reloc *reloc);
 
+
 unsigned int arch_reloc_size(struct reloc *reloc);
 unsigned long arch_jump_table_sym_offset(struct reloc *reloc, struct reloc *table);
 
+int arch_disas_info_init(struct disassemble_info *dinfo);
+
 #endif /* _ARCH_H */
diff --git a/tools/objtool/include/objtool/check.h b/tools/objtool/include/objtool/check.h
index 00fb745e7233..5290ac1ebbc1 100644
--- a/tools/objtool/include/objtool/check.h
+++ b/tools/objtool/include/objtool/check.h
@@ -125,4 +125,9 @@ struct instruction *next_insn_same_sec(struct objtool_file *file, struct instruc
 	     insn && insn->sec == _sec;					\
 	     insn = next_insn_same_sec(file, insn))
 
+#define sym_for_each_insn(file, sym, insn)				\
+	for (insn = find_insn(file, sym->sec, sym->offset);		\
+	     insn && insn->offset < sym->offset + sym->len;		\
+	     insn = next_insn_same_sec(file, insn))
+
 #endif /* _CHECK_H */
diff --git a/tools/objtool/include/objtool/objtool.h b/tools/objtool/include/objtool/objtool.h
index f5ab71f07f5c..0b404cfd81c0 100644
--- a/tools/objtool/include/objtool/objtool.h
+++ b/tools/objtool/include/objtool/objtool.h
@@ -48,8 +48,12 @@ int orc_dump(const char *objname);
 int orc_create(struct objtool_file *file);
 
 struct disas_context;
+struct disassemble_info;
 struct disas_context *disas_context_create(struct objtool_file *file);
 void disas_context_destroy(struct disas_context *dctx);
 void disas_warned_funcs(struct disas_context *dctx);
+int disas_info_init(struct disassemble_info *dinfo,
+		    int arch, int mach32, int mach64,
+		    const char *options);
 
 #endif /* _OBJTOOL_H */
-- 
2.43.5

