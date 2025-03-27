Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F43B1EF362
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 23:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743119349; cv=none; b=RfSHWuWQ9vt9EPVs9n/oIfJnI6YoYfz6bsuQXASeNhBM8wcbPWcvm9CGU5g+JpcbozqdEcUqLvQ1j7fcD4WOc+Uy5Swor3tu6FknBkh+P3sP5bpKISukZ8HIKKTdymM8jyYkb7UkLk+1vMVoTYhmbayahGHIcFFZ68kFIjnpHRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743119349; c=relaxed/simple;
	bh=/CgPMf8wtEuea1xGS63wyhGK02cSK32ve8/CqT0Th04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JV+2XP4WHgu6fc0lFZnzeX1J8DIaMyFHSYXMlzZP1pTN7LIqZl9gDqwUWftiR4CkiBgTNjKMD+U3IkwvV1Io8kRSt2/B7e2H8hmWHT6qlsdrf3D2Q8DSMF54PS/aus6eJOg6neiSSV/Jvb01ZuAgnrkPyNgcGKFGMA90VM8jllM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ibWw2Qmz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ibWw2Qmz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743119348; x=1774655348;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/CgPMf8wtEuea1xGS63wyhGK02cSK32ve8/CqT0Th04=;
  b=ibWw2QmzfRfg9/A2IQXq7mRxgLcCyqcBAcbx5vFKPSOESkevnhBrq3ZC
   yKx7K+dPDkQbvymapDFyTABTuzZB7S4a4g5F/Ws82NZyLO259GrggX6uL
   XCzXj65llw3O0BcMlVU48H43Eg3UMEpRZ7rR9Ifa2Ogq9raQ/jNwRGYcH
   C/qtSqXYN53XyX3EWp2u8PpZbI10MGI0HCevuKHG++KJHE+CbJrNz78YJ
   OykGOu0gFmsHaeNsRxze847dwN7h5dpgRU1MFl5KMjq8m0zrP66tqA9L4
   5uEI9Q7MqIu65WKTnW0wds1YsjAHcLWbZJjwyY+utiTHFrHqKzpgyihQ2
   Q==;
X-CSE-ConnectionGUID: 0fUKbC4LQI+AcmiysGUKUg==
X-CSE-MsgGUID: Qv2rCQLdSD+BW9C7yZb+vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43627988"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="43627988"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 16:49:07 -0700
X-CSE-ConnectionGUID: KOC1Jhe2Ttm0iHNQtjWLqw==
X-CSE-MsgGUID: hWLMyaizRIiC4tkj3ptVCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="130150522"
Received: from sohilmeh.sc.intel.com ([172.25.103.65])
  by orviesa003.jf.intel.com with ESMTP; 27 Mar 2025 16:49:07 -0700
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
Subject: [PATCH 7/9] x86/nmi: Improve NMI header documentation
Date: Thu, 27 Mar 2025 23:46:27 +0000
Message-ID: <20250327234629.3953536-8-sohil.mehta@intel.com>
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

NMI handlers can be registered by various subsystems, including drivers.
However, the interface for registering and unregistering such handlers
is not clearly documented. In the future, the interface may need to be
extended to identify the source of the NMI.

Add documentation to make the current API more understandable and easier
to use.

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
---
 arch/x86/include/asm/nmi.h      | 43 ++++++++++++++++++++++++++++++++-
 arch/x86/include/asm/x86_init.h |  1 +
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/nmi.h b/arch/x86/include/asm/nmi.h
index f85aea7bf7f1..79d88d12c8fb 100644
--- a/arch/x86/include/asm/nmi.h
+++ b/arch/x86/include/asm/nmi.h
@@ -20,8 +20,20 @@ extern int unknown_nmi_panic;
 extern int panic_on_unrecovered_nmi;
 extern int panic_on_io_nmi;
 
+/* NMI handler flags */
 #define NMI_FLAG_FIRST	1
 
+/**
+ * enum - NMI types.
+ * @NMI_LOCAL:    Local NMI, CPU-specific NMI generated by the Local APIC.
+ * @NMI_UNKNOWN:  Unknown NMI, the source of the NMI may not be identified.
+ * @NMI_SERR:     System Error NMI, typically triggered by PCI errors.
+ * @NMI_IO_CHECK: I/O Check NMI, related to I/O errors.
+ * @NMI_MAX:      Maximum value for NMI types.
+ *
+ * NMI types are used to categorize NMIs and to dispatch them to the
+ * appropriate handler.
+ */
 enum {
 	NMI_LOCAL=0,
 	NMI_UNKNOWN,
@@ -30,6 +42,7 @@ enum {
 	NMI_MAX
 };
 
+/* NMI handler return values */
 #define NMI_DONE	0
 #define NMI_HANDLED	1
 
@@ -43,6 +56,25 @@ struct nmiaction {
 	const char		*name;
 };
 
+/**
+ * register_nmi_handler - Register a handler for a specific NMI type
+ * @t:    NMI type (e.g. NMI_LOCAL)
+ * @fn:   The NMI handler
+ * @fg:   Flags associated with the NMI handler
+ * @n:    Name of the NMI handler
+ * @init: Optional __init* attributes for struct nmiaction
+ *
+ * Adds the provided handler to the list of handlers for the specified
+ * NMI type. Handlers flagged with NMI_FLAG_FIRST would be executed first.
+ *
+ * Sometimes the source of an NMI can't be reliably determined which
+ * results in an NMI being tagged as "unknown". Register an additional
+ * handler using the NMI type - NMI_UNKNOWN to handle such cases. The
+ * caller would get one last chance to assume responsibility for the
+ * NMI.
+ *
+ * Return: 0 on success, or an error code on failure.
+ */
 #define register_nmi_handler(t, fn, fg, n, init...)	\
 ({							\
 	static struct nmiaction init fn##_na = {	\
@@ -56,7 +88,16 @@ struct nmiaction {
 
 int __register_nmi_handler(unsigned int, struct nmiaction *);
 
-void unregister_nmi_handler(unsigned int, const char *);
+/**
+ * unregister_nmi_handler - Unregister a handler for a specific NMI type
+ * @type: NMI type (e.g. NMI_LOCAL)
+ * @name: Name of the NMI handler used during registration
+ *
+ * Removes the handler associated with the specified NMI type from the
+ * NMI handler list. The "name" is used as a lookup key to identify the
+ * handler.
+ */
+void unregister_nmi_handler(unsigned int type, const char *name);
 
 void set_emergency_nmi_handler(unsigned int type, nmi_handler_t handler);
 
diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_init.h
index 213cf5379a5a..36698cc9fb44 100644
--- a/arch/x86/include/asm/x86_init.h
+++ b/arch/x86/include/asm/x86_init.h
@@ -292,6 +292,7 @@ struct x86_hyper_runtime {
  * @set_wallclock:		set time back to HW clock
  * @is_untracked_pat_range	exclude from PAT logic
  * @nmi_init			enable NMI on cpus
+ * @get_nmi_reason		get the reason an NMI was received
  * @save_sched_clock_state:	save state for sched_clock() on suspend
  * @restore_sched_clock_state:	restore state for sched_clock() on resume
  * @apic_post_init:		adjust apic if needed
-- 
2.43.0

