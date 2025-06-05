Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637F527C179
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151455; cv=none; b=b2/nrRoq4jv//O10Kf4nG0HLf8vAxyCLKp3yz6sqXu03UwhLTJ/WU7SIhbwOJfN8yDO37eDSRoZYTbryCC7Jjg1jmnb6+hF/SHjGsogx87+VTYe5yFdHDh2lUA/IQVweJslMxB6YzywZqOIdWmL7MAeborX5PoY/2ppPZ3Z1Ofc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151455; c=relaxed/simple;
	bh=6Pf/tXMZzJo5FfKHir7iP/T7zDvDoWdK5wp07Bj9XFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uwAXFzjBKqn3dXfgkxjP7P1w2BPkpsRbj++K4gmqjtcfLCEs4H53ysyiNW1bL6MnoQoYsTKhhsWQHTaGoIZJarsITHU/301QfGI12nm4nvFund6D+5GkIyOsboo6GNCAEhV2DaChkbQyvgRFeeujWVYn47WA4zzY0uSMivCezQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CbsIvaIQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7Y7zJbPL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CbsIvaIQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7Y7zJbPL"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749151452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=moW3grsIEEkZ24nmNYOLsz6RTNF0J1cs4slM6upzMSY=;
	b=CbsIvaIQ+bas0+eL4kt8Vx3JpOCwCsS0s4As6sD8nA+tSj0sRLPvqyGHRjx4cmPgeMPwAL
	wGAyo9P5PRWZYnxcwREWK/LmgDF64Rp26IP8lm+/WEmkCUdirZCSRi7suKYvEdfAHcbsNa
	sKTnXse64hvuQ1zdRx8uJ/CBB8hL7FDWu5Rs+xj/YNc/KGgtlZ6QaIrArzhdkUxKRb9WBC
	9a8iOA6xH9xtk9h6sbBw2twvTFQrUHWvVOdqFee4i2oi8+bfOyQXJYZNr1r+nbOMBeEjG7
	MQ5hPCLdYEObgQFooTKS3HRQbjic+HuKK6FQZSHNVmJCt3LTyapOOaUtyIX6AA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749151452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=moW3grsIEEkZ24nmNYOLsz6RTNF0J1cs4slM6upzMSY=;
	b=7Y7zJbPLyB7UdfllbHAtT/GpbP7jSDSMskWOKQOgaginVJUEZm9BcBon5V36GTaq9yvfji
	IthbvNCEWjtGaSCw==
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
Subject: [PATCH v2 01/27] x86/cpuid: Remove transitional <asm/cpuid.h> header
Date: Thu,  5 Jun 2025 21:23:30 +0200
Message-ID: <20250605192356.82250-2-darwi@linutronix.de>
In-Reply-To: <20250605192356.82250-1-darwi@linutronix.de>
References: <20250605192356.82250-1-darwi@linutronix.de>
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

