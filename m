Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C101DDC28
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743481654; cv=none; b=MQA6ObD+niOd3kWZGUO72UuuhRrawSMidwPgryZ0+fHW8t0kYcCzKNC30oUnWeeZxsH5F88SefkaA9g385vEOBpUioOagwDXln607RvsQbGJIt93RCDZVtfm9pY2kU3AS6Td5Sgl4+b8SCrRcBrRl3OZPE5XA/CGC5118dgsqvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743481654; c=relaxed/simple;
	bh=ktCWHaaqmwAj1PgGXNcP+1mdfA4781mLYxDxgky652U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o9E4tNmyNGE2dV0l06Jh4lcWKGDyUc0NXu8oCfljLBh5D0Z0Ut4GoSHYMsmMk8lB7zQwX1fBp4bMjD4ba8V7D/yqPKC73dWWfOd36Q9fWh0MWbEHfh5ALq/+uWBU4zhqd4TXrn3m5xkyb4vQXbBWdxlmrcI/IajBg8hMTKO5hGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKhHOZrN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKhHOZrN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E866C4CEEB;
	Tue,  1 Apr 2025 04:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743481653;
	bh=ktCWHaaqmwAj1PgGXNcP+1mdfA4781mLYxDxgky652U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XKhHOZrNmw3B9oZOlt7yvnUGkL7VTLqsuVqbUCtpluh0zr7c/fR5PJBcd/lMGpEFP
	 6a5Ud6N8aFUUXwL09Ktzc1kawZdo0Do/Bq2q36xZPSTLRMS2+cB6Olg61v0u43Xems
	 9XiQNLfFz0mQyNxFnKJdSIhwKm7yWZuoNNRaHX0w894eHmsd2AnkjCM9AZLcbPOqZN
	 My+LGjE4kwlTtdaKaZ4MwAqcJjhNHQT/8BOMkJ/ROqP0JSfsGPTIeCRdNH/3zMF/XW
	 U+hjGgGTf2fT0dU4t8MVlmimGjhBimYznodWNUrAONthB+J2r6YgHG9rSm1Ko5XM9s
	 K9rJ7WUY/1x3g==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 06/11] objtool: Change "warning:" to "error:" for fatal errors
Date: Mon, 31 Mar 2025 21:26:41 -0700
Message-ID: <0ea76f4b0e7a370711ed9f75fd0792bb5979c2bf.1743481539.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1743481539.git.jpoimboe@kernel.org>
References: <cover.1743481539.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is similar to GCC's behavior and makes it more obvious why the
build failed.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/arch/loongarch/decode.c |  14 ++-
 tools/objtool/arch/loongarch/orc.c    |   8 +-
 tools/objtool/arch/x86/decode.c       |  15 ++-
 tools/objtool/arch/x86/orc.c          |   6 +-
 tools/objtool/builtin-check.c         |  30 +++---
 tools/objtool/check.c                 | 127 +++++++++++-----------
 tools/objtool/elf.c                   | 150 ++++++++++++--------------
 tools/objtool/include/objtool/warn.h  |  51 ++++++---
 tools/objtool/objtool.c               |   4 +-
 tools/objtool/orc_dump.c              |  30 +++---
 tools/objtool/special.c               |  13 +--
 11 files changed, 226 insertions(+), 222 deletions(-)

diff --git a/tools/objtool/arch/loongarch/decode.c b/tools/objtool/arch/loongarch/decode.c
index 02e490555966..b6fdc68053cc 100644
--- a/tools/objtool/arch/loongarch/decode.c
+++ b/tools/objtool/arch/loongarch/decode.c
@@ -63,7 +63,7 @@ static bool is_loongarch(const struct elf *elf)
 	if (elf->ehdr.e_machine == EM_LOONGARCH)
 		return true;
 
-	WARN("unexpected ELF machine type %d", elf->ehdr.e_machine);
+	ERROR("unexpected ELF machine type %d", elf->ehdr.e_machine);
 	return false;
 }
 
@@ -327,8 +327,10 @@ const char *arch_nop_insn(int len)
 {
 	static u32 nop;
 
-	if (len != LOONGARCH_INSN_SIZE)
-		WARN("invalid NOP size: %d\n", len);
+	if (len != LOONGARCH_INSN_SIZE) {
+		ERROR("invalid NOP size: %d\n", len);
+		return NULL;
+	}
 
 	nop = LOONGARCH_INSN_NOP;
 
@@ -339,8 +341,10 @@ const char *arch_ret_insn(int len)
 {
 	static u32 ret;
 
-	if (len != LOONGARCH_INSN_SIZE)
-		WARN("invalid RET size: %d\n", len);
+	if (len != LOONGARCH_INSN_SIZE) {
+		ERROR("invalid RET size: %d\n", len);
+		return NULL;
+	}
 
 	emit_jirl((union loongarch_instruction *)&ret, LOONGARCH_GPR_RA, LOONGARCH_GPR_ZERO, 0);
 
diff --git a/tools/objtool/arch/loongarch/orc.c b/tools/objtool/arch/loongarch/orc.c
index 873536d009d9..b58c5ff443c9 100644
--- a/tools/objtool/arch/loongarch/orc.c
+++ b/tools/objtool/arch/loongarch/orc.c
@@ -41,7 +41,7 @@ int init_orc_entry(struct orc_entry *orc, struct cfi_state *cfi, struct instruct
 		orc->type = ORC_TYPE_REGS_PARTIAL;
 		break;
 	default:
-		WARN_INSN(insn, "unknown unwind hint type %d", cfi->type);
+		ERROR_INSN(insn, "unknown unwind hint type %d", cfi->type);
 		return -1;
 	}
 
@@ -55,7 +55,7 @@ int init_orc_entry(struct orc_entry *orc, struct cfi_state *cfi, struct instruct
 		orc->sp_reg = ORC_REG_FP;
 		break;
 	default:
-		WARN_INSN(insn, "unknown CFA base reg %d", cfi->cfa.base);
+		ERROR_INSN(insn, "unknown CFA base reg %d", cfi->cfa.base);
 		return -1;
 	}
 
@@ -72,7 +72,7 @@ int init_orc_entry(struct orc_entry *orc, struct cfi_state *cfi, struct instruct
 		orc->fp_reg = ORC_REG_FP;
 		break;
 	default:
-		WARN_INSN(insn, "unknown FP base reg %d", fp->base);
+		ERROR_INSN(insn, "unknown FP base reg %d", fp->base);
 		return -1;
 	}
 
@@ -89,7 +89,7 @@ int init_orc_entry(struct orc_entry *orc, struct cfi_state *cfi, struct instruct
 		orc->ra_reg = ORC_REG_FP;
 		break;
 	default:
-		WARN_INSN(insn, "unknown RA base reg %d", ra->base);
+		ERROR_INSN(insn, "unknown RA base reg %d", ra->base);
 		return -1;
 	}
 
diff --git a/tools/objtool/arch/x86/decode.c b/tools/objtool/arch/x86/decode.c
index 7567c893f45e..33d861c04ebd 100644
--- a/tools/objtool/arch/x86/decode.c
+++ b/tools/objtool/arch/x86/decode.c
@@ -36,7 +36,7 @@ static int is_x86_64(const struct elf *elf)
 	case EM_386:
 		return 0;
 	default:
-		WARN("unexpected ELF machine type %d", elf->ehdr.e_machine);
+		ERROR("unexpected ELF machine type %d", elf->ehdr.e_machine);
 		return -1;
 	}
 }
@@ -173,7 +173,7 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 	ret = insn_decode(&ins, sec->data->d_buf + offset, maxlen,
 			  x86_64 ? INSN_MODE_64 : INSN_MODE_32);
 	if (ret < 0) {
-		WARN("can't decode instruction at %s:0x%lx", sec->name, offset);
+		ERROR("can't decode instruction at %s:0x%lx", sec->name, offset);
 		return -1;
 	}
 
@@ -321,7 +321,7 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 			break;
 
 		default:
-			/* WARN ? */
+			/* ERROR ? */
 			break;
 		}
 
@@ -561,8 +561,7 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 			if (ins.prefixes.nbytes == 1 &&
 			    ins.prefixes.bytes[0] == 0xf2) {
 				/* ENQCMD cannot be used in the kernel. */
-				WARN("ENQCMD instruction at %s:%lx", sec->name,
-				     offset);
+				WARN("ENQCMD instruction at %s:%lx", sec->name, offset);
 			}
 
 		} else if (op2 == 0xa0 || op2 == 0xa8) {
@@ -646,7 +645,7 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 			if (disp->sym->type == STT_SECTION)
 				func = find_symbol_by_offset(disp->sym->sec, reloc_addend(disp));
 			if (!func) {
-				WARN("no func for pv_ops[]");
+				ERROR("no func for pv_ops[]");
 				return -1;
 			}
 
@@ -776,7 +775,7 @@ const char *arch_nop_insn(int len)
 	};
 
 	if (len < 1 || len > 5) {
-		WARN("invalid NOP size: %d\n", len);
+		ERROR("invalid NOP size: %d\n", len);
 		return NULL;
 	}
 
@@ -796,7 +795,7 @@ const char *arch_ret_insn(int len)
 	};
 
 	if (len < 1 || len > 5) {
-		WARN("invalid RET size: %d\n", len);
+		ERROR("invalid RET size: %d\n", len);
 		return NULL;
 	}
 
diff --git a/tools/objtool/arch/x86/orc.c b/tools/objtool/arch/x86/orc.c
index b6cd943e87f9..7176b9ec5b05 100644
--- a/tools/objtool/arch/x86/orc.c
+++ b/tools/objtool/arch/x86/orc.c
@@ -40,7 +40,7 @@ int init_orc_entry(struct orc_entry *orc, struct cfi_state *cfi, struct instruct
 		orc->type = ORC_TYPE_REGS_PARTIAL;
 		break;
 	default:
-		WARN_INSN(insn, "unknown unwind hint type %d", cfi->type);
+		ERROR_INSN(insn, "unknown unwind hint type %d", cfi->type);
 		return -1;
 	}
 
@@ -72,7 +72,7 @@ int init_orc_entry(struct orc_entry *orc, struct cfi_state *cfi, struct instruct
 		orc->sp_reg = ORC_REG_DX;
 		break;
 	default:
-		WARN_INSN(insn, "unknown CFA base reg %d", cfi->cfa.base);
+		ERROR_INSN(insn, "unknown CFA base reg %d", cfi->cfa.base);
 		return -1;
 	}
 
@@ -87,7 +87,7 @@ int init_orc_entry(struct orc_entry *orc, struct cfi_state *cfi, struct instruct
 		orc->bp_reg = ORC_REG_BP;
 		break;
 	default:
-		WARN_INSN(insn, "unknown BP base reg %d", bp->base);
+		ERROR_INSN(insn, "unknown BP base reg %d", bp->base);
 		return -1;
 	}
 
diff --git a/tools/objtool/builtin-check.c b/tools/objtool/builtin-check.c
index e364ab6345d3..80239843e9f0 100644
--- a/tools/objtool/builtin-check.c
+++ b/tools/objtool/builtin-check.c
@@ -139,22 +139,22 @@ int cmd_parse_options(int argc, const char **argv, const char * const usage[])
 static bool opts_valid(void)
 {
 	if (opts.mnop && !opts.mcount) {
-		WARN("--mnop requires --mcount");
+		ERROR("--mnop requires --mcount");
 		return false;
 	}
 
 	if (opts.noinstr && !opts.link) {
-		WARN("--noinstr requires --link");
+		ERROR("--noinstr requires --link");
 		return false;
 	}
 
 	if (opts.ibt && !opts.link) {
-		WARN("--ibt requires --link");
+		ERROR("--ibt requires --link");
 		return false;
 	}
 
 	if (opts.unret && !opts.link) {
-		WARN("--unret requires --link");
+		ERROR("--unret requires --link");
 		return false;
 	}
 
@@ -171,7 +171,7 @@ static bool opts_valid(void)
 	    opts.static_call		||
 	    opts.uaccess) {
 		if (opts.dump_orc) {
-			WARN("--dump can't be combined with other actions");
+			ERROR("--dump can't be combined with other actions");
 			return false;
 		}
 
@@ -181,7 +181,7 @@ static bool opts_valid(void)
 	if (opts.dump_orc)
 		return true;
 
-	WARN("At least one action required");
+	ERROR("At least one action required");
 	return false;
 }
 
@@ -194,30 +194,30 @@ static int copy_file(const char *src, const char *dst)
 
 	src_fd = open(src, O_RDONLY);
 	if (src_fd == -1) {
-		WARN("can't open %s for reading: %s", src, strerror(errno));
+		ERROR("can't open %s for reading: %s", src, strerror(errno));
 		return 1;
 	}
 
 	dst_fd = open(dst, O_WRONLY | O_CREAT | O_TRUNC, 0400);
 	if (dst_fd == -1) {
-		WARN("can't open %s for writing: %s", dst, strerror(errno));
+		ERROR("can't open %s for writing: %s", dst, strerror(errno));
 		return 1;
 	}
 
 	if (fstat(src_fd, &stat) == -1) {
-		WARN_GLIBC("fstat");
+		ERROR_GLIBC("fstat");
 		return 1;
 	}
 
 	if (fchmod(dst_fd, stat.st_mode) == -1) {
-		WARN_GLIBC("fchmod");
+		ERROR_GLIBC("fchmod");
 		return 1;
 	}
 
 	for (to_copy = stat.st_size; to_copy > 0; to_copy -= copied) {
 		copied = sendfile(dst_fd, src_fd, &offset, to_copy);
 		if (copied == -1) {
-			WARN_GLIBC("sendfile");
+			ERROR_GLIBC("sendfile");
 			return 1;
 		}
 	}
@@ -231,14 +231,14 @@ static void save_argv(int argc, const char **argv)
 {
 	orig_argv = calloc(argc, sizeof(char *));
 	if (!orig_argv) {
-		WARN_GLIBC("calloc");
+		ERROR_GLIBC("calloc");
 		exit(1);
 	}
 
 	for (int i = 0; i < argc; i++) {
 		orig_argv[i] = strdup(argv[i]);
 		if (!orig_argv[i]) {
-			WARN_GLIBC("strdup(%s)", argv[i]);
+			ERROR_GLIBC("strdup(%s)", argv[i]);
 			exit(1);
 		}
 	};
@@ -257,7 +257,7 @@ void print_args(void)
 	 */
 	backup = malloc(strlen(objname) + strlen(ORIG_SUFFIX) + 1);
 	if (!backup) {
-		WARN_GLIBC("malloc");
+		ERROR_GLIBC("malloc");
 		goto print;
 	}
 
@@ -319,7 +319,7 @@ int objtool_run(int argc, const char **argv)
 		return 1;
 
 	if (!opts.link && has_multiple_files(file->elf)) {
-		WARN("Linked object requires --link");
+		ERROR("Linked object requires --link");
 		return 1;
 	}
 
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index cde669923b72..ff83be1aab1d 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -348,7 +348,7 @@ static struct cfi_state *cfi_alloc(void)
 {
 	struct cfi_state *cfi = calloc(1, sizeof(struct cfi_state));
 	if (!cfi) {
-		WARN_GLIBC("calloc");
+		ERROR_GLIBC("calloc");
 		exit(1);
 	}
 	nr_cfi++;
@@ -404,7 +404,7 @@ static void *cfi_hash_alloc(unsigned long size)
 			PROT_READ|PROT_WRITE,
 			MAP_PRIVATE|MAP_ANON, -1, 0);
 	if (cfi_hash == (void *)-1L) {
-		WARN_GLIBC("mmap fail cfi_hash");
+		ERROR_GLIBC("mmap fail cfi_hash");
 		cfi_hash = NULL;
 	}  else if (opts.stats) {
 		printf("cfi_bits: %d\n", cfi_bits);
@@ -460,7 +460,7 @@ static int decode_instructions(struct objtool_file *file)
 			if (!insns || idx == INSN_CHUNK_MAX) {
 				insns = calloc(sizeof(*insn), INSN_CHUNK_SIZE);
 				if (!insns) {
-					WARN_GLIBC("calloc");
+					ERROR_GLIBC("calloc");
 					return -1;
 				}
 				idx = 0;
@@ -495,8 +495,6 @@ static int decode_instructions(struct objtool_file *file)
 			nr_insns++;
 		}
 
-//		printf("%s: last chunk used: %d\n", sec->name, (int)idx);
-
 		sec_for_each_sym(sec, func) {
 			if (func->type != STT_NOTYPE && func->type != STT_FUNC)
 				continue;
@@ -505,8 +503,7 @@ static int decode_instructions(struct objtool_file *file)
 				/* Heuristic: likely an "end" symbol */
 				if (func->type == STT_NOTYPE)
 					continue;
-				WARN("%s(): STT_FUNC at end of section",
-				     func->name);
+				ERROR("%s(): STT_FUNC at end of section", func->name);
 				return -1;
 			}
 
@@ -514,8 +511,7 @@ static int decode_instructions(struct objtool_file *file)
 				continue;
 
 			if (!find_insn(file, sec, func->offset)) {
-				WARN("%s(): can't find starting instruction",
-				     func->name);
+				ERROR("%s(): can't find starting instruction", func->name);
 				return -1;
 			}
 
@@ -569,9 +565,8 @@ static int add_pv_ops(struct objtool_file *file, const char *symname)
 			func = find_symbol_by_offset(reloc->sym->sec,
 						     reloc_addend(reloc));
 		if (!func) {
-			WARN_FUNC("can't find func at %s[%d]",
-				  reloc->sym->sec, reloc_addend(reloc),
-				  symname, idx);
+			ERROR_FUNC(reloc->sym->sec, reloc_addend(reloc),
+				   "can't find func at %s[%d]", symname, idx);
 			return -1;
 		}
 
@@ -614,7 +609,7 @@ static int init_pv_ops(struct objtool_file *file)
 	nr = sym->len / sizeof(unsigned long);
 	file->pv_ops = calloc(sizeof(struct pv_state), nr);
 	if (!file->pv_ops) {
-		WARN_GLIBC("calloc");
+		ERROR_GLIBC("calloc");
 		return -1;
 	}
 
@@ -673,12 +668,12 @@ static int create_static_call_sections(struct objtool_file *file)
 		/* find key symbol */
 		key_name = strdup(insn_call_dest(insn)->name);
 		if (!key_name) {
-			WARN_GLIBC("strdup");
+			ERROR_GLIBC("strdup");
 			return -1;
 		}
 		if (strncmp(key_name, STATIC_CALL_TRAMP_PREFIX_STR,
 			    STATIC_CALL_TRAMP_PREFIX_LEN)) {
-			WARN("static_call: trampoline name malformed: %s", key_name);
+			ERROR("static_call: trampoline name malformed: %s", key_name);
 			return -1;
 		}
 		tmp = key_name + STATIC_CALL_TRAMP_PREFIX_LEN - STATIC_CALL_KEY_PREFIX_LEN;
@@ -687,7 +682,7 @@ static int create_static_call_sections(struct objtool_file *file)
 		key_sym = find_symbol_by_name(file->elf, tmp);
 		if (!key_sym) {
 			if (!opts.module) {
-				WARN("static_call: can't find static_call_key symbol: %s", tmp);
+				ERROR("static_call: can't find static_call_key symbol: %s", tmp);
 				return -1;
 			}
 
@@ -833,8 +828,8 @@ static int create_ibt_endbr_seal_sections(struct objtool_file *file)
 		    insn->offset == sym->offset &&
 		    (!strcmp(sym->name, "init_module") ||
 		     !strcmp(sym->name, "cleanup_module"))) {
-			WARN("%s(): Magic init_module() function name is deprecated, use module_init(fn) instead",
-			     sym->name);
+			ERROR("%s(): Magic init_module() function name is deprecated, use module_init(fn) instead",
+			      sym->name);
 			return -1;
 		}
 
@@ -1008,8 +1003,8 @@ static int add_ignores(struct objtool_file *file)
 			break;
 
 		default:
-			WARN("unexpected relocation symbol type in %s: %d",
-			     rsec->name, reloc->sym->type);
+			ERROR("unexpected relocation symbol type in %s: %d",
+			      rsec->name, reloc->sym->type);
 			return -1;
 		}
 
@@ -1559,8 +1554,8 @@ static int add_jump_destinations(struct objtool_file *file)
 			    dest_off == func->offset + func->len)
 				continue;
 
-			WARN_INSN(insn, "can't find jump dest instruction at %s+0x%lx",
-				  dest_sec->name, dest_off);
+			ERROR_INSN(insn, "can't find jump dest instruction at %s+0x%lx",
+				   dest_sec->name, dest_off);
 			return -1;
 		}
 
@@ -1666,12 +1661,12 @@ static int add_call_destinations(struct objtool_file *file)
 				continue;
 
 			if (!insn_call_dest(insn)) {
-				WARN_INSN(insn, "unannotated intra-function call");
+				ERROR_INSN(insn, "unannotated intra-function call");
 				return -1;
 			}
 
 			if (func && insn_call_dest(insn)->type != STT_FUNC) {
-				WARN_INSN(insn, "unsupported call to non-function");
+				ERROR_INSN(insn, "unsupported call to non-function");
 				return -1;
 			}
 
@@ -1679,8 +1674,8 @@ static int add_call_destinations(struct objtool_file *file)
 			dest_off = arch_dest_reloc_offset(reloc_addend(reloc));
 			dest = find_call_destination(reloc->sym->sec, dest_off);
 			if (!dest) {
-				WARN_INSN(insn, "can't find call dest symbol at %s+0x%lx",
-					  reloc->sym->sec->name, dest_off);
+				ERROR_INSN(insn, "can't find call dest symbol at %s+0x%lx",
+					   reloc->sym->sec->name, dest_off);
 				return -1;
 			}
 
@@ -1722,13 +1717,13 @@ static int handle_group_alt(struct objtool_file *file,
 
 		orig_alt_group = calloc(1, sizeof(*orig_alt_group));
 		if (!orig_alt_group) {
-			WARN_GLIBC("calloc");
+			ERROR_GLIBC("calloc");
 			return -1;
 		}
 		orig_alt_group->cfi = calloc(special_alt->orig_len,
 					     sizeof(struct cfi_state *));
 		if (!orig_alt_group->cfi) {
-			WARN_GLIBC("calloc");
+			ERROR_GLIBC("calloc");
 			return -1;
 		}
 
@@ -1748,18 +1743,18 @@ static int handle_group_alt(struct objtool_file *file,
 	} else {
 		if (orig_alt_group->last_insn->offset + orig_alt_group->last_insn->len -
 		    orig_alt_group->first_insn->offset != special_alt->orig_len) {
-			WARN_INSN(orig_insn, "weirdly overlapping alternative! %ld != %d",
-				  orig_alt_group->last_insn->offset +
-				  orig_alt_group->last_insn->len -
-				  orig_alt_group->first_insn->offset,
-				  special_alt->orig_len);
+			ERROR_INSN(orig_insn, "weirdly overlapping alternative! %ld != %d",
+				   orig_alt_group->last_insn->offset +
+				   orig_alt_group->last_insn->len -
+				   orig_alt_group->first_insn->offset,
+				   special_alt->orig_len);
 			return -1;
 		}
 	}
 
 	new_alt_group = calloc(1, sizeof(*new_alt_group));
 	if (!new_alt_group) {
-		WARN_GLIBC("calloc");
+		ERROR_GLIBC("calloc");
 		return -1;
 	}
 
@@ -1773,7 +1768,7 @@ static int handle_group_alt(struct objtool_file *file,
 		 */
 		nop = calloc(1, sizeof(*nop));
 		if (!nop) {
-			WARN_GLIBC("calloc");
+			ERROR_GLIBC("calloc");
 			return -1;
 		}
 		memset(nop, 0, sizeof(*nop));
@@ -1815,7 +1810,7 @@ static int handle_group_alt(struct objtool_file *file,
 		if (alt_reloc && arch_pc_relative_reloc(alt_reloc) &&
 		    !arch_support_alt_relocation(special_alt, insn, alt_reloc)) {
 
-			WARN_INSN(insn, "unsupported relocation in alternatives section");
+			ERROR_INSN(insn, "unsupported relocation in alternatives section");
 			return -1;
 		}
 
@@ -1829,15 +1824,15 @@ static int handle_group_alt(struct objtool_file *file,
 		if (dest_off == special_alt->new_off + special_alt->new_len) {
 			insn->jump_dest = next_insn_same_sec(file, orig_alt_group->last_insn);
 			if (!insn->jump_dest) {
-				WARN_INSN(insn, "can't find alternative jump destination");
+				ERROR_INSN(insn, "can't find alternative jump destination");
 				return -1;
 			}
 		}
 	}
 
 	if (!last_new_insn) {
-		WARN_FUNC("can't find last new alternative instruction",
-			  special_alt->new_sec, special_alt->new_off);
+		ERROR_FUNC(special_alt->new_sec, special_alt->new_off,
+			   "can't find last new alternative instruction");
 		return -1;
 	}
 
@@ -1864,7 +1859,7 @@ static int handle_jump_alt(struct objtool_file *file,
 	if (orig_insn->type != INSN_JUMP_UNCONDITIONAL &&
 	    orig_insn->type != INSN_NOP) {
 
-		WARN_INSN(orig_insn, "unsupported instruction at jump label");
+		ERROR_INSN(orig_insn, "unsupported instruction at jump label");
 		return -1;
 	}
 
@@ -1923,8 +1918,8 @@ static int add_special_section_alts(struct objtool_file *file)
 		orig_insn = find_insn(file, special_alt->orig_sec,
 				      special_alt->orig_off);
 		if (!orig_insn) {
-			WARN_FUNC("special: can't find orig instruction",
-				  special_alt->orig_sec, special_alt->orig_off);
+			ERROR_FUNC(special_alt->orig_sec, special_alt->orig_off,
+				   "special: can't find orig instruction");
 			return -1;
 		}
 
@@ -1933,16 +1928,15 @@ static int add_special_section_alts(struct objtool_file *file)
 			new_insn = find_insn(file, special_alt->new_sec,
 					     special_alt->new_off);
 			if (!new_insn) {
-				WARN_FUNC("special: can't find new instruction",
-					  special_alt->new_sec,
-					  special_alt->new_off);
+				ERROR_FUNC(special_alt->new_sec, special_alt->new_off,
+					   "special: can't find new instruction");
 				return -1;
 			}
 		}
 
 		if (special_alt->group) {
 			if (!special_alt->orig_len) {
-				WARN_INSN(orig_insn, "empty alternative entry");
+				ERROR_INSN(orig_insn, "empty alternative entry");
 				continue;
 			}
 
@@ -1960,7 +1954,7 @@ static int add_special_section_alts(struct objtool_file *file)
 
 		alt = calloc(1, sizeof(*alt));
 		if (!alt) {
-			WARN_GLIBC("calloc");
+			ERROR_GLIBC("calloc");
 			return -1;
 		}
 
@@ -2037,7 +2031,7 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn)
 
 		alt = calloc(1, sizeof(*alt));
 		if (!alt) {
-			WARN_GLIBC("calloc");
+			ERROR_GLIBC("calloc");
 			return -1;
 		}
 
@@ -2049,7 +2043,7 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn)
 	}
 
 	if (!prev_offset) {
-		WARN_INSN(insn, "can't find switch jump table");
+		ERROR_INSN(insn, "can't find switch jump table");
 		return -1;
 	}
 
@@ -2207,12 +2201,12 @@ static int read_unwind_hints(struct objtool_file *file)
 		return 0;
 
 	if (!sec->rsec) {
-		WARN("missing .rela.discard.unwind_hints section");
+		ERROR("missing .rela.discard.unwind_hints section");
 		return -1;
 	}
 
 	if (sec->sh.sh_size % sizeof(struct unwind_hint)) {
-		WARN("struct unwind_hint size mismatch");
+		ERROR("struct unwind_hint size mismatch");
 		return -1;
 	}
 
@@ -2223,7 +2217,7 @@ static int read_unwind_hints(struct objtool_file *file)
 
 		reloc = find_reloc_by_dest(file->elf, sec, i * sizeof(*hint));
 		if (!reloc) {
-			WARN("can't find reloc for unwind_hints[%d]", i);
+			ERROR("can't find reloc for unwind_hints[%d]", i);
 			return -1;
 		}
 
@@ -2232,13 +2226,13 @@ static int read_unwind_hints(struct objtool_file *file)
 		} else if (reloc->sym->local_label) {
 			offset = reloc->sym->offset;
 		} else {
-			WARN("unexpected relocation symbol type in %s", sec->rsec->name);
+			ERROR("unexpected relocation symbol type in %s", sec->rsec->name);
 			return -1;
 		}
 
 		insn = find_insn(file, reloc->sym->sec, offset);
 		if (!insn) {
-			WARN("can't find insn for unwind_hints[%d]", i);
+			ERROR("can't find insn for unwind_hints[%d]", i);
 			return -1;
 		}
 
@@ -2265,7 +2259,7 @@ static int read_unwind_hints(struct objtool_file *file)
 
 			if (sym && sym->bind == STB_GLOBAL) {
 				if (opts.ibt && insn->type != INSN_ENDBR && !insn->noendbr) {
-					WARN_INSN(insn, "UNWIND_HINT_IRET_REGS without ENDBR");
+					ERROR_INSN(insn, "UNWIND_HINT_IRET_REGS without ENDBR");
 					return -1;
 				}
 			}
@@ -2280,7 +2274,7 @@ static int read_unwind_hints(struct objtool_file *file)
 			cfi = *(insn->cfi);
 
 		if (arch_decode_hint_reg(hint->sp_reg, &cfi.cfa.base)) {
-			WARN_INSN(insn, "unsupported unwind_hint sp base reg %d", hint->sp_reg);
+			ERROR_INSN(insn, "unsupported unwind_hint sp base reg %d", hint->sp_reg);
 			return -1;
 		}
 
@@ -2326,7 +2320,7 @@ static int read_annotate(struct objtool_file *file,
 		insn = find_insn(file, reloc->sym->sec, offset);
 
 		if (!insn) {
-			WARN("bad .discard.annotate_insn entry: %d of type %d", reloc_idx(reloc), type);
+			ERROR("bad .discard.annotate_insn entry: %d of type %d", reloc_idx(reloc), type);
 			return -1;
 		}
 
@@ -2369,7 +2363,7 @@ static int __annotate_ifc(struct objtool_file *file, int type, struct instructio
 		return 0;
 
 	if (insn->type != INSN_CALL) {
-		WARN_INSN(insn, "intra_function_call not a direct call");
+		ERROR_INSN(insn, "intra_function_call not a direct call");
 		return -1;
 	}
 
@@ -2383,8 +2377,8 @@ static int __annotate_ifc(struct objtool_file *file, int type, struct instructio
 	dest_off = arch_jump_destination(insn);
 	insn->jump_dest = find_insn(file, insn->sec, dest_off);
 	if (!insn->jump_dest) {
-		WARN_INSN(insn, "can't find call dest at %s+0x%lx",
-			  insn->sec->name, dest_off);
+		ERROR_INSN(insn, "can't find call dest at %s+0x%lx",
+			   insn->sec->name, dest_off);
 		return -1;
 	}
 
@@ -2403,7 +2397,7 @@ static int __annotate_late(struct objtool_file *file, int type, struct instructi
 		    insn->type != INSN_CALL_DYNAMIC &&
 		    insn->type != INSN_RETURN &&
 		    insn->type != INSN_NOP) {
-			WARN_INSN(insn, "retpoline_safe hint not an indirect jump/call/ret/nop");
+			ERROR_INSN(insn, "retpoline_safe hint not an indirect jump/call/ret/nop");
 			return -1;
 		}
 
@@ -2435,7 +2429,7 @@ static int __annotate_late(struct objtool_file *file, int type, struct instructi
 		break;
 
 	default:
-		WARN_INSN(insn, "Unknown annotation type: %d", type);
+		ERROR_INSN(insn, "Unknown annotation type: %d", type);
 		return -1;
 	}
 
@@ -4393,9 +4387,8 @@ static int validate_ibt_data_reloc(struct objtool_file *file,
 	if (dest->noendbr)
 		return 0;
 
-	WARN_FUNC("data relocation to !ENDBR: %s",
-		  reloc->sec->base, reloc_offset(reloc),
-		  offstr(dest->sec, dest->offset));
+	WARN_FUNC(reloc->sec->base, reloc_offset(reloc),
+		  "data relocation to !ENDBR: %s", offstr(dest->sec, dest->offset));
 
 	return 1;
 }
@@ -4580,14 +4573,14 @@ static void disas_warned_funcs(struct objtool_file *file)
 			if (!funcs) {
 				funcs = malloc(strlen(sym->name) + 1);
 				if (!funcs) {
-					WARN_GLIBC("malloc");
+					ERROR_GLIBC("malloc");
 					return;
 				}
 				strcpy(funcs, sym->name);
 			} else {
 				tmp = malloc(strlen(funcs) + strlen(sym->name) + 2);
 				if (!tmp) {
-					WARN_GLIBC("malloc");
+					ERROR_GLIBC("malloc");
 					return;
 				}
 				sprintf(tmp, "%s %s", funcs, sym->name);
diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index b352a78b596c..727a3a4fd9d7 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -72,17 +72,17 @@ static inline void __elf_hash_del(struct elf_hash_node *node,
 	     obj;							\
 	     obj = elf_list_entry(obj->member.next, typeof(*(obj)), member))
 
-#define elf_alloc_hash(name, size) \
-({ \
-	__elf_bits(name) = max(10, ilog2(size)); \
+#define elf_alloc_hash(name, size)					\
+({									\
+	__elf_bits(name) = max(10, ilog2(size));			\
 	__elf_table(name) = mmap(NULL, sizeof(struct elf_hash_node *) << __elf_bits(name), \
-				 PROT_READ|PROT_WRITE, \
-				 MAP_PRIVATE|MAP_ANON, -1, 0); \
-	if (__elf_table(name) == (void *)-1L) { \
-		WARN("mmap fail " #name); \
-		__elf_table(name) = NULL; \
-	} \
-	__elf_table(name); \
+				 PROT_READ|PROT_WRITE,			\
+				 MAP_PRIVATE|MAP_ANON, -1, 0);		\
+	if (__elf_table(name) == (void *)-1L) {				\
+		ERROR_GLIBC("mmap fail " #name);			\
+		__elf_table(name) = NULL;				\
+	}								\
+	__elf_table(name);						\
 })
 
 static inline unsigned long __sym_start(struct symbol *s)
@@ -316,12 +316,12 @@ static int read_sections(struct elf *elf)
 	int i;
 
 	if (elf_getshdrnum(elf->elf, &sections_nr)) {
-		WARN_ELF("elf_getshdrnum");
+		ERROR_ELF("elf_getshdrnum");
 		return -1;
 	}
 
 	if (elf_getshdrstrndx(elf->elf, &shstrndx)) {
-		WARN_ELF("elf_getshdrstrndx");
+		ERROR_ELF("elf_getshdrstrndx");
 		return -1;
 	}
 
@@ -331,7 +331,7 @@ static int read_sections(struct elf *elf)
 
 	elf->section_data = calloc(sections_nr, sizeof(*sec));
 	if (!elf->section_data) {
-		WARN_GLIBC("calloc");
+		ERROR_GLIBC("calloc");
 		return -1;
 	}
 	for (i = 0; i < sections_nr; i++) {
@@ -341,33 +341,32 @@ static int read_sections(struct elf *elf)
 
 		s = elf_getscn(elf->elf, i);
 		if (!s) {
-			WARN_ELF("elf_getscn");
+			ERROR_ELF("elf_getscn");
 			return -1;
 		}
 
 		sec->idx = elf_ndxscn(s);
 
 		if (!gelf_getshdr(s, &sec->sh)) {
-			WARN_ELF("gelf_getshdr");
+			ERROR_ELF("gelf_getshdr");
 			return -1;
 		}
 
 		sec->name = elf_strptr(elf->elf, shstrndx, sec->sh.sh_name);
 		if (!sec->name) {
-			WARN_ELF("elf_strptr");
+			ERROR_ELF("elf_strptr");
 			return -1;
 		}
 
 		if (sec->sh.sh_size != 0 && !is_dwarf_section(sec)) {
 			sec->data = elf_getdata(s, NULL);
 			if (!sec->data) {
-				WARN_ELF("elf_getdata");
+				ERROR_ELF("elf_getdata");
 				return -1;
 			}
 			if (sec->data->d_off != 0 ||
 			    sec->data->d_size != sec->sh.sh_size) {
-				WARN("unexpected data attributes for %s",
-				     sec->name);
+				ERROR("unexpected data attributes for %s", sec->name);
 				return -1;
 			}
 		}
@@ -387,7 +386,7 @@ static int read_sections(struct elf *elf)
 
 	/* sanity check, one more call to elf_nextscn() should return NULL */
 	if (elf_nextscn(elf->elf, s)) {
-		WARN("section entry mismatch");
+		ERROR("section entry mismatch");
 		return -1;
 	}
 
@@ -467,7 +466,7 @@ static int read_symbols(struct elf *elf)
 
 	elf->symbol_data = calloc(symbols_nr, sizeof(*sym));
 	if (!elf->symbol_data) {
-		WARN_GLIBC("calloc");
+		ERROR_GLIBC("calloc");
 		return -1;
 	}
 	for (i = 0; i < symbols_nr; i++) {
@@ -477,14 +476,14 @@ static int read_symbols(struct elf *elf)
 
 		if (!gelf_getsymshndx(symtab->data, shndx_data, i, &sym->sym,
 				      &shndx)) {
-			WARN_ELF("gelf_getsymshndx");
+			ERROR_ELF("gelf_getsymshndx");
 			goto err;
 		}
 
 		sym->name = elf_strptr(elf->elf, symtab->sh.sh_link,
 				       sym->sym.st_name);
 		if (!sym->name) {
-			WARN_ELF("elf_strptr");
+			ERROR_ELF("elf_strptr");
 			goto err;
 		}
 
@@ -496,8 +495,7 @@ static int read_symbols(struct elf *elf)
 
 			sym->sec = find_section_by_index(elf, shndx);
 			if (!sym->sec) {
-				WARN("couldn't find section for symbol %s",
-				     sym->name);
+				ERROR("couldn't find section for symbol %s", sym->name);
 				goto err;
 			}
 			if (GELF_ST_TYPE(sym->sym.st_info) == STT_SECTION) {
@@ -536,8 +534,7 @@ static int read_symbols(struct elf *elf)
 			pnamelen = coldstr - sym->name;
 			pname = strndup(sym->name, pnamelen);
 			if (!pname) {
-				WARN("%s(): failed to allocate memory",
-				     sym->name);
+				ERROR("%s(): failed to allocate memory", sym->name);
 				return -1;
 			}
 
@@ -545,8 +542,7 @@ static int read_symbols(struct elf *elf)
 			free(pname);
 
 			if (!pfunc) {
-				WARN("%s(): can't find parent function",
-				     sym->name);
+				ERROR("%s(): can't find parent function", sym->name);
 				return -1;
 			}
 
@@ -613,14 +609,14 @@ static int elf_update_symbol(struct elf *elf, struct section *symtab,
 
 	s = elf_getscn(elf->elf, symtab->idx);
 	if (!s) {
-		WARN_ELF("elf_getscn");
+		ERROR_ELF("elf_getscn");
 		return -1;
 	}
 
 	if (symtab_shndx) {
 		t = elf_getscn(elf->elf, symtab_shndx->idx);
 		if (!t) {
-			WARN_ELF("elf_getscn");
+			ERROR_ELF("elf_getscn");
 			return -1;
 		}
 	}
@@ -643,7 +639,7 @@ static int elf_update_symbol(struct elf *elf, struct section *symtab,
 
 			if (idx) {
 				/* we don't do holes in symbol tables */
-				WARN("index out of range");
+				ERROR("index out of range");
 				return -1;
 			}
 
@@ -654,7 +650,7 @@ static int elf_update_symbol(struct elf *elf, struct section *symtab,
 
 			buf = calloc(num, entsize);
 			if (!buf) {
-				WARN("malloc");
+				ERROR_GLIBC("calloc");
 				return -1;
 			}
 
@@ -669,7 +665,7 @@ static int elf_update_symbol(struct elf *elf, struct section *symtab,
 			if (t) {
 				buf = calloc(num, sizeof(Elf32_Word));
 				if (!buf) {
-					WARN("malloc");
+					ERROR_GLIBC("calloc");
 					return -1;
 				}
 
@@ -687,7 +683,7 @@ static int elf_update_symbol(struct elf *elf, struct section *symtab,
 
 		/* empty blocks should not happen */
 		if (!symtab_data->d_size) {
-			WARN("zero size data");
+			ERROR("zero size data");
 			return -1;
 		}
 
@@ -702,7 +698,7 @@ static int elf_update_symbol(struct elf *elf, struct section *symtab,
 
 	/* something went side-ways */
 	if (idx < 0) {
-		WARN("negative index");
+		ERROR("negative index");
 		return -1;
 	}
 
@@ -714,13 +710,13 @@ static int elf_update_symbol(struct elf *elf, struct section *symtab,
 	} else {
 		sym->sym.st_shndx = SHN_XINDEX;
 		if (!shndx_data) {
-			WARN("no .symtab_shndx");
+			ERROR("no .symtab_shndx");
 			return -1;
 		}
 	}
 
 	if (!gelf_update_symshndx(symtab_data, shndx_data, idx, &sym->sym, shndx)) {
-		WARN_ELF("gelf_update_symshndx");
+		ERROR_ELF("gelf_update_symshndx");
 		return -1;
 	}
 
@@ -738,7 +734,7 @@ __elf_create_symbol(struct elf *elf, struct symbol *sym)
 	if (symtab) {
 		symtab_shndx = find_section_by_name(elf, ".symtab_shndx");
 	} else {
-		WARN("no .symtab");
+		ERROR("no .symtab");
 		return NULL;
 	}
 
@@ -760,7 +756,7 @@ __elf_create_symbol(struct elf *elf, struct symbol *sym)
 		old->idx = new_idx;
 
 		if (elf_update_symbol(elf, symtab, symtab_shndx, old)) {
-			WARN("elf_update_symbol move");
+			ERROR("elf_update_symbol move");
 			return NULL;
 		}
 
@@ -778,7 +774,7 @@ __elf_create_symbol(struct elf *elf, struct symbol *sym)
 non_local:
 	sym->idx = new_idx;
 	if (elf_update_symbol(elf, symtab, symtab_shndx, sym)) {
-		WARN("elf_update_symbol");
+		ERROR("elf_update_symbol");
 		return NULL;
 	}
 
@@ -799,7 +795,7 @@ elf_create_section_symbol(struct elf *elf, struct section *sec)
 	struct symbol *sym = calloc(1, sizeof(*sym));
 
 	if (!sym) {
-		WARN_GLIBC("malloc");
+		ERROR_GLIBC("malloc");
 		return NULL;
 	}
 
@@ -829,7 +825,7 @@ elf_create_prefix_symbol(struct elf *elf, struct symbol *orig, long size)
 	char *name = malloc(namelen);
 
 	if (!sym || !name) {
-		WARN_GLIBC("malloc");
+		ERROR_GLIBC("malloc");
 		return NULL;
 	}
 
@@ -858,16 +854,16 @@ static struct reloc *elf_init_reloc(struct elf *elf, struct section *rsec,
 	struct reloc *reloc, empty = { 0 };
 
 	if (reloc_idx >= sec_num_entries(rsec)) {
-		WARN("%s: bad reloc_idx %u for %s with %d relocs",
-		     __func__, reloc_idx, rsec->name, sec_num_entries(rsec));
+		ERROR("%s: bad reloc_idx %u for %s with %d relocs",
+		      __func__, reloc_idx, rsec->name, sec_num_entries(rsec));
 		return NULL;
 	}
 
 	reloc = &rsec->relocs[reloc_idx];
 
 	if (memcmp(reloc, &empty, sizeof(empty))) {
-		WARN("%s: %s: reloc %d already initialized!",
-		     __func__, rsec->name, reloc_idx);
+		ERROR("%s: %s: reloc %d already initialized!",
+		      __func__, rsec->name, reloc_idx);
 		return NULL;
 	}
 
@@ -896,8 +892,7 @@ struct reloc *elf_init_reloc_text_sym(struct elf *elf, struct section *sec,
 	int addend = insn_off;
 
 	if (!(insn_sec->sh.sh_flags & SHF_EXECINSTR)) {
-		WARN("bad call to %s() for data symbol %s",
-		     __func__, sym->name);
+		ERROR("bad call to %s() for data symbol %s", __func__, sym->name);
 		return NULL;
 	}
 
@@ -926,8 +921,7 @@ struct reloc *elf_init_reloc_data_sym(struct elf *elf, struct section *sec,
 				      s64 addend)
 {
 	if (sym->sec && (sec->sh.sh_flags & SHF_EXECINSTR)) {
-		WARN("bad call to %s() for text symbol %s",
-		     __func__, sym->name);
+		ERROR("bad call to %s() for text symbol %s", __func__, sym->name);
 		return NULL;
 	}
 
@@ -953,8 +947,7 @@ static int read_relocs(struct elf *elf)
 
 		rsec->base = find_section_by_index(elf, rsec->sh.sh_info);
 		if (!rsec->base) {
-			WARN("can't find base section for reloc section %s",
-			     rsec->name);
+			ERROR("can't find base section for reloc section %s", rsec->name);
 			return -1;
 		}
 
@@ -963,7 +956,7 @@ static int read_relocs(struct elf *elf)
 		nr_reloc = 0;
 		rsec->relocs = calloc(sec_num_entries(rsec), sizeof(*reloc));
 		if (!rsec->relocs) {
-			WARN_GLIBC("calloc");
+			ERROR_GLIBC("calloc");
 			return -1;
 		}
 		for (i = 0; i < sec_num_entries(rsec); i++) {
@@ -973,8 +966,7 @@ static int read_relocs(struct elf *elf)
 			symndx = reloc_sym(reloc);
 			reloc->sym = sym = find_symbol_by_index(elf, symndx);
 			if (!reloc->sym) {
-				WARN("can't find reloc entry symbol %d for %s",
-				     symndx, rsec->name);
+				ERROR("can't find reloc entry symbol %d for %s", symndx, rsec->name);
 				return -1;
 			}
 
@@ -1005,7 +997,7 @@ struct elf *elf_open_read(const char *name, int flags)
 
 	elf = malloc(sizeof(*elf));
 	if (!elf) {
-		WARN_GLIBC("malloc");
+		ERROR_GLIBC("malloc");
 		return NULL;
 	}
 	memset(elf, 0, sizeof(*elf));
@@ -1028,12 +1020,12 @@ struct elf *elf_open_read(const char *name, int flags)
 
 	elf->elf = elf_begin(elf->fd, cmd, NULL);
 	if (!elf->elf) {
-		WARN_ELF("elf_begin");
+		ERROR_ELF("elf_begin");
 		goto err;
 	}
 
 	if (!gelf_getehdr(elf->elf, &elf->ehdr)) {
-		WARN_ELF("gelf_getehdr");
+		ERROR_ELF("gelf_getehdr");
 		goto err;
 	}
 
@@ -1062,19 +1054,19 @@ static int elf_add_string(struct elf *elf, struct section *strtab, char *str)
 	if (!strtab)
 		strtab = find_section_by_name(elf, ".strtab");
 	if (!strtab) {
-		WARN("can't find .strtab section");
+		ERROR("can't find .strtab section");
 		return -1;
 	}
 
 	s = elf_getscn(elf->elf, strtab->idx);
 	if (!s) {
-		WARN_ELF("elf_getscn");
+		ERROR_ELF("elf_getscn");
 		return -1;
 	}
 
 	data = elf_newdata(s);
 	if (!data) {
-		WARN_ELF("elf_newdata");
+		ERROR_ELF("elf_newdata");
 		return -1;
 	}
 
@@ -1099,7 +1091,7 @@ struct section *elf_create_section(struct elf *elf, const char *name,
 
 	sec = malloc(sizeof(*sec));
 	if (!sec) {
-		WARN_GLIBC("malloc");
+		ERROR_GLIBC("malloc");
 		return NULL;
 	}
 	memset(sec, 0, sizeof(*sec));
@@ -1108,13 +1100,13 @@ struct section *elf_create_section(struct elf *elf, const char *name,
 
 	s = elf_newscn(elf->elf);
 	if (!s) {
-		WARN_ELF("elf_newscn");
+		ERROR_ELF("elf_newscn");
 		return NULL;
 	}
 
 	sec->name = strdup(name);
 	if (!sec->name) {
-		WARN_GLIBC("strdup");
+		ERROR_GLIBC("strdup");
 		return NULL;
 	}
 
@@ -1122,7 +1114,7 @@ struct section *elf_create_section(struct elf *elf, const char *name,
 
 	sec->data = elf_newdata(s);
 	if (!sec->data) {
-		WARN_ELF("elf_newdata");
+		ERROR_ELF("elf_newdata");
 		return NULL;
 	}
 
@@ -1132,14 +1124,14 @@ struct section *elf_create_section(struct elf *elf, const char *name,
 	if (size) {
 		sec->data->d_buf = malloc(size);
 		if (!sec->data->d_buf) {
-			WARN_GLIBC("malloc");
+			ERROR_GLIBC("malloc");
 			return NULL;
 		}
 		memset(sec->data->d_buf, 0, size);
 	}
 
 	if (!gelf_getshdr(s, &sec->sh)) {
-		WARN_ELF("gelf_getshdr");
+		ERROR_ELF("gelf_getshdr");
 		return NULL;
 	}
 
@@ -1154,7 +1146,7 @@ struct section *elf_create_section(struct elf *elf, const char *name,
 	if (!shstrtab)
 		shstrtab = find_section_by_name(elf, ".strtab");
 	if (!shstrtab) {
-		WARN("can't find .shstrtab or .strtab section");
+		ERROR("can't find .shstrtab or .strtab section");
 		return NULL;
 	}
 	sec->sh.sh_name = elf_add_string(elf, shstrtab, sec->name);
@@ -1179,7 +1171,7 @@ static struct section *elf_create_rela_section(struct elf *elf,
 
 	rsec_name = malloc(strlen(sec->name) + strlen(".rela") + 1);
 	if (!rsec_name) {
-		WARN_GLIBC("malloc");
+		ERROR_GLIBC("malloc");
 		return NULL;
 	}
 	strcpy(rsec_name, ".rela");
@@ -1199,7 +1191,7 @@ static struct section *elf_create_rela_section(struct elf *elf,
 
 	rsec->relocs = calloc(sec_num_entries(rsec), sizeof(struct reloc));
 	if (!rsec->relocs) {
-		WARN_GLIBC("calloc");
+		ERROR_GLIBC("calloc");
 		return NULL;
 	}
 
@@ -1232,7 +1224,7 @@ int elf_write_insn(struct elf *elf, struct section *sec,
 	Elf_Data *data = sec->data;
 
 	if (data->d_type != ELF_T_BYTE || data->d_off) {
-		WARN("write to unexpected data for section: %s", sec->name);
+		ERROR("write to unexpected data for section: %s", sec->name);
 		return -1;
 	}
 
@@ -1261,7 +1253,7 @@ static int elf_truncate_section(struct elf *elf, struct section *sec)
 
 	s = elf_getscn(elf->elf, sec->idx);
 	if (!s) {
-		WARN_ELF("elf_getscn");
+		ERROR_ELF("elf_getscn");
 		return -1;
 	}
 
@@ -1271,7 +1263,7 @@ static int elf_truncate_section(struct elf *elf, struct section *sec)
 
 		if (!data) {
 			if (size) {
-				WARN("end of section data but non-zero size left\n");
+				ERROR("end of section data but non-zero size left\n");
 				return -1;
 			}
 			return 0;
@@ -1279,12 +1271,12 @@ static int elf_truncate_section(struct elf *elf, struct section *sec)
 
 		if (truncated) {
 			/* when we remove symbols */
-			WARN("truncated; but more data\n");
+			ERROR("truncated; but more data\n");
 			return -1;
 		}
 
 		if (!data->d_size) {
-			WARN("zero size data");
+			ERROR("zero size data");
 			return -1;
 		}
 
@@ -1310,13 +1302,13 @@ int elf_write(struct elf *elf)
 		if (sec_changed(sec)) {
 			s = elf_getscn(elf->elf, sec->idx);
 			if (!s) {
-				WARN_ELF("elf_getscn");
+				ERROR_ELF("elf_getscn");
 				return -1;
 			}
 
 			/* Note this also flags the section dirty */
 			if (!gelf_update_shdr(s, &sec->sh)) {
-				WARN_ELF("gelf_update_shdr");
+				ERROR_ELF("gelf_update_shdr");
 				return -1;
 			}
 
@@ -1329,7 +1321,7 @@ int elf_write(struct elf *elf)
 
 	/* Write all changes to the file. */
 	if (elf_update(elf->elf, ELF_C_WRITE) < 0) {
-		WARN_ELF("elf_update");
+		ERROR_ELF("elf_update");
 		return -1;
 	}
 
diff --git a/tools/objtool/include/objtool/warn.h b/tools/objtool/include/objtool/warn.h
index e3ad9b2caf87..cb8fe846d9dd 100644
--- a/tools/objtool/include/objtool/warn.h
+++ b/tools/objtool/include/objtool/warn.h
@@ -42,26 +42,43 @@ static inline char *offstr(struct section *sec, unsigned long offset)
 	return str;
 }
 
-#define WARN(format, ...)				\
-	fprintf(stderr,					\
-		"%s%s%s: objtool: " format "\n",	\
-		objname ?: "",				\
-		objname ? ": " : "",			\
-		opts.werror ? "error" : "warning",	\
+#define ___WARN(severity, extra, format, ...)				\
+	fprintf(stderr,							\
+		"%s%s%s: objtool" extra ": " format "\n",		\
+		objname ?: "",						\
+		objname ? ": " : "",					\
+		severity,						\
 		##__VA_ARGS__)
 
-#define WARN_FUNC(format, sec, offset, ...)		\
-({							\
-	char *_str = offstr(sec, offset);		\
-	WARN("%s: " format, _str, ##__VA_ARGS__);	\
-	free(_str);					\
+#define __WARN(severity, format, ...)					\
+	___WARN(severity, "", format, ##__VA_ARGS__)
+
+#define __WARN_LINE(severity, format, ...)				\
+	___WARN(severity, " [%s:%d]", format, __FILE__, __LINE__, ##__VA_ARGS__)
+
+#define __WARN_ELF(severity, format, ...)				\
+	__WARN_LINE(severity, "%s: " format " failed: %s", __func__, ##__VA_ARGS__, elf_errmsg(-1))
+
+#define __WARN_GLIBC(severity, format, ...)				\
+	__WARN_LINE(severity, "%s: " format " failed: %s", __func__, ##__VA_ARGS__, strerror(errno))
+
+#define __WARN_FUNC(severity, sec, offset, format, ...)			\
+({									\
+	char *_str = offstr(sec, offset);				\
+	__WARN(severity, "%s: " format, _str, ##__VA_ARGS__);		\
+	free(_str);							\
 })
 
+#define WARN_STR (opts.werror ? "error" : "warning")
+
+#define WARN(format, ...) __WARN(WARN_STR, format, ##__VA_ARGS__)
+#define WARN_FUNC(sec, offset, format, ...) __WARN_FUNC(WARN_STR, sec, offset, format, ##__VA_ARGS__)
+
 #define WARN_INSN(insn, format, ...)					\
 ({									\
 	struct instruction *_insn = (insn);				\
 	if (!_insn->sym || !_insn->sym->warned)				\
-		WARN_FUNC(format, _insn->sec, _insn->offset,		\
+		WARN_FUNC(_insn->sec, _insn->offset, format,		\
 			  ##__VA_ARGS__);				\
 	if (_insn->sym)							\
 		_insn->sym->warned = 1;					\
@@ -77,10 +94,12 @@ static inline char *offstr(struct section *sec, unsigned long offset)
 	}							\
 })
 
-#define WARN_ELF(format, ...)					\
-	WARN("%s: " format " failed: %s", __func__, ##__VA_ARGS__, elf_errmsg(-1))
+#define ERROR_STR "error"
 
-#define WARN_GLIBC(format, ...)					\
-	WARN("%s: " format " failed: %s", __func__, ##__VA_ARGS__, strerror(errno))
+#define ERROR(format, ...) __WARN(ERROR_STR, format, ##__VA_ARGS__)
+#define ERROR_ELF(format, ...) __WARN_ELF(ERROR_STR, format, ##__VA_ARGS__)
+#define ERROR_GLIBC(format, ...) __WARN_GLIBC(ERROR_STR, format, ##__VA_ARGS__)
+#define ERROR_FUNC(sec, offset, format, ...) __WARN_FUNC(ERROR_STR, sec, offset, format, ##__VA_ARGS__)
+#define ERROR_INSN(insn, format, ...) WARN_FUNC(insn->sec, insn->offset, format, ##__VA_ARGS__)
 
 #endif /* _WARN_H */
diff --git a/tools/objtool/objtool.c b/tools/objtool/objtool.c
index e4b49c534e4d..5c8b974ad0f9 100644
--- a/tools/objtool/objtool.c
+++ b/tools/objtool/objtool.c
@@ -23,7 +23,7 @@ static struct objtool_file file;
 struct objtool_file *objtool_open_read(const char *filename)
 {
 	if (file.elf) {
-		WARN("won't handle more than one file at a time");
+		ERROR("won't handle more than one file at a time");
 		return NULL;
 	}
 
@@ -50,7 +50,7 @@ int objtool_pv_add(struct objtool_file *f, int idx, struct symbol *func)
 		return 0;
 
 	if (!f->pv_ops) {
-		WARN("paravirt confusion");
+		ERROR("paravirt confusion");
 		return -1;
 	}
 
diff --git a/tools/objtool/orc_dump.c b/tools/objtool/orc_dump.c
index 05ef0e297837..1dd9fc18fe62 100644
--- a/tools/objtool/orc_dump.c
+++ b/tools/objtool/orc_dump.c
@@ -36,47 +36,47 @@ int orc_dump(const char *filename)
 
 	elf = elf_begin(fd, ELF_C_READ_MMAP, NULL);
 	if (!elf) {
-		WARN_ELF("elf_begin");
+		ERROR_ELF("elf_begin");
 		return -1;
 	}
 
 	if (!elf64_getehdr(elf)) {
-		WARN_ELF("elf64_getehdr");
+		ERROR_ELF("elf64_getehdr");
 		return -1;
 	}
 	memcpy(&dummy_elf.ehdr, elf64_getehdr(elf), sizeof(dummy_elf.ehdr));
 
 	if (elf_getshdrnum(elf, &nr_sections)) {
-		WARN_ELF("elf_getshdrnum");
+		ERROR_ELF("elf_getshdrnum");
 		return -1;
 	}
 
 	if (elf_getshdrstrndx(elf, &shstrtab_idx)) {
-		WARN_ELF("elf_getshdrstrndx");
+		ERROR_ELF("elf_getshdrstrndx");
 		return -1;
 	}
 
 	for (i = 0; i < nr_sections; i++) {
 		scn = elf_getscn(elf, i);
 		if (!scn) {
-			WARN_ELF("elf_getscn");
+			ERROR_ELF("elf_getscn");
 			return -1;
 		}
 
 		if (!gelf_getshdr(scn, &sh)) {
-			WARN_ELF("gelf_getshdr");
+			ERROR_ELF("gelf_getshdr");
 			return -1;
 		}
 
 		name = elf_strptr(elf, shstrtab_idx, sh.sh_name);
 		if (!name) {
-			WARN_ELF("elf_strptr");
+			ERROR_ELF("elf_strptr");
 			return -1;
 		}
 
 		data = elf_getdata(scn, NULL);
 		if (!data) {
-			WARN_ELF("elf_getdata");
+			ERROR_ELF("elf_getdata");
 			return -1;
 		}
 
@@ -99,7 +99,7 @@ int orc_dump(const char *filename)
 		return 0;
 
 	if (orc_size % sizeof(*orc) != 0) {
-		WARN("bad .orc_unwind section size");
+		ERROR("bad .orc_unwind section size");
 		return -1;
 	}
 
@@ -107,36 +107,36 @@ int orc_dump(const char *filename)
 	for (i = 0; i < nr_entries; i++) {
 		if (rela_orc_ip) {
 			if (!gelf_getrela(rela_orc_ip, i, &rela)) {
-				WARN_ELF("gelf_getrela");
+				ERROR_ELF("gelf_getrela");
 				return -1;
 			}
 
 			if (!gelf_getsym(symtab, GELF_R_SYM(rela.r_info), &sym)) {
-				WARN_ELF("gelf_getsym");
+				ERROR_ELF("gelf_getsym");
 				return -1;
 			}
 
 			if (GELF_ST_TYPE(sym.st_info) == STT_SECTION) {
 				scn = elf_getscn(elf, sym.st_shndx);
 				if (!scn) {
-					WARN_ELF("elf_getscn");
+					ERROR_ELF("elf_getscn");
 					return -1;
 				}
 
 				if (!gelf_getshdr(scn, &sh)) {
-					WARN_ELF("gelf_getshdr");
+					ERROR_ELF("gelf_getshdr");
 					return -1;
 				}
 
 				name = elf_strptr(elf, shstrtab_idx, sh.sh_name);
 				if (!name) {
-					WARN_ELF("elf_strptr");
+					ERROR_ELF("elf_strptr");
 					return -1;
 				}
 			} else {
 				name = elf_strptr(elf, strtab_idx, sym.st_name);
 				if (!name) {
-					WARN_ELF("elf_strptr");
+					ERROR_ELF("elf_strptr");
 					return -1;
 				}
 			}
diff --git a/tools/objtool/special.c b/tools/objtool/special.c
index 6cd7b1be5331..c80fed8a840e 100644
--- a/tools/objtool/special.c
+++ b/tools/objtool/special.c
@@ -86,7 +86,7 @@ static int get_alt_entry(struct elf *elf, const struct special_entry *entry,
 
 	orig_reloc = find_reloc_by_dest(elf, sec, offset + entry->orig);
 	if (!orig_reloc) {
-		WARN_FUNC("can't find orig reloc", sec, offset + entry->orig);
+		ERROR_FUNC(sec, offset + entry->orig, "can't find orig reloc");
 		return -1;
 	}
 
@@ -97,8 +97,7 @@ static int get_alt_entry(struct elf *elf, const struct special_entry *entry,
 	if (!entry->group || alt->new_len) {
 		new_reloc = find_reloc_by_dest(elf, sec, offset + entry->new);
 		if (!new_reloc) {
-			WARN_FUNC("can't find new reloc",
-				  sec, offset + entry->new);
+			ERROR_FUNC(sec, offset + entry->new, "can't find new reloc");
 			return -1;
 		}
 
@@ -114,8 +113,7 @@ static int get_alt_entry(struct elf *elf, const struct special_entry *entry,
 
 		key_reloc = find_reloc_by_dest(elf, sec, offset + entry->key);
 		if (!key_reloc) {
-			WARN_FUNC("can't find key reloc",
-				  sec, offset + entry->key);
+			ERROR_FUNC(sec, offset + entry->key, "can't find key reloc");
 			return -1;
 		}
 		alt->key_addend = reloc_addend(key_reloc);
@@ -145,8 +143,7 @@ int special_get_alts(struct elf *elf, struct list_head *alts)
 			continue;
 
 		if (sec->sh.sh_size % entry->size != 0) {
-			WARN("%s size not a multiple of %d",
-			     sec->name, entry->size);
+			ERROR("%s size not a multiple of %d", sec->name, entry->size);
 			return -1;
 		}
 
@@ -155,7 +152,7 @@ int special_get_alts(struct elf *elf, struct list_head *alts)
 		for (idx = 0; idx < nr_entries; idx++) {
 			alt = malloc(sizeof(*alt));
 			if (!alt) {
-				WARN("malloc failed");
+				ERROR_GLIBC("malloc failed");
 				return -1;
 			}
 			memset(alt, 0, sizeof(*alt));
-- 
2.48.1

