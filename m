Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FB42D5C65
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822619; cv=none; b=IbC6Gh77yaoP1s0y4tjrqW99euM1ad6gSRCxXm9DBICkRSWkUMuTCM0b0JgNw18vDpwieorhKflvHapocd15uZij6syddHHpatR9JJI+qVb55klopykYOQMa7m88F6oLU8uJmx0ogEIgn6RE2Ebamb4q8K/UuqQGOyVs7B2s1gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822619; c=relaxed/simple;
	bh=X26d0YBc6rbGtys4piq20LSlymCyL6RtLI2dM1edAuU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gKonOL7PWmK8EkVMaUkCNVh2YbBw6q+97xuwsMMnGWmOTb2lkAfAlCYCSUewtlHFfrCwDCeCLRpmOZzhotO1RufiJg0gdcxIY4g2ViCekscwqN5GXf1Ok0fSfZlesbcpkjr13Mmd821N+qjKCKrIpp/d5dnEUJIcPA2lt7wAHO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KXtjtU7+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KXtjtU7+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749822618; x=1781358618;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X26d0YBc6rbGtys4piq20LSlymCyL6RtLI2dM1edAuU=;
  b=KXtjtU7+oORIqFQ4ZFEWwO40K4f4aU4Kihv4YJ9cVyv6i43rQ1JcK6Kz
   pzSnbCEVU8LkjeiaEztSXB42e0GYehcvR0fIDMicC7WxLXu3s8/aR/COW
   jyci9eKObA5UnCwpO6rec57UKiOOxL3S0GLoD1vStHIy4k9fRulszDFZV
   8cM5EUv6MObf3N6v0qfEAgTdg2apccKzVOcE4SoA7pRcJauxQRyHQnyjL
   FmJCWRLpFsGKDKk9TXVSPJyTD58ID8IBRn1EXwDkpfKSljnJ5y+af95xc
   K/VeF6D8ErXAqZB+OLCNrheXbN4/y32/QJ9dBFlJCtCmzWwFTqHDPHPiR
   w==;
X-CSE-ConnectionGUID: h5SdRYEeQ8ukig13Ugd93w==
X-CSE-MsgGUID: xUDhCabcSJSQsQ+EYTh4fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55837564"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="55837564"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 06:50:17 -0700
X-CSE-ConnectionGUID: bByUlr+6TVCcuoC184E9Vw==
X-CSE-MsgGUID: w+j/J9abSPysJlA00S/5JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="171017607"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jun 2025 06:50:17 -0700
From: kan.liang@linux.intel.com
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	tglx@linutronix.de,
	dave.hansen@linux.intel.com,
	irogers@google.com,
	adrian.hunter@intel.com,
	jolsa@kernel.org,
	alexander.shishkin@linux.intel.com,
	linux-kernel@vger.kernel.org
Cc: dapeng1.mi@linux.intel.com,
	ak@linux.intel.com,
	zide.chen@intel.com,
	Kan Liang <kan.liang@linux.intel.com>
Subject: [RFC PATCH 03/12] x86/fpu/xstate: Add xsaves_nmi
Date: Fri, 13 Jun 2025 06:49:34 -0700
Message-Id: <20250613134943.3186517-4-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250613134943.3186517-1-kan.liang@linux.intel.com>
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kan Liang <kan.liang@linux.intel.com>

Linux perf_event subsystem needs to retrieve the current vector
registers in an overflow. The overflow is handled by NMI.

Add an interface to retrieve the actual register contents when the NMI
hit. It's the invoker's responsibility to make sure the contents are
properly filtered before exposing them to the end user.

The mask may be changed according to the end user's request. The XSAVES
with the modified optimizations are chosen.

Suggested-by: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/include/asm/fpu/xstate.h |  1 +
 arch/x86/kernel/fpu/xstate.c      | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/x86/include/asm/fpu/xstate.h b/arch/x86/include/asm/fpu/xstate.h
index b308a76afbb7..87c170d61138 100644
--- a/arch/x86/include/asm/fpu/xstate.h
+++ b/arch/x86/include/asm/fpu/xstate.h
@@ -106,6 +106,7 @@ extern void __init update_regset_xstate_info(unsigned int size,
 int xfeature_size(int xfeature_nr);
 
 void xsaves(struct xregs_state *xsave, u64 mask);
+void xsaves_nmi(struct xregs_state *xsave, u64 mask);
 void xrstors(struct xregs_state *xsave, u64 mask);
 
 int xfd_enable_feature(u64 xfd_err);
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index 9aa9ac8399ae..5b0bae135aff 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -1424,6 +1424,28 @@ void xsaves(struct xregs_state *xstate, u64 mask)
 	WARN_ON_ONCE(err);
 }
 
+/**
+ * xsaves_nmi - Save selected components to a kernel xstate buffer in NMI
+ * @xstate:	Pointer to the buffer
+ * @mask:	Feature mask to select the components to save
+ *
+ * The @xstate buffer must be 64 byte aligned and correctly initialized as
+ * XSAVES does not write the full xstate header.
+ *
+ * This function can only be invoked in an NMI. It returns the *ACTUAL*
+ * register contents when the NMI hit.
+ */
+void xsaves_nmi(struct xregs_state *xstate, u64 mask)
+{
+	int err;
+
+	if (!in_nmi())
+		return;
+
+	XSTATE_OP(XSAVES, xstate, (u32)mask, (u32)(mask >> 32), err);
+	WARN_ON_ONCE(err);
+}
+
 /**
  * xrstors - Restore selected components from a kernel xstate buffer
  * @xstate:	Pointer to the buffer
-- 
2.38.1

