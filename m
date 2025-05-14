Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9584322ACD3
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215540; cv=none; b=gy7/Z3srCzJsrMGrzONlywXQC1ucfXFvk1XuFntiYnWUIg0aXbscgqFpAfxQZYZDDUnDhKc+iL4SgJQCL0QcJrptPczkhbgsIi3+6UaT7UNo639nKLatn8eyMbZctbFPWm9STWjKApRJcyk/8VNuKj2c/0zI9wuKzAzQcdKp7m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215540; c=relaxed/simple;
	bh=h/kcPQL5cDBGxEiXlSfwtWkXEJ+Uhq4yRCnSRwFX3j4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kgxdTgIJKtqcEIWOmtFXEy6xjH+QBEmD1VqiOV6mb6QPKnRtZSU7e9iRUTZh7hFlJdXWuIO6S2qhCigc4+o7MAEdPpk5PmskR6Raowq4J+puAC2vxOEwc0G37TqnmgCpADRSuunsJRPN47n2NvurUHQsXPePQmA76upJ9uhq6bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=akjHKHTd; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GROZoH0n; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="akjHKHTd";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GROZoH0n"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747215536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zSbuYDRtVvHSPCJT7OiqBZPf1qjnHuxHcxmCjMw550E=;
	b=akjHKHTdS+qA9f2SWAX76YwS7nCi/1TgOE+zVabQITFoOBufupyyO5lWVEGYYGHi3euo9N
	BtCH3pNcj0GuptlONdSI5ZIqouX6J6YgaYSYBYk1s7DrY7292HZhK3Y6YsLruMyFWMfXAL
	eMp2lpUI7ZSK3vmxFlWEedm4uD54UyawXdBBO+e8QAtrlEkN/vcOzJtAMjfRcXVajfSxSr
	fVyiz+5M8qoZxsLb/aYmEI5mYtljoSNt27TLrDFFesr/ElZ9GUJ0kK48zsGN1JS0l5Pgp5
	7Z71n5uD9IfpOGFmlZGVKSrumOuNfI/q7mh/4VcOFa6WrdRmumlqhTVDWWKYiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747215536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zSbuYDRtVvHSPCJT7OiqBZPf1qjnHuxHcxmCjMw550E=;
	b=GROZoH0n+qX75m8UErZojwBTQ289hvnd0Da8jPvXuIcH22Bna6qsUu3EDc2B0+bC4t4j7V
	G+uVE3yVziLpErDQ==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH v2 00/11] riscv: kprobes: Clean up instruction simulation
Date: Wed, 14 May 2025 11:38:39 +0200
Message-Id: <cover.1747215274.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

There is some instruction-processing code in kprobes simulate code. These
code should be insn.h. In fact, most of them is duplicating insn.h.

This series remove the duplicated bits and make use of macros already
defined in insn.h. The non-duplicated bits are moved into insn.h.

v2:
  rebase on top of Alex's patches [1]. This means replacing RV_X with
  RV_X_mask for the first 2 patches. The rest is the same.

[1] https://lore.kernel.org/linux-riscv/20250508125202.108613-1-alexghiti@r=
ivosinc.com/

Nam Cao (11):
  riscv: kprobes: Move branch_rs2_idx to insn.h
  riscv: kprobes: Move branch_funct3 to insn.h
  riscv: kprobes: Remove duplication of RV_EXTRACT_JTYPE_IMM
  riscv: kprobes: Remove duplication of RV_EXTRACT_RS1_REG
  riscv: kprobes: Remove duplication of RV_EXTRACT_BTYPE_IMM
  riscv: kproves: Remove duplication of RVC_EXTRACT_JTYPE_IMM
  riscv: kprobes: Remove duplication of RVC_EXTRACT_C2_RS1_REG
  riscv: kprobes: Remove duplication of RVC_EXTRACT_BTYPE_IMM
  riscv: kprobes: Remove duplication of RV_EXTRACT_RD_REG
  riscv: kprobes: Remove duplication of RV_EXTRACT_UTYPE_IMM
  riscv: kprobes: Remove duplication of RV_EXTRACT_ITYPE_IMM

 arch/riscv/include/asm/insn.h            |  9 +++
 arch/riscv/kernel/probes/simulate-insn.c | 94 +++++-------------------
 2 files changed, 28 insertions(+), 75 deletions(-)

--=20
2.39.5

