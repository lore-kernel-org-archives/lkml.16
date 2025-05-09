Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2E821ADAB
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746805611; cv=none; b=FwEMkdlxdFZi1t7blube/2Zvy1YGXUqOZLb1c31XwcHKyAWxBCsqIdRF3qa5g501EwprP+krVzq/ziGJ4pf4PiYkjxg1nMl6llQj/utsEnUryWTgtJjr+A5biXGg84dtWc6d2zgyEe1ulNOspgsbBWdxOAGQ9c0YL5DwcbhRiAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746805611; c=relaxed/simple;
	bh=1ShT8UK0LokCHaO4QMELxKGLO2ce9JPvS0gf7gAFVE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KT5juH3GyIMnlPaYFL1vAWodUPy98DOVVG//y3AG5rrPwb3EtxDAN+oS+u40wDYwDZ/vrM+lcTdKllG3Oj/IAA3umMU7Tl1tAAnCC7qUKVqepkCByY/Jc9XNWppb+tLUiv9/r3nE2D3BUMy3jO5QD7mdjvEJGFkKUyhvY44FmDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gOyWVYw7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOyWVYw7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746805610; x=1778341610;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1ShT8UK0LokCHaO4QMELxKGLO2ce9JPvS0gf7gAFVE4=;
  b=gOyWVYw7ndL8mKEkh0Sw9FiKOz537YTcGzKzequNBya3OSavrgV+pH8r
   RO/ur2gdKw0tuwhBCUXiyjZJwNUHW82/IiW1RWhgTj1NfFGkJChTfwYKH
   CmHo+gERcYEGfsPeznEWixZ4tncjuGIFhcsE9cprZRso6ECAtMW1yXHIZ
   5Wk1B64aP4pipRr07m8rXFrrToH46Pra2bnb3ceTczFOp/ALbDiz1jcx7
   5kpwbulLHkl7Hxs25Uf8SI/R85H3LE8icnqN5WoRW15DTpasluschbYT2
   CV2Nx5QSKaNUkODERCZgb5uMcqW6dUfqNcn0GMRuxq8SonxseNyNRDwds
   g==;
X-CSE-ConnectionGUID: yj614wrqTQ6FBkuL40SYUw==
X-CSE-MsgGUID: MuCDdXAXRHyiggXk8BS31g==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48644593"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="48644593"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 08:46:49 -0700
X-CSE-ConnectionGUID: 0AXXWekAQayK1orAOH+poA==
X-CSE-MsgGUID: KKVqMy/jSIKSiQNnNkq5Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="173828701"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 09 May 2025 08:46:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6E1E41D7; Fri, 09 May 2025 18:46:46 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] genirq: Consistently use '%u' format specifier for irq
Date: Fri,  9 May 2025 18:46:42 +0300
Message-ID: <20250509154643.1499171-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are three cases in the genirq code when the irq, as an unsigned
integer variable, is converted to text representation by sprintf().
In two cases it uses '%d' specifier which is for signed values. While
it's not a problem right now, potentially it might be in the future
in case too big (> INT_MAX) number will appear there.

Consistently use '%u' format specifier for irq which is declared as
unsigned int in all these cases.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 kernel/irq/debugfs.c | 2 +-
 kernel/irq/proc.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/irq/debugfs.c b/kernel/irq/debugfs.c
index 9004a17b93a2..3d6a5b3cfaf3 100644
--- a/kernel/irq/debugfs.c
+++ b/kernel/irq/debugfs.c
@@ -230,7 +230,7 @@ void irq_add_debugfs_entry(unsigned int irq, struct irq_desc *desc)
 	if (!irq_dir || !desc || desc->debugfs_file)
 		return;
 
-	sprintf(name, "%d", irq);
+	sprintf(name, "%u", irq);
 	desc->debugfs_file = debugfs_create_file(name, 0644, irq_dir, desc,
 						 &dfs_irq_ops);
 }
diff --git a/kernel/irq/proc.c b/kernel/irq/proc.c
index 94eba9a425c4..29c2404e743b 100644
--- a/kernel/irq/proc.c
+++ b/kernel/irq/proc.c
@@ -309,7 +309,7 @@ static bool name_unique(unsigned int irq, struct irqaction *new_action)
 
 void register_handler_proc(unsigned int irq, struct irqaction *action)
 {
-	char name [MAX_NAMELEN];
+	char name[MAX_NAMELEN];
 	struct irq_desc *desc = irq_to_desc(irq);
 
 	if (!desc->dir || action->dir || !action->name || !name_unique(irq, action))
@@ -345,7 +345,7 @@ void register_irq_proc(unsigned int irq, struct irq_desc *desc)
 		return;
 
 	/* create /proc/irq/1234 */
-	sprintf(name, "%d", irq);
+	sprintf(name, "%u", irq);
 	desc->dir = proc_mkdir(name, root_irq_dir);
 	if (!desc->dir)
 		return;
-- 
2.47.2

