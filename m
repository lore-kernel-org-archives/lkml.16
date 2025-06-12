Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9372E2EF2
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771638; cv=none; b=rwWhKbYQa9aAOg0GJyWbJaGZhTY4/YOiesFg6yC9T88o5Zdfzqg7iVdhm+cAbs+EA7Bdawajvj32C5pj6cTbQe+7xArEJ3aQjy3e9ptTl3s9Efrc4htUtGq7GgP0HFjLYSfVjvuMLUQx9jpbzrr1B5DtnrINjIuVvn6gbnq8Jmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771638; c=relaxed/simple;
	bh=Z5myvD/LZM1QB0DHHe0Xxmt7xk1NoF5DL50cjkyuxVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RHa5RmMeiD/AJOvRAWU4+RXUubjLD3QFDFoTBfoDk9SvytNfsPI0NqnN0yQmOsg1AVnJeXck+q8fDOziuv1B2FggOyU5xkXoGrHFptBNrCDErd1405k+5hihLlyBJEkPZVZ4zf+CbZmhX07dORTR978jXWVkXqUcO+oJ8Q3qjvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cQ6O5hJH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cGtwnLME; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cQ6O5hJH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cGtwnLME"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rxzMZiw++twmmpi3YWJOLkyjA3YsvRwP7t4EJ2qNmik=;
	b=cQ6O5hJHqC4GlESMcFgAQd+DQk5itSvBXgkj5YY7D9MXbwao4hU5ROIEd9EZoyYlafbioc
	3miC/G2os3XzmQKCk9yWMvoEx53u80GYszpmhtK4hsWRi7cghiAFf7paLR9MwDbfkBYvut
	tllxXk5+jhSsxWJgpwXyNk8bGgaXHN2X1YMEkw1DCgRMvZr89rpa8UYYJeVm1PPvtsj1zN
	kCts341OL5g0HOc6OZR1mkk5/IQQxQGTbQS23AuhHH4gplPFSSotE4lRtE2BAAYpqbSSXB
	TJ3VlfZ0IDc7lAPKr3AduEvsR9MCl0VLbQJ8/dR2E+NCu1r5fLkafJjmBLkKPQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rxzMZiw++twmmpi3YWJOLkyjA3YsvRwP7t4EJ2qNmik=;
	b=cGtwnLMEFW3hQMpx64uFKMZSpRE7C0Pu6avRKYpT5r/g71cz0FfNP3RQg3FegfLuiqN36I
	P6fsxLhdh2k1LQCA==
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
Subject: [PATCH v3 05/44] x86/cpu/amd: Reorder headers alphabetically
Date: Fri, 13 Jun 2025 01:39:31 +0200
Message-ID: <20250612234010.572636-6-darwi@linutronix.de>
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
 arch/x86/kernel/cpu/amd.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 93da466dfe2c..c988d876b700 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -1,29 +1,29 @@
 // SPDX-License-Identifier: GPL-2.0-only
-#include <linux/export.h>
 #include <linux/bitops.h>
 #include <linux/elf.h>
-#include <linux/mm.h>
-
+#include <linux/export.h>
 #include <linux/io.h>
+#include <linux/mm.h>
+#include <linux/random.h>
 #include <linux/sched.h>
 #include <linux/sched/clock.h>
-#include <linux/random.h>
 #include <linux/topology.h>
+
 #include <asm/amd/fch.h>
-#include <asm/processor.h>
 #include <asm/apic.h>
 #include <asm/cacheinfo.h>
 #include <asm/cpu.h>
 #include <asm/cpu_device_id.h>
-#include <asm/spec-ctrl.h>
-#include <asm/smp.h>
+#include <asm/debugreg.h>
+#include <asm/delay.h>
+#include <asm/msr.h>
 #include <asm/numa.h>
 #include <asm/pci-direct.h>
-#include <asm/delay.h>
-#include <asm/debugreg.h>
+#include <asm/processor.h>
 #include <asm/resctrl.h>
-#include <asm/msr.h>
 #include <asm/sev.h>
+#include <asm/smp.h>
+#include <asm/spec-ctrl.h>
 
 #ifdef CONFIG_X86_64
 # include <asm/mmconfig.h>
-- 
2.49.0

