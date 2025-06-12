Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463AC2DCC10
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771625; cv=none; b=alJZoNVNG+AIu1rg7Sh7TFDrnZ2tpfDnIB7B9bAcGqifEtBYJ2MOzQ4XjqsTh/9G8xrW5w+aEJJa2ZHa72vsjr6jMktOABhAWw7Nz0aj1KbWkmW8IT0dpcscmOdIpgkBt+ImC365UudCvDyFaI4mhWoFjA73El3PAEWc7uA3ZHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771625; c=relaxed/simple;
	bh=6Pf/tXMZzJo5FfKHir7iP/T7zDvDoWdK5wp07Bj9XFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SlzFRLmV91icElnY/LmnOIJG8r68inwTOC2KWsdlaz/B1KucNBSw1quxlPB2z3jXSahdOYGyggDFFKuDVPnzDpMBNLXW4XSfGHDJ8B0MSXlbX0lzDNKSDfQaQb34Rk7g3I7SwIq0KYV3BBblTcye+s6LYdd/pKeQj1W1uQCqNAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=H8PLXXZ0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/nDRbo4u; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="H8PLXXZ0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/nDRbo4u"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=moW3grsIEEkZ24nmNYOLsz6RTNF0J1cs4slM6upzMSY=;
	b=H8PLXXZ0nEu48ExfTAABpLtAj6SaRiuK4r+HT/KcwIfKXG1ku1heoSEPje+PV6R5uC3HJp
	EOE7BlxJDRSMGWfqM6goRWnRo2LdH5CbYw3tRIDEkL4lFkcwO/JghtA/fidAsOhx/QF00M
	mriYKQumLlFlDcNEEnKa/EcxIEFBL8OYAyV/H3plkOrMqdwJdV9XdQg1W/oHvlcwICyLKx
	M6oWhzCJbnoVkJDCRRtPI/W4LPTZDd6eb1tbxX1jtMXnU13l+6NDSHuB3b3Ld37HQdZFdO
	kBW5Wk8c4zr/ndVtvC6w3J2bq0b+KDHXRVrN07Rv3MWgXwP4iQJ7rgdNw4VuQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=moW3grsIEEkZ24nmNYOLsz6RTNF0J1cs4slM6upzMSY=;
	b=/nDRbo4uxEJCyJkKA6dzwcEWp33Pl+d34uBuRpw7r34DCzJYO4SxGuagAsNsL6tDvLhrv7
	tnHOAv018uurWrDA==
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
Subject: [PATCH v3 01/44] x86/cpuid: Remove transitional <asm/cpuid.h> header
Date: Fri, 13 Jun 2025 01:39:27 +0200
Message-ID: <20250612234010.572636-2-darwi@linutronix.de>
In-Reply-To: <20250612234010.572636-1-darwi@linutronix.de>
References: <20250612234010.572636-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All CPUID call sites were updated at commit:

    968e30006807 ("x86/cpuid: Set <asm/cpuid/api.h> as the main CPUID header")

to include <asm/cpuid/api.h> instead of <asm/cpuid.h>.

The <asm/cpuid.h> header was still retained as a wrapper, just in case
some new code in -next started using it.  Now that everything is merged
to Linus' tree, remove the header.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid.h | 8 --------
 1 file changed, 8 deletions(-)
 delete mode 100644 arch/x86/include/asm/cpuid.h

diff --git a/arch/x86/include/asm/cpuid.h b/arch/x86/include/asm/cpuid.h
deleted file mode 100644
index d5749b25fa10..000000000000
--- a/arch/x86/include/asm/cpuid.h
+++ /dev/null
@@ -1,8 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef _ASM_X86_CPUID_H
-#define _ASM_X86_CPUID_H
-
-#include <asm/cpuid/api.h>
-
-#endif /* _ASM_X86_CPUID_H */
-- 
2.49.0

