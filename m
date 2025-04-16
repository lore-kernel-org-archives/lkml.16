Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F272288FE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744769856; cv=none; b=HkY7824lFPXhKDyU1I60Ayp7JaBP+/PDIXLKBwX3kuljlcOHbIzbcCrOWPsTIKrq+aRk4H9ii43B0aYFgzZFctgpG0izcSHt59OshN7w82sRIjm5doiVAE7w3WTPv8XXGikdBWbmwNzwUAqEbxVo/yCgeA+5xQYlK04u70g6XSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744769856; c=relaxed/simple;
	bh=On84tfyqcGMRbTcYvCw2fn0MGiUEhtXhyKLIokAHRcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jvjJOQRhzDvib4aj3LYEZ9jF+WUre/sRRe/A2CmHtNLlLGvrA3nKkMZBRMpd3pwAt97cqpnyYjVMlCmB3kFlV3P/CfzlmBgnOoACIB/ulNtI9U8oLqM9d9ycMiOAnOP8u2NPiLPlO77BX14Lsv56UpsNDQINicLnwskrcicA0Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E8qMqx5z; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E8qMqx5z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744769855; x=1776305855;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=On84tfyqcGMRbTcYvCw2fn0MGiUEhtXhyKLIokAHRcA=;
  b=E8qMqx5zctDmNY9PgRcX8KfAR4h3SECyBgTwRq7NSrZRObvMiZAC07Ni
   B18cWRS73p8cmf5RXWJHri6MWhBEe6aTFXSlS6M71qDnv0RRroh8LueYr
   wu0MWOkMS/aeHr4xmhIWJCMg0moaHcbDBJ+SuBau62rJsVjAam9jM5BSy
   +59OVdOabEfOA4rPgxC/444xvTkJYMmdsVVfke/PraE2MQh9QSQq5tCSs
   5le5m77sLocWBCkD8H6W02Zqu5Ff3xMwj9x2Us2CT3DgwDVAyjyPRzCiR
   NtF+Jv9DIFeh2D4XLnYwUmxsbb6Um9h9J3PLUn5UT7eqEItppx4sKTu4d
   g==;
X-CSE-ConnectionGUID: SRfMvZfaRKSncYsbm1P8lw==
X-CSE-MsgGUID: EJIpUd3mS9K2i8/ZAeKDHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="48998164"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="48998164"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 19:17:34 -0700
X-CSE-ConnectionGUID: qDy9A4tJTACkp35mwEyWCQ==
X-CSE-MsgGUID: 35t2Z186QzqogGrKpMTn7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="130260442"
Received: from cbae1-mobl.amr.corp.intel.com (HELO cbae1-mobl.intel.com) ([10.124.128.227])
  by orviesa010.jf.intel.com with ESMTP; 15 Apr 2025 19:17:34 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: mingo@redhat.com
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	tglx@linutronix.de,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	chang.seok.bae@intel.com,
	Sohil Mehta <sohil.mehta@intel.com>
Subject: [PATCH 04/10] x86/fpu/apx: Enable APX state support
Date: Tue, 15 Apr 2025 19:16:54 -0700
Message-ID: <20250416021720.12305-5-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250416021720.12305-1-chang.seok.bae@intel.com>
References: <Z_onl1QbH9L1-8dq@gmail.com>
 <20250416021720.12305-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With securing APX against conflicting MPX, it is now ready to be enabled.
Include APX in the enabled xfeature set.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>
---
Changes from the last posting:
https://lore.kernel.org/lkml/20250320234301.8342-9-chang.seok.bae@intel.com/
* Include review tag
---
 arch/x86/include/asm/fpu/xstate.h | 3 ++-
 arch/x86/kernel/fpu/xstate.c      | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/fpu/xstate.h b/arch/x86/include/asm/fpu/xstate.h
index 7f39fe7980c5..b308a76afbb7 100644
--- a/arch/x86/include/asm/fpu/xstate.h
+++ b/arch/x86/include/asm/fpu/xstate.h
@@ -32,7 +32,8 @@
 				      XFEATURE_MASK_PKRU | \
 				      XFEATURE_MASK_BNDREGS | \
 				      XFEATURE_MASK_BNDCSR | \
-				      XFEATURE_MASK_XTILE)
+				      XFEATURE_MASK_XTILE | \
+				      XFEATURE_MASK_APX)
 
 /*
  * Features which are restored when returning to user space.
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index 14f5c1bb2080..2ac1fc182273 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -371,7 +371,8 @@ static __init void os_xrstor_booting(struct xregs_state *xstate)
 	 XFEATURE_MASK_BNDCSR |			\
 	 XFEATURE_MASK_PASID |			\
 	 XFEATURE_MASK_CET_USER |		\
-	 XFEATURE_MASK_XTILE)
+	 XFEATURE_MASK_XTILE |			\
+	 XFEATURE_MASK_APX)
 
 /*
  * setup the xstate image representing the init state
-- 
2.45.2

