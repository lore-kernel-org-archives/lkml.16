Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA206289E03
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224100; cv=none; b=Ot08UxKCu0S7IuGt17ObFRlMVncM0/1zV85sQGq7QwuoZxTX2SoNFPzf8/J0k1wYIaFA2LkBTER8EmlTLO1ijf4ArGK5apLMoIkZ0jEShKJ9r0tp3fagXEs7DS0xKNpUqFX4Na1c//Io4ePiJJTRQYXq9vul4z1prZZMB97Fndk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224100; c=relaxed/simple;
	bh=7s1S+tY477XcZ2hoynSKzaGJovL0nWx0gUoFfx5bI9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ELvVGEoDZoM6lhG0veU6hKiX1voJtZVAMXUQgLHO86ulnVeWBSYpymYM1oDlOJUuxxVvvJAKrdgN2LuryduHFLCwFhAv2eiKC1U31r2lU1kVmUlJo6FfxT0A2KIpnFRbHJXhi6dAtaOISBJlrVtBbEtff1zs6axzEaxbO8IB5e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=V2j+fAD6; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="V2j+fAD6"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565MY8A030076;
	Fri, 6 Jun 2025 15:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=vDQhR
	jq/WXJAo/D85QYcbbaMFMBUxMy1kZmMNHPiQAU=; b=V2j+fAD66bUGws5IsGJLs
	g6Z8Ieh3tosA/1LJ5d+gJuU0GhVOfPCrxQUqTr7REUY/9N8H47U+4OtusJSGBDd+
	7y3WaQtd08oiXiY00HQb9Leo/PsmMLSI4dNRkQaWjFUw8YjumfrH5euqri1+dvKK
	OevwBroX8fwZZQg9XyIBnr1ZXUFDu+Df1h/klFJGOFWv+qPIl0bGEQDaSucZUKKY
	wjxd4NQQWdljClzc8nkvhtgyixZQo/G80DuAHob8ZvYrnxQ/T8unAF7uxK203l9d
	cNgmxp75Z1nNGFb+f1tidfZ5aqpC7i0jukl2nuSJfhoOmP5YKxDiH6fNjH6T55EQ
	w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8e086t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:34:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 556E22Od038561;
	Fri, 6 Jun 2025 15:34:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7des7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:34:52 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 556FYh3l015517;
	Fri, 6 Jun 2025 15:34:52 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-187-118.vpn.oracle.com [10.154.187.118])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 46yr7des15-5;
	Fri, 06 Jun 2025 15:34:51 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC 04/13] objtool: Print symbol during disassembly
Date: Fri,  6 Jun 2025 17:34:31 +0200
Message-ID: <20250606153440.865808-5-alexandre.chartre@oracle.com>
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
X-Authority-Analysis: v=2.4 cv=Va/3PEp9 c=1 sm=1 tr=0 ts=68430a9d cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=GRtY48bZnyd7kpkPou0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEzNyBTYWx0ZWRfX/mVhWij6uIrt g4rFDULjrolbqeI88a9IH/6SXZyUocAutCEo+iRk0O7nYeoVRq9/azBkknM8mRBl47xcFY1HzFC +V1pzuUplWKMuDMHAXFloTBh0ZqjOnlshyZum5/MMNfog7kxTakALRMxMvsvS4JYszmjA7ItOng
 pOYd462cLruDvooJlJcdC4ACoQmIhRSi7/4ZWI2vQ9biSdvWc4l46o6aDbwuMmGRsm5/6IyEcnp b8NXzUeARVjYxq4xyCFVhW2dhbDVxsuNEuJkVqnXS1BpMdbPOCBx96fTPxDwxetnDh6G+17WKWc fP0/VITR50eKw0e9AiuDurjoqmZIE/BlTKLzreEtTsi7W94BlvE0fSUO+2SvY75jjGOZM7S/QhE
 3cyiGyYj8UAM5C6MyWReN9TIMi4rtCPs8/9TBF7lkbgFyLzUdxxaNRxlcNJimbBUCdYQB5nC
X-Proofpoint-ORIG-GUID: sKFFsyCCLaCiCk3wJKJ9GCWfOg8gkRDq
X-Proofpoint-GUID: sKFFsyCCLaCiCk3wJKJ9GCWfOg8gkRDq

Print symbols referenced during disassembly instead of just printing
raw addresses. Also handle address relocation.

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/objtool/check.c                 |   9 ---
 tools/objtool/disas.c                 | 101 ++++++++++++++++++++++++++
 tools/objtool/include/objtool/check.h |   9 +++
 3 files changed, 110 insertions(+), 9 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 9cfac23185b8..ee613f03e57d 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -131,15 +131,6 @@ static struct instruction *prev_insn_same_sym(struct objtool_file *file,
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
index f2eb1050ce11..83fe2c018c4b 100644
--- a/tools/objtool/disas.c
+++ b/tools/objtool/disas.c
@@ -13,10 +13,108 @@
 
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
+	struct symbol *call_dest, *sym;
+	struct instruction *jump_dest;
+	struct section *sec;
+	struct reloc *reloc;
+	bool is_reloc;
+	s64 offset;
+
+	/*
+	 * If the instruction is a call/jump and it references a
+	 * destination then this is likely the address we are looking
+	 * up. So check it first.
+	 */
+	jump_dest = insn->jump_dest;
+	if (jump_dest && jump_dest->offset == addr) {
+		DINFO_FPRINTF(dinfo, "%lx <%s+0x%lx>", addr,
+			      jump_dest->sym->name,
+			      jump_dest->offset - jump_dest->sym->offset);
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
+	if (reloc_type(reloc) == R_X86_64_PC32 ||
+	    reloc_type(reloc) == R_X86_64_PLT32)
+		offset = arch_dest_reloc_offset(reloc_addend(reloc));
+	else
+		offset = reloc_addend(reloc);
+
+	/*
+	 * If the relocation symbol is a section name (for example ".bss")
+	 * then we try to further resolve the name.
+	 */
+	sec = find_section_by_name(file->elf, reloc->sym->name);
+	if (sec) {
+		sym = find_symbol_containing(sec, offset);
+		if (sym) {
+			if (sym->offset == offset)
+				DINFO_FPRINTF(dinfo, "%s+0x%lx = %s",
+					     reloc->sym->name, offset, sym->name);
+			else
+				DINFO_FPRINTF(dinfo, "%s+0x%lx = %s+0x%lx",
+					      reloc->sym->name, offset,
+					      sym->name, offset - sym->offset);
+			return;
+		}
+	}
+
+	if (offset)
+		DINFO_FPRINTF(dinfo, "%s+0x%lx", reloc->sym->name, offset);
+	else
+		DINFO_FPRINTF(dinfo, "%s", reloc->sym->name);
+}
+
 /*
  * Initialize disassemble info arch, mach (32 or 64-bit) and options.
  */
@@ -65,6 +163,7 @@ struct disas_context *disas_context_create(struct objtool_file *file)
 				     fprintf_styled);
 
 	dinfo->read_memory_func = buffer_read_memory;
+	dinfo->print_address_func = disas_print_address;
 	dinfo->application_data = dctx;
 
 	/*
@@ -117,6 +216,8 @@ static size_t disas_insn(struct disas_context *dctx,
 	disassembler_ftype disasm = dctx->disassembler;
 	struct disassemble_info *dinfo = &dctx->info;
 
+	dctx->insn = insn;
+
 	/*
 	 * Set the disassembler buffer to read data from the section
 	 * containing the instruction to disassemble.
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
 
-- 
2.43.5

