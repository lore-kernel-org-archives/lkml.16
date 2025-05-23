Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3BA2566
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747963328; cv=none; b=b77gCCCzfuKVIeV/pJSAuvHrsOeNLgmh70q2as1wtbg1hW0Njy4OCsaoLTCzxqUYDZ0fDHANUJI9LA9u0iGKUk80eFOfDJtQOKUa/1RLPWHwS29y+CHu2v6DTT2H7dLNOwu0Q2Y3d12qpQRefxECiMQ78j+Gh3nWcwBuaKLHIoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747963328; c=relaxed/simple;
	bh=L7bd4x1lk8ZYaiLXLsQwQzFBwF2tkSryqhjycbW/pG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NF+kyCiaTmXoxV9zwrTdwMIFfHcyY514YmEh+5iZqZwrnmwtsudNIKA/tYa9HvQ9LjJqPWwaqZh5W8hZIB8NJtdO9LDAFL2V3vSO/xzfBSXegs8g8G1wxrJRsFWCOq/3BQknQMT/xOQcfzT6yqGLjFkFO3unYkBbZWL0t63ExoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KSp2iU7m; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KSp2iU7m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747963327; x=1779499327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L7bd4x1lk8ZYaiLXLsQwQzFBwF2tkSryqhjycbW/pG0=;
  b=KSp2iU7mdnN9gCCUFhSjjeyVxegX5h/fDrxqgLTErZYGt0KEcE8emec8
   7L/ZUq0Gb0+Xb8aEsXbrWPhJawhalnkPARtJOMipeLXF91U4WQlaJbw6o
   UV0JSFQQP+u5c4UWIgYMmZh76wTdnEquuOY6+ktKjgvdFYqi3CXfpPQWh
   KPsbgxYp6WDEk19KpvRt+mewn1gnzOjqnvTYw1jQ3IiiRosm7yszyg119
   RA8iPfU68wOGY8seKmZ8jdrB/F/5nYfLHu7sIv+v/jDCE0EGs+K/JqHxY
   PKm9KN6sjW7DT4gaN59Rteb1EnD71nfgbV7awY6EdyKGbLl5zBkTsVIxg
   Q==;
X-CSE-ConnectionGUID: 2gZu63LtQl6UJUFW1gvH3A==
X-CSE-MsgGUID: icNYcqhFQSyVf19EHiXFlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50123752"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="50123752"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 18:22:05 -0700
X-CSE-ConnectionGUID: cJcvBMzuSMO2yV+2MfDWWA==
X-CSE-MsgGUID: BMILx6lxQN+Yyiru/Vcbyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="141406536"
Received: from lindenmc-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.24])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 18:22:06 -0700
Date: Thu, 22 May 2025 18:22:04 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v3 7/7] x86/its: Allow stuffing in eIBRS+retpoline mode also
Message-ID: <20250522-eibrs-fix-v3-7-12704e291e1e@linux.intel.com>
X-Mailer: b4 0.14.2
References: <20250522-eibrs-fix-v3-0-12704e291e1e@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522-eibrs-fix-v3-0-12704e291e1e@linux.intel.com>

After a recent restructuring of ITS mitigation, RSB stuffing can no
longer be enabled in eIBRS+Retpoline mode. Before ITS, retbleed
mitigation only allowed stuffing when eIBRS was not enabled. This was
perfectly fine since eIBRS mitigates retbleed.

However, RSB stuffing mitigation for ITS is still needed with eIBRS. The
restructuring solely relies on retbleed to deploy stuffing, and does not
allow it when eIBRS is enabled. This behavior is different from what was
before the restructuring. Fix it by allowing stuffing in eIBRS+retpoline
mode also.

Fixes: 8c57ca583ebf ("x86/bugs: Restructure ITS mitigation")
Closes: https://lore.kernel.org/lkml/20250519235101.2vm6sc5txyoykb2r@desk/
Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 arch/x86/kernel/cpu/bugs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 3d56e258876234b802b6682050c46917a6cf7401..66c64dc2d14f5584b892286f060598595fd67ce0 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1130,7 +1130,8 @@ static inline bool cdt_possible(enum spectre_v2_mitigation mode)
 	    !IS_ENABLED(CONFIG_MITIGATION_RETPOLINE))
 		return false;
 
-	if (mode == SPECTRE_V2_RETPOLINE)
+	if (mode == SPECTRE_V2_RETPOLINE ||
+	    mode == SPECTRE_V2_EIBRS_RETPOLINE)
 		return true;
 
 	return false;
@@ -1285,7 +1286,7 @@ static void __init retbleed_update_mitigation(void)
 
 	if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF &&
 	    !cdt_possible(spectre_v2_enabled)) {
-		pr_err("WARNING: retbleed=stuff depends on spectre_v2=retpoline\n");
+		pr_err("WARNING: retbleed=stuff depends on retpoline\n");
 		retbleed_mitigation = RETBLEED_MITIGATION_NONE;
 	}
 
@@ -1458,6 +1459,7 @@ static void __init its_update_mitigation(void)
 		its_mitigation = ITS_MITIGATION_OFF;
 		break;
 	case SPECTRE_V2_RETPOLINE:
+	case SPECTRE_V2_EIBRS_RETPOLINE:
 		/* Retpoline+CDT mitigates ITS */
 		if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF)
 			its_mitigation = ITS_MITIGATION_RETPOLINE_STUFF;

-- 
2.34.1


