Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128142E2EE2
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771636; cv=none; b=A/WceaZWbKN9lqjwOrkFNb9G9g3gHBcm9pEgxz3QnGP8pUBFUNsZ1mWq2OKYTPFhCxuOYgV+8mbSthmE9hP9wGtd09FdGWLELurh+1jWEViQNFimtR/rKfNrVKSlly9JzLqA97r9Idk+xtlwwrqIVbeLXbNkg1YiSkQWFpAWZq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771636; c=relaxed/simple;
	bh=uLB6+jUDU36CNXqX8JFhOtPaiBVOkrpnE6WiIL+0ESM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aPsxvOPKfNggfefLfC8Ajbubkt6FE/BYRyhamvfUAYzZP7Lf/yZRIKEObYWSPEYOuH1S3BT+lG36uueGB4i6uSg1RtUgCO4UWPhVHmvQA1VjyS2yxkHL7idxm+tPxvvJlYCNE2tYM9gAiZkS5hLuGlLD2FWjYjcG6PEgnXItmFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=plVzzIWe; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9N26kAI8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="plVzzIWe";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9N26kAI8"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AyX/eCKjMXH8T5o1dKBgq3rnP1IwAJ2aHpMeGCd3K88=;
	b=plVzzIWexYzQt8Vlx3432DSCnrrNqT1SHotZvMgBAwQkbIqdTdjltho/mbZ9A1iReUuUqo
	oXT4xZ/rAmU/jf34hTDkpp0PycvHJnUiFKn+q/8Jgba/s6YxSdBos3Wr/Hti7ENwWtjjW5
	ieM1FV3zjA0nTXoncP0rwjHka5VYMcBb0KRt5dE10LnRQcYtMz3hpCP2sV4/Rnv2BuGxc1
	wIcY78vhc8xoBFpd87wlx4gjxVeMRDRNf6kfrZID3RbrgxU08RD9IH6iWBOL8hlS0Yjf3K
	eyd24SuQU6wbYvlUhdcLl/SmEZIHwhbNzS3wFWWOYVAVxfp8uV0XmfXLdsiFSA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AyX/eCKjMXH8T5o1dKBgq3rnP1IwAJ2aHpMeGCd3K88=;
	b=9N26kAI8wXSWHCE139B9h3XBmG6Wkd5j+kSkvnZL5jrJxoziVd8IqToJeoEHVR7hmIZBbw
	LgtPpavu0lFJfrAg==
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
Subject: [PATCH v3 04/44] x86/cpu: Reorder scattered.c headers alphabetically
Date: Fri, 13 Jun 2025 01:39:30 +0200
Message-ID: <20250612234010.572636-5-darwi@linutronix.de>
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
 arch/x86/kernel/cpu/scattered.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
index dbf6d71bdf18..3d23b943f596 100644
--- a/arch/x86/kernel/cpu/scattered.c
+++ b/arch/x86/kernel/cpu/scattered.c
@@ -4,8 +4,8 @@
  */
 #include <linux/cpu.h>
 
-#include <asm/memtype.h>
 #include <asm/apic.h>
+#include <asm/memtype.h>
 #include <asm/processor.h>
 
 #include "cpu.h"
-- 
2.49.0

