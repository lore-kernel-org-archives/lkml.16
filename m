Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B321822DFA2
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749633748; cv=none; b=UuBwMrwxfkCJuFRkSTbaOlc5gOP7/nUkpaCPtTlBbd9BhXcZhSna9oFJmwzlvSURd9gSUlX1wbNR43pQLtgfhCunJxwDC0hpixoTSju9xADNryMMmoXvpQ2fQASEmLGBMw/SA90MznU7BQNAo7smNYouE2Zl1LHjl6lBFmOvORY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749633748; c=relaxed/simple;
	bh=zMHc74VYhNgWp77fM7mNXEn5XWz8DWEdPaX03X6eDm4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nCucd83zqOHrRkSWZZczR2RwNBEXXXGzXWRY8sSLvrJAjBguz3Nsnnk4hy6rIMS5IYmEpwKPje42FQ/xbU9N240Jqe4cXFX78cdcTheaU7lqzhh2CWc9dtwl3ftP25t7xmBYtX9cCCnetIxOB3eecTtyapowZzCVIi9lA1tdKUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Y27HfuNu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mm+BijQv; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Y27HfuNu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mm+BijQv"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749633744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gtYgOefu94eR3RuXR7DVpGUE6/xkMULsMy2O7gqiDqY=;
	b=Y27HfuNuJ6IPljHL94P/HKaHtbIOrwMmpfN23MTcgT99Uo4XLnDjHl5sK3K5lPYdbvus8g
	doza6GTfWeSO9ttXLtrw4SUGEByYTM/TuyxmrwxbqBueFG8G4gQJXh0VzEUZfezDPzYna6
	qW5kD1PDxlIKdbsqwj2HzwdG2tBhoSFAhl2kZrbgssOWSHZng4qIYxlaiw1hVaRs0MOyVj
	xJCZT67VblAdor73Kux9icKD5WFwME5u1yHiWmCccmIHVrfX20jGC8w5Sjiz9/lOIfSoma
	DR0O/S28QgqLIQTfHsMnkdO3Pt8cDvUJNHHmjka0pA0LZ7UyrBDL3DMUNvEHQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749633744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gtYgOefu94eR3RuXR7DVpGUE6/xkMULsMy2O7gqiDqY=;
	b=mm+BijQvxC8T3rubjv5cs6i7IMbmoXGRIGu7+Ilu6J1kAsbHp5AoGtG5g3OrrSSH4MpcAb
	KUGXnxUlArV5yhAQ==
Subject: [PATCH v3 0/3] vdso: Reject absolute relocations during build
Date: Wed, 11 Jun 2025 11:22:11 +0200
Message-Id: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMNKSWgC/23NywrCMBCF4VcpWRtJJr1YV76HuMhlagMlkaQNl
 dJ3Ny0IIl3+B+abhUQMFiO5FgsJmGy03uUQp4LoXronUmtyE2BQsRIuNJnoqVTRD9OINODgNZU
 ANbRC86bmJF++AnZ23tX7I3dv4+jDe3+S+LZ+vfbQS5wy2l4ayWRnOFPVbbBuGoN3dj4bJJuZ4
 McR7NiB7FTYaS2ULhXU/866rh+8y6gjAgEAAA==
X-Change-ID: 20250428-vdso-absolute-reloc-a226293c1761
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749633741; l=1205;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=zMHc74VYhNgWp77fM7mNXEn5XWz8DWEdPaX03X6eDm4=;
 b=hzIp8UgPRCEt3QpiRZcd2rwTinMga3jJ+1CI3QAmYdaMe7kTveSjuYDkffunecvqAWuYsF+Q/
 JKshY4eYcFtD2XDuQNbVQYZsMtedWWg0w2G4XgnXe4mUiaRgG8UpYG4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The compiler can emit absolute relocations in vDSO code,
which are invalid in vDSO code.
Detect them at compile-time.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v3:
- Drop already applied bugfix for arm64
- Disable LTO for the riscv vDSO, as it is incompatible
- Link to v2: https://lore.kernel.org/r/20250430-vdso-absolute-reloc-v2-0-5efcc3bc4b26@linutronix.de

Changes in v2:
- Link to openend (invalid) GCC bug containing more explanations
- Refine commit messages
- Don't fail on commit absolute relocations in debug info
- Link to v1: https://lore.kernel.org/r/20250429-vdso-absolute-reloc-v1-0-987a0afd10b5@linutronix.de

---
Thomas Weißschuh (3):
      riscv: vdso: Deduplicate CFLAGS_REMOVE_* variables
      riscv: vdso: Disable LTO for the vDSO
      vdso: Reject absolute relocations during build

 arch/riscv/kernel/vdso/Makefile | 7 ++++---
 lib/vdso/Makefile.include       | 6 ++++++
 2 files changed, 10 insertions(+), 3 deletions(-)
---
base-commit: 13a2ea925ad717de32b5aeaaccda62ed26146d9f
change-id: 20250428-vdso-absolute-reloc-a226293c1761

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

