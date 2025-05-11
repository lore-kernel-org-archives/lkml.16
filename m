Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD204264A6E
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 21:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746998297; cv=none; b=ZG5VmkrPckUlzZhtSsqdZuDlylh/RcjU4JmzpozyFF15XVtaA0ON2AaLVZOh8B0wJ4n2M21i5gUulHrXG2nYefauXbDbVpfVjevPFUyc8Ns9tZgyO6uaGT/FgPkpZ7zAeWl4085WJDW9j9fYuuXzAIJAByXWDmA7+zmaBImutLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746998297; c=relaxed/simple;
	bh=j1DioIwVOiyApHB2qerSx2O5NWoG+WaJcUbS8nbLoe8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d/fiZe3wGA3eCmRKU1LH9J6e9DWcGgkprogOQIcSUeFgzoB9B487ufi5kpnsoW3J9XafOolWvQu77hdxbD4ujobhNicZbme6MKpvwvX7FzrnsH5BUPCRvX/gUH3shXCeSdT0HLh/BjugD8l6JfG0Zw1WzX1TTIdDD2D3BlGqvNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HjhXIJUW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8dMpZIAP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HjhXIJUW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8dMpZIAP"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746998293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+YuprVJ8dctdiMrh0XyEl1XTvNDpL+VEXZc49r4qPy8=;
	b=HjhXIJUWdi8O9Rjb+lJg29OUgeDPdJWXzI99fJq+fOrfdfQZaoT8hiYI7HgVH1BUjrGhVY
	lkbKGy7kzWhUgHyru7UkTQu3Rrb8qiYZB8hojXg2zpn8QYX7lJec0W1/mzLJn/6fKMFmxP
	zAVtCRhVBjFS/5MfUhTwaiOb5JBhyvb0nboHu3fzUmK02yS9RqgolSjiJgngFwElWaJm7C
	koHdoTUQx5pWd1wblFNiEPYj2MoHIwTFUzeMKKXPRefoGui8iWMapD/iZm5XJ5Tt0pcmB9
	MYybPxNM5F8F38d1qCQBQslYe+mtijglSRdfN21Cz3fkRVDRSG5YxG4zruq5Tw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746998293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+YuprVJ8dctdiMrh0XyEl1XTvNDpL+VEXZc49r4qPy8=;
	b=8dMpZIAPEiO5C/lMba+ZSdSkzzwVmpOhUMWmswW2C1y6tXcJkn3B5wZmKEQ6W8VA2tm2bk
	CsxYeXtYrUpJJGBA==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 11/11] riscv: kprobes: Remove duplication of RV_EXTRACT_ITYPE_IMM
Date: Sun, 11 May 2025 23:18:03 +0200
Message-Id: <2a2d138d1a5c011a00ba2a9eb84d5226304d7b48.1746997351.git.namcao@linutronix.de>
In-Reply-To: <cover.1746997351.git.namcao@linutronix.de>
References: <cover.1746997351.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use RV_EXTRACT_ITYPE_IMM, instead of re-implementing it in simulate_jalr().

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

