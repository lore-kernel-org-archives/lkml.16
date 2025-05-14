Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9534622D7B9
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215544; cv=none; b=fl28V5SdhUOFz6dOYVqjCB/FzRQPhBmSD0zdP8fcrcPMlZVRWjNC5vYBcqh3IaVY8nOf8xJ3tiZXAkYo8fYkBgkibVagcktdI3/Sr51rO4yD3YC3P0MN45pTBzuzZRahaCAcDfCIOykXAAd9PoXdV7x8yhkEBsmCP7JGrvcV+JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215544; c=relaxed/simple;
	bh=/Q9q/Al+zyku3gbniwLW13b/ret1Q4U4BiyV4vH3nbo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BBAksFHdBHaNxUUUiRnGPHz8Ma5NhmE1+Zvt9AYbHpEnRFlt8xEpvc1+XnzaH09aKZkz+XJtNDrxgAVUAcdzBQ4/qGQ3jFjKE+IcpLFE55cPKnw7okAV5SySZd2/jzSU/WyJEqQyyS7yRz9gbz8N9Dl1fnwZcg/zrTEzTHeWi9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LKdT+UaQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hID/EosP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LKdT+UaQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hID/EosP"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747215540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/HYROmeEdoYy7d9D9b1rSDF4X+kejBdVkRgxHg9uSSE=;
	b=LKdT+UaQjok9K6cAoxFHq6JRad8HL1SbzGffapUhJsnl8z+Em7APOJY4S+AkH+X91D1dxy
	Rq4TLIEg2F1RUqQsM57Ec/b/66Et+22IQbsnh38K9xOVL84IfQlbH5wX6Sl6i5/mkLoD5+
	bObKa4ajpzqdkFLB8XgUPMu/ksRGdfD/EagieB+UwzpWHPmFxgNjtMH50aiAd/DIGZ30E7
	DIQguFjxXjNsInTL5mhwZgndzfR5culv1aL+0fYvcfqOMAy0NPJ9cvCG2MFKcPVf+0A6lC
	3llx8TKhrVVh8Huvoq3dPyikRIXwJKwAkAbG/c0KkyoMKBrOMVJgOtRYJftP0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747215540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/HYROmeEdoYy7d9D9b1rSDF4X+kejBdVkRgxHg9uSSE=;
	b=hID/EosP3UGjeC7eJHpk72qwU2yauIAJ3UY6yDJrd2Uu1+uiSQ55L/DOi6MrmptEZGkHJZ
	3S3Z06bMPsP23RAA==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 10/11] riscv: kprobes: Remove duplication of RV_EXTRACT_UTYPE_IMM
Date: Wed, 14 May 2025 11:38:49 +0200
Message-Id: <8f0defce9f1f23f1b44bb9750ed083cfc124213c.1747215274.git.namcao@linutronix.de>
In-Reply-To: <cover.1747215274.git.namcao@linutronix.de>
References: <cover.1747215274.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use RV_EXTRACT_UTYPE_IMM, instead of reimplementing it in simulate_auipc().

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/simulate-insn.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/p=
robes/simulate-insn.c
index 1717df780409..2b3cd69d6f8e 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -81,17 +81,6 @@ bool __kprobes simulate_jalr(u32 opcode, unsigned long a=
ddr, struct pt_regs *reg
 	return ret;
 }
=20
-#define auipc_imm(opcode) \
-	((((opcode) >> 12) & 0xfffff) << 12)
-
-#if __riscv_xlen =3D=3D 64
-#define auipc_offset(opcode)	sign_extend64(auipc_imm(opcode), 31)
-#elif __riscv_xlen =3D=3D 32
-#define auipc_offset(opcode)	auipc_imm(opcode)
-#else
-#error "Unexpected __riscv_xlen"
-#endif
-
 bool __kprobes simulate_auipc(u32 opcode, unsigned long addr, struct pt_re=
gs *regs)
 {
 	/*
@@ -102,7 +91,7 @@ bool __kprobes simulate_auipc(u32 opcode, unsigned long =
addr, struct pt_regs *re
 	 */
=20
 	u32 rd_idx =3D RV_EXTRACT_RD_REG(opcode);
-	unsigned long rd_val =3D addr + auipc_offset(opcode);
+	unsigned long rd_val =3D addr + (s32)RV_EXTRACT_UTYPE_IMM(opcode);
=20
 	if (!rv_insn_reg_set_val(regs, rd_idx, rd_val))
 		return false;
--=20
2.39.5

