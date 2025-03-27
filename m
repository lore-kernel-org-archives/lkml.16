Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E5E1F09BC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 23:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743119351; cv=none; b=k28cEJDJzsbEi250VrL1UyGOZlORh+TKwVLmTnDetOfr1+JzG8eV7jIBBOyCX6/3gMW4WvMxPUwraEbde2slB9pzWfOPciqfKWNH2Ga2ETpl69gvrkgZWde8lLUTaeb9JnusEXOdlEK+s764wN3EdSIGZ+GvFoNPXTQUtnQgSMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743119351; c=relaxed/simple;
	bh=MR8twPfmwPOgnhxtbclzwNWhcYrDxLKr2aX8SrCIJAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E5FIWZunxdxAatwkpPukQncsiv85Q5ATsbO5dLCD6yLghbLjylkC7sSSXjOAGb8yY5byeKgDOpo94uCedPaq691+uG/HBHQdG15olBF9M4IENOjKnovLzjvCJgd2lriAqTDQCXj2oAL96TcCvGgu4T/wuARr4k/r6qCb63qNx1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZBCtt59; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZBCtt59"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743119349; x=1774655349;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MR8twPfmwPOgnhxtbclzwNWhcYrDxLKr2aX8SrCIJAI=;
  b=mZBCtt59xRD807AqS+1CyZS2aIgtH2VetvAmICPhSAY5epaYnPJK178Y
   ZKoYGZbLS1zdNbboPxTzXf/GD+/qS6FKH2UYxBbaiXir+uxK75XkpfcR9
   a0Gd9D57PNwLJY8Hkvvdks4sY/YoManXhGZY84DT+nu5R3VhBPBprrotk
   Mv6VsMKTgB9lyO3tsMyAO0w8+fsFV9fb7Rd1ZIX7OVgCgw8lUD4ZJeA5x
   fncTEp3oie9WphX/7wvlF4OByWw5Ym6LEhUZ29zmpYSDSCflIlARrh2X7
   zXWfQyxfRhIz4sCupBo8Mvpm4PiensVO+qYc56jn8UeGvSJ29424YKYjs
   Q==;
X-CSE-ConnectionGUID: 0HHU+d3DSr6PDi9DK/Iwfg==
X-CSE-MsgGUID: zQMY+bZ/SD6bGHze3g0KEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43628006"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="43628006"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 16:49:09 -0700
X-CSE-ConnectionGUID: aJQlTitZSIKyxKdK1eutAw==
X-CSE-MsgGUID: FhCuL0ujRQu7eJ2Hx+/DxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="130150537"
Received: from sohilmeh.sc.intel.com ([172.25.103.65])
  by orviesa003.jf.intel.com with ESMTP; 27 Mar 2025 16:49:08 -0700
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
Subject: [PATCH 9/9] x86/nmi: Improve NMI duration console print
Date: Thu, 27 Mar 2025 23:46:29 +0000
Message-ID: <20250327234629.3953536-10-sohil.mehta@intel.com>
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

Convert the last remaining printk() in nmi.c to pr_info(). Along with
it, use timespec macros to calculate the NMI handler duration.

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
---
 arch/x86/kernel/nmi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
index 59ed74ec010e..be93ec7255bf 100644
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -119,12 +119,12 @@ static void nmi_check_duration(struct nmiaction *action, u64 duration)
 
 	action->max_duration = duration;
 
-	remainder_ns = do_div(duration, (1000 * 1000));
-	decimal_msecs = remainder_ns / 1000;
+	/* Convert duration from nsec to msec */
+	remainder_ns = do_div(duration, NSEC_PER_MSEC);
+	decimal_msecs = remainder_ns / NSEC_PER_USEC;
 
-	printk_ratelimited(KERN_INFO
-		"INFO: NMI handler (%ps) took too long to run: %lld.%03d msecs\n",
-		action->handler, duration, decimal_msecs);
+	pr_info_ratelimited("INFO: NMI handler (%ps) took too long to run: %lld.%03d msecs\n",
+			    action->handler, duration, decimal_msecs);
 }
 
 static int nmi_handle(unsigned int type, struct pt_regs *regs)
-- 
2.43.0

