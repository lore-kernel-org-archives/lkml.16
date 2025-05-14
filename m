Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957DA22ACD1
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215540; cv=none; b=Pk74ERAQk09VecD2mAc4UXSvllRr2P2MV8+j1+/UD/vOQKu2tTyzzo55NulrStUGfsvPRRvM8AlIekkDfjFDwxeoXYNl+IfZc2h4eeHkvxXkVUwa5Tnot/QiU5NBzsMxIktQkcYq4fwAMMhnDjPM7V5V51FSfO88aoF4A4hKEsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215540; c=relaxed/simple;
	bh=kEV8Q/fHzV+OSPWamn8wcUhJzJayh85b3Bmt/16tMq0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TzbD5vYPr8ONN2cOU7j5QJV1vI8UoU/DqWow4LxpQSZ/8XBawSpRNXCi/bcPWnfwo+QLhTDPmtw8qtUjEFE6Z0XeDdx4Ka+a3JaDa3apEXjJlUjDJysi1p3CtsgSf5icPqhEiyKo2SCWlupLGuh7JajKAWoN6Siq1pJ0xO55sa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=efv2uWjt; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HOc7v3q0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="efv2uWjt";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HOc7v3q0"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747215536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vc7hFN2UqqM5rL7Gk36K+iB7d3AnRHAfrGO+aBpYAbA=;
	b=efv2uWjtPfvjaXUpGVsRwNAfTGMqfj2p+X46OY3UwsRmp4vQRvFmgCitAJpWQdX8yW3QQc
	jIpI7OrjFWP6/togPpFhu90NfDL3PbODybFCcL6sNG22rqwkGWAMS+xBFg20dgWEn5L8Ht
	sT+CsaCdYRfnR3+2acR4snS7Cyk3rtzCbyUWuP0Nh9HQjOwBGFhDHnkz91rKWvrOOrGr70
	oP6q9VDqoJfDqoaiEKu9zGS3LAyPAwEU/j3/55RObcczCZav9fLx9vJe4gfn288z3e4JZ8
	7Lo1Jy6zB0Qr4sjiw2clzLjBGvoEY13lqrZ9GAE2r1KL2rkbffPcHsaS+qp30Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747215536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vc7hFN2UqqM5rL7Gk36K+iB7d3AnRHAfrGO+aBpYAbA=;
	b=HOc7v3q09eAvQ4EwOjaF0mpWHZX7RoikzXVwKmIM97Tlf45X3InmsIVNEoDkdOwatowuZa
	3Uc0ej2t4BAAF2DQ==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 01/11] riscv: kprobes: Move branch_rs2_idx to insn.h
Date: Wed, 14 May 2025 11:38:40 +0200
Message-Id: <107d4a6c1818bf169be2407b273a0483e6d55bbb.1747215274.git.namcao@linutronix.de>
In-Reply-To: <cover.1747215274.git.namcao@linutronix.de>
References: <cover.1747215274.git.namcao@linutronix.de>
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

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/include/asm/insn.h            | 5 +++++
 arch/riscv/kernel/probes/simulate-insn.c | 5 +----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 7c65fc8baeed..4a26cef3b5c0 100644
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
@@ -450,6 +451,10 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 c=
ode)
 	({typeof(x) x_ =3D (x); \
 	(RV_X_mask(x_, RVG_RS1_OPOFF, RVG_RS1_MASK)); })
=20
+#define RV_EXTRACT_RS2_REG(x) \
+	({typeof(x) x_ =3D (x); \
+	(RV_X_mask(x_, RVG_RS2_OPOFF, RVG_RS2_MASK)); })
+
 #define RV_EXTRACT_RD_REG(x) \
 	({typeof(x) x_ =3D (x); \
 	(RV_X_mask(x_, RVG_RD_OPOFF, RVG_RD_MASK)); })
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

