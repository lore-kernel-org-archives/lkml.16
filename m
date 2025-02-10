Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4271C549F
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182041; cv=none; b=f+sfDJdRUIqDJhZAlo6twlzN4zr79WfexeVmzHGCSSeY/HutD07fQbtuud+hn5H3RjhrRsKT+ISmp2qT6MzYqF/vQmOSsZp7apMAIG3Woeil4bVDZeIcZ4hi9IMEe9HI1+8QLgUW4V378mSzVU+yVHDqtdj2wc00/JnliOVScto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182041; c=relaxed/simple;
	bh=ny/2I4P8Qeno3VDTuyHtRGX8vHu9TzocogF/fmfxgy8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cHazdLwbVnYkl0C/W+04qQRSxy5K7SnIBfLaZ9cfVcHGIu/2K3kwIg/Yy4zO/47WMJrw5OvKeXONIRlBt1bpD9YdLq9zQXV07YXnDAwx2suFCANriMM1wGpmt62CMQNrOMyrKyuyrDxgf68iopp/KtU2EiZzyU/MkS701IzN0ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=c02SMLqg; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="c02SMLqg"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739182037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zzp1WaG1POUvvccWRbF+ncZqgOZGseBWxYU9NWcpXLs=;
	b=c02SMLqgN1gpepKc/mxxuzLgp8mK9gTEhsw0r+h6m+9C5Khfrb1tengXQJT1ury1V0kCfV
	iX3yWec4waM95BSGt5vw0CaejgZK/IFw95Q8JUgSSxPZSXQ8S62QLzfLOvGJD31v7nMzwB
	2+h9Dfz78pYnbr9dLfA/D0K7tj/nRXs=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/mm/fault: Use str_write_read() helper function
Date: Mon, 10 Feb 2025 11:06:46 +0100
Message-ID: <20250210100648.1440-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_write_read() helper function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/powerpc/mm/fault.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index c156fe0d53c3..806c74e0d5ab 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -17,6 +17,7 @@
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 #include <linux/types.h>
 #include <linux/pagemap.h>
 #include <linux/ptrace.h>
@@ -218,7 +219,7 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
 	// Read/write fault blocked by KUAP is bad, it can never succeed.
 	if (bad_kuap_fault(regs, address, is_write)) {
 		pr_crit_ratelimited("Kernel attempted to %s user page (%lx) - exploit attempt? (uid: %d)\n",
-				    is_write ? "write" : "read", address,
+				    str_write_read(is_write), address,
 				    from_kuid(&init_user_ns, current_uid()));
 
 		// Fault on user outside of certain regions (eg. copy_tofrom_user()) is bad
@@ -625,7 +626,7 @@ static void __bad_page_fault(struct pt_regs *regs, int sig)
 	case INTERRUPT_DATA_STORAGE:
 	case INTERRUPT_H_DATA_STORAGE:
 		pr_alert("BUG: %s on %s at 0x%08lx\n", msg,
-			 is_write ? "write" : "read", regs->dar);
+			 str_write_read(is_write), regs->dar);
 		break;
 	case INTERRUPT_DATA_SEGMENT:
 		pr_alert("BUG: %s at 0x%08lx\n", msg, regs->dar);
-- 
2.48.0

