Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A772E62BC
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771659; cv=none; b=iQ/0gyUDPdytseexf9KwA4NoMIg18CXiFwOOmryHJke5uxzcH2biwwjnN1eJPLR1lGawQJmanCZSCBws5WrgaX5Tw6zaFyIsyF/+Pe3FrxrcxZ9EDF/PHLUYVIrVmMSUWCkXpW7g0QF9ze/HclOO4uw3yYESzLbFPP29dN4jRO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771659; c=relaxed/simple;
	bh=vS1cZf0d5qL6LPmnaM4drwsJ96/PyaaMLZ+fWFlqy9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GdqImoLcA5zkwy7JhguPLQvwqD3tY8ATgC2qZF7NHSjCV51Ep4w+xDyMy5FwO6xfkj/T+wV8Ck33RyZCrnodVBoCwNnETLOFcz5g75qUHUKM/+hnuKNzWI+Yf4ceM58m3jwTj9KrsCBbom5f4/M+OV7AFuuUV1Q1rjtv5FtT6WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nOj9XrKX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=giGPVX2w; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nOj9XrKX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="giGPVX2w"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7DreOZwLNuQHvqNjFYinmIaoBSei6IfxDF5yWW2B7pQ=;
	b=nOj9XrKXBoDFUbsVf1ETrP4XByS9pWtV8p0EBMpY+dCNLhy21o+qb5j/o1En/bogg3lWTy
	MO5IurSItNqBdu4M+YM1XYCzfbOMIcniRfEcoTPhV4009Sr8000VyjLrwWDdn9M9Bt1cM9
	yj4otaMjQ+Z6UT2aM6qhnnzxsfFTTC/DQnyOg+e3JT2tPjGEzhz0ckwvJYAK8UuowV+Th7
	DY3naPGDUhYCnrNebavnNV2NyKAcuhqe74lxbkK9KkOQN8V/L5lPqW1zgCH658/oDB1RiQ
	Z9bYS0fW7t1lKL1Uw2in3jPcqgeFSN4OuU3ERU6d3kfX8LgYKn/sVXQm/qPLNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7DreOZwLNuQHvqNjFYinmIaoBSei6IfxDF5yWW2B7pQ=;
	b=giGPVX2wzQyb30TSNdVfm4+WMtayMZZF+rC0Lx/0SrxALW9c4FolCqWVqTf51zm9avDXcw
	x7RQXKzhpHb3E+Dg==
To: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sean Christopherson <seanjc@google.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v3 11/44] x86/tdx: Reorder headers alphabetically
Date: Fri, 13 Jun 2025 01:39:37 +0200
Message-ID: <20250612234010.572636-12-darwi@linutronix.de>
In-Reply-To: <20250612234010.572636-1-darwi@linutronix.de>
References: <20250612234010.572636-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The source file uses cpuid_*() macros, but it does not include
<asm/cpuid/api.h>.  Sort its include lines so that the CPUID header can
be included next.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/coco/tdx/tdx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 7b2833705d47..7bc11836c46a 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -8,16 +8,17 @@
 #include <linux/export.h>
 #include <linux/io.h>
 #include <linux/kexec.h>
+
 #include <asm/coco.h>
-#include <asm/tdx.h>
-#include <asm/vmx.h>
 #include <asm/ia32.h>
 #include <asm/insn.h>
 #include <asm/insn-eval.h>
 #include <asm/paravirt_types.h>
 #include <asm/pgtable.h>
 #include <asm/set_memory.h>
+#include <asm/tdx.h>
 #include <asm/traps.h>
+#include <asm/vmx.h>
 
 /* MMIO direction */
 #define EPT_READ	0
-- 
2.49.0

