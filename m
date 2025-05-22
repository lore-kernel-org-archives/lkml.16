Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDCC1EDA2C
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 20:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747947158; cv=none; b=Wo0UvbRZ+UZxzMd3j4snzC1VQMjNc6N0fTb4qcfNgRE4aYKGCGWdyTgbe5VWoQGxNQV+M2ziXhHd1Y0tj65XTNPxk50ZJStZ/3PVWtutWytTN3sKP8tuqAcH9kWGDOyaH7aTAWrnkhNnNQAFx5uK4vJRj/ujmxtg6eRq6TYEE2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747947158; c=relaxed/simple;
	bh=/JWcbcDYagEJwqIBFUDGDPOzK1KiThgFemj8KvsRScw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QPwnuXiojC9l3uJv3dVKKAcb4hOEsrWcaDAFYiMGMYBVEfcFhw9SoYpnF9ZfgFqg8xn2u2nADX9ZkpNDSvkhUSHf8Xw7O/RW5IM7PmEMqfldayD2WYfvBn1lkEBV4oATXUQJ5UyPRDuGuwyOC819hP04yX6MLwBfOUkgW+6ezbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oA6/x0Xb; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oA6/x0Xb"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-742c5f7a70bso6573165b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747947156; x=1748551956; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cWYoVzvQ6STUKhn2Vc8frMtmKXO0VCTvjkbpcHqtiks=;
        b=oA6/x0XbKpcV5aiiJ+/ZYi4wb8aPA7qMJtKMUD9UJIAb4jD3roeTdB1tM19eh0RRT7
         W+lHseImWSQjipY6addknj+7oqHUP+HdiJcaIJQioPEaEmEBRO3bVbmpG1QteyVK9ck7
         Nnmrq/kmsoNQ7v4OFOOWv6bt+9u//pWIV4/i0x/NZtBnyhokAGVIhqegYD1Sc8W/A/qX
         uFQyGje5H3WbZaQtdNHpLNjSDq0JXzTZiga5PTBbv2Yol2oAzLLRlVioaquOEGBND/yY
         qB4nLy+aTUMeOeK7ZY3zEsw1qXFQCUPD8SP3ae10BFBssFxH1Wyt/S9z+hH+/9YNhyAY
         dyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747947156; x=1748551956;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cWYoVzvQ6STUKhn2Vc8frMtmKXO0VCTvjkbpcHqtiks=;
        b=IMgQCEZkz1ttzYtj7rDw9+RN60i351EY2SQpxen42ncjP6nc3H1AKkxMFwGOn0jHPx
         hIaOBE3fDtUM9qz4g1po81Rcsiu/6FTSBTVerpuyJ6+jSe4cX1rBwyIdsJ5LYZrobbxi
         gMWemzsQcSJ4/4tPBwSW3jDIwQBMtz5q4DlGq4lP/xEs3q7Ty9o0OncD3ew9sddcJoQk
         UxaVDaCMb/0IwuI50uwdvR+3CHCBVjB/ud9UAb94psyD7wUijFzSQWaWaVaH2+5xoHBG
         UaQXPNxf7JhTHtYnLyyoLiL89X1f4CzF+zqXJaHuMzOkcrPG7WxD1LmOngntegBbDxdj
         GkSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVolYD382szKRDbbUM6kWNKb5Ukp2RpHbocgpTqTsfZkMDoJCuuvzTiADpV80LurCF6bOjm5N/wzYgAZLE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5g7N/6hfj4QUHGmsRHs/Pj0ibW2Wzp/J+2da0aBf3OGOGWBjO
	tzXvoti4AARoq+4xvANJ8JxGI3HIDg1tzIw6MULWc1ACUM4WKixwi3/S5nnPzwQW/d5VPQsvitM
	IjaNf1MUKXbCuyi79oGwTLxURFw==
X-Google-Smtp-Source: AGHT+IGOBP1QWLAjqGBXaEVYKfIQz7EmWzeImIKyBDG97cpV+TYdXMQ/DNzDl1jq/lQ+Tg3g2TZsVlojOS7T0fT+Qw==
X-Received: from pfch21.prod.google.com ([2002:a05:6a00:1715:b0:742:4f82:f929])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:94a7:b0:740:91eb:c66 with SMTP id d2e1a72fcca58-742acc906b0mr36990652b3a.3.1747947156420;
 Thu, 22 May 2025 13:52:36 -0700 (PDT)
Date: Thu, 22 May 2025 20:52:05 +0000
In-Reply-To: <20250522205205.3408764-1-dylanbhatch@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250522205205.3408764-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522205205.3408764-3-dylanbhatch@google.com>
Subject: [PATCH v4 2/2] arm64/module: Use text-poke API for late relocations.
From: Dylan Hatch <dylanbhatch@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Song Liu <song@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>, 
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"

To enable late module patching, livepatch modules need to be able to
apply some of their relocations well after being loaded. In this
scenario, use the text-poking API to allow this, even with
STRICT_MODULE_RWX.

This patch is partially based off commit 88fc078a7a8f6 ("x86/module: Use
text_poke() for late relocations").

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
Acked-by: Song Liu <song@kernel.org>
---
 arch/arm64/kernel/module.c | 113 ++++++++++++++++++++++---------------
 1 file changed, 69 insertions(+), 44 deletions(-)

diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index 06bb680bfe975..6fbc3dbdcb425 100644
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
+#include <asm/text-patching.h>
 
 enum aarch64_reloc_op {
 	RELOC_OP_NONE,
@@ -48,7 +50,8 @@ static u64 do_reloc(enum aarch64_reloc_op reloc_op, __le32 *place, u64 val)
 	return 0;
 }
 
-static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len)
+static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len,
+		      struct module *me)
 {
 	s64 sval = do_reloc(op, place, val);
 
@@ -66,7 +69,11 @@ static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len)
 
 	switch (len) {
 	case 16:
-		*(s16 *)place = sval;
+		if (me->state != MODULE_STATE_UNFORMED)
+			aarch64_insn_copy(place, &sval, sizeof(s16));
+		else
+			*(s16 *)place = sval;
+
 		switch (op) {
 		case RELOC_OP_ABS:
 			if (sval < 0 || sval > U16_MAX)
@@ -82,7 +89,11 @@ static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len)
 		}
 		break;
 	case 32:
-		*(s32 *)place = sval;
+		if (me->state != MODULE_STATE_UNFORMED)
+			aarch64_insn_copy(place, &sval, sizeof(s32));
+		else
+			*(s32 *)place = sval;
+
 		switch (op) {
 		case RELOC_OP_ABS:
 			if (sval < 0 || sval > U32_MAX)
@@ -98,7 +109,10 @@ static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len)
 		}
 		break;
 	case 64:
-		*(s64 *)place = sval;
+		if (me->state != MODULE_STATE_UNFORMED)
+			aarch64_insn_copy(place, &sval, sizeof(s64));
+		else
+			*(s64 *)place = sval;
 		break;
 	default:
 		pr_err("Invalid length (%d) for data relocation\n", len);
@@ -113,7 +127,8 @@ enum aarch64_insn_movw_imm_type {
 };
 
 static int reloc_insn_movw(enum aarch64_reloc_op op, __le32 *place, u64 val,
-			   int lsb, enum aarch64_insn_movw_imm_type imm_type)
+			   int lsb, enum aarch64_insn_movw_imm_type imm_type,
+			   struct module *me)
 {
 	u64 imm;
 	s64 sval;
@@ -145,7 +160,10 @@ static int reloc_insn_movw(enum aarch64_reloc_op op, __le32 *place, u64 val,
 
 	/* Update the instruction with the new encoding. */
 	insn = aarch64_insn_encode_immediate(AARCH64_INSN_IMM_16, insn, imm);
-	*place = cpu_to_le32(insn);
+	if (me->state != MODULE_STATE_UNFORMED)
+		aarch64_insn_set(place, cpu_to_le32(insn), sizeof(insn));
+	else
+		*place = cpu_to_le32(insn);
 
 	if (imm > U16_MAX)
 		return -ERANGE;
@@ -154,7 +172,8 @@ static int reloc_insn_movw(enum aarch64_reloc_op op, __le32 *place, u64 val,
 }
 
 static int reloc_insn_imm(enum aarch64_reloc_op op, __le32 *place, u64 val,
-			  int lsb, int len, enum aarch64_insn_imm_type imm_type)
+			  int lsb, int len, enum aarch64_insn_imm_type imm_type,
+			  struct module *me)
 {
 	u64 imm, imm_mask;
 	s64 sval;
@@ -170,7 +189,10 @@ static int reloc_insn_imm(enum aarch64_reloc_op op, __le32 *place, u64 val,
 
 	/* Update the instruction's immediate field. */
 	insn = aarch64_insn_encode_immediate(imm_type, insn, imm);
-	*place = cpu_to_le32(insn);
+	if (me->state != MODULE_STATE_UNFORMED)
+		aarch64_insn_set(place, cpu_to_le32(insn), sizeof(insn));
+	else
+		*place = cpu_to_le32(insn);
 
 	/*
 	 * Extract the upper value bits (including the sign bit) and
@@ -189,17 +211,17 @@ static int reloc_insn_imm(enum aarch64_reloc_op op, __le32 *place, u64 val,
 }
 
 static int reloc_insn_adrp(struct module *mod, Elf64_Shdr *sechdrs,
-			   __le32 *place, u64 val)
+			   __le32 *place, u64 val, struct module *me)
 {
 	u32 insn;
 
 	if (!is_forbidden_offset_for_adrp(place))
 		return reloc_insn_imm(RELOC_OP_PAGE, place, val, 12, 21,
-				      AARCH64_INSN_IMM_ADR);
+				      AARCH64_INSN_IMM_ADR, me);
 
 	/* patch ADRP to ADR if it is in range */
 	if (!reloc_insn_imm(RELOC_OP_PREL, place, val & ~0xfff, 0, 21,
-			    AARCH64_INSN_IMM_ADR)) {
+			    AARCH64_INSN_IMM_ADR, me)) {
 		insn = le32_to_cpu(*place);
 		insn &= ~BIT(31);
 	} else {
@@ -211,7 +233,10 @@ static int reloc_insn_adrp(struct module *mod, Elf64_Shdr *sechdrs,
 						   AARCH64_INSN_BRANCH_NOLINK);
 	}
 
-	*place = cpu_to_le32(insn);
+	if (me->state != MODULE_STATE_UNFORMED)
+		aarch64_insn_set(place, cpu_to_le32(insn), sizeof(insn));
+	else
+		*place = cpu_to_le32(insn);
 	return 0;
 }
 
@@ -255,23 +280,23 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 		/* Data relocations. */
 		case R_AARCH64_ABS64:
 			overflow_check = false;
-			ovf = reloc_data(RELOC_OP_ABS, loc, val, 64);
+			ovf = reloc_data(RELOC_OP_ABS, loc, val, 64, me);
 			break;
 		case R_AARCH64_ABS32:
-			ovf = reloc_data(RELOC_OP_ABS, loc, val, 32);
+			ovf = reloc_data(RELOC_OP_ABS, loc, val, 32, me);
 			break;
 		case R_AARCH64_ABS16:
-			ovf = reloc_data(RELOC_OP_ABS, loc, val, 16);
+			ovf = reloc_data(RELOC_OP_ABS, loc, val, 16, me);
 			break;
 		case R_AARCH64_PREL64:
 			overflow_check = false;
-			ovf = reloc_data(RELOC_OP_PREL, loc, val, 64);
+			ovf = reloc_data(RELOC_OP_PREL, loc, val, 64, me);
 			break;
 		case R_AARCH64_PREL32:
-			ovf = reloc_data(RELOC_OP_PREL, loc, val, 32);
+			ovf = reloc_data(RELOC_OP_PREL, loc, val, 32, me);
 			break;
 		case R_AARCH64_PREL16:
-			ovf = reloc_data(RELOC_OP_PREL, loc, val, 16);
+			ovf = reloc_data(RELOC_OP_PREL, loc, val, 16, me);
 			break;
 
 		/* MOVW instruction relocations. */
@@ -280,88 +305,88 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 			fallthrough;
 		case R_AARCH64_MOVW_UABS_G0:
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 0,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, me);
 			break;
 		case R_AARCH64_MOVW_UABS_G1_NC:
 			overflow_check = false;
 			fallthrough;
 		case R_AARCH64_MOVW_UABS_G1:
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 16,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, me);
 			break;
 		case R_AARCH64_MOVW_UABS_G2_NC:
 			overflow_check = false;
 			fallthrough;
 		case R_AARCH64_MOVW_UABS_G2:
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 32,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, me);
 			break;
 		case R_AARCH64_MOVW_UABS_G3:
 			/* We're using the top bits so we can't overflow. */
 			overflow_check = false;
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 48,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, me);
 			break;
 		case R_AARCH64_MOVW_SABS_G0:
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 0,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, me);
 			break;
 		case R_AARCH64_MOVW_SABS_G1:
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 16,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, me);
 			break;
 		case R_AARCH64_MOVW_SABS_G2:
 			ovf = reloc_insn_movw(RELOC_OP_ABS, loc, val, 32,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, me);
 			break;
 		case R_AARCH64_MOVW_PREL_G0_NC:
 			overflow_check = false;
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 0,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, me);
 			break;
 		case R_AARCH64_MOVW_PREL_G0:
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 0,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, me);
 			break;
 		case R_AARCH64_MOVW_PREL_G1_NC:
 			overflow_check = false;
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 16,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, me);
 			break;
 		case R_AARCH64_MOVW_PREL_G1:
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 16,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, me);
 			break;
 		case R_AARCH64_MOVW_PREL_G2_NC:
 			overflow_check = false;
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 32,
-					      AARCH64_INSN_IMM_MOVKZ);
+					      AARCH64_INSN_IMM_MOVKZ, me);
 			break;
 		case R_AARCH64_MOVW_PREL_G2:
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 32,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, me);
 			break;
 		case R_AARCH64_MOVW_PREL_G3:
 			/* We're using the top bits so we can't overflow. */
 			overflow_check = false;
 			ovf = reloc_insn_movw(RELOC_OP_PREL, loc, val, 48,
-					      AARCH64_INSN_IMM_MOVNZ);
+					      AARCH64_INSN_IMM_MOVNZ, me);
 			break;
 
 		/* Immediate instruction relocations. */
 		case R_AARCH64_LD_PREL_LO19:
 			ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2, 19,
-					     AARCH64_INSN_IMM_19);
+					     AARCH64_INSN_IMM_19, me);
 			break;
 		case R_AARCH64_ADR_PREL_LO21:
 			ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 0, 21,
-					     AARCH64_INSN_IMM_ADR);
+					     AARCH64_INSN_IMM_ADR, me);
 			break;
 		case R_AARCH64_ADR_PREL_PG_HI21_NC:
 			overflow_check = false;
 			fallthrough;
 		case R_AARCH64_ADR_PREL_PG_HI21:
-			ovf = reloc_insn_adrp(me, sechdrs, loc, val);
+			ovf = reloc_insn_adrp(me, sechdrs, loc, val, me);
 			if (ovf && ovf != -ERANGE)
 				return ovf;
 			break;
@@ -369,46 +394,46 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 		case R_AARCH64_LDST8_ABS_LO12_NC:
 			overflow_check = false;
 			ovf = reloc_insn_imm(RELOC_OP_ABS, loc, val, 0, 12,
-					     AARCH64_INSN_IMM_12);
+					     AARCH64_INSN_IMM_12, me);
 			break;
 		case R_AARCH64_LDST16_ABS_LO12_NC:
 			overflow_check = false;
 			ovf = reloc_insn_imm(RELOC_OP_ABS, loc, val, 1, 11,
-					     AARCH64_INSN_IMM_12);
+					     AARCH64_INSN_IMM_12, me);
 			break;
 		case R_AARCH64_LDST32_ABS_LO12_NC:
 			overflow_check = false;
 			ovf = reloc_insn_imm(RELOC_OP_ABS, loc, val, 2, 10,
-					     AARCH64_INSN_IMM_12);
+					     AARCH64_INSN_IMM_12, me);
 			break;
 		case R_AARCH64_LDST64_ABS_LO12_NC:
 			overflow_check = false;
 			ovf = reloc_insn_imm(RELOC_OP_ABS, loc, val, 3, 9,
-					     AARCH64_INSN_IMM_12);
+					     AARCH64_INSN_IMM_12, me);
 			break;
 		case R_AARCH64_LDST128_ABS_LO12_NC:
 			overflow_check = false;
 			ovf = reloc_insn_imm(RELOC_OP_ABS, loc, val, 4, 8,
-					     AARCH64_INSN_IMM_12);
+					     AARCH64_INSN_IMM_12, me);
 			break;
 		case R_AARCH64_TSTBR14:
 			ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2, 14,
-					     AARCH64_INSN_IMM_14);
+					     AARCH64_INSN_IMM_14, me);
 			break;
 		case R_AARCH64_CONDBR19:
 			ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2, 19,
-					     AARCH64_INSN_IMM_19);
+					     AARCH64_INSN_IMM_19, me);
 			break;
 		case R_AARCH64_JUMP26:
 		case R_AARCH64_CALL26:
 			ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2, 26,
-					     AARCH64_INSN_IMM_26);
+					     AARCH64_INSN_IMM_26, me);
 			if (ovf == -ERANGE) {
 				val = module_emit_plt_entry(me, sechdrs, loc, &rel[i], sym);
 				if (!val)
 					return -ENOEXEC;
 				ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 2,
-						     26, AARCH64_INSN_IMM_26);
+						     26, AARCH64_INSN_IMM_26, me);
 			}
 			break;
 
-- 
2.49.0.1151.ga128411c76-goog

