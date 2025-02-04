Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F4A2144BF
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 15:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738683920; cv=none; b=N9Zre2j46MEN0R5jtRk5wmK0qC0fpK5VeLHQffvIXGIJ0KZQxDsZXhQLt8JNdC+FBDDCCE0g4hazglaBcyKkn9K7g7BXwZQzVOB5Q4GFY4qDF/vJZYZGzyMZfr9VjzYB6XV7Hx5+AOAE3P27o4Grg8Bymm1FkSsXh/aPQZUCyc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738683920; c=relaxed/simple;
	bh=8XL1TFyZuCNPAg+bKC152A7HHyrPwG8cSOFGVTefy9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MEK+QAWmzgoJy3snpv3Rsp2RY8Hh4vgk87XZabJXoYCQthTRbvOeUCMe5PIAoBdNpe24zYWlhVYAW9TgQDOz/FgWb2CTivS9iEYtRRt5f2LSmjNWN7ZsP/bICkNn3hLlZRuGTlzkGJ06lL0O7aRLjRvBea6vbpHzcDORDJll0Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IkxMHlWE; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IkxMHlWE"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738683913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HV8F/QPONcXmwgU3Iqo9jmtTqj8w2A6vXUojkBDn4XI=;
	b=IkxMHlWEOWz1bJJ4ijXGuhcWv92foF8HM/3nkXf+hNjSoQGa1geTG4kHuASkF6/j39T/Jl
	p4dZnU8Bdw4BL8ie0B294nQzOUhbe3yNZ5cYzkxP2GBQ5lALZrGVlk09onMm9yAudmn6nN
	5w0WLhfnLySrXyQB3ud+kUS0F6fLoL0=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: mpic: Use str_enabled_disabled() helper function
Date: Tue,  4 Feb 2025 16:44:23 +0100
Message-ID: <20250204154424.4231-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_enabled_disabled() helper
function.

Use pr_debug() instead of printk(KERN_DEBUG) to silence a checkpatch
warning.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/powerpc/sysdev/mpic.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
index d94cf36b0f65..25fc4ac91814 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -27,6 +27,7 @@
 #include <linux/spinlock.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/syscore_ops.h>
 #include <linux/ratelimit.h>
 #include <linux/pgtable.h>
@@ -474,9 +475,9 @@ static void __init mpic_scan_ht_msi(struct mpic *mpic, u8 __iomem *devbase,
 		addr = addr | ((u64)readl(base + HT_MSI_ADDR_HI) << 32);
 	}
 
-	printk(KERN_DEBUG "mpic:   - HT:%02x.%x %s MSI mapping found @ 0x%llx\n",
-		PCI_SLOT(devfn), PCI_FUNC(devfn),
-		flags & HT_MSI_FLAGS_ENABLE ? "enabled" : "disabled", addr);
+	pr_debug("mpic:   - HT:%02x.%x %s MSI mapping found @ 0x%llx\n",
+		 PCI_SLOT(devfn), PCI_FUNC(devfn),
+		 str_enabled_disabled(flags & HT_MSI_FLAGS_ENABLE), addr);
 
 	if (!(flags & HT_MSI_FLAGS_ENABLE))
 		writeb(flags | HT_MSI_FLAGS_ENABLE, base + HT_MSI_FLAGS);
-- 
2.48.0

