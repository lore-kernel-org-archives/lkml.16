Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1578233719
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 10:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744798617; cv=none; b=R0wVATd9U7TD06A016NaA8AKNRI+rjKcYLdRdGNT75Px8DIQDMfUaBwaQZ+aqEFb60vzszEHNpoZdjJuaeo2tZerjfaa9A9g5CSYDlzUUbEma4wI9iZ5deA0hyVPXcjTWCKpgnqFGzxzX/hr/2+AzPvI+fKGEjQWUzs+xuuBmLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744798617; c=relaxed/simple;
	bh=PGm+GU8XfEbUcit4uprZrnkBRFqkEAIdH5XxUJAMH80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ozy1h/CSsT67s5wtJl6PYZqA3z+H91Bhxqsfw9upt7ZcgNzR2+Bv26JQeucEEip0vPxKHTjH3BGzF76LfdMLeEy56DJkNANMrjF0oqTHHu6HfPKMs7RcMkW666uf2XjrvspYcySMWcPAV047UT2Lp0r0uwqXXX8KdAd1uXqoHug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TPay27wQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TPay27wQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744798616; x=1776334616;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PGm+GU8XfEbUcit4uprZrnkBRFqkEAIdH5XxUJAMH80=;
  b=TPay27wQpKebweUBQxUxCef8KhiHsNJFHewGgYRuF01IHGROJ07iBVGR
   wY6JWmwVp5GLbEsj5ON9Bg0lgV/5aLvQlkW72cxa+RyFyvlSr6fICil1Z
   8rXt3d0NNVQdsTCoMJX72qACHzPJ8zglLut6huZRD/phBXod/CB5WdzeP
   XXetkMun5eZnLV7F8Lo7WNbIzM9WTEVVf209ITYhNcVNqaSnvvkE9+4bH
   smEmTVU+qBlRkTRF6eKQ2BCdShbUHi3jf4cdZetTfNDUWeoZELWxwYUar
   bVU6736ZQmENPC8Xk2sXDpx3X3dy7CoXRHqOc1M5FeCk/x72lWw6Y/fbF
   g==;
X-CSE-ConnectionGUID: D+0M9U4ST6KFG5cLC/Ovlg==
X-CSE-MsgGUID: dY6wCLgpQ8iWKDczdN+15A==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="56517111"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="56517111"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 03:16:55 -0700
X-CSE-ConnectionGUID: UWq6lwDfQLKp7NuyJZ/qDQ==
X-CSE-MsgGUID: ruZbGbE2SMekcxEOFSF1Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="134516004"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 16 Apr 2025 03:16:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A6C2AF4; Wed, 16 Apr 2025 13:16:52 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] genirq/irqdesc: Use sysfs_emit() to instead of s*printf()
Date: Wed, 16 Apr 2025 13:16:51 +0300
Message-ID: <20250416101651.2128688-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow the advice of the Documentation/filesystems/sysfs.rst and show()
should only use sysfs_emit() or sysfs_emit_at() when formatting the
value to be returned to user space.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 kernel/irq/irqdesc.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 4258cd6bd3b4..4bcc6ff81e39 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -257,11 +257,11 @@ static ssize_t per_cpu_count_show(struct kobject *kobj,
 	for_each_possible_cpu(cpu) {
 		unsigned int c = irq_desc_kstat_cpu(desc, cpu);
 
-		ret += scnprintf(buf + ret, PAGE_SIZE - ret, "%s%u", p, c);
+		ret += sysfs_emit_at(buf, ret, "%s%u", p, c);
 		p = ",";
 	}
 
-	ret += scnprintf(buf + ret, PAGE_SIZE - ret, "\n");
+	ret += sysfs_emit_at(buf, ret, "\n");
 	return ret;
 }
 IRQ_ATTR_RO(per_cpu_count);
@@ -273,10 +273,8 @@ static ssize_t chip_name_show(struct kobject *kobj,
 	ssize_t ret = 0;
 
 	raw_spin_lock_irq(&desc->lock);
-	if (desc->irq_data.chip && desc->irq_data.chip->name) {
-		ret = scnprintf(buf, PAGE_SIZE, "%s\n",
-				desc->irq_data.chip->name);
-	}
+	if (desc->irq_data.chip && desc->irq_data.chip->name)
+		ret = sysfs_emit(buf, "%s\n", desc->irq_data.chip->name);
 	raw_spin_unlock_irq(&desc->lock);
 
 	return ret;
@@ -291,7 +289,7 @@ static ssize_t hwirq_show(struct kobject *kobj,
 
 	raw_spin_lock_irq(&desc->lock);
 	if (desc->irq_data.domain)
-		ret = sprintf(buf, "%lu\n", desc->irq_data.hwirq);
+		ret = sysfs_emit(buf, "%lu\n", desc->irq_data.hwirq);
 	raw_spin_unlock_irq(&desc->lock);
 
 	return ret;
@@ -305,8 +303,7 @@ static ssize_t type_show(struct kobject *kobj,
 	ssize_t ret = 0;
 
 	raw_spin_lock_irq(&desc->lock);
-	ret = sprintf(buf, "%s\n",
-		      irqd_is_level_type(&desc->irq_data) ? "level" : "edge");
+	ret = sysfs_emit(buf, "%s\n", irqd_is_level_type(&desc->irq_data) ? "level" : "edge");
 	raw_spin_unlock_irq(&desc->lock);
 
 	return ret;
@@ -321,7 +318,7 @@ static ssize_t wakeup_show(struct kobject *kobj,
 	ssize_t ret = 0;
 
 	raw_spin_lock_irq(&desc->lock);
-	ret = sprintf(buf, "%s\n", str_enabled_disabled(irqd_is_wakeup_set(&desc->irq_data)));
+	ret = sysfs_emit(buf, "%s\n", str_enabled_disabled(irqd_is_wakeup_set(&desc->irq_data)));
 	raw_spin_unlock_irq(&desc->lock);
 
 	return ret;
@@ -337,7 +334,7 @@ static ssize_t name_show(struct kobject *kobj,
 
 	raw_spin_lock_irq(&desc->lock);
 	if (desc->name)
-		ret = scnprintf(buf, PAGE_SIZE, "%s\n", desc->name);
+		ret = sysfs_emit(buf, "%s\n", desc->name);
 	raw_spin_unlock_irq(&desc->lock);
 
 	return ret;
@@ -354,14 +351,13 @@ static ssize_t actions_show(struct kobject *kobj,
 
 	raw_spin_lock_irq(&desc->lock);
 	for_each_action_of_desc(desc, action) {
-		ret += scnprintf(buf + ret, PAGE_SIZE - ret, "%s%s",
-				 p, action->name);
+		ret += sysfs_emit_at(buf, ret, "%s%s", p, action->name);
 		p = ",";
 	}
 	raw_spin_unlock_irq(&desc->lock);
 
 	if (ret)
-		ret += scnprintf(buf + ret, PAGE_SIZE - ret, "\n");
+		ret += sysfs_emit_at(buf, ret, "\n");
 
 	return ret;
 }
-- 
2.47.2

