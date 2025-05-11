Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A25263F3C
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 21:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746998296; cv=none; b=lWo0909yAOhdl4WrnojJfSoR7l6l9ToNXE0oj3F/UkzoHIzAOWD0w+Ohk5hSqYCySaCDPiUfrNG5w7sa0e4WfwX6xe1WkqACr35ocRoTY4huE9d1EDwCzjmVVEodSALl2C7w1sXBCkQaezKjrHnXBdwF7t6hwG4PtGYAsly526A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746998296; c=relaxed/simple;
	bh=QsTzxUopKKXbnTEdlpuz6mx4BzuWawlvZVsLdLy4dnw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bHQm0y0wvmp1TCpgfsXcCEP5WhSccuqoLHKzUL/XYXXDz9osSbV8gIvAiRQ79KJulPMmc1KvHKg17Dh04AXOZmYorYq6p3WU1BiV1RqL8UA/J48/sdYQz3IMlBO6gye7GCvUc7I492YjOkH24jR8bCbjkEpOazrtTGvP9TT9O3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bX57btfV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ikqp5HGK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bX57btfV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ikqp5HGK"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746998291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQXO+2w86UaaANetpNDoYy9jOymgZL7O24AgGpF2SFk=;
	b=bX57btfVcuydNfuyd0bS+isHMlT5cqHTKRypA/k7l6x9dBqH4eyrM+w8WqsWco0GoWhFWl
	6MBeEp1zYVc1uVqVwOdW6W/FGwbnJm8VmGiYlZZdGE4C12IQwoSv9TEm5qCFrQoV/9lVqD
	tRu/bpF1TcE/S40evqg6EkhdkiwCgUlAhS0R2m7w5r7flhrtJYxiQCzwe2/szgT1TcB76L
	1dXNoWb4BtSnkVHbd/hvQmITA57EYdFJB5mU9AGnjp6Zx8o6VI9VdjeHtGh2sfFn/J2aDb
	e152pyFc774gu/ziSSMSYrNPOoXQLTDwUZQNW99qnCXD2rsWFc0GeUw6siJkgA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746998291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQXO+2w86UaaANetpNDoYy9jOymgZL7O24AgGpF2SFk=;
	b=ikqp5HGKRJ5owMaPvaVESfntKsc2pbQcG1oKyxOIFpFdkz94WXYMcmFsiSvUDgsDVl2CWd
	wxjnnjxrIBz+8zDQ==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 07/11] riscv: kprobes: Remove duplication of RVC_EXTRACT_C2_RS1_REG
Date: Sun, 11 May 2025 23:17:59 +0200
Message-Id: <0c07ff8c9c61511e30200aa997d93612676d1a07.1746997351.git.namcao@linutronix.de>
In-Reply-To: <cover.1746997351.git.namcao@linutronix.de>
References: <cover.1746997351.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use RVC_EXTRACT_C2_RS1_REG, instead of reimplementing it in
simulate_c_jr_jalr().

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/simulate-insn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/p=
robes/simulate-insn.c
index 5defbde4dd50..f5d64613dab5 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -188,7 +188,7 @@ static bool __kprobes simulate_c_jr_jalr(u32 opcode, un=
signed long addr, struct
=20
 	unsigned long jump_addr;
=20
-	u32 rs1 =3D (opcode >> 7) & 0x1f;
+	u32 rs1 =3D RVC_EXTRACT_C2_RS1_REG(opcode);
=20
 	if (rs1 =3D=3D 0) /* C.JR is only valid when rs1 !=3D x0 */
 		return false;
--=20
2.39.5

