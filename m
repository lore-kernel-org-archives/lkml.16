Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB622F0057
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750967821; cv=none; b=PqIeTNRQfJ5fnpc1jZWHS48zPsXqo7QU9fzqFE8aANS5FDVU/DDaxIOMKaXxJT1OM/d4iKM5RMQ491hNtwDvm3UE/TbHbcsZWpFdggYOvhDCUU1NyIghuvYlh3e9hRWal/Vvql1PzZnIgDFzkbRbR5J1zK/aGBGnDoZuiIBiozs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750967821; c=relaxed/simple;
	bh=LCO5Fdp7rj+IB5i/Rg82/lrS2S+GA3QhWc5ciizjtWI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oNrDdaiGNzjw8bTY54re/MfpFFoEHBCbbqWJqakr5rr8JlYVPgC9btUtWKKpQdQdwmfP69MVnadKRjd3S0a5kACm/3PIWpIw9xxVoITnjzX/wPL+DxvptaE56WuWShdc9pUimo9FmXZUAUX8Xsc/X+1sAMONpCKxsdODNoyhrM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MOGFDb4B; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MOGFDb4B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750967820; x=1782503820;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LCO5Fdp7rj+IB5i/Rg82/lrS2S+GA3QhWc5ciizjtWI=;
  b=MOGFDb4BGDJS5kolyz2M23W/IzRLpX1jXOxsrMvKt9mAr0dzNAuFo+hb
   Cqbbziidghp1Md8RxFeHGvIuswZ5UNuIArTf2eHcbfBBv8pGZmRwW/VhW
   QMVkCjxFWAGpismmH/lIoGrwkI9PERkx4FQ5Rr/E6mhCwC5OeJ7eKLdiU
   M7IBLWtc2pDg2LFtPSC7i2P4Txqd2g+o20APCSBJgAWHEeCz+zscWqNSe
   Zhtt6ePq0y5BM4OreNDJFpwSpjk4u+puo9VS3mcUCNcQYv2XrwNeA570R
   7m4lw1sCDxXfvESvJjoMpEuUDmcEHQKwjxjvVPjlLA5BwO0go5A8+uu86
   w==;
X-CSE-ConnectionGUID: 3Qg5xULcQ02myxRouRkorA==
X-CSE-MsgGUID: ujd5qns6TvC7l936QfnteQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53002140"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="53002140"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 12:56:58 -0700
X-CSE-ConnectionGUID: eiL4cqtuRt2o8UTh4lIZsQ==
X-CSE-MsgGUID: 8tJBfgVeQ+6vyygsG6IZXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="156902904"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2025 12:56:58 -0700
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
	mark.rutland@arm.com,
	broonie@kernel.org,
	ravi.bangoria@amd.com,
	Kan Liang <kan.liang@linux.intel.com>
Subject: [RFC PATCH V2 03/13] x86/fpu/xstate: Add xsaves_nmi
Date: Thu, 26 Jun 2025 12:56:00 -0700
Message-Id: <20250626195610.405379-4-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250626195610.405379-1-kan.liang@linux.intel.com>
References: <20250626195610.405379-1-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kan Liang <kan.liang@linux.intel.com>

There is a hardware feature (Intel PEBS XMMs group), which can handle
XSAVE "snapshots" from random code running. This just provides another
XSAVE data source at a random time.

Add an interface to retrieve the actual register contents when the NMI
hit. The interface is different from the other interfaces of FPU. The
other mechanisms that deal with xstate try to get something coherent.
But this interface is *in*coherent. There's no telling what was in the
registers when a NMI hits. It writes whatever was in the registers when
the NMI hit. It's the invoker's responsibility to make sure the contents
are properly filtered before exposing them to the end user.

The support of the supervisor state components is required. The
compacted storage format is preferred. So the XSAVES is used.

Suggested-by: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/include/asm/fpu/xstate.h |  1 +
 arch/x86/kernel/fpu/xstate.c      | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/x86/include/asm/fpu/xstate.h b/arch/x86/include/asm/fpu/xstate.h
index b308a76afbb7..0c8b9251c29f 100644
--- a/arch/x86/include/asm/fpu/xstate.h
+++ b/arch/x86/include/asm/fpu/xstate.h
@@ -107,6 +107,7 @@ int xfeature_size(int xfeature_nr);
 
 void xsaves(struct xregs_state *xsave, u64 mask);
 void xrstors(struct xregs_state *xsave, u64 mask);
+void xsaves_nmi(struct xregs_state *xsave, u64 mask);
 
 int xfd_enable_feature(u64 xfd_err);
 
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index 9aa9ac8399ae..8602683fcb12 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -1448,6 +1448,36 @@ void xrstors(struct xregs_state *xstate, u64 mask)
 	WARN_ON_ONCE(err);
 }
 
+/**
+ * xsaves_nmi - Save selected components to a kernel xstate buffer in NMI
+ * @xstate:	Pointer to the buffer
+ * @mask:	Feature mask to select the components to save
+ *
+ * The @xstate buffer must be 64 byte aligned.
+ *
+ * Caution: The interface is different from the other interfaces of FPU.
+ * The other mechanisms that deal with xstate try to get something coherent.
+ * But this interface is *in*coherent. There's no telling what was in the
+ * registers when a NMI hits. It writes whatever was in the registers when
+ * the NMI hit.
+ * The only user for the interface is perf_event. There is already a
+ * hardware feature (See Intel PEBS XMMs group), which can handle XSAVE
+ * "snapshots" from random code running. This just provides another XSAVE
+ * data source at a random time.
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
 #if IS_ENABLED(CONFIG_KVM)
 void fpstate_clear_xstate_component(struct fpstate *fpstate, unsigned int xfeature)
 {
-- 
2.38.1

