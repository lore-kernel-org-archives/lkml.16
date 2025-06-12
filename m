Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8DA2E336B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771643; cv=none; b=u0OvTSt9Dspske7hprafXtJzsPsYRvZ6hVoZez0B1sU3C7JAREeXlGCRI3kttO4/1EVNfo+1xO6wzVg+CFc5FE/WR/iNvzuhdOPWzW66V++7XVRcnIDiK3pZ0Og2gznXEB/YBmUcl2sjQfznkNjKEMx5VXxv4TI8XV2WpV2hEFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771643; c=relaxed/simple;
	bh=uDbQEMjpGwSYuviCS6Yz9UTd4NYGPbxFfhGqHoz6hpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=isRxQW9zdwYjjgIHiaVwzCcjxpmvtPtW2SHGi9bwhY8ju1bWeHY8LNfHXw1vu+8LZ6Bb0B3S22LAMuGHbKWoa1sPrnzhttdG+KpJuhMFqfUg7iBpyi0ez+V5ZRCoedyEQjmBjTADShAaPq0YyyenN2KrjkmqluGKsbhkxBWtsAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DN+78nBe; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WqcYQEfH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DN+78nBe";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WqcYQEfH"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7us/GbD28rzIxUHSzQazlyTfJk9FvplS4pe3Mv5Vn24=;
	b=DN+78nBeC4hIPRAd0grYFTrfnRJHzzVqcpuOUp7TzjhE4HXxATGHDCkUGJUiyPxX9snKyl
	6gEBinTwai9BBUs53CX9a0L0pRM0jFGeKogwEBSXJFiWSZDMuggs+2OySd50QB91ccWCAD
	ROdB9r9pagVtbYv0paWKHrfQMLp8Tr/WJIwREsC+sXLa4bFOW72RKL4aJ/IXvYoIgwr6RI
	mkUWmjjfwT/myCzng2eYXwDcreu6VIaYjvmO9itox5t6NptVFZo3HlYmSSKxN2036y4DNF
	AzPLoDLWAelHyuUl7oQCb8PWe/2xBUDAbcf7RIeaI7RgT+ozvl1bnuTZ0s/fQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7us/GbD28rzIxUHSzQazlyTfJk9FvplS4pe3Mv5Vn24=;
	b=WqcYQEfHckFAppiOspuKvhanqpM23HxF4ac0TGLvYd+XHPJYB9l+wtHX8UgSLYqjJbLTFM
	XHmNcxHt9U31D9Bg==
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
Subject: [PATCH v3 06/44] x86/cpu/topology: Reorder headers alphabetically
Date: Fri, 13 Jun 2025 01:39:32 +0200
Message-ID: <20250612234010.572636-7-darwi@linutronix.de>
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
 arch/x86/kernel/cpu/topology_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/topology_common.c b/arch/x86/kernel/cpu/topology_common.c
index b5a5e1411469..48c47d02d8a9 100644
--- a/arch/x86/kernel/cpu/topology_common.c
+++ b/arch/x86/kernel/cpu/topology_common.c
@@ -3,8 +3,8 @@
 
 #include <xen/xen.h>
 
-#include <asm/intel-family.h>
 #include <asm/apic.h>
+#include <asm/intel-family.h>
 #include <asm/processor.h>
 #include <asm/smp.h>
 
-- 
2.49.0

