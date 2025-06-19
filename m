Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7208B28B4F2
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345040; cv=none; b=jRr/omXXoDEnPUudVsntanNhXHkOkERJz70I1Vh8/3kAHOdq4MygPnB1aM7v0fYYhXOwqjQy02qcZIsAOvxoTCXgpQGh7NHWY4oOvLpkDWJHyt3yoJcGvC16uJ5Zb8mi/Ki4owgJm4dgQxo0NQ1I4ovxzr3yINRT2BxYnMO8+OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345040; c=relaxed/simple;
	bh=SgcRfC4aLbauEp7YDUkXfpOYuYCnNeh7MBOxK1mnaao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HZ8OKFpzGyvDjwr/PlfoJvv0t10stlR/Fvp+Bxn39loqTeeYacvvM9at7uHtnhMkJZR0/p4zTXxD1iWh5NVmjzbVWy8tjIx+9B0TMuA/df12ffFWcy+quGQ1uJKje0pjNVX0Aoe/efDYRSbjeSvi9xAX14XIEqLbNjByUVbIOtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VhPh6gpP; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VhPh6gpP"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEMdn4014981;
	Thu, 19 Jun 2025 14:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=W91GK
	Csq6/X9c64SiyrF6Zzc+6MbOcraJ+NMsQwVfGU=; b=VhPh6gpP/Yx7SKt2NhC5z
	LynDUGAcELynE8+5hMfvnr+bMSm+nEw+y6wTnnPn7Umtx+hZEQUqgPklP/jY11nA
	28FUGk+BzUZx1XKEzPRCkqP5L1UyU0Jv6GXZRR99ZD8I4Ote+qzgckIVA3BxYwtp
	3MjI/E2ub8hd82DQ6Ft9sJVMaomRFhrPvmaEqFXd5Gi6MJeGc6rP/DIqm2MDFl3G
	ntRrWCsuzuBwfOzFfbOvsqFopw015UR6IJcCphQtVLVdISA8A678c9W8okVgPCzz
	sJxGNdX1OxuuOAsbAoCvM27WQcGMYgHxtpwcotwSRLaIt3Lhx6XnHTumrpqMn3Xc
	A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4t4ar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDLUju022936;
	Thu, 19 Jun 2025 14:57:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhj8dwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:07 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55JEv0JJ008257;
	Thu, 19 Jun 2025 14:57:06 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-180-74.vpn.oracle.com [10.154.180.74])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 478yhj8dta-6;
	Thu, 19 Jun 2025 14:57:06 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC PATCH v2 05/17] objtool: Print symbol during disassembly
Date: Thu, 19 Jun 2025 16:56:47 +0200
Message-ID: <20250619145659.1377970-6-alexandre.chartre@oracle.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEyMiBTYWx0ZWRfXyLESDSrI/bwm ZpZC5fmH56IvMcGK6HRXeN0geIVMDUF2lB/dFqcuiAIoEn6dPNECoed/r52sp6czgVMnzTwY6Hf HbxOEGsuePxg+jf5WbEr4xkiGRe421MaSZCOR0migt4Rfr4yjEw8sX8f2/R43OohZn/LUvWdNXD
 /b52365gwuaGfj33uL2ZIKQldYjxnGSTe955E4ah/wYr5SMZWs8TkZfqP3C+Nuu9ToUfbuMUQb0 Ixowvk00NdkaMbiYQ4sdpkLZ2wpqMs1WM7SHGXiDOLElpW+H5Edni8/rXP9xpfMGObmWXv7R7mj TeO3k0ek53cWGuyTguh31yruF8iss9VOeEnFEYCY2VvPUnEL8mkrjwuCYpENAgQW3JQ2aJ8onWN
 IEfBKA76GGXGJ8vAWmedWF+VuSB5vx0sUW7w2vdIPVK3c0VK2fYksx4JRaXlEfNRtQVxvZ4Y
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=68542544 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=zIsJDVpacxTNcREixn4A:9 cc=ntf awl=host:13207
X-Proofpoint-GUID: BzYGDTfcqkRGztY91Z7o9GS5bR8LSucs
X-Proofpoint-ORIG-GUID: BzYGDTfcqkRGztY91Z7o9GS5bR8LSucs

Print symbols referenced during disassembly instead of just printing
raw addresses. Also handle address relocation.

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/objtool/arch/loongarch/decode.c |  7 +++
 tools/objtool/arch/powerpc/decode.c   |  7 +++
 tools/objtool/arch/x86/decode.c       | 14 +++++
 tools/objtool/check.c                 |  9 ---
 tools/objtool/disas.c                 | 89 +++++++++++++++++++++++++++
 tools/objtool/include/objtool/arch.h  |  2 +
 tools/objtool/include/objtool/check.h |  9 +++
 tools/objtool/include/objtool/warn.h  | 12 ++++
 8 files changed, 140 insertions(+), 9 deletions(-)

diff --git a/tools/objtool/arch/loongarch/decode.c b/tools/objtool/arch/loongarch/decode.c
index 5bf383e7e2e5..09c43f008c9a 100644
--- a/tools/objtool/arch/loongarch/decode.c
+++ b/tools/objtool/arch/loongarch/decode.c
@@ -28,6 +28,13 @@ bool arch_pc_relative_reloc(struct reloc *reloc)
 	return false;
 }
 
+unsigned long arch_pc_relative_offset(struct instruction *insn,
+				      struct reloc *reloc)
+{
+	/* no PC relative relocation */
+	return 0;
+}
+
 bool arch_callee_saved_reg(unsigned char reg)
 {
 	switch (reg) {
diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
index 3c6fced37bcc..9c3f49c45587 100644
--- a/tools/objtool/arch/powerpc/decode.c
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -20,6 +20,13 @@ unsigned long arch_dest_reloc_offset(int addend)
 	return addend;
 }
 
+unsigned long arch_pc_relative_offset(struct instruction *insn,
+				      struct reloc *reloc)
+{
+	/* no PC relative relocation */
+	return 0;
+}
+
 bool arch_callee_saved_reg(unsigned char reg)
 {
 	return false;
diff --git a/tools/objtool/arch/x86/decode.c b/tools/objtool/arch/x86/decode.c
index 3c85506f9414..6a39cc619d63 100644
--- a/tools/objtool/arch/x86/decode.c
+++ b/tools/objtool/arch/x86/decode.c
@@ -103,6 +103,20 @@ bool arch_pc_relative_reloc(struct reloc *reloc)
 	return false;
 }
 
+unsigned long arch_pc_relative_offset(struct instruction *insn,
+				      struct reloc *reloc)
+{
+	/*
+	 * Relocation information for a RIP-relative instruction is
+	 * based on the RIP value at the end of the instruction. So
+	 * to get the effective relocated address, the reference has
+	 * to be adjusted with the number of bytes between the
+	 * relocation offset and the end of the instruction.
+	 */
+	return reloc_addend(reloc) +
+		insn->offset + insn->len - reloc_offset(reloc);
+}
+
 #define ADD_OP(op) \
 	if (!(op = calloc(1, sizeof(*op)))) \
 		return -1; \
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 8ba69e0c273b..a4d0a6c62bc0 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -132,15 +132,6 @@ static struct instruction *prev_insn_same_sym(struct objtool_file *file,
 	for (insn = next_insn_same_sec(file, insn); insn;		\
 	     insn = next_insn_same_sec(file, insn))
 
-static inline struct symbol *insn_call_dest(struct instruction *insn)
-{
-	if (insn->type == INSN_JUMP_DYNAMIC ||
-	    insn->type == INSN_CALL_DYNAMIC)
-		return NULL;
-
-	return insn->_call_dest;
-}
-
 static inline struct reloc *insn_jump_table(struct instruction *insn)
 {
 	if (insn->type == INSN_JUMP_DYNAMIC ||
diff --git a/tools/objtool/disas.c b/tools/objtool/disas.c
index 9fead6281102..91d23f7518e3 100644
--- a/tools/objtool/disas.c
+++ b/tools/objtool/disas.c
@@ -14,10 +14,96 @@
 
 struct disas_context {
 	struct objtool_file *file;
+	struct instruction *insn;
 	disassembler_ftype disassembler;
 	struct disassemble_info info;
 };
 
+#define DINFO_FPRINTF(dinfo, ...)	\
+	((*(dinfo)->fprintf_func)((dinfo)->stream, __VA_ARGS__))
+
+static void disas_print_address(bfd_vma addr, struct disassemble_info *dinfo)
+{
+	struct disas_context *dctx = dinfo->application_data;
+	struct instruction *insn = dctx->insn;
+	struct objtool_file *file = dctx->file;
+	struct instruction *jump_dest;
+	struct symbol *call_dest;
+	unsigned long offset;
+	struct reloc *reloc;
+	bool is_reloc;
+	char symstr[1024];
+	char *str;
+
+	/*
+	 * If the instruction is a call/jump and it references a
+	 * destination then this is likely the address we are looking
+	 * up. So check it first.
+	 */
+	jump_dest = insn->jump_dest;
+	if (jump_dest && jump_dest->sym && jump_dest->offset == addr) {
+		sprint_name(symstr, jump_dest->sym->name, jump_dest->offset - jump_dest->sym->offset);
+		DINFO_FPRINTF(dinfo, "%lx <%s>", addr, symstr);
+		return;
+	}
+
+	/*
+	 * Assume the address is a relocation if it points to the next
+	 * instruction.
+	 */
+	is_reloc = (addr == insn->offset + insn->len);
+
+	/*
+	 * The call destination offset can be the address we are looking
+	 * up, or 0 if there is a relocation.
+	 */
+	call_dest = insn_call_dest(insn);
+	if (call_dest) {
+		if (call_dest->offset == addr) {
+			DINFO_FPRINTF(dinfo, "%lx <%s>", addr, call_dest->name);
+			return;
+		}
+		if (call_dest->offset == 0 && is_reloc) {
+			DINFO_FPRINTF(dinfo, "%s", call_dest->name);
+			return;
+		}
+	}
+
+	if (!is_reloc) {
+		DINFO_FPRINTF(dinfo, "0x%lx", addr);
+		return;
+	}
+
+	/*
+	 * If this is a relocation, check if we have relocation information
+	 * for this instruction.
+	 */
+	reloc = find_reloc_by_dest_range(file->elf, insn->sec,
+					 insn->offset, insn->len);
+	if (!reloc) {
+		DINFO_FPRINTF(dinfo, "0x%lx", addr);
+		return;
+	}
+
+	if (arch_pc_relative_reloc(reloc))
+		offset = arch_pc_relative_offset(insn, reloc);
+	else
+		offset = reloc_addend(reloc);
+
+	/*
+	 * If the relocation symbol is a section name (for example ".bss")
+	 * then we try to further resolve the name.
+	 */
+	if (reloc->sym->type == STT_SECTION) {
+		str = offstr(reloc->sym->sec, reloc->sym->offset + offset);
+		DINFO_FPRINTF(dinfo, "%s", str);
+		free(str);
+	} else {
+		sprint_name(symstr, reloc->sym->name, offset);
+		DINFO_FPRINTF(dinfo, "%s", symstr);
+	}
+}
+
 /*
  * Initialize disassemble info arch, mach (32 or 64-bit) and options.
  */
@@ -66,6 +152,7 @@ struct disas_context *disas_context_create(struct objtool_file *file)
 				     fprintf_styled);
 
 	dinfo->read_memory_func = buffer_read_memory;
+	dinfo->print_address_func = disas_print_address;
 	dinfo->application_data = dctx;
 
 	/*
@@ -118,6 +205,8 @@ static size_t disas_insn(struct disas_context *dctx,
 	disassembler_ftype disasm = dctx->disassembler;
 	struct disassemble_info *dinfo = &dctx->info;
 
+	dctx->insn = insn;
+
 	/*
 	 * Set the disassembler buffer to read data from the section
 	 * containing the instruction to disassemble.
diff --git a/tools/objtool/include/objtool/arch.h b/tools/objtool/include/objtool/arch.h
index 19b1dec2db15..baa6eee1977f 100644
--- a/tools/objtool/include/objtool/arch.h
+++ b/tools/objtool/include/objtool/arch.h
@@ -97,6 +97,8 @@ bool arch_is_embedded_insn(struct symbol *sym);
 int arch_rewrite_retpolines(struct objtool_file *file);
 
 bool arch_pc_relative_reloc(struct reloc *reloc);
+unsigned long arch_pc_relative_offset(struct instruction *insn,
+				      struct reloc *reloc);
 
 unsigned int arch_reloc_size(struct reloc *reloc);
 unsigned long arch_jump_table_sym_offset(struct reloc *reloc, struct reloc *table);
diff --git a/tools/objtool/include/objtool/check.h b/tools/objtool/include/objtool/check.h
index 5290ac1ebbc1..4adbcd760c6f 100644
--- a/tools/objtool/include/objtool/check.h
+++ b/tools/objtool/include/objtool/check.h
@@ -115,6 +115,15 @@ static inline bool is_jump(struct instruction *insn)
 	return is_static_jump(insn) || is_dynamic_jump(insn);
 }
 
+static inline struct symbol *insn_call_dest(struct instruction *insn)
+{
+	if (insn->type == INSN_JUMP_DYNAMIC ||
+	    insn->type == INSN_CALL_DYNAMIC)
+		return NULL;
+
+	return insn->_call_dest;
+}
+
 struct instruction *find_insn(struct objtool_file *file,
 			      struct section *sec, unsigned long offset);
 
diff --git a/tools/objtool/include/objtool/warn.h b/tools/objtool/include/objtool/warn.h
index cb8fe846d9dd..125093d568be 100644
--- a/tools/objtool/include/objtool/warn.h
+++ b/tools/objtool/include/objtool/warn.h
@@ -17,6 +17,18 @@
 
 extern const char *objname;
 
+static inline int sprint_name(char *str, const char *name, unsigned long offset)
+{
+	int len;
+
+	if (offset)
+		len = sprintf(str, "%s+0x%lx", name, offset);
+	else
+		len = sprintf(str, "%s", name);
+
+	return len;
+}
+
 static inline char *offstr(struct section *sec, unsigned long offset)
 {
 	bool is_text = (sec->sh.sh_flags & SHF_EXECINSTR);
-- 
2.43.5

