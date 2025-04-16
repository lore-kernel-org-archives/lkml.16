Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C12323F40D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744803690; cv=none; b=L0fC++4R95WaIxA6vpfMPuvFmrOG0CUq+s9NmZ4H0wEEisD6SgGdjYqu8k78OUaZxij875qK11jJP7Mr+xYqMyW0kWJgBLWPqfbToOUEDRG8ULgMjO6e0B02DN/Rz9Ecso498Cm9jV2bxIY5M1pbAeXB3oW6uKhyEp7NK8B7mPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744803690; c=relaxed/simple;
	bh=yjf71iSGw6L9VjdaiBYFnuG6LUNuRBATO1IY7lEs/TQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xp8K98J6nz5vmatoyfscGRF3UoqrNj0p4Ggykxe4Cdr0xPILjvLyiAMpaQ41s6eMoQeKllABEWEgzsSFW+ERDPpGwP0O4bfmzSPdbVsdUPgaiPvzzh/bcpb1ox6+J8+L7HhWxYQU9bgrDmJLH0AElPR654tifaXGuknYgDi3mlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JXJ0bez6; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JXJ0bez6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744803689; x=1776339689;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yjf71iSGw6L9VjdaiBYFnuG6LUNuRBATO1IY7lEs/TQ=;
  b=JXJ0bez6kRbEsskU6XihJh4PqRTvN0phTP4XoZfcy6SVEvA2eg08Pw2W
   FypqShvlWI+TfkHig5YBEHa4fcMUgcEMLJwI7mbeslNpNpGVMuJobzqUx
   UnwXBTPx7QRXS7kcK67q3IsKoQcfgspAofVRPbVq0MHnPefc/HimtEwnm
   MZi3RfNCXacmVuAdyV477DLygVGmCccsmPwup0r9ywtTz5iDa87l2LryH
   E8YNXSg6Dg95Nt+ahK24dKu9MlNkKcg0fs6HGwjq+A+Lw7LewvlEbExJf
   +lGbUvk2I5nGRDOWni4co8xFXd97dYjM17ThDeKYrLUwOsh9QHk1u3TDw
   w==;
X-CSE-ConnectionGUID: 3UAnmnt9TO6TFkP/N/nQUg==
X-CSE-MsgGUID: Ta28shzqRJq00dKRo6ny7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="57713820"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="57713820"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 04:41:27 -0700
X-CSE-ConnectionGUID: TO9by9/gQuKK20r9jnF+kQ==
X-CSE-MsgGUID: od00ZR+BTTuPA+RbxYTTag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="161483450"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 16 Apr 2025 04:41:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5C3BA22A; Wed, 16 Apr 2025 14:41:24 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] genirq/irqdesc: Balance locking to make sparse happy
Date: Wed, 16 Apr 2025 14:40:34 +0300
Message-ID: <20250416114122.2191820-3-andriy.shevchenko@linux.intel.com>
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

Sparse is not happy right now about conditional locking and
complains:

  irqdesc.c:899:17: warning: context imbalance in '__irq_get_desc_lock' - wrong count at exit

Refactor the code and use __acquire() to make it happy.
Annotate the function that it acquires the lock in the
similar way how __irq_put_desc_unlock() is marked.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 kernel/irq/irqdesc.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 0afc2b0b03be..cecff0cb13eb 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -899,21 +899,22 @@ unsigned int irq_get_next_irq(unsigned int offset)
 struct irq_desc *
 __irq_get_desc_lock(unsigned int irq, unsigned long *flags, bool bus,
 		    unsigned int check)
+	__acquires(&desc->lock)
 {
 	struct irq_desc *desc;
 
 	desc = irq_to_desc(irq);
 	if (!desc)
-		return NULL;
+		goto lock;
 
 	if (check & _IRQ_DESC_CHECK) {
 		if ((check & _IRQ_DESC_PERCPU) &&
 		    !irq_settings_is_per_cpu_devid(desc))
-			return NULL;
+			goto lock;
 
 		if (!(check & _IRQ_DESC_PERCPU) &&
 		    irq_settings_is_per_cpu_devid(desc))
-			return NULL;
+			goto lock;
 	}
 
 	if (bus)
@@ -921,6 +922,10 @@ __irq_get_desc_lock(unsigned int irq, unsigned long *flags, bool bus,
 	raw_spin_lock_irqsave(&desc->lock, *flags);
 
 	return desc;
+
+lock:
+	__acquire(&desc->lock);
+	return NULL;
 }
 
 void __irq_put_desc_unlock(struct irq_desc *desc, unsigned long flags, bool bus)
-- 
2.47.2

