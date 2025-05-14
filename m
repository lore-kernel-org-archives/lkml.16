Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952DF22D7B7
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215544; cv=none; b=MqhKXiQBbmhKHpM+Nj4iyCh3mn7n+U4pPhX0813qTerSvutrhTPVMhPfcqLzN5ytD+NEj6cdXg++KkwmMWyFsYnSjws7UPVK9B+R6OefQwJwFdkdmjW36IHiw6wejgOD+2hPumm2TQ+93LlxEwEsGciaynGPIaRuzGTxEVqMbm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215544; c=relaxed/simple;
	bh=2gM43omb8x6mSTqYiUz/2moBg01FcZhf0F+9slbotVs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AUmKpEtjmo+JIUO6hv67m/erCQ2ViT2YYMxsmFihOAz4ccWTiOsI+b1xAR0+oioNJ4m4AjREASKx16qo3raPjxwB2oibkOQ38Dx7UhfUzB8tc6VsMk5Gm51fL0RsOErC9Wy30JdXHzUR5kIYz1PgaaYKWeYUAqu4/70y8/0vv6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LkcgnH8c; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rXSEls3N; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LkcgnH8c";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rXSEls3N"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747215540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lDp33p40Fs1LitBtjBZir0UwSJ9OxuzJPP9MYbv6Fc8=;
	b=LkcgnH8cWHAmLFA4pMJkssj8pMMZACHqx4p5AjiUS9IiINzmH8+09AS29UnKZRbq8iimyf
	oLDu32l7xViCJAkc60RGG1AGbO9ZHNO1n/81dDv+zyG27Q+PBFQg/gMN8/yMgxw366JvKc
	xxOEImHJBw5E5upnU4Qss6zpAlwQE6lLmSU7HDaa3Zbq3u8F63b3B27Zf0DcYv69ayzpf3
	TR+jkjUF5xYJacdAtdNnlhoPcwa+AE891+ObrkmY7jJlTFmpG2qHpsMFghnVvROTKU+Qvm
	tW/VJ9whm2/0nKS+Z4zd5mv/rgv3TFrhkKivi98FM+zHbdSBrvPNf/+tqm7TCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747215540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lDp33p40Fs1LitBtjBZir0UwSJ9OxuzJPP9MYbv6Fc8=;
	b=rXSEls3Ngno0szaoJwN4237PfBnnJgQ6yeAC/E36Vrahzxi+Wfsg2+hMkDXSqHjx4CT2RC
	sTsJhDPy3O+VVNDA==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 09/11] riscv: kprobes: Remove duplication of RV_EXTRACT_RD_REG
Date: Wed, 14 May 2025 11:38:48 +0200
Message-Id: <b31e5b41df5839a76103348e54dc034c8a43447a.1747215274.git.namcao@linutronix.de>
In-Reply-To: <cover.1747215274.git.namcao@linutronix.de>
References: <cover.1747215274.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use RV_EXTRACT_RD_REG, instead of reimplementing its code.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/simulate-insn.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/p=
robes/simulate-insn.c
index e670e55954d2..1717df780409 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -42,7 +42,7 @@ bool __kprobes simulate_jal(u32 opcode, unsigned long add=
r, struct pt_regs *regs
 	 */
 	bool ret;
 	s32 imm;
-	u32 index =3D (opcode >> 7) & 0x1f;
+	u32 index =3D RV_EXTRACT_RD_REG(opcode);
=20
 	ret =3D rv_insn_reg_set_val(regs, index, addr + 4);
 	if (!ret)
@@ -65,7 +65,7 @@ bool __kprobes simulate_jalr(u32 opcode, unsigned long ad=
dr, struct pt_regs *reg
 	bool ret;
 	unsigned long base_addr;
 	u32 imm =3D (opcode >> 20) & 0xfff;
-	u32 rd_index =3D (opcode >> 7) & 0x1f;
+	u32 rd_index =3D RV_EXTRACT_RD_REG(opcode);
 	u32 rs1_index =3D RV_EXTRACT_RS1_REG(opcode);
=20
 	ret =3D rv_insn_reg_get_val(regs, rs1_index, &base_addr);
@@ -81,9 +81,6 @@ bool __kprobes simulate_jalr(u32 opcode, unsigned long ad=
dr, struct pt_regs *reg
 	return ret;
 }
=20
-#define auipc_rd_idx(opcode) \
-	((opcode >> 7) & 0x1f)
-
 #define auipc_imm(opcode) \
 	((((opcode) >> 12) & 0xfffff) << 12)
=20
@@ -104,7 +101,7 @@ bool __kprobes simulate_auipc(u32 opcode, unsigned long=
 addr, struct pt_regs *re
 	 *        20       5     7
 	 */
=20
-	u32 rd_idx =3D auipc_rd_idx(opcode);
+	u32 rd_idx =3D RV_EXTRACT_RD_REG(opcode);
 	unsigned long rd_val =3D addr + auipc_offset(opcode);
=20
 	if (!rv_insn_reg_set_val(regs, rd_idx, rd_val))
--=20
2.39.5

