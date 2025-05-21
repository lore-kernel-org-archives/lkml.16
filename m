Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE5F148827
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 05:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747805739; cv=none; b=dBTP88iboAVKtmpG8wkw0x0h8g8MdW6i31ncD5hQQCbtXWvahErQi66rEEe+q+ruZotDDdbUXKbDdPqEQ7CnPvDZo1H+jeZsevEGvg+Jsgx/jCdxD56CxMyZpR2NuTiPjDWyZ/CU/Wq0hJmLPsnTMIAv5acbOMJxURtmubih63Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747805739; c=relaxed/simple;
	bh=XTJDhOjFIz3A0lRC57SD4GC75m19HWeyJ4ZBYHxBULE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kI3e96nOswipGbWYo38NQgHLf+uIyao1HPL5/rtKM4YcOsMKNMP4t7AFO7M/pghnSRLl5XL+sei8/opEy6d9IWAbLbiIyGrpGmrGa6nqVzjn0YBZqJA3NXw90jW/yKCgFdOiZobee5D2mzP/E3yVDTAY8M45GiwM7K0j64j+cwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OQ030row; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OQ030row"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747805737; x=1779341737;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XTJDhOjFIz3A0lRC57SD4GC75m19HWeyJ4ZBYHxBULE=;
  b=OQ030rowiELDKVayq0YHILiG/Z14z+2GQSsMwga2FCnK6TLxujHb4VB6
   iO/tvnYzMlXB9zU1cTX7TARd2niMly4Og+efHVK+DfltCk1JRa6KfIK1a
   3FELRmFVFasGpCWBijNv0RnaTurGM1RKbqwUFpEd4WDVJ4yWxIwk8GBKl
   V/CvRb3qAhpQDZvEojMDCZIm4OUw7wYLyDbmJ7SfJuWkCRoxx1/k/mMNp
   GV6/aMaoG352PUYJDs9LAbESIsYDvYDN3XsvZvVl+XQcxUzZthgZjW9ZG
   nDWoW6yFFlvmV5bxYcprvGY9CH5hNiYhNjxd1b7/UqNZhFYhwJOtbQjnE
   g==;
X-CSE-ConnectionGUID: tvKmEejyQP2qK9e1aDj7CQ==
X-CSE-MsgGUID: CAiM4nifQ9WXBa9kIluCQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60406279"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="60406279"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 22:35:36 -0700
X-CSE-ConnectionGUID: bFm+i5WdTnC121GZwoCjYQ==
X-CSE-MsgGUID: ec6wl4k7Q7efR0uPS9kqHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="140326697"
Received: from nsridha1-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.22])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 22:35:36 -0700
Date: Tue, 20 May 2025 22:35:36 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH 2/2] x86/its: Allow "=stuff" mitigation when eIBRS is enabled
Message-ID: <20250520-eibrs-fix-v1-2-91bacd35ed09@linux.intel.com>
X-Mailer: b4 0.14.2
References: <20250520-eibrs-fix-v1-0-91bacd35ed09@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-eibrs-fix-v1-0-91bacd35ed09@linux.intel.com>

After a recent restructuring of ITS mitigation, RSB stuffing can no
longer be enabled in eIBRS+Retpoline mode. Before ITS, retbleed
mitigation only allowed stuffing when eIBRS was not enabled. This was
perfectly fine since eIBRS mitigates retbleed.

However, RSB stuffing mitigation for ITS is still required with eIBRS.
The restructuring solely relies on retbleed to deploy stuffing, and does
not allow it when eIBRS is enabled. This behavior is different from
what was before the restructuring.

Allow RSB stuffing mitigation when eIBRS+retpoline is enabled. Also
allow retbleed and ITS mitigation to independently enable stuffing. The
dependency is only with respect to retpoline. It is a valid case for
retbleed to be mitigated by eIBRS while ITS deploys stuffing at the same
time.

Fixes: 8c57ca583ebf ("x86/bugs: Restructure ITS mitigation")
Closes: https://lore.kernel.org/lkml/20250519235101.2vm6sc5txyoykb2r@desk/
Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 arch/x86/kernel/cpu/bugs.c | 101 ++++++++++++++++++++++++++++++---------------
 1 file changed, 67 insertions(+), 34 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 7f94e6a5497d9a2d312a76095e48d6b364565777..642d234943fe8fc657c7331ceb3a605201444166 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -113,6 +113,9 @@ void (*x86_return_thunk)(void) __ro_after_init = __x86_return_thunk;
 
 static void __init set_return_thunk(void *thunk)
 {
+	if (thunk == x86_return_thunk)
+		return;
+
 	if (x86_return_thunk != __x86_return_thunk)
 		pr_warn("x86/bugs: return thunk changed\n");
 
@@ -1120,6 +1123,39 @@ early_param("nospectre_v1", nospectre_v1_cmdline);
 
 enum spectre_v2_mitigation spectre_v2_enabled __ro_after_init = SPECTRE_V2_NONE;
 
+static inline bool spectre_v2_in_retpoline_mode(enum spectre_v2_mitigation mode)
+{
+	switch (mode) {
+	case SPECTRE_V2_NONE:
+	case SPECTRE_V2_IBRS:
+	case SPECTRE_V2_EIBRS:
+	case SPECTRE_V2_LFENCE:
+	case SPECTRE_V2_EIBRS_LFENCE:
+		return false;
+
+	case SPECTRE_V2_RETPOLINE:
+	case SPECTRE_V2_EIBRS_RETPOLINE:
+		return true;
+	}
+
+	pr_warn("Unknown spectre_v2 mitigation mode %d\n", mode);
+
+	return false;
+}
+
+/* Depends on spectre_v2 mitigation selected already */
+static inline bool cdt_possible(enum spectre_v2_mitigation mode)
+{
+	if (!IS_ENABLED(CONFIG_MITIGATION_CALL_DEPTH_TRACKING) ||
+	    !IS_ENABLED(CONFIG_MITIGATION_RETPOLINE))
+		return false;
+
+	if (!spectre_v2_in_retpoline_mode(mode))
+		return false;
+
+	return true;
+}
+
 #undef pr_fmt
 #define pr_fmt(fmt)     "RETBleed: " fmt
 
@@ -1258,24 +1294,16 @@ static void __init retbleed_update_mitigation(void)
 	if (retbleed_mitigation == RETBLEED_MITIGATION_NONE)
 		goto out;
 
-	/*
-	 * retbleed=stuff is only allowed on Intel.  If stuffing can't be used
-	 * then a different mitigation will be selected below.
-	 *
-	 * its=stuff will also attempt to enable stuffing.
-	 */
-	if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF ||
-	    its_mitigation == ITS_MITIGATION_RETPOLINE_STUFF) {
-		if (spectre_v2_enabled != SPECTRE_V2_RETPOLINE) {
-			pr_err("WARNING: retbleed=stuff depends on spectre_v2=retpoline\n");
-			retbleed_mitigation = RETBLEED_MITIGATION_AUTO;
-		} else {
-			if (retbleed_mitigation != RETBLEED_MITIGATION_STUFF)
-				pr_info("Retbleed mitigation updated to stuffing\n");
+	 /* ITS can also enable stuffing */
+	if (its_mitigation == ITS_MITIGATION_RETPOLINE_STUFF)
+		retbleed_mitigation = RETBLEED_MITIGATION_STUFF;
 
-			retbleed_mitigation = RETBLEED_MITIGATION_STUFF;
-		}
+	if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF &&
+	    !cdt_possible(spectre_v2_enabled)) {
+		pr_err("WARNING: retbleed=stuff depends on retpoline\n");
+		retbleed_mitigation = RETBLEED_MITIGATION_AUTO;
 	}
+
 	/*
 	 * Let IBRS trump all on Intel without affecting the effects of the
 	 * retbleed= cmdline option except for call depth based stuffing
@@ -1294,15 +1322,15 @@ static void __init retbleed_update_mitigation(void)
 			if (retbleed_mitigation != RETBLEED_MITIGATION_STUFF)
 				pr_err(RETBLEED_INTEL_MSG);
 		}
-		/* If nothing has set the mitigation yet, default to NONE. */
-		if (retbleed_mitigation == RETBLEED_MITIGATION_AUTO)
-			retbleed_mitigation = RETBLEED_MITIGATION_NONE;
 	}
+
+	/* If nothing has set the mitigation yet, default to NONE. */
+	if (retbleed_mitigation == RETBLEED_MITIGATION_AUTO)
+		retbleed_mitigation = RETBLEED_MITIGATION_NONE;
 out:
 	pr_info("%s\n", retbleed_strings[retbleed_mitigation]);
 }
 
-
 static void __init retbleed_apply_mitigation(void)
 {
 	bool mitigate_smt = false;
@@ -1449,6 +1477,7 @@ static void __init its_update_mitigation(void)
 		its_mitigation = ITS_MITIGATION_OFF;
 		break;
 	case SPECTRE_V2_RETPOLINE:
+	case SPECTRE_V2_EIBRS_RETPOLINE:
 		/* Retpoline+CDT mitigates ITS */
 		if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF)
 			its_mitigation = ITS_MITIGATION_RETPOLINE_STUFF;
@@ -1462,13 +1491,8 @@ static void __init its_update_mitigation(void)
 		break;
 	}
 
-	/*
-	 * retbleed_update_mitigation() will try to do stuffing if its=stuff.
-	 * If it can't, such as if spectre_v2!=retpoline, then fall back to
-	 * aligned thunks.
-	 */
 	if (its_mitigation == ITS_MITIGATION_RETPOLINE_STUFF &&
-	    retbleed_mitigation != RETBLEED_MITIGATION_STUFF)
+	    !cdt_possible(spectre_v2_enabled))
 		its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;
 
 	pr_info("%s\n", its_strings[its_mitigation]);
@@ -1476,15 +1500,24 @@ static void __init its_update_mitigation(void)
 
 static void __init its_apply_mitigation(void)
 {
-	/* its=stuff forces retbleed stuffing and is enabled there. */
-	if (its_mitigation != ITS_MITIGATION_ALIGNED_THUNKS)
-		return;
-
-	if (!boot_cpu_has(X86_FEATURE_RETPOLINE))
-		setup_force_cpu_cap(X86_FEATURE_INDIRECT_THUNK_ITS);
+	switch (its_mitigation) {
+	case ITS_MITIGATION_OFF:
+	case ITS_MITIGATION_AUTO:
+	case ITS_MITIGATION_VMEXIT_ONLY:
+		break;
+	case ITS_MITIGATION_ALIGNED_THUNKS:
+		if (!boot_cpu_has(X86_FEATURE_RETPOLINE))
+			setup_force_cpu_cap(X86_FEATURE_INDIRECT_THUNK_ITS);
 
-	setup_force_cpu_cap(X86_FEATURE_RETHUNK);
-	set_return_thunk(its_return_thunk);
+		setup_force_cpu_cap(X86_FEATURE_RETHUNK);
+		set_return_thunk(its_return_thunk);
+		break;
+	case ITS_MITIGATION_RETPOLINE_STUFF:
+		setup_force_cpu_cap(X86_FEATURE_RETHUNK);
+		setup_force_cpu_cap(X86_FEATURE_CALL_DEPTH);
+		set_return_thunk(call_depth_return_thunk);
+		break;
+	}
 }
 
 #undef pr_fmt

-- 
2.34.1


