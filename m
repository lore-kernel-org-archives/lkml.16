Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8AF2E3377
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771646; cv=none; b=UxjmTqDFPkdV/a/12BLkkecZNhSCtgbKzU+H/dKCYMbAaI05/wOncCV4qYOh5OGVTFyQ2vyLOMGlOPpSedOLO1KNiMgAsWzIH59rgddWyPyDS/Iriynirtkd1sdB+ROidannzbO66H11E/GtAXXZuDzikfwBpqFl3zxRVIeRsNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771646; c=relaxed/simple;
	bh=lyZmPi3B4oF17ev9UTYg2muWF1nVtaEzGetNCY/OynY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fXUXmewbc0tY7zBnLcsQK/3gvzzN+yYC0jUiyBwQ3ITEvUEzv1WlcI3rAKq0JuqBzHXCqqKVzWzCMzC/UZdd3KrQ7FqtozvpFySuGzBCZHvW47kxvSzbWiqQqQ9YXbnS6Y35Rqzunz3rrt1agTX5kSq8LBpDhzTkWUU/zOTqPn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tTf/M6cP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=X3xVFaRj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tTf/M6cP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="X3xVFaRj"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hL6kR8PIDszFqQWu4ogIAnEYWUoEaYfz8wTwSpB7fkk=;
	b=tTf/M6cPV9as0BDx/16N4OCAY+yUmobHQ3+ua+0YUn4Xs5l7uyi2vcrMdx2H5Nzt2ERbLr
	NTosDM83mndNt7qMNLNiAH4B4325L346pcBjCtZILwg6gPUvrB1TOna/kuWbGV5osbMOs4
	rJn2aVo5jXlDjqy5otv8BZpo1qssKVxL7kgb5/FbpU9eCq5tjtCNXR5EDthqv1nQSnoKNX
	3yGAFwKoiVn3AaQ4Ueaa6FZE6VWEJydtfeexb2Q7NhaUoNnqu6WTGJAg8AVHD2ffq9RbtN
	gIwKJ9civeIX0dCj+rbOy44EiUrbIBhyWsmes6txC5wHWzIRE0aSUKBNbi/srQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hL6kR8PIDszFqQWu4ogIAnEYWUoEaYfz8wTwSpB7fkk=;
	b=X3xVFaRj7N3U2XV9ahXJXbE2OaGNwmI/pHxBWH5YSS0TG3WPMzzzHEQTNbKikm/qzgZav3
	V+777uhDkssdK0DA==
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
Subject: [PATCH v3 07/44] x86/mce: Reorder core.c headers alphabetically
Date: Fri, 13 Jun 2025 01:39:33 +0200
Message-ID: <20250612234010.572636-8-darwi@linutronix.de>
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
 arch/x86/kernel/cpu/mce/core.c | 62 +++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index e9b3c5d4a52e..fe9e65f314fb 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -9,52 +9,52 @@
  * Author: Andi Kleen
  */
 
-#include <linux/thread_info.h>
 #include <linux/capability.h>
-#include <linux/miscdevice.h>
-#include <linux/ratelimit.h>
-#include <linux/rcupdate.h>
-#include <linux/kobject.h>
-#include <linux/uaccess.h>
-#include <linux/kdebug.h>
-#include <linux/kernel.h>
-#include <linux/percpu.h>
-#include <linux/string.h>
-#include <linux/device.h>
-#include <linux/syscore_ops.h>
-#include <linux/delay.h>
+#include <linux/cpu.h>
 #include <linux/ctype.h>
-#include <linux/sched.h>
-#include <linux/sysfs.h>
-#include <linux/types.h>
-#include <linux/slab.h>
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/fs.h>
+#include <linux/hardirq.h>
 #include <linux/init.h>
+#include <linux/irq_work.h>
+#include <linux/kdebug.h>
+#include <linux/kernel.h>
+#include <linux/kexec.h>
 #include <linux/kmod.h>
-#include <linux/poll.h>
+#include <linux/kobject.h>
+#include <linux/miscdevice.h>
+#include <linux/mm.h>
 #include <linux/nmi.h>
-#include <linux/cpu.h>
+#include <linux/percpu.h>
+#include <linux/poll.h>
 #include <linux/ras.h>
-#include <linux/smp.h>
-#include <linux/fs.h>
-#include <linux/mm.h>
-#include <linux/debugfs.h>
-#include <linux/irq_work.h>
-#include <linux/export.h>
+#include <linux/ratelimit.h>
+#include <linux/rcupdate.h>
+#include <linux/sched.h>
 #include <linux/set_memory.h>
+#include <linux/slab.h>
+#include <linux/smp.h>
+#include <linux/string.h>
 #include <linux/sync_core.h>
+#include <linux/syscore_ops.h>
+#include <linux/sysfs.h>
 #include <linux/task_work.h>
-#include <linux/hardirq.h>
-#include <linux/kexec.h>
+#include <linux/thread_info.h>
+#include <linux/types.h>
+#include <linux/uaccess.h>
 
-#include <asm/fred.h>
 #include <asm/cpu_device_id.h>
-#include <asm/processor.h>
-#include <asm/traps.h>
-#include <asm/tlbflush.h>
+#include <asm/fred.h>
 #include <asm/mce.h>
 #include <asm/msr.h>
+#include <asm/processor.h>
 #include <asm/reboot.h>
 #include <asm/tdx.h>
+#include <asm/tlbflush.h>
+#include <asm/traps.h>
 
 #include "internal.h"
 
-- 
2.49.0

