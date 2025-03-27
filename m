Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCA01E51EF
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 23:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743119348; cv=none; b=EyiSF08Si/I2Sh77xH5UD5vA6wyB+VlZI7O5djOdt+1j7jZstDDxmNxjnbai/gM0eQ4M578OCmAZdw6vi/Hu69sflQxNDFLderMHBzCs3ACUoQKrY8oeInSrg0qucXmrmXow4WRoXQn+KDC0v0kiWSlURiiTKjcYtcEjfMkzoXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743119348; c=relaxed/simple;
	bh=7xuzZW2SqsDXU4zjPwI8U9yRxCTuvO3b39KZjUIDomI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SqvREG2LX+zsm/rCKTNBER/E+uKftAuqSQ6J6GXLET2408aTSxVNYJzA3O/8occRpt6qQwD5KTfQp7q6Jaw84+hmWecrUIr9zV3lQY3O8A+K6j0eBVmnu85Xd4BvhP6BmGm+b/yBg2ivqZ3WUGFs6BDYyWnVuR4LMNSkqUaaxpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ri7E7Cel; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ri7E7Cel"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743119346; x=1774655346;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7xuzZW2SqsDXU4zjPwI8U9yRxCTuvO3b39KZjUIDomI=;
  b=Ri7E7Cel2lt5C+EKuTGQwAXsfU3PjeWqiWJRhG+5c1hqvyshApez/W83
   A31FjYeEiFqnJ8OBArzNWdHSQXFa07PueiRgXs2PHDZOjgPQGVz5ivyqj
   1HLr/Qwj9xf8+W7B0WqGHlPaXTirWPMrwBO+iYeegFoLhup9c1rxI3nUp
   ApSs6ZJes25hiFPkq+2zrwaz3iPMJVZTyCWUKu2Mot9qzNwUbq/4QHMzA
   L518Eg02akcVlG/4ahJdcAIa2D/B0jMksVbU7GWhAvq9tkGi262KosEAv
   NGIortuoKU5ZcoW+JjTHue7ExtYh190t/pXHK+S0I2LVyrx3/pC+mj3SJ
   w==;
X-CSE-ConnectionGUID: 0AacVKE4Qu+HL113RSG+mA==
X-CSE-MsgGUID: Gpl5T9IzT32cX7qWCQB+Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43627969"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="43627969"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 16:49:06 -0700
X-CSE-ConnectionGUID: hlCx5Ep1RzqDemWLjN/Y4Q==
X-CSE-MsgGUID: /mVI/4q0RuCuJqWcB/y1Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="130150512"
Received: from sohilmeh.sc.intel.com ([172.25.103.65])
  by orviesa003.jf.intel.com with ESMTP; 27 Mar 2025 16:49:05 -0700
From: Sohil Mehta <sohil.mehta@intel.com>
To: x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sohil Mehta <sohil.mehta@intel.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Kai Huang <kai.huang@intel.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Mike Rapoport <rppt@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Xin Li <xin@zytor.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] x86/nmi: Fix comment in unknown NMI handling
Date: Thu, 27 Mar 2025 23:46:25 +0000
Message-ID: <20250327234629.3953536-6-sohil.mehta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327234629.3953536-1-sohil.mehta@intel.com>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment in unknown NMI handling is incorrect and misleading. There
is no longer a restriction on having a single Unknown NMI handler. Also,
nmi_handle() does not use the 'b2b' parameter anymore.

The changes that made the comment outdated are:

commit 0d443b70cc92 ("x86/platform: Remove warning message for duplicate
NMI handlers")

commit bf9f2ee28d47 ("x86/nmi: Remove the 'b2b' parameter from
nmi_handle()")

Remove the old comment and update it to reflect the current intention.

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
---
 arch/x86/kernel/nmi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
index cdfb3864d59a..2a07c9adc6a6 100644
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -327,10 +327,9 @@ unknown_nmi_error(unsigned char reason, struct pt_regs *regs)
 	int handled;
 
 	/*
-	 * Use 'false' as back-to-back NMIs are dealt with one level up.
-	 * Of course this makes having multiple 'unknown' handlers useless
-	 * as only the first one is ever run (unless it can actually determine
-	 * if it caused the NMI)
+	 * As a last resort, let the "unknown" handlers make a
+	 * best-effort attempt to figure out if they can claim
+	 * responsibility for this Unknown NMI.
 	 */
 	handled = nmi_handle(NMI_UNKNOWN, regs);
 	if (handled) {
-- 
2.43.0

