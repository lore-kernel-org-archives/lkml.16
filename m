Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B463AD5E
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 21:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746998293; cv=none; b=Lg8v9oZaeqJGoBaaiP1rTvED6wTG/YiYj30t+B7FNaCfzMDOCqChv9S9axV6rb0AdxW5ZlGXzKcQArwSL1zx26TU20UKI2uXIKbuS5w7t0poIOVGXyMtmWGdEquR+IFR183TxAVaIBtlC0uhhdRr4uHNxfvdlUVz9jnKNxai524=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746998293; c=relaxed/simple;
	bh=AT0dkOt/V1S66J9dhOa+5gRvtd4XTG+pS1fF9RBhuvY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C4LRGLcT5RYmb80efxivnu9JvJ7XgHQn6HL5h7asRLz9cEHh43gSyODfCa+RlyC4hbe7pzZZkARV07CtiW99oIEOlh4BTP8sM/vcJamfIqOqlGlVjf3XZ1nHpkAjHAL9iR4vWHi6HK3ZGEba1vZkmvOtw3Og1fVoctRkM2yxNu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LVjSERZI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=X6YpUcis; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LVjSERZI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="X6YpUcis"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746998289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bwAuKW9kYlwuhZ5fc51sK5eAF9d1ZLTlSnKrLdUvZZk=;
	b=LVjSERZIAXGi22PyvdSZ4AXHI3XMv7ggJRB2peVblR9jQ1xAMGR752ODWGl1DkIseOHZke
	1DmjgWIITxKkjtOUc+21cTY9nlTU1YXpHYvjeBJBmZohCwfY2pgTwitBcwNss0WBkfZvbI
	maV6N7U1dRuaBW0g9gxv3lZz1Y6e5FZtAwLqpI/6r5/thQLh1q1jFpdTRbop8E5/6vs8jz
	7T4g/2A2x/reCHXOgWP+iZz9z2YA0BRcJqmp061s+VSIvTYX2+zyBY+5nd29T6p9coqRiP
	3ev+MQqT1IgkY/vfRpWOSFxgdS0SikmH75qNGcTBtJoR+/m73oF1P9n2iny3jQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746998289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bwAuKW9kYlwuhZ5fc51sK5eAF9d1ZLTlSnKrLdUvZZk=;
	b=X6YpUcismhvYvjjnS46wn+ipr1NoAFmJQmte/QBn4TYKLoWWOX/I47cAm9Z2ka2mwX5zVf
	/FKEZDpSjaB8ZJBQ==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 01/11] riscv: kprobes: Move branch_rs2_idx to insn.h
Date: Sun, 11 May 2025 23:17:53 +0200
Message-Id: <9b528d3c1de5291d1540b3617e63d40b9889c88f.1746997351.git.namcao@linutronix.de>
In-Reply-To: <cover.1746997351.git.namcao@linutronix.de>
References: <cover.1746997351.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Similar to other instruction-processing macros/functions, branch_rs2_idx
should be in insn.h.

Move it into insn.h as RV_EXTRACT_RS2_REG. This new name matches the style
in insn.h.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/include/asm/insn.h            | 5 +++++
 arch/riscv/kernel/probes/simulate-insn.c | 5 +----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 09fde95a5e8f..debac13a3476 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -64,6 +64,7 @@
 #define RVG_RS2_OPOFF		20
 #define RVG_RD_OPOFF		7
 #define RVG_RS1_MASK		GENMASK(4, 0)
+#define RVG_RS2_MASK		GENMASK(4, 0)
 #define RVG_RD_MASK		GENMASK(4, 0)
=20
 /* The bit field of immediate value in RVC J instruction */
@@ -295,6 +296,10 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 c=
ode)
 	({typeof(x) x_ =3D (x); \
 	(RV_X(x_, RVG_RS1_OPOFF, RVG_RS1_MASK)); })
=20
+#define RV_EXTRACT_RS2_REG(x) \
+	({typeof(x) x_ =3D (x); \
+	(RV_X(x_, RVG_RS2_OPOFF, RVG_RS2_MASK)); })
+
 #define RV_EXTRACT_RD_REG(x) \
 	({typeof(x) x_ =3D (x); \
 	(RV_X(x_, RVG_RD_OPOFF, RVG_RD_MASK)); })
diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/p=
robes/simulate-insn.c
index 6c166029079c..77be381bb8b4 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -121,9 +121,6 @@ bool __kprobes simulate_auipc(u32 opcode, unsigned long=
 addr, struct pt_regs *re
 #define branch_rs1_idx(opcode) \
 	(((opcode) >> 15) & 0x1f)
=20
-#define branch_rs2_idx(opcode) \
-	(((opcode) >> 20) & 0x1f)
-
 #define branch_funct3(opcode) \
 	(((opcode) >> 12) & 0x7)
=20
@@ -157,7 +154,7 @@ bool __kprobes simulate_branch(u32 opcode, unsigned lon=
g addr, struct pt_regs *r
 	unsigned long rs2_val;
=20
 	if (!rv_insn_reg_get_val(regs, branch_rs1_idx(opcode), &rs1_val) ||
-	    !rv_insn_reg_get_val(regs, branch_rs2_idx(opcode), &rs2_val))
+	    !rv_insn_reg_get_val(regs, RV_EXTRACT_RS2_REG(opcode), &rs2_val))
 		return false;
=20
 	offset_tmp =3D branch_offset(opcode);
--=20
2.39.5

