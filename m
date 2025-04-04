Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0F91DA53
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 16:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743785537; cv=none; b=iFSPZmMDGbbuWtvQh5NMBuAxnl/MyMh19vv3+bwGSE5v0Ji93LnFQZqyfCMnw8ekEHIsZ6gXpxxOBbNOvertzGUUl3P3yzVoj/4/P3ivMBCIr2byL+5dLsBSQrzo+o6dc/CbltuJ2ATrj+0vCeRpCOjdkmUbI0KUr8tHiAw1EL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743785537; c=relaxed/simple;
	bh=5lDdvReyzVEX97KMbGRyvWLuicLyJkWPizdN9Pf2q0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YD22xgkoHrkDGWDQG/KThD0rpyWag53W/3tMvU006hlGLYFCTIy3o+xqHQUR5mc1e2GvkOLtjtFZE0JORocy1gqo5g06wLFVAQn0N01S5iFZ/0Pz/qbH4TC38T46d8gp6GI7XSUmbBDOPa+cppoAPEl5VV8ahWFBotOel6h5GKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdhQG14n; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdhQG14n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743785536; x=1775321536;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5lDdvReyzVEX97KMbGRyvWLuicLyJkWPizdN9Pf2q0c=;
  b=fdhQG14nnnA+aDzsq1VkttX/sIgKO3MQQ8KGNezd0YA4mIF9wjMrV3iQ
   Uk2jkTwNl2bMlClifsdPb6aepPtQ3wJeXjCxlwBgLgJeiBmyesf0AAsci
   xcfzFDMwt1RILoCR5x5cHeOqUg13HvU/WLfiCDtyUVq83bcZ29ODKC0at
   itmbOYYXx2XwBIlRaDazcLVNoox80EF0mprMhU+RmiTWrjlaggx1qIunM
   4uTmqvtQ5gVujQJLRq0Bt5hH0tMTeLhXeQ+gjuve3A+cyrnXfzxGqy9w+
   LRivmcmRehnrFGAVVODEmTXpwyIIIzLUJTt19CEJPhI8dKLD5y0lBUqsh
   Q==;
X-CSE-ConnectionGUID: wq+1zVbsRkCKJ/WcYPxnAA==
X-CSE-MsgGUID: IEpqIv/ASGabn9ykibndkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="44479208"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="44479208"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 09:52:15 -0700
X-CSE-ConnectionGUID: tH1TQQLhSZiNhAS25wu9GQ==
X-CSE-MsgGUID: h+qRiDY5RaK8jbPnI/Uw4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="128205053"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 04 Apr 2025 09:52:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 87D9F129; Fri, 04 Apr 2025 19:52:11 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v1 1/1] sched/fair: Mark some static const with __maybe_unused
Date: Fri,  4 Apr 2025 19:52:04 +0300
Message-ID: <20250404165204.3657093-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GCC considers that some static const defined in the lockdep_internals.h
are unused, which prevents `make W=1` and CONFIG_WERROR=y builds:

kernel/locking/lockdep_internals.h:69:28: error: ‘LOCKF_USED_IN_IRQ_READ’ defined but not used [-Werror=unused-const-variable=]
   69 | static const unsigned long LOCKF_USED_IN_IRQ_READ =
      |                            ^~~~~~~~~~~~~~~~~~~~~~
kernel/locking/lockdep_internals.h:63:28: error: ‘LOCKF_ENABLED_IRQ_READ’ defined but not used [-Werror=unused-const-variable=]
   63 | static const unsigned long LOCKF_ENABLED_IRQ_READ =
      |                            ^~~~~~~~~~~~~~~~~~~~~~
kernel/locking/lockdep_internals.h:57:28: error: ‘LOCKF_USED_IN_IRQ’ defined but not used [-Werror=unused-const-variable=]
   57 | static const unsigned long LOCKF_USED_IN_IRQ =
      |                            ^~~~~~~~~~~~~~~~~
kernel/locking/lockdep_internals.h:51:28: error: ‘LOCKF_ENABLED_IRQ’ defined but not used [-Werror=unused-const-variable=]
   51 | static const unsigned long LOCKF_ENABLED_IRQ =
      |                            ^~~~~~~~~~~~~~~~~

Fix this by marking them with __maybe_unused.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 kernel/locking/lockdep_internals.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/locking/lockdep_internals.h b/kernel/locking/lockdep_internals.h
index 20f9ef58d3d0..82e71335f367 100644
--- a/kernel/locking/lockdep_internals.h
+++ b/kernel/locking/lockdep_internals.h
@@ -48,25 +48,25 @@ enum {
 };
 
 #define LOCKDEP_STATE(__STATE)	LOCKF_ENABLED_##__STATE |
-static const unsigned long LOCKF_ENABLED_IRQ =
+static __maybe_unused const unsigned long LOCKF_ENABLED_IRQ =
 #include "lockdep_states.h"
 	0;
 #undef LOCKDEP_STATE
 
 #define LOCKDEP_STATE(__STATE)	LOCKF_USED_IN_##__STATE |
-static const unsigned long LOCKF_USED_IN_IRQ =
+static __maybe_unused const unsigned long LOCKF_USED_IN_IRQ =
 #include "lockdep_states.h"
 	0;
 #undef LOCKDEP_STATE
 
 #define LOCKDEP_STATE(__STATE)	LOCKF_ENABLED_##__STATE##_READ |
-static const unsigned long LOCKF_ENABLED_IRQ_READ =
+static __maybe_unused const unsigned long LOCKF_ENABLED_IRQ_READ =
 #include "lockdep_states.h"
 	0;
 #undef LOCKDEP_STATE
 
 #define LOCKDEP_STATE(__STATE)	LOCKF_USED_IN_##__STATE##_READ |
-static const unsigned long LOCKF_USED_IN_IRQ_READ =
+static __maybe_unused const unsigned long LOCKF_USED_IN_IRQ_READ =
 #include "lockdep_states.h"
 	0;
 #undef LOCKDEP_STATE
-- 
2.47.2

