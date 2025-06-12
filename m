Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFF32E6D09
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771663; cv=none; b=c/aYHZrHsmjzw975VnpgjvK167M2k9XskK/+G6CplyYVErGFZiB16zmuhj4hj2ihAwDpvqEWw8LHpB99csr/XJ5hX9MNqpdqwRi2JGi+hYTDBrYJBV933aNSs/OtmFByVsCbCMyB3zPNPBEZqJS7vSQriGE+JWKIflamPTR+4Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771663; c=relaxed/simple;
	bh=mEtFfG6W0CCFrbtZulPgxhMk8e6DTFZehqrh77zePkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZDCYZjiv9HgQVG3vvKWd1/Lnv0FoYzAMPBB7xyp/1+M2XwupIl7GpgE/cI/YV/PdCZodjDy/srWBNSxD64/Gz2VljVLWEIKuCyG79eMoc6TWU+3PVVg4+zg+ysDTGsKrWuR6jyMX34osMQ9YwjeLLoBkkYPt4Q/4+HicuXJku9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dOa9TLmy; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0qaH+Y0i; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dOa9TLmy";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0qaH+Y0i"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y3q6jSAatcw411UuRrDymvK+3jfuqUlUGK3N5JSO3nQ=;
	b=dOa9TLmygERCOUcCcZxKwgVn7ri6xSMHiRbKtFVZxBQZgM2W8+Y85qrPjHcocdBlsy9EGN
	gyTIDYcfDuzbbw+g3RAxLqsWFNg2ohkjwY8kd455I5qe/03L2FYOFTTtYZdYKXo9hqlk2c
	B/V1SArRyNs0AYQY97Q7TUjDMGQWyYFbDopg2Dx5Wg0svIoFUe1xtn3MQhhQFiMbjaXoxw
	NMzSa3ovEMahqXJfJ9vFJvjzgJux6x4kVMh1NsKprlbMU5goNDZYaQbk77yEteaeH4NGD3
	rG6aalhtOQ46CQNJf4SoHZaFqyc6BEXMuAqRYinDjAAA+4SyJRYJNrlRh1kZDA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y3q6jSAatcw411UuRrDymvK+3jfuqUlUGK3N5JSO3nQ=;
	b=0qaH+Y0i8S0zgO5wZq7zv0KJcL8IXAdSGNO+rfbAfmUrL490u3XKTFZ9YDqqYf84y/jzSR
	1SWnwsmfpm/i72Dw==
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
Subject: [PATCH v3 12/44] cpufreq: Reorder headers alphabetically
Date: Fri, 13 Jun 2025 01:39:38 +0200
Message-ID: <20250612234010.572636-13-darwi@linutronix.de>
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
 drivers/cpufreq/speedstep-lib.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/speedstep-lib.c b/drivers/cpufreq/speedstep-lib.c
index 0b66df4ed513..f08817331aec 100644
--- a/drivers/cpufreq/speedstep-lib.c
+++ b/drivers/cpufreq/speedstep-lib.c
@@ -9,14 +9,15 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/cpufreq.h>
+#include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/init.h>
-#include <linux/cpufreq.h>
 
 #include <asm/msr.h>
 #include <asm/tsc.h>
+
 #include "speedstep-lib.h"
 
 #define PFX "speedstep-lib: "
-- 
2.49.0

