Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DEC23BD08
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744803688; cv=none; b=FGzwffW2EBjr+AUoJesnqX69Jus9Z1qblqQb2peSr/xweG4DOHUG5TLnLz8h4Frzz63uM8JgEbrDNYHzxRbc8f4Aw3NHm/U4r5edmIpnX+hPlEp4OgJmzEJdNRg3koXv734SFJBp3GGcWAi6v2sEQ1Whwv6V9Aj3rRkh4kxMNFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744803688; c=relaxed/simple;
	bh=YWBopjC+K6cTqOYj8umyVnjwlSNxz9ti63hmPAeHxk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CdbKy9sW3z7RhsDtOILMvENKewB/R3J80yM64MiNsIewjqEHS7OK/OqnTikMfqqRMmlpiCCrVOMUhIu/Oo2W/d6EAZCcopOIUbqOOoniYut/43bwv9gOSMbARsptrQEqDigv1xnzjvMsGGcf4ylT/9dbRUN+oHsu779KTMFz5u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WicUES8b; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WicUES8b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744803687; x=1776339687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YWBopjC+K6cTqOYj8umyVnjwlSNxz9ti63hmPAeHxk0=;
  b=WicUES8b7x0xKuZkf28kwPB6PAeN7GROnaCmWGy90VHrNanhqT7cp/oN
   iwNwWUsLpcAN4/F7kjDT2k1Qi3VxwaIcwX5vXzZT9mRiH8R7uxUXwbWc0
   aKopfalY1S/1s+q8yFQViFQgZEMls1jGHxuY70v09UW0TOKZGxAXnNCxR
   Wgv0K3KnGZ5pxSJujvUKJLDc3407/U//5de/UmKqlXEXnWaoV4S8cpkDv
   zuCNQHM3liL5ALzdsEKBeb36tfW/P1EAAdO3MSEnAv3ewS05OAtDhmbDU
   Onuajr7/S3H+8zbsuo0oWbAoD5fzoeb0rPSsNyHkEH+wssV7GH3JMqLFd
   A==;
X-CSE-ConnectionGUID: SOuDeG8tT4uSyWGMrktcEw==
X-CSE-MsgGUID: af/I54ejTbaKJJ+yrRHwmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="57713818"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="57713818"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 04:41:27 -0700
X-CSE-ConnectionGUID: kHQRSo9bSUivjtEJOeKguA==
X-CSE-MsgGUID: 84pMR0F/Teqjh601j0dtPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="161483449"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 16 Apr 2025 04:41:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id EC815221; Wed, 16 Apr 2025 14:41:23 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] genirq/irqdesc: Decrease indentation level in __irq_get_desc_lock()
Date: Wed, 16 Apr 2025 14:40:33 +0300
Message-ID: <20250416114122.2191820-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250416114122.2191820-1-andriy.shevchenko@linux.intel.com>
References: <20250416114122.2191820-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a conditional that covers all the code for the entire function.
Invert it and decrease indentation level. This also helps for further
changes to be clearer and tidier.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 kernel/irq/irqdesc.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 4bcc6ff81e39..0afc2b0b03be 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -900,23 +900,26 @@ struct irq_desc *
 __irq_get_desc_lock(unsigned int irq, unsigned long *flags, bool bus,
 		    unsigned int check)
 {
-	struct irq_desc *desc = irq_to_desc(irq);
+	struct irq_desc *desc;
 
-	if (desc) {
-		if (check & _IRQ_DESC_CHECK) {
-			if ((check & _IRQ_DESC_PERCPU) &&
-			    !irq_settings_is_per_cpu_devid(desc))
-				return NULL;
+	desc = irq_to_desc(irq);
+	if (!desc)
+		return NULL;
 
-			if (!(check & _IRQ_DESC_PERCPU) &&
-			    irq_settings_is_per_cpu_devid(desc))
-				return NULL;
-		}
+	if (check & _IRQ_DESC_CHECK) {
+		if ((check & _IRQ_DESC_PERCPU) &&
+		    !irq_settings_is_per_cpu_devid(desc))
+			return NULL;
 
-		if (bus)
-			chip_bus_lock(desc);
-		raw_spin_lock_irqsave(&desc->lock, *flags);
+		if (!(check & _IRQ_DESC_PERCPU) &&
+		    irq_settings_is_per_cpu_devid(desc))
+			return NULL;
 	}
+
+	if (bus)
+		chip_bus_lock(desc);
+	raw_spin_lock_irqsave(&desc->lock, *flags);
+
 	return desc;
 }
 
-- 
2.47.2

