Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E272E6D30
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771670; cv=none; b=PDDc0we+CYxWIVp7jkARdF9Iut3qUO6KoosipDQoTCLtqSavPlZ4ty79SsHlt0+ycieuqWTmIITvofLQk6Aw4daiiViipRB0OFPx1bE8Qqk1FnPKmPKEKKbSoaU8RFJ78XuFhSR4Q01Ma2aAQZU8BDxUx8GGt+IJkTJQz5DJjHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771670; c=relaxed/simple;
	bh=xTkNCtGv54QRP3zi04C/kKZV7/0Hr+t7JxjpmYJj1Pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BLTSCF29kYY8Ueh1F3HVl9PsNw/s6WCNmBUFoe0U/G/LfQ9SSeLYa7SGQtPp3NKApPAdmqwtXLSpzEM1ZWfdYEG3KLEU7vkff2WrOpMvR1W8twpMRWzWDr196t8aAHsyW9rgGxzK9eNvNJFc6VvGxK67HH0mEIsGlvVXM4aQn3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hk4n5EST; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LxwdS01S; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hk4n5EST";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LxwdS01S"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YMU6S8lg3lln4OqzSKY3PivZxKHqUKp79PCE1ks2MM8=;
	b=hk4n5ESTjgP6FCRO4xLYjSj7WtGsKw12mmBPdd917F2noMbpQ3mrTa5My1AyfGkiEEvMxd
	o6Wri+zCD2dI21/vrf1BHl6/KHQHIfjsmW+EI57OMo6ck12/36tsWzVxJatNmnRvc0Ddpr
	k0fed27IVZ1PY1NHbITgzRIkAIToZ8eRFBz/vxS4eyzVVDShfZ9zlq45dto5VjJOfTjToS
	bROxjxpZzfFvb59l8OO4x9zO3Ax+AqWcROm0niYoo2Z+1UorOcpN2Tpyb1e5Lx6nhLdOrb
	4Z4TK5QCZ7s4jomD2Vg3mRvoG/QYpCHoeBqr9bV5vu+XTNRylu9I8wmZ8oD5Bg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YMU6S8lg3lln4OqzSKY3PivZxKHqUKp79PCE1ks2MM8=;
	b=LxwdS01SN6phZW1a4d4dwyb4qWB7maLyACMldx7eCau5rllk7o1Nxyam+iZlrHTca3pL80
	086D9iWYBmfWebAg==
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
Subject: [PATCH v3 14/44] hwmon: (k8temp) Reorder headers alphabetically
Date: Fri, 13 Jun 2025 01:39:40 +0200
Message-ID: <20250612234010.572636-15-darwi@linutronix.de>
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
 drivers/hwmon/k8temp.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/k8temp.c b/drivers/hwmon/k8temp.c
index 2b80ac410cd1..8c1efce9a04b 100644
--- a/drivers/hwmon/k8temp.c
+++ b/drivers/hwmon/k8temp.c
@@ -7,13 +7,14 @@
  * Inspired from the w83785 and amd756 drivers.
  */
 
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/slab.h>
-#include <linux/pci.h>
-#include <linux/hwmon.h>
 #include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/init.h>
+#include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/pci.h>
+#include <linux/slab.h>
+
 #include <asm/processor.h>
 
 #define TEMP_FROM_REG(val)	(((((val) >> 16) & 0xff) - 49) * 1000)
-- 
2.49.0

