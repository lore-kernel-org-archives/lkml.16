Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C781A5BA6
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 23:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743119346; cv=none; b=cUErvtdi84KsWYMiISWQgX48QmVo0tzNtI1p4CZpZTYdjGLXC8whmodilREqSSvqY0/q3G9wInosOUft9DKfsgYmwa3NKg1uWH9ef01rJwY52a3JP/LLA5NR4frndeopjEML94bT/tyAP2GGvh3QmS91Ip/76zYXlAh+NxuS7YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743119346; c=relaxed/simple;
	bh=Nbs5X6LrhWq1Vf1cQU+PLBU2rtkH4GXKZv1AkHkQAlw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FImGD60Qi9jUui4sliil9CwAJpKfBjxlbOXATxeAMOkAFRPDcJouvr1lN3I0eKXfVmC735k43ub9SNQo6BrhYZyFYzwLmEgppWvC2zIy4G3hs9Yszxwkh2wg5hQF6PufIE2XQQ7h06l3m6AOnbvps/i+dXLbBZ72BVkZCfkdYfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dIRSalCz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIRSalCz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743119345; x=1774655345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Nbs5X6LrhWq1Vf1cQU+PLBU2rtkH4GXKZv1AkHkQAlw=;
  b=dIRSalCzigblxOrKlu40mrulUyRqF0aTHyq3xzdsgU+PzXk/aYxhoxhw
   oM2UwPDZyk4ON/54jZi3bh6U6RqvfL7nGfVRbaJUDnHYgEFudyOKK7v0d
   zXePVwk24NJDZaXo0mOLK0ZUe8lK7R39thik2dtWV17TYShAuBUkayl84
   0E6fOUTsGyK5aCTsHRfIWrB8QCsFYKRg+PN5XOWm1JgAeuIFpONrVOugw
   2HRh+lSXlWX71orrtyqlfvND8bIIwB9udMFplBJIKOgnr83i2crHB/tY3
   lG92VC7fHg+lCu97LET1lmWa/Ajt5vitvomkY01CjypkEQ2aLN/ocqQR9
   Q==;
X-CSE-ConnectionGUID: txFfy2+JS7avwUZb5WPOjQ==
X-CSE-MsgGUID: vgEgxaEKRei6BndQZt7wdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43627944"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="43627944"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 16:49:03 -0700
X-CSE-ConnectionGUID: KztX+AkOTFqbOyG3DIGQnw==
X-CSE-MsgGUID: umq3vZ2tTvSV7FCUBX1bQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="130150473"
Received: from sohilmeh.sc.intel.com ([172.25.103.65])
  by orviesa003.jf.intel.com with ESMTP; 27 Mar 2025 16:49:03 -0700
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
Subject: [PATCH 2/9] x86/nmi: Consolidate NMI panic variables
Date: Thu, 27 Mar 2025 23:46:22 +0000
Message-ID: <20250327234629.3953536-3-sohil.mehta@intel.com>
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

Commit feeaf5512947 ("x86: Move sysctls into arch/x86")
recently moved the sysctl handling of panic_on_unrecovered_nmi and
panic_on_io_nmi to x86-specific code. These variables no longer need to
be declared in the generic header file.

Relocate the variable definitions and declarations closer to where they
are used. This makes all the NMI panic options consistent and easier to
track.

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
---
 arch/x86/include/asm/nmi.h  | 2 ++
 arch/x86/kernel/dumpstack.c | 2 --
 arch/x86/kernel/nmi.c       | 3 +++
 include/linux/panic.h       | 2 --
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/nmi.h b/arch/x86/include/asm/nmi.h
index 9cf96cce02fc..f85aea7bf7f1 100644
--- a/arch/x86/include/asm/nmi.h
+++ b/arch/x86/include/asm/nmi.h
@@ -17,6 +17,8 @@ extern void release_evntsel_nmi(unsigned int);
 #endif /* CONFIG_X86_LOCAL_APIC */
 
 extern int unknown_nmi_panic;
+extern int panic_on_unrecovered_nmi;
+extern int panic_on_io_nmi;
 
 #define NMI_FLAG_FIRST	1
 
diff --git a/arch/x86/kernel/dumpstack.c b/arch/x86/kernel/dumpstack.c
index 91639d1e4ec2..4abc9153e8a4 100644
--- a/arch/x86/kernel/dumpstack.c
+++ b/arch/x86/kernel/dumpstack.c
@@ -23,8 +23,6 @@
 #include <asm/stacktrace.h>
 #include <asm/unwind.h>
 
-int panic_on_unrecovered_nmi;
-int panic_on_io_nmi;
 static int die_counter;
 
 static struct pt_regs exec_summary_regs;
diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
index 9a95d00f1423..671d846ed620 100644
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -91,6 +91,9 @@ static DEFINE_PER_CPU(struct nmi_stats, nmi_stats);
 static int ignore_nmis __read_mostly;
 
 int unknown_nmi_panic;
+int panic_on_unrecovered_nmi;
+int panic_on_io_nmi;
+
 /*
  * Prevent NMI reason port (0x61) being accessed simultaneously, can
  * only be used in NMI handler.
diff --git a/include/linux/panic.h b/include/linux/panic.h
index 54d90b6c5f47..b0ec89a9a966 100644
--- a/include/linux/panic.h
+++ b/include/linux/panic.h
@@ -20,8 +20,6 @@ extern bool panic_triggering_all_cpu_backtrace;
 extern int panic_timeout;
 extern unsigned long panic_print;
 extern int panic_on_oops;
-extern int panic_on_unrecovered_nmi;
-extern int panic_on_io_nmi;
 extern int panic_on_warn;
 
 extern unsigned long panic_on_taint;
-- 
2.43.0

