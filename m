Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B431B22D9FF
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215544; cv=none; b=Z5KIQcQWbwQK8Dvp2LZ0SwmWO1Hr2dq7krWpK+cnBEEfyBFAB5ppqH6QdHgXP5A4JdPi8TT1iIgyUXnftzjSPfrrvF3p1qOfGR3TdeH5ACyUKfJUSNMDZpW/L2do99cO8pAICzTpIc7eeAgbz5TgcQRHhng/LhZSNhQn1Fg6fAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215544; c=relaxed/simple;
	bh=bTLzb+Ezuh7TwlU6p0BQuHaTpUzDUWvpnpKsbIn10+4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rjrCRpyX/y9sKQl/XQZmEUy/hHzBWp0ukwrdeLERKmpMCFhQRp5Zp8bzFJUYVZL/uRZJV/JScSZQY3tNYK5RYSz/bCx6gaHUc7Klpp5lXccCSDn6MMpKTB3V41exj0inTII1X7wnbjzY9oN6rfKCn2oqY0Fy4bbdg/NF8g7g/4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DRvvYk6c; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=d38MzEbN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DRvvYk6c";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="d38MzEbN"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747215541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K31BZ+j3XRd8vHo0dCxUnqdgWHJZ/Z7V6F2CPRYuCbE=;
	b=DRvvYk6c/U8XNuYzayAq7PxEtAYweKvWNdyc99uyL2joXAAABOHAdOI3pRm5eOFVFVEgUR
	MBSQGF63KB8eFq01XLppGYCSkBPzzqfCj+cW6DoMORslUFgaGCoun0dZ6MMqp4s2fTCfGi
	lZCbLz9fvn6wBNTCo8nwHe5CHpIqtBhqnzndo3heuQ7DiKYXdXaC/PWgqAKODAodptbU0C
	g/kf5t8cStoeBHG6ACz6Xt69cz0H86uA+sXA97VNFmDztTp39TzoxT+8w+f+HLpWzlftAl
	+Gt4CkXT6orIZ+ShHxBVnoNb9hp7K1SRA+DZpQaLSWVaflO9dCtalG4FghwZlQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747215541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K31BZ+j3XRd8vHo0dCxUnqdgWHJZ/Z7V6F2CPRYuCbE=;
	b=d38MzEbN7AJxqLXq5RdEhXH154Ne6BMPE07o2CY8WmsywLpE0O7fi9iezjGRtFewNvDqXO
	26244oroFV8C+HAw==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 11/11] riscv: kprobes: Remove duplication of RV_EXTRACT_ITYPE_IMM
Date: Wed, 14 May 2025 11:38:50 +0200
Message-Id: <8ae34e966c312ae5cf6c09a35ddc290cce942208.1747215274.git.namcao@linutronix.de>
In-Reply-To: <cover.1747215274.git.namcao@linutronix.de>
References: <cover.1747215274.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use RV_EXTRACT_ITYPE_IMM, instead of re-implementing it in simulate_jalr().

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/simulate-insn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/p=
robes/simulate-insn.c
index 2b3cd69d6f8e..fa581590c1f8 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -64,7 +64,7 @@ bool __kprobes simulate_jalr(u32 opcode, unsigned long ad=
dr, struct pt_regs *reg
 	 */
 	bool ret;
 	unsigned long base_addr;
-	u32 imm =3D (opcode >> 20) & 0xfff;
+	u32 imm =3D RV_EXTRACT_ITYPE_IMM(opcode);
 	u32 rd_index =3D RV_EXTRACT_RD_REG(opcode);
 	u32 rs1_index =3D RV_EXTRACT_RS1_REG(opcode);
=20
--=20
2.39.5

