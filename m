Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E728267714
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345038; cv=none; b=KQgrHoBNY1JGQNKV8X2QOpFEXe3CfpldfnBvPj5M1ufd+tKauKRL6G4VU50tsL+seo3RM8x5XKxLUAY5R3Upw13Yd30jozAIre6BUmS+WC/bmJVArZZVeZUF3u6dqpphqcmxgRSE2cCztxiHr+tX2Y9OYljxJEagHPLwlRNs2ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345038; c=relaxed/simple;
	bh=gxKaBfmTuKPo1WM/FW3VhmjWtmEboXPKraulQLp11js=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VaoYA2XOebt9odXWuF1p6qRVunH8GjXTqx0RyIcaC71Pxv4egS/nmUQVjwBWypQi4zqMox0ln/60FViX/r3rvBIQ5MPyRwq2jDeovtjUzqMNG7rwhPGfmWmr8t3sxCDfUWlAJYMeawFoGQI++ckLKs3D0U5G2WbpJa+oSArOR/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OLG03zM+; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OLG03zM+"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEMbwL003015;
	Thu, 19 Jun 2025 14:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=XO6Sb
	CKW3dst3VqMa8MwXojlRO8JTMC1+Jq0rqLWebQ=; b=OLG03zM+AfdYZr+ciBAb+
	Vc9GrVCq5UT7Lr4IGdeYLElo0G+cG5hRfaggZZAcEr+WxE2XHf1FSRu6I41rHqca
	sKFWQYK3/80EPx6ujvj7/jlU+INRLaL092EDglwX1nOBthb7xg6RCiFC5kbeUmrt
	5p8yz7G5+ylSHykm/MXycJP3z8KpyCBx72go7d1Qxr/iarGXGHj5UzGbrQGx4hsg
	70K2P2rF1cCE89fp2PJHsTA783PrTJlARQrWnBiCbJkw2VSC8yJKv2IpMygPrzgv
	VlU3GPcv8nBCwEdC1kGhpb/L9B1nZWn5VJllsVlX3qcOm9mk3jrTMFJyHJq8cQFJ
	w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790yda16h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDPUsM023010;
	Thu, 19 Jun 2025 14:57:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhj8dvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:04 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55JEv0JF008257;
	Thu, 19 Jun 2025 14:57:04 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-180-74.vpn.oracle.com [10.154.180.74])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 478yhj8dta-4;
	Thu, 19 Jun 2025 14:57:03 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC PATCH v2 03/17] objtool: Disassemble code with libopcodes instead of running objdump
Date: Thu, 19 Jun 2025 16:56:45 +0200
Message-ID: <20250619145659.1377970-4-alexandre.chartre@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250619145659.1377970-1-alexandre.chartre@oracle.com>
References: <20250619145659.1377970-1-alexandre.chartre@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506190124
X-Proofpoint-GUID: Aasmz5u0BWHonIEg8ad_UGcytGAoDOcE
X-Proofpoint-ORIG-GUID: Aasmz5u0BWHonIEg8ad_UGcytGAoDOcE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEyMiBTYWx0ZWRfXyzN4gW/i2Tzn MhaLw1qH++1fkL1wzjFEAfv2JcmprVpr2jRpNffgx9ZGTmYI5FxDCo5/tm/ZMJOUsWmJXaqhZB3 0p7RAcJS/mYPUTfgxa/Hxf/St8HfLdQqAQAK0BzzBmxnVRcqrZ2dXMxW040SktTEu+o/tlTRwwR
 hPY9Rq51huNNaY8JrRR5S3e3oZ5L65259lWzKGri6CkkMAg0dtlyt/j7FdtVHwgZCjKXU0wdBU5 4Ue6FmxcpRvESACX26vGckmFByBahYB7qBYfWmoCPjyrAOo5YU8o2Re3M1CGlYP20yM9UFfmqt9 KWQBDszSrI0xAySH9mOAhmOgJs9cmh2CZjWMuUHNhLGoIey9mFVmqOASYgU9BxzQFqf7tvpVllX
 TPgOUAFhfxYZtJb+290i7a3r3oOdjN7fhm/AHm5H4slMo8vhURlCZH30cGdTgoVjt+DW8VpH
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=68542542 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=qB_9k6UZtangfgbWIO8A:9 cc=ntf awl=host:13207

objtool executes the objdump command to disassemble code. Use libopcodes
instead to have more control about the disassembly scope and output.
If libopcodes is not present then objtool is built without disassembly
support.

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/objtool/Build                   |   3 +-
 tools/objtool/Makefile                |  22 ++++
 tools/objtool/arch/loongarch/decode.c |  12 ++
 tools/objtool/arch/powerpc/decode.c   |  12 ++
 tools/objtool/arch/x86/decode.c       |  12 ++
 tools/objtool/check.c                 |  10 +-
 tools/objtool/disas.c                 | 183 ++++++++++++++++----------
 tools/objtool/include/objtool/arch.h  |   9 ++
 tools/objtool/include/objtool/check.h |   5 +
 tools/objtool/include/objtool/disas.h |  29 ++++
 10 files changed, 224 insertions(+), 73 deletions(-)

diff --git a/tools/objtool/Build b/tools/objtool/Build
index 677bf9148cba..ee04fba8c9d1 100644
--- a/tools/objtool/Build
+++ b/tools/objtool/Build
@@ -7,7 +7,8 @@ objtool-y += special.o
 objtool-y += builtin-check.o
 objtool-y += elf.o
 objtool-y += objtool.o
-objtool-y += disas.o
+
+objtool-$(BUILD_DISAS) += disas.o
 
 objtool-$(BUILD_ORC) += orc_gen.o
 objtool-$(BUILD_ORC) += orc_dump.o
diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index 8c20361dd100..1100501f4bce 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -7,6 +7,15 @@ srctree := $(patsubst %/,%,$(dir $(CURDIR)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))
 endif
 
+#
+# To support disassembly, objtool needs libopcodes which is provided
+# with libbdf (binutils-dev or binutils-devel package).
+#
+FEATURE_USER = .objtool
+FEATURE_TESTS = libbfd disassembler-init-styled
+FEATURE_DISPLAY = libbfd disassembler-init-styled
+include $(srctree)/tools/build/Makefile.feature
+
 LIBSUBCMD_DIR = $(srctree)/tools/lib/subcmd/
 ifneq ($(OUTPUT),)
   LIBSUBCMD_OUTPUT = $(abspath $(OUTPUT))/libsubcmd
@@ -40,6 +49,18 @@ OBJTOOL_LDFLAGS := $(LIBELF_LIBS) $(LIBSUBCMD) $(KBUILD_HOSTLDFLAGS)
 elfshdr := $(shell echo '$(pound)include <libelf.h>' | $(HOSTCC) $(OBJTOOL_CFLAGS) -x c -E - 2>/dev/null | grep elf_getshdr)
 OBJTOOL_CFLAGS += $(if $(elfshdr),,-DLIBELF_USE_DEPRECATED)
 
+ifeq ($(feature-disassembler-init-styled), 1)
+	OBJTOOL_CFLAGS += -DDISASM_INIT_STYLED
+endif
+
+BUILD_DISAS := n
+
+ifeq ($(feature-libbfd),1)
+	BUILD_DISAS := y
+	OBJTOOL_CFLAGS += -DDISAS
+	OBJTOOL_LDFLAGS += -lopcodes
+endif
+
 # Always want host compilation.
 HOST_OVERRIDES := CC="$(HOSTCC)" LD="$(HOSTLD)" AR="$(HOSTAR)"
 
@@ -56,6 +77,7 @@ ifeq ($(SRCARCH),loongarch)
 	BUILD_ORC := y
 endif
 
+export BUILD_DISAS
 export BUILD_ORC
 export srctree OUTPUT CFLAGS SRCARCH AWK
 include $(srctree)/tools/build/Makefile.include
diff --git a/tools/objtool/arch/loongarch/decode.c b/tools/objtool/arch/loongarch/decode.c
index b6fdc68053cc..5bf383e7e2e5 100644
--- a/tools/objtool/arch/loongarch/decode.c
+++ b/tools/objtool/arch/loongarch/decode.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 #include <string.h>
 #include <objtool/check.h>
+#include <objtool/disas.h>
 #include <objtool/warn.h>
 #include <asm/inst.h>
 #include <asm/orc_types.h>
@@ -387,3 +388,14 @@ unsigned long arch_jump_table_sym_offset(struct reloc *reloc, struct reloc *tabl
 		return reloc->sym->offset + reloc_addend(reloc);
 	}
 }
+
+#ifdef DISAS
+
+int arch_disas_info_init(struct disassemble_info *dinfo)
+{
+	return disas_info_init(dinfo, bfd_arch_loongarch,
+			       bfd_mach_loongarch32, bfd_mach_loongarch64,
+			       NULL);
+}
+
+#endif /* DISAS */
diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
index c851c51d4bd3..3c6fced37bcc 100644
--- a/tools/objtool/arch/powerpc/decode.c
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -3,6 +3,7 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <objtool/check.h>
+#include <objtool/disas.h>
 #include <objtool/elf.h>
 #include <objtool/arch.h>
 #include <objtool/warn.h>
@@ -128,3 +129,14 @@ unsigned int arch_reloc_size(struct reloc *reloc)
 		return 8;
 	}
 }
+
+#ifdef DISAS
+
+int arch_disas_info_init(struct disassemble_info *dinfo)
+{
+	return disas_info_init(dinfo, bfd_arch_powerpc,
+			       bfd_mach_ppc, bfd_mach_ppc64,
+			       NULL);
+}
+
+#endif /* DISAS */
diff --git a/tools/objtool/arch/x86/decode.c b/tools/objtool/arch/x86/decode.c
index 98c4713c1b09..3c85506f9414 100644
--- a/tools/objtool/arch/x86/decode.c
+++ b/tools/objtool/arch/x86/decode.c
@@ -16,6 +16,7 @@
 
 #include <asm/orc_types.h>
 #include <objtool/check.h>
+#include <objtool/disas.h>
 #include <objtool/elf.h>
 #include <objtool/arch.h>
 #include <objtool/warn.h>
@@ -880,3 +881,14 @@ unsigned int arch_reloc_size(struct reloc *reloc)
 		return 8;
 	}
 }
+
+#ifdef DISAS
+
+int arch_disas_info_init(struct disassemble_info *dinfo)
+{
+	return disas_info_init(dinfo, bfd_arch_i386,
+			       bfd_mach_i386_i386, bfd_mach_x86_64,
+			       "att");
+}
+
+#endif /* DISAS */
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index cef3a32a6747..8ba69e0c273b 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4702,8 +4702,6 @@ int check(struct objtool_file *file)
 			goto out;
 	}
 
-	free_insns(file);
-
 	if (opts.stats) {
 		printf("nr_insns_visited: %ld\n", nr_insns_visited);
 		printf("nr_cfi: %ld\n", nr_cfi);
@@ -4723,9 +4721,13 @@ int check(struct objtool_file *file)
 			WARN("%d warning(s) upgraded to errors", warnings);
 		print_args();
 		disas_ctx = disas_context_create(file);
-		disas_warned_funcs(disas_ctx);
-		disas_context_destroy(disas_ctx);
+		if (disas_ctx) {
+			disas_warned_funcs(disas_ctx);
+			disas_context_destroy(disas_ctx);
+		}
 	}
 
+	free_insns(file);
+
 	return ret;
 }
diff --git a/tools/objtool/disas.c b/tools/objtool/disas.c
index 67eff2a14832..9fead6281102 100644
--- a/tools/objtool/disas.c
+++ b/tools/objtool/disas.c
@@ -4,18 +4,53 @@
  */
 
 #include <objtool/arch.h>
+#include <objtool/check.h>
 #include <objtool/disas.h>
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
@@ -24,8 +59,49 @@ struct disas_context *disas_context_create(struct objtool_file *file)
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
+		WARN("failed to init disassembly arch");
+		goto error;
+	}
+
+	dinfo->endian = (file->elf->ehdr.e_ident[EI_DATA] == ELFDATA2MSB) ?
+		BFD_ENDIAN_BIG : BFD_ENDIAN_LITTLE;
+
+	disassemble_init_for_target(dinfo);
+
+	dctx->disassembler = disassembler(dinfo->arch,
+					  dinfo->endian == BFD_ENDIAN_BIG,
+					  dinfo->mach, NULL);
+	if (!dctx->disassembler) {
+		WARN("failed to create disassembler function");
+		goto error;
+	}
 
 	return dctx;
+
+error:
+	free(dctx);
+	return NULL;
 }
 
 void disas_context_destroy(struct disas_context *dctx)
@@ -33,86 +109,57 @@ void disas_context_destroy(struct disas_context *dctx)
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
+	size_t addr;
+
+	printf("%s:\n", func->name);
+	sym_for_each_insn(dctx->file, func, insn) {
+		addr = insn->offset;
+		printf(" %6lx:  %s+0x%-6lx      ",
+		       addr, func->name, addr - func->offset);
+		disas_insn(dctx, insn);
+		printf("\n");
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
 
 	if (!dctx)
 		return;
 
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
index 01ef6f415adf..19b1dec2db15 100644
--- a/tools/objtool/include/objtool/arch.h
+++ b/tools/objtool/include/objtool/arch.h
@@ -101,4 +101,13 @@ bool arch_pc_relative_reloc(struct reloc *reloc);
 unsigned int arch_reloc_size(struct reloc *reloc);
 unsigned long arch_jump_table_sym_offset(struct reloc *reloc, struct reloc *table);
 
+#ifdef DISAS
+
+#include <bfd.h>
+#include <dis-asm.h>
+
+int arch_disas_info_init(struct disassemble_info *dinfo);
+
+#endif /* DISAS */
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
diff --git a/tools/objtool/include/objtool/disas.h b/tools/objtool/include/objtool/disas.h
index 5c543b69fc61..3ec3ce2e4e6f 100644
--- a/tools/objtool/include/objtool/disas.h
+++ b/tools/objtool/include/objtool/disas.h
@@ -7,8 +7,37 @@
 #define _DISAS_H
 
 struct disas_context;
+struct disassemble_info;
+
+#ifdef DISAS
+
 struct disas_context *disas_context_create(struct objtool_file *file);
 void disas_context_destroy(struct disas_context *dctx);
 void disas_warned_funcs(struct disas_context *dctx);
+int disas_info_init(struct disassemble_info *dinfo,
+		    int arch, int mach32, int mach64,
+		    const char *options);
+
+#else /* DISAS */
+
+#include <objtool/warn.h>
+
+static inline struct disas_context *disas_context_create(struct objtool_file *file)
+{
+	WARN("Rebuild with libopcodes for disassembly support");
+	return NULL;
+}
+
+static inline void disas_context_destroy(struct disas_context *dctx) {}
+static inline void disas_warned_funcs(struct disas_context *dctx) {}
+
+static inline int disas_info_init(struct disassemble_info *dinfo,
+				  int arch, int mach32, int mach64,
+				  const char *options)
+{
+	return -1;
+}
+
+#endif /* DISAS */
 
 #endif /* _DISAS_H */
-- 
2.43.5

