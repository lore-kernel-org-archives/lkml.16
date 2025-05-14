Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAEA22D789
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215543; cv=none; b=XOMgRlX5GNGEXm+MWGF5f5D2PEHB9WjHUukBQpWxQFKAPAcHrg7FX1QR0dCr3NgCFe8Q5PzXpMquSbdYWXhyh536VLR7C+/wmE565i0i2n+A4T3DhIA1gGk3Q7Vx5OsHxbv1w6owPwejynGH9kQ8NS3jmE3rKU4aAs+94SO4jzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215543; c=relaxed/simple;
	bh=AubDRqfkPRHxBp7SUrQ2lcZs1wpYfs5RlqD8dw6LGIc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HhfMd/dkI9MUMHtwvmhGFhX/ztm2W9B+SH25PDG+SXb9JQkGO5qvaB8hZCs9WWanaIwl35vKHRfa/c3zNgoCinXwC2Nb6eLUUGNT8FcyBVZaE46rXNl4e/7Av31Tpb8vTRyQT1clHR/h0vFfIhbXhX3nYDkc0/1+6sYCft/cjHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RyufCY3k; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ibtVUyaV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RyufCY3k";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ibtVUyaV"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747215539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OfgQRDO7AB6uETq0DU5GYjI7YmKL4k2E304qWHHoNUk=;
	b=RyufCY3k//eNjv7tWeK1662ub2Z1eNq9TjWH1G8DQK4D6b8QfLj8WHd9EU6AIz25PNz3KV
	gjFDj1dWabJE9+kk7WBAlxgezpJSyahavni5xgGhb1RcWu2G4lZtCZgwdvpUdSj04ZnKdA
	1qy4FBB8x78xGuRvSMvITyc1G4azGitqZaRZatOgtL1afnB7XZp8KuCyfSK7jEtkE2AdyK
	YRNocxKLzf0hwRcQK6JmfZIl+LRuH4lH9vJEip9gf8bK+EYOl6GHkQhQaj1fsgfaLYD3vX
	/U9BBLtNFi9Bbb6B4ev/v/qi9LvEEk5uYBg+2H8Z1Xmlzvbr/TfHKKKYMfhE9A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747215539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OfgQRDO7AB6uETq0DU5GYjI7YmKL4k2E304qWHHoNUk=;
	b=ibtVUyaVu6qhfG/3XG4o82j7JacZZzxQp03SCi18+9zGlP8MgkBLnsK2EsFCVg/Zf6nSvK
	ZmyRew9ruVmob8BA==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 07/11] riscv: kprobes: Remove duplication of RVC_EXTRACT_C2_RS1_REG
Date: Wed, 14 May 2025 11:38:46 +0200
Message-Id: <d56955cd683411c6d2f63d13c78e0572462a3269.1747215274.git.namcao@linutronix.de>
In-Reply-To: <cover.1747215274.git.namcao@linutronix.de>
References: <cover.1747215274.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use RVC_EXTRACT_C2_RS1_REG, instead of reimplementing it in
simulate_c_jr_jalr().

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
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

