Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D742641F8
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 21:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746998297; cv=none; b=qfc3Lcd9iZmio+s5fnb0nhz7TTb2v/m2lEzZWc00axFmxv51/x9sYAlWDq36fsUOYKH0ddYV39W9+ACmPYKxGW+C6IVuxNQh/IbnO9Q671Sx3qHReP5fzhcwJDrKV7QzSyCopRrV/XS427NtSsi2J2OV0CwHaVj372mEpQ1TDmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746998297; c=relaxed/simple;
	bh=Ws2nDVvQopR6wx2xDaiXWVZ9L9hlwAgMsqyPuGIrmp8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YR3lxyDpECRk1mpdn+lyJ5hcXbBMCZFTJ4wAj/P2U57o7cdJv+mAOnVxSN7sibivy3MXq3A3SeE06BCzsxZw//Db2Wov56HAiSFXdJ//KLnzjSZAlOFd4oLEcaKjhWgOISp86Y++G6sKapwTKIDPq3XH5HP49QwY/iBqoIevmvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Q9/Tx3hJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pHSxmLgt; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Q9/Tx3hJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pHSxmLgt"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746998292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ofRlSkfoMczDkVEQIfQIC8RlTmO5xBys4uCekN9vBRo=;
	b=Q9/Tx3hJUILpIEp06fQma9qN1+iMs9Sa/7Z5shRXrMIKOQzz0bV39ArEZo+onXxGUfvtvN
	EuNmPLT04T/FhYA1EHyX/IvK4Fl3l9cZ5Za9ZSc1ii8WrLfW2Mi9cJ4w46x9gVF5TtJ0yL
	5wVL/NO4dSK8iQo8JT0N43ykYoE5lpBls/CymSXANfFz/l9jh/wLOAQN7xsjOZ8a9x8je1
	IwEnKjgoN8V+iTdjBa32loLmQUOgITR2yMS2EEKoaqbO0+Q/KACE1l6YiHxsEX79vaJyL9
	1S0bPNscwlqxKW2Xy9HRQbtPC8yNDfvoNYaHdBqmQz6Tszj3wZyy7cRJXrv2tQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746998292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ofRlSkfoMczDkVEQIfQIC8RlTmO5xBys4uCekN9vBRo=;
	b=pHSxmLgtOBB4FsYEQvh1sDzt8EOQL/+YXiOKHnUtIun3i12yJ03x1iQQOpECZF8Iih4Blp
	LIj42Ii3e28q8vDQ==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 09/11] riscv: kprobes: Remove duplication of RV_EXTRACT_RD_REG
Date: Sun, 11 May 2025 23:18:01 +0200
Message-Id: <710026e5113b9929fd9fca2cdd5d5cd86aa6b447.1746997351.git.namcao@linutronix.de>
In-Reply-To: <cover.1746997351.git.namcao@linutronix.de>
References: <cover.1746997351.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use RV_EXTRACT_RD_REG, instead of reimplementing its code.

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

