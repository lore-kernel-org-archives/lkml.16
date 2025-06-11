Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B049625C837
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749633749; cv=none; b=nIlVynHqvj10RrYhoumvrDaH6YIWxksC9xf6mnfm+SNN511gfTfyWsjYYK2UPZ3BjaFGfghVu87Zs5PP/Rk5Kk92gtM8G5Rhr+TY3w5gqHio+50s1OWIAiijkgYBfQtFm6jz1/Y53Q2zvYxKk7C0hltKsDHAcNMQGzG7NKBR4Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749633749; c=relaxed/simple;
	bh=8B4x12CzHaxPC9X4pfyxH+ejQsD81seE02RnNXMkzSE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Va3U9rahUxJdrV9UYkH2gGV08rEfWdXxnYT8JsE1UmmHEvzdMH0K9CB3Q4nP6+UJnWkFHlroXRZDgneDgrE3Q5FE/PZsNmPC7eRKM4D7b6qAYkKk0MHbnd0tNmXpq1cA4TCIfVmoNrTIjuYZSRyRac6vosRGfg+AYw129CpYXSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=t2CcHL/N; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xP7vQrJi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="t2CcHL/N";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xP7vQrJi"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749633745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qtawFApvVC/il3WzGQ5ouLlAcuOcFQ89dR48c5s84KQ=;
	b=t2CcHL/NgPvPqqPO5DyCZ65WcPtZlecd4bwAusp8WJzx9DkTuK1mi3X7WoXgwRMTPQlDtu
	E2fudBz0nBDHxplzTT7TD7BJz79l3wmbBcGOcZ61Cf+RQgzJG8q9WQN16BMFwThSh25X1R
	kdHD2t2SaJBoGmQXanudASPg5lXZAaf2EsQkO+aTTe2u1t/6H1CgoDsFfJCPMQsZk4gvCY
	KbtJdALtEHnX1SbWi8ia6YtvZd+KaPE3JUEprRE+kWNgsaXGlVfrQvUwk1C3T4gqAqLiy9
	AwpLjDOmGbbLUo/q8YnA5w5xdTj0K+VCzuU8Sbq+2yuAuAOD/cRhylzrTnQH7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749633745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qtawFApvVC/il3WzGQ5ouLlAcuOcFQ89dR48c5s84KQ=;
	b=xP7vQrJiwJzrto/eGP3l0LRHVTKCO8A0mjI0RKYg+ofFAFuliV0w5ytJUMJAq1i6wi+zcr
	xQhZeqrOHrHODfCQ==
Date: Wed, 11 Jun 2025 11:22:13 +0200
Subject: [PATCH v3 2/3] riscv: vdso: Disable LTO for the vDSO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250611-vdso-absolute-reloc-v3-2-47897d73784b@linutronix.de>
References: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
In-Reply-To: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749633741; l=1308;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=8B4x12CzHaxPC9X4pfyxH+ejQsD81seE02RnNXMkzSE=;
 b=MeVEZf4Tcm6ZHthWxkq9DUB7vjcgxE6V95k51kMGjendRw+PKJPPvVusb/jXN1+RUNZvon5rI
 Da78ZxH2LuxDWaGizyH12vN351IGlYgjYr82O6nMWi3zsWSrxFlm/8m
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

All the other architectures supporting LTO (x86, arm64, loongarch) do not
use it for the vDSO.

Its is problematic for some upcoming compile-time validation of the
generated object code.
The LTO object files do not contain the necessary relocation information
and -flto-fat-objects is not compatible with clang < 16.

For consistency and to enable the mentioned compile-time checks,
disable LTO for the vDSO.
The vDSO heavily uses __always_inline anyways.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/riscv/kernel/vdso/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index c19c3c76f7c9f6b2f7523a59269de3b683656323..9f1bf5bae9bd473e43d9fd3022e9e1a185128b73 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -49,7 +49,7 @@ CPPFLAGS_vdso.lds += -DHAS_VGETTIMEOFDAY
 endif
 
 # Disable -pg to prevent insert call site
-CFLAGS_REMOVE_VDSO = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
+CFLAGS_REMOVE_VDSO = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS) $(CC_FLAGS_LTO)
 CFLAGS_REMOVE_vgettimeofday.o = $(CFLAGS_REMOVE_VDSO)
 CFLAGS_REMOVE_getrandom.o = $(CFLAGS_REMOVE_VDSO)
 CFLAGS_REMOVE_hwprobe.o = $(CFLAGS_REMOVE_VDSO)

-- 
2.49.0

