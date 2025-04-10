Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94930293B48
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744315582; cv=none; b=kLBA3i3sAbAyuXSDzlijhiHNl/g/Oem+1w5cYGyFNbvqa6pFJqm0nAaBFcpxxoolJQ80gsGHDil03Uhoc+bjxxyVMSb9G/cup87Wrzjl8kRm5iDrMO+FjP+d/9iz713b1OE5CevAPqHsEA047MMKksd0bmFZSWqMnLXkWMMPUkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744315582; c=relaxed/simple;
	bh=OA6ADJULaH50zImDs2yjj5Tr7yij88mY4AbnJjPaxOE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=B8tCKLpCPmSYoGEc5ILDKJJk7tU22Ggcrxenram2rqSf8SPb8p4UD/FlyDLMm1MIm/kZ0nofeH4K0YqCs5t9g0GlkPHT3m4C/W42bzZ1d7wSZ3PAu2cM9NBUKWPp57nmRp1j8SHhIzxBuTo8vCMQ0QKE7JE823/qwRPQigc6YF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1WaRpiLd; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1WaRpiLd"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736cd36189bso1483131b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744315580; x=1744920380; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fySytB69w4+Sogwc7/YqT0bEG7PGE7S6GUopf1l5XiE=;
        b=1WaRpiLdW8RyKsG86h7C8KAbsHJobDEaPPbIY0WysL4jSZ74absJcWbiZwmp75th9+
         KIVMj/XFB+BngylMXKA3t9X+0o9blcIjaDl2VpVIEpOEftewajEujavWyYFpQp5RvrW/
         tQQSFbPC5yA+0zs9XHsvtrVXsVgFzXhsda46yMWSFOLNkPcBm9YzMxWtXaxeG3KnzIlf
         mc/+BiGGuZylOhUtgHMU8Dj+gSK38RuwPYsbUU8KjZ56N85Z8NbwwWr/KEuZ7+1FKV50
         2bzxiQaWRsiZmWqvjV++XEFdwYIsjOTDvQfg7XJRQCt4UOrOVpBTeo0RPdKefkoOCjTc
         qriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744315580; x=1744920380;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fySytB69w4+Sogwc7/YqT0bEG7PGE7S6GUopf1l5XiE=;
        b=XsfvRbVEvG+wgkz1IFDmrD5daWMT+5fwA5ZCFq/cbfQaZRZUbPCOpIbLec/WofWpWh
         zVcJU1JVaX7CZFM5ZkOXSO15V7glHzyV04TBJCs6xiJWjgsGxnmBDOK1SK4mOkPRhZ+O
         Gee5O5JsJ2zWTkMEYjxc1vsZyXGs8OpcnciD13dp1uNUFsvm9uydERiApySNGWlQ9ZQU
         RF4cfgZaobuaYjGERqeFYZUH90GRlxBDco9QWZS5wJUj6blsTnzlsIhc7tqG5JaRmY6f
         QCa2majgqzbSuD8ETJoWvi/vWiuTxCoQ8Tq2sjaNLjXPOkEHRnlEcgWwbeRGeig+j7LF
         +53w==
X-Forwarded-Encrypted: i=1; AJvYcCXpGoGUhOKuy6JRLEE7gyhPG1rZdMx9BIk7O4cinvDHz5MCqM5ZE7fkFElG7Xb8+os5LqttFgqw3cIGUaI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNTFoGoZki2LOSi+wlLGaG1GhnFfX1CI9PbiRC5j2VPm2d9gaB
	MSS+qU0Vl32LRlkDE1Lq3CEXeN7keL5UhRMVGCGXbx+A7mhHhrEHoxPZY2fJ2jJYnQAVQeMX1hV
	Gmps8C4GW/Td0D0s2ScNXaw==
X-Google-Smtp-Source: AGHT+IFBj99ZzdxxszvokbBWhRBAXEEf3YKnc9AQP2RrwJzAn20+nVn8BbCw2DGnsnqLLAxXf0KObQneMpAs+Niw4w==
X-Received: from pfbi30.prod.google.com ([2002:a05:6a00:af1e:b0:739:4935:6146])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:22c4:b0:736:34a2:8a18 with SMTP id d2e1a72fcca58-73bd12a3adamr244516b3a.24.1744315579855;
 Thu, 10 Apr 2025 13:06:19 -0700 (PDT)
Date: Thu, 10 Apr 2025 20:06:06 +0000
In-Reply-To: <20250410200606.20318-1-dylanbhatch@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250410200606.20318-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250410200606.20318-3-dylanbhatch@google.com>
Subject: [PATCH 2/2] arm64/module: Use text-poke API for late relocations.
From: Dylan Hatch <dylanbhatch@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Song Liu <song@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>, Roman Gushchin <kfree@google.com>
Content-Type: text/plain; charset="UTF-8"

To enable late module patching, livepatch modules need to be able to
apply some of their relocations well after being loaded. In this
scenario, use the text-poking API to allow this, even with
STRICT_MODULE_RWX.

This patch is largely based off commit 88fc078a7a8f6 ("x86/module: Use
text_poke() for late relocations").

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 arch/arm64/kernel/module.c | 129 ++++++++++++++++++++++++-------------
 1 file changed, 83 insertions(+), 46 deletions(-)

diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index 06bb680bfe975..3bf84318aa54c 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -18,11 +18,13 @@
 #include <linux/moduleloader.h>
 #include <linux/random.h>
 #include <linux/scs.h>
+#include <linux/memory.h>
 
 #include <asm/alternative.h>
 #include <asm/insn.h>
 #include <asm/scs.h>
 #include <asm/sections.h>
+#include <asm/patching.h>
 
 enum aarch64_reloc_op {
 	RELOC_OP_NONE,
@@ -48,7 +50,8 @@ static u64 do_reloc(enum aarch64_reloc_op reloc_op, __le32 *place, u64 val)
 	return 0;
 }
 
-static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len)
+static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len,
+		      void *(*write)(void *dest, const void *src, size_t len))
 {
 	s64 sval = do_reloc(op, place, val);
 
@@ -66,7 +69,7 @@ static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len)
 
 	switch (len) {
 	case 16:
-		*(s16 *)place = sval;
+		write(place, &sval, sizeof(s16));
 		switch (op) {
 		case RELOC_OP_ABS:
 			if (sval < 0 || sval > U16_MAX)
@@ -82,7 +85,7 @@ static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len)
 		}
 		break;
 	case 32:
-		*(s32 *)place = sval;
+		write(place, &sval, sizeof(s32));
 		switch (op) {
 		case RELOC_OP_ABS:
 			if (sval < 0 || sval > U32_MAX)
@@ -98,7 +101,7 @@ static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len)
 		}
 		break;
 	case 64:
-		*(s64 *)place = sval;
+		write(place, &sval, sizeof(s64));
 		break;
 	default:
 		pr_err("Invalid length (%d) for data relocation\n", len);
@@ -113,11 +116,13 @@ enum aarch64_insn_movw_imm_type {
 };
 
 static int reloc_insn_movw(enum aarch64_reloc_op op, __le32 *place, u64 val,
-			   int lsb, enum aarch64_insn_movw_imm_type imm_type)
+			   int lsb, enum aarch64_insn_movw_imm_type imm_type,
+			   void *(*write)(void *dest, const void *src, size_t len))
 {
 	u64 imm;
 	s64 sval;
 	u32 insn = le32_to_cpu(*place);
+	__le32 le_insn;
 
 	sval = do_reloc(op, place, val);
 	imm = sval >> lsb;
@@ -145,7 +150,8 @@ static int reloc_insn_movw(enum aarch64_reloc_op op, __le32 *place, u64 val,
 
 	/* Update the instruction with the new encoding. */
 	insn = aarch64_insn_encode_immediate(AARCH64_INSN_IMM_16, insn, imm);
-	*place = cpu_to_le32(insn);
+	le_insn = cpu_to_le32(insn);
+	write(place, &le_insn, sizeof(le_insn));
 
 	if (imm > U16_MAX)
 		return -ERANGE;
@@ -154,11 +160,13 @@ static int reloc_insn_movw(enum aarch64_reloc_op op, __le32 *place, u64 val,
 }
 
 static int reloc_insn_imm(enum aarch64_reloc_op op, __le32 *place, u64 val,
-			  int lsb, int len, enum aarch64_insn_imm_type imm_type)
+			  int lsb, int len, enum aarch64_insn_imm_type imm_type,
+			  void *(*write)(void *dest, const void *src, size_t len))
 {
 	u64 imm, imm_mask;
 	s64 sval;
 	u32 insn = le32_to_cpu(*place);
+	__le32 le_insn;
 
 	/* Calculate the relocation value. */
 	sval = do_reloc(op, place, val);
@@ -170,7 +178,8 @@ static int reloc_insn_imm(enum aarch64_reloc_op op, __le32 *place, u64 val,
 
 	/* Update the instruction's immediate field. */
 	insn = aarch64_insn_encode_immediate(imm_type, insn, imm);
-	*place = cpu_to_le32(insn);
+	le_insn = cpu_to_le32(insn);
+	write(place, &le_insn, sizeof(le_insn));
 
 	/*
 	 * Extract the upper value bits (including the sign bit) and
@@ -189,17 +198,19 @@ static int reloc_insn_imm(enum aarch64_reloc_op op, __le32 *place, u64 val,
 }
 
 static int reloc_insn_adrp(struct module *mod, Elf64_Shdr *sechdrs,
-			   __le32 *place, u64 val)
+			   __le32 *place, u64 val,
+			   void *(*write)(void *dest, const void *src, size_t len))
 {
 	u32 insn;
+	__le32 le_insn;
 
 	if (!is_forbidden_offset_for_adrp(place))
 		return reloc_insn_imm(RELOC_OP_PAGE, place, val, 12, 21,
-				      AARCH64_INSN_IMM_ADR);
+				      AARCH64_INSN_IMM_ADR, write);
 
 	/* patch ADRP to ADR if it is in range */
 	if (!reloc_insn_imm(RELOC_OP_PREL, place, val & ~0xfff, 0, 21,
-			    AARCH64_INSN_IMM_ADR)) {
+			    AARCH64_INSN_IMM_ADR, write)) {
 		insn = le32_to_cpu(*place);
 		insn &= ~BIT(31);
 	} else {
@@ -211,15 +222,17 @@ static int reloc_insn_adrp(struct module *mod, Elf64_Shdr *sechdrs,
 						   AARCH64_INSN_BRANCH_NOLINK);
 	}
 
-	*place = cpu_to_le32(insn);
+	le_insn = cpu_to_le32(insn);
+	write(place, &le_insn, sizeof(le_insn));
 	return 0;
 }
 
-int apply_relocate_add(Elf64_Shdr *sechdrs,
+static int __apply_relocate_add(Elf64_Shdr *sechdrs,
 		       const char *strtab,
 		       unsigned int symindex,
 		       unsigned int relsec,
-		       struct module *me)
+		       struct module *me,
+		       void *(*write)(void *dest, const void *src, size_t len))
 {
 	unsigned int i;
 	int ovf;
@@ -255,23 +268,23 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 		/* Data relocations. */
 		case R_AARCH64_ABS64:
 			overflow_check = false;
-			ovf = reloc_data(RELOC_OP_ABS, loc, val, 64);
+			ovf = reloc_data(RELOC_OP_ABS, loc, val, 64, write);
 			break;
 		case R_AARCH64_ABS32:
-			ovf = reloc_data(RELOC_OP_ABS, loc, val, 32);
+			ovf = reloc_data(RELOC_OP_ABS, loc, val, 32, write);
 			break;
 		case R_AARCH64_ABS16:
-			ovf = reloc_data(RELOC_OP_ABS, loc, val, 16);
+			ovf = reloc_data(RELOC_OP_ABS, loc, val, 16, write);
 			break;
 		case R_AARCH64_PREL64:
 			overflow_check = false;
-			ovf = reloc_data(RELOC_OP_PREL, loc, val, 64);
+			ovf = reloc_data(RELOC_OP_PREL, loc, val, 64, write);
 			break;
 		case R_AARCH64_PREL32:
-			ovf = reloc_data(RELOC_OP_PREL, loc, val, 32);
+			ovf = reloc_data(RELOC_OP_PREL, loc, val, 32, write);
 			break;
 		case R_AARCH64_PREL16:
-			ovf = reloc_data(RELOC_OP_PREL, loc, val, 16);
+			ovf = reloc_data(RELOC_OP_PREL, loc, val, 16, write);
 			break;
 
 		/* MOVW instruction relocations. */
@@ -280,88 +293,88 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 			fallthrough;
 		case R_AARCH64_MOVW_UABS_G0:
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 0,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, write);
 			break;
 		case R_AARCH64_MOVW_UABS_G1_NC:
 			overflow_check = false;
 			fallthrough;
 		case R_AARCH64_MOVW_UABS_G1:
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 16,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, write);
 			break;
 		case R_AARCH64_MOVW_UABS_G2_NC:
 			overflow_check = false;
 			fallthrough;
 		case R_AARCH64_MOVW_UABS_G2:
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 32,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, write);
 			break;
 		case R_AARCH64_MOVW_UABS_G3:
 			/* We're using the top bits so we can't overflow. */
 			overflow_check = false;
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 48,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, write);
 			break;
 		case R_AARCH64_MOVW_SABS_G0:
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 0,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, write);
 			break;
 		case R_AARCH64_MOVW_SABS_G1:
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 16,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, write);
 			break;
 		case R_AARCH64_MOVW_SABS_G2:
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 32,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, write);
 			break;
 		case R_AARCH64_MOVW_PREL_G0_NC:
 			overflow_check = false;
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 0,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, write);
 			break;
 		case R_AARCH64_MOVW_PREL_G0:
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 0,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, write);
 			break;
 		case R_AARCH64_MOVW_PREL_G1_NC:
 			overflow_check = false;
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 16,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, write);
 			break;
 		case R_AARCH64_MOVW_PREL_G1:
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 16,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, write);
 			break;
 		case R_AARCH64_MOVW_PREL_G2_NC:
 			overflow_check = false;
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 32,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, write);
 			break;
 		case R_AARCH64_MOVW_PREL_G2:
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 32,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, write);
 			break;
 		case R_AARCH64_MOVW_PREL_G3:
 			/* We're using the top bits so we can't overflow. */
 			overflow_check = false;
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 48,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, write);
 			break;
 
 		/* Immediate instruction relocations. */
 		case R_AARCH64_LD_PREL_LO19:
 			ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2, 19,
-					     AARCH64_INSN_IMM_19);
+					     AARCH64_INSN_IMM_19, write);
 			break;
 		case R_AARCH64_ADR_PREL_LO21:
 			ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 0, 21,
-					     AARCH64_INSN_IMM_ADR);
+					     AARCH64_INSN_IMM_ADR, write);
 			break;
 		case R_AARCH64_ADR_PREL_PG_HI21_NC:
 			overflow_check = false;
 			fallthrough;
 		case R_AARCH64_ADR_PREL_PG_HI21:
-			ovf = reloc_insn_adrp(me, sechdrs, loc, val);
+			ovf = reloc_insn_adrp(me, sechdrs, loc, val, write);
 			if (ovf && ovf != -ERANGE)
 				return ovf;
 			break;
@@ -369,46 +382,46 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 		case R_AARCH64_LDST8_ABS_LO12_NC:
 			overflow_check = false;
 			ovf = reloc_insn_imm(RELOC_OP_ABS, loc, val, 0, 12,
-					     AARCH64_INSN_IMM_12);
+					     AARCH64_INSN_IMM_12, write);
 			break;
 		case R_AARCH64_LDST16_ABS_LO12_NC:
 			overflow_check = false;
 			ovf = reloc_insn_imm(RELOC_OP_ABS, loc, val, 1, 11,
-					     AARCH64_INSN_IMM_12);
+					     AARCH64_INSN_IMM_12, write);
 			break;
 		case R_AARCH64_LDST32_ABS_LO12_NC:
 			overflow_check = false;
 			ovf = reloc_insn_imm(RELOC_OP_ABS, loc, val, 2, 10,
-					     AARCH64_INSN_IMM_12);
+					     AARCH64_INSN_IMM_12, write);
 			break;
 		case R_AARCH64_LDST64_ABS_LO12_NC:
 			overflow_check = false;
 			ovf = reloc_insn_imm(RELOC_OP_ABS, loc, val, 3, 9,
-					     AARCH64_INSN_IMM_12);
+					     AARCH64_INSN_IMM_12, write);
 			break;
 		case R_AARCH64_LDST128_ABS_LO12_NC:
 			overflow_check = false;
 			ovf = reloc_insn_imm(RELOC_OP_ABS, loc, val, 4, 8,
-					     AARCH64_INSN_IMM_12);
+					     AARCH64_INSN_IMM_12, write);
 			break;
 		case R_AARCH64_TSTBR14:
 			ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2, 14,
-					     AARCH64_INSN_IMM_14);
+					     AARCH64_INSN_IMM_14, write);
 			break;
 		case R_AARCH64_CONDBR19:
 			ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2, 19,
-					     AARCH64_INSN_IMM_19);
+					     AARCH64_INSN_IMM_19, write);
 			break;
 		case R_AARCH64_JUMP26:
 		case R_AARCH64_CALL26:
 			ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2, 26,
-					     AARCH64_INSN_IMM_26);
+					     AARCH64_INSN_IMM_26, write);
 			if (ovf == -ERANGE) {
 				val = module_emit_plt_entry(me, sechdrs, loc, &rel[i], sym);
 				if (!val)
 					return -ENOEXEC;
 				ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2,
-						     26, AARCH64_INSN_IMM_26);
+						     26, AARCH64_INSN_IMM_26, write);
 			}
 			break;
 
@@ -431,6 +444,30 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 	return -ENOEXEC;
 }
 
+int apply_relocate_add(Elf64_Shdr *sechdrs,
+		       const char *strtab,
+		       unsigned int symindex,
+		       unsigned int relsec,
+		       struct module *me)
+{
+	int ret;
+	bool early = me->state == MODULE_STATE_UNFORMED;
+	void *(*write)(void *, const void *, size_t) = memcpy;
+
+	if (!early) {
+		write = aarch64_insn_copy;
+		mutex_lock(&text_mutex);
+	}
+
+	ret = __apply_relocate_add(sechdrs, strtab, symindex, relsec, me,
+				   write);
+
+	if (!early)
+		mutex_unlock(&text_mutex);
+
+	return ret;
+}
+
 static inline void __init_plt(struct plt_entry *plt, unsigned long addr)
 {
 	*plt = get_plt_entry(addr, plt);
-- 
2.49.0.604.gff1f9ca942-goog

