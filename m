Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6509A20102D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749620205; cv=none; b=uRugBWPRI2wy0gxLqnNn3GhPlqdnQpCOZn0m2hYadxyH+87/z733L2Cc1sqRzyLvZ07FyFHtzq+yci8Wazvg7Lr0m7T9W9wIVwWRtN85iTjopjuS8UKo4QMRpI8WtpRyFpYNSX9KM3a2xL1eWba3EiIx0zm7GNZ9M+dF+m2y/HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749620205; c=relaxed/simple;
	bh=9CSl90umod+66WIXaDcpwnyOGW72220eFIEQOqdjezg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i5zOE20if4bN336jQloD6mt4ocySI/CPvaWfwMqQ1qnHFBtikluvSotfwvc8GNy2E6R11MGQF1QBxY2DCRjSo9NK+1AJnyP1aVadm8kMa9UnIGhtDYiHJQNnS2zK93RdW/dXZiNKoH+YPKQlBfNQbqPC6xXWgnBXi7turZb+hv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 0a208636468611f0b29709d653e92f7d-20250611
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CTE_8B, HR_CTT_MISS
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_DIGIT_LEN
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_UNTRUSTED, SRC_UNTRUSTED, IP_LOWREP, SRC_LOWREP, DN_TRUSTED
	SRC_TRUSTED, SA_EXISTED, SN_UNTRUSTED, SN_UNFAMILIAR, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF
	GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_T1, AMN_GOOD
	AMN_C_TI, AMN_C_BU, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:66bc2441-98d1-43bc-b80e-c82c20b30dd5,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-INFO: VERSION:1.1.45,REQID:66bc2441-98d1-43bc-b80e-c82c20b30dd5,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:5
X-CID-META: VersionHash:6493067,CLOUDID:6a6d1c745aa5a83c38564995450c95b6,BulkI
	D:2506111336373ZLSE6US,BulkQuantity:0,Recheck:0,SF:17|19|25|38|45|66|78|81
	|82|102,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS
	:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
	RC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR
X-UUID: 0a208636468611f0b29709d653e92f7d-20250611
X-User: duanchenghao@kylinos.cn
Received: from localhost.localdomain [(223.104.40.103)] by mailgw.kylinos.cn
	(envelope-from <duanchenghao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 117676519; Wed, 11 Jun 2025 13:36:35 +0800
From: Chenghao Duan <duanchenghao@kylinos.cn>
To: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Chenghao Duan <duanchenghao@kylinos.cn>,
	George Guo <guodongtai@kylinos.cn>
Subject: [PATCH v1 3/5] LoongArch: BPF: Add bpf_arch_text_poke support for Loongarch
Date: Wed, 11 Jun 2025 13:36:23 +0800
Message-Id: <20250611053625.352091-4-duanchenghao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250611053625.352091-1-duanchenghao@kylinos.cn>
References: <20250611035952.111182-3-duanchenghao@kylinos.cn>
 <20250611053625.352091-1-duanchenghao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the bpf_arch_text_poke function for the LoongArch
architecture. On LoongArch, since symbol addresses in the direct mapping
region cannot be reached via relative jump instructions from the paged
mapping region, we use the move_imm+jirl instruction pair as absolute
jump instructions. These require 2-5 instructions, so we reserve 5 NOP
instructions in the program as placeholders for function jumps.

Signed-off-by: George Guo <guodongtai@kylinos.cn>
Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
---
 arch/loongarch/net/bpf_jit.c | 64 ++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index ea357a3ed..0e31d4d66 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2022 Loongson Technology Corporation Limited
  */
+#include <linux/memory.h>
 #include "bpf_jit.h"
 
 #define REG_TCC		LOONGARCH_GPR_A6
@@ -1351,3 +1352,66 @@ bool bpf_jit_supports_subprog_tailcalls(void)
 {
 	return true;
 }
+
+static int emit_jump_and_link(struct jit_ctx *ctx, u8 rd, u64 ip, u64 target)
+{
+	s64 offset = (s64)(target - ip);
+
+	if (offset && (offset >= -SZ_128M && offset < SZ_128M)) {
+		emit_insn(ctx, bl, offset >> 2);
+	} else {
+		move_imm(ctx, LOONGARCH_GPR_T1, target, false);
+		emit_insn(ctx, jirl, rd, LOONGARCH_GPR_T1, 0);
+	}
+
+	return 0;
+}
+
+static int gen_jump_or_nops(void *target, void *ip, u32 *insns, bool is_call)
+{
+	s64 off = 0;
+	struct jit_ctx ctx;
+
+	ctx.idx = 0;
+	ctx.image = (union loongarch_instruction *)insns;
+
+	if (!target) {
+		emit_insn((&ctx), NOP);
+		emit_insn((&ctx), NOP);
+		return 0;
+	}
+
+	off = (s64)(target - ip);
+	return emit_jump_and_link(&ctx, is_call ? LOONGARCH_GPR_T0 : LOONGARCH_GPR_ZERO,
+					(unsigned long)ip, (unsigned long)target);
+}
+
+int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type poke_type,
+			void *old_addr, void *new_addr)
+{
+	u32 old_insns[5] = {[0 ... 4] = INSN_NOP};
+	u32 new_insns[5] = {[0 ... 4] = INSN_NOP};
+	bool is_call = poke_type == BPF_MOD_CALL;
+	int ret;
+
+	if (!is_kernel_text((unsigned long)ip) &&
+		!is_bpf_text_address((unsigned long)ip))
+		return -ENOTSUPP;
+
+	ret = gen_jump_or_nops(old_addr, ip, old_insns, is_call);
+	if (ret)
+		return ret;
+
+	if (memcmp(ip, old_insns, 5 * 4))
+		return -EFAULT;
+
+	ret = gen_jump_or_nops(new_addr, ip, new_insns, is_call);
+	if (ret)
+		return ret;
+
+	mutex_lock(&text_mutex);
+	if (memcmp(ip, new_insns, 5 * 4))
+		ret = larch_insn_text_copy(ip, new_insns, 5 * 4);
+	mutex_unlock(&text_mutex);
+	return ret;
+}
-- 
2.25.1

