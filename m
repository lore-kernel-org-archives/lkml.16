Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8C82E62DF
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771666; cv=none; b=fWG/gr5e+3DkaNUp8RUY184YEAlc9aBL3ngpUyYC8mnBuyftTQwO9p9oJv9Ry/nwiRz0+qJi5Hoyo7VPw7FJ9CWSKARDtW2J2ZR75t+mpp/n3mgKxhLNoMZN6PUseCmxYODWbsu+ABbYH6DBMBsO/T6osZNXbABaDj9wZ3amK4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771666; c=relaxed/simple;
	bh=kwENynR0HQAEs2KkZiP/4lhLFlHG8UgRYTZ9OQeMRfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nXkzNSm1eS4/U5SyFylF9FotRCDU32gjQVPxbH4gVg+3dsuHvMqJMskrJDzC7zf38/6vbDU/rtDBGQHJZqLOC3Sp1M7lHWV2GrA3QOIlkaNJ/XhZgeckev2WPCiDAHiJZKW8Pk8egGT4NFqQ4Z8v68A9Qz27FiORPhgcxjQkeRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ovm7FIam; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8pwcJcte; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ovm7FIam";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8pwcJcte"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9OcfKWQHu3imp0k6viJCu2d7AM03u2m+zZIjbUdF7D4=;
	b=ovm7FIammt7hBTYe3ncMvRIhJTedKMZGs1nUBGZCFe9banCUU0ea59T92NyjiUb0biAG3W
	QQoOITfkG+Zk6TWN/7lXhbSolYJwATlwpd/+sXvZkdpwTVDbj83ky+2t7HaZlwg2Zv39rJ
	Z0rfL8Xa4zrHBCaKWHK8KzM8f4FK0e9wxbpyd3MLcx20LpTFGI/S3KF915DRZsoWcVhsS3
	2ZN2N59UJq4fhmMNvgjRZFH539E4Xjbuj1a/uzObJiQLoCwDJWECf5P7c36Xqv1r5Qy7UD
	nVyepbh04tptk11ueo5g4hlMFapBhYsVM7wiEOI6/btIa37TKzuyOicQIDVumg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9OcfKWQHu3imp0k6viJCu2d7AM03u2m+zZIjbUdF7D4=;
	b=8pwcJcte1gp0DX4YVDYa0Pz3TjkJRfyDFIJfoWFpwfJIPjWNKViz/n17CJVt2G9kW9Q88Q
	8fGXIa67d9kxqtAA==
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
Subject: [PATCH v3 13/44] hwmon: (fam15h_power) Reorder headers alphabetically
Date: Fri, 13 Jun 2025 01:39:39 +0200
Message-ID: <20250612234010.572636-14-darwi@linutronix.de>
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
 drivers/hwmon/fam15h_power.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/fam15h_power.c b/drivers/hwmon/fam15h_power.c
index 8ecebea53651..5a5674e85f63 100644
--- a/drivers/hwmon/fam15h_power.c
+++ b/drivers/hwmon/fam15h_power.c
@@ -6,20 +6,21 @@
  * Author: Andreas Herrmann <herrmann.der.user@googlemail.com>
  */
 
+#include <linux/bitops.h>
+#include <linux/cpu.h>
+#include <linux/cpumask.h>
 #include <linux/err.h>
-#include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
+#include <linux/hwmon.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/pci.h>
-#include <linux/bitops.h>
-#include <linux/cpu.h>
-#include <linux/cpumask.h>
-#include <linux/time.h>
 #include <linux/sched.h>
+#include <linux/time.h>
 #include <linux/topology.h>
-#include <asm/processor.h>
+
 #include <asm/msr.h>
+#include <asm/processor.h>
 
 MODULE_DESCRIPTION("AMD Family 15h CPU processor power monitor");
 MODULE_AUTHOR("Andreas Herrmann <herrmann.der.user@googlemail.com>");
-- 
2.49.0

