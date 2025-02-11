Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482371FCFDF
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739274630; cv=none; b=Gkhw4HouFGmRdqiGopqlgLNNIskcHWZOTBa4PMJrUUx2EB84vlji7x/ElrMXMZnzGhjfe7qlMPKMSiFK5o4b/r5CiKO58k3aC6COqLzuoX3RftlqXgoMxqWR0V+SHDoAXAyVbJxnUvzKJpfIB5mIJTkkP1mKjVg9qXJMLWJBcIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739274630; c=relaxed/simple;
	bh=OQes0auVUwdkFYJo/DfYq5t8km5FIuIzxzDJraV02JM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LaHsml4zUnp2LqhQmN+0W7LZk1gCMGreDTNdB4t2pN0W8EBA6mJmHRs7yiCHig74TIeLePTusxMN5HFgYDYegom5QdM8uAw/t9Arpwr8WTdt3kdalMAtwx6fSdBGg/kUWUa1hceeKkaQDctjWyEaeTAcXZk0Wuyrejq7oa/vy1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxDGuBOatnaCJyAA--.2098S3;
	Tue, 11 Feb 2025 19:50:25 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBx3MR6OatnNPMLAA--.43600S8;
	Tue, 11 Feb 2025 19:50:25 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/7] LoongArch: Enable jump table for objtool
Date: Tue, 11 Feb 2025 19:50:15 +0800
Message-ID: <20250211115016.26913-7-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowMBx3MR6OatnNPMLAA--.43600S8
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uFWDWF4fuF1fAr1fAryfZrc_yoW8WrW3pw
	s7Zr4vgr4kWFn5trZrJ3yFgr98JrnrKr43XF42ka48AFW7Z3yUZr48ta9rXF1UAwsxJrWI
	qFWfKasIvFWUJ3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_
	JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
	UjIFyTuYvjxU4miiDUUUU

For now, it is time to remove -fno-jump-tables to enable jump table for
objtool if the compiler has -mannotate-tablejump, otherwise it is better
to remain -fno-jump-tables to keep compatibility with older compilers.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/Kconfig  | 3 +++
 arch/loongarch/Makefile | 6 +++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 2b8bd27a852f..15aaa2e6757e 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -291,6 +291,9 @@ config AS_HAS_LBT_EXTENSION
 config AS_HAS_LVZ_EXTENSION
 	def_bool $(as-instr,hvcl 0)
 
+config CC_HAS_ANNOTATE_TABLEJUMP
+	def_bool $(cc-option,-mannotate-tablejump)
+
 menu "Kernel type and options"
 
 source "kernel/Kconfig.hz"
diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index 567bd122a9ee..0304eabbe606 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -101,7 +101,11 @@ KBUILD_AFLAGS			+= $(call cc-option,-mthin-add-sub) $(call cc-option,-Wa$(comma)
 KBUILD_CFLAGS			+= $(call cc-option,-mthin-add-sub) $(call cc-option,-Wa$(comma)-mthin-add-sub)
 
 ifdef CONFIG_OBJTOOL
-KBUILD_CFLAGS			+= -fno-jump-tables
+ifdef CONFIG_CC_HAS_ANNOTATE_TABLEJUMP
+KBUILD_CFLAGS			+= -mannotate-tablejump
+else
+KBUILD_CFLAGS			+= -fno-jump-tables # keep compatibility with older compilers
+endif
 endif
 
 KBUILD_RUSTFLAGS		+= --target=loongarch64-unknown-none-softfloat -Ccode-model=small
-- 
2.42.0

