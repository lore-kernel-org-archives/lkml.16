Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB6035962
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 04:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749614423; cv=none; b=OJJE51OxaC1VT8Sc86fZtYd4Ny/2jwK6Ll6rh0jXMRl+2zS4+3+ONDDa6vW5tplQU4J+utUDGG1Lb9XhFAEkshNbyAwZJghfCXt1B82g+/Cl13jTh56vdJp1yq1CuVV3+qM1kSKh+DCcgGHcPCPJ0u9RsyLFI0aYwp7RpUoEUyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749614423; c=relaxed/simple;
	bh=6hil3jme6RmuqIKWHKQsZ2pdj9ZHIGCX1CiT7H80zY0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I0eZbB07pY7rHMut/rL5VItckTUqo08oj65XIOT4iczQaorO0ii4mfGue5MVE2UbX0WWqQNsPiWFbG3qJU/49X01TzxLAccaofmfFtPX2siOhSDbZLvtKZmkCs+EW9RWMJlNJGgbbC7DlnnB40NkSNNv+L7Q2Vzom5W6wu8ZxJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 9453542c467811f0b29709d653e92f7d-20250611
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_UNTRUSTED, SRC_UNTRUSTED, IP_LOWREP, SRC_LOWREP
	DN_TRUSTED, SRC_TRUSTED, SA_EXISTED, SN_UNTRUSTED, SN_UNFAMILIAR
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD
	CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_T1
	AMN_GOOD, AMN_C_TI, AMN_C_BU, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:fad50d13-a218-43e3-b9cf-28ee8e40ef2d,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-INFO: VERSION:1.1.45,REQID:fad50d13-a218-43e3-b9cf-28ee8e40ef2d,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:5
X-CID-META: VersionHash:6493067,CLOUDID:25766d04431907a701408f86e60b33d2,BulkI
	D:250610171449T7G5X9KM,BulkQuantity:3,Recheck:0,SF:17|19|25|38|45|66|78|81
	|82|102,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:40,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR
X-UUID: 9453542c467811f0b29709d653e92f7d-20250611
X-User: duanchenghao@kylinos.cn
Received: from localhost.localdomain [(223.104.40.103)] by mailgw.kylinos.cn
	(envelope-from <duanchenghao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1030593121; Wed, 11 Jun 2025 12:00:14 +0800
From: Chenghao Duan <duanchenghao@kylinos.cn>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	yangtiezhu@loongson.cn,
	hengqi.chen@gmail.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	linux-kernel@vger.kernel.org
Cc: guodongtai@kylinos.cn,
	duanchenghao@kylinos.cn,
	youling.tang@linux.dev,
	jianghaoran@kylinos.cn,
	Youling Tang <tangyouling@kylinos.cn>
Subject: [PATCH v1 2/5] LoongArch: BPF: The operation commands needed to add a trampoline
Date: Wed, 11 Jun 2025 11:59:49 +0800
Message-Id: <20250611035952.111182-3-duanchenghao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250611035952.111182-1-duanchenghao@kylinos.cn>
References: <20250611035952.111182-1-duanchenghao@kylinos.cn>
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

