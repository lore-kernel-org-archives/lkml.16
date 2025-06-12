Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508802E3381
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771649; cv=none; b=VW4/uk10R8fXUn1ECcUg7Jei9WHzsb0l4y2fF1H9Okb2jalNf53eCctylIVuzD2klNPU+j/rzXp2cl7TbDaZU286qsaY/yqtlf9ix1qNC+7MLDtWnRfyqYtTPz/7Jg04Qf/vaOLr3jADkU0LVrb+nW5X15nKHtoKD0nHnMZLYjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771649; c=relaxed/simple;
	bh=SdDAw6XHJi/hxVE/IUBqwt13Gjwva4kHbz+8iCUDa6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MxnEhPIAP0fvsdrJR4mWeuWDufSl9oYNZwBCd0ItYg4XppOBymL1ohSK6GkOzb2VTw+MRLFhV3fz8KH92BmHnQTXL6sns5Dsf90SIhDwpf+pRbix0M1W5QBuViGN9wbwEg+N2jBXik8u9yp2adRxE+Qh4RFl2JpARpir/3mcvR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uwZ41QvQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Cd67XUmh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uwZ41QvQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Cd67XUmh"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5OmPY1kT3M0ja+0CH2Wur4I4FysF/vnqURgtSJeVlIg=;
	b=uwZ41QvQXJHngjhbPVgP6+RFtEMw3KAsxpBzFH5mDXW5hc6SWxyewiVwdreQljr4SSv6f9
	VvrlGUCI9g+8QrtUlCIWVwa272x1fFf63r/z3BTpyjlXzBmCRVwPtBX8K2HRsj6ss8gcrq
	e2glq1Wxcb6AKMa83wdhkk2Rqz1/pjK8uHz3CjJo/+hSTA4ACDvfFgcNJNgvJM8JCVeM7v
	EGKPLvsOLwQvaVRADYniJRBojVBj8G7oCV8wOhC7OqZwWxak9vIoQrSBzjsxlRLLxmzYJ5
	D+5ztuVqXo1E8UBjbzvXuRygy6xG0gWPuGdTNLyKwNuvuK4Pru4zpKM5sLuDnQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5OmPY1kT3M0ja+0CH2Wur4I4FysF/vnqURgtSJeVlIg=;
	b=Cd67XUmhDkztUA9je8NtByFuqNgP2JP4GMzduliTPQjMN0jeSpc+XJzLMENTCs5o6ij1L/
	5FkfjcLPQq8D+ACQ==
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
Subject: [PATCH v3 08/44] x86/paravirt: Reorder headers alphabetically
Date: Fri, 13 Jun 2025 01:39:34 +0200
Message-ID: <20250612234010.572636-9-darwi@linutronix.de>
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
 arch/x86/kernel/paravirt.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index ab3e172dcc69..3d745cd25a43 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -6,34 +6,34 @@
     2007 - x86_64 support added by Glauber de Oliveira Costa, Red Hat Inc
 */
 
+#include <linux/bcd.h>
+#include <linux/efi.h>
 #include <linux/errno.h>
-#include <linux/init.h>
 #include <linux/export.h>
-#include <linux/efi.h>
-#include <linux/bcd.h>
 #include <linux/highmem.h>
+#include <linux/init.h>
 #include <linux/kprobes.h>
 #include <linux/pgtable.h>
 #include <linux/static_call.h>
 
+#include <asm/apic.h>
 #include <asm/bug.h>
-#include <asm/paravirt.h>
 #include <asm/debugreg.h>
+#include <asm/delay.h>
 #include <asm/desc.h>
+#include <asm/fixmap.h>
+#include <asm/gsseg.h>
+#include <asm/io_bitmap.h>
+#include <asm/irq.h>
+#include <asm/msr.h>
+#include <asm/paravirt.h>
+#include <asm/pgalloc.h>
 #include <asm/setup.h>
+#include <asm/special_insns.h>
 #include <asm/time.h>
-#include <asm/pgalloc.h>
-#include <asm/irq.h>
-#include <asm/delay.h>
-#include <asm/fixmap.h>
-#include <asm/apic.h>
-#include <asm/tlbflush.h>
 #include <asm/timer.h>
-#include <asm/special_insns.h>
 #include <asm/tlb.h>
-#include <asm/io_bitmap.h>
-#include <asm/gsseg.h>
-#include <asm/msr.h>
+#include <asm/tlbflush.h>
 
 /* stub always returning 0. */
 DEFINE_ASM_FUNC(paravirt_ret0, "xor %eax,%eax", .entry.text);
-- 
2.49.0

