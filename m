Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ED8226883
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749620204; cv=none; b=mYpskglwW2UicT41Vorno2wegrFLa03pSVmct5R9ut7lr6Fa84hYFsnQi6uO6/ofXSLL9Q1GHHylLTvu/1deg6U4FQfX5y7UvtbB/nVkT1PqVC/xE3rgC9BwYbXxj6ygIdLGSz4if8EzBeZRmbYC+5YmMFouJNeV5VnxsSjXbmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749620204; c=relaxed/simple;
	bh=6hil3jme6RmuqIKWHKQsZ2pdj9ZHIGCX1CiT7H80zY0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P9Hd50+4LXCmx6NY1eItNlOU1dkuXYNldjfxPPf6Ir5Plel5d+ihSSE1OIS6PQyp3wyz8or98cp9f2wtDRJ9ifbtnfElYfa2Cl2dt8BvqXDMwnXtCXU9bbjO6anqjIVyC5Rq5lEEzUfdpt7obKueWHlYc0XS+QHrXahv43IepGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 09afac90468611f0b29709d653e92f7d-20250611
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
X-CID-O-INFO: VERSION:1.1.45,REQID:d0832168-f478-4a19-be73-fb229c5342f8,IP:10,
	URL:0,TC:0,Content:0,EDM:-25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-20
X-CID-INFO: VERSION:1.1.45,REQID:d0832168-f478-4a19-be73-fb229c5342f8,IP:10,UR
	L:0,TC:0,Content:0,EDM:-25,RT:0,SF:-5,FILE:0,BULK:0,RULE:EDM_GE969F26,ACTI
	ON:release,TS:-20
X-CID-META: VersionHash:6493067,CLOUDID:7ee8bebc6a0d2c6ddbc33a2613e38ca8,BulkI
	D:250611133637GVWAGH1C,BulkQuantity:0,Recheck:0,SF:17|19|25|38|45|66|78|81
	|82|102,TC:nil,Content:0|50,EDM:1,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 09afac90468611f0b29709d653e92f7d-20250611
X-User: duanchenghao@kylinos.cn
Received: from localhost.localdomain [(223.104.40.103)] by mailgw.kylinos.cn
	(envelope-from <duanchenghao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1249612687; Wed, 11 Jun 2025 13:36:35 +0800
From: Chenghao Duan <duanchenghao@kylinos.cn>
To: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Chenghao Duan <duanchenghao@kylinos.cn>,
	George Guo <guodongtai@kylinos.cn>,
	Youling Tang <tangyouling@kylinos.cn>
Subject: [PATCH v1 2/5] LoongArch: BPF: The operation commands needed to add a trampoline
Date: Wed, 11 Jun 2025 13:36:22 +0800
Message-Id: <20250611053625.352091-3-duanchenghao@kylinos.cn>
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

Add instrctions:
emit_NOP
emit_BREAK

Add branch jump function:
larch_insn_gen_beq
larch_insn_gen_bne

Add instruction copy function: larch_insn_text_copy
The implementation of larch_insn_text_copy uses the fixmap
FIX_TEXT_POKE0.

Signed-off-by: George Guo <guodongtai@kylinos.cn>
Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
---
 arch/loongarch/include/asm/inst.h | 19 +++++++
 arch/loongarch/kernel/inst.c      | 85 +++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/include/asm/inst.h
index 3089785ca..dd6e07781 100644
--- a/arch/loongarch/include/asm/inst.h
+++ b/arch/loongarch/include/asm/inst.h
@@ -497,6 +497,7 @@ void arch_simulate_insn(union loongarch_instruction insn, struct pt_regs *regs);
 int larch_insn_read(void *addr, u32 *insnp);
 int larch_insn_write(void *addr, u32 insn);
 int larch_insn_patch_text(void *addr, u32 insn);
+int larch_insn_text_copy(void *dst, void *src, size_t len);
 
 u32 larch_insn_gen_nop(void);
 u32 larch_insn_gen_b(unsigned long pc, unsigned long dest);
@@ -511,6 +512,8 @@ u32 larch_insn_gen_lu12iw(enum loongarch_gpr rd, int imm);
 u32 larch_insn_gen_lu32id(enum loongarch_gpr rd, int imm);
 u32 larch_insn_gen_lu52id(enum loongarch_gpr rd, enum loongarch_gpr rj, int imm);
 u32 larch_insn_gen_jirl(enum loongarch_gpr rd, enum loongarch_gpr rj, int imm);
+u32 larch_insn_gen_beq(enum loongarch_gpr rd, enum loongarch_gpr rj, int imm);
+u32 larch_insn_gen_bne(enum loongarch_gpr rd, enum loongarch_gpr rj, int imm);
 
 static inline bool signed_imm_check(long val, unsigned int bit)
 {
@@ -778,6 +781,22 @@ static inline void emit_##NAME(union loongarch_instruction *insn,	\
 
 DEF_EMIT_REG3SA2_FORMAT(alsld, alsld_op)
 
+#define DEF_EMIT_NOP(NAME)						\
+static inline void emit_##NAME(union loongarch_instruction *insn)	\
+{									\
+	insn->word = INSN_NOP;						\
+}
+
+DEF_EMIT_NOP(NOP)
+
+#define DEF_EMIT_BREAK(NAME)						\
+static inline void emit_##NAME(union loongarch_instruction *insn)	\
+{									\
+	insn->word = INSN_BREAK;					\
+}
+
+DEF_EMIT_BREAK(BREAK)
+
 struct pt_regs;
 
 void emulate_load_store_insn(struct pt_regs *regs, void __user *addr, unsigned int *pc);
diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/inst.c
index 14d7d700b..a47dc3575 100644
--- a/arch/loongarch/kernel/inst.c
+++ b/arch/loongarch/kernel/inst.c
@@ -10,6 +10,33 @@
 
 static DEFINE_RAW_SPINLOCK(patch_lock);
 
+static bool is_image_text(unsigned long addr)
+{
+	return core_kernel_text(addr);
+}
+
+static void  *patch_map(void *addr, int fixmap)
+{
+	unsigned long uintaddr = (uintptr_t)addr;
+	bool image = is_image_text(uintaddr);
+	struct page *page;
+	phys_addr_t phys;
+
+	if (image)
+		phys = __pa_symbol(addr);
+	else {
+		page = vmalloc_to_page(addr);
+	phys = page_to_phys(page) + offset_in_page(addr);
+	}
+
+	return (void *)set_fixmap_offset(fixmap, phys);
+}
+
+static void patch_unmap(int fixmap)
+{
+	clear_fixmap(fixmap);
+}
+
 void simu_pc(struct pt_regs *regs, union loongarch_instruction insn)
 {
 	unsigned long pc = regs->csr_era;
@@ -218,6 +245,36 @@ int larch_insn_patch_text(void *addr, u32 insn)
 	return ret;
 }
 
+int larch_insn_text_copy(void *dst, void *src, size_t len)
+{
+	unsigned long flags;
+	size_t wlen = 0;
+	size_t size;
+	void *waddr;
+	void *ptr;
+	int ret = 0;
+
+	raw_spin_lock_irqsave(&patch_lock, flags);
+	while (wlen < len) {
+		ptr = dst + wlen;
+		size = min_t(size_t, PAGE_SIZE - offset_in_page(ptr),
+			     len - wlen);
+
+		waddr = patch_map(ptr, FIX_TEXT_POKE0);
+		ret = copy_to_kernel_nofault(waddr, src + wlen, size);
+		patch_unmap(FIX_TEXT_POKE0);
+
+		if (ret) {
+			pr_err("%s: operation failed\n", __func__);
+			break;
+		}
+		wlen += size;
+	}
+	raw_spin_unlock_irqrestore(&patch_lock, flags);
+
+	return ret;
+}
+
 u32 larch_insn_gen_nop(void)
 {
 	return INSN_NOP;
@@ -336,3 +393,31 @@ u32 larch_insn_gen_jirl(enum loongarch_gpr rd, enum loongarch_gpr rj, int imm)
 
 	return insn.word;
 }
+
+u32 larch_insn_gen_beq(enum loongarch_gpr rd, enum loongarch_gpr rj, int imm)
+{
+	union loongarch_instruction insn;
+
+	if ((imm & 3) || imm < -SZ_128K || imm >= SZ_128K) {
+		pr_warn("The generated beq instruction is out of range.\n");
+		return INSN_BREAK;
+	}
+
+	emit_beq(&insn, rd, rj, imm >> 2);
+
+	return insn.word;
+}
+
+u32 larch_insn_gen_bne(enum loongarch_gpr rd, enum loongarch_gpr rj, int imm)
+{
+	union loongarch_instruction insn;
+
+	if ((imm & 3) || imm < -SZ_128K || imm >= SZ_128K) {
+		pr_warn("The generated bne instruction is out of range.\n");
+		return INSN_BREAK;
+	}
+
+	emit_bne(&insn, rj, rd, imm >> 2);
+
+	return insn.word;
+}
-- 
2.25.1

