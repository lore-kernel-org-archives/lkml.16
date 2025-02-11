Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046001FBC89
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739274627; cv=none; b=e6UwEGLRCUIWHnZjiY6Wc+Kf4m+iCNSnhXonnQrbdD+5Ui8htj9TMnvv/a72EIwAiGZfP16vprDUZ+7sBio66tXTfOF5wlLk7rPDwWH55pZQhx5NVInTUu/ZMSNfKvZptHGd1YdO/KhhYpRAcU8ktvUspYgybjRqyi1HEbMTYU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739274627; c=relaxed/simple;
	bh=jk1TS09qxO4JbHZeTrZ0FnbFaTon1gzcwcBCz4n8P6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fnOQCWa058L/nnRcYaxDryBmgm8Gjj+RDmTuAY2qsg9iLoH0J9UF2jCL7SqcTk/ZL4ymvojz7yt9aEKckiLIL3UTatVMuW920ZcbYVwN6viaacavWae4GGYg+ZPySjsYqkd79JTwQTUDom3aIStk6mkNGTYp0hvUy/+s4LYtRgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxXWt9OatnViJyAA--.2080S3;
	Tue, 11 Feb 2025 19:50:21 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBx3MR6OatnNPMLAA--.43600S4;
	Tue, 11 Feb 2025 19:50:20 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/7] objtool: Handle different entry size of rodata
Date: Tue, 11 Feb 2025 19:50:11 +0800
Message-ID: <20250211115016.26913-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250211115016.26913-1-yangtiezhu@loongson.cn>
References: <20250211115016.26913-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBx3MR6OatnNPMLAA--.43600S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxCw4DWw1DJrW3AFy8AFy7Jwc_yoW5KFyUpF
	srA3yfGr1jgryfJw13t3W8Wa98Gas7WryIgFZFqry8ZrW7XrnxJr4IvFy5tF18Zw4FgayS
	qFsYgF1UJF4qywcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_
	JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
	UjIFyTuYvjxU4AhLUUUUU

In the most cases, the entry size of rodata is 8 bytes because the
relocation type is 64 bit. There are also 32 bit relocation types,
the entry size of rodata should be 4 bytes in this case.

Add an arch-specific function arch_reloc_size() to assign the entry
size of rodata for x86, powerpc and LoongArch.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/arch/loongarch/decode.c | 11 +++++++++++
 tools/objtool/arch/powerpc/decode.c   | 15 +++++++++++++++
 tools/objtool/arch/x86/decode.c       | 13 +++++++++++++
 tools/objtool/check.c                 |  2 +-
 tools/objtool/include/objtool/arch.h  |  2 ++
 5 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/arch/loongarch/decode.c b/tools/objtool/arch/loongarch/decode.c
index 69b66994f2a1..b64205b89f6b 100644
--- a/tools/objtool/arch/loongarch/decode.c
+++ b/tools/objtool/arch/loongarch/decode.c
@@ -363,3 +363,14 @@ void arch_initial_func_cfi_state(struct cfi_init_state *state)
 	state->cfa.base = CFI_SP;
 	state->cfa.offset = 0;
 }
+
+unsigned int arch_reloc_size(struct reloc *reloc)
+{
+	switch (reloc_type(reloc)) {
+	case R_LARCH_32:
+	case R_LARCH_32_PCREL:
+		return 4;
+	default:
+		return 8;
+	}
+}
diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
index 53b55690f320..3c95dd74fca0 100644
--- a/tools/objtool/arch/powerpc/decode.c
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -106,3 +106,18 @@ void arch_initial_func_cfi_state(struct cfi_init_state *state)
 	state->regs[CFI_RA].base = CFI_CFA;
 	state->regs[CFI_RA].offset = 0;
 }
+
+unsigned int arch_reloc_size(struct reloc *reloc)
+{
+	switch (reloc_type(reloc)) {
+	case R_PPC_REL32:
+	case R_PPC64_REL32:
+	case R_PPC_ADDR32:
+	case R_PPC_UADDR32:
+	case R_PPC_PLT32:
+	case R_PPC_PLTREL32:
+		return 4;
+	default:
+		return 8;
+	}
+}
diff --git a/tools/objtool/arch/x86/decode.c b/tools/objtool/arch/x86/decode.c
index fe1362c34564..fb9691a34d92 100644
--- a/tools/objtool/arch/x86/decode.c
+++ b/tools/objtool/arch/x86/decode.c
@@ -852,3 +852,16 @@ bool arch_is_embedded_insn(struct symbol *sym)
 	return !strcmp(sym->name, "retbleed_return_thunk") ||
 	       !strcmp(sym->name, "srso_safe_ret");
 }
+
+unsigned int arch_reloc_size(struct reloc *reloc)
+{
+	switch (reloc_type(reloc)) {
+	case R_X86_64_32:
+	case R_X86_64_32S:
+	case R_X86_64_PC32:
+	case R_X86_64_PLT32:
+		return 4;
+	default:
+		return 8;
+	}
+}
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index a84e76e8eae4..85c1988014dc 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1968,7 +1968,7 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 			break;
 
 		/* Make sure the table entries are consecutive: */
-		if (prev_offset && reloc_offset(reloc) != prev_offset + 8)
+		if (prev_offset && reloc_offset(reloc) != prev_offset + arch_reloc_size(reloc))
 			break;
 
 		sym_offset = reloc->sym->offset + reloc_addend(reloc);
diff --git a/tools/objtool/include/objtool/arch.h b/tools/objtool/include/objtool/arch.h
index d63b46a19f39..396f7c6c81c0 100644
--- a/tools/objtool/include/objtool/arch.h
+++ b/tools/objtool/include/objtool/arch.h
@@ -97,4 +97,6 @@ int arch_rewrite_retpolines(struct objtool_file *file);
 
 bool arch_pc_relative_reloc(struct reloc *reloc);
 
+unsigned int arch_reloc_size(struct reloc *reloc);
+
 #endif /* _ARCH_H */
-- 
2.42.0

