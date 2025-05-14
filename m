Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEE422B8D4
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215542; cv=none; b=As47cOCh4oRPk6aNk4SLTmbcx6+3FomeMvJtnDKlaUCZFh4ikWlRhJwbkbmQU1AqHJAPl5P7HbhfdJs0N1YTvtFSnRMxKRkLWDvMIJgcPq/0nmMyipJ9Sc0PlLSX0DIQlFijMY7fnrb8uBWaiEraoMr7ZtCkNjZilDAtVdARN3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215542; c=relaxed/simple;
	bh=bAf1KeQgY+S4odA+zjDMDASFtXQ3F/v+Z+z9pyisvBI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=On0y+8qbHB0wvREWKFqFSS13TqyfDSwAkyNl9HFE1vV2wnLQD4WUKbMlJTOB4JDKBNrMsk12FuivUS26DDoJY5OwkGWXtqmBy075bd2bS4uFvkXgqYlryfEw5KvLnvcz8YC38t7xfhQIyTeJnZGA5FaXMZCO3lhfq38Nam5aktU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Cab2874f; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=k6wzvEby; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Cab2874f";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="k6wzvEby"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747215538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yu9ObJyfNpp1PZ2rXY3qx0bjof6NU76pzsErYsbGgBo=;
	b=Cab2874fldAN3ra0e1pMc6uH6YhYOkMAwYo3z/w2R7k0yplAtAXUAhc4YNrXPeNZoWCdLX
	c6jmzzsfirM6B3JYyTGZ/FFoj6mEsr1NBtksf/c6UlQ6A555CEB7P0FLMTrepais4ab5ne
	QD3zkkzV8pCP1Z0DbxvF3tMzIFxXS0ktb1EDDAjp7fSkM2H4Jr6pYh+errNwMjrtcDy+ZE
	aL6WqarJ4PRZBDfJhCmzQtbnHNQp8blqUujp2kU0ZJD1CZVmfjd60CIupWxnPDAktMV3O5
	UEd4rDGA7xYVW7JGfZYu5oYI2EyQ+ZamCr9el4ijL15kGK7U41sW7bync4oNlw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747215538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yu9ObJyfNpp1PZ2rXY3qx0bjof6NU76pzsErYsbGgBo=;
	b=k6wzvEbyUSNIta1mdsVubFmN6ByhJLT6afy2aP4N7pZC4OgPjMw3BoN9QYDvmgBNtAvDAk
	ymX7B3MGb46v0ZDw==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 04/11] riscv: kprobes: Remove duplication of RV_EXTRACT_RS1_REG
Date: Wed, 14 May 2025 11:38:43 +0200
Message-Id: <b441038c991da11a7a48ea7140ab00e3bb119387.1747215274.git.namcao@linutronix.de>
In-Reply-To: <cover.1747215274.git.namcao@linutronix.de>
References: <cover.1747215274.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use RV_EXTRACT_RS1_REG instead of reimplementing its code.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/simulate-insn.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/p=
robes/simulate-insn.c
index b76a691d0d9a..625d514c4ada 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -66,7 +66,7 @@ bool __kprobes simulate_jalr(u32 opcode, unsigned long ad=
dr, struct pt_regs *reg
 	unsigned long base_addr;
 	u32 imm =3D (opcode >> 20) & 0xfff;
 	u32 rd_index =3D (opcode >> 7) & 0x1f;
-	u32 rs1_index =3D (opcode >> 15) & 0x1f;
+	u32 rs1_index =3D RV_EXTRACT_RS1_REG(opcode);
=20
 	ret =3D rv_insn_reg_get_val(regs, rs1_index, &base_addr);
 	if (!ret)
@@ -115,9 +115,6 @@ bool __kprobes simulate_auipc(u32 opcode, unsigned long=
 addr, struct pt_regs *re
 	return true;
 }
=20
-#define branch_rs1_idx(opcode) \
-	(((opcode) >> 15) & 0x1f)
-
 #define branch_imm(opcode) \
 	(((((opcode) >>  8) & 0xf ) <<  1) | \
 	 ((((opcode) >> 25) & 0x3f) <<  5) | \
@@ -147,7 +144,7 @@ bool __kprobes simulate_branch(u32 opcode, unsigned lon=
g addr, struct pt_regs *r
 	unsigned long rs1_val;
 	unsigned long rs2_val;
=20
-	if (!rv_insn_reg_get_val(regs, branch_rs1_idx(opcode), &rs1_val) ||
+	if (!rv_insn_reg_get_val(regs, RV_EXTRACT_RS1_REG(opcode), &rs1_val) ||
 	    !rv_insn_reg_get_val(regs, RV_EXTRACT_RS2_REG(opcode), &rs2_val))
 		return false;
=20
--=20
2.39.5

