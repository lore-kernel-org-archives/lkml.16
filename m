Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484A510F1
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 21:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746998292; cv=none; b=nvMaEC6YPN34awJLqHgRX+RWPDeC3dRELPZzXAy2xfOtt1uvzSjo8pyJ6GPNqzBzm8JewbEU2JFVhBByv9LMnsUdEQh5Z45aLAH208TGv0DRX9L0USwMEjDkl6iRanpywAGprAjuVrxcK/RUYGV+9x/YUwyxU4F3PfnJ4v28aFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746998292; c=relaxed/simple;
	bh=jDZvak6P05/Wh2jwBQQDcn7U0IA85ui8vLxU4ihdrWc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PqVrivEIGyWReh3DO8MrRKQZhpT1mr9Tj0gt4Xdl1BUlHOHuz6DimZilHELgrZqHwHbJLkl0Y5lVUmCAgorfi9OHnuKqFQZkGnAqls+icMHwwGR3w2b0XxS5ncVzwDJgBxUQVryZFpIepQT7rm28HFRs4aCbSbPNlmnoRQO3rJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1RCdFz1H; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iIFrDLct; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1RCdFz1H";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iIFrDLct"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746998289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pQCK+FP6fnuhEa7dhrwrGy4kUeW1D/ROXBpaKli5CKE=;
	b=1RCdFz1HJTsjDwa9XHS9jn0XMydrFZ1PWyYQs4a3DDOHuMrRPh0mj2JiEPg0NCPdqbF4wE
	F0qh36yqA8m6oHn29VfIklqoJUrnJ76LBdPisktOyvaJF7qsLxbQBqekOz3CTa5+NORGjf
	bHkiBplJ9KWGxzZd5r6MBypw4NtkLQIdQxl99RC5M0xZudDZtXuh+tL2u9FE6pY3p1CN+E
	AjleH6oZQsEivyXWjRT5/u/5riLiUGHiEPI+UsveEswePyBET56GnQbrbl+0wxYW98kFwn
	TCen9euQeHzh00CGxGi9Zd/fZRPdeAdhje4FwVbpHs0XWKtdIsb52msIoLbCRA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746998289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pQCK+FP6fnuhEa7dhrwrGy4kUeW1D/ROXBpaKli5CKE=;
	b=iIFrDLctf7tvgDZbef0i//Tgeef+0AGf4PIlYFc8ewBgDLEtLSJcLE5FftQyVwg1v4k4mv
	PCxjhbb8G0BIY7Bg==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 00/11] riscv: kprobes: Clean up instruction simulation
Date: Sun, 11 May 2025 23:17:52 +0200
Message-Id: <cover.1746997351.git.namcao@linutronix.de>
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

