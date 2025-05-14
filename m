Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA7022D784
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215543; cv=none; b=WshwX60vbhPxcofWQhn6NZjmAee8PTA7Gu+8ygXgjVb8pAMmgIHWkojxlapTPg9Kgt/pypLqSZPoeBUjl6Oke2IK++4Kn6gDVQJcAGpD2mwx9BdLCiUBO1gszQxpKKkDaPoNhLR48BXolIjoGK2oRnd7en9H1v2swSggtYJNYHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215543; c=relaxed/simple;
	bh=M1/D7MPNnjQjcqk8Eg9AFDFwi2xFP5mANRY2RmGfnqc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I82Ta3EuGhl/BWXcBt2T7AIlyN0Xo8pXgnI5PIWmCoEjpcQ9XCzj2IdymjLbQefNt0iJaJRHcUU4GlDUt1LSI2wKnlfYFnSxK6cyPONZbZVDwZPa8d/gX/t3LZmII6bsidEtQLOqomoS2ZEs/r9KIVj9tuv5H+ezPADSctWyb2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=paBgdSFY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=brfBO61t; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="paBgdSFY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="brfBO61t"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747215539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bm9s++xQZUZyxfYID6OTBZXCHHY8y7W2MffQViKq4mg=;
	b=paBgdSFYfK7Y9o9pL9dp6Lh+/FJqZUM+RY14bCqNjjf7Hyp6GlHcgLkD6W8UX69OE3Xchk
	+u0D5op0cT2KyDmfbyW+ttQ+5KM6KcHPnvVsSEv6WBJTZ+DVtRYeJVGgnBfGV8Rk0b3Mh1
	RrTWRdid8lNaSN3dqCNl2ZSO0PO1mjW9xTFIqcomzUfWCae7rYJqcrba//aVukyzDULRLG
	2kbWHTzC5VBjBZFvkdgHkzahC6LAT8nNu6l5tDrhPJwaoQlzqZlpu/ZOGtyaM99sYWqa6r
	GxVMfxFIirq5ELM9bbbWaLYxFgG2ONltn+Fu5psObrRMM60uYWifEQ1sR80vPQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747215539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bm9s++xQZUZyxfYID6OTBZXCHHY8y7W2MffQViKq4mg=;
	b=brfBO61tAlr4TWR74+1t9HuFTaJnEhHy1EBa5WqxKMd4KVw4DeJbWwqNDs/MidtnwxvetA
	zIV+mc39//S3PzDA==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 05/11] riscv: kprobes: Remove duplication of RV_EXTRACT_BTYPE_IMM
Date: Wed, 14 May 2025 11:38:44 +0200
Message-Id: <07dde8313b787261f07ae25240c97c514cd02d11.1747215274.git.namcao@linutronix.de>
In-Reply-To: <cover.1747215274.git.namcao@linutronix.de>
References: <cover.1747215274.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use RV_EXTRACT_BTYPE_IMM, instead of reimplementing it in
simulate_branch().

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/simulate-insn.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/p=
robes/simulate-insn.c
index 625d514c4ada..3ba97e79a2a3 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -115,15 +115,6 @@ bool __kprobes simulate_auipc(u32 opcode, unsigned lon=
g addr, struct pt_regs *re
 	return true;
 }
=20
-#define branch_imm(opcode) \
-	(((((opcode) >>  8) & 0xf ) <<  1) | \
-	 ((((opcode) >> 25) & 0x3f) <<  5) | \
-	 ((((opcode) >>  7) & 0x1 ) << 11) | \
-	 ((((opcode) >> 31) & 0x1 ) << 12))
-
-#define branch_offset(opcode) \
-	sign_extend32((branch_imm(opcode)), 12)
-
 bool __kprobes simulate_branch(u32 opcode, unsigned long addr, struct pt_r=
egs *regs)
 {
 	/*
@@ -148,7 +139,7 @@ bool __kprobes simulate_branch(u32 opcode, unsigned lon=
g addr, struct pt_regs *r
 	    !rv_insn_reg_get_val(regs, RV_EXTRACT_RS2_REG(opcode), &rs2_val))
 		return false;
=20
-	offset_tmp =3D branch_offset(opcode);
+	offset_tmp =3D RV_EXTRACT_BTYPE_IMM(opcode);
 	switch (RV_EXTRACT_FUNCT3(opcode)) {
 	case RVG_FUNCT3_BEQ:
 		offset =3D (rs1_val =3D=3D rs2_val) ? offset_tmp : 4;
--=20
2.39.5

