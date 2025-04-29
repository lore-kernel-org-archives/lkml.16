Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAB22D026A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745931368; cv=none; b=N5YR7XNzaFVOpNPHqJ42hyKYlid5ys/5Dwadp9vwNs62YbgDoPZDk9TLYfs60qJ0PQJCAQhs9DfC8eXFVkkXqB21RFr20A3PpXhjhtAbdiryX+Ty4c35Z09fn8GLFLYGiZ0w8pOryhffnf8XG4UdycMG6tusiTAVtuFimS2O/QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745931368; c=relaxed/simple;
	bh=6bf90b6PKN1yy2IB4q4zQXvYLjO8EsLV4LaVCDD5H2c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q/M3lwCOVS2ppmEc/Q1bVxbELiJZBhU6sCPMJIoB+LJicGCa7mycgGrJn5Pd3IIBvYRMj2ysFhKv0nwsm5Z1wJD5baV/FMiI5J29TELTb/iAQOGkG9Pu7UgK+bScm35JYaYHffXJW4xv13eKZNt7gtGF+9/LvDWTPpelBRdZHu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HzUh/C13; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xVp6GDZp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HzUh/C13";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xVp6GDZp"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745931365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Fj7yCWcGZQiD0Ep5PKSnDUN4f4uh1dr4fMtp7fqSvPc=;
	b=HzUh/C13+77GwXny9TqEo0iTIKybWr3W933yiu7g0B4mCzqAJIuyEIxtvkPy44+VhHI0Xf
	F/vLnoGOtbmDs7b9VKqpB89/PFZjaQGJ4CaaswUuos+R7s9OS3rx4Tfh2NLqhzwMC2tLaR
	CkwsMysjEHCsPiE2DPQL15aNuBdETyF+ycfH7s1ekloZMfI4DFwruDg2TW+sVu6cfOrzPc
	x2n2oovwmMDdOhXbkWOudSGVQ4umb3nWO4vtIEeVkrUY0YFF0yTG2uTrZehiJh0poh/H1z
	JimdL8uJe6x22NloIbNt1FdiLXeayNDplh/evXJeOV1RN3eT6zC4Pmqo3NiaVA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745931365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Fj7yCWcGZQiD0Ep5PKSnDUN4f4uh1dr4fMtp7fqSvPc=;
	b=xVp6GDZpQUELM7yLjLGY3YMF9QVLXybnhWGoEKcTIV1WBdnYTpHci8B+52Z0mutL4FuZ4X
	D4VSGzZfzcrZJSAA==
Subject: [PATCH 0/2] vdso: Work around and reject absolute relocations
Date: Tue, 29 Apr 2025 14:55:35 +0200
Message-Id: <20250429-vdso-absolute-reloc-v1-0-987a0afd10b5@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEfMEGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyML3bKU4nzdxKTi/JzSklTdotSc/GTdRCMjMyNL42RDczNDJaDOgqL
 UtMwKsKnRsbW1ADtzfKhlAAAA
X-Change-ID: 20250428-vdso-absolute-reloc-a226293c1761
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Nam Cao <namcao@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jan Stancek <jstancek@redhat.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745931364; l=701;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6bf90b6PKN1yy2IB4q4zQXvYLjO8EsLV4LaVCDD5H2c=;
 b=2BaLI788qKSQNwcRUt1VMFS0fOMU7pPi8jwA3BpsT6XkRK2kVcvuPS7TX9v9E35zc96MLg59W
 kQ0Xa6Mp6UbDOecUQomGGb4cTOO5ucX0t1kCmrgm0EA+twcb0Ao61nb
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

GCC on arm64 would incorrectly emit absolute relocations in vDSO code.
Work around those and break the build if new ones appear.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (2):
      arm64: vdso: Work around invalid absolute relocations from GCC
      vdso: Reject absolute relocations during build

 arch/arm64/include/asm/vdso/gettimeofday.h | 13 +++++++++++++
 lib/vdso/Makefile.include                  |  5 +++++
 2 files changed, 18 insertions(+)
---
base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
change-id: 20250428-vdso-absolute-reloc-a226293c1761

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

