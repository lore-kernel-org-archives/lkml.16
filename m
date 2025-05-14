Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E5122D4C4
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215543; cv=none; b=UxjDJAQtk6c64FFvXoSAtMkoDJyoA+QBEyCtqqKLzWs82RMoJ/bO+0YtakpLfuKoR8HAfobtQmkO7WheR1IySS12hjSAcnHTS2BnJ5q6QE7pKKCb8yU4noSiqhNH2PQcQiSyVAwqmwsPUjmMbeBj58j64qfXlYAJsZkOM5SdqYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215543; c=relaxed/simple;
	bh=DIlIKAA3FTmrmkxh6MhK7D7f7OYAOaBEW9iov3Fhu+k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O3i1Nr8lzFd13A2K9T00nfyLCKzLSVlbf3NdBlkhWVnzuMuBBnmdW0/j2qKKrIFgmaSd+OR8vw7gNCPPypUO/55bfyA6yD5XlI+AfqQ9CF9x/aRk0+qUjJX6Te6NsZRcS13k7VsHyIhI4J1jIeE7kuWNW7RHCfWj+AcVTnYBkl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0ljJnqd6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2ONDfHYd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0ljJnqd6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2ONDfHYd"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747215539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5zozQgL8hNfvDHr+6QpG+zfi9XouqRvI/psbV6Onzs=;
	b=0ljJnqd69eHsdExLWZE2Q0Z59kmesYbIMgxUkOSRtQb4VsNQpNnQnei7XvPZ11YVx6ofIq
	R0b0KfINrR3UX+bjFNdT8SsjAnE6/TNYp648636ag/1YLJp5c0a9OvQ1fOAi3Fq9db0qai
	x1cNZak6dI5IDk5LTMT+CKWbZ3Jwihy3b/Lf1pOd1LcWll1bBG7VfQEa9GLZOYnao8l8hU
	d+qTo5qPVX2E5cDdsHyQaxJsko9z2mA5WeISNFzjJ6DbndPkCz4oCsGeu9+8fsx3bFHAa+
	X0jyPg8OI12Lw1dcm4sDP7s9oiAhwefA5O9AeYHc2XjkOUh+ai050v7s6L5eLQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747215539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5zozQgL8hNfvDHr+6QpG+zfi9XouqRvI/psbV6Onzs=;
	b=2ONDfHYdBi3haCF5NDkeQvJSZUHBABqWTIDCyimkgJ+ByFxm++9pmMUkamj+RabqBULu7r
	BAfEYndGuB4xX/Aw==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 06/11] riscv: kproves: Remove duplication of RVC_EXTRACT_JTYPE_IMM
Date: Wed, 14 May 2025 11:38:45 +0200
Message-Id: <24497deaab06d6b12cb84923606ec26f67e25424.1747215274.git.namcao@linutronix.de>
In-Reply-To: <cover.1747215274.git.namcao@linutronix.de>
References: <cover.1747215274.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use RVC_EXTRACT_JTYPE_IMM, instead of reimplementing it in simulate_c_j().

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/simulate-insn.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/p=
robes/simulate-insn.c
index 3ba97e79a2a3..5defbde4dd50 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -170,24 +170,9 @@ bool __kprobes simulate_branch(u32 opcode, unsigned lo=
ng addr, struct pt_regs *r
=20
 bool __kprobes simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs=
 *regs)
 {
-	/*
-	 *  15    13 12                            2 1      0
-	 * | funct3 | offset[11|4|9:8|10|6|7|3:1|5] | opcode |
-	 *     3                   11                    2
-	 */
-
-	s32 offset;
-
-	offset  =3D ((opcode >> 3)  & 0x7) << 1;
-	offset |=3D ((opcode >> 11) & 0x1) << 4;
-	offset |=3D ((opcode >> 2)  & 0x1) << 5;
-	offset |=3D ((opcode >> 7)  & 0x1) << 6;
-	offset |=3D ((opcode >> 6)  & 0x1) << 7;
-	offset |=3D ((opcode >> 9)  & 0x3) << 8;
-	offset |=3D ((opcode >> 8)  & 0x1) << 10;
-	offset |=3D ((opcode >> 12) & 0x1) << 11;
+	s32 offset =3D RVC_EXTRACT_JTYPE_IMM(opcode);
=20
-	instruction_pointer_set(regs, addr + sign_extend32(offset, 11));
+	instruction_pointer_set(regs, addr + offset);
=20
 	return true;
 }
--=20
2.39.5

