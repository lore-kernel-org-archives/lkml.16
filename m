Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274A72E2F0A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771676; cv=none; b=I38UNoTQv5DS5BPr/IfRugPq3re/9vDFg12yvDSq2Qe6bPeJn9tDyqi63GAjYxlC9iUhHVG2YPTA/Btmwsw8xjNU3P5z0AtWZbyioO+hFjZkREteWXs+QjITNcMXyaDa/FUErM4PedHXQuh9dgzMzw13iLC0rCYRx1+Tuz2XZGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771676; c=relaxed/simple;
	bh=BOTIv1JT/df8iXEMB7pM5ixVBrjXOOY71KdA3T0iqTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M8ZOuAJETPNx2+NMFlZtYK4Ft6TX8Y8G7dOL//sarOCwsogf8LVPxQmX4l1NDY4/+qsh/5UKkoOeXgGvForUY0h96lNoTHiN+TjyCWjZf5ri05kyHexdp+pgILDnPcXxDhbfEzMtNqeP7GOy1bwF5lkxkBkq+lNdG2nJKp+fw64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fBrQeAMK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OpaHr9r8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fBrQeAMK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OpaHr9r8"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O37EfZZ9hCClxam6hs8B0tHuhYTXExkKqZiHQCfEhOI=;
	b=fBrQeAMKyCbWBSak89/If0CuNnSrX8hjA835+TyWQPw6qQGoDjYaKUazHULtve6h2ic1km
	SSgZiPlliPeQAXeKglTyeIGKMfQnwT6YSm6p9qosqM36uZLfk72o/Cj9ctCmym/+C7JdzO
	k1oGnKVQH4xqhKAdFyITypRBccNwWfV84Q5+65xN9Spvqe7tecfGdNDOFnh4BRfLCCWI4y
	py/0seLYFI5syNNjk6/7NSZCeK+TzQz5TgjR3wycj5aGXhmQPtVQbtBqjXQvlx61ux9WD/
	YbYqddS+faZ6woVZNUnXTu5xxw3FlUMcJxM1hHoHXeW2mqwTk83nFuatZHYR5w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O37EfZZ9hCClxam6hs8B0tHuhYTXExkKqZiHQCfEhOI=;
	b=OpaHr9r8Iqh1+Vwn8sDWXNFHRyj8VawrskPRjkSbKwVecpb4FarhNSojuUh260U3TvMo5+
	52vaAkQb9H+6xbDw==
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
Subject: [PATCH v3 16/44] thermal: intel: Reorder headers alphabetically
Date: Fri, 13 Jun 2025 01:39:42 +0200
Message-ID: <20250612234010.572636-17-darwi@linutronix.de>
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
 drivers/thermal/intel/x86_pkg_temp_thermal.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/intel/x86_pkg_temp_thermal.c b/drivers/thermal/intel/x86_pkg_temp_thermal.c
index 3fc679b6f11b..c843cb5fc5c3 100644
--- a/drivers/thermal/intel/x86_pkg_temp_thermal.c
+++ b/drivers/thermal/intel/x86_pkg_temp_thermal.c
@@ -5,19 +5,19 @@
  */
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/module.h>
+#include <linux/cpu.h>
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/err.h>
 #include <linux/init.h>
 #include <linux/intel_tcc.h>
-#include <linux/err.h>
+#include <linux/module.h>
 #include <linux/param.h>
-#include <linux/device.h>
 #include <linux/platform_device.h>
-#include <linux/cpu.h>
-#include <linux/smp.h>
-#include <linux/slab.h>
 #include <linux/pm.h>
+#include <linux/slab.h>
+#include <linux/smp.h>
 #include <linux/thermal.h>
-#include <linux/debugfs.h>
 
 #include <asm/cpu_device_id.h>
 #include <asm/msr.h>
-- 
2.49.0

